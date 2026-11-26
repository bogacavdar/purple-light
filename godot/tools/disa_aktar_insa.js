// Purple Light → Godot: İnşa kipinin parçaları (web v365build BP, floorSpr, wallSpr, rubbleSpr). Çizim fonksiyonları kaynaktan alınıp sayfada çalıştırılır.
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_insa.js
// Ne yazar: data/insa.json (parçalar, tarifler), art/insa/*.png (zemin k_v, duvar k_m, kapı 4_m_turn_open, fener, yıkık)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
(async()=>{
  const SRC=fs.readFileSync(GAME,'utf8');
  const i0=SRC.indexOf("const BP={'Toprak yol'"),i1=SRC.indexOf('const ORDER=',i0);const BPSRC=SRC.slice(i0,i1);
  const a=SRC.indexOf('const SPR={};\nfunction cnv('),b=SRC.indexOf('// ---------------------------------------------------------------- reading the grid',a);const DRAW=SRC.slice(a,b);
  const b2=await chromium.launch({executablePath:CHROME});const p=await b2.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const CODE="(()=>{__BP__\n__DR__\nconst png=c=>c.toDataURL('image/png');const im={};\n    for(let k=1;k<=3;k++)for(let v=0;v<4;v++)im['zemin_'+k+'_'+v]=png(floorSpr(k,v));\n    for(const k of [1,2,3])for(let m=0;m<16;m++)im['duvar_'+k+'_'+m]=png(wallSpr(k,m,0,0,0));\n    for(let m=0;m<16;m++)for(const t of [0,1])for(const o of [0,1])im['kapi_'+m+'_'+t+'_'+o]=png(wallSpr(4,m,t,o,0));\n    im['fener']=png(wallSpr(5,0,0,0,0));\n    for(const k of [1,2,3,4,5])im['yikik_'+k]=png(rubbleSpr(k===3?3:1));\n    const parca={};for(const n in BP){const o=BP[n];parca[n]={g:o.g,k:o.k,road:o.road?1:0,cls:o.cls||0,hp:o.hp||0,mat:o.mat||null,door:o.door?1:0,lamp:o.lamp?1:0}}\n    const tarif={};for(const n in BP){const r=REC.get(n);if(r)tarif[n]=r.i}\n    return {im,parca,tarif}})()";
  const R=await p.evaluate(c=>window.__ham.ev(c),CODE.replace('__BP__',BPSRC).replace('__DR__',DRAW));
  fs.mkdirSync(path.join(OUT,'art','insa'),{recursive:true});
  for(const k in R.im)fs.writeFileSync(path.join(OUT,'art','insa',k+'.png'),Buffer.from(R.im[k].split(',')[1],'base64'));
  delete R.im;
  fs.writeFileSync(path.join(OUT,'data','insa.json'),JSON.stringify(R));
  console.log('parça',Object.keys(R.parca).join(', '));
  await b2.close();
})().catch(e=>{console.error(e);process.exit(1)});
