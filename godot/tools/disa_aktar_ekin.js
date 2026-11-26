// Purple Light → Godot: Çiftçi Ekin'in görevleri (web DATA.Q, giver k_ekin; belge ACT 1 › Çiftçi Ekin).
// Çalıştır (pl-godot kökünden):  OYUN=<html> node godot/tools/disa_aktar_ekin.js   → data/ekin.json
const fs=require('fs'),path=require('path');
const ROOT=path.resolve(__dirname,'..','..');
const GAME=process.env.OYUN||path.join(ROOT,'proje','Hammadde_prototip.html');
const SRC=fs.readFileSync(GAME,'utf8');const i=SRC.indexOf('const DATA={"Q": [');const j=SRC.indexOf('\n',i);const D=JSON.parse(SRC.slice(i+11,j).replace(/;\s*$/,''));
const Q=D.Q.filter(q=>q.g==='k_ekin').map(q=>{const o={};for(const k of ['id','g','t','p','r','say','thx','c','x','rec','rew','nomat','les','sc'])if(q[k]!=null)o[k]=q[k];return o});
fs.writeFileSync(path.join(__dirname,'..','data','ekin.json'),JSON.stringify({gorevler:Q,meta:{surum:(SRC.match(/>Versiyon ([0-9.]+)<\/small>/)||[])[1]}}));
console.log('ekin görev',Q.map(q=>q.id).join(' '));
