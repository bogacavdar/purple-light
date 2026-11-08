## v3.74 (8 Kasım 2026) · Kemal'in "seni hatırlıyorum" düğmesi

**Değişen yerler:** `v337meta` bloğunda `askName` sarmalı: `say(t,[{t:'…'}])` → `cnt===1?'Hatırlamıyorum…':'Ne demek istiyorsun?'`. Sürüm etiketi `Versiyon 3.74`. Belge: 20_sistemler "Seni hatırlıyorum".

**Geri alma:** düğme metnini `'…'` yap (belge satırıyla birlikte).

**Kontrol:** chk.js 0 hata.

## v3.73 (8 Kasım 2026) · sade malzeme: biyom başına tek kalas/sap/kömür/kaşık, kurutulmuş otlar ve kullanılmayan kurutulmuşlar kalktı

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v373sade">` (en sonda, `v366tarif`ten sonra çalışır): `LAND1`/`LAND2` (asıl ağaç → öbür ağaçlar), `REPL` (türe özgü kalas/sap/kömür/kaşık → asıl; ACT 2'de yalnız kalas), `HERB` (kullanılan kurutulmuş ot → taze, ×3), `FOODX` (hiçbir tarifte kullanılmayan kurutulmuşlar; `KEEPDRY` ve "tabanının tek kullanımı" koruması hariç). `DB.R`'den kalkanlar silinir, girdiler eşlenip birleşir, aynılaşan varyantlar silinir, her öbür ağaç için `C kalası (S odunu ile)` varyantı eklenir (`VO`, `PRICE_`); `REC`/`RESULTS`/`USES`/`FORGED`/`FIRE_R`/`PLACEABLE`/`ARMORSET`/`PRICE_`/`DEPTH`/`CAT_N`/`CHEAT_RES` yeniden kurulur. `window.__plSadeInfo`, `window.__plSadeMap`.
- `applyState` sarmalı: kayıt JSON'unda kalkan bir ad varsa derin yürür (sayı haritası anahtarları, dizideki adlar/[ad,...] demetleri, `{n,q}` nesneleri), FOODX eski fiyattan (`OLDP`) sikkeye; bildirim metni `s.v373t` ile sayfa yeniden yüklense de taşınır.
- Kaynakta: `v184`/`v251` usta silah sapları (Huş, Mor söğüt, Kül ağacı sapı), `v186` K1/EK6 Meşe kalası (metinler), `v55-q` gk1 Mavi mantar kalası. Sürüm etiketi `Versiyon 3.73`.

**Geri alma:** `git revert` bu commit (blok + kaynak isimleri + belge birlikte). Kayıtlar: çevrilmiş kayıtlar geri çevrilmez (eski adlar yeniden eklenirse çantada yalnızca asıl kalaslar kalır), oyun bozulmaz.

**Kontrol:** chk.js 0 hata (183 script). Denetim (eski 3.71 ↔ yeni): eşya 1505 → 1350, tarif 1105 → 982 (159 varyant), bilinmeyen girdi 0, fiyatsız 0, yeni kullanılmayan ham malzeme 0. Eski kayıt (gerçek kaydet/yükle, yeniden yükleme dahil): 3 Ladin + 1 Meşe kalası → 4 Meşe kalası, 2 Kurutulmuş kekik → 6 Kekik, Kurutulmuş geyik eti → 87 sikke, Ardıç kaşığı → Huş kaşığı, Işık ağacı sapı → Mor söğüt sapı, kitaptan Ladin kalası silindi. `Çam kalası (Kavak odunu ile)` el yapımı: 1 Çam kalası verir.

## v3.72 (8 Kasım 2026) · madenler arası mesafe

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v372maden">`: `findSpot` maden adları (`MINES`) için sarılır: en çok 25 aday, `ok()` = aynı tür ≥ 96 px, herhangi maden ≥ 48 px (canlı madenler, kendisi hariç); bulunamazsa `null` (yeniden çıkış döngüsü 3 sn sonra yeniden dener). `spread()`: kurala uymayan canlı madenleri `findSpot(name,null,n)` ile taşır (biyom korunur, eski yerden ≥ 60 px), sonra `NGR` ızgarası sıfırlanır, `PERF.visT=0`, `__plRockDirty`. `startNew` ve `restore` sonrasında bir kez çalışır. `window.__plSpread`.
- Yeni `<script id="v372sade">` (sayfa açılınca bir kez, `built` korumalı; 44 ms): başlangıç kampının 20 karosu dışında, konumdan karma (`hz`, rnd yok): temel malzemelerin (Dal, Lif, Taş, Nehir çakılı, Kum, Çakmaktaşı) %30'u silinir; bitkiler (maden, gece, mağara, öğretici, Yaprak ve temel dışındaki `RULE`'u olan düğümler) tür+biyom grubunda %75'e iner ve 3–5'lik öbeklere taşınır (öbek merkezi mevcut bir bitki; üyeler 10–28 px, `spotOk`: kural karosu, `reachAt`, aynı biyom, ağaç 9 px, maden 24 px, kişiler 34 px, `__plFloorBusy`). `KIN` (tür → düğümler); `findSpot` sarılır: bitki yeniden çıkarken 20 denemede yaşayan bir türdaşının 10–28 px yakını, olmazsa eskisi. `v365build`'de `window.__plFloorBusy` (yerinde).
- Sürüm etiketi `Versiyon 3.72`.

**Geri alma:** `v372maden` ve `v372sade` bloklarını sil, `__plFloorBusy` satırını kaldır (düğümler kayda yazılmadığı için ada bir sonraki açılışta eski haliyle kurulur).

**Kontrol:** chk.js 0 hata (179 script). Yeni oyun (554 maden, 18 tür): önce aynı tür < 40 px 10, < 64 px 25, < 96 px 69; herhangi < 40 px 22 — sonra aynı tür < 96 px 0, herhangi < 48 px 0; tür sayıları aynı. Yerleşmiş haritada ikinci `spread` 0 taşıma, 48 ms. Sade harita: toplanabilir 11.317 → 8.505; ekran başına (27×15 karo) Çayır 38 → 33, Orman 39 → 34, Bataklık 27 → 23, Kayalık Dağ 34 → 26, Kül 24 → 21, Mor Kristal 25 → 20 (temel 10 → 8, bitki 12 → 9, ağaç aynı); bitkilerin %88'inin 2 karo içinde en az 2 türdaşı var; 200 yeniden çıkışın 200'ü bir türdaşının yanında. Ekran görüntüsünde 5'li papatya öbeği.

## v3.71 (8 Kasım 2026) · leşte tek gölge, öğretici malzemeleri uygun yerde, köpek yokken R kapalı

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- `v337les` (yerinde): leş çiziminde `noShadow(()=>drawAnimal(...))`: çizim sırasında `ctx.fill`/`ctx.fillRect` örnek düzeyinde sarılır, dolgu rengi `rgba(0,0,0,.22|.25)` olan çağrılar atlanır (bütün canlı çizicilerinin ayakta gölgesi), sonra `delete` ile prototipe dönülür.
- `v345` (yerinde): `window.__plNearP(x,y)`; `pplClear` `n.tzN||n.tutN` olan düğümleri atlar.
- Yeni `<script id="v371yer">`: `tzPlace` ve `bringBerry` yeniden yazıldı: yer seçiminde kişilerin 32 px'i (`__plNearP`), `FIRES`, `camps` ve `lightSources()` (Kemal'in ateşi, ocak, kazan; eldeki meşale hariç) 26 px'i, ağaç 14 px, düğüm 12 px dışı; konan düğümlere `tzN:1` / `tutN:1`. `openMenu('dogs')` köpek yokken hiçbir şey yapmaz; `body.nodogs` sınıfı (0,5 sn'de bir) kol menüsündeki `#p-dogs` ve Kontroller'deki `[data-kb="dogs"]` satırını gizler.
- Yeni `<script id="v371el">` (yalnız `!TOUCH`): 16×16 iki şekil (`POINT`, `PALM`), kenar otomatik (dolgunun 4 komşusu, `#3a1c5c`), sağ/alt gölge, parmak ucu mor, çevresinde `rgba(160,80,255,.5/.78)` ışık (köşegende ×0,55), 2× çizilip PNG `dataURL`; CSS `body:not(.ontitle) #game` ve `body.plpalm` için `cursor:url(...) 13 2` (v3.32'nin nişangâh kuralını ezer; menü okları aynı). `cv` üstünde `mousemove` (80 ms'de bir) ve 250 ms'de bir `pickAt` → `tg` var ve su değilse `plpalm`. `window.__plHand`.
- Sürüm etiketi `Versiyon 3.71`.

**Geri alma:** `v371el` ve `v371yer` bloklarını sil; `v337les`'te `noShadow` sarmasını, `v345`'te `__plNearP` ve `pplClear`'daki `tzN/tutN` koşulunu geri al.

**Kontrol:** chk.js 0 hata (177 script). Duman denemesi: 30 × 5 öğretici böğürtleni, kişilere en yakın 33 px, ateş/ışığa en yakın 26 px; köpeksiz R → pencere açılmadı, `nodogs` var; köpek gelince R → köpekler penceresi; Geyik leşinin ekran görüntüsünde tek gölge. İmleç: Kemal'in üstünde `plpalm` açık, boş zeminde kapalı; iki imleç büyütülmüş ve gerçek boyutta (yeşil ve koyu zeminde) görüntüyle bakıldı. Sayfa hatası yok.

