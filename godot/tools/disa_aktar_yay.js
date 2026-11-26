// Purple Light → Godot: yaylar ve oklar (web v249 BOW/ARR, v251 usta yayları, v3.68 kısa yaylar; belge Aletler › Yaylar ve oklar).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_yay.js
// Ne yazar: data/yay.json ({yaylar: ad → {dmg, cd, rng, spd, dur}, oklar: [[ad, çarpan, renk, etki]] güçlüden zayıfa, verim: ok → bir yapışta kaç})
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
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plBow,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const B=window.__plBow,out={yaylar:{},oklar:B.allArrows().map(A=>[A[0],A[1],A[2],A[3]||null]),verim:{}};
    let cap=null;const _f=window.__plFire;window.__plFire=(S,dm)=>{cap={S,dm}};
    for(const n in GT){if(GT[n].kind!=='bow')continue;inv[n]=1;belt[0]=n;hand=0;toolDur[n]=GT[n].dur;inv['Basit ok']=5;window.__plArrSel=null;cap=null;
      try{B.shot(0,1)}catch(e){}out.yaylar[n]={dmg:B.dmg(n),cd:B.cd(n),rng:cap?cap.S.range:0,spd:cap?cap.S.spd:0,dur:GT[n].dur}}
    window.__plFire=_f;
    for(const A of out.oklar){const r=REC.get(A[0]);if(!r)continue;for(const [m,q] of r.i)inv[m]=(inv[m]||0)+q*3;for(const t of r.t)inv[t]=(inv[t]||0)+1;const a0=inv[A[0]]||0;try{handCraft(A[0],true)}catch(e){}out.verim[A[0]]=(inv[A[0]]||0)-a0}
    return out})()`));
  const SRC=fs.readFileSync(GAME,'utf8');R.meta={surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]};
  fs.writeFileSync(path.join(OUT,'data','yay.json'),JSON.stringify(R));
  console.log(JSON.stringify(R).slice(0,3000));await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
