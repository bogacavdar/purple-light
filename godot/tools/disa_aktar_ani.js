// Purple Light → Godot: anılar (web MEMS, v318 düzeni, memScene/scene318, memText; belge Sistemler › Anılar).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_ani.js
// Ne yazar: data/ani.json (anılar web sırasıyla: ad, tür, satırlar, ACT 1 sırası ve en erken günü; her satırın karelerinde oyuncunun ve sevdiği
// kişinin nerede, hangi yöne ve hangi dönüşümle çizileceği; resmin üstündeki yazılar), art/ani/a<i>_<satır>_<kare>.png (iki kişi çizilmeden)
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const KARE=3,ARA=.5;
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plA1I,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(K=>window.__ham.ev(`(()=>{heroName='{H}';loveName='{L}';
    const ov=document.getElementById('memov');ov.hidden=false;const cv=document.getElementById('mem-c');cv.style.width='240px';cv.style.height='135px';
    const g=cv.getContext('2d');const REC=[];const _dc=drawChibi;
    const bk=document.createElement('canvas');bk.width=240;bk.height=135;const bg=bk.getContext('2d');let split=false;
    drawChibi=function(gg,x,y,L,o){const w=L===LOOK.hero?'h':L===LOOK.love?'l':null;if(!w)return _dc.apply(this,arguments);const m=gg.getTransform();
      if(!split&&gg===g){split=true;bg.clearRect(0,0,240,135);bg.drawImage(cv,0,0);g.save();g.setTransform(1,0,0,1,0,0);g.clearRect(0,0,240,135);g.restore()}
      REC.push({w,x:Math.round(x*10)/10,y:Math.round(y*10)/10,fx:o&&o.fx!=null?o.fx:0,fy:o&&o.fy!=null?o.fy:1,q34:!!(o&&o.q34),m:[m.a,m.b,m.c,m.d,m.e,m.f].map(v=>Math.round(v*1000)/1000)})};
    const labs=()=>[...document.querySelectorAll('#mem-lab span')].map(s=>({t:s.textContent,x:parseFloat(s.style.left),y:parseFloat(s.style.top),s:parseFloat(s.style.fontSize)||7,
      c:s.style.color||'#fff',b:/700/.test(s.style.font)||s.style.fontWeight==='700',a:/-50%,/.test(s.style.transform)?'c':'',al:s.style.opacity===''?1:+s.style.opacity,sh:s.style.textShadow||''}));
    const A1I=window.__plA1I;const out=[];
    const lines=(m)=>m.L.map(l=>[l[0],l[1]]);
    for(let i=0;i<MEMS.length;i++){const m=MEMS[i];const o={i,n:m.n,tur:m.act2?'usta':m.pur?'mor':'a1',pos:m.pos!=null?m.pos:-1};
      if(m.n==='Çay kıyısında söz'){const _p=window.__plLoveProposes;window.__plLoveProposes=()=>true;o.L_k=lines(m);window.__plLoveProposes=()=>false;o.L=lines(m);window.__plLoveProposes=_p}
      else o.L=lines(m);
      o.kareler=[];
      for(let k=0;k<o.L.length;k++){const row=[];for(let f=0;f<3;f++){REC.length=0;g.setTransform(1,0,0,1,0,0);g.clearRect(0,0,240,135);
          split=false;try{memScene(g,i,k*1.75+f*.5,k)}catch(e){}
          row.push(split?{png:bk.toDataURL('image/png'),on:cv.toDataURL('image/png'),k:REC.slice(),y:labs()}:{png:cv.toDataURL('image/png'),k:REC.slice(),y:labs()})}
        o.kareler.push(row)}
      out.push(o)}
    ov.hidden=true;return {anilar:out,A1I}})()`),{});
  // aynı kare bir kez yazılır (adı içeriğinin özeti): durağan sahnelerde karelerin çoğu aynı
  let n=0;const crypto=require('crypto');const D=path.join(OUT,'art','ani');for(const f of fs.readdirSync(D))fs.unlinkSync(path.join(D,f));
  const yaz=d=>{const B=Buffer.from(d.split(',')[1],'base64');const h=crypto.createHash('md5').update(B).digest('hex').slice(0,12);const fn=h+'.png';if(!fs.existsSync(path.join(D,fn))){fs.writeFileSync(path.join(D,fn),B);n++}return h};
  for(const a of R.anilar){a.kareler=a.kareler.map(row=>row.map(f=>({a:yaz(f.png),o:f.on?yaz(f.on):'',k:f.k,y:f.y})))}
  const SRC=fs.readFileSync(GAME,'utf8');
  const MIN=JSON.parse((SRC.match(/const MIN=(\[[0-9,]+\]);/)||[])[1]||'[]');
  fs.writeFileSync(path.join(OUT,'data','ani.json'),JSON.stringify({meta:{surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]},kare:3,ara:.5,MIN,anilar:R.anilar}));
  console.log('anı',R.anilar.length,'kare',n,R.anilar.map(a=>a.i+':'+a.n+':'+a.tur+':'+a.pos).join(' | '));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
