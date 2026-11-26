// Purple Light → Godot: Ada halkı hikâyeleri (web v59 ST_, playScene; aile sahnesi __plFam; belge Sistemler › Ada halkı hikâyeleri).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_hikaye.js
// Ne yazar: data/hikaye.json (kişi başına kaybettiği, hangi görevlerle açıldığı, parçalar, sahne adı ve satırları),
// art/hikaye/<sahne>_<satır>_<kare>.png (her sahne satırı için oyunun kendi çiziminden 5 kare, 0,35 sn arayla)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const KARE=5,ARA=350;
const wpng=(f,d)=>fs.writeFileSync(f,Buffer.from(d.split(',')[1],'base64'));
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__v59ST&&!!window.__plStory,null,{timeout:90000});await p.waitForTimeout(2500);
  const D=JSON.parse(await p.evaluate(()=>window.__ham.ev(`JSON.stringify((()=>{const ST=window.__v59ST,G=window.__v59G,F=window.__plFam;const o={};
    for(const g in ST){const S=ST[g];let nm=g;try{const x=G[g]();if(x&&x.name)nm=x.name}catch(e){}
      o[g]={ad:nm,lost:S.lost,ids:S.ids||null,at:S.at||null,F:S.F,aile:!!(F&&F.has(g)),sc:S.sc?{n:S.sc.n,L:S.sc.L}:null}}
    return {kisi:o,aile:F?{n:F.sc.n,L:F.sc.L,xp:F.xp||300}:null}})())`)));
  const sahneler=Object.keys(D.kisi).filter(g=>D.kisi[g].sc&&!D.kisi[g].aile);
  const aileG=Object.keys(D.kisi).find(g=>D.kisi[g].aile);
  const isler=sahneler.map(g=>[g,g]);if(aileG)isler.push([aileG,'aile']);
  for(const [g,ad] of isler){
    await p.evaluate(g=>window.__ham.ev(`window.__plStory.play(${JSON.stringify(g)})`),g);await p.waitForTimeout(300);
    const n=ad==='aile'?D.aile.L.length:D.kisi[g].sc.L.length;
    for(let i=0;i<n;i++){
      for(let k=0;k<KARE;k++){const d=await p.evaluate(()=>document.getElementById('nsc-c').toDataURL('image/png'));wpng(path.join(OUT,'art','hikaye',`${ad}_${i}_${k}.png`),d);await p.waitForTimeout(ARA)}
      await p.click('#nsc-go');await p.waitForTimeout(150)}
    console.log('sahne',ad,n,'satır')}
  D.kare=KARE;D.ara=ARA/1000;
  fs.writeFileSync(path.join(OUT,'data','hikaye.json'),JSON.stringify(D));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
