// Yıldızsızların piksel ızgaraları (web v330ys YSG) → data/yildizsiz.json
const fs=require('fs');
const h=fs.readFileSync(process.env.OYUN||'../proje/Hammadde_prototip.html','utf8');
const i=h.indexOf('const YSG=');if(i<0)throw 'YSG yok';
const j=h.indexOf('\n',i);const src=h.slice(i,j).replace(/^const /,'var ');
const R=new Function(src+';return [YSG,YSH]')();const Y=R[0];
const out={G:Y.G,P:Y.P,H:R[1]};
fs.writeFileSync(__dirname+'/../data/yildizsiz.json',JSON.stringify(out));
for(const k in Y.G)console.log(k,Y.G[k].length,'kare',Y.G[k][0][0].length+'x'+Y.G[k][0].length);
console.log('P',JSON.stringify(Y.P));
