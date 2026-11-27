## v5.15 (27 Kasım 2026) · Godot Son-c: Balık defteri, Bütün sahneler, konuk kart
- `godot-deneme/` yeni derleme (godot dalı: poyraz.gd "Balık defteri"; almanak.gd `ac("deniz")`, konuk kartları (kayıt `alm.k`); ani.gd Bütün sahneler bölümü; hile.gd `love`; ayarlar.gd `butun_sahne` (cihazda); oyun.gd canli_oldu almanak'a canlıyı da verir; ?sontest). Belge 99_godot Son-c. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `alm.k` alanı okunmadan kalır).

## v5.14 (27 Kasım 2026) · Godot Son-b: kendi işaretin ve yol gösterme
- `godot-deneme/` yeni derleme (godot dalı: yeni isaret.gd (T, işaret penceresi, haritada çizim ve tıklama, mavi ok; kayıt `isr`); harita.gd çizim ve tık kancaları; ayarlar.gd "İşaret koy" tuşu; oyun.gd tuş yardımı; ?isrtest). Belge 99_godot Son-b. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `isr` alanı okunmadan kalır).

## v5.13 (27 Kasım 2026) · Godot Son-a: kayıkla gelen yoldaşlar, Kupa panosu
- `godot-deneme/` yeni derleme (godot dalı: evcil.gd `yanina()` (ciftlik.gd kayık geçişi çağırıyordu, yoktu); ev_ici.gd `_kupa_as`, `_kupa_ciz`; oyun.gd `TILSIM`, `tilsimlar` (kayıt `tlsm`), `_taki` tılsım etkileri; ?kupatest). Belge 99_godot Son-a ve Son listesi. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `tlsm` alanı okunmadan kalır).

## v5.12 (27 Kasım 2026) · Godot S10: İstatistikler
- `godot-deneme/` yeni derleme (godot dalı: yeni istatistik.gd (aktif/menü süresi, yol, yapılan, kazanılan/harcanan Vio, toplanan; kayıt `ist`); karakter_pen.gd Karakter · İstatistikler sekmeleri ve Avlanan canlılar listesi; kancalar: el_yapimi.gd yap, istasyon.gd dövme, envanter.gd vio_ekle, toplama.gd; ?isttest). Belge 99_godot S10. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `ist` alanı okunmadan kalır).

