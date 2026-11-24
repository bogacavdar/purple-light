## v4.49 (25 Kasım 2026) · Godot Adım 1e-2 (Yankı Mağarası: canlılar, boss, Madenci Kaya)
- `godot-deneme/` yeni derleme (godot dalı: canli.gd mağara türleri, düşenler ve XP; magara.gd doğum, Kaya, boss; disa_aktar_magara.js canlı kareleri, ağızdaki toplananlar, Kaya'nın resmi ve yan görev sözleri). Belge 99_godot 1e-2 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.48 (25 Kasım 2026) · Godot Adım 1e-1 (Yankı Mağarası: giriş, iç, ışık)
- `godot-deneme/` yeni derleme (godot dalı: magara.gd, mesale.gd; tools/disa_aktar_magara.js web'in mağara ızgarasını, paint() çizimini ve kaya tepesini döker; fonts/ DejaVu ve küçük Noto Emoji yedek yazı tipi). Belge 99_godot 1e satırı 1e-1/1e-2'ye bölündü. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.47 (25 Kasım 2026) · Godot Adım 1d-3 (görev sahneleri ve dersler)
- `godot-deneme/` yeni derleme (godot dalı ab6453d: sahne.gd, gorev.gd'ye dersler; data/gorevler.json'a dersler = web DATA.LES). Belge 99_godot 1d-3 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.46 (25 Kasım 2026) · Godot Adım 1d-2 (görev sistemi)
- `godot-deneme/` yeni derleme (godot dalı: gorev.gd; data/gorevler.json = web DATA.Q'nun Çayır kişileri + eşyaların biyomları + grup adları, disa_aktar.js oyunun kaynağından okur). Belge 99_godot 1d-2 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.45 (25 Kasım 2026) · Godot Adım 1d-1 (kişiler ve ustalar)
- `godot-deneme/` yeni derleme (godot dalı 0873052: kisi.gd, konusma.gd, istasyon.gd; envanter.gd'ye Vio/XP/seviye ve görülen eşyalar; data/toplama.json'a kisiler, xpNeed, iscilik, usta, istasyon). Belge 99_godot 1d satırı 1d-1/1d-2/1d-3'e bölündü. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.44 (25 Kasım 2026) · Godot Adım 1c (el yapımı)
- `godot-deneme/` yeni derleme (godot dalı: el_yapimi.gd; data/toplama.json'a DB.R tarifleri, FORGED/PLACEABLE işaretleri, ~1.175 eşya resmi). Belge 99_godot 1c satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.43 (25 Kasım 2026) · Godot Adım 1b (toplama ve çanta)
- `godot-deneme/` yeni derleme (godot dalı: envanter.gd, toplama.gd, dugum.gd; data/toplama.json web'den: RES, GTIME, MINES, ORE/AXE/PICK kademeleri, GT, ağaç odunu ve meyvesi, eşya resimleri, foodVal/healVal). Belge 99_godot 1b satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.42 (25 Kasım 2026) · Godot Adım 1a (dünya)
- Belge: 99_godot.md'ye Adım 1'in parçaları tablosu (1a yapıldı). `godot-deneme/` yeni derleme (godot dalı aca52cf: bütün ada, ComfyUI zemin dokuları, su.gd dalga/akıntı/köpük, küçük harita). Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.41 (25 Kasım 2026) · Godot denemesi: toplanabilirler yüksek çözünürlükte
- Yalnız `godot-deneme/index.pck` (godot dalı 676c0fa: disa_aktar.js toplanabilirleri 4 kat ince yakalar, oyun.gd 1/4 ölçekle gösterir). Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.40 (25 Kasım 2026) · Godot'ya aşamalı geçiş planı (yalnız belge)
- Belge: 99_godot.md: başlama kararı (Boğaç, 25 Kasım), biyom biyom adımlar tablosu, web sürümü kuralı, veri aktarımı, kayıt taşıma, `godot` dalı; Retro Diffusion bölümüne ComfyUI notu. Oyun kodu değişmedi (yalnız verlab).
- Geri almak için: bu commit'i `git revert` et.

## v4.39 (22 Kasım 2026) · Oyuncu karakteri NPC'ler gibi tek parça (ComfyUI), her saç biçimi kendi çizimi, yüzler/elbise piksel düzeyinde
- Belge: 20_sistemler › "Oyuncunun karakteri" (17:50 ve 19:46 alıntıları); 10_akis › Karakter yaratma (yalnız tam boy önizleme); 00_giris sürüm satırı.
- Kod: yalnız `v428kahraman` bloğu (yerinde). Veri `HD={CW:26,CH:40,e:{stil:{c,m,A}},k:{...}}`: her saç biçimi için 5 satır (S, SW, W, NW, N) × 5 kare (duruş + 4 adım) renk + maske PNG; `A[yön]={top,cx,neck,hip,er,ex,mo}` (göz satırı/sütunları, ağız). Maske R=bölüm×30 (1 ten, 2 saç, 3 üst, 4 alt, 6 göz), G=parlaklık×100. Sağa bakan yönler `sheet()` içinde aynalanır. Yüz (ağız/çil/kaş), pembe yanak ve elbise (alt bölümün üstü etek) `sheet()` içinde piksel düzeyinde. Ara sahne: `g!==ctx` ve yalnız yana bakışta satır ön-çapraz (v66.7 kuralı, iç sarmalayıcıdan önce uygulanır). cprev 36×40 tam boy. Şapka/gözlük/bıyık/sakal/buff/toka şimdilik gizli (Boğaç): `cRender` sarmalı bu satırları `HIDE` kümesiyle gizler, `buildLook` yeni görünüşte bu alanları boş verir (Rastgele de seçemez); eski kayıtlardaki `LOOK` alanlarına dokunulmaz, çizim kodu yok. Geri açmak için `HIDE` ve `buildLook`'taki `Object.assign` satırı silinir, çizimleri eklenir. v4.37 "Yüz" satırı aynen.
- Üretim (scratch, depoda değil): /tmp/h3/ `npc5.py` (anahtarlama → 30 px ortalama küçültme, göz/ağız tespiti, bölüm etiketleri), `npc7.py` (stil başına: dönüş sayfası S/W/N + ayrı çapraz çizimler, çapraz gövdesi ön görünüş oranına `refit`), `w/spec7.json`, `pack7.py` + `inject.py` (`blk/tpl5.js`). ComfyUI çıktıları Boğaç'ın `output/purple/`: `h6ta_*`/`h6d_*` (Kısa/Uzun), `h7ta_*`/`h7d_*` (öbür saç biçimleri).
- Eski kayıtlar: alanlar aynı; `hs:'buzz'` Kel çizimiyle; bilinmeyen saç → Kısa/Uzun.
- Geri almak için: `git checkout v4.38 -- proje/Hammadde_prototip.html index.html proje/tools/belge/parts/20_sistemler.md proje/tools/belge/parts/10_akis.md proje/tools/belge/parts/00_giris.md`.

## v4.38 (22 Kasım 2026) · Canlılar basit ve tatlı tarzda (ComfyUI)
- Belge: 30_act1 › "Çayır canlılarının görünüşü", 37_magaralar › "Yankı Mağarası canlılarının resmi" (Boğaç: "canlılar da olmamış tavşan tavşana hiç benzemiyor" → tarz karakterlerle aynı, basit ve tatlı).
- Kod: yalnız `v436cayir` bloğunun DATA'sı değişti (yeni ComfyUI resimleri "cs_*", /tmp/cy/build.py: 16 renk, büyütülmüş boylar; yarasada kanat çırpışı yalnız kanatları döndürür; Kraliçe'nin tacı resmin kendisinde, kod tacı çizmez).
- Geri almak için: `git checkout v4.37 -- proje/Hammadde_prototip.html index.html` yerine bu sürümün commit'ini `git revert` et (yalnız blok verisi ve iki belge paragrafı). Kayıt alanı yok.

## v4.37 (22 Kasım 2026) · Oyuncu karakteri NPC boyunda yeniden (ComfyUI katmanları, 8 yön 4 kare katı-parça yürüyüş, Yüz seçimi)
- Belge: 20_sistemler › "Oyuncunun karakteri" maddesi yeniden yazıldı (22 Kasım alıntısı); 10_akis › Karakter yaratma (Yüz satırı, önizleme); 00_giris sürüm satırı.
- Kod: yalnız `v428kahraman` bloğu değişti (yerinde, aynı id). Veri `HD`: `CW 26 × CH 44` hücre; `HD.e`/`HD.k` = 5 satır (S, SW, W, NW, N) × 5 kare (duruş + 4 adım) renk + maske PNG, `A[yön]={top,cx,neck,hip,er}`; `HD.lay` = katman atlası (renk + maske) ve `i[anahtar][yön]=[x,y,w,h,dx,dy]`, `o[anahtar]=çizildiği cinsiyet` (şapka/gözlük/bıyık/sakal/buff erkek başına çizildi, kadında `A.top/A.cx` farkı kadar kaydırılır). Sağa bakan yönler `sheet()` içinde aynalanır (tuvalin sağ yarısı). Maske: R=bölüm×30 (1 ten, 2 saç, 3 üst, 4 alt, 6 göz, 7 şapka rengi, 8 buff), G=parlaklık×100. Çerçeve JS'de her kare için tek halka. UI tuvalleri: cprev 50×50 (solda tam boy, sağda yüz 2×), pfchar/ieqc/dollc/ardoll 36×45. Yeni `cLook.face`/`L.face` (0–3) ve "Yüz" satırı (Ten'in altına), Rastgele yüzü de seçer.
- Üretim (scratch, depoda değil): /tmp/h3/ — `canv3.py` (ComfyUI dönüş sayfasından tuvaller), `mask.py`/`zone.py` (inpaint bölgeleri), `base.py` (yeşil anahtar → 30 px küçültme, yüz çizgilerini koruyan örnekleme, bölüm etiketleri), `wlk.py` (uyluk/baldır katı parça yürüyüş, yakın bacak önde + koyu kenar), `layer.py` (inpaint farkı → katman), `build.py` → `w/HD.json`, `pack.py` + `inject.py` (`blk/tpl4.js`). ComfyUI çıktıları Boğaç'ın `output/purple/` klasöründe: `h3ta_*` (dönüş sayfaları), `h3bald_*` (kel temel), `h3t_*` (çapraz temel), `h3hs_*` (saç), `h3ac_*` (aksesuar; `*2` yeniden çizilenler).
- Eski kayıtlar: `L.face` yoksa 0 (Sakin); eski saç/sakal/bıyık alanları aynen okunur (`B4OLD` eşlemesi blokta). MAPV ve kayıt biçimi değişmedi.
- Geri almak için: `git checkout v4.36 -- proje/Hammadde_prototip.html index.html proje/tools/belge/parts/` (yalnız `v428kahraman` bloğu değişti); `face` alanı eski kodda yok sayılır.

## v4.36 (22 Kasım 2026) · Çayır canlıları ve Yankı Mağarası canlıları ComfyUI'de gerçekçi; ağaçtaki meyveler gerçek meyve
- Belge: 30_act1 › Çayır › "Çayır canlılarının görünüşü"; 37_magaralar › "Yankı Mağarası canlılarının gerçekçi resmi"; 20_sistemler › "Ağaçtaki meyveler".
- Kod: yeni blok `v436cayir` (`v232`'den hemen sonra). Resimler ComfyUI (Z-image Turbo + piksel LoRA), /tmp/cy/build.py ile yeşil anahtarlama, küçültme, 24 renk, kareler (0 duruş, 1–4 yürüyüş, 5 hamle, yarasada 6 yatış) ve palet dizgisi (resim yüklemesi yok). 7 eski ART canlısının (`window.__plART`) gövde fonksiyonu ve kutusu değişti, eski yoldaki bütün etkiler (çerçeve, beyaz parlama, Reis tonu, parıltı, donma, yanma) kalır; Porsuk için `__plNEWN.Porsuk.art=''` (kunduz gövdesini ödünç almaz). Mağara dördü bu blokta çizilir (v232 yerine).
- Meyveler: yeni blok `v436meyve` (`v424dunya`'dan önce) `window.__plFruitPic`; `v424dunya` içindeki `fruity` ve çekirdek `drawTree` meyve noktaları bu resimleri kullanır (resim yoksa eski noktalar).
- Geri almak için: iki bloğu sil; `v424dunya`'daki `fruity(...,fn)` ve `drawTree`'deki `FP` satırları resim yokken eski noktaya düştüğü için dokunmasan da olur. Kayıt alanı yok.

## v4.35 (22 Kasım 2026) · Ayak izleri (hava durumuna göre silinir, karda uzun kalır)
- Belge: 20_sistemler › Hava, sıcaklık ve kar › "Ayak izleri" maddesi.
- Kod: yeni blok `v435iz` (dosyanın sonunda, `v433halat`'tan sonra). İz resmi ComfyUI (Z-image Turbo + piksel LoRA, "iz_taban_b", ayakkabı tabanı izi) → /tmp/iz/sheet.py ile 8 yön × sol/sağ × normal/kar, 12×12 hücre, base64 PNG. `tickWeather` sarmalı adım ekler ve yaşlandırır, `drawGround` sarmalı karın üstüne çizer; `restore`/`startNew` temizler. Kayda yazılmaz, MAPV değişmez.
- Geri almak için: `v435iz` bloğunu ve belgedeki maddeyi sil (kayıt alanı yok).

## v4.34 (22 Kasım 2026) · Halat yolları T6'dan; Tuncay ocakta halat satıcısı
- Boğaç kararı (22 Kasım 2026, OYN-K-10). Belge: 37_magaralar halat bölümü, 30_act1:644, 20_sistemler:459.
- v230 yan görev bloğu: `T6ok()`, `tOut(q)` (Tuncay, mağara dışında, T6 bitmiş); `tuncayOut()` artık kuzenlerin ocağı (FAMS b=3) yanında, Yahya'nın yerinden ≥36 px; `present` (dışarıda T6'dan itibaren, mağara içinde görev bitmeden), `homeOf`, `talk` (dışarıda: halat sözü + "Halat yolları"; mağara görevi dışarıda verilmez), `entsSQ` dışarıdaki Tuncay'a "?" çizmez. `v433halat` başlık yorumu.
- Kayıt alanı değişmedi (`s.halat`).
- Kontrol: chk 0 hata; Testçi'nin Kül öncesi kaydında (T6 bitmiş, mağara görevi alınmamış) Tuncay ocakta, F → "Halat yolları" → Kur çalıştı; görev bitmiş sayılınca da ocakta.
- Geri alma: `git revert` bu commit.

## v4.33 (22 Kasım 2026) · E2E Kayalık Dağ: S1/S2 görev sırası, denge (ayı, vaşak, Devi, Reis ×3), yan görev canavarları, halat yolları
- Kaynak: /home/claude/E2E_v431_kayalik/ (TEST_KAYALIK TK-01…12, ANALIZ_KAYALIK, BELGE_DEGISIKLIK). Boğaç kararları 22 Kasım 2026: S1, S2, S3, S4, S6, S7, S7b-A.
- **Görevler (v186):** `landFill()` (yeni, `fillQ`'dan önce): bulunduğun biyomda "!" yok + biyomun bir görevi görülmemiş malzeme bekliyor → `mkFiller(['mat',…])`, `g`=o biyomun cadısı, `land:1`; `fillerNeeded` "!" ≥ 2 iken de `land` işini açar (S1). `refreshVis` `ALTG`: kişinin kendi işi C'de varsa E3 ona verilmez (S2). `nextStep`: CB3–CB8 + ağıl yok → "Ağıl kur (Usta Sinan)" (TK-04). `SPECW` + `whereTxt`: Yarasa gübresi/Sarkıt 📍 (TK-02). DATA: KA2 330, KA4 450, KH4 610; T6 `say` ve `sc`'ye Doğan'ın gece sözü; `blast`/`bridge` ders metinleri; rockfall toast'u ve eski v65 E3 metinleri "turba" (TK-03).
- **Reis (S3):** `makeBoss` (v49-p4) ve `fixBoss` (v128-denge, `X3`) Timsah/Mağara ayısı/Yaban öküzü ×3; `window.__plFixBoss`. v419tutum `BAL` Vaşak [880,85], Mağara ayısı [1500,85]; Reis artık oranla değil `__plFixBoss` ile.
- **Canlılar:** Vaşak `fx` kanama 3; `Dağ Devi` 4000·70; `CAVES c3 lv:24`.
- **Yan görevler (v230):** `GATE` haydar/zehra `T6`; `MOB[3]` Muflon+Dağ keçisi; Bora `mobs:[['Muflon','Dağ keçisi'],2]` (kill adımı dizi kabul eder), metinleri. v419 `shy()` `a.sq` muaf; saldırgan dalında `a.sq` → her zaman farkında ve kovalıyor (TK-05). Tuncay: `present`/`homeOf` (`tuncayOut()`, mağara ağzı), `talk` menüsüne "Halat yolları", `after` sözü.
- **Doğrulama turu eki (DOGRULAMA_v433):** D433-01 çekirdek `tickAnimals` nötr `d>220` ve saldırgan uzun kovalama vazgeçmesi `!a.sq`; v419 `turn` döngüsünün başında `a.sq` → mad/chase/aw her karede (nötr dahil), `aw` kaybı `!a.sq`. D433-02 `partTarget` `tame`: ağıl yokken Usta Sinan. D433-03 değişmedi: belge (30_act1:548) her "!" kartını "… · Ana görev" yazdırıyor, Kemal'in ayak işi de öyle. D433-04 gerçek hata: F `eTarget()` hayvanları geçici boşaltınca `wildNear` keçiyi göremiyordu → `ETSV` (eTarget'ın sakladığı liste), `wildNear` onu kullanır. OYN-K-11 halat penceresi `finishType(true)` + "Vio yetmiyor"; OYN-K-12 büyük harita çizgisi 3,5·K, koyu kenar 6·K, direk 2,4·K (K = tuval/ekran oranı).
- **Tarifler (v417fiyat):** `ED` Ateş tuğlası, Sağlam odun kömürü, Kuvars sivri ucu; `PR` 102 / 92 / 344.
- **Yemek penceresi (TK-09):** `FISH` regex'i (`lüfer`, `inci`, `palamut` kelime sınırı).
- **TK-11:** kuzen veri satırı (`D.items`) Gümüş kılıç dmg 52, Ametist kılıcı 81, Granit savaş çekici 28 (zaten V.usta'da eziliyordu; `dur` taban değer, `v2.x` ×2 yapıyor, dokunulmadı).
- **Yeni blok `v433halat`** (`</body>` öncesi): uçlar açılışta bir kez (`setup`, Bataklık sınırı Doğan'a en yakın Kayalık karosu, Firuze'nin kazanı, rockfall; ocağın ateşinden ~5 karo), `XTRA` direkler (F; önce `ePick`), `tickAmb` sarmalayıcısında kayma (72×3×hız), `tickAnimals` kayarken kovalamayı keser, `interact` kayarken kapalı, `v55Ents` direk + halat, `drawPlayer` asılı çizim, `__plMapQ` iki harita çizgisi + `MAPHITS`, `__plMapObj` `halatN`. Kayıt: `s.halat=[b,b,b]` (yoksa hepsi false; ada 2'de saklanır); kayarken kaydedilirse başlangıç noktası yazılır. MAPV değişmedi.
- **Belge:** Analist'in parts değişiklikleri + 90_esyalar silah hasarı (7 satır, oyunla eşit), 36 açılış sayısı ("ayak işleri sayılmaz"; kod `S.d` ayak işlerini tutmuyor), 37 halat satırına F önceliği ve telefon.
- Kontrol: chk.js 0 hata (?. 1, ?? 7); Playwright ile Testçi'nin Kül öncesi kaydında: S1 (CB6 bitmiş sayılınca Firuze'nin işi), CB6 kartı, halat alma/kayma, F önce yerdeki eşya, `ebtn` ile kayma, yan görev Muflon'unun saldırısı.
- Geri alma: `git revert` bu commit (belge ve kod birlikte). Yalnız halatlar: `v433halat` bloğunu ve v230'daki Tuncay satırlarını sil; eski kayıtlardaki `halat` alanı okunmadan kalır.

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

