// Purple Light → Godot: ACT 2 adası (yonca ada) için harita, ağaçlar, toplanabilirler ve resimleri (web v76: ISLE 2).
// disa_aktar.js'in ikinci ada için olanı: oyunu sessionStorage 'hammadde.isle'='2' ile açar; web adayı açılışta kendisi üretir.
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_ada2.js
// Ne yazar: data/ada2/harita.json, data/ada2/dunya.json, data/ada2/toplama_ek.json (ikinci adanın toplanabilirleri ve ağaçları),
// data/ada2/yerler.json (Barbaros'un indirdiği kıyı, Yıldız'ın kayası, iki portal, biyom adları ve renkleri), art/ada2/…
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const RW=0,RH=0;
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.addInitScript(()=>{try{sessionStorage.setItem('hammadde.isle','2')}catch(e){}});
  await p.route(/^https?:/,r=>r.abort());const errs=[];p.on('pageerror',e=>errs.push(e.message));
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(3000);
  // everything below runs inside the game's own scope
  const R=await p.evaluate(([RW,RH])=>window.__ham.ev(`(()=>{
    const RW=${RW}||W,RH=${RH}||H;
    const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    // the region: the player's start tile, 40 tiles each side, 48 tiles up and 12 down (the sea is south)
    const sx=Math.floor(spawn.x/T),sy=Math.floor(spawn.y/T);
    const x0=Math.max(0,Math.min(W-RW,sx-RW/2)),y0=Math.max(0,Math.min(H-RH,sy-RH+12));
    const b64=a=>{let s='';const C=0x8000;for(let i=0;i<a.length;i+=C)s+=String.fromCharCode.apply(null,a.subarray(i,i+C));return btoa(s)};
    const cut=src=>{const o=new Uint8Array(RW*RH);for(let y=0;y<RH;y++)for(let x=0;x<RW;x++)o[y*RW+x]=src[(y0+y)*W+x0+x];return b64(o)};
    const reg={tiles:cut(tiles),bio:cut(BIO),tvar:cut(tvar),shore:cut(shoreM)};
    // Çayır (BIO 0) bounds on the whole island, in tiles
    let bx0=W,by0=H,bx1=-1,by1=-1;for(let y=0;y<H;y++)for(let x=0;x<W;x++){const i=y*W+x;if(BIO[i]===0&&tiles[i]<3){if(x<bx0)bx0=x;if(x>bx1)bx1=x;if(y<by0)by0=y;if(y>by1)by1=y}}
    const inR=(px,py)=>px>=x0*T&&px<(x0+RW)*T&&py>=y0*T&&py<(y0+RH)*T;
    // tile atlas: 8 variants per kind, 21 kinds → 8 columns × 21 rows of 16 px
    const [ta,tg]=mk(8*T,21*T);for(let k=0;k<21;k++)for(let v=0;v<8;v++)if(TILEC[k*8+v])tg.drawImage(TILEC[k*8+v],v*T,k*T);
    // trees in the region (their kind and variant), and each needed picture with its foot (bot) and the top of its trunk
    const TR=[],TP={};for(const t of trees){if(!inR(t.x,t.y))continue;const v=t.seed%3,key=t.type.n+'_'+v;TR.push({x:+t.x.toFixed(1),y:+t.y.toFixed(1),k:t.type.n,v,key,seed:t.seed,fruit:t.type.fruit||null});
      if(!TP[key]){const c=treeSprite(t.type,v);TP[key]={png:png(c),w:c.width,h:c.height,bot:c.bot,trunkTop:c.trunkTop}}}
    // ground gatherables in the region; each kind drawn once by the game's own drawNode into a small canvas (the drawing calls are
    // sent to that canvas for a moment), cut to what was drawn, with the foot point
    // cave-only kinds (Sarkıt, Yarasa gübresi: every one of them carries hb) live inside Yankı Mağarası, not on the meadow
    const caveOnly=new Set();{const C={};for(const n of nodes){const c=C[n.name]||(C[n.name]=[0,0]);c[0]++;if('hb' in n)c[1]++}for(const k in C)if(C[k][0]===C[k][1])caveOnly.add(k)}
    const ND=[],NP={};const want=new Set();for(const n of nodes){if(!n.alive||n.cave||caveOnly.has(n.name)||!inR(n.x,n.y))continue;ND.push({n:n.name,x:+n.x.toFixed(1),y:+n.y.toFixed(1),v:+n.v.toFixed(3),mine:!!n.mine});want.add(n.name)}
    // web draws these pictures at the screen's real resolution (S*dpr screen pixels per world pixel; a 32 px ComfyUI cell is drawn
    // 16 world px wide, so on screen every source pixel shows). They are captured here K times finer than the world, and Godot shows
    // them at 1/K scale: same size in the world, the same detail on screen. Shadows and the blue glow come along (glow blur is in
    // screen pixels, so S=K, dpr=1 while capturing).
    const K=4,SZ=64,FX=32,FY=48;const [nc,ng]=mk(SZ*K,SZ*K);
    const KEYS=new Set();for(let o=CanvasRenderingContext2D.prototype;o&&o!==Object.prototype;o=Object.getPrototypeOf(o))for(const k of Object.getOwnPropertyNames(o))KEYS.add(k);
    KEYS.delete('constructor');KEYS.delete('canvas');
    const saved={};const own=k=>Object.getOwnPropertyDescriptor(ctx,k);
    for(const k of KEYS){saved[k]=own(k);const v=ng[k];
      if(typeof v==='function')Object.defineProperty(ctx,k,{configurable:true,writable:true,value:(...a)=>ng[k](...a)});
      else Object.defineProperty(ctx,k,{configurable:true,get:()=>ng[k],set:x=>{ng[k]=x}})}
    const qg0=QG.n,B3=window.__b3,bg0=B3&&B3.glow,S0=S,D0=dpr;
    // the kinds a lesson / quest lights up right now (blue glow in the web game at the start)
    const glowNow=new Set();for(const k of want)if((B3&&B3.glow&&B3.glow.size&&B3.glow.has(k))||(qg0&&qg0.has(k)))glowNow.add(k);
    const cap=(n,v,glow)=>{QG.n=glow?new Set([n.name]):new Set();if(B3)B3.glow=new Set();
      const fake=Object.assign({},n,{x:FX,y:FY,v});ng.setTransform(1,0,0,1,0,0);ng.clearRect(0,0,SZ*K,SZ*K);ng.globalAlpha=1;ng.shadowBlur=0;ng.shadowColor='rgba(0,0,0,0)';
      ng.setTransform(K,0,0,K,0,0);ng.imageSmoothingEnabled=false;
      drawNode(fake,glow?Math.PI/8.4:0);ng.setTransform(1,0,0,1,0,0);
      const Z=SZ*K,d=ng.getImageData(0,0,Z,Z).data;let a0=Z,b0=Z,a1=-1,b1=-1;for(let y=0;y<Z;y++)for(let x=0;x<Z;x++)if(d[(y*Z+x)*4+3]>8){if(x<a0)a0=x;if(x>a1)a1=x;if(y<b0)b0=y;if(y>b1)b1=y}
      if(a1<0)return null;const [cc,cg]=mk(a1-a0+1,b1-b0+1);cg.drawImage(nc,a0,b0,a1-a0+1,b1-b0+1,0,0,a1-a0+1,b1-b0+1);return {png:png(cc),ox:FX*K-a0,oy:FY*K-b0,w:a1-a0+1,h:b1-b0+1}};
    S=K;dpr=1;
    try{for(const name of want){const n=nodes.find(q=>q.name===name&&q.alive&&!q.cave&&inR(q.x,q.y));
        try{const A=cap(n,0.2,false);if(!A){NP[name]={err:'boş'};continue}A.k=K;
          const B=cap(n,0.8,false);if(B&&B.png!==A.png)A.b=B;   // a kind drawn mirrored (or otherwise) when v > 0.5
          if(glowNow.has(name)){const G=cap(n,0.2,true);if(G)A.glow=G}
          NP[name]=A}catch(e){NP[name]={err:String(e&&e.message||e)}}}}
    finally{S=S0;dpr=D0;QG.n=qg0;if(B3)B3.glow=bg0;for(const k of KEYS){const s=saved[k];if(s)Object.defineProperty(ctx,k,s);else delete ctx[k]}}
    const GN={};for(const k of want){const sm=nodes.find(q=>q.name===k);GN[k]={respawn:(RES[k]&&RES[k].respawn)||30,time:GTIME[k]||1,mine:!!(sm&&sm.mine),
      ad:(MINES[k]&&MINES[k].l)||k,tier:ORE_TIER[k]||1,hurt:(typeof HURT!=='undefined'&&HURT[k])||null,bush:!!(window.__plBush&&sm&&window.__plBush(sm))}}
    const GTR={};for(const t of trees){const ty=t.type;if(GTR[ty.n])continue;GTR[ty.n]={wood:woodOf(ty.n),tier:TREE_TIER[ty.n]||1,noCut:!!ty.noCut,fruit:ty.fruit||null,seed:ty.seed||null,extra:TREE_EXTRA[ty.n]||[]}}
    const IT={};{const names=new Set(Object.keys(GN));for(const k in GTR){const r=GTR[k];names.add(r.wood);if(r.fruit)names.add(r.fruit);if(r.seed)names.add(r.seed);for(const [e] of r.extra)names.add(e)}
      for(const n of names){let c=ICONC[n];if(!c){try{icon(n)}catch(e){}c=ICONC[n]}IT[n]={png:c?png(c):null,food:foodVal(n)||0,heal:healVal(n)||0}}}
    const D=denizci,gok=window.__gok;
    const YER={barbaros:{x:Math.round(D.x),y:Math.round(D.y),bx:Math.round(D.bx),by:Math.round(D.by),dx:D.dx||0,dy:D.dy||0},yildiz:{x:Math.round(gok.x),y:Math.round(gok.y)},
      bname:BNAME,bcol:BCOL,bdanger:BDANGER};
    return {
      map:{W,H,T,region:{x0,y0,w:RW,h:RH},spawn:{x:spawn.x,y:spawn.y},spawnTile:{x:sx,y:sy},cayirBounds:{x0:bx0,y0:by0,x1:bx1,y1:by1},
        legend:{tiles:'0 çimen, 1 orman zemini, 2 kum, 3 tatlı su (göl, dere), 4 deniz, 5 sıradağ (geçilmez)',bio:'0 Yüzen Kayalar, 1 Dev Mantar Ormanı, 2 Hurda Çölü, 3 Kristal Golem Ocağı, 4 Ejder Volkanı, 5 Gök Rıhtımı'},
        tiles:reg.tiles,bio:reg.bio,tvar:reg.tvar,shore:reg.shore},
      trees:TR,nodes:ND,art:{tiles:png(ta),trees:TP,nodes:NP},gn:GN,gtr:GTR,items:IT,yer:YER,version:(document.getElementById('verlab')||{}).textContent||''}
  })()`),[RW,RH]);
  const w=(f,s)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,s)};
  const wpng=(f,u)=>w(f,Buffer.from(u.replace(/^data:image\/png;base64,/,''),'base64'));
  const safe=s=>s.normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/ı/g,'i').replace(/İ/g,'I').replace(/[^A-Za-z0-9_]+/g,'_');
  wpng(path.join(OUT,'art','ada2','karolar.png'),R.art.tiles);
  const tp={};for(const k in R.art.trees){const A=R.art.trees[k],f='agac_'+safe(k).toLowerCase()+'.png';wpng(path.join(OUT,'art','ada2','agaclar',f),A.png);delete A.png;A.file='res://art/ada2/agaclar/'+f;tp[k]=A}
  const np={};for(const k in R.art.nodes){const A=R.art.nodes[k];if(A.err){console.log('düğüm resmi yok:',k,A.err);continue}const base='dugum_'+safe(k).toLowerCase();
    const put=(X,suf)=>{const f=base+suf+'.png';wpng(path.join(OUT,'art','ada2','dugumler',f),X.png);delete X.png;X.file='res://art/ada2/dugumler/'+f};
    put(A,'');if(A.b)put(A.b,'_b');if(A.glow)put(A.glow,'_parilti');np[k]=A}
  const meta={kaynak:path.relative(ROOT,GAME),surum:R.version.trim(),uretildi:new Date().toISOString(),ada:2};
  w(path.join(OUT,'data','ada2','harita.json'),JSON.stringify(Object.assign({meta},R.map)));
  w(path.join(OUT,'data','ada2','dunya.json'),JSON.stringify({meta,agaclar:R.trees,agacResimleri:tp,dugumler:R.nodes,dugumResimleri:np}));
  const it={};for(const k in R.items){const A=R.items[k];if(A.png){const f='esya_'+safe(k).toLowerCase()+'.png';wpng(path.join(OUT,'art','esyalar',f),A.png);A.file='res://art/esyalar/'+f}delete A.png;it[k]=A}
  w(path.join(OUT,'data','ada2','toplama_ek.json'),JSON.stringify({meta,nodes:R.gn,trees:R.gtr,items:it}));
  w(path.join(OUT,'data','ada2','yerler.json'),JSON.stringify(Object.assign({meta},R.yer)));
  console.log('ada2 ağaç',R.trees.length,'düğüm',R.nodes.length,'tür',Object.keys(R.gn).length,'başlangıç',JSON.stringify(R.map.spawn),'Barbaros',JSON.stringify(R.yer.barbaros));
  if(errs.length)console.log('sayfa hataları:',errs.slice(0,5));
  await b.close()})().catch(e=>{console.error(e);process.exit(1)});
