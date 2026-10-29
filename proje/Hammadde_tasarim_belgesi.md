# Purple Light · Tasarım Belgesi

Sürüm: **Versiyon 2.18** ile birebir (29 Ekim 2026). Bu sürümde: envanterden sürüklerken de hedef yuva yanıp söner (meşale dersi); canavarlar saldırırken yüzünü hep sana döner; yetenek ağacında üst/alt pay ve Koşu'nun tam görünmesi; sikke yetmezken Koşu'ya basınca ağaç kapanır, Börü anlatır; Ekin böğürtlende bilgisayarda F'yi söyler.

> **Kural (Boğaç, 28 Ekim 2026):** Bu belge oyunun doğru kabul edilen tanımıdır. Geliştirme önce burada yazılır, sonra koda geçer; belge ile kod çelişirse belge doğrudur ve kod belgeye uydurulur.

## Bu belge nasıl okunur

- **Bir şeyin nasıl yapıldığını mı arıyorsun?** En alttaki **Eşya dizini**ne git, adını ara. Her eşyanın yanında nereden geldiği (hangi biyomda toplandığı, hangi canlıdan düştüğü, hangi tarifle yapıldığı) ve hangi tariflerde kullanıldığı yazar.
- **Bir tarifin içeriği:** **Tarif ansiklopedisi**, kategori kategori. Her satırda malzemeler, gereken alet, *nerede yapıldığı* (el yapımı, örs, usta) ve fiyatı var.
- **Bir bölgede ne var:** **ACT 1** ve **ACT 2** bölümlerinde her biyom ayrı başlık: ağaçlar, toplanabilirler, madenler, canlılar.
- **Bir NPC ne istiyor:** **Kişiler ve görevler** bölümü. Her görevin istediği, açılma şartı ve ödülü tablo halinde.
- **²** işareti: o eşya ya da tarif ACT 2 adasına ait (malzemesi yalnızca ikinci adada çıkar).
- **Fiyat** her yerde *temel satış fiyatıdır*; oyunda seviye ve Ekonomi ağacının yetenekleri bunu artırır.

## Oyun bir bakışta

**Purple Light (Mor Işık)** tek oyunculu, piksel sanatlı bir keşif ve hayatta kalma oyunu. Gemin batmış, eşini mor bir ışık götürmüş; **Yıldızsız Ada**'nın kumsalında hafızasız uyanıyorsun. Bir taştan başlayıp toplayarak, kazanda tarif keşfederek, ustalara alet ve zırh yaptırarak, avlanarak ve adanın insanlarına yardım ederek güçlenirsin. Amaç eşini bulmak.

- **Temel döngü:** topla → kazanda tarifi öğren → elle ya da ustaya yap → sat ya da kullan → güçlen → daha tehlikeli bölgeye geç.
- **ACT 1 · Yıldızsız Ada:** 6 biyom (Çayır → Orman → Bataklık → Kayalık Dağ → Kül Diyarı → Mor Kristal Vadisi), 26 kişi (11 kişi ve Çayır dışındaki her biyomda Zümrüt, Dursun ve Durmuş'un birer cadı, silahçı ve zırhçı kuzeni), Yaşlı Ekin'in ana görev zinciri. Sonunda Denizci Levent ile yeni bir gemi yapıp ikinci adaya geçersin.
- **ACT 2 · İkinci ada:** aynı boyutta, fantastik bir ada: Yüzen Kayalar → Dev Mantar Ormanı → Hurda Çölü → Kristal Golem Ocağı → Ejder Volkanı → Gök Rıhtımı. Büyü (mor mana ve asalar), ateşli silahlar, meka zırh. Sonunda Astronot Tuna ile roket yapılır ve mor ışıklı gemiye fırlatılır.
- **Son:** roket gemiye ulaşır; geminin içinde eşinle kavuşursun ("Yeniden birlikte"). Hikâye ACT 3 ile sürecek (henüz oyunda değil).
- **Gerçek:** eşini kaçıranlar adalarda köpek ve fener satan **yıldızsız yolcular**; mor ışık onların gemisi. Robot köpekler ve şapka seni izlemek ve anılarını okumak için verilmiş (ACT 3'te açılacak).

## Adalar ve dünya ölçüsü

- Her ada **645 × 464 karo** (bir karo 16 piksel). Bir anda yalnızca bir ada bellekte durur; adalar arası geçiş bir yükleme ekranıyla yapılır.
- Envanter, sikke, seviye, gün ve saat iki adada ortaktır.
- Her adada 6 biyom vardır (v1.85'ten beri **eşit büyüklükte**: ada 3 sütun × 2 sıraya bölünür, her biyom yaklaşık 46.000 yürünebilir karo); biyomun tehlike seviyesi canavarların gücünü belirler: **Güvenli** (ilk iki biyom), **Tehlikeli** (3. ve 4.), **Ölümcül** (5.), **Çok ölümcül** (6.).
- Oyun içinde biyomlar 3 tehlike kuşağına ayrılır ve balık tabloları, tuzak ganimetleri bu kuşağa göre değişir: **Kuşak 0** = Çayır + Orman, **Kuşak 1** = Bataklık + Kayalık Dağ, **Kuşak 2** = Kül Diyarı + Mor Kristal Vadisi (ACT 2'de aynı sırayla).


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


# Oyunun akışı

Bu bölüm oyunu baştan sona, oyuncunun yapacağı sırayla anlatır. Ayrıntılar (her görevin istediği, ödülü) "Kişiler ve görevler" bölümlerinde.

## Açılış

1. **Ana menü:** Yeni oyun, Devam et, Kayıttan yükle, Ayarlar, Kayıtları dışa/içe aktar, Arena (kilitli), Çıkış. Menünün altında sürüm etiketi (ör. "Versiyon 1.81"). **Temiz dünya (v2.14):** bu sekmede bir oyun oynandıktan sonra menüden **Yeni oyun**, **Devam et** ya da **Yükle** (oyun içi menüden yüklemek dahil) sayfayı kısa bir "Yükleniyor…" ekranıyla yeniden açar; harita her seferinde baştan kurulur. Önceki oyunun haritada bıraktıkları (öğreticinin koyduğu böğürtlen ve taşlar, kesilen ağaçlar, kazılan madenler) yeni oyuna ya da yüklenen kayda taşınmaz.
   - **Hakkında** penceresinde "Bir Boğaçhan Çavdar oyunu" yazısının altında **"Tasarım belgesine buradan ulaşabilirsiniz"** bağlantısı vardır (v2.09). Tıklanınca bu tasarım belgesi oyunun içinde, tam ekran bir pencerede açılır (aranabilir hali, `belge.html`); sağ üstteki **Kapat** ya da Esc ile Hakkında'ya dönülür. Belge yeni sekmede de açılabilir ("Yeni sekmede aç"). Belge oyunla birlikte cihaza kaydedilir: oyun uygulama olarak yüklendiyse ya da bir kez internetle açıldıysa, **internetsiz de** o sürümün belgesi açılır (her açılışta internet varsa en son hali alınır).
2. **Karakter yaratma:** ad, cinsiyet, ten, saç (stil ve renk), göz rengi, sakal/bıyık, gözlük, şapka. Ardından eşinin adı sorulur (eşin görünüşü sabittir: erkek kahraman uzun kızıl saçlı bir kadını, kadın kahraman kısa saçlı bir erkeği kaybeder).
3. **Zorluk:** Normal ya da Zor. Zor modda tarifler kapalıdır ve kazanda "Dene" ile deneyerek bulunur (ayrıntı: "Zorluk").
4. **Giriş sahnesi** (gemi, fırtına, mor ışık) ve **kumsalda uyanış**: Yaşlı Ekin seni bulur, adını sorar.

## Öğretici (13 adım)

Öğretici sürerken Kazan, Pazar ve Demirci menüleri kilitlidir; ilgili kişiyle tanışınca açılır.

**Öğreticiyi geçmek (v1.81):** kartın üstündeki "Eğitimi geç" önce bir uyarı açar. Ekin şunu söyler: öğretici adayı ilk kez görenler için önemlidir, oyunun ana mekaniklerini (toplama, yeme, kazan, el yapımı, satış, dövüş, atılma) öğretir; geçilirse öğretici boyunca verilecek **ödüller, XP ve eşyalar alınmaz**. İki seçenek vardır:

- **"Öğrenmek istiyorum"** → uyarı kapanır, öğretici kaldığı yerden sürer.
- **"Zaten biliyorum, geç"** → öğretici biter, menüler açılır, Ekin'in ilk ana görevi gelir. **Hiçbir şey otomatik verilmez:** meşale, balta, taş, tarif, XP ya da sikke yok; oyuncu her şeyi kendisi bulur (Normal modda tarifler malzemeleri görünce zaten açılır). O ana kadar kazandıkların sende kalır. Atılmayı bilmiyorsan Börü'yle konuşunca atılma dersini ücretsiz verir (aşağıda).

| Adım | Kim | Ne yaparsın | Sonuç |
|---|---|---|---|
| 1 | Ekin | Kampın çevresine konan 5 böğürtleni topla (telefonda önce sürükleyerek ve dokunarak yürüme). **Bilgisayarda (v2.18)** Ekin böğürtleni nasıl toplayacağını da söyler: "Böğürtlen çalısının **yanına git** ve **F**'ye bas; böğürtlen yere düşer, üstünden yürüyünce alırsın." (Toplama tuşu değiştirildiyse o tuşu söyler.) | — |
| 2 | Ekin | Yemek düğmesiyle (F) 5 böğürtlen ye (soldaki yemek düğmesi mavi parlar ve ok onu gösterir; yemek listesi açılınca Böğürtlen'in **Ye** düğmesi parlar) | Cadı Zümrüt görünür; Ekin seni kuzeye, ormanın kıyısına yollar |
| 3 | Zümrüt | Zümrüt'e git ve konuş | Kazanın yanına 2 Dal, 2 Lif, 2 Yaprak konur |
| 4 | Zümrüt | Kazanda **Kaba meşale** tarifini öğren | Malzemeler yeniden konur |
| 5 | Zümrüt | El yapımı ekranında (Tab) meşaleyi yap, bir yuvaya koyup eline al | Meşale yapılınca Zümrüt yalnızca meşaleyi anlatır (taşlardan söz etmez). Meşale ele gelince Zümrüt **meşaleyi anlatır**: gündüz işe yaramaz, gece içindir; yalnızca eldeyken yanar ve Kaba meşale yaklaşık **110 saniye** yanınca biter (yağmurda daha çabuk); gündüz elinden indir, akşam karanlığında eline al, yedeğin olsun. Sonra kart **"Meşaleyi elinden indir"** der, meşalenin yuvası (hotbar kutusu) oku ile parlar; meşale inene kadar taş adımına geçilmez (v2.11: taşlar ve taş konuşması da meşale inince gelir; v2.12: üstteki takip satırı da o ana kadar taş istemez, haritadaki taşlar mavi parlamaz) |
| 6 | Zümrüt | 4 taşı topla | Meşale inince Zümrüt taşları anlatır ve kazanın yanına 4 Taş konur |
| 7 | Zümrüt | Kazanda **Keskin taş** tarifini öğren (2 Taş) | — |
| 8 | Zümrüt | Kalan 2 taşla elle Keskin taş yap | Zümrüt kuzeydoğudaki Nazlı'yı söyler |
| 9 | Nazlı | Pazarcı Nazlı ile tanış | Pazar "Sat" sekmesiyle açılır |
| 10 | Nazlı | Keskin taşı sat | Nazlı hesabı anlatır (v2.12): bir Taş 1 sikke, iki taş 2 sikke; birleştirip yapılan Keskin taş 3 sikke, aradaki 1 sikke emeğin; yapılan şeyler yeniden birleştirildikçe değerleri katlanır (taştan keskin taş, keskin taştan alet; her adımda daha çok para eder). Sonra doğudaki Börü'yü söyler |
| 11 | Börü | Börü ile konuş, çıkan **kereviti yumrukla** (yumruk 4 hasar). Bilgisayarda dövüş şöyle öğretilir: **WASD ya da yön tuşlarıyla** yürüyüp kerevite yaklaş, **sol tıkla** vur (bu derste sol tık yürütmez, tıklanan yöne yumruk atar; telefonda kerevite dokunulur); ardından **atılma dersi** ve **yetenek ağacı** (aşağıda) | Atılma öğrenilir (ücretsiz); Taş balta, Sopa ve İp tarifleri öğrenilmiş olur; +6 Taş; Börü'nün yanına 3 Dal, 8 Lif, 4 Taş konur |
| 12 | Börü | Balta parçalarını elle yap: 2 Keskin taş → 1 Sopa → 2 Keskin taş → 2 İp (2 Taş da yanında kalsın). Sıradaki parçanın malzemesi tamamsa el ikonu (Tab) parlar; el yapımı ekranında o parçanın (Keskin taş, Sopa ya da İp) **Yap** düğmesi mavi parlar, ok onu gösterir ve liste oraya kayar | — |
| 13 | Dursun | Parçalar tamamlanınca **Börü** "Şimdi kuzeydeki Demirci Dursun'a git, baltayı o döver, benden selam söyle" der (Dursun'un önceden haberi yoktur). Dursun'a gidince önce **tanışılır** (Dursun kendini tanıtır, "Börü yolladı, selamı var"), sonra parçaları görüp örsü açar. Örste **Taş balta**yı döv (ücretsiz): önce **Hepsini koy**, sonra **Döv** düğmesi sırayla parlar ve okla gösterilir. Sonra baltayı eline al: önce envanter (çanta, I) düğmesi, envanter açılınca **Taş balta**, seçilince boş bir **alet yuvası**, en son alttaki kutusu sırayla parlar ve okla gösterilir. Balta dövüldüğü anda öğretici "baltayı eline al" adımına geçer (Dursun'un penceresi düğmeye basılmadan kapansa bile); bu adımda Dursun'la konuşulursa yeniden balta dövdürmez, malzeme istemez, "baltan zaten dövüldü, eline al" der (v2.06) | Öğretici biter; ok Ekin'i gösterir, Ekin ilk ana görevi verir |

**Gösterme kuralı (v1.89):** öğretici bir düğmeye basmanı istediğinde o düğme (sol menüdeki ikonlar, menülerin içindeki Ye/Yap/Hepsini koy/Döv düğmeleri, envanterdeki eşya, alet yuvası) **mavi parlar** ve yanında yanıp sönen bir **ok** olur. Sıra gerekiyorsa düğmeler sırayla parlar. Adım biter bitmez parlama ve ok söner (örneğin 5 böğürtlen yenince yemek düğmesi artık parlamaz). **Sürüklerken de gösterilir (v2.18):** envanterde bir eşyaya tıklayınca nereye gideceği yanıp sönerek gösterilir; eşyaya basılı tutup sürüklemeye başlayınca da aynı yuva (boş yuva, yoksa ilk yuva) sürükleme boyunca yanıp söner. Örneğin Zümrüt'ün meşale dersinde meşale tıklansa da sürüklense de doğru yuva gösterilir. Bırakınca yanıp sönme biter.

### Börü'nün atılma dersi (v1.81, 11. adımın içinde)

- **Ders sürerken yön oku yok (v2.15):** ikinci kerevit belirdiği andan ders bitene kadar Börü'nün üstünde ya da ekranda Börü'yü gösteren ok çıkmaz; dikkat kerevitte kalır.
1. Kerevit yumrukla yenilince Börü "Şimdi kaçmayı öğren" der ve yanına **yeni bir kerevit** çıkar. Bu kerevit can yakmaz, ölmez; yalnızca saldırır. Atılma bu derste **ücretsiz** öğrenilir (yetenek ağacında satılmaz).
2. Kerevit doğadaki gibi **yürüyerek** sana yaklaşır (sen uzaklaşırsan peşinden yürür), yakına gelince bir an bekler. **Saldırırken üstünde kırmızı ! belirdiği an sana doğru atılır (v2.15):** ayrı bir hazırlık beklemesi yoktur; atılış o an **bulunduğun yere** düz bir çizgide gider (biraz ötesine), 0,45 sn sürer ve **yolu sonradan değişmez**. Saldırıdan sonra olduğu yerde kalır ve yeniden yürüyerek yaklaşır; hiçbir zaman başka bir yere ışınlanmaz.
3. **İlk saldırıda** kerevit ! ile hazırlanır ve sana doğru atılır; **sana değmek üzereyken** (aranızda ~1,5 karo kala) **oyun durur** ve ekranın ortasında büyük harflerle "**Boşluk'a bas!**" (telefonda "**Atıl düğmesine dokun!**") yazar. Basınca oyun devam eder, karakter takla atar ve kereviti savuşturur ("Sıyrıldın!"). **Bu ilk saldırıda oyun durmadan önce Boşluk'a basmak takla attırmaz (v2.15);** takla yalnızca oyun durup "Boşluk'a bas!" dedikten sonra atılır. İlk saldırı bitene kadar **karakter yürüyemez** (WASD, oklar, tıklama, telefon kolu çalışmaz); ekranda "Kımıldama: kerevit saldıracak" yazar. Amaç yalnızca saldırıyı beklemek ve tam değeceği anda Boşluk ile kaçmayı öğrenmek.
4. Sonra kerevit **3 kez daha** saldırır; oyun artık durmaz, yürümek ve takla serbesttir. **Kaçarsan başarılı, değerse başarısız (v2.15):** ! görünüp kerevit atıldığında takla at. Kerevit sana değmeden yolundan çıkarsan ya da değdiği an hâlâ taklanın içindeysen "**Sıyrıldın!**". Takla, atılış başlamadan en çok 0,15 sn önce basılmış olmalı; daha önce attıysan takla biter ve kerevit değer: "**Erken!**". Hiç takla atmadan değerse "**Değdi!**", değmeden atılış biter ama takla atmadıysan "**Kaçmadın!**". Yön tuşuna basmadan atılan takla bu derste kerevitin yolundan **yana** gider. Can gitmez. Ekranda "Sıyrılma: 1/4" sayacı vardır.
5. **Savuşturma dersi (v2.15):** 4 sıyrılma (1 + 3) olunca Börü "Şimdi **savuşturmayı** öğren" der; aynı kerevit kalır, sayaç "Savuşturma: 0/4" olur. Yapı takla dersiyle aynıdır:
   - **İlk saldırıda** karakter yürüyemez; kerevit ! ile atılır, sana değmek üzereyken **oyun durur** ve "**Sağ tık'a bas!**" (klavyede E; telefonda "**Savuş düğmesine dokun!**") yazar. Ondan önce basmak savuşturmaz. Basınca kerevit savuşturulur ("Savuşturuldu!").
   - Sonra **3 kez daha**: yürümek serbest, kerevit ! ile atılır; değdiği an savuşturma penceresi (0,2 sn) açıksa sayılır. Çok erken basarsan pencere kapanır: "**Erken!**"; hiç basmazsan "**Değdi!**"; takla atarsan "**Takla değil, savuştur!**". Can gitmez.
   - 4 savuşturma olunca savuşturma ve gard kalıcı açılır.
6. 4 savuşturma olunca Börü esprili bir dille "**İlk ders tamam!**" der: her kavgaya girmek akıllıca değildir, bazen tabanları yağlamak gerekir; bunun için hızlı koşmayı bilmek gerekir.
7. **Yetenek ağacı zorunlu:** Börü'nün tek seçeneği "Yetenek ağacını aç"tır. Ders biter bitmez soldaki ağaç ikonu (Y) mavi parlar, ok onu gösterir ve ekranın ortasında "Yetenek ağacını aç" yazar; Börü'nün üstündeki ok kalkar. Konuşma penceresi kapansa da bu sürer; ağaç açılmadan Börü'yle konuşulursa Börü yalnızca "önce yetenek ağacını aç" der, dersi ya da kereviti **tekrar vermez**. Ağaç açılana kadar öğretici ilerlemez. Ağaç açılınca Savaş ağacındaki **Koşu** yanıp söner ve üstte Börü'nün notu çıkar: ağaçlar aşağıdan yukarı büyür; Koşu 100 sikke; Nazlı'ya bir şeyler satıp **100 sikke biriktirip** ilk iş bunu almak akıllıca olur.
   - Ağaç açılınca Savaş ağacındaki **Koşu** mavi parlar ve yanında yanıp sönen bir ok olur (v2.09).
   - **Koşu tam görünür (v2.18):** ağaç açılınca Koşu kesilmeden, alt kenarın biraz üstünde görünür (altında boşluk kalır). Ağacın üstünde ve altında her zaman biraz pay vardır; en üstteki ve en alttaki yetenekler kenara yapışmaz. Börü'nün notu ağacı aşağı itip Koşu ekranın dışına kayarsa pencere kendiliğinden kayar, Koşu kenarın biraz üstüne gelir.
   - **Sikke yetmezken Koşu'ya basılırsa (v2.18):** satın alma olmaz, yetenek ağacı **kendiliğinden kapanır** ve Börü konuşma penceresinde söyler: "Önce sikke topla evlat! Koşu 100 sikke; sende X var, Y sikke daha lazım. Nazlı'nın pazarında bir şeyler sat. 100 sikken olunca **Y**'ye bas (telefonda yanıp sönen ağaç ikonuna dokun), yetenek ağacını aç: oradan istediğin geliştirmeleri alırsın. İlk işin Koşu olsun." ("Anladım" düğmesi). Bu, ders sırasında da sonradan da (Koşu alınana kadar) böyledir; ders sırasındaysa bu konuşma 8. maddedeki konuşmanın yerine geçer ve "Anladım"dan sonra öğretici sürer.
8. Ağaç kapatılınca Börü önce **bilgilendirir** ("Anladım" düğmesi). v2.18'den beri: 100 sikken yoksa ne kadar eksik olduğunu söyler, Nazlı'ya bir şeyler satıp sikke toplamanı, **100 sikken olunca Y'ye basıp** (telefonda ağaç ikonuna dokunup) yetenek ağacını açmanı ve oradan istediğin geliştirmeleri almanı söyler, ilk iş Koşu olsun der. 100 sikken varsa: "Gördün mü, en alttaki parlayan Koşu. Onu almak 100 sikke ister; Y'ye bas, ağacı aç, oradan istediğin geliştirmeleri alırsın." Sonra öğretici kaldığı yerden sürer: Börü Taş balta tarifini verir (12. adım).

Öğreticiyi geçen ve atılmayı bilmeyen biri sonradan Börü'yle konuşursa Börü aynı dersi ücretsiz teklif eder ("Öğret" / "Sonra"). Atılmayı bilip savuşturmayı bilmeyen biri konuşursa Börü yalnızca **savuşturma dersini** (1 + 3) ücretsiz teklif eder (v2.15).

### Öğreticiden sonraki kısa dersler

Kartın altında kısa dersler çıkar: **koşma dersi** (Ekin'in köprü görevi bitince; Koşu 100 sikke, Koşu zaten alındıysa çıkmaz), **meşale dersi** (2. ve 3. gün 17:30). İlk gece meşalesi olmayana biri bir Kaba meşale fırlatır (bir kez).

## ACT 1 yol haritası

v1.86'dan beri ACT 1 tek görevlik bir zincirle ilerler (ayrıntı: **ACT 1 · Görevler**). Ekin'in yalnızca ana yolda 5 görevi vardır; gerisi adadaki 26 kişiye dağılmıştır ve birbirini açar.

1. **Çayır:** Ekin'in ilk işi (6 dal, 2 kuru ot) → Dursun aletleri öğretir (taş balta, kazma, çakmaktaşı balta, bileme, tunç) → Rıza kalas ve barınak, Nazlı meyve, balık, satış ve tuzak, Börü kamp ateşi, dövüş ve taş kılıç, Durmuş kemik, kiriş, tunç levha, Zümrüt otlar ve kazan. Börü oyuncuyu **Orman**'a yollar (Hasan ile tanışma).
2. **Orman:** Hasan'ın tarlası (dört alet), Kemal'in yapıları, kuzenler Yakut, Durdu, Duran. Hasan'ın ikinci işi bitince Ekin'in **köprü** görevi açılır (Seviye 6).
3. **Köprünün ötesi:** Bataklık'ta Toygar ve kuzenler Safir, Ali (demir), Veli. Toygar'ın son işi oyuncuyu **Kayalık Dağ**'a götürür (Firuze, Kaya, Kayhan).
4. **Doğu geçidi:** Kayalık Dağ'a varınca ve Seviye 10'da Ekin'in **patlatma** görevi: 2 kaya patlatıcı + tunç ya da kuvars kazma; patlayınca bütün sıradağ çöker ("Yol açıcı" başarımı).
5. **Kül Diyarı:** Mercan, Turan, Tufan. Kül Diyarı'na varınca Ekin'in **izler** görevi: 6 mor iz; bitince **Gemi** tarifi kitaba yazılır, Levent'in enkazı Mor Kristal Vadisi kıyısına çarpar. Ekin'in son işi: Levent'i bul.
6. **Mor Kristal Vadisi:** Levent'in 5 görevi (pusula için kristal, Kudret'in obsidyen kazmasını ister) ve son olarak **gemi malzemeleri** enkaza (8 kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek). Gemi ("Meltem") yapılınca Levent kızının hikâyesini anlatır ve "Götür beni" ile deniz yolculuğu başlar → **ACT 2**. İnci, Kudret, Kuvvet de buradadır.

> **Kuzenler (v1.84):** Orman'dan Mor Kristal Vadisi'ne her biyomda Zümrüt, Dursun ve Durmuş'un birer kuzeni yaşar (cadı, silahçı, zırhçı). Her biri o biyomun malzemesiyle yapılan eşyaları döver ya da tarifleri öğretir ve 5'er görev verir. Zümrüt, Dursun, Durmuş ve 15 kuzenin bütün görevleri bitince ortak ara sahne oynar: mor ışık ninelerini, **Elmas Nine**'yi kaçırmıştır.

> Ülker'in "Portal çekirdeği" görevi **2 Kristal ve 2 Demir levha** ister ve bunlar yalnızca birinci adada bulunur (2 Mor kıymık ikinci adanın gecelerinde de çıkar). v1.76'dan beri ikinci adaya bir kez varınca **Levent'in yanındaki portal** (ACT 2) ve **Ekin'in yanındaki portal** (ACT 1) hep açıktır; eksik malzemeyi almak için birinci adaya dönebilirsin.

## ACT 2 yol haritası

ACT 2 bölümündeki "ACT 2'nin akışı"na bak: Ülker (portallar) → Pervin (asa) → Tamer (tabanca) → Selin (meka zırh) → Alara (ışın kılıcı) → Tuna (roket) → fırlatma → kavuşma ve son kartı. Bütün ACT 2 ustaları varıştan itibaren yerindedir; sıra yalnızca ok ve görev kartıyla yönlendirilir, istersen sırayı bozabilirsin.

## Gezginler ve takvim

| Kim | Ne zaman | Ne yapar |
|---|---|---|
| Yıldızsız Gezgin | 5. gün | Bir robot köpek hediye eder (köpek seçtiğin malzemeyi senin için toplar). |
| Yıldızsız Gezgin | 20. gün | **Mor sinyal** verir: köpekler menüsünden sikkeyle köpek ısmarlanır. Fiyat 500 × 1,6^(sahip olunan köpek), 10'a yuvarlanır: 800 → 1.280 → 2.050 → 3.280. En çok 5 köpek. |
| Tüccar Nuri | köprü onarılınca ya da 3. günden sonra | Kumsaldaki iskeleye yanaşır, 10 dakika kalır, 6–9 dakika sonra yine gelir. Sipariş ister: ilki 5 Dal + 5 Taş + 3 Lif = 64 sikke; sonrakiler rastgele 2–3 ucuz malzeme, ödeme 3 × (değerleri) + 25 sikke. |
| Yıldızsız Işıkçı | 15. günden sonra her akşam 18:00–05:30 | Yurtta sabit bir yerde (haritada mavi nokta). 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi karşılığında **Kafa lambası** verir, sonra bir daha gelmez. |


# Kontroller

| Tuş (bilgisayar) | Ne yapar | Telefonda |
|---|---|---|
| WASD / oklar | Yürü | Kanvası sürükle (görünmez joystick) ya da gideceğin yere dokun |
| Shift | Koş (Koşu yeteneği gerekir) | Çift dokunuş |
| F | Topla, konuş, kapı, yatak, ağacı silkele (v2.04'e kadar E idi). F yalnızca **hemen yanındaki** şeye yönelir: karakterin bir kare çevresi, çaprazlar dahil (en çok ~30 px; iki kare ötedekine gitmez, o zaman hiçbir şey yapmaz). Ağaca yalnızca **elde balta varken**, madene/kayaya yalnızca **elde kazma varken** gider (çantada olması yetmez; v2.07). Sol tıkla elde baltasızken bir ağaca, elde kazmasızken bir madene tıklamak oraya yürütmez, yalnızca o yöne vurur. Elde balta varsa önce ağaç, elde kazma varsa önce maden seçilir; yoksa en yakın toplanacak şey (çalı, yerdeki taş/dal, meyvesi olgun ağaç). Ayağının dibindeki düşmüş eşyalar her zaman önce alınır (v2.05) | Nesneye dokun |
| Q / sol tık | Vur. **Sol tık her zaman tıklanan yöne vurur**, tam tıklanan açıya (çaprazlar dahil; karakter 8 yönlü pozla o yana döner); el boşken yumruk, elde silah/alet varsa onunla (v2.03–2.04). Bir kişiye, kazana/örse/pazara, kurulmuş bir eşyaya ya da toplanacak bir şeye (çalı, maden, ağaç) tıklamak oraya gidip konuşur/toplar. **Yere düşmüş bir eşyaya** (av, odun, taş) tıklamak oraya yürür ve eşya toplanır (v2.10); üstünde bir hayvan varsa önce ona vurulur. **Bir hayvan sana saldırırken** (ekranda seni kovalayan bir hayvan varsa ya da son 3 saniyede ısırıldıysan) sol tık hiçbir şeyi toplamaz, kimseyle konuşmaz, yere düşene yürümez: **her zaman tıklanan yöne vurur** (v2.10). F tuşu ve telefondaki düğmeler bundan etkilenmez; onlarla toplamak sürer. Boş yere tıklamak karakteri yürütmez; yürümek WASD/oklarla |
| Boşluk | Atıl / takla (Börü'nün atılma dersinden sonra); yerleştirirken döndür | **Atıl** düğmesi |
| Sağ tık / E | Savuştur (bas) · savunma duruşu, gard (basılı tut); E sağ tıkla aynıdır (v2.04) | **Savuş** düğmesi |
| R | Ulti (çubuk doluyken); değilse robot köpekler menüsü (arenada R yalnızca ulti) | **Ulti** düğmesi (yalnızca ulti atar, köpek menüsünü açmaz; v1.87) |
| X | En uygun yemeği ye (basılı tut: yemek listesi; v2.04'e kadar F idi) | Tabak simgesi |
| H | Eli boşalt (meyve silkelemek için) | El düğmesi |
| 1–0 | Alet yuvasındaki aleti ele al | Alttaki kutuya dokun |
| Tab | El yapımı | El simgesi |
| B / T / P / K | Kazan / Demirci / Pazar / Tarif kitabı | Menü simgeleri |
| I / C / Y / G | Envanter / Karakter (giyim, istatistik) / Yetenekler / Görevler | Menü simgeleri |
| M / N | Büyük harita / bulunduğun yere işaret koy | Küçük haritaya dokun |
| V | Kamp ateşi kur | – |
| L | Elindeki meşaleye reçine sür | – |
| O / Esc | Ayarlar / duraklat | Çark simgesi |

- **Vuruş tamponu (v2.16):** bir vuruş bitmeden (bekleme süresi dolmadan) yeniden vurursan (sol tık ya da Q) basış kaybolmaz: bekleme bitince (basıştan en çok 0,8 sn sonrasına kadar) **son bastığın yöne** vurulur. Karakter yalnızca vuruş gerçekten atılırken o yöne döner (önceden bekleme sırasında tıklanınca karakter dönüyor ama vurmuyordu).

- Bütün tuşlar **Ayarlar → Kontroller**'den yeniden atanabilir. Telefondaki dövüş düğmelerinin yeri ve boyutu (%60–200) aynı yerden ayarlanır.
- F (toplama tuşu) hiç vurmaz; yalnızca toplar ve konuşur. Diyaloglarda, anılarda ve balık tutarken de F ilerletir (E artık gard tuşu). Hile tuşu "+100 XP" X'ten J'ye geçti. Tuşlar değişse de oyundaki bütün yazılar yeni tuşları gösterir; fareyle bir şeyin üstüne gelince çıkan ipucu da ("F ile topla", "F ile konuş", "sol tık ya da Q ile vur"; v2.06). Ayarlar → Kontroller → "Varsayılana dön" bu yeni tuşlara döner.
- **Karakterin 8 yönü (v1.94, çapraz pozlar v2.02):** karakter yürüdüğü yöne göre 8 pozdan birine döner: **ön** (aşağı), **arka** (yukarı), **sağ/sol profil** (yalnızca tam yana yürürken) ve dört **çapraz** poz; çaprazda karakter bütünüyle döner. **Ön-çapraz** (sağ-aşağı / sol-aşağı): yüz hafif yana dönük (karakter yaratma ekranındaki gibi); gövde gidilen yöne 1 piksel kayar, uzak yanı 2 sütun gölgededir, yaka o yana döner; yalnızca yakın kol görünür (uzak kol hiç çizilmez); bacaklar birbirine yakın, gidilen yandaki ayak bir adım yukarıda, ayak uçları gidilen yöne bakar. **Arka-çapraz** (sağ-yukarı / sol-yukarı): başın yalnızca arkası (saç) görünür, yanak/kulak/göz yok, baş **normal boyda**; sırt dönük çizilir: yakın yan gölgede, ortada sırt çizgisi; yalnızca yakın kol görünür; **ayaklar ön-çaprazdaki çizimle aynıdır** (gidilen yandaki ayak bir adım yukarıda, ayak uçları o yana). 2.01'deki aynalanmış ayaklar beğenilmedi, 2.02'de bu hale geri dönüldü (Boğaç, 29 Ekim 2026). Elde alet varsa kol gidilen yöne uzanır. Yön hareketin açısından seçilir: yatay ve dikey bileşenin ikisi de yeterince büyükse (yaklaşık 22°–68° arası) çapraz poz. Durunca son poz kalır; vururken, toplarken ya da biriyle konuşurken karakter o işe dönük 4 yönlü poza geçer. Karakter yaratma ekranında sürükleyerek çevirince aynı 8 poz görülür (Boğaç, 29 Ekim 2026).
- Telefon yatay oynanır; dikey tutulunca "Telefonunu yan çevir" ekranı çıkar ("Yine de dikey oyna" ile geçilebilir).

# Temel sistemler

## Can, tokluk, enerji

Değerler seviyeyle artar. 16. seviyeden sonra her seviye bu hesaplarda **iki seviye** sayılır.

| Değer | Sv 1 | Sv 10 | Sv 16 | Sv 25 | Sv 50 | Not |
|---|---|---|---|---|---|---|
| En yüksek can | 100 | 145 | 175 | 265 | 515 | + Dayanıklılık ağacındaki can yetenekleri |
| Zırh (temel) | 0 | 9 | 15 | 24 | 49 | **seviye − 1** (iki katına sayma kuralı burada yok) + Zırh I–IV yetenekleri (v1.81) |
| Can yenilenmesi (/sn) | 0,10 | 0,19 | 0,25 | 0,43 | 0,93 | tokluk > 70 iken ×1,5; tokluk 0 iken yenilenmez; Hızlı iyileşme ×2/×3/×4 |
| En yüksek enerji | 100 | 136 | 160 | 232 | 432 | + Derin nefes yetenekleri |
| Enerji yenilenmesi (/sn) | 14 | 18,5 | 21,5 | 30,5 | 55,5 | harcamadan 0,6 sn sonra başlar; yürürken ×0,6 |
| Vuruş hasarı çarpanı | 1,00 | 1,27 | 1,45 | 1,72 | 2,47 | her seviye +%3; Güçlü kol ×1,10/×1,25/×1,40 |
| Satış çarpanı (seviyeden) | 1,00 | 1,09 | 1,15 | 1,33 | 1,83 | – |

- Toplama hızı her seviye +%3 (33. seviyede durur), yürüme hızı her seviye +%2 (21. seviyede, 1,5 katta durur), şans her seviye +%0,5 (23. seviyede durur).
- **Tokluk** 100'den 0'a **12 dakikada** iner (Tok karın ile 16 dakikada) (ilk 2 gün yarı hızda, 3–4. gün ¾ hızda). 35'in altında uyarı, 25'in altında mide guruldar. **0 olunca saniyede 1,6 can** gider.
- **Yemek** yiyince tokluk değerinin %80'i kadar (Doyurucu sofra ile %120'si) can 15 saniyeye yayılarak dolar. Tıka basa tokken de yemek yenir (v1.88): tokluk 100'ü geçmez ama yemeğin canı ve yan etkileri (güçlendirmeler, çiğ etin mide bulantısı) yine işler; tanrı modunda da yenir.
- **Enerji**: koşu saniyede 18, atılma 14, savuşturma 5, her vuruş 4 (yumruk) – 10 (balta/kazma) yer. Enerji biterse "Yoruldun": %30'a dolana kadar koşamaz, vuramazsın. Enerji %35'in altındaysa vuruşlar yavaşlar.
- **Kamp ateşinin** 64 piksel yakınında saniyede +1,4 can (Kamp ateşi ustası ile +2,8).
- Diken: böğürtlen 3, çakmaktaşı 2 can yakar (ilk 3 toplayışta kesin, sonra %20; eldiven giyiliyse hiç). Kirpiye çıplak elle vurmak 3 can.

## Bayılma

- **Oyunda ölüm yok (v2.10, Boğaç):** karakter hiçbir zaman ölmez, oyun hiç bitmez. Canavar, açlık, zehir, gece mor ışık: hepsi **bayıltır** ve her bayılmadan sonra uyanırsın. Oyundaki ve belgedeki bütün yazılar "öl" değil "bayıl" der. (Canavarları öldürmek, av ve Reis avı bundan ayrıdır.)
- **Can 0 olunca bayılırsın.** Taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) **%20'si ve sikkelerin %20'si kaybolur**; kalan her şey düştüğün yerde bir **çantada** kalır (haritada kurukafa). Çantanın üstüne yürüyünce her şey geri gelir. Kumsaldaki uyanış yerinde can %50 ile uyanırsın.
- Görev eşyaları kaybolmaz (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları; Ekin'in külçe görevi sırasında o külçe).
- Bayıldıktan sonra 60 sn Reis çıkmaz. Bayılmak %60 ihtimalle bir anı açar.
- **Tanrı modu** (hile) açıkken canavar, açlık ya da zehirle bayılmazsın. **Mor ışık ise tanrı modunda bile bayıltır** (Boğaç'ın kararı, bilinçli: oyunun adı Mor Işık). Gece ışıksız kalırsan tanrı modu seni korumaz.

## Gün, gece ve mor ışık

- **Gündüz 06:00–20:00 = 8 dakika**, **gece 20:00–06:00 = 2,5 dakika**; bir gün yaklaşık 10,5 dakika. Menü ya da konuşma açıkken dünya durur.
- 19:00'dan itibaren kararır; 21:00–04:30 tam karanlıktır.
- **Zifiri karanlık kuralı:** gece elinde meşale yoksa, kafa lamban yoksa, bir ışığın (kamp ateşi vb.) içinde ya da bir evin içinde değilsen sayaç başlar: 3,5 sn "Kim var orada?!", 6,5 sn "Bir şey yaklaşıyor…", **8. saniyede mor ışık iner ve bayılırsın**. İlk gece süre 20 sn'dir ve **ilk gece hiçbir şey kaybolmaz**; sonraki gecelerde bayılmadaki gibi %20 kayıp. Ertesi sabah 06:00'da kumsalda uyanırsın.
- İlk kez meşalesiz karanlığa yakalanınca biri sana bir kez **bedava Kaba meşale** fırlatır. İlk 3 gün 17:30'da "Hava kararıyor" uyarısı gelir.
- **Güvenli yerler** (saldırgan canavarlar uzaklaşır, mor ışık gelmez): Ekin'in kampı (352 px), kişilerin ateşleri (kuzenlerin ateşleri dahil), Dursun'un ocağı, Zümrüt'ün kazanı (120 px), kendi kamp ateşin (100 px), evin içi. Ateş böcekleri ve mor kıymıklar ışık sayılmaz.

### Işık kaynakları

| Işık | Yarıçap | Süre | Not |
|---|---|---|---|
| Kaba meşale | 80 px | 110 sn (yalnızca eldeyken yanar) | 2 Dal + 2 Lif + 2 Yaprak, el yapımı |
| Meşale | 115 px | 170 sn | Dursun döver |
| Kafa lambası | 125 px | sonsuz | Baş yuvası; Işıkçı'dan takasla |
| Kamp ateşi | – | 330 sn; 2 Dal +95 sn, 1 odun +190 sn, 1 Kav +285 sn; en çok 720 sn | V ile kurulur; yağmurda 1,6 kat hızlı söner |

- Meşale sol elde taşınır; sağ elde silah olabilir. Yağmurda 2 kat, fırtınada 2,7 kat hızlı biter. **Reçine** (L): Meşale +%65, Kaba meşale +%50 süre. Biten meşale yığından 1 eksilir, varsa yenisi yanar.
- Kamp ateşinin başında **E**: odun at ya da çiğ et/balığı **közle**.

### Hava

Kabaca açık %45, bulutlu %20, yağmur %18, fırtına %7, sis %10 (Bataklık ve Kayalık Dağ'da sis daha sık, yaklaşık %20; öbürleri o kadar azalır). Yağmur/fırtına: meşale ve kamp ateşi çabuk biter, **tarladaki tohumlar kendiliğinden sulanır**, balık %30 daha çabuk vurur; fırtınada şimşek çakar. Kül Diyarı'nda yağmur yerine **kül fırtınası** olur. Siste saldırganlar seni %40 daha geç fark eder.

### Uyku

- Uyku yalnızca **20:00–05:00** arası. Uyuyunca saat 06:00 olur, can ve enerji dolar, tokluk 20 azalır; %40 ihtimalle bir rüya anısı gelir.
- Yataklar: Hasır yatak (Usta Kemal ilk tanışmada hediye eder), Hasırotu yatak, Ahşap karyola. Yatak açıkta da kurulabilir; evde içeri yerleştirilir. **Yaprak barınağı** yatak istemez ama bir gecelik (uyanınca dağılır).

## Seviye, XP ve yetenekler

- En üst seviye **50**. Gereken XP 16. seviyeye kadar her seviye %35 artar (1→2: 40, 5: 133, 10: 596, 16: 3.606), sonra yavaş artar (25: 5.553, 49: 10.746). 1'den 50'ye toplam yaklaşık **254 bin XP**.

| Kaynak | XP |
|---|---|
| Kazanda yeni tarif öğrenmek | 12 |
| Elle yeni ürün / tekrar | 12 / 2 |
| Örste yeni alet ya da zırh / tekrar | 8 / 2 |
| Zor modda "Dene" ile tarif bulmak | 5 |
| Avlamak | türün XP'si (tablolarda) |
| Reis | türün XP'si × 6 + 20 |
| Toplamak (her düğüm, ağaç, meyve) | 1 |
| Tarla adımı / hasat / Hasan'a alet | 1 / 3 / 10 |
| Balık | 3 + fiyatın yarısı |
| Tuzaktan av almak | 4 |
| Közleme | közlenen parça sayısı (en çok 30) |
| Keşif defterinde bir kategoriyi bitirmek | 100 |
| Anı | 25 + 15 × anının sırası |
| Ada halkı hikâye sahnesi / Zümrüt'ün bilmecesi | 40 / 20 |
| Köprü onarımı / Doğu geçidi | 40 / 320 |
| Görevler, Börü'nün dersleri | tablolarda |

- **Yetenek ağacı** (Y; v1.83): üç renkli ağaç — **Savaş** (kırmızı), **Ekonomi** (altın) ve **Dayanıklılık** (yeşil); her birinde 30 yetenek (toplam 90). Yetenekler sade, iki renkli ikonlu yuvarlaklardır; hepsi açılınca bir ağaç silüeti çizer. Başta yalnızca kök yetenek görünür; bir yetenek alınınca **yalnızca ona bağlı üstündekiler** açılır. Satın alma ikona tıklayarak. Fiyat ve seviye şartı kata göre: 100 (–), 250 (Sv 2), 400 (Sv 3), 600 (Sv 4), 1.000 (Sv 6), 1.800 (Sv 8), 3.000 (Sv 11), 5.000 (Sv 14). Tam liste "Yetenek ağacı" bölümünde.
- **Koşu** Savaş ağacının ilk yeteneğidir: yalnızca 100 sikke; seviye, köprü ya da Atılma şartı yok.
- **Atılma** yetenek ağacında değildir: öğreticide Börü ücretsiz öğretir (bkz. "Oyunun akışı").

## Zorluk

İki mod vardır. **Zor mod** yalnızca tarif keşfini değiştirir (canavarlar, açlık, ekonomi aynı):

- Tarif kitabı kapalıdır; malzemeleri görmek tarifi açmaz.
- Kazanda iki sekme olur: **Tarifle kaynat** ve **Deneyerek bul**. "Dene"ye en çok 6 farklı malzeme atılır; hiçbir şey harcanmaz. Cevaplar yol gösterir: "yeni tarif buldun", "en yakın tarife N malzeme eksik", "bildiğin bir tarifte birlikte", "tek başına bir şey olmuyor", "yanlış yer (örs)". Her tarifin malzeme türü kümesi benzersizdir.
- Kitapta **Tarif satın al**: rastgele kapalı bir tarif 50 sikke.

## Ekonomi

- **Satış** yalnızca Pazarcı Nazlı'ya. Birim fiyat = temel fiyat × satış çarpanı. Satış çarpanı = (1 + Ticaret yüzdesi + Değerli işçilik (yapılmış eşyada) + Toptancı (Hepsini sat) + Keşif defteri ustalığı) × seviye çarpanı; **en çok 2,3**.
- **Fiyatsız eşya satılmaz (v2.17):** her eşyanın bir fiyatı olmalı; fiyatı bulunmayan bir eşya pazarda **satılmaz** ("Bu eşyayı Nazlı almıyor"), "Hepsini sat" onu atlar. Meyve ağacı odunları (Elma, Armut, Erik, Mürver) **3 sikke** ve "Herhangi odun" grubundalar (v2.16'ya kadar fiyatları yoktu; satınca sikke **NaN** oluyordu).
- **Bozuk sikke onarımı (v2.17):** kayıt açılırken ya da oyun sırasında sikke sayı değilse (NaN), oyun bunu düzeltir: kayıttaki en son geçerli sikke miktarına (otomatik ve elle kayıtların içinden en yenisi, yoksa 0) döner ve "Sikkelerin onarıldı" der. Görev sayaçlarındaki bozuk değerler de 0'dan sürer.
- **Şanslı müşteri** satışta %5 (II ile toplam %12) + şans ihtimalle iki kat öder.
- **Satın alma:** yalnızca Nazlı, yalnızca daha önce eline geçmiş **doğal** malzemeler (tohumlar dahil). Alış fiyatı temel fiyatın 2,6 ile 5,6 katı arası (pahalı ve tehlikeli bölge malzemesi daha pahalı).
- Başka hiçbir kişi sikkeyle eşya satmaz; ustalar malzemeyi senden alıp **işçilik** ister (Dursun/Durmuş %15, Kemal %20, ACT 2 ustaları sabit ücret). Rıza evleri sikkeyle yapar.
- **Temel fiyat** formülü: malzemelerin toplam değeri × (1,15 + 0,05 × zincir adımı, en çok 6) + gereken aletin değerinin %10'u.

## Tarifler: kazan, el yapımı, örs, ustalar

- **Kazan yalnızca öğretir:** malzemeleri koyup kaynatırsın, malzemeler gider, tarif öğrenilir (+12 XP); ürün çıkmaz. ACT 1'de Zümrüt'ün ve beş kuzen cadının (Yakut, Safir, Firuze, Mercan, İnci) kazanları, ACT 2'de Ülker'in kazanı. Bütün ACT 1 kazanları aynı tarifleri öğretir.
- **Tarif kitabı** (K): bir tarif öğrenilmiş, bir kişi tarafından kitaba yazılmış ya da (Normal modda) bütün malzemeleri ve aletleri en az bir kez görülmüşse **açık** görünür. Kapalı tariflerin adı titreşen harflerle, bilinmeyen malzemeler "?" ile görünür. Kitapta bir tarife **Takip et** dersen malzemeleri ve elindeki sayıları ekranın üstünde görürsün (aynı anda 1 tarif).
- **El yapımı (Tab):** öğrenilmiş ve örste dövülmeyen, yapı ya da ev eşyası olmayan her tarif. Yap / ×5 / Hepsi.
- **Örs:** aletler ve silahlar Demirci Dursun'da ve silahçı kuzenlerinde, örste dövülen zırhlar Zırhçı Durmuş'ta ve zırhçı kuzenlerinde. **Kademe kuralı (v1.84):** her demirci yalnızca kendi biyomunun ve öncekilerin malzemesiyle yapılan eşyaları döver (Dursun/Durmuş: yalnız Çayır); ayrıntı "Zümrüt, Dursun ve Durmuş'un kuzenleri" bölümünde. Örs listesinde bir ara parçanın yanındaki **+** o parçayı elindeki malzemeden hemen yapıp örse koyar.
- **Usta Kemal:** yapılar, yataklar, ev eşyaları. **Atölye** kurulursa seçtiğin tarifi 25 sn'de bir kendisi üretir (en çok 50).
- **Zümrüt'ün bilmecesi:** bilinmeyen bir tarifi ipucuyla sorar; öğrenince 30 + 2 × fiyat sikke ve 20 XP.

## Aletler, dayanıklılık, kademe

- Her toplama, isabet ya da balık aletin 1 kullanımını yer. Dayanıklılık rengi yeşilden kırmızıya döner; sıfırda alet çalışmaz, silah yumruk gibi vurur. **Bileme** (Dursun ve silahçı kuzenleri): aletin değerinin onda biri. Kova ve asalar/ateşli silahlar körelmez.
- **Alet yuvaları:** 5 (Alet kemeri dalıyla 6/7/8/10/12). Yuva doluysa yeni alet yere düşer; yerdeki eşya 180 sn sonra kaybolur.
- **Mıknatıs:** yere düşen küçük eşyalar (yeni düşenler yarım saniye bekler) **21 px** yakına gelince sana doğru süzülür (1.89'a kadar 30 px'ti; %30 kısaltıldı). 10 px içinde hızla çekilir, 6 px'te toplanır; E ile 28 px içindekiler alınır.
- **İş çubuğunun yazısı:** balta ile ağaç keserken "**Kesiliyor: Çam ağacı**" (ağacın adı), kazma ile kazarken "**Kazılıyor: …**", öbür toplamalarda "Toplanıyor: …" yazar.
- **Balta kademesi:** Taş 1 · Çakmaktaşı, Granit 2 · Kuvars, Tunç 3 · Bazalt, Demir 4 · Obsidyen 5.
  - 1: Çam, Ladin, Kavak, Elma, Armut, Erik · 2: Meşe, Ceviz, Mürver, Kayın, Ihlamur, Kızılağaç · 3: Huş, Söğüt, Kestane, Akçaağaç, Dişbudak, Bataklık servisi · 4: Ardıç, Porsuk, Kara çam, Kül ağacı, Dikenli akasya, Kızıl sedir, Ateş narı · 5: Mor söğüt, Gece ağacı, Işık ağacı, Yıldız eriği, Ay elması · ACT 2: Yüzen Kayalar ağaçları 1, diğerleri 2.
- **Kazma kademesi** (aynı sıra): 1: Bakır, Kalay, Kireçtaşı, Taş kömürü, Kumtaşı, Granit, Tuz kayası · 2: Kuvars, Arduvaz, Demir cevheri · 3: Bazalt, Gümüş, Altın, Kükürt, Pirit · 4: Obsidyen, Ametist · 5: Kristal (yalnızca Obsidyen kazma). Bir maden damarı 3–5 vuruşta tükenir, 300 sn sonra yeniden dolar.

## Zırh ve durum etkileri

- Beş yuva: baş, gövde, eller, ayaklar, silah. Giyilen eşyaların toplamı **savunma**dır; Keşif defterinin Giyim ve Zırh ustalıkları +5'er savunma verir.
- **Zırh** (v1.81) karakterin temel özelliğidir: **seviye − 1** (Sv 1'de 0, Sv 50'de 49) + Dayanıklılık ağacındaki Zırh I–IV yetenekleri (+5 / toplam +12 / +20 / +30). Eşyaya bağlı değildir, hiç çıkmaz.
- Alınan **fiziksel hasar × 25 / (25 + savunma + zırh)**. Zehir, yanık ve kanama da bu oranın yarısı kadar yumuşar. Karakter ekranında "Zırh", "Savunma" ve toplam hasar azalması ayrı ayrı yazar. (Ekin'in "Savunmanı 60'a çıkar" görevi yalnızca eşya savunmasını sayar.)
- **Çamur:** Bataklık çamurunda yavaşlarsın (×0,6); Kamış çizme, Demir çizme, Bataklık çizmesi, Hurda çizme ve Meka çizme bunu önler.
- **Durum etkileri** canavarlardan, alev/zehir gölünden ve zehirli yemekten gelir: **zehir**, **kanama**, **yanık** belirli süre saniyede can yakar; zırh bunu da yarı oranda yumuşatır. Dirençler: Bataklık postu pelerin (zehir %30), Timsah derisi zırh (kanama %40), Kül postu pelerin (yanık %40), Lav pulu eldiven (yanık %30), Demir zırh (kanama %30), Ejder pulu zırh (yanık %60), Mantar lifi eldiven (zehir %40), Kristal miğfer (kanama %30), Ejder pulu eldiven (yanık %40), Meka çizme (kanama %20), Meka zırh (üçü de %50); kuzenlerin zırhları: Meşe kabuk zırh (kanama %15), Timsah pulu zırh (kanama %40), Bataklık çizmesi (zehir %25), Gümüş pullu zırh (kanama %35), Kül böceği zırh (yanık %50), Akrep kabuğu çizme (zehir %35), Kristal ipek zırh (üçü de %25), Işık pulu eldiven (zehir %35). Dayanıklılık ağacındaki Zehre/Ateşe/Kanamaya dayanıklı yetenekleri ilgili hasarı ayrıca %40 azaltır (çarpılarak birleşir); Çelik beden üçünün süresini yarıya indirir; Son nefes canın dörtte birinin altındayken fiziksel hasarı %25 azaltır.
- **Yemek kalkanları:** Panzehir zehri tamamen keser, Ateş kalkanı yanığı %70, Pıhtı kanamayı %60 azaltır.

## Yemek

- **Tokluk değeri:** çiğ meyve ve sebzeler 2–12 (biyom tablolarında), çiğ et 6, çiğ balık 4, közlenmiş et/balık 12–32, pişmiş yemek tarifleri 10–65 (pahalı tarif daha doyurur). Şifa tarifleri doğrudan can verir (15–60).
- **İyi etkiler** yemeğin türüne göre 60–240 sn sürer: **Güç** (+%20 vuruş: et, şiş, yahni), **Şifa** (can 3 kat hızlı: çorba, lapa), **Doygunluk** (tokluk inmez: ekmek, kek, patates), **Çeviklik** (+%12 hız: bal, şerbet), **Canlılık** (enerji 1,5 kat: çay, meyve suyu), **Gece gözü** (karanlıkta görme: mantar, balık, gece sefası), **Panzehir**, **Ateş kalkanı**, **Pıhtı**. Nadir pişmiş yemeklerde ek **Dayanıklılık** (can sınırı +%20).
- **Kötü etkiler** ucuz ve garip yiyeceklerde (ihtimal ucuzda %90, pahalıda %20): Ağırlık (−%20 hız), Halsizlik (enerji yarı hızda), Bulantı (can yenilenmez), Güçsüzlük (−%20 vuruş). Çiğ et ayrıca %35 ihtimalle 4 can yakar.
- **Zehirli yiyecekler:** Mürver, Meşe palamudu, Sinek mantarı, Kurt eti, Kurbağa (çiğ), Kuzukulağı, Kuzugöbeği, Mağara mantarı, Ardıç meyvesi. Bir kez yiyince listede "zehirli!" yazar.
- Bir yemeği ilk kez yiyene kadar listede etkisi "Bilgim yok" görünür.

## Balık tutma

- Alet: **Ağ** (en kolay), **Olta**, **Kemik zıpkın**. Eline al, suya dön, E. Şamandıra dalınca 1,05 sn içinde E (iki kez kaçırırsan balık gider), sonra gidip gelen ibre **yeşil alandayken** bir daha bas. Yürürsen ya da bir şey saldırırsa olta çekilir.
- Zor balıklar (yeşil alan dar): Mersin balığı, Turna balığı, Yayın, Alabalık, Tatlısu levreği.
- Her atışta %5 çöp (Dal, Yosun, Kemik), gece ayrıca %5 **Mor kıymık**.

| Sular | Ne çıkar (ağırlık) |
|---|---|
| Çayır/Orman · deniz | Tatlısu kefali 30, Çapak 26, Sazan 22, Kızılkanat 12, Mersin balığı 3 |
| Çayır/Orman · nehir ve göl | Alabalık 28, Kızılkanat 20, Tatlısu levreği 20, Çapak 16, Sazan 14, Tatlısu midyesi 10, Yılan balığı 9 |
| Bataklık / Kayalık Dağ | Yayın 24, Kadife balığı 24, **Kerevit 22**, Turna balığı 18, Yılan balığı 12, Tatlısu midyesi 12, Sazan 10 |
| Kül Diyarı / Mor Kristal Vadisi | Yayın 30, Mersin balığı 22, Turna balığı 22, Kadife balığı 14 |

## Tuzaklar ve balık kapanı

- En çok **6** tuzak + kapan (toplam). Haritada kahverengi kare, dolunca sarı.
- **Tuzak:** elde Tuzak, çimen ya da orman zeminde E. 110–230 sn sonra bir av düşer: Çayır/Orman'da Tavşan, Keklik, Sincap; Bataklık/Kayalık Dağ'da Ördek, Keklik, Tavşan; doğuda Tavşan. Avın normal ganimetini verir.
- **Balık kapanı** (2 Sepet + 3 İp + 1 Dal; Dursun döver): elde kapan varken yakındaki suya E, kapan suyun kenarına konur. 130–250 sn sonra **o bölgenin balık listesinden 2 balık** (yukarıdaki tablonun nehir satırları; kapan ağırlığa bakmaz, listedeki her balık eşit ihtimalle çıkar). Kerevit yalnızca Bataklık/Kayalık Dağ sularında çıkar: her çekilişte 1/7, yani bir kapan boşaltmada yaklaşık %27 ihtimalle en az bir kerevit.
- Dolu tuzağa E: av alınır, tuzak kendiliğinden yeniden kurulur ve dayanıklılığı 1 düşer (Tuzak 20, Kapan 40 kullanım). Boş tuzağa E: "Bekle" ya da "Tuzağı topla". Her av +4 XP.

## Gece buluntuları

Karanlık çökünce (gece), ışık olmayan çimen ve orman zemininde çevrende belirir, sabah kaybolur:

- **Gece sefası:** yakınında 3 tane (Kül Diyarı'nda ve Mor Kristal Vadisi'nde çıkmaz). Yenir (+5 tokluk, Gece gözü 120 sn). Zümrüt'ün görevi ve Işıkçı takası için.
- **Mor kıymık:** 1 tane (3. günden sonra 2). Işıkçı takası; Zümrüt'e 2 tane verince sıradaki anı erken gelir.
- **Ateş böcekleri:** gece sefalarının çevresinde; yalnızca görüntü.

## Tarım

Bkz. "Çiftçi Hasan". Tarla 4 × 3 = 12 parsel. Adımlar (aletler çantada, E): tırmıkla hazırla → tohum ek → **sula** (yalnızca sulanmış tohum büyür; yağmur da sular) → olgunlaşınca tırpanla biç.

| Ürün | Büyüme (sulanmışken) | Hasat | Tohum fiyatı | Ürün fiyatı |
|---|---|---|---|---|
| Buğday | 60 sn | 2–4 | 3 | 8 |
| Havuç | 80 sn | 2–4 | 4 | 10 |
| Soğan | 90 sn | 2–4 | 4 | 10 |
| Patates | 100 sn | 2–5 | 5 | 12 |
| Ayçiçeği | 120 sn | 2–3 | 6 | 16 |
| Kabak | 150 sn | 1–2 | 8 | 24 |

Hasatta %45 ihtimalle 1 tohum geri gelir. Tohum Hasan'ın ödüllerinden, hasattan ve (bir kez görüldükten sonra) Nazlı'dan alınır. Meyve ağaçları silkelendikten 150 sn sonra yeniden meyve verir.

## Ev, ev içi ve döşeme

- Ev **Marangoz Rıza**'dan sikkeyle alınır, envantere gelir; bir yuvaya koyup yere kurarsın (Boşluk döndürür, Esc iptal). Taş ev yalnızca Ekin'in yanındaki arsaya kurulur.
- Yaprak barınağı dışındaki her evde **E = içeri gir**. İçeride ada donar (canavarlar, oklar durur) ama saat, açlık ve hava sürer. **İçeride mor ışık gelmez.**
- Üst çubukta **Döşe** / **Dışarı çık**. Döşe kipinde envanterdeki ev eşyasını seç, ızgarada bir kareye tıkla (R döndürür); konmuş eşyaya tıklayınca geri alırsın. Kapının önü boş kalmalı; duvar eşyaları (raf, asma fener, perde, duvar halısı, resimler) üstteki duvar şeridine, halı ve kilim zemine (üstünden yürünür), diğerleri zemine konur. Eşyalar üst üste konmaz. **Döşeme her saatte yapılabilir;** gece kısıtı yalnızca uyku içindir.
- Ev eşyaları: yataklar (Hasır yatak 1×2, Hasırotu yatak 1×2, Ahşap karyola 2×2), lambalar (Taş lamba, Kil lamba, Asma fener), Taş/Çömlek fırını 2×1, Tabure, Sandalye, Masa 2×1, Sandık, Dolap, Raf, Halı 3×2, Kilim 2×1, Perde, Duvar halısı, Saksı, Boyalı çömlek, Kil figürin, Ana tanrıça heykelciği, Taş totem, Su testisi, Mağara resmi, Av sahnesi duvar resmi, El izi resmi. Hepsi kazanda öğrenilir ve **Usta Kemal** yapar.

| Ev | Seviye | Oda | Not |
|---|---|---|---|
| Yaprak barınağı | 1 | yok | Bir gecelik, yatak istemez |
| Deri çadır | 3 | 5×4 | |
| Kulübe | 4 | 6×4 | |
| Kamış kulübe | 5 | 7×5 | |
| Kerpiç ev | 6 | 8×6 | |
| Ahşap ev | 7 | 9×6 | |
| Taş ev | 8 | 10×7 | Ekin'in yanındaki arsaya |
| Konak | 10 | 12×8 | |

## Harita, işaretler, defterler

- Sağ altta küçük harita; **M** büyük harita (tekerlek, sürükleme ya da +/− ile yakınlaştır). Geçtiğin yerin çevresi açılır (Kâşif gözü ile iki kat). Gece harita kararır ama kişiler görünür.
- **N** bulunduğun yere işaret koyar (ad + 5 renk, en çok 40). Büyük haritada bir kişinin simgesine dokununca ok onu gösterir; varınca, ✕ ile ya da **sağ tıkla** kalkar. Kendi işaretinde "Yol göster".
- Haritada: bayıldığın yerler (kurukafa), kurduğun ev/yatak/tuzaklar, kişiler.
- **Görevi olan kişiler büyük haritada parlar (v1.90):** üstünde **!** olan (görev veren) her kişinin simgesinin arkasında sarı bir ışık ve dışa doğru açılan iki sarı halka, **?** olan (görevi teslim edilecek) kişide yeşil ışık ve halkalar olur; haritayı açan nereye gideceğini hemen görür. Şu an üstünde çalıştığın görevin kişisi ayrıca sarı zeminli işaretle gösterilir.
- **Keşif defteri** (Kitap): her tarif kategorisinde yaptığın tariflerin oranı. **%25** → sikke, **%50** → kalıcı **ustalık**, **%100** → sikke + 100 XP. Ustalıklar: Yiyecek (tokluk %20 yavaş iner), Şifa (can 1,5 kat hızlı), alet kategorileri (%20 körelmeme), Giyim ve Zırh (+5 savunma), Ateş (meşale %30 uzun), Ağaç (odun %20 hızlı), Taş ve kil (%20 hızlı), Av ve hayvan (ganimet +%10); diğerleri o kategorinin eşyalarını %15 pahalı sattırır.

## Almanak (v2.13)

Sağ altta, küçük haritanın hemen üstünde **Başarımlar**'ın solunda küçük bir **kitap** simgesi (kısayol **U**, Ayarlar → Kontroller'den değişir). Haritanın üstündeki üç düğme (Almanak, Başarımlar, Özellikler) **eşit boyuttadır** ve üçü birlikte haritanın genişliğini geçmez (v2.14). Telefonda düğmeler sağ sütunda alt alta. Adanın canlılarını bölge bölge gösterir.

- **Sol sütun: keşfettiğin biyomlar.** Yalnızca adım bastığın biyomlar görünür, ilk girdiğin sırayla. Çayır'dan hiç çıkmadıysan yalnızca Çayır vardır; Orman'a ilk adım attığında ekranda "Orman" yazısı çıkar ve almanakta **2. satır** olarak Orman açılır. Henüz bilmediğin biyom hiç gösterilmez (sayı da yazmaz).
- **Sağ taraf: seçili biyomun bütün canlıları** (o biyomda karşılaşılabilecek her tür, gece çıkanlar ve seviyeyle gelenler dahil). Her canlı bir kart:
  - **İlk kez öldürülene kadar:** kapkara bir siluet ve **???**; hiçbir bilgi yok.
  - **İlk kez öldürülünce açılır:** resmi, adı, huyu (zararsız / nötr / saldırgan), can, hasar, hız, uzaktan saldırısı ve bıraktığı etki (zehir, yanık…), düşürdükleri, kaç tane avladığın.
  - **Reis sayacı:** kartın altında "Reis: 3 / 7" (o türden kaç avladın / Reis için kaç gerekir). Sayaç dolunca Reis gelir.
  - **Reis yenilince kart altın rengine döner** ("Reis yenildi"). Her türün Reisi **yalnızca bir kez** yenilir: kart altına boyandıktan sonra o türden ne kadar avlarsan avla Reis bir daha gelmez.
- **Reise yenilirsen:** Reis sahadayken (ya da gelmek üzereyken) bayılırsan Reis kaybolur ve sayaç **bir eksik** kalır (ör. 6 / 7), sanki onu çağıran son av hiç yapılmamış gibi. O türden bir tane daha avlayınca Reis yeniden gelir; yenene kadar böyle sürer. (Bayıldıktan sonra 60 sn hiçbir Reis gelmez kuralı geçerli.)
- Almanak açıkken oyun durur. Kaydedilecek yeni bir şey yok: biyomlar, avlar ve Reisler zaten kayıtta; eski kayıtlarda bugüne kadar avladıkların açık gelir.

## İzler ve anılar

- **İzler** (Kitap → İzler): eşinden kalan 6 mor parıltı. Kopmuş bilezik (kumsal), Islak defter sayfası (kuzeybatı ormanı), Tuhaf metal parçası (Kayalık Dağ tarafı), Çamurdaki izler (Toygar'ın güneydoğusu), Yıldız haritası ve Mor kristal (doğu). Üstüne gidip E. Sonuncusu "Gerçek" sahnesini açar.
- **Anılar** (Kitap → Anılar), her biri +25 + 15 × sıra XP:
  - 5 **tarif anısı**: 10, 25, 50, 100 ve 175 tarifte (Yağmurlu çarşı, Yanık ekmek, Çay kıyısında söz, Mor bir delik, Son akşam).
  - 7 **olay anısı**: uyurken (%40), bayılınca (%60) ya da görev bitince (%30), gün şartıyla: Kumsalda ilk dans (1. gün), Kırık pusula (4), Hastane koridoru (6), Yıldız haritası (8), Mektup (12), Mor fısıltı (20), Bırakılan el (25).
  - 5 **ACT 2 anısı**: ACT 2 ustalarının kilit görevleri bitince.
- **Ada halkının hikâyeleri:** görev veren 9 kişinin her biri mor ışık yüzünden birini kaybetmiştir; görevler hikâyeyi parça parça açar, sonunda bir sahne (+40 XP). Kitap → Ada halkı.

# Dövüş

## Silahlar

| Tür | Hasar | Menzil | Bekleme |
|---|---|---|---|
| Yumruk | 4 | 16 | 0,45 sn |
| Meşale (başka silah yoksa) | 7 | 19 | 0,48 sn |
| Kılıç | Taş 12 · Tunç 22 · Granit gürz 27 · Demir 34 · Timsah dişi kılıcı 38 · Gümüş kılıç 44 · Ejder kılıcı 52 · Lav camı kılıcı 55 · Ametist kılıcı 58 · Işın kılıcı 60 | 22 | 0,42 sn |
| Mızrak | Mızrak 10 · Çakmaktaşı 14 · Kuvars 18 · Tunç 20 · Bazalt 22 · Obsidyen 28 · Demir 30 | 30 | 0,6 sn |
| Balta | Taş 9 · Çakmaktaşı/Granit 12 · Kuvars 16 · Tunç 20 · Bazalt 24 · Demir 30 · Obsidyen 36 | 20 | 0,5 sn |
| Kazma | Taş 8 · Çakmaktaşı/Granit 11 · Kuvars 14 · Tunç 18 · Bazalt 21 · Demir 26 · Obsidyen 32 | 20 | 0,5 sn |
| Asalar, ateşli silahlar | ACT 2 bölümündeki tablo | 210–340 | |

- **Vuruş ne zaman değer (v2.08):** vuruşun çizildiği yer (karakterin göğsü) ile canlının **gövdesi** arasındaki uzaklık, silahın menzili + canlının boyu + 3 pikseli geçmiyorsa ve canlı vuruş yönünün en çok ~95° yanındaysa (çaprazlar dahil, geniş bir koni) vuruş değer ve hasar verir. Vuruş efekti canlının görseline değdiği an hasar sayılır; çok yakındaki (gövdesine yapışık) canlı yönden bağımsız vurulur. Yumruk ve tek elli silahlar ilk değdiği canlıya vurur.
- **Canlının her yeri sayılır (v2.12):** uzaklık canlının gövde noktasına değil, **çiziminin kapladığı kutuya** (kıskaçlar, kuyruk, boynuz, kanat dahil; gölge ve can çubuğu hariç; her tür ilk vuruşta bir kez ölçülür, yöne göre aynalanır, büyük Reislerde boyla çarpılır) ölçülür: göğüsten kutunun en yakın noktasına uzaklık silahın menzili + 3 pikseli geçmiyorsa ve o nokta vuruş yönünün en çok ~95° yanındaysa vuruş değer. Böylece kerevitin kıskacına, geyiğin boynuzuna değen vuruş da hasar verir. **Bütün canlılarda** (iki adada da, Reisler dahil) geçerlidir; çizimi ölçülemeyen bir canlı olursa yukarıdaki eski kural kullanılır.

- Gerçek hasar = silah × (1 + 0,03 × (seviye − 1)) × Güç etkisi 1,2 × Güçsüzlük 0,8. Silah yuvasındaki silah, elde silah yokken kullanılır.
- Vuruş üç evrelidir (hazırlık, darbe, takip); isabette kısa bir donma olur, ıskalarsan bir an açık kalırsın. Her isabet silahı 1 köreltir.
- Reisler ve iri türler (Timsah, Yaban öküzü, Kara ejder, Mağara ayısı, golemler, ejderler, robotlar, muhafızlar) vuruşla geri itilmez.

## Atılma, savuşturma, savunma

- **Atılma / takla** (Boşluk; öğreticide Börü ücretsiz öğretir): 0,38 sn, 50 piksel; boyunca **dokunulmazsın**. 14 enerji, bekleme 0,68 sn (Çevik atılma I/II/III: 9/7/5 enerji, 0,45/0,38/0,30 sn; Uzun atılma: %25 daha uzağa). Bir saldırının içinden taklayla geçersen "Sıyrıldın!" +6 enerji (Sıyrılma ustası ile +14).
- **Savuşturma da öğrenilir (v2.15):** oyunun başında savuşturma ve gard (sağ tık / E, telefonda Savuş düğmesi) **kapalıdır**; Börü takla dersinin hemen ardından ücretsiz öğretir (öğretici, 11. adım). Öğreticiyi atlayan Börü ile konuşunca ücretsiz öğrenir. Bilmeden basınca "Savuşturmayı henüz bilmiyorsun: Savaşçı Börü öğretir" der; telefonda Savuş düğmesi öğrenilince görünür. v2.14 ve önceki kayıtlarda takla (Atılma) biliniyorsa savuşturma da bilinir sayılır.
- **Savuşturma** (sağ tık, darbe değmeden hemen önce): 0,2 sn pencere (telefonda 0,25; Savuşturma ustası I/II ile ×1,3 / ×1,6), 5 enerji. Başarılıysa hasar almazsın, canavar geri savrulur ve **1,6 sn sersemler**, +6 enerji, ulti +10. Fırlatılan diken, ateş ve büyüler de savuşturulur.
- **Darbe renkleri** (canavarın başındaki "!"): **beyaz** = normal, savuşturulur · **sarı** = ağır (×1,4 hasar), savuşturulur · **kırmızı** "!!" = savuşturulamaz (×1,7 hasar), ancak takla ile kaçılır. Reisin yere vurması ve yakalama da savuşturulamaz.
- **Savunma duruşu** (sağ tık basılı tut): %45 hızla yürürsün, vuramazsın; fiziksel hasar beyazda ×0,35, sarıda ×0,45, kırmızıda ×0,7. Her engel enerji yer; enerji biterse kalkan düşer.

## Özel vuruşlar (kombolar)

| Giriş | Hamle |
|---|---|
| Çift tık (0,18 sn içinde) | **Çift vuruş** |
| Basılı tut (0,55 sn halka dolar), bırak | **Güçlü vuruş** |
| Takla sırasında ya da hemen sonra tık | **Takla vuruşu** |
| Tık → takla (0,9 sn içinde) → tık | **Bitirici** |
| Vuruşun hareketi bittiği an tık (0,26 sn pencere) | **Ritimli 2. vuruş**; onun bitişinde yine tık: **Ritimli 3. vuruş** |

Her silahın kendi hamleleri vardır (parantezde hasar çarpanı ve enerji):

| Silah | Çift vuruş | Güçlü vuruş | Takla vuruşu | Bitirici | Ritim 2. | Ritim 3. |
|---|---|---|---|---|---|---|
| Kılıç | Çift kesik (×0,85+×0,95; 10) | Dönen kesik, 360° (×2,2; 18) | Hamle (×1,6; 12) | Kılıç fırtınası (3×0,9 + ×2,1, sersem; 22) | Ters kesik (×1,5; 6) | Ağır kesik (×2,6, sersem; 10) |
| Mızrak | Çifte dürtme (×0,9+×1,15; 10) | Mızrak fırlatma, delip geçer (×2,4; 18) | Koşarak saplama (×1,8; 12) | Sırıkla sıçrama, çevre (×2,2, sersem; 22) | Derin dürtme (×1,5; 6) | Delip geçme (×2,6, sersem; 10) |
| Balta/kazma | Geri savuruş (×1,25; 10) | Yere vurma, çevre (×2,6, sersem; 18) | Dönerek biçme (×1,5; 12) | Ezici darbe (×3,2, sersem; 22) | Yan savuruş (×1,6; 7) | Kafa kıran (×3, sersem; 11) |
| Yumruk | Çifte yumruk (8) | Güçlü yumruk (×3, sersem; 16) | Omuz atma (×1,3; 10) | Tekme kombosu (4×0,75 + ×1,7; 20) | Kroşe (×1,5; 5) | Aparkat (×2,6, sersem; 9) |
| Meşale | Alev savuruşu (×1,5; 10) | Ateş çemberi (×2,4; 18) | Ateşli hamle (×1,8; 12) | Alev patlaması (×3; 22) | Kor savuruşu (×1,6; 7) | Alev kesiği (×2,4; 11) |
| Asa (mana) | Üçlü atış (×2 mana) | Büyük büyü ×3 (×3) | Kaçarken atış (×1,5) | Büyü halkası, 8 yön (×4) | İkiz atış (×1,4) | Güç topu ×2,8 (×2,2) |
| Ateşli (mermi) | Çift atış (2) | Nişanlı atış ×3 (1) | Kayarak atış, 3 yayılım (3) | Şarjör boşaltma, 5 atış (5) | Seri atış (2) | Delici mermi ×3,2 (1) |

- **Kilit:** ACT 1'de her özel vuruş ve ulti **Börü'den dersi alınana kadar kapalıdır** (kapalı hamle normal vuruş olur). ACT 2'ye geçince ve arenada hepsi açılır.

## Ulti

- Altın ulti çubuğu: her isabet +1,5, özel vuruş +4, ritimli 2. +5, ritimli 3. +10, başarılı savuşturma +10. Dolunca **R** (telefonda Ulti). Ulti boyunca hasar almazsın.
- ACT 1'de ulti dersi Kara ejder ya da Kristal golem Reisi yenilince açılır; ACT 2'de kendiliğinden öğrenilir.

| Silah | Ulti | Etki |
|---|---|---|
| Kılıç | Kılıç dansı | 8 yönlü dönüş (her biri ×1,2) + ×3 patlama, sersem 1 sn |
| Mızrak | Mızrak yağmuru | Fare yönündeki alana 12 mızrak, her biri ×1,5 |
| Balta | Deprem | Büyüyen 3 halka, ×2,4, sersem 1 sn |
| Yumruk | Öfke | 10 yumruk + son ×4 |
| Meşale | Ateş fırtınası | 3 ateş halkası ×2 |
| Asa | Meteor | Fare yönüne ×5, sersem 1,2 sn |
| Ateşli | Kurşun yağmuru | 20 atış (pompalıda 10), mermi harcamaz |

## Börü'nün dövüş dersleri

Savaşçı Börü ile konuşup "Dövüş dersleri" (yalnızca ACT 1'de, öğretici bittikten sonra). Ücret peşin; ders bitince hamle kalıcı açılır ve XP verilir. Ders için o bölgeyi gezmiş olman gerekir (haritada en az 60 karesi açılmış olmalı).

- Börü bir **alıştırma canavarı** salar: ısırığı zayıftır (canının %5'i), XP ve ganimet vermez, av ve Reis sayaçlarına sayılmaz, Börü'den 230 pikselden uzağa gitmez. Ölürse ya da kaybolursa Börü'nün yanındaysan 1,5 sn sonra yenisi gelir; sayı sınırı yoktur (v1.79; önceden ders başına 16'da kesiliyor, ders bitirilemez kalıyordu). "Tek vuruşta öldür" hilesi alıştırma canavarına işlemez (v1.79).
- **Ders sürerken Reis gelmez** (v1.79): ders sırasında vahşi hayvan avlayıp bir Reisin sayısını doldurursan Reis ders bitince (ya da bırakılınca) gelir.
- Alandan çıkınca sorulan "Derse dön" seni Börü'nün yakınına (yaklaşık 140 piksel) geri koyar (v1.79; önceden 230 pikselde, sınırın dibinde bırakıyordu). Vuruş adımlarında saldırmaz ve canı gitmez; "bitir" adımında canı kolayca bitecek kadar azalır; savuşturma ve kaçma adımlarında 2,2–3,2 saniyede bir saldırır.
- Soldaki ders kutusu yalnızca şimdiki adımı gösterir ("adım 1/2"). Börü'de "Dersi yeniden anlat" ve "Dersi baştan başlat" var. Öğrenilmiş dersler ücretsiz tekrar çalışılır (XP vermez).

| Ders | Seviye | Bölge şartı | Ücret | XP | Alıştırma canavarı | Adımlar |
|---|---|---|---|---|---|---|
| Takla vuruşu | 3 | Çayır (Atılma gerekli) | 150 | 40 | Kurt | Saldırırken takla at, 3 kez kurtul → takla vuruşuyla 4 isabet |
| Çift vuruş | 6 | Orman | 300 | 60 | Yaban domuzu | Çift vuruşla 5 isabet → çift vuruşla 2 canavar bitir |
| Ritimli 2. vuruş | 10 | Bataklık | 600 | 100 | Bataklık kurdu | Ritimli 2. vuruşla 5 isabet |
| Ritimli 3. vuruş | 15 | Kayalık Dağ | 1.000 | 160 | Muflon | Sırayla: 3 savuşturma → ritimli 3. vuruşla 3 isabet |
| Güçlü vuruş | 17 | Kayalık Dağ | 1.200 | 180 | Yaban öküzü | Savuşturarak 3 canavarı sersemlet → sersem canavara 3 güçlü vuruş |
| Bitirici | 21 | Kül Diyarı (Atılma gerekli) | 2.000 | 300 | Kül kurdu | Takla ile 3 kaçış → bitiriciyle 3 isabet |
| Ulti | – | Kara ejder ya da Kristal golem Reisi yenilmiş | 2.500 | 500 | Mağara ayısı | Çubuk dolunca R: ulti ile 3 isabet (derste çubuk 3 kat hızlı dolar) |

## Canavarlar nasıl savaşır

- **Mizaç:** *zararsız* kaçar; *nötr* vurulunca karşılık verir, 220 piksel uzaklaşınca sakinleşir; *saldırgan* fark etme menziline girince saldırır, menzilin iki katı uzaklaşınca bırakır. Güvenli bölgede saldırgan canavar saldırmaz. Aynı anda en çok 4 canavar kovalar.
- **Sürüler:** sürü hayvanının birine vurunca ya da saldırgan sürüye yaklaşınca hepsi gelir; sırayla saldırırlar (6. seviyeden önce aynı anda 1, sonra 2).
- **Saldırı:** v2.15'ten beri ayrı bir hazırlık beklemesi yok: kırmızı **"!"** belirdiği an (0,1 sn içinde) canavar sana doğru **atılır** (0,3 sn) → ısırık. (v2.14'e kadar: 0,42 sn hazırlık, hedef çizgisi, dolan halka, sonra 0,2 sn atılış.) Menzilliler 0,6 sn hazırlanıp atar. Bir canavar son saldırısından 1 sn geçmeden yenisine başlayamaz (Reisler hariç).
- **Atılış hep sana doğru, kaçarsan işlemez (v2.15):** canavar ! ile birlikte o an **bulunduğun yere** atılır; atılış başladıktan sonra **yolu değişmez**, düz gider. ! görünür görünmez takla atarsan (ya da yolundan çekilirsen) kaçarsın, ısırık işlemez; sana değerse ısırık işler. Çok erken atılan takla biter ve işe yaramaz. Üstüne atlayan **bütün canlılar** böyledir; Börü'nün alıştırma kereviti de (orada atılış 0,45 sn, daha yavaş). **Savuşturma** (sağ tık / E basılı, telefonda Savuş) da kaçırır: ısırık değmeden en çok 0,2 sn önce basılırsa beyaz ve sarı ! savuşturulur (kırmızı ! yalnızca taklayla kaçılır). !'in rengi atılışla birlikte görünür; sarı ve kırmızı vuruşlara eklenen ayrı bekleme (0,18 / 0,3 sn) kalktı.
- **Saldırırken yüzü hep sana dönük (v2.18):** bir canavar saldırıya geçtiği andan bitene kadar (kırmızı/sarı işaret, menzillinin 0,6 sn hazırlığı, Reis hamlelerinin hazırlığı, kükreme, alev, kavrama, üçlü vuruş, hamleden sonraki yorgunluk) yüzünü hep karakterine çevirir; sen etrafında dönsen de sırtını dönmez. Geri geri kaçan menzilliler de sana bakarak çekilir. Yalnızca gövdesiyle hızla yol aldığı anlarda (atılış, sıçramada havadayken, hücumda koşarken) gittiği yöne bakar. Tam üstünde ya da altındayken (yatayda 3 pikselden yakın) yönünü değiştirmez, titremesin diye.
- **Doğma:** canlılar oyuncunun 330–470 piksel çevresinde doğar, 760 pikselden uzaklaşınca silinir. Gece canlıları gündüz uzaktaysa silinir.

**Özel hamleler** (kovalarken arada bir):

| Hamle | Renk | Ne yapar, nasıl kaçılır |
|---|---|---|
| Sıçrama | sarı (iri türde kırmızı) | v2.15: işaret çıktığı an (0,12 sn) **o an bulunduğun yere** atlar; havadayken (0,42 sn) yolu değişmez. İniş çevresine hasar ve itme. Yana çekil ya da inerken taklada ol. |
| Hücum | sarı/kırmızı | Bir şerit boyunca koşar; çarparsa uzağa iter. Şeritten çık. Engelde durur, yorulur. |
| Sersemleten kükreme | kırmızı | Büyüyen halka; içindeysen yarım hasar ve 1,1 sn sersem. Halkadan çık ya da takla. |
| Alev püskürtme | kırmızı | Önüne koni şeklinde alev; içindeysen yanarsın. |
| Buz parçaları | beyaz | 3 parça; değerse 1,3 sn donarsın. |
| Ağ | beyaz | Değerse 3 sn yavaşlarsın. |
| Şok | beyaz | Değerse 0,8 sn sersem. |
| Zehir gölü | beyaz | Yere 5 sn kalan zehir gölcüğü atar. |
| Yakalayıp fırlatma | kırmızı (pembe el işareti) | Dibindeysen tutup fırlatır. Savuşturulamaz; takla ile kaç. |
| Üçlü saldırı | başında 3 nokta | Üç vuruş, her biri kendi renginde; hepsini savuşturursan canavar sersemler. |

- **Kim ne yapar:** kurtlar, Gök tazısı, Vaşak, Goblin, Ateş akrebi, Kartal: sıçrama · Zehirli kurbağa: sıçrama + zehir gölü · Yaban domuzu, Geyik, Muflon, Dağ keçisi, Yaban atı: hücum · Yaban öküzü, Timsah, Hurda devi: hücum + kükreme · Kristal geyik: hücum + buz · Devriye robotu: hücum + şok · Mağara ayısı: kükreme + sıçrama · Kristal golem, Büyük golem: kükreme + buz · Lav golemi: kükreme + alev · Gölge muhafız: sıçrama + kükreme · Gök bekçisi: kükreme + şok + buz · Kara ejder: alev + kükreme · Kızıl ejder: alev + sıçrama + kükreme · Yavru ejder: alev + sıçrama · Lav kertenkelesi, Kül cini, Kor yarasası: alev · Kristal golemcik, Kristal yarasası: buz · Kristal örümcek: ağ + sıçrama · Engerek, Goblin şamanı: zehir gölü · Işık engereği: zehir gölü + ağ · Lazer ve Uzaylı dronu: şok · Fırtına kartalı: şok + sıçrama.
- **Yakalama** yapanlar: Mağara ayısı, golemler, Lav golemi, Hurda devi, Gölge muhafız, Timsah, Yaban öküzü, Kızıl ejder, Gök bekçisi, Kristal golemcik, Devriye robotu. **Üçlü saldırı:** kurtlar, Gök tazısı, Vaşak, Goblin, Yaban domuzu, Mağara ayısı, Gölge muhafız, Devriye robotu, Kristal golemcik, Yavru ejder, Timsah, Ateş akrebi ve bütün Reisler.
- Daha doğudaki (ve ACT 2'deki) canavarlar hamleleri daha sık yapar, mermilerden yana sıçrayabilir, ara sıra mavi parıltıyla kısa süre **bağışık** olur ("Etkisiz").

# Arena, hileler, kayıt

## Arena

Ana menüde **⚔ Arena**; iyi ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır. Seviye (1/10/25/50), giyim ve silah seçilir; iki adanın bütün canlıları ve Reisleri ile dövüşülür. Varsayılan olarak kimsenin canı gitmez (hasar ölçülür), enerji/mana/mermi sınırsızdır; "Gerçek dövüş" anahtarıyla gerçek olur. Arenada hiçbir şey kaydedilmez ve başarım işlemez.

## Hileler

- **Açmak:** ana menüde klavyeyle `cheat` yaz (tekrar yazınca kapanır) ya da telefonda Ayarlar başlığına art arda 3 kez dokun. Sayfa her açıldığında bütün hile anahtarları kapalı başlar.
- **Tanrı modu:** can, tokluk, enerji, mana hep dolu; canavarla ve açlıkla bayılmazsın, ama **mor ışık seni yine bayıltır** (bilinçli). **Hile paneli:** +100 sikke, +100 XP, +2 saat, günü bitir, zamanı sar, eşya arama (miktar 1/10/50/100). **Tek vuruşta öldür**, **Sınırsız dayanıklılık**, **Sınırsız sikke**, **Gece ışığı**, **Hile kısayolları** (Z +100 sikke, X +100 XP), **ACT 2'ye geç**, **Bütün ara sahneler açık**, **Seviyeyi en üste çıkar**, **Haritayı tamamen aç**.

## Kayıt

- Otomatik kayıt + 3 elle kayıt yuvası (tarayıcıda).
- **Üzerine yazma (v2.15):** kaydetme menüsünde dolu bir yuvaya basınca bir soru çıkar: "Bu yuvada bir kayıt var (Seviye…, tarih). Yeni kaydı üzerine yazayım mı?" → **Üzerine yaz** / **Vazgeç**. (Önceden "bir kez daha bas" uyarısıydı.)
- **Kaydı sil (v2.15):** kaydetme ve yükleme menülerinde her dolu yuvanın yanında **Sil** düğmesi (yükleme menüsünde otomatik kayıt da silinebilir). Basınca sorar: "Kayıt 2 silinecek. Emin misiniz? Bu geri alınamaz." → **Eminim, sil** / **Vazgeç**. Silinince yuva boşalır.
- Otomatik kayıt dakikada bir, görev durumu değişince, sekme gizlenince, sayfa kapanırken ve menüye dönerken alınır; ara sahne, uyanış, deniz yolculuğu ve can 0 iken alınmaz.
- **Aynı oyun iki sekmede (v2.10):** başka bir sekmede oyun açılınca (Devam et, Yükle, Yeni oyun ya da adalar arası geçiş) bu sekme "eski" sayılır ve artık **otomatik kayıt almaz** (yoksa arka plandaki eski sekme dakikada bir eski halini yazıp yeni sekmedeki ilerlemenin üstüne geçiyordu; "Devam et" eski kaydı açıyordu). Eski sekmeye dönünce bir kez uyarı çıkar: "Bu oyun başka bir sekmede ilerledi…". O sekmede bir kayıt yüklenir ya da yeni oyun başlatılırsa sekme yeniden kaydeder; elle kayıt her zaman alınır. "Devam et" her zaman en yeni kaydı (otomatik ya da elle) açar.
- **Dışa aktar:** bütün kayıtlar tek bir kod (`HAMMADDE1:` ile başlar) ya da dosya. **İçe aktar:** kodu yapıştır ya da dosyayı seç. Kayıtlar her adreste ayrıdır (claude.ai sürümü ile GitHub sürümü arasında bu yolla taşınır).
- Başarımlar, toplama/av listeleri ve tuş atamaları cihaza ayrı kaydedilir.
- Adresin sonuna `?debug` eklenince geliştirici araçları açılır (`window.__ham`).


# ACT 1 · Yıldızsız Ada

## Adanın yerleşimi

- **Yerleşim (v1.85):** ada üç sütun ve iki sıradan oluşur; altı biyom eşit büyüklükte ve **yılan gibi sırayla** gezilir: **Çayır** (güneybatı, başladığın yer) → **Orman** (kuzeybatı) → *köprü* → **Bataklık** (kuzey orta) → **Kayalık Dağ** (güney orta) → *kaya yığını* → **Kül Diyarı** (güneydoğu) → **Mor Kristal Vadisi** (kuzeydoğu). Aynı sütundaki iki biyom arasında engel yoktur.
- **Büyük nehir** batı sütununu (yurt: Çayır ve Orman) ortadan ayırır; iki ucu da denize dökülür, etrafından dolaşılmaz. Nehrin üstünde **üç kırık köprü** vardır, her biri **ayrı ayrı** 20 odunla onarılır:
  - **Kuzey köprüsü** (Orman ↔ Bataklık, adanın yaklaşık %27 yüksekliğinde): yolu açan köprüdür. Ekin'in 2. görevi ("Bir köprüyü onar") bununla biter. Toygar'ın kulübesi bu köprünün doğu ucunun yakınındadır.
  - **İki kısayol köprüsü** (Çayır ↔ Kayalık Dağ, %62 ve %86 yüksekliğinde): kuzey köprüsü onarılmadan onarılamaz ("Önce Orman ile Bataklık arasındaki büyük köprüyü onar"). Sonra istediğin zaman, istersen birini istersen ikisini onarırsın; onarılan kısayol Çayır'dan Kayalık Dağ'a doğrudan geçirir. Kuzey köprüsü onarıldıktan sonra kısayollar iki yakadan da onarılabilir.
- **Sıradağ** orta sütunu doğudakinden ayırır, kıyıdan kıyıya uzanır. Tek geçidi Kayalık Dağ ile Kül Diyarı arasındadır (adanın yaklaşık %74 yüksekliğinde) ve bir **kaya yığını** kapatır. 2 Kaya patlatıcı ve kuvars ya da daha iyi bir kazmayla patlatılır. **Patlama bütün sıradağı çökertir:** o andan sonra sınır kalkar, sıradağın her yeri yürünebilir moloz olur; Bataklık'tan Mor Kristal Vadisi'ne de doğrudan geçilir. (Kayıtta yalnızca "patlatıldı" bilgisi tutulur; yüklenince sıradağ yeniden çöker.)
- **1.84 ve öncesinin kayıtları:** her şey (envanter, görevler, köprü, patlama) korunur ama harita değiştiği için kumsalda uyanırsın ve harita yeniden keşfedilir; bir kez bildirim çıkar.
- **Haritadaki miktarlar (v2.11'de seyreltildi, harita kalabalık geliyordu):** yeni oyunda ada kurulurken her tür sabit sayıda rastgele yere konur; yerler her oyunda farklı, sayılar aynıdır.
  - **Temel malzemeler** bütün adaya serpilir (yaklaşık): Dal 800, Lif 700, Taş 550, Yaprak 450, Nehir çakılı 400, Kum 350, Çakmaktaşı 300 (v2.10'a kadar 1650 / 1410 / 990 / 840 / 720 / 600 / 450). Daha az oldukları için **%30 daha çabuk** yeniden çıkarlar (ör. Dal 25 → 18 sn).
  - **Biyom bitkileri** her biyomun kendi 14 türü: tür başına kendi biyomunda yaklaşık **40** (önce 68); Kuru ot ~90 (150), Böğürtlen ~80 (110), yalnızca su kenarında biten türler ~30 (42).
  - **Madenler** (biyom başına 3 tür, ilk iki biyomda 22, diğerlerinde 20) ve **mağara buluntuları** (Sarkıt, Yarasa gübresi, Mağara mantarı: madenlerin çevresinde 44'er) değişmedi.
  - **Ağaçlar** sayıyla değil olasılıkla çıkar: orman zemininde her karede %20, çimende %4 (Kül Diyarı'nda bunların %45'i); sonra **%35'i** seyreltilir (v2.10'a kadar %18). Tür biyomun 5 ağacından seçilir; meyve ağaçlarının payı 0,45, diğerlerinin 1.
  - **Başlangıç kampının çevresi (20 karo)** seyreltilmez; öğretici burada geçer.
  - Hayvanlar haritaya konmaz; bulunduğun biyomun listesine göre çevrende belirir.
- Büyük nehirde suya düşersen yarım saniyede bir en yakın kıyıya, köprün yoksa her zaman batı (yurt) kıyısına çıkarılırsın.
- Haritada (M) kişilerin simgeleri görünür; bir simgeye dokununca oraya giden kalıcı bir yol oku konur. Küçük haritanın sol altında bulunduğun biyomun adı yazar.

## Biyomları okuma rehberi

Aşağıdaki her biyom başlığında dört tablo var:

- **Ağaçlar:** balta ile kesilir (E). "Gereken balta" kademesinin altındaki balta o ağacı kesemez. Meyve ağaçları eli boşken E ile **silkelenir** (2–3 meyve); baltayla kesilirlerse de odun, 1–2 meyve ve %35 ihtimalle tohum verirler. Bazı ağaçlar kesilince yan ürün de düşürür: Çam → 1 Çam kozalağı, Meşe → 1 Meşe palamudu, Akçaağaç → 1 Akçaağaç özsuyu, Ihlamur → 2 Ihlamur çiçeği, Söğüt → 2 Söğüt dalı.
- **Toplanabilirler:** yerde durur, elde alet gerekmez. Toplanınca belirtilen süre sonra aynı yerde yeniden çıkar. "Adadaki sayısı" haritanın o bölgesindeki toplam yerdir (yeni oyunda ölçüldü; v2.11 seyreltmesinden sonra yeniden sayıldı).
- **Madenler:** kazma elde E. Gereken kazma kademesi tabloda. Maden 300 sn sonra yeniden dolar.
- **Canlılar:** *zararsız* kaçar; *nötr* vurulunca karşılık verir, uzaklaşınca sakinleşir; *saldırgan* görünce saldırır. **Can** ve **Hasar** oyundaki gerçek değerlerdir (savunma ve zorluk hesaba katılmadan). Hız piksel/saniye cinsindendir. Düşürdükleri yüzde ihtimalle verilir.

Her yerde ortak olan temel toplanabilirler (Dal, Taş, Lif, Yaprak) ve su kıyısındaki Nehir çakılı, Kum, Çakmaktaşı en çok yurtta bulunur. **Su** bir kapla (Yaprak kova vb.) suyun başında E ile alınır; **Nehir kili** kürekle kıyıdan kazılır.

## Çayır — Güvenli

Başladığın yer: adanın güneybatısı (batı sütununun güney yarısı). Tavşanlar, keklikler, meyve ağaçları. Ekin, Zümrüt, Nazlı, Börü, Dursun, Durmuş ve Rıza burada. Canavarlar zayıf; kurt sürüleri yalnız gece çıkar.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Çam | Çam odunu | 3 | – | 1. kademe (Taş balta) |
| Kavak | Kavak odunu | 3 | – | 1. kademe (Taş balta) |
| Armut | Armut odunu | – | Yabani armut | 1. kademe (Taş balta) |
| Elma | Elma odunu | – | Yabani elma | 1. kademe (Taş balta) |
| Erik | Erik odunu | – | Yabani erik | 1. kademe (Taş balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Böğürtlen | 2 | 86 | 40 sn sonra yeniden çıkar, çiğ yenir (+6 tokluk) |
| Çakmaktaşı | 2 | 68 | 31 sn sonra yeniden çıkar |
| Çayır mantarı | 2 | 39 | 50 sn sonra yeniden çıkar |
| Dal | 1 | 125 | 18 sn sonra yeniden çıkar |
| Ebegümeci | 1 | 43 | 40 sn sonra yeniden çıkar |
| Gelincik | 2 | 41 | 40 sn sonra yeniden çıkar |
| Hardal otu | 2 | 44 | 45 sn sonra yeniden çıkar |
| Kum | 1 | 67 | 14 sn sonra yeniden çıkar |
| Kuru ot | 1 | 87 | 25 sn sonra yeniden çıkar |
| Lif | 1 | 95 | 14 sn sonra yeniden çıkar |
| Mağara mantarı | 4 | 10 | 80 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk), zehirli! |
| Nane | 2 | 47 | 40 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 90 | 18 sn sonra yeniden çıkar |
| Papatya | 1 | 44 | 35 sn sonra yeniden çıkar |
| Rezene | 2 | 38 | 45 sn sonra yeniden çıkar |
| Sarkıt | 6 | 5 | 120 sn sonra yeniden çıkar |
| Taş | 1 | 85 | 21 sn sonra yeniden çıkar |
| Yabani arpa | 2 | 35 | 45 sn sonra yeniden çıkar |
| Yabani buğday | 2 | 37 | 40 sn sonra yeniden çıkar |
| Yabani havuç | 2 | 39 | 45 sn sonra yeniden çıkar, çiğ yenir (+5 tokluk) |
| Yabani yulaf | 2 | 44 | 45 sn sonra yeniden çıkar |
| Yaban çileği | 2 | 43 | 45 sn sonra yeniden çıkar, çiğ yenir (+6 tokluk) |
| Yaprak | 1 | 23 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 5 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Bakır cevheri | 6 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |
| Kalay cevheri | 7 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |
| Kireçtaşı | 3 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Tavşan | zararsız | 10 | – | 54 | 4 | – | Tavşan eti %100; Tavşan derisi %70; Kemik %30; Sinir %15 |
| Keklik | zararsız | 6 | – | 50 | 3 | – | Keklik eti %100; Keklik tüyü %85 ×1–3; Keklik yumurtası %30 |
| Bıldırcın | zararsız | 5 | – | 52 | 3 | – | Bıldırcın eti %100; Bıldırcın tüyü %80 ×1–2; Bıldırcın yumurtası %40 ×1–2 |
| Geyik | nötr | 55 | 10 | 62 | 11 | sürü 2–5 | Geyik eti %100 ×1–2; Geyik derisi %80; Geyik boynuzu %40; Sinir %50 ×1–2; Kemik %50 ×1–2; Hayvan yağı %30 |
| Yaban atı | nötr | 80 | 11 | 72 | 16 | sürü 2–4 | Yaban atı eti %100 ×1–2; Yaban atı derisi %80; Kemik %50 ×1–2; Sinir %50 ×1–2 |
| Kerevit | nötr | 40 | 7 | 14 | 11 | – | Kerevit %100 ×1–2 |
| Kurt | saldırgan | 70 | 12 | 66 | 23 | gece, sürü 2–5 | Kurt eti %100; Kurt derisi %75; Kurt dişi %50; Kemik %50 ×1–2; Sinir %40 |
| Porsuk | nötr | 50 | 9 | 40 | 21 | – | Kunduz eti %100; Kunduz derisi %75; Kemik %30 |

## Orman — Güvenli

Adanın kuzeybatısı, batı sütununun kuzey yarısı (Çayır'dan kuzeye yürü). Gölgeli ve sık; yaban domuzları, dikenli kirpiler, engerekler. Usta Kemal ve Çiftçi Hasan'ın tarlası bu tarafta. **Kuzenler (v1.84):** Cadı Yakut (kırmızı kazan), Silahçı Durdu ve Zırhçı Duran. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kayın | Kayın odunu | 3 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Ladin | Ladin odunu | 3 | – | 1. kademe (Taş balta) |
| Meşe | Meşe odunu | 4 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Ihlamur | Ihlamur odunu | 3 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Ceviz | Ceviz odunu | 5 | Ceviz | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ahududu | 2 | 26 | 45 sn sonra yeniden çıkar, çiğ yenir (+6 tokluk) |
| Çakmaktaşı | 2 | 55 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 249 | 18 sn sonra yeniden çıkar |
| Eğrelti | 1 | 42 | 40 sn sonra yeniden çıkar |
| Isırgan | 1 | 45 | 35 sn sonra yeniden çıkar |
| Kanlıca | 3 | 41 | 55 sn sonra yeniden çıkar |
| Kum | 1 | 71 | 14 sn sonra yeniden çıkar |
| Kuzugöbeği | 6 | 45 | 70 sn sonra yeniden çıkar, çiğ yenir (+4 tokluk), zehirli! |
| Kuzukulağı | 1 | 39 | 40 sn sonra yeniden çıkar, çiğ yenir (+2 tokluk), zehirli! |
| Lif | 1 | 104 | 14 sn sonra yeniden çıkar |
| Mağara mantarı | 4 | 11 | 80 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk), zehirli! |
| Nehir çakılı | 1 | 65 | 18 sn sonra yeniden çıkar |
| Sarmaşık | 1 | 36 | 45 sn sonra yeniden çıkar |
| Taş | 1 | 74 | 21 sn sonra yeniden çıkar |
| Tatlısu midyesi | 2 | 31 | 50 sn sonra yeniden çıkar |
| Tavuk mantarı | 3 | 41 | 70 sn sonra yeniden çıkar, çiğ yenir (+4 tokluk) |
| Yabani bal | 8 | 46 | 90 sn sonra yeniden çıkar, çiğ yenir (+12 tokluk) |
| Yabani mercimek | 2 | 44 | 45 sn sonra yeniden çıkar, çiğ yenir (+2 tokluk) |
| Yabani nohut | 2 | 38 | 45 sn sonra yeniden çıkar, çiğ yenir (+2 tokluk) |
| Yaban mersini | 3 | 45 | 50 sn sonra yeniden çıkar, çiğ yenir (+6 tokluk) |
| Yaban sarımsağı | 2 | 37 | 45 sn sonra yeniden çıkar |
| Yaprak | 1 | 47 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 7 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Granit | 3 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |
| Kumtaşı | 3 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |
| Taş kömürü | 4 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Sincap | zararsız | 6 | – | 58 | 3 | – | Sincap eti %100; Sincap derisi %60; Ceviz %35 ×1–2; Fındık %35 ×1–2 |
| Karaca | nötr | 70 | 14 | 66 | 12 | sürü 2–4 | Karaca eti %100 ×1–2; Karaca derisi %80; Kemik %50; Sinir %40 |
| Kunduz | nötr | 55 | 12 | 40 | 10 | – | Kunduz eti %100; Kunduz derisi %75; Kemik %30 |
| Yaban domuzu | saldırgan | 130 | 21 | 50 | 24 | sürü 2–5 | Yaban domuzu eti %100 ×1–2; Yaban domuzu derisi %70; Yaban domuzu dişi %45; Kemik %50 ×1–2; Hayvan yağı %40 |
| Dikenli kirpi | nötr | 60 | 12 | 30 | 16 | uzaktan atar (120 menzil, 3 atış), kanama etkisi | Kirpi dikeni %100 ×2–4; Kemik %30 |
| Engerek | saldırgan | 75 | 14 | 40 | 20 | uzaktan atar (115 menzil, 1 atış), zehir etkisi | Zehir bezesi %60; Kemik %30 |
| Oklu kirpi | saldırgan | 205 | 19 | 28 | 48 | uzaktan atar (150 menzil, 3 atış), kanama etkisi | İri diken %100 ×2–3; Kirpi dikeni %80 ×2–4; Kemik %40 |

## Bataklık — Tehlikeli

Adanın kuzey ortası, büyük nehrin doğusu: Orman'dan kuzey köprüsünü onarıp karşıya geç. Çamur ayağını tutar (Kamış çizme işe yarar), timsahlar ve zehirli kurbağalar. Demir cevheri yalnızca burada. Avcı Toygar'ın kulübesi burada. **Kuzenler (v1.84):** Cadı Safir (mavi kazan), Silahçı Ali ve Zırhçı Veli. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Dişbudak | Dişbudak odunu | 3 | – | 3. kademe (Kuvars/Tunç balta) |
| Bataklık servisi | Bataklık servisi odunu | 8 | – | 3. kademe (Kuvars/Tunç balta) |
| Kızılağaç | Kızılağaç odunu | 3 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Söğüt | Söğüt odunu | 3 | – | 3. kademe (Kuvars/Tunç balta) |
| Mürver | Mürver odunu | – | Mürver | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Bataklık otu | 4 | 43 | 45 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 51 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 144 | 18 sn sonra yeniden çıkar |
| Göl kili | 3 | 31 | 60 sn sonra yeniden çıkar |
| Hasırotu | 1 | 36 | 35 sn sonra yeniden çıkar |
| Kamış | 1 | 42 | 30 sn sonra yeniden çıkar |
| Kenevir | 3 | 37 | 45 sn sonra yeniden çıkar |
| Keten | 3 | 42 | 45 sn sonra yeniden çıkar |
| Kızılcık | 2 | 46 | 50 sn sonra yeniden çıkar, çiğ yenir (+5 tokluk) |
| Kum | 1 | 47 | 14 sn sonra yeniden çıkar |
| Lif | 1 | 116 | 14 sn sonra yeniden çıkar |
| Mağara mantarı | 4 | 7 | 80 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk), zehirli! |
| Nehir çakılı | 1 | 66 | 18 sn sonra yeniden çıkar |
| Nilüfer | 3 | 30 | 50 sn sonra yeniden çıkar |
| Sarkıt | 6 | 4 | 120 sn sonra yeniden çıkar |
| Saz | 1 | 45 | 30 sn sonra yeniden çıkar |
| Sinek mantarı | 4 | 41 | 60 sn sonra yeniden çıkar, çiğ yenir (+4 tokluk), zehirli! |
| Su kestanesi | 3 | 31 | 55 sn sonra yeniden çıkar, çiğ yenir (+4 tokluk) |
| Su teresi | 2 | 33 | 40 sn sonra yeniden çıkar |
| Taş | 1 | 98 | 21 sn sonra yeniden çıkar |
| Turba | 3 | 45 | 45 sn sonra yeniden çıkar |
| Yaprak | 1 | 18 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 7 | 90 sn sonra yeniden çıkar |
| Yosun | 1 | 39 | 30 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Arduvaz | 3 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |
| Demir cevheri | 25 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |
| Tuz kayası | 4 | 1. kademe (Taş kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Ördek | zararsız | 8 | – | 44 | 3 | – | Ördek eti %100; Ördek tüyü %85 ×1–3; Ördek yumurtası %35 |
| Yaban kazı | nötr | 150 | 20 | 46 | 16 | – | Yaban kazı eti %100; Yaban kazı tüyü %85 ×1–3; Yaban kazı yumurtası %35 |
| Turna kuşu | nötr | 200 | 20 | 50 | 21 | – | Turna kuşu eti %100; Turna kuşu tüyü %85 ×1–3; Turna kuşu yumurtası %30 |
| Su samuru | nötr | 240 | 23 | 56 | 23 | – | Su samuru eti %100; Su samuru derisi %75 |
| Zehirli kurbağa | saldırgan | 350 | 36 | 40 | 59 | uzaktan atar (140 menzil, 3 atış), zehir etkisi | Zehir bezesi %80; Kurbağa %60 |
| Bataklık kurdu | saldırgan | 600 | 57 | 100 | 77 | kanama etkisi, sürü 2–4 | Bataklık kurdu postu %80; Kurt dişi %50; Kemik %50 ×1–2 |
| Timsah | saldırgan | 1.080 | 78 | 36 | 129 | kanama etkisi | Timsah derisi %90; Timsah dişi %60 ×1–2; Timsah eti %100 ×1–2 |

## Kayalık Dağ — Tehlikeli

Adanın güney ortası, Bataklık'ın güneyi (kısayol köprüleri onarılınca Çayır'dan da geçilir). Kartallar, vaşaklar, mağara ayıları. Kuvars, gümüş ve altın madenleri. **Kuzenler (v1.84):** Cadı Firuze (turkuaz kazan), Silahçı Kaya ve Zırhçı Kayhan. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Akçaağaç | Akçaağaç odunu | 3 | – | 3. kademe (Kuvars/Tunç balta) |
| Huş | Huş odunu | 3 | – | 3. kademe (Kuvars/Tunç balta) |
| Porsuk | Porsuk odunu | 6 | – | 4. kademe (Bazalt/Demir balta) |
| Kestane | Kestane odunu | 3 | Kestane | 3. kademe (Kuvars/Tunç balta) |
| Ardıç | Ardıç odunu | 4 | Ardıç meyvesi | 4. kademe (Bazalt/Demir balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Adaçayı | 2 | 36 | 45 sn sonra yeniden çıkar |
| Alıç | 2 | 39 | 50 sn sonra yeniden çıkar, çiğ yenir (+5 tokluk) |
| Beyaz kil | 6 | 44 | 80 sn sonra yeniden çıkar |
| Civanperçemi | 2 | 34 | 45 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 34 | 31 sn sonra yeniden çıkar |
| Dağ çayı | 6 | 40 | 50 sn sonra yeniden çıkar |
| Dal | 1 | 142 | 18 sn sonra yeniden çıkar |
| Kardelen | 8 | 44 | 60 sn sonra yeniden çıkar |
| Kav mantarı | 2 | 40 | 60 sn sonra yeniden çıkar |
| Kayın mantarı | 3 | 40 | 60 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk) |
| Kekik | 2 | 36 | 40 sn sonra yeniden çıkar |
| Kırmızı kil | 4 | 33 | 70 sn sonra yeniden çıkar |
| Kum | 1 | 44 | 14 sn sonra yeniden çıkar |
| Kuşburnu | 2 | 43 | 50 sn sonra yeniden çıkar, çiğ yenir (+4 tokluk) |
| Lavanta | 3 | 37 | 50 sn sonra yeniden çıkar |
| Lif | 1 | 123 | 14 sn sonra yeniden çıkar |
| Liken | 5 | 39 | 45 sn sonra yeniden çıkar |
| Mağara mantarı | 4 | 4 | 80 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk), zehirli! |
| Nehir çakılı | 1 | 49 | 18 sn sonra yeniden çıkar |
| Sarkıt | 6 | 14 | 120 sn sonra yeniden çıkar |
| Sinirotu | 2 | 37 | 45 sn sonra yeniden çıkar |
| Taş | 1 | 99 | 21 sn sonra yeniden çıkar |
| Yaprak | 1 | 25 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 11 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Altın cevheri | 22 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Gümüş cevheri | 14 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Kuvars | 5 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Dağ keçisi | nötr | 365 | 42 | 62 | 33 | sürü 2–4 | Dağ keçisi eti %100 ×1–2; Dağ keçisi derisi %80; Kemik %50 |
| Muflon | nötr | 430 | 43 | 58 | 36 | sürü 2–3 | Muflon eti %100 ×1–2; Muflon derisi %80; Kemik %50; Sinir %40 |
| Yaban öküzü | nötr | 860 | 65 | 40 | 72 | sürü 2–3 | Yaban öküzü eti %100 ×2–3; Yaban öküzü derisi %100; Öküz boynuzu %50; Kemik %80 ×2–3; Sinir %60 ×1–2; Hayvan yağı %60 ×1–2 |
| Ur kekliği | zararsız | 12 | – | 52 | 6 | sürü 2–4 | Ur kekliği eti %100; Ur kekliği tüyü %85 ×1–3; Ur kekliği yumurtası %35 |
| Kartal | saldırgan | 970 | 112 | 96 | 131 | uçar, kanama etkisi | Kartal eti %100; Kartal tüyü %90 ×1–3; Kartal pençesi %50 ×1–2 |
| Vaşak | saldırgan | 1.400 | 121 | 92 | 145 | kanama etkisi | Vaşak eti %100 ×1–2; Vaşak derisi %85; Kemik %50 ×1–2 |
| Mağara ayısı | saldırgan | 2.520 | 137 | 44 | 218 | kanama etkisi | Mağara ayısı eti %100 ×2–3; Mağara ayısı derisi %90; Ayı pençesi %60 ×1–2; Hayvan yağı %60 ×1–2; Kemik %50 ×1–2 |

## Kül Diyarı — Ölümcül

Adanın güneydoğusu, sıradağın ardı: Kayalık Dağ'dan doğuya yürü, sıradağdaki **Doğu geçidi**ndeki kaya yığınını patlat (patlayınca bütün sıradağ çöker). Ateş ve kül her yerde; zırhsız gelme. Lav kertenkelesi ve Kara ejder burada. **Kuzenler (v1.84):** Cadı Mercan (mercan kazan), Silahçı Turan ve Zırhçı Tufan. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kül ağacı | Kül ağacı odunu | 14 | – | 4. kademe (Bazalt/Demir balta) |
| Kızıl sedir | Kızıl sedir odunu | 18 | – | 4. kademe (Bazalt/Demir balta) |
| Kara çam | Kara çam odunu | 14 | – | 4. kademe (Bazalt/Demir balta) |
| Dikenli akasya | Dikenli akasya odunu | 16 | – | 4. kademe (Bazalt/Demir balta) |
| Ateş narı | Ateş narı odunu | 16 | Ateş narı | 4. kademe (Bazalt/Demir balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ateş biberi | 26 | 41 | 70 sn sonra yeniden çıkar, çiğ yenir (+2 tokluk) |
| Ateş çiçeği | 8 | 40 | 70 sn sonra yeniden çıkar |
| Cüruf | 24 | 40 | 80 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 51 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 76 | 18 sn sonra yeniden çıkar |
| Duman çiçeği | 28 | 42 | 70 sn sonra yeniden çıkar |
| Kara tuz | 34 | 37 | 100 sn sonra yeniden çıkar |
| Kehribar | 15 | 36 | 120 sn sonra yeniden çıkar |
| Kırmızı okr | 5 | 42 | 60 sn sonra yeniden çıkar |
| Kızıl kum | 22 | 47 | 70 sn sonra yeniden çıkar |
| Kor otu | 30 | 36 | 70 sn sonra yeniden çıkar |
| Kum | 1 | 52 | 14 sn sonra yeniden çıkar |
| Kül | 1 | 45 | 25 sn sonra yeniden çıkar |
| Lav camı | 40 | 27 | 110 sn sonra yeniden çıkar |
| Lif | 1 | 115 | 14 sn sonra yeniden çıkar |
| Mağara mantarı | 4 | 5 | 80 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk), zehirli! |
| Nehir çakılı | 1 | 58 | 18 sn sonra yeniden çıkar |
| Sarı okr | 5 | 33 | 60 sn sonra yeniden çıkar |
| Sarkıt | 6 | 9 | 120 sn sonra yeniden çıkar |
| Sünger taşı | 26 | 35 | 90 sn sonra yeniden çıkar |
| Taş | 1 | 91 | 21 sn sonra yeniden çıkar |
| Yanık kök | 28 | 40 | 70 sn sonra yeniden çıkar |
| Yaprak | 1 | 15 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 7 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Bazalt | 4 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Kükürt | 6 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Pirit | 6 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Kül böceği | nötr | 640 | 83 | 30 | 46 | – | Kül böceği kabuğu %90 ×1–2; Kül %100 ×1–3 |
| Kül kurdu | saldırgan | 1.075 | 140 | 100 | 205 | kanama etkisi, sürü 2–4 | Kül kurdu postu %80; Kül dişi %50 |
| Lav kertenkelesi | saldırgan | 940 | 123 | 46 | 227 | uzaktan atar (175 menzil, 3 atış), yanık etkisi | Lav pulu %80 ×1–2; Ateş bezesi %50 |
| Kül cini | saldırgan | 810 | 99 | 46 | 251 | uzaktan atar (195 menzil, 3 atış), yanık etkisi | Ateş bezesi %60; Kül %100 ×2–4 |
| Kor yarasası | saldırgan | 830 | 115 | 120 | 251 | uçar, yanık etkisi | Yarasa kanadı %80 ×1–2; Ateş bezesi %50 |
| Ateş akrebi | saldırgan | 1.140 | 148 | 52 | 296 | zehir etkisi | Akrep iğnesi %70; Akrep kabuğu %80 ×1–2 |
| Kara ejder | saldırgan | 2.880 | 164 | 34 | 738 | uzaktan atar (210 menzil, 5 atış), yanık etkisi | Kara pul %100 ×1–2; Ejder kemiği %80 ×1–2 |

## Mor Kristal Vadisi — Çok ölümcül

Adanın kuzeydoğusu, Kül Diyarı'nın kuzeyi (sıradağ çöktükten sonra Bataklık'tan da geçilir). Mor ışığın en sık indiği yer; kristal golemler, gölge kurtları. Son iz ve Denizci Levent'in enkazı burada. **Kuzenler (v1.84):** Cadı İnci (inci beyazı kazan), Silahçı Kudret ve Zırhçı Kuvvet. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Gece ağacı | Gece ağacı odunu | 26 | – | 5. kademe (Obsidyen balta) |
| Mor söğüt | Mor söğüt odunu | 24 | – | 5. kademe (Obsidyen balta) |
| Işık ağacı | Işık ağacı odunu | 28 | – | 5. kademe (Obsidyen balta) |
| Yıldız eriği | Yıldız eriği odunu | 24 | Yıldız eriği | 5. kademe (Obsidyen balta) |
| Ay elması | Ay elması odunu | 24 | Ay elması | 5. kademe (Obsidyen balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ay otu | 70 | 39 | 90 sn sonra yeniden çıkar |
| Ay taşı | 90 | 40 | 140 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 47 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 75 | 18 sn sonra yeniden çıkar |
| Gece zambağı | 60 | 34 | 90 sn sonra yeniden çıkar |
| Gölge otu | 70 | 45 | 90 sn sonra yeniden çıkar |
| Işık mantarı | 55 | 37 | 80 sn sonra yeniden çıkar, çiğ yenir (+4 tokluk) |
| Işık tozu | 75 | 40 | 110 sn sonra yeniden çıkar |
| Kristal çiçeği | 80 | 41 | 110 sn sonra yeniden çıkar |
| Kristal kum | 50 | 36 | 80 sn sonra yeniden çıkar |
| Kum | 1 | 54 | 14 sn sonra yeniden çıkar |
| Lif | 1 | 131 | 14 sn sonra yeniden çıkar |
| Mağara mantarı | 4 | 7 | 80 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk), zehirli! |
| Mor kök | 55 | 42 | 80 sn sonra yeniden çıkar |
| Mor sarmaşık | 50 | 45 | 80 sn sonra yeniden çıkar |
| Mor yosun | 45 | 33 | 70 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 72 | 18 sn sonra yeniden çıkar |
| Sarkıt | 6 | 5 | 120 sn sonra yeniden çıkar |
| Taş | 1 | 113 | 21 sn sonra yeniden çıkar |
| Yankı taşı | 80 | 44 | 120 sn sonra yeniden çıkar |
| Yaprak | 1 | 11 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 6 | 90 sn sonra yeniden çıkar |
| Yıldız çiçeği | 65 | 37 | 90 sn sonra yeniden çıkar |
| Yıldız tozu | 85 | 48 | 120 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Ametist | 30 | 4. kademe (Bazalt/Demir kazma) | 20 | 300 sn sonra yeniden çıkar |
| Kristal | 12 | 5. kademe (Obsidyen kazma) | 20 | 300 sn sonra yeniden çıkar |
| Obsidyen | 10 | 4. kademe (Bazalt/Demir kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Mor güve | zararsız | 50 | – | 44 | 20 | uçar | Güve tozu %100 ×1–2 |
| Işık tilkisi | nötr | 1.000 | 114 | 84 | 100 | – | Işık tilkisi eti %100; Işık tilkisi postu %80 |
| Kristal geyik | nötr | 1.630 | 133 | 72 | 315 | sürü 1–2 | Kristal geyik eti %100 ×1–2; Kristal geyik derisi %80; Kristal boynuz %45 |
| Gölge kurdu | saldırgan | 1.475 | 181 | 118 | 433 | kanama etkisi, sürü 2–3 | Gölge postu %80; Gölge dişi %60 ×1–2 |
| Kristal örümcek | saldırgan | 1.320 | 157 | 60 | 414 | uzaktan atar (180 menzil, 3 atış), zehir etkisi | Kristal ipek %90 ×1–3; Örümcek gözü %50 |
| Işık engereği | saldırgan | 1.085 | 169 | 64 | 394 | uzaktan atar (190 menzil, 3 atış), zehir etkisi | Mor zehir %70; Işık pulu %80 ×1–2 |
| Kristal golem | saldırgan | 4.500 | 242 | 30 | 1.039 | – | Golem çekirdeği %60; Kristal %100 ×2–4; Ametist %80 ×1–3 |



# ACT 1 · Görevler (görev sistemi v2)

> **v1.86'dan beri oyunda** (Boğaç onayı, 28 Ekim 2026). Eski ACT 1 görevlerinin hepsi kaldırıldı (Ekin'in eski 14 görevi, yan görevler, kuzenlerin 45 görevi); aşağıdaki "ACT 1 · Kişiler ve görevler" bölümü yalnızca kişilerin tanıtımları ve hikâyeleri için **referans** olarak duruyor. Eski bir kayıt açılınca envanter, yapılar ve dünya (onarılmış köprü, çökmüş sıradağ…) kalır, **görev ilerlemesi sıfırlanır**. ACT 2 ustaları şimdilik eski sistemde; sonra aynı kalıpla yazılacak.

## Temel kurallar

1. **Tek aktif görev.** Aynı anda yalnızca bir görev yapılır. Görev alınınca bütün kişilerin başındaki **!** ve haritadaki parlamaları kalkar (dünyada da, küçük ve büyük haritada da).
2. **Görev almak.** Görevi olan kişinin başında **siyah bir !** vardır ve hem dünyada hem haritada **belirgin şekilde parlar**. Onunla konuştuğun anda "şunlara ihtiyacım var" der ve görev **doğrudan başlar** (Kabul et / Görev al düğmesi yok).
   - **Görev sahnesi (v1.93):** görev, kişinin adadaki kendi yerinde kısa bir sahneyle verilir. Ekranın üstüne ve altına siyah sinema şeritleri kayar, kontrol alınır, karakterin kişiye döner ve uzaktaysa yanına (yaklaşık 1,5 karo) yürür. Sonra ikisi **konuşma balonlarıyla** konuşur: (1) karakterin selamı ("Selam Dursun! Bir işin mi var?" gibi), (2) kişi **o göreve özel** metnini cümle cümle, en çok 4 balonda anlatır (görevin kendi konuşma metni; balon başına en çok ~120 harf), (3) ilk balondan sonra karakterin kısa bir tepkisi ("Anlat bakalım.", "Dinliyorum." gibi), (4) karakterin kabulü ("Tamam, hallederim!", "Bana bırak." gibi). Her balon okuma süresi kadar (1,8–5,2 sn) kalır; tık/dokunuş ya da bir tuş sonraki balona geçer, Esc sahnenin kalanını geçer. Balonlar bitince şeritler kalkar ve kısa bir pencere açılır: görevin adı, 📍 yeri ve ödülü; "Tamam"a basınca görev başlar ve "Görev başladı: …" yazısı çıkar. Kişi yakında değilse (yaklaşık 14 karodan uzak), arenadayken ya da denizdeyken sahne atlanır ve görev eskisi gibi tam metinli konuşma penceresiyle verilir.
   - **Başka kişiye yönlendirme yok (v2.09):** görev metinlerinde ve teşekkürlerde hiçbir kişi seni başka birine göndermez ("şuna git, ona selam söyle" yok); "X ile tanış" görevi yoktur. Kimin görevi olduğunu **harita** gösterir.
   - **Haritada tanışılmamış görev sahibi (v2.09):** görevi hazır olan ama **henüz tanışmadığın** bir kişi, haritanın kapalı (keşfedilmemiş) yerinde bile, kendi konumunda **parlak sarı, nabız gibi atan büyük bir "?"** ile gösterilir (kişinin simgesi ve adı görünmez). Oraya gidip kişiyle tanışınca "?" kalkar, kişinin simgesi haritada belirir ve görev her zamanki gibi alınır. Tanıştığın kişilerin görevleri v1.90'daki gibi simgenin arkasında sarı ışık ve halkalarla gösterilir.
   - **Gece okunurluk (v2.09):** görev sahnesindeki konuşma balonları gece karanlığının **üstünde** çizilir; karanlıkta da okunur.
   - **Seslenme balonu (v2.12):** bir kişi sana seslendiğinde ("Parçalar tamam! Dursun'a git" gibi, 7 sn) mavi balonun yeri **bir kez** seçilir (kişinin üstü, altı, yanları; arayüz kutularına değmeyen ilk yer) ve kişiye göre sabit kalır: sen yürüdükçe zıplamaz, yalnızca kişiyle birlikte kayar. Karakterin engel sayılmaz. Balon bir arayüz kutusunun altında **yarım saniyeden uzun** kalırsa bir kez yer değiştirir. Kişi ekrandan çıkarsa balon ekranın kenarında durur ve küçük sarı bir ok kişinin yönünü gösterir.
3. **Görevdeyken başkası.** Görevi olan biriyle konuşursan "Şu an bir işin var; önce onu bitir" der. Kazan, örs, pazar, sipariş, bileme gibi bütün hizmetler görev sürerken de kullanılır.
4. **İptal.** Görev iki yoldan iptal edilir: üstteki görev kartında **×** (onay sorar), ya da **görevi veren kişiyle** konuşunca menüdeki "📜 Görev" satırından "Bu işten vazgeçiyorum" (Ekin ve Nazlı'da durum penceresi doğrudan açılır). İptal edilince görevin bütün ilerlemesi silinir (av sayacı, çember vb.), görev hiç alınmamış sayılır; kişi yeniden parlar ve başında ! çıkar.
5. **Açılma koşulu.** Her görevin en az bir açılma koşulu vardır (bir önceki görev, seviye, bir alet, bir yer…). Ayrıca bir görevin istediği **her malzeme oyunda en az bir kez bulunmuş** olmalıdır ("Yeni malzeme bulundu" denmiş ya da tarif kitabında açık). Bulunmamış malzeme isteyen görev açılmaz. **"X keşfedildi"** koşulu, o biyoma ilk kez adım atılınca sağlanır (her biyoma bir kişinin "Ulaş" görevi ya da ana yol götürür). **Tarif kuralı (v2.09):** bir şeyin **yapılmasını ya da dövülmesini** isteyen görev, o şeyin **tarifi öğrenilmeden açılmaz** (görev tarifi kendisi kitaba yazıyorsa hariç). Örneğin Dursun'un "Keskin işler" (Taş kazma) görevi Taş kazma tarifi öğrenilince açılır.
6. **En çok 2 "!".** Haritada aynı anda en fazla **2 kişide** görev bekler. Bir görev daha açılırsa sıraya girer; bekleyen iki görevden biri tamamlanınca görünür. Sıra: önce erken biyom, sonra kişinin görev sırası. (Ekin'in ayak işleri bu sayıya girmez.)
7. **Görevsiz kalınmaz.** Hiç görev yoksa (bütün zincirler kilitliyse) **Ekin'in başında ! çıkar** ve bir sonraki kilitli görevin eksik koşulunu tamamlatan bir iş verir ("Ekin'in ayak işleri", aşağıda). Oyuncu bunun bir eksiklikten doğduğunu anlamaz: Ekin'in gerçekten bir işi varmış gibi konuşur.
8. **İstenenler biyomdan.** Her kişi kendi biyomunun malzemesini ister; yalnızca **son görevleri** bir sonraki biyomun **bol ve kolay** (zararsız ya da toplanabilir) bir şeyini isteyebilir. Akış kolaydan zora, Çayır'dan Mor Kristal Vadisi'ne gider.
9. **Kendiliğinden biten işler.** Bir yere gitmek, biriyle tanışmak, köprüyü onarmak, sıradağı patlatmak, izleri bulmak ve Levent'in gemisini kurmak: bunlar yapıldığı anda biter, ödül oracıkta gelir (geri dönüp teslim etmek gerekmez). Ekin'e bu yüzden yalnızca yeni iş almaya gidilir.
10. **Ödül.** Sikke + XP; bazı görevler ayrıca tarif yazar. Kabaca biyoma göre: Çayır 20–120, Orman 40–180, Bataklık 120–300, Kayalık Dağ 200–420, Kül Diyarı 300–550, Mor Kristal Vadisi 450–800 sikke.

## Yol gösterme: ok ve sarı bölge (v1.91)

- Görev alınınca görevin **yapılabileceği her yer** haritada (büyük ve küçük harita) **sarı boyanır** ve yavaşça nabız gibi parlar; görev sürdükçe kalır, görevdeki **son parça** toplanınca ya da görev iptal edilince kalkar. Küçük bir çember çizilmez.
  - Toplanabilir / maden / ağaç: o şeyin **bulunduğu bütün biyomlar** baştan sona sarı (yalnızca kara; su boyanmaz). Örneğin her biyomda çıkan bir şey için bütün ada.
  - Hayvandan düşen şey ya da av: o canlının **yaşadığı bütün biyomlar** (eşya hem yerden hem avdan çıkıyorsa ikisinin biyomları birlikte).
  - Balık tutma ve nehir kili gibi suda yapılan işler: **nehirler ve sığ sular** (açık deniz değil).
  - Bir biyoma gitme: o biyomun tamamı.
  - Bir kişiye, bir yapıya ya da bir yere gitme (demirci, kazan, köprü, enkaz…): o kişinin/yerin çevresinde büyük bir sarı ışık (yaklaşık 8 karo yarıçap) ve dışa açılan halkalar.
  - Yapılacak bir eşya: ham maddeleri sırayla gösterilir (biri tamamlanınca sarı bölge sonrakine geçer); son adımda yapılacağı yer (kazan, örs, el yapımı) söylenir. Birden fazla şey isteyen görevde bölge sırayla her birini gösterir.
- **Ok:** sarı bölgenin dışındaysan ok seni bölgenin **sana en yakın** yerine götürür. **Zaten o biyomdaysan** (ya da suda yapılacak işte nehrin 3 karo yakınındaysan, kişiye gidilecek işte 8 karo yakınındaysan) **ok çıkmaz**.
- Görev kartı ve görev konuşmasındaki "📍" satırı biyomların adını söyler ("Orman, Bataklık · haritada sarı bölge").
- Görev bitince (kendiliğinden bitenler hariç) ok **görevi veren kişiyi** gösterir. Kişinin yanına (yaklaşık 2 karo) gelince "**Görev tamamlandı**" yazısı çıkar, kişi teşekkür eder, ödül verilir.

## Yeni mekanik dersleri

Bir görev oyuncunun henüz bilmediği bir mekaniği istiyorsa, görev **önce kısa bir dersle** başlar: öğreticideki gibi kart + ok + vurgu, adım adım. Ders bitince asıl görev başlar. Her ders **bir kez** görülür; öğreticiyi yapmış olan bildiği dersleri görmez.

| Ders | Hangi görevde | Adımlar (özet) |
|---|---|---|
| Ağaç kesme | Rıza 1 | Baltayı yuvaya koy → eline al → ağaca E → odun düşer |
| Örs ve demirci | Dursun 1 (öğreticiyi geçenlere) | Tarifi kazanda öğren → parçaları topla → demirciye E → Döv |
| Kamp ateşi ve gece | Börü 1 | V ile ateş kur → geceyi ateşin ışığında geçir; zifiri karanlık kuralı |
| Balık tutma | Nazlı 2 | Olta yap → eline al → suya dön → E → çekmek için zamanında bas |
| Maden ve eritme | Dursun 5 | Kazmayla cevher → kömür → kazanda külçe tarifi → el yapımı külçe |
| Köprü onarımı | Ekin 2 | Köprüye E / tıkla → onay penceresi → malzeme gider |
| Zırh giyme | Durmuş 5 | C penceresi → yuvaya sürükle → savunma |
| Kaya patlatıcı | Ekin 3 | Patlatıcı tarifi → kazma → kaya yığınına E → onay → patlama |
| Silah yuvası ve dövüş | Börü 2–3 | Saldırı tuşu, atılma, silahı silah yuvasına koyma |
| Tuzak kurma | Nazlı 4 | Tuzağı eline al → çayırda E → ertesi kontrol |
| Bileme | Dursun 4 | Demirciye "Aletimi bile" → körelmiş alet |
| Satış | Nazlı 3 (öğreticiyi geçenlere) | Pazarı aç → malzeme seç → sat |
| Barınak ve uyku | Rıza 2 | Barınak yaptır → yere koy → gece içinde E ile uyu |
| Kil ve kürek | Rıza 4 | Kürek yap → nehir kıyısında E → ıslak kil → kerpiç |
| Ev ve yatak | Rıza 5 | Rıza'dan ev al → yere koy → içine gir → Kemal'den yatak → evin içine koy |
| Tarla | Hasan 1–3 | Tırmıkla hazırla → tohum ek → sulama kabıyla sula → tırpanla biç |
| Yapı kurma | Kemal 2 | Malzemeyi topla → Kemal'e E → kurar → yere yerleştir |
| Çamur ve çizme | Toygar 1 | Bataklık çamuru yavaşlatır → kamış çizme yap → giy |

## Köprü, kaya yığını ve gemi

- Bu üç iş **görev alınmadan yapılamaz**: Ekin'in "Bir köprüyü onar" ve "Doğu geçidini aç" görevleri, Levent'in "Yeni bir gemi" görevi.
- Köprüye, kaya yığınına ya da gemi enkazına **E ya da sol tıkla** basınca bir **onay penceresi** açılır (hiçbir kişinin portresi yok): "20 odun harcanacak. Onarılsın mı?" gibi. Onaylayınca malzeme gider ve karakter duruma göre tepki verir (konuşma balonu): köprüde "Aa, sandığımdan kolaymış!", patlamada önce "Kulaklarımı tıkasam iyi olur…" sonra sarsıntı ve "Vay be!", gemide "İşte ACT 1'in sonu… ya da başlangıcı."
- **Görev alınmamışken** gerekli malzemeyle oraya gelen kişi **yalnızca bir kez** kendi kendine konuşur: "Buradan nasıl geçebilirim acaba? Ekin bilir belki." Onay penceresi açılmaz.
- Köprü onarılınca Ekin'in **koşu dersi** başlar (eskiden olduğu gibi).
- Kuzey köprüsü (Orman ↔ Bataklık) onarıldıktan sonra iki kısayol köprüsü (Çayır ↔ Kayalık Dağ) görevsiz, istenen an onay penceresiyle onarılır. Patlama bütün sıradağı çökertir (v1.85).

## Ekin'in ayak işleri (boşluk doldurma)

Hiçbir kişide görev yoksa Ekin'in başında ! çıkar. Ekin, **bir sonraki kilitli görevin eksik koşulunu** tamamlatan bir iş verir; konuşması sıradan bir görev gibidir, oyuncu bir şeyin eksik olduğunu sezmez. O görevin bulunmamış malzemeleri birden çoksa hepsini tek işte, birer tane ister. Ekin'in hikâye parçaları onun 5 görevine bağlıdır (beşincisiyle son iki parça açılır).

| Eksik olan | Ekin'in işi (örnek söz) | Çember |
|---|---|---|
| Henüz bulunmamış bir malzeme | "Dün akşam çayırın doğusunda kırmızı çiçekler gördüm, **gelincik**. Bir tane getirir misin, kampa renk gelsin." | O malzemenin en zararsız kümesi |
| Seviye | "Kollarına bir bak evlat; bu adada güçsüz yaşanmaz. Biraz avlan, biraz topla: **Seviye 5**'e gel, sonra konuşalım." | – |
| Bir alet | "Elinde bir **çakmaktaşı balta** olsa meşeleri de keserdin. Dursun'a bir uğra." | Ham maddeleri sırayla |
| Bir yere gitmek | "Kuzeydeki ormanı hiç gördün mü? Bir **Orman**'a git, nasıl bir yer anlat bana." | O biyomun girişi |

Ödülü küçüktür (10–40 sikke, biraz XP). Ayak işleri haritadaki "en çok 2 !" sınırına girmez.

## Kişiler ve görevler

Tablolarda: **İstenen** = görevin istediği (getir / avla / yap / dövdür / kur / ulaş). **Açılma** = ek koşullar (kural 5'teki "malzeme bulunmuş olmalı" her görev için ayrıca geçerli). **Açar** = tamamlanınca açılan görevler. Çember her görevde yukarıdaki kurala göre çizilir.

### Yaşlı Ekin · Çayır · ana yol

Kumsalda seni bulan yaşlı denizci; sakin, kollayıcı, öğretici. Ekin'de yalnızca **ana yolun** görevleri var: ilk iş, köprü, patlama, izler ve Levent. Aletler, ateş, balık, maden ve zırh gibi öğrenme işleri ilgili ustalara dağıtıldı; oyuncu Ekin'e yalnızca hikâye ilerlerken (ve nadiren bir ayak işi için) döner. İlk görevi öğretici bitince (ya da geçilince) **hemen** başında ! ve haritada parlamayla çıkar.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| E1 | Ateşlik çalı | Getir: 6 Dal, 2 Kuru ot | Öğretici bitti ya da geçildi | Dursun 1, Zümrüt 1 | – | 20 · 15 XP |
| E2 | Bir köprüyü onar | Kuzey köprüsü (Orman ↔ Bataklık): 20 odun, onay penceresiyle | Orman keşfedildi · Seviye 6 · Hasan 2 | Toygar 1 ve Bataklık'taki görevler | Köprü onarımı | 150 · 120 XP |
| E3 | Doğu geçidini aç | 2 Kaya patlatıcı + 3. kademe ya da daha iyi kazma (Tunç ya da Kuvars); kaya yığınına E, onay | Kayalık Dağ keşfedildi · Seviye 10 | Kül Diyarı'ndaki görevler | Kaya patlatıcı | 300 · 400 XP |
| E4 | Eşinden kalan izler | Bul: 6 iz (önceden bulunanlar sayılır) | Kül Diyarı keşfedildi | E5, Gemi tarifi | – | 300 · 600 XP |
| E5 | Kıyıdaki duman | Ulaş: Mor Kristal Vadisi'ne git (Ekin dumanı merak eder; kimseyi söylemez) | E4 | Levent 1 | – | 200 · 300 XP |

Ekin'e gidiş sayısı: ACT 1 boyunca 5 görev + 5 teslim. Arada ayak işi ancak bütün zincirler kilitliyse çıkar (aşağıdaki zincirler birbirini açtığı için nadiren).

### Cadı Zümrüt · Çayır

Kazanının başında, otları ve geceyi bilen sabırlı cadı.

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| Z1 | Papatya çayı | Getir: 4 Papatya, 3 Nane | E1 | Z2 | 30 · 20 XP |
| Z2 | Kazanın dili | Kazanda 5 yeni tarif öğren | Z1 | Z3 | 40 · 30 XP |
| Z3 | Gelincik boyası | Yap: 2 Gelincik boyası | Z2 | Z4 | 50 · 35 XP |
| Z4 | Ay ışığında | Getir: 2 Gece sefası (yalnızca gece açar) | Z3 · Kaba meşale ya da Meşale | Z5 | 70 · 45 XP |
| Z5 | Ormanın yaprakları | Getir: 3 Yaban mersini, 3 Kuzukulağı (Orman) | Z4 · Orman keşfedildi | Yakut 1 | 90 · 60 XP |

### Demirci Dursun · Çayır

Övüngen ama iyi kalpli silah demircisi; yalnız Çayır malzemesiyle dövülenleri döver. Ekin'in ilk görevinden sonra oyuncuyu aletlerle o tanıştırır.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| D1 | Ocağa odun | Getir: 8 Çam odunu (Dursun: "Baltan var, değil mi? Örsün ateşi odun yer, 8 çam odunu kes getir"). v2.09'da "İlk baltan" (Taş balta dövdür) yerine geldi; balta öğreticide zaten dövülüyor. Çam odunu daha önce bulunmamış olsa da açılır | E1 · **örste bir balta dövülmüş olmalı** (öğreticiyi yapan zaten Taş baltayı dövmüştür; öğreticiyi atlayan, balta tarifini öğrenip ilk baltasını bir demirciye dövdürünce açılır) | D2, Rıza 1 | – | 30 · 20 XP |
| D2 | Keskin işler | Dövdür: Taş kazma (Taş kazma tarifi öğrenilmeden açılmaz) | D1 · Taş kazma tarifi | D3, Durmuş 1 | – | 30 · 20 XP |
| D3 | Çakmaktaşı balta | Dövdür: Çakmaktaşı balta | D2 | D4 | – | 50 · 35 XP |
| D4 | Ağzı köreldi | Bir aleti biledir | D3 · körelmiş bir alet | D5 | Bileme | 40 · 30 XP |
| D5 | Tunç zamanı | Yap: Tunç külçesi; dövdür: Tunç balta, Tunç kazma ya da Tunç mızrak | D4 · Seviye 4 | D6, Durmuş 3 | Maden ve eritme | 150 · 120 XP |
| D6 | Ocağın kömürü | Getir: 5 Taş kömürü (Orman madeni) | D5 · Orman keşfedildi | Durdu 1 | – | 90 · 60 XP |

### Marangoz Rıza · Çayır

Nişanlısına söz verdiği deniz gören evi hâlâ yapan marangoz.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| R1 | Çam kalası | Kes: 5 Çam odunu; yap: 4 Çam kalası | D1 | R2, Nazlı 1, Börü 1 | Ağaç kesme | 40 · 25 XP |
| R2 | Yaprak barınağı | Barınak yaptır (8 Dal, 12 Yaprak, 4 Lif), gece içinde uyu | R1 | R3 | Barınak ve uyku | 40 · 30 XP |
| R3 | Odun stoku | Getir: 15 Herhangi odun | R2 | R4 | – | 60 · 35 XP |
| R4 | Kerpiç | Yap: 6 Nehir kerpici | R3 | R5 | Kil ve kürek | 80 · 50 XP |
| R5 | Kalıcı bir ev | Rıza'dan ev al (Kulübe ya da çadır), kur, içine Kemal'in yaptığı bir yatak koy | R4 · Kemal 1 · Seviye 4 | – | Ev ve yatak | 120 · 80 XP |

### Pazarcı Nazlı · Çayır

Neşeli, pazarlıkçı tüccar kızı.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| N1 | Tezgâha meyve | Getir: 5 Böğürtlen, 3 Yaban çileği | R1 | N2 | – | 30 · 20 XP |
| N2 | Taze balık | Yap: Olta; tut: 2 balık (Çayır nehri) | N1 | N3 | Balık tutma | 60 · 35 XP |
| N3 | Bereketli satış | 150 sikkelik satış | N2 | N4 | Satış (öğreticiyi geçenlere) | 40 · 25 XP |
| N4 | Kürk siparişi | Yap: Tuzak, kur; getir: 3 Tavşan derisi | N3 | N5, Börü 4 | Tuzak kurma | 70 · 45 XP |
| N5 | Kış kurutmalığı | Yap: 3 Kurutulmuş yabani elma | N4 | N6 | – | 70 · 45 XP |
| N6 | Orman balı | Getir: 2 Yabani bal (Orman) | N5 · Orman keşfedildi | – | – | 90 · 60 XP |

### Savaşçı Börü · Çayır

Sert ama sıcak; kaçmayı da öğreten savaşçı. Oyuncuyu kuzeye, Orman'a ilk yollayan odur.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| B1 | Ateş başında nöbet | Kamp ateşi kur, gece yanında 60 sn bekle | R1 · Seviye 2 | B2 | Kamp ateşi ve gece | 50 · 30 XP |
| B2 | Kerevit avı | Avla: 2 Kerevit | B1 | B3 | Silah yuvası ve dövüş | 30 · 20 XP |
| B3 | Taş kılıç | Yap: Taş kılıç, silah yuvasına koy | B2 | B4 | – | 40 · 30 XP |
| B4 | Geyik sürüsü | Avla: 2 Geyik | B3 · N4 | B5 | – | 60 · 40 XP |
| B5 | Kuzeye keşif | Ulaş: Orman'a git (kimseyle tanıştırmaz) | B4 · Seviye 3 | B6, Hasan 1, Kemal 1 | – | 80 · 50 XP |
| B6 | Domuz avı | Avla: 2 Yaban domuzu (Orman) | B5 | Durdu 2 | – | 120 · 80 XP |

### Zırhçı Durmuş · Çayır

Dursun'un küçük kardeşi; korumayı her şeyden önemli sayar.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| M1 | Kemik yığını | Getir: 6 Kemik | D2 | M2 | – | 30 · 25 XP |
| M2 | Sinir kirişi | Yap: 2 Sinir kirişi | M1 | M3 | – | 40 · 30 XP |
| M3 | Tunç levha | Yap: 1 Tunç levha | M2 · D5 | M4 | – | 120 · 90 XP |
| M4 | Deri astar | Getir: 4 Tavşan derisi, 2 Geyik derisi | M3 | M5 | – | 90 · 70 XP |
| M5 | Tunç miğfer | Dövdür ve giy: Tunç miğfer (tabaklanmış deri Orman'ın meşe tanininden) | M4 · Orman keşfedildi | Duran 1 | Zırh giyme | 150 · 120 XP |

### Tüccar Nuri · Çayır (iskele)

Takvime bağlı gezgin; görevleri yalnızca gemisi iskeledeyken alınır ve teslim edilir (gemi giderse görev sürer, dönünce teslim edilir).

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| U1 | İlk sipariş | Getir: 6 Kuru ot, 6 Lif, 3 Çakmaktaşı | Gemi ilk kez iskelede | U2 | 40 · 20 XP |
| U2 | Tatlı yük | Getir: 6 Yabani elma, 6 Yabani armut | U1 | U3 | 50 · 30 XP |
| U3 | Bakır yükü | Getir: 6 Bakır cevheri | U2 | U4 | 70 · 45 XP |
| U4 | Fener yağı | Yap: 4 Don yağı mumu | U3 | U5 | 90 · 60 XP |
| U5 | Uzak ada mantarı | Getir: 4 Tavuk mantarı (Orman) | U4 · Orman keşfedildi | – | 120 · 80 XP |

### Çiftçi Hasan · Orman

Kızı Gül için tarla eken sabırlı çiftçi.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| H1 | Tırmık | Yap ve Hasan'a ver: Tırmık | B5 ya da Orman keşfedildi | H2 | Tarla (hazırlama) | 40 · 30 XP |
| H2 | Sulama kabı | Yap ve Hasan'a ver: Sulama kabı | H1 | H3, E2 | Tarla (ekme, sulama) | 50 · 35 XP |
| H3 | İlk hasat | Hasan'a Tırpan ver; ek, sula, biç: 5 Buğday getir | H2 | H4 | Tarla (biçme) | 80 · 50 XP |
| H4 | Sebze sepeti | Hasan'a Taş kazma ver; getir: 3 Havuç, 3 Soğan (tarladan) | H3 | H5 | – | 100 · 60 XP |
| H5 | Bataklık kamışı | Getir: 8 Kamış (Bataklık, çit için) | H4 · E2 | – | – | 120 · 80 XP |

### Usta Kemal · Orman

Kızı Hatice'yle ada ada ev yapan usta.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| K1 | Ladin kalası | Getir: 6 Ladin kalası | B5 ya da Orman keşfedildi | K2, Rıza 5 | – | 60 · 40 XP |
| K2 | Atölye | Kur: Atölye | K1 | K3 | Yapı kurma | 90 · 60 XP |
| K3 | Çit | Kur: Çit | K2 | K4 | – | 70 · 45 XP |
| K4 | Meşe tanini | Yap: 2 Meşe tanini | K3 · Çakmaktaşı ya da Granit balta | K5 | – | 100 · 70 XP |
| K5 | Hasır işi | Getir: 10 Hasırotu (Bataklık) | K4 · E2 | – | – | 120 · 80 XP |

### Cadı Yakut · Orman

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| Y1 | Kırmızı demlik | Getir: 4 Kanlıca, 4 Isırgan | Z5 | Y2 | 70 · 50 XP |
| Y2 | Ormanın tatlısı | Getir: 2 Yabani bal, 5 Yaban mersini | Y1 | Y3 | 90 · 60 XP |
| Y3 | Mantar sepeti | Getir: 4 Tavuk mantarı | Y2 | Y4 | 100 · 70 XP |
| Y4 | Engerek dili | Avla: 3 Engerek | Y3 | Y5 | 140 · 100 XP |
| Y5 | Bataklık otu | Getir: 3 Bataklık otu (Bataklık) | Y4 · E2 | Safir 1 | 160 · 120 XP |

### Silahçı Durdu · Orman

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| DU1 | Granit yığını | Getir: 6 Granit, 4 Taş kömürü | D6 | DU2 | 90 · 60 XP |
| DU2 | Domuz dişi | Getir: 4 Yaban domuzu dişi | DU1 · B6 | DU3 | 110 · 80 XP |
| DU3 | Granit balta | Dövdür: Granit balta | DU2 | DU4 | 120 · 90 XP |
| DU4 | Gürzün ağırlığı | Dövdür: Granit gürz | DU3 | DU5 | 180 · 140 XP |
| DU5 | Demir damarı | Getir: 3 Demir cevheri (Bataklık) | DU4 · E2 | Ali 1 | 180 · 150 XP |

### Zırhçı Duran · Orman

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| DR1 | Ceviz kabukları | Getir: 8 Ceviz | M5 | DR2 | 80 · 60 XP |
| DR2 | Karaca derisi | Getir: 3 Karaca derisi, 6 Kirpi dikeni | DR1 | DR3 | 110 · 80 XP |
| DR3 | Tabaklama | Yap: 2 Tabaklanmış karaca derisi | DR2 · Kemal 4 | DR4 | 130 · 100 XP |
| DR4 | Kabuk zırh | Dövdür: Meşe kabuk zırh | DR3 | DR5 | 180 · 140 XP |
| DR5 | Samur postu | Getir: 2 Su samuru derisi (Bataklık) | DR4 · E2 | Veli 1 | 180 · 150 XP |

### Avcı Toygar · Bataklık

Yirmi yıldır bataklıkta oğlunu bekleyen avcı.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| T1 | Çamur yürüyüşü | Yap ve giy: Kamış çizme | E2 | T2 | Çamur ve çizme | 120 · 100 XP |
| T2 | Ördek avı | Avla: 3 Ördek | T1 | T3 | – | 120 · 110 XP |
| T3 | Kurbağa zehri | Avla: 3 Zehirli kurbağa | T2 | T4, Safir 3 | – | 160 · 180 XP |
| T4 | Bataklık kurdu | Avla: 2 Bataklık kurdu | T3 | T5 | – | 200 · 260 XP |
| T5 | Timsah | Avla: 1 Timsah | T4 | T6 | – | 260 · 380 XP |
| T6 | Dağ yolu | Ulaş: Kayalık Dağ'a in (kimseyi söylemez) | T5 | Kayalık Dağ'daki görevler | – | 220 · 300 XP |

### Cadı Safir · Bataklık

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| SA1 | Mavi demlik | Getir: 4 Nilüfer, 4 Su teresi | Y5 | SA2 | 150 · 160 XP |
| SA2 | Sinek mantarı | Getir: 4 Sinek mantarı, 3 Turba | SA1 | SA3 | 180 · 200 XP |
| SA3 | Panzehir | Yap: 2 Panzehir | SA2 · T3 | SA4 | 200 · 230 XP |
| SA4 | Kurbağa gözü | Getir: 3 Kurbağa | SA3 | SA5 | 220 · 260 XP |
| SA5 | Dağ kekiği | Getir: 4 Kekik (Kayalık Dağ) | SA4 · Kayalık Dağ keşfedildi | Firuze 1 | 220 · 280 XP |

### Silahçı Ali · Bataklık

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| AL1 | Demir damarı | Getir: 6 Demir cevheri | DU5 · Çakmaktaşı ya da Granit kazma | AL2 | 160 · 180 XP |
| AL2 | Demirin terbiyesi | Dövdür: Demir balta, Demir kazma, Demir kılıç ya da Demir mızrak | AL1 | AL3 | 200 · 230 XP |
| AL3 | Timsahın dişi | Getir: 3 Timsah dişi | AL2 · T5 | AL4 | 220 · 260 XP |
| AL4 | Dişli kılıç | Dövdür: Timsah dişi kılıcı | AL3 | AL5 | 280 · 340 XP |
| AL5 | Kuvars | Getir: 4 Kuvars (Kayalık Dağ) | AL4 · Kayalık Dağ keşfedildi | Kaya 1 | 240 · 300 XP |

### Zırhçı Veli · Bataklık

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| VE1 | Arduvaz | Getir: 5 Arduvaz, 3 Tuz kayası | DR5 | VE2 | 150 · 160 XP |
| VE2 | Demir halka | Yap: 4 Demir halka | VE1 · AL1 | VE3 | 200 · 230 XP |
| VE3 | Su geçirmez astar | Getir: 3 Su samuru derisi, 2 Bataklık kurdu postu | VE2 | VE4 | 220 · 260 XP |
| VE4 | Pullu zırh | Dövdür: Timsah pulu zırh | VE3 | VE5 | 280 · 340 XP |
| VE5 | Beyaz kil | Getir: 4 Beyaz kil (Kayalık Dağ) | VE4 · Kayalık Dağ keşfedildi | Kayhan 1 | 240 · 300 XP |

### Cadı Firuze · Kayalık Dağ

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| FI1 | Turkuaz demlik | Getir: 3 Kardelen, 4 Lavanta | SA5 | FI2 | 220 · 260 XP |
| FI2 | Liken ve kav | Getir: 5 Liken, 4 Kav mantarı | FI1 | FI3 | 260 · 320 XP |
| FI3 | Kardelen merhemi | Yap: 2 Kardelen merhemi | FI2 | FI4 | 280 · 360 XP |
| FI4 | Kartalın tüyü | Getir: 4 Kartal tüyü | FI3 | FI5 | 320 · 420 XP |
| FI5 | Ateş çiçeği | Getir: 4 Ateş çiçeği (Kül Diyarı) | FI4 · E3 | Mercan 1 | 300 · 420 XP |

### Silahçı Kaya · Kayalık Dağ

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KA1 | Kuvars ve gümüş | Getir: 6 Kuvars, 4 Gümüş cevheri | AL5 | KA2 | 240 · 300 XP |
| KA2 | Kuvars kazma | Dövdür: Kuvars kazma | KA1 | KA3 | 260 · 320 XP |
| KA3 | Vaşak | Avla: 1 Vaşak | KA2 | KA4 | 320 · 420 XP |
| KA4 | Gümüşün sesi | Dövdür: Gümüş kılıç | KA3 | KA5 | 380 · 500 XP |
| KA5 | Bazalt | Getir: 4 Bazalt (Kül Diyarı) | KA4 · E3 | Turan 1 | 320 · 440 XP |

### Zırhçı Kayhan · Kayalık Dağ

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KH1 | Öküz derisi | Getir: 2 Yaban öküzü derisi, 2 Öküz boynuzu | VE5 | KH2 | 240 · 300 XP |
| KH2 | Gümüş külçesi | Yap: 3 Gümüş külçesi | KH1 | KH3 | 260 · 320 XP |
| KH3 | Ayı pençesi | Getir: 3 Ayı pençesi | KH2 | KH4 | 320 · 420 XP |
| KH4 | Gümüş pullar | Dövdür: Gümüş pullu zırh | KH3 | KH5 | 380 · 500 XP |
| KH5 | Böcek kabuğu | Getir: 3 Kül böceği kabuğu (Kül Diyarı) | KH4 · E3 | Tufan 1 | 320 · 440 XP |

### Cadı Mercan · Kül Diyarı

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| ME1 | Mercan demlik | Getir: 5 Ateş çiçeği, 3 Kor otu | FI5 · Kül Diyarı keşfedildi | ME2 | 320 · 480 XP |
| ME2 | Duman ve kök | Getir: 3 Duman çiçeği, 3 Yanık kök | ME1 | ME3 | 380 · 560 XP, Ateş çiçeği merhemi tarifi |
| ME3 | Ateş merhemi | Yap: 2 Ateş çiçeği merhemi | ME2 | ME4 | 400 · 600 XP |
| ME4 | Kül cini | Avla: 2 Kül cini | ME3 | ME5 | 460 · 700 XP |
| ME5 | Ay otu | Getir: 3 Ay otu (Mor Kristal Vadisi) | ME4 | İnci 1 | 450 · 700 XP |

### Silahçı Turan · Kül Diyarı

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| TU1 | Bazalt ve kükürt | Getir: 6 Bazalt, 4 Kükürt | KA5 · Kül Diyarı keşfedildi | TU2 | 340 · 500 XP |
| TU2 | Bazalt kazma | Dövdür: Bazalt kazma | TU1 | TU3 | 360 · 540 XP |
| TU3 | Akrep ve kertenkele | Avla: 2 Ateş akrebi, 1 Lav kertenkelesi | TU2 | TU4 | 440 · 680 XP |
| TU4 | Lavın kenarı | Dövdür: Lav camı kılıcı | TU3 | TU5 | 520 · 800 XP |
| TU5 | Obsidyen | Getir: 4 Obsidyen (Mor Kristal Vadisi) | TU4 | Kudret 1 | 480 · 760 XP |

### Zırhçı Tufan · Kül Diyarı

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| TF1 | Böcek kabuğu | Getir: 4 Kül böceği kabuğu | KH5 · Kül Diyarı keşfedildi | TF2 | 340 · 500 XP |
| TF2 | Lav pulu | Getir: 3 Lav pulu | TF1 | TF3 | 380 · 560 XP |
| TF3 | Kül kurtları | Avla: 3 Kül kurdu | TF2 | TF4 | 440 · 680 XP |
| TF4 | Kül zırhı | Dövdür: Kül böceği zırh | TF3 | TF5 | 520 · 800 XP |
| TF5 | Güve tozu | Getir: 6 Güve tozu (Mor Kristal Vadisi; mor güveler zararsız) | TF4 | Kuvvet 1 | 480 · 760 XP |

### Denizci Levent · Mor Kristal Vadisi

Kızı Meltem'i arayan kaptan; ACT 1'in sonu onun gemisi.

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| L1 | Kazazedenin yarası | Getir: 3 Ay otu, 2 Işık mantarı | E5 | L2 | 400 · 600 XP |
| L2 | Enkazın bekçileri | Avla: 2 Gölge kurdu | L1 | L3 | 600 · 1.000 XP |
| L3 | Yıldızlarla yön | Getir: 2 Ay taşı, 4 Kristal (yalnızca Obsidyen kazmayla kazılır) | L2 · Kudret 2 | L4 | 500 · 800 XP |
| L4 | Yelken ipi | Yap: 2 Mor ip | L3 | L5 | 500 · 800 XP |
| L5 | Yeni bir gemi | Gemi malzemeleri enkaza (Levent'le ya da enkazla konuşunca onay penceresi) | L4 | ACT 2 | 0 · 2.000 XP |

### Cadı İnci · Mor Kristal Vadisi

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| IN1 | İnci demlik | Getir: 3 Ay otu, 3 Yıldız çiçeği | ME5 | IN2 | 450 · 700 XP |
| IN2 | Güve tozu | Getir: 6 Güve tozu | IN1 | IN3 | 520 · 800 XP |
| IN3 | Işık tozu | Getir: 3 Işık tozu, 2 Kristal çiçeği | IN2 | IN4 | 600 · 950 XP |
| IN4 | Ay otu iksiri | Yap: 1 Ay otu iksiri | IN3 | IN5 | 650 · 1.000 XP |
| IN5 | Işık engereği | Avla: 2 Işık engereği | IN4 | – | 700 · 1.100 XP |

### Silahçı Kudret · Mor Kristal Vadisi

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KU1 | Obsidyen ve ametist | Getir: 6 Obsidyen, 3 Ametist | TU5 | KU2 | 480 · 750 XP |
| KU2 | Obsidyen kazma | Dövdür: Obsidyen kazma (kristal için şart) | KU1 | KU3, Levent 3 | 520 · 800 XP |
| KU3 | Gölgenin dişi | Getir: 3 Gölge dişi | KU2 | KU4 | 560 · 900 XP |
| KU4 | Kristal golem | Avla: 1 Kristal golem | KU3 | KU5 | 700 · 1.100 XP |
| KU5 | Mor kılıç | Dövdür: Ametist kılıcı | KU4 | – | 700 · 1.100 XP |

### Zırhçı Kuvvet · Mor Kristal Vadisi

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KV1 | Örümcek ağı | Avla: 2 Kristal örümcek | TF5 | KV2 | 520 · 800 XP |
| KV2 | Işık pulları | Getir: 4 Işık pulu | KV1 | KV3 | 560 · 900 XP |
| KV3 | Gölge postu | Yap: 2 Tabaklanmış gölge postu | KV2 | KV4 | 600 · 950 XP |
| KV4 | Kristal zırh | Dövdür: Kristal ipek zırh | KV3 | KV5 | 700 · 1.100 XP |
| KV5 | Işık eldiveni | Dövdür: Işık pulu eldiven | KV4 | – | 700 · 1.100 XP |

## Hikâyeler ve sahneler

- Her kişinin hikâye parçaları yeni görevlerine **eşit aralıklarla** bağlanır; son parça her zaman kişinin son göreviyle açılır (örnek: 3 parçalı bir kuzen, 5 görevden 2., 3. ve 5.'siyle).
- Elmas Nine'nin ortak sahnesi: Zümrüt, Dursun, Durmuş ve 15 kuzenin **bütün** görevleri bitince (yeni sayıyla 18 kişi × 5–6 görev).
- Ekin'in anıları (%30 ihtimalle her teslimde) ve izler aynen kalır.

## Toplam

ACT 1'de 27 kişi, **139 görev** (Dursun, Nazlı, Börü ve Toygar 6'şar; Ekin dahil diğerleri 5'er) + Ekin'in ayak işleri. Gezginlerden (Yıldızsız Gezgin, Işıkçı, Balıkçı Rüstem) görev yok; isteğe göre eklenebilir.


# ACT 1 · Kişiler ve görevler

> **Referans (eski görev sistemi, v1.85'e kadar).** Bu bölümdeki görev tabloları **artık oyunda yok** (v1.86); geçerli görevler yukarıdaki "ACT 1 · Görevler" bölümünde. Kişilerin tanıtımları, çalışma yerleri, kuzenlere özel eşyalar ve hikâyeleri geçerlidir.

## Görevler nasıl çalışır

- Herkesin kendi mesleğine uygun, **sabit sırayla ilerleyen** bir yan görev zinciri vardır. Farklı kişilerin görevleri aynı anda açık olabilir.
- Kişinin başında **mavi !** = yeni görev hazır; **sarı ?** = teslim edebileceğin görev var. Konuşma menüsünde "❗ Senin için bir işim var" ve "✔ Görevi teslim et" satırları çıkar. Görev bitince aynı konuşmada "Başka iş var mı?" ile sıradaki görev alınır.
- Görev defteri **G** tuşuyla açılır; bir görevi takip etmek ekranda mavi bir yol oku açar. Getirme ve av görevlerinde "Nerede:" satırı malzemenin hangi biyomda olduğunu söyler. Av görevleri yalnızca görev kabul edildikten sonraki avları sayar (önceki avlar sayılmaz).
- Bazı görevler kabul edildiği anda bir tarifi kitabına yazar (tabloda "Açılma şartı"ndan ayrı olarak kişinin açıklamasında yazılı).
- **Hikâyeler:** Her yan görev, o kişinin bu adaya nasıl geldiğini anlatan hikâyesinden bir parça açar ("📖 Sen bu adaya nasıl geldin?"). Bütün parçalar dinlenince "📖 O geceyi anlat" bir sahne açar (+40 XP). Herkes mor ışık yüzünden birini kaybetmiştir. **İstisna (v1.84):** Zümrüt, Dursun, Durmuş ve 15 kuzenin kendi sahneleri yoktur; 18'inin bütün görevleri bitince tek bir ortak sahne oynar (Elmas Nine, +300 XP).
- **Ücretler:** Dursun, Durmuş ve silahçı/zırhçı kuzenlerinin işçiliği eşya fiyatının %15'i (en az 2), Kemal'inki %20'si (en az 3); alet bileme aletin değerinin onda biri.

## Yaşlı Ekin · ana görevler

Kumsalda seni bulan yaşlı denizci. Kampı uyandığın kumsalın hemen yanında, Çayır'ın güney kıyısında. Bir şey satmaz; ana görev zincirini verir. Kampının yanında "SATILIK" bir arsa vardır (Taş ev buraya kurulur). Bayılınca (gece mor ışıkla da) kampının hemen yanındaki kumsalda uyanırsın. Ana görevleri bitirdikçe kendi hikâyesini (kaybettiği eşi Saliha) anlatır. Her görev tesliminde %30 ihtimalle bir anın geri gelir.

| # | Görev | İstenen | Sikke | XP | Kitaba yazdığı tarifler |
|---|---|---|---|---|---|
| 1 | 5 odun kes | Çamdan 5 odun (taş balta yalnızca çam, ladin, kavak ve meyve ağaçlarını keser) | 40 | – | – |
| 2 | Bir köprüyü onar | Kuzey köprüsüne (Orman ↔ Bataklık) 20 odun; öbür iki köprü sonra kısayol | 100 | 40 | – (koşma dersi başlar) |
| 3 | İlk yeteneğini al | Yetenek ağacından bir yetenek (Y) | 30 | – | – |
| 4 | Seviye 5'e ulaş | – | 60 | – | – |
| 5 | Kamp kur, bir gece ateşin başında bekle | Kamp ateşini (5 Dal + 3 Taş + 2 Kuru ot + 1 Çakmaktaşı) kur, gece yanında 60 sn dur | 60 | 30 | – |
| 6 | Adayı tanı | Haritanın %30'unu aç | 60 | 30 | – |
| 7 | Seviye 8 + 250'lik yetenek | – | 120 | – | – |
| 8 | 25 farklı tarif öğren | – | 150 | 50 | – |
| 9 | İlk tunç külçeni dök | Bakır ve Kalay cevherini kömür ya da turbayla eritip külçe yap; 3 Bakır külçesi + 1 Kalay külçesi → Tunç külçesi (el yapımı) | 150 | 240 | Bakır, Kalay, Tunç külçesi |
| 10 | Demir külçesi yap | 3 Demir cevheri (Bataklık) + 2 kömür/turba + 1 taş | 200 | 320 | Demir külçesi, Demir levha |
| 11 | Savunmanı 60'a çıkar | Tunç takım 50 eder; bir demir parça 60'ı geçirir | 200 | 240 | Tunç levha, Tunç miğfer, Tunç zırh, Timsah derisi zırh, Demir zırh |
| 12 | Doğu geçidini aç | 2 Kaya patlatıcı, kuvars ya da daha iyi kazma, kaya yığınının başında (Kayalık Dağ ↔ Kül Diyarı); patlama bütün sıradağı çökertir | 250 | 100 | Kaya patlatıcı |
| 13 | Kül Diyarı'nda lav kertenkelesi avla | 1 Lav kertenkelesi | 300 | 480 | Ateş çiçeği merhemi |
| 14 | Eşinden kalan bütün izleri bul | 6 iz | 300 | 600 | Gemi (görevden sonra) |

Toplam 2.020 sikke, 2.130 XP.

## Cadı Zümrüt

**Yer:** Ekin'in kampının yaklaşık 29 karo kuzeyinde, ormanın kıyısında, kazanının başında. **Tanışma:** öğreticinin 3. adımı.

- **Kazan:** bütün ACT 1 tariflerini kazanda öğrenirsin. Kazan eşya yapmaz; malzemeyi alır, tarifi öğretir (Zor modda "Dene").
- **Bilmece:** bilinmeyen bir tarifi ipucuyla sorar; o tarifi öğrenince 30 + 2 × fiyat sikke (Bilmece yeteneğiyle iki katı) ve 20 XP. 2 günden eski bilmece yenilenir.
- **Anı:** 2 Mor kıymık verirsen sıradaki anını geri getirir.
- **Kuzenler:** "Kuzenlerin var mı?" diye sorulabilir; beş kuzen cadıyı (Yakut, Safir, Firuze, Mercan, İnci) sayar. Onların kazanları da bütün tarifleri öğretir, yalnızca rengi farklıdır.
- Hikâyesi: kız kardeşi Ayşen. Hikâyesi bitince kendi sahnesi ("Ay otları") yerine ailenin ortak sahnesi bekler (v1.84; aşağıda "Zümrüt, Dursun ve Durmuş'un kuzenleri").

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Şifalı otlar | Getir: 3 Papatya, 3 Nane | – | 40 | 20 |
| 2 | Kazanın dili | 10 tarif öğren | – | 60 | 30 |
| 3 | Gece çiçeği | Getir: 2 Gece sefası | 3. günden sonra | 80 | 40 |
| 4 | Zehir bezesi | Getir: 2 Zehir bezesi | Seviye 6 | 160 | 60 |
| 5 | Mor kıymıklar | Getir: 3 Mor kıymık | 8. günden sonra | 220 | 80 |


## Pazarcı Nazlı

**Yer:** Ekin'in yaklaşık 30 karo doğusu, 51 karo kuzeyi, Çayır'da tezgâhının başında. **Tanışma:** öğreticinin 9. adımı.

- **Her şeyi satın alır.** Fiyat sabittir, çok satmak düşürmez. "Aletler, zırhlar, eşyalar hariç hepsini sat" ve "Kazanda işe yaramayanları sat" düğmeleri vardır.
- **Yalnızca doğal malzeme satar**, o da en az bir kez eline geçmiş olanları (yapılmış eşya satmaz). Alış fiyatı malzemenin değerinin kabaca 2,6–5,6 katıdır (pahalı ve tehlikeli bölgelerin malzemesi daha pahalı). 1'li ya da 10'lu alınır.
- Satış fiyatın bütün yeteneklerle en çok temel fiyatın 2,3 katına çıkar.
- Hikâyesi: kardeşi Cem.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Tezgâh için otlar | Getir: 4 Kekik, 4 Kuşburnu | – | 40 | 20 |
| 2 | Bereketli satış | Topla/say: 250 sikkelik satış | – | 60 | 30 |
| 3 | Kürk siparişi | Getir: 3 Tavşan derisi | – | 70 | 30 |
| 4 | Yabani bal | Getir: 2 Yabani bal | – | 90 | 40 |
| 5 | Kehribar | Getir: 1 Kehribar | köprü onarılınca | 150 | 60 |


## Savaşçı Börü

**Yer:** Ekin'in yaklaşık 62 karo doğusu, 36 karo kuzeyi. **Tanışma:** öğreticinin 11. adımı (yumruk dersi, kerevit; ardından ücretsiz **atılma dersi** ve yetenek ağacında Koşu'yu gösterir — ayrıntı "Oyunun akışı → Börü'nün atılma dersi").

- Atılmayı bilmeyen (öğreticiyi geçmiş) biri konuşunca atılma dersini ücretsiz teklif eder.
- 100 sikkeyi ilk kez bulunca "Börü: Koşu'yu alma vakti" bildirimi gelir (Koşu henüz alınmadıysa).

- "Kılıç nasıl yapılır?" → **Taş kılıç** tarifini yazar (1 Sopa + 4 Keskin taş + 2 İp + 1 Çakmaktaşı; Dursun döver).
- **Dövüş dersleri** (sikkeyle; ayrıntılar "Dövüş" bölümünde). Bir ders açılınca bir kez duyuru gelir. Öğrenilmiş dersler ücretsiz tekrar çalışılabilir. Ders sırasında Börü'den 280 pikselden uzağa gidersen oyun durur ve "Derse dön / Dersi bırak" diye sorar; "Derse dön" seni Börü'nün ~140 piksel yakınına koyar, bırakırsan ücret geri verilir.
- Hikâyesi: ağabeyi Kaan.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Kerevit avı | Avla: 2 Kerevit | – | 25 | 15 |
| 2 | Kapan ustası | Topla/say: 1 kapanla kerevit | köprü onarılınca | 60 | 30 |
| 3 | Domuz avı | Avla: 2 Yaban domuzu | – | 80 | 40 |
| 4 | Kurt sürüsü | Avla: 3 Kurt | Seviye 5 | 120 | 60 |
| 5 | Oklu kirpi | Avla: 1 Oklu kirpi | Seviye 8 | 200 | 80 |


> **Kerevit nerede?** "Kerevit avı" (1. görev) karada, Çayır'daki nehir kıyısında gezen kerevitleri ister: vurarak avlanır. "Kapan ustası" (2. görev) ise **balık kapanıyla** bir kerevit ister ve kapana kerevit **yalnızca Bataklık ve Kayalık Dağ sularında** girer (kapan her çekilişte 7 balıktan birini eşit ihtimalle seçer; bir boşaltmada yaklaşık %27 ihtimalle kerevit). Görevin "Nerede" satırı **Bataklık**'ı gösterir (v1.79; önceden yanlışlıkla Çayır diyordu). Çayır'ın nehrine kurulan kapandan kerevit gelmez.

## Demirci Dursun

**Yer:** Ekin'in yaklaşık 70 karo doğusu, 71 karo kuzeyi; ocak ve örs. **Tanışma:** öğreticinin 13. adımı (Börü'nün selamıyla).

- **Çekiç:** örse yaklaşık **1,1 saniyede bir** vurur (0,9 vuruş/sn; 1.89'a kadar 1,8 vuruş/sn idi). Her vuruşta kıvılcım çıkar; 110 px yakınındaysan ve menü/konuşma açık değilse çınlama sesi gelir. Silahçı kuzenleri de aynı hızda döver.

- **Alet dök:** yalnızca **Çayır malzemesiyle** yapılan aletleri ve silahları döver (kademe 0): taş, çakmaktaşı ve tunç baltalar/kazmalar/mızraklar/kılıçlar, bıçaklar, meşale, tırmık, tırpan, sulama kabı, balık kapanı, tuzak, sapan, olta, ağ… Granit, demir, kuvars, bazalt, obsidyen ve o biyomların malzemesiyle yapılanları **silahçı kuzenleri** döver (v1.84). Tarif kazanda öğrenilmiş, parçalar çantanda olmalı. İşçilik fiyatın %15'i. Elinde olan bir aleti ikinci kez dövmez.
- **Aletimi bile:** körelen aleti değerinin onda birine yeniler.
- Alet satmaz. Zırh için kardeşi Durmuş'a yollar. "Kuzenlerin var mı?" diye sorulunca beş silahçı kuzenini (Durdu, Ali, Kaya, Turan, Kudret) ve hangisinin neyi dövdüğünü anlatır.
- Hikâyesi: babası Demirhan Usta. Kendi sahnesi ("Gökten düşen taş") yerine ailenin ortak sahnesi oynar (v1.84).

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | İlk kılıç | Taş kılıcı örste döv | – | 40 | 20 |
| 2 | Kömür | Getir: 5 Taş kömürü | Seviye 4 | 70 | 30 |
| 3 | Tunç işçiliği | Tunç balta/kazma/kılıç/mızraktan birini döv | ilk tunç külçesi | 150 | 60 |
| 4 | Demir zamanı | Demir balta/kazma/kılıç/mızraktan birini dövdür (Dursun demiri dövemez: Bataklık'taki kuzeni Silahçı Ali ya da üstü döver) | ilk demir külçesi | 250 | 90 |


## Zırhçı Durmuş

**Yer:** Dursun'un hemen yanında, ikinci örs. **Tanışma:** öğretici bitince.

- Kademe 0 zırhları döver (v1.84): Tunç miğfer, zırh, eldiven, çizme ve ACT 2 malzemeleriyle yapılan Fırtına tüyü başlık, Mantar lifi eldiven, Hurda çizme, Kristal miğfer, Ejder pulu eldiven, Meka çizme. Demir zırhları Bataklık'taki kuzeni **Zırhçı Veli**, Ejder pulu zırhı Kül Diyarı'ndaki **Zırhçı Tufan** (ya da üstü) döver. İşçilik %15.
- "Kuzenlerin var mı?" diye sorulunca beş zırhçı kuzenini (Duran, Veli, Kayhan, Tufan, Kuvvet) sayar.
- Hikâyesi: babası Demirhan Usta (Dursun'la aynı). Kendi sahnesi ("Kumsaldaki çekiç") yerine ailenin ortak sahnesi oynar (v1.84).
- Deri, kürk ve kemik zırhlar elle yapılır (Tab).

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Başını koru | Başına bir şey giy | – | 30 | 80 |
| 2 | Kemik yığını | Getir: 6 Kemik | – | 40 | 80 |
| 3 | Tunç zırh | Tunç zırh dövdür | ilk tunç külçesi | 160 | 240 |
| 4 | Timsah derisi | Getir: 1 Timsah derisi | köprü onarılınca | 180 | 280 |


## Zümrüt, Dursun ve Durmuş'un kuzenleri (v1.84)

Çayır dışındaki her ACT 1 biyomunda bir **aile ocağı** vardır: bir **cadı** (kazancı), bir **silahçı** ve bir **zırhçı**. On beşi de Cadı Zümrüt, Demirci Dursun ve Zırhçı Durmuş'un kuzenidir; hepsi **Elmas Nine**'nin torunlarıdır. ACT 2'de kuzen yoktur (mor ışığın ACT 2'de kaçırdığı bir akrabaları yok).

- **Görünüş:** cadılar Zümrüt'le, silahçılar Dursun'la, zırhçılar Durmuş'la **birebir aynıdır** (ten, saç, sakal/bıyık, şapka, önlük, çekiç tutuşu, portre). Yalnızca **adları farklıdır**. Her biyomun silahçısıyla zırhçısı kardeştir (yan yana çalışırlar) ve Dursun/Durmuş gibi birbirine benzeyen adlar taşır.
- **Fark nerede:** cadıların **kazanındaki sıvının rengi** (adlarındaki değerli taşın rengi), demircilerin ise **çalışma yeri**: ocak, örs, çekiç ve askılar biyomdan biyoma daha iyi görünür (tablolar aşağıda). Renk farkı yalnız kazanda vardır; demircilerin hiçbir rengi değişmez.
- **Yer:** orijinaldeki gibi **dip dibe değiller**. Her biyomda iki kardeş demirci (silahçı + zırhçı) Dursun ile Durmuş gibi **aynı ocakta yan yana** çalışır; cadı ve kazanı ise **aynı biyomun başka bir köşesinde**, demircilerden uzakta yaşar (aralarında en az 200 piksel, aranan noktalar 70–120 karo ayrı). Yerler oyun açılırken bulunur: tabloda yazan noktaya en yakın, tamamı o biyomun yürünebilir toprağı olan açık alan (demirciler için 15 × 7, cadı için 9 × 7 karo) ve başka kişilere, köprüye, kaya yığınına en az 200 piksel uzak. Oradaki ağaçlar ve toplanabilirler kaldırılır. Keşfedilince haritada simgeleriyle (Zümrüt, Dursun, Durmuş simgesi) ve adlarıyla görünürler; haritada dokununca ok onları gösterir.
- **Ateş kuralı:** her kuzenin yanında **kendi kamp ateşi** yanar (cadının solunda, silahçının ve zırhçının sağ önünde). Kişilerin ateşleri gibi gece ışık verir ve çevresi (120 piksel) güvenlidir: saldırganlar uzaklaşır, mor ışık inmez. Kazanın altındaki ateş ve silahçının ocağı ayrıca ışık sayılır.
- **İlk konuşma:** kuzene ilk kez E ile yaklaşınca sırtı dönük ona, **bir önceki biyomdaki kuzeninin adıyla seslenirsin** (ör. Orman'daki cadıya "Zümrüt? Senin burada ne işin var?"). O da "Zümrüt mü?! Çayır'daki kuzenim Zümrüt'le tanışmışsın demek. Ben o değilim…" diye **kendini tanıtır**, kuzen olduklarını söyler ve **biraz kibirle** önceki kuzenini küçümseyip kendisinin daha iyi bir cadı/silahçı/zırhçı olduğunu anlatır. Önceki biyomun kuzeniyle henüz tanışmadıysan, tanıdığın en yakın önceki kuzenin adıyla seslenirsin (hiçbiri değilse Çayır'dakinin). "Kuzen misiniz gerçekten?" sorusuna Elmas Nine'den söz ederler.
- **İlk tanışmada** silahçı ve zırhçı kendine özel eşyaların tariflerini kitabına yazar ("Tarifi kitabında" bildirimi).
- **Konuşma menüsü:** cadı: Tarif öğren · "Kazanın neden …?" · görev/hikâye satırları · Hoşça kal. Silahçı: Silah dök · Aletimi bile · Ne dövebilirsin? · … Zırhçı: Zırh döv · Ne dövebilirsin? · … Konuşmalarındaki rastgele satırlar hep bir önceki kuzene laf sokar. Zümrüt, Dursun ve Durmuş'a da "Kuzenlerin var mı?" diye sorulabilir; kuzenlerini adlarıyla ve biyomlarıyla sayarlar.

### Aileler

| Biyom | Cadı (kazan rengi) | Silahçı | Zırhçı | Cadının aranan noktası (karo) | Demircilerin aranan noktası (karo) |
|---|---|---|---|---|---|
| Çayır (eski) | Cadı Zümrüt (yeşil) | Demirci Dursun | Zırhçı Durmuş | – | – |
| Orman | Cadı Yakut (kırmızı, `#d8283a`) | Silahçı Durdu | Zırhçı Duran | 60, 75 | 175, 170 |
| Bataklık | Cadı Safir (mavi, `#2a5ad8`) | Silahçı Ali | Zırhçı Veli | 300, 40 | 330, 120 |
| Kayalık Dağ | Cadı Firuze (turkuaz, `#2ec4b6`) | Silahçı Kaya | Zırhçı Kayhan | 390, 420 | 290, 300 |
| Kül Diyarı | Cadı Mercan (mercan, `#ff6f5e`) | Silahçı Turan | Zırhçı Tufan | 600, 420 | 520, 330 |
| Mor Kristal Vadisi | Cadı İnci (inci beyazı, `#efe9f7`) | Silahçı Kudret | Zırhçı Kuvvet | 600, 50 | 520, 120 |

### Kazancılar

Kuzen cadıların kazanı **Zümrüt'ün kazanıyla aynı mantıkta** çalışır: bütün ACT 1 tarifleri öğrenilir (Zor modda "Deneyerek bul" da), kazan eşya yapmaz, malzemeyi alıp tarifi öğretir (+12 XP). Kazan panelinin başlığında cadının adı yazar. Değişen tek şey sıvının ve buharın rengidir; cadının elindeki kepçeden sıçrayan damlalar da o renktedir. Zümrüt'ün bilmecesi ve anı geri getirmesi yalnızca Zümrüt'e özeldir.

### Silahçılar ve zırhçılar: kademe kuralı

- Her örsün bir **kademesi** vardır: Dursun ve Durmuş **0 (Çayır)**, Orman kuzenleri 1, Bataklık 2, Kayalık Dağ 3, Kül Diyarı 4, Mor Kristal Vadisi 5.
- Bir eşyanın kademesi, **ana malzemesinin** en erken toplanabildiği biyomdur: malzeme zincirinin içindeki her ham maddenin ilk çıktığı biyomlardan en ileridekidir. Tabaklanmış deri bu hesaba katılmaz (her zırhın astarıdır). ACT 2 malzemeli zırhlar (²) kademe 0 sayılır, Durmuş ve bütün zırhçılar döver.
- Bir demirci **kendi kademesindeki ve altındaki** bütün eşyaları döver; ayrıca **kendine özel** eşyaları vardır. Yani Dursun ile Durmuş yalnızca Çayır malzemesiyle (taş, çakmaktaşı, çakıl, bakır + kalay = tunç…) yapılanları döverken, bir sonraki biyomun kuzenleri o biyoma özgü silah ve zırhları da döver. Silahçılar alet ve silah, zırhçılar zırh döver.
- Örs panelinde, öğrendiğin ama o demircinin kademesini aşan eşyalar üstte bir notla listelenir: "… bunları dövemez: Demir kılıç → Silahçı Ali (Bataklık)". Kazanda bir örs tarifini öğrenince çıkan mesaj da onu dövebilen **ilk** demircinin adını söyler.
- İşçilik bütün kuzenlerde de fiyatın **%15**'i (en az 2). Silahçılar **Aletimi bile** de yapar (aletin değerinin onda biri).

| Kademe | Silahçı | Zırhçı | Dövülen (o kademenin eşyaları; alttakiler de dövülür) |
|---|---|---|---|
| 0 · Çayır | Demirci Dursun | Zırhçı Durmuş | Alet/silah: Ağ, Balık kapanı, Bola, Boynuz kazma, Dokuma tezgâhı, Kemik zıpkın, Kürek, Meşale, Mızrak, Olta, Sapan, Sulama kabı, Taş balta, Taş bıçak, Taş kazma, Taş kılıç, Tunç balta, Tunç kazma, Tunç kılıç, Tunç mızrak, Tuzak, Tırmık, Tırpan, Çakmaktaşı balta, Çakmaktaşı bıçak, Çakmaktaşı kazma, Çakmaktaşı kazıyıcı, Çakmaktaşı mızrak, Çekiç taşı. Zırh: Ejder pulu eldiven, Fırtına tüyü başlık, Hurda çizme, Kristal miğfer, Mantar lifi eldiven, Meka çizme, Tunç eldiven, Tunç miğfer, Tunç zırh, Tunç çizme |
| 1 · Orman | Silahçı Durdu | Zırhçı Duran | Alet/silah: Bileği taşı, Granit balta, Granit gürz, Granit kazma, Kemik iğne, Kirmen, Öğütme taşı. Zırh: Ceviz kabuğu miğfer, Meşe kabuk zırh |
| 2 · Bataklık | Silahçı Ali | Zırhçı Veli | Alet/silah: Demir balta, Demir kazma, Demir kılıç, Demir mızrak, Dişbudak yayı, Pişirme taşı, Timsah dişi kılıcı. Zırh: Bataklık çizmesi, Demir eldiven, Demir miğfer, Demir zırh, Demir çizme, Timsah pulu zırh |
| 3 · Kayalık Dağ | Silahçı Kaya | Zırhçı Kayhan | Alet/silah: Gümüş kılıç, Kuvars balta, Kuvars bıçak, Kuvars kazma, Kuvars kazıyıcı, Kuvars mızrak, Porsuk yayı. Zırh: Gümüş pullu zırh, Kartal tüyü miğfer |
| 4 · Kül Diyarı | Silahçı Turan | Zırhçı Tufan | Alet/silah: Bazalt balta, Bazalt bıçak, Bazalt kazma, Bazalt kazıyıcı, Bazalt mızrak, Ejder kılıcı, Lav camı kılıcı, Pirit çakmağı, Taş havan. Zırh: Akrep kabuğu çizme, Ejder pulu zırh, Kül böceği zırh |
| 5 · Mor Kristal Vadisi | Silahçı Kudret | Zırhçı Kuvvet | Alet/silah: Ametist kılıcı, Obsidyen balta, Obsidyen bıçak, Obsidyen kazma, Obsidyen kazıyıcı, Obsidyen mızrak. Zırh: Işık pulu eldiven, Kristal ipek zırh |

### Çalışma yerleri (görsel fark)

| Biyom | Silahçının ocağı ve örsü | Zırhçının örsü |
|---|---|---|
| Çayır (Dursun, Durmuş) | Gri taş ocak, küçük örs, küçük çekiç | Küçük örs, üstünde miğfer, askıda zincir zırh |
| Orman | Granit taşından ocak, kalın meşe kirişli baca; bir boy büyük örs, çelik başlı çekiç, yanında iki kılıçlık silah askısı. | Bir boy büyük örs, ahşap askıda demir çemberli kalkan ve miğfer. |
| Bataklık | Ocağın yanında deri körük ve su verme fıçısı; demir örs, koyu demir başlı ağır çekiç, askıda üç silah. | Demir örs, perçin tezgâhı ve tepeden tırnağa demir zırh giydirilmiş manken. |
| Kayalık Dağ | Taş ocağın ağzında gümüş kuşak; gümüş boynuzlu iri örs, gümüş bilezikli çekiç, dönen kuvars bileği çarkı. | Gümüş boynuzlu örs, iki askı: tüylü miğfer ve gümüş pullu zırh; gümüş bilezikli çekiç. |
| Kül Diyarı | Bazalttan ocak, içinde lav döner; kor gibi yanan yazılı kara örs, ucu kızgın balyoz, havada kıvılcımlar. | Kor yazılı kara örs, dikişleri kor gibi parlayan pullu zırh mankeni, ucu kızgın balyoz. |
| Mor Kristal Vadisi | Obsidyen ocakta mor kristal alev; ametist kakmalı obsidyen örs, başı parlayan ametist çekiç, havada süzülen kristal kıymıklar. | Ametist kakmalı obsidyen örs, ışıltılı kristal zırh mankeni, havada süzülen kristal kıymıklar. |

Çekiçler de kademeyle büyür: başı her biyomda biraz daha iri ve parlaktır; Kül Diyarı'nda ucu kızgın bir balyoz, Mor Kristal Vadisi'nde başı mor parlayan bir ametist çekiç olur. Çekiç örse inince sıçrayan kıvılcımların rengi de değişir (gümüş, kızıl, mor).

### Kuzenlere özel silahlar ve zırhlar

Hepsi kazanda öğrenilir (tarifi tanışınca kitaba yazılır) ve yalnızca o biyomun ya da daha ilerideki biyomun demircisi döver.

| Eşya | Tür | Değer | Malzemeler | Döven | Fiyat |
|---|---|---|---|---|---|
| Granit gürz | Kılıç (silah) | 27 hasar · 100 kullanım | 4 Granit, 1 Meşe sapı, 3 Yaban domuzu dişi, 1 Sinir kirişi | Silahçı Durdu (Orman) ve üstü | 112 |
| Meşe kabuk zırh | Zırh · Gövde | +30 savunma · direnç: kanama %15 | 3 Meşe kalası, 2 Tabaklanmış yaban domuzu derisi, 6 Kirpi dikeni, 1 Sinir kirişi | Zırhçı Duran (Orman) ve üstü | 543 |
| Ceviz kabuğu miğfer | Zırh · Baş | +15 savunma | 6 Ceviz, 1 Meşe kalası, 1 Tabaklanmış karaca derisi, 2 İri diken | Zırhçı Duran (Orman) ve üstü | 280 |
| Timsah dişi kılıcı | Kılıç (silah) | 38 hasar · 140 kullanım | 4 Demir külçesi, 3 Timsah dişi, 1 Bataklık servisi sapı, 1 Tabaklanmış su samuru derisi | Silahçı Ali (Bataklık) ve üstü | 1.011 |
| Timsah pulu zırh | Zırh · Gövde | +46 savunma · direnç: kanama %40, metal | 2 Demir levha, 3 Timsah derisi, 2 Bataklık kurdu postu, 1 Sinir kirişi | Zırhçı Veli (Bataklık) ve üstü | 1.177 |
| Bataklık çizmesi | Zırh · Ayak | +14 savunma · direnç: zehir %25, çamurda yavaşlatmaz | 1 Demir levha, 3 Su samuru derisi, 6 Kamış, 2 Turba | Zırhçı Veli (Bataklık) ve üstü | 479 |
| Gümüş kılıç | Kılıç (silah) | 44 hasar · 160 kullanım | 4 Gümüş külçesi, 3 Kuvars, 1 Ardıç sapı, 2 Kartal pençesi | Silahçı Kaya (Kayalık Dağ) ve üstü | 472 |
| Gümüş pullu zırh | Zırh · Gövde | +52 savunma · direnç: kanama %35, metal | 3 Gümüş külçesi, 3 Demir halka, 2 Tabaklanmış mağara ayısı derisi, 2 Ayı pençesi | Zırhçı Kayhan (Kayalık Dağ) ve üstü | 1.396 |
| Kartal tüyü miğfer | Zırh · Baş | +24 savunma · metal | 6 Kartal tüyü, 1 Gümüş külçesi, 2 Öküz boynuzu, 1 Tabaklanmış yaban öküzü derisi | Zırhçı Kayhan (Kayalık Dağ) ve üstü | 435 |
| Lav camı kılıcı | Kılıç (silah) | 55 hasar · 200 kullanım | 4 Lav camı, 3 Bazalt, 3 Demir külçesi, 1 Kızıl sedir sapı, 1 Ateş bezesi | Silahçı Turan (Kül Diyarı) ve üstü | 955 |
| Kül böceği zırh | Zırh · Gövde | +64 savunma · direnç: yanık %50, metal | 5 Kül böceği kabuğu, 2 Demir levha, 2 Kül kurdu postu, 2 Lav pulu | Zırhçı Tufan (Kül Diyarı) ve üstü | 1.736 |
| Akrep kabuğu çizme | Zırh · Ayak | +18 savunma · direnç: zehir %35 | 3 Akrep kabuğu, 1 Lav pulu, 1 Herhangi tabaklanmış deri, 1 Akrep iğnesi | Zırhçı Tufan (Kül Diyarı) ve üstü | 620 |
| Ametist kılıcı | Kılıç (silah) | 58 hasar · 240 kullanım | 5 Ametist, 3 Obsidyen, 2 Kristal, 1 Işık ağacı sapı, 2 Gölge dişi | Silahçı Kudret (Mor Kristal Vadisi) ve üstü | 763 |
| Kristal ipek zırh | Zırh · Gövde | +72 savunma · direnç: kanama %25, yanık %25, zehir %25 | 5 Kristal ipek, 3 Ametist, 2 Demir levha, 2 Tabaklanmış gölge postu | Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü | 2.554 |
| Işık pulu eldiven | Zırh · El | +18 savunma · direnç: zehir %35 | 4 Işık pulu, 2 Kristal, 1 Tabaklanmış işık tilkisi postu | Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü | 1.000 |

### Kuzenlerin görevleri

Her kuzenin 3 görevi vardır; hepsi **kendi biyomunda** bulunan bir şeyi ister (toplama, av ya da o biyomun malzemesiyle kendine özel eşyayı dövdürme). Kurallar diğer yan görevlerle aynı: mavi **!**, sarı **?**, Görevler defteri, "Nerede:" satırı. Dövme görevleri kabul edilince eşyanın tarifini kitabına yazar; eşya dövülmüş, çantada ya da üstünde ise tamamlanır.

#### Orman ailesi

| Kişi | # | Görev | İstenen | Sikke | XP |
|---|---|---|---|---|---|
| Cadı Yakut | 1 | Kırmızı demlik | Getir: 4 Kanlıca, 4 Isırgan | 90 | 60 |
| Cadı Yakut | 2 | Ormanın tatlısı | Getir: 2 Yabani bal, 5 Yaban mersini | 120 | 80 |
| Cadı Yakut | 3 | Engerek dili | Avla: 3 Engerek | 160 | 120 |
| Silahçı Durdu | 1 | Granit yığını | Getir: 6 Granit, 4 Taş kömürü | 100 | 70 |
| Silahçı Durdu | 2 | Domuz dişi | Getir: 4 Yaban domuzu dişi | 130 | 90 |
| Silahçı Durdu | 3 | Gürzün ağırlığı | Döv(dür): Granit gürz | 180 | 140 |
| Zırhçı Duran | 1 | Ceviz kabukları | Getir: 8 Ceviz | 90 | 60 |
| Zırhçı Duran | 2 | Karaca derisi | Getir: 3 Karaca derisi, 6 Kirpi dikeni | 130 | 90 |
| Zırhçı Duran | 3 | Kabuk zırh | Döv(dür): Meşe kabuk zırh | 180 | 140 |

#### Bataklık ailesi

| Kişi | # | Görev | İstenen | Sikke | XP |
|---|---|---|---|---|---|
| Cadı Safir | 1 | Mavi demlik | Getir: 4 Nilüfer, 4 Su teresi | 150 | 160 |
| Cadı Safir | 2 | Sinek mantarı | Getir: 4 Sinek mantarı, 3 Turba | 180 | 200 |
| Cadı Safir | 3 | Kurbağa gözü | Getir: 3 Kurbağa | 220 | 260 |
| Silahçı Ali | 1 | Demir damarı | Getir: 6 Demir cevheri | 160 | 180 |
| Silahçı Ali | 2 | Timsahın dişi | Getir: 3 Timsah dişi | 220 | 260 |
| Silahçı Ali | 3 | Dişli kılıç | Döv(dür): Timsah dişi kılıcı | 280 | 340 |
| Zırhçı Veli | 1 | Arduvaz | Getir: 5 Arduvaz, 3 Tuz kayası | 150 | 160 |
| Zırhçı Veli | 2 | Samur ve kurt | Getir: 3 Su samuru derisi, 2 Bataklık kurdu postu | 220 | 260 |
| Zırhçı Veli | 3 | Pullu zırh | Döv(dür): Timsah pulu zırh | 280 | 340 |

#### Kayalık Dağ ailesi

| Kişi | # | Görev | İstenen | Sikke | XP |
|---|---|---|---|---|---|
| Cadı Firuze | 1 | Turkuaz demlik | Getir: 3 Kardelen, 4 Lavanta | 220 | 260 |
| Cadı Firuze | 2 | Liken ve kav | Getir: 5 Liken, 4 Kav mantarı | 260 | 320 |
| Cadı Firuze | 3 | Kartalın tüyü | Getir: 4 Kartal tüyü | 320 | 420 |
| Silahçı Kaya | 1 | Kuvars ve gümüş | Getir: 6 Kuvars, 4 Gümüş cevheri | 240 | 300 |
| Silahçı Kaya | 2 | Vaşak | Avla: 1 Vaşak | 320 | 420 |
| Silahçı Kaya | 3 | Gümüşün sesi | Döv(dür): Gümüş kılıç | 380 | 500 |
| Zırhçı Kayhan | 1 | Öküz derisi | Getir: 2 Yaban öküzü derisi, 2 Öküz boynuzu | 240 | 300 |
| Zırhçı Kayhan | 2 | Ayı pençesi | Getir: 3 Ayı pençesi | 320 | 420 |
| Zırhçı Kayhan | 3 | Gümüş pullar | Döv(dür): Gümüş pullu zırh | 380 | 500 |

#### Kül Diyarı ailesi

| Kişi | # | Görev | İstenen | Sikke | XP |
|---|---|---|---|---|---|
| Cadı Mercan | 1 | Mercan demlik | Getir: 5 Ateş çiçeği, 3 Kor otu | 320 | 480 |
| Cadı Mercan | 2 | Duman ve kök | Getir: 3 Duman çiçeği, 3 Yanık kök | 380 | 560 |
| Cadı Mercan | 3 | Kül cini | Avla: 2 Kül cini | 460 | 700 |
| Silahçı Turan | 1 | Bazalt ve kükürt | Getir: 6 Bazalt, 4 Kükürt | 340 | 500 |
| Silahçı Turan | 2 | Akrep avı | Avla: 2 Ateş akrebi | 440 | 680 |
| Silahçı Turan | 3 | Lavın kenarı | Döv(dür): Lav camı kılıcı | 520 | 800 |
| Zırhçı Tufan | 1 | Böcek kabuğu | Getir: 4 Kül böceği kabuğu | 340 | 500 |
| Zırhçı Tufan | 2 | Kül kurtları | Avla: 3 Kül kurdu | 440 | 680 |
| Zırhçı Tufan | 3 | Kül zırhı | Döv(dür): Kül böceği zırh | 520 | 800 |

#### Mor Kristal Vadisi ailesi

| Kişi | # | Görev | İstenen | Sikke | XP |
|---|---|---|---|---|---|
| Cadı İnci | 1 | İnci demlik | Getir: 3 Ay otu, 3 Yıldız çiçeği | 450 | 700 |
| Cadı İnci | 2 | Güve tozu | Getir: 6 Güve tozu | 520 | 800 |
| Cadı İnci | 3 | Işık tozu | Getir: 3 Işık tozu, 2 Kristal çiçeği | 600 | 950 |
| Silahçı Kudret | 1 | Obsidyen ve ametist | Getir: 6 Obsidyen, 3 Ametist | 480 | 750 |
| Silahçı Kudret | 2 | Gölgenin dişi | Getir: 3 Gölge dişi | 560 | 900 |
| Silahçı Kudret | 3 | Mor kılıç | Döv(dür): Ametist kılıcı | 700 | 1.100 |
| Zırhçı Kuvvet | 1 | Örümcek ağı | Avla: 2 Kristal örümcek | 520 | 800 |
| Zırhçı Kuvvet | 2 | Işık pulları | Getir: 4 Işık pulu | 560 | 900 |
| Zırhçı Kuvvet | 3 | Kristal zırh | Döv(dür): Kristal ipek zırh | 700 | 1.100 |

Toplam 45 görev, 14.570 sikke, 20.150 XP.

### Hikâyeler ve ailenin sahnesi

- Her kuzenin hikâyesi 3 parçadır (her görev bir parça açar, "📖 Sen bu adaya nasıl geldin?"). Kitap › Ada halkı'nda "Ninesi Elmas" olarak görünürler. Parçalar Elmas Nine'yi, her kazanın ve örsün dibindeki **elmas mührü** ve "ateşin dumanını izleyen beni bulur" sözünü ipucu olarak verir.
- **Ara sahne koşulu değişti:** Zümrüt, Dursun ve Durmuş'un kendi "O geceyi anlat" sahneleri (Ay otları, Gökten düşen taş, Kumsaldaki çekiç) kaldırıldı. Bu üçü ve 15 kuzen için **tek bir ortak sahne** vardır: **18 kişinin bütün görevleri** (Zümrüt 5, Dursun 4, Durmuş 4, kuzenler 45 = 58 görev) bitince, son görevi teslim ettikten birkaç saniye sonra (konuşma ve panel kapalıyken) kendiliğinden oynar. Kaçırılırsa ya da tekrar izlemek istenirse ailenin hikâyesini sonuna kadar dinlemiş herhangi biriyle konuşunca "📖 O geceyi anlat" çıkar; Kitap › Ada halkı'nda da tekrar izlenir.
- Sahne: **Elmas Nine · Ocak ile kazan** (+300 XP, bir kez). Önce bugün: on sekiz kuzen Zümrüt'ün kazanının başında, aynı ateşin çevresinde; kazanlarda ve örslerde aynı elmas mühür. Sonra yıllar önce: dağ başındaki evde Elmas Nine, elinde kepçe ve çekiç; mor ışık bacadan iner ve onu alır. Sonra yine bugün: ışığın sonradan aldığı Ayşen ve Demirhan Usta da onun izini sürmüştü; torunların hepsi bu adaya ninelerinin dumanını izleyerek gelmiştir. **Mor ışık bu ailenin ortak akrabasını, Elmas Nine'yi kaçırmıştır.**

| # | Satır |
|---|---|
| 1 | Bir gece, Zümrüt'ün kazanının başında. Adanın dört bir yanından on sekiz kuzen ilk kez aynı ateşin çevresinde. |
| 2 | <b>Zümrüt</b>: “Kazanımın dibinde bir mühür var: küçücük bir <b>elmas</b>.” <b>Dursun</b>: “Benim örsümde de.” Birer birer baktılar: bütün kazanlar, bütün örsler aynı mührü taşıyordu. |
| 3 | Yıllar önce, dağ başında bir ev. Bir elinde kepçe, bir elinde çekiç: <b>Elmas Nine</b>. Kızlarına kazanı, oğullarına örsü bırakan kadın. |
| 4 | <b>Elmas Nine</b>: “Kazanı da örsü de söndürmeyin. Ateşin dumanını izleyen beni bulur.” Bacadan mor bir ışık doldu; kepçe ile çekiç ocağın taşına düştü. |
| 5 | Işık önce Elmas Nine'yi, yıllar sonra da onun izini sürenleri aldı: Ayşen'i, Demirhan Usta'yı. On sekiz torunun hiçbiri bu adaya tesadüfen gelmemişti; hepsi ninelerinin dumanını izlemişti. |
| 6 | <b>Dursun</b>: “Ninemizi o gemiden geri alacağız. Hepimiz.” O gece adadaki on sekiz ocak aynı anda harladı. |


## Çiftçi Hasan

**Yer:** adanın batısında, Orman'daki 4 × 3'lük tarlanın batı ucu. **Tanışma:** her zaman.

Aletleri fırtınada denize gitmiş. Tarlayı kullanmak için ona sırayla dört alet getirirsin (aleti almaz, görüp onaylar; her adım +10 XP):

| Getirdiğin | Verdiği tohum | Sikke | Kitabına yazdığı |
|---|---|---|---|
| (ilk konuşma) | – | – | Tırmık |
| Tırmık | 4 Buğday tohumu | 15 | Sulama kabı |
| Sulama kabı | 2 Havuç tohumu | 20 | Tırpan |
| Tırpan | 2 Patates + 2 Soğan tohumu | 40 | Taş kazma |
| Taş kazma (adıyla; daha iyi kazma sayılmaz) | 2 Kabak + 2 Ayçiçeği tohumu | 60 | – |

**Tarla:** tırmıkla toprağı hazırla → tohum ek → sulama kabıyla sula → olgunlaşınca tırpanla biç. Büyüme: Buğday 60 sn, Havuç 80, Soğan 90, Patates 100, Ayçiçeği 120, Kabak 150. Hasatta %45 ihtimalle 1 tohum geri gelir. Hasan tohum satmaz.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | İlk hasat | Getir: 5 Buğday | dört alet tamamlanınca | 60 | 30 |
| 2 | Sebze sepeti | Getir: 3 Havuç, 3 Soğan | dört alet tamamlanınca | 80 | 40 |
| 3 | Ayçiçeği tarlası | Getir: 2 Ayçiçeği | dört alet tamamlanınca | 100 | 40 |


## Usta Kemal

**Yer:** kuzeybatıda, tezgâhı ve kereste yığınının başında. **Tanışma:** her zaman; ilk konuşmada **Hasır yatak** hediye eder.

- Yere kurulan yapıları (Yapılar kategorisi), yatakları ve **ev eşyalarını** (evin içine konur) yapar. Tarif kazanda öğrenilmiş, malzeme çantanda olmalı. İşçilik %20.
- **Atölye:** yere kurulur, seçtiğin bir tarifi 25 saniyede bir kendiliğinden üretir (en çok 50 tane biriktirir).
- Hikâyesi: kızı Hatice.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Atölye kur | Atölye kur | – | 80 | 40 |
| 2 | Kalas | Getir: 6 Herhangi kalas | – | 70 | 30 |
| 3 | Çit | Çit kur | – | 40 | 20 |


## Marangoz Rıza

**Yer:** Ekin'in yaklaşık 34 karo batısı, 22 karo kuzeyi. **Tanışma:** her zaman.

- **Ev ve barınak yapar** (sikkeyle). Yaprak barınağı dışındaki evlerde uyumak için içine yatak konmalıdır (Kemal yapar). Taş ev Ekin'in yanındaki arsaya kurulur. Fiyatlar için "Evler ve barınaklar" tablosuna bak (oyunda gösterilen fiyat, alt fiyat kuralı yüzünden listeden yüksek olabilir).
- Yaprak barınağı görevi açıkken malzemeler (8 Dal, 12 Yaprak, 4 Lif) çantandaysa konuşma doğrudan siparişler listesini açar.
- Hikâyesi: nişanlısı Defne.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Yaprak barınağı | Yaprak barınağı yaptır ve gece içinde uyu | – | 40 | 20 |
| 2 | Odun stoku | Getir: 20 Herhangi odun | – | 80 | 30 |
| 3 | Kalıcı bir ev | Kalıcı bir ev kur (yaprak barınağı sayılmaz) | – | 120 | 50 |


## Avcı Toygar

**Yer:** Bataklık'ta, köprünün doğu ucundan yaklaşık 26 karo doğuda, kulübesinin yanında. **Tanışma:** köprüyü onarıp karşıya geçince.

- İlk konuşmada **Kamış çizme** (6 Kamış + 3 İp + 2 Yosun; bataklık çamurunda yavaşlamayı önler) ve **Panzehir** (3 Bataklık otu + 1 Zehir bezesi + 2 Su) tariflerini yazar.
- Demir madeni, Kara ejder ve mor ışık hakkında bilgi verir; eşinin kaçırılışını gördüğünü anlatır.
- Hikâyesi: oğlu Ayaz.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Çamur yürüyüşü | Kamış çizme yap | – | 50 | 80 |
| 2 | Kurbağa zehri | Avla: 3 Zehirli kurbağa | – | 120 | 200 |
| 3 | Bataklık kurdu | Avla: 2 Bataklık kurdu | – | 180 | 280 |
| 4 | Timsah | Avla: 1 Timsah | – | 260 | 400 |


## Tüccar Nuri, Yıldızsız Gezgin, Yıldızsız Işıkçı

Takvime bağlı gezginler; ne zaman geldikleri ve ne yaptıkları "Oyunun akışı → Gezginler ve takvim" tablosunda.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Nuri'nin ilk siparişi | Nuri'nin ilk siparişini teslim et | – | 0 | 15 |


## Denizci Levent

**Yer:** Gemi tarifini öğrenince Mor Kristal Vadisi kıyısına düşen enkazın başında. ACT 2'de seni indirdiği kıyıda bekler. Kızı Meltem'i kaybetmiştir; yeni gemiye onun adını verir.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Kazazedenin yarası | Getir: 1 Kardelen merhemi, 2 Ay otu | – | 400 | 600 |
| 2 | Enkazın bekçileri | Avla: 2 Gölge kurdu | – | 600 | 1.000 |
| 3 | Yıldızlarla yön | Getir: 2 Ay taşı, 4 Kristal | – | 500 | 800 |
| 4 | Yeni bir gemi | Getir: 8 Herhangi kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek | – | 0 | 2.000 |


Son görev (Yeni bir gemi) bitince Levent'le konuş: hikâye sahnesi, ardından "Götür beni" → deniz yolculuğu (yaklaşık 14 sn) → **ACT 2**.


# ACT 2 · İkinci ada

## Geçiş ve portallar

- **İlk geçiş deniz yoluyla olur.** ACT 1'in sonunda Denizci Levent'in "Yeni bir gemi" görevi bitince gemiyle ikinci adaya açılırsın. Levent seni karaya çıkardığı kıyıda bekler.
- **Gökbilimci Ülker** iniş yerinin biraz kuzeyinde, Yüzen Kayalar'da yüksek bir kayanın üstündedir. Teleskobu ve **ACT 2 kazanı** onun yanındadır: ikinci adanın bütün tarifleri burada öğrenilir (birinci adadaki Zümrüt'ün kazanıyla aynı çalışır).
- **Portallar:** ikinci adaya ilk varışta **Levent'in yanındaki portal** ve birinci adada **Ekin'in yanındaki portal** açılır (v1.76). Ülker'in üç görevi bitince ("Portal çekirdeği" ile) bütün portallar açılır. Birinci adada **her kişinin yanında** bir portal belirir (Ekin, Zümrüt, Nazlı, Dursun, Hasan, Kemal, Börü, Rıza, Toygar): kişinin sağ yanında, ama hiçbir zaman kazanın, örsün, tezgâhın önünde ya da **Hasan'ın tarlasının içinde** değil (tarla parsellerine en az 26 piksel uzak; v1.79). İkinci adada iki portal vardır: **Ülker'in yanında** ve **Levent'in yanında**. Portaldan geçmek ücretsizdir; geçiş kaydeder, sayfayı yeniden yükler ve öbür adayı hazırlar.
- **İkinci adada birinci adanın kişileri yoktur.** Satış (Nazlı), alet bileme ve örs (Dursun, Durmuş), ev işleri (Kemal, Rıza) ve tarla için portaldan birinci adaya dönülür. Envanter ve sikke ortak olduğu için bir sorun çıkmaz.
- İkinci adada köprü ve Doğu geçidi gibi engeller yoktur; her yere yürünür. Ama canavarlar çok güçlüdür (ACT 2 canavarları ACT 1'in en güçlülerinden de güçlüdür, aşağıdaki tablolara bak).

## Mor mana, asalar ve ateşli silahlar

**Mor mana** ikinci adada (ya da ilk mana iksirini içince) açılan yeni bir çubuktur.

- En çok mana: **100 + 3 × (seviye − 1)**. Kendiliğinden saniyede yaklaşık **1,5** dolar (Canlılık yemek etkisiyle 1,5 katı); **elde bir asa varken saniyede +8** daha.
- **Mana iksiri** içince +60 mana. Tarifi Pervin'in ilk görevinden sonra kitaba yazılır; Pervin 10 sikkeye yapar.
- **Asa** bir alettir: alet yuvasına konur, ele alınır; saldırı tuşu (sol tık / Boşluk / Vur düğmesi) büyüyü fırlatır, en yakın düşmana nişan alır.

| Silah | Kim yapar | Bir atış | Hasar | Bekleme | Menzil | Özel etki |
|---|---|---|---|---|---|---|
| Ateş asası ² | Büyücü Pervin (100 sikke) | 8 mana | 42 (+%3 / seviye) | 0,55 sn | 270 | yanık |
| Buz asası ² | Büyücü Pervin (200 sikke) | 10 mana | 46 (+%3 / seviye) | 0,7 sn | 280 | 3 sn dondurur (reislerde yarısı) |
| Yıldırım asası ² | Büyücü Pervin (300 sikke) | 15 mana | 72 (+%3 / seviye) | 0,8 sn | 300 | 3 kez sıçrar, her sıçramada %80 hasar |
| Tabanca ² | Silahçı Tamer (200 sikke) | 1 Tabanca mermisi | 44 | 0,42 sn | 340 | düz atış |
| Pompalı ² | Silahçı Tamer (400 sikke) | 1 Pompalı fişeği | 5 saçma × 24 | 1,05 sn | 210 | yelpaze |
| Işın kılıcı ² | Ejder Avcısı Alara (800 sikke) | – | 60 (yakın dövüş) | – | kılıç | körelmez |

- **Mermi:** Tabanca mermisi (1 Pirinç külçesi + 1 Barut) bir yapımda **10 tane**, Pompalı fişeği (1 Pirinç külçesi + 2 Barut) bir yapımda **6 tane** çıkar. İkisi de el yapımıdır (Tab).
- **Meka zırh** ² (Mühendis Selin, 600 sikke): gövde yuvası, **+90 savunma**, zehir/yanık/kanama hasarının yarısını tutar.
- Asalar, silahlar ve ışın kılıcı körelmez (dayanıklılık 999).

## ACT 2 ustaları nasıl çalışır

Bütün ACT 2 ustaları aynı kuralla çalışır:

1. Ustanın görevini yaparsın → tarif **kitabına yazılır** (oyunda "Tarifi kitabında" bildirimi çıkar).
2. Tarifi **Ülker'in kazanında öğrenirsin** (malzemeleri kazana at, "Öğren").
3. Malzemeleri çantana koyup ustayla konuşursun → "✦ … yap (N sikke)" seçeneği. ✦ = her şey hazır, · = bir eksik var. Usta malzemeyi ve işçilik ücretini alır, eşyayı verir.

| Usta | Nerede | Yaptıkları | Tarifleri hangi görev açar |
|---|---|---|---|
| Gökbilimci Ülker | Yüzen Kayalar, inişin kuzeyinde yüksek kaya | ACT 2 kazanı (tarif öğretir), portallar | — |
| Büyücü Pervin | Dev Mantar Ormanı (inişe en yakın mantar ormanı köşesi) | Ateş/Buz/Yıldırım asası, Mana iksiri | Mana iksiri: pv1 · Ateş asası: pv3 · Buz asası: pv4 · Yıldırım asası: pv5 |
| Silahçı Tamer | Hurda Çölü | Tabanca, Pompalı | Pirinç külçesi + Barut: sl1 · Tabanca + mermi: sl3 · Pompalı + fişek: sl4 |
| Mühendis Selin | Kristal Golem Ocağı | Meka zırh | Kobalt/Titanyum külçesi + Enerji hücresi: mk1 · Meka zırh: mk3 |
| Ejder Avcısı Alara | Ejder Volkanı | Işın kılıcı | Plazma hücresi: ej1 · Işın kılıcı: ej3 |
| Astronot Tuna | Gök Rıhtımı (adanın en uzak ucu) | Roket gövdesi, Roket motoru, Roket | Meteor demiri + Yıldız külçesi: as1 · Roket parçaları: as4 |

## ACT 2'nin akışı

1. Gemiyle in, **Ülker** ile tanış (bütün ACT 2 kişileri v1.77'den beri haritada simgeleriyle görünür). Ülker'in 3 görevi: teleskobun ayağı (4 kalas + 2 halat), bir gece gözlem, portal çekirdeği (2 Kristal + 2 Demir levha + 2 Mor kıymık; bunlar birinci adadan). Bitince portallar açılır ve ilk ACT 2 anısı ("Sahildeki ışık") gelir.
2. **Pervin** (Dev Mantar Ormanı): mor mana ve ilk asa. 5 görev; 4. ve 5. görevi Selin ve Alara ile tanışınca açılır.
3. **Tamer** (Hurda Çölü): tabanca ve pompalı. 4 görev.
4. **Selin** (Kristal Golem Ocağı): meka zırh. 3 görev.
5. **Alara** (Ejder Volkanı): ışın kılıcı. 4 görev; sonuncusu **Kızıl ejder** (9.360 canlı).
6. **Tuna** (Gök Rıhtımı): 5 görev; göktaşları, uzaylı dronları, gölge muhafızlar, **Gök bekçisi** ve **Roket**. Roket bitince Tuna ile konuşup **Fırlat!** → fırlatma sahnesi → mor gemi → eşinle kavuşma → son kartı ("Yeniden birliktesiniz. Hikâye ACT 3 ile devam edecek."). Son karttan sonra oyuna devam edebilirsin; Tuna'dan yeniden fırlatılabilir.

Ustaların görevleri bittikçe eşinin **ACT 2 anıları** sırayla geri gelir: Sahildeki ışık (gk3), Yıldızsız yolcular (pv3), Şapka (sl4), Mor gemi (mk3), Son söz (ej4).


> **Not (v2.11):** ikinci adada da harita seyreltildi (kuralı ACT 1 → Adanın yerleşimi → Haritadaki miktarlar). Bu bölümdeki "Adadaki sayısı" sütunları **seyreltmeden önce** ölçüldü: temel malzemeler bugün yaklaşık yarısı, bitkiler yaklaşık %60'ı kadar.

## Yüzen Kayalar — Güvenli

İniş yeri. Havada duran kayalar, bulut koyunları, rüzgâr kuşları. Gökbilimci Ülker ve ACT 2 kazanı burada. Gece gök tazıları çıkar.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Gök söğüdü | Gök söğüdü odunu | 16 | – | 1. kademe (Taş balta) |
| Rüzgâr meşesi | Rüzgâr meşesi odunu | 18 | – | 1. kademe (Taş balta) |
| Bulut çamı | Bulut çamı odunu | 14 | – | 1. kademe (Taş balta) |
| Bulut elması | Bulut elması odunu | 16 | Bulut elması | 1. kademe (Taş balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Bulut pamuğu | 12 | 68 | 45 sn sonra yeniden çıkar |
| Gök kumu | 10 | 68 | 60 sn sonra yeniden çıkar |
| Gök mantarı | 18 | 68 | 60 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk) |
| Gök otu | 14 | 68 | 50 sn sonra yeniden çıkar |
| Rüzgâr çiçeği | 16 | 68 | 55 sn sonra yeniden çıkar |
| Rüzgâr kristali | 40 | 68 | 110 sn sonra yeniden çıkar |
| Tüy yosunu | 10 | 68 | 45 sn sonra yeniden çıkar |
| Yüzer taş | 30 | 68 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Bulut kuvarsı | 34 | 2. kademe (Çakmaktaşı/Granit kazma) | 22 | 300 sn sonra yeniden çıkar |
| Gök demiri | 30 | 2. kademe (Çakmaktaşı/Granit kazma) | 22 | 300 sn sonra yeniden çıkar |
| Hafif taş | 12 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Bulut koyunu | nötr | 1.200 | 216 | 40 | 116 | sürü 2–4 | Bulut koyunu eti %100; Bulut yünü %90 ×1–3 |
| Rüzgâr kuşu | zararsız | 20 | – | 70 | 15 | uçar | Rüzgâr tüyü %100 ×1–3; Rüzgâr kuşu eti %80 |
| Kaya kertenkelesi | nötr | 1.200 | 216 | 50 | 114 | – | Kertenkele pulu %90 ×1–2; Kertenkele eti %80 |
| Gök tazısı | saldırgan | 2.940 | 427 | 110 | 450 | gece, kanama etkisi, sürü 2–3 | Gök tazısı postu %85; Tazı dişi %60 ×1–2 |
| Fırtına kartalı | saldırgan | 2.570 | 477 | 100 | 515 | uçar | Fırtına tüyü %90 ×1–3; Kartal pençesi %50 ×1–2 |

## Dev Mantar Ormanı — Güvenli

Dev mantarlar ve spor ağaçları. Goblinler grup halinde gezer, okçuları uzaktan atar, şamanları zehirler. Büyücü Pervin burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Mavi mantar | Mavi mantar odunu | 22 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Spor ağacı | Spor ağacı odunu | 24 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Dev mantar | Dev mantar odunu | 20 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Kök ağacı | Kök ağacı odunu | 20 | Goblin eriği | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Büyü otu | 26 | 68 | 70 sn sonra yeniden çıkar |
| Dev spor | 28 | 68 | 80 sn sonra yeniden çıkar |
| Goblin otu | 12 | 68 | 50 sn sonra yeniden çıkar |
| Işıldak mantarı | 20 | 68 | 60 sn sonra yeniden çıkar |
| Kök yumrusu | 14 | 68 | 50 sn sonra yeniden çıkar, çiğ yenir (+5 tokluk) |
| Mantar şapkası | 16 | 68 | 55 sn sonra yeniden çıkar, çiğ yenir (+3 tokluk) |
| Spor tozu | 14 | 68 | 50 sn sonra yeniden çıkar |
| Sümük yosunu | 14 | 68 | 55 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Goblin bakırı | 16 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |
| Kök taşı | 12 | 1. kademe (Taş kazma) | 22 | 300 sn sonra yeniden çıkar |
| Spor kristali | 40 | 2. kademe (Çakmaktaşı/Granit kazma) | 22 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Mantar böceği | zararsız | 40 | – | 30 | 17 | – | Böcek kabuğu %90 ×1–2; Spor tozu %100 ×1–2 |
| Spor salyangozu | nötr | 1.280 | 232 | 18 | 97 | – | Salyangoz sümüğü %90 ×1–2 |
| Goblin | saldırgan | 2.580 | 343 | 80 | 364 | sürü 2–4 | Goblin kulağı %80; Goblin bıçağı %40 |
| Goblin okçusu | saldırgan | 2.005 | 286 | 70 | 409 | uzaktan atar (200 menzil, 1 atış) | Goblin oku %80 ×1–3; Goblin kulağı %60 |
| Goblin şamanı | saldırgan | 3.725 | 477 | 60 | 727 | uzaktan atar (210 menzil, 3 atış), zehir etkisi | Şaman tüyü %60 ×1–2; Büyü otu %80 ×1–2 |
| Mantar geyiği | nötr | 1.800 | 330 | 62 | 152 | – | Geyik eti %100 ×1–2; Geyik derisi %80; Geyik boynuzu %40; Sinir %50 ×1–2; Kemik %50 ×1–2; Hayvan yağı %30 |

## Hurda Çölü — Tehlikeli

Geminin düşürdüğü dronların hurda çölü. Devriye robotları, lazer dronları ve dev bir hurda devi. Silahçı Tamer burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Pas ağacı | Pas ağacı odunu | 24 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Hurda palmiyesi | Hurda palmiyesi odunu | 22 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Kuru çınar | Kuru çınar odunu | 24 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Hurma | Hurma odunu | 22 | Hurma | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Bakır tel | 14 | 68 | 55 sn sonra yeniden çıkar |
| Çöl otu | 8 | 68 | 45 sn sonra yeniden çıkar |
| Eski devre | 30 | 68 | 90 sn sonra yeniden çıkar |
| Hurda parçası | 10 | 68 | 45 sn sonra yeniden çıkar |
| Kaktüs meyvesi | 12 | 68 | 60 sn sonra yeniden çıkar |
| Pas tozu | 8 | 68 | 45 sn sonra yeniden çıkar |
| Vida | 8 | 68 | 50 sn sonra yeniden çıkar |
| Yağ birikintisi | 14 | 68 | 70 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Barut kayası | 22 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |
| Hurda yığını | 10 | 1. kademe (Taş kazma) | 20 | 300 sn sonra yeniden çıkar |
| Pirinç cevheri | 24 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Pas böceği | zararsız | 50 | – | 34 | 19 | – | Dişli %90 ×1–2; Pas tozu %100 ×1–2 |
| Hurda faresi | nötr | 1.320 | 311 | 70 | 96 | – | Bakır tel %80 ×1–2; Vida %90 ×1–3 |
| Devriye robotu | saldırgan | 2.080 | 445 | 70 | 428 | sürü 1–2 | Robot çekirdeği %70; Dişli %90 ×1–3 |
| Lazer dronu | saldırgan | 1.300 | 355 | 90 | 458 | uçar, uzaktan atar (220 menzil, 1 atış) | Lens %60; Pil %70 |
| Hurda devi | saldırgan | 5.940 | 1.038 | 34 | 1.282 | – | Motor %80; Ağır plaka %90 ×1–2 |
| Pas kirpisi | nötr | 1.300 | 260 | 30 | 130 | uzaktan atar (140 menzil, 3 atış) | Kirpi dikeni %100 ×2–4; Kemik %30 |

## Kristal Golem Ocağı — Tehlikeli

Kristal kayalıklar. Golemcikler, kristal yarasaları ve büyük golem. Mühendis Selin burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kristal çam | Kristal çam odunu | 30 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Taş ağacı | Taş ağacı odunu | 30 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Mavi sedir | Mavi sedir odunu | 32 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Kristal armut | Kristal armut odunu | 28 | Kristal armut | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Buz kristali | 36 | 68 | 90 sn sonra yeniden çıkar |
| Enerji taşı | 44 | 68 | 100 sn sonra yeniden çıkar |
| Golem tozu | 14 | 68 | 50 sn sonra yeniden çıkar |
| Gümüş kum | 14 | 68 | 60 sn sonra yeniden çıkar |
| Kaya çiçeği | 20 | 68 | 60 sn sonra yeniden çıkar |
| Kristal lifi | 18 | 68 | 60 sn sonra yeniden çıkar |
| Kristal mantarı | 24 | 68 | 70 sn sonra yeniden çıkar |
| Mavi yosun | 14 | 68 | 50 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Kobalt cevheri | 44 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Kristal cevheri | 34 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |
| Titanyum cevheri | 52 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Taş kaplumbağası | nötr | 1.680 | 630 | 16 | 108 | – | Taş kabuk %90 |
| Buz tavşanı | zararsız | 30 | – | 66 | 17 | – | Buz tavşanı eti %100; Buz kürkü %80 |
| Kristal golemcik | saldırgan | 2.520 | 983 | 46 | 499 | sürü 1–2 | Golem parçası %90 ×1–3; Enerji taşı %40 |
| Kristal yarasası | saldırgan | 1.470 | 771 | 120 | 488 | uçar, kanama etkisi | Kristal kanat %80 ×1–2 |
| Büyük golem | saldırgan | 7.560 | 2.524 | 28 | 1.490 | – | Golem çekirdeği %70; Titanyum plaka %90 ×1–2 |
| Buz karacası | nötr | 2.600 | 760 | 66 | 184 | – | Karaca eti %100 ×1–2; Karaca derisi %80; Kemik %50; Sinir %40 |

## Ejder Volkanı — Ölümcül

Kızıl volkan. Yavru ejderler ateş tükürür, lav golemleri yakar; kızıl ejder adanın en güçlü canavarlarından. Ejder Avcısı Alara burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kömür ağacı | Kömür ağacı odunu | 34 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Lav palmiyesi | Lav palmiyesi odunu | 34 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Obsidyen dikeni | Obsidyen dikeni odunu | 38 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Ejder meyvesi | Ejder meyvesi odunu | 32 | Ejder meyvesi | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ejder otu | 28 | 68 | 70 sn sonra yeniden çıkar |
| Kor mantarı | 26 | 68 | 70 sn sonra yeniden çıkar |
| Kükürt tozu | 18 | 68 | 55 sn sonra yeniden çıkar |
| Lav çiçeği | 30 | 68 | 70 sn sonra yeniden çıkar |
| Magma camı | 44 | 68 | 100 sn sonra yeniden çıkar |
| Obsidyen kırığı | 30 | 68 | 80 sn sonra yeniden çıkar |
| Plazma taşı | 60 | 68 | 120 sn sonra yeniden çıkar |
| Volkan külü | 10 | 68 | 45 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Ejder kristali | 70 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Magma cevheri | 56 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Volkan demiri | 40 | 2. kademe (Çakmaktaşı/Granit kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Lav salyangozu | zararsız | 80 | – | 16 | 29 | – | Magma kabuğu %90 |
| Kor kertenkelesi | nötr | 2.080 | 538 | 60 | 142 | – | Kor kertenkelesi eti %100; Kor pulu %80 ×1–2 |
| Yavru ejder | saldırgan | 1.820 | 588 | 80 | 583 | uzaktan atar (210 menzil, 3 atış), yanık etkisi | Ejder dişi %70 ×1–2; Yavru ejder pulu %90 ×1–3 |
| Lav golemi | saldırgan | 3.130 | 848 | 36 | 716 | yanık etkisi | Magma çekirdeği %70; Magma cevheri %90 ×1–3 |
| Kızıl ejder | saldırgan | 9.360 | 1.355 | 60 | 2.508 | uzaktan atar (260 menzil, 5 atış), yanık etkisi | Ejder kalbi %100; Kızıl ejder pulu %100 ×2–4 |
| Kor domuzu | nötr | 3.000 | 640 | 50 | 197 | – | Yaban domuzu eti %100 ×1–2; Yaban domuzu derisi %70; Yaban domuzu dişi %45; Kemik %50 ×1–2; Hayvan yağı %40 |

## Gök Rıhtımı — Çok ölümcül

Adanın en uzak ucu, roket rampası. Uzaylı dronları, gölge muhafızlar ve dev Gök bekçisi. Astronot Tuna burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Gök kamışı | Gök kamışı odunu | 40 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Bulut kavağı | Bulut kavağı odunu | 40 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Yıldız akasyası | Yıldız akasyası odunu | 44 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Gök üzümü | Gök üzümü odunu | 38 | Gök üzümü | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (E ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ay çiçeği | 28 | 68 | 70 sn sonra yeniden çıkar |
| Bulut özü | 26 | 68 | 70 sn sonra yeniden çıkar |
| Füzyon taşı | 80 | 68 | 140 sn sonra yeniden çıkar |
| Göktaşı tozu | 24 | 68 | 60 sn sonra yeniden çıkar |
| Gök camı parçası | 36 | 68 | 90 sn sonra yeniden çıkar |
| Gök ipeği | 30 | 68 | 70 sn sonra yeniden çıkar |
| Meteor parçası | 50 | 68 | 110 sn sonra yeniden çıkar |
| Yıldız mantarı | 30 | 68 | 80 sn sonra yeniden çıkar |

**Madenler** (kazma elde, E)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Gök camı | 60 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Meteor demiri | 70 | 3. kademe (Kuvars/Tunç kazma) | 20 | 300 sn sonra yeniden çıkar |
| Yıldız cevheri | 110 | 4. kademe (Bazalt/Demir kazma) | 20 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Gök medüzü | zararsız | 60 | – | 24 | 29 | uçar | Medüz jölesi %90 ×1–2 |
| Yıldız tilkisi | nötr | 2.160 | 707 | 84 | 173 | – | Yıldız tilkisi postu %80; Yıldız tilkisi eti %100 |
| Uzaylı dronu | saldırgan | 1.890 | 774 | 96 | 714 | uçar, uzaktan atar (240 menzil, 1 atış) | Uzaylı devresi %70; Mor çekirdek %40 |
| Gölge muhafız | saldırgan | 2.965 | 1.173 | 74 | 914 | kanama etkisi, sürü 1–2 | Muhafız zırhı parçası %80 ×1–2; Mor çekirdek %50 |
| Gök bekçisi | saldırgan | 9.720 | 1.756 | 40 | 3.360 | uzaktan atar (280 menzil, 5 atış) | Yakıt hücresi %100; Uzaylı devresi %100 ×2–4 |
| Yıldız geyiği | nötr | 3.000 | 850 | 62 | 197 | – | Geyik eti %100 ×1–2; Geyik derisi %80; Geyik boynuzu %40; Sinir %50 ×1–2; Kemik %50 ×1–2; Hayvan yağı %30 |


# ACT 2 · Kişiler ve görevler

ACT 2'nin bütün kişileri ikinci adaya vardığın andan itibaren yerindedir ve konuşulabilir. Görev zincirleri onlarla tanışınca açılır. Ok ve görev kartı şu sırayı önerir: Ülker → Pervin → Tamer → Selin → Alara → Tuna. Pervin'in 4. ve 5. görevleri Selin ve Alara ile tanışmayı bekler. ACT 2 görevlerinin ödülleri ACT 1'dekilerin kabaca on katıdır.

## Gökbilimci Ülker

Yüzen Kayalar'da, inişin kuzeyindeki yüksek bir kayada, teleskobunun başında; ACT 2 kazanı yanındadır. Kırk yıldır gökyüzünü ve mor ışığı izler; portalı o icat etmiştir. Son görevi portalları açar ve ilk ACT 2 anısını (Sahildeki ışık) getirir.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Teleskobun ayağı | Getir: 4 Herhangi kalas, 2 Halat | – | 300 | 300 |
| 2 | Bir gece gözlem | Bir gece bekle (gün değişsin) | – | 250 | 350 |
| 3 | Portal çekirdeği | Getir: 2 Kristal, 2 Demir levha, 2 Mor kıymık | – | 500 | 650 |


## Büyücü Pervin · Dev Mantar Ormanı

İnişe en yakın mantar ormanı köşesinde, havada asılı mor bir ateşin başında. Onunla tanışınca **mor mana** çubuğu açılır. Asaları ve mana iksirini yapar (ücretler ve değerler ACT 2 girişindeki tabloda). Goblinler gruplar halinde gezer; şamanları zehir atar.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Büyü otları | Getir: 5 Büyü otu, 3 Işıldak mantarı | – | 350 | 375 |
| 2 | Goblin baskını | Avla: 4 Goblin | – | 500 | 550 |
| 3 | Asanın kalbi | Getir: 3 Spor kristali, 3 Goblin kulağı | – | 600 | 750 |
| 4 | Buzun dili | Getir: 4 Buz kristali, 2 Kristal kanat | Mühendis Selin ile tanış | 700 | 800 |
| 5 | Gökten yıldırım | Getir: 3 Ejder kristali, 1 Magma çekirdeği | Ejder Avcısı Alara ile tanış | 900 | 1.050 |


Açtığı tarifler: Mana iksiri (1. görev), Ateş asası (3.), Buz asası (4.), Yıldırım asası (5.).

## Silahçı Tamer · Hurda Çölü

Geminin düşürdüğü dronların (robotların) dolaştığı hurda çölünde. Tabanca (200 sikke) ve Pompalı (400 sikke) yapar; mermiyi sen elle yaparsın.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Hurda toplama | Getir: 8 Hurda parçası, 4 Bakır tel | – | 400 | 450 |
| 2 | Devriye | Avla: 3 Devriye robotu | – | 600 | 650 |
| 3 | Robotun kalbi | Getir: 2 Robot çekirdeği, 4 Barut | – | 700 | 750 |
| 4 | Devin motoru | Getir: 1 Motor, 2 Ağır plaka | – | 900 | 950 |


Açtığı tarifler: Pirinç külçesi ve Barut (1. görev), Tabanca ve Tabanca mermisi (3.), Pompalı ve Pompalı fişeği (4.). "Devin motoru" görevindeki Motor, Hurda devi'nden düşer.

## Mühendis Selin · Kristal Golem Ocağı

Adanın güney ortasındaki kayalıklarda. **Meka zırh** yapar (600 sikke): gövde yuvası, +90 savunma, canı %25 artırır, hareketi %12 hızlandırır, zehir/yanık/kanama hasarının yarısını tutar.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Enerji taşları | Getir: 3 Enerji taşı, 4 Kristal cevheri | – | 600 | 650 |
| 2 | Golemcikler | Avla: 3 Kristal golemcik | – | 800 | 850 |
| 3 | Zırhın iskeleti | Getir: 2 Titanyum plaka, 4 Golem parçası | – | 1.000 | 1.100 |


Açtığı tarifler: Kobalt külçesi, Titanyum külçesi, Enerji hücresi (1. görev), Meka zırh (3.).

## Ejder Avcısı Alara · Ejder Volkanı

Adanın doğusundaki volkanda. Ejderhalar geminin volkana döktüğü plazmayla büyümüş. **Işın kılıcı** yapar (800 sikke).

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Lav çiçekleri | Getir: 5 Lav çiçeği, 3 Magma cevheri | – | 800 | 900 |
| 2 | Yavrular | Avla: 3 Yavru ejder | – | 1.000 | 1.100 |
| 3 | Kılıcın kenarı | Getir: 3 Ejder dişi, 3 Plazma taşı | – | 1.200 | 1.300 |
| 4 | Kızıl ejder | Avla: 1 Kızıl ejder | – | 2.000 | 2.250 |


Açtığı tarifler: Plazma hücresi (1. görev), Işın kılıcı (3.). Son görevdeki **Kızıl ejder** ACT 2'nin en güçlü ikinci canavarıdır.

## Astronot Tuna · Gök Rıhtımı

Adanın en uzak ucunda, yarım kalmış bir fırlatma rampasının başında. Sevdiği Nehir'i uzaylılarla savaşırken kaybetmiş, onu gemiden geri almak istiyor. Roketin parçalarını o yapar: Roket gövdesi 1.000, Roket motoru 1.500, Roket 2.000 sikke.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Göktaşları | Getir: 4 Meteor parçası, 3 Gök camı | – | 1.000 | 1.250 |
| 2 | Dronlar | Avla: 4 Uzaylı dronu | – | 1.200 | 1.500 |
| 3 | Muhafızlar | Avla: 3 Gölge muhafız | – | 1.500 | 1.750 |
| 4 | Gök bekçisi | Avla: 1 Gök bekçisi | – | 2.500 | 3.000 |
| 5 | Roket | Getir: 1 Roket | – | 0 | 5.000 |


Açtığı tarifler: Meteor demiri külçesi ve Yıldız külçesi (1. görev), Roket gövdesi, Roket motoru ve Roket (4.). Son görevde roketi teslim edince Tuna'yla konuşup **Fırlat!** de: fırlatma sahnesi → mor gemi → kavuşma → son kartı. "Gökyüzüne" ve "Yeniden birlikte" başarımları burada gelir.


# Reisler (boss'lar)

Her canlı türünün bir **Reisi** vardır (ör. *Kurt Reisi*). Bir türden yeterince avlayınca o türün Reisi yakında belirir; büyük, mor çerçeveli can çubuğu olan, daha hızlı ve daha sert vuran bir sürümdür.

- **Kaç avdan sonra:** türün bolluğuna göre 5 ile 15 arası (çok can olan türlerde 2 eksik). Sayaç Almanak'ta görünür ("Reis: 3 / 7").
- **Her Reis bir kez (v2.13):** bir türün Reisi yenilince o türün almanak kartı altına döner ve o türün Reisi **bir daha gelmez** (v2.12'ye kadar her seferinde %50 daha çok avla yeniden geliyordu).
- **Reise yenilmek (v2.13):** Reis sahadayken ya da gelmek üzereyken bayılırsan Reis kaybolur, sayaç bir eksik kalır (ör. 6 / 7); o türden bir av daha Reisi yeniden getirir.
- **Güç:** canı türün 4 katı; hasarı 1,5 katı (Çayır türleri ve tehlikeli bölgeler) ya da 1,7 katı; XP = türün XP'si × 6 + 20.
- **Davranış:** canı %40'ın altına inince **öfkelenir** (kırmızılaşır, daha sert saldırır). Sürü hayvanlarının Reisi canı yarıya inince yanına 2 sürü üyesi çağırır.
- **Ödül:** türün düşürdükleri + 25 + (türün XP'si × 5) sikke. Reis öldürmek "İlk reis", "Reis avcısı" (5 farklı), "Reislerin korkusu" (10), "Reis yiyen" (20) ve "Bütün reisler" başarımlarını ilerletir.
- Börü'nün derslerindeki alıştırma canavarı öldürülünce av sayılmaz; ders Reis çağırmaz (v1.70). Ders sürerken hiçbir Reis gelmez; o sırada dolan Reis ders bitince gelir (v1.79).

| Reis | Nerede | İlk çıkış için av | Can | Hasar | XP | Garanti ganimet |
|---|---|---|---|---|---|---|
| Bıldırcın Reisi | ACT 1 · Çayır | 9 | 20 | 5 | 38 | Bıldırcın eti ×2; Bıldırcın tüyü ×2; Bıldırcın yumurtası ×2 |
| Geyik Reisi | ACT 1 · Çayır | 15 | 220 | 15 | 86 | Geyik eti ×2; Geyik derisi ×2; Geyik boynuzu ×2; Sinir ×2; Kemik ×2; Hayvan yağı ×2 |
| Keklik Reisi | ACT 1 · Çayır | 9 | 24 | 5 | 38 | Keklik eti ×2; Keklik tüyü ×2; Keklik yumurtası ×2 |
| Kerevit Reisi | ACT 1 · Çayır | 10 | 160 | 11 | 86 | Kerevit ×2 |
| Kurt Reisi | ACT 1 · Çayır | 15 | 280 | 18 | 158 | Kurt eti ×2; Kurt derisi ×2; Kurt dişi ×2; Kemik ×2; Sinir ×2 |
| Tavşan Reisi | ACT 1 · Çayır | 12 | 40 | 5 | 44 | Tavşan eti ×2; Tavşan derisi ×2; Kemik ×2; Sinir ×2 |
| Yaban Atı Reisi | ACT 1 · Çayır | 12 | 320 | 17 | 116 | Yaban atı eti ×2; Yaban atı derisi ×2; Kemik ×2; Sinir ×2 |
| Dikenli Kirpi Reisi | ACT 1 · Orman | 7 | 240 | 20 | 116 | Kirpi dikeni ×2; Kemik ×2 |
| Engerek Reisi | ACT 1 · Orman | 7 | 300 | 24 | 140 | Zehir bezesi ×2; Kemik ×2 |
| Karaca Reisi | ACT 1 · Orman | 12 | 280 | 24 | 92 | Karaca eti ×2; Karaca derisi ×2; Kemik ×2; Sinir ×2 |
| Kunduz Reisi | ACT 1 · Orman | 7 | 220 | 20 | 80 | Kunduz eti ×2; Kunduz derisi ×2; Kemik ×2 |
| Oklu Kirpi Reisi | ACT 1 · Orman | 5 | 820 | 32 | 308 | İri diken ×2; Kirpi dikeni ×2; Kemik ×2 |
| Sincap Reisi | ACT 1 · Orman | 9 | 24 | 5 | 38 | Sincap eti ×2; Sincap derisi ×2; Ceviz ×2; Fındık ×2 |
| Yaban Domuzu Reisi | ACT 1 · Orman | 12 | 520 | 36 | 164 | Yaban domuzu eti ×2; Yaban domuzu derisi ×2; Yaban domuzu dişi ×2; Kemik ×2; Hayvan yağı ×2 |
| Bataklık Kurdu Reisi | ACT 1 · Bataklık | 10 | 2.400 | 86 | 482 | Bataklık kurdu postu ×2; Kurt dişi ×2; Kemik ×2 |
| Ördek Reisi | ACT 1 · Bataklık | 12 | 32 | 5 | 38 | Ördek eti ×2; Ördek tüyü ×2; Ördek yumurtası ×2 |
| Su Samuru Reisi | ACT 1 · Bataklık | 5 | 960 | 35 | 158 | Su samuru eti ×2; Su samuru derisi ×2 |
| Timsah Reisi | ACT 1 · Bataklık | 7 | 4.320 | 117 | 794 | Timsah derisi ×2; Timsah dişi ×2; Timsah eti ×2 |
| Turna Kuşu Reisi | ACT 1 · Bataklık | 7 | 800 | 30 | 146 | Turna kuşu eti ×2; Turna kuşu tüyü ×2; Turna kuşu yumurtası ×2 |
| Yaban Kazı Reisi | ACT 1 · Bataklık | 7 | 600 | 34 | 116 | Yaban kazı eti ×2; Yaban kazı tüyü ×2; Yaban kazı yumurtası ×2 |
| Zehirli Kurbağa Reisi | ACT 1 · Bataklık | 10 | 1.400 | 54 | 374 | Zehir bezesi ×2; Kurbağa ×2 |
| Dağ Keçisi Reisi | ACT 1 · Kayalık Dağ | 10 | 1.460 | 71 | 218 | Dağ keçisi eti ×2; Dağ keçisi derisi ×2; Kemik ×2 |
| Kartal Reisi | ACT 1 · Kayalık Dağ | 6 | 3.880 | 168 | 806 | Kartal eti ×2; Kartal tüyü ×2; Kartal pençesi ×2 |
| Mağara Ayısı Reisi | ACT 1 · Kayalık Dağ | 5 | 10.080 | 206 | 1.328 | Mağara ayısı eti ×2; Mağara ayısı derisi ×2; Ayı pençesi ×2; Hayvan yağı ×2; Kemik ×2 |
| Muflon Reisi | ACT 1 · Kayalık Dağ | 9 | 1.720 | 73 | 236 | Muflon eti ×2; Muflon derisi ×2; Kemik ×2; Sinir ×2 |
| Ur Kekliği Reisi | ACT 1 · Kayalık Dağ | 8 | 48 | 5 | 56 | Ur kekliği eti ×2; Ur kekliği tüyü ×2; Ur kekliği yumurtası ×2 |
| Vaşak Reisi | ACT 1 · Kayalık Dağ | 6 | 5.600 | 182 | 890 | Vaşak eti ×2; Vaşak derisi ×2; Kemik ×2 |
| Yaban Öküzü Reisi | ACT 1 · Kayalık Dağ | 9 | 3.440 | 111 | 452 | Yaban öküzü eti ×2; Yaban öküzü derisi ×2; Öküz boynuzu ×2; Kemik ×2; Sinir ×2; Hayvan yağı ×2 |
| Ateş Akrebi Reisi | ACT 1 · Kül Diyarı | 6 | 4.560 | 222 | 1.796 | Akrep iğnesi ×2; Akrep kabuğu ×2 |
| Kor Yarasası Reisi | ACT 1 · Kül Diyarı | 6 | 3.320 | 173 | 1.526 | Yarasa kanadı ×2; Ateş bezesi ×2 |
| Kül Böceği Reisi | ACT 1 · Kül Diyarı | 6 | 2.560 | 125 | 296 | Kül böceği kabuğu ×2; Kül ×2 |
| Kül Cini Reisi | ACT 1 · Kül Diyarı | 7 | 3.240 | 149 | 1.526 | Ateş bezesi ×2; Kül ×2 |
| Kül Kurdu Reisi | ACT 1 · Kül Diyarı | 10 | 4.300 | 210 | 1.250 | Kül kurdu postu ×2; Kül dişi ×2 |
| Lav Kertenkelesi Reisi | ACT 1 · Kül Diyarı | 10 | 3.760 | 185 | 1.382 | Lav pulu ×2; Ateş bezesi ×2 |
| Gölge Kurdu Reisi | ACT 1 · Mor Kristal Vadisi | 6 | 5.900 | 272 | 2.618 | Gölge postu ×2; Gölge dişi ×2 |
| Işık Engereği Reisi | ACT 1 · Mor Kristal Vadisi | 6 | 4.340 | 254 | 2.384 | Mor zehir ×2; Işık pulu ×2 |
| Işık Tilkisi Reisi | ACT 1 · Mor Kristal Vadisi | 6 | 4.000 | 171 | 620 | Işık tilkisi eti ×2; Işık tilkisi postu ×2 |
| Kristal Geyik Reisi | ACT 1 · Mor Kristal Vadisi | 6 | 6.520 | 200 | 1.910 | Kristal geyik eti ×2; Kristal geyik derisi ×2; Kristal boynuz ×2 |
| Kristal Golem Reisi | ACT 1 · Mor Kristal Vadisi | 6 | 18.000 | 363 | 6.254 | Golem çekirdeği ×2; Kristal ×2; Ametist ×2 |
| Kristal Örümcek Reisi | ACT 1 · Mor Kristal Vadisi | 6 | 5.280 | 236 | 2.504 | Kristal ipek ×2; Örümcek gözü ×2 |
| Mor Güve Reisi | ACT 1 · Mor Kristal Vadisi | 8 | 200 | 5 | 140 | Güve tozu ×2 |
| Bulut Koyunu Reisi | ACT 2 · Yüzen Kayalar | 6 | 4.800 | 367 | 716 | Bulut koyunu eti ×2; Bulut yünü ×2 |
| Fırtına Kartalı Reisi | ACT 2 · Yüzen Kayalar | 6 | 10.280 | 716 | 3.110 | Fırtına tüyü ×2; Kartal pençesi ×2 |
| Gök Tazısı Reisi | ACT 2 · Yüzen Kayalar | 6 | 11.760 | 641 | 2.720 | Gök tazısı postu ×2; Tazı dişi ×2 |
| Kaya Kertenkelesi Reisi | ACT 2 · Yüzen Kayalar | 6 | 4.800 | 367 | 704 | Kertenkele pulu ×2; Kertenkele eti ×2 |
| Rüzgâr Kuşu Reisi | ACT 2 · Yüzen Kayalar | 8 | 80 | 5 | 110 | Rüzgâr tüyü ×2; Rüzgâr kuşu eti ×2 |
| Goblin Okçusu Reisi | ACT 2 · Dev Mantar Ormanı | 6 | 8.020 | 429 | 2.474 | Goblin oku ×2; Goblin kulağı ×2 |
| Goblin Reisi | ACT 2 · Dev Mantar Ormanı | 6 | 10.320 | 515 | 2.204 | Goblin kulağı ×2; Goblin bıçağı ×2 |
| Goblin Şamanı Reisi | ACT 2 · Dev Mantar Ormanı | 6 | 14.900 | 716 | 4.382 | Şaman tüyü ×2; Büyü otu ×2 |
| Mantar Böceği Reisi | ACT 2 · Dev Mantar Ormanı | 8 | 160 | 5 | 122 | Böcek kabuğu ×2; Spor tozu ×2 |
| Mantar Geyiği Reisi | ACT 2 · Dev Mantar Ormanı | 6 | 7.200 | 495 | 932 | Geyik eti ×2; Geyik derisi ×2; Geyik boynuzu ×2; Sinir ×2; Kemik ×2; Hayvan yağı ×2 |
| Spor Salyangozu Reisi | ACT 2 · Dev Mantar Ormanı | 6 | 5.120 | 394 | 602 | Salyangoz sümüğü ×2 |
| Devriye Robotu Reisi | ACT 2 · Hurda Çölü | 6 | 8.320 | 668 | 2.588 | Robot çekirdeği ×2; Dişli ×2 |
| Hurda Devi Reisi | ACT 2 · Hurda Çölü | 6 | 23.760 | 1.557 | 7.712 | Motor ×2; Ağır plaka ×2 |
| Hurda Faresi Reisi | ACT 2 · Hurda Çölü | 6 | 5.280 | 529 | 596 | Bakır tel ×2; Vida ×2 |
| Lazer Dronu Reisi | ACT 2 · Hurda Çölü | 6 | 5.200 | 533 | 2.768 | Lens ×2; Pil ×2 |
| Pas Böceği Reisi | ACT 2 · Hurda Çölü | 8 | 200 | 5 | 134 | Dişli ×2; Pas tozu ×2 |
| Pas Kirpisi Reisi | ACT 2 · Hurda Çölü | 6 | 5.200 | 390 | 800 | Kirpi dikeni ×2; Kemik ×2 |
| Buz Karacası Reisi | ACT 2 · Kristal Golem Ocağı | 6 | 10.400 | 1.140 | 1.124 | Karaca eti ×2; Karaca derisi ×2; Kemik ×2; Sinir ×2 |
| Buz Tavşanı Reisi | ACT 2 · Kristal Golem Ocağı | 8 | 120 | 5 | 122 | Buz tavşanı eti ×2; Buz kürkü ×2 |
| Büyük Golem Reisi | ACT 2 · Kristal Golem Ocağı | 6 | 30.240 | 3.786 | 8.960 | Golem çekirdeği ×2; Titanyum plaka ×2 |
| Kristal Golemcik Reisi | ACT 2 · Kristal Golem Ocağı | 6 | 10.080 | 1.475 | 3.014 | Golem parçası ×2; Enerji taşı ×2 |
| Kristal Yarasası Reisi | ACT 2 · Kristal Golem Ocağı | 6 | 5.880 | 1.157 | 2.948 | Kristal kanat ×2 |
| Taş Kaplumbağası Reisi | ACT 2 · Kristal Golem Ocağı | 6 | 6.720 | 1.071 | 668 | Taş kabuk ×2 |
| Kızıl Ejder Reisi | ACT 2 · Ejder Volkanı | 6 | 37.440 | 2.033 | 15.068 | Ejder kalbi ×2; Kızıl ejder pulu ×2 |
| Kor Domuzu Reisi | ACT 2 · Ejder Volkanı | 6 | 12.000 | 960 | 1.202 | Yaban domuzu eti ×2; Yaban domuzu derisi ×2; Yaban domuzu dişi ×2; Kemik ×2; Hayvan yağı ×2 |
| Kor Kertenkelesi Reisi | ACT 2 · Ejder Volkanı | 6 | 8.320 | 915 | 872 | Kor kertenkelesi eti ×2; Kor pulu ×2 |
| Lav Golemi Reisi | ACT 2 · Ejder Volkanı | 6 | 12.520 | 1.272 | 4.316 | Magma çekirdeği ×2; Magma cevheri ×2 |
| Lav Salyangozu Reisi | ACT 2 · Ejder Volkanı | 8 | 320 | 5 | 194 | Magma kabuğu ×2 |
| Yavru Ejder Reisi | ACT 2 · Ejder Volkanı | 6 | 7.280 | 882 | 3.518 | Ejder dişi ×2; Yavru ejder pulu ×2 |
| Gök Bekçisi Reisi | ACT 2 · Gök Rıhtımı | 6 | 38.880 | 2.634 | 20.180 | Yakıt hücresi ×2; Uzaylı devresi ×2 |
| Gök Medüzü Reisi | ACT 2 · Gök Rıhtımı | 8 | 240 | 5 | 194 | Medüz jölesi ×2 |
| Gölge Muhafız Reisi | ACT 2 · Gök Rıhtımı | 6 | 11.860 | 1.760 | 5.504 | Muhafız zırhı parçası ×2; Mor çekirdek ×2 |
| Uzaylı Dronu Reisi | ACT 2 · Gök Rıhtımı | 6 | 7.560 | 1.161 | 4.304 | Uzaylı devresi ×2; Mor çekirdek ×2 |
| Yıldız Geyiği Reisi | ACT 2 · Gök Rıhtımı | 6 | 12.000 | 1.275 | 1.202 | Geyik eti ×2; Geyik derisi ×2; Geyik boynuzu ×2; Sinir ×2; Kemik ×2; Hayvan yağı ×2 |
| Yıldız Tilkisi Reisi | ACT 2 · Gök Rıhtımı | 6 | 8.640 | 1.202 | 1.058 | Yıldız tilkisi postu ×2; Yıldız tilkisi eti ×2 |


# Tarif ansiklopedisi

## Tarifler nasıl çalışır (kısa)

- **Öğrenmek:** Bir tarifi kullanmak için önce kazanda öğrenirsin. ACT 1'de **Cadı Zümrüt'ün kazanı** (ya da kuzen cadıların kazanları), ACT 2'de **Gökbilimci Ülker'in kazanı**. Malzemeleri kazana koyup öğrenirsin; malzemeler bu sırada harcanır.
- **Kitapta açılması:** Tarif kitabında bir tarifin açık görünmesi için bütün malzemelerini daha önce görmüş (eline almış) olman gerekir. Bir kişinin "tarifini kitabına yazdım" demesi de tarifi açar (satın alınmış sayılır).
- **Yapmak:** Öğrendikten sonra nerede yapıldığı tarifin türüne göre değişir (tablolardaki "Nerede yapılır" sütunu):
  - **El yapımı (Tab):** kendin yaparsın; dokunmatikte el ikonu. Tarif listesinde **+** ile tek dokunuşta yapılır.
  - **Örs · Demirci Dursun / silahçı kuzenleri:** aletler ve silahlar. **Örs · Zırhçı Durmuş / zırhçı kuzenleri:** metal ve özel zırhlar. "… ve bütün kuzenleri döver" yazan eşya kademe 0'dır; "Silahçı Ali (Bataklık) ve üstü döver" yazan eşyayı Ali ve ondan sonraki biyomların silahçıları döver.
  - **Usta Kemal:** ev eşyaları (evin içine konur). **Usta Kemal / Marangoz Rıza:** yere kurulan yapılar ve yataklar.
  - **ACT 2 ustaları:** asalar (Pervin), ateşli silahlar (Tamer), meka zırh (Selin), ışın kılıcı (Alara), roket (Tuna); işçilik ücreti alırlar.
- **Alet sütunu:** tarifte adı geçen alet çantanda olmalıdır ama harcanmaz.
- **"Herhangi …" malzemeler:** bir grubun herhangi bir üyesi olur (ör. Herhangi kalas = Meşe kalası, Çam kalası, …). Grupların tam listesi bu bölümün sonunda.
- **Fiyat:** temel satış fiyatı = malzemelerin toplam değeri × zincir çarpanı (tarifin kaç adımlık bir zincirin ucunda olduğuna göre ×1,20'den ×1,45'e kadar) + gereken aletin değerinin %10'u.

Toplam **840 tarif**: ACT 1 malzemeleriyle 775, ACT 2 malzemesi isteyen 65 (v1.84: kuzenlere özel 15 tarif eklendi: 5 kılıç Metal aletler'de, 10 zırh Zırh'ta).

#### Yiyecek (273)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Acı biber ezmesi | 3 Ateş biberi, 1 Tuz | – | El yapımı (Tab) | 126 |
| Ahududu ezmesi | 3 Ahududu, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Ahududu suyu | 3 Ahududu, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Akçaağaç şurubu | 2 Akçaağaç özsuyu, 1 Ateş, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 39 |
| Alıç ezmesi | 3 Alıç, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Alıç suyu | 3 Alıç, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Ardıç meyvesi ezmesi | 3 Ardıç meyvesi, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Ardıç meyvesi suyu | 3 Ardıç meyvesi, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Ateş çiçeği balı | 1 Ateş çiçeği, 1 Yabani bal, 1 Su | – | El yapımı (Tab) | 20 |
| Ateş narı şerbeti | 3 Ateş narı, 1 Herhangi çömlek, 2 Su | – | El yapımı (Tab) | 126 |
| Avcı yahnisi | 3 Herhangi çiğ et, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Ayçiçek yağı | 5 Ayçiçeği | – | El yapımı (Tab) | 96 |
| Ay elması reçeli | 3 Ay elması, 1 Yabani bal, 1 Herhangi çömlek | – | El yapımı (Tab) | 165 |
| Balık çorbası | 3 Herhangi balık, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Ballı ekmek | 1 Herhangi yassı ekmek, 1 Yabani bal, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 75 |
| Ballı fındık | 1 Kavrulmuş fındık, 1 Yabani bal, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 72 |
| Ballı kestane | 1 Kavrulmuş kestane, 1 Yabani bal, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 72 |
| Bal şarabı | 1 Bal şerbeti, 1 Herhangi çömlek, 4 Su, 4 Yaprak | – | El yapımı (Tab) | 100 |
| Bal şerbeti | 1 Yabani bal, 5 Su, 1 Yaprak | – | El yapımı (Tab) | 17 |
| Böğürtlen ezmesi | 3 Böğürtlen, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Böğürtlen suyu | 3 Böğürtlen, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Buğday unu | 5 Buğday | – | El yapımı (Tab) | 48 |
| Ceviz içi | 2 Ceviz, 2 Su, 1 Yaprak | Çekiç taşı | El yapımı (Tab) | 12 |
| Ceviz yağı | 1 Ceviz içi, 3 Su, 3 Yaprak | Öğütme taşı | El yapımı (Tab) | 25 |
| Çiftçi yahnisi | 2 Patates, 2 Havuç, 2 Soğan, 2 Su, 1 Ateş | – | El yapımı (Tab) | 112 |
| Dağ çayı demi | 3 Dağ çayı, 2 Su, 1 Ateş | – | El yapımı (Tab) | 57 |
| Ejder meyvesi şerbeti ² | 3 Ejder meyvesi, 2 Su, 1 Herhangi çömlek | – | El yapımı (Tab) | 142 |
| Ekmek | 2 Buğday unu, 2 Su, 1 Ateş | – | El yapımı (Tab) | 153 |
| Et şişi | 3 Herhangi çiğ et, 1 Sopa, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 28 |
| Goblin eriği reçeli ² | 3 Goblin eriği, 1 Herhangi çömlek | – | El yapımı (Tab) | 108 |
| Gök üzümü suyu ² | 3 Gök üzümü, 2 Su | – | El yapımı (Tab) | 86 |
| Hardal ezmesi | 3 Hardal otu, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Haşlanmış bıldırcın yumurtası | 2 Bıldırcın yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Haşlanmış keklik yumurtası | 2 Keklik yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Haşlanmış ördek yumurtası | 2 Ördek yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Haşlanmış turna kuşu yumurtası | 2 Turna kuşu yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Haşlanmış ur kekliği yumurtası | 2 Ur kekliği yumurtası, 2 Su, 1 Ateş | – | El yapımı (Tab) | 47 |
| Haşlanmış yaban kazı yumurtası | 2 Yaban kazı yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Havuç çorbası | 3 Havuç, 2 Su, 1 Soğan | – | El yapımı (Tab) | 50 |
| Havyar | 1 Mersin balığı, 1 Tuz kayası, 2 Yaprak | Taş bıçak | El yapımı (Tab) | 26 |
| Hurma ezmesi ² | 3 Hurma, 1 Herhangi çömlek | – | El yapımı (Tab) | 108 |
| Isırgan çorbası | 3 Isırgan, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 56 |
| Işık mantarı çorbası | 3 Işık mantarı, 2 Su, 1 Ateş | – | El yapımı (Tab) | 248 |
| Kabak çorbası | 1 Kabak, 2 Su, 1 Soğan, 1 Havuç | – | El yapımı (Tab) | 55 |
| Kara tuzlu et | 2 Herhangi çiğ et, 1 Kara tuz | – | El yapımı (Tab) | 54 |
| Kavrulmuş fındık | 3 Fındık, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kavrulmuş kabak çekirdeği | 3 Kabak, 1 Ateş | – | El yapımı (Tab) | 120 |
| Kavrulmuş kestane | 3 Kestane, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kavrulmuş su kestanesi | 2 Su kestanesi, 1 Ateş, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 39 |
| Kavrulmuş yabani arpa | 3 Yabani arpa, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kavrulmuş yabani buğday | 3 Yabani buğday, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kavrulmuş yabani mercimek | 3 Yabani mercimek, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kavrulmuş yabani nohut | 3 Yabani nohut, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kavrulmuş yabani yulaf | 3 Yabani yulaf, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Kekikli balık | 1 Herhangi pişmiş balık, 3 Kekik, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Kemik ilikli çorba | 3 Kemik, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Kızarmış çayır mantarı | 3 Çayır mantarı, 1 Su | Pişirme taşı | El yapımı (Tab) | 15 |
| Kızarmış kanlıca | 2 Kanlıca, 2 Su, 1 Yaprak | Pişirme taşı | El yapımı (Tab) | 17 |
| Kızarmış kayın mantarı | 2 Kayın mantarı, 2 Su, 1 Yaprak | Pişirme taşı | El yapımı (Tab) | 17 |
| Kızarmış kuzugöbeği | 1 Kuzugöbeği, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Kızarmış mağara mantarı | 2 Mağara mantarı, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Kızarmış tavuk mantarı | 2 Tavuk mantarı, 2 Su, 1 Yaprak | Pişirme taşı | El yapımı (Tab) | 17 |
| Kızarmış yabani havuç | 3 Yabani havuç, 1 Su | Pişirme taşı | El yapımı (Tab) | 15 |
| Kızılcık ezmesi | 3 Kızılcık, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Kızılcık suyu | 3 Kızılcık, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Közde patates | 3 Patates, 1 Ateş | – | El yapımı (Tab) | 73 |
| Közlenmiş şiş | 1 Et şişi, 1 Kor, 5 Su, 4 Yaprak | – | El yapımı (Tab) | 108 |
| Kristal armut kompostosu ² | 3 Kristal armut, 2 Su, 1 Ateş | – | El yapımı (Tab) | 88 |
| Kurutulmuş ahududu | 3 Ahududu, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş alabalık | 2 Alabalık, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş alıç | 3 Alıç, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş ardıç meyvesi | 3 Ardıç meyvesi, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş ateş narı | 3 Ateş narı, 3 Kuru ot | – | El yapımı (Tab) | 64 |
| Kurutulmuş ay elması | 3 Ay elması, 3 Kuru ot | – | El yapımı (Tab) | 95 |
| Kurutulmuş bıldırcın eti | 2 Bıldırcın eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 32 |
| Kurutulmuş böğürtlen | 3 Böğürtlen, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş çapak | 2 Çapak, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 32 |
| Kurutulmuş çayır mantarı | 3 Çayır mantarı, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş dağ keçisi eti | 1 Dağ keçisi eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 35 |
| Kurutulmuş geyik eti | 1 Geyik eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 37 |
| Kurutulmuş işık tilkisi eti | 1 Işık tilkisi eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 58 |
| Kurutulmuş kadife balığı | 2 Kadife balığı, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş kanlıca | 2 Kanlıca, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş karaca eti | 1 Karaca eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş kartal eti | 1 Kartal eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 45 |
| Kurutulmuş kayın mantarı | 2 Kayın mantarı, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş keklik eti | 2 Keklik eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 32 |
| Kurutulmuş kerevit | 2 Kerevit, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş kızılcık | 3 Kızılcık, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş kızılkanat | 2 Kızılkanat, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş kristal geyik eti | 1 Kristal geyik eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 71 |
| Kurutulmuş kunduz eti | 2 Kunduz eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş kurbağa | 3 Kurbağa, 1 Tuz, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 30 |
| Kurutulmuş kurt eti | 1 Kurt eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş kuşburnu | 3 Kuşburnu, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş kuzugöbeği | 1 Kuzugöbeği, 3 Kuru ot, 1 Su, 1 Yaprak | – | El yapımı (Tab) | 14 |
| Kurutulmuş mağara ayısı eti | 1 Mağara ayısı eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 42 |
| Kurutulmuş mağara mantarı | 2 Mağara mantarı, 3 Kuru ot, 1 Su | – | El yapımı (Tab) | 15 |
| Kurutulmuş mersin balığı | 1 Mersin balığı, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 42 |
| Kurutulmuş meyve keki | 1 Herhangi un, 1 Herhangi kurutulmuş meyve, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 28 |
| Kurutulmuş muflon eti | 1 Muflon eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 35 |
| Kurutulmuş mürver | 3 Mürver, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş ördek eti | 2 Ördek eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş sazan | 2 Sazan, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş sincap eti | 3 Sincap eti, 1 Tuz, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 30 |
| Kurutulmuş su samuru eti | 2 Su samuru eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş tatlısu kefali | 2 Tatlısu kefali, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş tatlısu levreği | 2 Tatlısu levreği, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş tatlısu midyesi | 3 Tatlısu midyesi, 1 Tuz, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 30 |
| Kurutulmuş tavşan eti | 2 Tavşan eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 32 |
| Kurutulmuş tavuk mantarı | 2 Tavuk mantarı, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş turna balığı | 1 Turna balığı, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş turna kuşu eti | 2 Turna kuşu eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş ur kekliği eti | 1 Ur kekliği eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 40 |
| Kurutulmuş vaşak eti | 1 Vaşak eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 48 |
| Kurutulmuş yabani armut | 3 Yabani armut, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yabani elma | 3 Yabani elma, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yabani erik | 3 Yabani erik, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban atı eti | 1 Yaban atı eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş yaban çileği | 3 Yaban çileği, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban domuzu eti | 1 Yaban domuzu eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 35 |
| Kurutulmuş yaban kazı eti | 2 Yaban kazı eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 38 |
| Kurutulmuş yaban mersini | 2 Yaban mersini, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban öküzü eti | 1 Yaban öküzü eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 39 |
| Kurutulmuş yayın | 1 Yayın, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 35 |
| Kurutulmuş yılan balığı | 1 Yılan balığı, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 34 |
| Kurutulmuş yıldız eriği | 3 Yıldız eriği, 3 Kuru ot | – | El yapımı (Tab) | 95 |
| Kuşburnu ezmesi | 3 Kuşburnu, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Kuşburnu suyu | 3 Kuşburnu, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Kül ekmeği | 1 Herhangi un, 1 Kül, 1 Su | – | El yapımı (Tab) | 11 |
| Mantar çorbası | 2 Kanlıca, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Meyveli pemmikan | 1 Pemmikan, 1 Herhangi kurutulmuş meyve, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 98 |
| Meyve karışımı | 3 Böğürtlen, 3 Ahududu | – | El yapımı (Tab) | 15 |
| Mürver ezmesi | 3 Mürver, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Mürver suyu | 3 Mürver, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Nilüfer çorbası | 2 Nilüfer, 1 Sıcak su, 1 Su teresi | – | El yapımı (Tab) | 57 |
| Nilüfer kökü unu | 2 Nilüfer, 2 Su, 1 Yaprak | Öğütme taşı | El yapımı (Tab) | 13 |
| Ot salatası | 3 Kuzukulağı, 3 Su teresi | – | El yapımı (Tab) | 11 |
| Palamut ekmeği | 1 Palamut unu, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 42 |
| Palamut unu | 3 Meşe palamudu, 1 Su | Öğütme taşı | El yapımı (Tab) | 7 |
| Patates püresi | 4 Patates, 1 Su | – | El yapımı (Tab) | 59 |
| Pemmikan | 1 Herhangi kurutulmuş et, 2 Hayvan yağı, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 54 |
| Pişmiş alabalık | 2 Alabalık, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş bıldırcın eti | 2 Bıldırcın eti, 1 Ateş, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 39 |
| Pişmiş bulut koyunu eti ² | 1 Bulut koyunu eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 52 |
| Pişmiş buz tavşanı eti ² | 1 Buz tavşanı eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 54 |
| Pişmiş çapak | 2 Çapak, 1 Ateş, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 39 |
| Pişmiş dağ keçisi eti | 1 Dağ keçisi eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş geyik eti | 1 Geyik eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 45 |
| Pişmiş işık tilkisi eti | 1 Işık tilkisi eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Pişmiş kadife balığı | 2 Kadife balığı, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş karaca eti | 1 Karaca eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 42 |
| Pişmiş kartal eti | 1 Kartal eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 52 |
| Pişmiş keklik eti | 2 Keklik eti, 1 Ateş, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 39 |
| Pişmiş kerevit | 2 Kerevit, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş kertenkele eti ² | 1 Kertenkele eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 49 |
| Pişmiş kızılkanat | 2 Kızılkanat, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş kor kertenkelesi eti ² | 1 Kor kertenkelesi eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 57 |
| Pişmiş kristal geyik eti | 1 Kristal geyik eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 78 |
| Pişmiş kunduz eti | 2 Kunduz eti, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş kurbağa | 3 Kurbağa, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Pişmiş kurt eti | 1 Kurt eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 42 |
| Pişmiş mağara ayısı eti | 1 Mağara ayısı eti, 1 Ateş, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 51 |
| Pişmiş mersin balığı | 1 Mersin balığı, 1 Ateş, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 51 |
| Pişmiş muflon eti | 1 Muflon eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş ördek eti | 2 Ördek eti, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş rüzgâr kuşu eti ² | 1 Rüzgâr kuşu eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 49 |
| Pişmiş sazan | 2 Sazan, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş sincap eti | 3 Sincap eti, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Pişmiş su samuru eti | 2 Su samuru eti, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş tatlısu kefali | 2 Tatlısu kefali, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş tatlısu levreği | 2 Tatlısu levreği, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş tatlısu midyesi | 3 Tatlısu midyesi, 1 Ateş, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 38 |
| Pişmiş tavşan eti | 2 Tavşan eti, 1 Ateş, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 39 |
| Pişmiş timsah eti | 1 Timsah eti, 1 Ateş, 1 Su, 1 Yaprak | – | El yapımı (Tab) | 42 |
| Pişmiş turna balığı | 1 Turna balığı, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 42 |
| Pişmiş turna kuşu eti | 2 Turna kuşu eti, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş ur kekliği eti | 1 Ur kekliği eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 47 |
| Pişmiş vaşak eti | 1 Vaşak eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 54 |
| Pişmiş yaban atı eti | 1 Yaban atı eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş yaban domuzu eti | 1 Yaban domuzu eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş yaban kazı eti | 2 Yaban kazı eti, 1 Ateş, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 46 |
| Pişmiş yaban öküzü eti | 1 Yaban öküzü eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 47 |
| Pişmiş yayın | 1 Yayın, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 43 |
| Pişmiş yılan balığı | 1 Yılan balığı, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 42 |
| Pişmiş yıldız tilkisi eti ² | 1 Yıldız tilkisi eti, 1 Ateş, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 60 |
| Sarımsaklı et | 1 Herhangi pişmiş et, 3 Yaban sarımsağı, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 65 |
| Soğan halkası | 3 Soğan, 1 Buğday unu, 1 Ayçiçek yağı | – | El yapımı (Tab) | 218 |
| Spor ekmeği ² | 3 Spor tozu, 2 Su, 1 Ateş | – | El yapımı (Tab) | 88 |
| Taşta alabalık | 2 Alabalık, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 23 |
| Taşta çapak | 2 Çapak, 2 Su, 1 Yaprak | Pişirme taşı | El yapımı (Tab) | 17 |
| Taşta kadife balığı | 2 Kadife balığı, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta kerevit | 2 Kerevit, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta kızılkanat | 2 Kızılkanat, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta kurbağa | 3 Kurbağa, 1 Su | Pişirme taşı | El yapımı (Tab) | 15 |
| Taşta mersin balığı | 1 Mersin balığı, 4 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 29 |
| Taşta sazan | 2 Sazan, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta tatlısu kefali | 2 Tatlısu kefali, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta tatlısu levreği | 2 Tatlısu levreği, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 23 |
| Taşta tatlısu midyesi | 3 Tatlısu midyesi, 1 Su | Pişirme taşı | El yapımı (Tab) | 15 |
| Taşta turna balığı | 1 Turna balığı, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta yayın | 1 Yayın, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 22 |
| Taşta yılan balığı | 1 Yılan balığı, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Turba ateşinde tütsü | 1 Herhangi çiğ et, 2 Turba, 1 Herhangi çakmak | – | El yapımı (Tab) | 24 |
| Tütsülenmiş alabalık | 2 Alabalık, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş bıldırcın eti | 2 Bıldırcın eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Tütsülenmiş çapak | 2 Çapak, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Tütsülenmiş dağ keçisi eti | 1 Dağ keçisi eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Tütsülenmiş geyik eti | 1 Geyik eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş işık tilkisi eti | 1 Işık tilkisi eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 84 |
| Tütsülenmiş kadife balığı | 2 Kadife balığı, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş karaca eti | 1 Karaca eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş kartal eti | 1 Kartal eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 71 |
| Tütsülenmiş keklik eti | 2 Keklik eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Tütsülenmiş kerevit | 2 Kerevit, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş kızılkanat | 2 Kızılkanat, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş kristal geyik eti | 1 Kristal geyik eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 97 |
| Tütsülenmiş kunduz eti | 2 Kunduz eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş kurbağa | 3 Kurbağa, 1 Duman, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Tütsülenmiş kurt eti | 1 Kurt eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş mağara ayısı eti | 1 Mağara ayısı eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 72 |
| Tütsülenmiş mersin balığı | 1 Mersin balığı, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 72 |
| Tütsülenmiş muflon eti | 1 Muflon eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Tütsülenmiş ördek eti | 2 Ördek eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş sazan | 2 Sazan, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş sincap eti | 3 Sincap eti, 1 Duman, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Tütsülenmiş su samuru eti | 2 Su samuru eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş tatlısu kefali | 2 Tatlısu kefali, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş tatlısu levreği | 2 Tatlısu levreği, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş tatlısu midyesi | 3 Tatlısu midyesi, 1 Duman, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Tütsülenmiş tavşan eti | 2 Tavşan eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 61 |
| Tütsülenmiş turna balığı | 1 Turna balığı, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 64 |
| Tütsülenmiş turna kuşu eti | 2 Turna kuşu eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş ur kekliği eti | 1 Ur kekliği eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 66 |
| Tütsülenmiş vaşak eti | 1 Vaşak eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 74 |
| Tütsülenmiş yaban atı eti | 1 Yaban atı eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 68 |
| Tütsülenmiş yaban domuzu eti | 1 Yaban domuzu eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Tütsülenmiş yaban kazı eti | 2 Yaban kazı eti, 1 Duman, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 67 |
| Tütsülenmiş yaban öküzü eti | 1 Yaban öküzü eti, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Tütsülenmiş yayın | 1 Yayın, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Tütsülenmiş yılan balığı | 1 Yılan balığı, 1 Duman, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 64 |
| Yabani armut ezmesi | 3 Yabani armut, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yabani armut suyu | 3 Yabani armut, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yabani arpa hamuru | 1 Yabani arpa unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Yabani arpa lapası | 3 Yabani arpa, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Yabani arpa unu | 3 Yabani arpa, 1 Su | Öğütme taşı | El yapımı (Tab) | 11 |
| Yabani arpa yassı ekmeği | 1 Yabani arpa hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 40 |
| Yabani bira mayası | 1 Yabani arpa lapası, 1 Herhangi çömlek, 4 Su, 4 Yaprak | – | El yapımı (Tab) | 164 |
| Yabani buğday hamuru | 1 Yabani buğday unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Yabani buğday lapası | 3 Yabani buğday, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Yabani buğday unu | 3 Yabani buğday, 1 Su | Öğütme taşı | El yapımı (Tab) | 11 |
| Yabani buğday yassı ekmeği | 1 Yabani buğday hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 40 |
| Yabani elma ezmesi | 3 Yabani elma, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yabani elma suyu | 3 Yabani elma, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yabani erik ezmesi | 3 Yabani erik, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yabani erik suyu | 3 Yabani erik, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yabani mercimek hamuru | 1 Yabani mercimek unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Yabani mercimek lapası | 3 Yabani mercimek, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Yabani mercimek unu | 3 Yabani mercimek, 1 Su | Öğütme taşı | El yapımı (Tab) | 11 |
| Yabani mercimek yassı ekmeği | 1 Yabani mercimek hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 40 |
| Yabani nohut hamuru | 1 Yabani nohut unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Yabani nohut lapası | 3 Yabani nohut, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Yabani nohut unu | 3 Yabani nohut, 1 Su | Öğütme taşı | El yapımı (Tab) | 11 |
| Yabani nohut yassı ekmeği | 1 Yabani nohut hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 40 |
| Yabani yulaf hamuru | 1 Yabani yulaf unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Yabani yulaf lapası | 3 Yabani yulaf, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Yabani yulaf unu | 3 Yabani yulaf, 1 Su | Öğütme taşı | El yapımı (Tab) | 11 |
| Yabani yulaf yassı ekmeği | 1 Yabani yulaf hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 40 |
| Yaban çileği ezmesi | 3 Yaban çileği, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yaban çileği suyu | 3 Yaban çileği, 1 Herhangi çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yaban mersini ezmesi | 2 Yaban mersini, 2 Su, 1 Yaprak | Taş havan | El yapımı (Tab) | 16 |
| Yaban mersini suyu | 2 Yaban mersini, 1 Herhangi çömlek, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 83 |
| Ziyafet sofrası | 1 Avcı yahnisi, 1 Herhangi yassı ekmek, 4 Su, 4 Yaprak | – | El yapımı (Tab) | 152 |

#### Ağaç (121)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akçaağaç kabuğu | 1 Akçaağaç odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Akçaağaç kalası | 2 Akçaağaç odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Akçaağaç kömürü | 2 Akçaağaç odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Akçaağaç sapı | 1 Akçaağaç kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Ardıç kabuğu | 1 Ardıç odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 13 |
| Ardıç kalası | 2 Ardıç odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 18 |
| Ardıç kömürü | 2 Ardıç odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 43 |
| Ardıç sapı | 1 Ardıç kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 34 |
| Ateş narı kalası | 2 Ateş narı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 52 |
| Ateş narı kömürü | 2 Ateş narı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 79 |
| Ateş narı sapı | 1 Ateş narı kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 80 |
| Ay elması kalası | 2 Ay elması odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Ay elması kömürü | 2 Ay elması odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 100 |
| Ay elması sapı | 1 Ay elması kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 108 |
| Bataklık servisi kalası | 2 Bataklık servisi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 31 |
| Bataklık servisi kömürü | 2 Bataklık servisi odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 58 |
| Bataklık servisi sapı | 1 Bataklık servisi kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 53 |
| Bulut çamı kalası ² | 2 Bulut çamı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 47 |
| Bulut elması kalası ² | 2 Bulut elması odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 52 |
| Bulut kavağı kalası ² | 2 Bulut kavağı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 114 |
| Ceviz kabuğu | 1 Ceviz odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 14 |
| Ceviz kalası | 2 Ceviz odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 21 |
| Ceviz kömürü | 2 Ceviz odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 46 |
| Ceviz sapı | 1 Ceviz kalası, 4 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 39 |
| Çam kabuğu | 1 Çam odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Çam kalası | 2 Çam odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Çam kömürü | 2 Çam odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Çam reçinesi | 1 Çam kabuğu, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 27 |
| Çam sapı | 1 Çam kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Dev mantar kalası ² | 2 Dev mantar odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 62 |
| Dikenli akasya kalası | 2 Dikenli akasya odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 52 |
| Dikenli akasya kömürü | 2 Dikenli akasya odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 79 |
| Dikenli akasya sapı | 1 Dikenli akasya kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 80 |
| Dişbudak kabuğu | 1 Dişbudak odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Dişbudak kalası | 2 Dişbudak odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Dişbudak kömürü | 2 Dişbudak odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Dişbudak sapı | 1 Dişbudak kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Ejder meyvesi kalası ² | 2 Ejder meyvesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 93 |
| Gece ağacı kalası | 2 Gece ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 78 |
| Gece ağacı kömürü | 2 Gece ağacı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 105 |
| Gece ağacı sapı | 1 Gece ağacı kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 114 |
| Gök kamışı kalası ² | 2 Gök kamışı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 114 |
| Gök söğüdü kalası ² | 2 Gök söğüdü odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 52 |
| Gök üzümü kalası ² | 2 Gök üzümü odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 109 |
| Hurda palmiyesi kalası ² | 2 Hurda palmiyesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 67 |
| Hurma kalası ² | 2 Hurma odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 67 |
| Huş kabuğu | 1 Huş odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Huş kalası | 2 Huş odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Huş katranı | 1 Huş kabuğu, 1 Ateş, 3 Dal, 3 Lif | – | El yapımı (Tab) | 50 |
| Huş kömürü | 2 Huş odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Huş sapı | 1 Huş kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Ihlamur kabuğu | 1 Ihlamur odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Ihlamur kalası | 2 Ihlamur odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Ihlamur kömürü | 2 Ihlamur odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Ihlamur sapı | 1 Ihlamur kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Işık ağacı kalası | 2 Işık ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 83 |
| Işık ağacı kömürü | 2 Işık ağacı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 110 |
| Işık ağacı sapı | 1 Işık ağacı kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 121 |
| Kara çam kalası | 2 Kara çam odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 47 |
| Kara çam kömürü | 2 Kara çam odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 74 |
| Kara çam sapı | 1 Kara çam kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 74 |
| Kavak kabuğu | 1 Kavak odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Kavak kalası | 2 Kavak odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Kavak kömürü | 2 Kavak odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Kavak sapı | 1 Kavak kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Kayın kabuğu | 1 Kayın odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Kayın kalası | 2 Kayın odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Kayın kömürü | 2 Kayın odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Kayın sapı | 1 Kayın kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Kestane kabuğu | 1 Kestane odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Kestane kalası | 2 Kestane odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Kestane kömürü | 2 Kestane odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Kestane sapı | 1 Kestane kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Kızılağaç kabuğu | 1 Kızılağaç odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Kızılağaç kalası | 2 Kızılağaç odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Kızılağaç kömürü | 2 Kızılağaç odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Kızılağaç sapı | 1 Kızılağaç kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Kızıl sedir kalası | 2 Kızıl sedir odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 57 |
| Kızıl sedir kömürü | 2 Kızıl sedir odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 84 |
| Kızıl sedir sapı | 1 Kızıl sedir kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 87 |
| Kök ağacı kalası ² | 2 Kök ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 62 |
| Kömür ağacı kalası ² | 2 Kömür ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 99 |
| Kristal armut kalası ² | 2 Kristal armut odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 83 |
| Kristal çam kalası ² | 2 Kristal çam odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 88 |
| Kuru çınar kalası ² | 2 Kuru çınar odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Kül ağacı kalası | 2 Kül ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 47 |
| Kül ağacı kömürü | 2 Kül ağacı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 74 |
| Kül ağacı sapı | 1 Kül ağacı kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 74 |
| Ladin kabuğu | 1 Ladin odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Ladin kalası | 2 Ladin odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Ladin kömürü | 2 Ladin odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Ladin reçinesi | 1 Ladin kabuğu, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 27 |
| Ladin sapı | 1 Ladin kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Lav palmiyesi kalası ² | 2 Lav palmiyesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 99 |
| Mavi mantar kalası ² | 2 Mavi mantar odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 67 |
| Mavi sedir kalası ² | 2 Mavi sedir odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 93 |
| Meşe kabuğu | 1 Meşe odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 13 |
| Meşe kalası | 2 Meşe odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 18 |
| Meşe kömürü | 2 Meşe odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 43 |
| Meşe sapı | 1 Meşe kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 34 |
| Meyve fidanı | 2 Herhangi meyve tohumu, 2 Kuru ot, 2 Su | – | El yapımı (Tab) | 18 |
| Mor söğüt kalası | 2 Mor söğüt odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Mor söğüt kömürü | 2 Mor söğüt odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 100 |
| Mor söğüt sapı | 1 Mor söğüt kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 108 |
| Obsidyen dikeni kalası ² | 2 Obsidyen dikeni odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 109 |
| Pas ağacı kalası ² | 2 Pas ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Porsuk kabuğu | 1 Porsuk odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 16 |
| Porsuk kalası | 1 Porsuk odunu, 3 Dal, 3 Lif | Taş balta | El yapımı (Tab) | 18 |
| Porsuk kömürü | 1 Porsuk odunu, 1 Ateş, 3 Dal, 3 Lif | – | El yapımı (Tab) | 42 |
| Porsuk sapı | 1 Porsuk kalası, 4 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 36 |
| Rüzgâr meşesi kalası ² | 2 Rüzgâr meşesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 57 |
| Söğüt kabuğu | 1 Söğüt odunu, 2 Yaprak, 1 Su | Taş bıçak | El yapımı (Tab) | 12 |
| Söğüt kalası | 2 Söğüt odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Söğüt kömürü | 2 Söğüt odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Söğüt sapı | 1 Söğüt kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 31 |
| Spor ağacı kalası ² | 2 Spor ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Taş ağacı kalası ² | 2 Taş ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 88 |
| Yıldız akasyası kalası ² | 2 Yıldız akasyası odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 125 |
| Yıldız eriği kalası | 2 Yıldız eriği odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Yıldız eriği kömürü | 2 Yıldız eriği odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 100 |
| Yıldız eriği sapı | 1 Yıldız eriği kalası, 3 Dal, 3 Lif | Taş bıçak | El yapımı (Tab) | 108 |

#### Zanaat (53)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akçaağaç kaşığı | 1 Akçaağaç sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Akrep kabuğu kalkanı | 3 Akrep kabuğu, 1 Herhangi kalas, 2 İp | – | El yapımı (Tab) | 213 |
| Ardıç kaşığı | 1 Ardıç sapı, 4 Lif, 4 İp | Taş bıçak | El yapımı (Tab) | 80 |
| Balık sepeti | 2 Söğüt sepeti, 3 Herhangi balık, 1 Lif | – | El yapımı (Tab) | 22 |
| Balık tutkalı | 1 Mersin balığı, 1 Kor, 5 Lif, 4 İp | – | El yapımı (Tab) | 108 |
| Balmumu | 1 Yabani bal, 1 Sıcak su, 4 Lif, 3 İp | – | El yapımı (Tab) | 83 |
| Barut ² | 2 Barut kayası, 1 Herhangi kömür | – | El yapımı (Tab) | 66 |
| Boynuz kupa | 1 Öküz boynuzu, 3 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 48 |
| Bulut yünü ip ² | 3 Bulut yünü | – | El yapımı (Tab) | 67 |
| Ceviz kaşığı | 1 Ceviz sapı, 4 Lif, 4 İp | Taş bıçak | El yapımı (Tab) | 86 |
| Çam kaşığı | 1 Çam sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Deri çanta | 1 Herhangi tabaklanmış deri, 1 Kenevir halatı, 5 Lif, 4 İp | – | El yapımı (Tab) | 447 |
| Deri tulum | 1 Herhangi tabaklanmış deri, 1 Huş katranı, 5 Lif, 4 İp | – | El yapımı (Tab) | 317 |
| Diken iğnesi | 3 Kirpi dikeni, 1 Kemik | – | El yapımı (Tab) | 17 |
| Dişbudak kaşığı | 1 Dişbudak sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Duman tütsüsü | 2 Duman çiçeği, 2 Kuru ot | – | El yapımı (Tab) | 80 |
| Eğrelti yatağı | 3 Eğrelti, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Enerji hücresi ² | 2 Enerji taşı, 2 Bakır tel, 1 Pil | – | El yapımı (Tab) | 221 |
| Gece zambağı yağı | 3 Gece zambağı, 1 Herhangi çömlek | – | El yapımı (Tab) | 303 |
| Hasır | 3 Lif, 2 İp | – | El yapımı (Tab) | 17 |
| Hasırotu yatak | 3 Hasırotu, 1 Herhangi tabaklanmış deri, 4 Lif, 3 İp | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 240 |
| Huş kabuğu kabı | 1 Huş kabuğu, 4 İp, 2 Lif | – | El yapımı (Tab) | 43 |
| Huş kaşığı | 1 Huş sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Ihlamur kaşığı | 1 Ihlamur sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Kamış hasır | 4 Kamış | – | El yapımı (Tab) | 5 |
| Kara cila | 3 Kül böceği kabuğu, 1 Herhangi reçine | – | El yapımı (Tab) | 157 |
| Kavak kaşığı | 1 Kavak sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Kaya patlatıcı | 3 Yarasa gübresi, 2 Herhangi kömür, 1 Tuz, 1 Herhangi çömlek | – | El yapımı (Tab) | 108 |
| Kayın kaşığı | 1 Kayın sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Kenevir halatı | 7 Kenevir lifi | – | El yapımı (Tab) | 140 |
| Kenevir torba | 1 Kenevir lifi, 3 Lif, 3 İp | Kemik iğne | El yapımı (Tab) | 44 |
| Kestane kaşığı | 1 Kestane sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Keten ipliği | 1 Keten lifi, 3 Lif, 3 İp | Kirmen | El yapımı (Tab) | 49 |
| Keten kumaş | 1 Keten ipliği, 4 Lif, 3 İp | Dokuma tezgâhı | El yapımı (Tab) | 101 |
| Kızılağaç kaşığı | 1 Kızılağaç sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Kum torbası | 3 Kum, 1 Herhangi tabaklanmış deri, 4 Lif, 3 İp | – | El yapımı (Tab) | 240 |
| Ladin kaşığı | 1 Ladin sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Meşe kaşığı | 1 Meşe sapı, 4 Lif, 4 İp | Taş bıçak | El yapımı (Tab) | 80 |
| Meşe tanini | 1 Meşe kabuğu, 1 Sıcak su, 4 Lif, 3 İp | – | El yapımı (Tab) | 90 |
| Midye kabuğu kaşık | 3 Tatlısu midyesi, 1 Lif | Bileği taşı | El yapımı (Tab) | 11 |
| Mor ip | 3 Mor sarmaşık | – | El yapımı (Tab) | 200 |
| Ok kılıfı | 1 Herhangi tabaklanmış deri, 4 İp, 2 Dal | – | El yapımı (Tab) | 240 |
| Plazma hücresi ² | 2 Plazma taşı, 1 Enerji hücresi, 1 Ejder kristali | – | El yapımı (Tab) | 539 |
| Porsuk kaşığı | 1 Porsuk sapı, 4 Lif, 4 İp | Taş bıçak | El yapımı (Tab) | 82 |
| Sarmaşık ipi | 4 Sarmaşık | – | El yapımı (Tab) | 5 |
| Saz örgüsü | 4 Saz | – | El yapımı (Tab) | 5 |
| Saz sepet | 2 Saz örgüsü, 3 İp, 1 Lif | – | El yapımı (Tab) | 33 |
| Söğüt kaşığı | 1 Söğüt sapı, 4 Lif, 3 İp | Taş bıçak | El yapımı (Tab) | 69 |
| Söğüt sepeti | 4 Söğüt dalı | – | El yapımı (Tab) | 5 |
| Sünger taşı bileği | 2 Sünger taşı, 1 Su | – | El yapımı (Tab) | 74 |
| Taş kase | 2 Bazalt, 2 Lif, 2 İp | Bileği taşı | El yapımı (Tab) | 27 |
| Tohum yağı | 4 Herhangi meyve tohumu, 1 Herhangi çömlek | Taş havan | El yapımı (Tab) | 84 |
| Yosun yastık | 3 Yosun, 1 Herhangi tabaklanmış deri, 4 Lif, 3 İp | – | El yapımı (Tab) | 240 |

#### Şifa (43)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Adaçayı çayı | 1 Kurutulmuş adaçayı, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Ateş çiçeği merhemi | 2 Ateş çiçeği, 1 Hayvan yağı, 2 Kül | – | El yapımı (Tab) | 25 |
| Ateş iksiri | 1 Ateş bezesi, 3 Su, 2 Ateş çiçeği | – | El yapımı (Tab) | 131 |
| Ay çayı | 2 Gece sefası, 2 Su, 1 Nane | – | El yapımı (Tab) | 26 |
| Ay ışığı iksiri | 3 Gece sefası, 1 Mor kıymık, 2 Su | – | El yapımı (Tab) | 71 |
| Ay otu iksiri | 3 Ay otu, 2 Su, 1 Işık mantarı | – | El yapımı (Tab) | 352 |
| Bataklık otu çayı | 2 Bataklık otu, 1 Sıcak su, 1 Su | – | El yapımı (Tab) | 58 |
| Civanperçemi çayı | 1 Kurutulmuş civanperçemi, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Gelincik çayı | 1 Kurutulmuş gelincik, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Gölge iksiri | 2 Gölge otu, 1 Örümcek gözü, 2 Su | – | El yapımı (Tab) | 320 |
| Ihlamur çayı | 3 Ihlamur çiçeği, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Kardelen merhemi | 2 Kardelen, 1 Hayvan yağı | – | El yapımı (Tab) | 30 |
| Kekik çayı | 1 Kurutulmuş kekik, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Kor merhemi | 2 Kor otu, 1 Hayvan yağı | – | El yapımı (Tab) | 87 |
| Kurutulmuş adaçayı | 3 Adaçayı, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş civanperçemi | 3 Civanperçemi, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş ebegümeci | 3 Ebegümeci, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Kurutulmuş gelincik | 3 Gelincik, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş hardal otu | 3 Hardal otu, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş isırgan | 3 Isırgan, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Kurutulmuş kekik | 3 Kekik, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş kuzukulağı | 3 Kuzukulağı, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Kurutulmuş lavanta | 2 Lavanta, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş nane | 3 Nane, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş papatya | 3 Papatya, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Kurutulmuş rezene | 3 Rezene, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş sinirotu | 3 Sinirotu, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş su teresi | 3 Su teresi, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yabani havuç | 3 Yabani havuç, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban sarımsağı | 3 Yaban sarımsağı, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kuşburnu çayı | 1 Kurutulmuş kuşburnu, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Kükürtlü merhem | 1 Kükürt, 2 Hayvan yağı, 2 Yosun | – | El yapımı (Tab) | 17 |
| Lavanta çayı | 1 Kurutulmuş lavanta, 1 Sıcak su, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 71 |
| Lavanta yağı | 2 Lavanta, 2 Hayvan yağı, 1 Su, 1 Yaprak | – | El yapımı (Tab) | 17 |
| Mana iksiri ² | 2 Büyü otu, 2 Su, 1 Herhangi çömlek | – | Büyücü Pervin yapar (10 sikke işçilik) | 139 |
| Nane çayı | 1 Kurutulmuş nane, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Panzehir | 3 Bataklık otu, 1 Zehir bezesi, 2 Su | – | El yapımı (Tab) | 35 |
| Papatya çayı | 1 Kurutulmuş papatya, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Rezene çayı | 1 Kurutulmuş rezene, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Sinirotu çayı | 1 Kurutulmuş sinirotu, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Söğüt kabuğu çayı | 1 Söğüt kabuğu, 1 Sıcak su, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 72 |
| Şifalı merhem | 3 Civanperçemi, 2 Hayvan yağı, 1 Su | – | El yapımı (Tab) | 16 |
| Yanık kök çayı | 2 Yanık kök, 2 Su, 1 Ateş | – | El yapımı (Tab) | 106 |

#### Alet kademeleri (43)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akrep ok ucu | 2 Akrep iğnesi, 1 İp | – | El yapımı (Tab) | 154 |
| Bazalt balta | 1 Yontulmuş bazalt, 1 Herhangi sap, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 92 |
| Bazalt bıçak | 1 Bazalt pulu, 1 Herhangi sap, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 139 |
| Bazalt kazıyıcı | 1 Bazalt pulu, 3 Herhangi kemik, 2 İp, 1 Dal, 1 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 96 |
| Bazalt kazma | 1 Bazalt sivri ucu, 1 Herhangi sap, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 441 |
| Bazalt mızrak | 1 Bazalt sivri ucu, 1 Uzun sopa, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 431 |
| Bazalt ok ucu | 9 Bazalt pulu | – | El yapımı (Tab) | 644 |
| Bazalt pulu | 1 Yontulmuş bazalt, 2 İp, 2 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 53 |
| Bazalt sivri ucu | 8 Yontulmuş bazalt | – | El yapımı (Tab) | 271 |
| Boynuz kazma | 1 Geyik boynuzu, 1 Herhangi sap, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 70 |
| Çakmaktaşı balta | 1 Yontulmuş çakmaktaşı, 1 Herhangi sap, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 78 |
| Çakmaktaşı bıçak | 1 Çakmaktaşı pulu, 1 Herhangi sap, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 111 |
| Çakmaktaşı kazıyıcı | 1 Çakmaktaşı pulu, 3 Herhangi kemik, 1 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 68 |
| Çakmaktaşı kazma | 1 Çakmaktaşı sivri ucu, 1 Herhangi sap, 3 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 252 |
| Çakmaktaşı mızrak | 1 Çakmaktaşı sivri ucu, 1 Uzun sopa, 3 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 249 |
| Çakmaktaşı ok ucu | 8 Çakmaktaşı pulu | – | El yapımı (Tab) | 400 |
| Çakmaktaşı pulu | 1 Yontulmuş çakmaktaşı, 2 İp, 2 Dal, 1 Taş | Çekiç taşı | El yapımı (Tab) | 37 |
| Çakmaktaşı sivri ucu | 7 Yontulmuş çakmaktaşı | – | El yapımı (Tab) | 137 |
| Diken ok ucu | 3 İri diken, 1 İp | – | El yapımı (Tab) | 50 |
| Granit balta | 2 Granit, 1 Herhangi sap, 2 İp, 1 Taş | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 62 |
| Granit kazma | 3 Granit, 1 Herhangi sap, 2 İp, 2 Dal | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 68 |
| Kemik ok ucu | 3 Kemik, 2 Taş | Çekiç taşı | El yapımı (Tab) | 11 |
| Kuvars balta | 1 Yontulmuş kuvars, 1 Herhangi sap, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 101 |
| Kuvars bıçak | 1 Kuvars pulu, 1 Herhangi sap, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 151 |
| Kuvars kazıyıcı | 1 Kuvars pulu, 3 Herhangi kemik, 2 İp, 2 Dal, 1 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 110 |
| Kuvars kazma | 1 Kuvars sivri ucu, 1 Herhangi sap, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 469 |
| Kuvars mızrak | 1 Kuvars sivri ucu, 1 Uzun sopa, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 459 |
| Kuvars ok ucu | 10 Kuvars pulu | – | El yapımı (Tab) | 837 |
| Kuvars pulu | 1 Yontulmuş kuvars, 3 İp, 2 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 62 |
| Kuvars sivri ucu | 8 Yontulmuş kuvars | – | El yapımı (Tab) | 292 |
| Lav camı ok ucu | 2 Lav camı, 1 İp | – | El yapımı (Tab) | 116 |
| Obsidyen balta | 1 Yontulmuş obsidyen, 1 Herhangi sap, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 113 |
| Obsidyen bıçak | 1 Obsidyen pulu, 1 Herhangi sap, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 170 |
| Obsidyen kazıyıcı | 1 Obsidyen pulu, 3 Herhangi kemik, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 129 |
| Obsidyen kazma | 1 Obsidyen sivri ucu, 1 Herhangi sap, 3 İp, 3 Dal, 3 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 725 |
| Obsidyen mızrak | 1 Obsidyen sivri ucu, 1 Uzun sopa, 3 İp, 3 Dal, 3 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 716 |
| Obsidyen ok ucu | 11 Obsidyen pulu | – | El yapımı (Tab) | 1.114 |
| Obsidyen pulu | 1 Yontulmuş obsidyen, 3 İp, 3 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 75 |
| Obsidyen sivri ucu | 10 Yontulmuş obsidyen | – | El yapımı (Tab) | 481 |
| Yontulmuş bazalt | 2 Bazalt, 2 İp, 1 Dal, 1 Taş | Çekiç taşı | El yapımı (Tab) | 26 |
| Yontulmuş çakmaktaşı | 3 Çakmaktaşı, 1 İp | Çekiç taşı | El yapımı (Tab) | 15 |
| Yontulmuş kuvars | 2 Kuvars, 2 İp, 1 Dal, 1 Taş | Çekiç taşı | El yapımı (Tab) | 28 |
| Yontulmuş obsidyen | 1 Obsidyen, 3 İp, 2 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 37 |

#### Temel aletler (38)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ağ | 3 Lif, 1 Halat, 1 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 63 |
| Bağlı uç | 2 Keskin taş, 3 İp, 1 Dal | – | El yapımı (Tab) | 28 |
| Balık kapanı | 2 Sepet, 3 İp, 1 Dal | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 33 |
| Bileği taşı | 2 Kumtaşı, 1 İp, 1 Dal, 1 Taş | Çekiç taşı | Örs · Silahçı Durdu (Orman) ve üstü döver | 17 |
| Bola | 1 Halat, 3 Nehir çakılı, 1 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 63 |
| Çekiç taşı | 4 Nehir çakılı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 5 |
| Dişbudak yayı | 1 Dişbudak sapı, 1 Sinir kirişi, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 79 |
| Dokuma tezgâhı | 1 Herhangi sap, 1 Halat, 3 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 114 |
| Halat | 6 İp | – | El yapımı (Tab) | 38 |
| İp | 4 Lif | – | El yapımı (Tab) | 5 |
| Kamış ok gövdesi | 3 Kamış, 1 İp | Taş bıçak | El yapımı (Tab) | 15 |
| Kemik iğne | 2 Kemik, 2 Kum | Bileği taşı | Örs · Silahçı Durdu (Orman) ve üstü döver | 9 |
| Kemik olta iğnesi | 1 Kemik, 1 Keskin taş, 2 Lif | Kemik iğne | El yapımı (Tab) | 10 |
| Kemik zıpkın | 3 Kemik, 1 İp, 1 Uzun sopa | Taş bıçak | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 57 |
| Keskin taş | 2 Taş | – | El yapımı (Tab) | 3 |
| Kirmen | 1 Sopa, 1 Taş halka, 2 İp, 2 Dal, 1 Taş | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 63 |
| Kürek | 1 Herhangi kalas, 2 Keskin taş, 2 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 41 |
| Mızrak | 1 Sopa, 2 Keskin taş, 2 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 39 |
| Mor ok | 2 Ok, 1 Mor zehir | – | El yapımı (Tab) | 377 |
| Ok | 1 Herhangi sap, 1 Herhangi ok ucu, 2 İp, 2 Dal, 2 Taş | – | El yapımı (Tab) | 78 |
| Olta | 1 Uzun sopa, 4 İp, 2 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 69 |
| Öğütme taşı | 2 Granit, 1 İp, 1 Dal, 1 Taş | Çekiç taşı | Örs · Silahçı Durdu (Orman) ve üstü döver | 17 |
| Pişirme taşı | 1 Taş levha, 1 Ateş, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 60 |
| Porsuk yayı | 1 Porsuk sapı, 1 Sinir kirişi, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 92 |
| Sapan | 1 Herhangi tabaklanmış deri, 1 Halat, 3 İp, 3 Dal, 3 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 293 |
| Sepet | 1 Hasır, 4 İp, 1 Dal, 1 Taş | – | El yapımı (Tab) | 51 |
| Sivri taş | 6 Keskin taş | – | El yapımı (Tab) | 23 |
| Sopa | 3 Dal, 2 Keskin taş | – | El yapımı (Tab) | 12 |
| Taş balta | 1 Sopa, 2 Keskin taş, 2 İp, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 39 |
| Taş bıçak | 1 Sivri taş, 4 Dal, 1 İp, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 43 |
| Taş havan | 1 Taş kase, 3 Nehir çakılı, 1 İp, 1 Dal, 1 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 49 |
| Taş kazma | 1 Sivri taş, 1 Sopa, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 64 |
| Taş kılıç | 1 Sopa, 4 Keskin taş, 2 İp, 1 Çakmaktaşı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 47 |
| Tuzak | 1 Halat, 1 Sopa, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 84 |
| Tüylü ok | 1 Ok, 3 Herhangi tüy, 2 İp, 2 Dal, 1 Taş | – | El yapımı (Tab) | 141 |
| Uzun sopa | 1 Sopa, 4 Dal, 1 İp | – | El yapımı (Tab) | 28 |
| Yaprak kova | 4 Yaprak, 3 Lif | – | El yapımı (Tab) | 8 |
| Zehirli ok | 1 Ok, 2 Sinek mantarı, 2 İp, 2 Dal, 2 Taş | – | El yapımı (Tab) | 145 |

#### Süs (38)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Altın kolye | 2 Altın külçesi, 1 Kehribar, 1 İp | – | El yapımı (Tab) | 288 |
| Ametist yüzük | 2 Ametist, 1 Gümüş külçesi | – | El yapımı (Tab) | 162 |
| Ana tanrıça heykelciği | 1 Kil figürin, 1 Kırmızı boya, 4 İp, 4 Kum | – | El yapımı (Tab) | 120 |
| Av sahnesi duvar resmi | 1 Mağara resmi, 1 Kırmızı boya, 5 İp, 4 Kum | – | El yapımı (Tab) | 216 |
| Ay taşı kolyesi | 1 Ay taşı, 2 İp | – | El yapımı (Tab) | 135 |
| Balık pulu | 2 Sazan, 2 İp, 2 Kum | Taş bıçak | El yapımı (Tab) | 30 |
| Beyaz boncuk | 1 Islak beyaz kil, 4 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 48 |
| Boyalı çömlek | 1 Herhangi çömlek, 1 Herhangi boya, 4 İp, 3 Kum | – | El yapımı (Tab) | 123 |
| Boynuz tarak | 1 Geyik boynuzu, 3 İp, 3 Kum | Taş bıçak | El yapımı (Tab) | 39 |
| Cilalı kristal | 1 Kristal parçası, 4 İp, 4 Kum | Bileği taşı | El yapımı (Tab) | 92 |
| Diş kolye | 1 Kurt dişi, 4 İp, 2 Kum | – | El yapımı (Tab) | 40 |
| Domuz dişi muska | 1 Yaban domuzu dişi, 4 İp, 2 Kum | – | El yapımı (Tab) | 42 |
| El izi resmi | 1 Kırmızı okr tozu, 3 Su, 2 İp, 1 Kum | – | El yapımı (Tab) | 45 |
| Gölge dişi kolyesi | 3 Gölge dişi, 1 Kristal ipek | – | El yapımı (Tab) | 551 |
| Göl boncuğu | 1 Islak göl kili, 3 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 38 |
| Gümüş yüzük | 1 Gümüş külçesi, 1 Kehribar | – | El yapımı (Tab) | 106 |
| Kartal pençesi kolyesi | 2 Kartal pençesi, 2 İp | – | El yapımı (Tab) | 75 |
| Kehribar boncuk | 1 Kehribar, 4 İp, 3 Kum | Bileği taşı | El yapımı (Tab) | 50 |
| Kehribar kolye | 1 Kehribar boncuk, 6 İp, 3 Kum | – | El yapımı (Tab) | 108 |
| Kemik kolye | 3 Kemik, 3 İp | – | El yapımı (Tab) | 27 |
| Kırmızı boncuk | 1 Islak kırmızı kil, 3 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 43 |
| Kıymık kolye | 2 Mor kıymık, 2 İp | – | El yapımı (Tab) | 88 |
| Kil figürin | 1 Islak beyaz kil, 2 Su, 1 Dal | Taş bıçak | El yapımı (Tab) | 26 |
| Kristal boynuz tılsımı | 1 Kristal boynuz, 1 Işık pulu, 2 İp | – | El yapımı (Tab) | 356 |
| Kristal çiçeği tacı | 3 Kristal çiçeği, 1 Mor sarmaşık | – | El yapımı (Tab) | 382 |
| Kristal parçası | 1 Kristal, 4 İp, 3 Kum | Çekiç taşı | El yapımı (Tab) | 45 |
| Kül dişi muska | 2 Kül dişi, 1 Halat, 1 Kehribar | – | El yapımı (Tab) | 277 |
| Mağara resmi | 1 Kara boya, 1 Taş levha, 4 İp, 4 Kum | – | El yapımı (Tab) | 78 |
| Nehir boncuğu | 1 Islak nehir kili, 3 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 38 |
| Papatya tacı | 3 Papatya, 3 Lif | – | El yapımı (Tab) | 8 |
| Pençe kolye | 1 Ayı pençesi, 5 İp, 2 Kum | – | El yapımı (Tab) | 63 |
| Sarkıt parçası | 1 Sarkıt, 3 İp, 3 Kum | Çekiç taşı | El yapımı (Tab) | 31 |
| Taş halka | 2 Granit, 2 İp, 1 Kum | Bileği taşı | El yapımı (Tab) | 23 |
| Taş totem | 2 Granit, 1 Herhangi boya, 2 İp, 2 Kum | – | El yapımı (Tab) | 48 |
| Tatlısu incisi | 3 Tatlısu midyesi, 1 İp | Taş bıçak | El yapımı (Tab) | 19 |
| Timsah dişi kolye | 2 Timsah dişi, 2 İp, 1 Kemik | – | El yapımı (Tab) | 104 |
| Yarasa kanadı yelpazesi | 2 Yarasa kanadı, 1 Herhangi sap, 2 İp | – | El yapımı (Tab) | 162 |
| Yıldız çelengi | 3 Yıldız çiçeği, 2 Mor sarmaşık | – | El yapımı (Tab) | 388 |

#### Taş ve kil (26)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Beyaz çömlek | 1 Islak beyaz kil, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 52 |
| Beyaz kase | 1 Beyaz çömlek, 5 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 85 |
| Beyaz kerpiç | 1 Islak beyaz kil, 3 Kuru ot, 2 Kum, 1 Su | – | El yapımı (Tab) | 25 |
| Beyaz tuğla | 1 Beyaz kerpiç, 1 Ateş, 4 Kum, 3 Su | – | El yapımı (Tab) | 68 |
| Cüruf tuğlası | 3 Cüruf, 2 Kül, 1 Su | – | El yapımı (Tab) | 102 |
| Göl çömleği | 1 Islak göl kili, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 49 |
| Göl kasesi | 1 Göl çömleği, 4 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 79 |
| Göl kerpici | 1 Islak göl kili, 3 Kuru ot, 1 Kum, 1 Su | – | El yapımı (Tab) | 20 |
| Göl tuğlası | 1 Göl kerpici, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 60 |
| Islak beyaz kil | 1 Beyaz kil, 4 Su, 1 Kum | – | El yapımı (Tab) | 14 |
| Islak göl kili | 2 Göl kili, 3 Su | – | El yapımı (Tab) | 11 |
| Islak kırmızı kil | 2 Kırmızı kil, 3 Su, 1 Kum | – | El yapımı (Tab) | 15 |
| Islak nehir kili | 2 Nehir kili, 3 Su | – | El yapımı (Tab) | 11 |
| Kırmızı çömlek | 1 Islak kırmızı kil, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 54 |
| Kırmızı kase | 1 Kırmızı çömlek, 5 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 87 |
| Kırmızı kerpiç | 1 Islak kırmızı kil, 3 Kuru ot, 2 Kum, 1 Su | – | El yapımı (Tab) | 27 |
| Kırmızı tuğla | 1 Kırmızı kerpiç, 1 Ateş, 4 Kum, 3 Su | – | El yapımı (Tab) | 71 |
| Kızıl cam | 3 Kızıl kum, 1 Ateş | – | El yapımı (Tab) | 117 |
| Kireç harcı | 1 Sönmemiş kireç, 5 Su, 2 Kum | – | El yapımı (Tab) | 63 |
| Kristal cam | 3 Kristal kum, 1 Ateş | – | El yapımı (Tab) | 226 |
| Nehir çömleği | 1 Islak nehir kili, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 49 |
| Nehir kasesi | 1 Nehir çömleği, 4 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 79 |
| Nehir kerpici | 1 Islak nehir kili, 3 Kuru ot, 1 Kum, 1 Su | – | El yapımı (Tab) | 20 |
| Nehir tuğlası | 1 Nehir kerpici, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 60 |
| Sönmemiş kireç | 2 Kireçtaşı, 1 Ateş, 2 Kum, 2 Su | – | El yapımı (Tab) | 39 |
| Taş levha | 2 Arduvaz, 2 Kum, 1 Su | Çekiç taşı | El yapımı (Tab) | 12 |

#### Yapılar (25)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ağıl | 10 Çit | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 810 |
| Arı kovanı | 2 Söğüt sepeti, 1 Balmumu, 3 Taş, 2 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 140 |
| Ateş yeri | 1 Ateş, 4 Taş, 1 Dal, 1 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 34 |
| Atölye | 4 Herhangi kalas, 4 Taş, 2 İp, 2 Sopa | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 127 |
| Çit | 1 Herhangi sap, 2 Sarmaşık ipi, 2 Taş, 2 Dal, 1 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 60 |
| Çömlek fırını | 1 Kerpiç duvar, 1 Herhangi kömür, 3 Taş, 3 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 331 |
| Deri çadır | 1 Kulübe iskeleti, 1 Herhangi tabaklanmış deri, 3 Taş, 3 Dal, 3 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 410 |
| Erzak çukuru | 1 Taş levha, 3 Kuru ot, 1 Taş, 1 Dal | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 22 |
| Hasır yatak | 2 Hasır, 6 Yaprak, 2 Sopa | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 83 |
| İskele | 1 Herhangi kalas, 1 Kenevir halatı, 3 Taş, 2 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 215 |
| Kamış kulübe | 1 Kulübe iskeleti, 1 Kamış kulübe çatısı, 3 Taş, 2 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 229 |
| Kamış kulübe çatısı | 6 Kamış hasır | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 38 |
| Kerpiç duvar | 9 Herhangi kerpiç | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 234 |
| Kerpiç ev | 1 Kerpiç duvar, 1 Kamış kulübe çatısı, 3 Taş, 3 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 378 |
| Kulübe | 1 Kulübe iskeleti, 1 Hasır, 3 Taş, 2 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 201 |
| Kulübe iskeleti | 7 Herhangi kalas | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 131 |
| Kurutma rafı | 1 Herhangi sap, 1 Hasır, 2 Taş, 2 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 70 |
| Megalit | 2 Granit, 1 Kenevir halatı, 2 Taş, 2 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 198 |
| Su testisi | 1 Herhangi çömlek, 3 Su, 2 Taş, 2 Dal, 1 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 77 |
| Tabakhane | 1 Deri tulum, 1 Meşe tanini, 4 Taş, 4 Dal, 3 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 607 |
| Taş çember | 11 Megalit | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 2.941 |
| Taş fırın | 1 Herhangi tuğla, 1 Ateş yeri, 3 Taş, 3 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 138 |
| Tuz havuzu | 1 Tuz, 1 Herhangi kase, 3 Taş, 3 Dal, 3 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 145 |
| Tütsühane | 1 Kulübe iskeleti, 1 Duman, 3 Taş, 3 Dal, 2 Kum | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 234 |
| Yosun yalıtım | 3 Yosun, 1 Islak nehir kili, 1 Taş, 1 Dal | – | Usta Kemal / Marangoz Rıza yapar, yere kurulur | 20 |

#### Giyim (25)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ayı postu pelerin | 1 Mağara ayısı postu giysi, 1 Ayı pençesi, 6 Lif, 5 İp | – | El yapımı (Tab) | 494 |
| Bataklık postu pelerin | 2 Bataklık kurdu postu, 1 Sinir kirişi, 4 Lif | – | El yapımı (Tab) | 100 |
| Boyalı tunik | 1 Keten tunik, 1 Herhangi boya, 5 Lif, 4 İp | – | El yapımı (Tab) | 296 |
| Dağ keçisi postu giysi | 1 Tabaklanmış dağ keçisi derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 258 |
| Deri çarık | 1 Tabaklanmış geyik derisi, 1 Sinir kirişi, 5 Lif, 4 İp | – | El yapımı (Tab) | 276 |
| Geyik postu giysi | 1 Tabaklanmış geyik derisi, 6 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 262 |
| Kamış çizme | 6 Kamış, 3 İp, 2 Yosun | – | El yapımı (Tab) | 29 |
| Karaca postu giysi | 1 Tabaklanmış karaca derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 257 |
| Kemik miğfer | 4 Kemik, 2 Sinir, 1 Herhangi tabaklanmış deri | – | El yapımı (Tab) | 228 |
| Kemik zırh | 8 Kemik, 3 Sinir, 2 Herhangi tabaklanmış deri, 4 İp | – | El yapımı (Tab) | 480 |
| Keten tunik | 1 Keten kumaş, 4 Lif, 4 İp | Kemik iğne | El yapımı (Tab) | 170 |
| Kristal ipek kumaş | 4 Kristal ipek, 2 Lif | – | El yapımı (Tab) | 476 |
| Kunduz postu giysi | 1 Tabaklanmış kunduz derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 262 |
| Kurt postu giysi | 1 Tabaklanmış kurt derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 262 |
| Kül postu pelerin | 2 Kül kurdu postu, 1 Sinir kirişi, 4 Kül | – | El yapımı (Tab) | 325 |
| Kürk başlık | 1 Tabaklanmış kunduz derisi, 1 Sinir kirişi, 5 Lif, 4 İp | – | El yapımı (Tab) | 277 |
| Kürk eldiven | 1 Tabaklanmış tavşan derisi, 1 Sinir kirişi, 5 Lif, 4 İp | – | El yapımı (Tab) | 270 |
| Lav pulu eldiven | 2 Lav pulu, 1 Herhangi tabaklanmış deri, 1 Sinir kirişi | – | El yapımı (Tab) | 550 |
| Mağara ayısı postu giysi | 1 Tabaklanmış mağara ayısı derisi, 6 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 291 |
| Muflon postu giysi | 1 Tabaklanmış muflon derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 258 |
| Tavşan postu giysi | 1 Tabaklanmış tavşan derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 255 |
| Timsah derisi zırh | 2 Timsah derisi, 1 Sinir kirişi, 4 İp | – | El yapımı (Tab) | 158 |
| Tüylü başlık | 3 Herhangi tüy, 1 Herhangi tabaklanmış deri, 4 Lif, 3 İp | – | El yapımı (Tab) | 244 |
| Yaban domuzu postu giysi | 1 Tabaklanmış yaban domuzu derisi, 5 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 262 |
| Yaban öküzü postu giysi | 1 Tabaklanmış yaban öküzü derisi, 6 Lif, 5 İp | Kemik iğne | El yapımı (Tab) | 274 |

#### Av ve hayvan (19)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Balık yağı | 1 Yayın, 3 Su, 3 Lif | Taş havan | El yapımı (Tab) | 21 |
| Sinir kirişi | 2 Sinir, 2 Su, 1 Lif | Taş bıçak | El yapımı (Tab) | 16 |
| Tabaklanmış dağ keçisi derisi | 1 Dağ keçisi derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 147 |
| Tabaklanmış geyik derisi | 1 Geyik derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 149 |
| Tabaklanmış gölge postu | 1 Gölge postu, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 327 |
| Tabaklanmış işık tilkisi postu | 1 Işık tilkisi postu, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 210 |
| Tabaklanmış karaca derisi | 1 Karaca derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 146 |
| Tabaklanmış kristal geyik derisi | 1 Kristal geyik derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 236 |
| Tabaklanmış kunduz derisi | 2 Kunduz derisi, 1 Meşe tanini, 4 Su, 3 Lif | – | El yapımı (Tab) | 150 |
| Tabaklanmış kurt derisi | 1 Kurt derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 150 |
| Tabaklanmış mağara ayısı derisi | 1 Mağara ayısı derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 170 |
| Tabaklanmış muflon derisi | 1 Muflon derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 147 |
| Tabaklanmış sincap derisi | 3 Sincap derisi, 1 Meşe tanini, 3 Su, 3 Lif | – | El yapımı (Tab) | 143 |
| Tabaklanmış su samuru derisi | 2 Su samuru derisi, 1 Meşe tanini, 4 Su, 3 Lif | – | El yapımı (Tab) | 150 |
| Tabaklanmış tavşan derisi | 2 Tavşan derisi, 1 Meşe tanini, 4 Su, 3 Lif | – | El yapımı (Tab) | 145 |
| Tabaklanmış vaşak derisi | 1 Vaşak derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 164 |
| Tabaklanmış yaban atı derisi | 1 Yaban atı derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 151 |
| Tabaklanmış yaban domuzu derisi | 1 Yaban domuzu derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 150 |
| Tabaklanmış yaban öküzü derisi | 1 Yaban öküzü derisi, 1 Meşe tanini, 4 Su, 4 Lif | – | El yapımı (Tab) | 157 |

#### Ateş (18)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ateş | 1 Herhangi çakmak, 4 Dal, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Balmumu mumu | 1 Balmumu, 3 Lif, 3 Dal, 3 Yaprak | – | El yapımı (Tab) | 129 |
| Don yağı mumu | 2 Hayvan yağı, 3 Lif | – | El yapımı (Tab) | 11 |
| Duman | 1 Ateş, 4 Yaprak, 2 Dal | – | El yapımı (Tab) | 34 |
| Golem feneri | 1 Golem çekirdeği, 2 Kristal, 2 Herhangi kalas | – | El yapımı (Tab) | 855 |
| Hasırotu meşalesi | 3 Hasırotu, 2 Hayvan yağı | – | El yapımı (Tab) | 11 |
| Işık fitili | 2 Işık tozu, 2 Lif | – | El yapımı (Tab) | 203 |
| Kaba meşale | 2 Dal, 2 Lif, 2 Yaprak | – | El yapımı (Tab) | 7 |
| Kamp ateşi | 5 Dal, 3 Taş, 2 Kuru ot, 1 Çakmaktaşı | – | El yapımı (Tab) | 14 |
| Kav | 3 Kav mantarı, 1 Kıvılcım, 1 Dal, 1 Yaprak | – | El yapımı (Tab) | 24 |
| Kıvılcım | 3 Çakmaktaşı, 3 Taş | – | El yapımı (Tab) | 11 |
| Kil lamba | 1 Herhangi kase, 2 Hayvan yağı, 4 Dal, 3 Yaprak | – | El yapımı (Tab) | 129 |
| Kor | 1 Ateş, 1 Herhangi kömür, 4 Dal, 3 Yaprak | – | El yapımı (Tab) | 40 |
| Kozalak ateşi | 3 Çam kozalağı, 1 Herhangi çakmak, 1 Dal, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Kükürt çakmağı | 2 Kükürt, 1 Pirit, 2 Kuru ot | – | El yapımı (Tab) | 24 |
| Meşale | 1 Sopa, 1 Herhangi reçine, 3 Dal, 3 Yaprak | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 61 |
| Pirit çakmağı | 1 Pirit, 3 Çakmaktaşı, 2 Dal, 1 Yaprak | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 18 |
| Taş lamba | 1 Taş kase, 2 Hayvan yağı, 2 Dal, 2 Yaprak | – | El yapımı (Tab) | 49 |

#### Zırh (26)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akrep kabuğu çizme | 3 Akrep kabuğu, 1 Lav pulu, 1 Herhangi tabaklanmış deri, 1 Akrep iğnesi | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 620 |
| Bataklık çizmesi | 1 Demir levha, 3 Su samuru derisi, 6 Kamış, 2 Turba | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 479 |
| Ceviz kabuğu miğfer | 6 Ceviz, 1 Meşe kalası, 1 Tabaklanmış karaca derisi, 2 İri diken | – | Örs · Zırhçı Duran (Orman) ve üstü döver | 280 |
| Demir çizme | 1 Demir levha, 1 Demir halka, 1 Herhangi tabaklanmış deri, 4 Lif | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 905 |
| Demir eldiven | 1 Demir levha, 1 Demir halka, 1 Herhangi tabaklanmış deri, 2 İp | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 914 |
| Demir miğfer | 1 Demir levha, 2 Demir halka, 1 Herhangi tabaklanmış deri | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.134 |
| Demir zırh | 3 Demir levha, 4 Demir halka, 2 Herhangi tabaklanmış deri, 1 Sinir kirişi | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 2.748 |
| Ejder pulu eldiven ² | 4 Yavru ejder pulu, 2 Ejder dişi, 1 Mantar lifi eldiven | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 2.968 |
| Ejder pulu zırh | 2 Kara pul, 2 Demir levha, 2 Herhangi tabaklanmış deri | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 2.488 |
| Fırtına tüyü başlık ² | 4 Fırtına tüyü, 2 Gök tazısı postu, 1 Demir miğfer | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 1.980 |
| Gümüş pullu zırh | 3 Gümüş külçesi, 3 Demir halka, 2 Tabaklanmış mağara ayısı derisi, 2 Ayı pençesi | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.396 |
| Hurda çizme ² | 2 Ağır plaka, 6 Vida, 4 Dişli, 1 Demir çizme | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 1.631 |
| Işık pulu eldiven | 4 Işık pulu, 2 Kristal, 1 Tabaklanmış işık tilkisi postu | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 1.000 |
| Kartal tüyü miğfer | 6 Kartal tüyü, 1 Gümüş külçesi, 2 Öküz boynuzu, 1 Tabaklanmış yaban öküzü derisi | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 435 |
| Kristal ipek zırh | 5 Kristal ipek, 3 Ametist, 2 Demir levha, 2 Tabaklanmış gölge postu | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 2.554 |
| Kristal miğfer ² | 3 Kristal kanat, 4 Golem parçası, 2 Kobalt külçesi, 1 Fırtına tüyü başlık | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 3.699 |
| Kül böceği zırh | 5 Kül böceği kabuğu, 2 Demir levha, 2 Kül kurdu postu, 2 Lav pulu | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 1.736 |
| Mantar lifi eldiven ² | 4 Böcek kabuğu, 4 Spor tozu, 2 Goblin kulağı, 1 Demir eldiven | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 1.520 |
| Meka çizme ² | 3 Titanyum külçesi, 2 Uzaylı devresi, 1 Muhafız zırhı parçası, 1 Hurda çizme | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 4.298 |
| Meka zırh ² | 4 Titanyum külçesi, 3 Kobalt külçesi, 2 Enerji hücresi, 1 Motor, 1 Golem çekirdeği | – | Mühendis Selin yapar (600 sikke işçilik) | 5.200 |
| Meşe kabuk zırh | 3 Meşe kalası, 2 Tabaklanmış yaban domuzu derisi, 6 Kirpi dikeni, 1 Sinir kirişi | – | Örs · Zırhçı Duran (Orman) ve üstü döver | 543 |
| Timsah pulu zırh | 2 Demir levha, 3 Timsah derisi, 2 Bataklık kurdu postu, 1 Sinir kirişi | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.177 |
| Tunç çizme | 1 Tunç levha, 1 Herhangi tabaklanmış deri, 4 Lif | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 884 |
| Tunç eldiven | 1 Tunç levha, 1 Herhangi tabaklanmış deri, 2 İp | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 893 |
| Tunç miğfer | 1 Tunç levha, 1 Herhangi tabaklanmış deri, 2 Sinir | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 887 |
| Tunç zırh | 3 Tunç levha, 2 Herhangi tabaklanmış deri, 1 Sinir kirişi | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 2.452 |

#### Ev eşyası (14)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ahşap karyola | 4 Herhangi kalas, 2 Herhangi tabaklanmış deri, 6 Kuru ot | – | Usta Kemal yapar (ev içine konur) | 475 |
| Asma fener | 1 Balmumu mumu, 1 Herhangi kalas, 1 Halat | – | Usta Kemal yapar (ev içine konur) | 246 |
| Dolap | 5 Herhangi kalas, 1 Halat, 1 Herhangi boya | – | Usta Kemal yapar (ev içine konur) | 174 |
| Duvar halısı | 2 Keten kumaş, 2 Herhangi boya, 1 Sopa | – | Usta Kemal yapar (ev içine konur) | 332 |
| Halı | 3 Keten kumaş, 2 Herhangi boya, 2 Keten ipliği | – | Usta Kemal yapar (ev içine konur) | 585 |
| Kilim | 3 Keten ipliği, 1 Herhangi boya, 6 Lif | – | Usta Kemal yapar (ev içine konur) | 228 |
| Masa | 3 Herhangi kalas, 4 Sopa, 2 İp | – | Usta Kemal yapar (ev içine konur) | 139 |
| Mor yosun yastığı | 4 Mor yosun, 3 Lif | – | Usta Kemal yapar (ev içine konur) | 243 |
| Perde | 2 Keten kumaş, 1 Sopa, 2 İp | – | Usta Kemal yapar (ev içine konur) | 302 |
| Raf | 2 Herhangi kalas, 2 İp, 1 Sopa | – | Usta Kemal yapar (ev içine konur) | 70 |
| Saksı | 1 Herhangi çömlek, 2 Kum, 2 Papatya | – | Usta Kemal yapar (ev içine konur) | 72 |
| Sandalye | 2 Herhangi kalas, 2 Sopa, 2 İp | – | Usta Kemal yapar (ev içine konur) | 86 |
| Sandık | 4 Herhangi kalas, 1 Halat, 2 Taş | – | Usta Kemal yapar (ev içine konur) | 135 |
| Tabure | 1 Herhangi kalas, 3 Sopa, 1 İp | – | Usta Kemal yapar (ev içine konur) | 76 |

#### Boya (13)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Beyaz boya | 1 Beyaz kil, 2 Hayvan yağı, 2 Su, 2 Kum | – | El yapımı (Tab) | 20 |
| Gelincik boyası | 3 Gelincik, 2 Hayvan yağı, 1 Su | – | El yapımı (Tab) | 16 |
| Işıltılı boya | 3 Güve tozu, 1 Su | – | El yapımı (Tab) | 182 |
| Kara boya | 1 Herhangi kömür, 2 Hayvan yağı, 3 Su, 3 Kum | – | El yapımı (Tab) | 20 |
| Kırmızı boya | 1 Kırmızı okr tozu, 2 Hayvan yağı, 3 Su, 2 Kum | – | El yapımı (Tab) | 42 |
| Kırmızı okr tozu | 2 Kırmızı okr, 2 Su, 2 Kum | Taş havan | El yapımı (Tab) | 22 |
| Liken boyası | 3 Liken, 1 Su | – | El yapımı (Tab) | 26 |
| Mor kök boyası | 2 Mor kök, 1 Su | – | El yapımı (Tab) | 149 |
| Mürver boyası | 3 Mürver, 2 Hayvan yağı, 1 Su | – | El yapımı (Tab) | 16 |
| Sarı boya | 1 Sarı okr tozu, 2 Hayvan yağı, 3 Su, 2 Kum | – | El yapımı (Tab) | 42 |
| Sarı okr tozu | 2 Sarı okr, 2 Su, 2 Kum | Taş havan | El yapımı (Tab) | 22 |
| Yaban mersini boyası | 2 Yaban mersini, 2 Hayvan yağı, 1 Su, 1 Kum | – | El yapımı (Tab) | 17 |
| Yıldız mürekkebi | 2 Yıldız tozu, 1 Su | – | El yapımı (Tab) | 227 |

#### Taşıtlar (10)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Gemi | 8 Herhangi kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek | Taş balta | El yapımı (Tab) | 1.954 |
| Kızak | 1 Herhangi kalas, 2 Hayvan yağı, 2 İp, 2 Dal | – | El yapımı (Tab) | 41 |
| Kütük salı | 2 Herhangi odun, 1 Halat, 2 İp, 2 Dal | – | El yapımı (Tab) | 73 |
| Oyma kano | 2 Herhangi odun, 1 Kor, 4 İp, 3 Dal | – | El yapımı (Tab) | 97 |
| Roket ² | 1 Roket gövdesi, 1 Roket motoru, 4 Uzaylı devresi, 6 Gök ipeği | – | Astronot Tuna yapar (2000 sikke işçilik) | 30.000 |
| Roket gövdesi ² | 4 Meteor demiri külçesi, 4 Titanyum külçesi, 3 Gök camı | – | Astronot Tuna yapar (1000 sikke işçilik) | 9.000 |
| Roket motoru ² | 2 Yıldız külçesi, 3 Plazma hücresi, 1 Ejder kalbi, 1 Yakıt hücresi | – | Astronot Tuna yapar (1500 sikke işçilik) | 14.000 |
| Sal | 1 Herhangi kalas, 1 Halat, 3 İp, 3 Dal | – | El yapımı (Tab) | 92 |
| Sandal küreği | 1 Herhangi kalas, 3 İp, 3 Dal | Çakmaktaşı bıçak | El yapımı (Tab) | 52 |
| Yelkenli sal | 1 Sal, 3 Hasır, 2 Halat, 2 Uzun sopa, 1 Sandal küreği, 1 Hasat sepeti | Taş balta | El yapımı (Tab) | 640 |

#### Metal (9)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Altın külçesi | 3 Altın cevheri, 1 Herhangi kömür | – | El yapımı (Tab) | 93 |
| Bakır külçesi | 3 Bakır cevheri, 1 Herhangi kömür | – | El yapımı (Tab) | 27 |
| Demir halka | 1 Demir külçesi, 1 Herhangi kömür, 2 Kum | – | El yapımı (Tab) | 162 |
| Demir külçesi | 3 Demir cevheri, 2 Herhangi kömür, 1 Taş | – | El yapımı (Tab) | 111 |
| Demir levha | 2 Demir külçesi, 1 Herhangi kömür | – | El yapımı (Tab) | 315 |
| Gümüş külçesi | 3 Gümüş cevheri, 1 Herhangi kömür | – | El yapımı (Tab) | 61 |
| Kalay külçesi | 3 Kalay cevheri, 1 Herhangi kömür | – | El yapımı (Tab) | 32 |
| Tunç külçesi | 3 Bakır külçesi, 1 Kalay külçesi | – | El yapımı (Tab) | 158 |
| Tunç levha | 2 Tunç külçesi, 1 Herhangi kömür | – | El yapımı (Tab) | 463 |

#### Metal aletler (14)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ametist kılıcı | 5 Ametist, 3 Obsidyen, 2 Kristal, 1 Işık ağacı sapı, 2 Gölge dişi | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 763 |
| Demir balta | 3 Demir külçesi, 1 Herhangi sap, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 538 |
| Demir kazma | 4 Demir külçesi, 1 Herhangi sap, 1 Sinir kirişi, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 696 |
| Demir kılıç | 5 Demir külçesi, 1 Herhangi sap, 1 Herhangi tabaklanmış deri, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.086 |
| Demir mızrak | 3 Demir külçesi, 1 Uzun sopa, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 528 |
| Ejder kılıcı | 2 Ejder kemiği, 3 Demir külçesi, 1 Altın külçesi, 1 Herhangi tabaklanmış deri | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 1.392 |
| Granit gürz | 4 Granit, 1 Meşe sapı, 3 Yaban domuzu dişi, 1 Sinir kirişi | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 112 |
| Gümüş kılıç | 4 Gümüş külçesi, 3 Kuvars, 1 Ardıç sapı, 2 Kartal pençesi | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 472 |
| Lav camı kılıcı | 4 Lav camı, 3 Bazalt, 3 Demir külçesi, 1 Kızıl sedir sapı, 1 Ateş bezesi | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 955 |
| Timsah dişi kılıcı | 4 Demir külçesi, 3 Timsah dişi, 1 Bataklık servisi sapı, 1 Tabaklanmış su samuru derisi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.011 |
| Tunç balta | 2 Tunç külçesi, 1 Herhangi sap, 2 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 518 |
| Tunç kazma | 3 Tunç külçesi, 1 Herhangi sap, 2 İp, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 750 |
| Tunç kılıç | 4 Tunç külçesi, 1 Herhangi sap, 1 Herhangi tabaklanmış deri | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 1.169 |
| Tunç mızrak | 2 Tunç külçesi, 1 Uzun sopa, 3 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 521 |

#### Müzik (6)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Boynuz borazan | 1 Öküz boynuzu, 3 Lif, 3 Dal | Bileği taşı | El yapımı (Tab) | 30 |
| Deri davul | 1 Herhangi tabaklanmış deri, 1 Herhangi kase, 5 Lif, 5 Dal | – | El yapımı (Tab) | 337 |
| Kamış flüt | 3 Kamış, 1 Lif | Kemik iğne | El yapımı (Tab) | 6 |
| Kemik flüt | 3 Kemik, 1 Lif | Çakmaktaşı bıçak | El yapımı (Tab) | 21 |
| Pişmiş kil düdük | 1 Islak nehir kili, 1 Sopa, 3 Lif, 2 Dal | – | El yapımı (Tab) | 37 |
| Yankı çanı | 2 Yankı taşı, 1 Herhangi kalas, 1 İp | – | El yapımı (Tab) | 239 |

#### Maden (6)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Gök demiri külçesi ² | 3 Gök demiri, 2 Herhangi kömür, 1 Taş | – | El yapımı (Tab) | 131 |
| Kobalt külçesi ² | 3 Kobalt cevheri, 2 Herhangi kömür | – | El yapımı (Tab) | 184 |
| Meteor demiri külçesi ² | 3 Meteor demiri, 2 Herhangi kömür, 1 Füzyon taşı | – | El yapımı (Tab) | 390 |
| Pirinç külçesi ² | 3 Pirinç cevheri, 1 Herhangi kömür | – | El yapımı (Tab) | 102 |
| Titanyum külçesi ² | 3 Titanyum cevheri, 2 Herhangi kömür, 1 Enerji taşı | – | El yapımı (Tab) | 273 |
| Yıldız külçesi ² | 3 Yıldız cevheri, 1 Plazma hücresi | – | El yapımı (Tab) | 1.135 |

#### Tarım (5)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Hasat sepeti | 2 Buğday, 2 Havuç, 2 Patates, 2 Soğan, 1 Kabak, 1 Ayçiçeği | – | El yapımı (Tab) | 144 |
| Korkuluk | 2 Sopa, 4 Kuru ot, 1 Kabak, 1 İp | – | El yapımı (Tab) | 74 |
| Sulama kabı | 1 Herhangi çömlek, 2 İp, 1 Sopa | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 96 |
| Tırmık | 2 Sopa, 3 Keskin taş, 1 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 50 |
| Tırpan | 1 Uzun sopa, 2 Çakmaktaşı pulu, 2 İp, 1 Dal | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 153 |

#### Silah (5)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Işın kılıcı ² | 2 Titanyum külçesi, 2 Plazma hücresi, 2 Ejder dişi, 3 Kristal lifi | – | Ejder Avcısı Alara yapar (800 sikke işçilik) | 6.400 |
| Pompalı ² | 1 Ağır plaka, 4 Dişli, 2 Herhangi kalas, 6 Vida, 1 Motor | – | Silahçı Tamer yapar (400 sikke işçilik) | 2.600 |
| Pompalı fişeği ² | 1 Pirinç külçesi, 2 Barut | – | El yapımı (Tab) | 90 |
| Tabanca ² | 2 Gök demiri külçesi, 3 Dişli, 1 Herhangi sap, 4 Vida | – | Silahçı Tamer yapar (200 sikke işçilik) | 1.400 |
| Tabanca mermisi ² | 1 Pirinç külçesi, 1 Barut | – | El yapımı (Tab) | 60 |

#### Temel (4)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Buhar | 1 Sıcak su, 1 Ateş, 4 Taş, 3 Su | – | El yapımı (Tab) | 83 |
| Gübre | 2 Yarasa gübresi, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Sıcak su | 4 Su, 1 Ateş, 2 Taş | – | El yapımı (Tab) | 34 |
| Tuz | 2 Tuz kayası, 2 Taş, 2 Su | Çekiç taşı | El yapımı (Tab) | 15 |

#### Bitki (3)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Isırgan lifi | 3 Isırgan, 1 Su | Taş havan | El yapımı (Tab) | 10 |
| Kenevir lifi | 2 Kenevir, 2 Su, 1 Lif | Taş havan | El yapımı (Tab) | 16 |
| Keten lifi | 2 Keten, 2 Su, 1 Lif | Taş havan | El yapımı (Tab) | 16 |

#### Büyü (3)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ateş asası ² | 1 Mavi mantar kalası, 2 Spor kristali, 3 Büyü otu, 1 Yüzer taş | – | Büyücü Pervin yapar (100 sikke işçilik) | 900 |
| Buz asası ² | 1 Kristal çam kalası, 3 Buz kristali, 1 Enerji taşı, 2 Büyü otu | – | Büyücü Pervin yapar (200 sikke işçilik) | 1.600 |
| Yıldırım asası ² | 1 Kömür ağacı kalası, 3 Plazma taşı, 2 Ejder kristali, 3 Büyü otu | – | Büyücü Pervin yapar (300 sikke işçilik) | 3.200 |


## "Herhangi" grupları

| Grup | Yerine geçen eşyalar |
|---|---|
| Herhangi balık | Sazan, Alabalık, Yayın, Tatlısu kefali, Kerevit, Tatlısu midyesi, Turna balığı, Kızılkanat, Tatlısu levreği, Yılan balığı, Kadife balığı, Kurbağa, Mersin balığı, Çapak |
| Herhangi boya | Kırmızı boya, Sarı boya, Kara boya, Beyaz boya, Mürver boyası, Yaban mersini boyası, Gelincik boyası, Işıltılı boya, Liken boyası, Mor kök boyası, Yıldız mürekkebi |
| Herhangi çakmak | Kıvılcım, Pirit çakmağı, Kükürt çakmağı, Kav |
| Herhangi çiğ et | Tavşan eti, Sincap eti, Geyik eti, Karaca eti, Yaban domuzu eti, Kurt eti, Kunduz eti, Su samuru eti, Yaban öküzü eti, Yaban atı eti, Dağ keçisi eti, Muflon eti, Mağara ayısı eti, Keklik eti, Bıldırcın eti, Ördek eti, Yaban kazı eti, Turna kuşu eti, Ur kekliği eti, Kartal eti, Vaşak eti, Işık tilkisi eti, Kristal geyik eti, Bulut koyunu eti, Rüzgâr kuşu eti, Kertenkele eti, Buz tavşanı eti, Kor kertenkelesi eti, Yıldız tilkisi eti |
| Herhangi çömlek | Nehir çömleği, Göl çömleği, Kırmızı çömlek, Beyaz çömlek |
| Herhangi kalas | Meşe kalası, Çam kalası, Huş kalası, Kayın kalası, Ladin kalası, Ihlamur kalası, Akçaağaç kalası, Kestane kalası, Ceviz kalası, Dişbudak kalası, Porsuk kalası, Söğüt kalası, Kavak kalası, Kızılağaç kalası, Ardıç kalası, Bataklık servisi kalası, Kara çam kalası, Kül ağacı kalası, Dikenli akasya kalası, Kızıl sedir kalası, Ateş narı kalası, Mor söğüt kalası, Gece ağacı kalası, Işık ağacı kalası, Yıldız eriği kalası, Ay elması kalası, Bulut çamı kalası, Gök söğüdü kalası, Rüzgâr meşesi kalası, Bulut elması kalası, Dev mantar kalası, Mavi mantar kalası, Spor ağacı kalası, Kök ağacı kalası, Hurda palmiyesi kalası, Pas ağacı kalası, Kuru çınar kalası, Hurma kalası, Kristal çam kalası, Taş ağacı kalası, Mavi sedir kalası, Kristal armut kalası, Kömür ağacı kalası, Lav palmiyesi kalası, Obsidyen dikeni kalası, Ejder meyvesi kalası, Gök kamışı kalası, Bulut kavağı kalası, Yıldız akasyası kalası, Gök üzümü kalası |
| Herhangi kase | Nehir kasesi, Göl kasesi, Kırmızı kase, Beyaz kase |
| Herhangi kemik | Kemik |
| Herhangi kerpiç | Nehir kerpici, Göl kerpici, Kırmızı kerpiç, Beyaz kerpiç |
| Herhangi kömür | Taş kömürü, Meşe kömürü, Çam kömürü, Huş kömürü, Kayın kömürü, Ladin kömürü, Ihlamur kömürü, Akçaağaç kömürü, Kestane kömürü, Ceviz kömürü, Dişbudak kömürü, Porsuk kömürü, Söğüt kömürü, Kavak kömürü, Kızılağaç kömürü, Ardıç kömürü, Turba, Bataklık servisi kömürü, Kara çam kömürü, Kül ağacı kömürü, Dikenli akasya kömürü, Kızıl sedir kömürü, Ateş narı kömürü, Mor söğüt kömürü, Gece ağacı kömürü, Işık ağacı kömürü, Yıldız eriği kömürü, Ay elması kömürü |
| Herhangi kurutulmuş et | Kurutulmuş tavşan eti, Kurutulmuş sincap eti, Kurutulmuş geyik eti, Kurutulmuş karaca eti, Kurutulmuş yaban domuzu eti, Kurutulmuş kurt eti, Kurutulmuş kunduz eti, Kurutulmuş su samuru eti, Kurutulmuş yaban öküzü eti, Kurutulmuş yaban atı eti, Kurutulmuş dağ keçisi eti, Kurutulmuş muflon eti, Kurutulmuş mağara ayısı eti, Kurutulmuş keklik eti, Kurutulmuş bıldırcın eti, Kurutulmuş ördek eti, Kurutulmuş yaban kazı eti, Kurutulmuş turna kuşu eti, Kurutulmuş ur kekliği eti, Kurutulmuş kartal eti, Kurutulmuş vaşak eti, Kurutulmuş işık tilkisi eti, Kurutulmuş kristal geyik eti |
| Herhangi kurutulmuş meyve | Kurutulmuş böğürtlen, Kurutulmuş ahududu, Kurutulmuş yaban çileği, Kurutulmuş yaban mersini, Kurutulmuş kızılcık, Kurutulmuş yabani elma, Kurutulmuş yabani armut, Kurutulmuş ardıç meyvesi, Kurutulmuş kuşburnu, Kurutulmuş alıç, Kurutulmuş yabani erik, Kurutulmuş mürver, Kurutulmuş ateş narı, Kurutulmuş yıldız eriği, Kurutulmuş ay elması |
| Herhangi meyve tohumu | Elma tohumu, Armut tohumu, Erik tohumu, Ceviz tohumu, Kestane tohumu, Mürver tohumu, Ardıç tohumu, Ateş narı tohumu, Yıldız eriği tohumu, Ay elması tohumu |
| Herhangi odun | Meşe odunu, Çam odunu, Huş odunu, Kayın odunu, Ladin odunu, Ihlamur odunu, Akçaağaç odunu, Kestane odunu, Ceviz odunu, Dişbudak odunu, Porsuk odunu, Söğüt odunu, Kavak odunu, Kızılağaç odunu, Ardıç odunu, Bataklık servisi odunu, Kara çam odunu, Kül ağacı odunu, Dikenli akasya odunu, Kızıl sedir odunu, Ateş narı odunu, Mor söğüt odunu, Gece ağacı odunu, Işık ağacı odunu, Yıldız eriği odunu, Ay elması odunu, Bulut çamı odunu, Gök söğüdü odunu, Rüzgâr meşesi odunu, Bulut elması odunu, Dev mantar odunu, Mavi mantar odunu, Spor ağacı odunu, Kök ağacı odunu, Hurda palmiyesi odunu, Pas ağacı odunu, Kuru çınar odunu, Hurma odunu, Kristal çam odunu, Taş ağacı odunu, Mavi sedir odunu, Kristal armut odunu, Kömür ağacı odunu, Lav palmiyesi odunu, Obsidyen dikeni odunu, Ejder meyvesi odunu, Gök kamışı odunu, Bulut kavağı odunu, Yıldız akasyası odunu, Gök üzümü odunu |
| Herhangi ok ucu | Çakmaktaşı ok ucu, Kuvars ok ucu, Bazalt ok ucu, Obsidyen ok ucu, Kemik ok ucu, Diken ok ucu, Akrep ok ucu, Lav camı ok ucu |
| Herhangi pişmiş balık | Pişmiş sazan, Pişmiş alabalık, Pişmiş yayın, Pişmiş tatlısu kefali, Pişmiş kerevit, Pişmiş tatlısu midyesi, Pişmiş turna balığı, Pişmiş kızılkanat, Pişmiş tatlısu levreği, Pişmiş yılan balığı, Pişmiş kadife balığı, Pişmiş kurbağa, Pişmiş mersin balığı, Pişmiş çapak |
| Herhangi pişmiş et | Pişmiş tavşan eti, Pişmiş sincap eti, Pişmiş geyik eti, Pişmiş karaca eti, Pişmiş yaban domuzu eti, Pişmiş kurt eti, Pişmiş kunduz eti, Pişmiş su samuru eti, Pişmiş yaban öküzü eti, Pişmiş yaban atı eti, Pişmiş dağ keçisi eti, Pişmiş muflon eti, Pişmiş mağara ayısı eti, Pişmiş keklik eti, Pişmiş bıldırcın eti, Pişmiş ördek eti, Pişmiş yaban kazı eti, Pişmiş turna kuşu eti, Pişmiş ur kekliği eti, Pişmiş kartal eti, Pişmiş vaşak eti, Pişmiş işık tilkisi eti, Pişmiş kristal geyik eti, Pişmiş bulut koyunu eti, Pişmiş rüzgâr kuşu eti, Pişmiş kertenkele eti, Pişmiş buz tavşanı eti, Pişmiş kor kertenkelesi eti, Pişmiş yıldız tilkisi eti |
| Herhangi reçine | Çam reçinesi, Ladin reçinesi, Huş katranı |
| Herhangi sap | Meşe sapı, Çam sapı, Huş sapı, Kayın sapı, Ladin sapı, Ihlamur sapı, Akçaağaç sapı, Kestane sapı, Ceviz sapı, Dişbudak sapı, Porsuk sapı, Söğüt sapı, Kavak sapı, Kızılağaç sapı, Ardıç sapı, Bataklık servisi sapı, Kara çam sapı, Kül ağacı sapı, Dikenli akasya sapı, Kızıl sedir sapı, Ateş narı sapı, Mor söğüt sapı, Gece ağacı sapı, Işık ağacı sapı, Yıldız eriği sapı, Ay elması sapı |
| Herhangi tabaklanmış deri | Tabaklanmış tavşan derisi, Tabaklanmış sincap derisi, Tabaklanmış geyik derisi, Tabaklanmış karaca derisi, Tabaklanmış yaban domuzu derisi, Tabaklanmış kurt derisi, Tabaklanmış kunduz derisi, Tabaklanmış su samuru derisi, Tabaklanmış yaban öküzü derisi, Tabaklanmış yaban atı derisi, Tabaklanmış dağ keçisi derisi, Tabaklanmış muflon derisi, Tabaklanmış mağara ayısı derisi, Tabaklanmış vaşak derisi, Tabaklanmış işık tilkisi postu, Tabaklanmış kristal geyik derisi, Tabaklanmış gölge postu |
| Herhangi tuğla | Nehir tuğlası, Göl tuğlası, Kırmızı tuğla, Beyaz tuğla, Cüruf tuğlası |
| Herhangi tüy | Keklik tüyü, Bıldırcın tüyü, Ördek tüyü, Yaban kazı tüyü, Turna kuşu tüyü, Ur kekliği tüyü, Kartal tüyü |
| Herhangi un | Palamut unu, Yabani buğday unu, Yabani arpa unu, Yabani mercimek unu, Yabani nohut unu, Yabani yulaf unu, Nilüfer kökü unu |
| Herhangi yassı ekmek | Yabani buğday yassı ekmeği, Yabani arpa yassı ekmeği, Yabani mercimek yassı ekmeği, Yabani nohut yassı ekmeği, Yabani yulaf yassı ekmeği |


# Aletler, silahlar ve zırhlar

## Aletler ve silahlar

- **Tür:** axe = balta (odun), pick = kazma (maden), shovel = kürek (kil), rake/can/scythe = tırmık/sulama kabı/tırpan (tarla), fish = olta/ağ/zıpkın, water = su kabı, torch = meşale, sword/spear = kılıç/mızrak, staff = asa, gun = ateşli silah.
- **Kademe:** balta ve kazmanın kademesi hangi ağacı kesip hangi madeni kazabileceğini belirler (biyom tablolarındaki "Gereken balta/kazma"). Daha yüksek kademe her zaman alttakileri de keser.
- **Dayanıklılık:** her kullanımda 1 azalır; sıfırlanınca alet körelir ve çalışmaz. Demirci Dursun "Aletimi bile" ile bileme ücretine yeniler. Hile panelindeki "Sınırsız dayanıklılık" aletleri hiç köreltmez.
- **İş süresi:** bir toplamanın kaç saniye sürdüğü (yetenekler ve seviye kısaltır).

| Alet | Tür | Ne yapar | İş süresi (sn) | Dayanıklılık | Bileme ücreti | Kademe | Silah hasarı |
|---|---|---|---|---|---|---|---|
| Bazalt balta | axe | odun keser | 1,6 | 70 | 100 | 4 | – |
| Çakmaktaşı balta | axe | odun keser | 2 | 35 | 25 | 2 | – |
| Demir balta | axe | odun keser | 1,3 | 140 | 180 | 4 | – |
| Granit balta | axe | odun keser | 2,4 | 40 | 25 | 2 | – |
| Kuvars balta | axe | odun keser | 2 | 50 | 50 | 3 | – |
| Obsidyen balta | axe | odun keser | 1,2 | 100 | 250 | 5 | – |
| Taş balta | axe | odun keser | 3 | 25 | 10 | 1 | – |
| Tunç balta | axe | odun keser | 1,8 | 90 | 90 | 3 | – |
| Sulama kabı | can | tarlayı sular | 1 | 25 | 10 | – | – |
| Ağ | fish | balık tutar (eline al, suya dön, E) | 3 | 25 | 15 | – | – |
| Balık kapanı | fish | balık tutar (eline al, suya dön, E) | 4 | 40 | 25 | – | – |
| Kemik zıpkın | fish | balık tutar (eline al, suya dön, E) | 2,5 | 30 | 20 | – | – |
| Olta | fish | balık tutar (eline al, suya dön, E) | 3 | 25 | 15 | – | – |
| Pompalı | gun | ateş eder (Pompalı fişeği) | 1 | 999 | 0 | – | – |
| Tabanca | gun | ateş eder (Tabanca mermisi) | 1 | 999 | 0 | – | – |
| Bazalt mızrak | hunt | av ve savaş: uzaktan vurur | 1,6 | 60 | 100 | – | 22 |
| Çakmaktaşı mızrak | hunt | av ve savaş: uzaktan vurur | 2,5 | 30 | 25 | – | 14 |
| Demir mızrak | hunt | av ve savaş: uzaktan vurur | 1,6 | 120 | 200 | – | 30 |
| Kuvars mızrak | hunt | av ve savaş: uzaktan vurur | 2 | 45 | 50 | – | 18 |
| Mızrak | hunt | av ve savaş: uzaktan vurur | 3 | 20 | 12 | – | 10 |
| Obsidyen mızrak | hunt | av ve savaş: uzaktan vurur | 1,2 | 90 | 250 | – | 28 |
| Tunç mızrak | hunt | av ve savaş: uzaktan vurur | 2 | 80 | 100 | – | 20 |
| Bazalt kazma | pick | maden kazar | 1,6 | 70 | 120 | 4 | – |
| Çakmaktaşı kazma | pick | maden kazar | 2 | 35 | 30 | 2 | – |
| Demir kazma | pick | maden kazar | 1,3 | 140 | 200 | 4 | – |
| Granit kazma | pick | maden kazar | 2,4 | 40 | 30 | 2 | – |
| Kuvars kazma | pick | maden kazar | 2 | 50 | 60 | 3 | – |
| Obsidyen kazma | pick | maden kazar | 1,2 | 100 | 300 | 5 | – |
| Taş kazma | pick | maden kazar | 3 | 25 | 15 | 1 | – |
| Tunç kazma | pick | maden kazar | 1,8 | 90 | 100 | 3 | – |
| Tırmık | rake | toprağı hazırlar | 1,4 | 30 | 8 | – | – |
| Tırpan | scythe | ürünü biçer | 1 | 30 | 12 | – | – |
| Boynuz kazma | shovel | kil kazar | 2 | 40 | 25 | – | – |
| Kürek | shovel | kil kazar | 3 | 25 | 10 | – | – |
| Ateş asası | staff | ateş topu atar (mana) | 1 | 999 | 0 | – | – |
| Buz asası | staff | buz oku atar (mana) | 1 | 999 | 0 | – | – |
| Yıldırım asası | staff | zincirleme yıldırım (mana) | 1 | 999 | 0 | – | – |
| Demir kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 120 | 240 | – | 34 |
| Ejder kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 200 | 600 | – | 52 |
| Işın kılıcı | sword | plazma kılıç | 1 | 999 | 0 | – | 60 |
| Taş kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 45 | 15 | – | 12 |
| Tunç kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 80 | 120 | – | 22 |
| Granit gürz | sword | savaşır: ağır ve sert vuruş | 1 | 100 | 25 | – | 27 |
| Timsah dişi kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 140 | 222 | – | 38 |
| Gümüş kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 160 | 104 | – | 44 |
| Lav camı kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 200 | 210 | – | 55 |
| Ametist kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 240 | 168 | – | 58 |
| Kaba meşale | torch | gece aydınlatır | 0 | 1.000.000 | 0 | – | – |
| Meşale | torch | gece aydınlatır | 0 | 1.000.000 | 0 | – | – |
| Bola | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2,5 | 25 | 15 | – | – |
| Dişbudak yayı | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2 | 35 | 30 | – | – |
| Porsuk yayı | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2 | 40 | 40 | – | – |
| Sapan | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2,5 | 25 | 20 | – | – |
| Tuzak | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 3 | 20 | 12 | – | – |
| Huş kabuğu kabı | water | su taşır | 2 | 1.000.000 | 0 | – | – |
| Yaprak kova | water | su taşır | 3 | 1.000.000 | 0 | – | – |


## Zırhlar

Beş yuva vardır: **baş, gövde, el, ayak, silah**. Özellikler penceresinden (C) giyilir. Canavar hasarı **25 / (25 + toplam savunma)** katına iner: 25 savunma hasarı yarıya, 75 savunma dörtte bire indirir.

| Zırh | Yuva | Savunma | Nerede yapılır | Not |
|---|---|---|---|---|
| Deri çarık | Ayak | 3 | El yapımı (Tab) | – |
| Kamış çizme | Ayak | 4 | El yapımı (Tab) | – |
| Tunç çizme | Ayak | 7 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Demir çizme | Ayak | 12 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Bataklık çizmesi | Ayak | 14 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: zehir %25, çamur |
| Hurda çizme ² | Ayak | 15 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Meka çizme ² | Ayak | 18 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: kanama %20, metal |
| Akrep kabuğu çizme | Ayak | 18 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: zehir %35 |
| Tüylü başlık | Baş | 3 | El yapımı (Tab) | – |
| Kafa lambası | Baş | 3 | – | – |
| Kürk başlık | Baş | 4 | El yapımı (Tab) | – |
| Kemik miğfer | Baş | 6 | El yapımı (Tab) | – |
| Tunç miğfer | Baş | 12 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Ceviz kabuğu miğfer | Baş | 15 | Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Demir miğfer | Baş | 20 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Fırtına tüyü başlık ² | Baş | 22 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Kartal tüyü miğfer | Baş | 24 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Kristal miğfer ² | Baş | 26 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: kanama %30, metal |
| Kürk eldiven | El | 3 | El yapımı (Tab) | – |
| Tunç eldiven | El | 7 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Lav pulu eldiven | El | 10 | El yapımı (Tab) | direnç: yanık %30 |
| Demir eldiven | El | 12 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Mantar lifi eldiven ² | El | 14 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: zehir %40 |
| Ejder pulu eldiven ² | El | 16 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: yanık %40 |
| Işık pulu eldiven | El | 18 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: zehir %35 |
| Keten tunik | Gövde | 2 | El yapımı (Tab) | – |
| Boyalı tunik | Gövde | 3 | El yapımı (Tab) | – |
| Tavşan postu giysi | Gövde | 5 | El yapımı (Tab) | – |
| Geyik postu giysi | Gövde | 6 | El yapımı (Tab) | – |
| Karaca postu giysi | Gövde | 6 | El yapımı (Tab) | – |
| Kunduz postu giysi | Gövde | 6 | El yapımı (Tab) | – |
| Dağ keçisi postu giysi | Gövde | 7 | El yapımı (Tab) | – |
| Muflon postu giysi | Gövde | 7 | El yapımı (Tab) | – |
| Yaban domuzu postu giysi | Gövde | 8 | El yapımı (Tab) | – |
| Kurt postu giysi | Gövde | 8 | El yapımı (Tab) | – |
| Yaban öküzü postu giysi | Gövde | 10 | El yapımı (Tab) | – |
| Kemik zırh | Gövde | 11 | El yapımı (Tab) | – |
| Mağara ayısı postu giysi | Gövde | 12 | El yapımı (Tab) | – |
| Bataklık postu pelerin | Gövde | 14 | El yapımı (Tab) | direnç: zehir %30 |
| Ayı postu pelerin | Gövde | 15 | El yapımı (Tab) | – |
| Timsah derisi zırh | Gövde | 20 | El yapımı (Tab) | direnç: kanama %40 |
| Tunç zırh | Gövde | 24 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Kül postu pelerin | Gövde | 26 | El yapımı (Tab) | direnç: yanık %40 |
| Meşe kabuk zırh | Gövde | 30 | Örs · Zırhçı Duran (Orman) ve üstü döver | direnç: kanama %15 |
| Demir zırh | Gövde | 40 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: kanama %30, metal |
| Timsah pulu zırh | Gövde | 46 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: kanama %40, metal |
| Gümüş pullu zırh | Gövde | 52 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %35, metal |
| Ejder pulu zırh | Gövde | 60 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %60, metal |
| Kül böceği zırh | Gövde | 64 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %50, metal |
| Kristal ipek zırh | Gövde | 72 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: kanama %25, yanık %25, zehir %25 |
| Meka zırh ² | Gövde | 90 | Mühendis Selin yapar (600 sikke işçilik) | direnç: kanama %50, yanık %50, zehir %50, metal |


## Evler ve barınaklar (Marangoz Rıza)

| Yapı | Seviye | Rıza'nın aldığı ücret | Tasarımdaki liste fiyatı | Malzeme | Açıklama |
|---|---|---|---|---|---|
| Yaprak barınağı | Sv 1 | 5 | 5 | 8 Dal, 12 Yaprak, 4 Lif | Yatak gerekmez. Bir gecelik: uyanınca dağılır. |
| Deri çadır | Sv 3 | 1.039 | 300 | – | Kalıcı bir çadır. İçinde uyumak için yatak koymalısın. |
| Kulübe | Sv 4 | 510 | 450 | – | Dal ve taştan sağlam bir kulübe. Yatak ister. |
| Kamış kulübe | Sv 5 | 650 | 650 | – | Kamış çatılı, serin bir kulübe. Yatak ister. |
| Kerpiç ev | Sv 6 | 958 | 950 | – | Kalın kerpiç duvarlı ev. Yatak ister. |
| Ahşap ev | Sv 7 | 2.278 | 1.500 | – | Kalas duvarlı, kiremit çatılı ev. Yatak ister. |
| Taş ev | Sv 8 | 4.049 | 2.500 | – | Ekin'in kampının yanındaki arsaya, taştan sağlam bir ev. Yatak ister. |
| Konak | Sv 10 | 8.097 | 5.000 | – | Adanın en görkemli evi. Yatak ister. |


# Eşya dizini

Oyundaki bütün eşyalar alfabetik sırada. **Nereden gelir** sütunu bir eşyayı elde etmenin bütün yollarını sayar: yerden toplama (hangi biyomda), ağaç, av (hangi canlı, yüzde kaç ihtimalle), balık, tarif (nerede öğrenilir ve kim yapar), kişilerin verdikleri. **Kullanıldığı tarifler** ilk altı tarifi gösterir; tamamı için tarif ansiklopedisinde malzeme adını arat.

| Eşya | Fiyat | Tür | Nereden gelir | Hangi tariflerde kullanılır |
|---|---|---|---|---|
| Acı biber ezmesi | 126 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Adaçayı | 2 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş adaçayı |
| Adaçayı çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ağ | 63 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Ağıl | 810 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Ağır plaka ² | 70 | – | Av: Hurda devi düşürür %90 (ACT 2 · Hurda Çölü) | Hurda çizme, Pompalı |
| Ahşap ev | 900 | – | Marangoz Rıza yapar (1.500 sikke) | – |
| Ahşap karyola | 475 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Ahududu | 2 | yenir +6 | Yerden toplanır: Orman (ACT 1) | Ahududu ezmesi, Ahududu suyu, Kurutulmuş ahududu, Meyve karışımı |
| Ahududu ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ahududu suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akçaağaç kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akçaağaç kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akçaağaç sapı, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap … (+15) |
| Akçaağaç kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akçaağaç kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Akçaağaç odunu | 3 | – | Balta ile Akçaağaç ağacından: Kayalık Dağ (ACT 1) | Akçaağaç kabuğu, Akçaağaç kalası, Akçaağaç kömürü, Kütük salı, Oyma kano |
| Akçaağaç özsuyu | 3 | yenir +2 | Akçaağaç ağacı kesilince 1 tane düşer | Akçaağaç şurubu |
| Akçaağaç sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Akçaağaç kaşığı, Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta … (+22) |
| Akçaağaç şurubu | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akrep iğnesi | 55 | – | Av: Ateş akrebi düşürür %70 (ACT 1 · Kül Diyarı) | Akrep ok ucu, Akrep kabuğu çizme |
| Akrep kabuğu | 45 | – | Av: Ateş akrebi düşürür %80 (ACT 1 · Kül Diyarı) | Akrep kabuğu kalkanı, Akrep kabuğu çizme |
| Akrep kabuğu çizme | 620 | giyilir +18 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Akrep kabuğu kalkanı | 213 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akrep ok ucu | 154 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Alabalık | 5 | – | Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %24; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş alabalık, Pişmiş alabalık, Taşta alabalık, Tütsülenmiş alabalık |
| Alıç | 2 | yenir +5 | Yerden toplanır: Kayalık Dağ (ACT 1) | Alıç ezmesi, Alıç suyu, Kurutulmuş alıç |
| Alıç ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alıç suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Altın cevheri | 22 | – | Kazmayla kazılır: Kayalık Dağ (ACT 1) | Altın külçesi |
| Altın kolye | 288 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Altın külçesi | 93 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın kolye, Ejder kılıcı |
| Ametist | 30 | – | Kazmayla kazılır: Mor Kristal Vadisi (ACT 1) · Av: Kristal golem düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Ametist yüzük, Ametist kılıcı, Kristal ipek zırh |
| Ametist kılıcı | 763 | alet, silah 58 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Ametist yüzük | 162 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ana tanrıça heykelciği | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç kabuğu | 13 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç kalası | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Ardıç sapı, Asma fener, Atölye, Dolap … (+15) |
| Ardıç kaşığı | 80 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç kömürü | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ardıç meyvesi | 2 | yenir +2, zehirli | Meyve ağacı (Ardıç): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ardıç ağacından toplanır: Kayalık Dağ (ACT 1) | Ardıç meyvesi ezmesi, Ardıç meyvesi suyu, Kurutulmuş ardıç meyvesi |
| Ardıç meyvesi ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç meyvesi suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç odunu | 4 | – | Balta ile Ardıç ağacından: Kayalık Dağ (ACT 1) | Ardıç kabuğu, Ardıç kalası, Ardıç kömürü, Kütük salı, Oyma kano |
| Ardıç sapı | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ardıç kaşığı, Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta … (+23) |
| Ardıç tohumu | 3 | – | Ardıç ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Arduvaz | 3 | – | Kazmayla kazılır: Bataklık (ACT 1) | Taş levha |
| Arı kovanı | 140 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Armut odunu | – | – | Balta ile Armut ağacından: Çayır (ACT 1) | – |
| Armut tohumu | 3 | – | Armut ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Asma fener | 246 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Ateş | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Akçaağaç kömürü, Akçaağaç şurubu, Ardıç kömürü, Ateş narı kömürü, Ateş yeri, Ay elması kömürü … (+102) |
| Ateş asası ² | 900 | alet | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Büyücü Pervin yapar (100 sikke işçilik) | – |
| Ateş bezesi | 90 | – | Av: Lav kertenkelesi düşürür %50 (ACT 1 · Kül Diyarı) · Av: Kül cini düşürür %60 (ACT 1 · Kül Diyarı) · Av: Kor yarasası düşürür %50 (ACT 1 · Kül Diyarı) | Ateş iksiri, Lav camı kılıcı |
| Ateş biberi | 26 | yenir +2 | Yerden toplanır: Kül Diyarı (ACT 1) | Acı biber ezmesi |
| Ateş çiçeği | 8 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Ateş çiçeği balı, Ateş çiçeği merhemi, Ateş iksiri |
| Ateş çiçeği balı | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş çiçeği merhemi | 25 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş iksiri | 131 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş narı | 14 | yenir +7 | Meyve ağacı (Ateş narı): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ateş narı ağacından toplanır: Kül Diyarı (ACT 1) | Ateş narı şerbeti, Kurutulmuş ateş narı |
| Ateş narı kalası | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Ateş narı sapı, Atölye, Dolap … (+15) |
| Ateş narı kömürü | 79 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ateş narı odunu | 16 | – | Balta ile Ateş narı ağacından: Kül Diyarı (ACT 1) | Ateş narı kalası, Ateş narı kömürü, Kütük salı, Oyma kano |
| Ateş narı sapı | 80 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Ateş narı şerbeti | 126 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş narı tohumu | 12 | – | Ateş narı ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Ateş yeri | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | Taş fırın |
| Atölye | 127 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Avcı yahnisi | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ziyafet sofrası |
| Av sahnesi duvar resmi | 216 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ayçiçeği | 16 | yenir +4 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Ayçiçek yağı, Hasat sepeti |
| Ayçiçeği tohumu | 6 | – | Çiftçi Hasan alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Ayçiçeği) | – |
| Ayçiçek yağı | 96 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Soğan halkası |
| Ayı pençesi | 22 | – | Av: Mağara ayısı düşürür %60 (ACT 1 · Kayalık Dağ) | Ayı postu pelerin, Pençe kolye, Gümüş pullu zırh |
| Ayı postu pelerin | 494 | giyilir +15 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay çayı | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay çiçeği ² | 28 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Ay elması | 22 | yenir +9 | Meyve ağacı (Ay elması): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ay elması ağacından toplanır: Mor Kristal Vadisi (ACT 1) | Ay elması reçeli, Kurutulmuş ay elması |
| Ay elması kalası | 73 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Ay elması sapı, Dolap … (+15) |
| Ay elması kömürü | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ay elması odunu | 24 | – | Balta ile Ay elması ağacından: Mor Kristal Vadisi (ACT 1) | Ay elması kalası, Ay elması kömürü, Kütük salı, Oyma kano |
| Ay elması reçeli | 165 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay elması sapı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Ay elması tohumu | 18 | – | Ay elması ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Ay ışığı iksiri | 71 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay otu | 70 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Ay otu iksiri |
| Ay otu iksiri | 352 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay taşı | 90 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Ay taşı kolyesi |
| Ay taşı kolyesi | 135 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bağlı uç | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bakır cevheri | 6 | – | Kazmayla kazılır: Çayır (ACT 1) | Bakır külçesi |
| Bakır külçesi | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tunç külçesi |
| Bakır tel ² | 14 | – | Yerden toplanır: Hurda Çölü (ACT 2) · Av: Hurda faresi düşürür %80 (ACT 2 · Hurda Çölü) | Enerji hücresi |
| Balık çorbası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık kapanı | 33 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Balık pulu | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık sepeti | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık tutkalı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık yağı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ballı ekmek | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ballı fındık | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ballı kestane | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balmumu | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Arı kovanı, Balmumu mumu |
| Balmumu mumu | 129 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Asma fener |
| Bal şarabı | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bal şerbeti | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bal şarabı |
| Barut ² | 66 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Pompalı fişeği, Tabanca mermisi |
| Barut kayası ² | 22 | – | Kazmayla kazılır: Hurda Çölü (ACT 2) | Barut |
| Bataklık çizmesi | 479 | giyilir +14 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Bataklık kurdu postu | 30 | – | Av: Bataklık kurdu düşürür %80 (ACT 1 · Bataklık) | Bataklık postu pelerin, Timsah pulu zırh |
| Bataklık otu | 4 | – | Yerden toplanır: Bataklık (ACT 1) | Bataklık otu çayı, Panzehir |
| Bataklık otu çayı | 58 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bataklık postu pelerin | 100 | giyilir +14 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bataklık servisi kalası | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Bataklık servisi sapı, Dolap … (+15) |
| Bataklık servisi kömürü | 58 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Bataklık servisi odunu | 8 | – | Balta ile Bataklık servisi ağacından: Bataklık (ACT 1) | Bataklık servisi kalası, Bataklık servisi kömürü, Kütük salı, Oyma kano |
| Bataklık servisi sapı | 53 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Bazalt | 4 | – | Kazmayla kazılır: Kül Diyarı (ACT 1) | Taş kase, Yontulmuş bazalt, Lav camı kılıcı |
| Bazalt balta | 92 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt bıçak | 139 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt kazıyıcı | 96 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt kazma | 441 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt mızrak | 431 | alet, silah 22 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt ok ucu | 644 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Bazalt pulu | 53 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Bazalt kazıyıcı, Bazalt ok ucu |
| Bazalt sivri ucu | 271 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt kazma, Bazalt mızrak |
| Beyaz boncuk | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Beyaz boya | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Beyaz çömlek | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Beyaz kase | 85 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Beyaz kerpiç | 25 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Beyaz tuğla, Kerpiç duvar |
| Beyaz kil | 6 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Beyaz boya, Islak beyaz kil |
| Beyaz tuğla | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Bıldırcın eti | 3 | – | Av: Bıldırcın düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş bıldırcın eti, Pişmiş bıldırcın eti, Turba ateşinde tütsü … (+1) |
| Bıldırcın tüyü | 2 | – | Av: Bıldırcın düşürür %80 (ACT 1 · Çayır) | Tüylü başlık, Tüylü ok |
| Bıldırcın yumurtası | 3 | – | Av: Bıldırcın düşürür %40 (ACT 1 · Çayır) | Haşlanmış bıldırcın yumurtası |
| Bileği taşı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Beyaz kase (alet), Boynuz borazan (alet), Cilalı kristal (alet), Göl kasesi (alet), Kehribar boncuk (alet), Kemik iğne (alet) … (+5) |
| Bola | 63 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Boyalı çömlek | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boyalı tunik | 296 | giyilir +3 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boynuz borazan | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boynuz kazma | 70 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Boynuz kupa | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boynuz tarak | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Böcek kabuğu ² | 14 | – | Av: Mantar böceği düşürür %90 (ACT 2 · Dev Mantar Ormanı) | Mantar lifi eldiven |
| Böğürtlen | 2 | yenir +6 | Yerden toplanır: Çayır (ACT 1) | Böğürtlen ezmesi, Böğürtlen suyu, Kurutulmuş böğürtlen, Meyve karışımı |
| Böğürtlen ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Böğürtlen suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Buğday | 8 | – | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Buğday unu, Hasat sepeti |
| Buğday tohumu | 3 | – | Çiftçi Hasan alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Buğday) | – |
| Buğday unu | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ekmek, Soğan halkası |
| Buhar | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bulut çamı kalası ² | 47 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Bulut çamı odunu ² | 14 | – | Balta ile Bulut çamı ağacından: Yüzen Kayalar (ACT 2) | Bulut çamı kalası, Kütük salı, Oyma kano |
| Bulut elması ² | 12 | yenir +8 | Bulut elması ağacından toplanır: Yüzen Kayalar (ACT 2) | – |
| Bulut elması kalası ² | 52 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Bulut elması odunu ² | 16 | – | Balta ile Bulut elması ağacından: Yüzen Kayalar (ACT 2) | Bulut elması kalası, Kütük salı, Oyma kano |
| Bulut kavağı kalası ² | 114 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Bulut kavağı odunu ² | 40 | – | Balta ile Bulut kavağı ağacından: Gök Rıhtımı (ACT 2) | Bulut kavağı kalası, Kütük salı, Oyma kano |
| Bulut koyunu eti ² | 10 | – | Av: Bulut koyunu düşürür %100 (ACT 2 · Yüzen Kayalar) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş bulut koyunu eti, Turba ateşinde tütsü |
| Bulut kuvarsı ² | 34 | – | Kazmayla kazılır: Yüzen Kayalar (ACT 2) | – |
| Bulut özü ² | 26 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Bulut pamuğu ² | 12 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Bulut yünü ² | 16 | – | Av: Bulut koyunu düşürür %90 (ACT 2 · Yüzen Kayalar) | Bulut yünü ip |
| Bulut yünü ip ² | 67 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Buz asası ² | 1.600 | alet | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Büyücü Pervin yapar (200 sikke işçilik) | – |
| Buz kristali ² | 36 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | Buz asası |
| Buz kürkü ² | 40 | – | Av: Buz tavşanı düşürür %80 (ACT 2 · Kristal Golem Ocağı) | – |
| Buz tavşanı eti ² | 12 | – | Av: Buz tavşanı düşürür %100 (ACT 2 · Kristal Golem Ocağı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş buz tavşanı eti, Turba ateşinde tütsü |
| Büyü otu ² | 26 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) · Av: Goblin şamanı düşürür %80 (ACT 2 · Dev Mantar Ormanı) | Ateş asası, Buz asası, Mana iksiri, Yıldırım asası |
| Ceviz | 3 | yenir +5 | Meyve ağacı (Ceviz): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ceviz ağacından toplanır: Orman (ACT 1) · Av: Sincap düşürür %35 (ACT 1 · Orman) | Ceviz içi, Ceviz kabuğu miğfer |
| Ceviz içi | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ceviz yağı |
| Ceviz kabuğu | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ceviz kabuğu miğfer | 280 | giyilir +15 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Ceviz kalası | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Ceviz sapı, Dolap … (+15) |
| Ceviz kaşığı | 86 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ceviz kömürü | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ceviz odunu | 5 | – | Balta ile Ceviz ağacından: Orman (ACT 1) | Ceviz kabuğu, Ceviz kalası, Ceviz kömürü, Kütük salı, Oyma kano |
| Ceviz sapı | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Ceviz kaşığı, Çakmaktaşı balta … (+22) |
| Ceviz tohumu | 3 | – | Ceviz ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Ceviz yağı | 25 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Cilalı kristal | 92 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Civanperçemi | 2 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş civanperçemi, Şifalı merhem |
| Civanperçemi çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Cüruf | 24 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Cüruf tuğlası |
| Cüruf tuğlası | 102 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Çakmaktaşı | 2 | – | Yerden toplanır: Orman, Çayır, Mor Kristal Vadisi, Kayalık Dağ, Bataklık, Kül Diyarı (ACT 1) | Kamp ateşi, Kıvılcım, Pirit çakmağı, Taş kılıç, Yontulmuş çakmaktaşı |
| Çakmaktaşı balta | 78 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı bıçak | 111 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Kemik flüt (alet), Sandal küreği (alet) |
| Çakmaktaşı kazıyıcı | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı kazma | 252 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı mızrak | 249 | alet, silah 14 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı ok ucu | 400 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Çakmaktaşı pulu | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı bıçak, Çakmaktaşı kazıyıcı, Çakmaktaşı ok ucu, Tırpan |
| Çakmaktaşı sivri ucu | 137 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı kazma, Çakmaktaşı mızrak |
| Çam kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çam reçinesi |
| Çam kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Çam sapı, Dolap … (+15) |
| Çam kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Çam kozalağı | 1 | – | Çam ağacı kesilince 1 tane düşer | Kozalak ateşi |
| Çam kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Çam odunu | 3 | – | Balta ile Çam ağacından: Çayır (ACT 1) | Çam kabuğu, Çam kalası, Çam kömürü, Kütük salı, Oyma kano |
| Çam reçinesi | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kara cila, Meşale |
| Çam sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Çapak | 3 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %28; balık kapanına da girer · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %14; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş çapak, Pişmiş çapak, Taşta çapak, Tütsülenmiş çapak |
| Çayır mantarı | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kızarmış çayır mantarı, Kurutulmuş çayır mantarı |
| Çekiç taşı | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Bazalt pulu (alet), Bileği taşı (alet), Ceviz içi (alet), Çakmaktaşı pulu (alet), Kemik ok ucu (alet), Kristal parçası (alet) … (+10) |
| Çiftçi yahnisi | 112 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Çit | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | Ağıl |
| Çöl otu ² | 8 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Çömlek fırını | 331 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Dağ çayı | 6 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Dağ çayı demi |
| Dağ çayı demi | 57 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dağ keçisi derisi | 7 | – | Av: Dağ keçisi düşürür %80 (ACT 1 · Kayalık Dağ) | Tabaklanmış dağ keçisi derisi |
| Dağ keçisi eti | 7 | – | Av: Dağ keçisi düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş dağ keçisi eti, Pişmiş dağ keçisi eti, Turba ateşinde tütsü … (+1) |
| Dağ keçisi postu giysi | 258 | giyilir +7 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dal | 1 | – | Yerden toplanır: Orman, Çayır, Bataklık, Kayalık Dağ, Kül Diyarı, Mor Kristal Vadisi (ACT 1) | Ağ, Akçaağaç kalası, Akçaağaç kömürü, Akçaağaç sapı, Ardıç kalası, Ardıç kömürü … (+194) |
| Demir balta | 538 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir cevheri | 25 | – | Kazmayla kazılır: Bataklık (ACT 1) | Demir külçesi |
| Demir çizme | 905 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | Hurda çizme |
| Demir eldiven | 914 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | Mantar lifi eldiven |
| Demir halka | 162 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Demir çizme, Demir eldiven, Demir miğfer, Demir zırh, Gümüş pullu zırh |
| Demir kazma | 696 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir kılıç | 1.086 | alet, silah 34 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir külçesi | 111 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Demir balta, Demir halka, Demir kazma, Demir kılıç, Demir levha, Demir mızrak … (+3) |
| Demir levha | 315 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Demir çizme, Demir eldiven, Demir miğfer, Demir zırh, Ejder pulu zırh, Gemi … (+4) |
| Demir mızrak | 528 | alet, silah 30 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir miğfer | 1.134 | giyilir +20 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | Fırtına tüyü başlık |
| Demir zırh | 2.748 | giyilir +40 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Deri çadır | 410 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur · Marangoz Rıza yapar (300 sikke) | – |
| Deri çanta | 447 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Deri çarık | 276 | giyilir +3 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Deri davul | 337 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Deri tulum | 317 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tabakhane |
| Dev mantar kalası ² | 62 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Dev mantar odunu ² | 20 | – | Balta ile Dev mantar ağacından: Dev Mantar Ormanı (ACT 2) | Dev mantar kalası, Kütük salı, Oyma kano |
| Dev spor ² | 28 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Dikenli akasya kalası | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dikenli akasya sapı, Dolap … (+15) |
| Dikenli akasya kömürü | 79 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Dikenli akasya odunu | 16 | – | Balta ile Dikenli akasya ağacından: Kül Diyarı (ACT 1) | Dikenli akasya kalası, Dikenli akasya kömürü, Kütük salı, Oyma kano |
| Dikenli akasya sapı | 80 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Diken iğnesi | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Diken ok ucu | 50 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Dişbudak kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dişbudak kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dişbudak sapı, Dolap … (+15) |
| Dişbudak kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dişbudak kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Dişbudak odunu | 3 | – | Balta ile Dişbudak ağacından: Bataklık (ACT 1) | Dişbudak kabuğu, Dişbudak kalası, Dişbudak kömürü, Kütük salı, Oyma kano |
| Dişbudak sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+23) |
| Dişbudak yayı | 79 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Dişli ² | 18 | – | Av: Pas böceği düşürür %90 (ACT 2 · Hurda Çölü) · Av: Devriye robotu düşürür %90 (ACT 2 · Hurda Çölü) | Hurda çizme, Pompalı, Tabanca |
| Diş kolye | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dokuma tezgâhı | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Keten kumaş (alet) |
| Dolap | 174 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Domuz dişi muska | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Don yağı mumu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Duman | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tütsühane, Tütsülenmiş alabalık, Tütsülenmiş bıldırcın eti, Tütsülenmiş çapak, Tütsülenmiş dağ keçisi eti, Tütsülenmiş geyik eti … (+32) |
| Duman çiçeği | 28 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Duman tütsüsü |
| Duman tütsüsü | 80 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Duvar halısı | 332 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Ebegümeci | 1 | – | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş ebegümeci |
| Eğrelti | 1 | – | Yerden toplanır: Orman (ACT 1) | Eğrelti yatağı |
| Eğrelti yatağı | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ejder dişi ² | 120 | – | Av: Yavru ejder düşürür %70 (ACT 2 · Ejder Volkanı) | Ejder pulu eldiven, Işın kılıcı |
| Ejder kalbi ² | 900 | – | Av: Kızıl ejder düşürür %100 (ACT 2 · Ejder Volkanı) | Roket motoru |
| Ejder kemiği | 200 | – | Av: Kara ejder düşürür %80 (ACT 1 · Kül Diyarı) | Ejder kılıcı |
| Ejder kılıcı | 1.392 | alet, silah 52 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder kristali ² | 70 | – | Kazmayla kazılır: Ejder Volkanı (ACT 2) | Plazma hücresi, Yıldırım asası |
| Ejder meyvesi ² | 18 | – | Ejder meyvesi ağacından toplanır: Ejder Volkanı (ACT 2) | Ejder meyvesi şerbeti |
| Ejder meyvesi kalası ² | 93 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Ejder meyvesi odunu ² | 32 | – | Balta ile Ejder meyvesi ağacından: Ejder Volkanı (ACT 2) | Ejder meyvesi kalası, Kütük salı, Oyma kano |
| Ejder meyvesi şerbeti ² | 142 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Ejder otu ² | 28 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Ejder pulu eldiven ² | 2.968 | giyilir +16 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Ejder pulu zırh | 2.488 | giyilir +60 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Ekmek | 153 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Elma odunu | – | – | Balta ile Elma ağacından: Çayır (ACT 1) | – |
| Elma tohumu | 3 | – | Elma ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| El izi resmi | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Enerji hücresi ² | 221 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Meka zırh, Plazma hücresi |
| Enerji taşı ² | 44 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) · Av: Kristal golemcik düşürür %40 (ACT 2 · Kristal Golem Ocağı) | Buz asası, Enerji hücresi, Titanyum külçesi |
| Erik odunu | – | – | Balta ile Erik ağacından: Çayır (ACT 1) | – |
| Erik tohumu | 3 | – | Erik ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Erzak çukuru | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Eski devre ² | 30 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Et şişi | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Közlenmiş şiş |
| Fındık | 2 | yenir +5 | Av: Sincap düşürür %35 (ACT 1 · Orman) | Kavrulmuş fındık |
| Fırtına tüyü ² | 40 | – | Av: Fırtına kartalı düşürür %90 (ACT 2 · Yüzen Kayalar) | Fırtına tüyü başlık |
| Fırtına tüyü başlık ² | 1.980 | giyilir +22 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | Kristal miğfer |
| Füzyon taşı ² | 80 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | Meteor demiri külçesi |
| Gece ağacı kalası | 78 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gece ağacı sapı … (+15) |
| Gece ağacı kömürü | 105 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Gece ağacı odunu | 26 | – | Balta ile Gece ağacı ağacından: Mor Kristal Vadisi (ACT 1) | Gece ağacı kalası, Gece ağacı kömürü, Kütük salı, Oyma kano |
| Gece ağacı sapı | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Gece sefası | 9 | yenir +5 | Yalnız gece, karanlık iyice çökünce karada (Çayır/Orman) beliren beyaz çiçek; E ile toplanır | Ay çayı, Ay ışığı iksiri |
| Gece zambağı | 60 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Gece zambağı yağı |
| Gece zambağı yağı | 303 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gelincik | 2 | – | Yerden toplanır: Çayır (ACT 1) | Gelincik boyası, Kurutulmuş gelincik |
| Gelincik boyası | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Gelincik çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gemi | 1.954 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Geyik boynuzu | 9 | – | Av: Geyik düşürür %40 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %40 (ACT 2 · Dev Mantar Ormanı) · Av: Yıldız geyiği düşürür %40 (ACT 2 · Gök Rıhtımı) | Boynuz kazma, Boynuz tarak |
| Geyik derisi | 8 | – | Av: Geyik düşürür %80 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %80 (ACT 2 · Dev Mantar Ormanı) · Av: Yıldız geyiği düşürür %80 (ACT 2 · Gök Rıhtımı) | Tabaklanmış geyik derisi |
| Geyik eti | 8 | – | Av: Geyik düşürür %100 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %100 (ACT 2 · Dev Mantar Ormanı) · Av: Yıldız geyiği düşürür %100 (ACT 2 · Gök Rıhtımı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş geyik eti, Pişmiş geyik eti, Turba ateşinde tütsü … (+1) |
| Geyik postu giysi | 262 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Goblin bakırı ² | 16 | – | Kazmayla kazılır: Dev Mantar Ormanı (ACT 2) | – |
| Goblin bıçağı ² | 60 | – | Av: Goblin düşürür %40 (ACT 2 · Dev Mantar Ormanı) | – |
| Goblin eriği ² | 10 | yenir +6 | Kök ağacı ağacından toplanır: Dev Mantar Ormanı (ACT 2) | Goblin eriği reçeli |
| Goblin eriği reçeli ² | 108 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Goblin kulağı ² | 30 | – | Av: Goblin düşürür %80 (ACT 2 · Dev Mantar Ormanı) · Av: Goblin okçusu düşürür %60 (ACT 2 · Dev Mantar Ormanı) | Mantar lifi eldiven |
| Goblin oku ² | 20 | – | Av: Goblin okçusu düşürür %80 (ACT 2 · Dev Mantar Ormanı) | – |
| Goblin otu ² | 12 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Golem çekirdeği | 600 | – | Av: Kristal golem düşürür %60 (ACT 1 · Mor Kristal Vadisi) · Av: Büyük golem düşürür %70 (ACT 2 · Kristal Golem Ocağı) | Golem feneri, Meka zırh |
| Golem feneri | 855 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Golem parçası ² | 36 | – | Av: Kristal golemcik düşürür %90 (ACT 2 · Kristal Golem Ocağı) | Kristal miğfer |
| Golem tozu ² | 14 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Göktaşı tozu ² | 24 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Gök camı ² | 60 | – | Kazmayla kazılır: Gök Rıhtımı (ACT 2) | Roket gövdesi |
| Gök camı parçası ² | 36 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Gök demiri ² | 30 | – | Kazmayla kazılır: Yüzen Kayalar (ACT 2) | Gök demiri külçesi |
| Gök demiri külçesi ² | 131 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Tabanca |
| Gök ipeği ² | 30 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | Roket |
| Gök kamışı kalası ² | 114 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Gök kamışı odunu ² | 40 | – | Balta ile Gök kamışı ağacından: Gök Rıhtımı (ACT 2) | Gök kamışı kalası, Kütük salı, Oyma kano |
| Gök kumu ² | 10 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Gök mantarı ² | 18 | yenir +3 | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Gök otu ² | 14 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Gök söğüdü kalası ² | 52 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Gök söğüdü odunu ² | 16 | – | Balta ile Gök söğüdü ağacından: Yüzen Kayalar (ACT 2) | Gök söğüdü kalası, Kütük salı, Oyma kano |
| Gök tazısı postu ² | 60 | – | Av: Gök tazısı düşürür %85 (ACT 2 · Yüzen Kayalar) | Fırtına tüyü başlık |
| Gök üzümü ² | 20 | – | Gök üzümü ağacından toplanır: Gök Rıhtımı (ACT 2) | Gök üzümü suyu |
| Gök üzümü kalası ² | 109 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Gök üzümü odunu ² | 38 | – | Balta ile Gök üzümü ağacından: Gök Rıhtımı (ACT 2) | Gök üzümü kalası, Kütük salı, Oyma kano |
| Gök üzümü suyu ² | 86 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Gölge dişi | 110 | – | Av: Gölge kurdu düşürür %60 (ACT 1 · Mor Kristal Vadisi) | Gölge dişi kolyesi, Ametist kılıcı |
| Gölge dişi kolyesi | 551 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gölge iksiri | 320 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gölge otu | 70 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Gölge iksiri |
| Gölge postu | 150 | – | Av: Gölge kurdu düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Tabaklanmış gölge postu |
| Göl boncuğu | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Göl çömleği | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Göl kasesi | 79 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Göl kerpici | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Göl tuğlası, Kerpiç duvar |
| Göl kili | 3 | – | Yerden toplanır: Bataklık (ACT 1) | Islak göl kili |
| Göl tuğlası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Granit | 3 | – | Kazmayla kazılır: Orman (ACT 1) | Granit balta, Granit kazma, Megalit, Öğütme taşı, Taş halka, Taş totem … (+1) |
| Granit balta | 62 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit gürz | 112 | alet, silah 27 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit kazma | 68 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Gübre | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gümüş cevheri | 14 | – | Kazmayla kazılır: Kayalık Dağ (ACT 1) | Gümüş külçesi |
| Gümüş kılıç | 472 | alet, silah 44 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Gümüş kum ² | 14 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Gümüş külçesi | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ametist yüzük, Gümüş yüzük, Gümüş kılıç, Gümüş pullu zırh, Kartal tüyü miğfer |
| Gümüş pullu zırh | 1.396 | giyilir +52 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Gümüş yüzük | 106 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Güve tozu | 45 | – | Av: Mor güve düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Işıltılı boya |
| Hafif taş ² | 12 | – | Kazmayla kazılır: Yüzen Kayalar (ACT 2) | – |
| Halat | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ağ, Asma fener, Bola, Dokuma tezgâhı, Dolap, Gemi … (+7) |
| Halı | 585 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Hardal ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hardal otu | 2 | – | Yerden toplanır: Çayır (ACT 1) | Hardal ezmesi, Kurutulmuş hardal otu |
| Hasat sepeti | 144 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yelkenli sal |
| Hasır | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Gemi, Hasır yatak, Kulübe, Kurutma rafı, Sepet, Yelkenli sal |
| Hasırotu | 1 | – | Yerden toplanır: Bataklık (ACT 1) | Hasırotu meşalesi, Hasırotu yatak |
| Hasırotu meşalesi | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hasırotu yatak | 240 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Hasır yatak | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Haşlanmış bıldırcın yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Haşlanmış keklik yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Haşlanmış ördek yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Haşlanmış turna kuşu yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Haşlanmış ur kekliği yumurtası | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Haşlanmış yaban kazı yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Havuç | 10 | yenir +8 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Çiftçi yahnisi, Hasat sepeti, Havuç çorbası, Kabak çorbası |
| Havuç çorbası | 50 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Havuç tohumu | 4 | – | Çiftçi Hasan alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Havuç) | – |
| Havyar | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hayvan yağı | 3 | – | Av: Geyik düşürür %30 (ACT 1 · Çayır) · Av: Yaban öküzü düşürür %60 (ACT 1 · Kayalık Dağ) · Av: Yaban domuzu düşürür %40 (ACT 1 · Orman) · Av: Mağara ayısı düşürür %60 (ACT 1 · Kayalık Dağ) · Av: Mantar geyiği düşürür %30 (ACT 2 · Dev Mantar Ormanı) · Av: Kor domuzu düşürür %40 (ACT 2 · Ejder Volkanı) · Av: Yıldız geyiği düşürür %30 (ACT 2 · Gök Rıhtımı) | Ateş çiçeği merhemi, Beyaz boya, Don yağı mumu, Gelincik boyası, Hasırotu meşalesi, Kara boya … (+13) |
| Hurda çizme ² | 1.631 | giyilir +15 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | Meka çizme |
| Hurda palmiyesi kalası ² | 67 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Hurda palmiyesi odunu ² | 22 | – | Balta ile Hurda palmiyesi ağacından: Hurda Çölü (ACT 2) | Hurda palmiyesi kalası, Kütük salı, Oyma kano |
| Hurda parçası ² | 10 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Hurda yığını ² | 10 | – | Kazmayla kazılır: Hurda Çölü (ACT 2) | – |
| Hurma ² | 10 | – | Hurma ağacından toplanır: Hurda Çölü (ACT 2) | Hurma ezmesi |
| Hurma ezmesi ² | 108 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Hurma kalası ² | 67 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Hurma odunu ² | 22 | – | Balta ile Hurma ağacından: Hurda Çölü (ACT 2) | Hurma kalası, Kütük salı, Oyma kano |
| Huş kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Huş kabuğu kabı, Huş katranı |
| Huş kabuğu kabı | 43 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Huş kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Huş kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Huş katranı | 50 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri tulum, Kara cila, Meşale |
| Huş kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Huş odunu | 3 | – | Balta ile Huş ağacından: Kayalık Dağ (ACT 1) | Huş kabuğu, Huş kalası, Huş kömürü, Kütük salı, Oyma kano |
| Huş sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Ihlamur çayı | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ihlamur çiçeği | 2 | – | Ihlamur ağacı kesilince 2 tane düşer | Ihlamur çayı |
| Ihlamur kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ihlamur kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Ihlamur kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ihlamur kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ihlamur odunu | 3 | – | Balta ile Ihlamur ağacından: Orman (ACT 1) | Ihlamur kabuğu, Ihlamur kalası, Ihlamur kömürü, Kütük salı, Oyma kano |
| Ihlamur sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Isırgan | 1 | – | Yerden toplanır: Orman (ACT 1) | Isırgan çorbası, Isırgan lifi, Kurutulmuş isırgan |
| Isırgan çorbası | 56 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Isırgan lifi | 10 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Islak beyaz kil | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Beyaz boncuk, Beyaz çömlek, Beyaz kerpiç, Kil figürin |
| Islak göl kili | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Göl boncuğu, Göl çömleği, Göl kerpici |
| Islak kırmızı kil | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kırmızı boncuk, Kırmızı çömlek, Kırmızı kerpiç |
| Islak nehir kili | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Nehir boncuğu, Nehir çömleği, Nehir kerpici, Pişmiş kil düdük, Yosun yalıtım |
| Işık ağacı kalası | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Işık ağacı kömürü | 110 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Işık ağacı odunu | 28 | – | Balta ile Işık ağacı ağacından: Mor Kristal Vadisi (ACT 1) | Işık ağacı kalası, Işık ağacı kömürü, Kütük salı, Oyma kano |
| Işık ağacı sapı | 121 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Işık fitili | 203 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Işık mantarı | 55 | yenir +4 | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Ay otu iksiri, Işık mantarı çorbası |
| Işık mantarı çorbası | 248 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Işık pulu | 120 | – | Av: Işık engereği düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Kristal boynuz tılsımı, Işık pulu eldiven |
| Işık pulu eldiven | 1.000 | giyilir +18 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Işık tilkisi eti | 20 | – | Av: Işık tilkisi düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş işık tilkisi eti, Pişmiş işık tilkisi eti, Turba ateşinde tütsü … (+1) |
| Işık tilkisi postu | 60 | – | Av: Işık tilkisi düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Tabaklanmış işık tilkisi postu |
| Işık tozu | 75 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Işık fitili |
| Işıldak mantarı ² | 20 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Işıltılı boya | 182 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Işın kılıcı ² | 6.400 | alet, silah 60 hasar | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Ejder Avcısı Alara yapar (800 sikke işçilik) | – |
| İp | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ağ, Akçaağaç kaşığı, Akrep kabuğu kalkanı, Akrep ok ucu, Altın kolye, Ana tanrıça heykelciği … (+161) |
| İri diken | 12 | – | Av: Oklu kirpi düşürür %100 (ACT 1 · Orman) | Diken ok ucu, Ceviz kabuğu miğfer |
| İskele | 215 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Kabak | 24 | yenir +10 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Hasat sepeti, Kabak çorbası, Kavrulmuş kabak çekirdeği, Korkuluk |
| Kabak çorbası | 55 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kabak tohumu | 8 | – | Çiftçi Hasan alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Kabak) | – |
| Kaba meşale | 7 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kadife balığı | 4 | – | Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %20; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %16; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş kadife balığı, Pişmiş kadife balığı, Taşta kadife balığı, Tütsülenmiş kadife balığı |
| Kafa lambası | 300 | giyilir +3 savunma | Yıldızsız Işıkçı ile takas: 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi (baş yuvasına takılır, gece kendiliğinden yanar) | – |
| Kaktüs meyvesi ² | 12 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Kalay cevheri | 7 | – | Kazmayla kazılır: Çayır (ACT 1) | Kalay külçesi |
| Kalay külçesi | 32 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tunç külçesi |
| Kamış | 1 | – | Yerden toplanır: Bataklık (ACT 1) | Kamış çizme, Kamış flüt, Kamış hasır, Kamış ok gövdesi, Bataklık çizmesi |
| Kamış çizme | 29 | giyilir +4 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kamış flüt | 6 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kamış hasır | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kamış kulübe çatısı |
| Kamış kulübe | 229 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur · Marangoz Rıza yapar (650 sikke) | – |
| Kamış kulübe çatısı | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | Kamış kulübe, Kerpiç ev |
| Kamış ok gövdesi | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kamp ateşi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kanlıca | 3 | – | Yerden toplanır: Orman (ACT 1) | Kızarmış kanlıca, Kurutulmuş kanlıca, Mantar çorbası |
| Karaca derisi | 6 | – | Av: Karaca düşürür %80 (ACT 1 · Orman) · Av: Buz karacası düşürür %80 (ACT 2 · Kristal Golem Ocağı) | Tabaklanmış karaca derisi |
| Karaca eti | 6 | – | Av: Karaca düşürür %100 (ACT 1 · Orman) · Av: Buz karacası düşürür %100 (ACT 2 · Kristal Golem Ocağı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş karaca eti, Pişmiş karaca eti, Turba ateşinde tütsü … (+1) |
| Karaca postu giysi | 257 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kara boya | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+2) |
| Kara cila | 157 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kara çam kalası | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kara çam kömürü | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kara çam odunu | 14 | – | Balta ile Kara çam ağacından: Kül Diyarı (ACT 1) | Kara çam kalası, Kara çam kömürü, Kütük salı, Oyma kano |
| Kara çam sapı | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Kara pul | 400 | – | Av: Kara ejder düşürür %100 (ACT 1 · Kül Diyarı) | Ejder pulu zırh |
| Kara tuz | 34 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kara tuzlu et |
| Kara tuzlu et | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kardelen | 8 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kardelen merhemi |
| Kardelen merhemi | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kartal eti | 10 | – | Av: Kartal düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kartal eti, Pişmiş kartal eti, Turba ateşinde tütsü … (+1) |
| Kartal pençesi | 22 | – | Av: Kartal düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Fırtına kartalı düşürür %50 (ACT 2 · Yüzen Kayalar) | Kartal pençesi kolyesi, Gümüş kılıç |
| Kartal pençesi kolyesi | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kartal tüyü | 14 | – | Av: Kartal düşürür %90 (ACT 1 · Kayalık Dağ) | Tüylü başlık, Tüylü ok, Kartal tüyü miğfer |
| Kartal tüyü miğfer | 435 | giyilir +24 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Kav | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş, Kozalak ateşi, Turba ateşinde tütsü |
| Kavak kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavak kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kavak kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavak kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kavak odunu | 3 | – | Balta ile Kavak ağacından: Çayır (ACT 1) | Kavak kabuğu, Kavak kalası, Kavak kömürü, Kütük salı, Oyma kano |
| Kavak sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kavrulmuş fındık | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı fındık |
| Kavrulmuş kabak çekirdeği | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavrulmuş kestane | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı kestane |
| Kavrulmuş su kestanesi | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavrulmuş yabani arpa | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavrulmuş yabani buğday | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavrulmuş yabani mercimek | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavrulmuş yabani nohut | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavrulmuş yabani yulaf | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kav mantarı | 2 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kav |
| Kaya çiçeği ² | 20 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Kaya patlatıcı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kayın kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kayın kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kayın kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kayın kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kayın mantarı | 3 | yenir +3 | Yerden toplanır: Kayalık Dağ (ACT 1) | Kızarmış kayın mantarı, Kurutulmuş kayın mantarı |
| Kayın odunu | 3 | – | Balta ile Kayın ağacından: Orman (ACT 1) | Kayın kabuğu, Kayın kalası, Kayın kömürü, Kütük salı, Oyma kano |
| Kayın sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kehribar | 15 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Altın kolye, Gümüş yüzük, Kehribar boncuk, Kül dişi muska |
| Kehribar boncuk | 50 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kehribar kolye |
| Kehribar kolye | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kekik | 2 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kekikli balık, Kurutulmuş kekik |
| Kekikli balık | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kekik çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keklik eti | 3 | – | Av: Keklik düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş keklik eti, Pişmiş keklik eti, Turba ateşinde tütsü … (+1) |
| Keklik tüyü | 2 | – | Av: Keklik düşürür %85 (ACT 1 · Çayır) | Tüylü başlık, Tüylü ok |
| Keklik yumurtası | 3 | – | Av: Keklik düşürür %30 (ACT 1 · Çayır) | Haşlanmış keklik yumurtası |
| Kemik | 2 | – | Av: Tavşan düşürür %30 (ACT 1 · Çayır) · Av: Geyik düşürür %50 (ACT 1 · Çayır) · Av: Karaca düşürür %50 (ACT 1 · Orman) · Av: Yaban öküzü düşürür %80 (ACT 1 · Kayalık Dağ) · Av: Yaban domuzu düşürür %50 (ACT 1 · Orman) · Av: Kurt düşürür %50 (ACT 1 · Çayır) · Av: Dikenli kirpi düşürür %30 (ACT 1 · Orman) · Av: Bataklık kurdu düşürür %50 (ACT 1 · Bataklık) · Av: Engerek düşürür %30 (ACT 1 · Orman) · Av: Oklu kirpi düşürür %40 (ACT 1 · Orman) · Av: Kunduz düşürür %30 (ACT 1 · Orman) · Av: Yaban atı düşürür %50 (ACT 1 · Çayır) · Av: Dağ keçisi düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Muflon düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Mağara ayısı düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Vaşak düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Porsuk düşürür %30 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %50 (ACT 2 · Dev Mantar Ormanı) · Av: Pas kirpisi düşürür %30 (ACT 2 · Hurda Çölü) · Av: Buz karacası düşürür %50 (ACT 2 · Kristal Golem Ocağı) · Av: Kor domuzu düşürür %50 (ACT 2 · Ejder Volkanı) · Av: Yıldız geyiği düşürür %50 (ACT 2 · Gök Rıhtımı) | Bazalt kazıyıcı, Çakmaktaşı kazıyıcı, Diken iğnesi, Kemik flüt, Kemik iğne, Kemik ilikli çorba … (+9) |
| Kemik flüt | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik iğne | 9 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Beyaz boncuk (alet), Dağ keçisi postu giysi (alet), Geyik postu giysi (alet), Göl boncuğu (alet), Kamış flüt (alet), Karaca postu giysi (alet) … (+12) |
| Kemik ilikli çorba | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik kolye | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik miğfer | 228 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik ok ucu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Kemik olta iğnesi | 10 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik zıpkın | 57 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Kemik zırh | 480 | giyilir +11 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kenevir | 3 | – | Yerden toplanır: Bataklık (ACT 1) | Kenevir lifi |
| Kenevir halatı | 140 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri çanta, İskele, Megalit |
| Kenevir lifi | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kenevir halatı, Kenevir torba |
| Kenevir torba | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kerevit | 4 | – | Av: Kerevit düşürür %100 (ACT 1 · Çayır) · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %18; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş kerevit, Pişmiş kerevit, Taşta kerevit, Tütsülenmiş kerevit |
| Kerpiç duvar | 234 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | Çömlek fırını, Kerpiç ev |
| Kerpiç ev | 378 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur · Marangoz Rıza yapar (950 sikke) | – |
| Kertenkele eti ² | 8 | – | Av: Kaya kertenkelesi düşürür %80 (ACT 2 · Yüzen Kayalar) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş kertenkele eti, Turba ateşinde tütsü |
| Kertenkele pulu ² | 14 | – | Av: Kaya kertenkelesi düşürür %90 (ACT 2 · Yüzen Kayalar) | – |
| Keskin taş | 3 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bağlı uç, Kemik olta iğnesi, Kürek, Mızrak, Sivri taş, Sopa … (+3) |
| Kestane | 2 | yenir +5 | Meyve ağacı (Kestane): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Kestane ağacından toplanır: Kayalık Dağ (ACT 1) | Kavrulmuş kestane |
| Kestane kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kestane kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kestane kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kestane kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kestane odunu | 3 | – | Balta ile Kestane ağacından: Kayalık Dağ (ACT 1) | Kestane kabuğu, Kestane kalası, Kestane kömürü, Kütük salı, Oyma kano |
| Kestane sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kestane tohumu | 3 | – | Kestane ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Keten | 3 | – | Yerden toplanır: Bataklık (ACT 1) | Keten lifi |
| Keten ipliği | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Halı, Keten kumaş, Kilim |
| Keten kumaş | 101 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Duvar halısı, Halı, Keten tunik, Perde |
| Keten lifi | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Keten ipliği |
| Keten tunik | 170 | giyilir +2 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı tunik |
| Kırmızı boncuk | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kırmızı boya | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ana tanrıça heykelciği, Av sahnesi duvar resmi, Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı … (+3) |
| Kırmızı çömlek | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Kırmızı kase | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Kırmızı kerpiç | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kerpiç duvar, Kırmızı tuğla |
| Kırmızı kil | 4 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Islak kırmızı kil |
| Kırmızı okr | 5 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kırmızı okr tozu |
| Kırmızı okr tozu | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | El izi resmi, Kırmızı boya |
| Kırmızı tuğla | 71 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Kıvılcım | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş, Kav, Kozalak ateşi, Turba ateşinde tütsü |
| Kıymık kolye | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızak | 41 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış çayır mantarı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış kanlıca | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış kayın mantarı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış kuzugöbeği | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış mağara mantarı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış tavuk mantarı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış yabani havuç | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılağaç kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılağaç kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kızılağaç kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılağaç kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kızılağaç odunu | 3 | – | Balta ile Kızılağaç ağacından: Bataklık (ACT 1) | Kızılağaç kabuğu, Kızılağaç kalası, Kızılağaç kömürü, Kütük salı, Oyma kano |
| Kızılağaç sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kızılcık | 2 | yenir +5 | Yerden toplanır: Bataklık (ACT 1) | Kızılcık ezmesi, Kızılcık suyu, Kurutulmuş kızılcık |
| Kızılcık ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılcık suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılkanat | 4 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %13; balık kapanına da girer · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %17; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş kızılkanat, Pişmiş kızılkanat, Taşta kızılkanat, Tütsülenmiş kızılkanat |
| Kızıl cam | 117 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızıl ejder pulu ² | 300 | – | Av: Kızıl ejder düşürür %100 (ACT 2 · Ejder Volkanı) | – |
| Kızıl kum | 22 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kızıl cam |
| Kızıl sedir kalası | 57 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kızıl sedir kömürü | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kızıl sedir odunu | 18 | – | Balta ile Kızıl sedir ağacından: Kül Diyarı (ACT 1) | Kızıl sedir kalası, Kızıl sedir kömürü, Kütük salı, Oyma kano |
| Kızıl sedir sapı | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kilim | 228 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Kil figürin | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ana tanrıça heykelciği |
| Kil lamba | 129 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kireçtaşı | 3 | – | Kazmayla kazılır: Çayır (ACT 1) | Sönmemiş kireç |
| Kireç harcı | 63 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kirmen | 63 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Keten ipliği (alet) |
| Kirpi dikeni | 4 | – | Av: Dikenli kirpi düşürür %100 (ACT 1 · Orman) · Av: Oklu kirpi düşürür %80 (ACT 1 · Orman) · Av: Pas kirpisi düşürür %100 (ACT 2 · Hurda Çölü) | Diken iğnesi, Meşe kabuk zırh |
| Kobalt cevheri ² | 44 | – | Kazmayla kazılır: Kristal Golem Ocağı (ACT 2) | Kobalt külçesi |
| Kobalt külçesi ² | 184 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Kristal miğfer, Meka zırh |
| Konak | 3.200 | – | Marangoz Rıza yapar (5.000 sikke) | – |
| Kor | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Balık tutkalı, Közlenmiş şiş, Oyma kano |
| Korkuluk | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kor kertenkelesi eti ² | 14 | – | Av: Kor kertenkelesi düşürür %100 (ACT 2 · Ejder Volkanı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş kor kertenkelesi eti, Turba ateşinde tütsü |
| Kor mantarı ² | 26 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Kor merhemi | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kor otu | 30 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kor merhemi |
| Kor pulu ² | 40 | – | Av: Kor kertenkelesi düşürür %80 (ACT 2 · Ejder Volkanı) | – |
| Kozalak ateşi | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kök ağacı kalası ² | 62 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Kök ağacı odunu ² | 20 | – | Balta ile Kök ağacı ağacından: Dev Mantar Ormanı (ACT 2) | Kök ağacı kalası, Kütük salı, Oyma kano |
| Kök taşı ² | 12 | – | Kazmayla kazılır: Dev Mantar Ormanı (ACT 2) | – |
| Kök yumrusu ² | 14 | yenir +5 | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Kömür ağacı kalası ² | 99 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kömür ağacı odunu ² | 34 | – | Balta ile Kömür ağacı ağacından: Ejder Volkanı (ACT 2) | Kömür ağacı kalası, Kütük salı, Oyma kano |
| Közde patates | 73 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Közlenmiş alabalık | 11 | – | Kamp ateşinde közlenir (çiğ hali: Alabalık) | – |
| Közlenmiş bıldırcın eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Bıldırcın eti) | – |
| Közlenmiş çapak | 7 | – | Kamp ateşinde közlenir (çiğ hali: Çapak) | – |
| Közlenmiş dağ keçisi eti | 15 | – | Kamp ateşinde közlenir (çiğ hali: Dağ keçisi eti) | – |
| Közlenmiş geyik eti | 16 | – | Kamp ateşinde közlenir (çiğ hali: Geyik eti) | – |
| Közlenmiş kadife balığı | 9 | – | Kamp ateşinde közlenir (çiğ hali: Kadife balığı) | – |
| Közlenmiş karaca eti | 13 | – | Kamp ateşinde közlenir (çiğ hali: Karaca eti) | – |
| Közlenmiş keklik eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Keklik eti) | – |
| Közlenmiş kerevit | 9 | – | Kamp ateşinde közlenir (çiğ hali: Kerevit) | – |
| Közlenmiş kızılkanat | 9 | – | Kamp ateşinde közlenir (çiğ hali: Kızılkanat) | – |
| Közlenmiş kunduz eti | 11 | – | Kamp ateşinde közlenir (çiğ hali: Kunduz eti) | – |
| Közlenmiş kurt eti | 13 | – | Kamp ateşinde közlenir (çiğ hali: Kurt eti) | – |
| Közlenmiş mağara ayısı eti | 24 | – | Kamp ateşinde közlenir (çiğ hali: Mağara ayısı eti) | – |
| Közlenmiş mersin balığı | 24 | – | Kamp ateşinde közlenir (çiğ hali: Mersin balığı) | – |
| Közlenmiş muflon eti | 15 | – | Kamp ateşinde közlenir (çiğ hali: Muflon eti) | – |
| Közlenmiş ördek eti | 9 | – | Kamp ateşinde közlenir (çiğ hali: Ördek eti) | – |
| Közlenmiş sazan | 9 | – | Kamp ateşinde közlenir (çiğ hali: Sazan) | – |
| Közlenmiş sincap eti | 6 | – | Kamp ateşinde közlenir (çiğ hali: Sincap eti) | – |
| Közlenmiş su samuru eti | 11 | – | Kamp ateşinde közlenir (çiğ hali: Su samuru eti) | – |
| Közlenmiş şiş | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) · Kamp ateşinde közlenir (çiğ hali: şiş) | – |
| Közlenmiş tatlısu kefali | 9 | – | Kamp ateşinde közlenir (çiğ hali: Tatlısu kefali) | – |
| Közlenmiş tatlısu levreği | 11 | – | Kamp ateşinde közlenir (çiğ hali: Tatlısu levreği) | – |
| Közlenmiş tavşan eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Tavşan eti) | – |
| Közlenmiş timsah eti | 20 | – | Kamp ateşinde közlenir (çiğ hali: Timsah eti) | – |
| Közlenmiş turna balığı | 13 | – | Kamp ateşinde közlenir (çiğ hali: Turna balığı) | – |
| Közlenmiş turna kuşu eti | 11 | – | Kamp ateşinde közlenir (çiğ hali: Turna kuşu eti) | – |
| Közlenmiş yaban atı eti | 18 | – | Kamp ateşinde közlenir (çiğ hali: Yaban atı eti) | – |
| Közlenmiş yaban domuzu eti | 15 | – | Kamp ateşinde közlenir (çiğ hali: Yaban domuzu eti) | – |
| Közlenmiş yaban kazı eti | 11 | – | Kamp ateşinde közlenir (çiğ hali: Yaban kazı eti) | – |
| Közlenmiş yaban öküzü eti | 20 | – | Kamp ateşinde közlenir (çiğ hali: Yaban öküzü eti) | – |
| Közlenmiş yayın | 15 | – | Kamp ateşinde közlenir (çiğ hali: Yayın) | – |
| Kristal | 12 | – | Kazmayla kazılır: Mor Kristal Vadisi (ACT 1) · Av: Kristal golem düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Golem feneri, Kristal parçası, Ametist kılıcı, Işık pulu eldiven |
| Kristal armut ² | 14 | – | Kristal armut ağacından toplanır: Kristal Golem Ocağı (ACT 2) | Kristal armut kompostosu |
| Kristal armut kalası ² | 83 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Kristal armut kompostosu ² | 88 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Kristal armut odunu ² | 28 | – | Balta ile Kristal armut ağacından: Kristal Golem Ocağı (ACT 2) | Kristal armut kalası, Kütük salı, Oyma kano |
| Kristal boynuz | 140 | – | Av: Kristal geyik düşürür %45 (ACT 1 · Mor Kristal Vadisi) | Kristal boynuz tılsımı |
| Kristal boynuz tılsımı | 356 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal cam | 226 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal cevheri ² | 34 | – | Kazmayla kazılır: Kristal Golem Ocağı (ACT 2) | – |
| Kristal çam kalası ² | 88 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Buz asası, Dolap … (+15) |
| Kristal çam odunu ² | 30 | – | Balta ile Kristal çam ağacından: Kristal Golem Ocağı (ACT 2) | Kristal çam kalası, Kütük salı, Oyma kano |
| Kristal çiçeği | 80 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Kristal çiçeği tacı |
| Kristal çiçeği tacı | 382 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal geyik derisi | 80 | – | Av: Kristal geyik düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Tabaklanmış kristal geyik derisi |
| Kristal geyik eti | 30 | – | Av: Kristal geyik düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kristal geyik eti, Pişmiş kristal geyik eti, Turba ateşinde tütsü … (+1) |
| Kristal ipek | 90 | – | Av: Kristal örümcek düşürür %90 (ACT 1 · Mor Kristal Vadisi) | Gemi, Gölge dişi kolyesi, Kristal ipek kumaş, Kristal ipek zırh |
| Kristal ipek kumaş | 476 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal ipek zırh | 2.554 | giyilir +72 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Kristal kanat ² | 50 | – | Av: Kristal yarasası düşürür %80 (ACT 2 · Kristal Golem Ocağı) | Kristal miğfer |
| Kristal kum | 50 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Kristal cam |
| Kristal lifi ² | 18 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | Işın kılıcı |
| Kristal mantarı ² | 24 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Kristal miğfer ² | 3.699 | giyilir +26 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Kristal parçası | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Cilalı kristal |
| Kulübe | 201 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur · Marangoz Rıza yapar (450 sikke) | – |
| Kulübe iskeleti | 131 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | Deri çadır, Kamış kulübe, Kulübe, Tütsühane |
| Kum | 1 | – | Yerden toplanır: Mor Kristal Vadisi, Orman, Çayır, Bataklık, Kayalık Dağ, Kül Diyarı (ACT 1) | Ana tanrıça heykelciği, Arı kovanı, Ateş yeri, Av sahnesi duvar resmi, Balık pulu, Beyaz boncuk … (+63) |
| Kumtaşı | 3 | – | Kazmayla kazılır: Orman (ACT 1) | Bileği taşı |
| Kum torbası | 240 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kunduz derisi | 5 | – | Av: Kunduz düşürür %75 (ACT 1 · Orman) · Av: Porsuk düşürür %75 (ACT 1 · Çayır) | Tabaklanmış kunduz derisi |
| Kunduz eti | 5 | – | Av: Kunduz düşürür %100 (ACT 1 · Orman) · Av: Porsuk düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kunduz eti, Pişmiş kunduz eti, Turba ateşinde tütsü … (+1) |
| Kunduz postu giysi | 262 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurbağa | 2 | yenir +3, zehirli | Av: Zehirli kurbağa düşürür %60 (ACT 1 · Bataklık) | Balık çorbası, Balık sepeti, Kurutulmuş kurbağa, Pişmiş kurbağa, Taşta kurbağa, Tütsülenmiş kurbağa |
| Kurt derisi | 9 | – | Av: Kurt düşürür %75 (ACT 1 · Çayır) | Tabaklanmış kurt derisi |
| Kurt dişi | 10 | – | Av: Kurt düşürür %50 (ACT 1 · Çayır) · Av: Bataklık kurdu düşürür %50 (ACT 1 · Bataklık) | Diş kolye |
| Kurt eti | 6 | zehirli | Av: Kurt düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kurt eti, Pişmiş kurt eti, Turba ateşinde tütsü … (+1) |
| Kurt postu giysi | 262 | giyilir +8 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutma rafı | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Kurutulmuş adaçayı | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Adaçayı çayı |
| Kurutulmuş ahududu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş alabalık | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş alıç | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş ardıç meyvesi | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş ateş narı | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş ay elması | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş bıldırcın eti | 32 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş böğürtlen | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş civanperçemi | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Civanperçemi çayı |
| Kurutulmuş çapak | 32 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş çayır mantarı | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş dağ keçisi eti | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş ebegümeci | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş gelincik | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Gelincik çayı |
| Kurutulmuş geyik eti | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş hardal otu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş isırgan | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş işık tilkisi eti | 58 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kadife balığı | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kanlıca | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş karaca eti | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kartal eti | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kayın mantarı | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kekik | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekik çayı |
| Kurutulmuş keklik eti | 32 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kerevit | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kızılcık | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş kızılkanat | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kristal geyik eti | 71 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kunduz eti | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kurbağa | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kurt eti | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kuşburnu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kuşburnu çayı, Meyveli pemmikan |
| Kurutulmuş kuzugöbeği | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kuzukulağı | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş lavanta | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Lavanta çayı |
| Kurutulmuş mağara ayısı eti | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş mağara mantarı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş mersin balığı | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş meyve keki | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş muflon eti | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş mürver | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş nane | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Nane çayı |
| Kurutulmuş ördek eti | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş papatya | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Papatya çayı |
| Kurutulmuş rezene | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Rezene çayı |
| Kurutulmuş sazan | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş sincap eti | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş sinirotu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sinirotu çayı |
| Kurutulmuş su samuru eti | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş su teresi | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tatlısu kefali | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tatlısu levreği | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tatlısu midyesi | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tavşan eti | 32 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş tavuk mantarı | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş turna balığı | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş turna kuşu eti | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş ur kekliği eti | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş vaşak eti | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yabani armut | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yabani elma | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yabani erik | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yabani havuç | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yaban atı eti | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban çileği | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yaban domuzu eti | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban kazı eti | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban mersini | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yaban öküzü eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban sarımsağı | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yayın | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yılan balığı | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yıldız eriği | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kuru çınar kalası ² | 73 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Kuru çınar odunu ² | 24 | – | Balta ile Kuru çınar ağacından: Hurda Çölü (ACT 2) | Kuru çınar kalası, Kütük salı, Oyma kano |
| Kuru ot | 1 | – | Yerden toplanır: Çayır (ACT 1) | Ahşap karyola, Beyaz kerpiç, Duman tütsüsü, Eğrelti yatağı, Erzak çukuru, Göl kerpici … (+44) |
| Kuşburnu | 2 | yenir +4 | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş kuşburnu, Kuşburnu ezmesi, Kuşburnu suyu |
| Kuşburnu çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kuşburnu ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kuşburnu suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kuvars | 5 | – | Kazmayla kazılır: Kayalık Dağ (ACT 1) | Yontulmuş kuvars, Gümüş kılıç |
| Kuvars balta | 101 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars bıçak | 151 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars kazıyıcı | 110 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars kazma | 469 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars mızrak | 459 | alet, silah 18 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars ok ucu | 837 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Kuvars pulu | 62 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kuvars bıçak, Kuvars kazıyıcı, Kuvars ok ucu |
| Kuvars sivri ucu | 292 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kuvars kazma, Kuvars mızrak |
| Kuzugöbeği | 6 | yenir +4, zehirli | Yerden toplanır: Orman (ACT 1) | Kızarmış kuzugöbeği, Kurutulmuş kuzugöbeği |
| Kuzukulağı | 1 | yenir +2, zehirli | Yerden toplanır: Orman (ACT 1) | Kurutulmuş kuzukulağı, Ot salatası |
| Kükürt | 6 | – | Kazmayla kazılır: Kül Diyarı (ACT 1) | Kükürtlü merhem, Kükürt çakmağı |
| Kükürtlü merhem | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kükürt çakmağı | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş, Kozalak ateşi, Turba ateşinde tütsü |
| Kükürt tozu ² | 18 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Kül | 1 | – | Yerden toplanır: Kül Diyarı (ACT 1) · Av: Kül cini düşürür %100 (ACT 1 · Kül Diyarı) · Av: Kül böceği düşürür %100 (ACT 1 · Kül Diyarı) | Ateş çiçeği merhemi, Cüruf tuğlası, Kül ekmeği, Kül postu pelerin |
| Kül ağacı kalası | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kül ağacı kömürü | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kül ağacı odunu | 14 | – | Balta ile Kül ağacı ağacından: Kül Diyarı (ACT 1) | Kül ağacı kalası, Kül ağacı kömürü, Kütük salı, Oyma kano |
| Kül ağacı sapı | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Kül böceği kabuğu | 30 | – | Av: Kül böceği düşürür %90 (ACT 1 · Kül Diyarı) | Kara cila, Kül böceği zırh |
| Kül böceği zırh | 1.736 | giyilir +64 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Kül dişi | 80 | – | Av: Kül kurdu düşürür %50 (ACT 1 · Kül Diyarı) | Kül dişi muska |
| Kül dişi muska | 277 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kül ekmeği | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kül kurdu postu | 120 | – | Av: Kül kurdu düşürür %80 (ACT 1 · Kül Diyarı) | Kül postu pelerin, Kül böceği zırh |
| Kül postu pelerin | 325 | giyilir +26 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kürek | 41 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Kürk başlık | 277 | giyilir +4 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kürk eldiven | 270 | giyilir +3 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kütük salı | 73 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ladin kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ladin reçinesi |
| Ladin kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Ladin kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ladin kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ladin odunu | 3 | – | Balta ile Ladin ağacından: Orman (ACT 1) | Kütük salı, Ladin kabuğu, Ladin kalası, Ladin kömürü, Oyma kano |
| Ladin reçinesi | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kara cila, Meşale |
| Ladin sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Lav camı kılıcı | 955 | alet, silah 55 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Lavanta | 3 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş lavanta, Lavanta yağı |
| Lavanta çayı | 71 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Lavanta yağı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Lav camı | 40 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Lav camı ok ucu, Lav camı kılıcı |
| Lav camı ok ucu | 116 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Lav çiçeği ² | 30 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Lav palmiyesi kalası ² | 99 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Lav palmiyesi odunu ² | 34 | – | Balta ile Lav palmiyesi ağacından: Ejder Volkanı (ACT 2) | Kütük salı, Lav palmiyesi kalası, Oyma kano |
| Lav pulu | 110 | – | Av: Lav kertenkelesi düşürür %80 (ACT 1 · Kül Diyarı) | Lav pulu eldiven, Kül böceği zırh, Akrep kabuğu çizme |
| Lav pulu eldiven | 550 | giyilir +10 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Lens ² | 60 | – | Av: Lazer dronu düşürür %60 (ACT 2 · Hurda Çölü) | – |
| Lif | 1 | – | Yerden toplanır: Çayır, Orman, Kül Diyarı, Bataklık, Mor Kristal Vadisi, Kayalık Dağ (ACT 1) | Ağ, Akçaağaç kalası, Akçaağaç kaşığı, Akçaağaç kömürü, Akçaağaç sapı, Ardıç kalası … (+190) |
| Liken | 5 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Liken boyası |
| Liken boyası | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Magma camı ² | 44 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Magma cevheri ² | 56 | – | Kazmayla kazılır: Ejder Volkanı (ACT 2) · Av: Lav golemi düşürür %90 (ACT 2 · Ejder Volkanı) | – |
| Magma çekirdeği ² | 160 | – | Av: Lav golemi düşürür %70 (ACT 2 · Ejder Volkanı) | – |
| Magma kabuğu ² | 50 | – | Av: Lav salyangozu düşürür %90 (ACT 2 · Ejder Volkanı) | – |
| Mağara ayısı derisi | 24 | – | Av: Mağara ayısı düşürür %90 (ACT 1 · Kayalık Dağ) | Tabaklanmış mağara ayısı derisi |
| Mağara ayısı eti | 12 | – | Av: Mağara ayısı düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş mağara ayısı eti, Pişmiş mağara ayısı eti, Turba ateşinde tütsü … (+1) |
| Mağara ayısı postu giysi | 291 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ayı postu pelerin |
| Mağara mantarı | 4 | yenir +3, zehirli | Yerden toplanır: Orman, Çayır, Bataklık, Kayalık Dağ, Kül Diyarı, Mor Kristal Vadisi (ACT 1) | Kızarmış mağara mantarı, Kurutulmuş mağara mantarı |
| Mağara resmi | 78 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Av sahnesi duvar resmi |
| Mana iksiri ² | 139 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Büyücü Pervin yapar (10 sikke işçilik) | – |
| Mantar çorbası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mantar lifi eldiven ² | 1.520 | giyilir +14 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | Ejder pulu eldiven |
| Mantar şapkası ² | 16 | yenir +3 | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Masa | 139 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Mavi mantar kalası ² | 67 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Ateş asası, Atölye, Dolap … (+15) |
| Mavi mantar odunu ² | 22 | – | Balta ile Mavi mantar ağacından: Dev Mantar Ormanı (ACT 2) | Kütük salı, Mavi mantar kalası, Oyma kano |
| Mavi sedir kalası ² | 93 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Mavi sedir odunu ² | 32 | – | Balta ile Mavi sedir ağacından: Kristal Golem Ocağı (ACT 2) | Kütük salı, Mavi sedir kalası, Oyma kano |
| Mavi yosun ² | 14 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Medüz jölesi ² | 40 | – | Av: Gök medüzü düşürür %90 (ACT 2 · Gök Rıhtımı) | – |
| Megalit | 198 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | Taş çember |
| Meka çizme ² | 4.298 | giyilir +18 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Meka zırh ² | 5.200 | giyilir +90 savunma | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Mühendis Selin yapar (600 sikke işçilik) | – |
| Mersin balığı | 12 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %3; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %25; balık kapanına da girer | Balık çorbası, Balık sepeti, Balık tutkalı, Havyar, Kurutulmuş mersin balığı, Pişmiş mersin balığı … (+2) |
| Meşale | 61 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Meşe kabuğu | 13 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Meşe tanini |
| Meşe kabuk zırh | 543 | giyilir +30 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Meşe kalası | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+17) |
| Meşe kaşığı | 80 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meşe kömürü | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Meşe odunu | 4 | – | Balta ile Meşe ağacından: Orman (ACT 1) | Kütük salı, Meşe kabuğu, Meşe kalası, Meşe kömürü, Oyma kano |
| Meşe palamudu | 1 | yenir +2, zehirli | Meşe ağacı kesilince 1 tane düşer | Palamut unu |
| Meşe sapı | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+23) |
| Meşe tanini | 90 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tabakhane, Tabaklanmış dağ keçisi derisi, Tabaklanmış geyik derisi, Tabaklanmış gölge postu, Tabaklanmış işık tilkisi postu, Tabaklanmış karaca derisi … (+12) |
| Meteor demiri ² | 70 | – | Kazmayla kazılır: Gök Rıhtımı (ACT 2) | Meteor demiri külçesi |
| Meteor demiri külçesi ² | 390 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Roket gövdesi |
| Meteor parçası ² | 50 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Meyveli pemmikan | 98 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meyve fidanı | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meyve karışımı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mızrak | 39 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Midye kabuğu kaşık | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mor çekirdek ² | 360 | – | Av: Uzaylı dronu düşürür %40 (ACT 2 · Gök Rıhtımı) · Av: Gölge muhafız düşürür %50 (ACT 2 · Gök Rıhtımı) | – |
| Mor ip | 200 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mor kıymık | 30 | – | Gece balık tutarken %5 ihtimalle oltaya takılır · Yalnız gece, karanlıkta karada beliren mor parıltı (Çayır/Orman); E ile toplanır | Ay ışığı iksiri, Kıymık kolye |
| Mor kök | 55 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Mor kök boyası |
| Mor kök boyası | 149 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Mor ok | 377 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mor pusula | 250 | – | Eski Sisli Ada sonunun ödülü (kodda duruyor; güncel akışta ulaşılıp ulaşılmadığı test raporuna bakın) | – |
| Mor sarmaşık | 50 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Kristal çiçeği tacı, Mor ip, Yıldız çelengi |
| Mor söğüt kalası | 73 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Mor söğüt kömürü | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Mor söğüt odunu | 24 | – | Balta ile Mor söğüt ağacından: Mor Kristal Vadisi (ACT 1) | Kütük salı, Mor söğüt kalası, Mor söğüt kömürü, Oyma kano |
| Mor söğüt sapı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Mor yosun | 45 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Mor yosun yastığı |
| Mor yosun yastığı | 243 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Mor zehir | 130 | – | Av: Işık engereği düşürür %70 (ACT 1 · Mor Kristal Vadisi) | Mor ok |
| Motor ² | 180 | – | Av: Hurda devi düşürür %80 (ACT 2 · Hurda Çölü) | Meka zırh, Pompalı |
| Muflon derisi | 7 | – | Av: Muflon düşürür %80 (ACT 1 · Kayalık Dağ) | Tabaklanmış muflon derisi |
| Muflon eti | 7 | – | Av: Muflon düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş muflon eti, Pişmiş muflon eti, Turba ateşinde tütsü … (+1) |
| Muflon postu giysi | 258 | giyilir +7 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Muhafız zırhı parçası ² | 220 | – | Av: Gölge muhafız düşürür %80 (ACT 2 · Gök Rıhtımı) | Meka çizme |
| Mürver | 2 | yenir +3, zehirli | Meyve ağacı (Mürver): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Mürver ağacından toplanır: Bataklık (ACT 1) | Kurutulmuş mürver, Mürver boyası, Mürver ezmesi, Mürver suyu |
| Mürver boyası | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Mürver ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mürver odunu | – | – | Balta ile Mürver ağacından: Bataklık (ACT 1) | – |
| Mürver suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mürver tohumu | 3 | – | Mürver ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Nane | 2 | – | Yerden toplanır: Çayır (ACT 1) | Ay çayı, Kurutulmuş nane |
| Nane çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Nehir boncuğu | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Nehir çakılı | 1 | – | Yerden toplanır: Çayır, Orman, Mor Kristal Vadisi, Bataklık, Kayalık Dağ, Kül Diyarı (ACT 1) | Bola, Çekiç taşı, Taş havan |
| Nehir çömleği | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Nehir kasesi | 79 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Nehir kerpici | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kerpiç duvar, Nehir tuğlası |
| Nehir kili | 3 | – | Kürek ile nehir kıyısındaki kilden kazılır | Islak nehir kili |
| Nehir tuğlası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Nilüfer | 3 | – | Yerden toplanır: Bataklık (ACT 1) | Nilüfer çorbası, Nilüfer kökü unu |
| Nilüfer çorbası | 57 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Nilüfer kökü unu | 13 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği |
| Obsidyen | 10 | – | Kazmayla kazılır: Mor Kristal Vadisi (ACT 1) | Yontulmuş obsidyen, Ametist kılıcı |
| Obsidyen balta | 113 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen bıçak | 170 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen dikeni kalası ² | 109 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Obsidyen dikeni odunu ² | 38 | – | Balta ile Obsidyen dikeni ağacından: Ejder Volkanı (ACT 2) | Kütük salı, Obsidyen dikeni kalası, Oyma kano |
| Obsidyen kazıyıcı | 129 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen kazma | 725 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen kırığı ² | 30 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Obsidyen mızrak | 716 | alet, silah 28 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen ok ucu | 1.114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Obsidyen pulu | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Obsidyen bıçak, Obsidyen kazıyıcı, Obsidyen ok ucu |
| Obsidyen sivri ucu | 481 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Obsidyen kazma, Obsidyen mızrak |
| Ok | 78 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Mor ok, Tüylü ok, Zehirli ok |
| Ok kılıfı | 240 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Olta | 69 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Ot salatası | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Oyma kano | 97 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Öğütme taşı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Ceviz yağı (alet), Nilüfer kökü unu (alet), Palamut unu (alet), Yabani arpa unu (alet), Yabani buğday unu (alet), Yabani mercimek unu (alet) … (+2) |
| Öküz boynuzu | 16 | – | Av: Yaban öküzü düşürür %50 (ACT 1 · Kayalık Dağ) | Boynuz borazan, Boynuz kupa, Kartal tüyü miğfer |
| Ördek eti | 4 | – | Av: Ördek düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş ördek eti, Pişmiş ördek eti, Turba ateşinde tütsü … (+1) |
| Ördek tüyü | 2 | – | Av: Ördek düşürür %85 (ACT 1 · Bataklık) | Tüylü başlık, Tüylü ok |
| Ördek yumurtası | 3 | – | Av: Ördek düşürür %35 (ACT 1 · Bataklık) | Haşlanmış ördek yumurtası |
| Örümcek gözü | 100 | – | Av: Kristal örümcek düşürür %50 (ACT 1 · Mor Kristal Vadisi) | Gölge iksiri |
| Palamut ekmeği | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Palamut unu | 7 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Palamut ekmeği |
| Panzehir | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Papatya | 1 | – | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş papatya, Papatya tacı, Saksı |
| Papatya çayı | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Papatya tacı | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Pas ağacı kalası ² | 73 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Pas ağacı odunu ² | 24 | – | Balta ile Pas ağacı ağacından: Hurda Çölü (ACT 2) | Kütük salı, Oyma kano, Pas ağacı kalası |
| Pas tozu ² | 8 | – | Yerden toplanır: Hurda Çölü (ACT 2) · Av: Pas böceği düşürür %100 (ACT 2 · Hurda Çölü) | – |
| Patates | 12 | yenir +5 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Çiftçi yahnisi, Hasat sepeti, Közde patates, Patates püresi |
| Patates püresi | 59 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Patates tohumu | 5 | – | Çiftçi Hasan alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Patates) | – |
| Pemmikan | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Meyveli pemmikan |
| Pençe kolye | 63 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Perde | 302 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Pil ² | 50 | – | Av: Lazer dronu düşürür %70 (ACT 2 · Hurda Çölü) | Enerji hücresi |
| Pirinç cevheri ² | 24 | – | Kazmayla kazılır: Hurda Çölü (ACT 2) | Pirinç külçesi |
| Pirinç külçesi ² | 102 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Pompalı fişeği, Tabanca mermisi |
| Pirit | 6 | – | Kazmayla kazılır: Kül Diyarı (ACT 1) | Kükürt çakmağı, Pirit çakmağı |
| Pirit çakmağı | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | Ateş, Kozalak ateşi, Turba ateşinde tütsü |
| Pişirme taşı | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | Kızarmış çayır mantarı (alet), Kızarmış kanlıca (alet), Kızarmış kayın mantarı (alet), Kızarmış kuzugöbeği (alet), Kızarmış mağara mantarı (alet), Kızarmış tavuk mantarı (alet) … (+20) |
| Pişmiş alabalık | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş bıldırcın eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş bulut koyunu eti ² | 52 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş buz tavşanı eti ² | 54 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş çapak | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş dağ keçisi eti | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş geyik eti | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş işık tilkisi eti | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kadife balığı | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş karaca eti | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kartal eti | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş keklik eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kerevit | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş kertenkele eti ² | 49 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kızılkanat | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş kil düdük | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Pişmiş kor kertenkelesi eti ² | 57 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kristal geyik eti | 78 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kunduz eti | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş kurbağa | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş kurt eti | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş mağara ayısı eti | 51 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş mersin balığı | 51 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş muflon eti | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş ördek eti | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş rüzgâr kuşu eti ² | 49 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş sazan | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş sincap eti | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş su samuru eti | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş tatlısu kefali | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş tatlısu levreği | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş tatlısu midyesi | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş tavşan eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş timsah eti | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Pişmiş turna balığı | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş turna kuşu eti | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş ur kekliği eti | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş vaşak eti | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş yaban atı eti | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş yaban domuzu eti | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş yaban kazı eti | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş yaban öküzü eti | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Pişmiş yayın | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş yılan balığı | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekikli balık |
| Pişmiş yıldız tilkisi eti ² | 60 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Sarımsaklı et |
| Plazma hücresi ² | 539 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Işın kılıcı, Roket motoru, Yıldız külçesi |
| Plazma taşı ² | 60 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | Plazma hücresi, Yıldırım asası |
| Pompalı ² | 2.600 | alet | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Silahçı Tamer yapar (400 sikke işçilik) | – |
| Pompalı fişeği ² | 90 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Porsuk kabuğu | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Porsuk kalası | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Porsuk kaşığı | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Porsuk kömürü | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Porsuk odunu | 6 | – | Balta ile Porsuk ağacından: Kayalık Dağ (ACT 1) | Kütük salı, Oyma kano, Porsuk kabuğu, Porsuk kalası, Porsuk kömürü |
| Porsuk sapı | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+23) |
| Porsuk yayı | 92 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Raf | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Rezene | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş rezene |
| Rezene çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Robot çekirdeği ² | 90 | – | Av: Devriye robotu düşürür %70 (ACT 2 · Hurda Çölü) | – |
| Roket ² | 30.000 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Astronot Tuna yapar (2000 sikke işçilik) | – |
| Roket gövdesi ² | 9.000 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Astronot Tuna yapar (1000 sikke işçilik) | Roket |
| Roket motoru ² | 14.000 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Astronot Tuna yapar (1500 sikke işçilik) | Roket |
| Rüzgâr çiçeği ² | 16 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Rüzgâr kristali ² | 40 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Rüzgâr kuşu eti ² | 8 | – | Av: Rüzgâr kuşu düşürür %80 (ACT 2 · Yüzen Kayalar) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş rüzgâr kuşu eti, Turba ateşinde tütsü |
| Rüzgâr meşesi kalası ² | 57 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Rüzgâr meşesi odunu ² | 18 | – | Balta ile Rüzgâr meşesi ağacından: Yüzen Kayalar (ACT 2) | Kütük salı, Oyma kano, Rüzgâr meşesi kalası |
| Rüzgâr tüyü ² | 12 | – | Av: Rüzgâr kuşu düşürür %100 (ACT 2 · Yüzen Kayalar) | – |
| Saksı | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Sal | 92 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yelkenli sal |
| Salyangoz sümüğü ² | 16 | – | Av: Spor salyangozu düşürür %90 (ACT 2 · Dev Mantar Ormanı) | – |
| Sandalye | 86 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Sandal küreği | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yelkenli sal |
| Sandık | 135 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Sapan | 293 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Sarımsaklı et | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sarı boya | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Sarı okr | 5 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Sarı okr tozu |
| Sarı okr tozu | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarı boya |
| Sarkıt | 6 | – | Yerden toplanır: Çayır, Bataklık, Mor Kristal Vadisi, Kül Diyarı, Kayalık Dağ, Orman (ACT 1) | Sarkıt parçası |
| Sarkıt parçası | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sarmaşık | 1 | – | Yerden toplanır: Orman (ACT 1) | Sarmaşık ipi |
| Sarmaşık ipi | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çit |
| Saz | 1 | – | Yerden toplanır: Bataklık (ACT 1) | Saz örgüsü |
| Sazan | 4 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %24; balık kapanına da girer · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %12; balık kapanına da girer · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %8; balık kapanına da girer | Balık çorbası, Balık pulu, Balık sepeti, Kurutulmuş sazan, Pişmiş sazan, Taşta sazan … (+1) |
| Saz örgüsü | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Saz sepet |
| Saz sepet | 33 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sepet | 51 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Balık kapanı |
| Sıcak su | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Adaçayı çayı, Avcı yahnisi, Balık çorbası, Balmumu, Bataklık otu çayı, Buhar … (+26) |
| Sincap derisi | 2 | – | Av: Sincap düşürür %60 (ACT 1 · Orman) | Tabaklanmış sincap derisi |
| Sincap eti | 2 | – | Av: Sincap düşürür %100 (ACT 1 · Orman) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş sincap eti, Pişmiş sincap eti, Turba ateşinde tütsü … (+1) |
| Sinek mantarı | 4 | yenir +4, zehirli | Yerden toplanır: Bataklık (ACT 1) | Zehirli ok |
| Sinir | 3 | – | Av: Tavşan düşürür %15 (ACT 1 · Çayır) · Av: Geyik düşürür %50 (ACT 1 · Çayır) · Av: Karaca düşürür %40 (ACT 1 · Orman) · Av: Yaban öküzü düşürür %60 (ACT 1 · Kayalık Dağ) · Av: Kurt düşürür %40 (ACT 1 · Çayır) · Av: Yaban atı düşürür %50 (ACT 1 · Çayır) · Av: Muflon düşürür %40 (ACT 1 · Kayalık Dağ) · Av: Mantar geyiği düşürür %50 (ACT 2 · Dev Mantar Ormanı) · Av: Buz karacası düşürür %40 (ACT 2 · Kristal Golem Ocağı) · Av: Yıldız geyiği düşürür %50 (ACT 2 · Gök Rıhtımı) | Kemik miğfer, Kemik zırh, Sinir kirişi, Tunç miğfer |
| Sinirotu | 2 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş sinirotu |
| Sinirotu çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sinir kirişi | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bataklık postu pelerin, Demir balta, Demir kazma, Demir kılıç, Demir mızrak, Demir zırh … (+12) |
| Sivri taş | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş bıçak, Taş kazma |
| Soğan | 10 | yenir +3 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Çiftçi yahnisi, Hasat sepeti, Havuç çorbası, Kabak çorbası, Soğan halkası |
| Soğan halkası | 218 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Soğan tohumu | 4 | – | Çiftçi Hasan alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Soğan) | – |
| Sopa | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Atölye, Duvar halısı, Et şişi, Hasır yatak, Kirmen, Korkuluk … (+15) |
| Söğüt dalı | 1 | – | Söğüt ağacı kesilince 2 tane düşer | Söğüt sepeti |
| Söğüt kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Söğüt kabuğu çayı |
| Söğüt kabuğu çayı | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Söğüt kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Söğüt kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Söğüt kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Söğüt odunu | 3 | – | Balta ile Söğüt ağacından: Bataklık (ACT 1) | Kütük salı, Oyma kano, Söğüt kabuğu, Söğüt kalası, Söğüt kömürü |
| Söğüt sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Söğüt sepeti | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Arı kovanı, Balık sepeti |
| Sönmemiş kireç | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kireç harcı |
| Spor ağacı kalası ² | 73 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Spor ağacı odunu ² | 24 | – | Balta ile Spor ağacı ağacından: Dev Mantar Ormanı (ACT 2) | Kütük salı, Oyma kano, Spor ağacı kalası |
| Spor ekmeği ² | 88 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Spor kristali ² | 40 | – | Kazmayla kazılır: Dev Mantar Ormanı (ACT 2) | Ateş asası |
| Spor tozu ² | 14 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) · Av: Mantar böceği düşürür %100 (ACT 2 · Dev Mantar Ormanı) | Mantar lifi eldiven, Spor ekmeği |
| Su | 1 | – | Kap ile (Yaprak kova vb.) suyun kıyısında E | Adaçayı çayı, Ahududu ezmesi, Ahududu suyu, Akçaağaç kabuğu, Akçaağaç şurubu, Alıç ezmesi … (+338) |
| Sulama kabı | 96 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Su kestanesi | 3 | yenir +4 | Yerden toplanır: Bataklık (ACT 1) | Kavrulmuş su kestanesi |
| Su samuru derisi | 5 | – | Av: Su samuru düşürür %75 (ACT 1 · Bataklık) | Tabaklanmış su samuru derisi, Bataklık çizmesi |
| Su samuru eti | 5 | – | Av: Su samuru düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş su samuru eti, Pişmiş su samuru eti, Turba ateşinde tütsü … (+1) |
| Su teresi | 2 | – | Yerden toplanır: Bataklık (ACT 1) | Kurutulmuş su teresi, Nilüfer çorbası, Ot salatası |
| Su testisi | 77 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Sümük yosunu ² | 14 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Sünger taşı | 26 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Sünger taşı bileği |
| Sünger taşı bileği | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Şaman tüyü ² | 70 | – | Av: Goblin şamanı düşürür %60 (ACT 2 · Dev Mantar Ormanı) | – |
| Şifalı merhem | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tabakhane | 607 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Tabaklanmış dağ keçisi derisi | 147 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Dağ keçisi postu giysi, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer … (+21) |
| Tabaklanmış geyik derisi | 149 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabaklanmış gölge postu | 327 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+21) |
| Tabaklanmış işık tilkisi postu | 210 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+21) |
| Tabaklanmış karaca derisi | 146 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabaklanmış kristal geyik derisi | 236 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+20) |
| Tabaklanmış kunduz derisi | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabaklanmış kurt derisi | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+21) |
| Tabaklanmış mağara ayısı derisi | 170 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabaklanmış muflon derisi | 147 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+21) |
| Tabaklanmış sincap derisi | 143 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+20) |
| Tabaklanmış su samuru derisi | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+21) |
| Tabaklanmış tavşan derisi | 145 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabaklanmış vaşak derisi | 164 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+20) |
| Tabaklanmış yaban atı derisi | 151 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+20) |
| Tabaklanmış yaban domuzu derisi | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabaklanmış yaban öküzü derisi | 157 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Demir çizme, Demir eldiven, Demir kılıç, Demir miğfer, Demir zırh … (+22) |
| Tabanca ² | 1.400 | alet | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Silahçı Tamer yapar (200 sikke işçilik) | – |
| Tabanca mermisi ² | 60 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Tabure | 76 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal yapar (ev içine konur) | – |
| Taş | 1 | – | Yerden toplanır: Çayır, Orman, Mor Kristal Vadisi, Kül Diyarı, Bataklık, Kayalık Dağ (ACT 1) | Ağ, Arı kovanı, Ateş yeri, Atölye, Bazalt balta, Bazalt bıçak … (+76) |
| Taşta alabalık | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta çapak | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kadife balığı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kerevit | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kızılkanat | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kurbağa | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta mersin balığı | 29 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta sazan | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta tatlısu kefali | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta tatlısu levreği | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta tatlısu midyesi | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta turna balığı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta yayın | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta yılan balığı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taş ağacı kalası ² | 88 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Taş ağacı odunu ² | 30 | – | Balta ile Taş ağacı ağacından: Kristal Golem Ocağı (ACT 2) | Kütük salı, Oyma kano, Taş ağacı kalası |
| Taş balta | 39 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Akçaağaç kalası (alet), Ardıç kalası (alet), Ateş narı kalası (alet), Ay elması kalası (alet), Bataklık servisi kalası (alet), Bulut çamı kalası (alet) … (+46) |
| Taş bıçak | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Akçaağaç kabuğu (alet), Akçaağaç kaşığı (alet), Akçaağaç sapı (alet), Ardıç kabuğu (alet), Ardıç kaşığı (alet), Ardıç sapı (alet) … (+61) |
| Taş çember | 2.941 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Taş ev | 1.600 | – | Marangoz Rıza yapar (2.500 sikke) | – |
| Taş fırın | 138 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Taş halka | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kirmen |
| Taş havan | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | Ahududu ezmesi (alet), Alıç ezmesi (alet), Ardıç meyvesi ezmesi (alet), Balık yağı (alet), Böğürtlen ezmesi (alet), Hardal ezmesi (alet) … (+14) |
| Taş kabuk ² | 40 | – | Av: Taş kaplumbağası düşürür %90 (ACT 2 · Kristal Golem Ocağı) | – |
| Taş kase | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş havan, Taş lamba |
| Taş kazma | 64 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Taş kılıç | 47 | alet, silah 12 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Taş kömürü | 4 | – | Kazmayla kazılır: Orman (ACT 1) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Taş lamba | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taş levha | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Erzak çukuru, Mağara resmi, Pişirme taşı |
| Taş totem | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tatlısu incisi | 19 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tatlısu kefali | 4 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %32; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş tatlısu kefali, Pişmiş tatlısu kefali, Taşta tatlısu kefali, Tütsülenmiş tatlısu kefali |
| Tatlısu levreği | 5 | – | Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %17; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş tatlısu levreği, Pişmiş tatlısu levreği, Taşta tatlısu levreği, Tütsülenmiş tatlısu levreği |
| Tatlısu midyesi | 2 | – | Yerden toplanır: Orman (ACT 1) · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %9; balık kapanına da girer · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %10; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş tatlısu midyesi, Midye kabuğu kaşık, Pişmiş tatlısu midyesi, Taşta tatlısu midyesi … (+2) |
| Tavşan derisi | 3 | – | Av: Tavşan düşürür %70 (ACT 1 · Çayır) | Tabaklanmış tavşan derisi |
| Tavşan eti | 3 | – | Av: Tavşan düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş tavşan eti, Pişmiş tavşan eti, Turba ateşinde tütsü … (+1) |
| Tavşan postu giysi | 255 | giyilir +5 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tavuk mantarı | 3 | yenir +4 | Yerden toplanır: Orman (ACT 1) | Kızarmış tavuk mantarı, Kurutulmuş tavuk mantarı |
| Tazı dişi ² | 40 | – | Av: Gök tazısı düşürür %60 (ACT 2 · Yüzen Kayalar) | – |
| Tırmık | 50 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tırpan | 153 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Timsah derisi | 45 | – | Av: Timsah düşürür %90 (ACT 1 · Bataklık) | Timsah derisi zırh, Timsah pulu zırh |
| Timsah derisi zırh | 158 | giyilir +20 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Timsah dişi | 35 | – | Av: Timsah düşürür %60 (ACT 1 · Bataklık) | Timsah dişi kolye, Timsah dişi kılıcı |
| Timsah dişi kılıcı | 1.011 | alet, silah 38 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah dişi kolye | 104 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Timsah eti | 10 | – | Av: Timsah düşürür %100 (ACT 1 · Bataklık) | Pişmiş timsah eti |
| Timsah pulu zırh | 1.177 | giyilir +46 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Titanyum cevheri ² | 52 | – | Kazmayla kazılır: Kristal Golem Ocağı (ACT 2) | Titanyum külçesi |
| Titanyum külçesi ² | 273 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Işın kılıcı, Meka çizme, Meka zırh, Roket gövdesi |
| Titanyum plaka ² | 120 | – | Av: Büyük golem düşürür %90 (ACT 2 · Kristal Golem Ocağı) | – |
| Tohum yağı | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tunç balta | 518 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç çizme | 884 | giyilir +7 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Tunç eldiven | 893 | giyilir +7 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Tunç kazma | 750 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç kılıç | 1.169 | alet, silah 22 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç külçesi | 158 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tunç balta, Tunç kazma, Tunç kılıç, Tunç levha, Tunç mızrak |
| Tunç levha | 463 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tunç çizme, Tunç eldiven, Tunç miğfer, Tunç zırh |
| Tunç mızrak | 521 | alet, silah 20 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç miğfer | 887 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Tunç zırh | 2.452 | giyilir +24 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Turba | 3 | – | Yerden toplanır: Bataklık (ACT 1) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+14) |
| Turba ateşinde tütsü | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Turna balığı | 6 | – | Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %15; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %25; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş turna balığı, Pişmiş turna balığı, Taşta turna balığı, Tütsülenmiş turna balığı |
| Turna kuşu eti | 5 | – | Av: Turna kuşu düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş turna kuşu eti, Pişmiş turna kuşu eti, Turba ateşinde tütsü … (+1) |
| Turna kuşu tüyü | 2 | – | Av: Turna kuşu düşürür %85 (ACT 1 · Bataklık) | Tüylü başlık, Tüylü ok |
| Turna kuşu yumurtası | 3 | – | Av: Turna kuşu düşürür %30 (ACT 1 · Bataklık) | Haşlanmış turna kuşu yumurtası |
| Tuz | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Acı biber ezmesi, Kaya patlatıcı, Kurutulmuş alabalık, Kurutulmuş bıldırcın eti, Kurutulmuş çapak, Kurutulmuş dağ keçisi eti … (+34) |
| Tuzak | 84 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tuz havuzu | 145 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Tuz kayası | 4 | – | Kazmayla kazılır: Bataklık (ACT 1) | Havyar, Tuz |
| Tütsühane | 234 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Tütsülenmiş alabalık | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş bıldırcın eti | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş çapak | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş dağ keçisi eti | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş geyik eti | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş işık tilkisi eti | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kadife balığı | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş karaca eti | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kartal eti | 71 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş keklik eti | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kerevit | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kızılkanat | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kristal geyik eti | 97 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kunduz eti | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kurbağa | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş kurt eti | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş mağara ayısı eti | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş mersin balığı | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş muflon eti | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş ördek eti | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş sazan | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş sincap eti | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş su samuru eti | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş tatlısu kefali | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş tatlısu levreği | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş tatlısu midyesi | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş tavşan eti | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş turna balığı | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş turna kuşu eti | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş ur kekliği eti | 66 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş vaşak eti | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş yaban atı eti | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş yaban domuzu eti | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş yaban kazı eti | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş yaban öküzü eti | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş yayın | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tütsülenmiş yılan balığı | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tüylü başlık | 244 | giyilir +3 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tüylü ok | 141 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tüy yosunu ² | 10 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Ur kekliği eti | 6 | – | Av: Ur kekliği düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş ur kekliği eti, Pişmiş ur kekliği eti, Turba ateşinde tütsü … (+1) |
| Ur kekliği tüyü | 4 | – | Av: Ur kekliği düşürür %85 (ACT 1 · Kayalık Dağ) | Tüylü başlık, Tüylü ok |
| Ur kekliği yumurtası | 5 | yenir +3 | Av: Ur kekliği düşürür %35 (ACT 1 · Kayalık Dağ) | Haşlanmış ur kekliği yumurtası |
| Uzaylı devresi ² | 200 | – | Av: Uzaylı dronu düşürür %70 (ACT 2 · Gök Rıhtımı) · Av: Gök bekçisi düşürür %100 (ACT 2 · Gök Rıhtımı) | Meka çizme, Roket |
| Uzun sopa | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt mızrak, Çakmaktaşı mızrak, Demir mızrak, Kemik zıpkın, Kuvars mızrak, Obsidyen mızrak … (+4) |
| Vaşak derisi | 24 | – | Av: Vaşak düşürür %85 (ACT 1 · Kayalık Dağ) | Tabaklanmış vaşak derisi |
| Vaşak eti | 12 | – | Av: Vaşak düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş vaşak eti, Pişmiş vaşak eti, Turba ateşinde tütsü … (+1) |
| Vida ² | 8 | – | Yerden toplanır: Hurda Çölü (ACT 2) · Av: Hurda faresi düşürür %90 (ACT 2 · Hurda Çölü) | Hurda çizme, Pompalı, Tabanca |
| Volkan demiri ² | 40 | – | Kazmayla kazılır: Ejder Volkanı (ACT 2) | – |
| Volkan külü ² | 10 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Yabani armut | 2 | yenir +7 | Meyve ağacı (Armut): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Armut ağacından toplanır: Çayır (ACT 1) | Kurutulmuş yabani armut, Yabani armut ezmesi, Yabani armut suyu |
| Yabani armut ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani armut suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani arpa | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kavrulmuş yabani arpa, Yabani arpa lapası, Yabani arpa unu |
| Yabani arpa hamuru | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani arpa yassı ekmeği |
| Yabani arpa lapası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani bira mayası |
| Yabani arpa unu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani arpa hamuru |
| Yabani arpa yassı ekmeği | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani bal | 8 | yenir +12 | Yerden toplanır: Orman (ACT 1) | Ateş çiçeği balı, Ay elması reçeli, Ballı ekmek, Ballı fındık, Ballı kestane, Balmumu … (+1) |
| Yabani bira mayası | 164 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani buğday | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kavrulmuş yabani buğday, Yabani buğday lapası, Yabani buğday unu |
| Yabani buğday hamuru | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani buğday yassı ekmeği |
| Yabani buğday lapası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani buğday unu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani buğday hamuru |
| Yabani buğday yassı ekmeği | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani elma | 2 | yenir +7 | Meyve ağacı (Elma): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Elma ağacından toplanır: Çayır (ACT 1) | Kurutulmuş yabani elma, Yabani elma ezmesi, Yabani elma suyu |
| Yabani elma ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani elma suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani erik | 2 | yenir +6 | Meyve ağacı (Erik): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Erik ağacından toplanır: Çayır (ACT 1) | Kurutulmuş yabani erik, Yabani erik ezmesi, Yabani erik suyu |
| Yabani erik ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani erik suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani havuç | 2 | yenir +5 | Yerden toplanır: Çayır (ACT 1) | Kızarmış yabani havuç, Kurutulmuş yabani havuç |
| Yabani mercimek | 2 | yenir +2 | Yerden toplanır: Orman (ACT 1) | Kavrulmuş yabani mercimek, Yabani mercimek lapası, Yabani mercimek unu |
| Yabani mercimek hamuru | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani mercimek yassı ekmeği |
| Yabani mercimek lapası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani mercimek unu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani mercimek hamuru |
| Yabani mercimek yassı ekmeği | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani nohut | 2 | yenir +2 | Yerden toplanır: Orman (ACT 1) | Kavrulmuş yabani nohut, Yabani nohut lapası, Yabani nohut unu |
| Yabani nohut hamuru | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani nohut yassı ekmeği |
| Yabani nohut lapası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani nohut unu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani nohut hamuru |
| Yabani nohut yassı ekmeği | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani yulaf | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kavrulmuş yabani yulaf, Yabani yulaf lapası, Yabani yulaf unu |
| Yabani yulaf hamuru | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani yulaf yassı ekmeği |
| Yabani yulaf lapası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani yulaf unu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani yulaf hamuru |
| Yabani yulaf yassı ekmeği | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yaban atı derisi | 10 | – | Av: Yaban atı düşürür %80 (ACT 1 · Çayır) | Tabaklanmış yaban atı derisi |
| Yaban atı eti | 9 | – | Av: Yaban atı düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban atı eti, Pişmiş yaban atı eti, Turba ateşinde tütsü … (+1) |
| Yaban çileği | 2 | yenir +6 | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş yaban çileği, Yaban çileği ezmesi, Yaban çileği suyu |
| Yaban çileği ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban çileği suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban domuzu derisi | 9 | – | Av: Yaban domuzu düşürür %70 (ACT 1 · Orman) · Av: Kor domuzu düşürür %70 (ACT 2 · Ejder Volkanı) | Tabaklanmış yaban domuzu derisi |
| Yaban domuzu dişi | 11 | – | Av: Yaban domuzu düşürür %45 (ACT 1 · Orman) · Av: Kor domuzu düşürür %45 (ACT 2 · Ejder Volkanı) | Domuz dişi muska, Granit gürz |
| Yaban domuzu eti | 7 | – | Av: Yaban domuzu düşürür %100 (ACT 1 · Orman) · Av: Kor domuzu düşürür %100 (ACT 2 · Ejder Volkanı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban domuzu eti, Pişmiş yaban domuzu eti, Turba ateşinde tütsü … (+1) |
| Yaban domuzu postu giysi | 262 | giyilir +8 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban kazı eti | 5 | – | Av: Yaban kazı düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban kazı eti, Pişmiş yaban kazı eti, Turba ateşinde tütsü … (+1) |
| Yaban kazı tüyü | 2 | – | Av: Yaban kazı düşürür %85 (ACT 1 · Bataklık) | Tüylü başlık, Tüylü ok |
| Yaban kazı yumurtası | 3 | – | Av: Yaban kazı düşürür %35 (ACT 1 · Bataklık) | Haşlanmış yaban kazı yumurtası |
| Yaban mersini | 3 | yenir +6 | Yerden toplanır: Orman (ACT 1) | Kurutulmuş yaban mersini, Yaban mersini boyası, Yaban mersini ezmesi, Yaban mersini suyu |
| Yaban mersini boyası | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Yaban mersini ezmesi | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban mersini suyu | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban öküzü derisi | 14 | – | Av: Yaban öküzü düşürür %100 (ACT 1 · Kayalık Dağ) | Tabaklanmış yaban öküzü derisi |
| Yaban öküzü eti | 10 | – | Av: Yaban öküzü düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban öküzü eti, Pişmiş yaban öküzü eti, Turba ateşinde tütsü … (+1) |
| Yaban öküzü postu giysi | 274 | giyilir +10 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban sarımsağı | 2 | – | Yerden toplanır: Orman (ACT 1) | Kurutulmuş yaban sarımsağı, Sarımsaklı et |
| Yağ birikintisi ² | 14 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Yakıt hücresi ² | 1.500 | – | Av: Gök bekçisi düşürür %100 (ACT 2 · Gök Rıhtımı) | Roket motoru |
| Yanık kök | 28 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Yanık kök çayı |
| Yanık kök çayı | 106 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yankı çanı | 239 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yankı taşı | 80 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Yankı çanı |
| Yaprak | 1 | – | Yerden toplanır: Orman, Çayır, Bataklık, Kül Diyarı, Mor Kristal Vadisi, Kayalık Dağ (ACT 1) | Adaçayı çayı, Ahududu suyu, Akçaağaç kabuğu, Akçaağaç şurubu, Alıç suyu, Ardıç kabuğu … (+237) |
| Yaprak barınağı | 1 | – | Marangoz Rıza yapar (5 sikke, malzeme: 8 Dal, 12 Yaprak, 4 Lif) | – |
| Yaprak kova | 8 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yarasa gübresi | 3 | – | Yerden toplanır: Mor Kristal Vadisi, Kayalık Dağ, Kül Diyarı, Çayır, Orman, Bataklık (ACT 1) | Gübre, Kaya patlatıcı |
| Yarasa kanadı | 40 | – | Av: Kor yarasası düşürür %80 (ACT 1 · Kül Diyarı) | Yarasa kanadı yelpazesi |
| Yarasa kanadı yelpazesi | 162 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yavru ejder pulu ² | 90 | – | Av: Yavru ejder düşürür %90 (ACT 2 · Ejder Volkanı) | Ejder pulu eldiven |
| Yayın | 7 | – | Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %20; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %34; balık kapanına da girer | Balık çorbası, Balık sepeti, Balık yağı, Kurutulmuş yayın, Pişmiş yayın, Taşta yayın … (+1) |
| Yelkenli sal | 640 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yılan balığı | 6 | – | Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %8; balık kapanına da girer · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %10; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş yılan balığı, Pişmiş yılan balığı, Taşta yılan balığı, Tütsülenmiş yılan balığı |
| Yıldırım asası ² | 3.200 | alet | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → Büyücü Pervin yapar (300 sikke işçilik) | – |
| Yıldız akasyası kalası ² | 125 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Yıldız akasyası odunu ² | 44 | – | Balta ile Yıldız akasyası ağacından: Gök Rıhtımı (ACT 2) | Kütük salı, Oyma kano, Yıldız akasyası kalası |
| Yıldız cevheri ² | 110 | – | Kazmayla kazılır: Gök Rıhtımı (ACT 2) | Yıldız külçesi |
| Yıldız çelengi | 388 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yıldız çiçeği | 65 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Yıldız çelengi |
| Yıldız eriği | 22 | yenir +8 | Meyve ağacı (Yıldız eriği): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Yıldız eriği ağacından toplanır: Mor Kristal Vadisi (ACT 1) | Kurutulmuş yıldız eriği |
| Yıldız eriği kalası | 73 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Yıldız eriği kömürü | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Yıldız eriği odunu | 24 | – | Balta ile Yıldız eriği ağacından: Mor Kristal Vadisi (ACT 1) | Kütük salı, Oyma kano, Yıldız eriği kalası, Yıldız eriği kömürü |
| Yıldız eriği sapı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt bıçak, Bazalt kazma, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Yıldız eriği tohumu | 18 | – | Yıldız eriği ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Yıldız külçesi ² | 1.135 | – | Tarif: Ülker'in kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Roket motoru |
| Yıldız mantarı ² | 30 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Yıldız mürekkebi | 227 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Boyalı tunik, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Yıldız tilkisi eti ² | 16 | – | Av: Yıldız tilkisi düşürür %100 (ACT 2 · Gök Rıhtımı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş yıldız tilkisi eti, Turba ateşinde tütsü |
| Yıldız tilkisi postu ² | 80 | – | Av: Yıldız tilkisi düşürür %80 (ACT 2 · Gök Rıhtımı) | – |
| Yıldız tozu | 85 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Yıldız mürekkebi |
| Yontulmuş bazalt | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt balta, Bazalt pulu, Bazalt sivri ucu |
| Yontulmuş çakmaktaşı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı balta, Çakmaktaşı pulu, Çakmaktaşı sivri ucu |
| Yontulmuş kuvars | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kuvars balta, Kuvars pulu, Kuvars sivri ucu |
| Yontulmuş obsidyen | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Obsidyen balta, Obsidyen pulu, Obsidyen sivri ucu |
| Yosun | 1 | – | Yerden toplanır: Bataklık (ACT 1) | Kamış çizme, Kükürtlü merhem, Yosun yalıtım, Yosun yastık |
| Yosun yalıtım | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Kemal / Marangoz Rıza yapar, yere kurulur | – |
| Yosun yastık | 240 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yüzer taş ² | 30 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | Ateş asası |
| Zehirli ok | 145 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehir bezesi | 16 | – | Av: Zehirli kurbağa düşürür %80 (ACT 1 · Bataklık) · Av: Engerek düşürür %60 (ACT 1 · Orman) | Panzehir |
| Ziyafet sofrası | 152 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |


# Yetenek ağacı

**v1.83'ten itibaren** yetenekler üç ağaçtadır: **Savaş** (kırmızı), **Ekonomi** (altın sarısı) ve **Dayanıklılık** (yeşil). Her ağaçta **30 yetenek**, toplam **90 yetenek**.

## Görünüş

- Yetenek ekranının (Y) üstünde **üç eşit sekme** vardır; pencerenin genişliğini tam üçe böler. Bir sekmeye basınca o ağaç gösterilir ve ağacın **rengi, arka planı ve kenarlığı kategoriye göre değişir** (Savaş koyu kırmızı, Ekonomi koyu altın/kahve, Dayanıklılık koyu yeşil).
- **Ağacın şeklini yeteneklerin kendisi çizer.** Toprak, kök ya da gövde resmi yoktur. Yetenekler (yuvarlaklar) ince dallarla birbirine bağlanır. Hepsi açıldığında bir ağaç silüeti ortaya çıkar: altta üst üste üç yetenekten oluşan **gövde**, üstünde üç ana dala ayrılıp sola, ortaya ve sağa yayılan, yukarıda yuvarlak bir **taç**. Ağaç alttan yukarı açılır.
- **Pencerenin boyutu sabittir;** yeni yetenek görünse de ekran büyümez, kaymaz. Her yeteneğin ağaçtaki yeri baştan bellidir. Üç ağacın alanı aynı büyüklüktedir.
- **Her yeteneğin sade bir ikonu vardır:** yuvarlağın içinde, yeteneğin ne işe yaradığını anlatan basit bir çizgi resim (kalp, kalkan, kılıç, sikke…). İkonlar **iki renklidir:** koyu zemin üstünde ağacın renginde çizgi; alınan yetenekte tersi (ağaç renginde zemin, koyu çizgi). **Aynı yeteneğin seviyeleri aynı ikonu kullanır** (Zırh I–IV hep aynı zırh resmi); seviye, ikonun altındaki küçük noktalarla (I = 1 nokta, II = 2 …) gösterilir. Ağaçta yazı yoktur.
- **Dış çeper rengi durumu söyler:** satın alınabilir yetenek **parlak sarı** çeperlidir (hafif parlar); satın alınamayan (sikke ya da seviye yetmiyor) **gri** çeperlidir ve soluktur; alınmış yetenek ağaç renginde dolu ve açık renk çeperlidir.
- **Fare üzerine gelince** küçük bir kutuda yeteneğin **adı, ne işe yaradığı** ve fiyatı/durumu yazar.
- **Satın alma ikona tıklayarak yapılır** (altta düğme yok). Satın alınabiliyorsa tıklayınca hemen alınır ve ne değiştiğini anlatan pencere çıkar; alınamıyorsa nedeni bildirim olarak yazar (ör. "Seviye 6 gerekli", "250 sikke daha gerekli"). **Telefonda** (fare yok) ilk dokunuş bilgi kutusunu açar, aynı ikona ikinci dokunuş satın alır.

## Kurallar

- **Başta her ağacın yalnızca kök yeteneği görünür** (Koşu, Usta tüccar I, Güçlü beden).
- **Bir yetenek alınınca yalnızca ona bağlı, hemen üstündeki yetenekler** görünür olur (tablodaki "Alınınca açılanlar"). Başka hiçbir yetenek açılmaz; alınmayan bir yeteneğin üstündekiler **görünmez** (dalı da çizilmez).
- Bu kural **sınırsız sikke (tanrı modu) açıkken de** aynıdır.
- Fiyat ve seviye şartı yeteneğin **katına** (kökten kaçıncı basamak olduğuna) göredir; yukarı çıktıkça pahalı ve güçlü:

| Kat | Fiyat | Seviye şartı |
|---|---|---|
| 1 (kök) | 100 | – |
| 2 | 250 | Sv 2 |
| 3 | 400 | Sv 3 |
| 4 | 600 | Sv 4 |
| 5 | 1.000 | Sv 6 |
| 6 | 1.800 | Sv 8 |
| 7 | 3.000 | Sv 11 |
| 8 | 5.000 | Sv 14 |

- **Koşu** Savaş ağacının köküdür: yalnızca **100 sikke**; seviye, köprü ya da Atılma şartı yok.
- **Atılma ağaçta değildir:** öğreticide Savaşçı Börü ücretsiz öğretir (öğreticiyi geçen, Börü'yle konuşunca aynı dersi ücretsiz alır). Ayrıntı: "Oyunun akışı → Börü'nün atılma dersi".
- **Bilgelik dalı kaldırıldı.** Sezgi, Akıl yürütme ve İpucu ustası I-II Normal modda gereksizdi (tarifler Normal modda zaten açık). *Not: Zor mod tasarlanırken tarif ipucu yetenekleri yeniden düşünülecek.* Pazarlıkçı I-IV'ün yerine Usta tüccar I-II geldi; Sağlam yapı'nın eski +20'lik ilk basamağı ve Kemer V çıkarıldı (Kemer IV artık 12 yuva).
- **v1.83'te yeni:** Derin nefes III, Çabuk toparlanma II, Hafif adım II, Çevik atılma II-III, Uzun atılma, Güçlü kol IV, Savuşturma ustası I-II, Sıyrılma ustası, Usta tüccar II, Bereket II, Verimli toprak II, Sağlam yapı IV, Hızlı iyileşme IV, Doyurucu sofra, Kamp ateşi ustası, Tok karın, Kalın deri II-III, Dirençli beden, Demir mide II. Geri gelenler: Toptancı, Kazan bilgesi, Keskin göz, Bilmece ustası, Hızlı öğrenen I ve III.
- **Eski kayıtlar:** kaldırılan bir yeteneğe sahip kayıt açılınca o yeteneğin eski parası sikke olarak iade edilir ve bir bildirim çıkar. Elde kalan yetenekler alınmış kalır; alınmış bir yeteneğin altındaki (ona giden yoldaki) yetenekler de görünür olur.

## Savaş (kırmızı)

| Kat | Kimlik | Yetenek | İkon | Etki | Bağlı olduğu | Alınınca açılanlar | Fiyat | Seviye |
|---|---|---|---|---|---|---|---|---|
| 1 | K1 | Koşu | çizme | Shift ile (telefonda çift dokunarak) koş; enerji harcar | kök (baştan görünür) | Derin nefes I | 100 | – |
| 2 | K2 | Derin nefes I | nefes (ciğer) | En yüksek enerji +%25 | Koşu | Çabuk toparlanma I | 250 | Sv 2 |
| 3 | K3 | Çabuk toparlanma I | şimşek | Enerji %50 daha hızlı dolar | Derin nefes I | Hızlı adımlar I, Güçlü kol I, Kemer I | 400 | Sv 3 |
| 4 | H1 | Hızlı adımlar I | ileri okları | Hareket hızı +%10 | Çabuk toparlanma I | Hızlı adımlar II | 600 | Sv 4 |
| 4 | W1 | Güçlü kol I | kılıç | Bütün saldırıların hasarı +%10 | Çabuk toparlanma I | Savuşturma ustası I, Güçlü kol II | 600 | Sv 4 |
| 4 | A1 | Kemer I | kemer | Alet yuvası 5 → 6 | Çabuk toparlanma I | Kemer II | 600 | Sv 4 |
| 5 | H2 | Hızlı adımlar II | ileri okları | Hareket hızı toplam +%20 | Hızlı adımlar I | Hızlı adımlar III, Hafif adım I | 1.000 | Sv 6 |
| 5 | V1 | Savuşturma ustası I | kalkan | Savuşturma penceresi %30 daha uzun | Güçlü kol I | Derin nefes II, Savuşturma ustası II | 1.000 | Sv 6 |
| 5 | W2 | Güçlü kol II | kılıç | Hasar toplam +%25 | Güçlü kol I | Güçlü kol III | 1.000 | Sv 6 |
| 5 | A2 | Kemer II | kemer | Alet yuvası 8 | Kemer I | Kemer III, Çevik atılma I | 1.000 | Sv 6 |
| 6 | H3 | Hızlı adımlar III | ileri okları | Hareket hızı toplam +%30 | Hızlı adımlar II | Hızlı adımlar IV, Kâşif gözü | 1.800 | Sv 8 |
| 6 | K6 | Hafif adım I | tüy | Koşarken %30 daha az enerji harcarsın | Hızlı adımlar II | Hafif adım II | 1.800 | Sv 8 |
| 6 | K5 | Derin nefes II | nefes (ciğer) | En yüksek enerji toplam +%50 | Savuşturma ustası I | Derin nefes III | 1.800 | Sv 8 |
| 6 | W3 | Güçlü kol III | kılıç | Hasar toplam +%40 | Güçlü kol II | Güçlü kol IV | 1.800 | Sv 8 |
| 6 | V2 | Savuşturma ustası II | kalkan | Savuşturma penceresi toplam %60 daha uzun | Savuşturma ustası I | Sıyrılma ustası | 1.800 | Sv 8 |
| 6 | A3 | Kemer III | kemer | Alet yuvası 10 | Kemer II | Kemer IV, Çabuk toparlanma II | 1.800 | Sv 8 |
| 6 | S2 | Çevik atılma I | hız çizgili ok | Atılma 9 enerji (14 yerine), bekleme 0,45 sn | Kemer II | Çevik atılma II | 1.800 | Sv 8 |
| 7 | H7 | Hızlı adımlar IV | ileri okları | Hareket hızı toplam +%40 | Hızlı adımlar III | – | 3.000 | Sv 11 |
| 7 | H6 | Kâşif gözü | pusula | Haritada açılan alan neredeyse iki kat genişler | Hızlı adımlar III | – | 3.000 | Sv 11 |
| 7 | K9 | Hafif adım II | tüy | Koşarken toplam %50 daha az enerji harcarsın | Hafif adım I | Rüzgâr gibi, Baykuş gözü | 3.000 | Sv 11 |
| 7 | K7 | Derin nefes III | nefes (ciğer) | En yüksek enerji toplam +%75 | Derin nefes II | – | 3.000 | Sv 11 |
| 7 | W4 | Güçlü kol IV | kılıç | Hasar toplam +%55 | Güçlü kol III | – | 3.000 | Sv 11 |
| 7 | V3 | Sıyrılma ustası | kıvılcım | Bir saldırının içinden taklayla geçince +6 yerine +14 enerji | Savuşturma ustası II | – | 3.000 | Sv 11 |
| 7 | A4 | Kemer IV | kemer | Alet yuvası 12 | Kemer III | – | 3.000 | Sv 11 |
| 7 | K8 | Çabuk toparlanma II | şimşek | Enerji iki kat hızlı dolar | Kemer III | – | 3.000 | Sv 11 |
| 7 | S3 | Çevik atılma II | hız çizgili ok | Atılma 7 enerji, bekleme 0,38 sn | Çevik atılma I | Çevik atılma III, Uzun atılma | 3.000 | Sv 11 |
| 8 | K4 | Rüzgâr gibi | rüzgâr | Koşu hızı 1,6 kattan 1,85 kata çıkar | Hafif adım II | – | 5.000 | Sv 14 |
| 8 | H8 | Baykuş gözü | hilal | Karanlıkta yakın çevreni hep biraz görürsün | Hafif adım II | – | 5.000 | Sv 14 |
| 8 | S4 | Çevik atılma III | hız çizgili ok | Atılma 5 enerji, bekleme 0,30 sn | Çevik atılma II | – | 5.000 | Sv 14 |
| 8 | S5 | Uzun atılma | uzun ok | Takla %25 daha uzağa götürür | Çevik atılma II | – | 5.000 | Sv 14 |

## Ekonomi (altın sarısı)

| Kat | Kimlik | Yetenek | İkon | Etki | Bağlı olduğu | Alınınca açılanlar | Fiyat | Seviye |
|---|---|---|---|---|---|---|---|---|
| 1 | E1 | Usta tüccar I | sikke | Pazarda satış fiyatları +%50 | kök (baştan görünür) | Çevik eller I | 100 | – |
| 2 | G1 | Çevik eller I | el | Toplama süresi −%15 | Usta tüccar I | Tutumlu usta I | 250 | Sv 2 |
| 3 | Z1 | Tutumlu usta I | kutu | Yaparken %10 ihtimalle bir malzeme elde kalır | Çevik eller I | Çevik eller II, Şanslı müşteri I, Tutumlu usta II | 400 | Sv 3 |
| 4 | G2 | Çevik eller II | el | Toplama süresi toplam −%30 | Tutumlu usta I | Çevik eller III | 600 | Sv 4 |
| 4 | T3 | Şanslı müşteri I | zar | Her satışta %5 ihtimalle çift ödeme | Tutumlu usta I | Hızlı öğrenen I, Şanslı müşteri II | 600 | Sv 4 |
| 4 | Z2 | Tutumlu usta II | kutu | Malzeme kalma ihtimali toplam %20 | Tutumlu usta I | Tutumlu usta III | 600 | Sv 4 |
| 5 | G3 | Çevik eller III | el | Toplama süresi toplam −%45 | Çevik eller II | Bereket I, Verimli toprak I | 1.000 | Sv 6 |
| 5 | B4 | Hızlı öğrenen I | kitap | Kazandığın bütün XP +%10 | Şanslı müşteri I | Hızlı öğrenen II, İlk keşif ödülü | 1.000 | Sv 6 |
| 5 | T8 | Şanslı müşteri II | zar | Çift ödeme ihtimali toplam %12 | Şanslı müşteri I | Toptancı | 1.000 | Sv 6 |
| 5 | Z5 | Tutumlu usta III | kutu | Malzeme kalma ihtimali toplam %30 | Tutumlu usta II | Değerli işçilik I, Usta işi I | 1.000 | Sv 6 |
| 6 | G4 | Bereket I | başak | %10 ihtimalle iki malzeme | Çevik eller III | Bereket II, Oduncu | 1.800 | Sv 8 |
| 6 | G8 | Verimli toprak I | filiz | Malzemeler %40 daha çabuk yeniden çıkar | Çevik eller III | Verimli toprak II | 1.800 | Sv 8 |
| 6 | B5 | Hızlı öğrenen II | kitap | Bütün XP toplam +%20 | Hızlı öğrenen I | Hızlı öğrenen III | 1.800 | Sv 8 |
| 6 | T4 | Toptancı | sandık | "Hepsini sat" ile ek +%5 | Şanslı müşteri II | Usta tüccar II | 1.800 | Sv 8 |
| 6 | T6 | İlk keşif ödülü | yıldız | Yeni malzeme ilk bulunduğunda fiyatının 5 katı sikke | Hızlı öğrenen I | Bilmece ustası | 1.800 | Sv 8 |
| 6 | Z4 | Değerli işçilik I | mücevher | Birleştirilerek yapılan eşyalar +%15 değerli | Tutumlu usta III | Değerli işçilik II, Kazan bilgesi | 1.800 | Sv 8 |
| 6 | Z3 | Usta işi I | çekiç | Elle yaparken %5 ihtimalle iki ürün | Tutumlu usta III | Usta işi II | 1.800 | Sv 8 |
| 7 | G9 | Bereket II | başak | İki malzeme ihtimali toplam %20 | Bereket I | – | 3.000 | Sv 11 |
| 7 | G5 | Oduncu | balta | Odun %50 daha hızlı | Bereket I | – | 3.000 | Sv 11 |
| 7 | G10 | Verimli toprak II | filiz | Malzemeler toplam %60 daha çabuk yeniden çıkar | Verimli toprak I | Taşçı, Su taşıyıcı | 3.000 | Sv 11 |
| 7 | B6 | Hızlı öğrenen III | kitap | Bütün XP toplam +%35 | Hızlı öğrenen II | – | 3.000 | Sv 11 |
| 7 | E2 | Usta tüccar II | sikke | Satış fiyatları toplam +%60 (en çok 2,3 kat sınırı sürer) | Toptancı | – | 3.000 | Sv 11 |
| 7 | B8 | Bilmece ustası | soru işareti | Zümrüt'ün bilmece ödülleri iki katı | İlk keşif ödülü | – | 3.000 | Sv 11 |
| 7 | Z6 | Değerli işçilik II | mücevher | Yapılan eşyalar toplam +%30 değerli | Değerli işçilik I | – | 3.000 | Sv 11 |
| 7 | Z8 | Kazan bilgesi | kazan | Kazanda tarif öğrenince +10 XP daha | Değerli işçilik I | – | 3.000 | Sv 11 |
| 7 | Z7 | Usta işi II | çekiç | İki ürün ihtimali toplam %12 | Usta işi I | Keskin göz, Uzun kol | 3.000 | Sv 11 |
| 8 | G6 | Taşçı | kazma | Taş, çakmaktaşı, çakıl, kum, kil %50 daha hızlı | Verimli toprak II | – | 5.000 | Sv 14 |
| 8 | G7 | Su taşıyıcı | su damlası | Su %50 daha hızlı | Verimli toprak II | – | 5.000 | Sv 14 |
| 8 | H5 | Keskin göz | göz | Çakmaktaşı ve böğürtlen haritada parlar | Usta işi II | – | 5.000 | Sv 14 |
| 8 | H4 | Uzun kol | uzanan ok | E ile %50 daha uzaktan toplama | Usta işi II | – | 5.000 | Sv 14 |

## Dayanıklılık (yeşil)

| Kat | Kimlik | Yetenek | İkon | Etki | Bağlı olduğu | Alınınca açılanlar | Fiyat | Seviye |
|---|---|---|---|---|---|---|---|---|
| 1 | D1 | Güçlü beden | yumruk | En yüksek can +50 | kök (baştan görünür) | Sağlam yapı I | 100 | – |
| 2 | C3 | Sağlam yapı I | kalp | En yüksek can toplam +100 | Güçlü beden | Hızlı iyileşme I | 250 | Sv 2 |
| 3 | C2 | Hızlı iyileşme I | artılı kalp | Can iki kat hızlı yenilenir | Sağlam yapı I | Zırh I, Sağlam yapı II, Kalın deri I | 400 | Sv 3 |
| 4 | D2 | Zırh I | zırh | Zırh +5 | Hızlı iyileşme I | Zırh II | 600 | Sv 4 |
| 4 | C5 | Sağlam yapı II | kalp | En yüksek can toplam +175 | Hızlı iyileşme I | Hızlı iyileşme II, Sağlam yapı III | 600 | Sv 4 |
| 4 | C4 | Kalın deri I | katmanlar (deri) | Zırhın tutmadığı anlık hasarlar (çiğ et, zehirli yemek, diken, göl) %40 daha az | Hızlı iyileşme I | Zehre dayanıklı | 600 | Sv 4 |
| 5 | D5 | Zırh II | zırh | Zırh toplam +12 | Zırh I | Zırh III, Sağlam aletler I | 1.000 | Sv 6 |
| 5 | C6 | Hızlı iyileşme II | artılı kalp | Can üç kat hızlı yenilenir | Sağlam yapı II | Hızlı iyileşme III, Doyurucu sofra | 1.000 | Sv 6 |
| 5 | C8 | Sağlam yapı III | kalp | En yüksek can toplam +250 | Sağlam yapı II | Sağlam yapı IV | 1.000 | Sv 6 |
| 5 | D3 | Zehre dayanıklı | zehir şişesi | Zehir hasarı −%40 | Kalın deri I | Ateşe dayanıklı, Kalın deri II | 1.000 | Sv 6 |
| 6 | D7 | Zırh III | zırh | Zırh toplam +20 | Zırh II | Zırh IV, Son nefes | 1.800 | Sv 8 |
| 6 | A5 | Sağlam aletler I | İngiliz anahtarı | Aletler %20 daha geç körelir | Zırh II | Sağlam aletler II | 1.800 | Sv 8 |
| 6 | C9 | Hızlı iyileşme III | artılı kalp | Can dört kat hızlı yenilenir | Hızlı iyileşme II | Hızlı iyileşme IV | 1.800 | Sv 8 |
| 6 | C10 | Sağlam yapı IV | kalp | En yüksek can toplam +350 | Sağlam yapı III | Kamp ateşi ustası | 1.800 | Sv 8 |
| 6 | D12 | Doyurucu sofra | yemek kâsesi | Yemeklerin can doldurması %50 daha fazla | Hızlı iyileşme II | Tok karın | 1.800 | Sv 8 |
| 6 | D4 | Ateşe dayanıklı | alev | Yanık hasarı −%40 | Zehre dayanıklı | Kanamaya dayanıklı, Dirençli beden | 1.800 | Sv 8 |
| 6 | C12 | Kalın deri II | katmanlar (deri) | Bu hasarlar toplam %55 daha az | Zehre dayanıklı | Demir mide I | 1.800 | Sv 8 |
| 7 | D10 | Zırh IV | zırh | Zırh toplam +30 | Zırh III | – | 3.000 | Sv 11 |
| 7 | D8 | Son nefes | kum saati | Canın dörtte birinin altındayken aldığın fiziksel hasar −%25 | Zırh III | – | 3.000 | Sv 11 |
| 7 | A6 | Sağlam aletler II | İngiliz anahtarı | Aletler toplam %40 daha geç körelir | Sağlam aletler I | Sağlam aletler III, Çelik beden | 3.000 | Sv 11 |
| 7 | C11 | Hızlı iyileşme IV | artılı kalp | Can beş kat hızlı yenilenir | Hızlı iyileşme III | – | 3.000 | Sv 11 |
| 7 | D11 | Kamp ateşi ustası | kamp ateşi | Kamp ateşinin yanında can iki kat hızlı dolar | Sağlam yapı IV | – | 3.000 | Sv 11 |
| 7 | D13 | Tok karın | elma | Tokluk %25 daha yavaş azalır | Doyurucu sofra | – | 3.000 | Sv 11 |
| 7 | D6 | Kanamaya dayanıklı | kan damlası | Kanama hasarı −%40 | Ateşe dayanıklı | – | 3.000 | Sv 11 |
| 7 | D14 | Dirençli beden | artılı kalkan | Zehir, yanık ve kanama hasarı −%60 (üçü birden) | Ateşe dayanıklı | – | 3.000 | Sv 11 |
| 7 | C7 | Demir mide I | et | Zehirli yiyecek ve çiğ et %60 daha az dokunur | Kalın deri II | Demir mide II, Kalın deri III | 3.000 | Sv 11 |
| 8 | A7 | Sağlam aletler III | İngiliz anahtarı | Aletler toplam %60 daha geç körelir | Sağlam aletler II | – | 5.000 | Sv 14 |
| 8 | D9 | Çelik beden | saat | Zehir, yanık ve kanama yarı sürede geçer | Sağlam aletler II | – | 5.000 | Sv 14 |
| 8 | C14 | Demir mide II | et | Zehirli yiyecek ve çiğ et %90 daha az dokunur | Demir mide I | – | 5.000 | Sv 14 |
| 8 | C13 | Kalın deri III | katmanlar (deri) | Bu hasarlar toplam %70 daha az | Demir mide I | – | 5.000 | Sv 14 |

Satış fiyatı bütün yeteneklerle birlikte en çok temel fiyatın 2,3 katına çıkar (değişmedi).
Direnç yetenekleri eşya dirençleriyle; Dirençli beden ayrı yeteneklerin yerine geçer (−%60, üçü birden), ve yemek kalkanlarıyla çarpılarak birleşir (ör. Bataklık postu pelerin %30 + Zehre dayanıklı %40 → zehir 0,7 × 0,6 = 0,42).


# Başarımlar

41 başarım vardır. Başarımlar **cihaza** kaydedilir (bütün kayıt yuvaları için ortak). 🔒 işaretliler kazanılana kadar gizlidir. Başarımı kazanınca simgesindeki eşya da görünür. Arena (ana menü) iyi son ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır.

| Başarım | Nasıl kazanılır | Not |
|---|---|---|
| İlk tarif | Kazanda ilk tarifini öğren. | – |
| İlk gün | İlk günü ve geceyi hayatta atlat. | – |
| Meraklı çırak | 25 tarif bul. | – |
| İlk av | Bir hayvan avla. | – |
| Köprücü 🔒 | Kırık köprüyü onar. | – |
| Bir hafta | 7. güne ulaş. | – |
| Sadık dost | Bir robot köpeğin olsun. | Yıldızsız Gezgin 5. gün hediye eder; 20. günden sonra mor sinyalle en çok 5 köpek. |
| Balıkçı | 10 balık tut. | Yalnız balıklar sayılır (oltaya takılan dal/yosun/kemik sayılmaz). |
| Tecrübeli | Seviye 10 ol. | – |
| Yardımsever | 10 yan görev bitir. | – |
| Kesesi dolu | Aynı anda 1000 sikken olsun. | ∞ sikke hilesi açıkken sayılmaz. |
| Kazan ustası | 100 tarif bul. | – |
| Kurt avcısı | 10 kurt avla. | – |
| Kâşif | Adanın yarısını keşfet. | Haritanın açılan kısmı; "Haritayı aç" hilesi de sayılır. |
| İz sürücü 🔒 | Eşinden kalan bütün izleri bul. | 6 iz: ikisi yurtta (Çayır/Orman), ikisi köprünün karşısında (biri Bataklık'ta, biri Kayalık Dağ'da), ikisi doğuda. Gece mor parıltı. |
| Hatırladım 🔒 | Bütün anılarını geri getir. | 17 anı: 5 tarif anısı, 7 olay anısı (uyku/bayılma/görev, gün şartlı), 5 ACT 2 anısı (ustaların son görevleri). |
| Adada bir ay | 30. güne ulaş. | – |
| Ejder avcısı 🔒 | Kül Diyarı'nın kara ejderini yen. | Kara ejder Kül Diyarı'nda. |
| Ada efsanesi | Seviye 25 ol. | – |
| Yaşayan ansiklopedi | 250 tarif bul. | – |
| Kazazede 🔒 | Denizci Levent'in yeni gemisini kur. | Levent'in son görevi "Yeni bir gemi" (dz4) bitince. |
| Gökyüzüne 🔒 | Tuna ile roketi fırlat. | Tuna ile roket fırlatılınca. |
| Açık deniz 🔒 | Levent'in gemisiyle adadan ayrıl: ACT 2. | Levent'in gemisiyle ikinci adaya geçince. |
| İlk düşüş | Bir kez bayıl. | Her bayılma sayılır: canavar, açlık, zehir, mor ışık (v2.10). |
| İnatçı | 5 kez bayıl, yine de devam et. | Her bayılma sayılır (v2.10). |
| İlk reis | Bir reis öldür. | – |
| Reis avcısı | 5 farklı reis öldür. | – |
| Reislerin korkusu | 10 farklı reis öldür. | – |
| Reis yiyen | 20 farklı reis öldür. | – |
| Bütün reisler | Oyunda öldürülebilecek bütün reisleri öldür. | Her türün Reisi o türden yeterince avlayınca çıkar. |
| Yol açıcı 🔒 | Doğu geçidindeki kayaları patlat. | Doğu geçidindeki kaya yığını Kül Diyarı yolunu kapatır. |
| Her şeyi bilen | Bütün tarifleri bul. | 825 tarifin hepsi; ACT 2 tarifleri dahil. |
| Toplayıcı | İki adada yerden toplanabilen her çeşitten en az birini topla. | İki adadaki bütün toplanabilir çeşitleri. |
| Yeniden birlikte 🔒 | Oyunu iyi sonla bitir. | Roket fırlatılıp kavuşma sahnesi bitince verilir (koşulu kendi kendine değil, sahnenin sonunda elle verilir). |
| Yalnız dönüş 🔒 | Oyunu kötü sonla bitir. | **Şu an kazanılamaz:** oyunda kötü son yok; koşul hiçbir yerde gerçekleşmiyor. |
| Maden kâşifi | İki adadaki her madenden en az birini kaz. | – |
| Oduncu | İki adadaki her ağaç türünden en az birini kes. | – |
| Avcıların avcısı | İki adadaki her canlı türünden en az birini öldür. | – |
| Ganimet avcısı | Canlılardan düşebilecek her eşyayı en az bir kez elde et. | – |
| Oyunlardaki gibi 🔒 | Ana menüde “cheat” yazdın: hile modu açıldı. | Ana menüde klavyeyle "cheat" yaz. Telefonda Ayarlar başlığına art arda 3 kez dokun (başarımın metni yanlışlıkla "ekrana 3 kez dokundun" diyor). |
| Platin | Bütün başarımları kazan. | **Şu an kazanılamaz:** "Yalnız dönüş" kazanılamadığı için. |


# Bilinen açıklar ve tutarsızlıklar

Belge hazırlanırken kodda görülenler. Oyun testinde doğrulananlar ve düzeltilenler ayrı test raporunda.

| # | Konu | Ne oluyor | Öneri |
|---|---|---|---|
| 1 | Kerevit kapanı | Börü'nün "Kapan ustası" görevi "Nerede: Çayır" diyordu; kapana kerevit yalnızca Bataklık/Kayalık Dağ sularında girer. | **Düzeltildi v1.79:** Nerede satırı Bataklık. |
| 2 | Kötü son | "Yalnız dönüş" başarımı ve dolayısıyla "Platin" kazanılamaz; kötü son yok. | Kötü son yazılana kadar başarımı gizle ya da Platin'den çıkar. |
| 3 | ACT 2'den dönüş | Birinci adaya dönmenin tek yolu portaldı; portal Ülker'in 3. görevi bitince açılıyordu ve o görev yalnızca birinci adada bulunan malzemeler istiyor. | **Düzeltildi v1.76:** Levent ve Ekin portalları ikinci adaya varınca hep açık. |
| 4 | Meyve ağacı odunu | Elma, Armut, Erik (ve Mürver) odunlarının fiyatı yoktu; satınca sikke NaN oluyordu. | **Düzeltildi v2.17:** 3 sikke, "Herhangi odun" grubunda; fiyatsız eşya artık satılmaz; bozuk sikke onarılır. |
| 5 | Tüccar Nuri'nin tarifleri | Tarif satış kodu var ama menüden açılmıyor; Zümrüt "tüccardan tarif alabilirsin" diyor. | Menüye ekle ya da Zümrüt'ün sözünü değiştir. |
| 6 | Hasan'ın tohumları | Tohum dükkânı açılmıyor; Hasan bir yerde "satarım" bir yerde "satmam" diyor. | Karar ver, metni düzelt. |
| 7 | Ev fiyatları | Rıza alt fiyat kuralıyla satıyor: Taş ev 4.049 (arsanın ipucu metni 2.500 diyor), Deri çadır (Sv 3) 1.039 ile Kulübe'den (Sv 4, 510) pahalı. | Ev fiyatlarını alt fiyat kuralından muaf tut. |
| 8 | Gemi malzemesi | Gemi malzemeleri iki kez harcanıyor (kazanda öğrenirken ve Levent'in son görevinde). | Ya tarifi öğrenmeyi kaldır ya da görevi "gemiyi getir" yap. |
| 9 | Küçük tutarsızlıklar | Öğreticinin 13. adımında örste her şey bedava; Hasan yalnızca adı "Taş kazma" olan kazmayı kabul ediyor; Ekin'in 3. görevi "100 sikke" diyor ama yalnızca yetenek alınmış mı bakıyor; Nuri'nin ilk siparişi XP'yi iki kez veriyor. | — |
| 10 | Ölü kod | Kaptan Poyraz, Balıkçı Rüstem, Sisli Ada ve sal sonu kodda duruyor ama çalışmıyor. Son Ekin görevinde iskelenin üstüne hâlâ sal oku çiziliyor; Rüstem'in kıyısında kimsesiz bir ateş yanıyor. | Temizlik. |
| 11 | ACT 2'de ACT 1 gezginleri | Işıkçı ve Nuri'nin gemisi ikinci adada birinci adanın koordinatlarında çıkıyordu. | **Düzeltildi v1.77.** |
| 11b | ACT 2 kişileri | Haritada yoktular; Pervin ve Tuna ile yanlarındaki bitki yüzünden E ile konuşulamıyordu. | **Düzeltildi v1.77.** |
| 12 | Bayılma sayacı | "İlk düşüş" ve "İnatçı" yalnızca gece mor ışıkla bayılmayı sayıyordu. | **Düzeltildi v2.10:** her bayılma sayılır; oyunda ölüm yok, yazılar "bayıl" der. |
| 13 | Çevik atılma | Yeteneğin "kısa bekleme" kısmı çalışmıyor (takla beklemesi hep 0,68 sn); enerji indirimi çalışıyor. | Beklemeyi yeteneğe göre ayarla. |
| 14 | Kalın deri | Açıklaması "zehir, yanık ve çiğ et %40 az" diyor; zehir ve yanığı azaltmıyor, yalnızca çiğ et ve diken hasarını azaltıyor. | Etkiye bağla ya da metni düzelt. |
| 15 | Balık ve tuzak bölgeleri | Tablolar 6 biyoma değil 3 kuşağa göre: Kayalık Dağ'da bataklık balıkları, Mor Kristal Vadisi'nde Kül Diyarı balıkları çıkıyor; ACT 2'ye özel balık yok. | Biyom başına tablo. |
| 16 | Şanslı müşteri II | "Hepsini sat"ta hesaba katılmıyor. | – |
| 17 | Ev lambaları | Evin içi her zaman güvenli olduğu için lambaların işlevi yok, ama metinleri "mor ışık içeri giremez" diyor. | Lambaya başka bir işlev ver ya da metni değiştir. |
| 18 | İşlevsiz aletler | Sapan, Bola, Porsuk yayı, Dişbudak yayı "tuzak" türünde ama kurulamıyor ve silah olarak da kullanılmıyor. | Bir işlev ver ya da tariflerden çıkar. |
| 19 | Metinler | Zor modda "Dene" sonrası metin eski akışı anlatıyor; "Oyunlardaki gibi" başarımı telefonda yanlış hareketi tarif ediyor. | Metin düzeltmesi. |
| 20 | Yol oku (ACT 1 sonu) | Levent'in görevleri sürerken görev kartı "Levent ile konuş" diyor ama yol oku hâlâ Yaşlı Ekin'i gösteriyor. | Ok Levent'i göstermeli. |
| 21 | Arayüz | Oyun içi Ayarlar açıkken saat akıyor; Ayarlar düğme yazıları kesik ("Derinli", "Otoma"); ana menüde logo "Devam et"e biniyor; karakter yaratmada alt çubuk son satırları örtüyor; seviye 50'de "0 / Infinity XP · SV. 51". | Düzeltme. |
| 22 | Hile paneli | Panel dünyanın üstünde ve görev kartının altında; savaşırken yanlışlıkla "Günü bitir"e tıklanabiliyor (testte 100 gün atlandı). | Paneli kenara al ya da onay iste. |
| 23 | Diyaloglar | Teslimde hem "Başka iş var mı?" hem "❗ Senin için bir işim var" aynı anda çıkıyor; Kemal görev bitince de "Atölye kurmak mı?" diyor; Levent'te "Hoşça kal" ilk sırada; Börü'de süren dersi bırakma seçeneği yok. | Düzeltme. |
| 24 | Eski metinler | Nazlı "otlar Çayır'da bolca olur" diyor, Nerede satırı Kayalık Dağ; Hasan "parçalarını Zümrüt'ün kazanında yaparsın" diyor (artık parçalar el yapımı). | Metin düzeltmesi. |
| 25 | E önceliği (ACT 1) | ACT 1 kişilerinin yanında bir taş/dal varken E önce onu topluyor (ACT 2'de v1.77'de kişiler öne alındı). Kişiye tıklamak her zaman çalışıyor. | Karar: ACT 1'de de kişi öne alınsın mı? |
| 26 | Ev içi gece | Gece lambasız oda neredeyse simsiyah; konan eşya görünmüyor ("sandalye koyamadım" hissi). Telefonda döşeme paneli odanın üst sırasını, masaüstünde görev kartı panelin bir kısmını örtüyor. | Gece odaya hafif bir ışık; panel yerleşimi. |
| 27 | ACT 2 zorluğu | ACT 2'nin "Güvenli" biyomlarındaki canavarlar bile çok güçlü (Bulut koyunu 1.200 can, Goblin 2.580 can / 343 hasar); ACT 1 sonu ekipmanla bir goblin 1 dakikadan uzun sürüyor. | Denge kararı (Boğaç). |
| 28 | ACT 2 küçükleri | Ülker'in kazanının başlığı "Cadının kazanı"; hileyle geçişte görev kartı Ekin'i gösteriyor ve köprü/geçit başarımları bedava geliyor; Tabanca yakın hedefte ıskalayabiliyor (belirsiz). | Düzeltme. |
| 29 | Meşale (öğretici) | Sabah yakılan meşale gündüz de yanıp öğlen sönüyor. | Tasarım kararı. |


# ACT 3 ve sonrası (henüz oyunda değil)

Bunlar Boğaç'la konuşulmuş kararlar; oyuna eklenmedi.

- **ACT 3:** yıldızsızların mor ışıklı gemisi. Oyun büyük bir uzaylı boss savaşıyla biter. Uzaya Astronot Tuna ile çıkılır; Levent'in ACT 3 ile bağı yok.
- **Köpekler:** robot köpeklerin gözlerindeki kameralarla yıldızsızlar seni baştan beri izliyormuş.
- **Şapka:** yıldızsızlar şapkayı bedeninden bilgi ve anı çalmak için kullanıyor; hafıza kaybının sebebi bu. Karakter yaratırken şapka seçtiysen içine metal bir şey yerleştiriyorlar, seçmediysen başına bir şapka geçiriyorlar ("Şapka" anısı).
- **Eş:** ikinci adaya hiç uğramadı; ilk ada yakınında kaçırıldı.
- **Kötü son:** "Yalnız dönüş" başarımı var ama kötü sonun kendisi henüz yazılmadı.
- **Planlanan gizli başarım (Boğaç, 28 Ekim 2026):** tanrı modu açıkken mor ışığa yakalanıp bayılmak gizli bir başarım olacak (adı ve simgesi henüz seçilmedi). Mor ışığın tanrı modunu da delmesi bilinçli bir tasarım kararıdır; "düzeltilmez".
