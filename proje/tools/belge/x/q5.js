(()=>{const rep=(k,x)=>typeof x==='function'?'fn:'+String(x).slice(0,600):(x instanceof Set?[...x]:(x instanceof Map?[...x]:x));
const O={NQ:window.__plNQ,ACH:window.__plAch.list,LES:window.__plLES,STAFF:window.__plStaff,QUESTS:QUESTS,SEEDS:DB.seeds,CROPS:DB.crops};
try{O.CLUES=CLUES}catch(e){}try{O.MEMS=MEMS}catch(e){}try{O.EQUIP=EQUIP}catch(e){}try{O.TEMPC=TEMPC}catch(e){}
return JSON.stringify(O,rep)})()
