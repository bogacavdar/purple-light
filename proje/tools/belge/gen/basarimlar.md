| Başarım | Nasıl kazanılır (oyundaki metin) | Kimlik | Koşul (kod) |
|---|---|---|---|
| İlk tarif | Kazanda ilk tarifini öğren. | tarif1 | ()=>found.length>=1 |
| İlk gün | İlk günü ve geceyi hayatta atlat. | gece1 | ()=>day>=2 |
| Meraklı çırak | 25 tarif bul. | tarif25 | ()=>found.length>=25 |
| İlk av | Bir hayvan avla. | av1 | ()=>Object.keys(kills).some(k=>kills[k]>0) |
| Köprücü | Kırık köprüyü onar. | kopru | ()=>!!bridge.fixed |
| Bir hafta | 7. güne ulaş. | hafta | ()=>day>=7 |
| Sadık dost | Bir robot köpeğin olsun. | kopek | ()=>dogs.length>0 |
| Balıkçı | 10 balık tut. | balik | ()=>fishTotal>=10 |
| Tecrübeli | Seviye 10 ol. | lvl10 | ()=>lvl>=10 |
| Yardımsever | 10 yan görev bitir. | gorev10 | ()=>!!(window.__v55&&window.__v55.d.length>=10) |
| Kesesi dolu | Aynı anda 1000 sikken olsun. | zengin | ()=>coins>=1000&&!window.__plInf |
| Kazan ustası | 100 tarif bul. | tarif100 | ()=>found.length>=100 |
| Kurt avcısı | 10 kurt avla. | kurt | ()=>k_('Kurt')>=10 |
| Kâşif | Adanın yarısını keşfet. | kesif | ()=>exploredCount>=W*H*.5 |
| İz sürücü | Eşinden kalan bütün izleri bul. | iz | ()=>clues.size>=CLUES.length |
| Hatırladım | Bütün anılarını geri getir. | ani | ()=>mems.size>=MEMS.length |
| Adada bir ay | 30. güne ulaş. | ay | ()=>day>=30 |
| Ejder avcısı | Kül Diyarı'nın kara ejderini yen. | ejder | ()=>k_('Kara ejder')>0 |
| Ada efsanesi | Seviye 25 ol. | lvl25 | ()=>lvl>=25 |
| Yaşayan ansiklopedi | 250 tarif bul. | tarif250 | ()=>found.length>=250 |
| Kazazede | Denizci Barbaros'un yeni gemisini kur. | levent | ()=>!!(window.__v55&&window.__v55.d.indexOf('dz4')>=0) |
| Gökyüzüne | Gökay ile roketi fırlat. | roket | ()=>!!(window.__tuna&&window.__tuna.launched) |
| Açık deniz | Barbaros'un gemisiyle adadan ayrıl: ACT 2. | act2 | ()=>!!(window.__plDz&&window.__plDz.D.act2) |
| İlk düşüş | Bir kez öl ya da bayıl. | olum1 | ()=>deaths>=1 |
| İnatçı | 5 kez öl ya da bayıl, yine de devam et. | olum5 | ()=>deaths>=5 |
| İlk reis | Bir reis öldür. | reis1 | ()=>bossKinds()>=1 |
| Reis avcısı | 5 farklı reis öldür. | reis5 | ()=>bossKinds()>=5 |
| Reislerin korkusu | 10 farklı reis öldür. | reis10 | ()=>bossKinds()>=10 |
| Reis yiyen | 20 farklı reis öldür. | reis20 | ()=>bossKinds()>=20 |
| Bütün reisler | Oyunda öldürülebilecek bütün reisleri öldür. | reishep | ()=>{const A=allBoss();return A.length>0&&A.every(k=>(bossD()[k]\|\|0)>0)} |
| Yol açıcı | Doğu geçidindeki kayaları patlat. | kaya | ()=>typeof rockfall!=='undefined'&&!!rockfall.cleared |
| Her şeyi bilen | Bütün tarifleri bul. | tariftum | ()=>DB.R.length>0&&DB.R.every(x=>foundSet.has(x.r)) |
| Toplayıcı | İki adada yerden toplanabilen her çeşitten en az birini topla. | toplatum | ()=>{const L=allGather();return L.length>0&&L.every(n=>gotOf(n))} |
| Yeniden birlikte | Oyunu iyi sonla bitir. | iyison | ()=>false |
| Yalnız dönüş | Oyunu kötü sonla bitir. | kotuson | ()=>!!window.__plBadEnd |
| Maden kâşifi | İki adadaki her madenden en az birini kaz. | madentum | ()=>{const L=allOre();return L.length>0&&L.every(n=>gotOf(n))} |
| Oduncu | İki adadaki her ağaç türünden en az birini kes. | agactum | ()=>{const L=allTree();return L.length>0&&L.every(n=>TS.has(n))} |
| Avcıların avcısı | İki adadaki her canlı türünden en az birini öldür. | canlitum | ()=>{const L=allAnim();return L.length>0&&L.every(n=>KS.has(n))} |
| Ganimet avcısı | Canlılardan düşebilecek her eşyayı en az bir kez elde et. | dusentum | ()=>{const L=allDrop();return L.length>0&&L.every(n=>IS.has(n))} |
| Oyunlardaki gibi | Ana menüde “cheat” yazdın: hile modu açıldı. | hile | ()=>{try{return localStorage.getItem('hammadde.cheatach')==='1'\|\|localStorage.getItem('hammadde.cheatok')==='1 |
| Platin | Bütün başarımları kazan. | platin | ()=>ACH.every(a=>a[0]==='platin'\|\|got[a[0]]) |
