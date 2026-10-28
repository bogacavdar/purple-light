(()=>{const m={};for(let i=0;i<W*H;i++){if(isWater(tiles[i])&&tiles[i]===4)continue;const k=BIO[i]+'/'+ZONE[i];m[k]=(m[k]||0)+1}
const wood={};for(const t of trees){wood[t.type.n]=t.type.fruit||''}
let wn=[];try{wn=Object.keys(DB.p).filter(n=>/odunu$/.test(n))}catch(e){}
return JSON.stringify({m,W,H,T,wood,wn:wn.slice(0,80),rule:Object.keys(RULE).slice(0,5).map(k=>[k,String(RULE[k][0]),RULE[k][1]]),GTIME:typeof GTIME!=='undefined'?GTIME:null})})()
