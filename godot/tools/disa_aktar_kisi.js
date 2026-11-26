// Purple Light → Godot: bir biyomun kişileri (web v184 kuzenler FAMS, v2.71 pazarcı kuzenler, Usta Sinan), istasyonları ve görevleri.
// Çalıştır (pl-godot kökünden):  BIYOM=1 OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_kisi.js
// Ne yazar: data/kisiler_<biyom>.json ({kisiler, istasyonlar, kuzen, tier, zirh}), data/gorevler_<biyom>.json, art/kisiler/*.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const B=+(process.env.BIYOM||1);
const ADLAR=['cayir','orman','bataklik','kayalik','kul','kristal'];
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const wpng=(f,d)=>fs.writeFileSync(f,Buffer.from(d.split(',')[1],'base64'));
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(B=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const NP=window.__plNPCS||{},POR=window.__plPORn||window.__plPOR||{};
    const fr=k=>{const S=NP[k]||{},im={};for(const f of ['f','q','s','w'])if(S[f]&&S[f].width){const [c,g]=mk(S[f].width,S[f].height);g.drawImage(S[f],0,0);im[f]=png(c)}return im};
    const kisiler=[],ist=[];const F=(window.__plFams||[]).find(f=>f.b===${B});
    const role={w:'witch',s:'smith',a:'durmus'};
    if(F)for(const o of [F.w,F.s,F.a]){const C=o.C;kisiler.push({k:o.g,ad:o.name,x:Math.round(o.x),y:Math.round(o.y),rol:o.role,taban:role[o.role],resim:fr(role[o.role]),portre:POR[role[o.role]]||null,
        kuzen:{short:C.short,q:C.q,ile:C.ile,gesture:C.gesture,pitch:C.pitch,lines:C.lines,about:C.about,liquid:C.liquid||null,colname:C.colname||null,b:o.b}});
      if(o.fire)ist.push({tur:'ates',x:o.fire.x,y:o.fire.y});
      if(o.pot)ist.push({tur:'kazan',x:o.pot.x,y:o.pot.y,sahip:o.g,renk:C.liquid});
      if(o.furn)ist.push({tur:'ocak',x:o.furn.x,y:o.furn.y,sahip:o.g});
      if(o.anv)ist.push({tur:'ors',x:o.anv.x,y:o.anv.y,sahip:o.g});
      if(o.rack)ist.push({tur:'raf',x:o.rack.x,y:o.rack.y,sahip:o.g});
      if(o.stand)ist.push({tur:'manken',x:o.stand.x,y:o.stand.y,sahip:o.g})}
    const M=(window.__plMarketCousins||[]).find(o=>o.b===${B});
    if(M&&M.x>-9e4){const [c,g]=mk(24,40);drawChibi(g,12,36,M.L,{noShadow:1});const [c2,g2]=mk(24,26);drawChibi(g2,12,29,M.L,{noShadow:1,fx:0,fy:1});
      kisiler.push({k:M.g,ad:M.name,x:Math.round(M.x),y:Math.round(M.y),rol:'m',taban:'market',resim:{f:png(c)},portre:png(c2),kuzen:{short:M.short,cn:M.mk.cn,hc:M.mk.hc}});
      ist.push({tur:'tezgah',x:M.st.x,y:M.st.y,sahip:M.g,renk:M.mk.hc})}
    if(${B}===1&&typeof usta!=='undefined')kisiler.push({k:'usta',ad:usta.name,x:Math.round(usta.x),y:Math.round(usta.y),rol:'u',resim:fr('usta'),portre:POR.usta||null});
    const tier={};for(const x of DB.R)if(FORGED.has(x.r))tier[x.r]=window.__plForgeTier?window.__plForgeTier(x.r):0;
    const zirh=[...ARMORSET];
    // görevler: bu biyomun verenleri (web DATA.Q, GB)
    const D=window.__plQData||null;
    return {kisiler,istasyonlar:ist,tier,zirh}})()`),B);
  // görevler kaynaktan (web v186 DATA)
  const SRC=fs.readFileSync(GAME,'utf8');const i=SRC.indexOf('const DATA={"Q": [');const j=SRC.indexOf('\n',i);const D=JSON.parse(SRC.slice(i+11,j).replace(/;\s*$/,''));
  const GIV=Object.keys(D.GB).filter(g=>D.GB[g]===B&&R.kisiler.some(k=>k.k===g));
  const Q=D.Q.filter(q=>GIV.indexOf(q.g)>=0).map(q=>{const o={};for(const k of ['id','g','t','p','r','say','thx','c','x','rec','rew','nomat','les','sc'])if(q[k]!=null)o[k]=q[k];return o});
  // kuzenlerin imza silahları ve zırhları (web v184 D.items: who)
  {const i2=SRC.indexOf('const D={"biomes"'),j2=SRC.indexOf('\n',i2);const KD=JSON.parse(SRC.slice(i2+8,j2).replace(/;\s*$/,''));
   for(const K of R.kisiler)if(K.kuzen)K.kuzen.imza=KD.items.filter(it=>it.who===K.k).map(it=>it.n);
   R.ustalar=KD.cousins.filter(c=>c.role!=='w').map(c=>({rol:c.role,b:c.b,ad:c.name}));R.biyomlar=KD.biomes}
  fs.mkdirSync(path.join(OUT,'art','kisiler'),{recursive:true});
  for(const K of R.kisiler){for(const f in K.resim){const fn='kisi_'+K.k+'_'+f+'.png';wpng(path.join(OUT,'art','kisiler',fn),K.resim[f]);K.resim[f]='res://art/kisiler/'+fn}
    if(K.portre&&/^data:image\/png/.test(K.portre)){const fn='portre_'+K.k+'.png';wpng(path.join(OUT,'art','kisiler',fn),K.portre);K.portre='res://art/kisiler/'+fn}else if(K.taban)K.portre='res://art/kisiler/portre_'+K.taban+'.png';else K.portre=null}
  R.meta={biyom:B,surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]};
  fs.writeFileSync(path.join(OUT,'data','kisiler_'+ADLAR[B]+'.json'),JSON.stringify(R));
  fs.writeFileSync(path.join(OUT,'data','gorevler_'+ADLAR[B]+'.json'),JSON.stringify({gorevler:Q}));
  console.log(ADLAR[B],R.kisiler.map(k=>k.k+'@'+k.x+','+k.y+' '+Object.keys(k.resim).join('')).join(' | '),'istasyon',R.istasyonlar.length,'görev',Q.length,'tier',Object.keys(R.tier).length);
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
