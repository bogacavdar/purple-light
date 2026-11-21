## v4.32 (21 Kasım 2026) · İki temel karakter (erkek, kadın), gerçekçi oran, 8 yön aynı kişi; saç/elbise/aksesuar üstüne giydirilir
- `v428kahraman` bloğu yeniden yazıldı (aynı id). `HD.e`/`HD.k` = {CW, CH (54), c, m, A}; tek sayfa, satırlar `S,SE,E,NE,N,NW,W,SW` (sağa bakanlar kendi çizimi), sütun 0 duruş, 1–4 adım. Maske R=bölüm×30 (1 ten, 2 saç, 3 üst, 4 alt, 6 göz). `A[yön]`: sk, l, r, ey, ex, my, ch, nk, fl/fr/fx (elle ölçüldü, sağa bakanlarda aynalı koordinat, `mir:1`), hp (kalça), bl/br (kalçada gövde eni), hy, span.
- Giydirme `acc()`: elbise (hp−2…hp+10 etek, bacaklar ten), saç biçimi ekleri `hair()`, bıyık, sakal, buff, gözlük, şapka, toka; yön başına bir katman çizilip 5 kareye basılır, `mir` satırlarına aynalı. Kel: saç bölümü ten rengine boyanır. Kadında Kısa/Küt/Uzun temel saç.
- UI tuvalleri: `cprev` 54×54, `pfchar` 48×60, `ieqc` 44×56, `dollc`/`ardoll` 48×60; konuşma resmi başın 12×13 bölgesi 2×.
- Üretim: ComfyUI Z-Image Turbo + piksel LoRA ile önden temel resim (erkek `base_e_00002`, kadın `base_k_00003`); Wan 2.2 TI2V 5B ile 360° döndürme (81 kare), yön kareleri seçildi (erkeğin arka/arka-çaprazı kolları yanda kalan ayrı döndürmeden). Yürüme kareleri yüksek çözünürlükte bacakların kalçadan eğilmesi/kaldırılmasıyla, sonra kutu küçültme + ortak 20 renk. Bölümler (ten, saç, üst, alt, bot) yüksek çözünürlükte renk + konumla ayrıldı. Araçlar oturum içi (/tmp/hero/build5.py, walkhr.py, lab.py), depoya girmedi.
- Geri alma: `git revert` bu commit.

## v4.31 (19 Kasım 2026) · Telefonda yaratma ekranı: Geri/Başla düğmeleri açıklama yazısının altında kalmasın
- `v63-css`'in arkasına, `(pointer:coarse) and (orientation:landscape) and (max-height:520px)` için: `.v63rh` gizli, `#cprev` 100 px, Döndür/Rastgele 34 px, `.cnote` 10 px, `#creator .tmenu.row` `position:relative;z-index:5`. Yapışkan önizleme bloğu kısaldı, düğmeler üstte. Playwright 844×390 ve 740×360'ta `elementFromPoint` Başla'yı veriyor.
- Geri alma: `git revert` bu commit.

