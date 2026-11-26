// Purple Light → Godot: ACT 2'nin sonu (web v81 launch/rdraw ve v83 hug/hdraw): roketin fırlatılışı ve mor gemide kavuşma.
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_roket.js
// Ne yazar: art/roket/f_<n>.png (fırlatma, 15,6 sn), art/roket/s_<n>.png (kavuşma, 14,6 sn; iki kişi çizilmeden: Godot oyuncunun ve
// sevdiği kişinin kendi çizimini üstüne koyar), data/roket.json (kare sayıları, altyazılar)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const FPS=8,S1=15.6,S2=14.6;
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.addInitScript(()=>sessionStorage.setItem('hammadde.isle','2'));
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plRocket,null,{timeout:90000});await p.waitForTimeout(2500);
  await p.evaluate(()=>{window.__vt=0;performance.now=()=>window.__vt;window.requestAnimationFrame=f=>{window.__raf=f;return 1};const _st=window.setTimeout;window.setTimeout=(f,ms)=>_st(f,ms>=3000?1:ms)});
  await p.evaluate(()=>window.__ham.ev('window.__plRocket.launch(true)'));
  const step=async()=>p.evaluate(()=>{for(let s=0;s<3;s++){window.__vt+=125/3;const f=window.__raf;window.__raf=null;if(f)f(window.__vt)}return document.querySelector('#rkov canvas').toDataURL('image/png')});
  const n1=Math.ceil(S1*FPS);
  for(let i=0;i<n1;i++){const d=await step();fs.writeFileSync(path.join(OUT,'art','roket',`f_${i}.png`),Buffer.from(d.split(',')[1],'base64'))}
  // fırlatma bitti; kavuşma kısa bir aradan sonra başlar: iki kişi çizilmesin
  for(let k=0;k<40;k++){await p.evaluate(()=>{window.__vt+=50;const f=window.__raf;window.__raf=null;if(f)f(window.__vt)});await p.waitForTimeout(40)}
  await p.evaluate(()=>window.__ham.ev('drawChibi=function(){}'));
  await p.waitForFunction(()=>!!window.__raf,null,{timeout:20000});
  const n2=Math.ceil(S2*FPS);
  for(let i=0;i<n2;i++){const d=await step();fs.writeFileSync(path.join(OUT,'art','roket',`s_${i}.png`),Buffer.from(d.split(',')[1],'base64'))}
  const SRC=fs.readFileSync(GAME,'utf8');
  const caps1=[[.6,'Üç… iki… bir…'],[3.4,'Rampa sarsıldı. Roket ateşten bir sütunun üstünde yükseldi.'],[7.6,'Yüzen Kayalar, mantar ormanı, çöl, volkan… hepsi küçücük oldu.'],[11.6,'Gökyüzü karardı. Ve karşında, sessizce bekleyen mor ışıklı gemi.']];
  const caps2=[[.8,'Mor geminin içi. Camlı kapsüllerin ardında sayısız uyuyan yüz.'],[4.2,'Bir cam açıldı. Kapsülden biri adım attı… ve sana koştu.'],[8,'{L}: “Buldun beni.”'],[10.6,'{H}: “Söz vermiştim. Yıldızların ötesinde bile.”']];
  for(const c of caps1.concat(caps2))if(!SRC.includes(c[1]))throw new Error('altyazı web\'de değişmiş: '+c[1]);
  fs.writeFileSync(path.join(OUT,'data','roket.json'),JSON.stringify({fps:FPS,f:{kare:n1,sure:S1,yazilar:caps1,yazi_bitis:14.2},s:{kare:n2,sure:S2,yazilar:caps2,yazi_bitis:13}}));
  console.log('roket',n1,n2);await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
