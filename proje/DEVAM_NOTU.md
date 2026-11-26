## v4.56 (26 Kasım 2026) · Godot 1f-3b-3: yetenek ağacı
- `godot-deneme/` yeni derleme (godot dalı: yeni yetenek.gd ve data/yetenek.json, tools/disa_aktar_yetenek.js; oyuncu.gd yetenek_uygula, Koşu kapısı, can yenilenmesi; toplama/pazar/envanter/istasyon yetenek etkileri; ders.gd Börü'nün ağaç adımı; girdi Y). Denetim: ?boru3agac, ?boru3tum. Belge 99_godot 1f-3b-3 satırı (enerji çubuğu yeşil diye düzeltildi). Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.55 (26 Kasım 2026) · Godot 1f-3b-2: enerji, savuşturma, Börü'nün dersleri
- `godot-deneme/` yeni derleme (godot dalı: oyuncu.gd enerji/savustur/kalkan/isirildi renk; canli.gd _zar, sersem, savusturuldu, ders; yeni ders.gd; oyun.gd enerji çubuğu, _konus_alp, yetenekler ve dl_agac kayıtta; girdi.gd savus = E/LT). Denetim adresleri: ?boru, ?boru2, ?boru3, ?boru_oto. Belge 99_godot 1f-3b-2 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.54 (26 Kasım 2026) · Godot: Çayır'ın bütün canlıları
- `godot-deneme/` yeni derleme (godot dalı: oyun.gd _dogur/_dogur_tur web spawnIn kuralı; data/canlilar_cayir.json web BANIM[0], ANIM, PACK; art/canli_*.png). Belge 99_godot 1g satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.53 (26 Kasım 2026) · Godot Adım 1f-3b-1 (Nazlı'nın pazarı)
- `godot-deneme/` yeni derleme (godot dalı: pazar.gd; data/pazar.json = web PRICE_, noSell, isRaw, rawPrice, madeOk). Belge 99_godot 1f-3b satırı dört parçaya bölündü. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.52 (26 Kasım 2026) · Godot Adım 1f-3a (giriş sahnesi ve uyanış)
- `godot-deneme/` yeni derleme (godot dalı: cine.gd web cineShip/cineSea çiziminin GDScript'i, uyanis.gd; data/ates.json'a uyanış yeri ve Kemal'in geliş yeri). Belge 99_godot 1f-3 satırı 1f-3a/1f-3b'ye bölündü. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.51 (25 Kasım 2026) · Godot Adım 1f-2 (karakter yaratma)
- `godot-deneme/` yeni derleme (godot dalı: karakter.gd web sheet() kuralının GDScript'i, yaratici.gd; tools/disa_aktar_kahraman.js web HD çizimlerini ve CC/HS/EYES seçeneklerini kaynaktan döker). Belge 99_godot 1f-2 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.50 (25 Kasım 2026) · Godot Adım 1f-1 (ana menü, kayıt, gün-gece, bayılma)
- `godot-deneme/` yeni derleme (godot dalı: kayit.gd, zaman.gd, oyun.gd bayılma ve durum; data/ates.json). Kayıtlar Godot'da user:// (tarayıcıda IndexedDB) içinde, web kayıtlarından ayrı. Belge 99_godot 1f satırı 1f-1…1f-4'e bölündü. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

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

