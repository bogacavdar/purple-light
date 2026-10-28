(()=>{const O={};const tryv=n=>{try{return eval(n)}catch(e){return null}};
for(const n of ['TREE_TIER','AXE_TIER','ORE_TIER','PICK_TIER','NODE_TIER','WDMG','RAWFOOD','HEAL','GTIME','HOUSES','PRICE_','SEEDT','GROW','CROPT'])O[n]=tryv(n);
O.I2C=window.__I2C?{plants:window.__I2C.plants,ores:window.__I2C.ores,anim:Object.fromEntries(Object.entries(window.__I2C.anim).map(([b,L])=>[b,L.map(a=>({n:a.n,pack:a.pack,cond:a.cond,want:a.want}))]))}:null;
O.I1B=window.__I1B;O.RULE=Object.fromEntries(Object.entries(RULE).map(([k,v])=>[k,[String(v[0]),v[1]]]));
return JSON.stringify(O,(k,x)=>typeof x==='function'?'fn:'+String(x).slice(0,200):x)})()
