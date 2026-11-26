// Purple Light → Godot: evcil hayvanlar ve Çoban Davut (web v342pet: SP, CBOF, Davut'un yerleri, inler, Pamuk; v230 husnu kovalamacası).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_evcil.js
// Ne yazar: data/evcil.json, art/kisiler/kisi_k_davut_*.png, art/kisiler/portre_k_davut.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const wpng=(f,d)=>fs.writeFileSync(f,Buffer.from(d.split(',')[1],'base64'));
const SRC=fs.readFileSync(GAME,'utf8');
const SP=eval('('+SRC.match(/const SP=(\{\n at:[\s\S]*?\}\});/)[1]+')');
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plPets&&!!window.__plSide,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const hk=s=>{let h=2166136261;for(let i=0;i<s.length;i++){h^=s.charCodeAt(i);h=Math.imul(h,16777619)>>>0}return h};
    function spotIn(b,key){const C=[];for(let ty=6;ty<H-6;ty+=3)for(let tx=6;tx<W-6;tx+=3){const i=ty*W+tx;if(BIO[i]!==b||!reach[i]||tiles[i]>1)continue;let ok=true;
      for(let dy=-3;dy<=3&&ok;dy++)for(let dx=-3;dx<=3;dx++){const j=(ty+dy)*W+tx+dx;if(tiles[j]>1||BIO[j]!==b){ok=false;break}}if(ok)C.push(i)}
      if(!C.length)return null;const i=C[hk(key)%C.length];return {x:(i%W)*T+8,y:Math.floor(i/W)*T+8}}
    const L=npcLook({skin:'#c88a64',skinD:'#a06a46',hair:'#d8d8d0',hairD:'#a8a8a0',hairL:'#f0f0e8',hs:'short',beard:'sakal',hat:'hasir',shirt:'#8a6a3a',shirtD:'#6a4e28',pants:'#4a3a2a'});
    const [c,g]=mk(24,40);drawChibi(g,12,36,L,{noShadow:1});const [cq,gq]=mk(24,40);drawChibi(gq,12,36,L,{noShadow:1,fx:-1,fy:0});const [c2,g2]=mk(24,26);drawChibi(g2,12,29,L,{noShadow:1,fx:0,fy:1});
    const q=window.__plSide.BY.husnu;const dav=[{x:q.x,y:q.y}];for(let k=1;k<=5;k++)dav.push(spotIn(k,'davut-'+k));
    const den={};for(const sp of ['kurt','timsah','kertenkele']){const bb={kurt:1,timsah:2,kertenkele:4}[sp];den[sp]=spotIn(bb,'den-'+sp)}
    return {resim:{f:png(c),q:png(cq)},portre:png(c2),dav,den,keci:{x:q.pts.goat.x,y:q.pts.goat.y},husnu:{intro:window.__plSide.BY.husnu.intro,steps:window.__plSide.BY.husnu.steps,after:window.__plSide.BY.husnu.after,remind:window.__plSide.BY.husnu.remind}}})()`));
  const i=SRC.indexOf('const DATA={"Q": [');const j=SRC.indexOf('\n',i);const D=JSON.parse(SRC.slice(i+11,j).replace(/;\s*$/,''));
  const Q=D.Q.filter(q=>q.g==='k_davut').map(q=>{const o={};for(const k of ['id','g','t','p','r','say','thx','c','x','rec','rew','nomat','les','sc'])if(q[k]!=null)o[k]=q[k];return o});
  const dir=path.join(OUT,'art','kisiler');
  wpng(path.join(dir,'kisi_k_davut_f.png'),R.resim.f);wpng(path.join(dir,'kisi_k_davut_q.png'),R.resim.q);wpng(path.join(dir,'portre_k_davut.png'),R.portre);
  const K={k:'k_davut',ad:'Çoban Davut',x:Math.round(R.dav[0].x),y:Math.round(R.dav[0].y),rol:'d',resim:{f:'res://art/kisiler/kisi_k_davut_f.png',q:'res://art/kisiler/kisi_k_davut_q.png'},portre:'res://art/kisiler/portre_k_davut.png'};
  fs.writeFileSync(path.join(OUT,'data','evcil.json'),JSON.stringify({sp:SP,cb:{at:'CB3',kurt:'CB4',timsah:'CB5',keci:'CB6',kertenkele:'CB7',geyik:'CB8'},davut:K,dav_yer:R.dav,in:R.den,keci:R.keci,husnu:R.husnu,gorevler:Q,gb:D.GB.k_davut}));
  console.log('davut',R.dav.map(d=>d&&(d.x+','+d.y)).join(' '),'in',JSON.stringify(R.den),'görev',Q.length,'GB',D.GB.k_davut);
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
