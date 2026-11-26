// Purple Light → Godot: eşinden kalan altı iz (web v44 CLUES: yer, ad, bölge).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_iz.js
// Ne yazar: data/izler.json
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`JSON.stringify(CLUES.map(c=>({id:c.id,n:c.n,z:c.z,x:Math.round(c.x),y:Math.round(c.y)})))`));
  const L=JSON.parse(R);fs.writeFileSync(path.join(OUT,'data','izler.json'),JSON.stringify({izler:L}));
  console.log(L.map(c=>c.id+'@'+c.x+','+c.y).join(' '));await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
