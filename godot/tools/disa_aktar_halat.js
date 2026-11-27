// Tuncay'ın halat yollarının uçlarını (web v433halat setup) ve Tuncay'ın ocaktaki yerini (tuncayOut) data/halat.json'a yazar.
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_halat.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const A='function homeOf(q){if(tOut(q))';if(h.indexOf(A)<0)throw 'homeOf yok';
h=h.replace(A,'window.__TOUT=tuncayOut;'+A);
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8797);
(async()=>{const b=await chromium.launch();const p=await b.newPage();
  await p.goto('http://127.0.0.1:8797/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__plHalat&&!!window.__TOUT,null,{timeout:90000});await p.waitForTimeout(2000);
  const R=await p.evaluate(()=>({uclar:window.__plHalat.ends.map(L=>L?L.map(q=>({x:Math.round(q.x),y:Math.round(q.y)})):null),tuncay:window.__TOUT(),
    ad:['Giriş halatı','Kazan halatı','Geçit halatı'],yer:['Bataklık girişi ↔ kuzenlerin ocağı',"kuzenlerin ocağı ↔ Cadı Firuze'nin kazanı",'kuzenlerin ocağı ↔ Doğu geçidi'],fiyat:[2500,3500,4500]}));
  fs.writeFileSync(path.join(__dirname,'..','data','halat.json'),JSON.stringify(R));console.log(JSON.stringify(R));
  await b.close();srv.close()})();
