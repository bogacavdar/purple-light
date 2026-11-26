## v4.90 (27 Kasım 2026) · Godot A2: Yüzen Kayalar ve Gökbilimci Yıldız
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_canli.js ADA=2 → data/ada2/canlilar_0…5.json + art/canli_*.png (web __I2C.anim + NEWN); yeni tools/disa_aktar_act2.js → data/ada2/ustalar.json (altı ACT 2 ustasının yeri, çizimi, konuşma resmi, NQ görevleri Godot biçiminde) + art/kisiler/kisi_{gok,pervin,tamer,selin,alara,tuna}_*.png; yeni act2.gd (Yıldız, teleskop, konuşma); oyun.gd ikinci adada canlı listesi ve Yıldız + kazan (Yıldız +42,+8); gorev.gd "gun" adımı, "met" koşulu, `nq` işaretli işler (malzeme/tarif şartı yok, ayak işine girmez), tanışılmamış Yıldız'a ok; kuzen.gd "gk" rolü; istasyon.gd "Yıldız'ın kazanı"). Denetim: ?ada2test_yildiz. Belge 99_godot A2 satırı, yeni "Anılar" satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıtta yeni alan yok; tanis["gok"] ve bitenler'deki gk1–gk3 zararsız kalır).

## v4.89 (27 Kasım 2026) · Godot A1: ikinci ada ve portallar
- `godot-deneme/` yeni derleme (godot dalı: oyun.gd `ada` (Kayit.bekleyen.ada), data/ada2 yükleme, ada başına durum (kayıtta üst düzey = Yıldızsız Ada, `ada2` = ikinci ada; ADA_YEREL), seyahat(), _varis(); yeni portal.gd; ciftlik/poyraz/isikci/yan/iz/kopru/gecit/magara/evcil ikinci adada kapalı (durumları ham olarak korunur); kuzen.gd ikinci adada Barbaros ve gemi, yolculuk sonunda geçiş; gorev.gd ACT 2 kartı; yeni tools/disa_aktar_ada2.js → data/ada2/{harita,dunya,toplama_ek,yerler}.json, art/ada2, 8 yeni eşya resmi). Denetim: ?ada2test, ?ada2test_don. Belge 99_godot A1 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (eski kayıtlarda `ada`/`ada2` alanı yoksa birinci ada açılır).

