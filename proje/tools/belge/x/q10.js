(()=>{   // mağara ve deniz avı verisi (gen.py: cave.json)
const O={};
O.caves=(window.__plCaves||[]).map(c=>({id:c.id,b:c.b,name:c.name,lv:c.lv,boss:c.boss,kinds:c.kinds,raw:c.raw}));
O.anim={};for(const c of O.caves)for(const k of c.kinds.concat([c.boss])){const D=ANIM[k];if(D)O.anim[k]={boss:!!D.boss,hp:D.hp,dmg:D.dmg,drops:(D.drops||[]).map(d=>d.slice(0,4))}}
// deniz avı bölgeleri (Poyraz'ın teknesi): blok içinde tanımlı, sayfanın kendi kaynağından okunur
O.sea=null;for(const s of document.querySelectorAll('script')){const t=s.textContent;const i=t.indexOf('const ZONES=[');if(i<0)continue;const j=t.indexOf('];',i);try{O.sea=Function('return '+t.slice(i+13-1,j+1))().map(z=>({id:z.id,n:z.n,lv:z.lv,rod:z.rod,fish:z.fish}))}catch(e){O.sea='ERR '+e.message}break}
const BELT="Börü'nün kemeri";O.belt={n:BELT,eq:EQUIP[BELT]||null,price:(typeof PRICE!=='undefined'&&PRICE[BELT])||null};
// fiyatlar (oyunun kendi fiyat tablosundan; ada 1)
O.price={};const pr=n=>{try{const v=(typeof PRICE!=='undefined'&&PRICE[n]!=null)?PRICE[n]:(DB.p&&DB.p[n]);if(v!=null)O.price[n]=v}catch(e){}};
for(const c of O.caves)for(const n of c.raw)pr(n);for(const k in O.anim)for(const d of O.anim[k].drops)pr(d[0]);if(Array.isArray(O.sea))for(const z of O.sea)for(const [n] of z.fish)pr(n);pr(BELT);
return JSON.stringify(O)})()
