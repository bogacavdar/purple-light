// Purple Light → Godot: bir biyomun canlıları (web BANIM[b], ANIM, PACK, ART çizimleri). Çayır ComfyUI karelerini disa_aktar_magara.js yazar;
// öteki biyomların canlıları web'de kodla çiziliyor (P2 ART): her canlının 6 karesi (0 duruş, 1–4 yürüyüş, 5 hamle) oyunun kendi
// drawAnimal/sprite'ıyla çizdirilip PNG'ye dökülür.
// Çalıştır (pl-godot kökünden):  BIYOM=1 OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_canli.js
// Ne yazar: data/canlilar_<biyom>.json ({canlilar, liste}), art/canli_<ad>.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const B=+(process.env.BIYOM||1);
const ADLAR=['cayir','orman','bataklik','kayalik','kul','kristal'];
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const safe=s=>s.toLowerCase().replace(/ç/g,'c').replace(/ğ/g,'g').replace(/ı/g,'i').replace(/ö/g,'o').replace(/ş/g,'s').replace(/ü/g,'u').replace(/[^a-z0-9]+/g,'_');
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(800);
  const SRC=fs.readFileSync(GAME,'utf8');
  // doğma koşulları: web BANIM'in o satırındaki üçüncü öğe (fonksiyon) kaynağa bakılarak adlandırılır
  const R=await p.evaluate(B=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');const P2=window.__p2,ART=window.__p2ART,L=window.__plBANIM[${B}],out={};
    const ST=[{st:'wander',dx:0,step:0,wind:0},{st:'wander',dx:1,step:.01,wind:0},{st:'wander',dx:1,step:1/6.5+.01,wind:0},{st:'wander',dx:1,step:2/6.5+.01,wind:0},{st:'wander',dx:1,step:3/6.5+.01,wind:0},{st:'chase',dx:1,step:.01,wind:1}];
    // P2 ART'ı olmayanlar (kodla px çizilenler: Kartal, Vaşak, Ur kekliği…): oyunun drawAnimal'ı bir tuvale yönlendirilip kare kare alınır
    const pxCap=(k,A)=>{const SZ=160,FX=80,FY=110;const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
      const [nc,ng]=mk(SZ,SZ);const KEYS=new Set();for(let o=CanvasRenderingContext2D.prototype;o&&o!==Object.prototype;o=Object.getPrototypeOf(o))for(const kk of Object.getOwnPropertyNames(o))KEYS.add(kk);
      KEYS.delete('constructor');KEYS.delete('canvas');const saved={};const S0=S,D0=dpr;S=1;dpr=1;
      for(const kk of KEYS){saved[kk]=Object.getOwnPropertyDescriptor(ctx,kk);const v=ng[kk];if(typeof v==='function')Object.defineProperty(ctx,kk,{configurable:true,writable:true,value:(...a)=>ng[kk](...a)});else Object.defineProperty(ctx,kk,{configurable:true,get:()=>ng[kk],set:x=>{ng[kk]=x}})}
      const ST2=[['wander',0,0,.3],['wander',1,Math.PI/20,.3],['wander',1,0.0001,1.5],['wander',1,3*Math.PI/20,.3],['wander',1,Math.PI/10,1.5],['chase',1,Math.PI/36,.3]];let ds=[];
      try{ds=ST2.map(([st,dx,step,t])=>{ng.setTransform(1,0,0,1,0,0);ng.clearRect(0,0,SZ,SZ);try{drawAnimal({k,x:FX,y:FY,st,dx,dy:0,step,face:1,hp:A.hp,mad:false,flash:0,atk:0,wind:0,scale:1},t)}catch(e){}ng.setTransform(1,0,0,1,0,0);return ng.getImageData(0,0,SZ,SZ)})}
      finally{S=S0;dpr=D0;for(const kk of KEYS){const sv=saved[kk];if(sv)Object.defineProperty(ctx,kk,sv);else delete ctx[kk]}}
      let a0=SZ,b0=SZ,a1=-1,b1=-1;for(const d of ds){const D=d.data;for(let y=0;y<SZ;y++)for(let x=0;x<SZ;x++)if(D[(y*SZ+x)*4+3]>8){if(x<a0)a0=x;if(x>a1)a1=x;if(y<b0)b0=y;if(y>b1)b1=y}}
      if(a1<0)return null;const w=a1-a0+1,h=b1-b0+1;const [c,g]=mk(w*6,h);ds.forEach((d,i)=>{const [t1,g1]=mk(SZ,SZ);g1.putImageData(d,0,0);g.drawImage(t1,a0,b0,w,h,i*w,0,w,h)});
      return {png:png(c),W:w,H:h,OX:FX-a0,OY:FY-b0,top:FY-b0,sh:0}};
    for(const [k] of L){let M=ART[k];const A=ANIM[k];if(!A)continue;
      if(!M){const C=pxCap(k,A);if(!C)continue;
        out[k]={png:C.png,fw:C.W,fh:C.H,frames:6,ox:C.OX,oy:C.OY,top:C.top,shadow:0,temper:A.temper,hp:A.hp,spd:A.spd,cs:A.cs||null,aggro:A.aggro||0,dmg:A.dmg||0,r:A.r,reach:A.reach||26,wind:A.wind||.42,xp:A.xp,night:!!A.night,still:!!A.still,
          landTiles:[0,1,2,3,4,5].filter(t=>A.land?!!A.land(t):t<=1),drops:A.drops.map(d=>({n:d[0],min:d[1],max:d[2],p:d[3]})),pack:PACK[k]||null,ranged:A.ranged?Object.assign({},A.ranged):null,fx:A.fx?A.fx.slice():null,minLv:A.minLv||0,fly:!!A.fly};continue}
      const c=document.createElement('canvas');c.width=M.W*6;c.height=M.H;const g=c.getContext('2d');g.imageSmoothingEnabled=false;
      ST.forEach((s,i)=>{P2.cache.clear();const a={k,x:-9999,y:-9999,st:s.st,dx:s.dx,dy:0,step:s.step,wind:s.wind,tx:-9999,ty:-9999,face:1,pk:0,hp:A.hp,mad:false,flash:0,atk:0};
        try{drawAnimal(a,0)}catch(e){}const v=[...P2.cache.values()];if(v[0])g.drawImage(v[0],i*M.W,0)});
      out[k]={png:png(c),fw:M.W,fh:M.H,frames:6,ox:M.OX,oy:M.OY,top:M.top,shadow:M.sh,
        temper:A.temper,hp:A.hp,spd:A.spd,cs:A.cs||null,aggro:A.aggro||0,dmg:A.dmg||0,r:A.r,reach:A.reach||26,wind:A.wind||.42,xp:A.xp,night:!!A.night,still:!!A.still,
        landTiles:[0,1,2,3,4,5].filter(t=>A.land?!!A.land(t):t<=1),drops:A.drops.map(d=>({n:d[0],min:d[1],max:d[2],p:d[3]})),pack:PACK[k]||null,
        ranged:A.ranged?Object.assign({},A.ranged):null,fx:A.fx?A.fx.slice():null,minLv:A.minLv||0}}
    const liste=L.map(x=>{let k='';if(x[2]){const f=String(x[2]);k=f.indexOf('isNight')>=0?'gece':/lvl>=10/.test(f)?'sv10':/lvl>=6\\|\\|day>=3/.test(f)?'sv6gun3':/lvl>=2/.test(f)?'sv2':'?'+f}return [x[0],x[1],k]});
    return {canlilar:out,liste}})()`),B);
  for(const k in R.canlilar){const f='canli_'+safe(k)+'.png';fs.writeFileSync(path.join(OUT,'art',f),Buffer.from(R.canlilar[k].png.split(',')[1],'base64'));R.canlilar[k].file='res://art/'+f;delete R.canlilar[k].png}
  R.meta={biyom:B,surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]};
  fs.writeFileSync(path.join(OUT,'data','canlilar_'+ADLAR[B]+'.json'),JSON.stringify(R));
  console.log(ADLAR[B],Object.keys(R.canlilar).join(', '),JSON.stringify(R.liste));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
