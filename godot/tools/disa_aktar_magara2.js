// Purple Light → Godot: Yankı dışındaki mağaralar (web v3.09 CAVES c1–c5): ızgara, içinin çizimi, dışarıdaki tepe, canlıların ve boss'un
// kareleri (oyunun kendi drawAnimal'ı), toplananların resmi (drawNode), dipteki kişinin görünüşü ve yan görevi.
// Çalıştır (pl-godot kökünden):  MAG=c1,c2 OYUN=<html> NODE_PATH=/opt/node-tools/node_modules node godot/tools/disa_aktar_magara2.js
// Ne yazar: data/magara_<id>.json, art/magara/<id>_*.png
const {chromium}=require('playwright');
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const IDS=(process.env.MAG||'c1,c2').split(',');
const CHROME=process.env.CHROME||'/opt/pw-browsers/chromium-1243/chrome-linux64/chrome';
const SRC=fs.readFileSync(GAME,'utf8');const cut=(a,b)=>{const i=SRC.indexOf(a),j=SRC.indexOf(b,i);return SRC.slice(i,j+b.length)};
const PAINT=cut(' const hsh=s=>','return()=>{a=(a+0x6D2B79F5)>>>0;let t=a;t=Math.imul(t^t>>>15,t|1);t^=t+Math.imul(t^t>>>7,t|61);return((t^t>>>14)>>>0)/4294967296}};')+'\n'+cut(' function paint(C){','return C.cv=c}');
const N_=t=>['n',t],P_=t=>['p',t],X_=t=>['x',t];
const sq=id=>{const i=SRC.indexOf("{id:'"+id+"',name:"),j=SRC.indexOf("after:[",i),k=SRC.indexOf("]}",j);return (new Function('N','P','X','return '+SRC.slice(i,k+2)))(N_,P_,X_)};
const look=id=>(SRC.match(new RegExp('\\n  '+id+':L\\((\\{[^}]*\\})\\)'))||[])[1];
const wpng=(f,u)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,Buffer.from(u.replace(/^data:image\/png;base64,/,''),'base64'))};
(async()=>{
  const b=await chromium.launch({executablePath:CHROME});const p=await b.newPage({viewport:{width:960,height:600}});
  await p.route(/^https?:/,r=>r.abort());
  await p.goto('file://'+GAME+'?debug',{waitUntil:'domcontentloaded'});
  await p.waitForFunction(()=>!!window.__ham&&!!window.__plCave,null,{timeout:90000});await p.waitForTimeout(2500);
  for(const id of IDS){
    const C0=await p.evaluate(id=>window.__ham.ev(`(()=>{const C=window.__plCave.caves.find(c=>c.id==='${id}');return {npc:C.npc}})()`),id);
    const S=sq(C0.npc),LK=look(C0.npc);
    const R=await p.evaluate(([id,PA,LK])=>window.__ham.ev(`(()=>{const N=window.__plCave.N;${PA}
      const V=window.__plCave,C=V.caves.find(c=>c.id==='${id}'),PK=V.PK;if(!C.cv)paint(C);
      const png=c=>c.toDataURL('image/png');
      const mk=(w,h)=>{const c=document.createElement('canvas');c.width=w;c.height=h;const g=c.getContext('2d');g.imageSmoothingEnabled=false;return [c,g]};
      let G='';{let s='';for(let i=0;i<C.G.length;i++)s+=String.fromCharCode(C.G[i]);G=btoa(s)}
      const SP=window.__plCaveSpr?window.__plCaveSpr(C):null;
      const raw={};for(const n of C.raw)raw[n]={price:DB.p[n]||0,glow:window.__plCaveGlow.has(n),time:GTIME[n]||1};
      // oyunun kendi çizimini (ctx'e çizen drawAnimal, drawNode) bir tuvale yönlendir
      const SZ=160,FX=80,FY=110;const [nc,ng]=mk(SZ,SZ);
      const KEYS=new Set();for(let o=CanvasRenderingContext2D.prototype;o&&o!==Object.prototype;o=Object.getPrototypeOf(o))for(const k of Object.getOwnPropertyNames(o))KEYS.add(k);
      KEYS.delete('constructor');KEYS.delete('canvas');const saved={};const own=k=>Object.getOwnPropertyDescriptor(ctx,k);
      const S0=S,D0=dpr;S=1;dpr=1;
      for(const k of KEYS){saved[k]=own(k);const v=ng[k];if(typeof v==='function')Object.defineProperty(ctx,k,{configurable:true,writable:true,value:(...a)=>ng[k](...a)});else Object.defineProperty(ctx,k,{configurable:true,get:()=>ng[k],set:x=>{ng[k]=x}})}
      const grab=f=>{ng.setTransform(1,0,0,1,0,0);ng.clearRect(0,0,SZ,SZ);ng.imageSmoothingEnabled=false;f();ng.setTransform(1,0,0,1,0,0);const d=ng.getImageData(0,0,SZ,SZ);return d};
      const box=ds=>{let a0=SZ,b0=SZ,a1=-1,b1=-1;for(const d of ds){const D=d.data;for(let y=0;y<SZ;y++)for(let x=0;x<SZ;x++)if(D[(y*SZ+x)*4+3]>8){if(x<a0)a0=x;if(x>a1)a1=x;if(y<b0)b0=y;if(y>b1)b1=y}}return [a0,b0,a1,b1]};
      const canli={};
      try{
        for(const k of [...C.kinds,C.boss]){const A=ANIM[k];if(!A)continue;
          const ST=[['wander',0,0,.3],['wander',1,Math.PI/20,.3],['wander',1,0.0001,1.5],['wander',1,3*Math.PI/20,.3],['wander',1,Math.PI/10,1.5],['chase',1,Math.PI/36,.3]];
          const ds=ST.map(([st,dx,step,t])=>grab(()=>{try{drawAnimal({k,x:FX,y:FY,st,dx,dy:0,step,face:1,hp:A.hp,mad:st==='chase',flash:0,atk:0,wind:0,scale:1},t)}catch(e){}}));
          const [a0,b0,a1,b1]=box(ds);if(a1<0)continue;const w=a1-a0+1,h=b1-b0+1;const [c,g]=mk(w*6,h);
          ds.forEach((d,i)=>{const [t1,g1]=mk(SZ,SZ);g1.putImageData(d,0,0);g.drawImage(t1,a0,b0,w,h,i*w,0,w,h)});
          canli[k]={png:png(c),fw:w,fh:h,frames:6,ox:FX-a0,oy:FY-b0,top:FY-b0,shadow:0,temper:A.temper,hp:A.hp,spd:A.spd,aggro:A.aggro||0,dmg:A.dmg||0,r:A.r,reach:A.reach||26,wind:A.wind||.42,xp:A.xp,
            fly:!!A.fly,boss:!!A.boss,cs:null,night:false,still:false,landTiles:[0,1,2,3,4,5],pack:PACK[k]||null,drops:(A.drops||[]).map(d=>({n:d[0],min:d[1],max:d[2],p:d[3]})),fx:A.fx||null,ranged:A.ranged?Object.assign({},A.ranged):null,vio:A.vio||0}}
        // toplananların resmi
        for(const n of C.raw){const d=grab(()=>{try{drawNode({name:n,x:FX,y:FY,v:.2,alive:true,hp:1,id:1},0)}catch(e){}});const [a0,b0,a1,b1]=box([d]);if(a1<0)continue;
          const [c,g]=mk(a1-a0+1,b1-b0+1);const [t1,g1]=mk(SZ,SZ);g1.putImageData(d,0,0);g.drawImage(t1,a0,b0,a1-a0+1,b1-b0+1,0,0,a1-a0+1,b1-b0+1);raw[n].png=png(c);raw[n].ox=FX-a0;raw[n].oy=FY-b0}
      }finally{S=S0;dpr=D0;for(const k of KEYS){const s=saved[k];if(s)Object.defineProperty(ctx,k,s);else delete ctx[k]}}
      const L=npcLook(${'${LK}'});const [kc,kg]=mk(24,34);drawChibi(kg,12,30,L,{fx:0,fy:1});const [pc,pg]=mk(24,26);drawChibi(pg,12,29,L,{noShadow:1,fx:0,fy:1});
      return {id:C.id,ad:C.name,lv:C.lv,b:C.b,kisi:C.npc,boss:C.boss,turler:C.kinds,toplanir:raw,renk:C.col,N,T,PX:PK.x*T,PY:PK.y*T,kapi:C.door,baslangic:C.start,dip:C.deep,ag:C.e,en_dip:C.d,G,
        ic:C.cv?png(C.cv):null,tepe:SP?{png:png(SP),ax:SP.ax,ay:SP.ay}:null,canlilar:canli,kaya:{png:png(kc),ox:12,oy:30,portre:png(pc)}}})()`.replace('${LK}',LK)),[id,PAINT,LK]);
    const pre='res://art/magara/';
    if(R.ic){wpng(path.join(OUT,'art','magara',id+'_ic.png'),R.ic);R.ic=pre+id+'_ic.png'}
    if(R.tepe){wpng(path.join(OUT,'art','magara',id+'_tepe.png'),R.tepe.png);R.tepe.png=pre+id+'_tepe.png'}
    let i=0;for(const k in R.canlilar){const f=id+'_canli_'+(i++)+'.png';wpng(path.join(OUT,'art','magara',f),R.canlilar[k].png);R.canlilar[k].file=pre+f;delete R.canlilar[k].png}
    i=0;for(const n in R.toplanir){if(!R.toplanir[n].png)continue;const f=id+'_dugum_'+(i++)+'.png';wpng(path.join(OUT,'art','magara',f),R.toplanir[n].png);R.toplanir[n].png=pre+f}
    wpng(path.join(OUT,'art','magara',id+'_kisi.png'),R.kaya.png);R.kaya.png=pre+id+'_kisi.png';
    wpng(path.join(OUT,'art','magara',id+'_portre.png'),R.kaya.portre);R.kaya.portre=pre+id+'_portre.png';
    R.kaya.yan=S;
    fs.writeFileSync(path.join(OUT,'data','magara_'+id+'.json'),JSON.stringify(R));
    console.log(id,R.ad,'canlı',Object.keys(R.canlilar).map(k=>k+' '+R.canlilar[k].fw+'x'+R.canlilar[k].fh).join(', '),'toplanır',Object.keys(R.toplanir).filter(n=>R.toplanir[n].png).length+'/'+Object.keys(R.toplanir).length,'iç',!!R.ic,'tepe',!!R.tepe,'kişi',S.name);
  }
  await b.close();
})().catch(e=>{console.error(e);process.exit(1)});
