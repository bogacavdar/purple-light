## v4.69 (26 Kasım 2026) · Godot 3b: Bataklık'ın kişileri ve görevleri
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_kisi.js BIYOM=2 → data/kisiler_bataklik.json, data/gorevler_bataklik.json, art/kisiler; oyun.gd kişileri ve istasyonları birleştirir; gorev.gd Bataklık görevleri ve tool koşulu). Denetim: ?git_k_safir. Belge 99_godot 3b satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.68 (26 Kasım 2026) · Godot 3a: Köprüler, çamur, Bataklık canlıları
- `godot-deneme/` yeni derleme (godot dalı: yeni kopru.gd; oyun.gd engel köprü üstü, camur_mu/camur_gecmez, F'de köprü, kayıtta kopru ve camur_dedi; oyuncu.gd çamur ×0,6; gorev.gd bridge; tools/disa_aktar_canli.js BIYOM=2 → data/canlilar_bataklik.json). Denetim: ?koprutest, ?koprutest_camur. Belge 99_godot Adım 3 ve 3a satırları. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.67 (26 Kasım 2026) · Godot 2f: Evcil hayvanlar ve Çoban Davut
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_evcil.js → data/evcil.json, art/kisiler/*k_davut*; yeni evcil.gd, yoldas.gd; gorev.gd sq/tame ve Davut görevleri; kuzen.gd rol d; yapi.gd Ağıl penceresi; oyuncu.gd binek hızı, inme, darbe bineğe; canli.gd yem; girdi B; kayıtta evcil). Denetim: ?kecitest, ?evcilat, ?evcilkurt. Belge 99_godot 2f satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.66 (26 Kasım 2026) · Godot 2e: Ev içi ve Döşe
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_ev.js → data/ev.json, art/ev; yeni ev_ici.gd; yapi.gd evde F içeri girer, kayıtta oda; oyun.gd pencere_acik'e ev, ?evtest / ?evtest_gece; canli/atis içerideyken durur; zaman içerideyken mor ışık yok; insa evdeyken açılmaz). Belge 99_godot 2e satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.65 (26 Kasım 2026) · Godot 2d-4: Kırma, onarım ve avlu
- `godot-deneme/` yeni derleme (godot dalı: insa.gd HP/kirik, çatlak çizimi, carpti/vur/onar/arada, avlu_hesapla/avluda, kayıtta hasar; canli.gd takılınca insa.carpti, duvar arkasından ısırmaz; oyun.gd F'de onar, avluda doğma yok ve içeride kalan canlı silinir). Denetim: ?insatest_kirtest (konsolda KIRTEST). Belge 99_godot 2d-4 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.64 (26 Kasım 2026) · Godot 2d-3: İnşa kipi
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_insa.js → data/insa.json, art/insa; yeni insa.gd; oyun.gd engel(canli), F'de fener yakıtı, kayıtta insa; canli.gd duvar ve dal çit; oyuncu yol hızı; zaman.isikta fener; el_yapimi çoklu çıktı; yapi Direk feneri hariç). Denetim: ?insatest. Belge 99_godot 2d-3 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.63 (26 Kasım 2026) · Godot 2d-2: Atölye
- `godot-deneme/` yeni derleme (godot dalı: yeni atolye.gd; yapi.gd Atölye ws, çubuk çizimi, kayıtta ws; sinan ve atolye pencereleri ortalanması). Belge 99_godot 2d-2 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.62 (26 Kasım 2026) · Godot 2d-1: Sinan, yapılar, evler, uyku
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_yapi.js → data/yapilar.json, art/yapilar; yeni yapi.gd, sinan.gd; oyun.gd engel'e yapılar, F'de yapı, kayıtta yapi; envanter kemer/çanta seçimi yerleştirir; gorev.gd sleep/place/house/bed). Denetim: ?yapitest. Belge 99_godot 2d-1 satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

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

