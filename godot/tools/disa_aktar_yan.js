// Purple Light → Godot: Çayır, Orman ve Bataklık'ın yan görevleri (web v230 Q, GATE, pts, LK; drawObj çizimleri, kişilerin görünüşü).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_yan.js
// Ne yazar: data/yan.json, art/yan/*.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const SRC=fs.readFileSync(GAME,'utf8');
const i0=SRC.indexOf(' function drawObj(kind,x,y)'),i1=SRC.indexOf(' // the active quest\'s things in the world',i0);
const DRAWOBJ=SRC.slice(i0,i1);
const g0=SRC.indexOf(' const GATE={'),g1=SRC.indexOf('};',g0);const GATE=eval('('+SRC.slice(g0+12,g1+1)+')');
const wpng=(f,u)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,Buffer.from(u.replace(/^data:image\/png;base64,/,''),'base64'))};
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plSide,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(DO=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const KID={kerem:1,mina:1,isil:1,emir:1};
    const B=window.__plSide.BY,out=[];const LKs=window.__plSqLK||null;
    for(const id in B){const q=B[id];if(q.b>5||q.cave||(q.main&&id!=='ekin1')||q.ext)continue;
      const o={};for(const k of ['id','name','title','b','win','night','c','xp','main','intro','remind','remindUse','steps','after','quiet','fix','goatDone','anim','homeDone','ghost'])if(q[k]!=null)o[k]=q[k];
      o.x=Math.round(q.x);o.y=Math.round(q.y);o.kid=KID[id]?1:0;o.pts={};for(const k in q.pts)o.pts[k]={x:Math.round(q.pts[k].x),y:Math.round(q.pts[k].y)};
      out.push(o)}
    // görünüşler: v230'un LK tablosu (kaynaktan okunur)
    let fam=null;try{const F=window.__pl184.FAMS.find(f=>f.b===3);if(F)fam={x:Math.round(F.cx+40),y:Math.round(F.cy+46)}}catch(e){}
    return {out,fam}})()`),DRAWOBJ);
  const FAM=R.fam;
  const QS=R.out;
  // kişilerin görünüşü kaynaktan (LK: id:L({...}))
  for(const q of QS){const m=SRC.match(new RegExp('[\\n,{ ]'+q.id+':L\\((\\{[^}]*\\})\\)'));q.look=m?m[1]:null}
  const IMG=await p.evaluate(([DO,Q])=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const Q=${JSON.stringify(Q)};const kisi={};
    for(const q of Q){if(!q.look)continue;const L=npcLook(eval('('+q.look+')'));const s=q.kid?.75:1;
      const [c,g]=mk(24,40);g.translate(12,36);g.scale(s,s);g.translate(-12,-36);drawChibi(g,12,36,L,{noShadow:1});
      const [c2,g2]=mk(24,40);g2.translate(12,36);g2.scale(s,s);g2.translate(-12,-36);drawChibi(g2,12,36,L,{noShadow:1,fx:-1,fy:0});
      const [c3,g3]=mk(24,26);drawChibi(g3,12,29,L,{noShadow:1,fx:0,fy:1});
      kisi[q.id]={f:png(c),q:png(c2),portre:png(c3)}}
    // nesneler: oyunun kendi drawObj'u (px bir tuvale yönlendirilir)
    const time=1.3;${DO}
    const KINDS=new Set(['pigeon','quail','straw','scare','bottle','goods','toy','shoe','stone','chalk','wreck','den','cave','swarm','kite','mush','flowers','frog','bell','egg','egg2','nest','letter','burn','hammer','altar','crystal','mirror','lanterns','drop','coop','embers','cart','cartT','hut','grave','lantern']);
    for(const q of Q){for(const s of q.steps)if(s.draw)KINDS.add(s.draw);for(const f of (q.fix||[]))KINDS.add(f[0])}
    const nes={};const _px=px;
    for(const k of KINDS){const [c,g]=mk(96,96);px=function(x,y,w,h,col){g.fillStyle=col;g.fillRect(Math.round(x),Math.round(y),w,h)};
      try{drawObj(k,48,70)}catch(e){}finally{px=_px}
      const d=g.getImageData(0,0,96,96).data;let a0=96,b0=96,a1=-1,b1=-1;for(let y=0;y<96;y++)for(let x=0;x<96;x++)if(d[(y*96+x)*4+3]>8){if(x<a0)a0=x;if(x>a1)a1=x;if(y<b0)b0=y;if(y>b1)b1=y}
      if(a1<0)continue;const [c2,g2]=mk(a1-a0+1,b1-b0+1);g2.drawImage(c,a0,b0,a1-a0+1,b1-b0+1,0,0,a1-a0+1,b1-b0+1);nes[k]={png:png(c2),ox:48-a0,oy:70-b0}}
    return {kisi,nes}})()`),[DRAWOBJ,QS]);
  const pre='res://art/yan/';
  for(const q of QS){const K=IMG.kisi[q.id];if(!K)continue;for(const f of ['f','q','portre']){const fn=q.id+'_'+f+'.png';wpng(path.join(OUT,'art','yan',fn),K[f]);q[f==='portre'?'portre':'resim_'+f]=pre+fn}q.gate=GATE[q.id]||[0];delete q.look}
  for(const k in IMG.nes){const fn='nes_'+k+'.png';wpng(path.join(OUT,'art','yan',fn),IMG.nes[k].png);IMG.nes[k].png=pre+fn}
  const OBJSC=eval('('+SRC.match(/const OBJSC=(\{[^}]*\})/)[1]+')');
  const MOB=eval(SRC.match(/ const MOB=(\[\[.*?\]\]);/)[1]);
  fs.writeFileSync(path.join(OUT,'data','yan.json'),JSON.stringify({yan:QS,nesne:IMG.nes,objsc:OBJSC,mob:MOB,fam3:FAM}));
  console.log('yan',QS.length,QS.map(q=>q.id+(q.portre?'':'(resimsiz)')).join(' '),'| nesne',Object.keys(IMG.nes).length);
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
