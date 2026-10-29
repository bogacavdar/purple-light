---
name: "purple-light-surum-yayinla"
description: "Purple Light oyununda bir değişikliği belgeye yazıp koda geçirip aynı turda GitHub Pages'e yayınlamak için; her oyun ya da belge güncellemesinde kullan."
---

# Purple Light · sürüm yayınlama

Bu adımlar `CLAUDE.md`'deki kuralların uygulanış sırasıdır. Bir adım atlanırsa iş bitmiş sayılmaz. Asıl kural: **her güncelleme aynı turda yayına gider** ve Boğaç'a **her zaman indirilebilir hali** verilir. Zip tek başına güncelleme sayılmaz; yayının yerine geçmez, yayına ek olarak her zaman gönderilir.

## 0. Depo

- Oturumda depo yoksa ilk iş: `add_repo` (owner `bogacavdar`, repo `purple-light`, access `push`) → `git clone --depth 1 https://github.com/bogacavdar/purple-light /home/claude/purple-light` (uzun zaman aşımıyla) → `register_repo_root`.
- Geliştirme **yalnızca bu klonda** yapılır; scratch kopyalarda çalışılıp sonra kopyalanmaz.
- Başlamadan `git fetch origin main` ve gerekiyorsa rebase.

## 1. Önce belge

- Değişikliği önce tasarım belgesine yaz: kaynak `proje/tools/belge/parts/*.md` (belge bu parçalardan üretilir).
- `proje/Hammadde_tasarim_belgesi.md`'yi doğrudan düzenlediysen aynı değişikliği ilgili `parts/*.md` dosyasına da işle; yoksa `yayinla.sh` değişikliğini ezer.
- Kodda yazacağın her davranış (sayı, metin, kural, koşul) belgede yazılı olmalı. Belgede olmayan hiçbir şeyin kodu olmaz. Belge ile kod çelişirse belge doğrudur.
- Büyük değişiklikte belgeyi Boğaç'a gösterip onay al, sonra koda geç.

## 2. Sonra kod

- Geliştirme kopyası: `proje/Hammadde_prototip.html`.
- Yeni davranış `</body>` öncesine sürüm numaralı yeni bir `<script id="vNNN">` bloğu olarak eklenir; `window.__plEval` ile oyunun kapsamında çalışır, eski fonksiyonlar `const _x=f; f=function(){…}` ile sarılır.
- ES2018: `?.` ve `??` yok (`nn(a,b)` kullan).
- Sürüm etiketi: ana menüdeki `<small id="verlab">Versiyon X.YZ</small>` bir artırılır (1.86 → 1.87 … 1.99 → 2.00).
- Yayın kopyası: kök `index.html` = prototip + 11. satırdan sonra 4 satır (manifest, apple-touch-icon, service worker kaydı, telefon notu). Bu 4 satırı koruyarak güncelle; `sw.js`'e dokunma.

## 3. Kontrol

- Yalnızca sözdizimi: `NODE_PATH=/opt/node-tools/node_modules node proje/tests/chk.js proje/Hammadde_prototip.html` ve aynısı `index.html` için. `errors 0` olmalı; `?.`/`??` sayıları bir önceki sürümden artmamalı.
- Boğaç açıkça istemedikçe Playwright, ekran görüntüsü ya da test paketi çalıştırma.

## 4. Belgeyi yenile

- Belgenin başındaki sürüm satırını (`parts/00_giris.md`, "Sürüm: **Versiyon X.YZ** ile birebir (tarih; …)") her sürümde yeni numaraya ve tarihe getir, sonuna o sürümün bir cümlelik özetini ekle. Atlanırsa yayındaki belge eski sürümü gösterir.

- Depo kökünden: `bash proje/tools/belge/yayinla.sh`. Bu `belge.html`, `belge.pdf`, `belge.md` ve `proje/` kopyalarını yeniler.

## 5. Not

- Depo kökündeki `GUNCELLEME_NOTLARI.md`'nin en üstüne `## Versiyon X.YZ · tarih` başlığıyla o sürümün notunu ekle: **bütün değişiklikler**, şu başlıklarla (olmayan başlık yazılmaz): Oynanış, Düzeltmeler, Görsel, Ses, Arayüz, Kayıtlar, Tasarım belgesi, Proje. Görsel değişiklikten belge değişikliğine kadar hiçbir şey atlanmaz; oyuncunun anlayacağı dille.

- `proje/DEVAM_NOTU.md`'nin başına `## vX.YZ (tarih) · kısa başlık` bölümü ekle: ne değişti, hangi kod bloğu, eski kayıtlara etkisi.

## 6. Gönder

- `git add -A` → Türkçe, sürüm numaralı commit (`vX.YZ: …`) → `git push origin main`.
- Push'un gerçekten gittiğini `git log --oneline -1 origin/main` ile doğrula.

## 7. İndirilebilir hal (her seferinde)

- Push'tan sonra yayındaki sürümün tüm projesini zip'le: `git archive --format=zip --prefix=purple-light/ -o <scratchpad>/purple-light_vX.YZ_proje.zip origin/main` (`.git` girmez; GitHub'daki sürümün birebir kopyası).
- Zip'i **her güncellemede, istenmese de** `SendUserFile` ile Boğaç'a gönder.
- `GUNCELLEME_NOTLARI.md`'yi de her seferinde dosya olarak gönder.
- Tasarım belgesi değiştiyse `belge.pdf`, `belge.html` ve `belge.md`'yi de dosya olarak gönder.

## 8. Boğaç'a dönüş

- Kısa: ne değişti, commit numarası.
- Linkler her zaman:
  - Oyun: https://bogacavdar.github.io/purple-light/
  - Güncelleme notları: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.md
  - Belge (indirilebilir): https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Ana menüde yeni sürüm numarası görünüyorsa yayın gelmiştir (GitHub Pages 1–2 dakika sürer).
- Belge yerine artifact, depo içi yol ya da başka bir sayfa linki verilmez; her zaman yukarıdaki indirilebilir linkler ve dosyalar.