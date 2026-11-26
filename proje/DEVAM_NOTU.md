## v5.01 (27 Kasım 2026) · Godot S2c: özel vuruşlar
- `godot-deneme/` yeni derleme (godot dalı: yeni ozel.gd (girişler, ritim penceresi, basılı tutma halkası, 10 silah grubunun 60 hamlesi, şekiller arc/circ/line/krater); oyuncu.gd vuruş girişi ozel.bas/birak'a; oyun.gd `ult` ve ult_ekle). Kilit `kuzen.tanis["ders_<tür>"]` ya da ACT 2. Denetim: ?ozeltest. Belge 99_godot S2c ve S2d satırları. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıtta yeni alan yok).

## v5.00 (27 Kasım 2026) · Godot S2b: ok seçimi, sapan, bola, bileme, kritik, çekiç ve topuz
- `godot-deneme/` yeni derleme (godot dalı: buyu.gd ok seçimi (kayıt `buyu.ok`), sapan/bola, meyveli ağaca atış; canli.gd `yavas`, savuşturma sonrası kritik hakkı (meta pc); envanter.gd oka tıklama; oyun.gd krit_ihtimal/kritik, Dursun'da bileme; oyuncu.gd çekiç (_gurz) ve topuz (_topuz) kuralları, yavaşlama, enerji, sağlam duruş). Denetim: ?s2btest. Belge 99_godot S2b satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `buyu.ok` okunmadan kalır).

## v4.99 (27 Kasım 2026) · Godot S2a: yaylar, oklar ve silah etkileri
- `godot-deneme/` yeni derleme (godot dalı: yeni tools/disa_aktar_yay.js → data/yay.json (yaylar, oklar, verim); buyu.gd yay atışı ve 8 px adımlı çarpışma; canli.gd etki_ver/_etki_isle; oyuncu.gd yakın dövüş etkisi; el_yapimi.gd ok verimi). Denetim: ?yaytest. Belge 99_godot S2a ve S2b satırları. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıtta yeni alan yok).

## v4.98 (27 Kasım 2026) · Godot S1: Reisler
- `godot-deneme/` yeni derleme (godot dalı: yeni reis.gd (sayaç, kuyruk, çağırma, Reis verisi, halka hamlesi, çekilme; kayıt `reis {bc, bd}`); oyun.gd canli_oldu ve bayil kancaları). Denetim: ?reistest. Belge 99_godot: S1 satırı ve yeni S1–S10 planı (web'de olup Godot'da eksik ortak sistemler). Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `reis` alanı okunmadan kalır).

## v4.97 (27 Kasım 2026) · Godot: keşif sisi ve büyük harita
- `godot-deneme/` yeni derleme (godot dalı: yeni harita.gd (keşif 7 karo, sis görüntüsü küçük haritada, büyük harita M, yan görev "?" ve sisli daire, kayıt `kesif` ada başına (ADA_YEREL)); girdi.gd "harita" eylemi (M); oyun.gd yardım satırı). Denetim: ?haritatest. Belge 99_godot "Harita ve keşif" satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `kesif` alanı okunmadan kalır).

## v4.96 (27 Kasım 2026) · Godot: anılar
- `godot-deneme/` yeni derleme (godot dalı: yeni tools/disa_aktar_ani.js → data/ani.json (32 anı, satırlar, kişi konumları/dönüşümleri, sahne yazıları, MIN) + art/ani/<özet>.png (488 tekil kare: arka ve ön katman, iki kişi çizilmeden); yeni ani.gd (tetikleyiciler, kuyruk, pencere, Kitap › Anılar, kayıt `ani {n, k}`); oyun.gd bayılma ve Zümrüt'ün mor kıymık seçeneği, yapi.gd uyku, gorev.gd görev bitişi, kuzen.gd "Götür beni" öncesi söz anısı, el_yapimi.gd Anılar düğmesi). Denetim: ?anitest_waffle, ?anitest_sahil. Belge 99_godot Anılar satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `ani` alanı okunmadan kalır).

## v4.95 (27 Kasım 2026) · Godot A7: Astronot Gökay ve ACT 2'nin sonu
- `godot-deneme/` yeni derleme (godot dalı: yeni tools/disa_aktar_roket.js → art/roket/f_*.png (125), s_*.png (117, kişisiz), data/roket.json; yeni roket.gd (fırlatma, ACT 3 kartı, kavuşma + Karakter.sayfa çizimleri, son kart; tanis["roket"]); act2.gd Gökay (rampa, konuşma, roket parçaları, as ödülleri), kuzen.gd "as" rolü, gorev.gd ACT 2 kartı ve oku Gökay'a). Denetim: ?ada2test_gokay. Belge 99_godot A7 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (tanis["roket"] zararsız kalır).

## v4.94 (27 Kasım 2026) · Godot A6: Ejder Avcısı Tomris ve Işın kılıcı
- `godot-deneme/` yeni derleme (godot dalı: act2.gd Tomris (kafatası yığını, konuşma, Işın kılıcı yapımı, ej ödülleri), oyuncu.gd silah_v Işın kılıcı (menzil 32, ara 0,3) ve plazma kıvılcımları, kuzen.gd "ej" rolü, gorev.gd ACT 2 kartı ve oku Tomris'e). Denetim: ?ada2test_tomris. Belge 99_godot A6 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıtta yeni alan yok).

## v4.93 (27 Kasım 2026) · Godot A5: Mühendis Işın ve Meka zırh
- `godot-deneme/` yeni derleme (godot dalı: act2.gd Işın (golem süsü, konuşma, Meka zırh yapımı, mk ödülleri), oyun.gd stat("move") Meka zırhla ×1,12, oyuncu.gd can_max Meka zırhla ×1,25, kuzen.gd "mk" rolü, gorev.gd ACT 2 kartı ve oku Işın'a). Denetim: ?ada2test_isin. Belge 99_godot A5 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıtta yeni alan yok).

## v4.92 (27 Kasım 2026) · Godot A4: Silahçı Tufan ve ateşli silahlar
- `godot-deneme/` yeni derleme (godot dalı: buyu.gd GUNS/_silah (mermi, saçma yelpazesi), act2.gd Tufan (tezgâh, konuşma, silah yapımı, sl ödülleri), el_yapimi.gd mermi kutusu (10/6), kuzen.gd "sl" rolü, gorev.gd ACT 2 kartı ve oku Tufan'a). Denetim: ?ada2test_tufan. Belge 99_godot A4 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıtta yeni alan yok).

## v4.91 (27 Kasım 2026) · Godot A3: Efsun, mana ve asalar, ikinci adanın köprüleri
- `godot-deneme/` yeni derleme (godot dalı: yeni buyu.gd (mana, mana çubuğu, STAFF, büyü atışları, dondurma, zincir; kayıt `buyu {m, a}`); act2.gd Efsun (şapka, mor ateş, konuşma, asa/iksir yapımı, pv ödülleri → el_yapimi.verilen); canli.gd `donuk`; oyuncu.gd vur → asa varsa büyü; envanter.gd Mana iksiri → +60 mana; kopru.gd BR2 ve ikinci adada görevsiz onarım; gecit.gd PS2 ve görevsiz patlatma; gorev.gd ACT 2 kartı ve oku Efsun'a). Denetim: ?ada2test_efsun, ?ada2test_kopru2. Belge 99_godot A3 satırı (A5 satırından sıradağ çıktı). Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `buyu` alanı okunmadan kalır).

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

