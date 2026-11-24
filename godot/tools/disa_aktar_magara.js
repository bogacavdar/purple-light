// Purple Light → Godot: Adım 1e mağara dışa aktarımı (web oyununun kendi mağara verisi ve çizimlerinden).
// Çalıştır (depo kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_magara.js
// Ne yazar: data/magara.json (Yankı Mağarası: giriş, iç ızgara, başlangıç, en dip, renkler, toplanabilirler, şart, meşale ışığı/süresi)
//           art/magara/ic_c0.png (mağaranın içinin web çizimi, 1 px = 1 dünya pikseli), art/magara/tepe_c0.png (dışarıdaki kaya tepesi)
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
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(800);
  await p.click('#t-new');await p.waitForTimeout(300);await p.click('#c-go');await p.waitForTimeout(300);
  await p.getByText('Başla',{exact:true}).click({timeout:3000}).catch(()=>{});await p.waitForTimeout(300);
  await p.click('#d-normal',{timeout:1500}).catch(()=>{});await p.waitForTimeout(1500);
  await p.evaluate(()=>window.__ham.ev('endCine()'));await p.waitForTimeout(3000);
  await p.evaluate(()=>window.__ham.ev('wakeDone();wakeDone2()'));await p.waitForTimeout(2500);
  // içeri girip bir kare çizdir: mağaranın resmi (C.cv) oyunun kendi paint() fonksiyonuyla bir kez oluşur
  await p.evaluate(()=>window.__ham.ev(`window.__plCave.enter('c0')`));await p.waitForTimeout(1500);await p.evaluate(()=>window.__ham.ev('try{drawGround()}catch(e){}'));
  // the cave's picture: the game's own paint() (closed in its scope) is taken from the source and run on the same data
  const SRC=fs.readFileSync(GAME,'utf8');const cut=(a,b)=>{const i=SRC.indexOf(a),j=SRC.indexOf(b,i);return SRC.slice(i,j+b.length)};
  const PAINT=cut(' const hsh=s=>','return()=>{a=(a+0x6D2B79F5)>>>0;let t=a;t=Math.imul(t^t>>>15,t|1);t^=t+Math.imul(t^t>>>7,t|61);return((t^t>>>14)>>>0)/4294967296}};')+'\n'+cut(' function paint(C){','return C.cv=c}');
  const R=await p.evaluate(PA=>window.__ham.ev(`(()=>{const N=window.__plCave.N;${PA}
    {const C=window.__plCave.caves.find(c=>c.id==='c0');if(!C.cv)paint(C)}
    const V=window.__plCave,C=V.caves.find(c=>c.id==="c0"),PK=V.PK;
    const png=c=>c.toDataURL('image/png');
    let G='';{let s='';for(let i=0;i<C.G.length;i++)s+=String.fromCharCode(C.G[i]);G=btoa(s)}
    const SP=window.__plCaveSpr?window.__plCaveSpr(C):null;
    const raw={};for(const n of C.raw)raw[n]={price:DB.p[n]||0,glow:window.__plCaveGlow.has(n),respawn:(RES[n]&&RES[n].respawn)||1e9,time:GTIME[n]||1};
    return {id:C.id,ad:C.name,lv:C.lv,b:C.b,kisi:C.npc,boss:C.boss,turler:C.kinds,toplanir:raw,renk:C.col,
      N,T,PX:PK.x*T,PY:PK.y*T,kapi:C.door,baslangic:C.start,dip:C.deep,ag:C.e,en_dip:C.d,G,
      ic:C.cv?png(C.cv):null,tepe:SP?{png:png(SP),ax:SP.ax,ay:SP.ay}:null,
      mesale:{isik:Object.assign({},TORCHL),sure:Object.assign({},TORCHB)}}})()`),PAINT);
  await b.close();
  const w=(f,s)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,s)};
  const wpng=(f,u)=>w(f,Buffer.from(u.replace(/^data:image\/png;base64,/,''),'base64'));
  if(R.ic){wpng(path.join(OUT,'art','magara','ic_c0.png'),R.ic);R.ic='res://art/magara/ic_c0.png'}
  if(R.tepe){wpng(path.join(OUT,'art','magara','tepe_c0.png'),R.tepe.png);R.tepe.png='res://art/magara/tepe_c0.png'}
  // mesale ışığı: içeride iki katıdır (web doEnter TORCHL ×2); dışarıdaki değerler kaydedilir
  for(const k in R.mesale.isik)R.mesale.isik[k]=R.mesale.isik[k]/2;
  w(path.join(OUT,'data','magara.json'),JSON.stringify(R));
  console.log('mağara',R.ad,'N',R.N,'iç',!!R.ic,'tepe',!!R.tepe,'kapı',JSON.stringify(R.kapi),'meşale',JSON.stringify(R.mesale));
})().catch(e=>{console.error(e);process.exit(1)});
