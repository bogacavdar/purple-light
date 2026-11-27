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

## v5.29 (27 Kasım 2026) · Godot Son-r: fare imleci, köpek kamerası kayıtları
- `godot-deneme/` yeni derleme (godot dalı: yeni imlec.gd, kopek.gd; oyun.gd kayıt `dlog`, bayıl kaydı; basarim.gd kazanınca kayıt). Belge 99_godot Son-r. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`dlog` alanı okunmaz, zararsız).

## v5.28 (27 Kasım 2026) · Godot Son-p: eylem ipucu, rozet, biyom sınırı
- `godot-deneme/` yeni derleme (godot dalı: yeni istem.gd; envanter.gd rozet + _rozet_resim; canli.gd _sinir (hb); ?istemtest, ?rozettest). Belge 99_godot Son-p; ComfyUI çizimleri taşımanın dışına alındı (Boğaç kararı). Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.27 (27 Kasım 2026) · Godot Son-o: canlıların sesleri, itilme
- `godot-deneme/` yeni derleme (godot dalı: ses.gd `canli()`, data/canli_ses.json + art/ses/canli/*.ogg (tools/disa_aktar_canli_ses.js); canli.gd acı/ölüm/saldırı sesi ve _physics_process itilme). Belge 99_godot Son-o. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.26 (27 Kasım 2026) · Godot Son-n: gece beliren yazılımcı
- `godot-deneme/` yeni derleme (godot dalı: yeni yazilimci.gd; oyun.gd kayıt `v330dev`; ?devtest). Belge 99_godot Son-n. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`v330dev` alanı okunmaz, zararsız).

## v5.25 (27 Kasım 2026) · Godot Son-m: kıyıya vuran şişeler
- `godot-deneme/` yeni derleme (godot dalı: yeni sise.gd; oyun.gd kayıt `sise`; toplama.gd şişe yerde kaybolmaz; hikaye.gd Ada halkı sayfasına mektuplar; ?sisetest). Belge 99_godot Son-m. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`sise` alanı okunmaz, zararsız).

## v5.24 (27 Kasım 2026) · Godot Son-l: işe yarayan eşyalar, meşale kuralları
- `godot-deneme/` yeni derleme (godot dalı: balik.gd yem (_roll → _roll0), canli.gd bıçak ve mesale_yak (acc), oyun.gd bayılma çanta, ciftlik.gd Gübre, buyu.gd Ok kılıfı, mesale.gd Golem feneri/recine()/asinma(), oyuncu.gd meşale silahı ve duman, kamp.gd duman()/tütsü; girdi/ayarlar L "recine"; tools/disa_aktar_kozle.js ile 30 közlenmiş eşya (resim, items, pazar); ?islevtest). Belge 99_godot Son-l. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.23 (27 Kasım 2026) · Godot Son-k: kamp ateşi, ateşte pişirme
- `godot-deneme/` yeni derleme (godot dalı: yeni kamp.gd + data/ates_pisir.json (tools/disa_aktar_ates.js); oyun.gd F sırasında kamp.f, kayıt `kamp`, kayıtta hepsini_pisir; zaman.isikta/kampta, soguk, yildizsiz kamp ateşi; oyuncu.vur kamp; girdi/ayarlar V "kamp"; el_yapimi ateş yemeklerini gizler; istasyon öğrenme yazısı; harita alev; ?kamptest). Belge 99_godot Son-k. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`kamp` alanı okunmaz, zararsız).

## v5.22 (27 Kasım 2026) · Godot Son-j: yemek etkileri ve yemek listesi
- `godot-deneme/` yeni derleme (godot dalı: yeni yemek.gd + data/yemek.json (tools/disa_aktar_yemek.js); oyun.stat çarpanı `yemek.kat`, kayıt `yemek {kn, pb}`, pencere_acik; envanter X tuşu yemek.gd'ye, doygun; zaman.isikta göz; oyuncu.etki_ekle panzehir/ateşsiz/pıhtı; ?yemektest). Belge 99_godot Son-j…n. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`yemek` alanı okunmaz, zararsız).

## v5.21 (27 Kasım 2026) · Godot Son-i: müzik aletleri
- `godot-deneme/` yeni derleme (godot dalı: ses.gd `alet_mi/alet_cal/alet_ara`, data/muzik.json + art/ses/muzik/*.ogg (tools/disa_aktar_muzik.js); oyuncu.gd vur başında alet; envanter.gd aletler kemere; ?muziktest). Belge 99_godot Son-i. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.20 (27 Kasım 2026) · Godot Son-h: Tuncay'ın halat yolları
- `godot-deneme/` yeni derleme (godot dalı: yeni halat.gd + data/halat.json (tools/disa_aktar_halat.js); oyun.gd Tuncay kişisi (rol "hl"), F sırasında `halat.f()`, kayıt `halat`; kuzen.gd "hl", kisi.gd görünürlük; konusma.gd `soluk` seçenek; harita.gd çizim; ?halattest). Belge 99_godot Son-h, Son-i; "fenerciler ve ipli yollar yok" notu düzeltildi (ipli yollar = halat yolları). Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`halat` alanı okunmaz, zararsız).

## v5.19 (27 Kasım 2026) · Godot Son-g: üşüme, buzlanma, ayak izleri
- `godot-deneme/` yeni derleme (godot dalı: yeni soguk.gd (üşüme, buz köşeleri, ayak izleri; art/ayakizi.png web v435iz'den); oyun.gd kayıt `usume`, bayılınca sıfırlanır; hava.gd efekt katmanı layer 0). Belge 99_godot Son-g. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (`usume` alanı okunmaz, zararsız).

## v5.18 (27 Kasım 2026) · Godot Son-f: mevsimler, hava, sıcaklık, kar
- `godot-deneme/` yeni derleme (godot dalı: yeni hava.gd: mevsim, gece_sn, hava zinciri, sıcaklık, kar örtüsü, ekran çizimi, sis shader'ı, mevsim çemberi, Mor gece; bağlantılar zaman (gece hızı, saat yazısı), envanter (kış tokluğu), mesale (yanma katı), balik (bekleme, mevsim balığı), canli (sis), toplama (`mevsim_k`, `_bitir2`), yildizsiz `zorla()`, ses (rain/wind); ?havatest). Kayıt alanı `hava {kar, mg, k, t}`. Belge 99_godot Son-f, Son-g. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (eski kayıtlar `hava` alanını okumaz, zararsız).

## v5.17 (27 Kasım 2026) · Godot Son-e: sesler ve müzik
- `godot-deneme/` yeni derleme (godot dalı: yeni ses.gd: müzik bölgeye göre çapraz geçiş, ortam döngüleri swamp/ash/surf, `cal(k)` efekt havuzu; art/ses/ 39 dosya (WAV efekt, OGG müzik/döngü) `tools/disa_aktar_ses.js` ile web sentezinden; bağlantılar envanter/toplama/istasyon/el_yapimi/oyuncu/canli/balik/buyu/yildizsiz; ?sestest). Belge 99_godot Son-e, Son-f (hava, sıradaki), Son satırından "fenerciler" çıkarıldı. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.16 (27 Kasım 2026) · Godot Son-d: silahçılarda bileme, Derse dön
- `godot-deneme/` yeni derleme (godot dalı: kuzen.gd silahçıda "Aletimi bile"; dovus.gd 280 px'te Derse dön / Dersi bırak (ücret iadesi), `soruldu`; poyraz.gd gereksiz `_cik` kaldırıldı; ?dersdon). Belge 99_godot Son-d. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıt alanı yok).

## v5.15 (27 Kasım 2026) · Godot Son-c: Balık defteri, Bütün sahneler, konuk kart
- `godot-deneme/` yeni derleme (godot dalı: poyraz.gd "Balık defteri"; almanak.gd `ac("deniz")`, konuk kartları (kayıt `alm.k`); ani.gd Bütün sahneler bölümü; hile.gd `love`; ayarlar.gd `butun_sahne` (cihazda); oyun.gd canli_oldu almanak'a canlıyı da verir; ?sontest). Belge 99_godot Son-c. Web oyununda değişen yok.
- Geri almak için: bu commit'i `git revert` et (kayıttaki `alm.k` alanı okunmadan kalır).
