// Purple Light → Godot: kuşanma (web EQUIP, SLOTS_EQ, WDMG, GT silahları) ve özellik puanları (SPS, SPK, RMAX).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_kusanma.js
// Ne yazar: data/kusanma.json
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
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const esya={};for(const n in EQUIP){const e=EQUIP[n];esya[n]={s:e.s,def:e.def||0,c:e.c||null,res:e.res||null,mud:e.mud?1:0,fx:e.fx||null,lamp:e.lamp?1:0}}
    const silah={};for(const n in GT){const g=GT[n];if(g.kind==='sword'||g.kind==='hunt')silah[n]={kind:g.kind,mace:g.mace||null,dmg:WDMG[n]||(g.kind==='hunt'?10:12)}}
    return {esya,silah,yuvalar:SLOTS_EQ,sps:SPS,spk:SPK,rmax:RMAX}})()`));
  fs.writeFileSync(path.join(OUT,'data','kusanma.json'),JSON.stringify(R));
  console.log('giyilen',Object.keys(R.esya).length,'silah',Object.keys(R.silah).length,'yuva',JSON.stringify(R.yuvalar));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
