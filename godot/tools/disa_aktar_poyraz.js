// Purple Light → Godot: Gemici Poyraz ve deniz (web v234; belge ACT 1 › Gemici Poyraz ve deniz).
// Çalıştır (pl-godot kökünden):  OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_poyraz.js
// Ne yazar: data/poyraz.json (kaza koyu, görevler G1–G10), art/kisiler/kisi_poyraz_*.png, portre_poyraz.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const wpng=(f,d)=>fs.writeFileSync(f,Buffer.from(d.split(',')[1],'base64'));
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plNuri,null,{timeout:90000});await p.waitForTimeout(2500);
  const R=await p.evaluate(()=>window.__ham.ev(`(()=>{const png=c=>c.toDataURL('image/png');
    const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
    const NL=npcLook({skin:'#d8a070',skinD:'#b8804e',hair:'#9a9a9a',hairD:'#7a7a7a',hairL:'#c8c8c8',hs:'short',beard:'sakal',hat:'kasket',hatC:'#1e2c4a',shirt:'#e8e8f0',shirtD:'#3a5a8a',pants:'#2a3a5a'});
    const [c,g]=mk(24,40);drawChibi(g,12,36,NL,{noShadow:1});const [c3,g3]=mk(24,40);drawChibi(g3,12,36,NL,{noShadow:1,fx:1,fy:0,q34:1});const [c2,g2]=mk(24,26);drawChibi(g2,12,29,NL,{noShadow:1,fx:0,fy:1});
    // web findCove, ama Bereket Adası hariç (web'de ada da BIO 0 kumsal olduğu için koy adaya düşebiliyor)
    const onIs=(window.__plFarm&&window.__plFarm.onIs)||(()=>false);
    const C=(()=>{const hx=npc.home.x,hy=npc.home.y;let best=null,bs=-1;const X=[];try{for(const e of XTRA){const x=+e.x,y=+e.y;if(isFinite(x)&&isFinite(y))X.push([x,y])}}catch(e){}
      const ppl=[npc,witch,market,smith,durmus,farmer,usta,alp].filter(Boolean).map(o=>[o.x,o.y]);
      for(let ty=3;ty<H-3;ty+=2)for(let tx=3;tx<W-3;tx+=2){const i=ty*W+tx;if(tiles[i]!==2||BIO[i]>1)continue;let sea=null;
        for(let r=1;r<=3&&!sea;r++)for(const [dx,dy] of [[1,0],[-1,0],[0,1],[0,-1]])if(tiles[(ty+dy*r)*W+tx+dx*r]===4){sea=[dx,dy,r];break}
        if(!sea)continue;const back=tiles[(ty-sea[1]*2)*W+tx-sea[0]*2];if(back===4||back===3)continue;
        const x=tx*T+8,y=ty*T+8;if(onIs(x,y))continue;if(!reachAt(x,y)||blocked(x,y))continue;const d=Math.hypot(x-hx,y-hy);if(d<1400)continue;
        if(Math.hypot(x-dock.x,y-dock.y)<500)continue;if(ppl.some(p=>Math.hypot(p[0]-x,p[1]-y)<360))continue;if(X.some(p=>Math.hypot(p[0]-x,p[1]-y)<260))continue;
        const sc=d+(BIO[i]===0?200:0);if(sc>bs){bs=sc;best={x,y,dx:sea[0],dy:sea[1],r:sea[2]}}}
      if(!best)best={x:hx+600,y:hy,dx:0,dy:1,r:1};
      return {x:best.x-best.dx*10,y:best.y-best.dy*10,sx:best.x+best.dx*(best.r*T+14),sy:best.y+best.dy*(best.r*T+10),dx:best.dx,dy:best.dy}})();
    const W0=window.__plNuri.findCove();
    return {f:png(c),q:png(c3),por:png(c2),webkoy:{x:Math.round(W0.x),y:Math.round(W0.y)},cove:{x:Math.round(C.x),y:Math.round(C.y),sx:Math.round(C.sx),sy:Math.round(C.sy),dx:C.dx,dy:C.dy}}})()`));
  const SRC=fs.readFileSync(GAME,'utf8');const i=SRC.indexOf('const DATA={"Q": [');const j=SRC.indexOf('\n',i);const D=JSON.parse(SRC.slice(i+11,j).replace(/;\s*$/,''));
  const Q=D.Q.filter(q=>q.g==='trader').map(q=>{const o={};for(const k of ['id','g','t','p','r','say','thx','c','x','rec','rew','nomat','les','sc'])if(q[k]!=null)o[k]=q[k];return o});
  wpng(path.join(OUT,'art','kisiler','kisi_poyraz_f.png'),R.f);wpng(path.join(OUT,'art','kisiler','kisi_poyraz_q.png'),R.q);wpng(path.join(OUT,'art','kisiler','portre_poyraz.png'),R.por);
  fs.writeFileSync(path.join(OUT,'data','poyraz.json'),JSON.stringify({koy:R.cove,gorevler:Q,meta:{surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]}}));
  console.log('poyraz koy',JSON.stringify(R.cove),'web koyu',JSON.stringify(R.webkoy),'görev',Q.map(q=>q.id).join(' '));
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