## v4.88 (27 Kasım 2026) · Godot O8: ACT 1'in sonu
- `godot-deneme/` yeni derleme (godot dalı: kuzen.gd gemi/act2 bayrakları (tanis'te), enkaz_f, _teklif, yolculuk sahnesi ve ACT 2 kartı, yeni gemi çizimi; gorev.gd "ship" adımı; oyun.gd F sırasında enkaz, enkaza tekne yeri; yeni tools/disa_aktar_yolculuk.js → art/yolculuk 111 kare + data/yolculuk.json). Denetim: ?gemitest. Belge 99_godot O8 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.87 (27 Kasım 2026) · Godot O7: Ada halkı hikâyeleri; kalan plan
- `godot-deneme/` yeni derleme (godot dalı: yeni hikaye.gd (parçalar, sahne oynatıcı, Kitap sayfası, kayıt `hikaye`); yeni tools/disa_aktar_hikaye.js → data/hikaye.json + art/hikaye 290 kare (oyunun kendi sahne çiziminden); konusma.gd seçeneği ekler; el_yapimi.gd Ada halkı düğmesi). Denetim: ?hikayetest. Belge 99_godot: kalan plan tablosu ve O7 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.86 (26 Kasım 2026) · Godot O6: Yıldızsız Işıkçı ve Kafa lambası
- `godot-deneme/` yeni derleme (godot dalı: yeni isikci.gd (akşam belirme, konuşma, takas, yan görev isikci ext, kayıt `isikci`); yeni tools/disa_aktar_isikci.js → data/isikci.json; yan.gd ext görevleri sunmaz ve sınıra saymaz; zaman.gd ve mesale.gd Kafa lambası ışığı). Denetim: ?lambatest. Belge 99_godot O6 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.85 (26 Kasım 2026) · Godot O5: Yıldızsız Gezgin ve robot köpekler
- `godot-deneme/` yeni derleme (godot dalı: yeni gezgin.gd (Gezgin'in gelişi, konuşması, hediye, mor sinyal, köpek ısmarlama ve ışık sütunu, köpeklerin toplama/taşıma/teslimi, köpekler menüsü, kayıt `gezgin`); girdi.gd R = kopek; oyun.gd F'de Gezgin, pencere_acik, yardım satırı). Denetim: ?kopektest. Belge 99_godot O5 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.84 (26 Kasım 2026) · Poyraz'ın koyu düzeltmesi; Godot O4: Gemici Poyraz ve deniz
- Web: `v234` bloğunda findCove artık Bereket Adası'nı (`__plFarm.onIs`) atlıyor; koy kaydedilmediği için eski kayıtlarda kendiliğinden düzelir. Belge 38_nuri_deniz › Kaza.
- `godot-deneme/` yeni derleme (godot dalı: yeni poyraz.gd (kaza, onarım, konuşma, deniz haritası, deniz ekranı, kayıt `poyraz`); yeni tools/disa_aktar_poyraz.js → data/poyraz.json koy + G1–G10, Poyraz resimleri; gorev.gd nuri/sea koşulları, deniz balığı için ok Poyraz'a; balik.gd kefali, deniz oltalarının yeşil alanı; kuzen/kisi/oyun bağlantıları). Denetim: ?denizt. Belge 99_godot O4 satırı.
- Geri almak için: bu commit'i `git revert` et.

## v4.83 (26 Kasım 2026) · Godot O3b: Bereket Adası ve tarla
- `godot-deneme/` yeni derleme (godot dalı: yeni ciftlik.gd (Ekin'in durumu, olay, kayık, ada yerleri ve çizimi, tarla, fidan, dükkân, kayıt `ciftlik`); yeni tools/disa_aktar_ciftlik.js → data/ciftlik.json + 21 eşya resmi; kuzen.gd'deki Ekin konuşması ciftlik.gd'ye taşındı; gorev.gd ekin koşulu ve fidan; oyun.gd engel, kayıt; toplama.gd F; zaman.gd adada ışık). Eski kayıttaki `ekin_gitti` okunur. Denetim: ?adatest. Belge 99_godot O3b satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.82 (26 Kasım 2026) · Godot O3a: Çiftçi Ekin, Çayır'da
- `godot-deneme/` yeni derleme (godot dalı: yeni tools/disa_aktar_ekin.js → data/ekin.json EK1–EK8; disa_aktar_yan.js ekin1'i main bayrağıyla alır; yan.gd main görevlerin adımlarını yürütür (_ana_adimlar, ana_yazi); gorev.gd sq'de yan görev, k_ekin; kuzen.gd _ekin, ekin_cayirda; kisi.gd Ekin ayrılınca gizli). Denetim: ?ekintest. Belge 99_godot O3a satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.81 (26 Kasım 2026) · Godot O2: Denizci Barbaros
- `godot-deneme/` yeni derleme (godot dalı: disa_aktar_kisi.js BIYOM=5'e denizci (rol dz, enkaz, resimler drawChibi ile) → data/kisiler_kristal.json, gorevler_kristal.json L görevleri; kuzen.gd _barbaros, dz_burada, enkaz_ciz; kisi.gd Gemi bilinmeden gizli; oyun.gd enkaz düğümü, görünmeyen kişiyle konuşulmaz). Denetim: ?dztest. Belge 99_godot O2 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.80 (26 Kasım 2026) · Godot O1: balık tutma, tuzaklar, gece buluntuları
- `godot-deneme/` yeni derleme (godot dalı: yeni balik.gd; toplama.gd F'de balık/tuzak; oyuncu.gd E ve Boşluk balık tutarken savuşturma/atılma yapmaz, ısırılınca balik.isirik; zaman.gd isikta'da gece bitkisi; gorev.gd "c" (fish:, trap:) sayaçları ve kayıtta qc; oyun.gd kayıtta balik; tools/disa_aktar_alet.js oltalar ve tuzaklar). Denetim: ?baliktest, ?tuzaktest, ?gecetest. Belge 99_godot O1 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v4.79 (26 Kasım 2026) · Godot 5b, 6b: Kül Diyarı ve Mor Kristal Vadisi'nin yan görevleri
- `godot-deneme/` yeni derleme (godot dalı: tools/disa_aktar_yan.js bütün biyomlar → data/yan.json 36 görev; yan.gd aletli git, katır; yoldas.gd katır çizimi). Denetim: ?yantest_korali. Belge 99_godot 5b, 6b satırı. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

## v4.78 (26 Kasım 2026) · Godot 5a, 6a: Kül Diyarı ve Mor Kristal Vadisi
- `godot-deneme/` yeni derleme (godot dalı: disa_aktar_canli.js BIYOM=4/5, disa_aktar_kisi.js BIYOM=4/5, disa_aktar_magara2.js MAG=c4,c5 → data/canlilar_kul/kristal, kisiler_kul/kristal, gorevler_kul/kristal, magara_c4/c5; oyun.gd, gorev.gd, magara.gd listeleri). Denetim: ?git_k_mercan, ?git_k_inci. Belge 99_godot Adım 5–6, 5a, 6a satırları. Web oyununda değişen yalnız verlab.
- Geri almak için: bu commit'i `git revert` et.

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

