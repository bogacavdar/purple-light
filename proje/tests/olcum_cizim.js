// Çizim sayımı (v2.40): node proje/tests/olcum_cizim.js <html> [m] — kumsalda kare başına çizim çağrıları, görünen deniz/ağaç/düğüm sayısı, 3 sn içinde ekran kartına yükleme.
const {chromium}=require('playwright');
const file=process.argv[2],mobile=process.argv[3]==='m';
(async()=>{
const b=await chromium.launch({args:['--use-gl=swiftshader','--enable-unsafe-swiftshader']});
const ctx=await b.newContext(mobile?{viewport:{width:915,height:412},deviceScaleFactor:2,isMobile:true,hasTouch:true}:{viewport:{width:1280,height:720}});
const p=await ctx.newPage();const errs=[];p.on('pageerror',e=>errs.push(e.message));
await p.goto('file://'+file+'?debug');await p.waitForFunction(()=>!!window.__ham,null,{timeout:120000});
const ev=c=>p.evaluate(c=>window.__ham.ev(c),c);
await ev("startNew('normal');endCine()");await p.waitForFunction(()=>!window.__plActHold,null,{timeout:30000}).catch(()=>0);
await ev("try{wakeDone();wakeDone2()}catch(e){}");await p.waitForTimeout(800);
const r=await ev(`(function(){const G=ctx.gl;let up=0,upb=0,dr=0,ti=G.texImage2D,ts=G.texSubImage2D,da=G.drawArrays;G.texImage2D=function(){const a=arguments;up++;if(a.length===6){const s=a[5];upb+=(s.width||0)*(s.height||0)*4}return ti.apply(this,arguments)};G.texSubImage2D=function(){const a=arguments;up++;const s=a[a.length-1];upb+=(s.width||0)*(s.height||0)*4;return ts.apply(this,arguments)};G.drawArrays=function(){dr++;return da.apply(this,arguments)};window.__GLC=()=>({up,upMB:+(upb/1e6).toFixed(2),dr,own:ctx.own.size,pages:ctx.pages.length,atl:ctx.atl.size});const C={};const names=['fillRect','drawImage','fill','stroke','fillText','save','restore','beginPath','clip','createRadialGradient','createLinearGradient','setTransform','translate','rotate','scale'];
 const orig={};for(const n of names){if(typeof ctx[n]!=='function')continue;orig[n]=ctx[n];C[n]=0;ctx[n]=function(){C[n]++;return orig[n].apply(this,arguments)}}
 let fr=0;window.__CNT=new Promise(res=>{const t=performance.now();function f(){fr++;if(performance.now()-t<3000)requestAnimationFrame(f);else{for(const n in orig)ctx[n]=orig[n];const o={frames:fr};for(const n in C)o[n]=+(C[n]/fr).toFixed(0);res(o)}}requestAnimationFrame(f)});
 return 'ok'})()`);
const o=await p.evaluate(()=>window.__CNT);const g=await ev('JSON.stringify(window.__GLC())');console.log('GL over 3s:',g);
const vis=await ev(`(function(){const x0=Math.max(0,Math.floor(cam.cx/T-vw/S/2/T)-1),x1=Math.min(W,Math.ceil(cam.cx/T+vw/S/2/T)+1),y0=Math.max(0,Math.floor(cam.cy/T-vh/S/2/T)-1),y1=Math.min(H,Math.ceil(cam.cy/T+vh/S/2/T)+1);let sea=0,riv=0,n=0;for(let y=y0;y<y1;y++)for(let x=x0;x<x1;x++){n++;const t=tiles[y*W+x];if(t===4)sea++;else if(t===3)riv++}return {view:[x1-x0,y1-y0],tiles:n,sea,riv,S,vw,vh,trees:trees.filter(t=>Math.abs(t.x-player.x)<vw/S/2+40&&Math.abs(t.y-player.y)<vh/S/2+40).length,nodes:nodes.filter(t=>t.alive&&Math.abs(t.x-player.x)<vw/S/2+40&&Math.abs(t.y-player.y)<vh/S/2+40).length,anim:animals.length,perf:PERF.lvl,shore:SHORE.length,chunks:window.__v58.chunks.size}})()`).catch(e=>String(e));
console.log(JSON.stringify(o),JSON.stringify(vis));console.log(errs.slice(0,3));await b.close()})();
