# Kullanılan teknolojiler

Bu bölüm oyunun neyle yapıldığını anlatır (28 Ekim 2026, Versiyon 1.83 itibarıyla).

## Özet

| Konu | Kullanılan |
|---|---|
| Oyunun türü | Tarayıcıda çalışan, **tek dosyalık bir web oyunu** (HTML sayfası). Kurulum gerekmez; bilgisayarda, telefonda ve tablette aynı dosya çalışır. |
| Programlama dili | **JavaScript** (ECMAScript 2018 sürümüne kadar; `?.` ve `??` gibi daha yeni yazımlar eski telefonlar için kullanılmaz) |
| Sayfa ve arayüz | **HTML5** ve **CSS3** (menüler, paneller, düğmeler, yetenek ağacı) |
| Grafik | **WebGL** (ekran kartıyla çizim; OpenGL ES 2.0 tabanlı, gölgelendiriciler **GLSL** ile yazıldı) + yedek olarak **Canvas 2D** |
| Ses ve müzik | **Web Audio API**; bütün sesler ve müzik kodla üretilir (ses dosyası yok) |
| Resimler | Bütün piksel resimler (eşyalar, karakterler, canavarlar, harita) **kodla çizilir**; dışarıdan resim dosyası yüklenmez |
| Kayıt | Tarayıcının **localStorage** deposu (kayıt yuvaları, ayarlar); kayıtlar JSON olarak dışa/içe aktarılabilir |
| Uygulama olarak yükleme | **PWA** (Progressive Web App): `manifest.webmanifest` + **Service Worker** (`sw.js`); oyun telefona uygulama gibi eklenir ve internetsiz açılır |
| Yayın | **GitHub** (kaynak deposu) ve **GitHub Pages** (https://bogacavdar.github.io/purple-light/) |
| Yazı tipi | **Rubik** (Google Fonts); internet yoksa sistem yazı tipi |
| Dış kütüphane | Yok. Oyun hiçbir JavaScript kütüphanesi ya da oyun motoru (Unity, Godot, Phaser vb.) kullanmaz; her şey sıfırdan yazıldı |

## Grafik: WebGL ve Canvas 2D

- Oyun ekranı bir `<canvas>` öğesidir. Çizim kodu tarayıcının **Canvas 2D** komutlarıyla (dikdörtgen, resim, yol, yazı, renk geçişi, saydamlık) yazılmıştır.
- **v68'den beri** bu komutları **GL2D** adlı kendi yazdığımız bir katman alır ve **WebGL** ile ekran kartına gönderir. WebGL, OpenGL ES 2.0'ın tarayıcıdaki karşılığıdır. Köşe ve piksel gölgelendiricileri (vertex/fragment shader) **GLSL** dilinde yazılmıştır.
- GL2D binlerce küçük çizimi birkaç büyük toplu çizime (batch) çevirir. Küçük resimleri büyük **doku atlaslarında** (texture atlas) toplar, karmaşık şekilleri üçgenlere böler (earcut yöntemi) ve karışım modlarını (ışık, gölge, toplama) ekran kartında uygular. Böylece telefonda çok daha akıcı çalışır.
- WebGL yoksa ya da hata verirse oyun kendiliğinden düz **Canvas 2D**'ye döner. Ayarlar › Grafik › "Ekran kartıyla çiz" ile elle kapatılabilir.
- Piksel görünüm için resim yumuşatma kapalıdır (`imageSmoothingEnabled = false`, CSS `image-rendering: pixelated`).
- Yetenek ağacının ikonları ve dalları **SVG** (vektör çizgi) ile çizilir.

## Ses: Web Audio API

- Müzik ve efektler oyun açılırken kodla (osilatör, gürültü, zarf, filtre) **OfflineAudioContext** içinde bir kez üretilir, ses tamponlarına yazılır ve tek bir **AudioContext** üzerinden çalınır.
- Ses dosyası (mp3, ogg) yoktur; oyun bu yüzden tek dosyadır ve internetsiz çalışır.
- Tarayıcı kuralı gereği ses, oyuncunun ilk dokunuşu ya da tuşa basmasıyla açılır. Eski Safari sürümleri için ayrı uyumluluk yolları vardır.

## Giriş ve cihaz özellikleri

- **Klavye ve fare** (WASD/ok tuşları, sol/sağ tık, kısayollar) ve **dokunmatik ekran** (Pointer Events: sürükleyerek yürüme, çift dokunarak koşma, ekrandaki Vur/Atıl/Savuştur/Ulti düğmeleri).
- **Titreşim** (Vibration API; telefonda darbe ve kaza anlarında), **tam ekran** ve **yatay ekran kilidi** (Fullscreen API, Screen Orientation API).
- `matchMedia` ile cihazın fareli mi dokunmatik mi olduğu anlaşılır ve arayüz ona göre ayarlanır (ör. savuşturma penceresi dokunmatikte biraz daha geniş).

## Dosya düzeni

| Dosya | Ne işe yarar |
|---|---|
| `proje/Hammadde_prototip.html` | Oyunun geliştirme kopyası (yaklaşık 1,9 MB tek HTML dosyası; içinde 60'tan fazla `<script>` bloğu) |
| `index.html` | Yayındaki kopya: aynı dosya + uygulama (PWA) satırları |
| `sw.js`, `manifest.webmanifest`, `icon-192.png`, `icon-512.png` | Uygulama olarak yükleme ve internetsiz açılma |
| `telefon/` | Eski telefon sürümünün (v104) yedeği |
| `belge.html`, `belge.pdf`, `belge.md` | Bu tasarım belgesinin indirilebilir halleri |
| `proje/DEVAM_NOTU.md` | Sürüm sürüm geliştirme notları |
| `proje/tests/` | Kontrol ve test betikleri |
| `proje/tools/belge/` | Tasarım belgesini üreten araçlar |

- **Kod düzeni:** oyun ana betikle başlar; sonraki sürümlerin değişiklikleri sürüm numaralı `<script id="vNN">` bloklarına eklenir. Bu bloklar oyunun içine "sarmalayıcı" olarak bağlanır: eski bir işlevi silmeden önüne/arkasına yeni davranış ekler.

## Geliştirme ve belge araçları

| Araç | Kullanım |
|---|---|
| **Node.js** + **acorn** | `proje/tests/chk.js`: her sürümde bütün betiklerin ECMAScript 2018'e uygun ve hatasız olduğunu denetler |
| **Playwright** (Chromium) | `proje/tests/` içindeki otomatik oyun testleri (oyunu gerçek bir tarayıcıda açıp oynatır) ve belgenin **PDF**'e çevrilmesi |
| **Python 3** + **Markdown** kütüphanesi | Tasarım belgesini parçalardan birleştirir, aranabilir HTML sayfasını üretir (`proje/tools/belge/build.py`, `yayinla.sh`) |
| **Git** + **GitHub** | Sürüm takibi; her sürüm `main` dalına gönderilir, GitHub Pages yayını kendiliğinden günceller |
| **Claude** (Anthropic) | Oyunun kodu, testleri ve bu belge Boğaç'ın yönlendirmesiyle Claude tarafından yazılır; ayrıca claude.ai artifact'ı olarak da yayınlanır |

## Hedeflenen ortamlar

- Güncel **Chrome, Edge, Firefox, Safari** (bilgisayar; testler Chromium ile yapılır), **Android Chrome** ve **iOS Safari** (telefon/tablet).
- WebGL'i olmayan eski cihazlarda Canvas 2D ile çalışır.
- İnternet yalnızca ilk açılışta (ve güncellemeleri almak için) gerekir.
