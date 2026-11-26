## v4.61 (26 Kasım 2026) · Godot 2c: kuşanma, zırh, seviye puanları
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_kusanma.js → data/kusanma.json; yeni karakter_pen.gd; oyun.gd stat/puan/kusam/zirh_carpan/direnc/giy/cikar, kayıtta kusam, puan, puan_ders; oyuncu.gd can_max/enerji_max/enerji_dolma, silah_v web weapon(); envanter "N puan ver" ve ilk seviye kartı; toplama ve pazar özellik çarpanları; web_kayit eq ve v340.sp). Denetim: ?kusan. Belge 99_godot 2c satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.60 (26 Kasım 2026) · Godot 2b: Orman'ın kişileri ve görevleri
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_kisi.js BIYOM=1 → data/kisiler_orman.json, data/gorevler_orman.json, art/kisiler; yeni kuzen.gd; oyun.gd istasyonlar, usta_bilgi, usta_adi, iyelik, kayıtta kuzen; istasyon.gd kademe kuralı ve "dövemez" notu; gorev.gd Orman görevleri ve tanışma şartı; pazar.gd başlık; konusma.gd <b>/<i> → BBCode). Denetim: ?git_<kişi> (ör. git_k_durdu). Belge 99_godot 2b satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.59 (26 Kasım 2026) · Godot 2a: Orman canlıları
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_canli.js BIYOM=1 → data/canlilar_orman.json ve art/canli_*.png; oyun.gd canli_liste biyom biyom, _atici_var; yeni atis.gd; canli.gd ranged; oyuncu.gd etki_ekle/_etkiler; zaman.gd kampta). Denetim: ?orman (+engerek, dikenlikirpi, yabandomuzu, oklukirpi). Belge 99_godot Adım 2 planı ve 2a satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.58 (26 Kasım 2026) · Godot 1f-4: web kaydını açma
- `godot-deneme/` yeni derleme (godot dalı: yeni web_kayit.gd: localStorage "hammadde.saves.v1" okur, snapshot → durum_al biçimi; kayit.gd ana menüde "Web oyunundaki kaydı aç"). Belge 99_godot 1f-4 satırı. Web oyununda değişen yalnız verlab. Çayır adımı (Adım 1) bununla tamam; sırada Orman.
- Geri almak için: bu commit'i `git revert` et.

## v4.57 (26 Kasım 2026) · Godot 1f-3b-4: öğretici
- `godot-deneme/` yeni derleme (godot dalı: yeni ogretici.gd; ders.gd serbest/donuk/sonra; oyun.gd dugum_ekle, ogr kancaları, kayıtta ogretici ve verilen; gorev.gd öğretici sürerken gizli; istasyon/el_yapimi/envanter/pazar/uyanis/canli kancaları). Denetim: ?ogr, ?ogrN (N adım), ?ogr11k3. Belge 99_godot 1f-3b-4 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

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

