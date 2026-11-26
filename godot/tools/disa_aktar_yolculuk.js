// Purple Light → Godot: ACT 1'in sonundaki deniz yolculuğu sahnesi (web v75 voyage/vdraw; belge ACT 1 › Denizci Barbaros).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_yolculuk.js
// Ne yazar: art/yolculuk/k_<n>.png (oyunun kendi çiziminden, saniyede 8 kare, 14 sn), data/yolculuk.json (kare sayısı, altyazılar)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const FPS=8,SURE=13.8;
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plDz,null,{timeout:90000});await p.waitForTimeout(2500);
  // the scene draws in a requestAnimationFrame loop from real time; we freeze time and step it ourselves (dt is capped at 0,05 sn, so three steps per frame)
  await p.evaluate(()=>{window.__vt=0;const _n=performance.now.bind(performance);performance.now=()=>window.__vt;window.requestAnimationFrame=f=>{window.__raf=f;return 1}});
  await p.evaluate(()=>window.__ham.ev('window.__plDz.voyage(true)'));
  const n=Math.ceil(SURE*FPS);
  for(let i=0;i<n;i++){
    const d=await p.evaluate(i=>{for(let s=0;s<3;s++){window.__vt+=125/3;const f=window.__raf;window.__raf=null;if(f)f(window.__vt)}return document.querySelector('#voyov canvas').toDataURL('image/png')},i);
    fs.writeFileSync(path.join(OUT,'art','yolculuk',`k_${i}.png`),Buffer.from(d.split(',')[1],'base64'))}
  const SRC=fs.readFileSync(GAME,'utf8');
  const caps=[[1,'Barbaros dümene geçti. Yeni yelkenler rüzgârı tuttu.'],[5,'Ada arkanda küçüldü… Kemal\'in ateşi uzakta bir yıldız gibi sönükleşti.'],[9.5,'Önünde yalnızca deniz. Ve ufukta, mor bir parıltı.']];
  if(!SRC.includes(caps[2][1]))throw new Error('altyazılar web\'de değişmiş');
  fs.writeFileSync(path.join(OUT,'data','yolculuk.json'),JSON.stringify({kare:n,fps:FPS,sure:SURE,yazilar:caps,yazi_bitis:12.2}));
  console.log('yolculuk',n,'kare');await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
