## v4.10 (12 Kasım 2026) · kolye ve yüzük yuvaları
- Boğaç: "kolye ve yüzükleri giyilebilir yap, figürden takılabilir olsunlar; her biri ayrı etkili ve bir zırh setine dahil; 5 → 7 giyilebilir". Belge: Aletler › Kolye ve yüzükler.
- Çekirdek: `SLOTS_EQ` + `['kolye','Boyun'],['yuzuk','Yüzük']`; `equip`'e iki anahtar; applyState'te `Object.assign(equip,…)` iki anahtarla; `FXL` ve `eqTxt(n)` (giyilenin yazısı) — 3071 bilgi, dollHTML, figür ipucu (v387env `figHTML`, `POS` kolye [144,52], yüzük [4,208]), arena `aStat` ve `leftHTML` iki yuva düğmesi, v258c `aInfo` (💍 satırı; 18470'te 💍 simgesi); `.ieqs` 7 sütun.
- Kaynakta: DB JSON'da Altın kolye → Altın yüzük (2 Altın külçesi, 1 Kehribar), Gümüş yüzük (1 Gümüş külçesi, 1 Yontulmuş kuvars); `addR('Kristal yüzük')`.
- Yeni `v410taki` bloğu (v409ikon'dan sonra): `JW` (ad, yuva, set, renk, fx, res, mud, def, yeni tarif, fiyat) → EQUIP girdileri, 10 yeni tarif (Süs, elle), fiyatlar; `STAT`'ın bütün anahtarları sarıldı (yalnız r verilmediğinde: can/enerji/mana/zırh düz, şans +p/100, kalanı ×(1+p/100)); 26 takı resmi (`A` → `__p1k`, yalnız bu adların önbelleği silinir); eski kayıt adları `REN`. `window.__plJW`.
- Kontrol: chk 0 hata; 1.286 eşya, 815 tarif, fiyatsız yok; takınca can/enerji/hasar/savunma/direnç/satış/şans değişiyor; Karakter ve envanter figüründe yeni yuvalar (ekran görüntüsü).

**Geri alma:** `git revert` bu commit (belge ve kod birlikte).

## v4.09 (11 Kasım 2026) · her eşyanın tek tarifi
- Boğaç: "bu 130 tarifi tekilleştirerek başlayalım; tekilleştiği halde kullanılmayan malzemeler varsa mantıklı bir şekilde, az olan sınıfı gözeterek ya yeni tarif bulalım ya da kaldıralım komple". Belge: Tarifler › Tek tarif.
- Kaynakta kalkanlar: `EK` (TARIF_EK) JSON'undan 112 varyant satırı ve sonra boşalan `v366tarif` bloğu (VO, gain/giveTool/icon sarmalayıcıları, `__plVarCheck`, `__plVarSt`) tamamen; v3.81 bloğundaki `vary()` ve 18 çağrısı; `v366ok`'taki `__plOkVar` (Bazalt uçlu Kara çelik ok); `hGrp` sadeleşti. DB JSON'dan Bazalt ok ucu, Meyve fidanı, Cüruf tuğlası tarifi ve kalkan eşyaların fiyatları; `addR('Ağ kapanı')` ve resmi; ACT 2 JSON'unda goblin okçusunun Goblin oku düşmesi, iconk/iconc; v4.06 kabuk listesi Meşe, Ceviz, Söğüt, Huş'a indi; NEWP'ten kabuklar. DU7 görevi (DATA) 5 Meşe kabuğu.
- Yeni `v409tek` bloğu (v409ikon'dan önce): `SW` (tarif, eski girdi, kalan adet, yeni girdi, adet; değer tutan adetler) çalışırken tarife ve USES'a uygulanır; `NEW` (Gök camı, Meteor demiri, Maden); `NP` fiyat artışları (fark × 1,3; bir adım yayılır; evler hariç); eski kayıt: `VAR` varyant → tek tarif, `GONE` kalkan eşya → Vio (applyState sarmalayıcısı v373'ten önce çalışır). `window.__plTek`.
- Plan ve araçlar: `/home/claude/w/tek/plan.py` (SW listesi, kalan malzeme kontrolü, fiyatlar), `docsync.py` (tablolar), `sec.py` (Tek tarif bölümü), `manual.py`.
- Kontrol: 1.276 eşya, 805 tarif, 0 varyant, kullanılmayan malzeme yok, fiyatsız yok, bilinmeyen girdi yok; eski kayıt (varyant bilinen, Kavak kabuğu ve Goblin oku çantada) → tek tarif ve +Vio; chk 0 hata.

**Geri alma:** `git revert` bu commit (belge ve kod birlikte).

## v4.08 (10 Kasım 2026) · Taş kazma: 1 Sivri taş, 1 Sopa, 2 İp

**Değişen yerler:** `DB` (satır 1716) `R`'de Taş kazma `i` = Sivri taş 1, Sopa 1, İp 2 (Dal 2 ve Taş 2 silindi); `p`'de Taş kazma 46 → 41 (v51 kuralı: 46 + round(1,3 × −4)). Taş kazmayı malzeme olarak kullanan tarif yok, başka fiyat değişmez. Belge: 80_tarifler ve 90_esyalar satırı. Sürüm etiketi `Versiyon 4.08`.
- El yapımı özellik satırı: `v258-wst` bloğundaki `deco` [data-hrow] için `.wst`'yi `.bn>span>br+small` (malzeme kutusu) içine koyuyor; `#hcard` bu kutunun içeriğini kopyaladığı için kartta da çıkıyor; `#hcard .wst{display:block}`. Satırda artık özellik yok (kazan listesi eskisi gibi).
- Tarif kitabı: v4.05 `bookInfo` sarmalı (~18434) kapalı tarife de `.bkst` yongaları koyuyor (`REC.has(r)`), işaret `indexOf('🛡')===0` (charAt yarım emoji veriyordu); v2.65'in kapalı tarife `.wst` ekleyen satırı silindi. `v405bk` stiline `#bkinfo .bkinfo` en az 108 px (700–1199 px genişlikte 130), telefonda sabit 150 px ve kaydırmalı. Ölçüm: 937 tarifin hepsi 1024/1280/412 px'te aynı yükseklik.
- Leş: v337les `gm` ve iki `nowM` (evcil hayvan, tarla) `day*1440+dayT+(dayT<360?1440:0)`; gün sayısı 06:00'da artıp saat gece yarısı döndüğü için 00:00–06:00 arası leşler 06:00'da 24 saat yaşlanmış sayılıyordu. Kontrol: 05:00'te avlanan tavşanın leşi 08:30'da duruyor.
- Yetenek ağacı: `explainSkill` `skok.focus({preventScroll:true})`; yeni `v408sk` bloğu (dosya sonu): yetenek düğümüne ve Tamam'a mousedown odak almaz, `buySkill` öncesi cpanel içindeki ve sayfanın kaydırma konumları saklanıp çizimden sonra (hemen, rAF, 200 ve 450 ms) geri konur. Kayma testte üretilemedi (1280×560/800, 412×860); önlem iki yoldan.
- Almanak tatlı su balıkları: yeni `v408fw` bloğu (dosya sonu); deniz sayfası gibi `alm-l`'ye düğme, kartlar `FISHT` (0 river, 1–2 any) gruplarından, sayılar `QC['fish:'+ad]` (zaten kayıtta). İlk tutuş `announce`. Almanak ızgarası: `grid-auto-rows:auto`, kartlar 300 px (telefonda 270) yüksekliğini kendisi taşıyor (başlık satırı 300 px yer kaplıyordu).
- El yapımı başlıkları: `renderHand` üstünde `H_GRP` (11 başlık) ve `hGrp(r)` (varyant → yaptığı eşya; GT türü, EQUIP, tarif kategorisi `c`); sıralama önce başlık; `<li class="hgrp">` başlık satırı (stil `#hcard` satırının altında). `.book.hand{grid-template-columns:minmax(0,1fr)}` ve ad `ellipsis`: uzun varyant adı ızgarayı genişletip Yap düğmesini dışarı itiyordu.
- Mağara canlıları (v232 `art`): yarasa `BATG` ızgaraları (UP/MID/DOWN/DEAD, 25 sütun; Kraliçe ×1,6 ve taç), kertenkele/örümcek `CRIT` ızgaraları (üstten, 2 yürüme karesi). v337les leş: `BATK` dönmez, `g.lie=k` ile yere süzülür, gölge ortada; `FLATK` (kertenkele, örümcek) dönmez, `lie=1` gözler sönük.
- Almanak: `caveKinds(b)` görülen mağaraların canlılarını biyom sayısına katar (sol liste ve başlık); mağaradayken açılınca `A.b` mağaranın biyomu ve `.cvh`'ye kayar; `__plCave.seen(id)` eklendi.
- Mağarada duvar: `wallBetween(a)` (caveNow yanında; oyuncunun göğsünden canlıya 3 px'te bir `__plCave.wall`) `attack` ve `hitIn` (hamleler) vuruştan önce bakar; `__plCave.wall(x,y)` eklendi (v232 `cell`).
- Mağarada su: `caveNow()` (findWaterSpot üstünde); `findWaterSpot`, `target` su/kil, dokunma hedefi su, `waterAhead` mağarada kapalı.
- Silah/alet resimleri: yeni `v409ikon` bloğu (dosya sonu). `paint(n)` tür (`GT.kind`/`mace`) ve malzemeden (`MAT` tablosu: renkler + güç 0–6) 16×16 çizer; çizim "alet uzayında" (u sap boyunca, v enine; `OFF` kısa aletleri aşağı alır), sonra `outlineCanvas`. `icon` sarılır: bu adlarda önce `paint`. Yüklenirken yalnızca bu silahların `ICON/ICONC/PSPR` önbelleği silinir. Işın kılıcı, yaylar, bıçaklar dışarıda. Geri alma: bloğu sil.

- Mağara boss resimleri: v232 `art()` önüne `BOSSG` ({G: ad → [kare0, kare1] ızgaraları, P: renkler}; üretici `/home/claude/w/boss/b.py` + `kit.py`), `bossSpr(k,fr,beyaz)` küçük canvas önbelleği, `BOSSH(k)`; `art` başında BOSSG'li boss 1,5× çizilir (ölçek `1.5/a.scale`, `imageSmoothingEnabled=false`, f<0 aynalı); eski Yaşlı Kök dalı silindi. `MYK`'ya `BK2` eklendi, `__plCaveArt`'tan BK2 çıktı (artık akraba resmi ödünç alınmıyor). Can çubuğu: BOSSG'li boss'ta `y-BOSSH-6`, Kraliçe'de yükseltildi.
- Işıkçı yan görevi: v230 bloğunda `Q`'ya `isikci` (`ext:1`, `prize`, adım `bring` LAMP_WANT) eklenir; yerleşim `lampSpot`, `present` ext'te false (Işıkçı kendi çizilir/konuşur), `GATE`'te yok (2 sınırına sayılmaz). `complete` ext'te "Yan görev bitti · Kafa lambası". `__plSide.extStart/extDone/extOn`; `talkLamp` "Bunları bulacağım" → extStart, "Takas et" → extDone. Eski kayıt: `lampman.gone` ise `done`'a eklenir.

- Yıldızsız resimleri: v330ys `drawYS` yeniden yazıldı: `YSG` ızgaraları (üretici `/home/claude/w/ys/y.py`; dev 3 kare, 3. kare `a.wind`), `ysSpr` (göz rengi `E` kovalamada kırmızı), `ysGlowSpr` (parlayan noktalar `lighter` ile), arkada mor radyal ışık; can çubuğu `YSH`; saldırıdaki ışık yarıçapı 30 → 48.

**Geri alma:** `git revert` bu commit.

## v4.07 (10 Kasım 2026) · biyom başına tek odun

**Değişen yerler:** ad eşlemesi `/home/claude/w/odun/map.json` (327 ad; 10 odun: Odun, Sert, Sağlam, Güçlü, Kor, Kadim; ACT 2 Ulu, Yüce, Efsane, Ölümsüz). Dosyada ağaç adlı odun/kalas/sap/kömür/kaşık/yay adları metin olarak değiştirildi (büyük ve küçük harfli düzyazı dahil). `DB` (1716): adlar çevrildi, aynı ada düşen tarif ve fiyatlardan biyomun asıl ağacınınki kaldı, kabuk tarifleri silindi. `DATA` görevleri: K8, DU6, DU7, AL6, L8 değişti (aynı kişi aynı şeyi istemesin). `NEWP` (v3.11): asıl olmayan odunlar silindi; kabuklar biyom bandında (5/11/19/27) ve `Yüce odun` 26 eklendi, kullananlar ×1,3 kuralıyla izliyor. `TARIF_EK`: malzemesi yerine geçtiğiyle aynı olan, kabuk ve çift varyantlar silindi (145 → 130). Meşe kabuk zırh/eldiven/çizme ve Ceviz kabuğu miğfer (V items) kabuk istiyor.
- Kod: `TREE_EXTRA` tanımının üstünde `WOOD_OF` (ağaç → odun), `woodOf(n)`, `isWood(n)`; `t.n+' odunu'` ve `/ odunu$/` kullanan her yer bunlara geçti (kesme, ipucu, kaynak listeleri, köprü/ateş odunu, Oduncu yeteneği, resim). v2.74 `TREE_EXTRA` satırının altında 13 ağaca `[ağaç+' kabuğu',1]`. `WOODC`'ye 10 odunun rengi. v373: `LAND1/LAND2`, `WOOD` ve varyant kalas döngüsü silindi; Erik odunu satırları kalktı. `drawIcon` yay dalı `kısa yay` adlarını da alır. Yeni `v406odun` bloğu (dosya sonu): eski kayıtta eski adları yeni adlara çevirir (sayılar toplanır, string dizilerinde çift silinir), bir kez bildirim.
- Geri alma: bu commit `git revert` (kod + belge birlikte). Eski kayıt dönüşümü geri alınmaz: dönüşmüş kayıt eski sürümde yeni adları tanımaz.
- Ölçüm (cpu4): BOOT 21145 → 21592 ms, js 12235 → 12423 ms; PLAY js 3966 → 4037 ms (gürültü sınırında).
- Kontrol: eşya 1336 → 1290, tarif 997 → 937; fiyatsız eşya yok, bilinmeyen malzeme yok, kullanılmayan malzeme sayısı aynı (68). Kesme: her ağaç biyomunun odununu ve kabuğunu düşürüyor (ACT 1 ve 2). Eski kayıt: 5 Kayın + 3 Meşe + 1 Sert odun → 9 Sert odun; Çam + Kavak kalası → 3 Odun kalası; Ihlamur yayı → Granit yayı. Resimler: 10 odun kütük, kalaslar/saplar/kömürler/kaşıklar/yaylar biyom renginde; torba yok.
- Sürüm etiketi `Versiyon 4.07`.

## v4.06 (10 Kasım 2026) · Sivri taş, Sopa, İp ucuz; fiyatlar ona göre; güvercinler dünyada görünür

**Değişen yerler:** `DB` (satır 1716): `R` içinde Sivri taş `[Keskin taş,4]`, Sopa `[Dal,2],[Keskin taş,1],[Lif,1]`, İp `[Lif,3]`; `p` içinde 168 değer. Fiyat yayılımı oyunun v51 kuralıyla: İp −1, Sopa −4, Sivri taş −8; kullanan tarif `round(1,3 × Σ adet × fark)`, ama fiyatı malzemesinin altında kalan tarifte en az eski fiyat × yeni maliyet / eski maliyet (Balık kapanı 33 → 27). Çalışırken hesaplananlar (oklar, yağlı silahlar, boyalılar) kendiliğinden izliyor: toplam 198 fiyat değişti; metal set fiyatlı aletler, oltalar değişmedi. Araç: `/home/claude/w/` (old.json/new2.json dökümü, `docfix.py` belge tablolarında Fiyat ve Bileme sütunlarını değiştirdi: 352 satır).
- Öğretici (balta): `AXE_STEPS[0]` 1 Keskin taş, sopa/ip yazıları, `AXE_DONE[0]`, `axeNeedStep` (Sopa yoksa Keskin taş <1), `tzAlpDone` bırakma: Dal 2, Lif (2−ip)×3 + (sopa yoksa 1), Taş 2 + eksik keskin taş × 2 (gereken 3). Kart 12 yazısı ve Börü'nün konuşması.
- Yan görev gizli toplama (`hide:1`): `curPts` artık yakınlık şartı koymuyor (`PIGS` silindi), üçüncü öğe `plain`; çizimde `plain` olanda mavi halka ve pırıltı yok. Haritada (`sqZone`) eskisi gibi yok.
- Liste kayması: `v258-wst` stiline `.book li>.bn{flex:1 1 0;min-width:0}`, `.book .bn>span{min-width:0}`, `.book .wst{white-space:normal}` (özellik satırı ad sütununda kırılıyor). 1280×800'de üstüne gelince düğmeler 622 → 622 (önce 806'ya kayıyordu).
- Sürüm etiketi `Versiyon 4.06`.

**Geri alma:** `git revert` bu commit (belge ve kod birlikte).

**Kontrol:** chk.js 0 hata. Fiyat denetimi: fiyatsız eşya yok, kullanılmayan malzeme sayısı aynı (68). Balta dersi: boş çantada Börü 2 dal, 7 lif ister; adımlar 0→1→2→3→5 doğru sırayla.

## v4.05 (10 Kasım 2026) · eylem yazısı kemerin üstünde

**Değişen yerler:** Yeni `v405prompt` bloğu (dosya sonu). `#prompt` kemerin (`#hotbar`) üstüne binerse 120 ms'de bir `bottom`'u kemerin üstü + 8 px yapılıyor (satır içi, `!important`). `.act` ve `v50m` (telefon) değişmedi.
- Mor ışık (`v330ys`): `spot` oyuncunun o anki yerine göre çalışıyor; halkadan uzaklaşınca bitme kuralı kalktı. Işık oyuncunun çevresinde 900 px. Zemin halkası yerine `#ysveil` (z 1, sabit mor örtü, opaklıkla yumuşak geçiş) ve oyuncunun çevresinde zerreler var.
- Yardımcılar (`v402yard` `inZone`): oyuncu 360 px ya da bir Yıldızsız 320 px yakınındaysa yardım ediyorlar.
- Tarif kitabı `bookInfo` sarmalı (~18419): silah/zırh yazısı ikon sütunu yerine metin sütununda `.bkst` yongaları olarak çıkıyor (`v405bk` stili).
- Yeni `v405dur` bloğu: `GT[n].dur` ×2 (`sword`/`hunt`/`bow`). Kayıtta `dw2`; eski kayıtta `toolDur` ×2. Belgede (85_aletler) 66 satırın dayanıklılığı ×2.
- `sharpCost(n)` (giveTool yanında): tam ücret `g.sharp` (silahta ×2) × kaybedilen/en çok, yukarı yuvarlanıyor, en az 1. Dursun menüsünde (~3194, ~3413) kullanılıyor. Belgede 66 silahın bileme ücreti ×2.
- Sürüm etiketi `Versiyon 4.05`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Saldırıda 400 px uzaklaşınca saldırı sürüyor, örtü açık. 1500×800'de yazının altı 652 → 634, kemerin üstü 642.

- Kazan listesi: `canChain(x)` (canWith'in hemen önünde) eksik parçaları `chainTry`+`subOK` ile çantadan (kazandaki kendi tarifinde kazan içeriği dahil) yapabiliyorsa true; `mk` = `canWith||canChain`, `.can` sınıfı da mkOn'u kapsar. Geri alma: `canChain` silinir, `mk` eski haline. Belge 80_tarifler "Kazan listesinde yapılabilirler".

- Zemin: tvar döngüsünden önce `VT` (tiles kopyası) iki tur yumuşatılır: 0/1 karo, 8 komşudan ≤2 kendi türü ve ≥5 öbür tür ise görünüşte öbür tür (`lone`). `tiles` değişmez (ağaç, düğüm, kar kuralları aynı). Geri alma: `VT`/`lone` satırı silinir, döngüde `t=tiles[i]`. Ölçüm olcum.js cpu 4: v4.05 öncesi BOOT 19768 ms / PLAY js 4105 ms, sonrası BOOT 19078 ms / PLAY js 4187 ms (fark gürültü düzeyinde). Belge 30_act1.

- Meşale yanığı (v2.33 bloğu, madPack sarmalayıcı): `torchStrikes()` = `weapon().torch` ve elde yay yok; ayrıca `a.flash>=.12` (gerçek vuruş; saldırgan hayvanın fark etmesi madPack'i flash'sız çağırıyordu). Vuruş aşınması da `torchStrikes()` ister. Geri alma: bu üç koşul silinir. Belge 20_sistemler "Meşale silahtır da".

- Takla vuruşu bekleme süresi: kombo bloğunda `doMove`'un hemen üstünde `DASH_CD=3.5`, `dashCdT`; süre dolmadıysa gri float + `attack()`. Geri alma: o satır ve doMove başındaki `if(type==='dash')` silinir. Belge 20_sistemler kombo tablosu.

## v4.04 (9 Kasım 2026) · sarı bölgeli işlerde ok yok

**Değişen yerler:** Ana görev `guideKey` sarmalı (~15114) hedef bölge (`zKey`) ya da daire (`t.r`) ise ok vermiyor. Önceden bölgenin en yakın noktasına ok ve "Ad N m" yazısı çıkıyordu. Görev günlüğündeki açıklama da değişti.
- Savuşturma (`v110-parry`): `roll`, `a.ders`/`a.tut` için kırmızı vermiyor (pencere değişmedi; Kerevit dersi aynı kaldı).
- Canavar dövüşü (~5767): atılış değince duruyor, yaklaşma `r+10`'da duruyor. Yeni `v404ara` bloğu canavarları oyuncunun `r+6` dışına itiyor.
- Yeni `v404ders` bloğu: alıştırma canavarı (`a.ders`) kendi durum makinesiyle dövüşüyor (`a._dz`: keep → 0,6 sn ! → 0,34 sn atılış → back). Taban yapay zekâ her karede bastırılıp konum geri alınıyor. Isırık canın %5'i, can ¼'ün altına inmiyor.
- `attack` (~5853): `visBox` en yakın nokta + koni yerine yay örneklemesi (açı `__p4.sw.ang` ya da yön, ±1,35 rad, yarıçap menzil+8). Meşale-kurt: 10 açıdan 6 → 9 isabet.
- Köpek menüsü (`mode==='dogs'`, ~3158): `DOG_MATS`'a dünyadaki bütün maden olmayan, mağara dışı düğüm adları ekleniyor.
- Kuzen pazarcıların yeri (`place`, ~18551): ocaktan 480–900 px (öbür kişilere en az 240 px), olmazsa 300–480 px, olmazsa eskisi gibi 110–260 px. Kayıt etkilenmiyor, yer her açılışta hesaplanıyor.
- Sürüm etiketi `Versiyon 4.04`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Ritimli 3. vuruş ve ulti derslerinde canavar keep → wind → leap → back döngüsünde dövüşüyor; atılış başında savuşturunca vuruş geçmedi. Yaban domuzu en yakın 7 → 15 px, ısırığı yine geliyor. Alıştırma mağara ayısı ısırığı 137 → 4. Kuzen pazarcılar ocaktan 5 → 27–30 kare.

## v4.03 (9 Kasım 2026) · onay kutusu oyunun görünüşünde

**Değişen yerler:** Yeni `v403cf` stili (dosya sonu) `#q2cf`'yi (`confirmBox`) koyu panel, altın çerçeve ve altın ana düğmeyle çiziyor. Köprü onayındaki `spFree` satırı kaldırıldı (v3.53 OYN-40). Sürüm etiketi `Versiyon 4.03`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Köprü kutusu ekran görüntüsüyle bakıldı.

## v4.02 (9 Kasım 2026) · mor ışık: daha hafif, kamplara girer, kişiler yardım eder

**Değişen yerler:**
- `ownCamp`/`campFor` (satır ~5712): Yıldızsızlar (`a.ysA`) için güvenli yer yalnızca oyuncunun kamp ateşi. Saldırganlık (~5750), geri çekilme (~5772) ve kamp sınırı (`moveA`/`tickAnimals` sarmalları ~15725) bunu kullanıyor.
- `v330ys`: `sheltered` ve `spot` yalnızca `ownCamp` ile çalışıyor; sayı ×0,75 (3–9), can/hasar ×0,75, başlangıç değerleri ×0,75; `ATK.P` ve `__plYS.atk()` dışa açıldı.
- Yeni `v402yard` bloğu (dosya sonu): Börü `alp`'i hareket ettirip saldırı bitince yerine döndürüyor (kayıtta evdeki yeri). Zümrüt ışın yolluyor; Kemal iyileştiriyor.
- `hitIn` (~13530): daire tutmazsa `visBox` üzerinde 5×4 nokta deniyor.
- `moveA` (~5743): geçilemez yerde duran canlı en yakın geçilebilir yere yürüyor.
- Sürüm etiketi `Versiyon 4.02`.

**Geri alma:** `git revert` bu commit (Börü'nün yeri kayda hep evdeki yeriyle yazılır).

**Kontrol:** chk.js 0 hata. 11. gün Börü'nün yanında saldırı: Börü bir gözcü öldürdü. Kemal'in yanında can 50 → 66. Zümrüt'ün yanında tükürücü 22 → 6. Suda kalan Kerevit Reisi 3,5 sn'de karaya çıktı.

## v4.01 (9 Kasım 2026) · üzerine gelme etiketi: yeni görünüş, dövüşte gizli

**Değişen yerler:** Yeni `v401tip` (stil) ve `v401tipjs` bloğu (dosya sonu). `#hovtip` (v146) yeni görünüşte. `data-k` (red/amber/green) yazıdan çıkarılıyor; kenara taşarsa `flipx`/`flipy`. `attack` sarılıp son vuruş zamanı tutuluyor. `body.plfight` 120 ms'de bir hesaplanıyor: vuruştan sonra 3 sn, `inFight()`, `underAttack()` ya da 260 px içinde kızgın/kovalayan canlı. `body.plfight` iken etiket `display:none`. B1 (DATA) parçaları `[['campup'],['c','cook',1,…]]`, sözü, sahnesi ve `LES.camp` 3. adımı değişti; yeni parça `campup` (yanan kamp ateşi ya da kabulden sonra kurulan ateş, sayaç `campset` 7407), `cook` sayacı `finishOne`'da (ateşte her pişen). `partTarget` `c/cook` en yakın yanan ateşi gösterir. El yapımı satırında `data-hrow=""${…}"` yazım hatası (v3.35'ten beri Takip et boş adla çağrılıyordu) düzeltildi. Takip şeridi: `v401trk`/`v401trkjs` (dosya sonu) simgeli satırlar, `title`lar kaldırılıp kendi kartımız (`#b3tip`) tarif etiketinde de açılıyor. `ePick` ve E/F ağaç önceliği: havadaki düşenler (`age>=0`) iniş noktasına göre alınıyor. Sürüm etiketi `Versiyon 4.01`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Eski B1 kaydıyla (b.camp) kart iki satır gösteriyor; ateş + bir pişirme → Börü'de tamamlanıyor. Geyiğin üstünde turuncu şeritli kart çıkıyor; `attack()` sonrası gizli, 3,5 sn sonra yeniden açık.

## v4.00 (9 Kasım 2026) · yetenek ağacı pencereye sığıyor

**Değişen yerler:** `v399rz` stilinde `cm-skills` için `#cbody` sütun flex, `.sktree` `flex:1` (sabit `--th` yüksekliği yerine), panel yüksekliği `--plMaxH`. `skTip` (satır ~3381) zoom'u (1,2) hesaba katıyor ve kartı ağacın `#cbody` içinde görünen kısmına sığdırıyor. `sqZone` daire yarıçapı 22 → 29 kare; `collect`/`use` adımlarında (gizli olmayan) sıradaki noktayı, `back` adımında görev vereni de veriyor (EK1 `ekin1`). EK1'in son adımı (`back`): `talkEkin` ve `statusDlg`, yan görev motoru `back` adımındaysa (`__plSide.backAt`) onun `talk`'ını çağırıyor (önceden Ekin'in ana görev konuşması araya girip adım hiç bitmiyordu). Sürüm etiketi `Versiyon 4.00`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. EK1 `back` adımında F → Ekin korkuluğu alıyor, EK1 tamamlanıyor (+90 Vio). 1600×900 ve 1366×700'de en alttaki yeteneğin kartı gövdenin içinde (önceden 1600×900'de ağaç gövdeden 119 px taşıyordu).

## v3.99 (9 Kasım 2026) · Pamuk'un sarı dairesi

**Değişen yerler:** Yan görev motorunda `sqZone(id)` (~16748, `__plSide.zone`). Kovalamada, Pamuk'un durduğu ya da kaçtığı yerden 0,25–0,85 yarıçap uzağa kaydırılmış 22 karelik bir daire döner (`A.zc`, Pamuk 2 kareden çok yer değişince yenilenir). Götürmede Davut'un yerini verir. Ana görev `partTarget` artık `'sq'` parçasını tanıyor; `target2` anahtarına daire sayacı (`z.k`) eklendi. Pencereler: `v399rz`/`v399rzjs` (dosya sonu) — `#craft` içinde 5 tutamaç (`.rzh` l/r/b/bl/br, yalnızca `hover:hover`+`pointer:fine`, `v50m` değil), `#cpanel`'e satır içi `width/height !important` (zoom'a bölünerek), mod başına (`cm-*`) boyut bellekte; el yapımı genişliği 620 ve sağ boşluk 18 px. Sürüm etiketi `Versiyon 3.99`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. El yapımı: Yap'ın kenara uzaklığı 20 → 40 px; sağ kenar +80 → genişlik 744 → 904, alt +60 → 11 → 13 satır, yazı 14 px sabit, kapatıp açınca boyut kalıyor. CB1 etkin kayıtta kart "Pamuk: Çayır · haritada sarı bölge" yazıyor, büyük haritada daire görünüyor, Pamuk merkezden 0,66 R uzakta.

## v3.98 (9 Kasım 2026) · tanışılmamış görev verenler haritada

**Değişen yerler:** `__plQMk` (satır ~15310) artık yalnızca kuzenleri (`BYG`) değil, sonradan eklenen `__plGIVER` anahtarlarını da (`k_davut`, `k_ekin`) tanıyor. Davut (~21305) ve Ekin (~21513) harita sarmalları `met` yerine `met || __plQMk(k)==='!'` ile çiziyor. Tanışılmamış kişide mevcut v2.09 çizimi (yalnızca parlayan !) çalışıyor. Sürüm etiketi `Versiyon 3.98`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. E1–E5 bitmiş, 2. seviye kayıtta CB1 açık. Davut tanışılmamışken büyük haritada sisin içinde parlayan ! görünüyor.

## v3.97 (9 Kasım 2026) · üşüme, buzlanma, kar yalnızca kışın

**Değişen yerler:** `v370hava` `snowing()` artık `season()!==3` iken yanlış döner (kar yalnızca kışın). Yeni blok `v397soguk` (dosyanın sonunda): üşüme 0–100 (`tickHunger` sarmalında, yalnızca `hold` yokken), ısı kaynakları `camps`/`FIRES`/Kemal'in ateşi/ocak/kazan 64 px, ev `roomSafe()`, meşale `torchHeld()`; can kaybı üşüme > 75; `#frost` (z 2) dört köşe tuvali bir kez çizilir, büyüme yalnızca `transform`+`opacity` (250 ms'de bir, değişince). Kayıtta `usume` alanı. Hata ayıklama: `__plCold()`, `__plColdSet(v)`. Sürüm etiketi `Versiyon 3.97`.

**Geri alma:** `git revert` bu commit (kayıtlardaki `usume` alanı eski sürümde okunmaz, zararsız).

**Kontrol:** chk.js 0 hata. 25. günde −11°'de üşüme artıyor, Kemal'in ateşinde azalıyor, 95'te can düşüyor. 3. günde (ilkbahar) yağış kar değil. Buzlanma 20/55/95'te ekran görüntüsüyle bakıldı.

## v3.96 (9 Kasım 2026) · yeni çizimler parlama sarmalının içinde

**Değişen yerler:** `v395cayir` artık `drawNode`'u sarmıyor (en dışta durup öğretici/görev parlamasını, `gl()`, atlıyordu); çizimleri `window.__plCayirL`'e koyuyor, ana `drawNode` (satır ~4266) en başta onu okur. Yaprak'ın ×0,7 küçültme sarmalı yeni yaprakta atlanır. Pazar: `v394pazar` stilinin `box-shadow:none!important`'ı `.pulse`'u eziyordu; aynı blokta `ul.mkt li button.pulse` / `.ctools button.pulse` kuralı eklendi. Satış satırında `.sq1` (Sat) ve `[data-sell=all]` (Hepsi) düğmeleri tutarsız (satır ~3155, adet değişince ~3436). `v189` bloğundaki yumruk dersi tıklama yakalayıcısı (`tz===11&&ftut===2`) artık `__plDL.done||__plDL.tree` iken (ders bitti, ağaç adımı) devre dışı. Sürüm etiketi `Versiyon 3.96`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Zümrüt'ün meşale dersinde (tz 4) yaprak ve dal mavi parlıyor. Konsol hatası yok.

## v3.95 (9 Kasım 2026) · Çayır yer toplanabilirleri yeni görünüş; Yabani havuç → Havuç

**Değişen yerler:** yeni blok `v395cayir` (dosyanın sonu): `drawNode` sarmalı, `L[ad]` olan düğümleri (mağara/maden düğümü değilse) kendi sprite'ıyla çizer: Dal, Yaprak (Boğaç'ın gönderdiği yaprak + kahverengi sap, `LEAF`), Kum, Ebegümeci, Hardal otu, Nane (`__p1.spr` yeşilleri ×0,8), Yaban çileği, Havuç (yarısı gömülü), Yarasa gübresi; çizim oyunun yoluyla (`__p1k` kit, `lightCanvas`, `outlineCanvas`, önbellek, `drawSprite`). Seçim araçları: `/home/claude/spr` (cap.js, comp.py). Ad: kaynakta "Yabani havuç" → "Havuç" (RES, bitki listeleri, tarifler, E6 görevi metni ve isteği, `P1W`), fiyat tablosundaki `"Yabani havuç":2` silindi (Havuç 10), `P1I['Yabani havuç']` → `P1I['__eski yabani havuç']` (Havuç'un kendi resmi kalır); `v373sade` `REPL`'e Yabani/Kızarmış/Kurutulmuş yabani havuç → Havuç karşılıkları (eski kayıt). Belge: 20_sistemler, 30_act1, 80_tarifler, 90_esyalar. Sürüm etiketi `Versiyon 3.95`.

**Geri alma:** `git revert` bu commit (eski kayıtlarda Havuç'a dönen yabani havuçlar geri dönmez).

**Kontrol:** chk.js 0 hata. Eşya denetimi: 1336 eşya (−1) / 997 tarif, bilinmeyen 0, fiyatsız 0, kullanılmayan ham 68. Çayır'da 35 Havuç düğümü. Eski kayıt (Yabani havuç 4, Kızarmış yabani havuç 1) → Havuç 4, Kızarmış havuç 1. Oyun içi ekran görüntüsünde seçilen dokuz çizim. Konsol hatası yok.

## v3.94 (9 Kasım 2026) · öğretici kartında konuşanın resmi

**Değişen yerler:** `tzCard` 9. adım başlığı "Zümrüt · Pazarcı Nazlı'ya git", 13. adım `['alp','Börü · Demirci Dursun'a git',…]`; `renderTz` boş konuşanı adımdan tamamlar (10 market, 11–13 alp); `v64` bloğunda `tutPor.market/alp/smith` (`porFor`). Yeni `<style id="v394pazar">` + `v394pazarjs`: bütün pencerelerde `.ccoins` ve `#closecraft` 32 px, `.esc` gizli (title "Kapat (Esc)"); `#craft.cm-sell` en çok 600 px, boyu `--plMaxH`; araç satırı 3 sütun ızgara, satırlar `display:flex` tek satır, `.note` gizli, Sat/Satın al iki parçalı anahtar, bütün düğmeler tek stil; JS toplu satış düğmelerini kısaltır (title tam açıklama) ve `.kz` ipucunu "N tarif" yapar. Belge: 10_akis.md, 20_sistemler.md. Sürüm etiketi `Versiyon 3.94`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. 8–13. adımlarda kart resmi: Zümrüt, Zümrüt, Nazlı, Börü, Börü. Konsol hatası yok.

## v3.93 (9 Kasım 2026) · ders malzemesi yalnızca eksik kadar; "Vio" büyük harf

**Değişen yerler:** `tzPlace` (satır ~7130 ve `v3.7x` bloğundaki üzerine yazan sürümü, ~22492) artık `tzMiss(ad,toplam,cx,cy)` = toplam − envanter − `tzNear` (yerde, merkezden ya da oyuncudan 200 px içinde) kadar koyar ve koyduğu sayıyı döndürür; `tzList` sayı kelimeleriyle liste kurar. Çağrılar: Zümrüt ilk tarif metni ve tarif öğrenilince (Dal/Lif/Yaprak 2), `stonesNow` (Taş 4), `tzAlpDone` (Sopa yoksa Dal 3, Lif (2−İp)×4, Taş 2+(eksik keskin taş)×2; Börü'nün 6 taşı önce verilir). Metinler bırakılan sayıyı söyler. Para: oyun dosyası ve `parts/*.md`'de "vio" → "Vio", ekler ’ ile (Vio’yu…); düzenli ifadeler `/Vio/i`, `/^100 Vio/`. Yeni `<style id="v393hand">` + `<script id="v393handjs">`: yapılamayan satırın `.bn{opacity}` katmanı malzeme kutusunu saydam yapıp alttaki satırın altına itiyordu → soluklaştırma yalnızca resim/ad/"sende"ye, açık satır `z-index:7`; düğme sırası CSS `order` ile Takip et · ×5 · Hepsi · Yap (Yak); bilgisayarda (hover) satır kutusu gizli, `#hcard` sabit kart Yap düğmesinin üstünde (yer yoksa altında). Yeni `v393lock` (+ `v393lock-css`): `tz===12 && mode==="hand"` iken sıradaki parçanın `[data-hand][data-q=1]` düğmesi basılabiliyorsa `body.v393lock` (pencere içi her şey `pointer-events:none`, yalnızca `.p189` ve Kapat), değilse (ya da adım Taş) 0,7 sn sonra `closeCraft()` + `tzNeed()` ile "Önce malzemeleri topla". Sürüm etiketi `Versiyon 3.93`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Deneme: envanterde 3 taş → kazan yanına 1 taş kondu; Dal 2/Lif 1 + yakında Dal 3, Lif 5, Yaprak 3 → hiçbir şey konmuyor. Konsol hatası yok.

## v3.92 (9 Kasım 2026) · para birimi sikke → vio, mor para resmi

**Değişen yerler:** oyun dosyasında ve `parts/*.md`'de bütün "sikke" çekimleri sözlükle çevrildi (sikke→vio, sikken→vion, sikkelik→violuk, sikkeler→violar, sikkeye→vioya, sikkeyi→vioyu, sikkesi→viosu, sikkenin→vionun, sikkeni→vionu, sikkeyle→vioyla…; büyük harf korunur), yorumlar ve `/vio/i` (∞ para), `/^100 vio/` (Koşu görevi) düzenli ifadeleri dahil; kayıtlarda "sikke" adlı alan yok (`coins` sayı), çevrim gerekmez. Yeni `<style id="v392vio">`: `#coinbox i`, `.ccoins i`, `#coins i`, `.gcoin` mor para; para kutusu ve sayaç mor. GUNCELLEME_NOTLARI'nın eski sürüm notları olduğu gibi kaldı (geçmiş). Sürüm etiketi `Versiyon 3.92`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata; oyun dosyasında ve belgede "sikke" 0. Ekran: sol altta mor para + "0 vio", pencere sayacı mor. Konsol hatası yok.

## v3.91 (9 Kasım 2026) · sol üst: gün, dijital saat, hava simgesi, mevsim çemberi; öğretici kartı yarı alan; takip şeridi geniş

**Değişen yerler:** yeni blok `v391hud`: `body.v391` (yalnızca bilgisayar; `v50m`'de `.hd` gizli) `#clock` kutusuz, `#clockic/#clockv/#clockms` gizli, yeni çocuklar `#hdday`, `#hdtime` (dijital, `.hdpop` gündüz/gece süresi, `NIGHT=[150,108,150,210]`, Mor gece 240), `#hdwx` (simge + ad + `__plTempStr`), `#hdsea` (SVG dört yay + ok, açı = yılın 28 günündeki yeri, gün 06:00'da başlar). `renderClock` sarmalı + 1 sn'lik `upd()` (anahtar değişince DOM). CSS: `#tut{transform:scale(.7071);transform-origin:top right}` (bilgisayar), `#b3trk .b3lab` 16em / `.b3cell` 15em / 12 px. Belge: 20_sistemler.md, 10_akis.md. Sürüm etiketi `Versiyon 3.91`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. 1920×1080: satır 255 px'e sığıyor (#left genişliği), şerit 458 px ve adlar kısalmadan; kart 540×283 → 382×200 (alan %50). 10. gün 21:00 (Yaz): saat mavi, ipucu "Gece 20:00–06:00 · 1,8 dk". Konsol hatası yok.

