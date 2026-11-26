## v4.77 (26 Kasım 2026) · Godot 4c: Doğu geçidi, sıradağ, bütün aletler
- `godot-deneme/` yeni derleme (godot dalı: yeni gecit.gd; oyun.gd engel'de kaya yığını, F'de geçit, kayıtta gecit, zemin_katman; gorev.gd rock; tools/disa_aktar_alet.js → data/toplama.json tools 26 alet). Denetim: ?gecittest. Belge 99_godot 4c satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.76 (26 Kasım 2026) · Godot 4b: Kayalık Dağ'ın yan görevleri
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_yan.js Kayalık dahil, fam3 noktası; yan.gd kovalama, keçi eşliği, hayalet Işıl, kulübe/mezar/taş-fener, çok türlü av; evcil.gd _keci_hedef_b). Denetim: ?yantest_zehra. Belge 99_godot 4b satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.75 (26 Kasım 2026) · Godot 4a: Kayalık Dağ canlıları, kişileri, Rüzgâr Mağarası
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_canli.js P2 ART'ı olmayan canlıları drawAnimal'dan alır, BIYOM=3 → data/canlilar_kayalik.json; disa_aktar_kisi.js BIYOM=3 → data/kisiler_kayalik.json, data/gorevler_kayalik.json; disa_aktar_magara2.js MAG=c3 → data/magara_c3.json; oyun.gd, gorev.gd, magara.gd listeleri). Denetim: ?git_k_firuze, ?mag_c3 yok (c1/c2 kancası). Belge 99_godot Adım 4 ve 4a satırları. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.74 (26 Kasım 2026) · Godot: Görevler penceresi
- `godot-deneme/` yeni derleme (godot dalı: yan.gd Görevler penceresi G; girdi.gd deneme aletleri F9; oyun.gd yardım satırı, pencere_acik'e yan). Belge 99_godot 3f satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.73 (26 Kasım 2026) · Godot 3f: Yan görevler (Çayır, Orman, Bataklık)
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_yan.js → data/yan.json, art/yan; yeni yan.gd; oyun.gd F'de yan kişi, canli_oldu görev canavarı, kayıtta yan). Denetim: ?yantest_<id> (ör. yantest_kerem, yantest_nadir). Belge 99_godot 3f satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.72 (26 Kasım 2026) · Godot 3e: Kök Mağarası ve Batık Mağara
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_magara2.js → data/magara_c1.json, data/magara_c2.json, art/magara/c1_*, c2_*; magara.gd birden çok mağara: MAGS, cur, mağara başına durum; kayıtta magaralar; insa.gd bütün mağara girişleri). Denetim: ?mag_c1, ?mag_c2_dip. Belge 99_godot 3e satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.71 (26 Kasım 2026) · Godot 3d: Eşinden kalan izler
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_iz.js → data/izler.json; yeni iz.gd; oyun.gd F'de iz, kayıtta izler; gorev.gd clues; el_yapimi.gd kitapta İzler düğmesi). Denetim: ?iztest. Belge 99_godot 3d satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.70 (26 Kasım 2026) · Godot 3c: Avcı Doğan
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_kisi.js toygar ve kulübesi; kuzen.gd rol t, Doğan'ın konuşmaları ve tarifleri; gorev.gd wear; oyun.gd kulübe çizimi). Denetim: ?git_toygar. Belge 99_godot 3c satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

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

