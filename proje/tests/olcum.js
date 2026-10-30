// Performans ölçümü (v2.40): NODE_PATH=/opt/node-tools/node_modules node proje/tests/olcum.js <html> [cpu 1-6] [gl 1/0] [m=telefon] — açılış ve 10 sn oyun profili (JS kendi/toplam süreleri), kare süreleri. Eski ve yeni sürümü aynı ayarlarla çalıştırıp karşılaştır.
const {chromium}=require('playwright');
const file=process.argv[2],rate=+(process.argv[3]||1),gl=process.argv[4]!=='0',mobile=process.argv[5]==='m';
function agg(prof,label){const P=prof.profile,nodes=new Map();for(const n of P.nodes)nodes.set(n.id,n);
  const parent=new Map();for(const n of P.nodes)for(const c of (n.children||[]))parent.set(c,n.id);
  const self=new Map(),incl=new Map();const dt=P.timeDeltas;let tot=0,js=0;
  for(let i=0;i<P.samples.length;i++){const d=dt[i]||0;tot+=d;let id=P.samples[i];const n=nodes.get(id);const cf=n.callFrame;const k=(cf.functionName||'(anon)')+':'+cf.lineNumber;self.set(k,(self.get(k)||0)+d);
    if(!['(program)','(garbage collector)','(idle)','(root)'].includes(cf.functionName))js+=d;
    const seen=new Set();while(id!=null){const m=nodes.get(id);const kk=(m.callFrame.functionName||'(anon)')+':'+m.callFrame.lineNumber;if(!seen.has(kk)){seen.add(kk);incl.set(kk,(incl.get(kk)||0)+d)}id=parent.get(id)}}
  console.log(`--- ${label}: total ${(tot/1000).toFixed(0)} ms, js ${(js/1000).toFixed(0)} ms`);
  const top=[...self.entries()].filter(e=>!/^\((program|garbage|idle|root)/.test(e[0])).sort((a,b)=>b[1]-a[1]).slice(0,30);
  console.log('self:',top.map(([k,v])=>`${k}=${(v/1000).toFixed(0)}`).join('  '));
  const ti=[...incl.entries()].filter(e=>!/^\((program|garbage|idle|root)/.test(e[0])).sort((a,b)=>b[1]-a[1]).slice(0,40);
  console.log('incl:',ti.map(([k,v])=>`${k}=${(v/1000).toFixed(0)}`).join('  '));}
(async()=>{
const b=await chromium.launch({args:['--use-gl=swiftshader','--enable-unsafe-swiftshader']});
const ctx=await b.newContext(mobile?{viewport:{width:915,height:412},deviceScaleFactor:2,isMobile:true,hasTouch:true,userAgent:'Mozilla/5.0 (Linux; Android 13; Honor) AppleWebKit/537.36 Chrome/120 Mobile Safari/537.36'}:{viewport:{width:1280,height:720}});
const p=await ctx.newPage();const errs=[];p.on('pageerror',e=>errs.push(e.message));
const cdp=await ctx.newCDPSession(p);
await cdp.send('Emulation.setCPUThrottlingRate',{rate});
await cdp.send('Profiler.enable');await cdp.send('Profiler.setSamplingInterval',{interval:250});
await p.addInitScript(gl=>{try{localStorage.setItem('hammadde.gl2',gl?'1':'0')}catch(e){}},gl);
await cdp.send('Profiler.start');
const t0=Date.now();await p.goto('file://'+file+'?debug');
await p.waitForFunction(()=>!!window.__ham,null,{timeout:120000});const tLoad=Date.now()-t0;
agg(await cdp.send('Profiler.stop'),'BOOT '+tLoad+'ms');
const ev=c=>p.evaluate(c=>window.__ham.ev(c),c);
console.log('gl on?',await p.evaluate(()=>!!window.__plGLOn));
await ev("startNew('normal');endCine()");
await p.waitForFunction(()=>!window.__plActHold,null,{timeout:30000}).catch(()=>console.log('act hold did not clear'));
await ev("try{wakeDone();wakeDone2()}catch(e){}");await p.waitForTimeout(800);
const frames=async(ms)=>p.evaluate(ms=>new Promise(r=>{const a=[];let last=performance.now();const t=last;function f(){const n=performance.now();a.push(n-last);last=n;if(n-t<ms)requestAnimationFrame(f);else r(a)}requestAnimationFrame(f)}),ms);
const stat=(a,lab)=>{a.sort((x,y)=>x-y);const avg=a.reduce((s,v)=>s+v,0)/a.length;console.log(lab,'n',a.length,'avg',avg.toFixed(1),'p50',a[a.length>>1].toFixed(1),'p95',a[Math.floor(a.length*.95)].toFixed(1),'max',a[a.length-1].toFixed(1))};
await cdp.send('Profiler.start');
stat(await frames(5000),'beach');
await ev("keys['d']=true");stat(await frames(5000),'walking');await ev("keys['d']=false");
agg(await cdp.send('Profiler.stop'),'PLAY 10s');
console.log('PERF.lvl',await ev("window.__v58.PERF.lvl"),'parts',await ev("parts.length"));
console.log('errors',errs.slice(0,5));await b.close()})();
