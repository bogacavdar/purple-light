// Canlıların acı, ölüm ve saldırı sesleri (web v309snd, v336voice) başsız tarayıcıda OfflineAudioContext ile üretilip
// art/ses/canli/<tür>_hurt|die|atk.ogg için WAV olarak yazılır (sonra ffmpeg ile ogg). data/canli_ses.json: tür → dosya adı kökü.
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_canli_ses.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const A='let inTick=false,nHurt=0;',B='window.__plVoice=function(a,v,what,f)';
if(h.indexOf(A)<0||h.indexOf(B)<0)throw 'yer yok';
h=h.replace(A,'window.__FOF=fOf;'+A).replace(B,'window.__VK={KIND,kindOf};'+B);
const D=path.join(__dirname,'..'),OUT=path.join(D,'art','ses','canli');fs.mkdirSync(OUT,{recursive:true});
const slug=n=>n.toLocaleLowerCase('tr-TR').replace(/ç/g,'c').replace(/ğ/g,'g').replace(/ı/g,'i').replace(/ö/g,'o').replace(/ş/g,'s').replace(/ü/g,'u').replace(/[^a-z0-9]+/g,'_').replace(/^_|_$/g,'');
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8792);
(async()=>{const b=await chromium.launch();const p=await b.newPage();
  await p.goto('http://127.0.0.1:8792/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__VK&&!!window.__FOF&&!!window.__plCrSnd&&!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2000);
  const names=await p.evaluate(()=>window.__ham.ev('Object.keys(ANIM)'));
  const R=await p.evaluate(async N=>{const out={},map={};const C=window.__plCrSnd,VK=window.__VK;
    const wav=b=>{const d=b.getChannelData(0),sr=b.sampleRate,n=d.length,buf=new ArrayBuffer(44+n*2),v=new DataView(buf);
      const w=(o,s)=>{for(let i=0;i<s.length;i++)v.setUint8(o+i,s.charCodeAt(i))};
      w(0,'RIFF');v.setUint32(4,36+n*2,true);w(8,'WAVE');w(12,'fmt ');v.setUint32(16,16,true);v.setUint16(20,1,true);v.setUint16(22,1,true);
      v.setUint32(24,sr,true);v.setUint32(28,sr*2,true);v.setUint16(32,2,true);v.setUint16(34,16,true);w(36,'data');v.setUint32(40,n*2,true);
      for(let i=0;i<n;i++){const x=Math.max(-1,Math.min(1,d[i]));v.setInt16(44+i*2,x<0?x*32768:x*32767,true)}
      let s='';const u=new Uint8Array(buf);for(let i=0;i<u.length;i+=8192)s+=String.fromCharCode.apply(null,u.subarray(i,i+8192));return btoa(s)};
    const rend=async(L,fn)=>{const sr=44100,c=new OfflineAudioContext(1,Math.ceil(sr*L),sr),g=c.createGain();g.connect(c.destination);fn(c,g,0.01);return wav(await c.startRendering())};
    for(const n of N){const a={k:n,scale:1},f=window.__FOF(a),kd=VK.kindOf(a),K=VK.KIND[kd];if(!K)continue;
      const key=kd+'_'+Math.round(f);map[n]={k:key,atk:C.ATK[n]?1:0};
      if(!out[key+'_hurt']){out[key+'_hurt']=await rend(1.0,(c,g,t)=>K.hurt(c,g,t,f));out[key+'_die']=await rend(1.8,(c,g,t)=>K.die(c,g,t,f))}
      if(C.ATK[n])out['atk_'+n]=await rend(1.0,(c,g,t)=>C.ATK[n](c,g,t))}
    return {out,map}},names);
  const M={};for(const n in R.map)M[n]={k:R.map[n].k,atk:R.map[n].atk?'atk_'+slug(n):''};
  for(const k in R.out){const f=k.startsWith('atk_')?'atk_'+slug(k.slice(4)):k;fs.writeFileSync(path.join(OUT,f+'.wav'),Buffer.from(R.out[k],'base64'))}
  fs.writeFileSync(path.join(D,'data','canli_ses.json'),JSON.stringify(M));console.log(Object.keys(R.map).length,'tür',Object.keys(R.out).length,'ses');
  await b.close();srv.close()})();
