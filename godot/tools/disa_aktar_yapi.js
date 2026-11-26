// Purple Light → Godot: Usta Sinan'ın yapıları ve evleri (web PLACEABLE, HOUSES, FOOT, placedSprite, ustaPrice, ev eşyaları).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_yapi.js
// Ne yazar: data/yapilar.json, art/yapilar/*.png (yere kurulunca görünen web çizimi)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const safe=s=>s.toLowerCase().replace(/ç/g,'c').replace(/ğ/g,'g').replace(/ı/g,'i').replace(/ö/g,'o').replace(/ş/g,'s').replace(/ü/g,'u').replace(/[^a-z0-9]+/g,'_');
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');const out={};
    const L=new Set([...PLACEABLE,...HOUSESET]);
    for(const n of L){let s=null;try{s=placedSprite(n)}catch(e){}out[n]={foot:FOOT(n),png:s&&s.width?png(s):null,w:s?s.width:0,h:s?s.height:0,usta:ustaPrice(n),ev:HOUSESET.has(n)?1:0,yatak:/yatak/i.test(n)?1:0}}
    const ev_esya=DB.R.filter(x=>x.c==='Ev eşyası').map(x=>x.r);
    for(const n of ev_esya)if(!out[n])out[n]={foot:null,usta:ustaPrice(n),evesya:1};
    return {yapi:out,evler:HOUSES.map(h=>({n:h.n,lv:h.lv,c:h.c,mat:h.mat||null,d:h.d})),ws_sure:typeof WS_DUR!=='undefined'?WS_DUR:null}})()`));
  fs.mkdirSync(path.join(OUT,'art','yapilar'),{recursive:true});
  for(const n in R.yapi){const y=R.yapi[n];if(y.png){const f='yapi_'+safe(n)+'.png';fs.writeFileSync(path.join(OUT,'art','yapilar',f),Buffer.from(y.png.split(',')[1],'base64'));y.file='res://art/yapilar/'+f}delete y.png}
  fs.writeFileSync(path.join(OUT,'data','yapilar.json'),JSON.stringify(R));
  console.log('yapı',Object.keys(R.yapi).length,'ev',R.evler.length,'atölye süresi',R.ws_sure,Object.entries(R.yapi).filter(([k,v])=>!v.evesya).map(([k,v])=>k+' '+(v.foot||'').toString()).join(' | '));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