## v3.70 (8 Kasım 2026) · hava–mevsim mantığı: sıcaklık, hava zinciri, yağmur/kar, yerde kar örtüsü

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v370hava">`: `temp()` = 11,5 + 15·cos(2π(yılın günü−11)/28) + gün farkı (gün numarasından karma, −3…+3) + saat (05:00 −4°, 14:00 +4°, kosinüs) + biyom (`LAND`, ISLE'ye göre). `snowing()` = `raining()` && !`ashStorm()` && T ≤ 0,5 (karken 1°'ye kadar kar kalır). `nextWeather` yeniden yazıldı: zincir (`açık/bulut/yağmur/fırtına/sis`), mevsime göre `P` (bulut→yağış), `ST` (fırtına payı), `DUR` (süreler); sis sabah ×3, zone 1'de ×2. `tickWeather` sarılır: kar örtüsü `C` (kar +0,003/sn, tipi +0,006; T > 0,5'te −T·0,00025/sn, yağmurda ×4, gündüz açıkta ×1,5), tipide `thunderAt ≥ 3`. `drawGround` sarılır: 16×16 karelik parça tuvalleri (`SC`, en çok 24, LRU), örtü %1 değişince yeniden boyanır (karede en çok 2), GPU yolu için `canvas.__v++`; değerler `NF` (Float32, kare başına `vnoise/5`·0,8 + `vnH`·0,2) ve `NS` (Uint8, yarım kare başına + titreşim) önbellekte. Kayıt alanı `hava:{kar}`. `window.__plTemp/__plSnowing/__plTempStr/__plSnowCover`.
- `v369mevsim` içinde: kendi `nextWeather`'ı silindi; `renderClock` ikinci satır `#clockms` (mevsim · sıcaklık; `#clock` `flex-wrap`, `width:max-content`), Kar/Tipi adı `__plSnowing`'e göre; `drawWeather` yağmur→kar değişimi ve kar tanesi çizimi mevsime değil `__plSnowing`'e bağlı.
- Sürüm etiketi `Versiyon 3.70`.

**Geri alma:** `v370hava` bloğunu sil ve `v369mevsim`'i v3.69 commit'indeki haline döndür (ya da `git checkout v3.69'un commit'i -- proje/Hammadde_prototip.html index.html`). Kayıttaki `hava` alanı eski sürümde okunmaz.

**Ölçüm:** `tests/olcum.js` (CPU ×4, ekran kartı açık, ilkbahar 1. gün, kar yok) iki sıralı tur: eski (v3.69) 153,5/154,7 · 170,6/161,0; yeni 158,7/148,3 · 139,6/136,7 ms (kumsal/yürüme) — gürültü içinde. Sayfa içi: `drawGround` 60×36 kare, örtüsüz 0,13–0,22 ms; %36 örtü 0,40 ms; tam örtü 0,44 ms (parça önbelleğinden önce %36 örtüde 0,72 ms idi). Telefonda ölçülmedi ("deneme").

**Kontrol:** chk.js 0 hata (176 script), `?.` 1 / `??` 7. Duman denemesi (sayfa hatası yok): sıcaklık eğrisi (1. gün 14:00 4,5° / 05:00 −3,5°; 11. gün 33,3°; 25. gün −3,3° / −11,3°), 25. gün yağmur → kar, saat "Kar" + "Kış · −7°", 100 sn karda örtü 0,30, 9,2°'lik yağmurda 30 sn'de 1,00 → 0,72; zincir 3000 adım: yazın yağış/fırtına 165/82 kez, ort. 76/68 sn; kışın 655/184 kez, ort. 227/133 sn. Ekran görüntüleri: %30 örtüde öbekler, tam örtüde beyaz zemin; saat masaüstünde ve telefonda (844×390) sığıyor.

## v3.69 (8 Kasım 2026) · mevsimler (28 günlük yıl, iki ada), Mor gece

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v369mevsim">` (dosya sonu): `season()` = ((gün−1) mod 28) / 7; `window.__plSeason/__plSeasonName/__plMorGece`. Sarılanlar: `tickClock` (gece 20:00–06:00 arasında dt × 150 / [150,108,150,210], Mor gecede 240), `tickHunger` (kışın düşüşe +%25), `renderClock` (sona " · Mevsim", kışın Yağmur→Kar, Fırtına→Tipi), `dayBanner` (her 7 günde bir 06:00'da `announce`), `tickGather` + `dropItem` (toplama sırasında `__plEatCat` sınıfına göre: kış Meyveler yok, sonbahar ağaç meyvesi ×2 ve Mantarlar %50 +1, yaz Meyveler %50 +1, ilkbahar Otlar %50 +1), `drawWeather` (kışın yağış sırasında `weather.k` geçici 'bulut' → yağmur çizgisi yok; sonra `fx`: renk, kar/yaprak/çiçek; PERF.lvl ≥ 3'te yalnız kar), `snapshot/restore/startNew` (kayıt alanı `mevsim:{mg}`). `nextWeather` yeniden yazıldı (mevsim ağırlıkları; ipucu metinleri aynı, kışta Kar/Tipi). Mevsim balığı: `FISHT` içindeki her `[ad,ağırlık]` çiftine `_b` (ilk ağırlık) yazılır, mevsim değişince ×2.
- Yerinde: `v330`'daki `window.__plYS`'e `S`, `busy()`, `go()` (Mor gece saldırısı `waitNow`/`sheltered` değilse `start`). `v368alet` Sapan meyvesi: kışın yok, sonbaharda 2.
- Sürüm etiketi `Versiyon 3.69`.

**Geri alma:** `v369mevsim` bloğunu sil; `__plYS` satırındaki `S,busy,go` ve `v368alet`'teki iki mevsim ifadesini geri al. Kayıttaki `mevsim` alanı eski sürümde okunmaz.

**Ölçüm (`tests/olcum.js`, CPU ×4, ekran kartı açık; kare süresi ms, eski = v3.68):** üç sıralı tur: eski 161,3/136,7 · 106,9/107,7 · 155,0/135,9; yeni 161,6/136,9 · 147,2/145,6 · 152,2/141,7 (kumsal/yürüme ortalaması). İki turda eşit, bir turda eskinin sıra dışı hızlı ölçümü; fark ölçüm gürültüsü içinde. Ayrıca sayfa içinde `fx` tek çağrısı 0,011 ms (ilkbahar), 0,079 ms (kar), `renderClock` 0,0005 ms. JS profilinde yeni fonksiyonlar ilk 40'ta yok. (Telefonda ölçülmedi; "deneme" sayılır.)

