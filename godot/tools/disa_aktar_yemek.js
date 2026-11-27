// Yemeklerin profillerini (web eat/prof/buffOf/foodVal/healVal/POISON/catOf; v63 yemek listesi, v3.10, v3.35) data/yemek.json'a yazar.
// Çalıştır: OYUN=/tmp/oyun_src.html NODE_PATH=/opt/node-tools/node_modules node tools/disa_aktar_yemek.js
const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright');
let h=fs.readFileSync(process.env.OYUN||'/tmp/oyun_src.html','utf8');
const A='const _eat=eat;eat=function(n){const P=prof(n);';if(h.indexOf(A)<0)throw 'prof yok';
h=h.replace(A,'window.__PROF=prof;'+A);
const srv=http.createServer((q,r)=>{r.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});r.end(h)}).listen(8795);
(async()=>{const b=await chromium.launch();const p=await b.newPage();
  await p.goto('http://127.0.0.1:8795/?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__PROF&&!!window.__ham&&!!window.__plEatCat,null,{timeout:90000});await p.waitForTimeout(2000);
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const out={},seen=new Set(Object.keys(PRICE_));for(const x of DB.R)seen.add(x.r);
    for(const n of seen){let f=0,hv=0,b=null;try{f=foodVal(n)||0;hv=healVal(n)||0;b=buffOf(n)}catch(e){}
      if(!(f>0||hv>0||b))continue;const P=window.__PROF(n);
      out[n]={f,h:P.heal,iy:P.good.filter(k=>BUFFS[k]),dG:P.dG,kt:P.bad?P.bad.filter(k=>BUFFS[k]):[],pK:Math.round(P.pBad*100)/100,dB:P.dB,en:P.en,z:POISON[n]?1:0,cig:isRawMeat(n)?1:0,kat:window.__plEatCat(n)}}
    const B={};for(const k in BUFFS)B[k]={n:BUFFS[k].n,c:BUFFS[k].c,e:BUFFS[k].e};return {yemek:out,etki:B}})()`));
  fs.writeFileSync(path.join(__dirname,'..','data','yemek.json'),JSON.stringify(R));console.log(Object.keys(R.yemek).length,'yemek',Object.keys(R.etki).join(','));
  await b.close();srv.close()})();