## v4.30 (19 Kasım 2026) · Oyuncu ve sevdiği kişi her yerde yeni çizimle; ara sahnelerde ComfyUI kişileri; ince bacaklar
- `v428kahraman` `drawChibi` sarmalayıcısı genelleşti: `pcLook(L)` LOOK.hero/LOOK.love'a (aynı nesne ya da ten+saç biçimi+saç+üst eşit) uyan her çağrıda (her tuval, her sahne) yeni çizim; 24×26 tuvalde konuşma resmi (S karesinin `A.sk-2`'den 26 satırı). Sevgilinin cinsiyeti yoksa `__plLoveFem`. Yürüme karesi yalnız `drawPlayer` içinde `player.step`'ten; ara sahnede `o.step` ±1 → kare 1/3; `o.sit/closed/arm` yok sayılır. Yaratma ekranındaki "Sevdiğin kişi" istisnası kalktı.
- `NPCL[k]` ile çağrılan ve `window.__plNPCS[k]` çizimi olan kişiler (v425kisi `NK` + v425npc Kemal `ekin`) ara sahnede f/q/s/w kareleriyle; `fy<0` ise eski çizim.
- Bacaklar: `build.py frames_raw` ön/çapraz bacak eni `min(3, …)`, ortadan 1 px aralıklı; bütün saç biçimleri yeniden üretildi.
- Geri alma: `git revert` bu commit (v425kisi/v425npc'deki iki `__plNPCS` satırı dahil).

## v4.29 (19 Kasım 2026) · Oyuncunun karakteri: yaratma ekranı, envanter/karakter/arena figürü yeni çizimle; 15 saç biçimi (ComfyUI), aksesuarlar kodla
- `v428kahraman` bloğu baştan yazıldı (aynı id, aynı yer). `HD[e|k][saç]` = {CW, CH, c (renkli sayfa), m (maske), A (yön başına baş noktaları)}; saç biçimi ilk kullanıldığında yüklenir, yoksa Kısa/Uzun'a düşer. Maske R=bölüm×30 (1 ten, 2 saç, 3 üst, 4 alt, 6 göz, 7 tunik eteği), G=parlaklık×100.
- Aksesuarlar `acc()` ile yön başına bir kez çizilir, her kareye basılır (sağa bakan satırlara aynalı). Şapkada `A.hy` (siper satırı) üstündeki saç silinir. `A`: sk (kafatası üstü), l/r, hy, ey/ex (göz), my, ch (çene), nk (boyun), fl/fr/fx, span.
- UI figürleri: `drawChibi` kendi tuvalinde çağrılınca (`cprev` 40×40, `pfchar` 32×40, `ieqc`, `dollc`, `ardoll`) tuval 1×'e küçültülüp yeni çizim basılır (CSS boyutu değişmez); `pfchar`ta eldeki eşya burada çizilir, çağıranınki tuval dışına itilir. "Sevdiğin kişi" adımında `cprev` 64×64'e döner ve eski çizim kullanılır.
- Kadın W (sola bakış) çizimi v4.28'de ters dönmüştü; çevrildi.
- Üretim: ComfyUI Z-Image Turbo + piksel LoRA, 512×688, saç biçimi ve yön başına bir resim (65 + 2 yeniden). Yeşil zemin + gölge temizliği, palet oylamalı küçültme (boy 31, uzun saçlılar 33–38), yön (sola bakış) cilt ağırlık merkeziyle otomatik. Araçlar oturum içi (/tmp/hero), depoya girmedi.
- Geri alma: `git revert` bu commit; kayıt alanı değişmedi.

## v4.28 (19 Kasım 2026) · Oyuncunun karakteri: ComfyUI çizimi, 8 yön × (1 duruş + 4 adım karesi), zıplamasız yürüyüş, erkek + kadın
- Blok `v425kahraman` silindi, yerine `v428kahraman` (aynı yerde). İki sayfa (sprite sheet) gömülü: `SH.e`/`SH.k` = [renkli PNG, maske PNG]; hücre `CW`×`CH` (e 33×35, k 30×35), satırlar `S,SE,E,NE,N,NW,W,SW`, sütun 0 duruş, 1–4 adım. Maske eskisi gibi R=bölüm×60 (1 ten, 2 saç, 3 üst, 4 alt), G=parlaklık×100; çizme ve çerçeve maskesiz.
- Kare: `player.mv` ise `1+floor(((player.step*10) mod 2π)/(π/2))`, değilse 0. `o.bob`/`o.step` yok sayılır (zıplama yok). Boyanmış sayfa önbelleği `CA` en çok 13 kombinasyon.
- Üretim: ComfyUI Z-Image Turbo + piksel LoRA, yön başına tek duruş resmi (S, SW, W, NW, N; sağa bakanlar ayna), yeşil zemin anahtarlama + renk taşması temizliği, palet oylamalı küçültme (H 31 + 1 px çerçeve). Adım kareleri kalça satırının altına bacak yeniden çizilerek üretildi (yan: bacaklar öne-arkaya ±3 px, ön/arka: adım ayağı 2 px kalkar, çapraz: ±2 px açılır + arka ayak 1 px kalkar). Araçlar oturum içi (/tmp/hero/build.py, legs.py, proc2.py), depoya girmedi.
- Geri alma: `git revert` bu commit (yalnızca `index.html`/`proje/Hammadde_prototip.html` bloğu, belge maddesi, notlar); kayıt alanı değişmedi.
- Kontrol: chk.js 0 hata; Playwright ile erkek ve kadın için 8 yönde yürüyüş ekranları bakıldı, konsol hatası yok.

## v4.27 (19 Kasım 2026) · E2E Bataklık: tek Reis kuralı (hızlı tür ×3), mağara boss'u görev Vio'su, Bataklık ve Batık dengesi, balta/kazma hasarı, kuşaklar, av sarı bölgesi, mağarada biyom
- Kaynak: /home/claude/E2E_v426_bataklik/ANALIZ_BATAKLIK.md §5–§10 (YB-01…33). YB-23'te E3 kodu doğruydu, yalnız YB-21 satırı düzeltildi. Boğaç kararları: S1=A (tek Reis kuralı), hızlı türlerin Reisi ×3, mağara boss'u görev Vio'su (A).

**Reis**
- `makeBoss` (çekirdek): `hpM` = `spd>=90?3:4`, `dmM=1`; ACT 2'de can sınırı yok, hasar sınırı 5.
- `fixBoss` (v128): aynı kural, `I2` sınırları, XP `xp0`'dan.
- v128: `xp0` yazımı (v129'un biyom XP çarpanından önce).
- `P4` ödül satırı: Reis Vio'su `xp0`'dan; mağara boss'u için `caveBossVio` (mağara görevinin `c`'si).
- Silinenler: sürü çağrısı dalı, `PACKB`, `CAYIR`/`ORMAN`, `mul`.

**Canlılar**
- v128 `SET`: Ördek, Yaban kazı, Turna, Su samuru, Timsah, Bataklık kurdu. `xp` çarpansız değerdir; Bataklık kurdunda `fx` kanama 2.
- Mağara: `NK2` Çamur Ana; `PACK['Mağara sülüğü']=[1,2]`; mağara `spawnAnimals` sarmalayıcısı `c2` için `C._sT` (3 sn).

**Aletler, eşyalar, kuşaklar**
- `AXE` 14 alet.
- `V.usta` Kamış çizme `def:9`; `PR` Kamış çizme 151; v3.51'in Kamış fiyat satırı silindi.
- `BANDR[3]`; `__plSpawnOK` Timsah Orta 20; çekinme `ARR[3]=21`.
- `NOCUT` (Dut, İncir).

**Görevler**
- DATA.Q: AL2, AL4, VE4 ödülü; AL1 metni.
- Yan görevler: Şifa `guard` `n:1` ve son söz; Kartal `guard` `seq`.

**v186**
- Sarı bölge: `animalCircle` `ak`, `zKey`, `bandOK`, `zoneMask` `cut`, `whereTxt`.
- `cardUp` (ders kartı kuyruğu).
- `nextStep` kazma kademesi adımı (`bestTool` v186'da kademe sayısıdır).
- `hereBio` (mağarada mağaranın biyomu); `refreshVis`, `pickFiller` ve `fillQ` onu kullanır.

**Kayıt ve geri alma**
- Kayıt alanı yok.
- Geri almak: `git revert` (c12c622, cd681f5 ve son commit; belge ve kod birlikte).

**Kontrol**
- chk 0 hata, yorum taraması temiz.
- Headless (port 9433):
  - Reis tablosunun ACT 1'deki 41 satırında can ve hasar birebir, XP 40 satırda (Vaşak Reisi 776, belgenin kendi canlı tablosuna göre bu doğru).
  - 11 hızlı Reis tutuyor.
  - Mağara boss'larının Vio'su 310, 500 ve 700 (öldürerek); 1.000, 1.400 ve 2.000 (koddan).
  - YB-14/24/26 değerleri tutuyor.
  - Batık'ta "!" Bataklık'tan.

## v4.26 (18 Kasım 2026) · E2E Çayır+Orman: canlı gücü, Reis kuralı, yükseltme zinciri, tek parça eşyalar satılmaz, ayak işleri, B5
- Boğaç kararları: 04:30 canlı gücü; S1 silah ve zırh satılmaz, DR4 450; S3-A Y1 Orman'a varınca; 04:55 tarif ayak işi kazancıda; Reisler A; Eşya yolu A (B5); yükseltme zinciri ve fiyatı (DNG-15…18); "upgrade gibi olur". Belge: ANALIZ §6, §8, §9, §10 (Y-01…Y-45; Y-17 iptal).
- Yeni bloklar (son scriptler, sırayla):
  - `v426zincir`: `CH`, `PREV`, `__plOwnP`, `__plChainPrev`, `__plChainP`; `takeChainPrev`/`chainSettle` ile `gain`, `handCraft`, `selectRecipe`, `closeCraft` ve Usta tıklaması sarmalayıcıları; `missingFor` yazısı; kemerde boş kalan zincir parçasını temizleme.
  - `v426b5`: B5 `p`.
  - `v426topuz`: topuz `WDMG`.
- Çekirdek değişiklikler:
  - `SET`/`apply` `xp` alanı; `NEWN.Porsuk`, `newDef`.
  - `makeBoss`/`fixBoss` Reis formülü (`ORMAN`, çok atışlı ×1, `wind`), Çayır ve Orman'da sürü çağrısı yok (`PACKB`).
  - Mağara `NK`/`BK`, `PACK['Mağara yarasası']`.
  - Silah satırı topuz `.4`, mızrak `.5`; `ANIM.Engerek.drops`; `ARR[1]=10`.
  - `spawnIn` Kurt (Sv1–5 tek, sahada en çok 1).
  - `dropRoll` bağımsız çekim (`dropOdds`/`dropRolls` silindi); `faintLoss` ve `deathDrop`/BAG; `trapCatch`.
  - `noSell` ile `sell`/`bulkSellable`/liste/"1 sat".
  - `laborFee`/`ustaPrice` `__plOwnP`; `subOK` zincir; `mkFiller` derinlik 13; `nextStep` walk 13 ve "Önceki kademe".
  - v186: `fillQ`/`fillG`/`fillFor`/`WITCH`, `fillerNeeded` (<2 "!"), `pickFiller(onlyMR)`, `partTarget 'kn'`, `progText 'any'` etiketi, kart tarif satırı kısaltma, `__plUstaQ`.
  - `talkUsta` ilk tanışma; DATA.Q K8/DU6/AL6/L8/DR4/Y1/B5 metin ve değerleri.
  - Eşlik `hop`/`f.stk`; Toprak `remindUse` ve `use` 40 px.
  - Mağara kapısı meşale satırı; v2.28 `qDone` `__pl186.S.d`; Dursun `tz===13` ve `AXE_INFO` metinleri.
- Kayıt alanı yok.
  - Eski kayıtta sürmekte olan bir "Dövdür" görevi zincir yüzünden uzayabilir; kart ve ayak işi önceki kademeleri sırayla gösterir.
  - Alınmış eski `F-rec-*` işi `g:'npc'` ile kalır ve öğrenilince biter.
- Geri almak: `git revert` bu commit (belge ve kod birlikte). Yalnız zinciri geri almak için `v426zincir` bloğu ve `laborFee`/`ustaPrice`/`subOK` satırları; topuz için `v426topuz`; B5 için `v426b5` ve DATA'daki B5 satırı.
- Kontrol: chk 0 hata; headless denetimler yukarıda.
- Son düzeltmeler: OR-16 (örste takılı parçayla yapımda çift parça; `gain` sarmalayıcısı kaldırıldı, takma yapım bitince `brew`/`handCraft`/Usta sarmalayıcılarında), `spawnIn`'de yorumun yuttuğu `const P=PACK[k]` (bcd9129–29b21cf arası hiç hayvan doğmuyordu; yalnız bekleyen-paket, yayına gitmedi), Yankı Kraliçesi 350·18. Duman testi: köprü önü kaydıyla 8 hayvan, sayfa hatası yok.
- Yönetici: v2.51'den beri bir yorumun yuttuğu ölü `MATS.forEach` kodu silindi (BASES satırı); belge 36_yan_gorevler Toprak yuvası 40 px.


## v4.24 (14 Kasım 2026) · Çayır eşyaları, maden, ağaç, zemin, kişiler ve eşyaları ComfyUI çizimiyle; Çilek/Elma/Armut; Rezene kalktı
- Boğaç'ın ComfyUI'si (Z-Image Turbo + pixel LoRA) ile çizildi, `/home/claude/w/` araçlarıyla 32 px ikon ve dünya resmine çevrildi.
- Bloklar: `v423ikon` (23 ikon, yerde çizim `__plCayirL`), `v420cali` (Böğürtlen çalısı), `v424dunya` (Kireçtaşı/Kumtaşı/Bakır cevheri kayaları `drawNode`, Çam/Kavak/Elma/Armut `treeSprite`/`drawTree`), `v425karo` (Çayır çim k0/k1, kum k2, su k3–5; `__v58.bake` ve `drawGround` yerine konumdan doku; `n` işaretsiz parçalar yeniden pişirilir), `v425npc` (Kemal), `v425esya` (kazan, ocak, örs, askı, tezgâhlar, kereste, kulübe, kukla, kamp ateşi; `__plKazanOf` kuzen kazanları), `v425kisi` (8 kişi + kuzenler `npcDraw` üzerinden; `px` maskesi eski şapka/önlük parçalarını atlar; `drawX` sarmalayıcıları maskeyi temizler). `v64`'e `window.__plPOR`, `v184`'e `porOf` → `__plPORn` ve `drawWitchC/SmithC/ArmC` sarmalayıcıları, `drawPotC` kazan çizimi eklendi.
- Kaldırılan: Rezene (tarifler, fiyat, `P1I/P1W`, `PLANTC`); `B4PLANT` Rezene yuvası `*Çayır otu` ile öbür otlara dağıtılır. `v395cayir` yalnız Havuç.
- Eski kayıtlar: `RENAMED` (Çilek, Elma, Armut ve türevleri), `REPL` Rezene→Nane, Rezene çayı→Nane çayı; `HERB` Kurutulmuş rezene→Nane.
- Geri almak: `v425*`, `v424dunya`, `v423ikon` blokları silinir, `v64`/`v184` eklemeleri geri alınır (`git revert` bu commit).
- Kontrol: chk 0 hata (`?.` 1, `??` 7); Playwright ile ikonlar, yerdekiler, ağaçlar, kayalar, zemin, kişiler, kuzenler, eşyalar ve konuşma resimleri görüldü, hata yok.

## v4.23 (14 Kasım 2026) · Gelincik yeni resmiyle; Dal yan yatık, Yaprak dönük, yerdeki gölgeler resmin altında
- Boğaç: "dalı yan çevir", "yaprağı da çevir biraz", "gölge çok aşağıda kalmış" → `v420cali` `GZ`/`box` ile resmin alt kenarı gölgeye oturur, Dal −π/2, Yaprak −0.55 rad. "gelinciği koy" → yeni blok `v423ikon` (v420cali'den hemen sonra): tek satırlık 32 px sayfa, `N` adları, `GZ` yerdeki boy; ICON/ICONC yalnız bu adlar için sabitlenir, yerde `__plCayirL[ad]`. Resim Boğaç'ın ComfyUI (Z-Image Turbo + piksel LoRA) çıktısından 32×32'ye indirilip çerçevelendi. Belge: Eşyalar › Yeni ikonlar; Sistemler › Çayır görünüşü.
- Kontrol: chk 0 hata; ekran görüntüsünde Gelincik yerde ve envanterde yeni resimle.

**Geri alma:** `git revert` bu commit (kayıt alanı yok).

## v4.22 (13 Kasım 2026) · Kemal "Üçü de tamam"; 5 malzeme yerde de yeni resimle
- Boğaç: "3 böğürtlen topladım neden 5'i de tamam diyor?" → `CALLS` `e2` metni. "river pebbles neden böyle" → `v420cali` içinde `__plCayirL` Nehir çakılı/Kum/Dal/Kuru ot/Yaprak (13–16 px, sayfanın 7. satırı). Belge: Eşyalar. (4.21 başka bir oturumda uygulama kimliği düzeltmesi olarak çıktı.)
- Kontrol: chk 0 hata; ekran görüntüsünde beşi de yerde yeni resimle.

**Geri alma:** `git revert` bu commit.

## v4.21 (13 Kasım 2026) · uygulama kimliği /purple-light/ (CoffeBean ile karışmasın)
- Boğaç: Purple Light kısayolu CoffeBean açıyordu; CoffeBean yüklenince pencerede adı CoffeBean, içi Purple Light. Sebep: iki oyunun `manifest.webmanifest` `"id": "./"`; Chrome bunu start_url kökenine (`https://bogacavdar.github.io/`) çözüyor → aynı uygulama kimliği. Boğaç: "ikisini de hemen yayınla".
- Değişen: `manifest.webmanifest` `"id": "/purple-light/"`; belge `parts/05_teknoloji.md` PWA satırı; verlab 4.21. Kod bloğu yok, kayıt alanı yok. CoffeBean tarafı v0.47'de `/coffeBean/`.
- Kontrol: yalnız sözdizimi (chk.js).
- **Geri alma:** `git revert` bu commit (yüklü uygulamalar yine birbirine karışır).

## v4.20 (13 Kasım 2026) · meyve çalıları (3 kez toplanır), Kemal'in dersi 3 böğürtlen, yeni ikonlar
- Boğaç: "bush üzerinde yetişen gıdaları ... 3 kereye mahsus ... düşüp kaybolacaklar ve yeniden generate olabilecekler; kemalin öğreticisi de 3 tane böğürtlen isteyecek" + resimler (çalı, böğürtlen, çakıl, kuru ot, kum, dal, yaprak). Belge: Toplama › Meyve çalıları; Akış › öğretici 1–2; Eşyalar.
- Çekirdek: toplama bitişinde `window.__plBush(n)` ise `n.left` 3→0 (çalı kalır, sonra normal respawn, `left=null`); köpek toplaması aynı; istem ve üzerine gelme etiketi "X çalısı… N kaldı"; `drawNode` başındaki `__plCayirL` çağrısına `n` eklendi; öğretici 5→3 (`tzBush()` yakın çalıyı 3'e doldurur ya da `tzPlace` ile bir çalı koyar), Kemal'in ilk sözü "üç tane".
- `v420cali` bloğu: 160×224 PNG (~19 KB): 6 çalı × 3 durum + meyve ikonu, alt satır 5 malzeme ikonu; `__plCayirL[çalı]` 20×20 dünya resmi; ikonlar v418pxl gibi sabit (yalnız bu 11 ad).
- Kontrol: chk 0 hata; bir çalıdan 3 toplama: left 2 → 1 → kayboldu, yerde 3 böğürtlen; öğretici kartı "3 böğürtlen"; ekran görüntüsünde çalılar görünüyor; sayfa hatası yok.

**Geri alma:** `git revert` bu commit (çekirdek satırlar + blok birlikte; kayıt alanı yok, `n.left` kaydedilmez).

## v4.19 (13 Kasım 2026) · hayvanların tutumu, imza hamleleri, sürü kuşatması, Kayalık Dağ dengesi
- Boğaç: "1 kayalık dağı dengele 2 hayvanların tutumunda beğenmediğim 2 şey hariç yap 3 dövüşte hepsini yap" (ateş/meşale ve gece-gündüz önerileri istenmedi). Belge: Dövüş › Hayvanların tutumu, İmza hamleleri ve sürü taktiği; ACT 1 › Kayalık Dağ dengesi; Canavarlar › Reis tablosu.
- `v419tutum` bloğu (son script, en dıştaki `tickAnimals` sarmalayıcısı): `BAL` Kartal/Vaşak/Mağara ayısı + Reisleri oranla; fark etme (`a.aw`, `a.ntc`, oyuncu hızı `pv`: dur .55 / yürü .8 / koş 1), zararsız kaçma yarıçapı 35/55/100, nötr uyarı (`a.wT` 1,5 sn → `madPack`), yaralı kaçma (`a.flee`, %20 can, %60), güçlüden çekinme (`shy`, varış +15), avcı-av (`PREY`, WeakMap `HUNT`/`CHASED`, leş `window.__plMkCorpse` — v337les'e eklendi), imza hamleleri (`SIG`, `a.sg`, `stepSig`, `imp`; dalış ve gömülmede vurulamaz: hp geri + `killAnimal` korumalı), kurt kuşatması (`flank`), oyuncunun çevresinde ok (`drawPlayer` sarmalayıcı).
- Ölçüm: varış seviyesinde önceki biyomun setiyle ısırık/can: Bataklık (Sv 18 Tunç ×0,31) %11–24, Kayalık (Sv 26 Demir ×0,22) %25–30 → %20–25, Kül (Sv 34 Çelik ×0,17) %17–28.
- Kontrol: chk 0 hata; oyun açılıyor; senaryolar: fark etme, Geyik uyarısı 1,5 sn'de saldırı, Yaban domuzu geri-hücum, yaralı kaçma, Bataklık kurdu ördeği avlayıp leş (Ördek tüyü), Sv 40'ta Yaban domuzu çekiniyor, 3 kurt kuşatıyor; sayfa hatası yok.

**Geri alma:** `git revert` bu commit (blok + v337les'teki tek satır; kayıt alanı yok).

## v4.18 (13 Kasım 2026) · PixelLab ikonları (58 eşya); Godot planına görseller
- Boğaç: "sen bunları ekle oyuna" (PixelLab'da 32×32 çizdirdiği 64'lü sayfa). Belge: Eşyalar › PixelLab ikonları; Godot'ya geçiş › Görseller.
- `v418pxl` bloğu (v417fiyat'tan sonra): 256×256 PNG base64 (~78 KB), 8×8 hücre; 58 hücre eşya adına bağlı. `ICON[n]` 32×32 data URL, `ICONC[n]` 16×16 canvas (`__v343` işaretli); ikisi de `Object.defineProperty` getter/boş setter ile sabit (yalnız bu 58 ad; önbellek kuralı). 3 kürek, tokmak, 2. yay, anahtar kullanılmıyor.
- Kontrol: chk 0 hata; oyun açılıyor, `__plPxl` 58, ICONC 16 px, yeni oyunda hata yok; eski/yeni karşılaştırma sayfası Boğaç'a gönderildi.

**Geri alma:** `git revert` bu commit (eski çizimler geri gelir; kayıt alanı yok).

## v4.17 (12 Kasım 2026) · fiyat düzeni: malzeme biyom tabanı + malzemeden hesap + fazla isteyen tarifler azaldı
- Boğaç: "öncelikle malzemelerin fiyatlarını biyomdan biyoma daha değerli hale getir, bu olursa zaten hesap doğru olur… sorun ya malzeme fiyatlarında ya da … tarifin kendisindedir". Belge: Aletler › Fiyat düzeni.
- `v416fiyat` bloğu silindi, yerine `v417fiyat` (v415torpu'dan sonra): `ED` 16 tarif (külçeler, ok uçları, 8 takı) REC/USES; `PR` 227 fiyat. Hesap (`w/rawcat.py`, `w/rawnew.py`, `w/model3.py`): ham malzeme türüne göre biyom tabanı (önceki biyomun %30'luk dilimi × 1,2, yalnız yükseltir); yapılan eşya = eski fiyat × yeni maliyet / eski maliyet (markup ≤ 1,7; üstündekiler, zırhlar: max(eski, maliyet × 1,3)); usta (takı dahil) = max(maliyet × 1,3, metal parça × 1,15); başlangıç ≤ Bakır × 0,8; oklar maliyet / çıkan × 1,3, etkili oklar (ok + yağ/10) × 1,1.
- Kontrol: chk 0 hata; 227 fiyat oyunda; 13 türde ters fiyat yok; boşta malzeme ve fiyatsız eşya yok (ACT 2'nin bekleyen 11'i hariç).

**Geri alma:** `git revert` bu commit (4.16'nın eğrisi geri gelir).

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