**Kontrol:** chk.js prototip 0 hata (175 script), index 0 hata; `?.` 1 / `??` 7. `?debug` duman denemesi (sayfa hatası yok): 1/8/15/22. günde saat yazısı ve mevsim, kışta "Kar", gece hızı kış/yaz 2,86/5,56 (oran 1,94 = 210/108), tokluk kış/yaz 1,736/1,389 (×1,25), mevsim balığı ağırlıkları (ilkbahar Alabalık 56, kış Mersin 44), Mor gece tetiği (Kemal'in kampında güvenli yer olduğu için saldırı beklemede, belgedeki gibi). v3.68 duman denemesi yeniden temiz.

## v3.68 (8 Kasım 2026) · erişilebilirlik (renk körü modu, kalp atışı göstergesi), Sapan/Bola/kısa yaylar, Kupa panosu, kıyıya vuran mektuplar, anı başarımları, köpek günlüğü

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v368erisim">`: Ayarlar'a `cbmon` (Renk körü modu, `settings.cbm`) ve `hbvon` (Kalp atışını ekranda göster, `settings.hbv`) satırları Titreşim'in üstüne; `body.cbm` CSS'i (inline `color:#8fd46b/#9fe08a/#ff8a6a/#ff6a5a/#f2d070` öznitelik seçicileri + ilgili sınıflar, `ul.book small span` önüne ✓ ✗ +); `#hbpulse` kenar nabzı (yalnız `opacity` animasyonu), `__plKlon` ile kalp atışının saatini izler.
- Yerinde: inşa gölgesi renkleri `window.__cbG/__cbR/__cbGa/__cbRa` ile değişir (satır ~5479 dünyadaki gölge, ~10425/10427 ev içi, ~21941 zemin/duvar).
- Yeni `<script id="v368kopek">`: `faint`, `nightDeath`, `snapshot`, `restore`, `startNew` sarılır; `#achcard` gözlenir; 2 sn'de bir Reis (`__p4.s.bd`), anı (`mems`) ve tanrı modu karşılaştırılır. Kayıt alanı `dlog:{e:[[gün,saat,tür,metin]…≤300],c:{tür:sayı}}`. `window.__plDogLog(k,x)`, `__plDogLogGet()`.
- Başarımlar (`ACH`, `PROG` yerinde): `ani1`, `ani11`, `ani22` (gizli değil); `v318story`'de `window.__plA1I=A1I` (ACT 1 anı indeksleri).
- Arena `KINDS`'a `['sling','Fırlatma']` (yerinde).
- Yeni `<script id="v368alet">`: Sapan/Bola `GT.kind='sling'`; `attack` sarılır (taş/bola mermisi `__plFire` ile; Sapan + meyve ağacı: `treesNear`, ağaç başına `t._sapD=day`); `tickAnimals`/`drawAnimal` sarılır (`a._bola` 5 sn %35 hız, halka). Dişbudak/Porsuk yayı `__plBow.addBow` + `GT.kind='bow'` + `FORGED`.
- `v56-room`'da `window.__plDEC=DEC;window.__plDECSET=DECSET` (yerinde). Yeni `<script id="v368kupa">`: `DEC['Kupa panosu']` (3×1 duvar, `k:'trophy'`), tarif (`c:'Ev eşyası'`, kazanda öğrenilir, Sinan yapar), fiyat tarif kuralıyla (`CM(depthOf)`) = 896, simge.
- Yeni `<script id="v368sise">`: `Şişedeki mektup` (fiyat 5, simge); fırtına dinince %60 kıyıya `dropItem`; alınınca okunur; kayıt alanı `sise:{f:[id…],o:gün}`; `renderPpl` sarılır (Kitap › Ada halkı altında mektuplar). `window.__plSise={wash,found}`.
- Sürüm etiketi `Versiyon 3.68`. Bekleyen-paket'teki `yayinla.sh` sürüm satırı değişikliği de bu pakette.

**Geri alma:** beş yeni bloğu (`v368erisim`, `v368kopek`, `v368alet`, `v368kupa`, `v368sise`) sil; yerinde değişenler: `ACH`/`PROG` üç satırı, `__plA1I`, `__plDEC/__plDECSET`, `KINDS` Fırlatma, dört inşa gölgesi `window.__cb*` ifadesi. Kayıt alanları `dlog`, `sise` eski sürümde okunmaz ve zarar vermez. `settings.cbm/hbv` cihazda kalır, etkisizdir.

**Kontrol:** chk.js prototip 0 hata (174 script), index 0 hata; `?.` 1 / `??` 7 (aynı). `?debug` duman denemesi (Playwright, sayfa hatası ve `__hamErr` yok): ayar satırları ve `body.cbm`, nabız sınıfı, Sapan taş harcar ve mermi çıkar, Bola harcanmaz, Dişbudak yayı ok atar (cd 0,5), `snapshot().dlog`, bayılma sayacı, 22 ACT 1 anı indeksi, Kupa panosu fiyat 896 + simge + Sinan tarifi, şişe kıyıya düşer → okunur → `sise.f` + Kitap bölümü + günlük. `tests/v48_bugs.js` eski sürümde de aynı yerde düşüyor (`recipes3.json` farkı, açılış akışı), çalıştırılamadı. Lamba değişikliği denendi ve Boğaç'ın isteğiyle geri alındı (lambalar süs).

## v3.67 (8 Kasım 2026) · etkili ok fiyatı, karyola 738, CB2 300, varyantlarda uç/boya, kazanda her tarif, Kamış ok gövdesi kalktı, Deneyerek bul adetli

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- `v366ok`: etkili okları "ok başı fark kadar kaydır" satırı silindi; yerine 21 etkili ok belge kuralıyla (ok + yağ/10) × 1,1 bugünkü ok ve yağ fiyatından yeniden hesaplanır (`PRICE_`=`DB.p`). Kök sebep: v311price ve v335food'daki fark yayma (rd) "10 Ok + yağ → 10 etkili ok" tarifinde okun farkını 10 ile çarpıp çıktının 10 adedine bölmüyordu; rd'den sonraki tek yerde formülle kurulduğu için o farklar artık sonuca girmiyor.
- `v366boya`: kural fiyatı eski fiyatın altındaysa yeni fiyat = eski + boya × CM(derinlik) (karyola 475 + 210 × 1,25 = 738; ustaPrice 148). Öbür 10 eşya değişmedi.
- `v366tarif` TARIF_EK JSON (ve `/home/claude/TARIF_EK_v3.66.json`): Bakır/Tunç/Demir ok varyantlarına uç, karyola varyantına boya; ok satırlarının `q`'su asıl adetle eşit (11/18/10/10/10/11/10); "Bazalt pulu (Kamış ok gövdesi ile)" satırı silindi → 145 satır, 127 varyant.
- `db` JSON: `Kamış ok gövdesi` tarifi ve fiyatı silindi; `Kemik ok ucu` `t:[]`. CB2 (`DATA.Q`) `c:80 → 300`.
- `drawIcon`: `Kamış ok gövdesi` dalı silindi.
- `renderPot` (satır ~3679): kazan listesindeki `!PLACEABLE.has(x.r)` → `!(FG&&PLACEABLE.has(x.r))` (yapılar kazanda listelenir, örste değil).
- `v365build`: `CATS`'a 'İnşa' eklenir (CATS oyun açılırken DB'den kurulduğu için 'İnşa' grubu kazanda ve kitapta hiç çizilmiyordu).
- `TRIAL_MAX` 6 → 7.
- Yeni `<script id="v367fix">` (dosya sonu): (1) eski kayıt çevirisi: `applyState` sarılır, kayıttaki her `Kamış ok gövdesi` sayısı (herhangi bir sayı haritası, `{n,q}` eşyası) 3 Kamış + 1 İp olur, ad listelerinden (found/seen/order…) düşer; (2) Deneyerek bul adetleri: `trialAdd`/`renderTrial`/`judgeTrial` sarılır, kazandaki malzemeye dokunmak adedi artırır (capture dinleyicisi), aynı tür kümeli tariflerde yer (kazan/örs) + adet ile seçilir, yoksa `multi:N` ("Birden çok") cevabı; birebir aynı tarifler `twin:A|B` ile birlikte öğrenilir (`TRIAL_TXT.twin` öğretir, XP verir, kazanı boşaltır); `window.__plTrialQ` (adetler, denetim için).
- Sürüm etiketi `Versiyon 3.67`.

**Geri alma:** `v367fix` bloğunu sil; `v366ok`/`v366boya` satırlarını, TARIF_EK JSON'u, `db` JSON'daki Kamış ok gövdesi + Kemik ok ucu alet + CB2 `c`'yi, `renderPot` filtresini, `CATS` satırını, `TRIAL_MAX`'ı ve ikon dalını v3.66 commit'inden geri al (`git checkout <v3.66> -- proje/Hammadde_prototip.html index.html` + belge parts). Kayıt alanı eklenmedi, MAPV değişmedi. Not: geri alınırsa eski kayda çevrilmiş gövdeler Kamış + İp olarak kalır (zararsız).

**Denetim (headless, `?debug`, `__ham.ev`):**
- Kazan: 1104/1104 tarif kazan listesinde (ACT 1 ve ACT 2 kazanları aynı `renderPot`'u kullanıyor; kazan tarifi bir sette süzmüyor, ACT 2 tarifleri ve varyantları Yıldız'ın kazanında da listede). Önce 40 eksikti (33 yapı + 7 İnşa). Ağıl, Kerpiç ev (Beyaz tuğla ile), Toprak yol kazanda öğrenildi.
- Deneyerek bul (zor mod, her tarif kendi adetleriyle ve kendi yerinde denendi, aletler var sayıldı): **1104/1104 bulunuyor**. Malzeme türü, adedi ve yeri birebir aynı 5 çift (Öğütme taşı = Bileği taşı; Bakır/Çelik/Kara çelik/Mor kristal balta = topuz) `twin:` cevabıyla birlikte bulunur, ikisi de `learned`'e girer, her biri +5 XP (Bakır çifti sınandı: +10 XP, ikisi öğrenildi). Tarifler değişmedi. Not: belge Bileği taşını Örs'te gösteriyor, kod ikisini de örs dışı sayıyor (ayrı uyumsuzluk, dokunulmadı).
- Varyantların malzeme türü kümesi çakışması: 0. Eski tariflerde tür kümesi çakışan 14 grup adetle ayrılıyor (yukarıdaki 5 çift hariç).
- Fiyatsız eşya 0 · elde edilemeyen girdi 0 · kullanılmayan malzeme: v3.66 ile aynı sayı (aynı ölçümle 69 yenmez + 38 yenir ham; Analist'in 78 + 3 yem listesini ben üretmedim, fark yok); Kamış 3 tarifte (Kamış hasır, Kamış flüt, Kamış çizme).
- Etkili ok fiyatları 21/21 `etkili_fiyat.json` ile eşit (`PRICE_` ve `DB.p`); Ahşap karyola 738, işçilik 148; Kemik ok ucu `t:[]`, fiyat 11 (db `p` statik, alet payı yoktu).
- Varyant ok yapımı: Tunç ok (Yaban kazı tüyü ile) 10 ok, Bakır ok (Bıldırcın tüyü ile) 18 ok, uç harcanıyor.
- Eski kayıt çevirisi: dönüşüm fonksiyonu ayrıca node'da sınandı (çanta 4 gövde + 1 Kamış → 13 Kamış + 4 İp; sandık, yer `{n,q}`, köpek sırtı, found/order listeleri). Oyun içinde `applyState` ile yükleme sınanamadı: headless'ta `applyState(snapshot)` HEAD (v3.66) dahil envanteri hiç yüklemiyor (test ortamı sorunu, bu sürümle ilgisiz).
- chk.js: prototip 0 hata (169 script), index 0 hata; `?.` 1 / `??` 7 (eskisiyle aynı). Sayfa hatası yok.
- Not: `proje/recipes3.json` v2.73'ten beri `db` ile eşit değil (dokunulmadı; v48_bugs'ın "in-file DB equals recipes3.json" denetimi bu yüzden zaten düşüyor).

## v3.66 (8 Kasım 2026) · her malzeme bir tarifte: 128 varyant tarif, ok uçları oklarda, boyalar ev eşyalarında

- Boğaç kararları (8 Kasım): fiyatsız eşya ve kullanılmayan malzeme kritik, elde edilemeyen girdi büyük hata (CLAUDE.md + belge Giriş › Kural); 149 kullanılmayan malzemenin her birine ayrı tarif (grup değil); ok uçları oklara; boyalar ev eşyalarına. Denetim: /home/claude/FIYAT_TARIF_DENETIM_v3.65.md (fiyatsız 0, elde edilemeyen girdi 0, kullanılmayan 149 → 146 tarifte; Sülük yemi, Duman fişeği, Yıldız tozu yemi sınırda: av aracı/yem).
- Bloklar (dosya sonu, sıra önemli): `v366ok` (Yazılımcı B: 7 ok tarifine kendi ucu, adetler Basit 11/Bakır 18/Mor kristal 11, ok ve etkili ok fiyatları PRICE_/DB.p; `window.__plOkVar` yalnız bilgi), `v366boya` (Yazılımcı C: 11 boya 11 tarifte, fiyat max(priceOf, eski), Usta işçiliği fiyattan), `v366tarif` (Yazılımcı A: varyant tarif düzeneği; kimlik "Çıktı (Malzeme ile)", gain/icon/PRICE_/qc/USES sarmalı; JSON `/*TARIF_EK*/…/*SON*/` arasında gömülü, kaynak /home/claude/TARIF_EK_v3.66.json; Yönetici: __plOkVar atlama koşulu kaldırıldı, Bazalt varyantı q=10).
- Kayıt: yeni alan yok; öğrenilen varyantlar `found` içinde kimliğiyle. MAPV değişmedi.
- Doğrulama: chk.js 0 hata; headless: JSON'daki 146 malzemenin hepsi DB.R girdisinde, fiyatsız eşya 0, konsolda v366 uyarısı yok; A: varyant yapılınca asıl çıktı geliyor, fiyat/resim aynı, kayıtta kalıyor; B: uçsuz ok yapılmıyor; C: Usta siparişiyle boya harcanıyor.
- Açık (Boğaç'a, denge): etkili okların fiyatı normal okun ~10 katı (eski fark yayması); Basit ok artık Kemik ok ucu → Çekiç taşına (Dursun'un örsü) bağlı; Ahşap karyola 475'te tutuldu (priceOf 383).
- Geri alma: üç bloğu silmek; belgede 80_tarifler (ok, ev eşyası satırları, Varyant tarifler bölümü), 85_aletler ok tablosu, 90_esyalar fiyatları, 00_giris kural satırı birlikte geri alınır.

