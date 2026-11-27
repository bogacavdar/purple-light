// Web oyununun kendi sentezlediği sesleri (audio IIFE: sfxBuf ve müzik) başsız tarayıcıda üretip WAV olarak art/ses/'e yazar.
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_ses.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
if(h.indexOf('const sfxBuf={};')<0)throw 'sfxBuf yok';
h=h.replace('const sfxBuf={};','const sfxBuf=(window.__SB={});');
if(h.indexOf('function renderTrack(id){')<0)throw 'renderTrack yok';
h=h.replace('function renderTrack(id){','window.__RT=renderTrack;window.__MUS=MUS;function renderTrack(id){');
const OUT=path.join(__dirname,'..','art','ses');fs.mkdirSync(OUT,{recursive:true});
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8799);
(async()=>{
  const b=await chromium.launch({args:['--autoplay-policy=no-user-gesture-required']});
  const p=await b.newPage();
  await p.goto('http://127.0.0.1:8799/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>window.__SB&&Object.keys(window.__SB).length>=25,null,{timeout:60000});
  await p.waitForTimeout(3000);
  const res=await p.evaluate(()=>{
    const wav=b=>{const d=b.getChannelData(0),sr=b.sampleRate,n=d.length,buf=new ArrayBuffer(44+n*2),v=new DataView(buf);
      const w=(o,s)=>{for(let i=0;i<s.length;i++)v.setUint8(o+i,s.charCodeAt(i))};
      w(0,'RIFF');v.setUint32(4,36+n*2,true);w(8,'WAVE');w(12,'fmt ');v.setUint32(16,16,true);v.setUint16(20,1,true);v.setUint16(22,1,true);
      v.setUint32(24,sr,true);v.setUint32(28,sr*2,true);v.setUint16(32,2,true);v.setUint16(34,16,true);w(36,'data');v.setUint32(40,n*2,true);
      for(let i=0;i<n;i++){const x=Math.max(-1,Math.min(1,d[i]));v.setInt16(44+i*2,x<0?x*32768:x*32767,true)}
      let s='';const u=new Uint8Array(buf);for(let i=0;i<u.length;i+=8192)s+=String.fromCharCode.apply(null,u.subarray(i,i+8192));return btoa(s)};
    return (async()=>{const out={};for(const k in window.__SB)out[k]=wav(window.__SB[k]);
    try{const m=window.__ham?window.__ham.ev('audio.b5.get()'):null;if(m)out.mz_ana=wav(m)}catch(e){}
    if(window.__RT&&window.__MUS)for(const M of window.__MUS){if(M[0]==='oto')continue;try{const bf=await window.__RT(M[0]);out['mz_'+M[0]]=wav(bf)}catch(e){out['hata_'+M[0]]=btoa(String(e))}}
    return out})()});
  for(const k in res){fs.writeFileSync(path.join(OUT,k+'.wav'),Buffer.from(res[k],'base64'));console.log(k,Math.round(Buffer.from(res[k],'base64').length/1024)+' KB')}
  await b.close();srv.close();
})().catch(e=>{console.error(e);process.exit(1)});
