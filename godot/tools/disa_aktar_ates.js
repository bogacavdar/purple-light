// Ateşte pişirme verisi (web FIRE_R, KOZ, kamp ateşi sayıları) → data/ates_pisir.json
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_ates.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
const h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8794);
(async()=>{const b=await chromium.launch();const p=await b.newPage();
  await p.goto('http://127.0.0.1:8794/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(3000);
  const R=await p.evaluate(()=>window.__ham.ev(`({fire_r:Array.from(FIRE_R),koz:Object.assign({},KOZ),bos:Array.from(FIRE_FREE),
    tarif:Object.fromEntries(Array.from(FIRE_R).map(r=>{const y=REC.get(r);return [r,y?{i:y.i,t:y.t||[]}:null]})),
    odun:Object.keys(PRICE_).filter(n=>{try{return isWood(n)}catch(e){return false}}),yanma:CAMP_BURN,odun_s:CAMP_WOOD,en_cok:CAMP_MAX})`));
  fs.writeFileSync(path.join(__dirname,'..','data','ates_pisir.json'),JSON.stringify(R));console.log(R.fire_r.length,'ateş tarifi',Object.keys(R.koz).length,'közleme',R.odun.length,'odun');
  await b.close();srv.close()})();
