// Web v315roll: taklanın 16 pozunu (yandan, aşağı, yukarı) kahramanın kendi çiziminden üretip art/takla.png (16×3 kare, 60×60) ve data/takla.json'a yazar.
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_takla.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const A='window.__plRoll16=function(){';
if(h.indexOf(A)<0)throw 'v315roll yok';
h=h.replace(A,"window.__ROLLF=function(st,mode){const P=poseAt(st);if(mode==='side'){paint(SPR.side,1,0,P.sh>.5);build(SPR.side,P,1,true,1)}else{const dir=mode==='down'?1:-1;const ang=P.a*Math.PI*2,c=Math.cos(ang),down=dir>0;const s=(c>=0)===down?SPR.front:SPR.back;paint(s,0,s===SPR.front?1:-1,P.sh>.5);build(s,P,dir,false,Math.max(.25,Math.abs(c))*(c<0?-1:1))}return {c:RR.c,up:P.up}};"+A);
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8797);
(async()=>{
  const b=await chromium.launch();
  const p=await b.newPage();
  await p.goto('http://127.0.0.1:8797/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>window.__ROLLF,null,{timeout:60000});
  await p.waitForTimeout(2000);
  const res=await p.evaluate(()=>{const R=60,out=document.createElement('canvas');out.width=R*16;out.height=R*3;const g=out.getContext('2d');g.imageSmoothingEnabled=false;
    const up=[];['side','down','up'].forEach((m,j)=>{for(let s=0;s<16;s++){const r=window.__ROLLF(s,m);g.drawImage(r.c,s*R,j*R);if(j===0)up.push(r.up)}});
    return {png:out.toDataURL().split(',')[1],up}});
  fs.writeFileSync(path.join(__dirname,'..','art','takla.png'),Buffer.from(res.png,'base64'));
  fs.writeFileSync(path.join(__dirname,'..','data','takla.json'),JSON.stringify({kare:60,merkez:30,ayak_y:7,up:res.up}));
  console.log('takla tamam',res.up.join(','));
  await b.close();srv.close();
})().catch(e=>{console.error(e);process.exit(1)});
