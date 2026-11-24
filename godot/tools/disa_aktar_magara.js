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
  // Adım 1e-2: canlılar (web v436cayir ComfyUI kareleri: satır 0 olağan, 1 kovalarken kırmızı göz, 2 leş), mağara ağzındaki Sarkıt ve
  // Yarasa gübresi (oyunun kendi drawNode'uyla, dört kat ince), Madenci Kaya'nın görünüşü ve konuşma resmi, yan görevinin sözleri
  const LOOKSRC=(SRC.match(/cevdet:L\((\{[^}]*\})\)/)||[])[1];
  const SQSRC=(()=>{const i=SRC.indexOf("{id:'cevdet',name:'Madenci Kaya'"),j=SRC.indexOf("after:[",i),k=SRC.indexOf("]}",j);return SRC.slice(i,k+2)})();
  const N_=t=>['n',t],P_=t=>['p',t],X_=t=>['x',t];const SQ=(new Function('N','P','X','return '+SQSRC))(N_,P_,X_);
  await p.evaluate(()=>window.__ham.ev('window.__plCave.exit()'));await p.waitForTimeout(300);
  // Adım 1f: ateşler ve gece ışıkları (web FIRES, Kemal'in kampı, Dursun'un ocağı, Zümrüt'ün kazanı; güvenli yarıçaplar), saat
  const ATES=await p.evaluate(()=>window.__ham.ev(`({ates:FIRES.map(f=>({x:f.x,y:f.y})),kamp:{x:npc.home.x,y:npc.home.y},ocak:{x:furnace.x,y:furnace.y},kazan:{x:cauldron.x,y:cauldron.y},
    guvenli:{kamp:SAFE_R,ates:120,ocak:120,kazan:120},isik:{kamp:74,ocak:70,kazan:62,ates:72},gunBasi:360,geceSn:NIGHT_S})`));
  const E=await p.evaluate(LS=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const D=window.__plCayir.DATA,F=window.__plCayir.frame,out={};
    for(const k of ['Mağara yarasası','Kör kertenkele','Taş örümceği','Yankı Kraliçesi']){const o=D[k],n=o.f.length;const [c,g]=mk(o.w*n,o.h*3);
      ['','r','d'].forEach((m,row)=>{for(let i=0;i<n;i++){try{g.drawImage(F(k,i,m),i*o.w,row*o.h)}catch(e){}}});
      const A=ANIM[k];out[k]={png:png(c),fw:o.w,fh:o.h,frames:n,kind:o.kind,oy:o.oy,top:o.top,crown:o.crown||null,
        temper:A.temper,hp:A.hp,spd:A.spd,aggro:A.aggro||0,dmg:A.dmg||0,r:A.r,reach:A.reach||26,wind:A.wind||.42,xp:A.xp,fly:!!A.fly,boss:!!A.boss,
        pack:PACK[k]||null,drops:(A.drops||[]).map(d=>({n:d[0],min:d[1],max:d[2],p:d[3]})),fx:A.fx||null}}
    // ağızdaki toplananlar
    const door=window.__plCave.caves.find(c=>c.id==='c0').door;
    const AG=nodes.filter(n=>(n.name==='Sarkıt'||n.name==='Yarasa gübresi')&&Math.hypot(n.x-door.x,n.y-door.y)<400).map(n=>({n:n.name,x:+n.x.toFixed(1),y:+n.y.toFixed(1),v:+n.v.toFixed(3)}));
    const K=4,SZ=64,FX=32,FY=48;const [nc,ng]=mk(SZ*K,SZ*K);
    const KEYS=new Set();for(let o=CanvasRenderingContext2D.prototype;o&&o!==Object.prototype;o=Object.getPrototypeOf(o))for(const k of Object.getOwnPropertyNames(o))KEYS.add(k);
    KEYS.delete('constructor');KEYS.delete('canvas');const saved={};const own=k=>Object.getOwnPropertyDescriptor(ctx,k);
    for(const k of KEYS){saved[k]=own(k);const v=ng[k];if(typeof v==='function')Object.defineProperty(ctx,k,{configurable:true,writable:true,value:(...a)=>ng[k](...a)});else Object.defineProperty(ctx,k,{configurable:true,get:()=>ng[k],set:x=>{ng[k]=x}})}
    const S0=S,D0=dpr;const NA={};
    const cap=(n)=>{const fake=Object.assign({},n,{x:FX,y:FY});ng.setTransform(1,0,0,1,0,0);ng.clearRect(0,0,SZ*K,SZ*K);ng.setTransform(K,0,0,K,0,0);ng.imageSmoothingEnabled=false;drawNode(fake,0);ng.setTransform(1,0,0,1,0,0);
      const Z=SZ*K,d=ng.getImageData(0,0,Z,Z).data;let a0=Z,b0=Z,a1=-1,b1=-1;for(let y=0;y<Z;y++)for(let x=0;x<Z;x++)if(d[(y*Z+x)*4+3]>8){if(x<a0)a0=x;if(x>a1)a1=x;if(y<b0)b0=y;if(y>b1)b1=y}
      if(a1<0)return null;const [cc,cg]=mk(a1-a0+1,b1-b0+1);cg.drawImage(nc,a0,b0,a1-a0+1,b1-b0+1,0,0,a1-a0+1,b1-b0+1);return {png:png(cc),ox:FX*K-a0,oy:FY*K-b0,k:K}};
    S=K;dpr=1;try{for(const nm of ['Sarkıt','Yarasa gübresi']){const n=nodes.find(q=>q.name===nm);NA[nm]=Object.assign(cap(Object.assign({},n,{v:.2}))||{},{respawn:(RES[nm]&&RES[nm].respawn)||90,time:GTIME[nm]||1})}}
    finally{S=S0;dpr=D0;for(const k of KEYS){const s=saved[k];if(s)Object.defineProperty(ctx,k,s);else delete ctx[k]}}
    // Madenci Kaya: dünyadaki resmi (önden, gölgeli) ve konuşma resmi
    const L=npcLook(${LS});const [kc,kg]=mk(24,34);drawChibi(kg,12,30,L,{fx:0,fy:1});const [pc,pg]=mk(24,26);drawChibi(pg,12,29,L,{noShadow:1,fx:0,fy:1});
    return {canlilar:out,agiz:AG,agizResim:NA,kaya:{png:png(kc),ox:12,oy:30,portre:png(pc)}}})()`),LOOKSRC);
  await b.close();
  const safe=s=>s.normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/ı/g,'i').replace(/İ/g,'I').replace(/[^A-Za-z0-9_]+/g,'_').toLowerCase();
  const w=(f,s)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,s)};
  const wpng=(f,u)=>w(f,Buffer.from(u.replace(/^data:image\/png;base64,/,''),'base64'));
  if(R.ic){wpng(path.join(OUT,'art','magara','ic_c0.png'),R.ic);R.ic='res://art/magara/ic_c0.png'}
  if(R.tepe){wpng(path.join(OUT,'art','magara','tepe_c0.png'),R.tepe.png);R.tepe.png='res://art/magara/tepe_c0.png'}
  // mesale ışığı: içeride iki katıdır (web doEnter TORCHL ×2); dışarıdaki değerler kaydedilir
  for(const k in R.mesale.isik)R.mesale.isik[k]=R.mesale.isik[k]/2;
  for(const k in E.canlilar){const f='magara_'+safe(k)+'.png';wpng(path.join(OUT,'art','magara',f),E.canlilar[k].png);E.canlilar[k].png='res://art/magara/'+f}
  for(const k in E.agizResim){const A=E.agizResim[k];if(!A.png)continue;const f='dugum_'+safe(k)+'.png';wpng(path.join(OUT,'art','magara',f),A.png);A.png='res://art/magara/'+f}
  wpng(path.join(OUT,'art','magara','kaya.png'),E.kaya.png);E.kaya.png='res://art/magara/kaya.png';
  wpng(path.join(OUT,'art','magara','kaya_portre.png'),E.kaya.portre);E.kaya.portre='res://art/magara/kaya_portre.png';
  R.canlilar=E.canlilar;R.agiz=E.agiz;R.agizResim=E.agizResim;R.kaya=Object.assign(E.kaya,{yan:SQ});
  w(path.join(OUT,'data','magara.json'),JSON.stringify(R));
  w(path.join(OUT,'data','ates.json'),JSON.stringify(ATES));
  console.log('mağara',R.ad,'N',R.N,'iç',!!R.ic,'tepe',!!R.tepe,'kapı',JSON.stringify(R.kapi),'meşale',JSON.stringify(R.mesale));
})().catch(e=>{console.error(e);process.exit(1)});