## v3.65 (8 Kasım 2026) · üs kurma 1. aşama (İnşa kipi, ızgara, çit/duvar/kapı, kırma/onarım, avlu, Direk feneri) ve oyun süresi

- **Yeni blok `v365build`** (dosya sonuna yakın; kaynak taslağı `/tmp/kol_dev/buildblock.js`):
  - `BP` parça tablosu (g: 0 zemin / 1 çit katmanı, k: tür, cls: kırılma sınıfı, hp, mat), `G0`/`G1`/`YARD` `Uint8Array(W*H)`, `HP` Map (yalnız hasarlı), `LAMPS` Map `{f,on}`; sınırlar `LIM0` 2000 / `LIM1` 600 / `LIML` 24. `G1` bitleri: tür (alt), `BROKE` 64, `TURN` 128.
  - Tarifler `addRec` (İnşa; Direk feneri Yapılar, Sinan), `YLD` (yol/parke 4, Dal çit/Çit 2) `handCraft` sarmalı; `PLACEABLE`'dan Çit çıktı, Direk feneri girdi. Fiyat `priceOf` sarmalı (zincir ×1,3, verim bölünür) → `window.__plBuildPrices`.
  - Hareket: `blocked` sarmalı (duvar katı, kapı yalnız yabani canlıya), `moveA` sarmalı (Dal çit ×0,35, kovalarken itme → `hitPart`), `tickAnimals` sarmalı (duvardan geçen her hareketi `crosses()` ile geri alır — atılma/çekme yollarını da kapatır; avlu içinde yeni doğanı siler), `biteHit` sarmalı (duvar arkasından ısırma yok).
  - Kırma: `MID`/`STRONG` setleri, `clsOf`, `hitPart` (1,2 sn bekleme, hasar /2, kırılınca `BROKE`, malzeme düşer, `yardCalc`). Onarım `repair(i)` (XTRA "Onar: …", 1 Dal/Taş), yakıt XTRA "Fenere yakıt koy".
  - `yardCalc`: 2–4 türlerinin 8 komşulu bileşenleri, kutu ≤64, taşma doldurma.
  - `findSpot` sarmalı (dolu karo yok), `clearTile` (düğüm silinir, kütük `cd=1e9`), `STAT.move` sarmalı (yol ×1,15), `lightSources` / `drawV46Map` sarmalları (yanan fener).
  - `why(i,p)` yasakları, `put/take/paint`, İnşa kipi `B` (`#buildui` şerit, `.bmenu`), fare/dokunmatik pointer yakalayıcıları, N/Esc/R, kol API'si `B.padMove/padPut/padDel/padRot/padBack`.
  - Çizim: `drawGround` (zemin), `v46Ents` (duvar/fener varlıkları), `drawV46World` (ızgara + gölge, GL'de `px()` dolgu).
  - Resimler: yerel `P1I` + `icon` sarmalı (`window.__p1k`); önbellek yalnız kendi adlarımız için silinir. Çit simgesi çit olarak yeniden çizildi.
  - Kayıt: `s.bld={f,w,hp,l}` (base36 farklı sıkıştırma); `applyState` sarmalı `load()` + `migrate()` (eski kurulu Çit → ızgara); `resetState` temizler.
  - Test kancaları: `window.__plBuild` (`count/at/ti/spr/hit/put`), `window.__plBuilt(n)`, `window.__plBreakClass`.
- **Başka bloklardaki değişiklikler:** `v345` `window.__plPpl`; `KB`'ye `build` (N), harita işareti `mark` N → T; K3 `les:"insa"` + `LES.insa` (3 adım); görev `place` denetimi `__plBuilt`; `PADL.build`; `v320pad`: Kol menüsünde dışarıda "İnşa" (evde Döşe), `layer()` `#buildui`, `firstFocus`, imleç dalı (D-pad/RS, A/X/Y/B, Start); kol yardım satırı.
- **Oyun süresi (Yönetici, blok `v365sure`, dosya sonu):** kayıt alanı `pt:{a,m}` (sn). Sayaç `setInterval` 1 sn, adım ≤2 sn; menü = `paused||craftOpen||` görünen `.ov/#craft/[role=dialog]` (dlg, title, creator hariç); `onTitle`, `document.hidden`, `#ldscr` görünürken sayılmaz. İstatistik kartı `renderCraft` sarmalıyla, oyun sonu "Süre" MutationObserver ile. Denendi: `__plTime()` → aktif 5/menü 6 sn, kayıt/yükleme, eski kayıt (`playTime` 500 → aktif 500).
- **Fiyatlar (belgedeki "~" kesinleşti):** Toprak yol 1, Çakıl yol 2, Ahşap parke 10, Dal çit 4, Çit 82, Taş duvar 8, Tahta kapı 228, Direk feneri 209, Ağıl 1.107.
- **Ölçüm** (`/tmp/olcum364/olcum.js`, CPU×4, ekran kartı açık, iki koşu; v3.64 tabanı Yönetici):
  - v3.64: BOOT JS 12.571 / 15.597 ms · PLAY 10 sn JS 3.228 / 3.711 ms.
  - v3.65: BOOT JS 14.233 / 14.432 ms · PLAY 10 sn JS 3.078 / 3.474 ms. Hata yok. Fark gürültü içinde.
  - Dolu kayıt (2.000 zemin + 600 çit, kısmasız): kare süresi boş haline göre artmadı; kayıt 86 ms, `bld` 5.293 karakter.
- **Denendi** (klavye/fare, sahte Xbox kolu, dokunmatik PointerEvent):
  - Koyma, boyama, menü (Taşı/Geri al/Döndür), halka avlu (12 karo), kayıt/yükleme, eski Çit taşıma.
  - Kurt: çit önünde kalıyor, çite vuruyor (5,5/vuruş), oyuncuya değmiyor; hasar 110 ile kırdı → avlu açıldı, Dal düştü; F onarım → Dal −1, avlu geri.
  - Tahta kapı: kurt kapının önünde kaldı (2,9 karo), oyuncu kapıdan geçti. Dal çit: kurt 1,4 karo/sn (açıkta 3,6 → ×0,39).
  - Fener: gece yandı, ışık `litAt` doğru, sabah söndü; F ile yakıt (Hayvan yağı 40→39). Yol: `speedMult` 1 → 1,15.
  - Kol: Kol menüsü "İnşa" → şerit → Çit → A + RS boyama (4), X sil, B geri, B kapat. Dokunmatik: dokun koy, sürükle boya, basılı tut menü.
- **Geri almak için:** v3.65 commit'ini `git revert` (prototip, index.html, belge parçaları, notlar). Yeni kayıt alanları `bld` ve `pt`; eski sürüm bunları yok sayar (kurulu yapılar ve İnşa ile yapılan eşyalar kaybolur, eski Çit'ler taşındığı için geri gelmez). MAPV değişmedi.

## v3.64 (8 Kasım 2026) · Testçi v3.62 raporu (KOL-40…52) ve üç ham fiyat

