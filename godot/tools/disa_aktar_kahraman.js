// Purple Light → Godot: Adım 1f-2 karakter çizimleri (web v428kahraman HD: her cinsiyet ve saç biçimi için ComfyUI çizimi + renk maskesi + yüz noktaları)
// ve karakter yaratma seçenekleri (CC renkleri, saç biçimleri, göz renkleri, varsayılanlar). Tarayıcı gerekmez: oyunun kaynağından okunur.
// Çalıştır (depo kökünden): OYUN=<html> node godot/tools/disa_aktar_kahraman.js
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const OUT=path.resolve(__dirname,'..');
const L=fs.readFileSync(GAME,'utf8').split('\n');
const line=p=>L.find(l=>l.startsWith(p));
const HD=JSON.parse(line('const HD={').slice('const HD='.length).replace(/;\s*$/,''));
const js=(p,end)=>{const l=line(p);return l.slice(p.length,l.lastIndexOf(end)+end.length)};
const ev=s=>(new Function('return '+s))();
const CC=ev(L.slice(L.findIndex(l=>l.startsWith('const CC={')),L.findIndex(l=>l.startsWith('const CC={'))+6).join('\n').replace(/^const CC=/,'').replace(/;\s*$/,''));
const HS_E=ev(js('const HS_E=',']]')),HS_K=ev(js('const HS_K=',']]'));
const EYES=ev(js('const B4EYES=',']]'));
const LOVE_M=ev(js('const LOVE_M=','}'));
const w=(f,s)=>{fs.mkdirSync(path.dirname(f),{recursive:true});fs.writeFileSync(f,s)};
const out={CW:HD.CW,CH:HD.CH,stiller:{},CC,HS_E,HS_K,EYES,LOVE_M,yanak:[236,150,150],kontur:[26,18,22]};
for(const g of ['e','k']){out.stiller[g]={};for(const s in HD[g]){const S=HD[g][s];
  for(const k of ['c','m']){const f=`${g}_${s}_${k}.png`;w(path.join(OUT,'art','kahraman',f),Buffer.from(S[k].replace(/^data:image\/png;base64,/,''),'base64'))}
  out.stiller[g][s]={c:`res://art/kahraman/${g}_${s}_c.png`,m:`res://art/kahraman/${g}_${s}_m.png`,A:S.A}}}
w(path.join(OUT,'data','kahraman.json'),JSON.stringify(out));
console.log('stiller',Object.keys(out.stiller.e),Object.keys(out.stiller.k),'göz',EYES.length);
