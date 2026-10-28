(()=>{const rep=(k,x)=>typeof x==='function'?'fn:'+String(x).slice(0,400):(x instanceof Set?[...x]:x);
const O={};O.isle=ISLE;O.DB=DB;O.RES=RES;O.BNAME=BNAME;O.BDANGER=BDANGER;try{O.BTXT=BTXT}catch(e){}
const ns={};for(const n of nodes){const b=bioAt(n.x,n.y);(ns[n.name]=ns[n.name]||{})[b]=(ns[n.name][b]||0)+1}O.nodeStats=ns;
const ts={};for(const t of trees){const n=t.type.n,b=bioAt(t.x,t.y);(ts[n]=ts[n]||{b:{},type:t.type})['b'][b]=(ts[n].b[b]||0)+1}O.treeStats=ts;
O.ANIM=ANIM;O.EQUIP=EQUIP;O.SKILLS=SKILLS;O.QUESTS=QUESTS;O.HOUSES=HOUSES;O.GT=GT;O.POISON=POISON;O.PACK=PACK;O.MAXLV=MAXLV;
const np={};for(const k of ['npc','witch','market','smith','farmer','usta','alp','carp','toygar','durmus','denizci','wiz']){try{const o=eval(k);np[k]={name:o.name,x:Math.round(o.x),y:Math.round(o.y),bio:bioAt(o.x,o.y)}}catch(e){np[k]='-'}}O.npcs=np;
try{O.v55=window.__v55}catch(e){}try{O.I1B=window.__I1B}catch(e){}try{O.gok=window.__gok}catch(e){}
const wk={};for(const k of Object.keys(window))if(/^__/.test(k)){const v=window[k];wk[k]=typeof v}O.winKeys=wk;
return JSON.stringify(O,rep)})()