- **`v320pad`:**
  - `firstFocus` önce kendisi `.pulse` olan düğmeyi seçer. `keepFocus` açılıştan sonra 700 ms içinde gelen `.pulse`'a geçer (`P.ffT`/`P.ffL`; oyuncu yön verince biter).
  - `moveFocus`: koni boşsa o yöndeki en yakın (`along+perp×3`).
  - `reveal`: şerit listenin içinde olmasa da listeyi kaydırır.
  - `winStep` (select) → `P.lastK=''`.
  - Kazanda / örste X = `#pfill`.
  - `askConfirm(q,yes,btn)` (`askQuit` buna dayanır); `#p-quit` onaylı.
  - Ekran klavyesi `kbShow(inp)`/`kbIn` ile her kutuya yazar. Hile paneli `#cheatpad` içinde odak varken pencere sayılır (`focusables`'ta search kutusu orada var). Kol menüsünde `p-cheat`.
- **`kTxt` (kolda):** ` tıkla ya da yanında ` → ` gidip `; `N tuşuna bas` → `LB / RB ile kemerde ona gel`; `N tuşuyla`, `1–0 tuşlarıyla` → `LB / RB ile`.
- **`beltHow` kolda:** çanta, seç (A), yanıp sönen yuvada A.
- **Ders yazıları:**
  - El yapımı `(L)` kolda yok.
  - Zümrüt'ün iki `<b>Tab</b>`'ı `kc`'ye çevrildi (`kTxt` görür).
  - Meşale yak kartı kolda "basılı tutunca".
- **`v181`:**
  - `treeAsk` ve Börü konuşması kolda "Start → Yetenekler".
  - `window.__plDLCard()` → `tzCard` 11 (Atılma / Savuşturma n/4 / Yetenek ağacı); `startLesson`, `strikeDone`, `treeAsk`, `done2` `renderTut` çağırır.
  - `snapshot` sarmalı: süren atılma dersinde (`!DL.hadS1`) S1 kayda girmez (KOL-50).
- **Fiyat (`v335food` sonu):** `CAP` Yabani bal 12, Ateş biberi 52, Işık mantarı 90 (yemek kademesi çarpanı ham fiyatı bant dışına itiyordu). Fark ×1,3 zincirle tariflere yayılır. Değişen tarifler (3.63 → 3.64):
  - Balmumu 87→86, Balmumu mumu 134→133, Bal şerbeti 24→23, Ballı kestane 249→248, Ballı fındık 122→121.
  - Arı kovanı 145→144, Ballı ekmek 150→149, Ateş çiçeği balı 69→68, Bal şarabı 121→120, Asma fener 269→268.
  - Ay elması reçeli 574→573, Acı biber ezmesi 402→324, Ay otu iksiri 698→655, Işık mantarı çorbası 537→408.
- **Denendi** (sahte Xbox kolu):
  - Çanta ilk eşyada açılıyor; yanıp sönen eşyaya geçiyor (150 ms sonra yanıp sönse de).
  - Ayaklar yuvasından ↓ ile eşyaya iniliyor.
  - Kol menüsü → Ana menüye dön → onay (Vazgeç seçili), B kapatıyor.
  - Hile paneli: arama → klavye "taş" → Options → ilk sonuç → A → Taş 3→13 → B ile çıkış.
  - `kTxt` örnekleri.
  - Kazanda X ve Börü kartı aşamaları oyunda görülmedi (öğretici kilidi; kod).
- **Geri almak için:** v3.64 commit'ini `git revert` (prototip, index.html, notlar). Kayıt alanı ve MAPV değişmedi.

## v3.63 (7 Kasım 2026) · ateşte pişirme: 129 ateş yemeği El yapımından çıktı, her ateşte pişirme menüsü

- **Liste:** ana betikte `FIRE_R` (belge `80_tarifler.md` "Ateşte (pişirme menüsü)" sütunundaki 129 ad; ² dipnot işaretleri atıldı; hepsi oyunda `REC`'te var) ve `FIRE_FREE` (Ateş, Duman).
  - `handList`, `handSub`, `b3HandOK`, `b3subOK` ateş yemeklerini dışarıda bırakır: El yapımında görünmez, başka bir tarifin ara malzemesi olarak elle de yapılmaz, izlenen tarif çubuğunda "Yap" çıkmaz.
  - Kazanda öğrenme değişmedi.
- **Blok `v363fire`** (`v258b`'den sonra):
  - `openFire(F,kind)`: `#craft` penceresinde `mode='fire'`. `renderCraft` ve `renderTools` sarılı; `closeCraft` `FO`'yu sıfırlar.
  - `renderFire`: kamp ateşinde süre ve "Odun at", pişen yemek ve ilerleme çubuğu (`#fireprog`), közleme satırları (`KOZ`) ve öğrenilmiş ateş yemekleri. Liste `.book.hand` ve `.rr.hq` biçiminde (Yap · ×5 · Hepsi).
  - `enqueue` malzemeyi istekte düşer (Ateş/Duman hariç), `F.cq`'ya yazar.
  - 100 ms'lik `setInterval` (kare döngüsü değil; duraklatmada durur): 3 sn'de bir `finishOne`. Tarifte `gain`, `qc`, `v47Craft` (düşülen malzemeyle), `found/foundSet`, XP 12/2, `tzMade`; közlemede XP 1; `dstat.cook`; kamp ateşinden 4 sn. Kamp ateşi sönerse `refund`.
  - `snapshot` sarılı: kayıtta ateşteki sıra hemen biter (sıra kaydedilmez).
  - `drawFireAt` sarılı: pişen ateşin üstünde çubuk (`ACTIVE` boşken tek bir boyut denetimi).
  - `window.__plFireAny` / `__plOpenFire`.
- **Eski közleme pencereleri kaldırıldı:** ana betikte `talkCamp` artık menüyü açar, `cookAll` silindi. `v258b`'de `cookAt` menüyü açar (yapılacak bir şey yoksa eski "Çiğ et ya da balık getirirsen…" bildirimi). `XTRA` etiketi "Ateşte pişir"; `on`, tıklama ve `interact` koşulu `cookAny()` (çiğ yiyecek ya da yapılabilir ateş yemeği). F önceliği değişmedi.
- **Kol:** `v320pad` `firstFocus` `mode==='fire'` → ilk açık `[data-fk]`. Pencere kapanınca `P.lastL` sıfırlanır (aynı pencere yeniden açılınca yine ilk kullanılabilir şeyde başlar; önceden Kapat'ta kalıyordu).
- **Denendi** (Playwright, klavye F ve sahte Xbox kolu):
  - Kamp ateşi + F → menü.
  - Közlenmiş tavşan eti ×1 ve Kavrulmuş fındık ×5 sıraya girdi; oyuncu 200 px uzaklaştı; 19,5 sn sonra 1 + 5 çantada.
  - Ateş 1 → 1 (harcanmadı); kamp ateşi süresi düştü.
  - Kişi ateşinde (Kemal'in) kolla A → menü "Yap"ta açıldı. İstiridye çorbası (çiğ yiyecek yokken) 3,5 sn'de çantada.
  - Ateş yemeklerinin hiçbiri El yapımında yok.
- **Ölçüm** (`olcum.js` CPU×4, gl; 3.62 ↔ 3.63 ikişer koşu, makine yüklü): BOOT js ort. 14.865 → 14.270 ms; PLAY 10 sn js 3.203 → 3.171 ms; kumsal kare ort. 337 → 300 ms; yürürken 297 → 297 ms. Fark gürültü içinde (`drawFireAt` sarmalı yalnız pişen ateş varken bir döngü yapar).
- **Geri almak için:** v3.63 commit'ini `git revert` (prototip, index.html, notlar). Kayıt alanı ve MAPV değişmedi (ateşteki sıra kaydedilmez, kayıtta tamamlanır).

## v3.62 (7 Kasım 2026) · Testçi v3.60 raporu: atılma dersi takılması, ders sırasında kayıt, kayıt odağı, meşale yazıları, ek uyumu, kazan seçici

- **KOL-15 (`v181` DL):** testçinin ortamında yeniden üretilemedi (akşam, meşale uyarısı ve LT 0,9 sn ile de saldırılar sürdü). Takılma iki yoldan olabiliyor: `idle`'da sayaç yalnız 22–46 px aralığında azalıyordu (yakına itilen ya da sıkışan kerevit hiç saldırmaz), ya da `tickAnimals` çağrılmıyordu. Yapılanlar: `DL.atkT` son saldırı zamanı; `idle`'da 5 sn saldırı yoksa ve uzaklık ≤ 60 ise `DL.t=0`; 8 sn ve > 60 ise `spawn()`. `DL.tickT` ile 250 ms'lik bekçi: oyun duraklatılmamışken 2 sn `tickDL` çalışmadıysa kendisi `tickDL(.25)` çağırır. Denendi: kerevit 15 px'e yapıştırıldı → 3,9 sn'de saldırdı; `tickAnimals` boşaltıldı → saldırı sürdü.
- **KOL-32:** `v181` 2 sn'lik bekçi: `tz===11&&ftut===2`, ders yok (`!DL.on&&!DL.done&&!DL.tree`), pencere yok ve öğretici kereviti yoksa (iki ardışık bakış) `spawnTutCrab()`. Kayıt `DL`'yi tutmaz; kerevit ölünce `fightLessonDone` → `tzAlpDone` sarmalı dersi baştan açar. Denendi: ders sırasında kaydet → sayfa yeniden → Devam et → kerevit 70 px'te geldi.
- **KOL-30:** `v320pad` `firstFocus` duraklat penceresinde `#pslots` görünürken `.slot-btn.empty` ya da ilk açık `.slot-btn` (anahtar yuva listesine göre değişir). Denendi: "Kayıt 1 Boş Kaydet".
- **KOL-25, 20, 21, 22:**
  - `v283` meşale yazıları kolda `padTS()`.
  - `bn()` adın sonuna görünmez U+2060 ekler (çeviricinin kol adını ikinci kez okumasını keser).
  - `__plPad.dat/acc` ve `window.__plSuf` okunuşa göre ek (harf adları tablosu `RD`, sayılar ve sözcükler `__plDat`).
  - `kTxt`: değiştirilen her tuş U+2062/U+2061 ile işaretlenir, ardındaki `'ye/'ya/'e/'a` yeniden hesaplanır. Kolda klavyeye özgü tuş olduğu gibi kalır. Kolda fare sözleri silinir (`tıkla ya da`, `(ya da … tıkla)`, ` ya da … tıkla/dokun`, `ya da ↑←↓→`).
  - `tzKey` sarmalı kolda `kTxt`.
  - `body.padmode .esc` gizli.
- **KOL-23:** `moveFocus`'ta `select` sol/sağ değeri artık değiştirmez (yalnız `winStep` LB/RB). Kazan (`mode==='craft'`) tarifsiz açılırsa ve `potCat/potBy` varsayılan değilse sıfırlanır.
- **KOL-26:** `markTS` boş el durağında `body.padhand` (`#handbtn` çerçeve).
- **KOL-27:** çantada `.itile`'a A → `.bs.tsinv.want` ya da `.ibelt .bs.pulse` odaklanır.
- **KOL-33:** `#padkb .pkh` `kbShow`'da `bn()` ile; tuşlar `clamp` ile daralır. Denendi: DualSense, 800 px'te sığıyor.
- **Basılı tutma süresi:** kodda 400 ms (`P.xh`). Testçinin 0,7 sn'si 3–14 kare/sn ve 150 ms basışlardan; belge 0,4 kalır.
- **Geri almak için:** v3.62 commit'ini `git revert` (prototip, index.html, notlar). Kayıt alanı ve MAPV değişmedi.

## v3.61 (7 Kasım 2026) · kol 5. adım: Döşe, harita, reçine, standart dışı kol, kerevit dersi yazıları, kolda bakılan yöndeki toplanacak şey, ölçüm

- **Döşe (`v56` oda bloğu):** yerleştirme `placeSel()`'e alındı (fare tıklaması da onu çağırır). `R.pad={cur,start,move,a,rot,back}`, `R.pcur` imleç; `draw` imleç karesini çizer; "Bitti" `R.pcur`'u da sıfırlar. `v320pad`: `layer()` Döşe'de `#roomui`'yi pencere sayar (liste/menü odak gezinimi, `firstFocus` önce `.rmenu`, sonra `[data-d]`; anahtar menü açık/kapalıya göre). `R.pad.cur()` iken `tick` imleç dalı: yön (300/110 ms tekrar), A `a()`, Y `rot()`, B `back()`. Listede X imleç, B Bitti (menü açıksa kapatır).
- **Harita:** `padMap()` (`craft` + `mode==='map'` + `!markOpen`): çubuk `mapC` kaydırır, LT/RT `mapZ` ×0,8/×1,25, Y oyuncuya döner, A ortada: `marks` içinde 16 px → sil; yoksa `mapTap()` (kişi hedefi, açıp kapar); yoksa `markGuess` adıyla `markCol` renginde işaret. Odak haritada düğmelere gitmez. `body.padmode #craft .mapwrap::after` orta artı.
- **Reçine:** Kol menüsünde `p-resin` → `feedTorch()` (meşale varken görünür). Meşale durağında Y'ye bağlanmadı: Y orada da hızlı yemek.
- **Standart dışı kol:** `g.mapping!=='standard'` ise `nsDpad()`: eksen 9 (hat: −1, −0,714 … 1; boşta 1,286) ya da ilk okunduğunda 0'da duran eksen 6/7 → `now[12..15]`.
- **KOL-14:** Börü kartı (`tzCard` 11, ftut 2) kolda ayrı metin (`data-k` ile çeviriciye kapalı). `v2.15` kerevit donma uyarısı kolda "Atıl: B!" / "Savuştur: LT!". `kTxt` art arda "Sol çubuk" etiketlerini teke indirir.
- **KOL-13 (CEO kuralı korunur):** `window.__plDirPick()` yalnız kolun A'sı boyunca (`dirPick`) nişan yönünü verir. `v2.05` E işleyicisinde adaylar `uzaklık + açı farkı×14` ile sıralanır (alet önceliği `rank` aynı; yerdeki eşya kontrolü önce, değişmedi). `gatherTarget` da aynı biçimde sarılı; `updatePrompt` kolda aynı bayrakla çalışır (istem A'nın alacağını yazar).
- **Yardım:** `renderHelp` ve bağlanma bildirimi yeni düzen ve `bn()` adlarıyla. Fazladan `gamepadconnected` dinleyicisi kaldırıldı (PK artık bildirim dinleyicisinde).
- **Denendi (sahte Xbox kolu):** Döşe (seç, kaydır, döndür, koy, ikinci koy, X → yerleşik eşya menüsü, Taşı → aşağı → A, B B çıkış). Harita (kaydır, RT×2 3→4,69, A işaret koy, A kaldır, Y, B). Hat ekseniyle duraklat menüsünde ↓/↑. Yüz sağdayken A Taş'ı (13 px), solda Lif'i (9 px) aldı. Kerevit kartı ve `kTxt` WASD birleştirme. Reçine ve kerevit donma uyarısı oyunda görülmedi (yalnız kod).
- **Ölçüm** (`olcum.js` CPU×4, gl, üçer koşu, makine yüklü):
  - BOOT js ort.: 3.59 14.140 → 3.61 14.315 ms.
  - PLAY 10 sn js: 3.234 → 3.169 ms.
  - Kumsal kare ort.: 309 → 327 ms.
  - Yürürken: 304 → 278 ms.
  - Gürültü içinde fark yok.
  - Yerleştirme hayaleti açıkken (ayrı betik, CPU×4, 60 kare, ikişer koşu): 3.59 203/216 ms → 3.61 194/176 ms; sarmalayıcıların yükü ölçülemeyecek kadar küçük.
  - Kol yokken `v320pad` döngüsü çalışmıyor.
- **Geri almak için:** v3.61 commit'ini `git revert` (prototip, index.html, notlar). Kayıt alanı ve MAPV değişmedi (işaretler eskisi gibi `marks`'ta).

## v3.60 (7 Kasım 2026) · oyun kolu ile her şey: Kol menüsü, meşale, yerleştirme, kartlar, kola göre tuş yazıları, ana menü takılması

- **Blok `v320pad`** (bütün kol işi burada; kol yokken döngü çalışmaz):
  - **Ana menü takılması (KOL-01):** sebep v3.32 `blockK`. `^↑↑` hile kodunun başı sayılıp 2 sn boyunca gezinme ve A/B kesiliyordu, her basış süreyi yeniliyordu. `blockK` silindi; `P.kf` her kod harfinde odaklı öğeyi tutar. Kod tamamlanınca odak `P.kf[0]`'a döner; `codeB` yalnız `onTitle`'da `…UUDDLRLRB` B'sini yutar (A, kodun tamamlandığı karede `return` ile zaten yutulur). Menü yönü `hys()`: 0,40'ta açılır, 0,25'in altında kapanır; D-pad önce. Hile kodu sayacı da aynı yönü kullanır.
  - **Çıkış onayı:** `press()` `#t-exit` için `askQuit()` → `#padqc` (`.ov`, Vazgeç seçili, dışına basmak = Vazgeç).
  - **Katmanlar:** `LAYERS`'a `#q2cf` eklendi. `card()`: pencere yokken `#q2les` ya da `#tutok` görünürse `#tut`; `firstFocus` Anladım/Devam'a odaklanır, B `P.cardOff` ile 6 sn bırakır.
  - **Kol menüsü:** `#pmain`'e `.padonly` düğmeler (`p-inv`, `p-hand`, `p-char`, `p-skills`, `p-book`, `p-alm`, `p-qlog`, `p-map`, `p-dogs`, `p-dose`, `p-tskip`), yalnız `body.padmode`'da ve iki sütun. `openPause` sarılı (görünürlük: evde yalnız Döşe, Eğitimi geç `#tutskip` görünürken).
  - **Pencerede:** LB/RB `winStep()` (`[role=tablist]`/`.sktabs`, yoksa ilk `select`); LT/RT `menuStep()` (`MENUS`). `moveFocus`: `select` sol/sağ değer, `.qi` yukarı/aşağı ▲▼'ya basar, ana menüden sağ = `#ttop`'un en üstteki simgesi. `type=search` odak listesinden çıktı. `reveal()` sabit şeridin altında kalanı kaydırır. `firstFocus`: pazar `[data-sell]`.
  - **Oyun içi:** `placing` dalı (A `doPlace`, Y `rotatePlace`, B `cancelPlace`, D-pad/sağ çubuk `P.po` kaydırma, ±6). `ghostAtPlayer`/`ghostAtMouse` sarılı (`P.padP` iken fare hayaleti almaz; fare hareketi geri verir). A basılı 0,5 sn `placed` hedefinde `pickUp`; kısa A `tap('interact')`. LB/RB `beltStep()`: durak −2 meşale yuvası, −1 boş el, dolu yuvalar; `P.tsSel` iken X kısa = vuruş, X 0,4 sn = `torchToggle()` (`#torchslot` tıklaması). R3 `P.r3` ile `openMenu('dogs')`'u yutar (yalnız ulti). `cine.on` iken A/B/Start = Esc.
  - **Aygıt:** `padUsed()`/`padLeft()` `body.padmode`'u açar/kapar ve `pl-device` olayı yollar (kol: ölü bölge dışı ilk girdi; klavye: güvenilir keydown; fare: pointerdown, 2 px üstü hareket, tekerlek). `window.__plPad={on,bn,kind}`, `padKind()` `gamepad.id`'den (054c/DualSense/DualShock/PlayStation → PS, yoksa Xbox).
- **Tuş bağlama bloğu (`KB`/`kTxt`):** `PADL` eylem → kol düğmesi; `padLab()`. `kTxt` kol açıkken etiketleri kol adına çevirir (WASD → Sol çubuk). `__plKey` önce `padLab`. `applyKeyTexts` HUD `kbd`'leri. `pl-device` → `applyKeyTexts`, istem, `renderTut`, `renderHot`, açık pencere yeniden yazılır. `v283` `__plTSKey` ve `renderPlaceUI` kol metni için `v320pad`'de sarılı.
- **Denendi (Playwright, sahte Xbox kolu, `/tmp/kol_dev`):**
  - Ana menü ↑×5 (60/120/300 ms), basılı tutma, %50 ve %42 çubuk: takılma yok.
  - Hile kodu açılıyor, odak geri dönüyor, Çıkış'a basılmıyor. Çıkış'ta A → onay, B → kapanır.
  - Açılış A ile geçiliyor. Kol menüsü → Yetenekler, LB/RB sekme, LT/RT pencere.
  - Meşale durağı: kısa X yakmıyor, uzun X yakıyor/söndürüyor.
  - Yaprak barınağı: kaydır, Y döndür, A koy; A basılı al, B vazgeç.
  - Öğretici Anladım ve ders kartı A ile basılıyor. Kart metni kolda "yanında A / Y tuşuna", klavyeye dönünce "F / X".
  - `select` ve `.qi` yapay pencerede denendi. Pazar/kazan gerçek oyunda denenmedi (öğretici kilidi).
- **Ölçüm:** `olcum.js` çalıştırılmadı. Kare döngüsüne yalnız yerleştirme sırasında `ghostAtPlayer`/`ghostAtMouse` sarmalı giriyor, kol döngüsü yalnız kol bağlıyken. Gerekirse yayından önce ölçülmeli.
- **Geri almak için:** v3.60 commit'ini `git revert` (prototip, index.html, parts, notlar). Kayıt alanı ve MAPV değişmedi.

## v3.59 (7 Kasım 2026) · ACT 1 son testi: Kül/Mor giriş şartları, kişilerin dibinde toplanabilir yok, anı sahnesi Esc ile biter

- **Kuşak şartları** (`30_act1.md` Kül ve Mor tabloları): `v345` `BANDR` Kül `'Kül cini':[36,36]` (Giriş ve Orta Sv 36'dan; Sv 34–35'te Giriş'te yalnız Kül böceği), Mor `'Kristal örümcek':[44,0]`, `'Işık engereği':[44,0]` (Giriş Sv 44'ten, Orta her zaman). Doğma testi (20 tur, Giriş): Kül Sv 34 yalnız Kül böceği; Sv 36 + cin, kertenkele, yarasa. Mor Sv 42 Giriş'te örümcek ve engerek yok (yalnız Orta'dan gelen); Sv 44 Giriş'te var.
- **Kişilerin dibinde toplanabilir yok** (`30_act1.md` Haritadaki miktarlar): `v345` `pplNow()` her saniye konuşulabilir kişilerin yerini okur (Kemal, Zümrüt, Ekin'in çiftçisi, Nazlı, Dursun, Durmuş, Börü, Sinan, Doğan, Poyraz, Barbaros, kaptan, gezgin, Işıkçı, `__plGIVER`'daki herkes (kuzenler, Davut…), "Konuş" etiketli `XTRA` yan kişileri); 32 px içindeki madensiz, mağara dışı toplanabilir söner ve süresi dolunca başka yerde çıkar. Oyun başında ve kayıt yüklenince bir kez bütün düğümler, sonra yalnızca ekrandakiler (`PERF.vis`) bakılır (harita taranmaz). `findSpot` sarması yeniden çıkan şeyi bir kişinin dibine koymaz (6 deneme). Kişiler tek tek okunur (bir ad eksikse öbürleri düşmez). Oyunda: Barbaros'un 9 px yanındaki Kum, Davut'un yeni yerindeki Dal, Firuze, Dursun, Durmuş, Nazlı, Sinan, Börü, Doğan, Kemal'in yanındakiler 1 sn içinde söndü; istem kişiyi gösterdi; oyun başında kişilerin 30 px içinde toplanabilir 0.
- **"Yanık 6 sn" (Kül girişi):** ortamdan gelen yanık yok. Testteki yanık o koşuda Giriş'te doğan Kül cininin menzilli atışından (yanık 4 sn × 1,6 = 6,4 sn; aynı koşuda bir Kül cini öldürülmüş). Kül cini artık Giriş'te Sv 36'dan. Canavarsız Kül girişinde 10 sn bekleme: yanık yok.
- **Bayıldıktan sonra doğma yok / Bataklık kıyısı boş (SON-03, SON-04):** sebep bayılınca %60 açılan "Bir anı geri geldi" sahnesi: açıkken ada durur (doğma sayacı, can yenilenmesi). Sahne yalnızca Devam/Enter ile ilerliyordu; Esc ve dışına tıklama kapatmıyordu, test botu Esc'e bastığı için ada 60–75 sn donuk kaldı. `v46` anı: Esc ya da kartın dışına tıklamak anıyı sonuna kadar okunmuş sayıp kapatır (XP ve anı defteri aynı). `v59` ada halkı sahnesi (Elmas Nine dahil) de Esc/dışına tıklama ile biter. Oyunda: bayılmadan sonra Esc → Bataklık kıyısında Sv 20'de Ördek, Turna kuşu, Yaban kazı, Su samuru, Zehirli kurbağa (5–7 canlı); bayılmadan önce de aynı. Reis kuralı (60 sn) değişmedi.
- **Ölçüm** (`olcum.js` CPU×4, gl, /tmp kopyası `goto` 180 sn; 3.58 → 3.59): BOOT 20.348 → 18.321 ms (js 12.269 → 10.466); kumsal avg 197,8 → 179,1; yürürken 182,0 → 162,7; PLAY 10 sn js 4.165 → 4.114 ms (gürültü içinde; yeni saniyelik kişi denetimi ölçülemeyecek kadar küçük).
- **Geri almak için:** v3.59 commit'ini `git revert` (prototip, index.html, parts). Kayıt alanı, MAPV değişmedi.

## v3.58 (7 Kasım 2026) · yalnızca belge ve belge araçları: tarifler ve eşya dizini tam, mağara ve deniz verisi

- **Oyun davranışı değişmedi;** prototipte yalnızca sürüm etiketi.
- **Belge (Analist):** 971 tarif, eşya dizini tam (her eşyanın kaynağı), ağaç sayıları (v3.57 ölçümü: ada 1 5.145, ada 2 5.822), Çelik kazma satırı.
- **Belge araçları** (`proje/tools/belge/x`): yeni `q10.js` → `cave.json` (ada 1): `window.__plCaves` (6 mağara: biyom, giriş seviyesi, reis, canlılar, buluntular), mağara canlılarının ve reislerinin düşürdükleri, deniz avı bölgeleri (`ZONES`, blok içinde olduğu için sayfanın kendi kaynak metninden okunur), Börü'nün kemeri (`EQUIP`, `PRICE`), bunların fiyatları (`PRICE`/`DB.p`). `gen.py` `cave.json`'u okur: mağara canlılarının kaynağında mağara, biyom ve giriş seviyesi; "Mağarada yerden toplanır"; "Deniz avı: bölge (Poyraz'ın teknesiyle, Sv, olta) %"; Börü'nün kemeri; eksik fiyatlar. Zincir v3.57 koduyla yeniden çalıştı (`q3`, `q5`, `q7`, `q8`, `q9` iki adada, `q10` ada 1; makine yavaş olduğu için `probe.js`'in süre sınırı /tmp kopyasında 240 sn). Sonuç: `gen/esyalar.md` 1.407 eşya, fiyatsız ya da biyomu boş satır yok; `gen/kaynaksiz.json` boş. Analist'e ayrıca `/home/claude/ham_esya_kaynak.md` verildi.
- **Geri almak için:** v3.58 commit'ini `git revert` (parts, gen, x, sürüm etiketi). Kayıt alanı, MAPV değişmedi.

## v3.57 (7 Kasım 2026) · E3 tarifsiz alınır ve kart sıradaki adımı gösterir, yavaş nabız, listelerde ad solda, ağaçlar %50 seyreltme

- **E3 tarifsiz** (`30_act1.md` kural 5 "Varış görevleri tarif yüzünden kilitlenmez", Boğaç 7 Kasım 2026): `arrQ` geri (`matsOK`, `parkLocked`); eski kayıtta tarifsiz alınmış E3 geri bırakılmaz.
- **Kart sıradaki adım** (`30_act1.md` "Kart her zaman sıradaki adımı gösterir" ve E3 adım tablosu): `v186` `nextStep(q)`: görevin istediği (tariften yapılan) şeylerin tarif ağacı derinlemesine; önce görülmemiş doğal malzeme ("Bul: X", E3 malzemeleri için belgedeki yer: `STEPLOC`), sonra bilinmeyen ara tarifler alttan üste ("Tarif: X (kazanda öğren)"), sonra görevin tarifi; E3'te sonra "Yap: 2 Kaya patlatıcı (…)", "Dövdür: kuvars ya da çelik kazma", "Kaya yığınına F". Kart (`myCard`) bu satırı gösterir (yoksa eski "Tarif:" satırı); "Tarif:" adımında 📍 satırı çıkmaz. `target2` anahtarına E3 için patlatıcı sayısı, kazma kademesi ve öğrenilen tarif sayısı eklendi (📍 adımla birlikte değişir). Hata ayıklama: `window.__plNextStep()`, `?debug` ile `window.__plGiveSay(g)`.
- **Veren kişinin sözü** (E3 tablosu): `giveQ` tarif bilinmiyorsa sona ekler: Kemal ve Doğan "Kaya patlatıcının tarifini bir cadının kazanında öğrenirsin; en yakını Firuze'nin kazanı.", Firuze "Kaya patlatıcının tarifini benim kazanımda öğrenirsin." (Kemal'in sahnesine de bir satır). Kemal'in sözünde "kömür" → "turba" (tarif: Yarasa gübresi, Turba, Tuz, Göl çömleği); tarif bilinmiyorsa "tarifini zaten biliyorsun" düşer.
- **Ayak işi zinciri** tarif verisinden yürür (`mkFiller` → `REC`): Kaya patlatıcı → Göl çömleği → Islak göl kili → Göl kili; kodda Nehir çömleği yoktu (yalnızca bir açıklama satırında). **Kuvars kazma** kademe 3 → Silahçı Kaya ve üstü döver (belge `80_tarifler.md` ile aynı). Çelik kazma da kademe 3, Silahçı Kaya; belgenin tarif tablosunda Çelik kazma satırı yok.
- **Deneme (kart izlenerek E3):** tarifleri ve malzemeleri hiç görmemiş oyuncu, Sv 14, Kayalık'ta Firuze'nin yanında: "!" Firuze'de, E3 alındı. Her adımda kart: Bul: Yarasa gübresi → Turba → Tuz kayası → (Taş) → Göl kili → (Çakmaktaşı, Dal, Yaprak, Kum) → Tarif: Tuz → Islak göl kili → (Kıvılcım, Ateş) → Göl çömleği → Kaya patlatıcı → Yap: 2 Kaya patlatıcı → Dövdür: kuvars ya da çelik kazma (📍 Kuvars: Kayalık Dağ) → Kaya yığınına F (📍 Kaya yığını) → F, onay → E3 bitti, geçit açıldı. Ayraçlılar yeni başlatılmış deneme karakterinin görmediği temel şeyler (gerçek oyunda Sv 14'te görülmüş olur). Adımlar oyunda kısaltılarak yapıldı (malzeme `gain`, tarif kitaba yazma, eşya verme); geçit gerçek F ve onayla açıldı.
- **Yavaş nabız** (belge: Rozet ve düğme yanıp sönmez): asıl sebep `v218` `almPlace` her 200 ms'de Almanak düğmesinden `p218`'i kaldırıp geri koyuyordu, nabız her seferinde baştan başlıyordu; artık yalnızca değişince. Nabızlar 1,8 sn ve yalnızca `transform`/`opacity` (ışık halkası sabit): `p3tab` (Almanak, menü açma düğmesi `v50hint`, el/envanter düğmesi, `.p189` ders ışığı, `p236`, `p332g` kazan içi), turuncu `.pulse` (1,8 sn; sıcak çubuk ve yuva 2 kez), yön okları `b3nudge` 1,8 sn, kırmızı Almanak rozeti de aynı nabızla. Oyunda (bilgisayar ve telefon yatay): animasyon zamanı kesintisiz artıyor (yeniden başlamıyor); telefonda menü kapalıyken ışık menü düğmesinde.
- **Listelerde ad solda** (belge Arayüz › Tarif ve sipariş listelerinde satır düzeni): `v284-hand` el yapımı satırında düğmeler (`.rr.hq`) artık sağda (`order:1; margin-left:auto`), resim, ad ve "sende N" solda; malzeme kutusu (`v337hand`) satırın altında tam genişlikte, yerinde açılıyor (bilgisayarda üstüne gelince, telefonda ada dokununca; ikisi de denendi). Kazan ve örs listesi (`.rb`: resim, ad solda, sayı sağda), Usta Sinan'ın sipariş ve ev listesi (`.bn` solda, `.rr` sağda) zaten bu düzendeydi; ACT 2 ustaları aynı kazan/örs listesini kullanır; takip şeridinde ad solda, Yap/× sağda (`v338trk`). Ortak satır stili: el yapımı ile Sinan aynı (`.book li` `.bn`+`.rr`), kazan/örs/ACT 2 aynı (`.rb`); ikisini tek stile birleştirmedim (kazan/örs satırı tümüyle düğme).
- **Ağaçlar** (`v67` blok, ilk seyreltme): `h<.35` → `h<.5`; ikinci seyreltme (kalanın %25'i) aynı; iki ada da aynı koddan. Yeni oyunda sayım (Çayır, Orman, Bataklık, Kayalık, Kül, Mor): ada 1 6.570 → **5.145** (1.166, 1.382, 687, 996, 444, 470); ada 2 7.555 → **5.822** (1.185, 1.670, 1.007, 980, 495, 485).
- **Ölçüm** (`olcum.js` CPU×4, gl; 3.56 → 3.57; makine bu turda çok yavaştı, `goto` süresini /tmp kopyasında 180 sn yaptım): BOOT 34.254 → 34.514 ms (js 17.841 → 17.566); kumsal avg 384,1 → 376,6; yürürken 362,0 → 355,4; PLAY 10 sn js 3.612 → 3.519 ms (gürültü içinde).
- **Geri almak için:** v3.57 commit'ini `git revert` (prototip, index.html, parts). Kayıt alanı, MAPV değişmedi (ağaçlar yüklemede hash'le seçilir, kayda yazılmaz).

## v3.56 (7 Kasım 2026) · Boğaç kararlarına dönüş: F önce yerdeki eşya, E3 tarif kilidi

- **F önceliği** (`20_sistemler.md` Kontroller ve Ev, Boğaç v2.05 + 7 Kasım 2026): `v56`'daki `target` sarması (v3.49 "kapıda önce kapı", v3.51/v3.54 "halkada önce kişi") ve `PEOPLE_K` silindi; ana `target()` sırası geçerli (yerdeki toplanabilir önce, kişi/kapı/öbürleri sonra). Oyunda: Kemal'in yanında Taş → "F Taş topla"; Deri çadır kapısında Eğrelti → "F Eğrelti topla", Eğrelti alınınca "F Deri çadır: içeri gir".
- **E3 tarif kilidi** (`30_act1.md` kural 5, Boğaç v2.26/v2.83): v3.54'teki `arrQ` silindi; `matsOK` ve `parkLocked` yine `needRec`'e bakar. Kemal'in E3 sözü yine "tarifini zaten biliyorsun". Kart satırı (OYN-45) kalır. Oyunda: Kayalık'ta Firuze'nin yanında tarif yokken `vis` [CB1, EK1], Firuze'de "!" yok; tarif öğrenilince [E3, CB1], Firuze'de "!".
- **Eski kayıt:** belgenin "Eski kayıtlar" kuralı (kayıt açılınca tarifi öğrenilmemiş aktif görev geri bırakılır) E3'e de uygulanır; v3.54/3.55'te tarifsiz alınmış E3 açılışta geri bırakılır, Kemal tarif işini verir. Oyunda: tarifsiz E3 etkinken kayıt yüklenince görev geri bırakıldı.
- **Ölçüm:** kare döngüsüne/açılışa dokunulmadı (`target` sarmasının kalkması F/istem anında bir arama azaltır), ölçüm yapılmadı.
- **Geri almak için:** v3.56 commit'ini `git revert` (prototip, index.html, parts). Kayıt alanı, MAPV değişmedi.

## v3.55 (7 Kasım 2026) · denge: Kayalık, Kül ve Mor Kristal'de üç kuşak, Kül kurdu ve Gölge kurdu sürü kademesi

- **Derinlik alanı** (`30_act1.md` › Kuşaklar): `MUD`'un hemen ardından `LDEPTH` (`Uint16Array`, W×H; `DEPTH` adı başka yerde vardı). Kayalık (3), Kül (4), Mor (5) karolarında, bir önceki biyoma (BIO b−1) komşu ve su olmayan karolardan çok kaynaklı taşma araması, yalnızca aynı biyomun karolarından (denge modelinin aynısı). Harita kurulurken bir kez; kayda yazılmaz, oyun sırasında taranmaz. Ölçüm: tek başına ~25 ms, CPU×4 97 ms. Dağılım modelle aynı (bütün karolarda Kayalık %25 24 · %50 48 · %75 73 · en çok 133; Kül 22 · 44 · 66 · 147; Mor 38 · 82 · 161 · 461).
- **Doğma şartları:** `v345` `BANDR` (biyom → `b`: [Giriş, Orta] üst sınırı; `r`: canlı → [Giriş seviyesi, Orta seviyesi], `null` = yok, 0 = her zaman; tabloda olmayan her yerde doğar; Derin'de her şey). `__plSpawnOK` Bataklık dışındaki üç biyomda `LDEPTH`'e bakar; sürü üyeleri de (v3.52 yolu), yan görev canavarları muaf (`spawnMob` bu yoldan geçmez).
- **Sürü boyu:** `spawnIn` `WK` tablosu: Bataklık kurdu [21, 24], Kül kurdu [40, 43], Gölge kurdu [47, 47] (≤ ilk: 2; ≤ ikinci: en çok 3; sonra `PACK`).
- **Doğma testi** (ilk eşiklerle; 25 tur, her satırda o kuşağın içinde bir nokta; canlılar kendi doğdukları karonun kuşağıyla sayıldı): Kayalık Giriş Sv 26 yalnızca keklik/keçi/muflon; Sv 28 + öküz; Sv 30 + Kartal; Orta Sv 26 öküz var, Kartal yok; Sv 28 + Kartal; Sv 30 + Vaşak; Ayı yalnızca Derin. Kül Giriş Sv 34 yalnızca böcek ve cin; Sv 36 + kertenkele ve yarasa; Orta Sv 34 akrep ve kurt yok; Sv 36 + akrep; Sv 38 + kurt. Mor Giriş Sv 42 beş canlı, kurt yok; Orta Sv 42 kurt yok; Sv 45 + Gölge kurdu. Kural dışı doğma yok. Sürü (25 tur toplamı): Kül kurdu Sv 38 50, Sv 41 57, Sv 44 67; Gölge kurdu Sv 45 48, Sv 48 61.
- **Kül ve Mor eşikleri (denge raporu v3.55):** belgenin ilk eşikleri denizi de sayan dağılımdan alınmıştı; yürünebilir karada en derin nokta Kül 95, Mor 97 karo olduğundan Mor'da Derin hiç yoktu (Kristal golem doğmaz, KU4 ilerlemezdi), Kül'de 62 karo. `BANDR` Kül [30, 60] (Lav kertenkelesi ve Kor yarasası Giriş ve Orta'da Sv 36'dan), Mor [25, 55]. Kayalık [45, 85] aynı. Doğma testi (25 tur): Kül Giriş Sv 34 yalnızca böcek ve cin, Sv 36 + kertenkele, yarasa; Orta Sv 34 kertenkele/yarasa/akrep/kurt yok, Sv 38 + kurt; Derin Sv 34 ve 44'te Kara ejder 21 ve 23. Mor Giriş/Orta Sv 42 Gölge kurdu yok, Sv 45 Orta'da var; Derin Sv 42 ve 48'de Kristal golem 19 ve 21. Kural dışı doğma yok.
- **Devriye** (denge uzmanının `patrol.js`, ayrı kopyada `/tmp/yz/dm2`, oyunun kendi kuralları, Giriş, 150 sn): Kayalık Sv 26 hasar 0; Kül Sv 34 497/dk (en yüksek can 388 → 1,28/dk), 3 bayılma, saldıranlar Kül cini, Kor yarasası, Lav kertenkelesi (son ikisi Orta'dan gelip kovaladı); Mor Sv 42 625/dk (460 → 1,36/dk), 3 bayılma, Işık engereği, Kristal örümcek, Kristal geyik. Raporun beklentisi Kül ~1,04, Mor 0,86–1,05 (tek örnek, ±%40).
- **Ölçüm** (`olcum.js` CPU×4, gl; 3.54 → 3.55): BOOT 16.392 → 18.253 ms (js 9.684 → 10.888; derinlik araması CPU×4'te ~97 ms, gerisi gürültü); kumsal avg 182,0 → 187,4; yürürken 164,9 → 169,0; PLAY 10 sn js 4.085 → 3.875 ms.
- **Geri almak için:** v3.55 commit'ini `git revert` (prototip, index.html, parts). Kayıt alanı, MAPV değişmedi.

