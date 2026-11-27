// Müzik aletlerinin notalarını (web v411muzik VO sesleri) başsız tarayıcıda OfflineAudioContext ile üretip art/ses/muzik/<ses>_<midi>.wav yazar,
// aletlerin listesini (ses, ezgi, renk) data/muzik.json'a. Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_muzik.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const A='window.__plMusic={INS,play};';if(h.indexOf(A)<0)throw 'v411 yok';
h=h.replace(A,'window.__plMusic={INS,play,VO,mtof};');
const OUT=path.join(__dirname,'..','art','ses','muzik');fs.mkdirSync(OUT,{recursive:true});
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8796);
(async()=>{const b=await chromium.launch();const p=await b.newPage();
  await p.goto('http://127.0.0.1:8796/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__plMusic&&!!window.__plMusic.VO,null,{timeout:90000});
  const R=await p.evaluate(async()=>{const M=window.__plMusic,out={},LEN={bell:2.4,echo:3.2,glass:2.0,horn:0.9};
    const wav=b=>{const d=b.getChannelData(0),sr=b.sampleRate,n=d.length,buf=new ArrayBuffer(44+n*2),v=new DataView(buf);
      const w=(o,s)=>{for(let i=0;i<s.length;i++)v.setUint8(o+i,s.charCodeAt(i))};
      w(0,'RIFF');v.setUint32(4,36+n*2,true);w(8,'WAVE');w(12,'fmt ');v.setUint32(16,16,true);v.setUint16(20,1,true);v.setUint16(22,1,true);
      v.setUint32(24,sr,true);v.setUint32(28,sr*2,true);v.setUint16(32,2,true);v.setUint16(34,16,true);w(36,'data');v.setUint32(40,n*2,true);
      for(let i=0;i<n;i++){const x=Math.max(-1,Math.min(1,d[i]));v.setInt16(44+i*2,x<0?x*32768:x*32767,true)}
      let s='';const u=new Uint8Array(buf);for(let i=0;i<u.length;i+=8192)s+=String.fromCharCode.apply(null,u.subarray(i,i+8192));return btoa(s)};
    const ins={};
    for(const n in M.INS){const [vo,tune,col]=M.INS[n];ins[n]={ses:vo,ezgi:tune,renk:col};
      for(const m of new Set(tune)){const k=vo+'_'+m;if(out[k])continue;const L=(LEN[vo]||0.8),sr=44100,c=new OfflineAudioContext(1,Math.ceil(sr*L),sr);
        M.VO[vo](c,c.destination,M.mtof(m),0.01);out[k]=wav(await c.startRendering())}}
    return {out,ins}});
  for(const k in R.out)fs.writeFileSync(path.join(OUT,k+'.wav'),Buffer.from(R.out[k],'base64'));
  fs.writeFileSync(path.join(__dirname,'..','data','muzik.json'),JSON.stringify(R.ins));console.log(Object.keys(R.out).length,'nota');
  await b.close();srv.close()})();
