// Purple Light → Godot: bütün baltalar, kazmalar, oltalar ve tuzaklar (web GT, AXE_TIER, PICK_TIER): süre, dayanıklılık, kademe.
// data/toplama.json'daki "tools" tablosunu tamamlar (öbür alanlara dokunmaz).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_alet.js
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage();
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const T=JSON.parse(await p.evaluate(()=>window.__ham.ev(`(()=>{const o={};for(const n in GT){const g=GT[n];if(g.kind!=='axe'&&g.kind!=='pick'&&g.kind!=='fish'&&g.kind!=='trap')continue;
    o[n]={kind:g.kind,time:g.time,dur:g.dur,tier:g.kind==='axe'||g.kind==='pick'?(((g.kind==='axe'?AXE_TIER:PICK_TIER)[n])||1):1,use:g.use||(g.kind==='axe'?'odun keser':'maden kazar')}}return JSON.stringify(o)})()`)));
  await b.close();
  const f=path.join(OUT,'data','toplama.json');const D=JSON.parse(fs.readFileSync(f,'utf8'));
  for(const n in T)D.tools[n]=Object.assign({},D.tools[n]||{},T[n]);
  fs.writeFileSync(f,JSON.stringify(D));
  console.log('alet',Object.keys(D.tools).length);
})().catch(e=>{console.error(e);process.exit(1)});
