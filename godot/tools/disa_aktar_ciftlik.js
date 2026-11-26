// Purple Light → Godot: Bereket Adası ve tarla (web v343ciftlik, eski tarla kodu CROP/SEED2CROP; belge ACT 1 › Çiftçi Ekin).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_ciftlik.js
// Ne yazar: data/ciftlik.json (ürünler, tohumlar, fidanlar, tarla aletleri, eşya resimleri), art/esyalar/*.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const wpng=(f,d)=>fs.writeFileSync(f,Buffer.from(d.split(',')[1],'base64'));
const safe=s=>s.replace(/ç/g,'c').replace(/Ç/g,'C').replace(/ğ/g,'g').replace(/Ğ/g,'G').replace(/ı/g,'i').replace(/İ/g,'I').replace(/ö/g,'o').replace(/Ö/g,'O').replace(/ş/g,'s').replace(/Ş/g,'S').replace(/ü/g,'u').replace(/Ü/g,'U').replace(/[^A-Za-z0-9]+/g,'_');
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const crop={};for(const k in CROP)crop[k]={seed:CROP[k].seed,grow:CROP[k].grow,y:CROP[k].y,c:CROP[k].c};
    const tools={};for(const k of ['Tırmık','Sulama kabı','Tırpan'])if(GT[k])tools[k]={kind:GT[k].kind,time:GT[k].time,dur:GT[k].dur,tier:1,use:GT[k].use||''};
    const names=Object.keys(crop).concat(Object.values(crop).map(c=>c.seed),['Elma fidanı','Armut fidanı','Korkuluk','Hasat sepeti','Buğday unu','Ekmek','Tırmık','Sulama kabı','Tırpan']);
    const items={};for(const n of names){let c=ICONC[n];if(!c){try{icon(n)}catch(e){}c=ICONC[n]}if(c)items[n]=png(c)}
    const price={};for(const n of names)price[n]=PRICE_[n]||null;
    const F=window.__plFarm;return {crop,tools,items,price,ada:F&&F.IS?{cx:F.IS.cx,cy:F.IS.cy}:null}})()`));
  const files={};
  for(const n in R.items){const f='esya_'+safe(n).toLowerCase()+'.png';wpng(path.join(OUT,'art','esyalar',f),R.items[n]);files[n]='res://art/esyalar/'+f}
  const D={crop:R.crop,tohum:{'Buğday tohumu':3,'Havuç tohumu':4,'Patates tohumu':4,'Soğan tohumu':3,'Kabak tohumu':5,'Ayçiçeği tohumu':4},
    ada:R.ada,fidan:{'Elma fidanı':['Elma',40],'Armut fidanı':['Armut',45]},aletler:R.tools,resim:files,fiyat:R.price};
  fs.writeFileSync(path.join(OUT,'data','ciftlik.json'),JSON.stringify(D));
  console.log('çiftlik ürün',Object.keys(D.crop).join(' '),'· alet',Object.keys(D.aletler).join(' '),'· resim',Object.keys(files).length);
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
