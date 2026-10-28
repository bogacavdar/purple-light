# Kullanılan teknolojiler

Bu bölüm oyunun ve projenin **neyle yapıldığını** anlatır: hangi programlama dilleri, hangi grafik/ses teknolojileri, hangi tarayıcı özellikleri ve hangi araçlar (28 Ekim 2026, Versiyon 1.83 itibarıyla). Oyun bir **web oyunudur**: tarayıcıda çalışır, kurulum istemez; bilgisayarda, telefonda ve tablette **aynı tek dosya** çalışır.

## Teknoloji özeti

| Alan | Teknoloji | Projede ne için |
|---|---|---|
| Ana programlama dili | **JavaScript** (ECMAScript 2018) | Oyunun tamamı: oyun döngüsü, hareket, dövüş, canavar yapay zekâsı, toplama, tarifler, görevler, ekonomi, kayıt, menüler, ses üretimi, grafik katmanı |
| Sayfa yapısı | **HTML5** | Oyunun tek dosyası; menüler, paneller, düğmeler, diyalog kutuları |
| Görünüm | **CSS3** | Arayüz tasarımı: Grid/Flexbox yerleşim, animasyonlar (`@keyframes`), telefon ve bilgisayara göre ayar (`@media`), çentikli ekran payı (`safe-area`), piksel görünüm (`image-rendering: pixelated`) |
| Grafik (ekran kartı) | **WebGL** (OpenGL ES 2.0'ın tarayıcı karşılığı) | Oyun dünyasının ekran kartıyla çizilmesi |
| Gölgelendirici dili | **GLSL** (OpenGL Shading Language) | WebGL'in köşe (vertex) ve piksel (fragment) gölgelendiricileri |
| Grafik (yedek) | **HTML5 Canvas 2D** | WebGL yoksa ya da kapatılırsa çizim; ikon ve sprite'ların hazırlanması |
| Vektör çizim | **SVG** | Menü simgeleri, yetenek ağacının ikonları ve dalları |
| Ses | **Web Audio API** (AudioContext, OfflineAudioContext) | Müzik ve bütün ses efektleri kodla üretilir (ses dosyası yok) |
| Veri biçimi | **JSON** | Tarif/eşya veritabanı (oyun dosyasının içinde gömülü), kayıt dosyaları |
| Kayıt | **Web Storage (localStorage)** | Kayıt yuvaları, ayarlar, kayıtların dışa/içe aktarılması (Blob, FileReader ile dosya indirme/yükleme) |
| Uygulama olarak yükleme | **PWA** (Progressive Web App): **Web App Manifest** + **Service Worker** | Telefona/bilgisayara uygulama gibi kurulma, tam ekran açılma, **internetsiz çalışma** |
| Dokunma ve fare | **Pointer Events**, Keyboard Events | Klavye/fare ve dokunmatik kontrollerin tek kodla yönetimi |
| Cihaz özellikleri | **Fullscreen API**, **Screen Orientation API**, **Vibration API**, `matchMedia`, `devicePixelRatio`, Page Visibility | Tam ekran, yatay ekran kilidi, telefonda titreşim, cihaz türünü anlama, net görüntü, arka plana geçince duraklama |
| Yerelleştirme | **Intl** (`toLocaleString('tr-TR')`) | Türkçe sayı biçimi (1.000), Türkçe büyük/küçük harf |
| Erişilebilirlik | **ARIA** etiketleri, `prefers-reduced-motion` | Ekran okuyucu etiketleri, hareketi azaltma tercihi |
| Yazı tipi | **Rubik** (Google Fonts) | Arayüz yazısı; internet yoksa sistem yazı tipi |
| Yayın | **GitHub Pages** | Oyunun ve belgenin internetteki adresi |
| Kaynak kodu ve sürüm takibi | **Git** + **GitHub** | Her sürüm `main` dalına gönderilir |
| Testler ve kontrol | **Node.js**, **Playwright** (Chromium), **acorn**, **acorn-walk** | Sözdizimi kontrolü, otomatik oyun testleri, belgenin PDF'e çevrilmesi |
| Belge ve veri araçları | **Python 3** (+ Markdown kütüphanesi), **Bash** | Tasarım belgesini üretme, tarif/eşya verisi ve ACT 2 içeriği üreten betikler |
| Belge biçimi | **Markdown**, HTML, PDF | Tasarım belgesi ve indirilebilir kopyaları |
| Yapay zekâ desteği | **Claude** (Anthropic), Claude Code | Kodlamada, tasarım belgesinin yazımında ve testlerde kullanılır: yapay zekâ oyunu gerçek bir tarayıcıda oynatan test turları koşar, hataları bulup raporlar ve düzeltir; oyun ve belge claude.ai artifact'ı olarak da yayınlanır |

**Kullanılmayanlar:** Oyun motoru (Unity, Godot, Unreal, Phaser vb.) ve hazır JavaScript kütüphanesi (React, Three.js, PixiJS vb.) **yoktur**; her şey sıfırdan yazıldı. Sunucu tarafı kod (backend) ve veritabanı sunucusu **yoktur**; oyun tamamen oyuncunun cihazında çalışır. Dışarıdan resim ya da ses dosyası **yüklenmez**.

## Programlama dilleri

- **JavaScript** projenin ana dilidir: oyunun bütün kodu JavaScript'tir (yaklaşık 1,9 MB'lık tek HTML dosyasının içinde, 60'tan fazla `<script>` bloğu). Eski telefonlar da çalıştırabilsin diye **ECMAScript 2018** sınırında kalınır: `?.` ve `??` gibi yeni yazımlar kullanılmaz (yerine `nn(a,b)` yardımcısı), her sürümde `chk.js` ile denetlenir.
- **GLSL** yalnızca ekran kartı gölgelendiricilerinde (birkaç satır).
- **HTML ve CSS** arayüz için.
- **Python** ve **Bash** oyunun içinde yoktur; yalnızca geliştirme araçlarıdır (belge üretimi, veri betikleri).

## Grafik: WebGL, GLSL ve Canvas 2D

- Oyun dünyası bir `<canvas>` üstünde çizilir: **karo (tile) tabanlı 2D dünya** (bir karo 16 piksel, her ada 645 × 464 karo), üstten bakış, piksel sanatı.
- Çizim kodu Canvas 2D komutlarıyla yazılmıştır (dikdörtgen, resim, yol, yazı, renk geçişi, saydamlık, dönüşüm, karışım modları).
- **v68'den beri** bu komutları oyuna özel yazılmış **GL2D** katmanı alır ve **WebGL** ile ekran kartına gönderir:
  - Binlerce küçük çizim birkaç büyük **toplu çizime** (batch) çevrilir.
  - Küçük resimler büyük **doku atlaslarında** (texture atlas) toplanır.
  - Karmaşık şekiller **üçgenlere bölünür** (earcut yöntemi).
  - Işık, gölge ve gece efektleri için **karışım modları** (blend) ekran kartında uygulanır.
  - Köşe ve piksel gölgelendiricileri **GLSL** ile yazılmıştır.
- WebGL yoksa ya da hata verirse oyun kendiliğinden **Canvas 2D**'ye döner. Ayarlar › Grafik › "Ekran kartıyla çiz" ile elle kapatılabilir.
- **Piksel resimler kodla çizilir:** eşyalar, karakterler (seçilebilir ten, saç, göz, kıyafet), canavarlar, ağaçlar ve harita 16×16 piksellik metin şablonlarından ya da çizim kodundan üretilir. Dışarıdan resim dosyası yoktur.
- Resim yumuşatma kapalıdır (`imageSmoothingEnabled = false`, `image-rendering: pixelated`), böylece pikseller keskin kalır.
- **SVG:** menü simgeleri ve yetenek ağacı (ikonlar, dallar).

## Ses: Web Audio API

- Müzik ve efektler oyun açılırken kodla (osilatör, gürültü, zarf, filtre) **OfflineAudioContext** içinde bir kez üretilir, ses tamponlarına yazılır ve tek bir **AudioContext** üzerinden çalınır.
- Ses dosyası (mp3, ogg) yoktur; oyun bu yüzden tek dosyadır ve internetsiz çalışır.
- Tarayıcı kuralı gereği ses, oyuncunun ilk dokunuşu ya da tuşa basmasıyla açılır. Eski Safari sürümleri için ayrı uyumluluk yolları vardır.

## Veri ve kayıt

- **Tarif ve eşya veritabanı** (tarifler, malzemeler, fiyatlar, kategoriler) oyun dosyasının içine gömülü bir **JSON** bloğudur (`<script type="application/json" id="db">`).
- **Kayıt:** tarayıcının **localStorage** deposuna JSON olarak yazılır (kayıt yuvaları, otomatik kayıt, ayarlar). Kayıtlar **dosya olarak dışa aktarılıp** başka bir cihazda içe aktarılabilir.
- Kayıt biçimi sürümler arasında **geçiş (migration)** kodlarıyla korunur: eski bir kayıt yeni sürümde açılabilir.

## Uygulama olarak yükleme (PWA)

- `manifest.webmanifest`: uygulama adı, simgeleri (`icon-192.png`, `icon-512.png`), tam ekran ve yatay açılma.
- `sw.js` (**Service Worker**): oyunu cihaza kopyalar; internet varken her zaman en yeni sürümü alır, yokken kayıtlı kopyayı açar.

## Dosya düzeni

| Dosya | Ne işe yarar |
|---|---|
| `proje/Hammadde_prototip.html` | Oyunun geliştirme kopyası (tek HTML dosyası) |
| `index.html` | Yayındaki kopya: aynı dosya + uygulama (PWA) satırları |
| `sw.js`, `manifest.webmanifest`, `icon-192.png`, `icon-512.png` | Uygulama olarak yükleme ve internetsiz açılma |
| `telefon/` | Eski telefon sürümünün (v104) yedeği |
| `belge.html`, `belge.pdf`, `belge.md` | Bu tasarım belgesinin indirilebilir halleri |
| `proje/DEVAM_NOTU.md` | Sürüm sürüm geliştirme notları |
| `proje/tests/` | Kontrol ve test betikleri (JavaScript/Node.js + Playwright, birkaç Python veri betiği) |
| `proje/tools/act2/` | ACT 2 içeriğini (tarifler, ikon şablonları) oyuna ekleyen Python betikleri |
| `proje/tools/belge/` | Tasarım belgesini üreten araçlar (Python, Bash, Node.js) |

- **Kod düzeni:** oyun ana betikle başlar; sonraki sürümlerin değişiklikleri sürüm numaralı `<script id="vNN">` bloklarına eklenir ve oyunun içine "sarmalayıcı" olarak bağlanır (eski işlevi silmeden önüne/arkasına yeni davranış ekler).

## Geliştirme araçları

| Araç | Dil | Kullanım |
|---|---|---|
| `proje/tests/chk.js` | JavaScript (Node.js + acorn) | Her sürümde bütün betiklerin ECMAScript 2018'e uygun ve hatasız olduğunu denetler |
| `proje/tests/*.js` | JavaScript (Node.js + Playwright) | Oyunu gerçek bir tarayıcıda (Chromium) açıp oynatan otomatik testler; Boğaç istediğinde çalıştırılır |
| `proje/tools/belge/build.py`, `yayinla.sh` | Python, Bash | Belge parçalarını birleştirir, aranabilir HTML'i üretir |
| `proje/tools/belge/pdf.js` | JavaScript (Playwright) | Belgenin PDF'ini üretir |
| `proje/tools/act2/*.py`, `proje/tests/*.py` | Python | Tarif/eşya verisini ve ACT 2 içeriğini oyun dosyasına işler |
| Git, GitHub, GitHub Pages | – | Sürüm takibi ve yayın |
| Claude, Claude Code (yapay zekâ desteği) | – | Kodlama, belge yazımı; otomatik test turları, hata bulma ve düzeltme |

## Hedeflenen ortamlar

- Güncel **Chrome, Edge, Firefox, Safari** (bilgisayar; testler Chromium ile yapılır), **Android Chrome** ve **iOS Safari** (telefon/tablet).
- WebGL'i olmayan eski cihazlarda Canvas 2D ile çalışır.
- İnternet yalnızca ilk açılışta (ve güncellemeleri almak için) gerekir.
