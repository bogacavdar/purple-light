// Közlenmiş yiyeceklerin resimleri (web ICONC), fiyat ve tokluk değerleri → art/esyalar/ ve data/toplama.json items, data/pazar.json esya
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_kozle.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
const h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const D=path.join(__dirname,'..');
const TP=JSON.parse(fs.readFileSync(path.join(D,'data','toplama.json'),'utf8')),PZ=JSON.parse(fs.readFileSync(path.join(D,'data','pazar.json'),'utf8'));
const AP=JSON.parse(fs.readFileSync(path.join(D,'data','ates_pisir.json'),'utf8'));
const names=Object.values(AP.koz).filter(n=>!TP.items[n]);
const slug=n=>n.toLocaleLowerCase('tr-TR').replace(/ç/g,'c').replace(/ğ/g,'g').replace(/ı/g,'i').replace(/ö/g,'o').replace(/ş/g,'s').replace(/ü/g,'u').replace(/[^a-z0-9]+/g,'_').replace(/^_|_$/g,'');
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8793);
(async()=>{const b=await chromium.launch();const p=await b.newPage();
  await p.goto('http://127.0.0.1:8793/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(3000);
  const R=await p.evaluate(N=>window.__ham.ev(`(()=>{const o={};for(const n of ${JSON.stringify(N)}){let c=ICONC[n];if(!c){try{icon(n)}catch(e){}c=ICONC[n]}o[n]={png:c?c.toDataURL('image/png'):null,f:foodVal(n)||0,h:healVal(n)||0,p:PRICE_[n]||0}}return o})()`),names);
  const ref=PZ.esya['Közlenmiş tavşan eti']||{s:1,h:0,y:0,a:0,t:1};
  for(const n in R){const x=R[n];const f='esya_'+slug(n)+'.png';if(x.png)fs.writeFileSync(path.join(D,'art','esyalar',f),Buffer.from(x.png.replace(/^data:image\/png;base64,/,''),'base64'));
    TP.items[n]={food:x.f,heal:x.h,file:'res://art/esyalar/'+f};if(!PZ.esya[n])PZ.esya[n]=Object.assign({},ref,{f:x.p});console.log(n,x.p,!!x.png)}
  fs.writeFileSync(path.join(D,'data','toplama.json'),JSON.stringify(TP));fs.writeFileSync(path.join(D,'data','pazar.json'),JSON.stringify(PZ));
  await b.close();srv.close()})();
