// Purple Light → Godot: Yıldızsız Işıkçı'nın yeri (web lampSpot; belge Oyun akışı › Gezginler ve takvim).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_isikci.js  → data/isikci.json
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`JSON.stringify({x:Math.round(lampSpot.x),y:Math.round(lampSpot.y),gun:LAMP_DAY,ister:LAMP_WANT,yaricap:LAMPL})`));
  const D=JSON.parse(R);fs.writeFileSync(path.join(__dirname,'..','data','isikci.json'),JSON.stringify(D));console.log('ışıkçı',R);await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
