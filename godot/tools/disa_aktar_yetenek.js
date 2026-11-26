// Web oyunundan yetenek ağacını çıkarır: SKT (üç ağaç, 90 yetenek), SKICO (SVG yol ikonları), SKTREES (renkler), LVREQ, SKHOW.
// Kullanım (pl-godot kökünden): OYUN=/tmp/oyun_src.html node godot/tools/disa_aktar_yetenek.js
const fs=require('fs'),vm=require('vm'),path=require('path');
const src=fs.readFileSync(process.env.OYUN,'utf8');
const grab=(re)=>{const m=src.match(re);if(!m)throw new Error('yok: '+re);return m[0]};
const code=[grab(/const SKT=\{.*?\};\n/s),grab(/const SKICO=\{.*?\};\n/s),grab(/const SKTREES=\[.*?\]\];\n/s),grab(/const LVREQ=\{.*?\};/),grab(/const SKHOW=\{[\s\S]*?\n \};|const SKHOW=\{[\s\S]*?\n\};/)].join('\n');
const ctx={TOUCH:false,window:{}};vm.createContext(ctx);
vm.runInContext(code+'\nthis.__o={SKT,SKICO,SKTREES,LVREQ,SKHOW};',ctx);
const o=ctx.__o;
const out={meta:{surum:(src.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]},agaclar:o.SKTREES.map(t=>({ad:t[0],renk:t[1]})),SKT:o.SKT,ikon:o.SKICO,lvreq:o.LVREQ,nasil:o.SKHOW};
fs.writeFileSync(path.join(__dirname,'../data/yetenek.json'),JSON.stringify(out,null,1));
console.log('yetenek:',Object.values(o.SKT).reduce((t,l)=>t+l.length,0),'ikon:',Object.keys(o.SKICO).length,'nasıl:',Object.keys(o.SKHOW).length);
