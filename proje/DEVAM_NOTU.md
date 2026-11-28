## v5.49 (28 Kasım 2026) · Godot: ortam parçacıkları
- Godot `grafik.gd`: `Ortam` (follow_viewport CanvasLayer, CanvasModulate'ten etkilenmez), `_ortam_tur/_ortam`. Test kancası `grafiktest&bioN&gece`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.48 (28 Kasım 2026) · Godot: parıltı ve gölge
- Godot `grafik.gd`: `PARILTI`, `_isik_kur/_parilti` (12 PointLight2D havuzu, 0,4 sn'de en yakınlar), `Golge` (maden ve çalı düğümlerine show_behind_parent çocuk). Test kancası `grafiktest&bioN&gece`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.47 (28 Kasım 2026) · Godot: biyom renk havası ve rüzgâr
- Godot: yeni `scripts/grafik.gd` (oyun.gd'de `grafik`; `renk_guncelle` biyom tonuyla çarpar; `RUZGAR` gölgelendiricisi ağaç `spr` ve ot düğümlerine, `dugum_ekle` de `ot_ver` çağırır). CLAUDE.md: "EKRANI OYNATAN EFEKT YOK" kuralı. Test kancası `grafiktest` (`&bio2`..`&bio5`). Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.46 (28 Kasım 2026) · Godot: eldeki alet
- Godot `oyuncu.gd`: `_elde_ciz()`, `elde_spr`, `ELDE_Z` (web drawHeld + v322tier z). Test kancası `eldetest`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.45 (28 Kasım 2026) · Godot: maden kayası duvardır
- Godot `oyun.gd`: `kaya_at()` (48 px ızgara, 1,5 sn'de bir ya da düğüm sayısı değişince yeniden kurulur), `engel()` onu sorar; `_kaya_kurtar()` (_process, 0,25 sn). Web v229. Test kancası `kayaduvar`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.44 (28 Kasım 2026) · Godot: yunuslar
- Godot: yeni `scripts/yunus.gd` (web v67; oyun.gd'de `yunus`), resim `art/yunus.png` (web DROWS/DPAL'den). Test kancası `yunustest`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.43 (28 Kasım 2026) · Godot: farenin altındakinin adı
- Godot `imlec.gd`: `_ipucu_kur/_ipucu/_ne/_kazma` (web v146 hovtip). Test kancası `ipucutest`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.42 (28 Kasım 2026) · Godot: Börü B5 eşyası
- Godot `gorev.gd`: `_b5_esya()` (web v426b5), `giyili()`; "any" ilerlemesi giyileni de sayar, satırı p[2]/p[3] etiketini kullanır. Test kancası `b5test`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.41 (28 Kasım 2026) · Godot: onay kutusu
- Godot `konusma.gd`: `onay(metin, f, evet, hayir)` (web confirmBox #q2cf; `onay_kat`, `onay_kutu`, Enter = evet, dışarı/Esc = Vazgeç). kopru.gd, gecit.gd, kuzen.gd (gemi) bunu çağırır. Test kancası `onaytest`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.40 (28 Kasım 2026) · Godot: takla
- Godot `oyuncu.gd`: `TAKLA_T` 0,46, `TAKLA_D` 50, kesin integralle hareket (F(k)=1,7k−0,7k²), bekleme en az 0,76; `_takla_kur/_takla_poz/_takla_ciz` (art/takla.png 16×3, data/takla.json; `tools/disa_aktar_takla.js` web v315roll'dan). Test kancası `taklatest`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.39 (28 Kasım 2026) · Godot: silahların kademe kimliği
- Godot: yeni `scripts/kademe.gd` (oyun.gd'de `kademe_k`; kayıt alanı `v322 {b}`), sesler `art/ses/kademe/` (`tools/disa_aktar_kademe.js` web v322tier `snd`'yi yakalayıp OfflineAudioContext ile kaydeder). Çağıranlar: oyuncu.gd `vur` (savur/isabet/patla), buyu.gd `_yay`/`_vur`/`_draw` (S.ok), envanter.gd `ekle` (alindi), ses.gd `kademe()`, duyuru.gd `degistir()`. Test kancası `kademetest` (`&yavas`). Geri almak: bu commit'i `git revert` et; eski kayıtta `v322` okunmazsa yok sayılır.

## v5.38 (27 Kasım 2026) · Godot: öğretici kartını küçültme, Görevler'de ders
- Godot `ogretici.gd` (`kart_kucult`, `parla`), `ayarlar.gd` (`ders_kucuk`, ayar dosyasında `tutmin`), `yan.gd` `_pencere_yaz` (Ders bölümü), `hud_menu.gd` (öğretici kartı sütunun soluna). Web v307tut/v307qlog. Test kancası `derskart`. Geri almak: bu commit'i `git revert` et (oyun kaydı alanı yok; ayar dosyasındaki `tutmin` okunmazsa yok sayılır).

## v5.37 (27 Kasım 2026) · Godot: balta dersinde El yapımı kilidi
- Godot `el_yapimi.gd`: `_ders_parca`, `_ders_bak`, `_mavi`, `ders_k` (öğretici tz 12; web v393lock). oyun.gd test kancası `baltakilit`. Geri almak: bu commit'i `git revert` et (kayıt alanı yok).

## v5.36 (27 Kasım 2026) · Godot: ekran ortası afişler ve doğma kuşakları
- Godot: yeni `scripts/duyuru.gd` (gün/seviye/keşif afişleri; zaman.gd, envanter.gd, istasyon.gd, gorev.gd, kopru.gd, hava.gd onu çağırır). oyun.gd: `_ldepth_kur`, `BANDR`, `dogabilir()` (`_dogur_tur` her yerde sorar); test kancaları `duyurutest`, `kusaktest`. Geri almak: duyuru.gd'yi sil, çağrıları `env.mesaj`'a döndür; `dogabilir` satırını kaldır. Kayıt alanı yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.35 (27 Kasım 2026) · Ekin'in hikâyesi EK3/EK5/EK8'e bağlandı (Boğaç)
- Web: `farmer` hikâyesi (ST_ verisi, satır ~10755) ids f1–f3 → EK3/EK5/EK8, "Kızı Gül" → "Kız kardeşi Gül", Gül "Baba" yerine "Abla" der; `unlocked()` EK görevlerinin motorunu (`window.__q2.d`) da sayar. Godot: data/hikaye.json aynı. Belge 30_act1 Çiftçi Ekin › Ekin'in hikâyesi, 99_godot.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.34 (27 Kasım 2026) · Godot 7b: masaüstü çıktısı
- godot dalı: export_presets.cfg'ye Windows ve Linux (embed_pck, modify_resources kapalı), .gitignore build/windows, build/linux. Dışa aktarma şablonları (4.7.1) GitHub'dan indirildi. `godot-deneme/` web derlemesi değişmedi (yeniden derlendi). Belge 99_godot 7b. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et.

## v5.33 (27 Kasım 2026) · Godot 7a: dokunmatik
- `godot-deneme/` yeni derleme (godot dalı: yeni dokun.gd; oyuncu.gd dokunmatikte fare vuruşu kapalı, yürüyüş `dokun.yon`; boyut.gd dokunmatikte tam ekran pencere). Belge 99_godot 7a. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.32 (27 Kasım 2026) · Godot Son-u: kontrol eksikleri
- `godot-deneme/` yeni derleme (godot dalı: yeni kontrol.gd; toplama.gd `f_bas()`; oyuncu.gd sol tık `kontrol.tikla`, yürüyüş `kontrol.yon`; envanter.gd kemer yuvası sol/sağ tık; girdi/ayarlar H "eli_bosalt"; ?tiklatest). Belge 99_godot Son-u. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.31 (27 Kasım 2026) · Godot Son-t: ekran düzeni, büyütülen pencereler
- `godot-deneme/` yeni derleme (godot dalı: yeni hud_menu.gd, boyut.gd (class_name Boyut); basarim.gd düğme sağ üst sütunda; canta/yemek/kamp/istasyon/sinan/pazar/el_yapimi Boyut.bagla). Belge 99_godot Son-t. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.30 (27 Kasım 2026) · Godot Son-s: envanter penceresi, toplama bildirimi
- `godot-deneme/` yeni derleme (godot dalı: yeni canta.gd (envanter.canta artık bu), envanter.gd kemere sürükle-bırak, topla_bildir; toplama.gd _al; ?rozettest). Belge 99_godot Son-s. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).
