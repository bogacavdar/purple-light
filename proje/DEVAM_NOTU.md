## v4.16 (12 Kasım 2026) · fiyat basamağı: biyom sırasıyla pahalanan set parçaları
- Boğaç: "her biyom atladığımda daha iyi şeyler ile karşılaşmalıyım… bir adaletsizlik var". Belge: Aletler › Fiyat basamağı.
- Yeni `v416fiyat` bloğu (v415torpu'dan sonra): `PR` 198 eşyanın yeni `PRICE_`/`DB.p` değeri. Hesap (`w/ladder.py`): Bütün setler tablosunun 13 set sırasıyla her türe log-doğrusal eğri (Başlangıç hariç oturtulur, Başlangıç ilk adımın altında); oklar tane fiyatı (2·4·7·13·25·48·90, etkili oklar + yağ/10); külçeler biyom sırasıyla eğri; kısa yaylar uzun yayın %60'ı. GT.price/sharp (dükkân, bileme) değişmedi.
- Kontrol: chk 0 hata; 198 fiyat oyunda yeni değerinde; 13 türde biyom sırasıyla ters fiyat kalmadı.

**Geri alma:** `git revert` bu commit.

## v4.15 (12 Kasım 2026) · törpüleme: taş uçlu aletler, gövde zırhları, Ametist kılıcı
- Boğaç: "1'i kesin uygulayalım, 2'deki miktarları %50 azaltalım; ametist kılıcını da azaltalım ama bu malzemeler başka bir eşyada yoksa anlamsız bırakmayalım". Belge: Tarifler › Törpüleme.
- Yeni `v415torpu` bloğu (v414tek'ten sonra): `NEW` (22 tarif: 9 taş uçlu balta/kazma/mızrak, 12 gövde zırhı yarı adet yukarı yuvarlanır, Ametist kılıcı) REC'e yazılır, USES güncellenir. Fiyatlar aynı (set basamağı).
- Kontrol: chk 0 hata; boşta malzeme yok (Mor zehir Ametist kılıcında kalır).
- El yapımı başlıkları (çekirdek `H_GRP`/`hGrp`, v4.08 bloğu yerinde): "Zanaat" başlığı kalktı (Malzemeler indeksi 10 → 9); `hTool` (çanta, torba, ok kılıfı, bıçaklar, yemler, Gübre, Kaya patlatıcı + `DB.R` tarif aletleri) → Aletler; ` ok$`/`mermisi$` → Silahlar; Hasırotu yatak → Yapılar; Giyim türünde olup giyilmeyen (Kristal ipek kumaş) → Malzemeler. Keşif defteri türleri (`REC.c`, CODEX_PERK) değişmedi.
- Not: gövde zırhı artık aynı setin miğferiyle aşağı yukarı aynı malzemeyi istiyor (Kara çelik miğfer 15, zırh 15).

**Geri alma:** `git revert` bu commit.

## v4.14 (12 Kasım 2026) · ayıklama: listesi konuşulan 44 eşya kalktı, 13 malzeme işe yarayan tariflere
- Boğaç: "bu işlevsiz tarifleri kaldıralım ama bileşenlerinden işlevli farklı tarifler yaptıralım… her topladığımız şeyin mantıklı bir tarifte kullanılması lazım"; "mantıklı bir şey bulamıyorsak materyalleri değiştirmeliyiz" (gerek kalmadı: 13'üne de yer bulundu). Belge: Tarifler › Ayıklama.
- Kaynakta silindi (v4.12'deki gibi, aynı betik `w/v412/rm.py`): çekirdek `db` JSON R/p/t, `tiers`, `addR`, `A['…']` ikonları, `drawIcon` dalları (kazıyıcı, kaşık, Kükürt çakmağı, kano/kızak/kütük salı), RAWM, v48 'İnci (tatlısu)', v406odun OLD kaşıkları, v409tek SW/VAR/NP satırları.
- Yeni `v414tek` bloğu (v413isle'den sonra): `SW2` 13 satır (Pirit → Pençe kolye, Kum yerine), `NP` Pençe kolye 91, `GONE` 75 ad (eski kayıtta ödenir).
- Kontrol: chk 0 hata; ACT 1'de tarifsiz/boşta malzeme yok (yalnız ACT 2'nin 8 cevheri + 3 düşmesi); eski kayıtta 2 Odun kaşığı + 1 Çam kaşığı + 1 Kızak → +234 Vio.

**Geri alma:** `git revert` bu commit.

## v4.13 (12 Kasım 2026) · 47 eşya geri; 21 işe yaramayan eşyaya iş
- Boğaç: "şimdilik kaldırma bir şeyi, bir konuşalım sonra kaldırırsın; önerilerini uygula". **Kural:** bir eşyayı oyundan kaldırmadan önce Boğaç'la listeyi konuş.
- `proje/Hammadde_prototip.html` ve `parts/` v4.11 halinden (v4.12 öncesi) geri alındı (`git checkout bb27934`); `v412ayik` bloğu yok, kaynaktaki silmeler geri geldi. 4.12'yi açan kayıtlarda o eşyalar Vio'ya çevrildi; geri dönmez.
- Yeni `v413isle` bloğu (v411muzik'ten sonra): KOZ kerevit düzeltmesi + Kürk eldiven (Deri parçası → 5 Tavşan derisi); TL (5 tılsım, `useHouse` sarmalayıcısı, Kupa panosu `DEC.d` alt kenar taşları, STAT sarmalayıcısı, kayıt `s.tlsm`); BAIT (`fishRoll`), KNF (`dropRoll`), BAG (`deathDrop`), Golem feneri (GT torch, TORCHL 140, TORCHB 1e6, `tickTorch` doldurur, `madPack` tutuşturmayı geri alır), RESINS+Işık fitili, Gübre (`tickFarm`, `f.gub`/`f.gt`), Kök özü iksiri (c='Şifa', V46BUFF ılık 600, `eat` → enerji 600), Duman fişeği/tütsüsü (GT smoke/incense, `attack` ve `tickAnimals` sarmalayıcıları). Çekirdekte yay `bcd=BOW[h].cd*(Ok kılıfı?.85:1)`.
- Kontrol: chk 0 hata; deneme betiğiyle her biri çalıştı (Dev yüreği asılınca can 100 → 180 Kor tacıyla birlikte; Bazalt bıçakla Geyik deri+et 400 avda 790 → 996; Deri çantayla 100 Dal'dan 10 kayıp).

**Geri alma:** `git revert` bu commit (geri gelen 47 eşya da gider; 4.12'ye dönülür).

## v4.12 (12 Kasım 2026) · ayıklama: 47 işe yaramayan eşya kalktı, Tavşan derisi Kürk eldivende, Közlenmiş kerevit
- Boğaç: "tavşan derisini bir zırh setine yedirelim; közlenmiş kerevit kerevit etinin pişirilmesinden oluşsun ve belli statlar vererek yenilebilsin; kaldırılabilir dediklerini kaldırabiliriz". Belge: Tarifler › Ayıklama.
- Kaynakta silindi (çekirdek `db` JSON: R/p/t, `tiers` haritası, `addR`, `A['…']` ikonları, `drawIcon` dalları: kazıyıcı, kaşık, Kükürt çakmağı, kano/kızak/kütük salı; RAWM'dan Cilalı kristal; v48 RENAMED'den 'İnci (tatlısu)'; v406odun OLD'dan 22 "X kaşığı"; v409tek SW'den Sert odun kaşığı satırı, VAR'dan 5 varyant, NP'den kalkanlar).
- Yeni `v412ayik` bloğu (v411muzik'ten sonra): `KOZ['Kerevit eti']='Közlenmiş kerevit'` (çekirdek "Közlenmiş kerevit eti" arıyordu), V46FOOD (16) ve V46BUFF ['hız',120]; `SW2` (14 satır, v409 biçimi); `GONE` (75 ad: kalkanlar + eski ağaç kaşıkları + varyantlar, fiyatlarıyla) eski kayıtta silinir/ödenir.
- Kontrol: chk 0 hata; fiyatsız eşya yok; ACT 1'de tarifsiz/boşta malzeme yok (ACT 2'nin 8 cevheri ve 3 düşmesi bekliyor: Boğaç "ACT 2'ye sonra bakacağız"); eski kayıtta 2 Odun kaşığı + 1 Çam kaşığı + 1 Kızak → +234 Vio.

**Geri alma:** `git revert` bu commit (kaynaktaki silmeler ve belge birlikte döner).

## v4.11 (12 Kasım 2026) · müzik aletleri çalınır
- Boğaç: "müzik aletlerini de çalınabilir yap, uygun seslerde, eline alındığında çalınsın". Belge: Sistemler › Müzik aletleri.
- Yeni `v411muzik` bloğu (v410taki'den sonra): `INS` (ad → ses, ezgi MIDI, ♪ rengi); her alete `GT` girdisi (kind 'music', dur 1e6: kemere takılır); `attack` sarmalayıcısı: eldeki alet çalınır (atkCd 0,18/0,24/0,3), `audio.synth` ile yerinde ses (flüt/kamış/kök/okarina: `blow`; borazan, zurna, davul, tef, çan, yankı, zil); `qc('play:'+ad)`. `hGrp`'ta music → 8. `window.__plMusic`.
- Kontrol: chk 0 hata; 12 alet OfflineAudioContext'te sesli (hatasız); eldeyken vuruş çalıyor, sallamıyor.

**Geri alma:** `git revert` bu commit.

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

