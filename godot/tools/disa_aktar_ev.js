// Purple Light → Godot: evlerin içi (web v56-room: RSZ oda boyları, RSTY renkler, DEC ev eşyaları ve çizimleri).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_ev.js
// Ne yazar: data/ev.json, art/ev/*.png (her eşyanın odadaki çizimi; iki kare: alev titrer)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const safe=s=>s.toLowerCase().replace(/ç/g,'c').replace(/ğ/g,'g').replace(/ı/g,'i').replace(/ö/g,'o').replace(/ş/g,'s').replace(/ü/g,'u').replace(/[^a-z0-9]+/g,'_');
const src=fs.readFileSync(GAME,'utf8');
const RSZ=eval('('+src.match(/const RSZ=(\{[^;]*?\});/)[1]+')');
const RSTY=eval('('+src.match(/const RSTY=(\{[\s\S]*?\}\});/)[1]+')');
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plDEC,null,{timeout:90000});await p.waitForTimeout(1500);
  const R=await p.evaluate(()=>{const D=window.__plDEC,out={};
    for(const n in D){const d=D[n],fr=[];for(const t of [0.17,0.52]){const c=document.createElement('canvas');c.width=d.w*16;c.height=d.h*16+16;const g=c.getContext('2d');d.d(g,0,16,t);fr.push(c.toDataURL('image/png'))}
      out[n]={w:d.w,h:d.h,L:d.L,k:d.k||'',png:fr}}return out});
  fs.mkdirSync(path.join(OUT,'art','ev'),{recursive:true});
  for(const n in R){const y=R[n];y.file=[];y.png.forEach((u,i)=>{const f='ev_'+safe(n)+'_'+i+'.png';fs.writeFileSync(path.join(OUT,'art','ev',f),Buffer.from(u.split(',')[1],'base64'));y.file.push('res://art/ev/'+f)});delete y.png}
  fs.writeFileSync(path.join(OUT,'data','ev.json'),JSON.stringify({oda:RSZ,renk:RSTY,esya:R}));
  console.log('oda',Object.keys(RSZ).length,'eşya',Object.keys(R).length);
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
