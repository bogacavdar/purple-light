// Web v322tier: silah kademelerinin ses katmanlarını (savuruş, vuruş, yay kirişi; 7 kademe) başsız tarayıcıda üretip art/ses/kademe/ altına WAV yazar.
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_kademe.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const A='function snd(fn,v){try{audio.synth(';
if(h.indexOf(A)<0)throw 'snd yok';
h=h.split(A).join('function snd(fn,v){try{(window.__KAP?(c=>window.__KAP.push(c)):audio.synth)(');
const OUT=path.join(__dirname,'..','art','ses','kademe');fs.mkdirSync(OUT,{recursive:true});
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8798);
(async()=>{
  const b=await chromium.launch();
  const p=await b.newPage();
  await p.goto('http://127.0.0.1:8798/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>window.__plTier,null,{timeout:60000});
  await p.waitForTimeout(2000);
  const res=await p.evaluate(async()=>{
    const wav=b=>{let d=b.getChannelData(0),n=d.length;while(n>1000&&Math.abs(d[n-1])<1e-4)n--;const sr=b.sampleRate,buf=new ArrayBuffer(44+n*2),v=new DataView(buf);
      const w=(o,s)=>{for(let i=0;i<s.length;i++)v.setUint8(o+i,s.charCodeAt(i))};
      w(0,'RIFF');v.setUint32(4,36+n*2,true);w(8,'WAVE');w(12,'fmt ');v.setUint32(16,16,true);v.setUint16(20,1,true);v.setUint16(22,1,true);
      v.setUint32(24,sr,true);v.setUint32(28,sr*2,true);v.setUint16(32,2,true);v.setUint16(34,16,true);w(36,'data');v.setUint32(40,n*2,true);
      for(let i=0;i<n;i++){const x=Math.max(-1,Math.min(1,d[i]));v.setInt16(44+i*2,x<0?x*32768:x*32767,true)}
      let s='';const u=new Uint8Array(buf);for(let i=0;i<u.length;i+=8192)s+=String.fromCharCode.apply(null,u.subarray(i,i+8192));return btoa(s)};
    const ren=async cbs=>{const ac=new OfflineAudioContext(1,44100*1.3,44100);for(const c of cbs)c(ac,ac.destination);return wav(await ac.startRendering())};
    const SW=['Taş kılıç','Bakır kılıç','Tunç kılıç','Demir kılıç','Çelik kılıç','Kara çelik kılıç','Mor kristal kılıç'];
    const BW=['Basit yay','Odun yayı','Sert odun yayı','Sağlam odun yayı','Güçlü odun yayı','Kor odun yayı','Kadim odun yayı'];
    const out={};
    for(let t=0;t<7;t++){
      window.__KAP=[];window.__plTier.swing(SW[t]);if(window.__KAP.length)out['sw'+t]=await ren(window.__KAP);
      window.__KAP=[];window.__plTier.hit(SW[t],50,null);if(window.__KAP.length)out['vur'+t]=await ren(window.__KAP);
      window.__KAP=[];try{window.__plTier.shot(BW[t],'Basit ok',0)}catch(e){}if(window.__KAP.length)out['kiris'+t]=await ren(window.__KAP);
    }
    window.__KAP=null;return out});
  for(const k in res){fs.writeFileSync(path.join(OUT,k+'.wav'),Buffer.from(res[k],'base64'));console.log(k,Math.round(Buffer.from(res[k],'base64').length/1024)+' KB')}
  await b.close();srv.close();
})().catch(e=>{console.error(e);process.exit(1)});
