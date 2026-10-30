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

## Performans kuralları (v2.38)

Oyun telefonda da akıcı olsun diye (Boğaç'ın telefonu: Honor 600) şu kurallar geçerlidir:

- **Oyun sırasında haritanın tamamı taranmaz.** Ada 645 × 464 karodur (299 bin karo); oyun sırasında düzenli çalışan bir iş bütün haritayı dolaşırsa telefonda kare kaçırır.
  - **Sis (keşfedilmemiş yerler):** yalnızca bir haritanın gösterdiği yerde hesaplanır: köşedeki küçük haritanın penceresi (çevresinde 8 karo payla, ~260 × 130 karo) ve büyük harita açıkken onun görünen penceresi. Bütün ada yalnızca oyun başlarken, kayıt yüklenince ve hileyle harita açılınca bir kez hesaplanır. Keşif yalnızca oyuncunun yanında olduğu için pencerenin dışı değişmez. Köşedeki küçük haritanın kendi küçük sis resmi vardır; ada büyüklüğündeki resim telefonun ekran kartına her seferinde yeniden gönderilmez. (2.35–2.37 bütün adayı saniyede 4 kez yeniden hesaplıyordu: telefon hızında her seferinde ~40 ms; şimdi ~2 ms.)
  - **Biyom keşif sayacı** (almanakta hangi biyomlara girildiği) bütün haritayı okur; en çok **12 saniyede bir** ve yalnızca yeni bir yer keşfedildiyse çalışır.
- **Izgara eski boyutta (v2.39):** iki ada da **645 × 464** karoluk ızgaradadır (hilal ve yonca bu çerçeveye sığdırılır, kıyıda ~10 karo deniz payı). Deniz yürünmez; ızgarayı büyütmek yalnızca haritanın tamamını okuyan işleri (sis, kayıt, keşif, sarı bölge) pahalılaştırır. 2.35–2.38'de ızgara 804 × 785 idi (deniz yüzünden 2,1 kat), oyun telefonda dondu.
- **Hava sisi yoktur (v2.39):** her karede bütün ekranı kaplayan sis tabakası kaldırıldı.
- **Yükleme ekranında ısınma:** adaya girmeden önce yer görüntüleri ve resimler hazırlanır (Akış → Yükleme ekranı).
- **Öğretici parlaması:** parlayan düğmenin ışığı sabit bir gölgedir; bilgisayarda düğme yalnızca büyüyüp küçülür (ekran kartında, yeniden boyamadan), **telefonda hiç oynamaz** (sabit mavi halka; yanındaki ok oynar).
- **Ölçüm yolu:** değişiklikten sonra oyun Playwright ile, işlemci 4–6 kat yavaşlatılarak (telefon hızı) oynatılır; uzun işler (30 ms üstü) ve ekran kartına yüklenen resim miktarı ölçülür.

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
- **Ekran kartı belleği (v2.17):** uzun oyunda (özellikle telefonda) ekran kartının belleği dolunca zemin ve ağaç resimleri boş çiziliyor, ekran **mavi** görünüyordu (zemin yok, yalnızca gölgeler, kişiler ve küçük şeyler). Artık: telefonda ortak resim sayfaları en çok 3 (bilgisayarda 6), büyük resimler en çok 40 / 120 tane tutulur (en eski kullanılan silinir) ve 5 sn kullanılmayan büyük resim bırakılır. Ekran kartı "bellek doldu" derse bütün resimler boşaltılıp yeniden yüklenir; 1 dakika içinde ikinci kez olursa oyun otomatik kaydedip **klasik çizimle** (Canvas 2D) yeniden açılır.
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

## İleride: çok oyunculu (plan, henüz yok)

Oyun şu an **tek oyunculu**dur ve öyle kalacaktır. İleride **4 kişiye kadar çevrimiçi ortak oyun** (aynı adada birlikte) eklenebilir; bu yalnızca bir olasılık olarak not edilir, karar ve tasarım daha sonra yapılacaktır (29 Ekim 2026, Boğaç).

- Düşünülen yol: oyunculardan biri **ev sahibi** olur, diğerleri doğrudan onun tarayıcısına bağlanır (WebRTC). Oyun sunucusu kiralamak gerekmez; oyun GitHub Pages'te kalır. Yalnızca bağlantıyı başlatmak için küçük bir eşleştirme servisi (ya da elle paylaşılan bağlantı kodu), bazı mobil ağlarda da bir aracı (TURN) gerekebilir.
- Başlamadan önce bu belgeye ayrı bir "Çok oyunculu mod" bölümü yazılır (öğretici, uyku, Reis ödülleri, durma, kayıt kuralları); kod ondan sonra gelir.

**Bulgular (29 Ekim 2026 incelemesi):** oyun baştan tek oyunculu kurulmuş; çok oyuncu için şunlar değişmeli:
- **Tek oyuncu → oyuncu listesi:** kodda tek bir `player` var; her oyuncunun canı, tokluğu, envanteri, sikkesi, yetenekleri, elindeki alet ve kamerası ayrı olmalı.
- **Ortak dünya:** ağaçlar, madenler, canavarlar, yerdeki eşyalar, gün/gece herkeste aynı olmalı; canavar yapay zekâsı yalnızca ev sahibinde döner, diğerlerine saniyede 10–20 kez dünyanın son hali gider.
- **Durma kalkar:** şu an menü ya da konuşma açılınca oyun duruyor; çok oyunculuda dünya kimse için durmaz.
- **Tasarım kararları gerekir:** öğretici ve görevler kişiye mi özel ortak mı; uyku (herkes yatağa mı girmeli); Reis kimin avıyla gelir, ödül kime; bayılma; kayıt (dünya ev sahibinde, karakter herkeste mi).
- **Gecikme:** karakterler ağdan gelen konumlar arasında yumuşak kaymalı; saldırı ve "!" işaretleri herkeste aynı anda görünmeli.
- En büyük iş **hazırlık**tır (oyuncu verisini dünyadan ayırmak); bu aşamada oyun dışarıdan değişmez, tek oyunculu oyun bozulmadan çalışmaya devam etmelidir.

**Maliyet (tahmin):**
- **Emek:** birkaç küçük sürüm değil, ayrı bir proje; kabaca **birkaç hafta**lık geliştirme (sıra: belge → hazırlık → 2 kişilik deneme → 4 kişi ve cilalama).
- **Para, ev sahipli yol:** oyun sunucusu yok, GitHub Pages ücretsiz. Eşleştirme için PeerJS'in herkese açık ücretsiz sunucusu kullanılabilir (PeerJS kalıcı kullanım için kendi sunucunu önerir; garanti yok).
- **Aracı (TURN), yalnızca doğrudan bağlanamayan oyuncular için:** 4 kişilik bu oyun için ev sahibinin gönderdiği veri tahminen oyuncu başına saatte birkaç yüz MB'tır. Hazır servislerin ücretsiz katmanları küçüktür (ör. Metered: ayda 0,5 GB ücretsiz, ilk ücretli paket ayda 99 $, Ekim 2026). Daha ucuz yol: küçük bir kiralık sunucuya kendi TURN'ümüzü kurmak (ör. Hetzner CPX22 ayda yaklaşık 6,5 €, 20 TB trafik, Şubat 2026 listesi). Fiyatlar başlamadan önce yeniden kontrol edilir.
- **Kendi oyun sunucusu** (ev sahibi çıkınca oyun bitmesin, yabancılarla eşleşme, hileye kapalılık istenirse): aynı boyda bir kiralık sunucu (aylık birkaç €–10 €) ve oyun mantığının bir kısmını sunucuya taşıma emeği.
