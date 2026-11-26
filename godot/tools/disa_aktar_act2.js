// Purple Light → Godot: ACT 2 adasının ustaları (web v76–v81: Yıldız, Efsun, Tufan, Işın, Tomris, Gökay): yerleri, çizimleri, konuşma resimleri
// ve görevleri (web v55 NQ: gk, pv, sl, mk, ej, as → Godot görev biçimi).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_act2.js
// Ne yazar: data/ada2/ustalar.json ({kisiler, gorevler}), art/kisiler/kisi_<k>_f.png, _q.png, portre_<k>.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const wpng=(f,d)=>fs.writeFileSync(f,Buffer.from(d.split(',')[1],'base64'));
const G=['gok','pervin','tamer','selin','alara','tuna'];
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.addInitScript(()=>sessionStorage.setItem('hammadde.isle','2'));
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(G=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const kisiler=[];
    for(const k of ${JSON.stringify(G)}){const o=window['__'+k];const L=NPCL[k];if(!o||!L)continue;
      const [c,g]=mk(24,40);drawChibi(g,12,36,L,{noShadow:1});const [c3,g3]=mk(24,40);drawChibi(g3,12,36,L,{noShadow:1,q34:true});
      const [c2,g2]=mk(24,26);drawChibi(g2,12,29,L,{noShadow:1,fx:0,fy:1});
      kisiler.push({k,ad:o.name,x:Math.round(o.x),y:Math.round(o.y),f:png(c),q:png(c3),portre:png(c2)})}
    const Q=(window.__plNQ||[]).filter(q=>${JSON.stringify(G)}.indexOf(q.g)>=0).map(q=>({id:q.id,g:q.g,t:q.t,bring:q.bring||null,kill:q.kill||null,cnt:q.cnt||null,
      base:!!q.base,req:q.req?String(q.req):null,rt:q.rt||null,rec:q.rec||null,c:q.c||0,x:q.x||0,say:q.say,thx:q.thx||''}));
    return {kisiler,Q}})()`),G);
  const out=[];
  for(const k of R.kisiler){for(const f of ['f','q']){wpng(path.join(OUT,'art','kisiler',`kisi_${k.k}_${f}.png`),k[f])}wpng(path.join(OUT,'art','kisiler',`portre_${k.k}.png`),k.portre);
    out.push({k:k.k,ad:k.ad,x:k.x,y:k.y,rol:'u2',resim:{f:`res://art/kisiler/kisi_${k.k}_f.png`,q:`res://art/kisiler/kisi_${k.k}_q.png`},portre:`res://art/kisiler/portre_${k.k}.png`})}
  // web NQ → Godot görev: bring → ["b", ad, n], kill → ["k", tür, n], base (bir gece) → ["gun", 1]; req "X ile tanış" → ["met", g]; sıra: aynı kişinin bir önceki işi
  const H=s=>(s||'').replace(/<b>/g,'[b]').replace(/<\/b>/g,'[/b]').replace(/<i>/g,'[i]').replace(/<\/i>/g,'[/i]').replace(/<br>/g,'\n');
  const gor=[],son={};
  for(const q of R.Q){const P=[];if(q.bring)for(const [n,k] of q.bring)P.push(['b',n,k]);if(q.kill)P.push(['k',q.kill[0],q.kill[1]]);if(q.base)P.push(['gun',1]);
    const r=[];if(son[q.g])r.push(['q',son[q.g]]);const m=q.req&&q.req.match(/__(\w+)&&window\.__\w+\.met/);if(m)r.push(['met',m[1]]);
    const o={id:q.id,g:q.g,t:q.t,p:P,r,say:H(q.say),thx:H(q.thx),c:q.c,x:q.x,nq:1};if(q.rec)o.rec=q.rec;if(q.rt)o.rt=q.rt;gor.push(o);son[q.g]=q.id}
  const SRC=fs.readFileSync(GAME,'utf8');
  fs.writeFileSync(path.join(OUT,'data','ada2','ustalar.json'),JSON.stringify({meta:{surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]},kisiler:out,gorevler:gor}));
  console.log(out.map(k=>k.k+' '+k.ad+' '+k.x+','+k.y).join(' | '));console.log(gor.map(q=>q.id+':'+JSON.stringify(q.p)+JSON.stringify(q.r)).join('\n'));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