## v5.11 (27 Kasım 2026) · Godot S9: Ayarlar ve erişilebilirlik
- `godot-deneme/` yeni derleme (godot dalı: yeni ayarlar.gd (class_name Ayarlar; cihazda user://ayarlar.json: rk, kalp, tit, tam, muzik, efekt, vurgu, tuslar); kayit.gd ana menü ve oyun içi Ayarlar düğmesi, vurgu rengi; renk körü: el_yapimi, istasyon, isikci, yapi, insa; oyuncu.gd titreşim; gizli.gd kalp nabzı; oyun.gd tuş yardımı `yardim_guncelle`; hile.gd Hile paneli, J, meşale; ?ayartest). Belge 99_godot S9. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok; cihazdaki user://ayarlar.json zararsız kalır).

## v5.10 (27 Kasım 2026) · Godot S8: Arena ve hileler
- `godot-deneme/` yeni derleme (godot dalı: yeni hile.gd (class_name Hile, statik oturumluk anahtarlar, cheat ve kol kodu, ped, pencere, eşya arama) ve arena.gd (halka, seviye/yuva/silah seçici, iki adanın canlıları ve Reisleri, hasar ölçümü, Gerçek dövüş); kancalar: oyun.gd arena girişi, engel, canli_oldu, _dogur, bayil (Tanrı); kayit.gd Arena düğmesi ve kayıt kapalı; envanter.gd sınırsız Vio ve dayanıklılık; canli.gd tek vuruş ve arena hasarı; oyuncu.gd arena hasarı; zaman.gd gece ışığı; ys, gizli, almanak, basarim arenada kapalı; ?hiletest, ?arenatest). Belge 99_godot S8 ve Son. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.09 (27 Kasım 2026) · Godot S7b: gizli şeyler
- `godot-deneme/` yeni derleme (godot dalı: yeni gizli.gd (deniz yolu, sevdiğin kişi, kazana çöp ve görünmezlik, Börü'nün kemeri, 100. gece yıldızları, eski kamp ateşi, ayna, dans, inatçı balıkçı, 03:00, Devam satırı, Seni hatırlıyorum; kayıt `gizli`, cihaz user://gizli.json); kancalar: oyun.gd engel (yol), canli.gd görünmez ve dans izleyicisi, oyuncu.gd saydamlık ve yumruk, istasyon.gd "Çantan" şeridi, balik.gd olta, konusma.gd 03:00, uyanis.gd hatırlama, kayit.gd Devam, yildizsiz.gd ve zaman.gd yıldızlı gece). Belge 99_godot S7b. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `gizli` alanı okunmadan kalır).

## v5.08 (27 Kasım 2026) · Godot S7a: Keşif defteri ve Zümrüt'ün bilmecesi
- `godot-deneme/` yeni derleme (godot dalı: yeni kesif.gd (ulaşılır tarifler, kategoriler, ödüller, ustalıklar, bilmece; kayıt `kdef {c, b, n}`); ustalık etkileri: envanter.gd tokluk ve körelme, oyuncu.gd can, oyun.gd savunma, mesale.gd, toplama.gd hız, canli.gd düşürme, balik.gd, pazar.gd satış; el_yapimi.gd Keşif defteri sayfası ve Anılar'da bilmece; Zümrüt konuşmasında bilmece; ?kdeftest). Belge 99_godot S7a/S7b satırları. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `kdef` alanı okunmadan kalır).

## v5.07 (27 Kasım 2026) · Godot S6: Başarımlar
- `godot-deneme/` yeni derleme (godot dalı: yeni basarim.gd (49 başarım, cihaz kaydı user://basarim.json, kart, liste, rozet; kayıt yuvasında `bsr {f}`); kancalar: oyun.gd canli_oldu/bayil/agac_devrildi, envanter.gd ekle, toplama.gd düğüm; ?bsrtest). Belge 99_godot S6 ve S7 satırları. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `bsr` alanı okunmadan kalır; cihazdaki user://basarim.json kalır, zararsız).

## v5.06 (27 Kasım 2026) · Godot S5: Almanak
- `godot-deneme/` yeni derleme (godot dalı: yeni almanak.gd (düğme, pencere, sayfalar, kartlar, ilan kuyruğu, rozet; kayıt `alm {bak, bg, a}`); oyun.gd canli_oldu → almanak.avlandi, ?almtest; girdi.gd U "almanak"; balik.gd ilk balık; magara.gd boss_gordu). Belge 99_godot S5 satırı ve Son listesi. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `alm` alanı okunmadan kalır).

## v5.05 (27 Kasım 2026) · Godot S3b: hayvanların tutumu; belge boss boyu kararı
- `godot-deneme/` yeni derleme (godot dalı: canli.gd tutum alanları `fark/uyari/kacis/kac_sans/son_vur/av/avci/yeme_t`, `_tutum_var/_iri/_cekiniyor/_suru_fark/_avlan/av_ol`; oyuncu.gd `hiz_kip`; oyun.gd `_cimen_yeri`, ?tutumtest). Belge 99_godot S3b satırı; 37_magaralar "Boss'ların görünüşü" boy kuralı (27 Kasım 2026, Boğaç). Web oyununda kod değişmedi.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.04 (27 Kasım 2026) · Godot S4: mor ışık saldırıları ve Yıldızsızlar
- `godot-deneme/` yeni derleme (godot dalı: yeni yildizsiz.gd (takvim, iki dalga, mor örtü, sütunlar, Vio, Börü/Zümrüt/Kemal yardımı, Konuk; kayıt `ys {n, c, o, k}`), data/yildizsiz.json (web YSG ızgaraları, tools/disa_aktar_ys.js); canli.gd `kind "ys"` çizimi ve solma; oyun.gd uzaklaşınca silmeme, canli_oldu; zaman.gd saldırıda aydınlık ve mor renk). Denetim: ?ystest. Belge 99_godot S4 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `ys` alanı okunmadan kalır).

## v5.03 (27 Kasım 2026) · Godot S3: imza hamleleri ve sürü taktiği
- `godot-deneme/` yeni derleme (godot dalı: canli.gd imza hamleleri (`imza`, `imza_t`, IMZA tablosu, `_imza_basla/_imza_isle/_imza_ciz`, vur-kaç ısırık ve atıştan sonra), kurt sürüsü dolanması (`_suru_yeri`); ozel.gd arkadan uyarı oku; oyun.gd SURUM "Godot · S3"). Denetim: ?imzatest. Belge 99_godot S3 satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.02 (27 Kasım 2026) · Godot S2d: dövüş dersleri ve ulti
- `godot-deneme/` yeni derleme (godot dalı: yeni dovus.gd (7 ders, alıştırma canavarı, ders kutusu, ulti çubuğu, 10 ulti; kayıt `dovus {ult, od}`, öğrenilen `kuzen.tanis["ders_<tür>"]`); ozel.gd derste hamle açık, isabet bildirimi; oyuncu.gd ulti kazancı; gezgin.gd R ulti doluyken köpekleri açmaz; oyun.gd Börü'de "Dövüş dersleri"). Denetim: ?derstest. Belge 99_godot S2d satırı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `dovus` alanı okunmadan kalır).

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
