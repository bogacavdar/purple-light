// Purple Light → Godot: Adım 0 veri, harita ve resim dışa aktarımı (elle yazma yok; her şey çalışan web oyunundan okunur).
// Çalıştır (depo kökünden):  NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar.js
// İsteğe bağlı: OYUN=<html yolu> (varsayılan proje/Hammadde_prototip.html), CHROME=<chromium yolu>
// Ne yapar: oyunu ?debug ile açar, yeni oyun başlatır, açılış sahnesini geçer; sonra oyunun kendi çizim fonksiyonlarıyla
// karoları, kahramanı, Tavşan/Kurt'u, ağaçları ve yerdeki toplanabilirleri PNG'ye döker, haritanın Çayır parçasını JSON'a yazar.
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
// Adım 1a: the whole island (RW/RH 0 = the whole map); the tile layers go out as base64 bytes, not number lists
const RW=0,RH=0;

(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());const errs=[];p.on('pageerror',e=>errs.push(e.message));
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(800);
  await p.click('#t-new');await p.waitForTimeout(300);await p.click('#c-go');await p.waitForTimeout(300);
  await p.getByText('Başla',{exact:true}).click({timeout:3000}).catch(()=>{});await p.waitForTimeout(300);
  await p.click('#d-normal',{timeout:1500}).catch(()=>{});await p.waitForTimeout(1500);
  await p.evaluate(()=>window.__ham.ev('endCine()'));await p.waitForTimeout(3000);
  await p.evaluate(()=>window.__ham.ev('wakeDone();wakeDone2()'));await p.waitForTimeout(2500);

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
    // hero: the default man (short hair), 8 directions × (stand + 4 steps), the same cells the game draws
    const L=Object.assign({},LOOK.hero,{gender:'e',hs:'short'});const CW=26,CH=40,D8=['S','SE','E','NE','N','NW','W','SW'];
    const [hc,hg]=mk(CW*5,CH*8);let heroOk=true;
    D8.forEach((d,r)=>{for(let f=0;f<5;f++){if(!window.__plHeroAt(hg,f*CW+CW/2,r*CH+CH-5,L,d,f))heroOk=false}});
    // animals: the ComfyUI frames (0 stand, 1–4 walk, 5 lunge) in one strip, and how they sit on the ground
    const AN={};for(const k of ['Tavşan','Kurt']){const o=window.__plCayir.DATA[k],F=Math.min(6,o.f.length);const [c,g]=mk(o.w*F,o.h);
      for(let i=0;i<F;i++)g.drawImage(window.__plCayir.frame(k,i,''),i*o.w,0);
      const A=ANIM[k],M=window.__p2ART&&window.__p2ART[k];
      AN[k]={png:png(c),fw:o.w,fh:o.h,frames:F,ox:o.w>>1,oy:o.oy+1,top:o.top,shadow:M?M.sh:Math.max(8,Math.round(o.w*.6)),
        temper:A.temper,hp:A.hp,spd:A.spd,cs:A.cs||null,aggro:A.aggro||0,dmg:A.dmg||0,r:A.r,reach:A.reach||26,wind:A.wind||.42,xp:A.xp,night:!!A.night,
        landTiles:[0,1,2,3,4,5].filter(t=>A.land?!!A.land(t):t<=1),
        drops:A.drops.map(d=>({n:d[0],min:d[1],max:d[2],p:d[3]}))}}
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
    // Adım 1b: gathering, chopping, drops, the bag and fullness — the game's own tables and numbers
    const TOOLS1=['Taş balta','Taş kazma'];
    const GN={};for(const k of want){const sm=nodes.find(q=>q.name===k);GN[k]={respawn:(RES[k]&&RES[k].respawn)||30,time:GTIME[k]||1,mine:!!(sm&&sm.mine),
      ad:(MINES[k]&&MINES[k].l)||k,tier:ORE_TIER[k]||1,hurt:(typeof HURT!=='undefined'&&HURT[k])||null,bush:!!(window.__plBush&&sm&&window.__plBush(sm))}}
    const GTR={};for(const t of trees){const ty=t.type;if(GTR[ty.n])continue;GTR[ty.n]={wood:woodOf(ty.n),tier:TREE_TIER[ty.n]||1,noCut:!!ty.noCut,fruit:ty.fruit||null,seed:ty.seed||null,extra:TREE_EXTRA[ty.n]||[]}}
    const GTL={};for(const k of TOOLS1){const g=GT[k];GTL[k]={kind:g.kind,time:g.time,dur:g.dur,tier:g.kind==='axe'?(AXE_TIER[k]||1):(PICK_TIER[k]||1),use:g.use||''}}
    const names=new Set(['Dal','Taş']);for(const k in GN)names.add(k);for(const k in GTR){const r=GTR[k];names.add(r.wood);if(r.fruit)names.add(r.fruit);if(r.seed)names.add(r.seed);for(const [e] of r.extra)names.add(e)}for(const k of TOOLS1)names.add(k);names.add('Taş kılıç');
    // Adım 1c: every recipe (DB.R) with what it needs, which ones are forged at an anvil or built by Usta Sinan, and every item's picture
    const RECS=DB.R.map(x=>({r:x.r,i:x.i,t:x.t,c:x.c,forged:FORGED.has(x.r),place:PLACEABLE.has(x.r)}));
    for(const x of DB.R){names.add(x.r);for(const [m] of x.i)for(const e of expand(m))names.add(e);for(const t of x.t)names.add(t)}
    const ITEMS={};for(const n of names){let c=ICONC[n];if(!c){try{icon(n)}catch(e){}c=ICONC[n]}ITEMS[n]={png:c?png(c):null,food:foodVal(n)||0,heal:healVal(n)||0}}
    // Adım 1d-1: Çayır'ın kişileri (yer, ComfyUI çizimleri: önden, yarım yandan, iki adım; konuşma resmi), kazan ve örsler, Vio/XP/seviye, işçilik
    const KS=[['ekin','npc','Yaşlı Kemal'],['witch','witch','Cadı Zümrüt'],['smith','smith','Demirci Dursun'],['durmus','durmus','Zırhçı Durmuş'],['market','market','Pazarcı Nazlı'],['alp','alp','Savaşçı Börü']];
    const KISI=[];for(const [k,o,ad] of KS){let ob=null;try{ob=eval(o)}catch(e){}if(!ob)continue;const S=(window.__plNPCS||{})[k]||{};const im={};
      for(const f of ['f','q','s','w'])if(S[f]&&S[f].width){const [c,g]=mk(S[f].width,S[f].height);g.drawImage(S[f],0,0);im[f]=png(c)}
      let por=null;try{por=window.__plPOR&&window.__plPOR[k]||null}catch(e){}
      KISI.push({k,ad,x:Math.round(ob.home?ob.home.x:ob.x),y:Math.round(ob.home?ob.home.y:ob.y),resim:im,portre:por})}
    const XPN=[];for(let L=1;L<=60;L++)XPN.push(need(L)===Infinity?0:need(L));
    const FEE={},USTA={};for(const x of DB.R)if(FORGED.has(x.r)){FEE[x.r]=laborFee(x.r);USTA[x.r]=smithOf(x.r)===durmus?'durmus':'smith'}
    const ISTASYON={kazan:{x:Math.round(cauldron.x),y:Math.round(cauldron.y)},ors:{x:Math.round(anvil.x),y:Math.round(anvil.y)},ors2:{x:Math.round(anvil2.x),y:Math.round(anvil2.y)}};
    const GATHER={kisiler:KISI,xpNeed:XPN,iscilik:FEE,usta:USTA,istasyon:ISTASYON,ogrenXP:12,recipes:RECS,nodes:GN,trees:GTR,tools:GTL,items:ITEMS,reach:REACH,pickR:28,dropLife:DROP_LIFE,fruitRe:FRUIT_RE,treeChops:3,treeCd:12,treeRegrow:[200,300],
      hunger:{perSec:100/720,early:'gün 1–2: ×0,5 · gün 3–4: ×0,75 · sonra ×1'},start:{inv:Object.assign({},inv),food:Math.round(food)},keys:{F:'topla/al',X:'ye',I:'çanta','1-5':'kemer',G:'deneme: Taş balta + Taş kazma ver'}};
    const fist=(()=>{const w=weapon();return {dmg:w.dmg,reach:w.reach,cd:w.cd}})();
    // the first sword of the game (Taş kılıç): its numbers come from the game's own weapon() with it worn for a moment
    const sword=(()=>{const was=equip.silah;try{equip.silah='Taş kılıç';const w=weapon();return {n:w.n,dmg:w.dmg,reach:w.reach,cd:w.cd}}finally{equip.silah=was}})();
    return {
      map:{W,H,T,region:{x0,y0,w:RW,h:RH},spawn:{x:spawn.x,y:spawn.y},spawnTile:{x:sx,y:sy},
        cayirBounds:{x0:bx0,y0:by0,x1:bx1,y1:by1},
        legend:{tiles:'0 çimen, 1 orman zemini, 2 kum, 3 tatlı su (göl, dere), 4 deniz, 5 büyük nehir; 3–5 geçilmez',bio:'0 Çayır, 1 Orman, 2 Bataklık, 3 Kayalık, 4 Kül Diyarı, 5 Mor Kristal',
          tvar:'karo seti indeksi = tür*8 + varyant (art/karolar.png: satır = tür, sütun = varyant)',shore:'kıyı çizgisi bitleri: 1 sağ, 2 sol, 4 alt, 8 üst (kumla komşu su karosu)'},
        tiles:reg.tiles,bio:reg.bio,tvar:reg.tvar,shore:reg.shore},
      trees:TR,nodes:ND,
      player:{speedBase:72,speed:72*speedMult(),runMult:runMult(),halfBox:HALF,fist,sword,dodge:{t:.24,speed:200,cd:.65},
        hp:maxHP(),camera:'S = max(2, round(min(ekran genişliği, ekran yüksekliği) / 260)) piksel / dünya pikseli',
        heroCell:{w:CW,h:CH,frames:5,rows:D8,foot:'hücrenin ortası, alttan 5 px yukarıda (oyuncunun y\\'si)'}},
      art:{tiles:png(ta),hero:heroOk?png(hc):null,animals:AN,trees:TP,nodes:NP},
      gather:GATHER,look:L,version:(document.getElementById('verlab')||{}).textContent||''}
  })()`),[RW,RH]);

  const w=(f,s)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,s)};
  const wpng=(f,u)=>w(f,Buffer.from(u.replace(/^data:image\/png;base64,/,''),'base64'));
  const safe=s=>s.normalize('NFD').replace(/[̀-ͯ]/g,'').replace(/ı/g,'i').replace(/İ/g,'I').replace(/[^A-Za-z0-9_]+/g,'_');
  wpng(path.join(OUT,'art','karolar.png'),R.art.tiles);
  // the ComfyUI ground textures (web v425karo: 128 px seamless, one per tile kind 0–5; a tile takes the piece under its world place)
  {const H=fs.readFileSync(GAME,'utf8'),i=H.indexOf('<script id="v425karo">'),j=H.indexOf('</script>',i),B=H.slice(i,j);
    const re=/(\d+):'(data:image\/png;base64,[A-Za-z0-9+\/=]+)'/g;let m,n=0;while((m=re.exec(B))){wpng(path.join(OUT,'art','zemin_'+m[1]+'.png'),m[2]);n++}
    console.log('zemin dokusu',n)}
  if(R.art.hero)wpng(path.join(OUT,'art','kahraman.png'),R.art.hero);else console.log('UYARI: kahraman resmi hazır değil');
  const anim={};for(const k in R.art.animals){const A=R.art.animals[k],f='canli_'+safe(k).toLowerCase()+'.png';wpng(path.join(OUT,'art',f),A.png);delete A.png;A.file='res://art/'+f;anim[k]=A}
  const tp={};for(const k in R.art.trees){const A=R.art.trees[k],f='agac_'+safe(k).toLowerCase()+'.png';wpng(path.join(OUT,'art','agaclar',f),A.png);delete A.png;A.file='res://art/agaclar/'+f;tp[k]=A}
  const np={};for(const k in R.art.nodes){const A=R.art.nodes[k];if(A.err){console.log('düğüm resmi yok:',k,A.err);continue}const base='dugum_'+safe(k).toLowerCase();
    const put=(X,suf)=>{const f=base+suf+'.png';wpng(path.join(OUT,'art','dugumler',f),X.png);delete X.png;X.file='res://art/dugumler/'+f};
    put(A,'');if(A.b)put(A.b,'_b');if(A.glow)put(A.glow,'_parilti');np[k]=A}
  const meta={kaynak:path.relative(ROOT,GAME),surum:R.version.trim(),uretildi:new Date().toISOString()};
  w(path.join(OUT,'data','harita.json'),JSON.stringify(Object.assign({meta},R.map)));
  w(path.join(OUT,'data','canlilar.json'),JSON.stringify({meta,canlilar:anim},null,1));
  w(path.join(OUT,'data','dunya.json'),JSON.stringify({meta,agaclar:R.trees,agacResimleri:tp,dugumler:R.nodes,dugumResimleri:np},null,0));
  {const G=R.gather,it={};for(const k in G.items){const A=G.items[k];if(A.png){const f='esya_'+safe(k).toLowerCase()+'.png';wpng(path.join(OUT,'art','esyalar',f),A.png);A.file='res://art/esyalar/'+f}delete A.png;it[k]=A}G.items=it;
    for(const K of G.kisiler){const kk=K.k;for(const f in K.resim){const fn='kisi_'+kk+'_'+f+'.png';wpng(path.join(OUT,'art','kisiler',fn),K.resim[f]);K.resim[f]='res://art/kisiler/'+fn}
      if(K.portre&&/^data:image\/png/.test(K.portre)){const fn='portre_'+kk+'.png';wpng(path.join(OUT,'art','kisiler',fn),K.portre);K.portre='res://art/kisiler/'+fn}else K.portre=null}
    w(path.join(OUT,'data','toplama.json'),JSON.stringify(Object.assign({meta},G),null,1))}
  w(path.join(OUT,'data','oyuncu.json'),JSON.stringify(Object.assign({meta},R.player,{gorunus:R.look}),null,1));
  console.log('bölge',JSON.stringify(R.map.region),'başlangıç',JSON.stringify(R.map.spawnTile),'ağaç',R.trees.length,'düğüm',R.nodes.length,'Çayır',JSON.stringify(R.map.cayirBounds));
  console.log('oyuncu',JSON.stringify(R.player.fist),'can',R.player.hp,'sürüm',meta.surum);
  if(errs.length)console.log('sayfa hataları:',errs.slice(0,5));
  await b.close()})().catch(e=>{console.error(e);process.exit(1)});
