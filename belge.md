# Purple Light · Giriş ve kurallar

Sürüm: **Versiyon 3.59** ile birebir (7 Kasım 2026). Bu sürümde: Kül Diyarı girişinde Kül cini Seviye 36'dan, Mor Kristal girişinde Kristal örümcek ve Işık engereği Seviye 44'ten; kişilerin ~2 karo çevresinde yerde toplanabilir olmaz; anı ve ada halkı sahneleri Esc ya da dışına basınca biter. Bütün sürümlerin değişiklikleri: [Güncelleme notları](https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html).

> **KURAL: OYUNCUYA İŞ YAPTIRILMAZ (Boğaç, 5 Kasım 2026):** oyun oyuncuya asla "şuna bas, şunu güncelle, şu klasörü bul, kısayol oluştur, başka tarayıcıda aç, kabloyla bağla" gibi adım adım iş tarif etmez (pencere, bildirim, yardım metni, güncelleme notu dahil). Bir şeyi oyun **otomatik** yapabiliyorsa yapar (tek tıkla yükleme gibi); yapamıyorsa o özellik o cihazda **hiç gösterilmez**. Oyunun kendi kontrolleri (hangi tuş ne yapar) bu kuralın dışındadır.

> **KURAL: HER EŞYANIN KENDİ RESMİ OLUR (Boğaç, 6 Kasım 2026):** oyundaki her eşyanın (malzeme, yemek, alet, yapı, ACT 2 eşyaları dahil) **adına ve gerçeğine uygun** bir resmi vardır; bu resim envanterde, tarif kitabında, elde, **yere düştüğünde** ve **kurulduğunda** (yapılarda) kullanılır. Adıyla ilgisi olmayan, adından renk alan "hediye paketi" kutusu **hiçbir eşyada görünmez**. Yeni bir eşya eklenirken resmi de aynı sürümde, ne olduğuna göre (yemek tabakta ya da tavada, iksir şişede, merhem kapta, taş taş gibi…) çizilir. Resmi olmayan bir eşya bulunursa bu bir hatadır. v3.37'de 194 eşyanın hediye paketi yerine gerçek resmi çizildi (Eşyalar › Eşya resimleri). Resmi unutulmuş bir eşya oyunda sade, nötr bir bez torba olarak görünür (renkli kutu değil) ve geliştirici araçları açıkken (`?debug`) konsola yazılır (kontrol önbelleği silmez, yalnızca karşılaştırır).

> **KURAL: BÜYÜKLÜK YÜZDESİ ALAN İÇİNDİR (Boğaç, 6 Kasım 2026):** bir harita, biyom ya da bölge için "%X büyüt/küçült" denince **alanı** %X değişir; kenar katsayısı √(1+X) olur (ör. %50 büyütmek: kenar ×√1,5 ≈ ×1,2247). Şüphe varsa belgeye yazmadan önce Boğaç'a sorulur.

> **KURAL: TÜREYEN SAYILAR BİRLİKTE DEĞİŞİR (Boğaç, 6 Kasım 2026):** belgede bir sayı değişince ondan hesaplanan bütün sayılar (biyom başına alan, adet, oran) aynı commit'te güncellenir.

> **KURAL: BELGE YALNIZCA BUGÜNÜ ANLATIR (6 Kasım 2026, Boğaç):** son 20 sürümün değişiklikleri geri alınabilir (her sürüm `main`'de `vX.YZ:` ile başlayan ayrı bir commit; ayrıntılar DEVAM_NOTU'nda); daha eski sürümlerin geçmişi belgede, notlarda tutulmaz.

> **KURAL: BOĞAÇ'IN KARARI YALNIZCA BOĞAÇ'A SORULARAK DEĞİŞİR (7 Kasım 2026, Boğaç: "bu kararı ben vermiştim"):** belgede ya da CLAUDE.md'de Boğaç'a ait bir kararı (Boğaç adıyla ya da tarihiyle yazılmış kural) değiştiren ya da daraltan her öneri **önce Boğaç'a sorulur**; Yönetici onaylayamaz. Analist her belge değişikliğinden önce belgede (ve sürüm etiketleri temizlenmiş eski kurallar için depo geçmişinde) ilgili Boğaç kararını arar.

> **Kural (Boğaç, 28 Ekim 2026):** Bu belge oyunun doğru kabul edilen tanımıdır. Geliştirme önce burada yazılır, sonra koda geçer; belge ile kod çelişirse belge doğrudur ve kod belgeye uydurulur.

## Belge haritası

- **Giriş ve kurallar:** sürüm, belgenin temel kuralları, belgeyi okuma rehberi, oyunun özeti, adalar ve dünya ölçüsü.
- **Teknoloji:** kullanılan diller ve araçlar, performans kuralları, dosya düzeni, hedef ortamlar.
- **Oyun akışı:** açılış, öğretici, ACT 1 ve ACT 2 yol haritaları, gezginler ve takvim.
- **Sistemler:** kontroller, arayüz, hayatta kalma, gelişim, üretim ve ekonomi, toplama ve tarım, ev ve kayıt defterleri, dövüş, arena/hileler/kayıt.
- **ACT 1 · Yıldızsız Ada:** adanın yerleşimi, 6 biyom, ana görevler, yan görevler, mağaralar, deniz, kişilerin tanıtımları ve hikâyeleri.
- **ACT 2 · İkinci ada:** geçiş, mana ve ateşli silahlar, 6 biyom, kişiler ve görevler.
- **ACT 3 ve sonrası:** henüz oyunda olmayan fikir notları.
- **Canavarlar:** Reisler (boss'lar) ve canlıların genel kuralları.
- **Tarifler:** tarif ansiklopedisi, kategori kategori.
- **Aletler:** alet, silah, zırh, madenler ve ekipman merdiveni, evler.
- **Eşyalar:** eşya dizini (nereden gelir, nerede kullanılır).
- **Yetenekler:** yetenek ağacı.
- **Başarımlar.**
- **Bilinen açıklar ve tutarsızlıklar.**
- **Platformlar (Godot · PS5):** gelecekteki motor geçişi ve PS5 sürümü planları.

## Bu belge nasıl okunur

- **Bütün belgede ara:** sayfanın en üstündeki **arama çubuğu** belgenin tamamını tarar: başlıklar, metinler, listeler ve **tablo satırları** (tarifler, eşyalar, canlılar, görevler). Birden çok sözcük yazarsan hepsini içeren yerler çıkar; Türkçe harfler önemsizdir ("kerevit" ile "Kerevit", "cadi" ile "Cadı" aynı). Sonuca tıklayınca belge o yere kayar ve sözcükler işaretlenir. **/** ya da **Ctrl+K** aramaya geçer, **↑ ↓** sonuçlar arasında gezer, **Enter** gider, **Esc** kapatır. Bir tablonun kendi süzgeci ("Bu tabloda ara") yalnızca o tabloyu süzer; genel arama hepsini kapsar.

- **Bir şeyin nasıl yapıldığını mı arıyorsun?** En alttaki **Eşya dizini**ne git, adını ara. Her eşyanın yanında nereden geldiği (hangi biyomda toplandığı, hangi canlıdan düştüğü, hangi tarifle yapıldığı) ve hangi tariflerde kullanıldığı yazar.
- **Bir tarifin içeriği:** **Tarif ansiklopedisi**, kategori kategori. Her satırda malzemeler, gereken alet, *nerede yapıldığı* (el yapımı, örs, usta) ve fiyatı var.
- **Bir bölgede ne var:** **ACT 1** ve **ACT 2** bölümlerinde her biyom ayrı başlık: ağaçlar, toplanabilirler, madenler, canlılar.
- **Bir NPC ne istiyor:** **ACT 1 › Ana görevler**, **ACT 1 › Yan görevler** ve **ACT 2 › Kişiler ve görevler** bölümleri. Her görevin istediği, açılma şartı ve ödülü tablo halinde.
- **²** işareti: o eşya ya da tarif ACT 2 adasına ait (malzemesi yalnızca ikinci adada çıkar).
- **Fiyat** her yerde *temel satış fiyatıdır*; oyunda seviye ve Ekonomi ağacının yetenekleri bunu artırır.

## Oyun bir bakışta

**Purple Light (Mor Işık)** tek oyunculu, piksel sanatlı bir keşif ve hayatta kalma oyunu. Gemin batmış, eşini mor bir ışık götürmüş; **Yıldızsız Ada**'nın kumsalında hafızasız uyanıyorsun. Bir taştan başlayıp toplayarak, kazanda tarif keşfederek, ustalara alet ve zırh yaptırarak, avlanarak ve adanın insanlarına yardım ederek güçlenirsin. Amaç eşini bulmak.

- **Temel döngü:** topla → kazanda tarifi öğren → elle ya da ustaya yap → sat ya da kullan → güçlen → daha tehlikeli bölgeye geç.
- **ACT 1 · Yıldızsız Ada:** 6 biyom (Çayır → Orman → Bataklık → Kayalık Dağ → Kül Diyarı → Mor Kristal Vadisi), 26 kişi (11 kişi ve Çayır dışındaki her biyomda Zümrüt, Dursun ve Durmuş'un birer cadı, silahçı ve zırhçı kuzeni), Yaşlı Kemal'in ana görev zinciri. Sonunda Denizci Barbaros ile yeni bir gemi yapıp ikinci adaya geçersin.
- **ACT 2 · İkinci ada:** aynı boyutta, fantastik bir ada: Yüzen Kayalar → Dev Mantar Ormanı → Hurda Çölü → Kristal Golem Ocağı → Ejder Volkanı → Gök Rıhtımı. Büyü (mor mana ve asalar), ateşli silahlar, meka zırh. Sonunda Astronot Gökay ile roket yapılır ve mor ışıklı gemiye fırlatılır.
- **Son:** roket gemiye ulaşır; geminin içinde eşinle kavuşursun ("Yeniden birlikte"). Hikâye ACT 3 ile sürecek (henüz oyunda değil).
- **Gerçek:** eşini kaçıranlar adalarda köpek ve fener satan **yıldızsız yolcular**; mor ışık onların gemisi. Robot köpekler ve şapka seni izlemek ve anılarını okumak için verilmiş (ACT 3'te açılacak).

## Adalar ve dünya ölçüsü

- İki ada da **790 × 568 karo** ızgaradadır (v3.40, Boğaç: "her bir biyomu %50 büyüt, haritanın genel şeklini bozmadan"; v3.39'a kadar 645 × 464). **Kararın açıklaması (v3.44, 6 Kasım 2026, Boğaç):** "%50 büyüt" **alanın** %50 artması demektir; kenar başına katsayı √1,5 ≈ 1,2247'dir (645 × 464 → 790 × 568). v3.40–3.43'te yanlışlıkla kenar ×1,5 yapılmıştı (968 × 696, alan ×2,25); bu bir hataydı ve v3.44'te düzeltildi. Yıldızsız Ada hilal (kara ~208.000 karo), ikinci ada yonca (kara ~268.000 karo); bir karo 16 piksel. Şekil aynı, alan v3.39'a göre 1,5 kat; haritaya serpilen şeyler (dal, taş, bitki, maden, ağaç) aynı sıklıkta kalsın diye sayıları da 1,5 katına çıkar (v3.39'a göre). Göl yarıçapları ve deniz payı kenar katsayısıyla (×1,2247) büyür (deniz payı 10 → 12 karo); Bataklık gölcükleri sayı olarak 20 → 30 olur. Eski kayıtlar bu sürümde (v3.44) silinir (Boğaç'ın kararı). Bir anda yalnızca bir ada bellekte durur; adalar arası geçiş bir yükleme ekranıyla yapılır.
- Envanter, sikke, seviye, gün ve saat iki adada ortaktır.
- Her adada 6 biyom vardır (**eşit büyüklükte**: Yıldızsız Ada'da her biri ~34.700, ikinci adada ~44.700 karo (v3.44); adanın şekli boyunca **zincir halinde** sıralanır, her biyom yalnızca öncekine ve sonrakine değer; 1-2, 3-4, 5-6 ortak bölgedir, 2→3 ve 4→5 arasında keskin bir sınır vardır); biyomun tehlike seviyesi canavarların gücünü belirler: **Güvenli** (ilk iki biyom), **Tehlikeli** (3. ve 4.), **Ölümcül** (5.), **Çok ölümcül** (6.).
- Oyun içinde biyomlar 3 tehlike kuşağına ayrılır ve balık tabloları, tuzak ganimetleri bu kuşağa göre değişir: **Kuşak 0** = Çayır + Orman, **Kuşak 1** = Bataklık + Kayalık Dağ, **Kuşak 2** = Kül Diyarı + Mor Kristal Vadisi (ACT 2'de aynı sırayla).


# Teknoloji · Kullanılan teknolojiler

Bu bölüm oyunun ve projenin **neyle yapıldığını** anlatır: hangi programlama dilleri, hangi grafik/ses teknolojileri, hangi tarayıcı özellikleri ve hangi araçlar (28 Ekim 2026 itibarıyla). Oyun bir **web oyunudur**: tarayıcıda çalışır, kurulum istemez; bilgisayarda, telefonda ve tablette **aynı tek dosya** çalışır.

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

## Performans kuralları

Oyun telefonda da akıcı olsun diye (Boğaç'ın telefonu: Honor 600) şu kurallar geçerlidir:

- **Oyun sırasında haritanın tamamı taranmaz.** Ada 790 × 568 karodur (~449 bin karo, v3.44; v3.40–3.43'te yanlışlıkla 968 × 696); oyun sırasında düzenli çalışan bir iş bütün haritayı dolaşırsa telefonda kare kaçırır.
  - **Sis (keşfedilmemiş yerler):** yalnızca bir haritanın gösterdiği yerde hesaplanır: köşedeki küçük haritanın penceresi (çevresinde 8 karo payla, ~260 × 130 karo) ve büyük harita açıkken onun görünen penceresi. Bütün ada yalnızca oyun başlarken, kayıt yüklenince ve hileyle harita açılınca bir kez hesaplanır. Keşif yalnızca oyuncunun yanında olduğu için pencerenin dışı değişmez. Köşedeki küçük haritanın kendi küçük sis resmi vardır; ada büyüklüğündeki resim telefonun ekran kartına her seferinde yeniden gönderilmez. (bütün adayı saniyede 4 kez yeniden hesaplıyordu: telefon hızında her seferinde ~40 ms; şimdi ~2 ms.)
  - **Biyom keşif sayacı** (almanakta hangi biyomlara girildiği) bütün haritayı okur; en çok **12 saniyede bir** ve yalnızca yeni bir yer keşfedildiyse çalışır.
- **Izgara (v3.44):** iki ada da **790 × 568** karoluk ızgaradadır (v3.39'a kadar 645 × 464; biyomların alanı %50 büyüdü, kenar ×√1,5 ≈ ×1,2247; v3.40–3.43'te yanlışlıkla kenar ×1,5 → 968 × 696 idi; hilal ve yonca bu çerçeveye sığdırılır, kıyıda ~12 karo deniz payı). Üretici `proje/tools/harita/ada_uret.py` (`GROW` = √1,5 ≈ 1,2247, kenar katsayısı); oyunda `AREA_K` (≈1,5) haritaya serpilen şeylerin sayısını büyütür. **Ölçüm (v3.40 (968×696, sonradan geri alındı), `olcum.js` CPU×4, ekran kartı açık):** açılış 16,7 → 20,9 sn, oyun karesi kumsalda 230 → 212 ms, yürürken 248 → 189 ms (kare maliyeti değişmedi; yalnızca açılış uzadı). Deniz yürünmez; ızgarayı büyütmek yalnızca haritanın tamamını okuyan işleri (sis, kayıt, keşif, sarı bölge) pahalılaştırır.
- **Hava sisi:** sis ekranın altıda biri çözünürlükte küçük bir tuvale çizilip ekrana gerilir; Orta Diyar'da sürekli ince sis yalnızca grafik kalitesi en düşük düzeyde değilken çizilir.
- **Yükleme ekranında ısınma:** adaya girmeden önce yer görüntüleri ve resimler hazırlanır (Akış → Yükleme ekranı). **Bekleme sınırı:** ısınma, zemin parçaları çizilip 6 kare geçince biter; her durumda **en çok 2,5 sn** sürer. Önceki kural ("12 kare üst üste 45 ms'nin altında", en çok 7–9 sn) 30 kare/sn çizen bir telefonda hiç sağlanmıyordu ve her açılışta 7 sn "Yükleniyor…" bekletiyordu. Genel kural: "akıcı olana kadar bekle" türü mantık ya hiç olmaz ya da kısa, sabit bir üst sınırla olur; telefonun tutamayacağı bir eşik beklenmez.
- **Öğretici parlaması:** parlayan düğmenin ışığı sabit bir gölgedir; düğme yalnızca büyüyüp küçülür (`transform`, ekran kartında, yeniden boyamadan). Telefonda da nefes alır (bilgisayardan biraz yavaş, 1,2 sn), çünkü yalnızca `transform` oynayan bir öğe ekranı yeniden boyatmaz ve duran parlama "efektler dondu" diye algılandı. Hareketi azalt tercihinde oynamaz.
- **Ekran kartı çizimi her açılışta denenir:** oyun bir çizim hatasında, ekran kartı bağlantısı kopunca ya da bellek iki kez dolunca klasik çizime (Canvas 2D) geçer. Ayar **varsayılan açıktır ve her açılışta cihaz destekliyorsa açılır**; kendiliğinden ya da Ayarlar'dan kapanma yalnızca o sekme açık kaldığı sürece geçerlidir (sessionStorage), sekme kapanıp açılınca yine ekran kartı denenir; eski kalıcı bayrak silinir. Kapanınca bir kez bildirim çıkar (sebebiyle); ana menüdeki sürüm etiketinde **"· klasik çizim"** eki ve Ayarlar › Grafik'te sebep görünür, böylece yavaşlık şikâyetinde ilk bakılacak yer bellidir. Kural: cihazda saklanan hiçbir otomatik bayrak kalıcı olmaz ve ekranda görünür.
- **Ölçüm yolu:** değişiklikten sonra oyun Playwright ile, işlemci 4–6 kat yavaşlatılarak (telefon hızı) oynatılır; uzun işler (30 ms üstü) ve ekran kartına yüklenen resim miktarı ölçülür. **Betik depoda:** `proje/tests/olcum.js` — açılış süresi, kare süreleri (kumsal, yürüyüş), kare başına çizim çağrıları, ekran kartına yükleme, JS profilinde en çok zaman alan işlevler; bir ya da iki dosya verilir (eski ve yeni sürüm yan yana). Performansla ilgili her düzeltme "giderildi" diye yazılmadan önce eski ve yeni sürüm bu betikle ölçülür ve sayılar DEVAM_NOTU'na yazılır; ölçülmemiş düzeltme "deneme"dir.

## Programlama dilleri

- **JavaScript** projenin ana dilidir: oyunun bütün kodu JavaScript'tir (yaklaşık 1,9 MB'lık tek HTML dosyasının içinde, 60'tan fazla `<script>` bloğu). Eski telefonlar da çalıştırabilsin diye **ECMAScript 2018** sınırında kalınır: `?.` ve `??` gibi yeni yazımlar kullanılmaz (yerine `nn(a,b)` yardımcısı), her sürümde `chk.js` ile denetlenir.
- **GLSL** yalnızca ekran kartı gölgelendiricilerinde (birkaç satır).
- **HTML ve CSS** arayüz için.
- **Python** ve **Bash** oyunun içinde yoktur; yalnızca geliştirme araçlarıdır (belge üretimi, veri betikleri).

## Grafik: WebGL, GLSL ve Canvas 2D

- Oyun dünyası bir `<canvas>` üstünde çizilir: **karo (tile) tabanlı 2D dünya** (bir karo 16 piksel, her ada 790 × 568 karo), üstten bakış, piksel sanatı.
- Çizim kodu Canvas 2D komutlarıyla yazılmıştır (dikdörtgen, resim, yol, yazı, renk geçişi, saydamlık, dönüşüm, karışım modları).
- **v68'den beri** bu komutları oyuna özel yazılmış **GL2D** katmanı alır ve **WebGL** ile ekran kartına gönderir:
  - Binlerce küçük çizim birkaç büyük **toplu çizime** (batch) çevrilir.
  - Küçük resimler büyük **doku atlaslarında** (texture atlas) toplanır.
  - Karmaşık şekiller **üçgenlere bölünür** (earcut yöntemi).
  - Işık, gölge ve gece efektleri için **karışım modları** (blend) ekran kartında uygulanır.
  - Köşe ve piksel gölgelendiricileri **GLSL** ile yazılmıştır.
- WebGL yoksa ya da hata verirse oyun kendiliğinden **Canvas 2D**'ye döner. Ayarlar › Grafik › "Ekran kartıyla çiz" ile elle kapatılabilir.
- **Ekran kartı belleği:** uzun oyunda (özellikle telefonda) ekran kartının belleği dolunca zemin ve ağaç resimleri boş çiziliyor, ekran **mavi** görünüyordu (zemin yok, yalnızca gölgeler, kişiler ve küçük şeyler). Artık: telefonda ortak resim sayfaları en çok 3 (bilgisayarda 6), büyük resimler en çok 40 / 120 tane tutulur (en eski kullanılan silinir) ve 5 sn kullanılmayan büyük resim bırakılır. Ekran kartı "bellek doldu" derse bütün resimler boşaltılıp yeniden yüklenir; 1 dakika içinde ikinci kez olursa oyun otomatik kaydedip **klasik çizimle** (Canvas 2D) yeniden açılır.
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


# Oyun akışı

Bu bölüm oyunu baştan sona, oyuncunun yapacağı sırayla anlatır. Ayrıntılar (her görevin istediği, ödülü) "ACT 1 › Ana görevler", "ACT 1 › Yan görevler" ve "ACT 2 › Kişiler ve görevler" bölümlerinde.

## Açılış

**Yükleme ekranı:** oyun açılırken yükleme ekranı **yoktur**. Giriş sahnesinden sonra "ACT 1 · Yıldızsız Ada" kartı ekrandayken oyun durur ve arkada kıyı hazırlanır: yer görüntüleri çizilir, Kemal, ateş ve çevredeki her şey ekran kartına yüklenir, yazı tipi ve konuşma penceresi hazırlanır, sonra birkaç kare beklenir (zemin çizildikten sonra 6 kare; her durumda en çok 2,5 sn — önce 7 sn'ye kadar bekliyordu ve telefonda her açılışta o kadar sürüyordu). Bu sürerken kartın altında dönen halkayla **"Yükleniyor…"** yazar. Bitince kart kalkar, kıyı oynanmaya hazır açılır; uyanış ve Kemal'in yürüyüşü ancak o zaman başlar. Adalar arasında geçerken ve kayıt yüklerken yükleme ekranının arkasında aynı hazırlık yapılır; bir oyun oynandıktan sonra Yeni oyun sayfayı yeniden açtığında karakter ekranı gelene kadar "Yükleniyor…" görünür.

1. **Ana menü:** Yeni oyun, Devam et, Kayıttan yükle, Ayarlar, Kayıtları dışa/içe aktar, Arena (kilitli), Çıkış. Menünün altında sürüm etiketi (ör. "Versiyon "). **Temiz dünya:** bu sekmede bir oyun oynandıktan sonra menüden **Yeni oyun**, **Devam et** ya da **Yükle** (oyun içi menüden yüklemek dahil) sayfayı kısa bir "Yükleniyor…" ekranıyla yeniden açar; harita her seferinde baştan kurulur. Önceki oyunun haritada bıraktıkları (öğreticinin koyduğu böğürtlen ve taşlar, kesilen ağaçlar, kazılan madenler) yeni oyuna ya da yüklenen kayda taşınmaz.
   - **Ana menü görünümü (5 turda 45 önizleme arasından seçildi, renkler Boğaç'ın "Purple Light — Ana Ekran Renk Paleti"nden):**
     - **Ana menünün sesi ("menüye döndüyse oyunla işim kalmadı, menünün sesi çalmalı"):** ana menüde yalnızca menünün kendi sesleri çalar: müzik, rüzgâr, mor ışığın uğultusu ve düğmelere basınca çıkan sesler. Oyundan menüye dönünce oyun içi bütün sesler (bölge ve hava döngüleri, sahne ve anı müzikleri, sinematik sesleri) yarım saniyede susar; menü açıkken arkada çizilen dünyanın sesleri (örs, hayvanlar, adımlar, konuşma blipleri, karın guruldaması…) hiç çalmaz. Müzik oyunda bir bölge ya da sahne yüzünden kısıldıysa menüde tam sesine döner.
     - **Başlık ("yazı tipi olarak eskiye döndür"):** PURPLE LIGHT yeniden oyunun ilk piksel harfleridir (kalın, koyu konturlu, yukarıdan aşağı açık mordan mora geçen harfler). Neon parıltısı ve yeri aynı kalır. Eski tarif: PURPLE LIGHT yazısı **Cinzel** yazı tipinde, iki kat iri piksellere dökülmüş bir resimdir; üstünde ve altında başka bir şey yoktur (üstteki süs çizgisi ve yıldız kaldırıldı). Renkleri üç basamaktır: beyaz #FFFFFF, açık mor #CFA6F6, mor #9A6AD8; harflerin altında keskin koyu gölge yerine **yumuşak, bulanık bir gölge** vardır. Arkasında tabela yoktur. Ekranın üstünde ortadadır (yeri ve boyu logo gibi), gece etrafında mor bir parıltı olur. Eski logonun arkasından gece arada bir geçen ışık şeridi kaldırıldı (yeni yazının üstünü kapatıyordu).
     - **Neon başlık ve dağa inen ışık:** PURPLE LIGHT yazısı **neon gibi yanar** (beyaz çekirdekli, vurgu renginde parıltı) ve **hep yanar**; titremez, sönmez. **Tepeye inen sürekli ışık yoktur** ("oyunda dağa gelen bir ışık yok"): **Mor ışık bir uzay gemisinin ışığıdır** (Boğaç): gemi ekranda **hiçbir zaman gösterilmez**, yalnızca gökten inen ışığı görünür; dağ yalnızca görüntüye derinlik katar, ışık dağdan gelmez. **Rastgele düşen mor ışık** gece rastgele yerlere, farklı açılarla (en çok yaklaşık ±46°) vurur: çarpmaların yaklaşık üçte ikisi adanın rastgele bir yerine, üçte biri **denize**; tepeye ayrılmış bir pay yoktur. Denize düştüğünde suda büyüyerek sönen halkalar yayılır (yansıma çizilmez). Başlık biraz aşağıdadır: bilgisayarda ekranın üstünden %10, telefonda en az 70 px ya da ekranın %16'sı.
     - **Menü tek seferde açılır ("önce aşağıda açıp sonra büyüyor"):** ⚔ Arena düğmesi sayfa açıldıktan birkaç saniye sonra eklendiği için menü önce kısa görünüp sonra yukarı doğru uzuyordu. Artık menü arkada hazırlanır ve Arena düğmesi yerine oturunca (en geç 6 saniyede) yumuşakça bir kerede görünür.
     - **Menü düğmeleri ("sol menü tasarımı olarak ilk haline dön"):** soldaki menü düğmeleri şu tasarımdadır: yarı saydam koyu mor, yuvarlak köşeli, açık mor kenarlı, yazı sola dayalı; Devam et dolu mor; üzerine gelince soldan ince bir ışık çubuğu çıkar. Boyları küçük kalır (bilgisayarda en çok 340 px ya da ekranın %26'sı, büyümez); telefon ve kısa ekran düzeni aynı. Aşağıdaki ahşap tahta tarifi yalnızca sağ üstteki simge karoları için geçerlidir.
     - ** Menü düğmeleri** solda, ahşap tahtalardır: zemin #80573C → #6C4631 → #5A3927, kenar #24130B; her tahtanın iki ucunda çivi yerine **vurgu renginde bir kristal** parlar. Yazılar **Pixelify Sans** yazı tipinde ve #FBF3FF renktedir. **Devam et** (yoksa ilk düğme) ve fareyle/klavyeyle üzerine gelinen tahta mor tonlu ahşaptır (#8C5D74 → #5A3450), vurgu renginde parlar ve kristalleri yanar. Kilitli Arena gri-kahve tahtadır (#584846 → #3D3131). Sürüm etiketi ve "Güncelleme notları" da Pixelify Sans'tır (#CDB9E8). Başarımlar, Ayarlar ve Çıkış simgeleri yeniden ilk hallerindedir (yarı saydam koyu mor, yuvarlak köşeli kare; tahta karo kaldırıldı). Bu görünüm telefonda da geçerlidir. **Telefon ve kısa ekran (düğmeler yazının üstüne biniyor, en üstteki ekrandan taşıyordu):** dokunmatik ekranlarda ve 640 px'e kadar yüksekliği olan ekranlarda menü daha dar bir sütundur (en çok 300 px ya da ekranın %30'u) ve düğmelerin yüksekliği ile yazısı ekran yüksekliğine göre küçülür (düğme ekranın %9,5'i, 34–52 px; yazı %3,3, 12–18 px); PURPLE LIGHT yazısı menünün sağında kalan alanın ortasına geçer, menüyle üst üste gelmez. (Önceki kural yalnızca 520 px'ten kısa ekranları kapsıyordu; biraz daha uzun telefonlarda menü bilgisayar boyunda kalıyordu.) **Açılış:** ana menünün görünüm ayarları sayfanın başında yüklenir; menü ilk anda eski görünümde açılıp sonra tahtalara dönmez.
     - **Yazı tipleri:** Cinzel ve Pixelify Sans (ikisi de SIL Açık Yazı Tipi Lisansı). Pixelify Sans'ın yalnızca kullanılan harfleri oyunun içine gömülüdür; Cinzel başlık zaten resim olduğu için gömülmez. İnternetsiz çalışır.
     - **Vurgu rengi (Ayarlar › Menü vurgusu):** varsayılan **Purple Light moru** #B57BFF; oyuncu **pembe** #FF7AD9, **mavi** #7AC8FF ya da **altın** #FFC56B seçebilir. Vurgu rengi şunları boyar: adaya inen sürekli ışık, tepedeki hale, sudaki ışık şeridi ve halkalar, yükselen ışık zerreleri, adanın kenar ışığı, gece çiçekleri, gökyüzündeki ışık şeridinin biri, seçili düğmenin parlaması ve kristaller. Rastgele düşen mor ışık çarpmaları her zaman mordur (hikâyedeki ışık). Seçim cihazda saklanır (oyuncunun kendi ayarı).
   - **Ana menü sahnesi:** ana menü **hep gecedir** (gün döngüsü yok). Rastgele düşen mor ışık çarpmaları, kayan yıldız, kuzey ışığı, halkalar ve zerreler sürer. Gece renkleri paletten gelir: gökyüzü yukarıdan aşağı #0C0720, #1C0F38, #4A2266, #93477F, ufukta #C26A92; deniz #3B2A5E, #22204A, #0B0A1F; ay yuvarlaktır (#EFEAF8, gölgesi #C9BFE0) ve gökte başlığın altında kalacak kadar alçaktan geçer. Gece ada eskisi kadar karartılmaz, yeşili seçilir.
     - **Ada** biraz sağa kaydı (merkez ekranın %58'i); şekli, ağaçları ve kayığı aynıdır, iki kat inceliğinde çizilir. Renkleri paletteki tonlara oturtulur: çimen 6 ton (#143723 … #76B85E), kaya 5 ton (#33283F … #A796C4), kum 3 ton (#9C7556, #C19A74, #DDB98F), ışığın değdiği tepe 3 ton (#E6CCFF, #B98BE6, #8E64C4). Tepelerin ve ağaçların üst kenarında vurgu renginde kenar ışığı (gece güçlü, gündüz soluk), sağ kenarlarda ay ışığı, çimde ince doku ve gece parlayan 18 küçük çiçek vardır. Kamp ateşi #E8562A, #FF9A3C, #FFD36B; ateş böcekleri #EFFFB8 ve **11 tane** (eskiden 22).
     - **Mor ışık (gece):** adanın tepesine ince, sürekli bir ışık sütunu iner (ortası #F6E8FF); tepede güçlü bir hale olur, sudaki yansıma şeridinden yavaşça büyüyen **halkalar** yayılır, tepenin çevresinden **ışık zerreleri** yükselir. Rastgele düşen mor ışık çarpmaları da eskisi gibi sürer.
     - **Gökyüzü (gece):** başlığın arkasında yavaşça dalgalanan iki ışık şeridi (biri vurgu renginde, biri soluk yeşil) ve **arada bir kayan yıldız** (gece ortalama 10 saniyede bir, ekranda yaklaşık 1 saniye; eskisinden uzun ve parlak).
   - **Bilgisayarda ana menü düzeni:** PURPLE LIGHT yazısı üstte, ekranın tam ortasında ve büyük (ekran − 260 px, en çok 1500 px; 820 px'ten kısa ekranda en çok 1100 px); ada yazının altında (biraz sağda). **Menü düğmeleri sol altta** alt alta, **küçük** durur (genişlik en çok 340 px ya da ekranın %24'ü, yazı 20 px); kayık sağ kumsalda (menünün altında kalmasın diye). Başarımlar, Ayarlar ve Çıkış sağ üstte alt alta (72 px). Telefon görünümü değişmez.
   - **Ana menüdeki ada:** ada ekranın ortasında (biraz sağda), biraz gerçekçi çizilir: tepede karlı, dokulu bir kaya; çimde hafif desen; katmanlı çamlar ve gölgeli yuvarlak ağaçlar (yerleri ve sayıları gibi); sol kumsalda kırık direkli, yırtık yelkenli bir kayık ve kürek. Adada hayvan yoktur. Bulutlar yazının altında, ortada yavaş kayar. 
   - **Güncelleme notları:** sürüm etiketinin hemen altında **"Güncelleme notları"** bağlantısı var. Tıklayınca oyunun içinde bir pencere açılır ve **yalnızca son sürümün** notunu gösterir (`GUNCELLEME_NOTLARI.md`'nin en üstteki sürümü; Tasarım belgesi ve Proje başlıkları oyuncuya gösterilmez). Notlar oyun dosyasının içindedir, internetsiz de açılır; her yayında `yayinla.sh` (notlar/notlar.py) en üstteki notu oyuna kendisi koyar. **Tamam** ya da **Esc** kapatır.
   - **Uygulama olarak indir:** ana menünün sağ üstünde (madalya, Ayarlar ve Çıkış'ın solunda) **"Uygulama olarak indir"** düğmesi yalnızca tarayıcı oyunu **tek dokunuşla** yükleyebiliyorsa görünür (Chrome/Edge/Samsung, Android); dokununca tarayıcının kendi yükleme penceresi açılır. **v3.28 (Boğaç):** iPhone/iPad ve Mac Safari tek dokunuşla yükleyemediği için düğme orada görünmez (eski "Paylaş → Ana Ekrana Ekle" / "Dosya → Dock'a Ekle" adım penceresi kaldırıldı). Oyun zaten uygulama olarak açıksa ya da yüklendikten sonra düğme gizlidir. Yüklenen oyun `manifest.webmanifest` ve `sw.js` ile kendi penceresinde ve internetsiz açılır.
   - **Bilgisayara yükle:** bilgisayarda (fare ile oynanan cihaz) ana menüde **Yükle**'nin hemen altında büyük **"Bilgisayara yükle"** düğmesi vardır (altında küçük yazı: "Masaüstünden uygulama gibi aç"). Bilgisayarda sağ üstteki "Uygulama olarak indir" düğmesi gösterilmez, onun yerine bu düğme kullanılır (telefon ve tablette sağ üstteki düğme eskisi gibi). Davranış: **Oyun koluyla basılırsa (v3.28):** tarayıcı yükleme penceresini kol basışıyla açmaz; kolla basınca hiçbir şey olmaz, hata da çıkmaz (yazı gösterilmez).
     - Tarayıcı yüklemeye izin veriyorsa (Chrome, Edge) düğme tarayıcının **yükleme penceresini** açar; **Yükle** denince oyun bilgisayara kurulur, masaüstünde / Başlat menüsünde (Mac'te Uygulamalar ve Launchpad'de) **Purple Light** simgesi çıkar ve oyun oradan kendi penceresinde, internetsiz de açılır.
     - **Yalnızca tek tıkla yüklenebilen yerde görünür (v3.27, Boğaç: "oyuncuya ona bas buna bas denmez; buton olur basar ve yükler, bitti"):** düğme yalnızca tarayıcı oyunu tek basışta yükleyebiliyorsa (Chrome, Edge) görünür; basınca tarayıcının kendi yükleme penceresi açılır, "Yükle" denince oyun masaüstüne gelir. Tarayıcı bunu yapamıyorsa (Firefox, Mac Safari, tarayıcı henüz izin vermediyse) düğme hiç görünmez; adım adım anlatan pencere yoktur (v3.26'daki nasıl yüklenir penceresi kaldırıldı).
     - **Bir daha görünmez:** oyun yüklendiğinde (tarayıcının "yüklendi" haberi), oyuncu "Yükledim, bir daha gösterme"ye bastığında ya da oyun bir kez uygulama olarak açıldığında bu tarayıcıda kalıcı olarak gizlenir (`localStorage` `pl.installed=1`; oyuncunun kendi seçimi olduğu için kalıcıdır). Oyun uygulama olarak açıkken de görünmez. Dosyadan (https olmadan) açılan kopyada düğme yoktur.
   - **Hakkında** penceresinde "Bir Boğaçhan Çavdar oyunu" yazısının altında **"Tasarım belgesine buradan ulaşabilirsiniz"** bağlantısı vardır. Tıklanınca bu tasarım belgesi oyunun içinde, tam ekran bir pencerede açılır (aranabilir hali, `belge.html`); sağ üstteki **Kapat** ya da Esc ile Hakkında'ya dönülür. Belge yeni sekmede de açılabilir ("Yeni sekmede aç"). Belge oyunla birlikte cihaza kaydedilir: oyun uygulama olarak yüklendiyse ya da bir kez internetle açıldıysa, **internetsiz de** o sürümün belgesi açılır (her açılışta internet varsa en son hali alınır).
2. **Karakter yaratma:** iki adım, ikisinde de **isim yazılmaz** (isimler eskisi gibi Kemal'in sahnelerinde sorulur).
   - **1. Karakterin:** cinsiyet, ten, **göz rengi** (Koyu, Ela, Mavi, Yeşil, Gri, Mor ve **Kehribar**; Kehribar Ela'dan ayrı, koyu bir bal rengidir, eski kayıtlarda kendiliğinden bu tona geçer), saç (stil ve renk), sakal/bıyık, kıyafet ve renkleri, gözlük, şapka. Pencerenin başlığı "Karakterini yarat"; **Devam** ikinci adıma geçer.
   - **2. Sevdiğin kişi:** aynı seçenekler (cinsiyet dahil) bu kez kaybettiğin kişi için; başlık "Sevdiğin kişi". Varsayılanı karşı cinstir ama kadın ya da erkek, istediğin gibi seçilir; **Döndür** ve **Rastgele** burada da var. **Geri** birinci adıma döner (seçtiklerin durur), **Devam** zorluk seçimine geçer.
   - Giriş sahnesi, anılar, sisli adadaki gemi ve bütün çizimler bu iki karakterin seçilen görünüşüyle oynar.
   - **Sevdiğin kişinin özelliği geçen yazılar** onun seçilen görünüşünden kurulur: saç rengi (kahverengi, siyah, kızıl, sarı, beyaz, mor, yeşil, pembe) ve uzunluğu (Uzun, At kuyruğu, Örgü, Topuz, İki kuyruk → "uzun"; Küt → "küt"; diğerleri → "kısa"), ör. "uzun kızıl saçları", "kısa siyah saçlar". Toygar'ın anlattığı gece "kollarında bir kadın / bir adam vardı" sevdiğin kişinin cinsiyetine göre yazılır. Kemal'in sevdiğin kişinin adını sorduğu pencere, ad önerisini de onun cinsiyetine göre yapar.
   - **İzler cinsiyete uyar:** haritadaki izlerden kumsaldaki takı her zaman **Kelebekli kolye**dir (anılardaki, ona senin aldığın kolye; eskiden kadınsa kolye, erkekse bileklik); çamurdaki izlerin yanında kadınsa **bir küpe**, erkekse **deri bir cüzdan** bulunur; Sisli Ada'da kadınsa **Kızıl bir kurdele** (saçındaki kurdele), erkekse **Bir kol saati** (akrebi gece yarısında durmuş). Defter sayfası, metal parça, yıldız haritası, mor kristal, fener ve tasma ikisi için de aynıdır.
   - **Anılarda roller:** anılarda tanışan, yardım eden, "sevgilim olur musun" diye yazan, konserden sonra eve bırakan, yüzme öğreten, fotoğraf çeken, peçeteden gül yapan, tavlada yenilen, kardan kalp yapan ve kolyeyi alan **oynadığın karakter**dir; utangaç olan, sarılan, pasta yapan, biletleri saklayan, gülü beceremeyip saçak saçak bir peçete çıkaran, tavlada kazanıp "LOSER" fotoğrafı çeken, hamburgerini veren ve kaktüs yollayan **sevdiğin kişi**dir; cinsiyetler bunu değiştirmez (yalnızca teklif aşağıdaki kurala bağlı).
   - **Kehribar gözlüm (gizli):** sevdiğin kişinin göz rengini **Kehribar** seçersen bazı anılarda ona **"kehribar gözlüm"** diye seslenirsin (Boğaç: her anıya değil, bazılarına; ilk 5 ve son 5 anı hariç, aralarda); başka bir göz rengi seçenlerde bu hitap hiç yoktur. Oyunun hiçbir yerinde (seçim ekranı, ipucu, kitap, güncelleme notları) bunun izi verilmez; yalnızca anıların kendisinde duyulur. Her anıda değil, **yalnızca bazılarında**: ilk 5 ve son 5 anıda hiç geçmez, yalnızca aradaki anılarda (6–17) ve onların da dördünde geçer (hepsi senin sözlerin): Bir mesaj ("Kehribar gözlüm… Yarın yanıma sevgilim olarak gelir misin?"), Yağmurda şemsiye ("Bunu senin için aldım, kehribar gözlüm."), Kardan kalp ("Bu sana, kehribar gözlüm. Ama atmak yok!"), Şatonun önünde ("Dur, kıpırdama, kehribar gözlüm… şimdi gülümse!"). Gizli başarımı: **Kehribar gözlüm** (Başarımlar).
   - **Teklif anısı** ("Çay kıyısında söz", ACT 1'in son anısı, gece): biri erkek biri kadınsa **erkek** teklif eder (yüzük onun elindedir, diz çöker); iki erkek ya da iki kadınsa **oynadığın karakter** teklif eder.
   - **Eski kayıtlar:** sevdiğin kişinin cinsiyeti kayıtta yoksa eski kural sürer (erkek kahraman uzun kızıl saçlı bir kadını, kadın kahraman kısa kahverengi saçlı bir erkeği kaybeder).
3. **Zorluk:** Normal ya da Zor. Zor modda tarifler kapalıdır ve kazanda "Dene" ile deneyerek bulunur (ayrıntı: "Sistemler › Gelişim › Zorluk").
4. **Giriş sahnesi** (gemi, fırtına, mor ışık) ve **kumsalda uyanış**: Yaşlı Kemal seni bulur, adını sorar. **İsim penceresi telefonda ve tablette:** telefonun kendi klavyesi açılmaz (yatay ekranda ikiye bölünüp pencereyi kapatıyordu); pencerenin içinde oyunun kendi **Türkçe klavyesi** çıkar: üç sıra harf (Q W E R T Y U I O P Ğ Ü · A S D F G H J K L Ş İ · Z X C V B N M Ö Ç), **Boşluk**, **Sil**, **Rastgele** ve **Tamam**. İlk harf büyük, sonrakiler küçük yazılır; en çok 14 harf. Uzun açıklama yazısı telefonda gizlenir, pencere ekrana sığar. Bilgisayarda eskisi gibi klavyeyle yazılır.

## Öğretici (13 adım)

Öğretici sürerken Kazan, Pazar ve Demirci menüleri kilitlidir; ilgili kişiyle tanışınca açılır.

**Öğretici kartını küçültmek:** bilgisayarda öğretici kartının (Kemal, Zümrüt ve diğer eğitim adımları) başlık satırının sağında küçük bir **▾** düğmesi vardır; basınca kart yalnızca başlık satırına (konuşanın resmi ve adımın adı) iner, metin ve düğmeler gizlenir; **▸** ile yeniden açılır. Küçükken yeni bir adım gelirse başlık kısa bir süre parlar. Seçim bu tarayıcıda hatırlanır (oyuncunun kendi seçimi). Telefonda kart zaten başlığa dokununca açılıp kapanır, bu düğme yoktur.

**Öğreticiyi geçmek:** kartın üstündeki "Eğitimi geç" önce bir uyarı açar. Kemal şunu söyler: öğretici adayı ilk kez görenler için önemlidir, oyunun ana mekaniklerini (toplama, yeme, kazan, el yapımı, satış, dövüş, atılma) öğretir; geçilirse öğretici boyunca verilecek **ödüller, XP ve eşyalar alınmaz**. İki seçenek vardır:

- **"Öğrenmek istiyorum"** → uyarı kapanır, öğretici kaldığı yerden sürer.
- **"Zaten biliyorum, geç"** → öğretici biter, menüler açılır, Kemal'in ilk ana görevi gelir. **Hiçbir şey otomatik verilmez:** meşale, balta, taş, tarif, XP ya da sikke yok; oyuncu her şeyi kendisi bulur (Normal modda tarifler malzemeleri görünce zaten açılır). O ana kadar kazandıkların sende kalır. Atılmayı bilmiyorsan Börü'yle konuşunca atılma dersini ücretsiz verir (aşağıda).

**Öğretici malzemeleri yer değiştirmez:** öğreticinin istediği malzeme (böğürtlen, dal, taş…) yakında yoksa ya da telefonda parmağın kolay ulaşacağı yerde değilse, haritadaki mevcut bir çalı/malzeme **taşınmaz**: yakındaki **boş bir yerde yeni bir tane** biter ve ok ona bağlı kalır. Haritada duran bir malzeme, sen ona yürürken hiçbir zaman başka bir yere ışınlanmaz (eskiden en yakın böğürtlen oyuncunun yanına çekiliyor, telefonda da kamera kaydıkça yeniden taşınıyordu).

**Öğretici malzemelerinin yeri:** 5 böğürtlen **Kemal'in kampının** çevresine; meşale malzemeleri (iki tur da), taşlar ve keskin taş için taşlar **Zümrüt'ün kazanının** çevresine; balta malzemeleri **Börü'nün** çevresine konur. Kişiler kampın kuzeyine/kuzeydoğusuna sırayla dizilir ve her biri bir öncekine kısa bir yürüyüş uzaklığındadır: Kemal → Zümrüt (~29 karo) → Nazlı (~37) → Börü (~35) → Dursun ve Durmuş (~36). Başlangıç yeri Çayır'ın **Orman'a en uzak** ucundaki (hilalin batı ucu) güneye bakan kumsaldır (Orman'a ~161 karo).

**Başlangıçta kampın yanına malzeme konmaz:** oyun başlarken kampın hemen yanına önceden fazladan konan 1 dal, 4 taş, 1 lif ve 1 yaprak artık yok; başlangıç bölgesinde yalnızca haritanın normal malzemeleri ve öğreticinin kendi adımlarında koyduğu malzemeler (böğürtlenler, Zümrüt'ün meşale malzemeleri ve 4 taşı) vardır.

| Adım | Kim | Ne yaparsın | Sonuç |
|---|---|---|---|
| 1 | Kemal | Kampın çevresine konan 5 böğürtleni topla (telefonda önce sürükleyerek ve dokunarak yürüme). **Bilgisayarda** Kemal böğürtleni nasıl toplayacağını da söyler: "Böğürtlen çalısının **yanına git** ve **F**'ye bas; böğürtlen yere düşer, üstünden yürüyünce alırsın." (Toplama tuşu değiştirildiyse o tuşu söyler.) | — |
| 2 | Kemal | **5 böğürtlenin beşini de yemek zorunlu:** 1. adımın kartı "5 böğürtlen topla ve beşini de ye" der ve iki sayaç gösterir (**Toplanan x/5 · Yenen y/5**, altında yenenlerin çubuğu); 2. adımın başlığı "Kemal · 5 böğürtlen ye", kartta **Yenen y/5** sayacı ve çubuğu. Yemek düğmesi, çantada böğürtlen olduğu andan beşi de yenene kadar (liste açıkken de) yanıp söner. Yemek düğmesiyle (F) 5 böğürtlen ye (soldaki yemek düğmesi mavi parlar ve ok onu gösterir; yemek listesi açılınca önce üstteki **Meyveler** sekmesi parlar ve ok onu gösterir; Meyveler seçilince Böğürtlen'in **Ye** düğmesi parlar. Kartta da "listeyi açarsan önce Meyveler sekmesini seç" yazar) | Cadı Zümrüt görünür; Kemal seni kuzeye, ormanın kıyısına yollar |
| 3 | Zümrüt | Zümrüt'e git ve konuş | Kazanın yanına 2 Dal, 2 Lif, 2 Yaprak konur |
| 4 | Zümrüt | Kazanda **Kaba meşale** tarifini öğren. Tarif seçilince, malzemeler konana kadar **kazan alanı da mavi parlar**, malzemelerin nereye gideceği görünsün. | Malzemeler yeniden konur (**Zümrüt'ün kazanının yanına**, oyuncu nerede durursa dursun) |
| 5 | Zümrüt | El yapımı ekranında (Tab) meşaleyi yap, **meşale yuvasına** (kemerin solundaki tek yuva; meşale yalnızca oraya takılır) koy ve yuvaya basıp yak. Kart sırayla "Meşaleyi yuvasına koy", "Meşaleyi yak", "Meşaleyi söndür" der; meşale yuvası yanıp söner, yuvaya konunca envanter kendiliğinden kapanır. **Malzemeler (2 dal, 2 lif, 2 yaprak) toplanmadan** el yapımı düğmesi, meşale satırı ve Yap düğmesi **parlamaz**; önce malzemeler toplanır, sonra parlar. Aynı kural kazan adımlarında (4, 7) ve balta adımında (12) da geçerlidir. | Meşale yapılınca Zümrüt yalnızca meşaleyi anlatır (taşlardan söz etmez). Meşale ele gelince Zümrüt **meşaleyi anlatır**: gündüz işe yaramaz, gece içindir; yalnızca eldeyken yanar ve Kaba meşale yaklaşık **110 saniye** yanınca biter (yağmurda daha çabuk); gündüz elinden indir, akşam karanlığında eline al, yedeğin olsun. **Envanter kendiliğinden kapanır:** meşale envanterden alttaki alet yuvasına konunca (öğretici bu adımdayken) envanter yarım saniye sonra kendi kapanır; oyuncu Esc/Kapat'a basmak zorunda kalmaz, kart hemen "yuvaya dokun / tuşa bas" der ve öğretici devam eder. Sonra kart **"Meşaleyi elinden indir"** der, meşalenin yuvası (hotbar kutusu) oku ile parlar; meşale inene kadar taş adımına geçilmez (taşlar ve taş konuşması da meşale inince gelir; üstteki takip satırı da o ana kadar taş istemez, haritadaki taşlar mavi parlamaz) |
| 6 | Zümrüt | 4 taşı topla | Meşale eline girince Zümrüt meşaleyi anlatır (**:** artık "gündüz işe yaramaz" demez; meşalenin bir **silah** da olduğunu, vurduğun canavarı tutuşturduğunu ama her vuruşun meşaleden yediğini söyler; asıl tehlikenin **gece** olduğunu, meşaleyi **geceyi geçirmek** için saklamayı ya da kavgada kullanacaksan bir **yedek** yapmayı tavsiye eder; Kaba meşale "yaklaşık dört dakika" dayanır). Sonra meşaleyi indirmeni ister (kart: "Gündüz meşaleyi boşuna yakma; geceye sakla"). **Meşale elden inene kadar taşlar sayılmaz:** yerden 4 taş toplamış olsan bile adım meşale indirilmeden ilerlemez; öğretici meşale adımı atlanamaz (Nazlı'ya meşalesiz geçilebiliyordu). Meşale inince Zümrüt taşları anlatır ve kazanın yanına 4 Taş konur |
| 7 | Zümrüt | Kazanda **Keskin taş** tarifini öğren (2 Taş). Malzemeler konana kadar kazan alanı mavi parlar. meşale dersinde (adım 4–5) kazanda **yalnızca Kaba meşale** öğrenilebilir; başka tarif denenirse Zümrüt "Önce meşaleyi öğrenelim" der, tarif öğrenilmez. **v3.32 (Boğaç: "yalnızca meşale görevinde meşale yapılabilmeli, o yanmalı sadece"):** ders sürerken başka tarif **seçilemez** bile: kazan açılınca ders tarifi (adım 4: Kaba meşale, adım 7: Keskin taş) kendiliğinden seçili gelir, listedeki öbür tarifler soluk ve basılmaz, kazana yalnızca o tarifin malzemeleri konur; yanıp sönen işaret hep ders tarifinde kalır. El yapımı ekranında da (adım 5: Kaba meşale, adım 8: Keskin taş) yalnızca ders eşyasının **Yap** düğmesi çalışır, öbürleri soluk ve basılmaz. Ders tarifi öğrenilip eşya yapılınca kilit kalkar. **Keskin taş zaten biliniyorsa** (eski kayıtlarda erken öğrenilmiş olabilir) adım 6–8 atlanır: meşale indirilince oyuncuya bir Keskin taş verilir (yoksa) ve öğretici doğrudan Nazlı adımına (9) geçer; tarif ikinci kez öğretilmez. | — |
| 8 | Zümrüt | Kalan 2 taşla elle Keskin taş yap | Zümrüt kuzeydoğudaki Nazlı'yı söyler |
| 9 | Nazlı | Pazarcı Nazlı ile tanış | Pazar "Sat" sekmesiyle açılır |
| 10 | Nazlı | Keskin taşı sat | Nazlı hesabı anlatır: bir Taş 1 sikke, iki taş 2 sikke; birleştirip yapılan Keskin taş 3 sikke, aradaki 1 sikke emeğin; yapılan şeyler yeniden birleştirildikçe değerleri katlanır (taştan keskin taş, keskin taştan alet; her adımda daha çok para eder). Sonra doğudaki Börü'yü söyler |
| 11 | Börü | Börü ile konuş, çıkan **kereviti vur** (yumruk 4 hasar; yazılar "elin boş olsun" demez, yalnızca "vur" der; elde meşale ya da silah varsa onunla vurmak da sayılır, gece meşaleyle gelinebilir). Bilgisayarda dövüş şöyle öğretilir: **WASD ya da yön tuşlarıyla** yürüyüp kerevite yaklaş, **sol tıkla** vur (bu derste sol tık yürütmez, tıklanan yöne yumruk atar; telefonda kerevite dokunulur); ardından **atılma dersi** ve **yetenek ağacı** (aşağıda) | Atılma öğrenilir (ücretsiz); Taş balta, Sopa ve İp tarifleri öğrenilmiş olur; +6 Taş; Börü'nün yanına 3 Dal, 8 Lif, 4 Taş konur |
| 12 | Börü | Balta parçalarını elle yap: 2 Keskin taş → 1 Sopa → 2 Keskin taş → 2 İp (2 Taş da yanında kalsın). Sıradaki parçanın malzemesi tamamsa el ikonu (Tab) parlar; el yapımı ekranında o parçanın (Keskin taş, Sopa ya da İp) **Yap** düğmesi mavi parlar, ok onu gösterir ve liste oraya kayar. **Takip listesi:** ekranın üstündeki "toplanacaklar" listesinde yalnızca **toplanacak malzemeler** görünür (ör. sopa adımında 3 Dal, 2 Keskin taş); yapılacak parçanın kendisi (Sopa, Keskin taş, İp) listede yer almaz. Malzemeler toplanınca parça sol menüdeki el ikonundan (bilgisayarda Tab) yapılır. Yalnızca son adımdaki 2 Taş (toplanan bir malzeme) listede kendisi olarak görünür. | — |
| 13 | Dursun | Parçalar tamamlanınca **Börü** "Şimdi kuzeydeki Demirci Dursun'a git, baltayı o döver, benden selam söyle" der (Dursun'un önceden haberi yoktur). Dursun'a gidince önce **tanışılır** (Dursun kendini tanıtır, "Börü yolladı, selamı var"), sonra parçaları görüp örsü açar. Örste **Taş balta**yı döv (ücretsiz): önce **Hepsini koy**, sonra **Döv** düğmesi sırayla parlar ve okla gösterilir. Sonra baltayı eline al: önce envanter (çanta, I) düğmesi, envanter açılınca **Taş balta**, seçilince boş bir **alet yuvası**, en son alttaki kutusu sırayla parlar ve okla gösterilir. Balta dövüldüğü anda öğretici "baltayı eline al" adımına geçer (Dursun'un penceresi düğmeye basılmadan kapansa bile); bu adımda Dursun'la konuşulursa yeniden balta dövdürmez, malzeme istemez, "baltan zaten dövüldü, eline al" der | Öğretici biter; ok Kemal'i gösterir, Kemal ilk ana görevi verir |

**"Yeni tarif öğrendin" yazısı (v3.32, Boğaç: arkasında siyah bir dikdörtgen yanıp sönüyordu):** ekrana gelen büyük yazıların (yeni tarif, yeni malzeme, almanak, Börü'nün dersi) çerçevesinin çevresindeki geniş sarı parıltı kaldırıldı (ekran kartı o parıltının alanını bazen siyah çiziyordu); yazı yalnızca ince koyu çerçevesiyle görünür. Bir pencere açıkken alttaki yazı büyüyüp küçülmeden yalnızca belirip kaybolur.

**Tuş yazıları:** öğreticideki bütün "…'e bas" yazıları (ör. "Boşluk'a bas!", "Sağ tık'a bas!") en son kullanılan aygıta göre yazılır: klavyede tuşun adı, kolda kolun tuşu (Xbox ya da PlayStation adlarıyla), telefonda dokunma düğmesinin adı; aygıt değişince hemen değişir (Sistemler › Kontroller › Oyun kolu › Tuş yazıları, 7 Kasım 2026, Boğaç).

**Gösterme kuralı:** öğretici bir düğmeye basmanı istediğinde o düğme (sol menüdeki ikonlar, menülerin içindeki Ye/Yap/Hepsini koy/Döv düğmeleri, envanterdeki eşya, alet yuvası) **mavi parlar** (parlama yalnızca büyüyüp küçülür, çevresindeki ışık sabittir; ekranı yormaz; telefonda da büyüyüp küçülür, biraz daha yavaş) ve yanında yanıp sönen bir **ok** olur. Sıra gerekiyorsa düğmeler sırayla parlar. Adım biter bitmez parlama ve ok söner (örneğin 5 böğürtlen yenince yemek düğmesi artık parlamaz). **Sürüklerken de gösterilir:** envanterde bir eşyaya tıklayınca nereye gideceği yanıp sönerek gösterilir; eşyaya basılı tutup sürüklemeye başlayınca da aynı yuva (boş yuva, yoksa ilk yuva) sürükleme boyunca yanıp söner. Örneğin Zümrüt'ün meşale dersinde meşale tıklansa da sürüklense de doğru yuva gösterilir. Bırakınca yanıp sönme biter. **Pencerelerin içinde büyümez (v3.32, Boğaç: kazan alanı büyüyüp küçülünce kaydırma çubukları bir görünüp bir kayboluyordu):** El yapımı, kazan, örs, envanter gibi pencerelerin içinde parlayan şey (kazan alanı, Yap/Hepsini koy düğmesi, tarif satırı, eşya) büyüyüp küçülmez; yalnızca mavi ışığı güçlenip zayıflar. Pencereler dışındaki düğmeler (sol menü, alet kemeri) eskisi gibi hafifçe büyüyüp küçülür.

### Börü'nün atılma dersi (11. adımın içinde)

- **Gizli menüdeki düğme, menü düğmesinden parlar; kemer kutusunda ok yok ("soldaki menü yanmıyor, anca açınca yanıyor", "1'e bastıktan sonra saçma bir mavi yukarı ok var, sadece yanmalı"):** öğretici bir düğmeyi gösterirken (ör. Dursun adımında Envanter) o düğme katlanmış menünün içindeyse, menüyü açan düğme mavi parlar: bilgisayarda kare düğmelerin altındaki ince **Menü** çubuğu, telefonda **☰** düğmesi; menü açılınca parlama içerideki düğmeye geçer. Öğretici alttaki kemerde bir kutuyu gösterdiğinde (balta 1. kutuda, meşaleyi indir) kutu yalnızca **mavi parlar**, üstünde ok çıkmaz.
- **Öğretici sürerken ünlem yok ("gidince zırh işi sonra diyor, o zaman neden ünlem var?"):** ilk öğretici Dursun adımına (13) gelene kadar hiçbir kişinin başında tanışma ünlemi (**!**) yanmaz; bu sırada Durmuş, kuzen demirciler/zırhçılar, terzi ve pazarcı kuzenleri "önce adanın insanlarıyla tanış, sonra gel" der. Öğreticinin göstereceği kişi ok ile gösterilir. 13. adımdan (ya da öğretici atlanınca) sonra tanışılmamış kişilerin ünlemi yine yanar.
- **Yumruk dersinde de ok yok, kerevit yenilenmez:** Börü ile konuşup ilk kerevit çıktıktan sonra, kerevit yenilene kadar Börü'yü gösteren ok çıkmaz. Kerevit henüz ölmemişken Börü'ye gidip konuşursan Börü yalnızca "Kerevit seni bekliyor" der; kerevit **yeniden doğmaz**, canı kaldığı yerden devam eder (yeni kerevit yalnızca ortada canlı ders kereviti yoksa çıkar).
- **Ders sürerken yön oku yok:** ikinci kerevit belirdiği andan ders bitene kadar Börü'nün üstünde ya da ekranda Börü'yü gösteren ok çıkmaz; dikkat kerevitte kalır.
1. Kerevit yumrukla yenilince Börü "Şimdi kaçmayı öğren" der ve yanına **yeni bir kerevit** çıkar. Bu kerevit can yakmaz, ölmez; yalnızca saldırır. Atılma bu derste **ücretsiz** öğrenilir (yetenek ağacında satılmaz).
2. Kerevit doğadaki gibi **yürüyerek** sana yaklaşır (sen uzaklaşırsan peşinden yürür), yakına gelince bir an bekler. **Saldırırken üstünde kırmızı ! belirdiği an sana doğru atılır:** ayrı bir hazırlık beklemesi yoktur; atılış o an **bulunduğun yere** düz bir çizgide gider (biraz ötesine), 0,45 sn sürer ve **yolu sonradan değişmez**. Saldırıdan sonra olduğu yerde kalır ve yeniden yürüyerek yaklaşır; hiçbir zaman başka bir yere ışınlanmaz.
3. **İlk saldırıda** kerevit ! ile hazırlanır ve sana doğru atılır; **sana değmek üzereyken** (aranızda ~1,5 karo kala) **oyun durur** ve ekranın ortasında büyük harflerle "**Boşluk'a bas!**" (telefonda "**Atıl düğmesine dokun!**") yazar. Basınca oyun devam eder, karakter takla atar ve kereviti savuşturur ("Sıyrıldın!"). **Bu ilk saldırıda oyun durmadan önce Boşluk'a basmak takla attırmaz;** takla yalnızca oyun durup "Boşluk'a bas!" dedikten sonra atılır. İlk saldırı bitene kadar **karakter yürüyemez** (WASD, oklar, tıklama, telefon kolu çalışmaz); ekranda "Kımıldama: kerevit saldıracak" yazar. Amaç yalnızca saldırıyı beklemek ve tam değeceği anda Boşluk ile kaçmayı öğrenmek.
4. Sonra kerevit **3 kez daha** saldırır; oyun artık durmaz, yürümek ve takla serbesttir. **Kaçarsan başarılı, değerse başarısız:** ! görünüp kerevit atıldığında takla at. Kerevit sana değmeden yolundan çıkarsan ya da değdiği an hâlâ taklanın içindeysen "**Sıyrıldın!**". Takla, atılış başlamadan en çok 0,15 sn önce basılmış olmalı; daha önce attıysan takla biter ve kerevit değer: "**Erken!**". Hiç takla atmadan değerse "**Değdi!**", değmeden atılış biter ama takla atmadıysan "**Kaçmadın!**". Yön tuşuna basmadan atılan takla bu derste kerevitin yolundan **yana** gider. Can gitmez. Ekranda "Sıyrılma: 1/4" sayacı vardır.
5. **Savuşturma dersi:** 4 sıyrılma (1 + 3) olunca Börü "Şimdi **savuşturmayı** öğren" der; aynı kerevit kalır, sayaç "Savuşturma: 0/4" olur. Börü'nün bu sözü "Hazırım"a basılmadan kapanırsa (boşluğa tıklama, Esc) ders yine başlar; kerevit oyuncunun yanında donup kalmaz. Dersin kereviti **hasar almaz ve ölmez** (vurulmaz, hedef seçilmez); bir yolla kaybolursa yeniden çıkar. Yapı takla dersiyle aynıdır:
   - **İlk saldırıda** karakter yürüyemez; kerevit ! ile atılır, sana değmek üzereyken **oyun durur** ve "**Sağ tık'a bas!**" (klavyede E; telefonda "**Savuş düğmesine dokun!**") yazar. Ondan önce basmak savuşturmaz. Basınca kerevit savuşturulur ("Savuşturuldu!"). **Telefonda:** savuşturma dersi başladığı andan itibaren **Savuş** düğmesi (Atıl düğmesinin solunda) görünür; oyun durup "Savuş düğmesine dokun!" dediğinde düğme mavi parlar ve ok onu gösterir. (Önceden düğme ancak ilk savuşturmadan sonra çıkıyordu; telefonda ders ilk adımda takılıyordu.)
   - Sonra **3 kez daha**: yürümek serbest, kerevit ! ile atılır; değdiği an savuşturma penceresi (0,2 sn) açıksa sayılır. Çok erken basarsan pencere kapanır: "**Erken!**"; hiç basmazsan "**Değdi!**"; takla atarsan "**Takla değil, savuştur!**". Can gitmez.
   - 4 savuşturma olunca savuşturma ve gard kalıcı açılır.
6. 4 savuşturma olunca Börü esprili bir dille "**İlk ders tamam!**" der: her kavgaya girmek akıllıca değildir, bazen tabanları yağlamak gerekir; bunun için hızlı koşmayı bilmek gerekir.
7. **Yetenek ağacı zorunlu:** Börü'nün tek seçeneği "Yetenek ağacını aç"tır. Ders biter bitmez soldaki ağaç ikonu (Y) mavi parlar, ok onu gösterir ve ekranın ortasında "Yetenek ağacını aç" yazar; Börü'nün üstündeki ok kalkar. Konuşma penceresi kapansa da bu sürer; ağaç açılmadan Börü'yle konuşulursa Börü yalnızca "önce yetenek ağacını aç" der, dersi ya da kereviti **tekrar vermez**. Ağaç açılana kadar öğretici ilerlemez. Ağaç açılınca Savaş ağacındaki **Koşu** yanıp söner ve üstte Börü'nün notu çıkar: ağaçlar aşağıdan yukarı büyür; Koşu 100 sikke; Nazlı'ya bir şeyler satıp **100 sikke biriktirip** ilk iş bunu almak akıllıca olur.
   - Ağaç açılınca Savaş ağacındaki **Koşu** mavi parlar ve yanında yanıp sönen bir ok olur.
   - **Koşu tam görünür:** ağaç açılınca Koşu kesilmeden, alt kenarın biraz üstünde görünür (altında boşluk kalır). Ağacın üstünde ve altında her zaman biraz pay vardır; en üstteki ve en alttaki yetenekler kenara yapışmaz. Börü'nün notu ağacı aşağı itip Koşu ekranın dışına kayarsa pencere kendiliğinden kayar, Koşu kenarın biraz üstüne gelir.
   - **Sikke yetmezken Koşu'ya basılırsa:** satın alma olmaz, yetenek ağacı **kendiliğinden kapanır** ve Börü konuşma penceresinde söyler: "Önce sikke topla evlat! Koşu 100 sikke; sende X var, Y sikke daha lazım. Nazlı'nın pazarında bir şeyler sat. 100 sikken olunca **Y**'ye bas (telefonda yanıp sönen ağaç ikonuna dokun), yetenek ağacını aç: oradan istediğin geliştirmeleri alırsın. İlk işin Koşu olsun." ("Anladım" düğmesi). Bu, ders sırasında da sonradan da (Koşu alınana kadar) böyledir; ders sırasındaysa bu konuşma 8. maddedeki konuşmanın yerine geçer ve "Anladım"dan sonra öğretici sürer.
8. Ağaç kapatılınca Börü önce **bilgilendirir** ("Anladım" düğmesi). 100 sikken yoksa ne kadar eksik olduğunu söyler, Nazlı'ya bir şeyler satıp sikke toplamanı, **100 sikken olunca Y'ye basıp** (telefonda ağaç ikonuna dokunup) yetenek ağacını açmanı ve oradan istediğin geliştirmeleri almanı söyler, ilk iş Koşu olsun der. 100 sikken varsa: "Gördün mü, en alttaki parlayan Koşu. Onu almak 100 sikke ister; Y'ye bas, ağacı aç, oradan istediğin geliştirmeleri alırsın." Sonra öğretici kaldığı yerden sürer: Börü Taş balta tarifini verir (12. adım).

**Ders sırasında ayrılmak:** atılma ve savuşturma dersi (kerevit dersi) öğreticinin parçasıdır; öğreticiyi oynayan oyuncu ders bitene kadar Börü'nün yanından ayrılamaz. **"Eğitimi geç" seçilmişse** ders oyuncuyu kilitlemez: Börü'den uzaklaşınca (~280 piksel) ders sessizce biter, öğrenilmemiş kısım (atılma ya da savuşturma) öğrenilmemiş kalır ve aşağıdaki kurala göre Börü'yle yeniden konuşunca ücretsiz alınabilir.

Öğreticiyi geçen ve atılmayı bilmeyen biri sonradan Börü'yle konuşursa Börü aynı dersi ücretsiz teklif eder ("Öğret" / "Sonra"). Atılmayı bilip savuşturmayı bilmeyen biri konuşursa Börü yalnızca **savuşturma dersini** (1 + 3) ücretsiz teklif eder.

### Öğreticiden sonraki kısa dersler

Kartın altında kısa dersler çıkar: **koşma dersi** (Kemal'in köprü görevi bitince; Koşu 100 sikke, Koşu zaten alındıysa çıkmaz), **meşale dersi** (2. ve 3. gün 17:30). Meşale dersinin ikinci adımı: meşaleyi **meşale yuvasına** koy, sonra yuvaya basıp yak; yuva yanıp söner. İlk gece meşalesi olmayana biri bir Kaba meşale fırlatır (bir kez).

## ACT 1 yol haritası

ACT 1 tek görevlik bir zincirle ilerler (ayrıntı: **ACT 1 › Ana görevler**). Kemal'in yalnızca ana yolda 5 görevi vardır; gerisi adadaki 26 kişiye dağılmıştır ve birbirini açar.

1. **Çayır:** Kemal'in ilk işi (6 dal, 2 kuru ot) → Dursun aletleri öğretir (taş balta, kazma, çakmaktaşı balta, bileme, tunç) → Nazlı meyve, balık, satış ve tuzak, Börü kamp ateşi, dövüş ve taş kılıç, Durmuş kemik, kiriş, tunç levha, Zümrüt otlar ve kazan. Börü oyuncuyu **Orman**'a yollar (Ekin ile tanışma).
2. **Orman:** Sinan'ın yapıları, kuzenler Yakut, Durdu, Duran. Kemal'in **köprü** görevi Seviye 6'da açılır (Ekin ve tarlası şimdilik yok).
3. **Köprünün ötesi:** Bataklık'ta Doğan ve kuzenler Safir, Ali (demir), Veli. Doğan'ın son işi oyuncuyu **Kayalık Dağ**'a götürür (Firuze, Kaya, Kayhan).
4. **Doğu geçidi:** Kayalık Dağ'a varınca ve Seviye 10'da Kemal'in **patlatma** görevi: 2 kaya patlatıcı + kuvars ya da çelik kazma (4. kademe); patlayınca bütün sıradağ çöker ("Yol açıcı" başarımı).
5. **Kül Diyarı:** Mercan, Turan, Tufan. Kül Diyarı'na varınca Kemal'in **izler** görevi: 6 mor iz; bitince **Gemi** tarifi kitaba yazılır, Barbaros'un enkazı Mor Kristal Vadisi kıyısına çarpar. Kemal'in son işi: Barbaros'u bul.
6. **Mor Kristal Vadisi:** Barbaros'un 5 görevi (pusula için kristal, Kudret'in obsidyen kazmasını ister) ve son olarak **gemi malzemeleri** enkaza (8 kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek). Gemi ("Meltem") yapılınca Barbaros kızının hikâyesini anlatır ve "Götür beni" deyince önce ACT 1'in son anısı, **evlenme teklifi** ("Çay kıyısında söz") oynar, sonra deniz yolculuğu başlar → **ACT 2**. İnci, Kudret, Kuvvet de buradadır.

> **Kuzenler:** Orman'dan Mor Kristal Vadisi'ne her biyomda Zümrüt, Dursun ve Durmuş'un birer kuzeni yaşar (cadı, silahçı, zırhçı). Her biri o biyomun malzemesiyle yapılan eşyaları döver ya da tarifleri öğretir ve 5'er görev verir. Zümrüt, Dursun, Durmuş ve 15 kuzenin bütün görevleri bitince ortak ara sahne oynar: mor ışık ninelerini, **Elmas Nine**'yi kaçırmıştır.

> Yıldız'ın "Portal çekirdeği" görevi **2 Kristal ve 2 Demir levha** ister ve bunlar yalnızca birinci adada bulunur (2 Mor kıymık ikinci adanın gecelerinde de çıkar). ikinci adaya bir kez varınca **Barbaros'un yanındaki portal** (ACT 2) ve **Kemal'in yanındaki portal** (ACT 1) hep açıktır; eksik malzemeyi almak için birinci adaya dönebilirsin.

## ACT 2 yol haritası

ACT 2 bölümündeki "ACT 2'nin akışı"na bak: Yıldız (portallar) → Efsun (asa) → Tufan (tabanca) → Işın (meka zırh) → Tomris (ışın kılıcı) → Gökay (roket) → fırlatma → kavuşma ve son kartı. Bütün ACT 2 ustaları varıştan itibaren yerindedir; sıra yalnızca ok ve görev kartıyla yönlendirilir, istersen sırayı bozabilirsin.

## Gezginler ve takvim

| Kim | Ne zaman | Ne yapar |
|---|---|---|
| Yıldızsız Gezgin | 5. gün | Bir robot köpek hediye eder (köpek seçtiğin malzemeyi senin için toplar). |
| Yıldızsız Gezgin | 20. gün | **Mor sinyal** verir: köpekler menüsünden sikkeyle köpek ısmarlanır. Fiyat 500 × 1,6^(sahip olunan köpek), 10'a yuvarlanır: 800 → 1.280 → 2.050 → 3.280. En çok 5 köpek. |
| Gemici Poyraz | Olta yaptıktan sonraki ilk sabah 06:00 | Kemal'den uzak bir kıyıya teknesiyle çarpar; Poyraz'ın üstünde **!** yazar ve parlar (haritada da aynı işaret). 4 görevle teknesi onarılınca seni denize, 6 balık bölgesine götürür. Ayrıntı: "ACT 1 › Gemici Poyraz ve deniz". |
| Yıldızsız Işıkçı | 15. günden sonra her akşam 18:00–05:30 | Yurtta sabit bir yerde (haritada mavi nokta). 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi karşılığında **Kafa lambası** verir, sonra bir daha gelmez. |


# Sistemler

## Kontroller

| Tuş (bilgisayar) | Ne yapar | Telefonda |
|---|---|---|
| WASD / oklar | Yürü | Kanvası sürükle (görünmez joystick) ya da gideceğin yere dokun |
| Shift | Koş (Koşu yeteneği gerekir) | Çift dokunuş |
| F | Topla, konuş, kapı, yatak, ağacı silkele. F yalnızca **hemen yanındaki** şeye yönelir: karakterin bir kare çevresi, çaprazlar dahil (en çok ~30 px; iki kare ötedekine gitmez, o zaman hiçbir şey yapmaz). Ağaca yalnızca **elde balta varken**, madene/kayaya yalnızca **elde kazma varken** gider (çantada olması yetmez). Sol tıkla elde baltasızken bir ağaca, elde kazmasızken bir madene tıklamak oraya yürütmez, yalnızca o yöne vurur. Elde balta varsa önce ağaç, elde kazma varsa önce maden seçilir; yoksa en yakın toplanacak şey (çalı, yerdeki taş/dal, meyvesi olgun ağaç). Ayağının dibindeki düşmüş eşyalar ve yerdeki toplanabilir her zaman önce alınır; kişi, kapı ve öbür etkileşimler ancak yerde alınacak bir şey yokken seçilir (7 Kasım 2026, Boğaç: "Önce yerdeki envanter olmalı") | Nesneye dokun |
| Q / sol tık | Vur. **Sol tık her zaman tıklanan yöne vurur**, tam tıklanan açıya (çaprazlar dahil; karakter 8 yönlü pozla o yana döner); el boşken yumruk, elde silah/alet varsa onunla. Bir kişiye, kazana/örse/pazara, kurulmuş bir eşyaya ya da toplanacak bir şeye (çalı, maden, ağaç) tıklamak oraya gidip konuşur/toplar. **Yere düşmüş bir eşyaya** (av, odun, taş) tıklamak oraya yürür ve eşya toplanır; üstünde bir hayvan varsa önce ona vurulur. **Bir hayvan sana saldırırken** (ekranda seni kovalayan bir hayvan varsa ya da son 3 saniyede ısırıldıysan) sol tık hiçbir şeyi toplamaz, kimseyle konuşmaz, yere düşene yürümez: **her zaman tıklanan yöne vurur**. F tuşu ve telefondaki düğmeler bundan etkilenmez; onlarla toplamak sürer. Boş yere tıklamak karakteri yürütmez; yürümek WASD/oklarla |
| Boşluk | Atıl / takla (Börü'nün atılma dersinden sonra); yerleştirirken döndür | **Atıl** düğmesi |
| Sağ tık / E | Savuştur (bas) · savunma duruşu, gard (basılı tut); E sağ tıkla aynıdır | **Savuş** düğmesi |
| R | Ulti (çubuk doluyken); değilse robot köpekler menüsü (arenada R yalnızca ulti) | **Ulti** düğmesi (yalnızca ulti atar, köpek menüsünü açmaz) |
| X | En uygun yemeği ye (basılı tut: yemek listesi) | Tabak simgesi |
| H | Eli boşalt (meyve silkelemek için) | El düğmesi |
| 1–0 | Alet yuvasındaki aleti ele al | Alttaki kutuya dokun |
| Yuvaya sağ tık | **Yuvadaki eşyayı değiştir:** oyun sırasında, envanteri açmadan; kemerin üstünde taşınabilir eşyalarının listesi açılır, birini seçince o yuvaya girer (başka yuvadaysa yer değiştirir); "Yuvayı boşalt" de var. Esc ya da dışarı tıklamak kapatır | Yuvaya **basılı tut** (0,5 sn) |
| Tab | El yapımı | El simgesi |
| K | Tarif kitabı | Sağ alttaki kitap simgesi. **Kazan, Demirci ve Pazar'ın kısayolu ve düğmesi yoktur:** oraya gidip kişiye ya da kazana dokunarak açılır |
| I / C / Y / G | Envanter / Karakter (giyim, istatistik) / Yetenekler / Görevler | Menü simgeleri |

**Telefonda Görevler ("telefonda görevleri açamadım"):** telefonda ☰ içindeki **Görevler** düğmesi her zaman Görevler panelini açar (eskiden bir ders sürerken yalnızca ders kartını katlayıp açıyordu, panel açılmıyordu). Ders sürerken panelin en üstünde **Ders** kartı (dersin adı ve ne yapılacağı) yazar.

| M / N | Büyük harita / bulunduğun yere işaret koy | Küçük haritaya dokun |
| V | Kamp ateşi kur | – |
| L | Elindeki meşaleye reçine sür | – |
| O / Esc | Ayarlar / duraklat | Çark simgesi |

- **Vuruş tamponu:** bir vuruş bitmeden (bekleme süresi dolmadan) yeniden vurursan (sol tık ya da Q) basış kaybolmaz: bekleme bitince (basıştan en çok 0,8 sn sonrasına kadar) **son bastığın yöne** vurulur. Karakter yalnızca vuruş gerçekten atılırken o yöne döner (önceden bekleme sırasında tıklanınca karakter dönüyor ama vurmuyordu).

- **Alt + Enter tam ekran:** bilgisayarda Alt + Enter (sol Alt ya da **Alt Gr**; v3.25, Boğaç: Alt Gr ile çalışmıyordu) oyunu tam ekrana alır, yeniden basınca tam ekrandan çıkar (Esc de çıkarır). Her ekranda çalışır (ana menü, oyun, pencereler); o tuşa basış başka bir şey yapmaz (Enter bir pencereyi onaylamaz). Atanamayan sabit bir kısayoldur.
- **Tam ekran açılışta geri gelir (v3.39, Boğaç: "F5 ile yenilediğimde ya da oyunu açtığımda tam ekran olsun"):** bilgisayarda oyun tam ekrandayken sayfa yenilenir (F5, Ctrl+R) ya da kapanıp yeniden açılırsa, oyun **ilk tıklamada ya da ilk tuşa basışta kendiliğinden** yeniden tam ekrana geçer (ana menüdeki ilk tıklama dahil). Tarayıcılar sayfa açılır açılmaz, oyuncu hiçbir şeye basmadan tam ekrana geçmeye izin vermez; bu yüzden geçiş ilk dokunuşla olur. Yenileme ya da kapanma tam ekranı "kapattım" diye saymaz; tam ekran yalnızca oyuncu kendisi çıkınca (Alt + Enter, Esc ya da Ayarlar'daki Tam ekran kutusu) kapalı hatırlanır ve o zaman açılışta tam ekrana geçilmez. Seçim bu tarayıcıda saklanır (oyuncunun kendi seçimi).
- Bütün tuşlar **Ayarlar → Kontroller**'den yeniden atanabilir. Telefondaki dövüş düğmelerinin yeri ve boyutu (%60–200) aynı yerden ayarlanır.
- F (toplama tuşu) hiç vurmaz; yalnızca toplar ve konuşur. Diyaloglarda, anılarda ve balık tutarken de F ilerletir (E artık gard tuşu). Hile tuşu "+100 XP" X'ten J'ye geçti. Tuşlar değişse de oyundaki bütün yazılar yeni tuşları gösterir; fareyle bir şeyin üstüne gelince çıkan ipucu da ("F ile topla", "F ile konuş", "sol tık ya da Q ile vur"). Ayarlar → Kontroller → "Varsayılana dön" bu yeni tuşlara döner.
- **Karakterin 8 yönü (çapraz pozlar):** karakter yürüdüğü yöne göre 8 pozdan birine döner: **ön** (aşağı), **arka** (yukarı), **sağ/sol profil** (yalnızca tam yana yürürken) ve dört **çapraz** poz; çaprazda karakter bütünüyle döner. **Ön-çapraz** (sağ-aşağı / sol-aşağı): yüz hafif yana dönük (karakter yaratma ekranındaki gibi); gövde gidilen yöne 1 piksel kayar, uzak yanı 2 sütun gölgededir, yaka o yana döner; yalnızca yakın kol görünür (uzak kol hiç çizilmez); bacaklar birbirine yakın, gidilen yandaki ayak bir adım yukarıda, ayak uçları gidilen yöne bakar. **Arka-çapraz** (sağ-yukarı / sol-yukarı): başın yalnızca arkası (saç) görünür, yanak/kulak/göz yok, baş **normal boyda**; sırt dönük çizilir: yakın yan gölgede, ortada sırt çizgisi; yalnızca yakın kol görünür; **ayaklar ön-çaprazdaki çizimle aynıdır** (gidilen yandaki ayak bir adım yukarıda, ayak uçları o yana). Elde alet varsa kol gidilen yöne uzanır. Yön hareketin açısından seçilir: yatay ve dikey bileşenin ikisi de yeterince büyükse (yaklaşık 22°–68° arası) çapraz poz. Durunca son poz kalır; vururken, toplarken ya da biriyle konuşurken karakter o işe dönük 4 yönlü poza geçer. Karakter yaratma ekranında sürükleyerek çevirince aynı 8 poz görülür (Boğaç, 29 Ekim 2026).
- **Telefonda sol menü kutusu:** sol üstteki ☰ düğmesi menü kutusunu açar; **Envanter (çanta)** ve **Yemek** düğmeleri de bu kutunun içindedir (önceden ☰'ün yanında dışarıda dururlardı). Öğretici bu düğmelerden birini gösterdiğinde (parladığında) kutu bir kez kendiliğinden açılır ve ☰ parlar.
- **Telefonda Vur düğmesi yürüdüğün yöne vurur:** sol taraftaki görünmez joystick'le yürürken **Vur**'a basınca karakter tam yürüdüğün yöne vurur; **çapraz** yürüyorsan çapraza vurur (karakter 8 yönlü pozla o yana döner). Yakında bir canlı varsa yine ona kilitlenir, ama önce yürüdüğün yöndekini seçer. Dururken basınca son baktığın yöne vurur (eskisi gibi). **Yakında düşman varsa ona vurur:** telefonda yakın dövüşte (yumruk, meşale, kılıç, mızrak, balta, kazma…) **Vur**'a basınca çevrende (150 piksel içinde) seni kovalayan ya da saldırgan bir canavar varsa, yürüdüğün ya da baktığın yön ne olursa olsun karakter **en yakın düşmana döner ve ona vurur** (tam açıyla, çaprazlar dahil). Birden çok düşman varsa en yakını, eşit yakınlıkta önündeki seçilir. Yakında düşman yoksa eskisi gibidir: 110 piksel içindeki zararsız bir hayvana (önündekine öncelik) ya da yürüdüğün/baktığın yöne vurur. Uzaktan silahlarda (asa, tüfek) hedef seçimi değişmedi (240 piksel).
- Telefon yatay oynanır; dikey tutulunca "Telefonunu yan çevir" ekranı çıkar ("Yine de dikey oyna" ile geçilebilir).

- **Fare imleci (v3.32, Boğaç: "normal mouse imleci gibi olmasın"):** bilgisayarda (fareyle) imleç oyunun piksel tarzındadır: her yerde koyu kenarlı **krem rengi piksel ok**; basılabilen şeylerin (düğmeler, sekmeler, eşya kutuları, alet yuvaları) üstünde aynı ok **mor** olur; oyun sahnesinin üstünde (oynarken) **mor piksel nişangâh** (artı, ortası krem nokta). Yazı kutularında yazı imleci kalır. Ana menüde sahnenin üstünde de ok görünür. Dokunmatik ekranlarda imleç yoktur.

### Oyun kolu

Oyun bir **oyun kolu** ile de oynanır (Xbox, PlayStation ve çoğu Bluetooth kol; tarayıcının standart kol düzeni). Kol bağlanınca bir bildirim çıkar ve **Ayarlar → Kontroller** penceresinde kol düzeni yazar. Kol, oyuna klavyenin **varsayılan** tuşlarına basıyormuş gibi davranır; bu yüzden tuşları değiştirmek kolu etkilemez. **Klavyeyle yapılabilen her şey kolla da yapılır** (7 Kasım 2026, Boğaç: "Kolla her şeyi yapabilmek istiyorum"; arena, deniz ekranı, balık tutma, anılar dahil).

| Kol | Oyunda | Klavyedeki karşılığı |
|---|---|---|
| Sol çubuk | Yürü (8 yön) | WASD |
| L3 (sol çubuğa bas) | Koş: basınca çubuk bırakılana kadar koşar | Shift |
| A (PlayStation: ✕) | Topla / konuş / kullan | F |
| X (PS: □) ya da RT (R2) | Vur, **nişan yardımıyla** (v3.25, aşağıda) | Q / sol tık |
| B (PS: ○) | Atıl / takla | Boşluk |
| Y (PS: △) | En uygun yemeği ye (basılı tut: yemek listesi) | X |
| LT (L2), basılı tut | Savuştur / gard | E |
| Sağ çubuk (v3.32, Boğaç) | **Nişan:** sol çubukla yürürken sağ çubuğu hangi yöne çevirirsen karakter o yöne döner ve vuruşlar, oklar, asa ve ateşli silah atışları o yöne gider (nişan yardımı yalnızca o yöndeki canlıları seçer). Bırakınca nişan yürüdüğün yöne döner. | fare imleci |
| R3 (sağ çubuğa bas) | Ulti (robot köpekler Kol menüsünde: "Köpekleri çağır"; klavyede tuşu aynı) | R |
| LB / RB (L1 / R1) | Alet kemerinde önceki / sonraki **dolu** yuva; boş yuvaları atlar, boş el ve **meşale yuvası** da birer durak (7 Kasım 2026, Boğaç); meşale elindeyken **X'e kısa basmak vurur** (X ya da RT vurur kuralı aynen), **X'i basılı tutmak (~0,4 sn)** meşaleyi yakar/söndürür; pencere içinde LB/RB sekme değiştirir (arenada RB silahı elden alıyordu; arenada boş el durağı yok) | fare tekerleği |
| Yön tuşları | Yukarı El yapımı · aşağı Envanter · sol Tarif kitabı · sağ Görevler | Tab · I · K · G |
| Select / Back (PS: Paylaş) | Büyük harita; **basılı tut:** arayüz odak kipi (ekrandaki düğmeler arasında gezinme) | M |
| Start / Menu (PS: Options) | Duraklat ve **Kol menüsü**nü aç (aşağıda) | Esc |

- **Pencerelerde ve menülerde** (ana menü, karakter yaratma, konuşma, envanter, ayarlar…) sol çubuk ya da yön tuşları seçili düğmeyi o yöndeki düğmeye taşır (basılı tutunca tekrarlar). Önce **aynı satırdaki** (sağ/sol) ya da **aynı sütundaki** (yukarı/aşağı) en yakın düğmeye gidilir; orada düğme yoksa o yöne bakan 45°lik açı içindeki en yakın düğmeye; o da yoksa seçim yerinde kalır (yiyecek listesinde sağdaki "Ye"den sola basınca yukarıdaki sekmeye çıkıyordu). seçili düğme mavi bir çerçeveyle görünür. **A** seçili düğmeye basar (seçili düğme yoksa F'ye basılmış gibi ilerletir: anılar, balık tutma), **B** Esc gibi kapatır/geri döner, kaydırıcıda sol/sağ değeri değiştirir. **Nişan yardımı (v3.25, Boğaç: "vuruşlar gittiğim yöne vurmuyor; yakında biri varsa telefondaki gibi otomatik ona vursun"):** yalnızca kolla vururken; fareyle oynarken yoktur. Vur'a basınca vuruş şuraya gider: (1) yakın dövüşte 150 piksel içindeki **saldırgan** bir canlıya (seni kovalayan, saldıran, saldırgan huylu ya da reis; çubuğun yönüne en yakın olan seçilir), (2) yoksa önündeki en yakın canlıya (yakın dövüşte 110, yay, asa ve tabancada 240 piksel; çubuğun yönüne bakanlar önce), (3) hiçbiri yoksa **sol çubuğun gösterdiği yöne**, çubuk bırakılmışsa baktığın yöne. Karakter vurduğu yöne döner. Vuruş fareyle tıklamanın aynısıdır: basılı tutmak ağır vuruş, art arda basmak kombo, yayda ok o noktaya gider. Bu kurallar telefondaki Vur düğmesiyle aynıdır. **Seçim yerinde kalır (v3.25, Boğaç: böğürtlen yerken her seferinde aşağı inmek gerekiyordu):** bir düğmeye A ile basınca pencere yeniden çizilse de (ör. yiyecek listesinde "Ye") seçim aynı düğmede ya da o düğme gittiyse onun yerindeki en yakın düğmede kalır. **Ad yazmak (v3.25, Boğaç: A rastgele ad veriyordu):** ad kutusundayken A **ekran klavyesini** açar (Türkçe harfler, Boşluk, Sil, Tamam; ilk harf ve boşluktan sonraki harf büyük, gerisi küçük yazılır). Klavyede çubuk ya da yön tuşlarıyla gez, **A** harfi yazar, **X** siler, **B** klavyeyi kapatıp ad kutusuna döner, **Start** ya da **Tamam** klavyeyi kapatıp seçimi ekranın Tamam düğmesine taşır. Rastgele ad için ekrandaki "Rastgele" düğmesine A ile basılır.
- **Pencere açılınca ilk kullanılabilir şey seçili gelir (v3.32, Boğaç):** kolla bir pencere açılınca (ya da pencerenin bir sekmesine geçilince) seçim kapatma düğmesinde ya da sekmelerde değil, **listedeki ilk kullanılabilir şeyde** başlar: kazanda/örste ilk tarif, El yapımı'nda yapılabilen ilk eşya, yemekte ilk yenilebilir şey (Ye düğmesi), envanterde ilk eşya; başka pencerelerde içerikteki ilk düğme.
- **Tuş yazıları son kullanılan aygıta göre (7 Kasım 2026, Boğaç):** öğretici kartları, istemler ("F Taş topla"), ders kartları, yetenek açıklamaları, ipuçları ve ekrandaki bütün tuş yazıları **en son kullanılan giriş aygıtına** göre yazılır ve aygıt değişince **hemen** değişir. Kol yazıları kolun ilk girdisiyle başlar, klavye ya da farenin ilk girdisiyle biter; kol bağlı ama dokunulmamışsa klavye yazıları kalır; çubuğun ölü bölge içindeki titremesi geçiş sayılmaz:
  - **Klavye/fare:** klavye tuşu (ayarlardaki atamaya göre; ör. "F'ye bas", "sol tık").
  - **Kol:** kolun tuşu (ör. "A'ya bas"). Kolun türü adından anlaşılır: **Xbox** → A/B/X/Y, LB/RB, LT/RT, Start, View (Select); **PlayStation/DualSense** → ✕/○/□/△, L1/R1, L2/R2, Options, Create. Tür bilinmiyorsa Xbox adları kullanılır.
  - **Telefon/tablet (dokunma):** dokunma düğmesinin adı (ör. "Atıl düğmesine dokun").
- Kol klavye ya da fare kullanılınca susmaz; ikisi birlikte kullanılabilir. Kol ayrılınca basılı kalan tuşlar bırakılır.
- **Titreşim:** hasar alınca kol titrer (alınan hasarla güçlenir); titreşimi desteklemeyen kolda bir şey olmaz.
- Kol yalnızca bağlıyken okunur: kol yokken oyuna hiçbir yük eklenmez.
- **Kol kopuyorsa (v3.26, Boğaç'ın denemesi):** Xbox kolu **Xbox kablosuz aparatıyla** bağlıyken Chrome ve Edge'de (masaüstü uygulaması da Chrome/Edge'dir) tarayıcı kolu okumaya başladığı an bağlantı kopabiliyor; bu oyundan değil, aparat ile Chrome/Edge arasındaki uyumsuzluktan (kolu okuyan her sayfada oluyor, ör. hardwaretester.com). **Firefox'ta sorun yok**; kabloyla bağlamak da çözer. Kalıcı çözüm tarayıcı dışı sürüm (bkz. Platformlar › Godot'ya geçiş). Oyunun içinde bu konuda bir yazı yoktur (v3.27, Boğaç: oyuncuya adım adım iş yaptırılmaz).
- **Hile kodu:** ana menüde ve açılış ekranlarında (yükleme, zorluk, karakter yaratma, ayarlar) Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A hile ayarlarını açar/kapatır (Sistemler › Arena, hileler, kayıt › Hileler). **Kod girerken odak serbestçe gezer (7 Kasım 2026, Boğaç; önceki "kod girerken menü oynamaz" kuralının yerine):** yön basışları seçili düğmeyi her zamanki gibi taşır; yalnızca kodun son **B** ve **A** basışları yutulur (hiçbir düğmeye basmaz, geri dönmez); kod tamamlanınca seçim kodun başladığı düğmeye döner. Kod bozulursa (başka bir tuş ya da 2 sn ara) menü normal çalışır.
- **Çıkış kolla onay ister (7 Kasım 2026, Boğaç):** kolla A hiçbir zaman doğrudan **Çıkış**'ı çalıştırmaz; Çıkış kolla seçilince "Çıkılsın mı?" onayı sorulur.
- **Menüde çubuk eşiği:** pencerelerde ve menülerde sol çubuğun **yarım itişi** (~%40) seçimi taşır; çubuk eşiğin biraz altına inmeden ikinci adım atılmaz (histerezis), böylece titreme seçimi zıplatmaz.
- **Standart olmayan kol düzeni:** tarayıcının standart düzeninde görünmeyen kollarda yön tuşları (D-pad) eksenden okunur.
- **Kol menüsü (7 Kasım 2026, Boğaç: "kola özel menü koy, tuşları ayarla, ne gerekiyorsa"):** oyun içinde **Start** (PS: Options) oyunu duraklatır ve Kol menüsünü açar; kolla bütün pencerelere ve eylemlere giden **asıl yol** budur.
  - Dikey liste: **Devam** (duraklatmayı kapatır; Start'ın eski işi ilk satırdadır), Çanta, El yapımı, Karakter, Yetenekler, Kitap/Almanak, Görevler, Harita, Döşe (yalnızca evdeyken), Binek, Köpekleri çağır, Meşaleye reçine sür (elde meşale varken), Kaydet, Ayarlar, Ana menü.
  - Yukarı/aşağı (yön tuşları ya da sol çubuk) seçer, **A** açar, **B** kapatır/geri döner; Start yeniden basılınca menü kapanır, oyun sürer.
  - Açılan pencerelerde her zamanki odak gezinimi geçerlidir; **LB/RB** sekme, **LT/RT** pencere değiştirir (oyun içinde LT savuşturma olarak kalır).
  - Oyun içi hızlı tuşlar (vur, atıl, savuştur, topla, meşale, LB/RB, yön tuşu kısayolları) aynen kalır; Select basılı tutunca açılan arayüz odak kipi de kalır, ama asıl yol Kol menüsüdür.
- **Kolla her şey yapılır (7 Kasım 2026, Boğaç):** klavye ve fareyle yapılan her iş kolla da yapılır:
  - **Eşya/mobilya yerleştirme** (yapılar, Döşe kipinde ev eşyası): yerleştirilecek eşyanın hayaleti oyuncuyu izler; **sağ çubuk ya da yön tuşları** hayaleti kare kare kaydırır, **A** koyar, **Y** döndürür, **B** vazgeçer (B döndürmez). **Konmuş eşyayı geri almak:** üstündeyken **A basılı tut**.
  - **Döşe kipi:** eşya şeridinde yön tuşları/çubuk gezer, **A** eşyayı seçer, **X** odadaki imlece geçer; imleci yön tuşları/çubuk taşır, **A** koyar (konmuş eşyanın üstündeyse Taşı / Geri al / Döndür menüsünü açar), **Y** döndürür, **B** seçili eşyayı bırakır; şeritteyken **B** = Bitti.
  - **Meşale:** LB/RB döngüsünde meşale yuvası da bir duraktır; seçiliyken **X'e kısa basmak vurur** (yanan meşale vurduğunu tutuşturur), **X'i basılı tutmak (~0,4 sn)** meşaleyi yakar/söndürür; A etkileşim olarak kalır, Y hızlı yemektir; meşaleyi elden yere koymak ve meşaleye reçine sürmek de kolla yapılır (hangi tuşa bağlanacağı Yazılımcının eşleme tablosundadır).
  - **Öğretici kartı:** "Anladım" ve "Eğitimi geç" düğmeleri kol seçimine girer; kart açıkken **B** kartı 6 sn bırakır (sonra yeniden görünür).
  - **Pencereler:** Karakter, Yetenekler, Almanak, binek, büyük harita (işaret koyma, kaydırma, yakınlaştırma), Döşe düğmeleri ve eşya şeridi, açılır listeler kolla kullanılır; pencere içinde LB/RB sekme değiştirir.
  - **Büyük harita:** çubuk kaydırır, **LT/RT** yakınlaştırır/uzaklaştırır, **A** ortadaki artının yerine işaret koyar ya da kaldırır, artı bir kişinin üstündeyse onu hedef yapar; **Y** haritayı kendi yerine döndürür, **B** kapatır.
  - **A ile toplama/konuşma (kolda):** erişimde birden çok şey varsa A çubuğun/bakışın yönündekini seçer; ama **yerdeki eşya yine önce** alınır (Boğaç; Kontroller › F), kişiler ondan sonra gelir. Klavyedeki F'nin davranışı değişmez.
  - **Ekrandaki öbür düğmeler** (sol menü, köşe düğmeleri) Select basılı tutulunca açılan **arayüz odak kipi**yle seçilir.

## Arayüz ve pencereler

> Bu maddeler v3.43'e kadar "Tarifler: kazan, el yapımı, örs, ustalar" başlığının içindeydi; ekran düzeniyle ilgili oldukları için buraya taşındı. "Konuşma penceresi" ayrı başlık olarak aşağıdadır.

- **Tarif ve sipariş listelerinde satır düzeni (7 Kasım 2026, Boğaç):** bütün tarif ve sipariş listelerinde her satırda **solda** küçük resim, adı ve "sende N", **sağda** düğmeler durur (düğmeler her satırda aynı sırada ve aynı genişlikte, alt alta tek sütun). Bu düzen şu listelerin hepsinde geçerlidir: el yapımı, kazanın tarif listesi, örs paneli, Usta Sinan'ın yapı/ev eşyası siparişi ve ev listesi, ACT 2 ustalarının listeleri (Efsun, Tufan, Işın, Tomris, Gökay) ve ekranın üstündeki takip şeridi.
- **Bilgisayarda görev kartı büyük, konuşma yazısı küçük:** genişliği 900 pikselden fazla ve fareyle oynanan ekranda sağ üstteki görev kartı daha geniştir (en çok 540 px; yazı 17 px, başlık 13,5 px, düğmeler 15 px); kişilerin konuşma kutusunda metin 16,5 px, ad 15,5 px, seçenek düğmeleri 15 px'tir (önce 19 / 17 / 17 px). Bir menü açıkken görev kartı eskisi gibi daralır. Telefon düzeni değişmedi.
- **Bilgisayarda kart yazıları daha büyük:** fareyle oynanan ve 720 pikselden geniş ekranda (telefon görünümü değilken) öğretici/ana görev kartı 18 px (bir menü açıkken 16 px, 3 satır), yan görev kartı 16 px (alt satırı 15 px, genişliği 480 px) ve takip çipleri 17 px yazıyla gösterilir. Alttaki **1-2-3-4-5 alet kemeri** iki kat büyür: kutular 92 px, simgeler 64 px, tuş numarası 18 px. Telefon görünümü değişmez.
- **Bilgisayarda sol üst iki kat büyük:** saat, Can / Enerji / Tokluk çubukları ve etki çipleri (Canlılık, Gece gözü, Bulantı…) iki kat büyüktür (çubuklar 46 px, yazılar sütun genişliğine göre en çok 24 px). Sol menünün kare düğmeleri sütunu **sikke kutusuna kadar** doldurur: solda yalnızca **Envanter, El yapımı, Yetenek ağacı, Yemek** ve (gelince) **Robot köpekler** durur. ("çok büyük olmuş, oyunu kapatıyor") kareler **yan yana üçlü, iki sıra** dizilir ve küçüktür: kenarı ekran genişliğinin %4,2'si, en az 48, en çok 84 px (1920 px ekranda 81 px); sıra genişliği üç kare kadardır. Robot köpeklerin yeri baştan ayrılır, gelince kareler değişmez. **Başarımlar** sağ üstte Çıkış ve Ayarlar'ın altına, onlarla aynı boyda taşındı; **Tarif kitabı** sağ altta Başarımlar'ın eski yerine, Almanak'la aynı boyda geçti (telefonda ☰ menüsünde kalır); **Görevler ve etkiler en az Tokluk boyunda:** bilgisayarda Görevler/Gizle düğmesi sütunun bütün genişliğini kaplar ve en az Tokluk çubuğu kadar yüksektir (46 px); etki çipleri (Canlılık, Gece gözü, Bulantı…) da her biri sütun genişliğinde ve en az 46 px yüksekliktedir, alt alta dizilir. **Kemer küçüldü:** bilgisayarda alttaki 1–5 kemer yuvaları ve meşale yuvası 92 px'ten **64 px**'e küçüldü (simgeler 44 px). **İnce Menü çubuğu:** **Menü ▾** artık Görevler'in yanında değil, kare düğmelerin **altında** sütun genişliğinde ince bir çubuktur (22 px); basınca kare düğmeler gizlenir/açılır (katlıyken çubuk Görevler'in altında kalır). **Menü katlanır:** Menü düğmesine basınca kare düğmeler gizlenir (kısayol tuşları çalışmaya devam eder), bir daha basınca açılır. Seçim bu tarayıcıda hatırlanır (oyuncunun kendi seçimi; otomatik ayar değil). Katlıyken kare boyu değişmez. Telefon görünümünde bu düğme yoktur (orada menü zaten açılır kapanır).
- **Toplama bildirimi birikir:** yerden bir şey toplayınca köşede çıkan "+1 Odun" bildirimi ekrandayken aynı şeyden bir daha toplarsan yeni "+1" çıkmaz, aynı bildirim **+2, +3 Odun** diye güncellenir ve süresi baştan başlar. Bildirim kaybolduktan sonra toplanan yeniden +1'den sayılır.
- **Telefonda bütün pencereler:** telefon yatay tutulunca kişilerin ve menülerin bütün pencereleri (Nazlı'nın pazarı, demirciler, Usta Sinan, El yapımı, envanter, yetenek ağacı, tarif kitabı, yemek, köpekler…) **bütün ekranı** kaplar; üstte boşluk kalmaz (öğretici kartı varsa yalnızca ~40 piksel). Başlık satırı ve araç satırı incedir (başlık solda, Kapat sağda), içerik kendi içinde kayar.
- **Telefona göre sıkı düzen:** telefon yatay tutulunca bütün pencerelerde sekmeler (Hepsi/Yiyecekler…, Sat/Satın al, Savaş/Ekonomi…, Tarifler/Keşif defteri…) tek ve ince bir satırdır, sığmazsa yana kayar; düğmeler ve satırlar alçak, yazılar küçüktür; uzun açıklama yazıları gizlenir. Ekran ekran:
  - **Telefonda sürükleme:** telefonda ve tablette sürükleme parmak olaylarıyla çalışır, tarayıcının kaydırması ya da uzun basış menüsü sürüklemeyi kesmez. **Envanter:** taşınabilir bir eşyaya (ya da dolu bir alet yuvasına) parmağını koyup **kaydırdığın an** eşya parmağının ucunda gelir (beklemek gerekmez); alttaki yuvalardan birinin (çantadaki ya da ekranın altındaki) üstünde bırakınca oraya girer, dolu bir yuvayı yuvaların dışına bırakınca yuva boşalır. **Kazan ve örs:** alttaki eşya kutularından birini kaydırınca eşya parmakla gelir; **kazanın (örsün) üstünde** bırakınca bir tane konur (Zor modda denemeye atılır). Sürüklerken parmak pencerenin üst ya da alt kenarına gelirse liste kendiliğinden kayar, kazan görünmüyorsa ona ulaşılır. Dokun (1 tane koy / seç) ve basılı tut (gerekenin hepsini koy) eskisi gibidir. Eşyaların arasındaki boşluktan ya da eşya olmayan yerden kaydırınca liste kayar.
  - **Yürürken alet seçmek:** telefonda bir parmağın yön tuşunda/kolunda yürürken öbür parmakla alt kutulardaki bir alete (meşale, balta…) ya da boş ele dokununca **hemen seçilir**; durmak gerekmez. Dokunuş parmağı kaldırınca sayılır (yerinden 12 pikselden az oynamış ve 0,5 sn'den kısa olmalı; daha uzunu sürüklemedir). Eskiden telefon, ekranda başka bir parmak varken dokunuşu tıklama saymıyordu.
  - **Envanter:** giysi yuvaları karakterin yanında **tek ince şerit** (her yuva küçük simge + ad); "bir giysi seç…" ve "Taşınabilir eşyaları alttaki yuvalara koy…" yazıları gizli (bir eşya seçilince eylem düğmeleri yine çıkar). Böylece eşyalar açılır açılmaz görünür.
  - **Eşyanın tam adı (v3.29, Boğaç: "seçtiğimin tam halini görebilmeliyim, basılı tutarsam seçmeden de"):** kutucuklarda uzun adlar kısalır ("Çam…"). Telefonda ve tablette bir kutucuğa **dokununca** eşyanın tam adı kutucuğun hemen üstünde küçük bir balonda ~2,5 sn görünür (envanter, el yapımı, kazan, örs, yemek, pazar: adı kısalan her kutucuk). Envanterde bir kutucuğa **basılı tutunca** (~0,4 sn) tam ad balonda çıkar ve parmak kalkana kadar durur; bu basış eşyayı **seçmez**. Taşınabilir eşyada basılı tutup kaydırınca sürükleme eskisi gibi çalışır. Bilgisayarda fare üstüne gelince tam ad zaten görünür.
  - **Pazar:** her eşya **tek satır**: ad ×adet, yanında küçük ipucu ("Kazanda şimdi 5 tarifte işe yarar"), fiyat, **1 sat** ve **Hepsi** düğmeleri; ekrana çok daha fazla eşya sığar.
  - **Pazar sütunları:** fiyat, ▼ adet ▲, **Sat** ve **Hepsi** her satırda aynı genişlikte durur; fiyat 1, 2 ya da 3 haneli de olsa düğmeler alt alta aynı yerdedir (fiyat sağa yaslı). Nazlı'nın **Keskin taşı sat** dersinde (öğretici 9–10. adım) Keskin taş satış listesinin **en üstünde** durur. **Bilgisayarda menü pencereleri (pazar kuralının yerine):** bilgisayarda (fareyle, 900 pikselden geniş ekran) **bütün menü pencereleri** (pazar, kazan, örs, envanter, el yapımı, tarif kitabı, yetenekler…) içindeki her şeyle birlikte **%20 büyük** gösterilir ve aşağıda **alet kemerinin hemen üstüne** kadar uzar: 2.84'teki pencerenin altıyla kemer arasındaki boşluğun yalnızca üçte biri kalır (oyun kemerin gerçek yerini ölçer). Pencere ekranın üstünden 70 piksel aşağıda başlar (öğretici kartı açıkken 132); içerik pencerenin içinde kaydırılır. Pencere ekrana sığacak kadar daralır; pazar penceresi en çok 1100 piksel geniştir. Telefon görünümü değişmez.
  - **El yapımı:** üstteki uzun açıklama gizli; meşale durumu ince bir satır; tarif satırları alçak, yaptığın eşya hemen görünür.
  - **Savuş düğmesi her zaman yuvarlak ("neden oval"):** Savuş, Atıl düğmesiyle aynı boyda tam bir dairedir; düğmeler Ayarlar'dan yerinden oynatıldıktan sonra da (eskiden o durumda boyu yazısına göre kalıyor, oval görünüyordu).
  - **Yetenek ağacı:** ağaç pencerenin geri kalanını doldurur, düğümler küçüktür. ("telefonda üst üste biniyor") telefonda ağaç 520×440 piksellik sabit bir tahtadır, çerçevesinin içinde yukarı aşağı kaydırılır (eskiden ~250×220 pikseldi, yakın düğümler birbirinin üstüne biniyordu). Ağaç açılınca en alttan (Koşu tarafından) başlar; yetenek alınca kaydırdığın yer korunur.
  - **Tarif kitabı:** üstteki açıklama gizli.
  - **"Yeni malzeme bulundu"** yazısı bir pencere açıkken ekranın ortasına değil **altına, küçük** çıkar; menünün üstünü kapatmaz.
  - **Ayarlar:** pencere ekranın genişliğine yayılır, müzik düğmelerinin yazısı kesilmez.
  - **Ana menü:** "PURPLE LIGHT" yazısı küçülüp sağa kayar; soldaki düğmeler (Yeni oyun, Yükle…) yazının üstüne binmez.
- **Telefonda kazan ve örs ekranı:** telefon yatay tutulunca kazan (ve örs) penceresi **bütün ekranı** kaplar; ekranın üstünde boşluk bırakılmaz (yalnızca öğretici kartı varsa onun yüksekliği kadar, ~40 piksel). Başlık satırı ince (başlık solda, Kapat sağda), arama satırı tek ve ince satır. Altta iki sütun: solda **tarif listesi** (ekranın ~%38'i), sağda seçilen tarif, malzemeler, kazan, düğmeler ve envanter; ikisi de **kendi içinde kayar**. Kazan alanı alçalır, yazılar ve kareler küçülür. Bilgisayar ve tablet görünümü değişmez.

### Konuşma penceresi

- **Adlara gelen ekler Türkçe ses uyumuna uyar:** bir kişi ya da eşya adına ek eklenirken (yönelme, belirtme, iyelik…) ekin ünlüsü adın son ünlüsüne, ünsüzü son sese göre seçilir ve özel adlarda kesme işareti konur: "Şifa'ya", "Kemal'e", "Börü'nün", "Dursun'a", "Kayhan'ı".

- **Konuşma penceresi:** uzun konuşmalar (ör. görev anlatımları) ekranın üstünden taşmaz: pencere en çok **görünen ekran yüksekliği** kadar olur (iPhone'da adres çubuğu hesaba katılır), yazı kendi içinde kayar, **cevap düğmeleri hep altta görünür**; yazı harf harf gelirken pencere son satırı izler, bitince yukarı kaydırıp baştan okunabilir. **Yazı harf harf akarken ilk basış** (tık, dokunuş, tuş ya da seçenek numarası) **yazıyı tamamlar, ikinci basış seçer.** Yazılar ve düğmeler telefona göre biraz küçüktür.
- **Pencere dışına basmak = "Anladım" (kalıcı kural):** konuşma penceresi seçim yapılmadan kapatılırsa (pencerenin dışına tıklama/dokunma, Esc, X) oyuncu pencereyi okumuş sayılır ve sade cevap seçilmiş olur: yalnızca kapatan bir seçenek varsa ("Sonra", "Hoşça kal") o, tek seçenek varsa o, yoksa ana (vurgulu) seçenek. Böylece "Hazırım" / "Anladım" bekleyen bir ders ya da görev hiçbir zaman takılı kalmaz. **Eklenen her yeni pencere bu kurala uyar.**
- **Sahneler de aynı kurala uyar:** anı sahneleri ve ada halkı sahneleri (Elmas Nine dahil) Esc ya da dışına tıklama/dokunmayla kapanır ve **sonuna kadar okunmuş** sayılır: XP verilir, anı defterine yazılır (Boğaç'ın "pencere dışına basmak = Anladım" kuralının uygulaması).

## Hayatta kalma

### Can, tokluk, enerji

**Seviye puanları (v3.40, Boğaç: "otomatik level ile bunların artmasını oyundan kaldırıcaz… kullanıcı kendi kararı ile arttıracak"):** özellikler artık seviyeyle kendiliğinden artmaz. Her seviye atlayışta **seviye puanı** kazanılır ve oyuncu Karakter penceresinde (C) dilediği özelliğin yanındaki **+** düğmesine basıp puanı oraya verir. Verilen puan geri alınmaz.

- **Puan (v3.41, Boğaç: "hepsine %2-3 vermesi ile 1'ine vermesi dengeleri bozmamalı, çok geç gelişim hissi de vermemeli"):** 2–10. seviyeye çıkarken her seviye **2**, 11–30. seviyeye çıkarken her seviye **3**, 31. seviyeden sonra her seviye **4** puan. Toplam: 10. seviyede 18, 16. seviyede 36, 30. seviyede 78, 60. seviyede **198** puan.
- **En üst seviye 60** (eskiden 50). 11 özelliğin her biri en çok **18 puan** alır; 11 × 18 = 198, yani **60. seviyede bütün özellikler tam dolar**.
- **Bir özelliğin tavanı seviyeyle açılır:** bir özellik en çok **1 + seviye ÷ 3** (aşağı yuvarlanır) puan alabilir: 2. seviyede 1, 10. seviyede 4, 16. seviyede 6, 30. seviyede 11, 51. seviyeden sonra 18. Böylece bütün puanları tek bir özelliğe yığmak dengeyi bozmaz (10. seviyede Güç'e 4 puan = 1,32×; eski sistemde 10. seviyede bütün özellikler kendiliğinden 1,27× idi). Tavan dolunca **+** sönük kalır; tablonun altında "Bu seviyede bir özellik en çok N puan alabilir" yazar.
- **Tavan dolunca:** Karakter penceresinde bir özellik tavanına ulaşınca **+** düğmesinin yerinde "Sv N'de açılır" yazar (N, o özelliğin bir sonraki puanının açıldığı seviye).
- **Gelişim hissi:** bütün puanlar eşit dağıtılırsa 16. seviyeye kadar eski sistemle aynı hızda (16. seviyede %18), sonra biraz daha yavaş ilerler; ama her puan tek başına eskiden bir seviyenin verdiğinden çok daha büyük bir artış verir ve her seviyede 2–4 puan gelir.
- **Bir puan, eski bir seviyeden fazlasını verir (v3.40, Boğaç):** eskiden her seviye kendiliğinden küçük bir artış veriyordu (can +5, enerji +4, toplama +0,03, hareket +0,02, satış +0,01, şans +%0,5, hasar +%3, zırh +1, mana +3…); şimdi bir puan o özelliğe bundan daha büyük bir artış verir (tabloda "Puan başına").
- **Açıklama:** her **+** düğmesinin üstüne gelince (telefonda özelliğin adının altında her zaman) o özelliğin ne işe yaradığı kısaca yazar (ör. Toplama hızı: "Dal, taş, bitki, odun ve maden toplarken daha hızlı olursun.").
- **Verilmemiş puan:** Karakter penceresinde tablonun sağ altında "Verilmemiş seviye puanı: N" yazar; verilmemiş puan varken Karakter düğmesinin köşesinde küçük sarı bir sayı durur.
- **İlk seviye dersi:** ilk kez seviye atlayınca Karakter düğmesi ışıkla yanıp söner ve kısa bir yazı çıkar: "**+N seviye puanı**" (adım tarif edilmez; Karakter düğmesinin köşesindeki sayaç yeterlidir); pencere açılınca **+** düğmeleri yanıp söner. İlk puan verilince ders biter (bir kez).
- **Eski kayıtlar:** eski kayıttaki seviyenin bütün puanları verilmemiş olarak gelir (ör. 20. seviyede 48 puan); özellikler 0 puandan başlar.
- **Arenada** seçilen seviyenin puanları bütün özelliklere eşit dağılmış sayılır (60. seviyede hepsi tam).

| Özellik | 0 puan | Puan başına | 18 puan (tam) | Not |
|---|---|---|---|---|
| Toplama hızı | 1,00 | +0,08 | 2,44 | toplama süresi bu sayıya bölünür |
| Hareket hızı | 1,00 | +0,025 | 1,45 | |
| Satış değeri | 1,00 | +0,05 | 1,90 | |
| Şans (tüm ihtimallere) | +%0 | +%0,8 | +%14,4 | |
| En yüksek can | 100 | +24 | 532 | + Dayanıklılık ağacındaki can yetenekleri |
| Can yenilenmesi (/sn) | 0,10 | +0,05 | 1,00 | tokluk > 70 iken ×1,5; tokluk 0 iken yenilenmez; Hızlı iyileşme ×2/×3/×4 |
| En yüksek enerji | 100 | +19 | 442 | + Derin nefes yetenekleri |
| Enerji yenilenmesi (/sn) | 14 | +2,5 | 59 | harcamadan 0,6 sn sonra başlar; yürürken ×0,6 |
| Güç (vuruş hasarı çarpanı) | 1,00 | +0,08 | 2,44 | bütün silahlar, oklar, asalar; Güçlü kol ×1,10/×1,25/×1,40 |
| Zırh (temel) | 5 | +2,5 (yuvarlanır) | 50 | çıplak karakterin de zırhı vardır (v3.40, Boğaç); + Zırh I–IV yetenekleri |
| En yüksek mana | 100 | +8 | 244 | |

- Kritik vuruş ihtimalinin seviye payı (aşağıda) seviyeye bağlı kalır.
- **Tokluk** 100'den 0'a **12 dakikada** iner (Tok karın ile 16 dakikada) (ilk 2 gün yarı hızda, 3–4. gün ¾ hızda). 35'in altında uyarı, 25'in altında mide guruldar. **0 olunca saniyede 1,6 can** gider.
- **Yemek** yiyince tokluk değerinin %80'i kadar (Doyurucu sofra ile %120'si) can 15 saniyeye yayılarak dolar. Tıka basa tokken de yemek yenir: tokluk 100'ü geçmez ama yemeğin canı ve yan etkileri (güçlendirmeler, çiğ etin mide bulantısı) yine işler; tanrı modunda da yenir.
- **Enerji**: koşu saniyede 18, atılma 14, savuşturma 5, her vuruş 4 (yumruk) – 10 (balta/kazma) yer. Enerji biterse "Yoruldun": %30'a dolana kadar koşamaz, vuramazsın. Enerji %35'in altındaysa vuruşlar yavaşlar.
- **Kamp ateşinin** 64 piksel yakınında saniyede +1,4 can (Kamp ateşi ustası ile +2,8).
- Diken: böğürtlen 3, çakmaktaşı 2 can yakar (ilk 3 toplayışta kesin, sonra %20; eldiven giyiliyse hiç). Kirpiye çıplak elle vurmak 3 can.

### Bayılma

- **Oyunda ölüm yok:** karakter hiçbir zaman ölmez, oyun hiç bitmez. Canavar, açlık, zehir, gece mor ışık: hepsi **bayıltır** ve her bayılmadan sonra uyanırsın. Oyundaki ve belgedeki bütün yazılar "öl" değil "bayıl" der. (Canavarları öldürmek, av ve Reis avı bundan ayrıdır.)
- **Can 0 olunca bayılırsın.** Taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) **%20'si ve sikkelerin %20'si kaybolur**; kalan her şey düştüğün yerde bir **çantada** kalır (haritada kurukafa). Çantanın üstüne yürüyünce her şey geri gelir. Kumsaldaki uyanış yerinde can %50 ile uyanırsın.
- Görev eşyaları kaybolmaz (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları; Kemal'in külçe görevi sırasında o külçe).
- Bayıldıktan sonra 60 sn Reis çıkmaz. Bayılmak %60 ihtimalle bir anı açar.
- **Tanrı modu** (hile) açıkken canavar, açlık ya da zehirle bayılmazsın. **Mor ışık ise tanrı modunda bile bayıltır** (Boğaç'ın kararı, bilinçli: oyunun adı Mor Işık). Gece ışıksız kalırsan tanrı modu seni korumaz.

### Gün, gece ve mor ışık

- **Gündüz 06:00–20:00 = 8 dakika**, **gece 20:00–06:00 = 2,5 dakika**; bir gün yaklaşık 10,5 dakika. Menü ya da konuşma açıkken dünya durur.
- 19:00'dan itibaren kararır; 21:00–04:30 tam karanlıktır.
- **Zifiri karanlık kuralı:** gece elinde meşale yoksa, kafa lamban yoksa, bir ışığın (kamp ateşi vb.) içinde ya da bir evin içinde değilsen sayaç başlar: 3,5 sn "Kim var orada?!", 6,5 sn "Bir şey yaklaşıyor…", **8. saniyede mor ışık iner ve bayılırsın**. İlk gece süre 20 sn'dir ve **ilk gece hiçbir şey kaybolmaz**; sonraki gecelerde bayılmadaki gibi %20 kayıp. Ertesi sabah 06:00'da kumsalda uyanırsın.
- İlk kez meşalesiz karanlığa yakalanınca biri sana bir kez **bedava Kaba meşale** fırlatır. İlk 3 gün 17:30'da "Hava kararıyor" uyarısı gelir.
- **Güvenli yerler** (saldırgan canavarlar uzaklaşır, mor ışık gelmez): Kemal'in kampı (352 px), kişilerin ateşleri (kuzenlerin ateşleri dahil), Dursun'un ocağı, Zümrüt'ün kazanı (120 px), kendi kamp ateşin (100 px), evin içi. Ateş böcekleri ışık sayılmaz. **Gece çıkan parlak bitkiler (Gece sefası, Mor kıymık) toplanana kadar ışık sayılır:** yanlarında (yaklaşık 31–34 piksel, yani toplama menzilinin dışına taşan bir halka içinde) durduğun sürece mor ışık sana dokunmaz. Bitkiyi **topladığın an** ışığı da gider; çevrede başka ışık (meşale, lamba, ateş, Gece gözü) yoksa karanlıkta kalırsın ve mor ışık vurur (normal uyarı süresiyle). Bitkinin çevresindeki parlak halka da bu menzile uyar.
- **Güvenli yerdeyken canavarlar uzak durur:** eskiden ateşe girip çıkarak kurtları hasar almadan öldürebiliyordun (ateşin içindeyken saldırmıyorlar ama yanında bekliyorlardı). Artık sen bir güvenli yerin içindeyken (kişi ateşi, kamp ateşin, ocak, kazan, Kemal'in kampı) sana **160 piksel**den yakın olan saldırgan (ya da kızdırdığın) her canavar senden uzaklaşır: tam hızıyla 160 pikselin dışına kaçar ve orada bekler, atılışı ve hazırlığı iptal olur. Güvenli yerden çıkınca yine kovalar. Böylece ateşin kenarından vurulabilecek bir yerde durmazlar.
- **Gündüz olunca gece canlıları gider:** yalnızca gece çıkan canlılar (Kurt gibi) sabah olunca (06:00) artık kalmaz: kovalamayı bırakır, senden uzağa koşar ve 300 pikselden uzaklaşınca ya da en geç **6 saniye** sonra toz bulutuyla kaybolur. Eskiden yalnızca ekranın çok dışındakiler kayboluyor, yakındakiler gündüz de kalıyordu. Reis'ler ve yan görev canavarları bu kurala girmez (görev bitene kadar kalırlar).
- **Güvenli yerlere canavar girmez:** kavga edebilen canlılar (*saldırgan* ve *nötr*, Reisler dahil) aşağıdaki güvenli yerlerin sınırında durur, içeri **adım atmaz**; kişilerin yanına gelemez. Seni kovalarken sen güvenli yere girersen sınırda kalır, sonra vazgeçer. Bir şekilde içerde kalmış biri (ör. hücum ya da sıçrama ile) en yakın kenardan dışarı yürür. *Zararsız* canlılar (tavşan, geyik…) eskisi gibi dolaşır. Börü'nün ders canlıları ve arena bu kuraldan muaf.

#### Boğaç, gece beliren yazılımcı (v3.30; v3.37, Boğaç: yalnızca gerçek gece 02:00–06:00)

- **Yalnızca gerçekten geç saatte (v3.37, Boğaç):** Boğaç yalnızca oyuncunun **gerçek saati** (cihazın saati) **02:00 ile 06:00 arasındayken** çıkabilir. Bu saatlerin dışında oyunda gece olsa da hiç belirmez. Gerçek saat 02:00–06:00 arasındayken, oyundaki **her gece** (20:00–06:00) gecenin rastgele bir anında, haritanın (o anki adanın) rastgele bir yerinde, yürünebilen bir karada belirir ve yalnızca **15 saniye** kalır (gerçek saniye; oyun duraklatılınca sayaç da durur), sonra kaybolur. Bir gecede bir kez çıkar; uyuyarak geçen gecede çıkmaz. Haritada ya da hiçbir yerde işareti, ipucu yoktur. (v3.30–3.36'da gerçek saate bakmadan her oyun gecesi çıkıyordu.)
- **Görünüşü:** varsayılan erkek karaktere benzer (kahve saç, açık ten, mavi pantolon) ama koyu gri tişörtlü ve **kare gözlüklüdür**. Belirirken ve kaybolurken çevresinde kısa bir mor parıltı olur. Konuşma kutusunda kendi resmi görünür.
- Yanına varınca (yaklaşık 22 piksel) kendiliğinden konuşur ve **gerçek saati söyler** (v3.37, Boğaç): "Saat 02:47 olmuş. Kapat oyunu artık." (saat ve dakika cihazın o anki saatidir) · "Tamam". Konuşma bitince (ya da pencere dışına basılınca) **oyun kaydedilir ve ana menüye dönülür** (Ana menüye dön düğmesiyle aynı: otomatik kayıt).
- **Bir kez (v3.30, Boğaç: "1 kere konuştuktan sonra bir daha gelmesin, şimdilik"):** Boğaç'la bir kez konuşunca o oyunda (kayıtta) bir daha hiç belirmez. Yeni bir oyunda yine çıkar.

#### Mor ışıkta o: gece beliren sevdiğin kişi (v3.30; v3.34, Boğaç: kendi kopyan yerine sevdiğin kişi)

- Bazı gecelerde (her gece **%40** ihtimalle, tam karanlıkta 21:00–04:30 arasında rastgele bir anda) adada **sevdiğin kişi** belirir, ama **mor ışığın etkisi altındaymış gibi**: gözleri mor parlar, başının çevresinde soluk mor bir hale vardır, çevresinde mor zerreler yükselir; başının üstünde onun adı yazar. Karakter yaratmadaki görünüşüyle çizilir. Ekranın içinde, senden yaklaşık 100–140 piksel uzakta, yürünebilen bir yerde durur, yüzü sana dönüktür, konuşmaz. Çevresinde soluk mor bir ışık vardır (karanlıkta görünsün diye). (v3.30–3.33'te burada karakterinin kendi kopyası çıkıyordu.)
- Ona doğru yürümeye başladığın an (aradaki uzaklık ~14 piksel azalınca) **birden kaybolur** (küçük bir mor duman). Yaklaşmazsan 25 saniye sonra kendiliğinden kaybolur. Bir gecede en çok bir kez çıkar.
- Evin içinde, mağarada, denizde yolculukta, konuşma ya da pencere açıkken, ara sahnede ve arenada çıkmaz.
- **Kalp atışı (v3.37, Boğaç):** o göründüğü sürece **kalp atışı** duyulur: iki vuruşlu ("güm-güm"), derin ve boğuk bir ses, yaklaşık **0,9 saniyede bir**. Her vuruşla birlikte **telefon** (Ayarlar'da Titreşim açıksa, titreşimi destekleyen telefonlarda) ve bağlı **oyun kolu** (titreşimi olan kollarda) iki kısa, hafif titreşimle atar. O kaybolunca kalp atışı ve titreşim hemen durur. Oyun duraklatılınca ya da bir pencere açılınca da durur.
- **5 farklı gecede** onu gören (ekranda en az 0,6 saniye kalmış olması yeter) gizli **Mor ışıkta o** başarımını kazanır (eski adı Öteki ben; eski sayaç sürer). Görülen geceler cihazda sayılır (başarımlar gibi, bütün kayıtlar için ortak).

#### Seni hatırlıyorum: aynı karakterle yeni oyun (v3.37, Boğaç)

- Bu cihazda **yeni bir oyuna** başlayıp Kemal adını sorduğunda, karakterinin **görünüşü** (karakter yaratmadaki bütün seçimler: cinsiyet, ten, göz, saç, sakal, kıyafet ve renkleri, gözlük, şapka) **ve adı** bu cihazda daha önce başlatılmış bir oyundakiyle **birebir aynıysa** (adda büyük/küçük harf önemsiz), Kemal adını duyunca bir an durur. Görünüş ya da ad farklıysa hiçbir şey olmaz.
  - **İkinci kez** (aynı karakter daha önce bir kez başlatılmış): Kemal: "<i>(Kemal bir an durur, yüzüne uzun uzun bakar.)</i> {Ad}… Seni daha önce de bu kumsalda bulmuş muydum? Aynı yüz, aynı ad… <i>(Başını sallar.)</i> Yaşlandım evlat, aldırma." · "…"
  - **Üçüncü kez ve sonrası:** Kemal: "<i>(Kemal geri çekilir.)</i> {Ad}. Yine sen. Bu kaçıncı oluyor evlat? Her seferinde aynı kumsal, aynı yüz, aynı ad… ve her seferinde hiçbir şey hatırlamıyorsun. <i>(Gözü denize kayar.)</i> Neyse. Unut gitsin, ben de unuturum." · "…"
  - Ardından konuşma her zamanki gibi sürer (Kemal sevdiğin kişinin adını sorar).
- Hangi karakterlerin başlatıldığı **cihazda** saklanır (başarımlar gibi, bütün kayıtlar için ortak; en çok son 30 karakter). Bir karakter Kemal ona adını söylediği an kaydedilir; kayıt yüklemek ya da Devam et sayılmaz, yalnızca Yeni oyun. Oyunun hiçbir yerinde anlatılmaz.

#### Gizli şeyler (v3.34, Boğaç)

Oyunun hiçbir yerinde anlatılmaz; oyuncu kendisi bulur.

- **Zümrüt'ün kazanına çöp:** kazanın tarif ekranında (Tarifle kaynat) **hiçbir tarifte kullanılmayan** bir malzemeye (deri, kabuk, kömür, kaşık gibi; aletler, zırhlar, kemer eşyaları hariç) dokununca o malzemeden **1 tane kazana atılır**: kazan fokurdar, mor duman yükselir ("X kazanda kaynadı… mor bir duman yükseldi"). Seçili tarif olmasa da olur. **5 farklı** böyle malzeme atınca Zümrüt kızar ve sayaç sıfırlanır:
  - 1. kez: "Evlat! Ne yapıyorsun? Kazanım çöp tenekesi değil! Attığın her şey duman oldu."
  - 2. kez: "Yine mi?! Bu kazan bana ninemden kaldı, evlat! Bir daha görmeyeyim."
  - 3. kez: "Peki, peki… Madem bu kadar meraklısın. Bak, senin çöplerinden tuhaf bir şey kaynadı. Al iç bakalım… Aaa! Neredesin evlat?!" Karakter bunu içer ve **10 saniye görünmez** olur: yarı saydam (neredeyse görünmez) çizilir, canlılar onu görmez (kovalayan bırakır, saldırmaz, atış yapmaz). Gizli başarım **Görünmezlik iksiri**. Sonraki her 5 çöpte Zümrüt yalnızca kızar (1. ve 2. sözler sırayla), iksir bir daha çıkmaz. Sayaç kayıtta saklanır.
- **Börü'yü yenmek:** elin boşken (silahsız, yumrukla) Börü'nün yanında (~26 piksel) **50 kez vurursan** (vuruşlar arasında en az 0,2 sn) Börü pes eder: "Tamam, tamam! Pes ediyorum! Yumrukların taş gibi olmuş evlat. Al, bu kemeri gençliğimde bir ayıdan kazanmıştım. Artık senin." Sana **Börü'nün kemeri** verir: **gövdeye giyilen** bir zırh, **26 savunma** (orman zırhları kadar), kanamaya %20 direnç, kahverengi deri. Arenada da seçilebilir. Bir kez verilir (kayıtta saklanır); sonra 50 vuruşta "Yine mi? Kemerimi aldın ya!" der.
- **100. gecede yıldızlar:** "Yıldızsız Ada"da yıllar sonra bir gece yıldızlar çıkar: **100., 200., 300.… günün gecesinde** (20:00–06:00) gökyüzünde parlayan yıldızlar görünür (ekranın her yerinde hafifçe yanıp sönen beyaz ve mor noktalar), yıldız ışığı her yeri aydınlatır: o gece meşale gerekmez ve **mor ışık gelmez**. Gecenin başında ekranda "Gökyüzünde yıldızlar…" yazısı çıkar.
- **Eski kamp ateşi:** her yeni oyunda adanın ıssız bir köşesinde (Kemal'in kampından en az ~120 kare uzakta, yürünebilen bir yerde) **sönmüş bir kamp ateşi** vardır: kül, kararmış taşlar ve yanında üstüne **karakterinin adı kazınmış** bir taş. Yanına gelince karakter: "Bu taşa… benim adım kazınmış: {ad}. Ben buraya ne zaman geldim?" Yer kayıtta saklanır.
- **Ayna:** suyun (göl, nehir, deniz) kenarında, yüzün suya dönük **10 saniye hiçbir şey yapmadan** (yürümeden, hiçbir tuşa basmadan, su ya da başka bir şey toplamadan, olta atmadan, bir pencere açık değilken; v3.35, Boğaç: su toplarken görülmesin) durursan sudaki yansımanda bir anlığına (3 sn) **sevdiğin kişinin yüzü** belirir (soluk, ters, dalgalanarak), sonra kaybolur. En çok 2 dakikada bir.
- **Dans (v3.35, Boğaç):** yürüme tuşlarıyla (klavye, kol ya da ekrandaki yön) art arda **sol, sağ, sol, sağ, sol, sağ** (3 kez sol-sağ; basışlar arasında en çok 0,6 sn, hepsi 3 sn içinde, neredeyse yerinden oynamadan) basınca karakter **dans etmeye başlar** (sağa sola sallanır, zıplar, üstünde notalar çıkar) ve tuşları bıraksan da **dans etmeye devam eder**. **Başka herhangi bir tuşa** (ya da yine bir yön tuşuna) basınca, yürüyünce ya da bir pencere açılınca dans biter. **20 saniye** dans edince yakındaki (300 piksel) zararsız ve nötr hayvanlar (tavşan, keklik, geyik…) yanına yürür ve senin çevrende **eşit aralıklı bir çember** (yaklaşık 50 piksel yarıçap) üzerinde yerlerini alır; yerlerine varınca **durur, yüzlerini sana döner ve seni izler**, kaçmazlar (v3.36, Boğaç: bir bıldırcın gelip kaçmaya çalışıyordu). Dans sürdükçe orada kalırlar, dans bitince dağılırlar. **Dans ederken şarkı (v3.36, Boğaç):** dans sürdükçe karakter mırıldanarak şarkı söyler: "la-la" diye, kısa, neşeli, kendini tekrarlayan bir ezgi (8 notalık iki cümle). Ses tonu karakterine göredir: **erkekse kalın** (Re3 çevresi), **kadınsa ince** (Re4 çevresi). Ses efektleri sesinden çalar; dans bitince susar.
- **İnatçı balıkçı:** aynı yere (ilk atışın 24 piksel çevresine) art arda **100 kez** olta atarsan (başka bir yere atınca sayaç sıfırlanır) sudan **yaşlı bir balık** çıkar ve konuşur: "Yüz kez! Yüz kez aynı yere attın oltayı! Ben bu suyun en yaşlısıyım; seni artık tanıyorum. Ama beni yakalayamazsın, inatçı. Hoşça kal!" ve suya dalıp kaybolur (sıçrama). Bir kez olur (kayıtta saklanır).
- **Barışçı (mor ışık saldırısı):** bir saldırıda **hiçbir Yıldızsız'ı öldürmeden** saldırının sonuna kadar (4 dakika) bölgede kalıp **bayılmazsan**, saldırı biterken kalan Yıldızsızlar durur, sana el sallar (başlarının üstünde mor "~" işareti), sonra ışıkla gider; ekranda "Konuk · Yıldızsızlar el salladı" yazar. Gizli başarım **Konuk**.
- **Gece 03:00:** gerçek saat (cihazın saati) **03:00–03:59** arasındaysa Kemal'le konuşunca sözüne şöyle başlar: "Bu saatte uyanık mısın evlat? Git yat." (oturumda bir kez).
- **Devam ederken bir satır:** ana menüde **Devam et**'e basıp oyuna girince ekranın ortasında birkaç saniyeliğine (4 sn) şiirsel tek bir satır belirip kaybolur; her girişte sıradaki satır (bu cihazda sırayla döner): "Denizin her yeri derin değildir." · "Bazı geceler ada yalnız değildir." · "Kazan bazen tarifsiz de bir şey verir." · "Su, bakana başka bir yüz gösterir." · "Yıldızsız Ada'nın da yıldızlı bir gecesi vardır." · "Adada senden önce de bir ateş yanmıştı." · "Yumruk da bir dildir; Börü onu anlar." · "Ayakların ritmi tutunca ada da seninle dans eder." · "Sabır, suyun dibindekini bile yüzeye çıkarır." · "Her yabancı düşman değildir." · "Gece yarısından sonra bazı yüzler yalnızca bir kez görünür." Oyuncuya iş tarif etmez, yalnızca merak uyandırır.

#### Işık kaynakları

| Işık | Yarıçap | Süre | Not |
|---|---|---|---|
| Kaba meşale | 80 px | 220 sn (yalnızca eldeyken yanar) | 2 Dal + 2 Lif + 2 Yaprak, el yapımı |
| Meşale | 115 px | 340 sn | Dursun döver |

- **Meşale yuvası:** meşale alet kemerine **takılmaz**; kemerin hemen solunda ona ayrılmış tek bir **meşale yuvası** vardır (boşken soluk bir meşale simgesi görünür). Meşale envanterden bu yuvaya sürüklenir ya da meşaleye dokunup yuvaya dokunulur; kemerin bir yuvasına bırakılan meşale de bu yuvaya geçer, yuvaya meşale dışında bir şey takılmaz. **Yuvaya basmak** (bilgisayarda tıklama ya da **"** tuşu, 1'in solundaki tuş; Ayarlar → Kontroller'den değişir) meşaleyi **yakar** ve sol ele alır; bir daha basmak **söndürür**. Meşale yalnızca yanarken tükenir; yuvada sönük dururken azalmaz. Yuvada kalan miktar (sağ üst köşede, beyaz ve siyah kenarlı) ve yanma çubuğu (altta) görünür. Yanan meşale elde başka silah yoksa **vurur** (7 hasar). Fare tekerleği yalnızca kemerde gezer. Eski kayıtta kemerdeki meşale kendiliğinden meşale yuvasına taşınır. İlk karanlıkta Kemal'in verdiği meşale de doğrudan yuvaya konur. **Envanterde de görünür (v3.37, Boğaç):** envanterin "Alet yuvaları" sırasında, 1. yuvanın solunda aynı meşale yuvası durur (içindeki meşale, sayısı, yanıyorsa turuncu çerçeve). Envanterde meşaleye dokunup bu yuvaya dokunmak (ya da sürüklemek) meşaleyi yuvaya koyar; meşale seçili değilken dokunmak yakar/söndürür. Yuvaya meşale dışında bir şey konmaz. **Biten meşalenin yerine öbürü (v3.37, Boğaç):** yanan meşale tükenince elinde **başka bir meşale** varsa (önce aynı türden, yoksa öbür tür: Meşale ↔ Kaba meşale) o meşale kendiliğinden yuvaya geçer ve **yanmaya devam eder**; ekranda "{Biten} bitti · {Yeni} yandı" yazar. Elinde hiç meşale kalmadıysa yuva boşalır ve karanlıkta kalırsın.
| Kafa lambası | 125 px | sonsuz | Baş yuvası; Işıkçı'dan takasla |
| Kamp ateşi | – | 330 sn; 2 Dal +95 sn, 1 odun +190 sn, 1 Kav +285 sn; en çok 720 sn | **Alet yuvasına girer:** yapınca boş bir yuvaya kendiliğinden konur (envanterde "Yuvaya koy / Eline al" da var); **elindeyken tıkla** (telefonda **Vur**) → önüne kurulur. Ayrıca V tuşu ya da envanterde "Yak". **Haritada görünür:** yanan her kamp ateşin hem köşedeki küçük haritada hem büyük haritada titreşen turuncu bir alevle gösterilir (keşfedilmemiş yerde de, gece de); büyük haritada üstünde "Kamp ateşi" yazar. Sönünce haritadan kalkar. Yağmurda 1,6 kat hızlı söner |

- Meşale sol elde taşınır; sağ elde silah olabilir. Yağmurda 2 kat, fırtınada 2,7 kat hızlı biter. **Elde iki silah olmaz:** iki el yalnızca meşale için vardır (sol elde meşale, sağ elde bir silah ya da alet). Silah yuvasındaki silah sırtta durur ve **yalnızca sağ el boşken** (ya da elde silah/alet olmayan bir şey varken) görünür; sağ elde balta, kazma, kılıç ya da mızrak varken sırttaki silah çizilmez, böylece elde iki silah varmış gibi görünmez. Dövüşte yine yalnızca tek silah kullanılır (eldeki; elde yoksa yuvadaki).
- **Çapraz yürürken meşale titremez:** çapraz yürürken meşale ve eldeki eşya, karakterin çapraz pozunun gidilen yönüne göre çizilir; karakterin yönü de iki yön arasında kararsızken (çubukla çapraza yakın yürürken) her karede değişmez, ancak öbür yön açıkça baskın olunca döner. Eskiden meşale her karede sağ ve sol el arasında gidip gelip yanıp sönüyordu.
- **Meşale silahtır da:** elinde yanan bir meşale varken yakın dövüşte vurduğun her canavar (normal vuruş, kombolar, güçlü vuruş, ulti; senden en çok 60 piksel uzaktaki) **tutuşur**: **4 sn** boyunca yanar ve yavaş yavaş can kaybeder: Kaba meşalede ~1,5 saniyede **1**, Meşalede saniyede **1** (her saniye bir turuncu hasar sayısı; bir yanık toplam Kaba meşalede 2–3, Meşalede 4 can). Yanan canavarın üstünde **turuncu bir parıltı** ve yukarı uçan alevler görünür. Yanarken yeniden vurursan süre baştan başlar (yanık üst üste binmez). Yanıkla ölen canavar normal avlanmış sayılır (XP ve ganimet). Kendisi yakan canavarlar (Lav kertenkelesi, Kül cini gibi saldırısı yanık bırakanlar) tutuşmaz; Börü'nün ders canavarları ve arenanın canavarları da tutuşmaz. Uzaktan atışlar (asa, fırlatılan mızrak) tutuşturmaz.
- **Her saldırı meşaleden yer:** meşale elindeyken yaptığın her saldırı (isabet etsin etmesin) meşalenin tam süresinin **%4,5'ini** yer (Kaba meşalede ~10 sn, Meşalede ~15 sn); bu, zamanla yanmaya ektir. Bir meşale yalnızca vuruşla ~22 saldırıda biter. Aynı vuruşun birden çok canavara değmesi tek saldırı sayılır (0,25 sn içinde en çok bir kez). Sınırsız dayanıklılık hilesi açıkken yemez. **Reçine** (L): Meşale +%65, Kaba meşale +%50 süre. Her sürüşte 1 reçine harcanır (sıra: Çam reçinesi, Ladin reçinesi, Huş katranı); reçine yoksa yalnızca "Reçinen yok." yazar (v3.29, eski uyarı kalkan kabuk tarifini gösteriyordu). Biten meşale yığından 1 eksilir, varsa yenisi yanar.
- Kamp ateşinin başında **F** (toplama/konuşma tuşu): odun at ya da **pişirme menüsünü** aç.
- **Ateşte pişirme (7 Kasım 2026, Boğaç):** tarifler yine **kazanda öğrenilir**; ama ateş gerektiren yemekler (közlenmiş, kızarmış, kavrulmuş, haşlanmış, tütsülenmiş, ızgara, tava, şiş, buğulama, pişmiş et/balık, Kor isteyenler ve malzemesinde Ateş ya da Duman olan bütün yemekler; tam liste Tarif ansiklopedisinde "Ateşte" yazanlar, 129 tarif) **El yapımı listesinde görünmez**, **ateşte** yapılır. Ateşin başında **Ateş ve Duman malzemesi harcanmaz, ateş sağlar**; öbür malzemeler harcanır.
  - **Pişirme menüsü:** herhangi bir ateşe (kamp ateşi ya da kişilerin ateşleri) F, tıklama/dokunma ya da kolda A ile açılır; eski "Ateşte közle" penceresinin genişlemiş halidir. Çiğ et/balık közleme ve ateşte yapılabilen **öğrenilmiş** tarifler listelenir; her satırda ad solda, **Yap · ×5 · Hepsi** düğmeleri sağdadır (liste düzeni kuralı). Çantada çiğ yiyecek olmasa da ateşte yapılabilen bir tarif varsa menü açılır. F önceliği değişmez: önce yerdeki eşya, sonra kişi (Boğaç; böylece ateşin yanındaki kişiyle konuşmak engellenmez), sonra ateş.
  - **Pişme süresi:** her yemek ateşte kısa bir süre pişer (bir tanesi ~3 sn; ×5 ve Hepsi sırayla pişer). Ateşin üstünde ve menüde bir **ilerleme çubuğu** görünür. Pişen yemek bitince **kendiliğinden çantaya** gelir; oyuncu bu sırada uzaklaşabilir (pişirme ateşte sürer). Yanma yoktur. Bir ateşte aynı anda tek pişirme sırası vardır; yeni istek sıranın sonuna eklenir.
  - **Sıra ve malzemeler:** malzemeler yemek sıraya alınınca harcanır. Ateş sıra sürerken sönerse pişmemiş yemeklerin malzemeleri çantaya döner. Oyun kaydedilince ateşte pişmekte olanlar **hemen pişmiş sayılır** ve çantaya gelir (pişirme sırası kayda yazılmaz).
  - **Kamp ateşinde yakıt:** kamp ateşinde pişen her yemek ateşin yanma süresinden **4 sn** yer; kamp ateşinin menüsünde ateşin kalan süresi ve **Odun at** düğmesi görünür. Kişilerin ateşleri sönmez.
  - **Ara malzeme olarak elde yapılmaz:** ateş yemekleri, bir tarifte ara malzeme olarak gerekse de El yapımı'nın "+" zincirinde elde yapılmaz; ateşte pişirilir.
- **Önce yanındaki toplanır:** kamp ateşinin ya da bir tuzağın hemen yanında toplanabilir bir şey (lif, dal…) varsa **F** / Topla önce onu toplar; ateşin menüsü ancak yanında toplanacak bir şey kalmayınca açılır.
- **Kişilerin ateşinde yemek:** Kemal'in ve öbür kişilerin kamplarındaki ateşlerde de çiğ et ve balık közlenir ve pişirme menüsü açılır: ateşin **üstüne tıkla / dokun** (uzaktaysan karakter yürür, varınca açılır) ya da ateşin hemen yanındayken (~16 piksel) ve çantanda çiğ et ya da balık varken **F**'ye bas. Pencerede "Hepsini közle" ve tek tek közleme vardır; kişilerin ateşi sönmez, odun istemez. Çiğ yemeğin yoksa "Çiğ et ya da balık getirirsen közleyebilirsin" der.
- **Elde kazmayla madene sol tık:** elinde kazma varken bir madenin (taşın, cevherin) üstüne sol tıklayınca karakter madene yürür ve kazar; tıklama madenin bütün görüntüsünü tutar (eskiden yalnızca ortasındaki küçük nokta sayılıyordu, kenarına tıklayınca vuruş yapılıyordu). Yakında canavar olsa da kazmayla madene tıklamak kazar.

#### Hava

Kabaca açık %45, bulutlu %20, yağmur %18, fırtına %7, sis %10 (Bataklık ve Kayalık Dağ'da sis daha sık, yaklaşık %20; öbürleri o kadar azalır). Bataklık ve Kayalık Dağ'ın üstünde her zaman ince bir sis süzülür, sisli havada her yerde yoğun sis olur; ateşler, meşale ve fener sisin içinde ışık açar. Grafik kalitesi en düşük düzeydeyse (otomatik kalite) Orta Diyar'ın sürekli ince sisi çizilmez, sisli hava yine çizilir. Yağmur/fırtına: meşale ve kamp ateşi çabuk biter, **tarladaki tohumlar kendiliğinden sulanır**, balık %30 daha çabuk vurur; fırtınada şimşek çakar. Kül Diyarı'nda yağmur yerine **kül fırtınası** olur. Siste saldırganlar seni %40 daha geç fark eder.

#### Uyku

- Uyku yalnızca **20:00–05:00** arası. Uyuyunca saat 06:00 olur, can ve enerji dolar, tokluk 20 azalır; %40 ihtimalle bir rüya anısı gelir.
- Yataklar: Hasır yatak (Usta Sinan ilk tanışmada hediye eder), Hasırotu yatak, Ahşap karyola. Yatak açıkta da kurulabilir; evde içeri yerleştirilir. **Yaprak barınağı** yatak istemez ama bir gecelik (uyanınca dağılır).

## Gelişim

### Seviye, XP ve yetenekler

- **Biyom XP çarpanları:** canlı XP'si biyomuna göre çarpılır: Çayır ve Orman ×1, **Bataklık ×1,5**, Kayalık Dağ ×2, Kül Diyarı ×1,5, Mor Kristal Vadisi ×1,5. Biyom tablolarındaki XP sütunu çarpan uygulanmış değerdir. Bataklık kurdunun temel XP'si 76'dır (sabit; çarpanla 114).

- En üst seviye **60** (v3.41; eskiden 50). Gereken XP 16. seviyeye kadar her seviye %35 artar (1→2: 40, 5: 133, 10: 596, 16: 3.606), sonra yavaş artar (25: 5.553, 49: 10.746, 59: 12.909). Seviye atlayınca özellikler değil **seviye puanı** gelir (yukarıda "Seviye puanları").

| Kaynak | XP |
|---|---|
| Kazanda yeni tarif öğrenmek | 12 |
| Elle yeni ürün / tekrar | 12 / 2 |
| Örste yeni alet ya da zırh / tekrar | 8 / 2 |
| Zor modda "Dene" ile tarif bulmak | 5 |
| Avlamak | türün XP'si (tablolarda) |
| Reis | türün XP'si × 6 + 20 |
| Toplamak (her düğüm, ağaç, meyve) | 1 |
| Balık | 3 + fiyatın yarısı |
| Tuzaktan av almak | 4 |
| Közleme | parça başına 1 (bir seferde en çok 30) |
| Ateşte yeni yemek / tekrar | 12 / 2 (el yapımı gibi) |
| Keşif defterinde bir kategoriyi bitirmek | 100 |
| Anı | 25 + 15 × anının sırası |
| Ada halkı hikâye sahnesi / Zümrüt'ün bilmecesi | 40 / 20 |
| Köprü onarımı / Doğu geçidi | 40 / 320 |
| Görevler, Börü'nün dersleri | tablolarda |

**Görev dışı ek XP yok:** köprü onarmak ve kaya yığını/sıradağ patlatmak (ACT 1 ve ACT 2) kendi başına XP vermez; bunların XP'si yalnızca ilgili görevin ödülüdür.

- **Yetenek ağacı** (Y): üç renkli ağaç — **Savaş** (kırmızı), **Ekonomi** (altın) ve **Dayanıklılık** (yeşil); her birinde 30 yetenek (toplam 90). Yetenekler sade, iki renkli ikonlu yuvarlaklardır; hepsi açılınca bir ağaç silüeti çizer. Başta yalnızca kök yetenek görünür; bir yetenek alınınca **yalnızca ona bağlı üstündekiler** açılır. Satın alma ikona tıklayarak. Fiyat ve seviye şartı kata göre: 100 (–), 250 (Sv 2), 400 (Sv 3), 600 (Sv 4), 1.000 (Sv 6), 1.800 (Sv 8), 3.000 (Sv 11), 5.000 (Sv 14). Tam liste "Yetenekler · Yetenek ağacı" bölümünde.
- **Koşu** Savaş ağacının ilk yeteneğidir: yalnızca 100 sikke; seviye, köprü ya da Atılma şartı yok.
- **Atılma** yetenek ağacında değildir: öğreticide Börü ücretsiz öğretir (bkz. "Oyun akışı › Öğretici").

### Evcil hayvanlar (v3.42, 6 Kasım 2026, Boğaç)

> Evcilleştirmeyi **Çoban Davut** öğretir (ACT 1 · "Çoban Davut"). Bir canlı ancak Davut'un o canlıyı anlatan görevi alınınca (ya da bitince) evcilleşir.

**Her biyomda bir canlı evcilleşir** (3 binek, 3 savaşçı):

| Biyom | Canlı | Türü | Nasıl | Sevdiği yiyecek | Özelliği |
|---|---|---|---|---|---|
| Çayır | Yaban atı | binek | yetişkin, doğrudan | Yabani elma | hız ×1,8; düz yolda en iyisi |
| Orman | Kurt | savaşçı | yavru (in) | Tavşan eti | hızlı saldırır (can 260, hasar 14, 0,8 sn); gece canavar yaklaşınca hırlar |
| Bataklık | Timsah | savaşçı | yavru (in) | Sazan | yavaş ama sağlam (can 520, hasar 22, 1,4 sn); ısırdığını 1,5 sn yavaşlatır |
| Kayalık Dağ | Dağ keçisi | binek | yetişkin, doğrudan | Tuz kayası | hız ×1,5; Kayalık Dağ'da ×1,9 |
| Kül Diyarı | Lav kertenkelesi | savaşçı | yavru (in) | Kül böceği kabuğu | can 380, hasar 18, 1 sn; vurduğuna yanık (3 sn); ateşe dayanıklı |
| Mor Kristal Vadisi | Kristal geyik | binek | yetişkin, doğrudan | Ay otu | hız ×2,0; gece boynuzu hafif ışık verir (meşale sayılmaz) |

- **Önce ağıl (Boğaç):** dünyada kurulmuş bir **ağıl** yoksa hiçbir canlı evcilleşmez (Davut'un ilk görevi dışında bütün evcilleştirme ağıldan sonra). Ağıl bir yapıdır (tarifi kazanda öğrenilir: 10 Çit); malzemesini götürünce **Usta Sinan** kurar, oyuncu istediği yere koyar (3 × 3 karo). Ağıla dokununca **ağıl penceresi** açılır: kimin yanında kimin ağılda kalacağı seçilir, baygın binek ayağa kaldırılır, ölen yoldaşların adları okunur. Pencerenin dışına basmak kapatır.
- **Güven çubuğu:** sevdiği yiyecek çantandayken canlıya yaklaşınca "Yere bırak: …" çıkar; yiyeceği **yere bırakırsın** ve en az ~80 piksel geri çekilip beklersin. Canlı yanında biri varken yemez; gelir, 2 sn yer, başının üstündeki **güven çubuğu** (kalp) %25 dolar. Bir besleme ile sonraki arasında en az **1 oyun saati** geçmeli (evcilleştirme bir güne yayılır). Yakınında (~160 piksel) koşarsan, ona vurursan ya da üstüne yürürsen ürker, çubuk %30 iner; çubuk boşken kaçarsa o gün bir daha yanaşmaz. 4 beslemede (%100) evcilleşir.
- **Yavru yolu (savaşçılar):** her savaşçı türünün kendi biyomunda bir **ini** vardır (yeri haritada gösterilmez; Davut anlatır). Anne inin yanındayken yaklaşılmaz (saldırır); anne avdayken (gündüz) yavruya yiyecek bırakılır. Yavru evcilleşince seninle gelir, **2 oyun günü** içinde büyür; büyüyene kadar savaşmaz ve canavarlar ona saldırmaz.
- **İsim:** evcilleşince isim penceresi açılır (en çok 12 harf; bir öneriyle gelir). İsim konuşmalarda, yoldaşın başının üstünde ve ağılda görünür.
- **Yanında en çok 1 binek ve 2 savaşçı** dolaşır; ötekiler ağılda bekler. Ağılda kimin yanına geleceği seçilir.
- **Seviye yok (Boğaç):** yoldaşlar seviye atlamaz, güçlenmez; her türün değeri sabittir.
- **Savaşçı:** 30–60 piksel arkanda yürür; **senin vurduğuna** ve **sana saldırana** (~160 piksel içinde) saldırır (bütün haritayı taramaz). Kendiliğinden yavaşça iyileşir; sevdiği yiyecekle beslersen canının %40'ı dolar.
- **Savaşçı ölebilir (Boğaç):** canı biterse ölür ve geri gelmez. Adı ağıldaki küçük bir **taşa** yazılır; Davut bir sonraki konuşmada onun için tek bir söz söyler. Aynı türün ininde **3 oyun günü** sonra yeni bir yavru doğar; aynı yolla yeniden evcilleştirilir.
- **Binek:** yanına gelip **Bin** (bilgisayarda **B** ya da yanındayken E; telefonda Bin/İn düğmesi bineğin yanındayken kendiliğinden çıkar). Binince binek biraz büyük çizilir, karakter sırtında oturur. Binerken koşu enerjisi harcanmaz; vurulmaz, toplanmaz (toplamaya ya da vurmaya basınca kendiliğinden inersin). Köprülerden geçer; mağaraya, eve ve suya giremez (kapıda kendiliğinden inersin).
- **Binek ölmez, ağılda canlanır (Boğaç):** canavarlar bineğe de vurur; canı biterse yere düşersin, binek bayılıp ağıla döner. Ağılda sevdiği yiyecekten 3 tane verince yeniden ayağa kalkar.
- **Performans:** yanında en çok 3 hayvan; yoldaşlar yalnızca kendi çevrelerine bakar (performans kuralı 5).
- **Arena:** evcil hayvanlar arenada görünmez (arenada olup olmayacakları henüz konuşulmadı).
- **Mağara ve ev:** mağaraya ya da evin içine girerken bineğinden inersin; yoldaşlar dışarıda bekler, çıkınca yanına gelir.

### Zorluk

İki mod vardır. **Zor mod** yalnızca tarif keşfini değiştirir (canavarlar, açlık, ekonomi aynı):

- Tarif kitabı kapalıdır; malzemeleri görmek tarifi açmaz.
- Kazanda iki sekme olur: **Tarifle kaynat** ve **Deneyerek bul**. "Dene"ye en çok 6 farklı malzeme atılır; hiçbir şey harcanmaz. Cevaplar yol gösterir: "yeni tarif buldun", "en yakın tarife N malzeme eksik", "bildiğin bir tarifte birlikte", "tek başına bir şey olmuyor", "yanlış yer (örs)". Her tarifin malzeme türü kümesi benzersizdir.
- Kitapta **Tarif satın al**: rastgele kapalı bir tarif 50 sikke.

## Üretim ve ekonomi

### Ekonomi

- **Satış** yalnızca Pazarcı Nazlı'ya. Birim fiyat = temel fiyat × satış çarpanı. Satış çarpanı = (1 + Ticaret yüzdesi + Değerli işçilik (yapılmış eşyada) + Toptancı (Hepsini sat) + Keşif defteri ustalığı) × seviye çarpanı; **en çok 2,3**.
- **Fiyatsız eşya satılmaz:** her eşyanın bir fiyatı olmalı; fiyatı bulunmayan bir eşya pazarda **satılmaz** ("Bu eşyayı Nazlı almıyor"), "Hepsini sat" onu atlar. Meyve ağacı odunları (Elma, Armut, Erik, Mürver) **3 sikke** (satınca sikke **NaN** oluyordu).
- **Bozuk sikke onarımı:** kayıt açılırken ya da oyun sırasında sikke sayı değilse (NaN), oyun bunu düzeltir: kayıttaki en son geçerli sikke miktarına (otomatik ve elle kayıtların içinden en yenisi, yoksa 0) döner ve "Sikkelerin onarıldı" der. Görev sayaçlarındaki bozuk değerler de 0'dan sürer.
- **Miktarla satış:** Nazlı'nın satış listesinde her satırda bir **miktar kutusu** var: aşağı (▼) ve yukarı (▲) okları ile birer birer azalır/artar, ya da kutuya sayı elle yazılır; **Sat** düğmesi yazılan kadarını satar (yanında o miktarın tutarı yazar), **Hepsi** eskisi gibi tümünü. Miktar 1 ile eldeki adet arasında tutulur. Oklara (dokunmatikte de) **basılı tutunca** sayı kendiliğinden değişmeye başlar ve hızlanır: 0,4 sn sonra saniyede ~5 adım, giderek saniyede ~20 adıma çıkar; **2,5 sn'den uzun** basılı tutunca **10'ar 10'ar** değişir. Bilgisayarda kutu seçiliyken klavyenin ↑/↓ tuşları da aynısını yapar (basılı tutunca 2,5 sn sonra 10'ar). Kutuda Enter satar.
- **Tarif malzemesi satılırken uyarı:** bildiğin ya da açık olan bir tarifte kullanılan bir malzemeyi satarken (tek satır, "Hepsi", "Hepsini sat") önce bir soru çıkar: "**Emin misin?** X şu tariflerde kullanılıyor: A, B, C…" · **Evet, sat** / **Vazgeç**. Toplu satışta kaç çeşidin tariflerde kullanıldığı yazar. "**Bu malzeme için bir daha sorma**" seçeneği o malzeme için soruyu oyunun bu oturumunda kapatır (oyun yeniden açılınca yine sorar). Öğreticinin "şunu sat" adımında (parlayan düğme) soru çıkmaz. **"Kazanda işe yaramayanları sat":** bu düğme **hiçbir tarifte kullanılan** malzemeyi satmaz: ne bildiğin/açık tariflerin malzemesini ne de henüz keşfetmediğin tariflerinkini; o yüzden soru da çıkarmaz. Düğmedeki tutar da yalnızca bunları sayar. Eskiden yalnızca keşfedilmemiş tarifleri dışarıda bıraktığı için bildiğin tariflerin malzemelerini satıp yine soru soruyordu.
- **Nazlı'da üç toplu satış düğmesi (v3.33, Boğaç; "Kazanda işe yaramayanları sat"ın yerine):** üçü de **aletleri, silahları, zırhları, alet kemerine (1–5) konabilen her şeyi, yapıları ve kamp ateşini satmaz** (yalnızca malzeme ve eşya satar). Düğmede satılacakların toplam tutarı yazar; yalnızca fazla satıldığı için "Emin misin?" sorusu çıkmaz.
  1. **Aletler, zırhlar ve eşyalar hariç hepsini sat:** satılabilen her şeyin hepsini satar (eskisi gibi).
  2. **Kazandaki açık tariflere yeteni bırak:** Zümrüt'ün kazanında **şu an öğrenilebilen** (listede sarı "yeni" yazan; açık ama henüz öğrenmediğin) bütün tarifleri toplar; her malzeme için bu tariflerin hepsinin istediği adet kadarını ayırır (ör. açık tarifler toplam 19 Sap istiyorsa 19 Sap sende kalır), fazlasını satar. Bu tariflerde geçmeyen malzemenin hepsi satılır.
  3. **Bütün tariflere yeteni bırak:** aynısını **henüz öğrenmediğin bütün tarifler** için yapar (şimdi açık olanlar ve ileride açılacaklar): ör. öğrenmediğin bütün tarifler toplam 300 Taş istiyorsa ve sende 305 Taş varsa yalnızca 5 Taş satılır.
  - **Ara parçalar da sayılır (v3.36, Boğaç):** bir tarif kendisi de bir tarif olan bir parça istiyorsa (ör. Sopa), çantanda o parçadan eksik kalan kadarı yapmak için gereken malzemeler de (Sopa'nın Dal'ı, Lif'i…) ayrılır, zincir boyunca (parçanın parçası da). Elindeki hazır parçalar bu ihtiyaçtan düşülür.
  - Hesap: bir tarif bir malzemeyi "şunlardan biri" diye istiyorsa (ör. herhangi bir odun) o adet o gruptaki her malzeme için ayrılır (fazla değil, eksik satılsın diye). Öğrendiğin tarifler sayılmaz. Satıştan sonra "N çeşidin fazlası satıldı · +X sikke" yazar; satılacak fazla yoksa "Tariflerin ihtiyacından fazla satılık bir şeyin yok." 
- **Şanslı müşteri** satışta %5 (II ile toplam %12) + şans ihtimalle iki kat öder.
- **Satın alma:** yalnızca Nazlı, yalnızca daha önce eline geçmiş **doğal** malzemeler (tohumlar dahil). Alış fiyatı temel fiyatın 2,6 ile 5,6 katı arası (pahalı ve tehlikeli bölge malzemesi daha pahalı).
- Başka hiçbir kişi sikkeyle eşya satmaz; ustalar malzemeyi senden alıp **işçilik** ister: Dursun, Durmuş ve silahçı/zırhçı kuzenleri eşya fiyatının %15'i (en az 2), Sinan %20'si (en az 3), ACT 2 ustaları sabit ücret. Alet bileme aletin değerinin onda biri (bkz. Aletler, dayanıklılık, kademe). Usta Sinan evleri de sikkeyle yapar.
- **Robot köpeklerin taşıma kapasitesi:** köpekler topladıklarını artık hemen envanterine koymaz; **sırtlarında en çok 20 eşya** taşırlar. Sırtı dolan köpek işi bırakıp **sana koşar**, yanına gelince taşıdıklarını teslim eder: köpeğin üstünde küçük "+8 Dal", "+12 Taş" gibi satırlar belirir, ekranda "Karabaş getirdi: +8 Dal, +12 Taş" bildirimi çıkar ve eşyalar ancak o anda envantere geçer; sonra köpek işine döner. Köpekler menüsünde her köpeğin **taşıdığı** (ör. "taşıdığı: 7/20 · 4 Dal, 3 Taş") görünür. Sırtı dolmadan **Yanıma çağır** dersen köpek gelir ve o ana kadar topladığını yine aynı şekilde teslim eder. Taşınan eşyalar kayda yazılır; eski kayıtta köpeklerin sırtı boş başlar.
- **Temel fiyat** formülü: malzemelerin toplam değeri × (1,15 + 0,05 × zincir adımı, en çok 6) + gereken aletin değerinin %10'u.

### Tarifler: kazan, el yapımı, örs, ustalar

- **Kazan yalnızca öğretir:** malzemeleri koyup kaynatırsın, malzemeler gider, tarif öğrenilir (+12 XP); ürün çıkmaz. ACT 1'de Zümrüt'ün ve beş kuzen cadının (Yakut, Safir, Firuze, Mercan, İnci) kazanları, ACT 2'de Yıldız'ın kazanı. Bütün ACT 1 kazanları aynı tarifleri öğretir.
- **Kazanda öğrenilenler aşağıda (v3.36, Boğaç):** kazanın tarif listesinde her grubun içinde **öğrenilmiş** (yeşil, "öğrenildi") tarifler en alta iner; henüz öğrenilmemişler üstte kalır. Listenin en üstünde **"Öğrenilenleri gösterme"** kutusu vardır: işaretlenince öğrenilmiş tarifler listede hiç görünmez; kaldırılınca geri gelir. Seçim bu cihazda hatırlanır. (Örsteki listeye dokunmaz; orada yalnızca dövebildiklerin görünür.) **Liste yerinde kalır (v3.36, Boğaç):** listenin aşağısından bir tarif seçince (ya da malzeme koyunca, pencere yenilenince) sol liste en başa kaymaz, olduğu yerde kalır; aynısı örs ve sağdaki malzeme kutuları için de geçerlidir. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **Tarif kitabı** (K): bir tarif öğrenilmiş, bir kişi tarafından kitaba yazılmış ya da (Normal modda) bütün malzemeleri ve aletleri en az bir kez görülmüşse **açık** görünür. Kapalı tariflerin adı titreşen harflerle, bilinmeyen malzemeler "?" ile görünür. **Seçilen tarifin kutusu hep görünür (v3.37, Boğaç):** kitabın en üstündeki, seçilen tarifin adını, malzemelerini ve nerede yapıldığını gösteren kutu sayfa aşağı kaydırılınca da yukarıda sabit kalır; aşağıdaki bir tarife dokunduğunda ya da üstüne geldiğinde adı yerinden kaymadan görünür. Kitapta bir tarife **Takip et** dersen malzemeleri ve elindeki sayıları ekranın üstünde görürsün (aynı anda 1 tarif).
- **El yapımı (Tab):** öğrenilmiş ve örste dövülmeyen, yapı ya da ev eşyası olmayan her tarif. Yap / ×5 / Hepsi. Düğme düzeni: aşağıda "El yapımı düğmeleri".
- **Tarifteki alet yerine daha iyisi:** bir tarif alet olarak "Taş balta" istiyorsa **her balta** (aynı ya da daha yüksek kademeli) yeter; kazma için de aynısı. Tarif ekranında "Alet: Taş balta ya da daha iyisi · Demir balta" gibi görünür. Alet tarifte harcanmaz. (52 tarif Taş balta istiyor: kalaslar, saplar ve benzerleri.)
- **"Herhangi" parçalar kalktı:** hiçbir tarif grup istemez; kazan ve örsteki **+** düğmesi tarifin istediği parçayı yapar (bkz. Tarifler › "Herhangi" yok).
- **El yapımı listesi sıkı (v3.37, Boğaç: "koskoca ekranda 3 tarifi görmemeliyim"):** her tarif **tek satırdır**: **solda** küçük resim ve tarifin adı ("· sende 5" ile), **sağda** küçük düğmeler (Yap · ×5 · Hepsi (n) · Takip et; Kamp ateşinde Yak; 7 Kasım 2026, Boğaç: "tariflerin ismini sola, yap butonunu sağa alalım"), satırın yüksekliği yaklaşık bir düğme kadar; ekranda alt alta 12–15 tarif görünür. **Malzemeler** satırda yazmaz: bilgisayarda satırın üstüne gelince, telefonda tarifin adına dokununca satırın hemen altında küçük bir kutuda açılır (yeşil: yeterli, sarı: eksik parça elle yapılabilir, kırmızı: eksik; meşalelerde "x dk yanar"); kutu altındaki satırları kaydırmaz, üstlerine biner. Yapılamayan tarifin adı soluktur.
- **El yapımı düğmeleri:** Her satırda aynı düğmeler **aynı sırada ve aynı genişlikte** durur, böylece alt alta tek sütun olurlar: satırın **en sağında** **Yap · ×5 · Hepsi (n) · Takip et** (Kamp ateşinin **Yak** düğmesi en sonda); **solda** resim, tarifin adı ve "sende N". Basılabilen düğme renkli, basılamayan (malzeme yetmiyor, 5'e yetmiyor, birden fazla yapılamıyor) soluk ama yerinde durur; düğmeler satırdan satıra kaymaz. Yapılamayan tarifin yalnızca adı ve malzemesi soluk görünür. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **El yapımında renkler (v3.36, Boğaç):** tarif satırındaki her malzeme yeterliyse **yeşil**, yetmiyorsa **kırmızı** yazar; ama eksik bir parçayı (ör. Sopa) elindekilerden önce yapıp tarifi tamamlayabiliyorsan (Yap düğmesi açık) o parça kırmızı değil **sarı** yazar ve yanında "yapılır" der: Yap'a basınca önce o parça yapılır.
- **Takip:** en çok **3 tarif** birlikte takip edilir; ekranın üstündeki şeritte en yenisi en üstte durur (telefonda 2 satır görünür). 4. tarif takibe alınınca en eskisi bırakılır ve bildirim çıkar. **Şeritte Yap:** takip edilen tarif **elle yapılabiliyorsa** (öğrenilmiş, örste dövülmeyen, yapı ya da ev eşyası olmayan) ve bütün malzemeleri tamamsa satırda yeşil **Yap** düğmesi çıkar; basınca el yapımı ekranı açılmadan yapılır. Kazanda öğrenilecek ya da örste dövülecek tariflerde Yap çıkmaz. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **Takip şeridi düzenli (v3.38, Boğaç: "düzensiz duruyorlar, alt alta gelsin kutucuklar; uzun olanları kısalt, üstüne gidince tam adı yazar"):** takip edilen tariflerin satırları aynı genişliktedir ve kutucuklar **sütun sütun alt alta** durur: solda tarifin adı (sabit genişlik), sonra her malzeme aynı genişlikte bir kutucukta (resim, ad, sayı; yanında + düğmesinin yeri boş olsa da ayrılır), en sağda ×. Sığmayan adlar "…" ile kısalır; üstüne gelince (telefonda dokununca) tam adı görünür.
- **Takip şeridi kıpırdamaz, en çok malzemeli tarif üstte (v3.39, Boğaç: "+1 dal, +1 lif bildirimi takip edilenleri sağa sola kaydırıyor; en fazla malzeme içereni en üstte göster"):** şeridin yeri yalnızca takip edilen tarifler ya da malzemeleri değişince yeniden hesaplanır; bir şey toplayınca (sayılar, "hazır", Yap düğmesi) şeridin sol kenarı yerinde kalır, şerit sağa sola kaymaz. Takip edilen tarifler (en çok 3) **malzeme sayısına göre** sıralanır: en çok malzemesi olan en üstte (eşitse son eklenen üstte). Bu yalnızca görünüştür: 4. tarif eklenince yine **en eski eklenen** takipten çıkar, kalanlar yeniden sıralanır.
- **Takip şeridinde + ile parça yapmak (v3.36, Boğaç):** takip ettiğin bir tarifin eksik bir parçası kendisi elle yapılan bir tarifse (ör. Sopa, İp, Keskin taş) ve onu şu an elindekilerden yapabiliyorsan, şeritte o parçanın kutusunun yanında küçük bir **+** düğmesi çıkar. Basınca eksik kadarı (yapabildiğin kadar) hemen yapılır; gerekirse onun da parçaları önce yapılır (kazandaki + gibi zincirle). Yalnızca **öğrendiğin ve elle yapılan** tarifler bu yolla yapılır (örste dövülenler, yapılar ve aletler hariç). Ekranda "2 Sopa yapıldı (önce: Keskin taş)" yazar.
- **Örs:** aletler ve silahlar Demirci Dursun'da ve silahçı kuzenlerinde, örste dövülen zırhlar Zırhçı Durmuş'ta ve zırhçı kuzenlerinde. **Kademe kuralı:** her demirci yalnızca kendi biyomunun ve öncekilerin malzemesiyle yapılan eşyaları döver (Dursun/Durmuş: yalnız Çayır); kuralın tamamı bu maddenin altında; kuzenlerin tanıtımı "ACT 1 › Kişiler › Zümrüt, Dursun ve Durmuş'un kuzenleri" bölümünde. Örs listesinde bir ara parçanın yanındaki **+** o parçayı elindeki malzemeden hemen yapıp örse koyar. **Seçili tarif başka örse taşınmaz:** bir demircinin örsünde seçtiğin tarif (ör. Dursun'da Taş balta), o eşyayı dövmeyen başka bir demircinin örsü açılınca (ör. Durmuş) seçili kalmaz: seçim kalkar, örse koyduğun parçalar envanterine döner ("N malzeme envanterine döndü"). Her örste yalnızca o demircinin dövdüğü eşyalar seçilebilir. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
  - Her örsün bir **kademesi** vardır: Dursun ve Durmuş **0 (Çayır)**, Orman kuzenleri 1, Bataklık 2, Kayalık Dağ 3, Kül Diyarı 4, Mor Kristal Vadisi 5.
  - Bir eşyanın kademesi, **ana malzemesinin** en erken toplanabildiği biyomdur: malzeme zincirinin içindeki her ham maddenin ilk çıktığı biyomlardan en ileridekidir. Deri parçası bu hesaba katılmaz (her zırhın astarıdır; her biyomun hayvanından düşer, tabaklama yoktur). ACT 2 malzemeli zırhlar (²) kademe 0 sayılır, Durmuş ve bütün zırhçılar döver.
  - Bir demirci **kendi kademesindeki ve altındaki** bütün eşyaları döver; ayrıca **kendine özel** eşyaları vardır. Yani Dursun ile Durmuş yalnızca Çayır malzemesiyle (taş, çakmaktaşı, çakıl, bakır + kalay = tunç…) yapılanları döverken, bir sonraki biyomun kuzenleri o biyoma özgü silah ve zırhları da döver. Silahçılar alet ve silah, zırhçılar zırh döver.
  - Örs panelinde, öğrendiğin ama o demircinin kademesini aşan eşyalar üstte bir notla listelenir: "… bunları dövemez: Demir kılıç → Silahçı Ali (Bataklık)". Kazanda bir örs tarifini öğrenince çıkan mesaj da onu dövebilen **ilk** demircinin adını söyler.
- **Usta Sinan:** yapılar, yataklar, ev eşyaları ve Atölye (bkz. ACT 1 › Kişiler › Usta Sinan).
- **Zümrüt'ün bilmecesi:** bkz. ACT 1 › Kişiler › Cadı Zümrüt (Bilmece).

### Aletler, dayanıklılık, kademe

- Her toplama, isabet ya da balık aletin 1 kullanımını yer. Dayanıklılık rengi yeşilden kırmızıya döner; sıfırda alet çalışmaz, silah yumruk gibi vurur. **Bileme** (Dursun ve silahçı kuzenleri): aletin değerinin onda biri. Kova ve asalar/ateşli silahlar körelmez.
- **Körelmiş aletle F (v3.36, Boğaç):** elindeki balta ya da kazma tamamen körelmişse (dayanıklılığı 0) **F** (topla) ağaca ya da madene yönelmez; aletin hiç yokmuş gibi yerdeki eşyaya, bitkiye ya da yakındaki başka bir şeye yönelir (eskiden körelmiş baltayla ağaca gidip boşuna "köreldi" diyordu).
- **Alet yuvaları:** 5 (Alet kemeri dalıyla 6/7/8/10/12). Yuva doluysa yeni alet yere düşer; yerdeki eşya 180 sn sonra kaybolur.
- **Mıknatıs:** yere düşen küçük eşyalar (yeni düşenler yarım saniye bekler) **21 px** yakına gelince sana doğru süzülür 10 px içinde hızla çekilir, 6 px'te toplanır; F ile 28 px içindekiler alınır.
- **Ağaç kesince dal ve yaprak düşer:** baltayla her kesişte ağacın odununun yanında **1 Dal** ve **1 Yaprak** düşer (Söğüt'ün söğüt dalı ve meyve ağaçlarının meyvesi eskisi gibi ayrıca düşer).
- **Yerdeki yaprak daha küçük:** dünyada yerde duran toplanabilir **Yaprak** eskisinin **%70'i** boyunda çizilir (gölgesiyle birlikte). Toplama mesafesi, envanter simgesi ve sayıları değişmez.
- **İş çubuğunun yazısı:** balta ile ağaç keserken "**Kesiliyor: Çam ağacı**" (ağacın adı), kazma ile kazarken "**Kazılıyor: …**", öbür toplamalarda "Toplanıyor: …" yazar.
- **Balta ve kazma kademesi (ayrıntı: Aletler · Bütün setler):** Taş, Çakmaktaşı, Bakır 1 · Granit, Tunç 2 · Demir, Timsah dişi 3 · Kuvars, Çelik 4 · Kara çelik, Ejder 5 · Mor kristal, Obsidyen 6.
  - Ağaçlar biyoma göre: Çayır ve Orman 1 (Çam, Kavak, Elma, Armut, Erik, Meşe, Ladin, Kayın, Ihlamur, Ceviz) · Bataklık 2 (Söğüt, Kızılağaç, Dişbudak, Mürver, Bataklık servisi) · Kayalık Dağ 3 (Akçaağaç, Huş, Porsuk, Kestane, Ardıç) · Kül Diyarı 4 (Kül ağacı, Kızıl sedir, Kara çam, Dikenli akasya, Ateş narı) · Mor Kristal Vadisi 5 (Mor söğüt, Gece ağacı, Işık ağacı, Yıldız eriği, Ay elması) · ACT 2: Yüzen Kayalar ağaçları 1, diğerleri 2 (değişmedi).
- **Kazma kademesi** (aynı sıra, biyoma göre): Çayır ve Orman 1 (Kireçtaşı, Kumtaşı, Bakır, Granit, Taş kömürü, Kalay) · Bataklık 2 (Arduvaz, Tuz kayası, Demir) · Kayalık Dağ 3 (Pirit, Kuvars, Gümüş) · Kül Diyarı 4 (Bazalt, Kükürt, Obsidyen) · Mor Kristal Vadisi 5 (Kristal, Ametist, Altın). Bir maden damarı 3–5 vuruşta tükenir, 300 sn sonra yeniden dolar.
- **Maden kayaları geçilmez:** yerdeki maden kayalarının (cevher damarları; çizimleri öbür toplanabilirlerin iki katı büyüklüğünde, yaklaşık 32 × 28 piksel) **çiziminin çevresi** bir duvardır: kayanın görünen şekline uyan basamaklı bir sınır (alt kısmı 32, ortası 24, tepesi 14 piksel geniş; tepeden tabana 28 piksel) ve çevresinde 5 piksellik pay. Karakter de canavarlar da kayanın görseline giremez; kayanın arkasından (üstünden) geçerken ayakların kayanın tepesinin üstünde durur. Eskiden yalnızca tabandaki küçük bir elips engeldi (çizimin üst yarısının içine yürünebiliyordu) ve oyun açıldıktan sonra yerleşen kayalar hiç engel olmuyordu; artık her kaya, ne zaman çıkmış olursa olsun engeldir. Kazılıp tükenen kaya engel olmaz. Karakter bir kayanın içinde kalmışsa (eski kayıt) kendiliğinden kayanın hemen altına (orası doluysa üstüne, sonra yanına) alınır; bu üçü de ağaç ya da başka bir engelle doluysa çevresindeki en yakın boş yere alınır (çeyrek saniyede bir bakılır). Tükenip başka yerde yeniden çıkan kaya da **çıktığı anda** engel olur (önceden bir buçuk saniye kadar içine girilebiliyordu). **Toplanabilirler kayanın üstünde çıkmaz:** dal, taş, lif, ot, meyve gibi toplanabilirler bir maden kayasının çizim alanına (aynı sınır + 5 piksel) yerleşmez; yeniden çıkarken de kayanın üstüne düşmez. Ada kurulurken ya da sonradan bir kayanın üstüne denk gelmiş olan toplanabilir, ekranın dışındayken başka bir yere taşınır.
- **Yeniden doğma kendi biyomunda:** tükenen her toplanabilir (bitki, taş, dal, maden) yeniden doğarken **ilk doğduğu biyomda** boş bir yer seçer; Bataklık'ta biten demir cevheri yine Bataklık'ta çıkar, Orman'a kaymaz. Canlılar da yalnızca oyuncunun bulunduğu biyomun kendi canlılarından doğar ve o biyomun dışına çıkmaz (Canavarlar bölümü).

### Zırh ve durum etkileri

- Beş yuva: baş, gövde, eller, ayaklar, silah. Giyilen eşyaların toplamı **savunma**dır; Keşif defterinin Giyim ve Zırh ustalıkları +5'er savunma verir.
- **Zırh** karakterin temel özelliğidir: **5 + 2,5 × Zırh puanı** (seviye puanlarıyla artar; Sistemler › Gelişim) + Dayanıklılık ağacındaki Zırh I–IV yetenekleri (+5 / toplam +12 / +20 / +30). Eşyaya bağlı değildir, hiç çıkmaz.
- Alınan **fiziksel hasar × 25 / (25 + savunma + zırh)**. Zehir, yanık ve kanama da bu oranın yarısı kadar yumuşar. Karakter ekranında "Zırh", "Savunma" ve toplam hasar azalması ayrı ayrı yazar. (Kemal'in "Savunmanı 60'a çıkar" görevi yalnızca eşya savunmasını sayar.)
- **Çamur:** Bataklık çamurunda yavaşlarsın (×0,6); Kamış çizme, Demir çizme, Çelik çizme, Kara çelik çizme, Mor kristal çizme, Hurda çizme ve Meka çizme bunu önler.
- **Durum etkileri** canavarlardan, alev/zehir gölünden ve zehirli yemekten gelir: **zehir**, **kanama**, **yanık** belirli süre saniyede can yakar; zırh bunu da yarı oranda yumuşatır. Dirençler: Demir zırh (kanama %30), Çelik zırh (kanama %35), Kara çelik zırh (yanık %40, kanama %30), Mor kristal zırh (kanama, yanık, zehir %30), Ejder zırhı (yanık %60), Mantar lifi eldiven (zehir %40), Kristal miğfer (kanama %30), Ejder pulu eldiven (yanık %40), Meka çizme (kanama %20), Meka zırh (üçü de %50); kuzenlerin zırhları: Meşe kabuk zırh (kanama %15), Timsah pulu zırh (kanama %40), Gümüş pullu zırh (kanama %35), Ejder zırhı (yanık %60), Kristal ipek zırh (üçü de %25), Işık pulu eldiven (zehir %35). Dayanıklılık ağacındaki Zehre/Ateşe/Kanamaya dayanıklı yetenekleri ilgili hasarı ayrıca %40 azaltır (çarpılarak birleşir); Çelik beden üçünün süresini yarıya indirir; Son nefes canın dörtte birinin altındayken fiziksel hasarı %25 azaltır.
- **Canavarlara etki:** alevli, zehirli ve keskin silahlar ve oklar canavarı yakar, zehirler ya da kanatır (ayrıntı: Aletler · Alevli, zehirli, keskin silahlar). Meşale de eskisi gibi yakar.
- **Yemek kalkanları:** Panzehir zehri tamamen keser, Ateş kalkanı yanığı %70, Pıhtı kanamayı %60 azaltır.

### Yemek

- **Tokluk değeri:** çiğ meyve ve sebzeler 2–12 (biyom tablolarında), çiğ et 6, çiğ balık 4, közlenmiş et/balık 12–32, pişmiş yemek tarifleri 10–65 (pahalı tarif daha doyurur). Şifa tarifleri doğrudan can verir (15–60).
- **İyi etkiler** yemeğin türüne göre 60–240 sn sürer: **Güç** (+%20 vuruş: et, şiş, yahni), **Şifa** (can 3 kat hızlı: çorba, lapa), **Doygunluk** (tokluk inmez: ekmek, kek, patates), **Çeviklik** (+%12 hız: bal, şerbet), **Canlılık** (enerji 1,5 kat: çay, meyve suyu), **Gece gözü** (karanlıkta görme: mantar, balık, gece sefası), **Panzehir**, **Ateş kalkanı**, **Pıhtı**. Nadir pişmiş yemeklerde ek **Dayanıklılık** (can sınırı +%20).
- **Toplanan yiyecekler biyom biyom iyileşir ("her biyomda daha iyi statlı yiyecekler bulmalıyız, hem tokluk hem özellik"):** ileriki biyomun yiyeceği hem daha çok doyurur hem etkisi daha uzun sürer hem de daha çok can verir. Orman'dan başlayarak zehirsiz her toplanan yiyecek biyom başına **+3 can** verir (Orman 3, Bataklık 6, Kayalık Dağ 9, Kül Diyarı 12, Mor Kristal 15, ACT 2'de 18–21); bazılarının ayrıca ek canı vardır. Etki süresi: Çayır **60 sn**, Orman 90, Bataklık 120, Kayalık Dağ 150, Kül Diyarı 180, Mor Kristal **210 sn** (ACT 2'de 240–270).

| Biyom | Yiyecek · tokluk · etki (anında can) |
|---|---|
| Çayır | Böğürtlen 5 (+4 can) · Yaban çileği 6 Çeviklik · Yabani erik 6 Çeviklik · Yabani armut 7 Doygunluk · Yabani elma 7 Canlılık (+2 can) · Yabani havuç 5 Gece gözü |
| Orman | Ahududu 9 Şifa · Yaban mersini 9 Gece gözü · Fındık 8 Güç · Ceviz 8 Dayanıklılık · Yabani bal 12 Çeviklik (+7 can) · Akçaağaç özsuyu 8 Canlılık · Tavuk mantarı 8 · Yabani mercimek 7 · Yabani nohut 7 (hepsi +3 can) · Kuzugöbeği 8, Kuzukulağı 7, Meşe palamudu 6 (zehirli, can vermez) |
| Bataklık | Kızılcık 12 Pıhtı · Su kestanesi 12 (+14 can) (+6 can) · Mürver 11, Sinek mantarı 11 (zehirli) |
| Kayalık Dağ | Alıç 15 Şifa · Kestane 15 Doygunluk · Ur kekliği yumurtası 15 Güç · Kayın mantarı 14 (+9 can) · Kuşburnu 14 (+21 can) · Ardıç meyvesi 14 (zehirli) |
| Kül Diyarı | Ateş narı 19 Ateş kalkanı (+18 can) · Ateş biberi 17 Güç (+12 can) |
| Mor Kristal Vadisi | Ay elması 24 Dayanıklılık (+21 can) · Yıldız eriği 22 Çeviklik · Işık mantarı 21 Gece gözü (+15 can) |
| Yüzen Kayalar (ACT 2) | Bulut elması 26 Canlılık (+22 can) · Gök mantarı 25 Gece gözü (+18 can) |
| Dev Mantar Ormanı (ACT 2) | Goblin eriği 29 Çeviklik · Kök yumrusu 29 Doygunluk · Mantar şapkası 28 Şifa (+21 can) |

  Ekili ürünler (Havuç Gece gözü, Kabak ve Patates Doygunluk, Soğan Panzehir, Ayçiçeği Güç) ve Gece sefası (Gece gözü) bir biyoma ait değildir, eski değerlerindedir. Pişmiş yemeklerin tokluğu malzemelerinden hesaplandığı için ileriki biyomun meyvesiyle yapılan yemek de daha doyurucu olur. Arenada yemek yoktur; etkiler arenanın etki seçicisinde aynen vardır.
- **Bütün yemeklerin etkisi var (v3.35, Boğaç: "közlenmiş şeyler yalnızca tokluk veriyor; bütün yemekler toplanabilirler gibi ek özellik versin, fiyatına uygun, her biyomda daha kaliteli etkiler ve satış değerleri"):** yenebilen **her şey** (çiğ et ve balık, közlenmiş/pişmiş/kızarmış/kavrulmuş/haşlanmış/kurutulmuş/tütsülenmiş her şey, bütün yemek tarifleri, deniz balıkları ve yemekleri, ekili ürünler) tokluğun yanında **en az bir iyi etki** ve **can** verir. Kural:
  - **Kademe (biyom):** her yemeğin bir kademesi vardır: Çayır 0, Orman 1, Bataklık 2, Kayalık Dağ 3, Kül Diyarı 4, Mor Kristal Vadisi 5; ACT 2'de Yüzen Kayalar 6, Dev Mantar Ormanı 7, Hurda Çölü 8, Kristal Golem Ocağı 9, Ejder Volkanı 10, Gök Rıhtımı 11. Toplanan yiyecek kendi biyomunun, avın eti avlandığı biyomun kademesindedir; közlenmiş/pişmiş bir şey çiğinin kademesinde, bir tarif malzemelerinin en yükseğindedir. Biyomu belli olmayanlar (balıklar, deniz ürünleri, ekili ürünler, mağara avları) fiyatından kademelenir: 6 sikkenin altı 0 · 10'un altı 1 · 16'nın altı 2 · 25'in altı 3 · 40'ın altı 4 · 60'ın altı 5 · 90'ın altı 6 · 130'un altı 7 · üstü 8.
  - **Etki türü** (yemeğin kendi etkisi yoksa): et → **Güç**; balık ve deniz ürünü → **Gece gözü**; yumurta → **Dayanıklılık**; kuruyemiş, tahıl, baklagil, maya, yağ → **Doygunluk**; bal, reçel, komposto, ballı tatlı → **Çeviklik**; salata, yeşillik, çiğ meyve, sebze → **Canlılık**; mantar → **Gece gözü**; hiçbiri değilse **Doygunluk**. Pişmiş (közlenmiş ya da tarifle yapılmış) yemek kademe 3 ve üstündeyse ikinci etki olarak **Şifa**, kademe 5 ve üstündeyse ayrıca **Dayanıklılık** verir.
  - **Süre:** 60 sn + kademe başına 30 sn (Çayır 60 sn … Mor Kristal 210 sn … Gök Rıhtımı 390 sn); pişmiş yemekte +30 sn; en çok 420 sn.
  - **Can:** çiğ yiyecek kademe × 3 (zehirliler hariç; eskisi gibi); pişmiş yemek 4 + kademe × 5 (tariflerin eski can bonusundan hangisi büyükse).
  - **Satış değeri:** her yiyeceğin fiyatı kademesiyle artar: fiyat × (1 + 0,15 × kademe) (Çayır aynı, Orman +%15 … Mor Kristal +%75, Gök Rıhtımı +%165). Pişmiş yemeklerin tokluğu fiyatlarından hesaplandığı için ileriki biyomun yemeği biraz daha da doyurur.
- **Kötü etkiler** ucuz ve garip yiyeceklerde (ihtimal ucuzda %90, pahalıda %20): Ağırlık (−%20 hız), Halsizlik (enerji yarı hızda), Bulantı (can yenilenmez), Güçsüzlük (−%20 vuruş). Çiğ et ayrıca %35 ihtimalle 4 can yakar.
- **Zehirli yiyecekler:** Mürver, Meşe palamudu, Sinek mantarı, Kurt eti, Kurbağa (çiğ), Kuzukulağı, Kuzugöbeği, Mağara mantarı, Ardıç meyvesi. Bir kez yiyince listede "zehirli!" yazar.
- Bir yemeği ilk kez yiyene kadar listede etkisi "Bilgim yok" görünür.
- **Yemek listesi kategorili:** yemek listesi (yemek düğmesine basılı tut / sağ tık, bilgisayarda X'i basılı tut) artık tek uzun liste değildir. Üstte **kategori sekmeleri** vardır; yalnızca elinde o türden yiyecek olan sekmeler görünür ve her sekmenin yanında kaç çeşit olduğu yazar. Önce sekme seçilir, sonra o sekmedeki yiyeceğin **Ye** düğmesine basılır. Sekmeler (bu sırayla): **Meyveler** (çalı meyveleri, ağaç meyveleri, yemişler), **Sebze ve tahıl**, **Otlar**, **Mantarlar**, **Etler** (çiğ ve pişmiş), **Balıklar** (balık, kerevit, midye…; çiğ ve pişmiş), **Yemekler** (kazanda öğrenilen yemek tarifleri: çorba, güveç, reçel, kurutulmuş…), **Şifa** (merhem, çay gibi can veren tarifler), **Diğer**. Liste son seçtiğin sekmeyle açılır (o sekmede yiyecek kalmadıysa ilk dolu sekmeyle). Yemek düğmesine kısa basınca en uygun yiyeceği doğrudan yeme eskisi gibidir.

## Toplama ve tarım

### Balık tutma

- Alet: **Ağ** (en kolay), **Olta**, **Kemik zıpkın**. Eline al, suya dön, E. Şamandıra dalınca 1,05 sn içinde E (iki kez kaçırırsan balık gider), sonra gidip gelen ibre **yeşil alandayken** bir daha bas. Yürürsen ya da bir şey saldırırsa olta çekilir.
- Zor balıklar (yeşil alan dar): Mersin balığı, Turna balığı, Yayın, Alabalık, Tatlısu levreği.
- Her atışta %5 çöp (Dal, Yosun, Kemik), gece ayrıca %5 **Mor kıymık**.

| Sular | Ne çıkar (ağırlık) |
|---|---|
| Çayır/Orman · deniz | **kıyıdan tutulmaz**; deniz balıkları Poyraz'la denize açılınca ("ACT 1 › Gemici Poyraz ve deniz") |
| Çayır/Orman · nehir ve göl | Alabalık 28, Kızılkanat 20, Tatlısu levreği 20, Çapak 16, Sazan 14, **Tatlısu kefali 12**, Tatlısu midyesi 10, Yılan balığı 9 |
| Bataklık / Kayalık Dağ (nehir ve göl; deniz kıyısında tutulmaz) | Yayın 24, Kadife balığı 24, **Kerevit 22**, Turna balığı 18, Yılan balığı 12, Tatlısu midyesi 12, Sazan 10 |
| Kül Diyarı / Mor Kristal Vadisi (nehir ve göl) | Yayın 30, Mersin balığı 22, Turna balığı 22, Kadife balığı 14 |

### Tuzaklar ve balık kapanı

- En çok **6** tuzak + kapan (toplam). Haritada kahverengi kare, dolunca sarı.
- **Tuzak:** elde Tuzak, çimen ya da orman zeminde E. 110–230 sn sonra bir av düşer: Çayır/Orman'da Tavşan, Keklik, Sincap; Bataklık/Kayalık Dağ'da Ördek, Keklik, Tavşan; doğuda Tavşan. Avın normal ganimetini verir.
- **Balık kapanı** (2 Sepet + 3 İp + 1 Dal; Dursun döver): elde kapan varken yakındaki suya E, kapan suyun kenarına konur. 130–250 sn sonra **o bölgenin balık listesinden 2 balık** (yukarıdaki tablonun nehir satırları; kapan ağırlığa bakmaz, listedeki her balık eşit ihtimalle çıkar). Kerevit yalnızca Bataklık/Kayalık Dağ sularında çıkar: her çekilişte 1/7, yani bir kapan boşaltmada yaklaşık %27 ihtimalle en az bir kerevit.
- Dolu tuzağa E: av alınır, tuzak kendiliğinden yeniden kurulur ve dayanıklılığı 1 düşer (Tuzak 20, Kapan 40 kullanım). Boş tuzağa E: "Bekle" ya da "Tuzağı topla". Her av +4 XP.

### Gece buluntuları

Karanlık çökünce (gece), ışık olmayan çimen ve orman zemininde çevrende belirir, sabah kaybolur:

- **Gece sefası:** yakınında 3 tane (Kül Diyarı'nda ve Mor Kristal Vadisi'nde çıkmaz). Yenir (+5 tokluk, Gece gözü 120 sn). Zümrüt'ün görevi ve Işıkçı takası için.
- **Mor kıymık:** 1 tane (3. günden sonra 2). Işıkçı takası; Zümrüt'e 2 tane verince sıradaki anı erken gelir.
- **Ateş böcekleri:** gece sefalarının çevresinde; yalnızca görüntü.

### Tarım

> **Tarlacılık şimdilik oyunda yok** (bkz. Açıklar · İleride: Tarlacılık). Aşağıdaki eski düzen ileride geri gelirse başlangıç noktasıdır.

Bkz. "Çiftçi Ekin". Tarla 4 × 3 = 12 parsel. Adımlar (aletler çantada, E): tırmıkla hazırla → tohum ek → **sula** (yalnızca sulanmış tohum büyür; yağmur da sular) → olgunlaşınca tırpanla biç.

| Ürün | Büyüme (sulanmışken) | Hasat | Tohum fiyatı | Ürün fiyatı |
|---|---|---|---|---|
| Buğday | 60 sn | 2–4 | 3 | 8 |
| Havuç | 80 sn | 2–4 | 4 | 10 |
| Soğan | 90 sn | 2–4 | 4 | 10 |
| Patates | 100 sn | 2–5 | 5 | 12 |
| Ayçiçeği | 120 sn | 2–3 | 6 | 16 |
| Kabak | 150 sn | 1–2 | 8 | 24 |

Hasatta %45 ihtimalle 1 tohum geri gelir. Tohum Ekin'in ödüllerinden, hasattan ve (bir kez görüldükten sonra) Nazlı'dan alınır. Meyve ağaçları silkelendikten 150 sn sonra yeniden meyve verir.

## Ev, harita ve defterler

### Ev, ev içi ve döşeme

- Ev **Usta Sinan**'dan (Orman; v3.39'a kadar Marangoz Çınar) sikkeyle alınır, envantere gelir; bir yuvaya koyup yere kurarsın (Boşluk döndürür, Esc iptal). Taş ev de diğer evler gibi istediğin yere kurulur (Kemal'in yanındaki "SATILIK" arsa kaldırıldı; haritada arsa, tabela ya da arsa ipucu yoktur).
- **Evlerin görünüşü (v3.39, Boğaç: "ev eve benzesin, her ev farklı, pahalılaştıkça daha lüks"):** her ev kendine özgü çizilir ve fiyatı arttıkça daha görkemli görünür (envanterde, yerde ve kurulunca aynı resim):
  - **Yaprak barınağı** (25): çapraz dallardan bir çatma, üstü kat kat yapraklı, önünde kütük.
  - **Deri çadır** (300): direkleri tepeden çıkan, dikişli deri parçalarından konik çadır; boyalı bir şerit, açık kapı kanadı, kazıklar.
  - **Kulübe** (450): taş temel, dal örgü duvarlar, sivri saman çatı, alçak kapı.
  - **Kamış kulübe** (650): kısa kazıklar üstünde, demet demet kamış duvarlar, dik kamış çatı, kamış perdeli kapı ve küçük merdiven.
  - **Kerpiç ev** (950): sıvalı kerpiç duvarlar, düz dam ve korkuluğu, duvardan çıkan ahşap kirişler, küçük derin pencere, mavi ahşap kapı, kapıda testi ve dama merdiven.
  - **Ahşap ev** (1.500): kalas duvarlar, kiremit çatı, panjurlu pencereler, taş baca, çiçeklik, basamak.
  - **Taş ev** (2.500): yontma taş duvarlar, arduvaz çatı, dumanı tüten baca, kemerli kapı, ışığı yanan pencereler, köşede sarmaşık, taş basamaklar.
  - **Konak** (5.000): iki katlı, beyaz sıvalı ve ahşap kirişli duvarlar, kiremit kırma çatı ve iki çatı penceresi, iki sütunlu ve üçgen alınlıklı giriş, çift kanatlı kapı, ışığı yanan çok pencere, iki baca, fenerler ve çalılar.
- Yaprak barınağı dışındaki her evde **F = içeri gir**. **F önceliği (7 Kasım 2026, Boğaç: "Önce yerdeki envanter olmalı"):** F her zaman **önce yerdeki eşyayı** alır (ayağının dibindeki düşmüş eşya ve yerdeki toplanabilir; Kontroller'deki kural); yerde alınacak bir şey yoksa kişi (konuş), ev kapısı (içeri gir), kamp ateşi, kurulu tuzak ve diğerleri seçilir. İçeride ada donar (canavarlar, oklar durur) ama saat, açlık ve hava sürer. **İçeride mor ışık gelmez.**
- Üst çubukta **Döşe** / **Dışarı çık**. Döşe kipinde envanterdeki ev eşyasını seç, ızgarada bir kareye tıkla (R ya da seçili eşyanın yanındaki görünür **Döndür** düğmesi döndürür; Döndür düğmesi yalnızca kare olmayan eşyalarda, ör. 1×2, 2×3, görünür); konmuş eşyaya tıklayınca geri alırsın. Kapının önü boş kalmalı; duvar eşyaları (raf, asma fener, perde, duvar halısı, resimler) üstteki duvar şeridine, halı ve kilim zemine (üstünden yürünür), diğerleri zemine konur. Eşyalar üst üste konmaz. **Döşeme her saatte yapılabilir;** gece kısıtı yalnızca uyku içindir.
- **Ev içinde ekran:** ev içindeyken (Döşe kipi dışında da) alet çubuğu ve uyarılar odayı, kapıyı ve duvar şeridini örtmez; oda bu alanların arasına sığdırılır. Telefonda ev içinde **Vur** düğmesi gizlidir ve sol menü kapalı başlar.
- **Döşe kipinin ekranı:** Döşe kipinde oda bütün ekranı kullanır. Eşya listesi odayı örtmez, ekranın altında **yatay bir şerit** olarak durur. Alet çubuğu, sol menü ve dövüş düğmeleri gizlenir; duyurular Döşe kipi bitene kadar bekler. Telefonda (yatay) eşya şeritten seçilip odadaki kareye **dokunarak** yerleştirilir.
- **Yatak uyarısı:** "Yatağı yerleştir…" yazısı evin içine bir yatak konunca hemen kalkar.
- Ev eşyaları: yataklar (Hasır yatak 1×2, Hasırotu yatak 1×2, Ahşap karyola 2×2), lambalar (Taş lamba, Kil lamba, Asma fener), Taş/Çömlek fırını 2×1, Tabure, Sandalye, Masa 2×1, Sandık, Dolap, Raf, Halı 3×2, Kilim 2×1, Perde, Duvar halısı, Saksı, Boyalı çömlek, Kil figürin, Ana tanrıça heykelciği, Taş totem, Su testisi, Mağara resmi, Av sahnesi duvar resmi, El izi resmi. Hepsi kazanda öğrenilir ve **Usta Sinan** yapar.

- **Ev fiyatı (tek tanım, 6 Kasım 2026, Boğaç):** aşağıdaki tablodaki fiyat, evi Usta Sinan'dan sipariş edince ödenen **toplam sikkedir: malzeme ve işçilik dahil**, ayrıca malzeme istenmez. Fiyat seviyeyle artan bir merdivendir (Deri çadır 300 → Kulübe 450 → Kamış kulübe 650 → Kerpiç ev 950 → Ahşap ev 1.500 → Taş ev 2.500 → Konak 5.000); başka bir fiyat kuralı (alt fiyat vb.) evlere uygulanmaz. Tek istisna Yaprak barınağı: 25 sikke ve malzemesi (8 Dal, 12 Yaprak, 4 Lif). Tarifi kazanda öğrenilmiş evler (Deri çadır, Kulübe, Kamış kulübe, Kerpiç ev) kendi malzemenle de Sinan'a yaptırılabilir; o zaman yalnız işçilik ödenir (Sistemler › Ekonomi); Sinan'ın ev listesinde bu evlerin altında "Kendi malzemenle: işçilik N sikke" satırı görünür. Eşya dizinindeki fiyat, evin **satış** değeridir.
- **Konmuş eşyayı taşımak:** Döşe kipinde konmuş bir eşyaya dokununca/tıklayınca küçük bir menü açılır: **Taşı / Geri al / Döndür**. Eşya sürüklenip başka uygun bir kareye bırakılabilir; bırakılan yer uygun değilse eşya eski yerine döner.
- **İlk girişte Döşe kendiliğinden:** çantada ev eşyası varken bir eve **ilk kez** girince Döşe kipi kendiliğinden açılır (yalnızca ilk girişte).

| Ev | Seviye | Fiyat (sikke) | Oda | Not |
|---|---|---|---|---|
| Yaprak barınağı | 1 | 25 + malzeme | yok | Bir gecelik, yatak istemez |
| Deri çadır | 3 | 300 | 5×4 | |
| Kulübe | 4 | 450 | 6×4 | |
| Kamış kulübe | 5 | 650 | 7×5 | |
| Kerpiç ev | 6 | 950 | 8×6 | |
| Ahşap ev | 7 | 1.500 | 9×6 | |
| Taş ev | 8 | 2.500 | 10×7 | İstediğin yere |
| Konak | 10 | 5.000 | 12×8 | |

### Harita, işaretler, defterler

- **Görev dışı süs işaret yoktur:** haritanın keşfedilmemiş yerlerinde görevle ilgisi olmayan süs işaretleri (gelip giden "?" gibi) yoktur; haritadaki her "?" bir yan görev işaretidir.
- **Harita açıkken ekran yazıları üstüne binmez:** büyük harita açıkken gün başı yazısı ("YENİ BİR GÜN · N. Gün") ve benzeri ekran ortası duyurular harita penceresinin üstüne çizilmez; harita kapanınca gösterilir. Haritadaki yan kişi işaretleri yalnızca yan görev kuralına göre çıkar (ACT 1 › Yan görevler › Haritada yan görevler: keşfedilmiş yerde kişinin yerinde "?", keşfedilmemiş yerde yakınken sisli daire; biyom başına en çok 2).
- **Bekleyen duyurular sırayla gelir:** harita, Döşe kipi, bir ara sahne ya da bir pencere yüzünden bekleyen duyurular, engel kalkınca **sırayla** gösterilir; her biri kendi süresi kadar ekranda kalır, üst üste binmez. Açık dünyada aynı anda gelen duyurular da (ör. gün başı yazısıyla birlikte "Tarla genişledi" gibi küçük bildirimler) aynı kurala uyar: sırayla gösterilir, üst üste binmez.

- **Kazan, Demirhane ve Pazar düğmesiz:** sol menüde Kazan, Demirci ve Pazar düğmeleri, B / T / P kısayolları ve uzaktan basınca yol gösteren ok **yoktur**. Kazan Zümrüt'ün yanında kazana dokunarak, demirhane Dursun'la (ya da kuzen demircilerle) konuşarak, pazar Nazlı'yla konuşarak açılır; yerlerini oyuncu kendisi bulur (öğreticinin ve görevlerin kendi okları sürer).
- Sağ altta küçük harita; **M** büyük harita (tekerlek, sürükleme ya da +/− ile yakınlaştır). Geçtiğin yerin çevresi açılır (Kâşif gözü ile iki kat). Gece harita kararır ama kişiler görünür.
- **Telefonda büyük harita:** küçük haritaya dokununca açılan büyük harita pencerenin bütün boşluğunu kaplar (adanın en-boy oranıyla, sığan en büyük boy). Renk açıklamaları ve bilgi yazısı (keşif yüzdesi, nasıl kaydırılır) haritanın altında yer kaplamaz; sağ üstteki +, −, ◎ düğmelerinin altındaki **i** düğmesiyle haritanın üstünde açılıp kapanır (varsayılan kapalı, keşif yüzdesi açıklamanın ilk satırında). Bilgisayarda değişiklik yok.
- **N** bulunduğun yere işaret koyar (ad + 5 renk, en çok 40). Büyük haritada bir kişinin simgesine dokununca ok onu gösterir; varınca, ✕ ile ya da **sağ tıkla** kalkar. Kendi işaretinde "Yol göster".
- Haritada: bayıldığın yerler (kurukafa), kurduğun ev/yatak/tuzaklar, kişiler.
- **Haritada kendi işaretin sabittir:** haritadaki (küçük ve büyük) kendi yüzünün çevresindeki sarı hale **yanıp sönmez**, hep açık durur (eskiden saniyede üç kez açılıp kapanıyordu).
- **Haritada deniz baştan açıktır:** küçük ve büyük haritada **bütün deniz karoları** (adayı çevreleyen deniz) keşfedilmemiş gri dumanla örtülmez; baştan görünür. Yalnızca kara, nehir ve göl keşfedilince açılır. Bu yalnızca **çizimdir**: deniz karoları "keşfedilmiş" sayılmaz, bu yüzden keşif yüzdesi, "Adayı tanı" adımı ve Kâşif başarımı eskisi gibi karadan hesaplanır.
- **Duraklatınca hava ve ortam durur:** Esc menüsü (ya da oyunu durduran herhangi bir pencere: harita, yetenek ekranı vb.) açıkken arkadaki oyun **tamamen donar**: yağmur damlaları, sis kayması, ateşböcekleri, havadaki toz/yaprak gibi ortam hareketleri ve yağmurun su halkaları da durur; menü kapanınca kaldığı yerden sürer (eskiden menüde yağmur ve sis akmaya devam ediyordu). Çizim yine yapılır, yalnızca zaman ilerlemez.
- **Görevi olan kişiler büyük haritada parlar:** görev veren her kişinin simgesinin üstünde **!** yazar ve simge parlar (arkasında sarı bir ışık ve dışa doğru açılan iki sarı halka); haritayı açan nereye gideceğini hemen görür. Başka görev işareti yoktur (kural: ACT 1 › Ana görevler › Temel kurallar, 2. madde). Şu an üstünde çalıştığın görevin kişisi ayrıca sarı zeminli işaretle gösterilir.
- **Keşif defteri** (Kitap): her tarif kategorisinde yaptığın tariflerin oranı. **%25** → sikke, **%50** → kalıcı **ustalık**, **%100** → sikke + 100 XP. Ustalıklar: Yiyecek (tokluk %20 yavaş iner), Şifa (can 1,5 kat hızlı), alet kategorileri (%20 körelmeme), Giyim ve Zırh (+5 savunma), Ateş (meşale %30 uzun), Ağaç (odun %20 hızlı), Taş ve kil (%20 hızlı), Av ve hayvan (ganimet +%10); diğerleri o kategorinin eşyalarını %15 pahalı sattırır.

### Almanak

Sağ altta, küçük haritanın hemen üstünde **Tarif kitabı**'nın solunda küçük bir **kitap** simgesi (kısayol **U**, Ayarlar → Kontroller'den değişir). Haritanın üstündeki üç düğme (Almanak, Başarımlar, Özellikler) **eşit boyuttadır** ve üçü birlikte haritanın genişliğini geçmez. Telefonda düğmeler sağ sütunda alt alta. Adanın canlılarını bölge bölge gösterir.

- **Sol sütun: keşfettiğin biyomlar.** Yalnızca adım bastığın biyomlar görünür, ilk girdiğin sırayla. Çayır'dan hiç çıkmadıysan yalnızca Çayır vardır; Orman'a ilk adım attığında ekranda "Orman" yazısı çıkar ve almanakta **2. satır** olarak Orman açılır. Henüz bilmediğin biyom hiç gösterilmez (sayı da yazmaz).
- **Sağ taraf: seçili biyomun bütün canlıları** (o biyomda karşılaşılabilecek her tür, gece çıkanlar ve seviyeyle gelenler dahil). Her canlı bir kart:
  - **İlk kez öldürülene kadar:** kapkara bir siluet ve **???**; hiçbir bilgi yok.
  - **İlk kez öldürülünce açılır:** resmi, adı, huyu (zararsız / nötr / saldırgan), can, hasar, hız, uzaktan saldırısı ve bıraktığı etki (zehir, yanık…), düşürdükleri, kaç tane avladığın.
  - **Saldırılar ve etkiler:** açılan kartta ayrıca şunlar yazar: **Saldırılar** (ısırık/vuruş hasarı; uzaktan saldırıyorsa kaç mermi attığı ve kaç saniyede bir), **Etki** (her isabette bıraktığı zehir/kanama/yanık: saniyede yaklaşık kaç can, kaç saniye), **Özel hamleler** (her biri kısa açıklamasıyla: Sıçrama · iniş çevresine hasar ve itme; Hücum · çarparsa uzağa iter; Sersemleten kükreme · 1,1 sn sersem; Alev püskürtme · yanık; Buz parçaları · 1,3 sn donma; Ağ · 3 sn yavaşlama; Şok · 0,8 sn sersem; Zehir gölü · yerde 5 sn zehir; Yakalayıp fırlatma · savuşturulamaz; Üçlü saldırı · üç vuruş), **Özellikler** (Bağışıklık · ara sıra kısa süre hasar almaz; Çevik · mermilerden ve vuruşlardan yana sıçrar; İri · sıçrama ve hücumu kırmızıdır, savuşturulamaz) ve Reisi olan türlerde **Reisin ek hamleleri** (Reis her zaman kükreme ve üçlü saldırı da yapar). Bilgiler canlının gerçek değerlerinden gelir.
  - **Reis sayacı:** kartın altında "Reis: 3 / 7" (o türden kaç avladın / Reis için kaç gerekir). Sayaç dolunca Reis gelir.
  - **Reis yenilince kart altın rengine döner** ("Reis yenildi"). Her türün Reisi **yalnızca bir kez** yenilir: kart altına boyandıktan sonra o türden ne kadar avlarsan avla Reis bir daha gelmez.
- **Yeni canlı almanağa eklenince:** bir türü **ilk kez** öldürdüğünde ekranın ortasında büyük bir yazı çıkar: canlının adı ve altında "**Almanağa eklendi** · U ile bak" (yeni malzeme bulunca çıkan yazıyla aynı yerde, sıraya girer). Her yeni tür için bir kez; Reisler ve ders canlıları sayılmaz.
- **İlk avında almanak gösterilir:** oyunda **ilk kez** bir canlı öldürdüğünde (almanakta hiç açık kart yokken) Almanak düğmesi **mavi parlar** ve yanında yanıp sönen bir **ok** olur (öğreticinin gösterme kuralı gibi); ekranda "Almanağı aç: U" yazar. Parlama ve ok, Almanak açılınca söner. Telefonda düğme ☰ menüsünün içindeyse önce ☰ parlar.
- **Bakılmamış yeniler sayılır:** almanağa yeni bir şey girince (bir canlıyı ilk kez avladığında kartı açılır; bir **Reis**'i yendiğinde kartı altına döner) Almanak düğmesinin köşesinde **bakmadığın yenilerin sayısı** kırmızı bir rozetle yazar. Almanağı açınca o kartların köşesinde **"YENİ"** yazar; sol sütunda bölgenin yanında da o bölgedeki yeni sayısı görünür. Kartın **üstüne fareyle gelince** (telefonda karta dokununca) "YENİ" kalkar ve sayı bir azalır; hepsine bakınca rozet kaybolur. Bakılanlar kayıtla saklanır; eski bir kayıt açılınca o ana kadarki her şey bakılmış sayılır. ("yeni bir şey olmasa da yanıyor") sayı yalnızca almanakta kartı olan canlıları sayar (kartı olmayan ders/ikinci ada/arena canlıları sayıyı hiç söndürmüyordu). Kartta "yeni" etiketi adın yanında küçük, sabit bir yazıdır (resmin üstüne binmez, yanıp sönmez).
- **Rozet ve düğme yanıp sönmez, yavaşça nabız atar (7 Kasım 2026, Boğaç: "Bu çok hızlı yanıp sönüyor"):** sol menüde yeni bir şey olunca dikkat çeken düğmeler (Kitap/Almanak düğmesi ve üstündeki kırmızı sayı rozeti) ani açılıp kapanarak yanıp sönmez; **yavaş, yumuşak bir nabız** atar: bir döngü ~**1,8 sn**, saydamlık ve büyüklük yumuşakça artıp azalır. Bakılmamış yeni kaldıkça nabız sürer.
- **Kartlar aynı boyutta:** almanaktaki her canlı kartı aynı yüksekliktedir (300 px, telefonda 270 px); uzun yazı (hareketler, tarifler) kartın içinde kaydırılır, satırları uzatmaz. Ad tek satırdır; sığmazsa "…" ile kısalır, üzerine gelince tamamı görünür.
- **Başka bölgenin canlısı:** her canlının kartı kendi bölgesinin sayfasındadır (Engerek → Orman). Yan görevde başka bölgenin canlısı çıkar (Bataklık'taki görevde Engerek, Kayalık Dağ'da Kurt, Çayır'da Yaban domuzu); onu avlayınca kartı **görevin bölgesinin sayfasında da** en sonda görünür, altında "Başka bölgenin canlısı · yan görevde karşına çıktı" yazar. Bu konuk kartlar o sayfanın sayısına (x / y canlı) katılmaz. Eskiden "Almanağa eklendi" yazıp avladığın bölgenin sayfasında görünmüyordu. Ayrıca henüz gitmediğin bir bölgenin canlısını avlarsan (ör. Orman'ın kenarından seni kovalayıp Çayır'a giren bir Engerek) o bölgenin sayfası almanakta açılır; sayfada yalnızca avladıkların görünür, gerisi ??? kalır.
- **Reise yenilirsen:** Reis sahadayken (ya da gelmek üzereyken) bayılırsan Reis kaybolur ve sayaç **bir eksik** kalır (ör. 6 / 7), sanki onu çağıran son av hiç yapılmamış gibi. O türden bir tane daha avlayınca Reis yeniden gelir; yenene kadar böyle sürer. (Bayıldıktan sonra 60 sn hiçbir Reis gelmez kuralı geçerli.)
- **Yıldızsızlar sayfası (v3.30):** ilk mor ışık saldırısından sonra biyomların altında ayrı bir **Yıldızsızlar** sayfası çıkar (bkz. Mor ışık saldırıları).
- Almanak açıkken oyun durur. Kaydedilecek yeni bir şey yok: biyomlar, avlar ve Reisler zaten kayıtta; eski kayıtlarda bugüne kadar avladıkların açık gelir.

### İzler ve anılar

- **İzler** (Kitap → İzler): eşinden kalan 6 mor parıltı. **Kelebekli kolye** (Çayır kumsalı; sevdiğin kişinin cinsiyeti ne olursa olsun kolyedir, ona senin aldığın kolye; üstünde **beş lacivert kelebek**, üçü altta, ikisi üstte; zinciri kopmuş; eskiden kadınsa "Kopmuş kolye", erkekse "Kopmuş bileklik"), Islak defter sayfası (Orman), Tuhaf metal parçası (Bataklık), Çamurdaki izler (Doğan'ın güneydoğusu; yanında kadınsa bir küpe, erkekse deri bir cüzdan), Yıldız haritası ve Mor kristal (doğu). Üstüne gidip E. Sonuncusu "Gerçek" sahnesini açar.
  - Kolyenin yazısı: "Kumun içinde bir şey parlıyor: ince bir zincir, üstünde beş **lacivert kelebek**, üçü altta, ikisi üstte. Bu, {L} için aldığın kolye! 'En sevdiğim kolye oldu' demişti. Zinciri kopmuş, ama kıyıya vurmuş. Demek ki o da bu sularda bir yerdeydi…"
- **Anılar** (Kitap → Anılar,: "asıl hikâye"). **ACT 1'in anıları romantik ve güzel olan kısımdır; mor ışık ACT 2'de öğrenilir.** Anılarda "sen" oynadığın karakter, "o" sevdiğin kişidir (karakter yaratmada 2. adımda seçilen; cinsiyeti ne olursa olsun roller aynıdır). Her biri +25 + 15 × iç sıra XP (oyunun anı listesindeki yeri, 0'dan; 25 ile 505 arası). Anı sahnesi Esc ya da dışına tıklamayla kapanırsa sonuna kadar okunmuş sayılır (XP ve anı defteri aynı; Konuşma penceresi kuralı).
  - **ACT 1 · 22 anı, her zaman bu sırayla gelir** (sıra atlanmaz; bir anı gelmeden sonrakisi gelmez):

| # | Anı | Ne oluyor | Resim |
|---|---|---|---|
| 1 | Sınıfta bir doğum günü | Üniversitede **aynı sınıftasınız** ama hiç konuşmadınız. Bir arkadaşınızın doğum günü kutlanıyor; pastayı o keser. O: "Ben keserim! Herkese yetecek, merak etmeyin." "Dilim dilim herkese dağıttı. Son tabağı da uzattığında pastadan ona hiç kalmamıştı. Hiç dert etmedi; gülümsedi." "Sen o gülümsemeye **hayranlıkla** baktın. {Saçları} pencereden gelen ışıkta parlıyordu. Onu ilk kez o gün gerçekten gördün." | Sınıf: yeşil tahtada "İyi ki doğdun!", pencereden ışık, arkadaşlar, mumlu pasta; dilimler arkadaşlara gider, sonunda boş tabak. **v3.32 (Boğaç: pasta karakteri kapatıyordu):** küçük masa ve pasta ikinizin arasındadır; sen solda, o masanın sağında, yüzü sana dönük, ikiniz de tam görünürsünüz |
| 2 | Voleybol | **Okulun voleybol sahasında** arkadaşlarla maç, aynı takımdasınız (**komik anı**; o çok iyi oynar, sen beceremezsin). Sen: "Merak etme, ben buradayım. Top bana gelsin yeter." "Top sana geldi; kaçırdın. Bir daha geldi; kafana çarptı. Üçüncüsünde fileye takıldın." "O ise her topa yetişti, her smaçı vurdu. Sayıyı alınca dönüp sana baktı." O: "Top bana gelsin yeter, öyle mi? Sen bu sefer sadece alkışla!" "Maçı o kazandı. Sen bütün maç boyunca ona baktın." | Okul binasının önünde çizgili saha, file, arkadaşlar; top kafana çarpar (başında yıldızlar), o zıplayıp smaç vurur |
| 3 | Konser | Voleyboldan birkaç gün sonra bir yaz konseri: kalabalık, renkli ışıklar. O: "Bu şarkıya bayılıyorum!" **İlk kez birbirinizden etkilendiğiniz gece:** "Şarkı boyunca gözleriniz birkaç kez buluştu. İkiniz de hemen başka yere baktınız; ama ikiniz de gülümsüyordunuz." Sonra **onu evine bırakırsın**: "Kapıda bir an durdu, el salladı. Eve dönerken hâlâ gülümsüyordun." | Gece sahne, renkli ışık hüzmeleri, dans eden kalabalık, notalar; son satırda ay ışığında onun evi, kapıda el sallar |
| 4 | Açık hava sineması | Yaz gecesi, arkadaşlarla açık hava sineması; **sen o gece gelemezsin**. "{L} perdeye pek bakmadı. Gözü hep girişteydi; gelen her gölgede seni aradı." O (gece sana yazdığı mesajda): "Film güzeldi… ama yanımdaki yer boş kaldı." "O mesajı okuyunca anladın: o da seni düşünüyordu." | Gece, büyük perde, arkadaşlar; o battaniyede tek başına, yanındaki yer boş (kesik çizgi); girişe bakar, sonra telefonunda mesaj balonu |
| 5 | Maket ödevi | **Gündüz** (gece değil), güneşli bir öğleden sonra okulun atölyesinde bir **maket**. **O ödevi anlıyor;** iş yalnızca el oyalayıcı olduğu için sen yardım edersin: "Ödevi o çoktan çözmüştü; ama minicik parçaları kesip yapıştırmak saatler sürecekti." O: "Nasıl yapılacağını biliyorum… sadece bu ufacık parçalar bitmek bilmiyor!" Sen: "Sen ölçüp çiz, ben keseyim. Çatıyı da ben tutarım." "Akşam olmadan maket bitti; küçük evin çatısı dimdik duruyordu. 'İyi ki geldin,' dedi. O cümleyi günlerce düşündün." | Güneşli atölye, pencereden ışık, raflarda kartonlar; masada küçük karton ev, çatısı eğri eğri sallanır, son satırda düzgün durur; yapıştırıcı, maket bıçağı |
| 6 | Bir mesaj | Gece, odanda; yazıp yazıp siliyorsun. Sen (mesaj): "Yarın yanıma sevgilim olarak gelir misin?" Üç nokta… O: "Bunun cevabı için sana sarılmam lazım." "Ertesi gün geldi ve sana sarıldı. Cevap buydu. O gün sevgili oldunuz." | Karanlık oda, telefon ışığı, mesaj balonları; son satırda sarılma |
| 7 | Otogarda | **Gece**, otogar, peronların ışıkları yanıyor, otobüs kalkmak üzere. "O çok utangaçtı; 'seni seviyorum' demeye bir türlü dili varmıyordu." O: "Kendine dikkat et… tamam mı?" "Otobüse binmeden bir an durdunuz. Ve ilk kez öpüştünüz. Söyleyemediği her şey o andaydı." | Gece otogar: yıldızlar, ay, peron lambaları, camları yanan otobüs; kalp |
| 8 | Yağmurda şemsiye | **Gündüz, bardaktan boşanırcasına yağmur**. "Sen hiç şemsiye taşımazdın. O gün yoldaki bir büfeden bir şemsiye aldın: **o ıslanmasın diye**." O: "Sen şemsiye taşımazdın ki?" Sen: "Bunu senin için aldım." "İkiniz de aynı şemsiyenin altına sığdınız; ikinizden de tek damla su süzülmedi. Yağmurun sesi hiç bu kadar güzel gelmemişti." | Gri gündüz, bulutlar, ıslak sokak ve binalar, büfe, su birikintilerinde halkalar; yağmur şemsiyenin altına girmez, kenarından damlar |
| 9 | Bisiklet | Bir gün iki bisiklet kiralarsınız; yan yana, ağır ağır, ağaçlı bir yolda. O: "Yavaş git, bu an bitmesin." "Yol bitti, siz bitmesin diye bir tur daha attınız." | Ağaçlı yol, gün batımı, dönen tekerlekler, uçuşan yapraklar |
| 10 | Waffle | Başka bir gün, küçük bir kafe, pencere kenarı; çikolatalı, çilekli kocaman bir waffle. O: "Yarısı senin… ama çilekler benim!" "Bir ara göz göze geldiniz. Sen gözlerini ondan alamadın." O (kızararak): "Öyle süzük süzük bakma… utanıyorum." "Burnunun ucuna çikolata bulaşmıştı. Söylemedin; biraz daha öyle kalsın istedin." | Kafe masası, waffle, iki fincan, buhar |
| 11 | Peçeteden gül | Bir kafede, kahveler gelene kadar peçeteyi katlayıp **peçeteden bir gül** yaparsın, gerçeğinden ayırt edilmez. O: "Dur, ben de yaparım! Bu kadar zor olamaz." "On dakika sonra masada bir şey vardı: saçak saçak, hiçbir şeye benzemeyen bir peçete." O: "Bu bir gül! …Biraz rüzgâr yemiş bir gül. Tamam… sadece bir peçete. Gülme!" "Güldün. O da güldü. Kahveler geldi, gülmeye devam ettiniz." (komik anı) | Kafe masası, fincanlar; senin önünde beyaz, katlanmış bir **peçete gülü** (kat kat yapraklar, burgulu peçete sapı, peçeteden bir yaprak; şekere benzemesin), onun önünde saçak saçak, hiçbir şekle benzemeyen bir peçete, üstte soru işaretleri |
| 12 | Sinema biletleri | Defalarca sinema: komedi, korku, aşk filmleri. "O her bileti saklardı: bir kutuda, tek tek, tarihleriyle." O: "Bunlar bizim. Bir gün sayarız, kaç film izlemişiz diye." | Salon, perde; önde bilet kutusu |
| 13 | Tavla | Bir akşam tavla. Sen: "Tavlada beni kimse yenemez." "Üç el üst üste kaybettin. Son elde bir de mars oldun." O (tatlı tatlı dalga geçerek): "Kimse yenemez, öyle mi? Dur, dur, kıpırdama…" "Tavlanın başında suratını asmışken telefonuyla fotoğrafını çekti; fotoğrafa şeytan boynuzu çizip altına kocaman 'LOSER' yazdı. O fotoğraf hâlâ telefonunda." | Masada **kapalı bir tavla kutusu** ve zarlar (tahta yüzleri kapatmasın, yüzler görünür); sen üzgün, o zıplıyor; flaş, sonra telefon ekranında fotoğrafın: **mor şeytan boynuzları tam kafanın üstünde** (v3.30, Boğaç; eskiden kırmızıydı ve kafanın çok üstünde havada duruyordu) ve kırmızı LOSER |
| 14 | Kardan kalp | Kar yağan bir gün; sokak lambalarının altında kar taneleri. Eğilip kardan **kalp biçiminde bir kartopu** yaparsın. Sen: "Bu sana. Ama atmak yok!" O (çok hoşuna gider): "Çok güzel! Erimesin diye ne yapacağım şimdi?" "Eriyene kadar eldiveninin içinde tuttu onu. Yanakları soğuktan mı kızarmıştı, yoksa…" | Karlı akşam, sokak lambası, yağan kar; elinden onun eline geçen beyaz kardan kalp |
| 15 | Çay kenarında kahvaltı | Bir sabah, **teklifin sonradan yapılacağı o çayın kenarında** kahvaltı: örtü, sıcak poğaçalar, ince belli bardaklarda çay. O: "Poğaçanın en sıcağı benim, haberin olsun." "Kuşlar, suyun sesi, buharı tüten çay. O sabah burayı çok sevdiniz." | Sabah, akan çay (teklifteki çayır ve ağaçlar), örtü, poğaça, çaydanlık, çay bardakları |
| 16 | Doğum günü pastası | Senin doğum günün, **parkta**: ağaçların altındaki bankta bir sürpriz. O: "Sürpriz! Kendim yaptım!" "**Yuvarlak** bir pasta; üstünde **siyah damla çikolatalardan** bir kalp. Yanında **bir şişe** soğuk limonata." "Hayatının en güzel pastasıydı. Limonatayı da ikiniz paylaştınız." | Park: gökyüzü, ağaçlar, çimen, yol, bank; bankta mumlu yuvarlak pasta, üstünde siyah damla çikolatadan kalp; yanında küçük bir limonata şişesi |
| 17 | Şatonun önünde | Yeşil tepeler, ağaçlar; arkada masallardan çıkmış beyaz bir şato (sivri kuleler, mavi çatılar). Yanda yapay bir göl, üstünde küçük bir korsan gemisi. Sen: "Dur, kıpırdama… şimdi gülümse!" "Deklanşör tıkladı. O fotoğrafta şato arkada kaldı; gözler hep ona gitti." | Gündüz, doğa, şato, göl ve korsan gemisi; deklanşörde beyaz flaş |
| 18 | Hamburger | Bir hamburgerci, kocaman iki hamburger. O: "Ben bunu bitiremem… sen yer misin?" "Seninki çoktan bitmişti. Yine de yedin. Sonra hep böyle oldu: yarısı hep sana kaldı." | Masa, iki **küçük** hamburger, patates, içecek; masanın ortasında, yüzleri kapatmaz |
| 19 | Kaktüs | İlk işin; evden çalışıyorsun. Kapı çalar: bir paket, içinde **küçük bir cam fanus** ve bir not. "Fanusun içinde minicik bir kaktüs, yanında el ele iki figür: siz." O (notta): "Yeni işin kutlu olsun! Sen çiçeğe bakamazsın, biliyorum. O yüzden dünyanın en dayanıklı çiçeğini yolladım. Bunu da öldürürsen konuşacağız." "Fanusu masanın köşesine koydun. Her gün ona baktın, her gün onu düşündün." | Evde çalışma masası, bilgisayar, kapıda paket; masada cam fanus: içinde kaktüs ve el ele iki küçük figür; not kâğıdı |
| 20 | Kelebekli kolye | Küçük bir kutu, ince bir zincir, üstünde **beş lacivert kelebek: üçü altta, ikisi üstte** (gümüş değil). Sen: "Görünce seni hatırlattı." O: "Çok güzel… Bu en sevdiğim kolye oldu!" Kelebekli kolyeyi (iz) bulduysan son satır: "Kumsalda bulduğun lacivert kelebekler… o kolyeydi." | Açık kutu, zincirde beş lacivert kelebek (3 altta, 2 üstte), etrafta uçan mavi tonlarda kelebekler |
| 21 | Yüzme dersi | **İlk tatiliniz** (teklifin hemen öncesi), masmavi deniz. O: "Ben yüzme bilmiyorum… beni bırakma ama!" Sen: "Bırakmam. Yeşil can simidin var, ben de buradayım." "Can simidinin içinde ayaklarını çırpmayı, kollarını açmayı gösterdin. Simidi sen tuttun, o yüzdü." (**yeşil bir can simidiyle** öğretirsin) "O gün yüzmeyi öğrendi. Her kulaçta dönüp sana baktı." | Deniz, güneş, şemsiye; ikiniz suda, o beyaz çizgili yeşil can simidinin içinde, yanında sen; son satırda simitsiz yüzer |
| 22 | Çay kıyısında söz | **Evlenme teklifi, son anı** (**yalnızca ACT 1'in sonunda, Barbaros'un gemisine binmeden hemen önce** gelir: Meltem yapılınca Barbaros'a "**Götür beni**" dediğinde önce bu anı oynar, kapanınca deniz yolculuğu başlar; tetiklerle gelmez. Metni aynı kalır, yalnızca **gece** geçer): "Bir yaz gecesi, ay ışığında bir çayır, ağaçların gölgesi, önünüzden şırıl şırıl bir çay akıyor. Kadehlerde şarap…" Biri erkek biri kadınsa erkek teklif eder, hemcinste oynadığın karakter (kuralı aynen). | Gece, ay ve suda yansıması, yıldızlar, ateş böcekleri |

  - **Resimlerdeki yazılar ("bu yazı hiç okunmuyor"):** anı resimlerindeki kelimeler (mesaj balonları, tahtadaki "İyi ki doğdun!", sinemadaki mesaj, PERON 7, BURGER, LOSER) küçük resmin içine çizilmez; resmin üstüne **gerçek yazı** olarak konur, resim ne kadar büyürse büyüsün keskin okunur (resimle birlikte büyür). Mesaj balonları uzun cümleye göre geniştir.
  - **Nasıl gelir:** her tetikte **sıradaki** anı gelir (1–21; 22. anı, teklif, tetiklerle gelmez, yukarıya bak; o ana kadar gelmemiş anılar sonra da sırayla gelmeye devam eder). Tetikler: kazanda **10, 25, 50, 100 ve 175** tarif (her eşik bir kez, gün şartı yok), **uyurken %40**, **bayılınca %60**, **bir görev bitince %30** (Kemal'inki dahil) ve Zümrüt'e **2 Mor kıymık** vermek (gün şartı yok). Uyku/bayılma/görev tetikleri gün şartına bakar: sıradaki anı en erken şu günde gelir: 1–3. anı 1. gün, 4–5. anı 2. gün, 6–7. anı 3. gün, sonra her anı bir gün sonra (8. anı 4. gün, 9. anı 5. gün, 10–11. anı 6. gün, 12. anı 7. gün, 13–14. anı 8. gün, sonra her anı bir gün sonra … 21. anı 15. gün), teklif (22.) gemiye binerken.
  - Kartın başlığı nasıl geldiğini yazar: "Bir rüya gördün" (uyku), "Bayılırken bir anı" (bayılma), "Bir anı geri geldi" (tarif, görev, Mor kıymık).
  - 22 anının hepsi gelince (sonuncusu kapanınca): "ACT 1'in bütün anıları geri geldi."
  - **İkinci adada** uyku/bayılma/görev tetiği önce mor ışık anılarından sıradakini getirir; onlar bitince ACT 1'in sıradaki anısını.
  - Kitap › Anılar'da önce ACT 1 (x / 22; teklifin yerinde "ACT 1'in sonunda, Barbaros'un gemisine binmeden hemen önce" yazar), sonra "ACT 2 · Mor ışık" (6 mor ışık anısı ve 5 usta anısı) listelenir; gelmemiş anının yerinde nasıl geleceği yazar.
  - **ACT 2 · mor ışığın anıları (10 anı):** ACT 1'den çıkarılan **mor ışıklı 5 anı** ACT 2'de gelir: Mor bir delik, Mektup, Son akşam, Bırakılan el, Mor fısıltı (metinleri ve resimleri aynı). Yalnızca ikinci adadayken, bu sırayla, uyurken (%40), bayılınca (%60) ya da görev bitince (%30) gelir; gün şartı yoktur. (için geçici; Boğaç ACT 2 anılarını ayrıca değerlendirecek.) Ustaların kilit görevleriyle gelen 5 ACT 2 anısı (Sahildeki ışık, Yıldızsız yolcular, Şapka, Mor gemi, Son söz) aynen kalır.
  - **Kaldırılan anılar:** Yağmurlu çarşı, Yanık ekmek, Kumsalda ilk dans, Kırık pusula ve Hastane koridoru oyundan tamamen çıktı (asıl hikâyeye uymuyordu; yağmur anısının yerini "Yağmurda şemsiye" aldı). ("böyle saçma bir anı asla olmaz") mor ışık anılarından **Yıldız haritası** da tamamen silindi. Çıkan anıların metinleri ve resimleri koddan da kaldırıldı.
  - Toplam **32 anı** (22 ACT 1 + 5 mor ışık + 5 usta). "Hatırladım" başarımı 32'yi ister.
- **Telefonda anı tam ekran:** dokunmatik ekranda bir anı gelince resmi ekranı kaplar (en-boy oranı korunur, ekrana sığan en büyük boy). Başlık ("Bir anı geri geldi" ve anının adı) üstte, anlatım yazısı ve Devam düğmesi altta, küçük yazıyla ve yarı saydam koyu zemin üstünde resmin **üstüne** biner. Bilgisayarda değişiklik yok.
- **Ada halkının hikâyeleri:** görev veren 8 kişinin her biri mor ışık yüzünden birini kaybetmiştir (Poyraz'ın hikâyesi yok); görevler hikâyeyi parça parça açar, sonunda bir sahne (+40 XP). Kitap → Ada halkı.

## Üs kurma

> **Üs kurma (7 Kasım 2026, Boğaç):** oyuncu dışarıda kendine bir üs kurar: yol ve zemin döşer, çit, duvar ve kapıyla bir avlu çevirir, mor ışığa karşı fener diker. Boğaç'ın kararları: fenerler **yalnızca mor ışıktan korur** (canavarı uzaklaştırmaz); Reis'ler tahtayı da taşı da kırar, orta güçteki hayvanlar yalnızca tahtayı, güçlü hayvanlar ikisini de; kırılan parça onarılır; çit ve zemini **oyuncu elle yapar**; **Derin kuşakta da** kurulur; yolda yürüme **%15 hızlı**; uçan canlılar çitin üstünden geçer ama kırmaz; tamamen çevrili avluda canlı doğmaz. Bu bölüm yalnızca oyunda olan parçaları anlatır.

### İnşa kipi

- **Açma:** sol menüde / ☰ içinde **İnşa** düğmesi; klavyede **N** (Ayarlar → Kontroller'den değişir); kolda Kol menüsündeki satır dışarıdayken **İnşa**, evin içindeyken **Döşe** olur. Evin içinde ve mağarada İnşa açılmaz (evde Döşe vardır).
- **Ekran:** oyuncunun çevresinde karo çizgileri görünür; altta Döşe'deki gibi yatay bir şerit: zemin, çit, duvar, kapı, fener ve çantadaki sayıları. Şeritte sınır da yazar ("1.950 / 2.000").
- **Koyma:** her parça **1 karo**dur ve ızgaraya oturur. Çit ve duvar komşularıyla kendiliğinden birleşir (uç, düz, köşe, T, haç).

  | Cihaz | Koy | Çizgi ya da dikdörtgen boya | Sil | Menü / döndür | Çık |
  |---|---|---|---|---|---|
  | Bilgisayar | tık | basılı tutup sürükle | sağ tık | R döndürür | Esc |
  | Telefon | dokun | sürükle | – | uzun dokun: menü | İnşa düğmesi |
  | Kol | A | A basılı + sağ çubuk | X | Y döndürür | B |

- Konmuş parçaya dokununca (Döşe'deki gibi) **Taşı / Geri al / Döndür** menüsü açılır. **Geri al:** parça çantaya tam döner. Yıkık parça geri alınmaz: onarılır ya da kaldırılır, kaldırılınca 1 malzeme bırakır. Sürükleyerek boyanır, sürükleyerek silinir.
- Uygun olmayan karoda hayalet kırmızıdır ve "Buraya konmaz" yazar (talimat vermez).
- **Dünya durmaz:** gece ve canavarlar sürer; inşa ederken vurulursan kip kapanır.

### Zemin ve yol

- Zemin ve yol karolarının üstünde ağaç, bitki, maden ve toplanabilir **çıkmaz**: ne ada kurulurken, ne yeniden doğarken, ne ağaç yeniden büyürken.
- Üstünden herkes yürür. **Yol** türlerinde oyuncu **%15 hızlı** yürür (binekte de).

| Parça | Tür | Tarif (el yapımı, kazanda öğrenilir) | Karo fiyatı |
|---|---|---|---|
| Toprak yol | yol | 2 Taş, 1 Kum → 4 | ~1 |
| Çakıl yol | yol | 3 Nehir çakılı, 1 Kum → 4 | ~2 |
| Ahşap parke | zemin | 1 Meşe kalası → 4 | ~6 |

### Çit, duvar ve kapı

Her parça **tahta** ya da **taş** sınıfındadır; kırma kuralı buna göre işler.

| Parça | Sınıf | Tarif (el yapımı, kazanda öğrenilir) | Etki | Canı |
|---|---|---|---|---|
| Dal çit | tahta | 4 Dal, 2 Lif → 2 | **Yavaşlatır:** canlı ×0,35 hızla geçer | 60 |
| Çit | tahta | 1 Meşe sapı, 2 Sarmaşık ipi, 2 Dal → 2 | Durdurur | 240 |
| Taş duvar | taş | 4 Taş, 1 Kireçtaşı, 1 Kum → 1 | Durdurur | 800 |
| Tahta kapı | tahta | 2 Çit, 1 İp → 1 | Oyuncu, evcil hayvan ve görev kişileri geçer | 240 |

- **Kapı:** oyuncu 1 karo yakına gelince kendiliğinden açılır, uzaklaşınca kapanır; düğmesi yoktur.
- **Taş duvar** Çayır malzemesiyle yapılır ama ağırdır: erken oyuncu birkaç duvar karosuyla kapısının çevresini korur; geniş bir avluyu taşla çevirmek ilerleyen biyomların işidir.

### Kırma, yıkık parça ve onarım

- Bir canlı bir parçaya yalnızca **oyuncunun yakınında, onu kovalarken** ve yolu o parçayla kesilmişken (ya da hücumla çarpınca) vurur. Uzaktaki çitlere kimse dokunmaz.
- **Vuruş başına parçaya verilen hasar** canlının hasarının yarısıdır, en çok 1,2 sn'de bir; hücum çarpması ×2.
- Sınıfının kıramadığı parçaya canlı vurmaz: önünde bekler, sonra vazgeçer. Arada durduran bir parça varken üstünden ısıramaz.
- Uzaktan atanlar parçalara vurmaz.
- **Uçanlar** çitin ve duvarın **üstünden geçer**, kırmaz (Boğaç).
- **Kırılınca** parça **yıkık** olur ve geçilir; kaybolmaz, resmi yıkık parçadır; yere 1 malzemesi düşer.
- **Onarım:** hasarlı ya da yıkık parçaya F → **Onar** (tahta 1 Dal, taş 1 Taş); canı tam dolar. Hasarlı parça kendiliğinden onarılmaz; hasar resimde çatlakla görünür (3 kademe).

**Kırma sınıfları:**

| Sınıf | Neyi kırar | Kimler |
|---|---|---|
| **Zayıf** | hiçbir şey | zararsızlar, küçük gövdeliler (kemirgen, kuş, kabuklu, böcek, sürüngen), uzaktan atanlar, uçanlar |
| **Orta** | yalnızca tahta (çit, kapı) | yakın dövüşte saldıran ya da hücum eden dört ayaklılar (kurtlar, domuzlar, vaşak, geyikler, keçiler) |
| **Güçlü** | tahta ve taş | iri türler (vuruşla geri itilmeyenler) |
| **Reis** | tahta ve taş | her türün Reis'i (zayıf bir türünki de) ve mağara boss'ları |

| Biyom | Zayıf | Orta | Güçlü |
|---|---|---|---|
| Çayır | Tavşan, Keklik, Bıldırcın, Kerevit, Porsuk | Geyik, Yaban atı, Kurt | – |
| Orman | Sincap, Kunduz, Dikenli kirpi, Engerek, Oklu kirpi | Karaca, Yaban domuzu | – |
| Bataklık | Ördek, Yaban kazı, Turna kuşu, Su samuru, Zehirli kurbağa | Bataklık kurdu | Timsah |
| Kayalık Dağ | Ur kekliği, Kartal (uçar) | Dağ keçisi, Muflon, Vaşak | Yaban öküzü, Mağara ayısı |
| Kül Diyarı | Kül böceği, Kül cini, Lav kertenkelesi, Kor yarasası (uçar) | Kül kurdu, Ateş akrebi | Kara ejder |
| Mor Kristal Vadisi | Işık engereği, Kristal örümcek, Mor güve (uçar) | Işık tilkisi, Gölge kurdu, Kristal geyik | Kristal golem |
| Mor ışık baskını | Yıldızsız gözcü, Yıldızsız sürüngen, Yıldızsız tükürücü | Yıldızsız dev | – |

- Nötr canlılar yalnızca kızdırılınca kovalar; o zaman sınıfları işler.
- **Yeni bir canlı eklenince sınıfı da yazılır**; listede olmayan canlı "zayıf" sayılır.
- Mağaralarda inşa yoktur (mağara canlılarının sınıfı yalnızca tutarlılık için: Mağara kurdu ve Mağara vaşağı orta, öbürleri zayıf).

### Avlu

Durduran parçalarla (Çit, Taş duvar) ve kapılarla **tamamen çevrili** alanın içinde canlı **doğmaz** (Boğaç). Dal çit yavaşlattığı için saymaz; yıkık parça da saymaz. Çevrili olup olmadığına yalnızca bir parça konup kalkınca ya da kırılınca bakılır (en çok 64 × 64 karo).

### Dış ışık: Direk feneri

| Fener | Tarif (Usta Sinan yapar) | Yarıçap | Yakıt |
|---|---|---|---|
| Direk feneri | 1 Sopa, 1 Kil lamba, 1 Hayvan yağı | 90 px | bir gece; her gece 1 Hayvan yağı ya da 2 Reçine |

- Fenerin ışığının içinde **mor ışık gelmez**; canavarlar ışıktan uzaklaşmaz, içine de girer (Boğaç: fenerler yalnızca mor ışıktan korur).
- Fener 20:00'de kendiliğinden yanar, 06:00'da söner. Yakıtı biten fener o gece yanmaz.
- Yakıt fenere **F** ile konur (yerde alınacak eşya yoksa; F önceliği).
- Yanan fenerler haritada kamp ateşi gibi görünür.
- **Gece:** güvenli olan fenerin ışığıdır, çit değil. Zifiri karanlık sayacı ışığın sınırından çıkınca başlar. Tanrı modu kuralı aynıdır (mor ışık tanrı modunda da bayıltır).

### Nereye kurulur, sınırlar

- **Her biyomda ve her kuşakta** kurulur, Derin dahil (Boğaç); kuşaklar yalnızca canlıların doğmasını belirler.
- **Kurulmaz:** su ve ulaşılamaz karo; ağaç (önce kesilir); başka yapı; kişilerin ve ateşlerinin **6 karo** çevresi; görev yerlerinin **8 karo** çevresi (köprüler, Doğu geçidi, gemi enkazı, mağara ağızları, iz yerleri, kuzen ailelerinin ocak ve kazanları, yan kişilerin yeri); Kemal'in kampının güvenli alanı; Ekin'in tarlası.
- **Çit, duvar ve kapı** köprü uçlarına ve geçide 4 karodan yakın kurulmaz; zemin ve yol oraya da konur.
- Mağarada, evin içinde (orada Döşe var), Bereket Adası'nda ve ikinci adada kurulmaz.

| Parça (kayıt başına) | Sınır |
|---|---|
| Zemin ve yol | 2.000 karo |
| Çit, duvar, kapı | 600 parça |
| Fener | 24 |

- **Kayıt:** zemin ve çit/duvar ızgara olarak, sıkıştırılmış karo listesi şeklinde saklanır; parça canları yalnızca hasarlı parçalar için tutulur; fener yakıtları yapılarla birlikte saklanır.

### Çit ve Ağıl

- **Çit el yapımıdır** (Boğaç: çit ve zemini oyuncu elle yapar); adı aynı kaldığı için görevler ve Ağıl bozulmaz. Tarifi tahtadır: 1 Meşe sapı, 2 Sarmaşık ipi, 2 Dal → **2 Çit**; kazanda öğrenilir. Usta Sinan'ın sipariş listesinde Çit yoktur.
- **Ağıl** aynı kalır: tarif 10 Çit, Usta Sinan kurar. Çit ucuzladığı için fiyatı malzemeyle düşer (~250).
- **Eski kayıtlar:** çantadaki Çit'ler geçerlidir; dünyada kurulu Çit'ler açılışta İnşa ızgarasına aynı yerde Çit olarak taşınır; Sinan'a verilmiş ve bekleyen bir Çit siparişi varsa iade edilir (Çit çantaya, ücret geri).

## Dövüş

### Silahlar

| Tür | Hasar | Menzil | Bekleme |
|---|---|---|---|
| Yumruk | 4 | 16 | 0,45 sn |
| Meşale (başka silah yoksa) | 7 | 19 | 0,48 sn |
| Kılıç | Taş 12 · Bakır 16 · Çakmaktaşı 18 · Tunç 22 · Granit 25 · Demir 34 · Timsah dişi kılıcı 38 · Çelik 46 · Gümüş kılıç 52 · Kara çelik 58 · Işın kılıcı 60 · Ejder kılıcı 65 · Mor kristal 72 · Ametist kılıcı 81 | 22 | 0,42 sn |
| Savaş çekici | Taş 13 · Bakır 18 · Çakmaktaşı 20 · Tunç 25 · Granit 28 · Demir 39 · Timsah dişi 44 · Çelik 53 · Kuvars 59 · Kara çelik 67 · Ejder 75 · Mor kristal 83 · Ametist 93 | 24 | 0,62 sn |
| Topuz | Taş 10 · Bakır 14 · Çakmaktaşı 16 · Tunç 19 · Granit 21 · Demir 29 · Timsah dişi 32 · Çelik 39 · Kuvars 44 · Kara çelik 49 · Ejder 55 · Mor kristal 61 · Ametist 68 | 20 | 0,36 sn |
| Mızrak | Mızrak 10 · Bakır 15 · Çakmaktaşı 17 · Tunç 20 · Granit 22 · Demir 30 · Timsah dişi 34 · Çelik 41 · Kuvars 46 · Kara çelik 52 · Ejder 58 · Mor kristal 64 · Obsidyen 72 | 30 | 0,6 sn |
| Balta | Taş 9 · Bakır 12 · Çakmaktaşı 13 · Granit 22 · Tunç 20 · Demir 30 · Timsah dişi 34 · Çelik 38 · Kuvars 43 · Kara çelik 50 · Ejder 56 · Mor kristal 58 · Obsidyen 65 | 20 | 0,5 sn |
| Kazma | Taş 8 · Bakır 11 · Çakmaktaşı 12 · Tunç 18 · Granit 20 · Demir 26 · Timsah dişi 29 · Çelik 34 · Kuvars 38 · Kara çelik 45 · Ejder 50 · Mor kristal 52 · Obsidyen 58 | 20 | 0,5 sn |
| Yay | Basit 8 · Çam 12 · Kemik 13 · Meşe 17 · Ihlamur 19 · Kızılağaç 26 · Söğüt 29 · Akçaağaç 35 · Huş 39 · Kızıl sedir 45 · Ejder 50 · Gece ağacı 56 · Işık ağacı 63 (× okun çarpanı) | 240–370 | 0,75–0,57 sn |
| Asalar, ateşli silahlar | ACT 2 bölümündeki tablo | 210–340 | |

- **Vuruş ne zaman değer:** vuruşun çizildiği yer (karakterin göğsü) ile canlının **gövdesi** arasındaki uzaklık, silahın menzili + canlının boyu + 3 pikseli geçmiyorsa ve canlı vuruş yönünün en çok ~95° yanındaysa (çaprazlar dahil, geniş bir koni) vuruş değer ve hasar verir. Vuruş efekti canlının görseline değdiği an hasar sayılır; çok yakındaki (gövdesine yapışık) canlı yönden bağımsız vurulur. Yumruk ve tek elli silahlar ilk değdiği canlıya vurur.
- **Canlının her yeri sayılır:** uzaklık canlının gövde noktasına değil, **çiziminin kapladığı kutuya** (kıskaçlar, kuyruk, boynuz, kanat dahil; gölge ve can çubuğu hariç; her tür ilk vuruşta bir kez ölçülür, yöne göre aynalanır, büyük Reislerde boyla çarpılır) ölçülür: göğüsten kutunun en yakın noktasına uzaklık silahın menzili + 3 pikseli geçmiyorsa ve o nokta vuruş yönünün en çok ~95° yanındaysa vuruş değer. Böylece kerevitin kıskacına, geyiğin boynuzuna değen vuruş da hasar verir. **Bütün canlılarda** (iki adada da, Reisler dahil) geçerlidir; çizimi ölçülemeyen bir canlı olursa yukarıdaki eski kural kullanılır.

- Gerçek hasar = silah × Güç özelliği (1 + 0,08 × Güç puanı) × Güçlü kol yeteneği × Güç etkisi 1,2 × Güçsüzlük 0,8. **Seviye hasarı doğrudan artırmaz**; artış seviye puanlarından ve yeteneklerden gelir. Silah yuvasındaki silah, elde silah yokken kullanılır. **Eldeki silah doğrudan kullanılır, "sırt" yoktur:** alet kemerinden bir silahı eline aldığında vuruşlar o silahla yapılır; silah kemerde ve çantada yerinde kalır, hiçbir yuvaya taşınmaz. Kemerde tekerlekle ya da 1–5 tuşlarıyla gezinmek yalnızca eldekini değiştirir, kemerdeki eşyaları yerinden oynatmaz. Kemerdeki bir yuvanın eşyasını değiştirmek için yuvaya sağ tıklanır ya da basılı tutulur.
- Vuruş üç evrelidir (hazırlık, darbe, takip); isabette kısa bir donma olur, ıskalarsan bir an açık kalırsın. Her isabet silahı 1 köreltir.
- Reisler ve iri türler (Timsah, Yaban öküzü, Kara ejder, Mağara ayısı, golemler, ejderler, robotlar, muhafızlar) vuruşla geri itilmez.

### Atılma, savuşturma, savunma

- **Atılma / takla** (Boşluk; öğreticide Börü ücretsiz öğretir): **0,46 sn** (animasyon biraz uzasın; önce 0,38), 50 piksel; boyunca **dokunulmazsın**. 14 enerji, bekleme 0,76 sn (Çevik atılma I/II/III: 9/7/5 enerji, 0,45/0,38/0,30 sn; Uzun atılma: %25 daha uzağa). Bir saldırının içinden taklayla geçersen "Sıyrıldın!" +6 enerji (Sıyrılma ustası ile +14).
- **Takla görüntüsü:** takla artık karakterin döndürülmüş resmi değil, **16 adımlık** bir animasyon: 8 ana poz (çömelme, öne atılma, top olma, üç top hâlinde yuvarlanma pozu, diz üstü açılma, doğrulma) ve her ikisinin arasında bir ara poz. Pozlar karakterin kendi çiziminden (ten, saç, şapka/miğfer, gövde zırhı, eldiven, çizme) parça parça kurulur: baş, gövde ve bacaklar ayrı ayrı yer değiştirir; elde tutulan alet/silah ve meşale takla boyunca görünmez. Sağa/sola taklada karakter yan döner ve yuvarlanır; yukarı/aşağı taklada öne doğru takla (baş aşağı geçerken sırtı görünür). Arkasında bir önceki adımın soluk izi kalır. **Piksel bütünlüğü ("sağa sola gözleri pörtletiyor"):** poz, karakterin kendi piksel boyunda küçük bir tuvalde döndürülüp bütün olarak ekrana konur; böylece her piksel aynı boyda kalır (büyük ekran resmini döndürmek bazı satırları uzatıp gözleri büyütüyordu). Dönüş 11,25°'lik adımlarla yapılır, 12°'den küçük eğiklik dik çizilir. süre **0,46 sn** (mesafe yine 50 piksel, takla biraz daha yavaş). **Gözler:** top hâlindeki dört pozda (ve aralarındaki adımlarda) gözler sıkıca kapalı çizilir; dönen açık gözler kapkara büyümüş gibi görünüyordu. Geri almak istenirse bu sürümün değişikliği geri alınır (eski 4 pozlu dönme geri gelir).
- **Savuşturma da öğrenilir:** oyunun başında savuşturma ve gard (sağ tık / E, telefonda Savuş düğmesi) **kapalıdır**; Börü takla dersinin hemen ardından ücretsiz öğretir (öğretici, 11. adım). Öğreticiyi atlayan Börü ile konuşunca ücretsiz öğrenir. Bilmeden basınca "Savuşturmayı henüz bilmiyorsun: Savaşçı Börü öğretir" der; telefonda Savuş düğmesi öğrenilince görünür.
- **Savuşturma** (sağ tık, darbe değmeden hemen önce): 0,2 sn pencere (telefonda 0,25; Savuşturma ustası I/II ile ×1,3 / ×1,6), 5 enerji. Başarılıysa hasar almazsın, canavar geri savrulur ve **1,6 sn sersemler**, +6 enerji, ulti +10. Fırlatılan diken, ateş ve büyüler de savuşturulur.
- **Darbe renkleri** (canavarın başındaki "!"): **beyaz** = normal, savuşturulur · **sarı** = ağır (×1,4 hasar), savuşturulur · **kırmızı** "!!" = savuşturulamaz (×1,7 hasar), ancak takla ile kaçılır. Reisin yere vurması ve yakalama da savuşturulamaz.
- **Savunma duruşu** (sağ tık basılı tut): %45 hızla yürürsün, vuramazsın; fiziksel hasar beyazda ×0,35, sarıda ×0,45, kırmızıda ×0,7. Her engel enerji yer; enerji biterse kalkan düşer.

### Özel vuruşlar (kombolar)

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
| Savaş çekici | Çifte ezme: iki ezme, ikincisi önüne kısa bir çatlak açar (×1,0+×1,3; 11) | **Yer yarığı:** önüne 110 px ilerleyen bir çatlak, üstündekiler (×2,4, sersem 1,2 sn; 20) | Ezerek atılma: atılıp yere iner, iniş yerinde küçük krater (çevre 30 px ×1,8, sersem 0,4 sn; 13) | **Deprem çekici:** önüne giderek büyüyen 3 ezme kraterı (×1,2 / ×1,6 / ×2,4, sonuncusu sersem 1,2 sn; 24) | Yandan ezme (×1,7; 8) | Kafa ezen: tepeden indirir, çarptığı yerde krater (çevre 26 px ×3, sersem 1 sn; 12) |
| Topuz | Üçlü darbe: dar, çok hızlı üç vuruş (3×0,7; 9) | **Bumerang:** topuz fırlatılır, 200 px gider ve geri döner; gidişte ve dönüşte vurur (her geçiş ×1,6; 16) | **Zikzak:** iki kısa atılış, her birinde en yakın düşmana (2×1,2; 10) | **Kombo patlatma:** kombo sayacını harcar: ×(1,5 + 0,5×kombo), kombo 3 ve üstüyse kıvılcım 2 düşmana daha sıçrar; sayaç sıfırlanır (20) | Hızlı darbe (×1,4; 5) | **Çan çalan:** metal bir çınlama, sersem 0,7 sn (×2,2; 8) |
| Balta/kazma | Geri savuruş (×1,25; 10) | Yere vurma, çevre (×2,6, sersem; 18) | Dönerek biçme (×1,5; 12) | Ezici darbe (×3,2, sersem; 22) | Yan savuruş (×1,6; 7) | Kafa kıran (×3, sersem; 11) |
| Yumruk | Çifte yumruk (8) | Güçlü yumruk (×3, sersem; 16) | Omuz atma (×1,3; 10) | Tekme kombosu (4×0,75 + ×1,7; 20) | Kroşe (×1,5; 5) | Aparkat (×2,6, sersem; 9) |
| Meşale | Alev savuruşu (×1,5; 10) | Ateş çemberi (×2,4; 18) | Ateşli hamle (×1,8; 12) | Alev patlaması (×3; 22) | Kor savuruşu (×1,6; 7) | Alev kesiği (×2,4; 11) |
| Yay (ok) | Çift ok, ±0,08 rad (2×1,0; 2 ok, 8) | Gergin atış (×3, menzil ×1,3; 1 ok, 14) | Geri sıçrayıp atış (×1,5; 1 ok, 10) | Ok yelpazesi, 5 ok (5×0,9; 5 ok, 18) | Hızlı atış (2×0,9; 2 ok, 5) | Delici ok (×2,6, hız ×1,3; 1 ok, 8) |
| Asa (mana) | Üçlü atış (×2 mana) | Büyük büyü ×3 (×3) | Kaçarken atış (×1,5) | Büyü halkası, 8 yön (×4) | İkiz atış (×1,4) | Güç topu ×2,8 (×2,2) |
| Ateşli (mermi) | Çift atış (2) | Nişanlı atış ×3 (1) | Kayarak atış, 3 yayılım (3) | Şarjör boşaltma, 5 atış (5) | Seri atış (2) | Delici mermi ×3,2 (1) |

- **Kritik vuruş:** kritik vuruş normal hasarın **%50 fazlasını** vurur (Ölümcül vuruş yeteneğiyle **%80**); vuranın başında kırmızı "KRİTİK!" yazar, kısa tiz bir ses çıkar.
  - **Savuşturmayla sersemlettiğin canlıya ilk vuruşun her zaman kritiktir** (her silahla, yumrukla bile). Sersemlik vurmadan geçerse bu hak kalkar.
  - **İhtimal** = (seviye: 2. seviyeden başlayarak her seviye **%0,2**, 50. seviyede %9,8, 60. seviyede %11,8 · Keskin göz I **%3** / II **%6** · silahın biyom kademesi **×%1**) × **silah türü**.
  - **Silahın kademesi:** yalnızca ilerleyen biyomların silahları kritik vurabilir. Başlangıç, Bakır, Kemik/Çakmaktaşı setleri ve Basit/Çam/Kemik yayı (kademe 0) **kritik vuramaz**; Tunç, Granit, Meşe ve Ihlamur yayı 1; Demir, Timsah, Kızılağaç ve Söğüt yayı 2; Çelik, Gümüş, Kuvars, Akçaağaç ve Huş yayı 3; Kara çelik, Ejder, Obsidyen, Kızıl sedir yayı 4; Mor kristal, Ametist, Gece ağacı ve Işık ağacı yayı 5; ACT 2 silahları (ateşli silahlar, asalar, Işın kılıcı) 6.
  - **Silah türü:** yay ve ateşli silah **×1,5**, mızrak **×1,2**, topuz **×1,1**, kılıç **×1**, asa **×0,8**, savaş çekici **×0,6**; balta, kazma, meşale ve yumruk **hiç kritik vuramaz** (savuşturma sonrası ilk vuruş hariç).
  - Örnek (50. seviye, yeteneksiz): Demir kılıç %11,8 · Mor kristal savaş çekici %8,9 · Mor kristal topuz %16,3 · Mor kristal mızrak %17,8 · Işık ağacı yayı %22,2 · Tabanca %23,7.
  - Silahın bilgi satırında kritik ihtimali yazar ("kritik %11,8" ya da "kritik vuramaz"). Arenada da aynen geçerlidir.
  - **Yetenek ağacı (Savaş):** üç yetenek değişti: Kâşif gözü → **Keskin göz I** (+%3), Rüzgâr gibi → **Keskin göz II** (toplam +%6, Keskin göz I'den sonra), Baykuş gözü → **Ölümcül vuruş** (kritik %80, Keskin göz II'den sonra). Bunları önceden almış olanlar yeni hallerine sahip olur; harita açılma alanı ve koşu hızı herkes için eski temel değerindedir (7 karo, 1,6 kat), karanlıkta çevreni görme yalnızca meşale, lamba ya da Gece gözü etkisiyle olur.
- **Silahların karakteri ("kılıç, savaş çekici ve topuz kullanış olarak da efekt olarak da farklı olmalı"):** kılıç dengeli silahtır (orta hız, geniş yay; değişmedi). Savaş çekici ve topuzun kendi kuralları vardır; arenada da aynen geçerlidir:
  - **Savaş çekici: yavaş, ağır, kalabalığa karşı.** (1) **Çarptığı yere de vurur:** her isabet, vurulanın çevresindeki (36 px) öbür düşmanlara hasarının **yarısını** verir. (2) **Sersemletme birikir:** aynı düşmana 3 saniye içinde **3 isabet** onu **1 sn** sersemletir (Reis ve boss 0,5 sn); sayaç sıfırlanır. (3) **Geri itme iki kat.** (4) **Sağlam duruş:** savururken aldığın hasar **%25 az**. (5) Bedeli: savururken **%40 yavaş** yürürsün; vuruş hızı en yavaş silah (0,62 sn). Efektler toprak ve taş: kraterler, çatlaklar, toz, sıçrayan taşlar; ses kalın bir gümleme.
  - **Topuz: hızlı, hareketli, tek hedefe karşı.** (1) **Kombo sayacı:** 1,2 sn içinde yapılan her isabet bir sonrakinin hasarını **%10** artırır, en çok **%60** (6 isabet; aynı anda birden çok düşmana değmek tek isabet sayılır). Vurulunca ya da 1,2 sn isabet olmazsa sayaç sıfırlanır; sayaç karakterin üstünde yazar ("Kombo ×4"). (2) **Kıvılcım:** her **5. isabette** bir kıvılcım en yakın başka düşmana (120 px içinde) sıçrar, o isabetin **0,8** katı hasar verir. (3) **Hareketli:** vururken yavaşlamazsın; taklanın enerjisi **%30 az**. (4) Bedeli: özel hamlelerinin yayı dar, geri itmesi yarı. Efektler metal ve şimşek: kıvılcımlar, yıldız parlamaları, şimşekler; ses metal çınlaması.
  - İlk kez savaş çekici ya da topuz eline aldığında bu kurallar kısa bir bildirimle anlatılır.
- **Kilit:** ACT 1'de her özel vuruş ve ulti **Börü'den dersi alınana kadar kapalıdır** (kapalı hamle normal vuruş olur). ACT 2'ye geçince ve arenada hepsi açılır.

### Ulti

- Altın ulti çubuğu: her isabet +1,5, özel vuruş +4, ritimli 2. +5, ritimli 3. +10, başarılı savuşturma +10. Dolunca **R** (telefonda Ulti). Ulti boyunca hasar almazsın.
- ACT 1'de ulti dersi Kara ejder ya da Kristal golem Reisi yenilince açılır; ACT 2'de kendiliğinden öğrenilir.

| Silah | Ulti | Etki |
|---|---|---|
| Kılıç | Kılıç dansı | 8 yönlü dönüş (her biri ×1,2) + ×3 patlama, sersem 1 sn |
| Mızrak | Mızrak yağmuru | Fare yönündeki alana 12 mızrak, her biri ×1,5 |
| Balta | Deprem | Büyüyen 3 halka, ×2,4, sersem 1 sn |
| Savaş çekici | Dağ yaran | Fare yönüne sıçrar; indiği yerden 4 çapraz yöne 120 px çatlak açılır, çatlak boyunca kayalar fışkırır (×2,6, sersem 1,4 sn), ortada ×2 halka |
| Topuz | Gök gürültüsü | Çevrendeki (220 px) en yakın 6 düşmana sırayla şimşek iner (her biri ×2,2, sersem 0,5 sn), sonunda gök gürültüsü (çevre 70 px ×1,5); kombo sayacı dolar (6) |
| Yumruk | Öfke | 10 yumruk + son ×4 |
| Meşale | Ateş fırtınası | 3 ateş halkası ×2 |
| Yay | Ok yağmuru | Fare yönündeki alana 16 ok yağar, her biri ×1,4, sersem 0,3 sn; ok harcamaz |
| Asa | Meteor | Fare yönüne ×5, sersem 1,2 sn |
| Ateşli | Kurşun yağmuru | 20 atış (pompalıda 10), mermi harcamaz |

### Börü'nün dövüş dersleri

Savaşçı Börü ile konuşup "Dövüş dersleri" (yalnızca ACT 1'de, öğretici bittikten sonra). Ücret peşin; ders bitince hamle kalıcı açılır ve XP verilir. Ders için o bölgeyi gezmiş olman gerekir (haritada en az 60 karesi açılmış olmalı).

- Börü bir **alıştırma canavarı** salar: ısırığı zayıftır (canının %5'i), XP ve ganimet vermez, av ve Reis sayaçlarına sayılmaz, Börü'den 230 pikselden uzağa gitmez. Ölürse ya da kaybolursa Börü'nün yanındaysan 1,5 sn sonra yenisi gelir; sayı sınırı yoktur (önceden ders başına 16'da kesiliyor, ders bitirilemez kalıyordu). "Tek vuruşta öldür" hilesi alıştırma canavarına işlemez.
- **Ders sürerken Reis gelmez**: ders sırasında vahşi hayvan avlayıp bir Reisin sayısını doldurursan Reis ders bitince (ya da bırakılınca) gelir.
- Alandan çıkınca sorulan "Derse dön" seni Börü'nün yakınına (yaklaşık 140 piksel) geri koyar (önceden 230 pikselde, sınırın dibinde bırakıyordu). Vuruş adımlarında saldırmaz ve canı gitmez; "bitir" adımında canı kolayca bitecek kadar azalır; savuşturma ve kaçma adımlarında 2,2–3,2 saniyede bir saldırır.
- Soldaki ders kutusu yalnızca şimdiki adımı gösterir ("adım 1/2"). Börü'de "Dersi yeniden anlat" ve "Dersi baştan başlat" var. Öğrenilmiş dersler ücretsiz tekrar çalışılır (XP vermez).

| Ders | Seviye | Bölge şartı | Ücret | XP | Alıştırma canavarı | Adımlar |
|---|---|---|---|---|---|---|
| Takla vuruşu | 3 | Çayır (Atılma gerekli) | 150 | 40 | Kurt | Saldırırken takla at, 3 kez kurtul → takla vuruşuyla 4 isabet |
| Çift vuruş | 6 | Orman | 300 | 60 | Yaban domuzu | Çift vuruşla 7 isabet (ders domuzu hiç ölmez, "bitir" adımı kalktı) |
| Ritimli 2. vuruş | 12 | Bataklık | 600 | 100 | Bataklık kurdu | Ritimli 2. vuruşla 5 isabet |
| Ritimli 3. vuruş | 15 | Kayalık Dağ | 1.000 | 160 | Muflon | Sırayla: 3 savuşturma → ritimli 3. vuruşla 3 isabet |
| Güçlü vuruş | 17 | Kayalık Dağ | 1.200 | 180 | Yaban öküzü | Savuşturarak 3 canavarı sersemlet → sersem canavara 3 güçlü vuruş |
| Bitirici | 21 | Kül Diyarı (Atılma gerekli) | 2.000 | 300 | Kül kurdu | Takla ile 3 kaçış → bitiriciyle 3 isabet |
| Ulti | – | Kara ejder ya da Kristal golem Reisi yenilmiş | 2.500 | 500 | Mağara ayısı | Çubuk dolunca R: ulti ile 3 isabet (derste çubuk 3 kat hızlı dolar) |

### Canavarlar nasıl savaşır

- **Mizaç:** *zararsız* kaçar; *nötr* vurulunca karşılık verir, 220 piksel uzaklaşınca sakinleşir; **ilk vuruşta hemen sana döner ve saldırır:** yakınındayken (110 piksel içinde) vurulduğu an sana bakar, kırmızı "!" ile sana atılır (vurmayı sürdürmen gerekmez); uzaktan (ok, büyü) vurulduysa seni kovalar. Eskiden vurulan nötr canlı yavaş kalkıyordu, sen art arda vurdukça geri savruluyor, uzun süre karşılık veremiyordu. **Kıyıdaki Kerevit (nötr)** artık kızınca saniyede 46 piksel koşar (eskiden 14); *saldırgan* fark etme menziline girince saldırır, menzilin iki katı uzaklaşınca bırakır. Güvenli bölgede saldırgan canavar saldırmaz. Aynı anda en çok 4 canavar kovalar.
- **Fareyle canlının üstüne gelince:** yalnızca **kısa tek etiket** çıkar: canlının adı ve altında ne yaptığı (zararsız / kızdırırsan saldırır / saldırgan · vur). İmlecin yanında can, huy ve düşürdüklerini sayan ikinci kutu artık çıkmaz (bunlar Almanak'ta).
- **Sürüler:** sürü hayvanının birine vurunca ya da saldırgan sürüye yaklaşınca hepsi gelir; sırayla saldırırlar (6. seviyeden önce aynı anda 1, sonra 2).
- **Saldırı:** ayrı bir hazırlık beklemesi yok: kırmızı **"!"** belirdiği an (0,1 sn içinde) canavar sana doğru **atılır** (0,3 sn) → ısırık. Menzilliler 0,6 sn hazırlanıp atar. Bir canavar son saldırısından 1 sn geçmeden yenisine başlayamaz (Reisler hariç).
- **Atılış hep sana doğru, kaçarsan işlemez:** canavar ! ile birlikte o an **bulunduğun yere** atılır; atılış başladıktan sonra **yolu değişmez**, düz gider. ! görünür görünmez takla atarsan (ya da yolundan çekilirsen) kaçarsın, ısırık işlemez; sana değerse ısırık işler. Çok erken atılan takla biter ve işe yaramaz. Üstüne atlayan **bütün canlılar** böyledir; Börü'nün alıştırma kereviti de (orada atılış 0,45 sn, daha yavaş). **Savuşturma** (sağ tık / E basılı, telefonda Savuş) da kaçırır: ısırık değmeden en çok 0,2 sn önce basılırsa beyaz ve sarı ! savuşturulur (kırmızı ! yalnızca taklayla kaçılır). !'in rengi atılışla birlikte görünür; sarı ve kırmızı vuruşlara eklenen ayrı bekleme (0,18 / 0,3 sn) kalktı.
- **Saldırırken yüzü hep sana dönük:** bir canavar saldırıya geçtiği andan bitene kadar (kırmızı/sarı işaret, menzillinin 0,6 sn hazırlığı, Reis hamlelerinin hazırlığı, kükreme, alev, kavrama, üçlü vuruş, hamleden sonraki yorgunluk) yüzünü hep karakterine çevirir; sen etrafında dönsen de sırtını dönmez. Geri geri kaçan menzilliler de sana bakarak çekilir. Yalnızca gövdesiyle hızla yol aldığı anlarda (atılış, sıçramada havadayken, hücumda koşarken) gittiği yöne bakar. Tam üstünde ya da altındayken (yatayda 3 pikselden yakın) yönünü değiştirmez, titremesin diye.
- **Önce başını çevirir, sonra başının doğrultusunda atılır:** canlılar yandan çizilir; eskiden karakter üstte ya da alttayken canavar yan durup dikine atılıyordu ("yan saldırı"). Artık üstüne atlayan **bütün canlılar** (Börü'nün alıştırma kereviti de) saldırı menziline girince (menzil + 24 piksel) gövdesini **başı sana bakacak şekilde döndürür** (saniyede ~14 radyan, en çok 90°: tam üstündeysen başı yukarı, tam altındaysan aşağı bakar), ! ile atılırken başının gösterdiği doğrultuda gider; atılış boyunca başı gittiği yöne bakar. Saldırı bitince ya da uzaklaşınca yavaşça (saniyede ~8 radyan) yeniden yatay durur. Can çubuğu, ! işareti ve hedef çizgisi dönmez, eski yerinde çizilir. Sersemken, geri savrulurken ve Reis'in özel hamlelerinde (sıçrama, hücum…) dönmez. Zamanlamalar (! 0,1 sn, atılış 0,3 sn; kerevitte 0,45 sn) değişmez. **Reis dönmez ("tek bir can barı olsun"):** Reis'lerin çizimi hiç döndürülmez; dönünce Reis'in mor can çubuğu ve adı yan yatıyor, üstüne ikinci küçük bir can çubuğu çıkıyordu. Reis'in tek can çubuğu taçlı uzun mor çubuktur.
- **Sıkışan canlı yine saldırır:** bir canavar seni kovalarken bir engele (kaya, duvar, ağaç, su kenarı) takılıp sana yaklaşamazsa ve sen ona yakın dövüşle vurabiliyorsan, artık güvenle kesilemez. Kovalayan bir canlı **0,4 sn** yerinde sayar ve sen **44 piksel** içindeysen, bekleme süresi dolunca normal saldırısını yapar (başını çevirir, kırmızı/sarı/beyaz **!** ile atılır). Atılışı engele takılsa da kıskacı/dişi engelin üstünden yetişir: atılış sürerken 44 piksel içindeysen isabet eder (savuşturma ve atılmayla yine kaçınılır). Örnek: kumsalda iki kaya arasına sıkışan kerevit. Uzaktan silahlar (asa, tüfek) ve uzaktan saldıran canlılar etkilenmez.
- **Canlılar canını yeniler:** hasar almış bir canlı (hayvan, canavar, Reis, boss) **6 saniye** hiç hasar almazsa ve **dövüşte değilse** canını yavaş yavaş yeniler: saniyede tam canının **%4**'ü (boştan doluya ~25 sn), tam cana kadar. Dövüşte sayılır: seni kovalarken 200 pikselden yakınsa, saldırıya hazırlanıyor ya da atılıyorsa. Yeni bir hasar 6 saniyeyi baştan başlatır. Yani kaçıp geri gelirsen ya da uzun ara verirsen yaraladığın canlı iyileşmiş olur; kesintisiz bir dövüşte iyileşmez. Yanma (meşale) da hasar sayılır.
- **Doğma:** canlılar oyuncunun 330–470 piksel çevresinde doğar, 760 pikselden uzaklaşınca silinir. Bataklık, Kayalık Dağ, Kül Diyarı ve Mor Kristal'de doğacak noktanın **kuşağı** (Giriş/Orta/Derin) hangi canlının doğabileceğini belirler (kuşak kuralı: ACT 1 › Biyomlar › Bataklık). Gece canlıları gündüz uzaktaysa silinir.

**Özel hamleler** (kovalarken arada bir):

| Hamle | Renk | Ne yapar, nasıl kaçılır |
|---|---|---|
| Sıçrama | sarı (iri türde kırmızı) | işaret çıktığı an (0,12 sn) **o an bulunduğun yere** atlar; havadayken (0,42 sn) yolu değişmez. İniş çevresine hasar ve itme. Yana çekil ya da inerken taklada ol. |
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

### Ölüm pozu ve leş (v3.37, Boğaç)

- **Ölüm pozu:** öldürdüğün her canlı (Reisler, mağara canlıları, ACT 2 canlıları dahil) olduğu yerde **yan yatarak yere düşer** (yaklaşık 0,35 saniyelik bir devrilme), sonra hareketsiz yatar; altında koyu bir gölge olur, can çubuğu görünmez.
- **Düşürdükleri leşin içindedir:** bir canlıyı öldürünce düşürdükleri artık hemen yere saçılmaz. Ekranda "{Canlı} avlandı · leşini topla" yazar. **Leşin yanına gidip topla** (bilgisayarda **E**, telefonda toplama düğmesi; üstünde "{Canlı} leşini topla" yazar): eşya toplar gibi çubuk dolar. Süre canlının büyüklüğüne göredir: **0,8 + √can / 12 saniye, en çok 3 saniye** (Toplayıcılık yetenekleri hızlandırır). Yürürsen ya da bir canavar sana saldırıyorsa toplama yarıda kalır. Çubuk dolunca leş kaybolur ve içindekiler leşin yerinde **yere saçılır** (yerdeki eşya kuralları geçerlidir: 180 sn sonra kaybolur, görev eşyaları kaybolmaz). İçinde bir şey yoksa "Leşte işe yarar bir şey yok" yazar.
- **Toplanmayan leş kaybolur (oyun saatiyle):** leş yerde **4 oyun saati** kalır; son **1 oyun saati** boyunca yanıp söner, sonra içindekilerle birlikte kaybolur (gündüz 4 oyun saati gerçekte yaklaşık 2,3 dakikadır; uyuyunca geçen saatler de sayılır).
- **Kaybolmayan leşler:** Reis leşleri ve içinde görev eşyası (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları) olan leşler toplanana kadar kalır, yanıp sönmez.
- **Kayıt:** yerdeki leşler (yeri, türü ve içindekiler) kayda yazılır; kayıt yüklenince yerlerinde durur.
- **İstisnalar:** Kemal'in ilk dövüş dersindeki ve Börü'nün dövüş derslerindeki canlıların düşürdükleri eskisi gibi hemen yere düşer; leşleri yalnızca görüntüdür, 3 saniye sonra söner. **Yıldızsızlar** sikkeyi eskisi gibi doğrudan keseye bırakır; leşleri 3 saniye içinde mor bir dumanla kaybolur. **Arenada** ölen canlının leşi 3 saniye yatıp söner, toplanmaz.

### Mor ışık saldırıları ve Yıldızsızlar (v3.30, Boğaç)

Belirli günlerde mor ışık, karakterin bulunduğu bölgeye **o dünyadan olmayan, mor renkli uzaylı canlılar** indirir: **Yıldızsızlar**.

- **Ne zaman (v3.31, Boğaç: gece, gecenin başladığı an, belli günler):** saldırı **gecenin başladığı an (20:00)** gelir. Günleri sabittir: **6, 11, 18, 22, 31, 37, 40, 48, 53, 60, 64, 73, 79, 82, 90, 95…** (aralar sırayla 5, 7, 4, 9, 6, 3, 8 gün ve bu sıra tekrar eder; aralar hep 3–9 gün; v3.31, Boğaç: 10 günlük ara çok uzun, kaldırıldı). **Özel olaylı günlere denk gelmez:** 5. gün (Yıldızsız Gezgin'in köpeği), 15. gün (Yıldızsız Işıkçı gelmeye başlar), 20. gün (mor sinyal) ve ilk 3 gün; sıradaki gün bunlardan biriyse bir sonraki olaysız güne kayar. Her iki adada da olur; arenada olmaz.
- **Ertelenir:** gece başladığı an (20:00) **evin içindeysen, mağaradaysan, deniz yolculuğundaysan ya da güvenli bir yerin (kamp ateşi, Kemal'in kampı, kişilerin ateşleri) yanındaysan** saldırı o gün olmaz, **bir sonraki olaysız güne** kayar (ör. 11. günde evdeysen 12. gün). Uyuyarak geçen gece de ertesi olaysız güne kayar. O an bir konuşma ya da pencere açıksa, kapanınca gelir (20:00–21:00 arası). Bir saldırı olunca sıradaki, listedeki ilk en az 3 gün sonraki gündür. Sıradaki saldırının günü kayıtta saklanır.
- **Gece aydınlıktır:** mor bölgenin içi mor ışıkla aydınlanır (meşale gerekmez, mor ışık seni bu bölgede bayıltmaz); her Yıldızsız da kendi soluk ışığıyla parlar.
- **Başlarken:** ekranda "Mor ışık saldırısı! · Yıldızsızlar geliyor" yazar, uğultu ve gümbürtü duyulur. Karakterin bulunduğu yerin çevresi (yaklaşık 16 kare yarıçap) **mora döner**: yer mor bir örtüyle kaplanır, kenarında parlayan mor bir halka döner, havada mor zerreler yükselir. Yıldızsızlar bu bölgenin içine, gökten inen **mor ışık sütunlarıyla** (0,7 sn) iner.
- **İki dalga:** önce yarısı iner; ilk dalgadan en çok 1 tane kalınca ya da 20 sn geçince kalanı iner. Sayı: 4 + (gün / 5) + (seviye / 6), en az 4, en çok 12.
- **Peşini bırakmazlar (v3.31, Boğaç: "birden ben yokmuşum gibi bırakıp gidiyorlar"):** öbür canlılar kendi biyomlarının sınırında kovalamayı bırakıp geri döner; Yıldızsızlar bu kurala uymaz, biyom sınırını geçip seni kovalamaya devam eder (yalnızca güvenli yerlere girmezler).
- **Bitiş:** bütün Yıldızsızlar ölünce "Mor ışık çekildi" yazar ve bölge eski rengine döner. Bölgeden çok uzaklaşırsan (halkanın ~5 kare dışına), bayılırsan ya da 4 dakika (gerçek) geçerse saldırı yarıda biter, kalan Yıldızsızlar ışıkla geri çekilir.
- **Türler (gücüne ve güne göre):** saldırıya hangi türlerin geleceği seviyene ve güne göre belirlenir:

| Tür | Ne zaman gelir | Nasıl savaşır | Can (silahının kaç vuruşu) | Hasar (tam canının) | Sikke |
|---|---|---|---|---|---|
| Yıldızsız gözcü | her saldırıda | yerden biraz yukarıda süzülen tek gözlü, dokunaçlı küçük canlı; hızlı, ısırır | 3 vuruş | %5 | 6–10 |
| Yıldızsız sürüngen | her saldırıda | yerde sürünen, sırtında parlayan benekler olan, çok bacaklı canlı | 6 vuruş | %8 | 12–20 |
| Yıldızsız tükürücü | seviye 5 ya da 8. gün | uzun, yarı saydam, saplı gözlü canlı; uzaktan mor top tükürür (kenara çekil) | 4 vuruş | %6 | 10–16 |
| Yıldızsız dev | seviye 12 ya da 18. gün (saldırıda en çok 2) | iri, üç gözlü, göğsünde parlayan çekirdek; ağır vuruşundan önce durup kollarını kaldırır (kaç!) | 14 vuruş | %14 | 40–60 |

  - **Can**, elindeki (ya da silah yuvandaki) silahın bir vuruşunun hasarıyla ölçülür (en az 6 sayılır) ve günle artar: her gün +%2, en çok +%80. **Hasar** tam canının yüzdesidir ve günle aynı oranda artar; zırhın bunu da azaltır. Yani güçlendikçe Yıldızsızlar da güçlenir. Hepsi saldırgandır, seni uzaktan görür ve kovalar; güvenli yerlere girmezler.
  - **XP:** türün vuruş sayısının 3 katı × (1 + seviye × 0,15).
- **Sikke düşürürler:** her Yıldızsız ölünce yerde altın parıltısı çıkar ve tablodaki kadar **sikke** doğrudan keseye eklenir ("+12 sikke"); sayı gün ve seviyeyle artar (× (1 + gün × 0,03) × (1 + seviye × 0,04)). Eşya düşürmezler.
- **Reisleri yoktur:** kaç tane avlarsan avla Yıldızsız Reisi gelmez. "Avcıların avcısı" ve "Ganimet avcısı" başarımlarına sayılmazlar.
- **Almanak:** ilk saldırıdan sonra almanağın sol sütununda biyomların altında **Yıldızsızlar** sayfası açılır; dört türün kartı oradadır (öldürülene kadar siluet ve ???). Kartta can ve hasar, son saldırıdaki değerleridir; düşürdükleri "Sikke".
- **Arena:** dört tür arenanın canlı listesinde **Yıldızsızlar** başlığıyla seçilebilir (son mor ışık saldırısındaki değerleriyle; o oturumda saldırı olmadıysa başlangıç değerleriyle: gözcü 30 can, sürüngen 60, tükürücü 40, dev 140).

## Arena, hileler, kayıt

### Arena

Ana menüde **⚔ Arena**; iyi ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır. Seviye (1/10/25/50/60; seçilen seviyenin puanları bütün özelliklere eşit dağılır), giyim ve silah seçilir; iki adanın bütün canlıları ve Reisleri ile dövüşülür. Arenada bütün yetenekler, **atılma** ve **savuşturma/gard** açıktır (önceden savuşturma kapalıydı, telefonda Savuş düğmesi çıkmıyordu). Varsayılan olarak kimsenin canı gitmez (hasar ölçülür), enerji/mana/mermi sınırsızdır; "Gerçek dövüş" anahtarıyla gerçek olur. Arenada hiçbir şey kaydedilmez ve başarım işlemez. **Arena kayda asla dokunmaz:** arenaya bir kez girildikten sonra sayfa yeniden açılana kadar hiçbir kayıt (otomatik ya da elle) yazılmaz; arenadan çıkarken de yazılmaz. (o kayıt geri gelmez, elle kayıtlar etkilenmedi.)
- **Meşale yuvası arenada:** silah seçicisinin altında **"Sol el · meşale yuvası"** satırı vardır: Meşalesiz, Kaba meşale ya da Meşale. Seçilen meşale yanar ve sol ele geçer; elde başka silah yoksa meşale vurur (7 hasar). Yuva arenada da tıklanınca söner/yanar.

### Hileler

- **Açmak:** ana menüde klavyeyle `cheat` yaz (tekrar yazınca kapanır) ya da telefonda Ayarlar başlığına art arda 3 kez dokun. **Oyun kolunda:** ana menüde **Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A** (yönler yön tuşlarıyla ya da sol çubukla; tuşlar arasında en çok 2 saniye) girilince hile ayarları açılır, yeniden girilince gizlenip kapanır (`cheat` yazmakla aynı). Son A'ya basış o anda seçili düğmeye basmaz. Kod oyunun içinde girilirse "Hile kodu ana menüde çalışır" yazar. Sayfa her açıldığında bütün hile anahtarları kapalı başlar.
- **Açınca Hile modu da açılır (telefonda hileler açılamıyordu):** eskiden 3 dokunuş (ya da `cheat`) yalnızca hile ayarlarını **görünür** yapıyordu; asıl **Hile modu** anahtarı ayrıca ana menünün Ayarlar'ından açılmalıydı ve oyunun içindeki Ayarlar'da bu anahtar gizli olduğu için oyuna girince hiçbir hile görünmüyordu. Artık: (1) hile ayarları açıldığı an **Hile modu da kendiliğinden açılır** (tek tek hileler yine kapalı başlar; oyun içindeki Ayarlar'da hepsi görünür). (2) **Hile modu anahtarı oyunun içindeki Ayarlar'da da görünür**; oradan açılıp kapatılabilir. (3) Dokunarak ya da tıklayarak (ana menüde 3 kez dokunma, Ayarlar başlığına 3 kez dokunma) hile ayarları yalnızca **açılır**, bir daha dokunmak onları **kapatmaz** (eskiden ana menüde hızlıca 3 kez dokunmak hepsini yanlışlıkla kapatıyordu). Kapatmak için Hile modu anahtarını kapat ya da klavyeyle yeniden `cheat` yaz.
- **Kalıcı değildir:** Hile modu sekme/oturum boyunca açık kalır, sayfa yenilenince kapanır (cihazda kalıcı bayrak tutulmaz).
- **Ekrandaki yazılar:** anahtarın adı yalnızca "Hile modu"dur ("test için" yazmaz); Tanrı modunun açıklaması mor ışıktan söz etmez (oyuncuya ipucu vermesin). **Eşya araması:** arama kutusuna yazarken oyunun tuşları (ör. F = topla) çalışmaz; "e" harfi yazılabilir.
- **Sınırsız sikke açıkken de** görev ve satış sikkeleri hesaba yazılır (sikke sayısı tutarlı kalır; hile kapanınca kazanılmış sikkeler yerindedir).
- **Tanrı modu:** can, tokluk, enerji, mana hep dolu; canavarla ve açlıkla bayılmazsın, ama **mor ışık seni yine bayıltır** (bilinçli). **Hile paneli:** +100 sikke, +100 XP, +2 saat, günü bitir, zamanı sar, eşya arama (miktar 1/10/50/100; ev eşyaları ve yapılar dahil oyundaki bütün eşyalar aramada çıkar). **Tek vuruşta öldür**, **Sınırsız dayanıklılık**, **Sınırsız sikke**, **Gece ışığı**, **Hile kısayolları** (Z +100 sikke, X +100 XP), **ACT 2'ye geç**, **Seviyeyi en üste çıkar**, **Haritayı tamamen aç**.

- **Bütün sahneler (v3.32, Boğaç: hile modundan çıkarıldı):** ara sahneleri ve anıları istediğin zaman izleme artık hile modunda **yoktur** ("Bütün ara sahneler açık" anahtarı ve Keşif defterindeki liste kaldırıldı). Yalnızca **ana menüde klavyeyle `love` yazınca** açılır (yeniden yazınca kapanır; bu cihazda hatırlanır; ekranda "Bütün sahneler açıldı" / "kapandı" yazar). Bir başarımı yoktur, hile modu sayılmaz. Açıkken **Kitap › Anılar**'ın en üstünde **Bütün sahneler** bölümü çıkar: her sahne **küçük resmiyle** (anılarda sahnenin kendi çiziminden alınmış küçük resim; açılış sahnesi, deniz yolculuğu, roket ve kişilerin hikâyelerinde adıyla mor bir kart) bir kutudur; kutuya basınca sahne baştan oynar. Bütün anılar (henüz gelmemiş olanlar dahil) ve bütün ara sahneler buradadır.

### Kayıt

- Otomatik kayıt + 3 elle kayıt yuvası (tarayıcıda).
- **Yan görev XP hatasından etkilenen kayıtlar silinir (v3.45, 6 Kasım 2026, Boğaç):** v3.44'te yan görev bitince XP olarak kişinin x konumu veriliyordu. v3.45'ten önceki bir kayıtta **en az bir yan görev bitmişse** o kayıt açılışta silinir, oyun ana menüde açılır; yan görev bitirmemiş kayıtlar korunur. Silinince yalnızca tek cümlelik bir bilgi çıkar: "Kaydın eski bir hatadan etkilendiği için silindi." (adım tarif edilmez; ana menüde başlığın ve öbür katmanların **üstünde**, okunur, **5 sn** kalır).
- **Ada değişince eski kayıtlar silinir:** harita değişikliğiyle (harita sürümü `MAPV` artınca) eski kayıt açılışta silinir, oyun ana menüde açılır. Bildirim tek cümledir: "Ada değiştiği için eski kayıt silindi." (adım tarif edilmez; ana menüde başlığın ve öbür katmanların **üstünde**, okunur, **5 sn** kalır).
- **Anılar adıyla saklanır:** kayıt, görülen anıları **adıyla** saklar; bir anı eklenip çıkınca kayıtlar kaymaz.
- **Üzerine yazma:** kaydetme menüsünde dolu bir yuvaya basınca bir soru çıkar: "Bu yuvada bir kayıt var (Seviye…, tarih). Yeni kaydı üzerine yazayım mı?" → **Üzerine yaz** / **Vazgeç**. (Önceden "bir kez daha bas" uyarısıydı.)
- **Kaydı sil:** kaydetme ve yükleme menülerinde her dolu yuvanın yanında **Sil** düğmesi (yükleme menüsünde otomatik kayıt da silinebilir). Basınca sorar: "Kayıt 2 silinecek. Emin misiniz? Bu geri alınamaz." → **Eminim, sil** / **Vazgeç**. Silinince yuva boşalır.
- Otomatik kayıt dakikada bir, görev durumu değişince, sekme gizlenince, sayfa kapanırken ve menüye dönerken alınır; ara sahne, uyanış, deniz yolculuğu ve can 0 iken alınmaz.
- **Aynı oyun iki sekmede:** başka bir sekmede oyun açılınca (Devam et, Yükle, Yeni oyun ya da adalar arası geçiş) bu sekme "eski" sayılır ve artık **otomatik kayıt almaz** (yoksa arka plandaki eski sekme dakikada bir eski halini yazıp yeni sekmedeki ilerlemenin üstüne geçiyordu; "Devam et" eski kaydı açıyordu). Eski sekmeye dönünce bir kez uyarı çıkar: "Bu oyun başka bir sekmede ilerledi…". O sekmede bir kayıt yüklenir ya da yeni oyun başlatılırsa sekme yeniden kaydeder; elle kayıt her zaman alınır. "Devam et" her zaman en yeni kaydı (otomatik ya da elle) açar.
- **Dışa aktar:** bütün kayıtlar tek bir kod (`HAMMADDE1:` ile başlar) ya da dosya. **İçe aktar:** kodu yapıştır ya da dosyayı seç. Kayıtlar her adreste ayrıdır (claude.ai sürümü ile GitHub sürümü arasında bu yolla taşınır).
- Başarımlar, toplama/av listeleri ve tuş atamaları cihaza ayrı kaydedilir.
- Adresin sonuna `?debug` eklenince geliştirici araçları açılır (`window.__ham`).


# ACT 1 · Yıldızsız Ada

## Adanın yerleşimi

- **Yerleşim (hilal ada):** Yıldızsız Ada artık dikdörtgen değil, **hilal** biçiminde bir adadır (ızgara 790 × 568 karo; v3.40'ta biyomlar %50 büyüdü, v3.44'te alan olarak düzeltildi; kara ~208.000 karo). Altı biyom **eşit büyüklükte** (her biri ~34.700 karo) ve hilalin bir ucundan öbürüne **zincir halinde** sıralanır; her biyom yalnızca bir öncekine ve bir sonrakine değer: **Çayır** (batı ucu, başladığın yer) → **Orman** (kuzeybatı) → *büyük nehir, köprü* → **Bataklık** (kuzey) → **Kayalık Dağ** (doğu) → *sıradağ, kaya yığını* → **Kül Diyarı** (güneydoğu) → **Mor Kristal Vadisi** (güney ucu). Hilalin ortası denizdir (iç körfez).
- Biyomlar üç ortak bölgede ikişer durur: **Yurt** (Çayır + Orman), **Orta Diyar** (Bataklık + Kayalık Dağ), **Doğu Diyarı** (Kül Diyarı + Mor Kristal Vadisi). Aynı bölgedeki iki biyom arasında engel yoktur, sınırları kıvrımlıdır. Bölgeler arasındaki iki sınır ise **keskindir**: biri büyük nehir, öbürü sıradağ.
- **Büyük nehir** Orman ile Bataklık'ın arasından geçer, iki ucu da denize dökülür; etrafından dolaşılmaz. Nehrin üstünde **üç kırık köprü** vardır, her biri **ayrı ayrı** 20 odunla (**her tür odun** sayılır: Çam, Meşe, Kayın, Ladin…) onarılır; üçü de Orman ↔ Bataklık arasındadır:
  - **Ana köprü** (nehrin ortası): yolu açan köprüdür. Kemal'in 2. görevi ("Bir köprüyü onar") bununla biter. Doğan'ın kulübesi bu köprünün Bataklık ucunun yakınındadır.
  - **İki kısayol köprüsü** (nehrin iki ucuna yakın, biri kuzey kıyısına, biri iç körfeze doğru): ana köprü onarılmadan onarılamaz ("Önce ana köprüyü onar"). Sonra istediğin zaman, istersen birini istersen ikisini onarırsın; nehrin öbür ucundaki yerlere yolu kısaltırlar. Ana köprü onarıldıktan sonra kısayollar iki yakadan da onarılabilir.
- **Sıradağ** Kayalık Dağ ile Kül Diyarı'nın arasından geçer, kıyıdan kıyıya uzanır. Tek geçidi (Doğu geçidi) sıradağın ortasına yakındır ve bir **kaya yığını** kapatır. 2 Kaya patlatıcı ve 4. kademe (Kuvars ya da Çelik) ya da daha iyi bir kazmayla patlatılır. **Patlama bütün sıradağı çökertir:** o andan sonra sınır kalkar, sıradağın her yeri yürünebilir moloz olur ve Kayalık Dağ ile Kül Diyarı arasında her yerden geçilir. (Kayıtta yalnızca "patlatıldı" bilgisi tutulur; yüklenince sıradağ yeniden çöker.)
- **Göller ve dereler:** Orman'da bir pınar gölü ve denize akan deresi, Çayır'da bir göl, Kayalık Dağ'da bir pınar gölü ve deresi, Bataklık'ta bir göl (~560 karo) ve 30 küçük gölcük vardır (v3.44; önce 20) (su, kil, çakıl, su kenarı bitkileri ve tatlı su balıkları bunların başında).
- **Haritadaki miktarlar:** yeni oyunda ada kurulurken her tür sabit sayıda rastgele yere konur; yerler her oyunda farklı, sayılar aynıdır.
  - **Temel malzemeler** bütün adaya serpilir (yaklaşık): Dal ~1.177, **Lif ~1.457, Taş ~1.071**, Yaprak 201, Nehir çakılı ~616, Kum ~530, Çakmaktaşı ~459 (v3.45 yeni oyun ölçümü; serpme v3.39'un 1,5 katı, Giriş › Adalar ve dünya ölçüsü). **Yaprak yerde seyrektir:** serpilen yaprakların, başlangıç kampının çevresi dışında kalanlarının **%72'si** ada kurulurken silinir; silme tohumludur: **her oyunda aynı karolarda olur**, böylece kalan yaprak sayısı her yeni oyunda aynıdır (sayılar aynıdır kuralı yaprakta da geçerli). Yaprak çoğunlukla ağaç kesince düşer. Daha az oldukları için **%30 daha çabuk** yeniden çıkarlar (ör. Dal 25 → 18 sn).
  - **Biyom bitkileri** her biyomun kendi 14 türü: tür başına kendi biyomunda yaklaşık **60**; Kuru ot ~135, Böğürtlen ~120, yalnızca su kenarında biten türler ~45 (v3.44: v3.39'un 1,5 katı).
  - **Madenler** (biyom başına 3 tür, ilk iki biyomda 33, diğerlerinde 30) ve **mağara buluntuları** (Sarkıt, Yarasa gübresi madenlerin çevresinde 66'şar; Mağara mantarı yalnızca mağaraların içinde çıkar) da v3.39'un 1,5 katıdır (v3.44).
  - **Ağaçlar** sayıyla değil olasılıkla çıkar: orman zemininde her karede %20, çimende %4 (Kül Diyarı'nda bunların %45'i). Sonra **iki adımda seyreltilir** (7 Kasım 2026, Boğaç: ağaçlar belirgin azalsın): **1)** ağaçların **%50'si** silinir; **2)** kalanların **%25'i** daha silinir. Toplam ~%62,5 seyreltme. **Ağaç sayıları (v3.57 yeni oyun ölçümü):** Yıldızsız Ada **5.145** (Çayır 1.166, Orman 1.382, Bataklık 687, Kayalık Dağ 996, Kül Diyarı 444, Mor Kristal Vadisi 470); ikinci ada **5.822** (Yüzen Kayalar 1.185, Dev Mantar Ormanı 1.670, Hurda Çölü 1.007, Kristal Golem Ocağı 980, Ejder Volkanı 495, Gök Rıhtımı 485). Hesaptaki ~5.050'den biraz fazladır, çünkü başlangıç kampının çevresi seyreltilmez. Başlangıç kampının 20 karo çevresi iki adımda da seyreltilmez. Tür biyomun 5 ağacından seçilir; meyve ağaçlarının payı 0,45, diğerlerinin 1.
  - **Başlangıç kampının çevresi (20 karo)** seyreltilmez; öğretici burada geçer.
  - **Kuzen aileleri:** her ailenin demircileri ve cadısı kendi biyomunun içindeki sabit yerlerde durur (adanın verisinden); Orman'daki aile (Cadı Yakut) Çayır tarafına yakındır.
  - **Keşif yüzdesi:** haritanın keşfedilen payı (öğreticideki %30, Kâşif başarımındaki yarı, gün sonu özeti) karaya ve kıyıdan 7 karo içindeki denize göre hesaplanır; açık deniz sayılmaz.
  - Hayvanlar haritaya konmaz; bulunduğun biyomun listesine göre çevrende belirir.
  - **Kişilerin dibinde toplanabilir olmaz (7 Kasım 2026):** yerdeki toplanabilirler (taş, kum, çakıl, dal…) konuşulabilir kişilerin **~2 karo** çevresinde ne serpilir ne yeniden çıkar; böylece "F önce yerdeki eşya" kuralı (Boğaç) kişiyle konuşmayı engellemez.
- Büyük nehirde suya düşersen yarım saniyede bir en yakın kıyıya çıkarılırsın; nehrin 14 karo yakınında her zaman **yurt (Orman) kıyısına** çıkarsın, karşıya böyle geçilmez.
- Haritada (M) kişilerin simgeleri görünür; bir simgeye dokununca oraya giden kalıcı bir yol oku konur. Küçük haritanın sol altında bulunduğun biyomun adı yazar.

### Denizdeki gizli yol (v3.30, Boğaç)

- ACT 1 adasında deniz normalde hiç yürünmez. Her **yeni oyunda** rastgele seçilen bir kıyıda (iskele ve köprülerden uzakta) karadan denize doğru dümdüz giden **1 kare genişliğinde, 8–10 kare uzunluğunda** bir yol vardır; yalnızca o kareler yürünür. **Yol mutlaka yürüyerek ulaşılabilir olmalı (Boğaç):** yolun başladığı kıyı adanın yürünebilen karasındadır (başlangıç kumsalından yürüyerek varılan kara; bazı yerler köprü onarılınca ya da kaya yığını patlatılınca açılır, yine de yürüyerek) ve yolun hemen arkasındaki 3 kara karesinde ağaç, kaya, maden, ev ya da başka bir engel olmaz; yola karadan dümdüz yürünerek girilir. Yer kayıtta saklanır (aynı oyunda hep aynı yer); eski kayıtlarda ilk açılışta seçilir. ACT 2 adasında yoktur.
- **Şimdilik deneme için** yolun kareleri denizden farklı renkte (turkuaz) çizilir; ileride normal deniz rengine dönecek (gizli olacak).
- Yolun **son karesine** varınca ekran kararır ("Gözlerin karardı…") ve **Kemal'in yanında** uyanırsın. Bu sıradan bir bayılma değildir: eşya ve sikke kaybolmaz, çanta bırakılmaz, bayılma sayısına ("İlk düşüş", "İnatçı") eklenmez, anı açmaz; can, enerji ve tokluk değişmez. Gizli **Denizde yürüyen** başarımını kazandırır (bkz. Başarımlar). Yolun sonuna her varışta yine bayılırsın.
- **Kemal'in şaşkınlığı (v3.30, Boğaç):** uyanınca Kemal, ne olduğunu ve senin oraya nasıl geldiğini anlayamamış bir şaşkınlıkla karşılar (her seferinde):
  - Kemal: "Hı?! Evlat! Sen… nereden çıktın? Az önce burada kimse yoktu, yemin ederim. Üstün başın sırılsıklam, saçından deniz suyu damlıyor… Ne oldu sana?"
  - Seçenek: "Denizin üstünde yürüyordum… sonra gözlerim karardı."
  - Kemal: "Denizin… üstünde mi? Hah! Bu adada yıllardır yaşarım, böylesini ne gördüm ne duydum. Ya ben yaşlandım ya bu ada iyice tuhaflaştı. Otur şu ateşin yanına, kendine gel; ben de bir çay koyayım. Kendime de bir bardak… iki bardak." · "Tamam"
  - Konuşma bitince (ya da pencere dışına basılınca) başarım kartı çıkar.

## Biyomlar

### Biyomları okuma rehberi

**Beklenen varış seviyesi (yaklaşık):** Çayır 1, Orman ~3 (Börü'nün "Kuzeye keşif" görevi Seviye 3), **Bataklık 12–20** (köprü Seviye 12'de açılır, her şeyi yapan oyuncu ~18–20; 7 Kasım 2026, Boğaç), Kayalık Dağ ~26, Kül Diyarı ~34, Mor Kristal Vadisi ~42 (son üçü biyomun mağarasının önerilen seviyesine göre). Bu bir denge beklentisidir, giriş şartı değildir.

Aşağıdaki her biyom başlığında dört tablo var:

- **Ağaç sayısı:** ada kurulurken ağaçlar iki adımda seyreltilir: önce **%50**, sonra kalanın **%25'i** (toplam ~%62,5; kural: yukarıda Haritadaki miktarlar; başlangıç kampının 20 karo çevresi hariç; orası öğretici için aynı kalır). Kayıtlar etkilenmez, harita her açılışta aynı kurulur. **Ekonomiye etkisi:** ağaç azalınca kesilebilen odun, düşen Dal/Yaprak ve meyve ağaçlarından gelen meyve de azalır; bir bölgede daha az ağaç olur. Odun ve meyve **fiyatları değişmez**.
- **Her kesişte:** ağacın odunu + **1 Dal** + **1 Yaprak** düşer (önceden yaprak 1–2'ydi, dal yoktu).
- **Ağaçlar:** balta ile kesilir (F). "Gereken balta" kademesinin altındaki balta o ağacı kesemez. Meyve ağaçları eli boşken F ile **silkelenir** (2–3 meyve); baltayla kesilirlerse de odun, 1–2 meyve ve %35 ihtimalle tohum verirler. Bazı ağaçlar kesilince yan ürün de düşürür: Çam → 1 Çam kozalağı, Meşe → 1 Meşe palamudu, Akçaağaç → 1 Akçaağaç özsuyu, Ihlamur → 2 Ihlamur çiçeği, Söğüt → 2 Söğüt dalı.
- **Toplanabilirler:** yerde durur, elde alet gerekmez. Toplanınca belirtilen süre sonra aynı yerde yeniden çıkar. "Adadaki sayısı" haritanın o bölgesindeki toplam yerdir (v3.45 yeni oyun ölçümü).
- **Madenler:** kazma elde E. Gereken kazma kademesi tabloda. Maden 300 sn sonra yeniden dolar.
- **Canlılar:** *zararsız* kaçar; *nötr* vurulunca karşılık verir, uzaklaşınca sakinleşir; *saldırgan* görünce saldırır. **Can** ve **Hasar** oyundaki gerçek değerlerdir (savunma ve zorluk hesaba katılmadan). Hız piksel/saniye cinsindendir. Düşürdükleri yüzde ihtimalle verilir.

Her yerde ortak olan temel toplanabilirler (Dal, Taş, Lif, Yaprak) ve su kıyısındaki Nehir çakılı, Kum, Çakmaktaşı en çok yurtta bulunur. **Su** bir kapla (Yaprak kova vb.) suyun başında F ile alınır; **Nehir kili** kürekle kıyıdan kazılır.

### Çayır — Güvenli

Başladığın yer: hilalin batı ucunda, Çayır'ın Orman'a en uzak yerinde, güneye bakan kumsal. Tavşanlar, keklikler, meyve ağaçları. Kemal, Zümrüt, Nazlı, Börü, Dursun ve Durmuş burada. Canavarlar zayıf; kurt sürüleri yalnız gece çıkar.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Çam | Çam odunu | 3 | – | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Kavak | Kavak odunu | 3 | – | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Armut | Armut odunu | – | Yabani armut | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Elma | Elma odunu | – | Yabani elma | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Erik | Erik odunu | – | Yabani erik | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Böğürtlen | 2 | 123 + öğretici kampında 5 (toplam 128) | 40 sn sonra yeniden çıkar, çiğ yenir (+5 tokluk) |
| Çakmaktaşı | 2 | 98 | 31 sn sonra yeniden çıkar |
| Çayır mantarı | 2 | 70 | 50 sn sonra yeniden çıkar |
| Dal | 1 | 242 | 18 sn sonra yeniden çıkar |
| Ebegümeci | 1 | 62 | 40 sn sonra yeniden çıkar |
| Gelincik | 2 | 57 | 40 sn sonra yeniden çıkar |
| Hardal otu | 2 | 71 | 45 sn sonra yeniden çıkar |
| Kum | 1 | 99 | 14 sn sonra yeniden çıkar |
| Kuru ot | 1 | 141 | 25 sn sonra yeniden çıkar |
| Lif | 1 | 238 | 14 sn sonra yeniden çıkar |
| Nane | 2 | 62 | 40 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 127 | 18 sn sonra yeniden çıkar |
| Papatya | 1 | 66 | 35 sn sonra yeniden çıkar |
| Rezene | 2 | 62 | 45 sn sonra yeniden çıkar |
| Sarkıt | 6 | 9 | 120 sn sonra yeniden çıkar |
| Taş | 1 | 176 | 21 sn sonra yeniden çıkar |
| Yabani arpa | 2 | 51 | 45 sn sonra yeniden çıkar |
| Yabani buğday | 2 | 64 | 40 sn sonra yeniden çıkar |
| Yabani havuç | 2 | 57 | 45 sn sonra yeniden çıkar, çiğ yenir (+5 tokluk) |
| Yabani yulaf | 2 | 64 | 45 sn sonra yeniden çıkar |
| Yaban çileği | 2 | 60 | 45 sn sonra yeniden çıkar, çiğ yenir (+6 tokluk) |
| Yaprak | 1 | 51 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 21 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Kireçtaşı | 2 | 1. kademe (Taş, Çakmaktaşı ya da Bakır kazma) | 33 | 300 sn sonra yeniden çıkar |
| Kumtaşı | 3 | 1. kademe (Taş, Çakmaktaşı ya da Bakır kazma) | 33 | 300 sn sonra yeniden çıkar |
| Bakır cevheri | 5 | 1. kademe (Taş, Çakmaktaşı ya da Bakır kazma) | 33 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Tavşan | zararsız | 10 | – | 54 | 4 | – | Tavşan eti %100; Tavşan derisi %70; Kemik %30; Sinir %15 |
| Keklik | zararsız | 6 | – | 50 | 3 | – | Keklik eti %100; Keklik tüyü %85 ×1–3; Keklik yumurtası %30 |
| Bıldırcın | zararsız | 5 | – | 52 | 3 | – | Bıldırcın eti %100; Bıldırcın tüyü %80 ×1–2; Bıldırcın yumurtası %40 ×1–2 |
| Geyik | nötr | 55 | 15 | 62 | 11 | sürü 2–5 | Geyik eti %100 ×1–2; Geyik derisi %80; Geyik boynuzu %40; Sinir %50 ×1–2; Kemik %50 ×1–2; Hayvan yağı %30 |
| Yaban atı | nötr | 80 | 17 | 72 | 16 | sürü 2–4 | Yaban atı eti %100 ×1–2; Yaban atı derisi %80; Kemik %50 ×1–2; Sinir %50 ×1–2 |
| Kerevit | nötr | 40 | 11 | 14 | 11 | – | Kerevit %100 ×1–2 |
| Kurt | saldırgan | 70 | 12 | 66 | 23 | gece, sürü 2–5 | Kurt eti %100; Kurt derisi %75; Kurt dişi %50; Kemik %50 ×1–2; Sinir %40 |
| Porsuk | nötr | 50 | 14 | 40 | 21 | – | Kunduz eti %100; Kunduz derisi %75; Kemik %30 |

**Deri parçası ve Yaban atı:** derisi ya da postu olan her canlı (Çayır'da Tavşan, Geyik, Yaban atı, Kurt, Porsuk) avlanınca derisinin yanında **Deri parçası** da düşürür (%70–80; Yaban atı ve Kurt ×1–2; kural: Tarifler › Tarifler nasıl çalışır). **Yaban atı** Çayır'da yalnızca karakter **Seviye 2**'ye ulaşınca çıkar. **Porsuk** Çayır'ın doğan canlılarındandır (sürü yok, her saatte).

**Çayır canlıları daha sert vurur:** Kerevit, Porsuk, Yaban atı ve Geyik'in hasarı %50 arttı (7→11, 9→14, 11→17, 10→15). Arenada da bu canlılar aynı hasarla vurur (arena canlıları oyunun canlı tablosundan gelir). Kurt değişmedi.

**Canlı sesleri:** vurduğun **her canlı** (bütün biyomlarda, arenada da) can kaybedince kısa bir **acı sesi** çıkarır; ölünce daha uzun, inen bir **ölüm sesi**. Sesin perdesi canlının boyuna göredir: küçükler (tavşan, keklik, sincap, kerevit) ince ciyaklar, büyükler (at, geyik, domuz) kalın homurdanır. Uzaklaştıkça ses azalır, ~340 pikselde duyulmaz.
**Daha gerçekçi acı ve ölüm sesleri (v3.36, Boğaç: "çok kısa, anlaşılmaz, birbirine benziyor"):** acı ve ölüm sesleri artık tek bir "bip" değildir; her canlı türünün **kendi sesi** vardır (sesin perdesi yine boyuna göre). Ses, ağız boşluğunu taklit eden iki tını süzgeciyle (ünlü gibi) ve titreşimle üretilir; acı sesi ~0,3–0,5 sn, ölüm sesi ~0,8–1,2 sn sürer ve daha uzun, sönerek biter:

**Islık gibi değil (v3.38, Boğaç: "hepsinin sesleri ıslık çalıyor gibi, bib bib biiiib"):** hiçbir canlı sesi saf ya da ince bir ton değildir. Sesin perdesi en çok 650 Hz'dir (kuşlar ve yırtıcılar 1000 Hz); kaynak hep vızıltılı, hafif titrek bir sestir, ağız süzgeçleri geniştir (ıslık gibi çınlamaz), sesin yarısı nefestir (hırıltı) ve 3 kHz'in üstü kesilir. Arka arkaya kısa "bip"ler yoktur: kuşlar tek bir hırıltılı ötüş, kemirgenler tek bir nefesli ciyak, böcekler ve kabuklular kuru bir hışırtı çıkarır.

| Ses türü | Canlılar | Acı | Ölüm |
|---|---|---|---|
| Cıvıltı | Keklik, Bıldırcın, Ur kekliği, küçük kuşlar | tek, hırıltılı, telaşlı bir ötüş | inen, sönen bir ötüş |
| Vaklama | Ördek, Yaban kazı, Turna kuşu | burundan iki "vak" | uzun, inen bir "vaaak" |
| Çığlık | Kartal, yarasalar, güveler | keskin, hışırtılı çığlık | uzayıp sönen çığlık |
| Tavşan (v3.37, Boğaç: "ıslık çalıyor gibi olmasın") | Tavşan (ve Reisi) | yere vuran boğuk bir ayak sesi ve kısa, hırıltılı, nefesli bir ciyak; ıslık gibi saf ton yok | boğuk bir düşüş sesi ve inen, nefesli, sönen bir ciyak |
| Ciyaklama | Sincap, Kunduz, Porsuk, Su samuru, kemirgenler | tek, nefesli bir ciyak | inen, nefesli bir ciyak |
| Meleme | Geyik, Karaca, Dağ keçisi, Muflon, Kristal ve mantar geyikleri | titreşimli "mee" | uzun, inen meleme |
| Kişneme | Yaban atı, atlar | kısa kişneme | uzun kişneme ve solama |
| Böğürme | Yaban öküzü ve büyük otçullar | kalın, kısa böğürme | uzun, alçalan böğürme |
| Kaynama | Kurt, Bataklık kurdu, Kül kurdu, Vaşak, tilkiler | kesik bir "kaynn" | inleme ve alçalan uluma |
| Kükreme | Mağara ayısı, ejderler, golemler, büyük boss'lar | kalın, hırıltılı kükreme | uzun, sönen kükreme |
| Domuz | Yaban domuzu | homurtu ve hırıltılı bir ciyak | uzun, hırıltılı ciyaklama |
| Tıslama | Engerek, Timsah, kertenkeleler, yılanlar | kısa tıslama | uzun, sönen tıslama |
| Vıraklama | Kurbağalar | iki boğuk "vrak" | ağır, inen vıraklama |
| Hışırtı | Kerevit, akrepler, böcekler, örümcekler, kirpiler, robotlar | kuru, kısa bir hışırtı | uzayıp sönen bir hışırtı |

Listede adı olmayan bir canlı adına göre (ör. "kurt", "ayı", "geyik", "kuş" geçiyorsa) bir türe girer; hiçbirine uymazsa boyuna göre ciyaklar (küçük) ya da meler (büyük). Yıldızsızlar ve diğer canlıların saldırı sesleri değişmedi.

**Saldırı sesleri (Çayır ve Orman):** saldıran canlı saldırısına başladığı anda (üstünde **!** belirince ya da atış için nişan alırken) kendi sesini çıkarır; eskiden hepsi aynı hırıltıyı çıkarıyordu:

| Canlı | Saldırı sesi |
|---|---|
| Kurt | hırlama |
| Geyik | kısa böğürme |
| Yaban atı | kişneme ve burnundan solama |
| Kerevit | kıskaç tıkırtısı |
| Porsuk | tıslama ve cıvıltı |
| Karaca | iki havlama |
| Kunduz | kuyruk şaklaması, ardından cırlama |
| Yaban domuzu | homurtu ve ciyaklama |
| Dikenli kirpi | diken tıkırtısı |
| Engerek | uzun tıslama |
| Oklu kirpi | kalın diken tıkırtısı ve solama |

**Act 1'in tamamı:** Bataklık, Kayalık Dağ, Kül Diyarı, Mor Kristal Vadisi, altı mağara ve mağara boss'ları da kendi seslerini aldı:

| Biyom | Canlı ve saldırı sesi |
|---|---|
| Bataklık | Yaban kazı ve Turna kuşu çığlık; Su samuru cıvıltı; Zehirli kurbağa vraklama; Bataklık kurdu hırlama; Timsah tıslama ve çene şaklaması |
| Kayalık Dağ | Dağ keçisi ve Muflon meleme; Yaban öküzü böğürme; Kartal çığlık; Vaşak hırlayıp tıslama; Mağara ayısı kükreme |
| Kül Diyarı | Kül böceği vızıltı; Kül kurdu hırlama ve çıtırtı; Lav kertenkelesi tıslama ve çıtırtı; Kül cini uğultu ve çıtırtı; Kor yarasası çığlık ve çıtırtı; Ateş akrebi tıkırtı ve tıslama; Kara ejder uzun kükreme ve alev çıtırtısı |
| Mor Kristal Vadisi | Işık tilkisi iki kısa havlama; Kristal geyik böğürme ve kristal çınlaması; Gölge kurdu derin hırlama; Kristal örümcek tıkırtı ve çınlama; Işık engereği tıslama ve çınlama; Kristal golem gürleme ve çınlamalar |
| Yankı ve Kök mağaraları | Mağara yarasası çığlık; Kör kertenkele tıslama; Taş örümceği tıkırtı; Kök böceği vızıltı; Kök yılanı tıslama; Mağara kurdu hırlama; Yankı Kraliçesi yankılanan çığlık; Yaşlı Kök gıcırdayan inilti |
| Yeni mağaralar | Mağara sülüğü vıcıklama; Balçık kurbağası vraklama; Batak semenderi tıslama; Kaya yarasası çığlık; Tavan örümceği tıkırtı; Mağara vaşağı hırlama; Kor böceği vızıltı ve çıtırtı; Lav yılanı tıslama ve çıtırtı; Duman cini uğultu; Kristal yarasa çığlık ve çınlama; Ayna örümceği tıkırtı ve çınlama; Gölge semenderi tıslama ve derin uğultu |
| Mağara boss'ları | Çamur Ana üç kalın vraklama; Dağ Devi gürleme; Kor Kral kükreme ve alev; Işık Yutan tizden dibe inen uzun bir ses |

Sesler dosya değildir, oyunun içinde üretilir.

### Orman — Güvenli

Adanın kuzeybatısı (Çayır'dan doğuya, büyük nehre doğru yürü). Gölgeli ve sık; yaban domuzları, dikenli kirpiler, engerekler. Usta Sinan bu tarafta. **Kuzenler:** Cadı Yakut (kırmızı kazan), Silahçı Durdu ve Zırhçı Duran. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kayın | Kayın odunu | 8 | – | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Ladin | Ladin odunu | 8 | – | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Meşe | Meşe odunu | 9 | – | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Ihlamur | Ihlamur odunu | 8 | – | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Ceviz | Ceviz odunu | 10 | Ceviz | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |
| Fındık | Fındık odunu | 8 | Fındık (silkele) | 1. kademe (Taş, Çakmaktaşı ya da Bakır balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ahududu | 9 | 66 | 45 sn sonra yeniden çıkar, çiğ yenir (+9 tokluk) |
| Çakmaktaşı | 2 | 73 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 312 | 18 sn sonra yeniden çıkar |
| Eğrelti | 7 | 52 | 40 sn sonra yeniden çıkar |
| Isırgan | 7 | 61 | 35 sn sonra yeniden çıkar |
| Kanlıca | 8 | 64 | 55 sn sonra yeniden çıkar |
| Kum | 1 | 83 | 14 sn sonra yeniden çıkar |
| Kuzugöbeği | 12 | 61 | 70 sn sonra yeniden çıkar, çiğ yenir (+8 tokluk), zehirli! |
| Kuzukulağı | 8 | 57 | 40 sn sonra yeniden çıkar, çiğ yenir (+7 tokluk), zehirli! |
| Lif | 1 | 239 | 14 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 112 | 18 sn sonra yeniden çıkar |
| Sarmaşık | 7 | 63 | 45 sn sonra yeniden çıkar |
| Taş | 1 | 156 | 21 sn sonra yeniden çıkar |
| Tatlısu midyesi | 9 | 45 | 50 sn sonra yeniden çıkar |
| Tavuk mantarı | 9 | 66 | 70 sn sonra yeniden çıkar, çiğ yenir (+8 tokluk) |
| Yabani bal | 12 | 64 | 90 sn sonra yeniden çıkar, çiğ yenir (+12 tokluk) |
| Yabani mercimek | 9 | 65 | 45 sn sonra yeniden çıkar, çiğ yenir (+7 tokluk) |
| Yabani nohut | 9 | 55 | 45 sn sonra yeniden çıkar, çiğ yenir (+7 tokluk) |
| Yaban mersini | 9 | 62 | 50 sn sonra yeniden çıkar, çiğ yenir (+9 tokluk) |
| Yaban sarımsağı | 8 | 74 | 45 sn sonra yeniden çıkar |
| Yaprak | 1 | 51 | 63 sn sonra yeniden çıkar |
| Sarkıt | 6 | 9 | 120 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 12 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Granit | 10 | 1. kademe (Taş, Çakmaktaşı ya da Bakır kazma) | 33 | 300 sn sonra yeniden çıkar |
| Taş kömürü | 11 | 1. kademe (Taş, Çakmaktaşı ya da Bakır kazma) | 32 | 300 sn sonra yeniden çıkar |
| Kalay cevheri | 12 | 1. kademe (Taş, Çakmaktaşı ya da Bakır kazma) | 33 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Sincap | zararsız | 6 | – | 58 | 5 | – | Sincap eti %100; Sincap derisi %60; Ceviz %35 ×1–2; Fındık %35 ×1–2 |
| Karaca | nötr | 70 | 14 | 66 | 12 | sürü 2–4 | Karaca eti %100 ×1–2; Karaca derisi %80; Kemik %50; Sinir %40 |
| Kunduz | nötr | 55 | 12 | 40 | 10 | – | Kunduz eti %100; Kunduz derisi %75; Kemik %30 |
| Yaban domuzu | saldırgan | 130 | 21 | 50 | 24 | gece, sürü 2–5 | Yaban domuzu eti %100 ×1–2; Yaban domuzu derisi %70; Yaban domuzu dişi %45; Kemik %50 ×1–2; Hayvan yağı %40 |
| Dikenli kirpi | nötr | 60 | 12 | 30 | 16 | uzaktan atar (120 menzil, 3 atış), kanama etkisi | Kirpi dikeni %100 ×2–4; Kemik %30 |
| Engerek | saldırgan | 120 | 20 | 40 | 26 | uzaktan atar (115 menzil, 1 atış), zehir etkisi | Zehir bezesi %60; Kemik %30 |
| Oklu kirpi | saldırgan | 330 | 30 | 28 | 61 | uzaktan atar (150 menzil, 3 atış), kanama etkisi | İri diken %100 ×2–3; Kirpi dikeni %80 ×2–4; Kemik %40 |

**Orman canlılarının ayrıntıları:**
- **Deri parçası:** derisi olan canlılar avlanınca derisinin yanında Deri parçası da düşürür: Sincap %60, Karaca %80 ×1–2, Kunduz %75, Yaban domuzu %70 ×1–2.
- **Doğma koşulları:** **Yaban domuzu yalnızca gece** çıkar (gündüz çıkmaz; 6 Kasım 2026, Boğaç) ve saldırgandır: oyuncuyu görünce saldırır. **Engerek** Seviye 6'dan ya da 3. günden sonra, **Oklu kirpi** Seviye 10'dan sonra yalnızca **köprüye yakın Orman'da** (ana köprüye ≤ 100 karo), Seviye 14'ten sonra bütün Orman'da doğar. Orman'da tehlike köprüye doğru artar.
- **Saldırgan sürülerin boyu seviyeyle büyür:** sürü hâlinde gelen saldırgan bir canlı (Yaban domuzu, Kurt, Bataklık kurdu, Kül kurdu) Seviye 1–3'te **2**, Seviye 4–6'da **2–3**, Seviye 7'den sonra tablodaki aralıkta (ör. Yaban domuzu 2–5) gelir. Nötr sürüler (Geyik, Karaca…) her seviyede tablodaki aralıktadır. Kurtlar bu kuralın biyomlarına göre kaydırılmış halini izler: **Bataklık kurdu** Seviye 21'e kadar **2**, Seviye 22–24 **2–3**, Seviye 25'ten sonra **2–4**; **Kül kurdu** Seviye 40'a kadar **2**, Seviye 41–43 **2–3**, Seviye 44'ten sonra **2–4**; **Gölge kurdu** Seviye 47'ye kadar **2**, Seviye 48'den sonra **2–3**.

### Bataklık — Tehlikeli

Adanın kuzeyi, büyük nehrin doğusu: Orman'dan ana köprüyü onarıp karşıya geç. Çamur ayağını tutar (Kamış çizme işe yarar), timsahlar ve zehirli kurbağalar. Demir cevheri yalnızca burada. Avcı Doğan'ın kulübesi burada. **Kuzenler:** Cadı Safir (mavi kazan), Silahçı Ali ve Zırhçı Veli. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Dişbudak | Dişbudak odunu | 14 | – | 2. kademe (Granit ya da Tunç balta) |
| Bataklık servisi | Bataklık servisi odunu | 17 | – | 2. kademe (Granit ya da Tunç balta) |
| Kızılağaç | Kızılağaç odunu | 14 | – | 2. kademe (Granit ya da Tunç balta) |
| Söğüt | Söğüt odunu | 14 | – | 2. kademe (Granit ya da Tunç balta) |
| Mürver | Mürver odunu | 14 | Mürver | 2. kademe (Granit ya da Tunç balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Bataklık otu | 15 | 66 | 45 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 88 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 161 | 18 sn sonra yeniden çıkar |
| Göl kili | 14 | 45 | 60 sn sonra yeniden çıkar |
| Hasırotu | 13 | 57 | 35 sn sonra yeniden çıkar |
| Kamış | 13 | 54 | 30 sn sonra yeniden çıkar |
| Kenevir | 14 | 60 | 45 sn sonra yeniden çıkar |
| Keten | 14 | 58 | 45 sn sonra yeniden çıkar |
| Kızılcık | 18 | 57 | 50 sn sonra yeniden çıkar, çiğ yenir (+12 tokluk) |
| Kum | 1 | 113 | 14 sn sonra yeniden çıkar |
| Lif | 1 | 248 | 14 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 105 | 18 sn sonra yeniden çıkar |
| Nilüfer | 14 | 45 | 50 sn sonra yeniden çıkar |
| Sarkıt | 6 | 10 | 120 sn sonra yeniden çıkar |
| Saz | 13 | 61 | 30 sn sonra yeniden çıkar |
| Sinek mantarı | 20 | 62 | 60 sn sonra yeniden çıkar, çiğ yenir (+11 tokluk), zehirli! |
| Su kestanesi | 18 | 39 | 55 sn sonra yeniden çıkar, çiğ yenir (+12 tokluk) |
| Su teresi | 14 | 37 | 40 sn sonra yeniden çıkar |
| Taş | 1 | 168 | 21 sn sonra yeniden çıkar |
| Turba | 14 | 54 | 45 sn sonra yeniden çıkar |
| Yaprak | 1 | 35 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 9 | 90 sn sonra yeniden çıkar |
| Yosun | 13 | 61 | 30 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Arduvaz | 18 | 2. kademe (Granit ya da Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Tuz kayası | 19 | 2. kademe (Granit ya da Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Demir cevheri | 20 | 2. kademe (Granit ya da Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Ördek | zararsız | 8 | – | 44 | 5 | – | Ördek eti %100; Ördek tüyü %85 ×1–3; Ördek yumurtası %35 |
| Yaban kazı | nötr | 150 | 20 | 46 | 24 | – | Yaban kazı eti %100; Yaban kazı tüyü %85 ×1–3; Yaban kazı yumurtası %35 |
| Turna kuşu | nötr | 200 | 20 | 50 | 32 | – | Turna kuşu eti %100; Turna kuşu tüyü %85 ×1–3; Turna kuşu yumurtası %30 |
| Su samuru | nötr | 240 | 23 | 56 | 35 | – | Su samuru eti %100; Su samuru derisi %75 |
| Zehirli kurbağa | saldırgan | 350 | 36 | 40 | 89 | uzaktan atar (140 menzil, 3 atış), zehir etkisi | Zehir bezesi %80; Kurbağa %60 |
| Bataklık kurdu | saldırgan | 450 | 52 | 100 | 114 | kanama etkisi, sürü 2–4 | Bataklık kurdu postu %80; Kurt dişi %50; Kemik %50 ×1–2 |
| Timsah | saldırgan | 1.080 | 78 | 36 | 194 | kanama etkisi | Timsah derisi %90; Timsah dişi %60 ×1–2; Timsah eti %100 ×1–2 |

**Deri parçası:** Su samuru %75 ×1–2, Bataklık kurdu %80 ×1–2, Timsah %90 ×1–2 (derisinin yanında).

**Kuşaklar: tehlikeli ve ölümcül biyomlar (7 Kasım 2026; "biyomlar arası geçişte keskin fark olmaz, yalnızca gelişim olur"):** Bataklık, Kayalık Dağ, Kül Diyarı ve Mor Kristal Vadisi'nin karoları **derinliğe** göre üç kuşağa ayrılır: **Giriş/Kıyı**, **Orta**, **Derin**. Bir canlının doğup doğmayacağına, doğacağı karonun kuşağı bakılır.

- **Derinlik:** Bataklık'ta karonun **ana köprüye (Orman ↔ Bataklık)** uzaklığıdır. Kayalık Dağ, Kül Diyarı ve Mor Kristal'de karonun **önceki biyomlardan herhangi birinin en yakın sınırına karadan yürüme uzaklığıdır** (karo; aynı biyomun içinden, su geçilmez). Derinlik harita kurulurken **bir kez** hesaplanır; oyun sırasında harita taranmaz, doğma yalnızca seçilen noktanın değerine bakar.
- Kuşak şartı **sürünün her üyesine** ayrı ayrı uygulanır; uygun olmayan kuşağa düşen üye doğmaz.
- Yan görevlerin kendi çıkardığı canavarlar kuşak kuralına bağlı değildir.
- **Derin** kuşakta her canlı her seviyede doğar (biyomun kimliği burada kalır).
- Kuşak sınırları ve doğma şartları her biyomun canlı tablosunun altındadır. Canlıların değerleri kuşaktan bağımsızdır.

**Bataklık'ın kuşakları:**

| Kuşak | Ana köprüye uzaklık | Doğan canlılar |
|---|---|---|
| **Kıyı** (köprü başı) | ≤ 85 karo | Ördek, Yaban kazı, Turna kuşu, Su samuru her zaman; Zehirli kurbağa Seviye 12'den sonra |
| **Orta** | 86–150 karo | Kıyı'dakiler ve Zehirli kurbağa her seviyede; Bataklık kurdu Seviye 20'den sonra; Timsah Seviye 22'den sonra |
| **Derin** | > 150 karo | hepsi her seviyede |

Bataklık kurdu sürüsünün boyu: Orman notundaki sürü kuralına bakın. XP sütunu Bataklık'ın ×1,5 XP çarpanı uygulanmış değerdir (Sistemler › Gelişim).

### Kayalık Dağ — Tehlikeli

Adanın doğusu, Bataklık'ın güneydoğusu; sıradağa kadar uzanır. Kartallar, vaşaklar, mağara ayıları. Pirit, kuvars ve gümüş madenleri (altın Mor Kristal Vadisi'ne geçti). **Kuzenler:** Cadı Firuze (turkuaz kazan), Silahçı Kaya ve Zırhçı Kayhan. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Akçaağaç | Akçaağaç odunu | 22 | – | 3. kademe (Demir balta) |
| Huş | Huş odunu | 22 | – | 3. kademe (Demir balta) |
| Porsuk | Porsuk odunu | 23 | – | 3. kademe (Demir balta) |
| Kestane | Kestane odunu | 22 | Kestane | 3. kademe (Demir balta) |
| Ardıç | Ardıç odunu | 22 | Ardıç meyvesi | 3. kademe (Demir balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Adaçayı | 21 | 59 | 45 sn sonra yeniden çıkar |
| Alıç | 30 | 55 | 50 sn sonra yeniden çıkar, çiğ yenir (+15 tokluk) |
| Beyaz kil | 23 | 68 | 80 sn sonra yeniden çıkar |
| Civanperçemi | 21 | 66 | 45 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 37 | 31 sn sonra yeniden çıkar |
| Dağ çayı | 23 | 54 | 50 sn sonra yeniden çıkar |
| Dal | 1 | 219 | 18 sn sonra yeniden çıkar |
| Kardelen | 24 | 59 | 60 sn sonra yeniden çıkar |
| Kav mantarı | 21 | 59 | 60 sn sonra yeniden çıkar |
| Kayın mantarı | 32 | 57 | 60 sn sonra yeniden çıkar, çiğ yenir (+14 tokluk) |
| Kekik | 21 | 60 | 40 sn sonra yeniden çıkar |
| Kırmızı kil | 22 | 67 | 70 sn sonra yeniden çıkar |
| Kum | 1 | 46 | 14 sn sonra yeniden çıkar |
| Kuşburnu | 30 | 58 | 50 sn sonra yeniden çıkar, çiğ yenir (+14 tokluk) |
| Lavanta | 22 | 61 | 50 sn sonra yeniden çıkar |
| Lif | 1 | 236 | 14 sn sonra yeniden çıkar |
| Liken | 22 | 67 | 45 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 56 | 18 sn sonra yeniden çıkar |
| Sarkıt | 6 | 10 | 120 sn sonra yeniden çıkar |
| Sinirotu | 21 | 51 | 45 sn sonra yeniden çıkar |
| Taş | 1 | 173 | 21 sn sonra yeniden çıkar |
| Yaprak | 1 | 37 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 10 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Pirit | 28 | 3. kademe (Demir kazma) | 29 | 300 sn sonra yeniden çıkar |
| Kuvars | 29 | 3. kademe (Demir kazma) | 29 | 300 sn sonra yeniden çıkar |
| Gümüş cevheri | 32 | 3. kademe (Demir kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Dağ keçisi | nötr | 365 | 42 | 62 | 66 | sürü 2–4 | Dağ keçisi eti %100 ×1–2; Dağ keçisi derisi %80; Kemik %50 |
| Muflon | nötr | 430 | 43 | 58 | 72 | sürü 2–3 | Muflon eti %100 ×1–2; Muflon derisi %80; Kemik %50; Sinir %40 |
| Yaban öküzü | nötr | 860 | 65 | 40 | 144 | sürü 2–3 | Yaban öküzü eti %100 ×2–3; Yaban öküzü derisi %100; Öküz boynuzu %50; Kemik %80 ×2–3; Sinir %60 ×1–2; Hayvan yağı %60 ×1–2 |
| Ur kekliği | zararsız | 12 | – | 52 | 12 | sürü 2–4 | Ur kekliği eti %100; Ur kekliği tüyü %85 ×1–3; Ur kekliği yumurtası %35 |
| Kartal | saldırgan | 970 | 112 | 96 | 262 | uçar, kanama etkisi | Kartal eti %100; Kartal tüyü %90 ×1–3; Kartal pençesi %50 ×1–2 |
| Vaşak | saldırgan | 1.050 | 112 | 92 | 252 | kanama etkisi | Vaşak eti %100 ×1–2; Vaşak derisi %85; Kemik %50 ×1–2 |
| Mağara ayısı | saldırgan | 2.520 | 137 | 44 | 436 | kanama etkisi | Mağara ayısı eti %100 ×2–3; Mağara ayısı derisi %90; Ayı pençesi %60 ×1–2; Hayvan yağı %60 ×1–2; Kemik %50 ×1–2 |

**Kayalık Dağ canlıları:** Yaban öküzü Seviye 4'ten önce doğmaz. **Deri parçası:** Dağ keçisi ve Muflon %80, Yaban öküzü %100, Vaşak %85, Mağara ayısı %90 (derisinin yanında). XP sütunu Kayalık Dağ'ın ×2 XP çarpanı uygulanmış değerdir (Sistemler › Gelişim).

**Kayalık Dağ'ın kuşakları** (derinlik: Bataklık sınırına uzaklık):

| Kuşak | Derinlik | Doğan canlılar |
|---|---|---|
| **Giriş** | ≤ 45 karo | Ur kekliği, Dağ keçisi, Muflon her zaman; Yaban öküzü Seviye 28'den; Kartal Seviye 30'dan |
| **Orta** | 46–85 karo | Ur kekliği, Dağ keçisi, Muflon, Yaban öküzü her zaman; Kartal Seviye 28'den; Vaşak Seviye 30'dan |
| **Derin** | > 85 karo | hepsi her seviyede (Mağara ayısı yalnızca burada) |

### Kül Diyarı — Ölümcül

Adanın güneydoğusu, sıradağın ardı: Kayalık Dağ'dan sıradağa yürü, sıradağdaki **Doğu geçidi**ndeki kaya yığınını patlat (patlayınca bütün sıradağ çöker). Ateş ve kül her yerde; zırhsız gelme. Lav kertenkelesi ve Kara ejder burada. Bazalt, kükürt ve obsidyen madenleri (obsidyen buraya geldi). **Kuzenler:** Cadı Mercan (mercan kazan), Silahçı Turan ve Zırhçı Tufan. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kül ağacı | Kül ağacı odunu | 39 | – | 4. kademe (Kuvars ya da Çelik balta) |
| Kızıl sedir | Kızıl sedir odunu | 41 | – | 4. kademe (Kuvars ya da Çelik balta) |
| Kara çam | Kara çam odunu | 39 | – | 4. kademe (Kuvars ya da Çelik balta) |
| Dikenli akasya | Dikenli akasya odunu | 40 | – | 4. kademe (Kuvars ya da Çelik balta) |
| Ateş narı | Ateş narı odunu | 40 | Ateş narı | 4. kademe (Kuvars ya da Çelik balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ateş biberi | 52 | 55 | 70 sn sonra yeniden çıkar, çiğ yenir (+17 tokluk) |
| Ateş çiçeği | 36 | 55 | 70 sn sonra yeniden çıkar |
| Cüruf | 44 | 63 | 80 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 28 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 126 | 18 sn sonra yeniden çıkar |
| Duman çiçeği | 46 | 51 | 70 sn sonra yeniden çıkar |
| Kara tuz | 49 | 59 | 100 sn sonra yeniden çıkar |
| Kehribar | 40 | 55 | 120 sn sonra yeniden çıkar |
| Kırmızı okr | 35 | 66 | 60 sn sonra yeniden çıkar |
| Kızıl kum | 43 | 53 | 70 sn sonra yeniden çıkar |
| Kor otu | 47 | 57 | 70 sn sonra yeniden çıkar |
| Kum | 1 | 31 | 14 sn sonra yeniden çıkar |
| Kül | 33 | 62 | 25 sn sonra yeniden çıkar |
| Lav camı | 52 | 57 | 110 sn sonra yeniden çıkar |
| Lif | 1 | 253 | 14 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 36 | 18 sn sonra yeniden çıkar |
| Sarı okr | 35 | 61 | 60 sn sonra yeniden çıkar |
| Sarkıt | 6 | 13 | 120 sn sonra yeniden çıkar |
| Sünger taşı | 45 | 61 | 90 sn sonra yeniden çıkar |
| Taş | 1 | 196 | 21 sn sonra yeniden çıkar |
| Yanık kök | 46 | 63 | 70 sn sonra yeniden çıkar |
| Yaprak | 1 | 12 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 5 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Bazalt | 45 | 4. kademe (Kuvars ya da Çelik kazma) | 30 | 300 sn sonra yeniden çıkar |
| Kükürt | 46 | 4. kademe (Kuvars ya da Çelik kazma) | 30 | 300 sn sonra yeniden çıkar |
| Obsidyen | 49 | 4. kademe (Kuvars ya da Çelik kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Kül böceği | nötr | 640 | 83 | 30 | 69 | – | Kül böceği kabuğu %90 ×1–2; Kül %100 ×1–3 |
| Kül kurdu | saldırgan | 1.075 | 140 | 100 | 308 | kanama etkisi, sürü 2–4 | Kül kurdu postu %80; Kül dişi %50 |
| Lav kertenkelesi | saldırgan | 940 | 123 | 46 | 341 | uzaktan atar (175 menzil, 3 atış), yanık etkisi | Lav pulu %80 ×1–2; Ateş bezesi %50 |
| Kül cini | saldırgan | 810 | 99 | 46 | 377 | uzaktan atar (195 menzil, 3 atış), yanık etkisi | Ateş bezesi %60; Kül %100 ×2–4 |
| Kor yarasası | saldırgan | 830 | 115 | 120 | 377 | uçar, yanık etkisi | Yarasa kanadı %80 ×1–2; Ateş bezesi %50 |
| Ateş akrebi | saldırgan | 1.140 | 148 | 52 | 444 | zehir etkisi | Akrep iğnesi %70; Akrep kabuğu %80 ×1–2 |
| Kara ejder | saldırgan | 2.880 | 164 | 34 | 1.107 | uzaktan atar (210 menzil, 5 atış), yanık etkisi | Kara pul %100 ×1–2; Ejder kemiği %80 ×1–2 |

XP sütunu bu biyomun ×1,5 XP çarpanı uygulanmış değerdir (Sistemler › Gelişim).

**Kül Diyarı'nın kuşakları** (derinlik: Kayalık Dağ sınırına uzaklık; sıradağ patlayınca bütün sınır açılır):

| Kuşak | Derinlik | Doğan canlılar |
|---|---|---|
| **Giriş** | ≤ 30 karo | Kül böceği her zaman (Seviye 34–35'te Giriş'te yalnızca o); Kül cini, Lav kertenkelesi ve Kor yarasası Seviye 36'dan |
| **Orta** | 31–60 karo | Kül böceği her zaman; Kül cini, Lav kertenkelesi, Kor yarasası ve Ateş akrebi Seviye 36'dan; Kül kurdu Seviye 38'den |
| **Derin** | > 60 karo | hepsi her seviyede (Kara ejder yalnızca burada) |

### Mor Kristal Vadisi — Çok ölümcül

Hilalin güney ucu, Kül Diyarı'nın ardı; adanın en uzak yeri. Mor ışığın en sık indiği yer; kristal golemler, gölge kurtları. Son iz ve Denizci Barbaros'un enkazı burada. Kristal, ametist ve altın madenleri. **Kuzenler:** Cadı İnci (inci beyazı kazan), Silahçı Kudret ve Zırhçı Kuvvet. Demirci kardeşler aynı ocakta yan yana, cadı ise biyomun başka bir köşesinde kendi kazanının başında; her birinin yanında kendi ateşi.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Gece ağacı | Gece ağacı odunu | 55 | – | 5. kademe (Bazalt, Obsidyen ya da Kara çelik balta) |
| Mor söğüt | Mor söğüt odunu | 54 | – | 5. kademe (Bazalt, Obsidyen ya da Kara çelik balta) |
| Işık ağacı | Işık ağacı odunu | 56 | – | 5. kademe (Bazalt, Obsidyen ya da Kara çelik balta) |
| Yıldız eriği | Yıldız eriği odunu | 54 | Yıldız eriği | 5. kademe (Bazalt, Obsidyen ya da Kara çelik balta) |
| Ay elması | Ay elması odunu | 54 | Ay elması | 5. kademe (Bazalt, Obsidyen ya da Kara çelik balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ay otu | 77 | 58 | 90 sn sonra yeniden çıkar |
| Ay taşı | 87 | 61 | 140 sn sonra yeniden çıkar |
| Çakmaktaşı | 2 | 135 | 31 sn sonra yeniden çıkar |
| Dal | 1 | 117 | 18 sn sonra yeniden çıkar |
| Gece zambağı | 72 | 61 | 90 sn sonra yeniden çıkar |
| Gölge otu | 77 | 54 | 90 sn sonra yeniden çıkar |
| Işık mantarı | 90 | 57 | 80 sn sonra yeniden çıkar, çiğ yenir (+21 tokluk) |
| Işık tozu | 80 | 62 | 110 sn sonra yeniden çıkar |
| Kristal çiçeği | 82 | 65 | 110 sn sonra yeniden çıkar |
| Kristal kum | 67 | 56 | 80 sn sonra yeniden çıkar |
| Kum | 1 | 158 | 14 sn sonra yeniden çıkar |
| Lif | 1 | 243 | 14 sn sonra yeniden çıkar |
| Mor kök | 70 | 54 | 80 sn sonra yeniden çıkar |
| Mor sarmaşık | 67 | 60 | 80 sn sonra yeniden çıkar |
| Mor yosun | 64 | 59 | 70 sn sonra yeniden çıkar |
| Nehir çakılı | 1 | 180 | 18 sn sonra yeniden çıkar |
| Sarkıt | 6 | 14 | 120 sn sonra yeniden çıkar |
| Taş | 1 | 202 | 21 sn sonra yeniden çıkar |
| Yankı taşı | 82 | 60 | 120 sn sonra yeniden çıkar |
| Yaprak | 1 | 15 | 63 sn sonra yeniden çıkar |
| Yarasa gübresi | 3 | 9 | 90 sn sonra yeniden çıkar |
| Yıldız çiçeği | 74 | 63 | 90 sn sonra yeniden çıkar |
| Yıldız tozu | 90 | 67 | 120 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Kristal | 62 | 5. kademe (Bazalt, Obsidyen ya da Kara çelik kazma) | 30 | 300 sn sonra yeniden çıkar |
| Ametist | 67 | 5. kademe (Bazalt, Obsidyen ya da Kara çelik kazma) | 30 | 300 sn sonra yeniden çıkar |
| Altın cevheri | 77 | 5. kademe (Bazalt, Obsidyen ya da Kara çelik kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Mor güve | zararsız | 50 | – | 44 | 30 | uçar | Güve tozu %100 ×1–2 |
| Işık tilkisi | nötr | 1.000 | 114 | 84 | 150 | – | Işık tilkisi eti %100; Işık tilkisi postu %80 |
| Kristal geyik | nötr | 1.630 | 133 | 72 | 473 | sürü 1–2 | Kristal geyik eti %100 ×1–2; Kristal geyik derisi %80; Kristal boynuz %45 |
| Gölge kurdu | saldırgan | 1.475 | 181 | 118 | 650 | kanama etkisi, sürü 2–3 | Gölge postu %80; Gölge dişi %60 ×1–2 |
| Kristal örümcek | saldırgan | 1.320 | 157 | 60 | 621 | uzaktan atar (180 menzil, 3 atış), zehir etkisi | Kristal ipek %90 ×1–3; Örümcek gözü %50 |
| Işık engereği | saldırgan | 1.085 | 169 | 64 | 591 | uzaktan atar (190 menzil, 3 atış), zehir etkisi | Mor zehir %70; Işık pulu %80 ×1–2 |
| Kristal golem | saldırgan | 4.500 | 242 | 30 | 1.559 | – | Golem çekirdeği %60; Kristal %100 ×2–4; Ametist %80 ×1–3 |

XP sütunu bu biyomun ×1,5 XP çarpanı uygulanmış değerdir (Sistemler › Gelişim).

**Mor Kristal Vadisi'nin kuşakları** (derinlik: Kül Diyarı sınırına uzaklık):

| Kuşak | Derinlik | Doğan canlılar |
|---|---|---|
| **Giriş** | ≤ 25 karo | Mor güve, Işık tilkisi, Kristal geyik her zaman; Işık engereği ve Kristal örümcek Seviye 44'ten |
| **Orta** | 26–55 karo | Mor güve, Işık tilkisi, Kristal geyik, Işık engereği, Kristal örümcek her zaman; Gölge kurdu Seviye 45'ten |
| **Derin** | > 55 karo | hepsi her seviyede (Kristal golem yalnızca burada) |




## Ana görevler (görev sistemi v2)

> **oyunda** (Boğaç onayı, 28 Ekim 2026). Eski ACT 1 görevlerinin hepsi kaldırıldı (Kemal'in eski 14 görevi, yan görevler, kuzenlerin 45 görevi); aşağıdaki "ACT 1 › Kişiler (tanıtımlar ve hikâyeler)" bölümü yalnızca kişilerin tanıtımları ve hikâyeleri için **referans** olarak duruyor. Eski bir kayıt açılınca envanter, yapılar ve dünya (onarılmış köprü, çökmüş sıradağ…) kalır, **görev ilerlemesi sıfırlanır**. ACT 2 ustaları şimdilik eski sistemde; sonra aynı kalıpla yazılacak.

**Fiyatlar biyom biyom artar:** bir biyomda toplanan her şey (bitki, meyve, odun, maden; her biyomda bulunan Dal, Taş, Lif, Kum, Yaprak, Nehir çakılı, Çakmaktaşı, Sarkıt ve Yarasa gübresi hariç) bir önceki biyomdakilerden daha pahalıdır: Çayır 1–6, Orman 7–12, Bataklık 13–20, Kayalık Dağ 21–32, Kül Diyarı 33–52, Mor Kristal Vadisi 53–90 sikke; biyomun içindeki sıra korunur. Bunları kullanan tariflerin fiyatı değişim × miktar × 1,3 kadar (zincir boyunca) kendiliğinden değişir. Mağaraların buluntuları kendi fiyatlarındadır.

### Temel kurallar

> **Ana görevler:** bu bölümdeki görevler (adanın kişilerinin görevleri) artık **ana görev** adını taşır; görev kartının başlığı "… · Ana görev" yazar. Ayrıca yolda karşına çıkan yan kişilerin **yan görevleri** vardır; kuralları "ACT 1 › Yan görevler" bölümünde. "Tek aktif görev" kuralı ana görevler içindir; yanında bir yan görev de sürebilir.

1. **Tek aktif görev.** Aynı anda yalnızca bir görev yapılır. Görev alınınca bütün kişilerin başındaki **!** ve haritadaki parlamaları kalkar (dünyada da, küçük ve büyük haritada da).
2. **Görev almak.** Görevi olan kişinin başında **siyah bir !** vardır ve hem dünyada hem haritada **belirgin şekilde parlar**. **Ana görevin tek işareti budur (6 Kasım 2026, Boğaç):** üstte "!" ve parlama; başka görev işareti ("?", mavi işaret, yeşil teslim işareti) yoktur. Görev alınınca "!" ve parlama kalkar (1. madde). Öğretici sürerken ünlem yoktur (Oyun akışı › Öğretici). Yan görevlerin işareti ayrıdır (ACT 1 › Yan görevler › Haritada yan görevler). Onunla konuştuğun anda "şunlara ihtiyacım var" der ve görev **doğrudan başlar** (Kabul et / Görev al düğmesi yok). **Görev alınınca açılan Görevler penceresi** yalnızca görevleri gösterir; El yapımı ya da başka bir pencerenin bölmeleri (ör. Birleştir) içinde görünmez.
   - **"! olan kişiyle konuş" yazısı yalnızca ilk görevde:** üstteki kartta "Başında siyah ! olan kişiyle konuş: …" yazısı yalnızca **hiç görev bitirmemişken** (baltayı yaptıktan sonra ilk göreve giderken) çıkar. İlk görev bittikten sonra görevsizken kart bu yazıyı göstermez (yalnızca süren bir ders varsa onu gösterir, yoksa kart gizlenir); oyuncu parlayan kişiyi kendisi fark edip yanına gider. Kişilerin başındaki ! ve haritadaki parlama eskisi gibidir.
   - **Hikâyeli görev sahnesi:** bütün görevler (eski ve yeni) artık konuşma gibi değil, **gerçek bir sahneyle** verilir. Şeritler iner, karakterin kişinin yanına yürür ve göreve özel bir **sahne betiği** oynar: kişi bir şeyle uğraşırken bir sorun çıkar, bir anısı canlanır, bir şey kırılır… görev bu anın içinden doğar. Sahnenin adımları:
     - **Anlatım:** üstteki siyah şeridin içinde italik sinema yazısı (yeri, zamanı, havayı anlatır).
     - **Konuşma balonları:** kişinin ve karakterin sözleri (eskisi gibi başlarının üstünde).
     - **Duygu:** başın üstünde zıplayan bir işaret (! ? ♥ … ♪ 💢 💡 💧 ✨).
     - **Hareket:** kişi ya da karakter görev yerine bakar, birkaç adım gidip gelir, sevinçle zıplar, eğilip selamlar, döner, başını sallar ya da çömelir.
     - **Efekt:** kişinin ya da karakterin üstünde parçacıklar (kıvılcım, duman, buhar, yaprak, kalp, sikke, toz, ışıltı, kor, kabarcık, kar) ve ses.
     - **Kamera:** görevin yapılacağı yere kayar (uzaksa o yöne doğru), ~2 sn tutar, geri döner.
     - **Eşya:** istenen eşyanın simgesi kişinin başının üstünde adıyla belirir.
     - **Renk:** anılar sepya, gizemli anlar karanlık tonda oynar; sahne bitmeden normale döner.
     - **Telefonda okunurluk:** konuşma balonları her zaman ekranın içinde, üstteki ve alttaki siyah şeritlerin **arasında** kalır: kişi ekranın üst kenarına yakınsa balon aşağı kayar, yanlara taşmaz. Sahne sürerken "Karnın guruldadı" gibi büyük duyurular ve küçük bildirimler balonların üstüne çıkmaz; sahne bitince sırayla gösterilir.
     Her adım kendi süresi kadar kalır; tık/dokunuş ya da bir tuş sonraki adıma geçer, Esc sahnenin kalanını geçer. Sahne bitince eskisi gibi kısa pencere açılır (görevin adı, 📍 yeri, ödülü; "Tamam"la görev başlar). Kemal'in ayak işleri gibi betiği olmayan görevler eski balonlu sahneyle verilir. Kişi uzaksa, arenada ya da denizdeyken sahne atlanır.
   - **Görev sahnesi (yalnızca betiği olmayan görevlerde):** görev, kişinin adadaki kendi yerinde kısa bir sahneyle verilir. Ekranın üstüne ve altına siyah sinema şeritleri kayar, kontrol alınır, karakterin kişiye döner ve uzaktaysa yanına (yaklaşık 1,5 karo) yürür. Sonra ikisi **konuşma balonlarıyla** konuşur: (1) karakterin selamı ("Selam Dursun! Bir işin mi var?" gibi), (2) kişi **o göreve özel** metnini cümle cümle, en çok 4 balonda anlatır (görevin kendi konuşma metni; balon başına en çok ~120 harf), (3) ilk balondan sonra karakterin kısa bir tepkisi ("Anlat bakalım.", "Dinliyorum." gibi), (4) karakterin kabulü ("Tamam, hallederim!", "Bana bırak." gibi). Her balon okuma süresi kadar (1,8–5,2 sn) kalır; tık/dokunuş ya da bir tuş sonraki balona geçer, Esc sahnenin kalanını geçer. Balonlar bitince şeritler kalkar ve kısa bir pencere açılır: görevin adı, 📍 yeri ve ödülü; "Tamam"a basınca görev başlar ve "Görev başladı: …" yazısı çıkar. Kişi yakında değilse (yaklaşık 14 karodan uzak), arenadayken ya da denizdeyken sahne atlanır ve görev eskisi gibi tam metinli konuşma penceresiyle verilir.
   - **Başka kişiye yönlendirme yok:** görev metinlerinde ve teşekkürlerde hiçbir kişi seni başka birine göndermez ("şuna git, ona selam söyle" yok); "X ile tanış" görevi yoktur. Kimin görevi olduğunu **harita** gösterir.
   - **Haritada tanışılmamış görev sahibi:** görevi hazır olan ama **henüz tanışmadığın** bir kişi, haritanın kapalı (keşfedilmemiş) yerinde bile, kendi konumunda **parlayan bir "!"** ile gösterilir (kişinin simgesi ve adı görünmez). Oraya gidip kişiyle tanışınca kişinin simgesi haritada belirir; "!" ve parlama sürer, görev her zamanki gibi alınır (2. madde).
   - **Gece okunurluk:** görev sahnesindeki konuşma balonları gece karanlığının **üstünde** çizilir; karanlıkta da okunur.
   - **Seslenme balonu:** bir kişi sana seslendiğinde ("Parçalar tamam! Dursun'a git" gibi, 7 sn) mavi balonun yeri **bir kez** seçilir (kişinin üstü, altı, yanları; arayüz kutularına değmeyen ilk yer) ve kişiye göre sabit kalır: sen yürüdükçe zıplamaz, yalnızca kişiyle birlikte kayar. Karakterin engel sayılmaz. Balon bir arayüz kutusunun altında **yarım saniyeden uzun** kalırsa bir kez yer değiştirir. Kişi ekrandan çıkarsa balon ekranın kenarında durur ve küçük sarı bir ok kişinin yönünü gösterir.
3. **Görevdeyken başkası.** Görevi olan biriyle konuşursan "Şu an bir işin var; önce onu bitir" der. Kazan, örs, pazar, sipariş, bileme gibi bütün hizmetler görev sürerken de kullanılır. **Nazlı'nın görevi sürerken pazar:** Nazlı'yla konuşunca açılan görev durumu penceresinin ilk seçeneği **"Pazarı aç"**tır; görev sürerken de bir tıkla satış/alış yapılır (Pazar düğmesi ve P tuşu yok: pazar Nazlı'yla konuşunca açılır).
4. **İptal.** Görev iki yoldan iptal edilir: üstteki görev kartında **×** (onay sorar; × görünürken kartın sağında ona yer ayrılır, telefonda görev yazısı çarpının altında kalmaz; telefonun yatay düzeninde de: orada ayrılan yer işlemiyordu. Telefonda kapalı kart görev yazısını artık **iki satıra** kadar gösterir, böylece görevin adı ve sayaçlar ("Papatya çayı 0/4 Papatya · 0/3 Nane") okunur), ya da **görevi veren kişiyle** konuşunca menüdeki "📜 Görev" satırından "Bu işten vazgeçiyorum" (Kemal ve Nazlı'da durum penceresi doğrudan açılır; Nazlı'nınkinde ilk seçenek "Pazarı aç"). İptal edilince görevin bütün ilerlemesi silinir (av sayacı, çember vb.), görev hiç alınmamış sayılır; kişi yeniden parlar ve başında ! çıkar.
5. **Açılma koşulu.** Her görevin en az bir açılma koşulu vardır (bir önceki görev, seviye, bir alet, bir yer…). Ayrıca bir görevin istediği **her malzeme oyunda en az bir kez bulunmuş** olmalıdır ("Yeni malzeme bulundu" denmiş ya da tarif kitabında açık). Bulunmamış malzeme isteyen görev açılmaz. **"X keşfedildi"** koşulu, o biyoma ilk kez adım atılınca sağlanır (her biyoma bir kişinin "Ulaş" görevi ya da ana yol götürür). **Tarif kuralı:** bir şeyin **yapılmasını ya da dövülmesini** isteyen görev, o şeyin **tarifi öğrenilmeden açılmaz** (görev tarifi kendisi kitaba yazıyorsa hariç). Örneğin Dursun'un "Keskin işler" (Taş kazma) görevi Taş kazma tarifi öğrenilince açılır.
   - **Tarif bilinmeden görev verilmez (v2.26, Boğaç):** bir görev **tariften yapılan** bir eşya istiyorsa (getir, yap, dövdür ya da giy; yerden toplanan, kesilen, avlanan ya da tarlada yetişen değil) o eşyanın tarifini kazanda **öğrenmiş olmadan** görev açılmaz: kişinin başında ! çıkmaz, görev verilmez. Görevin kitaba tarif yazması yetmez. Birden fazla seçenekli görevde (ör. "Tunç balta, Tunç kazma ya da Tunç mızrak") birinin tarifini bilmek yeter. **Tuzakla av da sayılır:** "tuzakla av" isteyen görev (Nazlı N4 Kürk siparişi) **Tuzak tarifi kazanda öğrenilmeden** açılmaz; Nazlı'nın başında ! çıkmaz, görev verilmez (Kemal'in ayak işi seni tarife yönlendirir). Bu kurala giren görevler (Zümrüt Z3 Gelincik boyası, Dursun D2 Taş kazma, D3, D5, Durmuş M2/M3/M5, Sinan R4 (v3.39), Nazlı N5, Usta U4, Yakut K1/K4 ve kuzenlerin alet, zırh, merhem görevleri). ("zümrütün çadırında öğrenmeden ben neden atölye görevini alabiliyorum") kural bütün görev türlerine genişledi: **kur** (Atölye, Çit), **gece ateş başında** (Kamp ateşi), **balık tut** (Olta), **yatak koy** (yatak tariflerinden biri), **ev kur** (ev tariflerinden biri) görevleri de tarif öğrenilmeden (ya da eşya elde yoksa) verilmez; o zaman Kemal "X tarifini öğren" işini verir. **Eski kayıtlar:** kayıt açılınca aktif görevin gerektirdiği tarif öğrenilmemişse (ve görev henüz tamamlanmamışsa) görev geri bırakılır; veren kişi "Önce X tarifini öğren" der, Kemal tarif işini verir, tarif öğrenilince görev yeniden verilir.
   - **Kişi bir şey söylemez:** görevi tarif yüzünden bekleyen kişi "önce şu tarifi öğren" demez; görevsiz kalmamak için yol gösteren Kemal'dir (aşağıdaki ayak işi, 7. madde).
   - **Tarifi aynı kişi veriyorsa "!" yanar:** görevin eksik tarifini **görevi veren kişinin kendisi** ilk konuşmada yazıyorsa (ör. Avcı Doğan: Kamış çizme ve Panzehir), o kişi henüz tanışılmamış olsa da başında "!" çıkar; tarif ilk konuşmada yazılır ve görev aynı konuşmada verilir.
   - **Görevsiz kalınmaz:** bütün görevler kilitliyse ve sıradaki görevin eksiği bir tarifse Kemal "**X tarifini öğren**" ayak işini verir (Zümrüt'ün kazanında öğrenince kendiliğinden biter, 15 sikke · 15 XP). Tarifin içindeki bir malzemeyi hiç görmediysen önce onu getirtir. Kemal'in "alet dövdür" ve "ışık yap" ayak işleri de tarif bilinmiyorsa önce tarifi öğretir. **Hangi görevin tarifine yönlendirileceği** 6. maddedeki "!" sırasıyla seçilir: önce oyuncunun bulunduğu biyomdaki görev, sonra erken biyom, sonra kişinin görev sırası.
   - **Varış görevleri tarif yüzünden kilitlenmez (7 Kasım 2026, Boğaç):** bir biyoma varış ya da geçiş görevi (Kemal'in "Doğu geçidini aç" E3'ü) istediği eşyanın tarifi bilinmeden de verilir; görev kartında "Tarif: X (kazanda öğren)" satırı görünür (ör. "Tarif: Kaya patlatıcı (kazanda öğren)"). Böylece yeni biyoma varınca "!" hep bulunur (Kayalık'ta Firuze, tarif bilinmese de). Yukarıdaki genel kural (v2.26) öbür görevler için geçerlidir. Tarif bilinmiyorsa Kemal'in ayak işi zinciri yine adım adım götürür: önce görülmemiş malzemeler (ör. Yarasa gübresi), sonra tarifin içindeki ve henüz hiçbir türü öğrenilmemiş parça (Kaya patlatıcı için **Göl çömleği** → Islak göl kili → Göl kili getir), en sonda Kaya patlatıcı. Her "tarifini öğren" ayak işi o tarifi kitaba da yazar, kazanda görünsün diye.
   - Bu kural gelmeden önce alınmış ve sürmekte olan görevler (ör. tarifi bilinmeden alınmış Gelincik boyası) olduğu gibi kalır; istenirse iptal edilebilir.
6. **En çok 2 "!".** Haritada aynı anda en fazla **2 kişide** görev bekler. Bir görev daha açılırsa sıraya girer; bekleyen iki görevden biri tamamlanınca görünür. Sıra (6 Kasım 2026, Boğaç): **önce oyuncunun bulunduğu biyomdaki görevler**, sonra erken biyom, sonra kişinin görev sırası (ör. Orman'a varınca Usta Sinan'ın R2 "!"si görünür). (Kemal'in ayak işleri bu sayıya girmez.)

    - **Yeni biyomda en az bir "!" (7 Kasım 2026):** oyuncu bir biyoma ilk kez vardığında o biyomda en az bir kişide "!" bulunur. Bunun için biyomun ilk ana görevi, Kemal'in yanında, o biyoma giden yolu açan ya da biyomda yaşayan bir kişiden de alınabilir: Kayalık Dağ'ın E3'ü Kayalık'taki Cadı Firuze'den (ayrıca T6 bitince Avcı Doğan'dan), Kül Diyarı'nın E4'ü Cadı Mercan'dan. Mor Kristal Vadisi'nde Barbaros'un L1'i E5 (varış) bitince kendiliğinden açılır. Bataklık'ta Doğan'ın görevleri E2 bitince açılır. Varış görevleri tarif yüzünden kilitlenmediği için (7 Kasım 2026, Boğaç) bu "!" tarif bilinmese de çıkar.

7. **Görevsiz kalınmaz.** Hiç görev yoksa (bütün zincirler kilitliyse) **Kemal'in başında ! çıkar** ve bir sonraki kilitli görevin eksik koşulunu tamamlatan bir iş verir ("Kemal'in ayak işleri", aşağıda). Oyuncu bunun bir eksiklikten doğduğunu anlamaz: Kemal'in gerçekten bir işi varmış gibi konuşur.
8. **İstenenler biyomdan.** Her kişi kendi biyomunun malzemesini ister; yalnızca **son görevleri** bir sonraki biyomun **bol ve kolay** (zararsız ya da toplanabilir) bir şeyini isteyebilir. Akış kolaydan zora, Çayır'dan Mor Kristal Vadisi'ne gider.
9. **Kendiliğinden biten işler.** Bir yere gitmek, biriyle tanışmak, köprüyü onarmak, sıradağı patlatmak, izleri bulmak ve Barbaros'un gemisini kurmak: bunlar yapıldığı anda biter, ödül oracıkta gelir (geri dönüp teslim etmek gerekmez). Kemal'e bu yüzden yalnızca yeni iş almaya gidilir.

    - **Görev kartında eksik tarif:** görev alınmışken istediği eşyanın tarifi bilinmiyorsa (varış görevleri, ör. E3; ya da tarif şartı gelmeden önce alınmış görevler) görev kartında ayrı bir satır görünür: "Tarif: X (kazanda öğren)" (ör. "Tarif: Kaya patlatıcı (kazanda öğren)").

    - **Kart her zaman sıradaki adımı gösterir (7 Kasım 2026, Boğaç: "Kullanıcı sorun yaşamamalı, 'ne yapacağım şimdi' dememeli"):** tarifi ya da malzemesi eksik bir görevin kartı, oyuncunun **bir sonraki somut adımını** her an gösterir: hangi malzeme nerede bulunur, hangi tarif hangi kazanda öğrenilir, ne yapılır, nereye gidilir. Bu oyun içi hedeftir (cihaz ya da arayüz işi tarif edilmez). Sıra, Kemal'in "tarifini öğren" ayak işi zincirinin mantığıdır: önce görülmemiş malzeme, sonra eksik ara tarif, sonra görevin tarifi, sonra yapmak, sonra görevin kendisi.

10. **Ödül.** Sikke + XP; bazı görevler ayrıca tarif yazar. Kabaca biyoma göre: Çayır 20–120, Orman 40–180, Bataklık 120–300, Kayalık Dağ 200–420, Kül Diyarı 300–550, Mor Kristal Vadisi 450–800 sikke.

### Yol gösterme: ok ve sarı bölge

- Görev alınınca görevin **yapılabileceği her yer** haritada (büyük ve küçük harita) **sarı boyanır** ve yavaşça nabız gibi parlar; görev sürdükçe kalır, görevdeki **son parça** toplanınca ya da görev iptal edilince kalkar. Küçük bir çember çizilmez.
  - Toplanabilir / maden / ağaç: o şeyin **bulunduğu bütün biyomlar** baştan sona sarı (yalnızca kara; su boyanmaz). Örneğin her biyomda çıkan bir şey için bütün ada.
  - Hayvandan düşen şey ya da av: o canlının **yaşadığı bütün biyomlar** (eşya hem yerden hem avdan çıkıyorsa ikisinin biyomları birlikte).
  - Balık tutma ve nehir kili gibi suda yapılan işler: **nehirler ve sığ sular** (açık deniz değil).
  - Bir biyoma gitme: o biyomun tamamı.
  - Bir kişiye, bir yapıya ya da bir yere gitme (demirci, kazan, köprü, enkaz…): o kişinin/yerin çevresinde büyük bir sarı ışık (yaklaşık 8 karo yarıçap) ve dışa açılan halkalar. oraya 8 karodan yakınken bu büyük ışık haritada çizilmez (küçük haritada senin üstüne biniyordu). Kazanda yapılan görevlerde (ör. Zümrüt'ün "Kazanın dili") hedef **Zümrüt değil kazandır**; kazanın yanına gelince oyunda **kazanın kendisi sarı parlar**.
  - Yapılacak bir eşya: ham maddeleri sırayla gösterilir (biri tamamlanınca sarı bölge sonrakine geçer); son adımda yapılacağı yer (kazan, örs, el yapımı) söylenir. Birden fazla şey isteyen görevde bölge sırayla her birini gösterir. **Hangi malzeme için ("atölye kurda neden Çayır istiyor"):** görev kartındaki yer satırı, gösterdiği bölgenin hangi malzeme için olduğunu yazar (ör. "**Taş**: Çayır · haritada sarı bölge"); bir şey yap/kur görevinde bölge, henüz eksik olan ilk malzemenin bulunduğu yerdir.
- **Ok:** sarı bölgenin dışındaysan ok seni bölgenin **sana en yakın** yerine götürür. **Zaten o biyomdaysan** (ya da suda yapılacak işte nehrin 3 karo yakınındaysan, kişiye gidilecek işte 8 karo yakınındaysan) **ok çıkmaz**.
- Görev kartı ve görev konuşmasındaki "📍" satırı biyomların adını söyler ("Orman, Bataklık · haritada sarı bölge").
- Görev bitince (kendiliğinden bitenler hariç) ok **görevi veren kişiyi** gösterir. Kişinin yanına (yaklaşık 2 karo) gelince "**Görev tamamlandı**" yazısı çıkar, kişi teşekkür eder, ödül verilir.

### Yeni mekanik dersleri

Bir görev oyuncunun henüz bilmediği bir mekaniği istiyorsa, görev **önce kısa bir dersle** başlar: öğreticideki gibi kart + ok + vurgu, adım adım. Ders bitince asıl görev başlar. Her ders **bir kez** görülür; öğreticiyi yapmış olan bildiği dersleri görmez. **Ders kartı açıkken F oyun eylemini yapar** (toplar, konuşur, keser); kart ekranda kalır. **Ders kartı pencerenin üstüne binmez:** "Yeni ders" kartı başka bir pencere (konuşma, sipariş, pazar…) açıkken bekler, pencere kapanınca gösterilir.

| Ders | Hangi görevde | Adımlar (özet) |
|---|---|---|
| Ağaç kesme | Dursun 1 (v3.39) | Baltayı yuvaya koy → eline al → ağaca F → odun düşer |
| Örs ve demirci | Dursun 1 (öğreticiyi geçenlere) | Tarifi kazanda öğren → parçaları topla → demirciye F → Döv |
| Kamp ateşi ve gece | Börü 1 | V ile ateş kur → geceyi ateşin ışığında geçir; zifiri karanlık kuralı |
| Balık tutma | Nazlı 2 | Olta yap → eline al → suya dön → F → çekmek için zamanında bas |
| Maden ve eritme | Dursun 5 | Kazmayla cevher → kömür → kazanda külçe tarifi → el yapımı külçe |
| Köprü onarımı | Kemal 2 | Köprüye F / tıkla → onay penceresi → malzeme gider |
| İnşa | Sinan K3 | Çiti el yapımıyla yap → İnşa'yı aç → çiti koy |
| Zırh giyme | Durmuş 5 | C penceresi → yuvaya sürükle → savunma |
| Kaya patlatıcı | Kemal 3 | Patlatıcı tarifi → kazma → kaya yığınına E → onay → patlama |
| Silah yuvası ve dövüş | Börü 2–3 | Saldırı tuşu, atılma, silahı silah yuvasına koyma |
| Tuzak kurma | Nazlı 4 | Tuzağı eline al → çayırda E → ertesi kontrol |
| Bileme | Dursun 4 | Demirciye "Aletimi bile" → körelmiş alet |
| Satış | Nazlı 3 (öğreticiyi geçenlere) | Pazarı aç → malzeme seç → sat |
| Barınak ve uyku | Sinan 1 | Barınak yaptır → yere koy → gece içinde F ile uyu |
| Kil ve kürek | Sinan 5 | Kürek yap → nehir kıyısında E → ıslak kil → kerpiç |
| Ev ve yatak | Sinan 6 | Sinan'dan ev al → yere koy → içine gir → Sinan'dan yatak → evin içine koy |
| Yapı kurma | Sinan 3 | Malzemeyi topla → Sinan'a E → kurar → yere yerleştir |
| Çamur ve çizme | Doğan 1 | Bataklık çamuru yavaşlatır → kamış çizme yap → giy |

### Köprü, kaya yığını ve gemi

- Bu üç iş **görev alınmadan yapılamaz**: Kemal'in "Bir köprüyü onar" ve "Doğu geçidini aç" görevleri, Barbaros'un "Yeni bir gemi" görevi.
- **Görev açılmadan köprü iş vaat etmez:** onarım görevi (E2) açılmadan köprünün istemi yalnızca "**Kırık köprü**" der; F'ye basınca **oyuncunun** kısa bir düşünce balonu çıkar ("Kırık bir köprü… Kemal bir şey biliyordur."), onay penceresi açılmaz. **Onay penceresinde bekleyen seviye puanı:** verilmemiş seviye puanı varken köprü onay penceresinde bir bilgi satırı görünür: "N seviye puanın bekliyor." (adım tarif edilmez).
- Köprüye, kaya yığınına ya da gemi enkazına **F ya da sol tıkla** basınca bir **onay penceresi** açılır (hiçbir kişinin portresi yok): "20 odun harcanacak. Onarılsın mı?" gibi. Onaylayınca malzeme gider ve karakter duruma göre tepki verir (konuşma balonu): köprüde "Aa, sandığımdan kolaymış!", patlamada önce "Kulaklarımı tıkasam iyi olur…" sonra sarsıntı ve "Vay be!", gemide "İşte ACT 1'in sonu… ya da başlangıcı."
- **Görev alınmamışken** gerekli malzemeyle oraya gelen kişi **yalnızca bir kez** kendi kendine konuşur: "Buradan nasıl geçebilirim acaba? Kemal bilir belki." Onay penceresi açılmaz.
- Köprü onarılınca Kemal'in **koşu dersi** başlar (eskiden olduğu gibi).
- Ana köprü (Orman ↔ Bataklık) onarıldıktan sonra iki kısayol köprüsü (Çayır ↔ Kayalık Dağ) görevsiz, istenen an onay penceresiyle onarılır. Patlama bütün sıradağı çökertir.

### Kemal'in ayak işleri (boşluk doldurma)

Hiçbir kişide görev yoksa Kemal'in başında ! çıkar. Kemal, **bir sonraki kilitli görevin eksik koşulunu** tamamlatan bir iş verir; konuşması sıradan bir görev gibidir, oyuncu bir şeyin eksik olduğunu sezmez. O görevin bulunmamış malzemeleri birden çoksa hepsini tek işte, birer tane ister. Kemal'in hikâye parçaları onun 5 görevine bağlıdır (beşincisiyle son iki parça açılır).

| Eksik olan | Kemal'in işi (örnek söz) | Çember |
|---|---|---|
| Henüz bulunmamış bir malzeme | "Dün akşam çayırın doğusunda kırmızı çiçekler gördüm, **gelincik**. Bir tane getirir misin, kampa renk gelsin." | O malzemenin en zararsız kümesi |
| Seviye | "Kollarına bir bak evlat; bu adada güçsüz yaşanmaz. Biraz avlan, biraz topla: **Seviye 5**'e gel, sonra konuşalım." | – |
| Bir alet | "Elinde bir **çakmaktaşı balta** olsa meşeleri de keserdin. Dursun'a bir uğra." | Ham maddeleri sırayla |
| Bir yere gitmek | "Kuzeydeki ormanı hiç gördün mü? Bir **Orman**'a git, nasıl bir yer anlat bana." | O biyomun girişi |

Ödülü küçüktür (10–40 sikke, biraz XP). Ayak işleri haritadaki "en çok 2 !" sınırına girmez.

### Kişiler ve görevler

**Her kişinin 8 görevi var:** 27 kişi × 8 = **216 görev** (önce 139). Yeni görevler zincirin sonuna eklenir (6.–8.; 6 görevi olanlarda 7.–8.); Barbaros'un yenileri (L6–L8) gemiden önce gelir, L5 artık L8'den sonra açılır. Yeni görevler bir önceki görevi ve artan bir **seviyeyi** ister (Çayır 5/7/9, Orman 8/10/12, Bataklık 12/14/16, Kayalık Dağ 16/19/22, Kül Diyarı 22/25/28, Mor Kristal Vadisi 28/32/36) ki erken bölgelerin ek görevleri "en çok 2 !" sırasını tıkamasın. Yalnızca **doğal** eşya (toplanan, kesilen, kazılan, avdan düşen) ve av isterler; 8. görev bir sonraki biyomun bol ve kolay bir şeyini isteyebilir. Ödülleri zincirdeki bir önceki görevin altına düşmez. Her görevin kendi **hikâyeli sahnesi** vardır (kural 2).

Tablolarda: **İstenen** = görevin istediği (getir / avla / yap / dövdür / kur / ulaş). **Açılma** = ek koşullar (kural 5'teki "malzeme bulunmuş olmalı" her görev için ayrıca geçerli). **Açar** = tamamlanınca açılan görevler. Çember her görevde yukarıdaki kurala göre çizilir.

#### Yaşlı Kemal · Çayır · ana yol

Kumsalda seni bulan yaşlı denizci; sakin, kollayıcı, öğretici. Kemal'de yalnızca **ana yolun** görevleri var: ilk iş, köprü, patlama, izler ve Barbaros. Aletler, ateş, balık, maden ve zırh gibi öğrenme işleri ilgili ustalara dağıtıldı; oyuncu Kemal'e yalnızca hikâye ilerlerken (ve nadiren bir ayak işi için) döner. İlk görevi öğretici bitince (ya da geçilince) **hemen** başında ! ve haritada parlamayla çıkar.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| E1 | Ateşlik çalı | Getir: 6 Dal, 2 Kuru ot | Öğretici bitti ya da geçildi | Dursun 1, Zümrüt 1 | – | 20 · 15 XP |
| E2 | Bir köprüyü onar | Ana köprü (Orman ↔ Bataklık): 20 odun (her tür odun sayılır), onay penceresiyle | Orman keşfedildi · Seviye 12 | Doğan 1 ve Bataklık'taki görevler | Köprü onarımı | 150 · 120 XP |
| E3 | Doğu geçidini aç | 2 Kaya patlatıcı + 4. kademe ya da daha iyi kazma (Kuvars ya da Çelik); kaya yığınına F, onay | Kayalık Dağ keşfedildi · Seviye 10 (Kaya patlatıcı tarifi bilinmeden de alınır, 7 Kasım 2026, Boğaç; görev kartında "Tarif: Kaya patlatıcı (kazanda öğren)" görünür). Kemal'den, T6 bitince **Avcı Doğan**'dan (Kemal'e dönmeden) ya da Kayalık Dağ'daki **Cadı Firuze**'den alınabilir (Firuze, kazanının buharında doğudaki kaya yığınının ardından tüten dumanı görür ve yolu açmanı ister) | Kül Diyarı'ndaki görevler | Kaya patlatıcı | 300 · 400 XP |
| E4 | Eşinden kalan izler | Bul: 6 iz (önceden bulunanlar sayılır) | Kül Diyarı keşfedildi. Kemal'den ya da Kül Diyarı'ndaki **Cadı Mercan**'dan alınabilir (Mercan kazanının dumanında izleri görür) | E5, Gemi tarifi | – | 300 · 600 XP |
| E5 | Kıyıdaki duman | Ulaş: Mor Kristal Vadisi'ne git (Kemal dumanı merak eder; kimseyi söylemez) | E4 | E6, Barbaros 1 | – | 200 · 300 XP |
| E6 | Saliha'nın çorbası | Getir: 3 Yabani havuç, 2 Rezene, 2 Tavşan eti | E5 · Seviye 5 | E7 | – | 70 · 45 XP |
| E7 | Bulut gibi yastık | Getir: 8 Keklik tüyü, 4 Bıldırcın tüyü | E6 · Seviye 7 | E8 | – | 100 · 60 XP |
| E8 | Kurtların uluması | Avla: 3 Kurt · Getir: 2 Kurt dişi | E7 · Seviye 9 | – | – | 130 · 80 XP |

**E3 ve E4 başka kişilerden alınınca sözleri:**

- **Avcı Doğan (E3, T6 bitince):** "Dağ yolunu gördün. Kemal'in sözünü ettiği geçit orada: doğuda, sıradağın göğsünü kocaman bir kaya yığını kapatıyor; ardında Kül Diyarı. Kemal'e dönmene gerek yok. 2 kaya patlatıcı ve en az kuvars ya da çelik kazma ile yığını aç."
- **Cadı Firuze (E3):** "Kazanımın buharına bak… Doğuda, sıradağın göğsündeki kaya yığınının ardından bir duman tütüyor. Orası Kül Diyarı. Yolu aç: 2 kaya patlatıcı ve en az kuvars ya da çelik kazma lazım."
- **Cadı Mercan (E4):** "Kazanımın dumanında bir şey görüyorum… Mor parıltılar: kıyıda, ormanda, bataklıkta. Eşinden kalan izler bunlar. Altısını da bul; bulduklarını kitabının İzler sekmesinde okursun."

**E3 tarifsiz alındığında görev kartının adımları** (kart her an yalnızca sıradaki tek adımı gösterir; yapılmış adımlar atlanır):

| # | Kartta görünen adım | Ne zaman |
|---|---|---|
| 1 | "Bul: Yarasa gübresi (madenlerin çevresinde, her biyomda)" · "Bul: Turba (Bataklık)" · "Bul: Tuz kayası (Bataklık, kazmayla)" · "Bul: Göl kili (Bataklık, göl kıyısı)" | Malzeme hiç görülmemişse, her biri ayrı adım |
| 2 | "Tarif: Tuz (kazanda öğren)" → "Tarif: Islak göl kili (kazanda öğren)" → "Tarif: Göl çömleği (kazanda öğren)" | Kaya patlatıcının ara parçalarının tarifi bilinmiyorsa, sırayla |
| 3 | "Tarif: Kaya patlatıcı (kazanda öğren)" | Ara tarifler bilinince |
| 4 | "Yap: 2 Kaya patlatıcı" (6 Yarasa gübresi, 4 Turba, 2 Tuz, 2 Göl çömleği; el yapımı) | Tarif bilinince |
| 5 | "Dövdür: kuvars ya da çelik kazma" | 4. kademe ya da daha iyi kazma yoksa |
| 6 | "Kaya yığınına F" (doğudaki kaya yığını, onay penceresi) | Her şey hazırsa |

Tarifler herhangi bir cadının kazanında öğrenilir; Kayalık Dağ'da en yakını Cadı Firuze'nin kazanıdır. **E3'ü veren kişi** (Kemal, Doğan ya da Firuze) tarif bilinmiyorsa sözüne tek cümle ekler: "Kaya patlatıcının tarifini bir cadının kazanında öğrenirsin; en yakını Firuze'nin kazanı." (Firuze: "…tarifini benim kazanımda öğrenirsin.")

Kemal'e gidiş sayısı: ACT 1 boyunca 5 görev + 5 teslim. Arada ayak işi ancak bütün zincirler kilitliyse çıkar (aşağıdaki zincirler birbirini açtığı için nadiren).

#### Cadı Zümrüt · Çayır

Kazanının başında, otları ve geceyi bilen sabırlı cadı.

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| Z1 | Papatya çayı | Getir: 4 Papatya, 3 Nane | E1 | Z2 | 30 · 20 XP |
| Z2 | Kazanın dili | Kazanda **toplam 8 tarif** öğrenmiş ol (önceden "5 yeni tarif"di: bütün tarifleri bilen biri bu görevde takılıyordu). Önceden öğrendiklerin de sayılır; 8'e zaten ulaşmışsan görev hemen tamamlanır. | Z1 | Z3 | 40 · 30 XP |
| Z3 | Gelincik boyası | Yap: 2 Gelincik boyası | Z2 | Z4 | 50 · 35 XP |
| Z4 | Ay ışığında | Getir: 2 Gece sefası (yalnızca gece açar) | Z3 · Kaba meşale ya da Meşale | Z5 | 70 · 45 XP |
| Z5 | Ormanın yaprakları | Getir: 3 Yaban mersini, 3 Kuzukulağı (Orman) | Z4 · Orman keşfedildi | Z6, Yakut 1 | 90 · 60 XP |
| Z6 | Yanık ele merhem | Getir: 5 Ebegümeci, 2 Hayvan yağı | Z5 · Seviye 5 | Z7 | 100 · 64 XP |
| Z7 | Güneş görmeyenler | Getir: 4 Mağara mantarı, 4 Yarasa gübresi | Z6 · Seviye 7 | Z8 | 120 · 75 XP |
| Z8 | Ayşen'in çorbası | Getir: 5 Isırgan, 3 Hardal otu | Z7 · Seviye 9 | – | 140 · 85 XP |

#### Demirci Dursun · Çayır

Övüngen ama iyi kalpli silah demircisi; yalnız Çayır malzemesiyle dövülenleri döver. Kemal'in ilk görevinden sonra oyuncuyu aletlerle o tanıştırır.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| D1 | Ocağa odun | Getir: 8 Çam odunu (v3.39: Ağaç kesme dersiyle başlar) (Dursun: "Baltan var, değil mi? Örsün ateşi odun yer, 8 çam odunu kes getir"). Çam odunu daha önce bulunmamış olsa da açılır | E1 · **örste bir balta dövülmüş olmalı** (öğreticiyi yapan zaten Taş baltayı dövmüştür; öğreticiyi atlayan, balta tarifini öğrenip ilk baltasını bir demirciye dövdürünce açılır) | D2, Sinan 1 | – | 30 · 20 XP |
| D2 | Keskin işler | Dövdür: Taş kazma (Taş kazma tarifi öğrenilmeden açılmaz) | D1 · Taş kazma tarifi | D3, Durmuş 1 | – | 30 · 20 XP |
| D3 | Çakmaktaşı balta | Dövdür: Çakmaktaşı balta | D2 | D4 | – | 50 · 35 XP |
| D4 | Ağzı köreldi | Körelmiş bir aletini Dursun'a biledir: konuş → **Aletimi bile** → aletin yanındaki **Bile** (görev kartı körelmiş aletin adını yazar, ör. "0/1 Taş balta bilet (Dursun · Aletimi bile)") | D3 · körelmiş bir alet | D5 | Bileme | 40 · 30 XP |
| D5 | Tunç zamanı | Yap: Tunç külçesi; dövdür: Tunç balta, Tunç kazma ya da Tunç mızrak | D4 · Seviye 4 | D6, Durmuş 3 | Maden ve eritme | 150 · 120 XP (Orman'da Durdu'ya dövdür; Orman keşfedilince açılır) |
| D6 | Ocağın kömürü | Getir: 5 Taş kömürü (Orman madeni) | D5 · Orman keşfedildi | D7, Durdu 1 | – | 90 · 60 XP |
| D7 | Ocağın çanı | Getir: 6 Bakır cevheri, 3 Kalay cevheri | D6 · Seviye 7 | D8 | – | 110 · 70 XP |
| D8 | Örsün tabanı | Getir: 4 Granit, 3 Kireçtaşı | D7 · Seviye 9 | – | – | 140 · 85 XP |

#### Pazarcı Nazlı · Çayır

Neşeli, pazarlıkçı tüccar kızı.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| N1 | Tezgâha meyve | Getir: 5 Böğürtlen, 3 Yaban çileği | D1 | N2 | – | 30 · 20 XP |
| N2 | Taze balık | Yap: Olta; tut: 2 balık (Çayır nehri) | N1 | N3 | Balık tutma | 60 · 35 XP |
| N3 | Bereketli satış | 150 sikkelik satış | N2 | N4 | Satış (öğreticiyi geçenlere) | 40 · 25 XP |
| N4 | Kürk siparişi | Yap: Tuzak, kur; getir: 3 Tavşan derisi | N3 · **Tuzak tarifi öğrenilmiş** | N5, Börü 4 | Tuzak kurma | 70 · 45 XP |
| N5 | Kış kurutmalığı | Yap: 3 Kurutulmuş yabani elma | N4 | N6 | – | 70 · 45 XP |
| N6 | Orman balı | Getir: 2 Yabani bal (Orman) | N5 · Orman keşfedildi | N7 | – | 90 · 60 XP |
| N7 | Bayram pazarı | Getir: 6 Bıldırcın yumurtası, 4 Keklik yumurtası | N6 · Seviye 7 | N8 | – | 110 · 70 XP |
| N8 | Ormanın kokusu | Getir: 8 Ceviz, 5 Ahududu | N7 · Seviye 9 | – | – | 140 · 85 XP |

**Satış sayacı:** N3'ün (ve bütün "sikkelik satış" görevlerinin) sayacı pazardaki **her satışı** sayar: tek tek ya da adetli satış, **"Aletler, zırhlar ve eşyalar hariç hepsini sat"** ve **"Kazanda işe yaramayanları sat"** toplu düğmeleri. Sayılan, satışın sikke değeridir (şanslı müşteri bonusu sayılmaz). Eskiden toplu düğmeler sayılmıyordu.

#### Savaşçı Börü · Çayır

Sert ama sıcak; kaçmayı da öğreten savaşçı. Oyuncuyu kuzeye, Orman'a ilk yollayan odur.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| B1 | Ateş başında nöbet | Kamp ateşi kur, gece yanında 60 sn bekle | D1 · Seviye 2 | B2 | Kamp ateşi ve gece | 50 · 30 XP |
| B2 | Kerevit avı | Avla: 2 Kerevit | B1 | B3 | Silah yuvası ve dövüş | 30 · 20 XP |
| B3 | İlk silah | **Herhangi bir silah edin** (kılıç, savaş çekici, topuz, mızrak…; eskiden yalnızca Taş kılıç isterdi; silah yuvasına takmak gerekmez) | B2 | B4 | – | 40 · 30 XP |
| B4 | Geyik sürüsü | Avla: 2 Geyik | B3 · N4 | B5 | – | 60 · 40 XP |
| B5 | Kuzeye keşif | Ulaş: Orman'a git (kimseyle tanıştırmaz) | B4 · Seviye 3 | B6, Sinan 1 | – | 80 · 50 XP |
| B6 | Domuz avı | Avla: 2 Yaban domuzu (Orman) | B5 | B7, Durdu 2 | – | 120 · 80 XP |
| B7 | Kurt gecesi | Avla: 3 Kurt | B6 · Seviye 7 | B8 | – | 130 · 85 XP |
| B8 | Kaan'ın borusu | Getir: 2 Geyik boynuzu · Avla: 2 Yaban atı | B7 · Seviye 9 | – | – | 140 · 95 XP |

**Börü belirli bir silah istemez:** Börü'nün dersleri ve görevleri kılıç, mızrak gibi belirli bir silah istemez; "İlk silah" (B3) **herhangi bir** silah çantana (ya da eline, silah yuvana) girdiği an biter (kılıç, savaş çekici, topuz, mızrak; kendi yaptığın, dövdürdüğün ya da bulduğun). **Silah yuvasına takmak gerekmez.** Görev kartında "Bir silah edin (kılıç, savaş çekici, topuz ya da mızrak)" yazar; silahın yoksa ok demirciyi gösterir.

#### Zırhçı Durmuş · Çayır

Dursun'un küçük kardeşi; korumayı her şeyden önemli sayar.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| M1 | Kemik yığını | Getir: 6 Kemik | D2 | M2 | – | 30 · 25 XP |
| M2 | Sinir kirişi | Yap: 2 Sinir kirişi | M1 | M3 | – | 40 · 30 XP |
| M3 | Tunç levha | Yap: 1 Tunç levha | M2 · D5 | M4 | – | 120 · 90 XP |
| M4 | Deri astar | Getir: 4 Tavşan derisi, 2 Geyik derisi | M3 | M5 | – | 90 · 70 XP |
| M5 | Tunç miğfer | Duran'a (Orman) dövdür ve giy: Tunç miğfer (içine Deri parçası; Tunç Orman'da dövülür) | M4 · Orman keşfedildi | M6, Duran 1 | Zırh giyme | 150 · 120 XP |
| M6 | Unutulan kol | Getir: 2 Yaban atı derisi, 4 Sinir | M5 · Seviye 5 | M7 | – | 159 · 127 XP |
| M7 | Kış yeleği | Getir: 3 Kurt derisi, 2 Geyik boynuzu | M6 · Seviye 7 | M8 | – | 169 · 135 XP |
| M8 | İnce iş | Getir: 5 Sincap derisi, 2 Kunduz derisi | M7 · Seviye 9 | – | – | 179 · 143 XP |

#### Gemici Poyraz · kaza kıyısı

Poyraz'ın yeni görevleri (G1–G4 tekne tamiri, G5–G10 deniz balıkları): "ACT 1 › Gemici Poyraz ve deniz" bölümünde.


#### Çoban Davut · Çayır → bütün biyomlar (evcilleştirme hocası; v3.42)

> **6 Kasım 2026, Boğaç:** Davut yan görev kişisi olmaktan çıkar, **ana görev** kişisi olur; "Kaçan keçi Pamuk" onun ilk ana görevidir. Bundan sonraki görevleri **yalnızca evcilleştirme** üzerinedir. Bir canlıyı evcilleştirince Davut **bir sonraki biyomda** yeniden karşına çıkar (bir önceki yerinden kalkar). Çayır'daki yan görev yerine "Gece öten kuş" geldi (Yan görevler). **İlk görevi dışındaki bütün görevleri ağıl kurulduktan sonra** (Boğaç).

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| CB1 | Kaçan keçi Pamuk | Pamuk'u 3 kez yakala, Davut'a götür (eski yan görevin adımları aynı) | Seviye 2 | CB2 | – | 60 · 40 XP |
| CB2 | Hayvanlara bir yuva | **Ağıl** (tarifi kazanda: 10 Çit) Usta Sinan'a kurdur ve istediğin yere koy; tarif bilinmiyorsa önce Kemal tarifi öğretir | CB1 · Orman keşfedildi | CB3 | Ağıl | 80 · 60 XP |
| CB3 | Yaban atı | Çayır'da bir yaban atını evcilleştir (Yabani elma) ve adını koy | CB2 | CB4 | Evcilleştirme, binme | 120 · 90 XP |
| CB4 | Kurdun ini | Orman'daki kurt inini bul, yavruyu evcilleştir (Tavşan eti) | CB3 | CB5 | Yavru yolu, savaşçı yoldaş | 160 · 120 XP |
| CB5 | Bataklığın bekçisi | Bataklık'ta timsah yuvasındaki yavruyu evcilleştir (Sazan) | CB4 · E2 | CB6 | – | 220 · 170 XP |
| CB6 | Sarp yolların dostu | Kayalık Dağ'da bir dağ keçisini evcilleştir (Tuz kayası) | CB5 · E3 | CB7 | Ağılda binek değiştirmek | 280 · 220 XP |
| CB7 | Közün çocuğu | Kül Diyarı'nda lav kertenkelesi yavrusunu evcilleştir (Kül böceği kabuğu) | CB6 · Kül Diyarı keşfedildi | CB8 | – | 380 · 320 XP |
| CB8 | Işıktan boynuzlar | Mor Kristal Vadisi'nde bir kristal geyiği evcilleştir (Ay otu) | CB7 · E5 | – | – | 500 · 450 XP |

- **Ağıl kurulmadıysa Kemal hatırlatır (Boğaç):** CB1 bittikten sonra Orman keşfedilmiş ve hâlâ bir ağıl kurulmamışsa, Kemal "Görevsiz kalınmaz" kuralındaki ayak işleri gibi önce (bilinmiyorsa) **Ağıl tarifini öğren**, sonra **"Ağıl kur"** işini verir. Ağıl hangi yoldan kurulursa kurulsun Davut'un CB2'si de biter (aynı iş iki kez yapılmaz).
- **Yeri:** her biyomda Davut'un durduğu yer haritada gösterilmez; ana görev kişisi olduğu için görevi varken başında **!** vardır.
- Davut'un görev sahneleri: Pamuk'un yanında değneğiyle, sonraki biyomlarda hep bir hayvanı izlerken ("Bak şuna… korkmuyor, merak ediyor.").

#### Çiftçi Ekin · Çayır → Bereket Adası (v3.43)

> **6 Kasım 2026, Boğaç:** tarlacılık geri geliyor, ama Orman'da değil, Ekin'in kendi küçük adasında: **Bereket Adası**. 

- **Çayır'da ilk görev (EK1 · Kaybolan korkuluk, ana görev):** genç çiftçi kız Ekin, Çayır'ın bir köşesinde duruyor. Korkuluğu her gece başka bir yerde. **Üç saman izini** takip edersin (Ekin'den 160–580 piksel); korkuluğun dibinde karnı aç bir **kirpi**: korkuluğu yürüten o (dikenlerine takılmış). Kirpinin yanına **1 Yabani elma** bırakınca korkuluk dikenlerden kurtulur; Ekin'e dönersin. Ödül 90 · 60 XP. Açılma: Seviye 3. (Adımları yan görev motoru yürütür; yan görev kartında görünmez, ana görev kartında yazar.)
- **Ekin gider (Boğaç):** görevi teslim ettikten sonra Ekin'le **ikinci kez** konuşunca: "Ben… adama dönmeliyim. Bir sal yaparım, olmazsa yüzerim." der ve **gider**; Çayır'dan kalkar.
- **Barbaros'un yanında yeniden (Boğaç):** Barbaros'un **4. görevi (L4 · Yelken ipi)** teslim edildiğinde gemi yarı onarılmıştır; Barbaros kısa bir sefere çıkabileceğini söyler. O an Ekin enkazın yanında belirir: salı parçalanmış, akıntı onu Mor Kristal kıyısına atmış. Barbaros: "Kızım Meltem kadar inatçı… Seni adana bırakırım." Ekin adasına döner.
  - **ACT 2'ye geçiş Ekin'den sonra (Boğaç):** Barbaros'un son görevi (L5 · Yeni bir gemi, ACT 2'ye geçiş) ancak Ekin olayı yaşandıktan sonra verilir. L8 bittiğinde Ekin'in ilk görevi hâlâ bitmemişse, "Görevsiz kalınmaz" kuralıyla Kemal o eksiği tamamlatan ayak işini verir (Ekin'in görevini al ve bitir).
  - **Ekin'in ilk görevi bitmemişse bu olay olmaz.** L4 teslim edildiğinde EK1 bitmemişse Ekin Çayır'da bekler; EK1 bitince ve Ekin gidince, Barbaros'un ~110 piksel yanına ilk gidişinde olay yaşanır.
- **Bereket Adası'na gitmek:** olaydan sonra Barbaros'un yanında kıyıda bir **kayık** durur: "Kayıkla Bereket Adası'na git" ile kısa bir karartmayla adanın iskelesine geçilir; iskelede "Kayıkla geri dön". Ada, ana adanın güneyinde açık denizde, Barbaros'a en yakın yerdedir (haritada denizin içinde küçük bir ada; açınca görünür). Yoldaşlar ve binek de gelir. Barbaros'un son görevi (gemi) bitip ACT 2'ye geçildiğinde ada yine Barbaros'un gemisiyle ziyaret edilir (ACT 2'de konuşulacak).
- **Bereket Adası (~40 × 28 karo, kumsalla çevrili):** iskele, Ekin'in kerpiç evi ve kırmızı ambarı, **tarla** (başta 4 × 3, EK6'dan sonra 4 × 6 tarh), altı **fidan yeri**, bir **kuyu** ("Kuyudan su çek": 1 Su), dolaşan üç tavuk. Canavar çıkmaz (adaya giren hayvan kaybolur), mor ışık inmez, gece karanlığı öldürmez (güvenli yer); saat anakarayla aynı akar.
- **Tarla (eski tarla kodu):** tırmıkla hazırla → tohum ek → **sulama kabıyla** sula → olgunlaşınca **tırpanla** biç (aletler elde olmalı). **Ürünler sen adada değilken de büyür** (oyun açıkken; Buğday 60, Havuç 80, Patates 100 sn…); sulanmamış tohum büyümez. Ürünler: Buğday, Havuç, Patates, Soğan, Kabak, Ayçiçeği. Hasatta %45 ihtimalle 1 tohum geri gelir. Tohumları Ekin verir (EK2'den sonra 6 Buğday tohumu; EK3'ten sonra 4 Havuç, 4 Patates, 2 Kabak tohumu) ve adada konuşunca **"Tohum ve fidan"** ile satar (4'lü tohum paketleri; EK4'ten sonra fidanlar: Elma 40, Armut 45, Erik 45).
- **Fidan:** fidan yerine "Dik: … fidanı" ile dikilir; 3 oyun gününde büyüyüp gerçek bir meyve ağacı olur ve anakaradaki meyve ağaçları gibi silkelenir.
- **Ekin'in adadaki görevleri (EK2–EK8, ana görev; eski H kimlikleri kullanılmaz):**

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| EK2 | Dört alet | Çantanda olsun: Tırmık, Sulama kabı, Tırpan, Taş kazma | EK1 · Ekin olayı | EK3 | Tarla | 120 · 90 XP |
| EK3 | İlk başak | Getir: 6 Buğday | EK2 | EK4 | Ekim ve hasat | 140 · 100 XP |
| EK4 | Yeni korkuluk | Getir: Korkuluk (tarif: 2 Sopa, 4 Kuru ot, 1 İp) | EK3 | EK5 | – | 150 · 110 XP |
| EK5 | İlk fidan | Bir fidanı dik ve ağaç olana kadar büyüt | EK4 | EK6 | Fidan | 170 · 130 XP |
| EK6 | Tarla büyüyor | Getir: 8 Ladin kalası, 6 Taş (tarla 4 × 6 olur) | EK5 | EK7 | – | 200 · 150 XP |
| EK7 | Bereketli sepet | Getir: Hasat sepeti (tarif: 6 Lif, 2 Söğüt dalı), 4 Havuç, 4 Patates, 2 Kabak | EK6 | EK8 | – | 230 · 170 XP |
| EK8 | Ekmek kokusu | Getir: Ekmek (Buğday unu: 3 Buğday · Ekmek: 2 Buğday unu, 1 Su) | EK7 | – | – | 260 · 200 XP |

- Yeni tarifler (kazanda öğrenilir): **Korkuluk**, **Hasat sepeti** (Tarım), **Buğday unu** (Tarım), **Ekmek** (Yiyecek). Ürünler (Havuç, Kabak, Patates, Soğan, Ayçiçeği) çiğ yenir. Eski tasarımdaki öbür tarla yemekleri (çorbalar, yahni, püre…) şimdilik yok.

#### Usta Sinan · Orman

Kızı Zeynep'le ada ada ev yapan usta. **v3.39 (Boğaç):** Marangoz Çınar oyundan kaldırıldı; evleri ve barınakları da artık Sinan yapar. İki ustanın 16 görevinden en anlamlı 8'i kaldı, Sinan'da tek zincir oldu; Çınar'ın "Çam kalası" görevindeki **Ağaç kesme dersi** Dursun'un ilk görevine (D1 · Ocağa odun) geçti. Kaldırılan görevler: Çam kalası (R1), Odun stoku (R3), Yamaçtaki temel (R6), Denize pencere (R7), Meşe kapı (R8), Deri kayış (K4), Hasır işi (K5), Oymalı kapı (K7). Eskiden R1'den sonra açılan Nazlı 1 ve Börü 1 artık D1'den sonra, K4'ten sonra açılan Duran'ın görevi K3'ten sonra açılır. Eski kayıtlarda bu görevlerden yarım kalan varsa düşer; bitmiş görevler bitmiş sayılır.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| R2 | Yaprak barınağı | Barınak yaptır (8 Dal, 12 Yaprak, 4 Lif), gece içinde uyu | Orman'a varış | K1 | Barınak ve uyku | 40 · 30 XP |
| K1 | Ladin kalası | Getir: 6 Ladin kalası | R2 | K2 | – | 60 · 40 XP |
| K2 | Atölye | Kur: Atölye | K1 | K3 | Yapı kurma | 90 · 60 XP |
| K3 | Çit | Kur: Çit (el yapımıyla yap, İnşa kipiyle koy) | K2 | R4, Duran 3 | – | 70 · 45 XP |
| R4 | Kerpiç | Yap: 6 Nehir kerpici | K3 | R5 | Kil ve kürek | 80 · 50 XP |
| R5 | Kalıcı bir ev | Sinan'dan ev al (Kulübe ya da çadır), kur, içine Sinan'ın yaptığı bir yatak koy | R4 · Seviye 4 | K6 | Ev ve yatak | 120 · 80 XP |
| K6 | Taş temel | Getir: 10 Meşe odunu, 6 Granit | R5 · Seviye 8 | K8 | – | 140 · 90 XP |
| K8 | Ocak başı | Getir: 10 Kum, 6 Kireçtaşı, 4 Ceviz odunu | K6 · Seviye 12 | – | – | 190 · 110 XP |

#### Cadı Yakut · Orman

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| Y1 | Kırmızı demlik | Getir: 4 Kanlıca, 4 Isırgan | Z5 | Y2 | 70 · 50 XP |
| Y2 | Ormanın tatlısı | Getir: 2 Yabani bal, 5 Yaban mersini | Y1 | Y3 | 90 · 60 XP |
| Y3 | Mantar sepeti | Getir: 4 Tavuk mantarı | Y2 | Y4 | 100 · 70 XP |
| Y4 | Engerek dili | Avla: 3 Engerek | Y3 | Y5 | 140 · 100 XP |
| Y5 | Bataklık otu | Getir: 3 Bataklık otu (Bataklık) | Y4 · E2 | Y6, Safir 1 | 160 · 120 XP |
| Y6 | Taşan kazan | Getir: 6 Sarmaşık, 4 Kuzugöbeği | Y5 · Seviye 8 | Y7 | 170 · 127 XP |
| Y7 | Dikenli kepçe | Avla: 3 Dikenli kirpi · Getir: 6 Ahududu | Y6 · Seviye 10 | Y8 | 185 · 135 XP |
| Y8 | Kırmızıların kırmızısı | Getir: 8 Kızılcık, 5 Kuzukulağı | Y7 · Seviye 12 | – | 200 · 143 XP |

#### Silahçı Durdu · Orman

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| DU1 | Granit yığını | Getir: 6 Granit, 4 Taş kömürü | D6 | DU2 | 90 · 60 XP |
| DU2 | Domuz dişi | Getir: 4 Yaban domuzu dişi | DU1 · B6 | DU3 | 110 · 80 XP |
| DU3 | Granit balta | Dövdür: Granit balta | DU2 | DU4 | 120 · 90 XP |
| DU4 | Savaş çekicinin ağırlığı | Dövdür: Granit savaş çekici | DU3 | DU5 | 180 · 140 XP |
| DU5 | Demir damarı | Getir: 3 Demir cevheri (Bataklık) | DU4 · E2 | DU6, Ali 1 | 180 · 150 XP |
| DU6 | Çatlak sap | Getir: 4 Ceviz odunu, 4 Sinir | DU5 · Seviye 8 | DU7 | 191 · 159 XP |
| DU7 | Bileğinin taşı | Getir: 8 Kumtaşı, 5 Taş kömürü | DU6 · Seviye 10 | DU8 | 202 · 169 XP |
| DU8 | Ustalık işi | Getir: 6 İri diken, 5 Meşe odunu | DU7 · Seviye 12 | – | 214 · 179 XP |

#### Zırhçı Duran · Orman

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| DR1 | Ceviz kabukları | Getir: 8 Ceviz | M5 | DR2 | 80 · 60 XP |
| DR2 | Karaca derisi | Getir: 3 Karaca derisi, 6 Kirpi dikeni | DR1 | DR3 | 110 · 80 XP |
| DR3 | Deri astar | Getir: 4 Deri parçası | DR2 · Sinan 4 | DR4 | 130 · 100 XP |
| DR4 | Kabuk zırh | Dövdür: Meşe kabuk zırh | DR3 | DR5 | 180 · 140 XP |
| DR5 | Samur postu | Getir: 2 Su samuru derisi (Bataklık) | DR4 · E2 | DR6, Veli 1 | 180 · 150 XP |
| DR6 | Yağlı deri | Getir: 4 Yaban domuzu derisi, 3 Hayvan yağı | DR5 · Seviye 8 | DR7 | 191 · 159 XP |
| DR7 | Sincap astarı | Getir: 6 Sincap derisi, 8 Lif | DR6 · Seviye 10 | DR8 | 202 · 169 XP |
| DR8 | Dikenli miğfer | Avla: 2 Oklu kirpi | DR7 · Seviye 12 | – | 214 · 179 XP |

#### Avcı Doğan · Bataklık

Yirmi yıldır bataklıkta oğlunu bekleyen avcı.

| # | Görev | İstenen | Açılma | Açar | Ders | Ödül |
|---|---|---|---|---|---|---|
| T1 | Çamur yürüyüşü | Yap ve giy: Kamış çizme (el yapımı; 6 Kamış, 3 İp, 2 Yosun; tarifini Doğan ilk konuşmada yazar) | E2 | T2 | Çamur ve çizme | 120 · 100 XP |
| T2 | Ördek avı | Avla: 3 Ördek | T1 | T3 | – | 120 · 110 XP |
| T3 | Kurbağa zehri | Avla: 3 Zehirli kurbağa | T2 | T4, Safir 3 | – | 160 · 180 XP |
| T4 | Bataklık kurdu | Avla: 2 Bataklık kurdu | T3 | T5 | – | 200 · 260 XP |
| T5 | Timsah | Avla: 1 Timsah | T4 | T6 | – | 260 · 380 XP |
| T6 | Dağ yolu | Ulaş: Kayalık Dağ'a in (kimseyi söylemez) | T5 | T7, Kayalık Dağ'daki görevler | – | 220 · 300 XP |
| T7 | Kaz tüyü yorgan | Avla: 3 Yaban kazı | T6 · Seviye 14 | T8 | – | 260 · 318 XP |
| T8 | Turnaların işareti | Getir: 6 Turna kuşu tüyü, 10 Kamış | T7 · Seviye 16 | – | – | 300 · 337 XP |

#### Cadı Safir · Bataklık

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| SA1 | Mavi demlik | Getir: 4 Nilüfer, 4 Su teresi | Y5 | SA2 | 150 · 160 XP |
| SA2 | Sinek mantarı | Getir: 4 Sinek mantarı, 3 Turba | SA1 | SA3 | 180 · 200 XP |
| SA3 | Panzehir | Yap: 2 Panzehir | SA2 · T3 | SA4 | 200 · 230 XP |
| SA4 | Kurbağa gözü | Getir: 3 Kurbağa | SA3 | SA5 | 220 · 260 XP |
| SA5 | Dağ kekiği | Getir: 4 Kekik (Kayalık Dağ) | SA4 · Kayalık Dağ keşfedildi | SA6, Firuze 1 | 220 · 280 XP |
| SA6 | Solan mavi | Getir: 6 Yosun, 5 Kızılcık | SA5 · Seviye 12 | SA7 | 233 · 297 XP |
| SA7 | Gece iksiri | Getir: 5 Su kestanesi, 3 Zehir bezesi | SA6 · Seviye 14 | SA8 | 247 · 315 XP |
| SA8 | Ninenin şurubu | Getir: 6 Mürver, 5 Bataklık otu | SA7 · Seviye 16 | – | 280 · 334 XP |

#### Silahçı Ali · Bataklık

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| AL1 | Demir damarı | Getir: 6 Demir cevheri | DU5 · Granit ya da Tunç kazma (2. kademe) | AL2 | 160 · 180 XP |
| AL2 | Demirin terbiyesi | Dövdür: Demir balta, Demir kazma, Demir kılıç ya da Demir mızrak | AL1 | AL3 | 200 · 230 XP |
| AL3 | Timsahın dişi | Getir: 3 Timsah dişi | AL2 · T5 | AL4 | 220 · 260 XP |
| AL4 | Dişli kılıç | Dövdür: Timsah dişi kılıcı | AL3 | AL5 | 280 · 340 XP |
| AL5 | Kuvars | Getir: 4 Kuvars (Kayalık Dağ) | AL4 · Kayalık Dağ keşfedildi | AL6, Kaya 1 | 240 · 300 XP |
| AL6 | Servi sapı | Getir: 3 Bataklık servisi odunu, 8 Demir cevheri | AL5 · Seviye 12 | AL7 | 254 · 318 XP |
| AL7 | Dişbudak yayı | Getir: 5 Dişbudak odunu, 6 Kenevir | AL6 · Seviye 14 | AL8 | 269 · 337 XP |
| AL8 | Tuzlu su | Getir: 4 Tuz kayası, 4 Kurt dişi | AL7 · Seviye 16 | – | 285 · 357 XP |

#### Zırhçı Veli · Bataklık

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| VE1 | Arduvaz | Getir: 5 Arduvaz, 3 Tuz kayası | DR5 | VE2 | 150 · 160 XP |
| VE2 | Demir halka | Yap: 4 Demir halka | VE1 · AL1 | VE3 | 200 · 230 XP |
| VE3 | Su geçirmez astar | Getir: 3 Su samuru derisi, 2 Bataklık kurdu postu | VE2 | VE4 | 220 · 260 XP |
| VE4 | Pullu zırh | Dövdür: Timsah pulu zırh | VE3 | VE5 | 280 · 340 XP |
| VE5 | Beyaz kil | Getir: 4 Beyaz kil (Kayalık Dağ) | VE4 · Kayalık Dağ keşfedildi | VE6, Kayhan 1 | 240 · 300 XP |
| VE6 | Killi pullar | Getir: 5 Göl kili, 8 Keten | VE5 · Seviye 12 | VE7 | 254 · 318 XP |
| VE7 | Tüy dolgusu | Getir: 8 Yaban kazı tüyü, 6 Saz | VE6 · Seviye 14 | VE8 | 269 · 337 XP |
| VE8 | Timsahın sırtı | Getir: 3 Timsah derisi, 6 Demir cevheri | VE7 · Seviye 16 | – | 285 · 357 XP |

#### Cadı Firuze · Kayalık Dağ

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| FI1 | Turkuaz demlik | Getir: 3 Kardelen, 4 Lavanta | SA5 | FI2 | 220 · 260 XP |
| FI2 | Liken ve kav | Getir: 5 Liken, 4 Kav mantarı | FI1 | FI3 | 260 · 320 XP |
| FI3 | Kardelen merhemi | Yap: 2 Kardelen merhemi | FI2 | FI4 | 280 · 360 XP |
| FI4 | Kartalın tüyü | Getir: 4 Kartal tüyü | FI3 | FI5 | 320 · 420 XP |
| FI5 | Ateş çiçeği | Getir: 4 Ateş çiçeği (Kül Diyarı) | FI4 · E3 | FI6, Mercan 1 | 300 · 420 XP |
| FI6 | Rüzgâr çayı | Getir: 5 Dağ çayı, 4 Adaçayı | FI5 · Seviye 16 | FI7 | 340 · 445 XP |
| FI7 | Kuşburnu kışı | Getir: 6 Kuşburnu, 3 Civanperçemi, 2 Sinirotu | FI6 · Seviye 19 | FI8 | 390 · 472 XP |
| FI8 | Külle ardıç | Getir: 5 Ardıç meyvesi, 6 Kül | FI7 · Seviye 22 | – | 440 · 500 XP |

#### Silahçı Kaya · Kayalık Dağ

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KA1 | Kuvars ve gümüş | Getir: 6 Kuvars, 4 Gümüş cevheri | AL5 | KA2 | 240 · 300 XP |
| KA2 | Kuvars kazma | Dövdür: Kuvars kazma | KA1 | KA3 | 260 · 320 XP |
| KA3 | Vaşak | Avla: 1 Vaşak | KA2 | KA4 | 320 · 420 XP |
| KA4 | Gümüşün sesi | Dövdür: Gümüş kılıç | KA3 | KA5 | 380 · 500 XP |
| KA5 | Bazalt | Getir: 4 Bazalt (Kül Diyarı) | KA4 · E3 | KA6, Turan 1 | 320 · 440 XP |
| KA6 | Porsuk yayı | Getir: 6 Porsuk odunu, 4 Sinir | KA5 · Seviye 16 | KA7 | 339 · 466 XP |
| KA7 | Altın damar | Getir: 4 Pirit (altın artık Mor Kristal Vadisi'nde), 5 Kuvars | KA6 · Seviye 19 | KA8 | 400 · 494 XP |
| KA8 | Pençe ve pirit | Getir: 2 Kartal pençesi, 5 Pirit | KA7 · Seviye 22 | – | 450 · 524 XP |

#### Zırhçı Kayhan · Kayalık Dağ

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KH1 | Öküz derisi | Getir: 2 Yaban öküzü derisi, 2 Öküz boynuzu | VE5 | KH2 | 240 · 300 XP |
| KH2 | Gümüş külçesi | Yap: 3 Gümüş külçesi | KH1 | KH3 | 260 · 320 XP |
| KH3 | Ayı pençesi | Getir: 3 Ayı pençesi | KH2 | KH4 | 320 · 420 XP |
| KH4 | Gümüş pullar | Dövdür: Gümüş pullu zırh | KH3 | KH5 | 380 · 500 XP |
| KH5 | Böcek kabuğu | Getir: 3 Kül böceği kabuğu (Kül Diyarı) | KH4 · E3 | KH6, Tufan 1 | 320 · 440 XP |
| KH6 | Muflon astarı | Getir: 3 Muflon derisi, 4 Sinir | KH5 · Seviye 16 | KH7 | 339 · 466 XP |
| KH7 | Vaşak postu | Getir: 2 Vaşak derisi, 3 Dağ keçisi derisi | KH6 · Seviye 19 | KH8 | 400 · 494 XP |
| KH8 | Ayı derisi tuzu | Getir: 2 Mağara ayısı derisi, 5 Kara tuz | KH7 · Seviye 22 | – | 450 · 524 XP |

#### Cadı Mercan · Kül Diyarı

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| ME1 | Mercan demlik | Getir: 5 Ateş çiçeği, 3 Kor otu | FI5 · Kül Diyarı keşfedildi | ME2 | 320 · 480 XP |
| ME2 | Duman ve kök | Getir: 3 Duman çiçeği, 3 Yanık kök | ME1 | ME3 | 380 · 560 XP, Ateş çiçeği merhemi tarifi |
| ME3 | Ateş merhemi | Yap: 2 Ateş çiçeği merhemi | ME2 | ME4 | 400 · 600 XP |
| ME4 | Kül cini | Avla: 2 Kül cini | ME3 | ME5 | 460 · 700 XP |
| ME5 | Ay otu | Getir: 3 Ay otu (Mor Kristal Vadisi) | ME4 | ME6, İnci 1 | 450 · 700 XP |
| ME6 | Biber ve kehribar | Getir: 5 Ateş biberi, 2 Kehribar | ME5 · Seviye 22 | ME7 | 477 · 742 XP |
| ME7 | Kor hırsızları | Avla: 3 Kor yarasası · Getir: 4 Ateş narı | ME6 · Seviye 25 | ME8 | 530 · 787 XP |
| ME8 | Gece zambağı | Getir: 3 Gece zambağı, 5 Kor otu | ME7 · Seviye 28 | – | 590 · 834 XP |

#### Silahçı Turan · Kül Diyarı

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| TU1 | Bazalt ve kükürt | Getir: 6 Bazalt, 4 Kükürt | KA5 · Kül Diyarı keşfedildi | TU2 | 340 · 500 XP |
| TU2 | Kara çelik kazma | Dövdür: Kara çelik kazma | TU1 | TU3 | 360 · 540 XP |
| TU3 | Akrep ve kertenkele | Avla: 2 Ateş akrebi, 1 Lav kertenkelesi | TU2 | TU4 | 440 · 680 XP |
| TU4 | Lavın kenarı | Dövdür: Kara çelik kılıç (eskiden Lav camı kılıcı) | TU3 | TU5 | 520 · 800 XP |
| TU5 | Obsidyen | Getir: 4 Obsidyen (Kül Diyarı'nın lav kayaları; Turan bu görevde Kudret'ten de söz eder) | TU4 | TU6, Kudret 1 | 480 · 760 XP |
| TU6 | Sedir sapı | Getir: 5 Kızıl sedir odunu, 2 Ateş bezesi | TU5 · Seviye 22 | TU7 | 509 · 806 XP |
| TU7 | Ejderin kemiği | Getir: 2 Ejder kemiği, 2 Kara pul | TU6 · Seviye 25 | TU8 | 560 · 854 XP |
| TU8 | Kristal kumu | Getir: 6 Kristal kum, 4 Pirit | TU7 · Seviye 28 | – | 600 · 905 XP |

#### Zırhçı Tufan · Kül Diyarı

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| TF1 | Böcek kabuğu | Getir: 4 Kül böceği kabuğu | KH5 · Kül Diyarı keşfedildi | TF2 | 340 · 500 XP |
| TF2 | Lav pulu | Getir: 3 Lav pulu | TF1 | TF3 | 380 · 560 XP |
| TF3 | Kül kurtları | Avla: 3 Kül kurdu | TF2 | TF4 | 440 · 680 XP |
| TF4 | Kül zırhı | Dövdür: Kara çelik zırh (eskiden Kül böceği zırh) | TF3 | TF5 | 520 · 800 XP |
| TF5 | Güve tozu | Getir: 6 Güve tozu (Mor Kristal Vadisi; mor güveler zararsız) | TF4 | TF6, Kuvvet 1 | 480 · 760 XP |
| TF6 | Yanmaz taban | Getir: 4 Akrep kabuğu, 1 Akrep iğnesi | TF5 · Seviye 22 | TF7 | 509 · 806 XP |
| TF7 | Ninenin sözü | Getir: 2 Kara pul, 1 Ejder kemiği | TF6 · Seviye 25 | TF8 | 540 · 854 XP |
| TF8 | Kopmayan kayış | Getir: 4 Mor sarmaşık, 3 Kehribar | TF7 · Seviye 28 | – | 580 · 905 XP |

#### Denizci Barbaros · Mor Kristal Vadisi

Kızı Meltem'i arayan kaptan; ACT 1'in sonu onun gemisi.

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| L1 | Kazazedenin yarası | Getir: 3 Ay otu, 2 Işık mantarı | E5 | L2 | 400 · 600 XP |
| L2 | Enkazın bekçileri | Avla: 2 Gölge kurdu | L1 | L3 | 600 · 1.000 XP |
| L3 | Yıldızlarla yön | Getir: 2 Ay taşı, 4 Kristal (5. kademe kazmayla kazılır: Bazalt, Obsidyen ya da Kara çelik) | L2 · Kudret 2 | L4 | 500 · 800 XP |
| L4 | Yelken ipi | Yap: 2 Mor ip · teslimde (Ekin'in ilk görevi bittiyse) **Ekin olayı**: Ekin enkazın yanında belirir, Barbaros onu Bereket Adası'na götürür (tasarım; "Çiftçi Ekin") | L3 | L6 | 500 · 800 XP |
| L6 | Kara omurga | Getir: 8 Gece ağacı odunu | L4 · Seviye 28 | L7 | 530 · 848 XP |
| L7 | Su almayan tekne | Getir: 6 Mor yosun, 3 Kehribar | L6 · Seviye 32 | L8 | 600 · 899 XP |
| L8 | Pruvadaki fener | Getir: 4 Işık ağacı odunu, 3 Yankı taşı | L7 · Seviye 36 | L5 | 700 · 953 XP |
| L5 | Yeni bir gemi | Gemi malzemeleri enkaza (Barbaros'la ya da enkazla konuşunca onay penceresi) | L8 · **Ekin olayı yaşandı** (Ekin bulunup adasına götürüldü; tasarım, Boğaç) | ACT 2 | 0 · 2.000 XP |

#### Cadı İnci · Mor Kristal Vadisi

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| IN1 | İnci demlik | Getir: 3 Ay otu, 3 Yıldız çiçeği | ME5 | IN2 | 450 · 700 XP |
| IN2 | Güve tozu | Getir: 6 Güve tozu | IN1 | IN3 | 520 · 800 XP |
| IN3 | Işık tozu | Getir: 3 Işık tozu, 2 Kristal çiçeği | IN2 | IN4 | 600 · 950 XP |
| IN4 | Ay otu iksiri | Yap: 1 Ay otu iksiri | IN3 | IN5 | 650 · 1.000 XP |
| IN5 | Işık engereği | Avla: 2 Işık engereği | IN4 | IN6 | 700 · 1.100 XP |
| IN6 | Uyku şurubu | Getir: 4 Gece zambağı, 3 Gölge otu | IN5 · Seviye 28 | IN7 | 742 · 1166 XP |
| IN7 | Kazandaki yıldızlar | Getir: 5 Yıldız tozu, 2 Mor kök | IN6 · Seviye 32 | IN8 | 787 · 1236 XP |
| IN8 | Ninenin kepçesi | Getir: 1 Kristal boynuz, 3 Ay elması | IN7 · Seviye 36 | – | 840 · 1310 XP |

#### Silahçı Kudret · Mor Kristal Vadisi

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KU1 | Obsidyen ve ametist | Getir: 6 Obsidyen, 3 Ametist | TU5 | KU2 | 480 · 750 XP |
| KU2 | Obsidyen kazma | Dövdür: Obsidyen kazma (kristal için 5. kademe gerekir) | KU1 | KU3, Barbaros 3 | 520 · 800 XP |
| KU3 | Gölgenin dişi | Getir: 3 Gölge dişi | KU2 | KU4 | 560 · 900 XP |
| KU4 | Kristal golem | Avla: 1 Kristal golem | KU3 | KU5 | 700 · 1.100 XP |
| KU5 | Mor kılıç | Dövdür: Ametist kılıcı | KU4 | KU6 | 700 · 1.100 XP |
| KU6 | Parlayan kabza | Getir: 6 Işık ağacı odunu, 3 Sinir | KU5 · Seviye 28 | KU7 | 742 · 1166 XP |
| KU7 | Geceyi gören mızrak | Getir: 6 Kristal, 2 Örümcek gözü | KU6 · Seviye 32 | KU8 | 787 · 1236 XP |
| KU8 | Çınlayan çekiç | Getir: 8 Obsidyen, 5 Ametist, 2 Yankı taşı | KU7 · Seviye 36 | – | 840 · 1310 XP |

#### Zırhçı Kuvvet · Mor Kristal Vadisi

| # | Görev | İstenen | Açılma | Açar | Ödül |
|---|---|---|---|---|---|
| KV1 | Örümcek ağı | Avla: 2 Kristal örümcek | TF5 | KV2 | 520 · 800 XP |
| KV2 | Işık pulları | Getir: 4 Işık pulu | KV1 | KV3 | 560 · 900 XP |
| KV3 | Gölge postu | Getir: 2 Gölge postu | KV2 | KV4 | 600 · 950 XP |
| KV4 | Kristal zırh | Dövdür: Kristal ipek zırh | KV3 | KV5 | 700 · 1.100 XP |
| KV5 | Işık eldiveni | Dövdür: Işık pulu eldiven | KV4 | KV6 | 700 · 1.100 XP |
| KV6 | Nöbet pelerini | Getir: 3 Işık tilkisi postu, 6 Lif | KV5 · Seviye 28 | KV7 | 742 · 1166 XP |
| KV7 | Sessiz adımlar | Getir: 3 Kristal geyik derisi, 4 Kristal ipek | KV6 · Seviye 32 | KV8 | 787 · 1236 XP |
| KV8 | Zehir sınavı | Getir: 3 Mor zehir, 4 Ametist | KV7 · Seviye 36 | – | 840 · 1310 XP |

### Hikâyeler ve sahneler

- Her kişinin hikâye parçaları yeni görevlerine **eşit aralıklarla** bağlanır; son parça her zaman kişinin son göreviyle açılır (örnek: 3 parçalı bir kuzen, 5 görevden 2., 3. ve 5.'siyle).
- Elmas Nine'nin ortak sahnesi: Zümrüt, Dursun, Durmuş ve 15 kuzenin **bütün** görevleri bitince (yeni sayıyla 18 kişi × 5–6 görev).
- Görev teslim edince %30 ihtimalle sıradaki anı gelir (Kemal'inki dahil; Sistemler › İzler ve anılar); izler aynen kalır.

### Toplam

ACT 1'de 27 kişi, **216 görev** (her kişinin 8 görevi) + Kemal'in ayak işleri. Gezginlerden (Yıldızsız Gezgin, Işıkçı, Balıkçı Rüstem) görev yok; isteğe göre eklenebilir.


## Yan görevler

> Görevler artık ikiye ayrılır. **Ana görevler:** adanın kişilerinin (Kemal, Zümrüt, Dursun, kuzenler…) verdiği görevler; yukarıdaki "ACT 1 › Ana görevler" bölümündeki bütün kurallar onlar içindir. **Yan görevler:** adada kendi yerinde duran, yolda karşına çıkan **yan kişilerin** (bir teyze, kaybolmuş bir çocuk, bir çoban…) görevleri. İlk pakette **12 yan görev** var; ACT 1'in ilk dört biyomuna **üçer** tane, tonları karışık (hüzünlü, gizemli, komik).

> **Mağara yan görevleri:** Yankı Mağarası'nda **Madenci Kaya**, Kök Mağarası'nda **Kökçü Fidan**; bu bölümdeki kurallar onlar için de geçerlidir (ayrıntı "ACT 1 › Mağaralar" bölümünde). Böylece yan görev sayısı 14'tür (mağaraların hepsiyle 18; v3.39'da 24 yeni yan görevle **42**); Görevler penceresi "Bitirdiklerin: x/42" yazar.

### Kurallar

1. **Ana görevle birlikte yapılır; birden çok yan görev alınabilir.** Yan görev ana görevi beklemez, ana görev yan görevi beklemez; ikisi ayrı yürür. Aynı anda **birden çok yan görev** alınabilir (eskiden tek yan görev vardı, ikinci yan kişi "Önce elindeki işi bitir" derdi; artık demez).
   - **Takip edilen yan görev:** alınan yan görevlerden yalnızca **biri takip edilir**. Takip edilen görev ekranın üstündeki yan görev kartında yazar; görev eşyalarının mavi parıltısı yalnızca onunkiler için çıkar; adımları (bulma, toplama, kovalama, eskort, bekleme, dövüş) yalnızca o ilerler. Takip edilmeyenler **Görevler**'de bekler; kaldıkları adım ve topladıkları korunur.
   - **Yeni alınan görev takibe girer:** yeni bir yan görev alınınca kartta o görünür; önceki takip edilen görev Görevler'e geçer.
   - **Kartı Görevler'e göndermek:** kartın sağ üstündeki **▾** düğmesi takibi bırakır: kart kalkar, görev Görevler'de bekler (o sırada hiçbir yan görev takip edilmez).
   - **Görevler'den takip:** Görevler panelinde her alınmış yan görevin altında **📌 Takip et** (takip edilen görevde "📌 Takip ediliyor · Görevlere gönder") ve **Bırak** düğmesi vardır; Bırak iki kez basınca bırakır ("Emin misin? Bırak").
   - **Bekleyen görevin kişisiyle konuşmak** o görevi takibe alır (ör. Bekir'e dal götürünce teslim edilir).
   - **Bekleyen eskort, bekleme ve dövüş adımları baştan başlar:** takipten çıkan görev bir eskortta (Ela, Pamuk, Yahya), Kartal'ın yanında beklemede ya da bir dövüşteyse (ejder, kurtlar, mağara Reis'i) o adım durur: eşlik eden kişi yerine döner, görev için çıkan canavarlar silinir; görev yeniden takip edilince **o adım** baştan başlar (önceki adımlar korunur). Kovalamada Pamuk kaldığı yerde bekler.
2. **Yan kişiler parlamaz.** Başlarında siyah ! yoktur, dünyada parlamazlar. Görevi olan yan kişinin başında dünyada küçük bir **"?"** durur. Haritadaki işaretleri aşağıda "Haritada yan görevler"de.
3. **Her yan kişi kendi saatinde görünür; hava etkilemez (v3.40, Boğaç: "her bir görev farklı bir zaman diliminde alınabilir olsun").** Her yan kişinin **kendine ait, ötekilerden farklı** bir saat aralığı vardır (kimi şafakta, kimi öğlen, kimi akşamüstü, kimi yalnızca gece; aralıklar ~4–6 saattir, tablolarda). O saatlerin dışında yerinde yoktur; oyuncu adayı farklı saatlerde dolaşarak onlara rastlar. Mağaradaki kişiler (13–18) mağarada her saat durur. Yağmur, fırtına, sis görünmelerini değiştirmez.
   - **Bir kez alınan görevin kişisi yerinde kalır (v3.40, Boğaç):** bir yan görevi bir kez aldıktan sonra (bıraksan, bayılıp yarıda kalsa ya da Görevler'de beklese de) o kişi görevi bitene kadar saat aralığına bakmadan **her saat** yerinde durur. Hayalet kız Işıl dışında (o yalnızca kendi gece saatinde belirir).
   - **Sırayla açılırlar, bir biyomda en çok 2 (v3.40, Boğaç: "hepsi birden değil… ana görevler ilerledikçe arada alınabilir şeyler olmalı"):** yan görevler hepsi birden çıkmaz. Her biyomun yan görevlerinin bir **sırası** vardır ve her biri ana hikâyenin belli bir yerine kadar bekler: **bitirdiğin ana görev sayısı** (bütün kişilerin ana görevleri sayılır) ve bazılarında belli bir ana görev (ör. Kemal'in 3. görevi "Doğu geçidini aç"). Bir biyomda aynı anda **en çok 2 bitmemiş yan görev** açıktır (alınmış ama bitmemiş olanlar da sayılır; bu sınıra **yalnızca yan görevler** sayılır, Çoban Davut (CB) ve Çiftçi Ekin (EK) gibi ana görevler sayılmaz); biri bitince sıradaki (koşulu tutuyorsa) açılır. Açılmamış yan kişi dünyada da haritada da yoktur. Mağaradaki yan görevler (13–18) bu sıraya girmez. Sıra ve koşullar aşağıda "Açılış sırası"nda.
4. **Hiçbir yan görev kaçırılmaz.** Yan kişi görevi bitene kadar **her gün** kendi saatinde aynı yerde yeniden çıkar. Süre sınırı yoktur, zamanlı bir adım yoktur (bekleme adımı hariç; o da bayılmadıkça yarıda kalmaz). Tamamlamaya çalışan oyuncu hepsini bitirebilir.
5. **Bayılınca yalnızca takip edilen yan görev iptal olur (Görevler'de bekleyenler kalır).** Yan görev sürerken bayılırsan (canavar, açlık ya da mor ışık) **yan görev** yarıda kalır, **ana görev** olduğu gibi durur. Yarıda kalan yan görev hiç alınmamış sayılır: yan kişi kendi yerine döner ve görevi **en baştan, aynı yerden** yeniden alırsın. Yan görev için doğan canavarlar bayılınca silinir.
6. **Bırakmak.** Yan görev kartındaki **×** ile görev bırakılabilir ("Bu yan görevi bırakayım mı?" → Evet/Hayır). Bırakınca yan kişi yerine döner, görev yeniden alınabilir.
7. **Görev sırasında kesilen canavarlar almanakta sayılmaz.** Bir yan görevin kendi çıkardığı canavarlar biyomun gece/gündüz doğma kurallarına bağlı değildir. Yan görev için ortaya çıkan canavarlar (eskortta, beklemede, avda) almanağa eklenmez, av sayısını artırmaz, Reis sayacını doldurmaz ve **hiçbir zaman Reis çıkmaz**; yan görevin dövüş adımı sürerken Reis gelmez. Ganimet ve XP'leri normaldir.
8. **Ödül (şimdilik):** her yan görev bitince **sikke + XP** verir (aşağıdaki tabloda); yan görev ödülü belgedeki XP'dir (v3.44'teki hatalı XP'den etkilenen kayıtlar: Sistemler › Kayıt). Başka ödüller ileride konuşulacak (bölümün sonundaki "İleride ödül fikirleri").
9. **Sonuç dünyada görünür.** Bitirdiğin her yan görev adada iz bırakır: kurtardığın çocuk (Ela) Kemal'in kampındaki ateşin başında oturur, çobanın keçisi yanında otlar, satıcının arabası onarılmış durur… Bu kişiler artık saat aralığına bakmadan **hep** yerlerindedir (hayalet kız dışında; onun yerinde bir mezar taşı ve yanan bir fener kalır). Onlarla konuşunca görevden sonraki hallerini anlatan kısa bir söz söylerler.
10. **Görev kartı.** Süren yan görev, ana görev kartının altında ince **mavi kenarlı ayrı bir kartta** görünür: "Yan görev · Kişi" başlığı, görevin adı ve şu anki adımın kısa yazısı ("Kalan güvercin: 2/4" gibi), köşede **×**. Ana görev kartının başlığı artık "… · Ana görev" yazar. **Görevler penceresi** iki bölümdür: üstte **Ana görev**, altta **Yan görevler** (süren yan görev ve adımı; sonra "Bitirdiklerin: 3/12" ve biten yan görevlerin adları). **Yeri (telefonda kart ekranın ortasında kalıyordu):** yan görev kartı her zaman ana görev kartının **hemen altında, aynı genişlikte** durur (bilgisayarda üstte ortada, telefonda **sağ üstte**); ana görev kartı yoksa onun yerinde durur. Telefonda kart tek satırdır (kişi · görev · adım); dokununca açılıp bütün yazıyı gösterir, bir daha dokununca kapanır. Telefonda bir pencere (envanter, kazan, pazar…) ya da konuşma açıkken kart gizlenir.
11. **Yol gösterilmez, keşfedilir (v3.40, Boğaç: "çok da kullanıcının elinden tutmayalım… biraz keşfe itsin").** Yan görevin hedefi (gidilecek yer, toplanacak şeyler, götürülecek yer) **haritada gösterilmez**: mavi halka, sarı bölge ve ekran kenarındaki mavi ok yoktur (v3.39'da vardı, kaldırıldı). Yol, kişinin konuşmasında ve görev kartındaki adım yazısında anlatılan ipuçlarıyla ("kıyıda", "ağaçta", "bataklığın içinde") bulunur. Haritada ana görevin sarı bölgesi yan görev sürerken de görünür. **Bulunca mavi parıltı:** takip edilen yan görevin aradığın şeyi (iz, eşya, kurbağa, kristal…) ekranda göründüğü anda üstünde **açık mavi bir halka** genişler ve çevresinde **küçük mavi kıvılcımlar** parıldar; böylece bulduğun şeyin görevle ilgili olduğunu anlarsın.
12. **Konuşma resmi:** yan kişilerle (mağaradaki Kaya ve Fidan dahil) konuşurken konuşma kutusunun solundaki küçük resim **o kişinin kendisi**dir: dünyadaki çizimiyle aynı saç, şapka, sakal, giysi renkleri (Poyraz ve ustalarda olduğu gibi). Eskiden hepsinde Gemici Poyraz'ın resmi görünüyordu.
    - **Hiçbir konuşmada varsayılan Poyraz resmi yoktur:** konuşan her şeyin kendi resmi olur. "Sen" satırlarında **senin** (oyuncunun) yüzün; hikâye anlatan satırlarda (adı "—" olan) ilgili **şeyin kendisi** (güvercin, şişe, kayık, mal sandığı, oyuncak, ayakkabı, tebeşir, taş, ejder ini, mağara) ya da şey yoksa hikâyenin kişisi görünür. Resmi olmayan bir konuşucu için pencere **resimsiz** açılır (Poyraz'ın yüzü konmaz). **Yeni bir kişi ya da şey eklenirken konuşma resmi de eklenmek zorundadır** (CLAUDE.md kuralı).

### Haritada yan görevler

- **Yan görev işaretleri (6 Kasım 2026, Boğaç):** yan kişiler haritanın belli yerlerinde, kendi saatlerinde belirir. İşaret, saati gelmiş ve görevi bekleyen kişi için çıkar (kendi saatindeki ya da bir kez alınmış görevin kişisi); renk önemli değildir (mavi ya da mor).
  - **Keşfedilmiş (haritada açılmış) yerdeyse:** kişi büyük haritada **kendi yerinde bir "?"** ile görünür; bu "?" ana görevin "!" işaretiyle **aynı boyda** ve okunur büyüklüktedir. Yan görev "?"si ve sisli daire harita ölçeğinden bağımsız bir **en küçük boyda** çizilir: ekranda en az ana görevin "!"i kadar (~16 piksel). Ana görevin "!"i de büyük haritada aynı en küçük boyda, en az **~16 piksel** çizilir; "!" ve "?" aynı boydadır. Harita açıkken kişinin saati gelirse "?" o an belirir.
  - **Keşfedilmemiş yerdeyse:** "?" gösterilmez; yalnızca oyuncu kişiye **~10 kare (160 piksel)** ya da daha yakınken (harita kapalıyken de) kişinin çevresi haritada **sisli bir daire** ile gösterilir. Dairenin ortası kişinin tam yeri değildir: kişiden en çok **48 piksel** kayar (kişi dairenin içinde bir yerdedir).
  - **En çok 2:** bir biyomda aynı anda en çok 2 bitmemiş yan görev açık olduğu için (kural 3, "Sırayla açılırlar") haritada da **biyom başına en çok 2** yan görev işareti görünür.
- **Dünyada durmayan kişi için işaret yoktur:** Gece görünen kız Işıl için haritada işaret çıkmaz. Mağarada iken haritada yan görev işareti çıkmaz.
- Süren (alınmış) görevin kişisi ve hedefleri için haritada işaret yoktur. Biten yan görevler işaret bırakmaz.
- Hem küçük haritada hem büyük haritada (M) görünür; gece de görünür.

### Açılış sırası (v3.40)

Her satır o biyomun sırasıdır; parantezde açılma koşulu: **bitirilmiş ana görev sayısı** ve gerekiyorsa belli bir ana görev (E2 köprü, E3 Doğu geçidi, E4 izler, E5 Kıyıdaki duman, E6 Saliha'nın çorbası). Koşulu tutan ilk iki bitmemiş görev açıktır.

- **Çayır:** Bulut (2) → Toprak (4) → Gülsüm (6) → Ozan (9) → Rıfat (12) → Mavi (14 · E3)
- **Orman:** Bekir (8) → Kahraman Dede (10) → Tarık (13) → Saadet (16) → Lale (19) → Ela (22)
- **Bataklık:** Şifa (E2) → Cemile (18 · E2) → Kartal (21 · E2) → Hayali (23 · E3) → Remzi (26 · E3) → Kader (30 · E3)
- **Kayalık Dağ:** Yahya (E3) → Zehra (24 · E3) → Bora (27 · E3) → Hatice Nine (30 · E3) → Sükûn (33 · E3) → Işıl (36 · E3)
- **Kül Diyarı:** Çelik (28 · E3) → Ömer (31 · E3) → Kor Ali (34 · E3) → Hasret (37 · E3) → Nar (40 · E3) → Duman Dede (42 · E4)
- **Mor Kristal Vadisi:** Melodi (E5) → Yaren (E5) → Asena (44 · E5) → Selim (46 · E5) → Rıza (48 · E5) → Fenerci Işık (50 · E6)

### 12 yan görev

| # | Biyom | Kişi | Görev | Saat | Ton | Ödül |
|---|---|---|---|---|---|---|
| 1 | Çayır | Mavi (genç kız) | Denizden dönmeyen kardeş | 17:00–23:00 | hüzünlü, mor ışık | 640 sikke · 860 XP (Çayır'da ama geç açılır, E3 sonrası; ödülü buna göre) |
| 2 | Çayır | Toprak (çocuk) | Gece öten kuş (v3.42; eskiden Davut'un "Kaçan keçi Pamuk"u, artık ana görev) | 21:00–01:00 | tatlı, sessiz | 70 sikke · 50 XP |
| 3 | Çayır | Güvercinci Bulut (çocuk) | Kaçan güvercinler | 10:00–15:00 | tatlı, sırlar | 80 sikke · 50 XP |
| 4 | Orman | Ela (küçük kız) | Kampa giden yol | yalnızca gece (20:00–05:00) | gerilimli, sıcak son | 220 sikke · 200 XP |
| 5 | Orman | Şövalye Kahraman Dede | Ejderin ini | 11:00–16:00 | komik | 90 sikke · 60 XP |
| 6 | Orman | Seyyar satıcı Bekir | Kırık araba | 12:00–17:00 | hafif | 100 sikke · 60 XP |
| 7 | Bataklık | Avcı Kartal | Yaralı avcı | 15:00–21:00 | gerilimli | 320 sikke · 260 XP |
| 8 | Bataklık | Hayali | Işığı gören adam | 18:00–03:00 | gizemli, mor ışık | 580 sikke · 780 XP |
| 9 | Bataklık | Falcı Kader | Kader satan kadın | 22:00–06:00 | gizemli | 640 sikke · 860 XP |
| 10 | Kayalık Dağ | Hatice Nine | Torun Emir | 07:00–13:00 | acı son | 750 sikke · 1.000 XP |
| 11 | Kayalık Dağ | Yolcu Yahya | Dağda kaybolan yolcu | 12:30–17:30 | yol hikâyesi | 520 sikke · 700 XP |
| 12 | Kayalık Dağ | Işıl (hayalet kız) | Gece görünen kız | 22:00–04:00 | gizemli, hüzünlü | 570 sikke · 760 XP |

**Yerleri:** her yan kişi kendi biyomunda, biyomun farklı bir köşesinde, başka kişilere, kuzenlerin evlerine, köprülere ve öbür yan kişilere en az ~220 piksel uzakta, ağaçsız düz bir yerde durur (ada her kurulduğunda aynı yer). **İstisna: Mavi** İskele'nin hemen yanında, Kemal'in kampının dibinde durur (Kemal'e ~45 px, Poyraz'a ~70 px); hikâyesi iskeleye bağlı olduğu için ~220 px kuralı ona uygulanmaz. Görev noktaları (izler, enkaz, güvercinler…) kişinin çevresinde, kendi biyomunda, yürünebilir yerlere konur.

**Adım türleri** (görevlerde kullanılan):
- **Konuş:** kişiyle konuşma penceresi (birkaç sayfa). İlk konuşmada "Yardım ederim" ya da "Şimdi olmaz" seçilir.
- **Git:** kişinin anlattığı yeri bul (haritada gösterilmez); oraya ~26 piksel yaklaşınca kendiliğinden bulunur (tuşa basmak gerekmez) ve kısa bir sahne yazısı çıkar.
- **Topla:** birkaç noktadaki şeyleri **istediğin sırayla** bul; her biri yaklaşınca alınır.
- **Kovala:** kaçan bir hayvana yaklaş; her yaklaşmada 100–180 piksel öteye kaçar; birkaç kez sonra yakalanır.
- **Getir:** kişiye istenen eşyaları getir (yalnızca toplanan ham malzemeler istenir; tarif istemez). Konuşunca eşyalar envanterden alınır.
- **Eşlik et:** kişi (ya da hayvan) peşinden gelir; onu gösterilen yere götür. Çok uzaklaşırsan (160 piksel) durup "Bekle!" der; 400 pikselden çok kopunca yanına gelir. Yol boyunca belli yerlerde canavarlar çıkar (aşağıda).
- **Avla:** gösterilen yerde çıkan canavarları yen.
- **Bekle:** kişinin yanında (90 piksel içinde) belli bir süre kal; bu sürede canavar dalgaları gelir. Uzaklaşırsan sayaç durur.

#### 1 · Mavi — Denizden dönmeyen kardeş (Çayır, İskele)

Akşamüstü İskele'nin ucunda, dizlerini kucaklamış bir kız oturur: **Mavi**. Her akşam aynı yerde, denize bakar.

- **Konuş:** "Kardeşim Yusuf üç gece önce kayıkla balığa çıktı. Gece denizin üstünde mor bir ışık gördüm, sonra… kayık dönmedi. Herkes 'akıntı götürmüştür' diyor. Ben beklemekten başka ne yapacağımı bilmiyorum. Kıyıya bakar mısın? Bir şey… herhangi bir şey."
- **Git (enkaz):** Çayır kıyısında, İskele'den 300–600 piksel ötede kıyıya vurmuş, ikiye ayrılmış **küçük bir kayık**. "Kayığın burnu kararmış, sanki içinden yanmış ama tahtada ateş izi yok. Küreklerden biri eksik. Kumda, denize doğru tek sıra ayak izi var."
- **Git (şişe):** enkazdan 200–400 piksel ötede kıyıda, mantarla tıkanmış **bir şişe**. İçinde Yusuf'un kömürle yazdığı not: *"Mavi, ışık denizin üstüne indi. Çok güzeldi, korkmadım. Beni çağırıyor gibiydi. Küreği bıraktım, şişeyi atıyorum ki sen merak etme. Annemin şarkısını söyle bana."*
- **Konuş (Mavi'ye dön):** Notu okur, uzun süre susar. "Korkmamış. Bu iyi bir şey… değil mi? Her akşam buraya gelip şarkısını söyleyeceğim." Görev biter.
- **Sonra dünyada:** Mavi İskele'de, yanında suya bıraktığı kır çiçekleri. Konuşunca: "Bu akşam da söyledim. Deniz dinliyor gibi."

#### 2 · Toprak — Gece öten kuş (Çayır) (v3.42, Boğaç)

> Çoban Davut'un "Kaçan keçi Pamuk" görevi **ana görev** oldu (ACT 1 · "Çoban Davut", CB1); Davut evcilleştirme hocası. Çayır'daki yan görev yerine bu geldi.

Pijamasının üstüne babasının ceketini giymiş, uykusu kaçmış küçük bir çocuk.

- **Konuş:** "Her gece bir kuş ağlıyor. Hep aynı kuş. Annem 'rüyandır' diyor ama değil, sen de duy bak… Şşş."
- **Topla (dinleyerek, 1 kuş):** Toprak'ın çevresinde, 250–600 piksel ötede, bir çalılığın dibinde **yuvası dağılmış bir bıldırcın**. Haritada ve dünyada gösterilmez; yaklaştıkça ötüşü (kısık, kesik bir "bıt-bıt") duyulur (Bulut'un güvercinleri gibi). Bulunca: "Yuvası rüzgârda dağılmış. Yumurtaları soğumuş ama biri hâlâ ılık."
- **Kullan (yuva):** bıldırcının yanında **1 Kuru ot** ile yuvayı yeniden kur (yanına varınca kendiliğinden): kuş yuvaya oturur, ötüşü kesilir.
- **Konuş (Toprak'a dön):** "Sustu! …Ağlamıyordu demek, çağırıyordu. Teşekkür ederim. Artık uyuyabilirim, değil mi?"
- **Sonra dünyada:** Toprak'ın yanında, kenarda küçük bir yuva; gece yanından geçerken kısık bir ötüş duyulur. Konuşunca: "Yumurtadan bir yavru çıktı. Adını sen koy dedim ama sen yoktun, ben 'Fıstık' dedim."
- **İz:** yanındaki yuva. **Konuşma resmi:** Toprak'ın kendisi; bıldırcın satırlarında bıldırcın (kod yazılırken eklenir).

#### 3 · Güvercinci Bulut — Kaçan güvercinler (Çayır)

Elinde boş bir kafes, gözleri kızarmış bir oğlan.

- **Konuş:** "Kafesin kapısını açık unuttum, dört güvercinim de uçtu! Her birinin ayağında bir not var; adadakiler bana mektup verir, ben taşırım. Notlar kaybolursa herkes bana kızar. Yardım eder misin?"
- **Topla (4 güvercin, herhangi bir sırayla; "net göstermeyelim, yaklaştıkça ses çıkarsın"):** güvercinler Bulut'un çevresinde dört ayrı yönde, Bulut'tan **250–650 piksel** uzakta, yürünebilir yerlerdedir (her oyunda aynı yer). **Görünmezler:** dünyada güvercin ancak **60 piksel** yakınına gelince görünür; haritada ve ekranın kenarında güvercinin yeri gösterilmez; yan görevlerde sarı bölge olmadığı için (kural 11) haritada arama alanı da çizilmez. **Ses:** bir güvercinin **260 piksel** yakınına girince güvercin guruldaması duyulur; yaklaştıkça **daha sık** (yaklaşık 2,3 sn'den 0,45 sn'ye) ve **daha yüksek** çalar. Güvercinin **34 piksel** yakınına gelince eline konar ve ayağındaki not okunur (sıra yok; hangisine denk gelirsen). Not penceresi düğmesiz kapatılsa da (Esc, dışarıya dokunmak) görev takılmaz. Notlar:
  - "Nazlı'dan Dursun'a: *Çekicinin sesi olmadan pazar sessiz. Akşam çay var.*"
  - "Ekin'den Zümrüt'e: *Domatesler kazanından daha kırmızı oldu, gelip bak.*"
  - "Sinan'dan Zeynep'e: *Sana söz verdiğim evin son çivisini çaktım. Kapıyı açık bırakıyorum.*" (v3.39; Marangoz Çınar kaldırılınca)
  - "İmzasız: *Bu adada yıldız yok ama sen varsın.*"
- **Konuş:** "Dördü de burada! Sonuncunun kime gideceğini bilmiyorum ama… belki kimseye gitmesi gerekmiyordur." Görev biter.
- **Sonra dünyada:** Bulut'un yanında küçük bir güvercinlik, çevresinde dolaşan dört güvercin. Konuşunca: "Artık kapıyı hep kapatıyorum. Nazlı ile Dursun çay içmiş, duydun mu?"

#### 4 · Ela — Kampa giden yol (Orman, yalnızca gece)

**Yalnızca gece** (20:00–05:00) çıkar. Ormanda, bir ağacın dibinde, dizlerini kucaklamış ağlayan küçük bir kız.

- **Konuş:** "Annemle babam ışığa doğru yürüdüler… Ben arkalarından gidemedim, korktum. Çok karanlık. Kurtlar uluyor. Beni ateşi olan bir yere götürür müsün? Kemal Dede'nin ateşi hep yanar derler."
- **Eşlik et (Kemal'in kampına):** Ela peşinden gelir. **Işık gerekir:** elinde yanan bir meşale (ya da kafa lambası) yoksa Ela durur: "Çok karanlık, ışığın yok! Göremiyorum." Yolun **%25'inde, %50'sinde ve %75'inde** canavarlar çıkar (2, 2 ve 3 tane; Kurt ve Yaban domuzu). Canavarlar sana saldırır, Ela'ya değil; ama dövüşürken Ela olduğu yerde büzülüp bekler. **Reis çıkmaz**, kesilen canavarlar almanakta sayılmaz.
- **Varınca (Kemal'in ateşi):** Ela ateşin yanına koşar. Kemal battaniyesini omzuna atar: "Gel yavrum, gel. Burada ışık hep yanar." Ela: "Bir daha karanlıkta yalnız kalmayacağım, değil mi?" Görev biter.
- **Sonra dünyada:** Ela Kemal'in ateşinin başında oturur. Konuşunca: "Kemal Dede bana yıldızları anlattı. Burada yokmuş ama başka yerlerde varmış."

#### 5 · Şövalye Kahraman Dede — Ejderin ini (Orman)

Tencereden miğfer, tahtadan kılıç, tahta kapaktan kalkan; dimdik duran yaşlı bir adam.

- **Konuş:** "Dur, yolcu! Ben Şövalye Kahraman, Yıldızsız Ada'nın son şövalyesi! Bu ormanda bir **ejder** yaşıyor; kırk yıldır peşindeyim. Bugün onu yeneceğim. Sen benim… silahtarım olacaksın! Önden git, inini bul. Ben… kalkanımı parlatıp geliyorum."
- **Git ve avla (ejderin ini):** Kahraman Dede'den 250–400 piksel ötede bir çalılık. Varınca "ejder" ortaya çıkar: koca, homurdanan bir **Yaban domuzu**. Yenince: "Bu… ejder mi? Burnu yaş, kuyruğu kıvrık…"
- **Konuş (Kahraman Dede'ye dön):** "Ejderi mi yendin?! Kanatlarını gördün mü? Ateş püskürttü mü? …Bir domuz mu? Olsun! Domuz kılığına girmiş bir ejderdir, en tehlikelisi! Seni bugünden sonra **Şövalye** ilan ediyorum!" Görev biter.
- **Sonra dünyada:** Kahraman Dede'nin tencere miğferinde bir domuz dişi asılı. Konuşunca: "Yeni bir ejder duydum, bataklıkta. Bu sefer ben önden gideceğim. Belki."

#### 6 · Seyyar satıcı Bekir — Kırık araba (Orman)

Tekerleği kırılmış, yan yatmış bir el arabası; çevresinde dökülmüş mallar.

- **Konuş:** "Tekerlek bir köke çarptı, araba devrildi, ne var ne yok saçıldı! Düğmeler, iğneler, boncuklar, bir de kızımın oyuncağı. Toplar mısın? Bir de tekerleği yapacak malzeme lazım."
- **Topla (5 mal, istediğin sırayla):** arabanın çevresine 80–220 piksel saçılmış: bir kutu düğme, iğne yastığı, boncuk ipi, bakır çaydanlık, tahta at.
- **Getir:** **6 Dal** (tekerleğin parmakları) ve **4 Lif** (bağlamak için).
- **Konuş:** Bekir tekerleği bağlar, arabayı doğrultur. "Tıkır tıkır! Al bakalım, bu sikkeler senin. Tahta atı da kızım sana selam diye gönderdi… yok yok, onu ben götüreyim, ağlar sonra." Görev biter.
- **Sonra dünyada:** Bekir onarılmış arabasının yanında durur. Konuşunca: "Bu yol kökten geçilmiyor, ben de artık burada mal satıyorum. Şaka şaka, satmıyorum. Henüz."

#### 7 · Avcı Kartal — Yaralı avcı (Bataklık)

Bir kütüğe yaslanmış, bacağı kanlı bir avcı; yanında kırık bir mızrak.

- **Konuş:** "Bir timsah… bacağımı kaptı. Kurtuldum ama yürüyemiyorum. Yarayı sarmak için **3 Bataklık otu**, bacağımı tutturmak için **2 Kamış** getirir misin? Bir de… gece bataklık canlanır. Sarınca biraz yanımda kalır mısın?"
- **Getir:** 3 Bataklık otu, 2 Kamış. Kartal yarasını sarar.
- **Bekle (60 sn):** Kartal'ın yanında (90 piksel içinde) kal. Her 15 saniyede bir 2 canavar gelir (Bataklık kurdu ya da Engerek). Uzaklaşırsan sayaç durur: "Gitme, yalnız bırakma beni!"
- **Konuş:** "Sabaha çıkarırım artık. Bak sana bir şey diyeyim: bu bataklığın Reis'leri hep aynı yerde yatar, suyun en sığ yerinde. Bir gün lazım olur." Görev biter.
- **Sonra dünyada:** Kartal ayağa kalkmış, sargılı bacağıyla durur. Konuşunca: "Topallıyorum ama yürüyorum. Seni unutmam."

#### 8 · Hayali — Işığı gören adam (Bataklık)

Gözlerinin içi hafifçe mor; konuşması dağınık, elleri titreyen bir adam.

- **Konuş:** "Gördüm… gördüm onu. İndi, beni aldı, sonra… bıraktı. Neden bıraktı? Her gece **onun parçaları** beni çağırıyor. Bataklıkta mor taşlar parlıyor, üç tane. Onları bana getir. Yok etmem lazım, yoksa yine gelecek."
- **Topla (3 mor kıymık, istediğin sırayla):** Hayali'nin çevresinde 200–450 piksel ötede, yerde mor parlayan kıymıklar. Alınca hafif bir uğultu duyulur.
- **Konuş:** Hayali kıymıkları bir taşın üstünde ezer; mor duman çıkar, söner. Gözleri biraz netleşir. "Işık birini almadan önce onu **dinler**. Ben ona hiçbir şey söylemedim. Belki ondan bıraktı. Konuşanları alıyor; sevdiklerinin adını söyleyenleri." Görev biter. (Ana hikâyeye bir ipucu: ışık, sevdiklerini sayıklayanları seçiyor.)
- **Sonra dünyada:** Hayali küçük bir ateşin başında, sakin oturur. Konuşunca: "Artık uyuyabiliyorum. Kimsenin adını sesli söylemiyorum ama."

#### 9 · Falcı Kader — Kader satan kadın (Bataklık, gece)

Rengârenk şallara sarınmış, elinde kemikten zarlar olan bir kadın.

- **Konuş:** "Gel bakalım, Yıldızsız'ın yolcusu. Sana kaderini söyleyeyim, ama bedava değil. Ateşim sönmek üzere: **3 Turba** getir."
- **Getir:** 3 Turba. Kader ateşine atar, zarları sallar: "Bu gece kuzeyde, suyun kıyısında **kara bir kurt** seni bekliyor. Gitme dersem gidersin, git dersem gidersin. Git."
- **Git ve avla:** Kader'in gösterdiği yerde 2 **Bataklık kurdu** çıkar; yen.
- **Konuş:** "Gördün mü? Zarlar yalan söylemez. Şimdi sana bir kader daha: mor ışık bir gün **senin** de adını söyleyecek. O gün cevap verme." Görev biter.
- **Sonra dünyada:** Kader her konuşmada başka bir kehanet söyler ("Yarın bir tüccar gelecek… belki", "Cebindeki sikkeler azalacak, harcarsan").

#### 10 · Hatice Nine — Torun Emir (Kayalık Dağ, acı son)

Dağın yamacında küçük bir kulübenin önünde, elinde feneriyle bekleyen yaşlı bir kadın.

- **Konuş:** "Torunum Emir dün gece 'ışığa bakacağım nine' dedi, çıktı gitti. Sabah oldu, gelmedi. Yedi yaşında… Dağda iz bırakır o, hep bırakır. Ne olur bul onu."
- **Git (iz 1 · tahta at):** Kulübe ile mağara arasında, yolun dörtte birinde, yerde **küçük tahta bir at**. "Emir'in oyuncağı. Düşürmüş… ya da bırakmış."
- **Git (iz 2 · ayakkabı):** yolun yarısında tek bir **küçük ayakkabı**. "Bağcığı çözülmüş. Ayakkabısız yürümeye devam etmiş."
- **Git (iz 3 · tebeşir):** yolun dörtte üçünde, bir kayanın üstünde tebeşirle çizilmiş bir ok ve yanında yamuk bir **yıldız**. "Yıldız çizmiş. Bu adada hiç yıldız görmemiş bir çocuk."
- **Git (mağara):** Hatice Nine'nin kulübesinden 450–650 piksel ötede bir **mağara ağzı**. Mağaranın önünde, sırtüstü yatan küçük bir beden; gözleri kapalı, yüzü sakin, elleri göğsünde. Yanında tebeşirin son parçası. Karakter dizlerinin üstüne çöker: "…Geç kaldım." (Sahne sessizdir; kutlama yoktur.)
- **Konuş (Hatice Nine'ye dön):** Konuşma penceresinde seçenek yoktur, yalnızca "…" ile ilerlenir. Karakter: "Hatice Nine… Emir'i buldum. Mağaranın önünde. Çok üzgünüm." Hatice Nine uzun süre susar. Feneri yere bırakır. "Yıldız mı çizmiş? …Hep sorardı, 'nine yıldız nasıl bir şey' diye. Ben de anlatırdım. Anlatmasaydım…" Sonra: "Teşekkür ederim, evladım. Bilmemek daha kötüydü." **Görev bu acı haberi verince biter** (ödül sessizce eklenir; kutlama sesi ve "Görev tamamlandı" sevinci çalmaz).
- **Sonra dünyada:** Kulübenin yanında küçük bir mezar taşı, üstünde tebeşirle çizilmiş bir yıldız ve kır çiçekleri; Hatice Nine yanında oturur. Konuşunca: "Her sabah yıldızını yeniden çiziyorum. Yağmur siliyor, ben çiziyorum."

#### 11 · Yolcu Yahya — Dağda kaybolan yolcu (Kayalık Dağ)

Sırtında koca bir heybe, elinde asası, yorgun ve şaşkın bir adam.

- **Konuş:** "Üç gündür bu dağda dönüp duruyorum. Her kaya birbirine benziyor! Duydum ki bu dağın bir yerinde demirciler, bir cadı yaşarmış, bir ocak hep yanarmış. Beni oraya götürür müsün? Bacaklarım eskisi gibi değil, yavaş yürürüm."
- **Eşlik et (Kayalık Dağ kuzenlerinin ocağına):** Yahya yavaş yürür (senin hızının yarısı kadar). Yolun %33'ünde ve %66'sında canavarlar çıkar (2 ve 3 tane; Kurt, Muflon gibi dağ canlıları). Reis çıkmaz; almanakta sayılmaz.
- **Varınca:** "Ateş! Duman! İnsan sesi! Ah, ah… Üç gün sonra ilk sıcak yer. Sana borcum büyük." Görev biter.
- **Sonra dünyada:** Yahya kuzenlerin ocağının yanında oturur, heybesini açmış. Konuşunca: "Burada kalacağım galiba. Demirci çekiç sallıyor, ben hikâye anlatıyorum. Adil bir takas."

#### 12 · Işıl — Gece görünen kız (Kayalık Dağ, gece)

Yalnızca gece 22:00–04:00 arası görünür: soluk, mavi ışıklı, yarı saydam küçük bir kız. Yaklaşınca konuşmaz, gülümser ve kaybolur.

- **Git (ilk görünüş):** kıza yaklaşınca (60 piksel) görev kendiliğinden başlar (konuşma yok); kız kıkırdayıp kaybolur; yerde ışık izi kalır. "Bir çocuk… ama ayaklarının altında ot ezilmiyor."
- **Git (ikinci görünüş):** 200–350 piksel ötede yeniden belirir; yaklaşınca yine kaybolur. Kulağına bir şarkının yarısı gelir.
- **Git (üçüncü görünüş):** bir kayalığın dibinde belirir; bu sefer konuşur: "Beni unuttular mı? Annem adımı hâlâ söylüyor mu?"
- **Git (taş):** son yerde, otların arasında yosun tutmuş **küçük bir taş**; üstüne kazınmış: *"IŞIL. Işığa gülümseyerek yürüdü."* Taşın yanına bir fener konur, kendiliğinden yanar. Kızın sesi: "Teşekkür ederim. Artık karanlık değil." Görev **orada** biter (geri dönülecek kimse yoktur).
- **Sonra dünyada:** taş ve yanındaki fener kalır; fener geceleri yanar. Işıl bir daha görünmez.

### 24 yeni yan görev (v3.39, Boğaç)

Boğaç'ın isteği: Kül Diyarı ve Mor Kristal Vadisi'ne 6'şar, ilk dört biyoma 3'er yeni yan görev; "beğenmediğimi sonra kaldırırım". Hepsi yukarıdaki kurallara uyar (birden çok alınabilir, kaçırılmaz, süre sınırı yok, bayılınca yalnızca takip edilen yan görev yarıda kalır, görev canavarları almanağa sayılmaz). Kişiler biyomlarında, ilk on ikinin yerlerinden uzakta durur; haritada mavi **?** ile görünürler. **Yeni adım türleri ve kurallar:**
- **Kullan:** belli noktalara elinde gereken eşyayla gidince her nokta bir tane harcar (ör. her yanan ağaç 1 Su). Eşya yoksa "X gerekli" yazar, nokta kalır.
- **Aletli bulma:** bazı noktalar için çantada o tür bir alet olmalı (ör. kazma); yoksa "Kazma gerekli" yazar.
- **Sesle bulma:** güvercinler gibi, yaklaştıkça sesi duyulan şeyler: kurbağalarda vırak, çanlarda ve kristallerde çınlama.
- **Kovalanan hayvan** kendi biyomunda kaçar (Pamuk gibi; oğlak ve katır).
- **Beklemede** kişi kendi sözüyle seslenir ("Gitme! Yumurta çatlıyor!" gibi).
- **5. ve 6. biyomda dövüş adımlarının canlıları:** Kül Diyarı'nda Kül kurdu ve Lav kertenkelesi, Mor Kristal Vadisi'nde Gölge kurdu ve Kristal örümcek.
- **İz:** her görev bitince kişinin yanında görevle ilgili bir şey kalır (aşağıda "İz").

| # | Kişi · Görev | Biyom · saat | Adımlar | Ödül | İz |
|---|---|---|---|---|---|
| 19 | **Arıcı Gülsüm** · Kaçan arı oğulu | Çayır · 08:00–13:00 | Üç arı salkımını bul → Gülsüm'e dön | 80 · 60 XP | yanında arı kovanları |
| 20 | **Ozan** (çocuk) · Ağaca takılan uçurtma | Çayır · 14:00–19:00 | Ağaçtaki uçurtmayı bul → 2 İp götür | 70 · 50 XP | başının üstünde uçan uçurtma |
| 21 | **Değirmenci Rıfat** · Duran değirmen | Çayır · 05:00–10:00 | Değirmenin önündeki 2 kurdu kov → 6 Dal, 4 Lif götür | 100 · 70 XP | kanatları dönen değirmen (öncesi kırık) |
| 22 | **Mantarcı Saadet** · Mantar sepeti | Orman · 05:30–10:30 | Dört kanlıca kümesini topla (sinek mantarına dokunma) → dön | 110 · 80 XP | mantar kurutma ipi |
| 23 | **Oduncu Tarık** · Ağacın altında | Orman · 07:00–12:00 | 2 Sopa, 2 İp götür (koltuk değneği) → Tarık'ı Usta Sinan'ın tezgâhına götür (yolda domuz ve kurt) | 130 · 90 XP | Tarık artık Sinan'ın yanında |
| 24 | **Ressam Lale** · Ormanın renkleri | Orman · 16:00–20:30 | 3 Gelincik, 4 Yaban mersini götür → ormanın en güzel açıklığını bul → dön | 180 · 150 XP | şövalesi (hep) |
| 25 | **Kayıkçı Remzi** · Sisteki kayıkçı | Bataklık · yalnızca gece (00:00–05:00) | Remzi'yi ışıkla Avcı Doğan'ın kulübesine götür (yolda kurtlar) | 520 · 700 XP | Remzi Doğan'ın ateşinin başında |
| 26 | **Cemile** (çocuk) · Şarkı söyleyen kurbağalar | Bataklık · 18:30–23:00 | Vıraklamaları dinleyip dört kurbağayı bul (yakalamak yok) → dön | 260 · 210 XP | yanında iki kurbağa |
| 27 | **Hekim Şifa** · Bataklık humması | Bataklık · 08:00–14:00 | 4 Bataklık otu, 2 Turba götür → ilaç kaynarken kazanın başında bekle (50 sn; ilk dalga yalnızca Engerek, sonraki iki dalgada birer Bataklık kurdu) → dön | 340 · 270 XP | ilaç kazanı (hep) |
| 28 | **Dağlı Zehra** · Uçurumdaki oğlak | Kayalık Dağ · 06:00–12:00 | Oğlak Boncuk'u 3 kez yakala → Zehra'ya götür | 520 · 700 XP | yanında Boncuk |
| 29 | **Gözcü Bora** · Kartal yumurtası | Kayalık Dağ · 09:00–15:00 | Düşen yumurtayı bul → yuvanın dibindeki 2 kurdu kov, yumurtayı koy → dön | 680 · 900 XP | – |
| 30 | **Keşiş Sükûn** · Dağın çanları | Kayalık Dağ · 04:30–09:30 | Rüzgârda çınlayan üç çanı bul → dön | 520 · 700 XP | yanında asılı rüzgâr çanı |
| 31 | **Külcü Hasret** · Küllerin altındaki mektup | Kül Diyarı · 09:00–14:00 | Dumanı tüten dört mektup parçasını bul (her biri bir satır) → dön (acı son, sessiz) | 520 · 700 XP | mektup kutusu |
| 32 | **Yangıncı Kor Ali** · Sönmeyen ağaçlar | Kül Diyarı · 13:00–18:00 | İçten yanan beş kül ağacını söndür (her biri 1 Su) → dön | 520 · 700 XP | diyarın ilk yeşil fidanı |
| 33 | **Çırak Çelik** · Lava düşen çekiç | Kül Diyarı · 07:00–11:30 | Çelik'le lav tarlasına git (yolda kertenkeleler) → çekici kazmayla kabuktan çıkar (kazma gerekli) → dön | 680 · 900 XP | örsü (hep) |
| 34 | **Nar** (çocuk) · Sıcak yumurta | Kül Diyarı · 17:30–22:30 | Saklanan yumurtayı bul → yumurta çatlarken ateşin başında bekle (60 sn, kurtlar) → dön | 680 · 900 XP | omzunda yavru ateş kertenkelesi Kıvılcım |
| 35 | **Duman Dede** · Kükürtteki sesler | Kül Diyarı · yalnızca gece (23:00–04:00) | 4 Kükürt kristali götür → üç sunakta yak; dumanlar Yıldızsızların adaya inişini, köpekleri ve şapkayı gösterir → dön | 600 · 1.200 XP | – |
| 36 | **Katırcı Ömer** · Kül fırtınasında kaybolan | Kül Diyarı · 15:00–20:00 | Katır Kınalı'yı 3 kez yakala → Ömer'e götür | 520 · 700 XP | yanında Kınalı |
| 37 | **Melodi** · Şarkı söyleyen kristaller | Mor Kristal Vadisi · 11:30–16:30 | Çınlamalarını dinleyip beş kristali bul → dön | 700 · 1.000 XP | yanında parlayan bir kristal |
| 38 | **Balıkçı Selim** · Ayna Gölü'ndeki kız | Mor Kristal Vadisi · yalnızca gece (20:30–01:30) | Dört ayna parçasını topla → kıyıda birleştir (kız mor ışığın içinde, kurtarılamaz; acı son, sessiz) → dön | 780 · 1.150 XP | göl kıyısında ayna |
| 39 | **Kristalci Yaren** · Taşkalp | Mor Kristal Vadisi · 08:00–13:30 | Taşocağındaki 3 Kristal golemi yen (çekirdek taşları) → dön; golem Taşkalp uyanır | 720 · 1.050 XP | Taşkalp ayakta, gözleri mavi (öncesi yıkık) |
| 40 | **Lostromo Rıza** · Tayfanın künyeleri | Mor Kristal Vadisi · yalnızca gece (01:00–05:00) | Gölge kurtlarının yatağında 4 kurdu yen (künyeler) → kıyıda dört fener yak → dön | 820 · 1.200 XP | kıyıda dört fener |
| 41 | **Asena** · Mor gözlü yavru | Mor Kristal Vadisi · 19:00–24:00 | 3 Geyik eti götür → gece yavruyu sürüsünden koru (60 sn) → dön; yavru Gece onunla kalır | 750 · 1.100 XP | yanında yavru Gece |
| 42 | **Fenerci Işık** · Düşen ışığı toplamak | Mor Kristal Vadisi · yalnızca gece (21:00–04:30) | Mor ışığın düştüğü yerlerde üç mor damla topla (elinde ışık olmalı, yoksa ışık seni alır) → dön | 860 · 1.300 XP | **üç kalıcı fener ateşi:** yanlarında gece mor ışık gelmez (güvenli yer) |

### Ödüller

Şimdilik her yan görev yalnızca **sikke + XP** verir (tablodaki değerler). **Ödül kuralı (geçici, 6 Kasım 2026, Boğaç: "görevi yaptığına değecek kadar XP ve altın ver"; yan görevler yeniden tasarlanacak):** her yan görevin sikkesi ve XP'si, **onu açan ana görevin ödülünün 1,5–2,5 katıdır** (emeğe göre: adım sayısı, dövüş, koruma, bekleme); değerler 10'a yuvarlanır. **Alt sınır:** yan görevin sikkesi ve XP'si (ayrı ayrı) v3.46'daki özgün değerinin altına düşmez. **İkinci alt sınır (7 Kasım 2026):** bir biyomun yan görevlerinin ödülü, önceki biyomun en yüksek yan görev ödülünün altına düşmez (biyomlar arası geçişte keskin fark olmaz, yalnızca gelişim olur); biyom içinde ödül açılış sırasıyla artar. Açan ana görev, "Açılış sırası"ndaki koşulda adı geçen ana görevdir (E2, E3…); koşul yalnızca bir sayıysa (N bitmiş ana görev), ACT 1 ana görevleri ödüllerine göre küçükten büyüğe dizildiğinde N. sıradaki görev esas alınır; ikisi birlikteyse ödülü büyük olan. Mağara yan görevlerinin ödülü bu kuralın dışındadır (kendi tablolarında). Ödül yan görev bitince bir kez verilir; yarıda kalıp yeniden yapılan görev ödülü yine bir kez verir.

### İleride ödül fikirleri (konuşulacak)

- **Benzersiz bir tarif:** her yan kişi başka yerde öğrenilmeyen bir tarif öğretir (Mavi: deniz feneri lambası; Bekir: el arabası; Kartal: bataklık sargısı).
- **Bir anı ya da Kitap sayfası:** "Yol Hikâyeleri" ya da **Kayıp Defteri**: her yardım ettiğin kişi bir sayfa.
- **Kozmetik:** Kahraman Dede'nin tencere miğferi, Bulut'un güvercini omzunda, Mavi'nin kır çiçeği tacı.
- **Dost:** Ela kampta ara sıra topladığı şeyleri sana getirir; Yahya ocakta sana yol hikâyesi (haritada bir ipucu) anlatır.
- **Dükkân:** Bekir'in arabası gezgin bir dükkâna dönüşür; yalnızca onda bulunan eşyalar.
- **İpucu:** Kartal Reis'lerin yerlerini, Kader bir sonraki tüccarın gününü söyler.
- **Hepsi bitince:** kurtardıkların bir gece Kemal'in ateşinin başında toplanır; küçük bir son sahne ve bir başarım.


## Mağaralar

> Her biyomda bir mağara olacak; ilk pakette **Çayır** ve **Orman** mağaraları var. Bataklık, Kayalık Dağ, Kül Diyarı ve Mor Kristal Vadisi'ne de birer mağara eklendi; artık Act 1'in altı biyomunun her birinde bir mağara var. Yeni mağaraların her birinde 3 canlı türü, en dipte 1 yan görev kişisi ve bir boss, **4 yalnızca mağarada bulunan toplanabilir** ve Mağara mantarı, canlılardan düşen kendine özgü malzemeler ve az olan tarif türlerinden (Av ve hayvan, Müzik, Süs, Boya, Büyü; yemek yok) tarifler vardır. Mağaraya meşalesiz ve seviyesi yetmeyen giremez. İçeride kendi canlıları, Reis'leri, toplanan malzemeleri ve en dipte bir yan görev kişisi vardır; o kişinin görevi mağaranın **boss'una** götürür.

### Mağara girişlerinin görünüşü (v3.39, Boğaç: "mağara mağaraya benzesin, her biyomdaki farklı olsun, biyomuna uygun")

Her mağaranın dışarıdaki girişi kendi biyomuna göre çizilmiş, düzensiz kenarlı bir kaya tepesidir; ortasında kemerli, içe doğru kararan bir ağız ve ağzın çevresinde kemer taşları vardır. İçerideki ışık (mağaranın rengi) ağızda hafifçe nefes alır; tabela ve kapı yeri aynıdır.

| Mağara | Biyom | Görünüş |
|---|---|---|
| Yankı Mağarası | Çayır | gri kireçtaşı tepe, üstü çimenli ve çiçekli, kayada yosun lekeleri, yanında bir çalı; içeride mavi ışık |
| Kök Mağarası | Orman | toprak renkli kaya, ağzın üstünden ve yüzünden aşağı sarkan kalın ağaç kökleri, tepesinde küçük bir ağaç, dibinde eğrelti; içeride turuncu ışık |
| Batık Mağara | Bataklık | alçak, yarı batık, koyu yeşil ıslak kaya, ağır yosun, ağzın önüne sarkan sarmaşıklar, ağzın önünde bir su birikintisi ve kenarlarda sazlar; içeride yeşil ışık |
| Rüzgâr Mağarası | Kayalık Dağ | yüksek, sivri, mavi-gri kayalık, tepesinde ve çıkıntılarda kar, ağzın üstünde buz sarkıtları; içeride soğuk beyaz-mavi ışık |
| Kor Mağarası | Kül Diyarı | kara bazalt, içinden turuncu parlayan çatlaklar, ağzın altından sızan kor, tepede kül ve duman; içeride turuncu ışık |
| Ayna Mağarası | Mor Kristal Vadisi | koyu mor kaya, ağzın iki yanında ve tepede mor kristal kümeleri, ışıltılar; içeride mor ışık |

### Genel kurallar

1. **Giriş.** Mağaranın girişi büyüktür (genişliği ~4–5 ağaç, ~100 × 76 piksel kayalık bir tepe ve ortasında karanlık bir ağız). Ana kişilerden ve ateşlerden en az ~400 piksel uzakta, kendi biyomunda, ağaçsız bir yerdedir (ada her kurulduğunda aynı yer). Ağzın önünde ahşap bir tabela durur: mağaranın adı ve **seviye şartı** ("Yankı Mağarası · Sv 5").
2. **Şartlar.** **Girişe tıklayınca** karakter mağaranın ağzına yürür ve bir pencere açılır: "Mağaraya girmek ister misin?", altında iki şart işaretiyle (✓/✗ en az X. seviye, ✓/✗ elinde yanan bir meşale). **Mağaraya gir** düğmesi yalnızca iki şart da tamamsa basılır; **Vazgeç** (ya da Esc) kapatır, Enter girer. Ağzın önünde **F** de aynı pencereyi açar. Eski davranış (şart tutmazsa karakterin söylediği): seviye yetmiyorsa karakter "Bu mağara bana göre değil… en az **5. seviye** olmalıyım (şimdi 3)." der. Seviye yetiyor ama **elinde yanan bir meşale yoksa** "Meşalesiz giremem; içerisi zifiri karanlık." der (kafa lambası yetmez). İkisi de tamamsa girer.
3. **Yükleme.** Girerken kısa bir yükleme ekranı (~0,9 sn): mağaranın adı ve "Mağaraya giriliyor…". Çıkarken "Gün ışığına çıkılıyor…".
4. **İç alan.** Her mağara ayrı bir alandır: istenen boyut biyomun dörtte biriydi (~107 × 107 karo); adada kişilerden, ateşlerden ve yerlerden uzak, buna sığan en büyük kuru alan **~89 × 89 karo** (biyomun yaklaşık beşte biri) olduğu için mağaralar bu boyuttadır. İçinde kıvrımlı tüneller, ~18 yan kol ve oda, en dipte büyük bir oda vardır. Giriş en alttadır; en derin oda en uzak uçtadır. İçeride **hava yoktur** (yağmur, sis, rüzgâr, şimşek ve gök gürültüsü yok; dışarının hava ve ortam sesleri de içeri gelmez —: "mağarada yağmur yağıyor"), mor ışık gelmez, gün ışığı yoktur: her yer gece gibi karanlıktır.
5. **Meşale.** **Mağarada hava meşaleyi etkilemez ("mağarada meşale çok hızlı tükeniyor"):** dışarıda yağmur ya da fırtına varken meşale 2–2,7 kat hızlı yanar; içeride hava olmadığı için mağarada her zaman normal hızda yanar. Meşale sol eldeyken her saldırıda harcanan pay da mağarada **üçte birdir** (dışarıda %4,5, içeride %1,5). Mağarada meşalenin aydınlattığı alan **2 katıdır** (Kaba meşale 160 px, Meşale 230 px; ışığın dışı karanlıktır). Meşale içeride biterse (ya da elinden indirilirse) her yer **zifiri karanlık** olur; karakter "Meşalem bitti! Hiçbir şey göremiyorum…" der ve 1,5 sn sonra kendini mağaranın dışında, girişin önünde bulur (eldeki meşaleyi indirdiysen 3 sn içinde yeniden eline alırsan kalırsın). Mağaranın ağzından içeri vuran soluk bir ışık ve parlayan mantarlar ya da reçineler küçük ışık halkaları yapar ama yolu göstermeye yetmez.
6. **Çıkış.** İçeride girişin olduğu yerde ışıklı bir **"ÇIKIŞ" tabelası** ve aşağı ok durur (tabela mağara zemininin üstüne çizilir, önceden görünmüyordu). **Giriş ve çıkış sarı parlar:** dışarıda mağaranın ağzında, içeride çıkışta yerde nabız gibi atan sarı bir halka ve ışıltı vardır; gece de görünür (ağzın 60 px ışığı). Çıkış alanı 56 px'tir (tıklama 50 px). Başlangıç/çıkış noktası her zaman yürünebilir zemindedir (mağara kurulurken su ağzın üstündeki hücreyi silerse en yakın zemine alınır). Tabelaya tıklayınca ya da yanında **F**: "Mağaradan çıkıp gün ışığına dönmek ister misin?" penceresi, **Mağaradan çık** düğmesiyle. Bayılırsan mağaradan çıkarılırsın (her zamanki gibi uyanma yerinde uyanırsın).
7. **Kayıt.** Mağaradayken kaydedilirse oyun, kayıt açılınca seni **mağaranın girişinin önünde** başlatır. Mağarada açtığın yerler (harita) kaydedilir.
8. **Harita.** Dışarıda mağaranın girişi küçük ve büyük haritada **mağara simgesiyle** görünür (o biyoma ayak basmışsan); büyük haritada üzerine gelince adı ve şartı yazar ("Yankı Mağarası · Sv 5 · meşale"). Mağaranın içindeyken harita **mağaranın kendi haritasını** gösterir: yürüdükçe açılan tüneller, giriş ve en dipteki kişi.
9. **Canlılar.** Her mağarada **3 canlı türü** yaşar; yalnızca o mağarada çıkarlar (dışarıda yoktur). Mağarada dolaşırken çevrende (200–420 px) karanlıkta doğarlar. Her tür adanın öbür canlıları gibi **Reis** sayacına sahiptir: yeteri kadar avlayınca o türün Reisi gelir. Almanakta biyomun canlılarının altında ayrı bir **"Mağara: …"** bölümünde görünürler (mağaraya bir kez girmiş olmak yeter).
10. **Mağara boss'u.** Her mağaranın bir boss'u vardır; doğrudan **Reis biçimindedir** (mor parıltılı, iri). Yalnızca en dipteki kişinin görevinde çağrılır. Almanakta mağara bölümünün sonunda durur:
    - hiç karşılaşılmadıysa: kapalı kart ("???", "Henüz karşılaşmadın");
    - karşılaşıp yenemediysen (bayıldıysan): özellikleri açılır (can, hasar, hız, hamleler, düşürdükleri) ama kart **altın değildir** ("Karşılaştın, henüz yenemedin");
    - yendiysen kart kendiliğinden **altın** olur ("★ Yenildi").
11. **Yan görev.** Her mağaranın en derin odasında bir **yan görev kişisi** vardır (yan görev kuralları geçerlidir: ana görevle birlikte yapılır, bayılınca yalnızca yan görev iptal olur). Kişi başında mavi "?" ile görünür; yalnızca mağaranın içinden ulaşılır (dış haritada işaret yoktur). Görev bir hikâyeyle başlar, mağarada toplanan bir malzemeyi ister, sonra boss'u çağırır. Boss'la karşılaşıp bayıldıysan ve kişiye **ikinci kez** gidersen, görev en baştan başlamaz: kişi doğrudan "Hazır mısın?" diye sorar ve boss hemen çağrılır. Boss yenilince kişiye dönülür; görev biter.
12. **Malzemeler.** Her mağarada **Mağara mantarı** da toplanır (yalnızca mağaraların içinde çıkar, dışarıda yoktur; çiğ yenir, zehirli). Ayrıca mağarada **2 toplanabilir** malzeme (duvar diplerinde, her girişte yeniden dizilir; içerideyken yeniden çıkmaz) ve canlılardan düşen malzemeler vardır. **Hepsinin bir satış fiyatı vardır** (Nazlı'ya satılır) ve her biri **en az bir tarifte** kullanılır. Bu tarifler **kazandan öğrenilir** (malzemeler bir kez bulununca Normal modda açık görünür); çoğu tarif kitabında az tarif olan kategorilerdendir (Büyü, Müzik, Boya, Şifa, Av ve hayvan) ve iki tanesi yemektir.

### 1 · Yankı Mağarası (Çayır · Sv 5)

Çayır'ın kayalık bir köşesinde, ağzından serin hava ve damla sesleri gelen alçak tavanlı bir mağara. Duvarlarda mavi parlayan mantarlar, tavandan sarkan damla taşları.

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Mağara yarasası | saldırgan | 22 | 7 | 78 | 10 | uçar, 2–4'lü sürü | Yarasa zarı (%80) |
| Kör kertenkele | nötr | 40 | 9 | 40 | 12 | vurulunca saldırır | Kör kertenkele eti (her zaman), Kertenkele pulu 1–2 (%60) |
| Taş örümceği | saldırgan | 55 | 12 | 56 | 16 | ısırığı kanatır | Taş örümceği ipi 1–2 (%80) |

**Boss · Yankı Kraliçesi** (Reis biçiminde dev yarasa): can 900, hasar 22, hız 62, uçar, XP 400; düşürdükleri: Kraliçe pençesi (her zaman), Yarasa zarı 3–5.

**Toplanabilenler:** Yankı mantarı (mavi parlar; elle), Damla taşı (elle).

**Yan görev · Madenci Kaya — "Yankı Kraliçesi"** (en dipteki odada, elinde feneriyle oturan yaşlı bir madenci)
- *Hikâye:* "Kırk yıl bu mağarada damla taşı kazdım. Bir gece mor ışık mağaranın ağzına indi; yarasalar delirdi. En dipteki büyük yarasa, **Yankı Kraliçesi**, o geceden beri uyumuyor. Çığlığı taşları çatlatıyor; bir gün tavan çökecek ve köyün içtiği dere bu mağaradan çıkıyor. Onu yuvasından çıkarmanın tek yolu ışık: Yankı mantarları ona annesini hatırlatır. **4 Yankı mantarı** getir, fenerime koyayım."
- *Getir:* 4 Yankı mantarı. Kaya mantarları fenerine koyar: "Işık hazır. Kulaklarını tıka evlat… geliyor!"
- *Boss:* Yankı Kraliçesi odaya iner; yen.
- *Dön:* "Mağara sustu. Damlaları dinle… artık yalnızca su sesi var. Sağ ol." Görev biter.
- *İkinci deneme:* "Yine geldin. Fener hazır, mantarlar yerinde. Kraliçeyi çağırayım mı?" → **Çağır**.
- *Ödül:* 310 sikke · 260 XP (boss'u yenince ayrıca Reis ödülü: sikke ve boss'un XP'si). *Sonra:* "Damla taşı kazmaya döndüm. Kraliçe olmadan mağara çok sessiz, biraz da özlüyorum."

**Malzemeler ve fiyatlar**

| Malzeme | Nereden | Fiyat (sikke) | Kullanıldığı tarif |
|---|---|---|---|
| Yankı mantarı | toplanır | 14 | Yankı çorbası, Kraliçe tılsımı |
| Damla taşı | toplanır | 12 | Kertenkele merhemi, Damla akı boyası |
| Yarasa zarı | Mağara yarasası | 16 | Yarasa zarı davul |
| Kör kertenkele eti | Kör kertenkele | 18 | Yankı çorbası (çiğ de yenir) |
| Kertenkele pulu | Kör kertenkele | 18 | Kertenkele merhemi |
| Taş örümceği ipi | Taş örümceği | 22 | Yarasa zarı davul, Kraliçe tılsımı |
| Kraliçe pençesi | Yankı Kraliçesi | 260 | Kraliçe tılsımı |

**Tarifler (kazanda öğrenilir)**

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Yankı çorbası | Yiyecek | 2 Yankı mantarı, 1 Kör kertenkele eti, 2 Su, 1 Ateş | 91 |
| Kertenkele merhemi | Şifa | 2 Kertenkele pulu, 1 Damla taşı, 1 Su | 143 |
| Damla akı boyası | Boya | 2 Damla taşı, 1 Su | 40 |
| Yarasa zarı davul | Müzik | 3 Yarasa zarı, 2 Taş örümceği ipi, 2 Dal | 130 |
| Kraliçe tılsımı | Büyü | 1 Kraliçe pençesi, 2 Yankı mantarı, 1 Taş örümceği ipi | 420 |

### 2 · Kök Mağarası (Orman · Sv 10)

Orman'ın derininde, yaşlı ağaçların köklerinin tavandan sarktığı geniş bir mağara. Duvarlarda amber renkli reçine damlaları parlar, yerde soluk mantarlar.

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kök böceği | saldırgan | 90 | 18 | 44 | 24 | sert kabuk | Kök böceği kabuğu 1–2 (%80) |
| Kök yılanı | saldırgan | 70 | 16 | 58 | 22 | ısırığı zehirler | Kök yılanı derisi (%70) |
| Mağara kurdu | saldırgan | 120 | 22 | 66 | 30 | 2–3'lü sürü | Mağara kurdu eti (her zaman), Mağara kurdu postu (%60) |

**Boss · Yaşlı Kök** (Reis biçiminde, köklerden örülmüş dev bir canlı): can 2000, hasar 38, hız 40, XP 900; düşürdükleri: Yaşlı Kök özü (her zaman), Kök reçinesi 3–5.

**Toplanabilenler:** Kök mantarı (elle), Kök reçinesi (amber parlar; elle).

**Yan görev · Kökçü Fidan — "Yaşlı Kök"** (en dipteki odada, köklerin arasında diz çökmüş genç bir şifacı)
- *Hikâye:* "Ninemin ıhlamuru bu mağaranın tam üstünde. Kökleri buraya kadar iner. Bir gece mor ışık köklere sızdı; kökler birbirine sarıldı, bir canlıya dönüştü: **Yaşlı Kök**. Ormanın suyunu içiyor, ağaçlar kuruyor, ninemin ıhlamuru da. Kalbini kabukla örtmüş; kabuğu yakmak için reçineden ateş macunu yapacağım. **3 Kök reçinesi** getir."
- *Getir:* 3 Kök reçinesi. "Macun hazır. Kabuğu tutuşunca vur, hep vur! Geliyor…"
- *Boss:* Yaşlı Kök topraktan yükselir; yen.
- *Dön:* "Kökler gevşedi… duyuyor musun? Yukarıda ıhlamurun yaprakları hışırdıyor. Teşekkür ederim." Görev biter.
- *İkinci deneme:* "Yine geldin. Macun hâlâ sıcak. Yaşlı Kök'ü uyandırayım mı?" → **Uyandır**.
- *Ödül:* 500 sikke · 450 XP (boss'u yenince ayrıca Reis ödülü). *Sonra:* "Köklere su taşıyorum. Ihlamur bu bahar çiçek açacak."

**Malzemeler ve fiyatlar**

| Malzeme | Nereden | Fiyat (sikke) | Kullanıldığı tarif |
|---|---|---|---|
| Kök mantarı | toplanır | 20 | Kök mantarlı güveç, Kök özü iksiri |
| Kök reçinesi | toplanır | 24 | Kök flütü |
| Kök böceği kabuğu | Kök böceği | 28 | Böcek kabuğu boyası |
| Kök yılanı derisi | Kök yılanı | 32 | Kök flütü |
| Mağara kurdu eti | Mağara kurdu | 32 | Kök mantarlı güveç (çiğ de yenir) |
| Mağara kurdu postu | Mağara kurdu | 40 | – (satılır; Deri parçası da düşer) |
| Yaşlı Kök özü | Yaşlı Kök | 480 | Kök özü iksiri |

**Tarifler (kazanda öğrenilir)**

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kök mantarlı güveç | Yiyecek | 2 Kök mantarı, 1 Mağara kurdu eti, 2 Su, 1 Ateş | 160 |
| Böcek kabuğu boyası | Boya | 2 Kök böceği kabuğu, 1 Su | 75 |
| Kök flütü | Müzik | 1 Kök yılanı derisi, 1 Kök reçinesi, 1 Dal | 95 |
| Kök özü iksiri | Büyü | 1 Yaşlı Kök özü, 2 Kök mantarı, 1 Su | 680 |

### Yeni mağaraların ortak kuralları

- **Canlıların görünüşü:** yeni canlılar adadaki akrabalarının biçiminde, kendi renkleriyle çizilir (ör. Batak semenderi yeşil bir Lav kertenkelesi, Lav yılanı kızıl bir Engerek; Kaya yarasası, Kristal yarasa, Tavan örümceği, Ayna örümceği ve Kor böceği Yankı ve Kök mağaralarının canlılarının renk değiştirmiş halidir). Boss'lar Reis biçimindedir (mor parıltılı, iri, adı ve uzun can çubuğuyla).
- **Toplanabilenler:** her yeni mağarada 4 toplanabilir yalnızca o mağarada çıkar, beşincisi Mağara mantarıdır. Parlayanlar (Parıltı yosunu, Gümüş filizi, Dağ kristali, Kükürt kristali, Kor taşı, Mor damar taşı, Işık sporu, Ayna taşı, Yıldız tozu) çevrelerini hafifçe aydınlatır. Mağara mantarı mağaraların içinde artık görünüyor (önceden toplanabildiği halde çizilmiyordu).
- **Sesler:** bütün mağara canlılarının ve boss'larının kendi saldırı sesi vardır (bkz. ACT 1 › Canlı sesleri).
- **Yan görev kalıbı:** dipteki kişi bir hikâye anlatır, mağarada toplanan bir malzemeden **4** tane ister, boss'u çağırır; boss yenilince kişiyle konuşulur. İkinci denemede boss doğrudan çağrılır.
- **Mağaranın yeri:** mağaraların içi için seçilen alan artık mağara girişlerinden önce seçilir; altı giriş bu alana konmaz (altı mağarayla bir giriş bu alanı kapatabiliyordu).

### 3 · Batık Mağara (Bataklık · Sv 18)

Bataklığın altında, tavanından su sızan, yerleri balçıklı bir mağara. Duvarlarda yeşil parlayan yosunlar, suyun içinde batmış kökler.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Mağara sülüğü | saldırgan | 300 | 30 | 40 | 60 | 2–3'lü sürü, ısırığı kanatır | Sülük 1–2 (%80) |
| Balçık kurbağası | saldırgan | 420 | 34 | 38 | 75 | uzaktan atar (140 menzil, 2 atış), zehir | Balçık bezesi (%70) |
| Batak semenderi | saldırgan | 520 | 40 | 50 | 85 | – | Semender derisi (%70) |

**Boss · Çamur Ana** (dev kurbağa): can 3.600, hasar 75, hız 34, XP 1.500, zehirler; düşürdükleri: Çamur Ana gözü (her zaman), Balçık bezesi 3–5.

**Toplanabilenler:** Parıltı yosunu (yeşil parlar), Siyah balçık, Batık kök, Sazlı inci, Mağara mantarı.

**Yan görev · Sazcı Nail — "Çamur Ana"** (yaşlı bir sazcı): köyün kuyusu mağaranın altından beslenir; mor ışıktan beri Çamur Ana suyu balçığa çeviriyor. **4 Parıltı yosunu** ister, ondan ışıklı bir yem yapar; Çamur Ana yeme gelir, yen. Ödül: **700 sikke · 680 XP**. Sonra: "Kuyudan yine tatlı su çıkıyor."

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Parıltı yosunu | toplanır | 36 | Yosun yeşili boya |
| Siyah balçık | toplanır | 30 | Sülük yemi |
| Batık kök | toplanır | 32 | Semender derisi tef, İnci kolye |
| Sazlı inci | toplanır | 48 | İnci kolye, Çamur Ana muskası |
| Sülük | Mağara sülüğü | 62 | Sülük yemi |
| Balçık bezesi | Balçık kurbağası | 78 | – (satılır) |
| Semender derisi | Batak semenderi | 86 | Semender derisi tef, Çamur Ana muskası |
| Çamur Ana gözü | Çamur Ana | 900 | Çamur Ana muskası |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Sülük yemi | Av ve hayvan | 2 Sülük, 1 Siyah balçık | 160 |
| Semender derisi tef | Müzik | 2 Semender derisi, 2 Batık kök, 1 Dal | 270 |
| İnci kolye | Süs | 3 Sazlı inci, 1 Batık kök | 230 |
| Yosun yeşili boya | Boya | 2 Parıltı yosunu, 1 Su | 95 |
| Çamur Ana muskası | Büyü | 1 Çamur Ana gözü, 2 Sazlı inci, 1 Semender derisi | 1.400 |

### 4 · Rüzgâr Mağarası (Kayalık Dağ · Sv 26)

Dağın içinde, rüzgârın uğuldayarak geçtiği soğuk bir mağara. Duvarlarda gümüş damarlar ve buz gibi kristaller, tavandan sarkan saçaklar.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kaya yarasası | saldırgan | 520 | 50 | 80 | 110 | uçar, 2–4'lü sürü | Kaya yarasası kanadı (%80) |
| Tavan örümceği | saldırgan | 700 | 58 | 56 | 130 | zehir | Tavan ağı 1–2 (%80) |
| Mağara vaşağı | saldırgan | 1.000 | 66 | 84 | 160 | kanama | Gri vaşak postu (%70) |

**Boss · Dağ Devi** (mor ışığın taşları birbirine yapıştırdığı dev; Mağara ayısı biçiminde): can 6.000, hasar 125, hız 36, XP 2.400; düşürdükleri: Dev yüreği (her zaman), Gümüş filizi 3–5.

**Toplanabilenler:** Gümüş filizi (parlar), Dağ kristali (parlar), Rüzgâr taşı, Kar likeni, Mağara mantarı.

**Yan görev · Dağcı Tuncay — "Dağ Devi"** (ipi kopmuş bir dağcı): Dağ Devi uyandı, tavandan kaya yağıyor, yol kapandı. **4 Gümüş filizi** ister, bir çan döver; çanın sesiyle dev çıkar, yen. Ödül: **1.000 sikke · 1.060 XP**.

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Gümüş filizi | toplanır / Dağ Devi | 52 | Gümüş çan |
| Dağ kristali | toplanır | 58 | Kristal kolye, Dev yüreği tılsımı |
| Rüzgâr taşı | toplanır | 42 | Ağ kapanı |
| Kar likeni | toplanır | 40 | Dev yüreği tılsımı |
| Kaya yarasası kanadı | Kaya yarasası | 104 | Kanat yelpazesi |
| Tavan ağı | Tavan örümceği | 112 | Gümüş çan, Ağ kapanı, Kristal kolye |
| Gri vaşak postu | Mağara vaşağı | 150 | – (satılır) |
| Dev yüreği | Dağ Devi | 1.300 | Dev yüreği tılsımı |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Gümüş çan | Müzik | 3 Gümüş filizi, 1 Tavan ağı | 440 |
| Ağ kapanı | Av ve hayvan | 3 Tavan ağı, 1 Rüzgâr taşı | 420 |
| Kristal kolye | Süs | 2 Dağ kristali, 1 Tavan ağı | 360 |
| Kanat yelpazesi | Süs | 3 Kaya yarasası kanadı, 2 Dal | 380 |
| Dev yüreği tılsımı | Büyü | 1 Dev yüreği, 2 Dağ kristali, 2 Kar likeni | 2.000 |

### 5 · Kor Mağarası (Kül Diyarı · Sv 34)

Kül Diyarı'nın altında, yarıklarından kor ışığı sızan sıcak bir mağara. Duvarlarda sarı kükürt, yerde volkan camı parçaları.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kor böceği | saldırgan | 1.300 | 92 | 34 | 220 | yanık | Kor kabuğu 1–2 (%80) |
| Lav yılanı | saldırgan | 1.100 | 105 | 60 | 240 | yanık | Lav yılanı pulu (%70) |
| Duman cini | saldırgan | 1.000 | 98 | 46 | 260 | uzaktan atar (190 menzil, 3 atış), yanık | Duman özü (%60) |

**Boss · Kor Kral** (ocakların ateşini yutan dev kertenkele): can 8.500, hasar 165, hız 38, XP 3.400, yakar; düşürdükleri: Kor Kral tacı (her zaman), Kor kabuğu 3–5.

**Toplanabilenler:** Kükürt kristali (parlar), Kor taşı (parlar), Kül mantarı, Volkan camı, Mağara mantarı.

**Yan görev · Ocakçı Alev — "Kor Kral"** (bir demircinin kızı): mor ışık babasının yüz yıllık ocağının ateşini mağaraya çekti, Kor Kral onu yuttu. **4 Kükürt kristali** ister, bir duman yakar; Kor Kral dumana gelir, yen. Ödül: **1.400 sikke · 1.800 XP**.

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Kükürt kristali | toplanır | 66 | Kükürt sarısı boya, Duman fişeği |
| Kor taşı | toplanır | 60 | Kor zurnası, Kor tacı tılsımı |
| Kül mantarı | toplanır | 54 | Duman fişeği |
| Volkan camı | toplanır | 74 | Volkan camı muska, Kor tacı tılsımı |
| Kor kabuğu | Kor böceği / Kor Kral | 160 | Kor zurnası |
| Lav yılanı pulu | Lav yılanı | 178 | Volkan camı muska |
| Duman özü | Duman cini | 196 | Duman fişeği |
| Kor Kral tacı | Kor Kral | 1.800 | Kor tacı tılsımı |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kükürt sarısı boya | Boya | 2 Kükürt kristali, 1 Su | 210 |
| Duman fişeği | Av ve hayvan | 1 Duman özü, 1 Kükürt kristali, 1 Kül mantarı | 420 |
| Kor zurnası | Müzik | 2 Kor kabuğu, 1 Kor taşı | 500 |
| Volkan camı muska | Süs | 2 Volkan camı, 1 Lav yılanı pulu | 540 |
| Kor tacı tılsımı | Büyü | 1 Kor Kral tacı, 2 Kor taşı, 1 Volkan camı | 2.800 |

### 6 · Ayna Mağarası (Mor Kristal Vadisi · Sv 42)

Vadinin altında, duvarları ayna gibi parlayan ama ışığı yutan bir mağara. Mor damarlar, yerde yıldız tozu gibi ışıltılar.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kristal yarasa | saldırgan | 1.200 | 135 | 86 | 330 | uçar, 2–4'lü sürü | Kristal kanat (%80) |
| Ayna örümceği | saldırgan | 1.500 | 160 | 58 | 380 | uzaktan atar (180 menzil, 3 atış), zehir | Ayna ipeği 1–2 (%80) |
| Gölge semenderi | saldırgan | 2.000 | 185 | 64 | 420 | kanama | Gölge pulu (%70) |

**Boss · Işık Yutan** (ışıkla beslenen, Kara ejder biçiminde dev bir gölge): can 12.000, hasar 250, hız 32, XP 5.000; düşürdükleri: Işık Yutan kalbi (her zaman), Mor damar taşı 3–5.

**Toplanabilenler:** Mor damar taşı (parlar), Işık sporu (parlar), Ayna taşı (parlar), Yıldız tozu (parlar), Mağara mantarı.

**Yan görev · Gökbilimci Nur — "Işık Yutan"** (mor ışığı inceleyen bir bilgin): mağara ışığı içiyor, dipteki Işık Yutan büyüdükçe vadinin kristalleri sönüyor. **4 Işık sporu** ister, fenerini doldurur; Işık Yutan ışığa gelir, yen. Ödül: **2.000 sikke · 2.580 XP**. Sonra Nur bir ipucu verir: mor ışık düştüğü yerde bir şey doğuruyor.

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Mor damar taşı | toplanır / Işık Yutan | 86 | Mor damar boyası, Işık Yutan kalbi tılsımı |
| Işık sporu | toplanır | 80 | Yıldız tozu yemi |
| Ayna taşı | toplanır | 90 | Kristal zil, Işık Yutan kalbi tılsımı |
| Yıldız tozu | toplanır | 90 | Yıldız tozu yemi |
| Kristal kanat | Kristal yarasa | 230 | Kristal zil |
| Ayna ipeği | Ayna örümceği | 250 | Gölge pulu muska |
| Gölge pulu | Gölge semenderi | 290 | Gölge pulu muska |
| Işık Yutan kalbi | Işık Yutan | 2.600 | Işık Yutan kalbi tılsımı |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kristal zil | Müzik | 2 Kristal kanat, 1 Ayna taşı | 700 |
| Mor damar boyası | Boya | 2 Mor damar taşı, 1 Su | 300 |
| Gölge pulu muska | Süs | 2 Gölge pulu, 1 Ayna ipeği | 860 |
| Yıldız tozu yemi | Av ve hayvan | 2 Yıldız tozu, 1 Işık sporu | 504 |
| Işık Yutan kalbi tılsımı | Büyü | 1 Işık Yutan kalbi, 2 Mor damar taşı, 2 Ayna taşı | 4.200 |

### Teknik not (mağaranın yeri)

Mağaranın içi adanın üstünde, kişilerden, ateşlerden ve yerlerden en az ~360 piksel uzak, ulaşılabilir kuru bir alana kurulur (bütün mağaralar aynı alanı paylaşır; aynı anda yalnızca birinin içinde olunur). İçerideyken o alanın ağaçları, toplanabilirleri, zemini ve havası gizlenir; altındaki su ya da ulaşılamayan yerler mağarada kaya duvar olur. Mağaradayken o alanın biyomu "keşfedilmiş" sayılmaz.


## Gemici Poyraz ve deniz

**Boğaç, 30 Ekim 2026:** Gemici Poyraz'ın eski işi tamamen kalktı. Kaçırılma hikâyesi yok; bu adayla bağı yok. Poyraz artık **gemisi olan bir gemici**: adaya kaza ile çarpar. Teknesini tamir edince seni denize, 6 farklı balık bölgesine götürür. Ana adanın **deniz kıyısında** balık tutulmaz (nehir ve göller eskisi gibi).

### Kalkanlar (eski Gemici Poyraz)

- İskeleye gelip giden tüccar gemisi, 10 dakikalık kalış, sipariş (ister, öder), tarif satışı, gemi sayacı (üstteki gemi rozeti) **kalktı**.
- Poyraz'ın 8 görevi (U1–U8) ve "Poyraz'ın ilk siparişi" otomatik görevi **kalktı**. Eski kayıtlarda yarım kalan bu görevler sessizce silinir; bitmişlerin ödülleri sende kalır.
- "Ada halkı" hikâyelerinden Poyraz'ın bölümü (yeğeni Deniz, iskeledeki fener) **kalktı**. Ada halkı artık görev veren 8 kişinin hikâyesi.
- İskele yerinde kalır (boş); oraya gemi gelmez.

### Kaza

- **Ne zaman:** **Olta**'yı ilk kez yaptıktan (ya da elinde Olta varken) sonraki **ilk sabah 06:00**'da. Saat 06:00'dan önce yaptıysan aynı sabah, sonra yaptıysan ertesi sabah. Eski kayıtta Olta zaten varsa ilk sabah.
- **Ne olur:** uzaktan büyük bir çatırtı ve gümbürtü sesi gelir ("GÜMMM!"). Uyuyorsan bu ses seni uyandırır. Ekranın ortasında duyuru çıkar: **"Uzak bir kıyıdan gürültü geldi"** · "Bir tekne karaya oturmuş olmalı". Kısa bildirim: "Haritada parlayan ! ile işaretlendi."
- **Yer:** Kemal'in kampından **uzak**, başka bir kıyı. Çayır ya da Orman'ın deniz kıyısında, Kemal'in kampına en uzak kumsal (kişilerden, ateşlerden, mağara girişlerinden uzak). Teknenin burnu kumsala oturmuş, kıçı suda.
- **Haritada:** Poyraz'la konuşana kadar o yerde **parlayan bir "!"** görünür (keşfedilmemiş yerde bile), dünyada da Poyraz'ın üstünde "!" yazar ve parlar. Konuşunca haritada Poyraz'ın simgesi belirir (adı: **Gemici Poyraz**); "!" ve parlama görev alınınca kalkar.

### Gemici Poyraz

- **Görünüş:** gri saçlı, beyaz sakallı, koyu lacivert kasketli yaşlı bir gemici; beyaz gömlek, lacivert yelek ve pantolon. Konuşma kutusundaki küçük resim de bu çizim.
- **İlk konuşma:** "Hey! Sağ mısın? Ben **Poyraz**, gemiciyim. Fırtına beni bu kıyıya fırlattı; teknem karaya oturdu, omurgası çatladı, yelkeni yırtıldı. Bu adayı hiç bilmem… Ama tekne yüzerse sana borcum olur." Seçenekler: "Nereden geliyorsun?", "Hoşça kal". Konuşma kapanınca ilk görevi gelir.
- Poyraz hep kaza yerinde durur; gitmez. Gece yanında küçük bir fener yanar (ışık sayılır, mor ışık oraya inmez; güvenli yer değildir).

### Tekne tamiri: 4 görev

Poyraz'ın görevleri ana görev sırasına girer (aynı anda tek ana görev). Poyraz'ın başında siyah ! çıkar, kart ve harita her zamanki gibi. Balık tutma görevi yoktur.

| # | Görev | İstenen | Açılma | Ödül |
|---|---|---|---|---|
| G1 | Çatlak omurga | Getir: 6 Çam odunu, 3 Uzun sopa | Poyraz karaya oturdu | 40 sikke · 25 XP |
| G2 | Yırtık yelken | Getir: 2 Halat, 6 Lif | G1 | 55 sikke · 35 XP |
| G3 | Su alan tekne | Getir: 3 Çam reçinesi, 4 Taş | G2 | 70 sikke · 45 XP |
| G4 | Kaptanın karnı | Getir: 2 Közlenmiş tavşan eti, 4 Böğürtlen (eskiden herhangi pişmiş et) | G3 | 90 sikke · 60 XP |

- **G4 bitince:** tekne onarılır. Ekran kısa bir an kararıp açılır; tekne artık suyun üstünde, dik direği ve beyaz yelkeniyle durur. Poyraz: "Bak hele! Yüzüyor! Sana bir borcum var evlat. Balığa çıkmak istersen bana gel; bu sulara açılırız. Nereye istersen." Duyuru: **"Deniz açıldı"** · "Poyraz'la denize çıkabilirsin".

### Denize açılmak

- Onarımdan sonra Poyraz'la konuşunca: **"Denize açılalım"** (ilk seçenek), "Balık defteri" (almanağın Deniz canlıları sayfası), "Hoşça kal".
- **Deniz haritası** açılır: ortada ada, çevresinde 6 balık bölgesi kartı. Her kartta bölgenin rengi, adı, istenen **seviye** ve **ekipman**, orada çıkan balıklar (tuttukların adıyla, tutmadıkların "?") ve durum:
  - **Git:** şartlar tamam; dokununca o bölgeye gidersin.
  - **Kilitli:** eksik olan yazılır ("Seviye 10 gerekli", "Makaralı olta gerekli"). Gidilemez.
  - **Sarı:** üstünde çalıştığın görev o bölgenin balığını istiyorsa kart **sarı kenarlı ve nabız gibi atar**, üstünde "Görev balığı burada" yazar.
- **Denizdeyken:** ekranı Poyraz'ın teknesi ve bölgenin denizi kaplar (her bölgenin suyu kendi renginde, dalgalar, balık gölgeleri). Sen ve Poyraz teknesindesiniz. Düğmeler: **Olta at** (E / Boşluk / dokun), **Deniz haritası** (başka bölgeye ya da adaya), **Adaya dön**. Adaya dönünce Poyraz'ın yanında belirirsin.
- **Zaman:** denizdeyken adada zaman akmaz (saat, tokluk, enerji, ateşler, ekinler durur); canavarlar sana ulaşamaz.
- **Balık tutma (denizde):** ana adadaki ile aynı kural. Olta at → şamandıra suda 2–6 sn bekle → "Vurdu!" çıkınca 1,05 sn içinde bas (iki kez kaçırırsan balık gider) → gidip gelen ibre **yeşil alandayken** bas. Kaçırırsan balık gider. Yeşil alanın genişliği en iyi deniz oltana göre (aşağıdaki tablo), zor balıklarda daralır. Her tutuşta en iyi deniz oltan 1 aşınır. Her atışta %5 çöp (Yosun). Tutulan balık envantere girer; +XP = 3 + fiyatının yarısı. Envanterde yer yoksa balık suya geri kaçar.

### 6 bölge

Ekipman sırası birikir: üst bir olta alttaki bölgelerin hepsinde de geçer. İstenen olta (ya da daha iyisi) envanterinde ya da kemerinde olmalı; elinde tutman gerekmez.

| # | Bölge | Su rengi | Seviye | Ekipman | Balıklar (ihtimal) |
|---|---|---|---|---|---|
| 1 | Kıyı Suları | turkuaz | 3 | Olta (ya da Ağ, Kemik zıpkın) | Hamsi %50, İstavrit %33, Tekir %17 |
| 2 | Rüzgârlı Körfez | açık mavi | 6 | Deniz oltası | Kefal %50, Çipura %33, Levrek %17 |
| 3 | Mercan Sığlığı | yeşil-mavi | 10 | Makaralı olta | Barbunya %50, İstiridye %33, Lüfer %17 |
| 4 | Derin Mavi | lacivert | 14 | Derin su oltası | Palamut %50, Mersin balığı %33, Kalkan %17 |
| 5 | Fırtına Denizi | gri-yeşil, köpüklü | 18 | Fırtına oltası | Kalamar %50, Kılıç balığı %33, Orkinos %17 |
| 6 | Mor Derinlik | mor, ışıltılı | 22 | Yıldız oltası | Ahtapot %50, Fener balığı %33, Işıl balığı %17 |

#### Deniz canlıları

Satış fiyatı Nazlı'nın pazarında. Zorluk yeşil alanı böler (1 = kolay). Çiğ yenince verdiği tokluk.

| Canlı | Bölge | Fiyat | Zorluk | Çiğ tokluk |
|---|---|---|---|---|
| Hamsi | 1 | 4 | 1 | 3 |
| İstavrit | 1 | 5 | 1,05 | 4 |
| Tekir | 1 | 8 | 1,15 | 4 |
| Kefal | 2 | 13 | 1,05 | 5 |
| Çipura | 2 | 17 | 1,15 | 5 |
| Levrek | 2 | 20 | 1,25 | 6 |
| Barbunya | 3 | 26 | 1,1 | 6 |
| İstiridye | 3 | 29 | 1,15 | 4 |
| Lüfer | 3 | 32 | 1,35 | 7 |
| Palamut | 4 | 45 | 1,2 | 7 |
| Mersin balığı | 4 | 12 (eski fiyatı) | 1,7 | 4 |
| Kalkan | 4 | 54 | 1,4 | 8 |
| Kalamar | 5 | 61 | 1,25 | 7 |
| Kılıç balığı | 5 | 91 | 1,45 | 9 |
| Orkinos | 5 | 124 | 1,6 | 10 |
| Ahtapot | 6 | 133 | 1,35 | 9 |
| Fener balığı | 6 | 162 | 1,55 | 10 |
| Işıl balığı | 6 | 225 | 1,75 | 12 |

- Satılır ve yenir; "herhangi balık" grubu yoktur. Yemek listesinde **Balıklar** sekmesinde.

#### Deniz oltaları (kazanda öğrenilir, kazanda yapılır)

| Olta | Malzeme | Bölgeler | Yeşil alan | Dayanıklılık |
|---|---|---|---|---|
| Olta (eski) | – | 1 | %27 | 25 |
| Deniz oltası | 1 Olta, 1 Halat, 2 Bakır külçesi, 1 Uzun sopa | 1–2 | %29 | 30 |
| Makaralı olta | 1 Deniz oltası, 2 Tunç külçesi, 1 Kenevir halatı, 2 Bataklık servisi kalası | 1–3 | %31 | 35 |
| Derin su oltası | 1 Makaralı olta, 3 Demir külçesi, 2 Kenevir halatı, 2 Huş katranı | 1–4 | %33 | 40 |
| Fırtına oltası | 1 Derin su oltası, 3 Gümüş külçesi, 2 Kenevir halatı, 2 Balık tutkalı | 1–5 | %35 | 45 |
| Yıldız oltası | 1 Fırtına oltası, 4 Ametist, 1 Kristal ipek kumaş, 2 Gümüş külçesi | 1–6 | %37 | 50 |

- Deniz oltaları nehirde de olta gibi kullanılır (yeşil alanları daha geniş). Ağ ve Kemik zıpkın yalnızca 1. bölgeye yeter.

#### Deniz tarifleri (kazanda öğrenilir)

| Tarif | Malzeme | Tür | Fiyat |
|---|---|---|---|
| Hamsi tava | 4 Hamsi, 1 Yabani buğday unu, 1 Ateş | Yiyecek | 52 |
| Tekir tava | 2 Tekir, 1 Yabani buğday unu, 1 Ateş | Yiyecek | 52 |
| İstavrit ızgara | 2 İstavrit, 1 Ateş | Yiyecek | 30 |
| Kefal pilakisi | 2 Kefal, 1 Su, 1 Ateş | Yiyecek | 65 |
| Çipura buğulama | 1 Çipura, 1 Su, 1 Ateş | Yiyecek | 59 |
| Levrek şiş | 1 Levrek, 2 Dal, 1 Ateş | Yiyecek | 65 |
| Barbunya tava | 2 Barbunya, 1 Yabani buğday unu, 1 Ateş | Yiyecek | 102 |
| İstiridye çorbası | 2 İstiridye, 2 Su, 1 Ateş | Yiyecek | 109 |
| Lüfer ızgara | 1 Lüfer, 1 Ateş | Yiyecek | 87 |
| Palamut buğulama | 1 Palamut, 1 Su, 1 Ateş | Yiyecek | 120 |
| Kalkan tava | 1 Kalkan, 1 Yabani buğday unu, 1 Ateş | Yiyecek | 144 |
| Kalamar tava | 2 Kalamar, 1 Yabani buğday unu, 1 Ateş | Yiyecek | 192 |
| Kılıç şiş | 1 Kılıç balığı, 2 Dal, 1 Ateş | Yiyecek | 228 |
| Orkinos biftek | 1 Orkinos, 1 Ateş | Yiyecek | 266 |
| Ahtapot salatası | 1 Ahtapot, 1 Su, 1 Ateş | Yiyecek | 304 |
| Işıl çorbası | 1 Işıl balığı, 1 Fener balığı, 2 Su, 1 Ateş | Yiyecek | 676 |

### Deniz görevleri (Poyraz'ın balık defteri)

Tekne onarılınca Poyraz'ın görev sırası devam eder: her bölge için bir balık isteği. Görev **ancak o bölgeye gidebiliyorsan** (seviye ve olta tamam) açılır. Görev alınınca kart ve ok önce seni **Poyraz'a** götürür ("Poyraz'la denize açıl: Kıyı Suları · haritada sarı"); Poyraz'ın deniz haritasında o bölge **sarı** işaretlidir. Balıkları tutup Poyraz'a getirirsin.

| # | Görev | İstenen | Açılma | Ödül |
|---|---|---|---|---|
| G5 | Kıyıdan ilk av | Getir: 4 Hamsi, 2 İstavrit | G4 · 1. bölgeye gidebilmek | 60 sikke · 40 XP |
| G6 | Körfezin çipurası | Getir: 2 Çipura, 2 Levrek | G5 · 2. bölge | 110 sikke · 70 XP |
| G7 | Mercan dibi | Getir: 2 Barbunya, 1 Lüfer | G6 · 3. bölge | 170 sikke · 110 XP |
| G8 | Derin mavinin kalkanı | Getir: 2 Palamut, 1 Kalkan | G7 · 4. bölge | 250 sikke · 160 XP |
| G9 | Fırtına avcısı | Getir: 2 Kalamar, 1 Kılıç balığı | G8 · 5. bölge | 360 sikke · 230 XP |
| G10 | Mor derinliğin ışığı | Getir: 1 Fener balığı, 1 Işıl balığı | G9 · 6. bölge | 520 sikke · 330 XP |

- **Genel kural (ileride eklenecek balık görevleri için de):** bir görev denizden çıkan bir canlı isterse, o canlının bölgesine gidebilene kadar görev açılmaz; alınınca yol Poyraz'ı gösterir, Poyraz'ın haritasında bölge sarıdır. Nehir balığı isteyen görevler (Nazlı'nın "Taze balık"ı) eskisi gibi nehirde yapılır.

### Almanak · Deniz canlıları

- Almanağın sol listesinde bölgelerin altında **"🌊 Deniz canlıları"** satırı (tekne onarılınca ya da ilk deniz canlısını tutunca). 6 bölge başlık başlık; her canlının kartı: resmi, adı, bölgesi, fiyatı, zorluğu, kaç tane tuttuğun, kullanıldığı tarifler. Tutmadıkların kapalı (siyah gölge, "???", "Henüz tutmadın"). Gidemediğin bölgenin başlığında kilit ve şartı yazar. Sayaç: "x / 18 deniz canlısı".

### Ana adada balık

- **Deniz kıyısında balık tutulmaz.** Açık denize (ada çevresindeki koyu su) olta atınca: "Bu derin suda kıyıdan balık tutulmaz. Poyraz'ın teknesiyle denize açıl." (Poyraz daha gelmediyse: "Kıyıdan açık denize olta yetmez; nehirleri ve gölleri dene.")
- **Nehir ve göller** eskisi gibi; listeler değişmedi, yalnızca eskiden yalnızca denizde çıkan **Tatlısu kefali** artık Çayır/Orman nehirlerinde çıkar (ağırlık 12). Mersin balığı Kül Diyarı / Mor Kristal Vadisi sularında ve 4. bölgede.
- **Balık kapanı** değişmedi (nehir listesi).


## Kişiler (tanıtımlar ve hikâyeler)

> **Kişilerin çevresi:** konuşulabilir her kişinin ~2 karo çevresinde yerde toplanabilir (taş, kum, çakıl, dal…) serpilmez ve yeniden çıkmaz; F önce yerdeki eşyayı aldığı için (Boğaç) kişiyle konuşma böyle engellenmez (ACT 1 › Adanın yerleşimi › Haritadaki miktarlar).


### İsimler

Kişilerin adları karakterlerine uysun diye 31 Ekim 2026'da değişti (Boğaç seçti). Pazarcı Nazlı, Savaşçı Börü ve Işıl aynı kaldı; cadılar, demirciler, zırhçılar ve kuzenleri kendi isimlendirme kurallarıyla durur; Yıldızsız Gezgin ve Işıkçı'nın adı yoktur. Belgenin her yerinde yeni adlar kullanılır. Eski kayıtlar etkilenmez (kayıtta kişi adı tutulmaz).

| Eski ad | Yeni ad |
|---|---|
| Yaşlı Ekin | Yaşlı Kemal |
| Çiftçi Hasan | Çiftçi Ekin |
| Usta Kemal | Usta Sinan |
| Marangoz Rıza | Marangoz Çınar (v3.39'da oyundan kaldırıldı; işi Usta Sinan'da) |
| Avcı Toygar | Avcı Doğan |
| Denizci Levent | Denizci Barbaros |
| Gemici Nuri | Gemici Poyraz |
| Gökbilimci Ülker | Gökbilimci Yıldız |
| Büyücü Pervin | Büyücü Efsun |
| Silahçı Tamer | Silahçı Tufan |
| Mühendis Selin | Mühendis Işın |
| Ejder Avcısı Alara | Ejder Avcısı Tomris |
| Astronot Tuna | Astronot Gökay |
| Elif | Mavi |
| Çoban Hüsnü | Çoban Davut |
| Güvercinci Kerem | Güvercinci Bulut |
| Mina | Ela |
| Şövalye Nadir Dede | Şövalye Kahraman Dede |
| Seyyar satıcı Sadık | Seyyar satıcı Bekir |
| Avcı Cemal | Avcı Kartal |
| Sabri | Hayali |
| Falcı Nermin | Falcı Kader |
| Saniye Teyze | Hatice Nine |
| Yolcu Haydar | Yolcu Yahya |
| Madenci Cevdet | Madenci Kaya |
| Kökçü Leyla | Kökçü Fidan |
| Hatice (ustanın kızı) | Zeynep |

### Yaşlı Kemal · ana görevler

Kumsalda seni bulan yaşlı denizci. Kampı uyandığın kumsalın hemen yanında, Çayır'ın güney kıyısında. Bir şey satmaz; ana görev zincirini verir. Bayılınca (gece mor ışıkla da) kampının hemen yanındaki kumsalda uyanırsın. Ana görevleri bitirdikçe kendi hikâyesini (kaybettiği eşi Saliha) anlatır. Her görev tesliminde %30 ihtimalle bir anın geri gelir.


### Cadı Zümrüt

**Yer:** Kemal'in kampının yaklaşık 29 karo kuzeyinde, ormanın kıyısında, kazanının başında. **Tanışma:** öğreticinin 3. adımı.

- **Kazan:** bütün ACT 1 tariflerini kazanda öğrenirsin. Kazan eşya yapmaz; malzemeyi alır, tarifi öğretir (Zor modda "Dene").
- **Bilmece:** bilinmeyen bir tarifi ipucuyla sorar; o tarifi öğrenince 30 + 2 × fiyat sikke (Bilmece yeteneğiyle iki katı) ve 20 XP. 2 günden eski bilmece yenilenir.
- **Anı:** 2 Mor kıymık verirsen ACT 1'in sıradaki anısını geri getirir (gün şartı yok; 22 anı da geldiyse bu seçenek çıkmaz).
- **Kuzenler:** "Kuzenlerin var mı?" diye sorulabilir; beş kuzen cadıyı (Yakut, Safir, Firuze, Mercan, İnci) sayar. Onların kazanları da bütün tarifleri öğretir, yalnızca rengi farklıdır.
- Hikâyesi: kız kardeşi Ayşen. Hikâyesi bitince kendi sahnesi ("Ay otları") yerine ailenin ortak sahnesi bekler (aşağıda "Zümrüt, Dursun ve Durmuş'un kuzenleri").



### Pazarcı Nazlı

**Yer:** Kemal'in yaklaşık 30 karo doğusu, 51 karo kuzeyi, Çayır'da tezgâhının başında. **Tanışma:** öğreticinin 9. adımı.

- **Her şeyi satın alır.** Fiyat sabittir, çok satmak düşürmez. "Aletler, zırhlar, eşyalar hariç hepsini sat" ve "Kazandaki açık tariflere yeteni bırak" ve "Bütün tariflere yeteni bırak" düğmeleri vardır (v3.33; Sistemler › Ekonomi).
- **Doğal malzeme ve tarifini öğrendiğin eşyaları satar:** doğal malzemeleri en az bir kez eline geçmişse; ayrıca **tarifini öğrendiğin her eşyayı** (Uzun sopa, İp, Sopa, yemekler…; yapılar, aletler, silahlar ve zırhlar hariç) değerinin **1,5 katına** satar (hiçbir zaman sana ödediği fiyatın altına inmez). Tohum ve tarla ürünü satmaz (tarlacılık şimdilik yok). Alış fiyatı malzemenin değerinin kabaca 2,6–5,6 katıdır (pahalı ve tehlikeli bölgelerin malzemesi daha pahalı). 1'li ya da 10'lu alınır.
- Satış fiyatın bütün yeteneklerle en çok temel fiyatın 2,3 katına çıkar.
- Hikâyesi: kardeşi Cem.



### Savaşçı Börü

**Yer:** Kemal'in yaklaşık 62 karo doğusu, 36 karo kuzeyi. **Tanışma:** öğreticinin 11. adımı (yumruk dersi, kerevit; ardından ücretsiz **atılma dersi** ve yetenek ağacında Koşu'yu gösterir — ayrıntı "Oyunun akışı → Börü'nün atılma dersi").

- Atılmayı bilmeyen (öğreticiyi geçmiş) biri konuşunca atılma dersini ücretsiz teklif eder.
- 100 sikkeyi ilk kez bulunca "Börü: Koşu'yu alma vakti" bildirimi gelir (Koşu henüz alınmadıysa).

- "Kılıç nasıl yapılır?" → **Taş kılıç** tarifini yazar (1 Sopa + 4 Keskin taş + 2 İp + 1 Çakmaktaşı; Dursun döver).
- **Dövüş dersleri** (sikkeyle; ayrıntılar "Sistemler › Dövüş" bölümünde). Bir ders açılınca bir kez duyuru gelir. Öğrenilmiş dersler ücretsiz tekrar çalışılabilir. Ders sırasında Börü'den 280 pikselden uzağa gidersen oyun durur ve "Derse dön / Dersi bırak" diye sorar; "Derse dön" seni Börü'nün ~140 piksel yakınına koyar, bırakırsan ücret geri verilir.
- Hikâyesi: ağabeyi Kaan.


### Demirci Dursun

**Yer:** Kemal'in yaklaşık 70 karo doğusu, 71 karo kuzeyi; ocak ve örs. **Tanışma:** öğreticinin 13. adımı (Börü'nün selamıyla).

- **Çekiç:** örse yaklaşık **1,1 saniyede bir** vurur (0,9 vuruş/sn). Her vuruşta kıvılcım çıkar; 110 px yakınındaysan ve menü/konuşma açık değilse çınlama sesi gelir. Silahçı kuzenleri de aynı hızda döver.

- **Alet dök:** yalnızca **Çayır malzemesiyle** yapılan aletleri ve silahları döver (kademe 0): taş, çakmaktaşı ve tunç baltalar/kazmalar/mızraklar/kılıçlar, bıçaklar, meşale, tırmık, tırpan, sulama kabı, balık kapanı, tuzak, sapan, olta, ağ… Granit, demir, kuvars, bazalt, obsidyen ve o biyomların malzemesiyle yapılanları **silahçı kuzenleri** döver. Tarif kazanda öğrenilmiş, parçalar çantanda olmalı. İşçilik fiyatın %15'i. Elinde olan bir aleti ikinci kez dövmez.
- **Aletimi bile:** körelen aleti yeniler (ücret: bkz. Sistemler › Aletler, dayanıklılık, kademe).
- Alet satmaz. Zırh için kardeşi Durmuş'a yollar. "Kuzenlerin var mı?" diye sorulunca beş silahçı kuzenini (Durdu, Ali, Kaya, Turan, Kudret) ve hangisinin neyi dövdüğünü anlatır.
- Hikâyesi: babası Demirhan Usta. Kendi sahnesi ("Gökten düşen taş") yerine ailenin ortak sahnesi oynar.



### Zırhçı Durmuş

**Yer:** Dursun'un hemen yanında, ikinci örs. **Tanışma:** öğretici bitince.

- Kademe 0 zırhları döver: Tunç miğfer, zırh, eldiven, çizme ve ACT 2 malzemeleriyle yapılan Fırtına tüyü başlık, Mantar lifi eldiven, Hurda çizme, Kristal miğfer, Ejder pulu eldiven, Meka çizme. Demir zırhları Bataklık'taki kuzeni **Zırhçı Veli**, Ejder zırhıı Kül Diyarı'ndaki **Zırhçı Tufan** (ya da üstü) döver. İşçilik %15.
- "Kuzenlerin var mı?" diye sorulunca beş zırhçı kuzenini (Duran, Veli, Kayhan, Tufan, Kuvvet) sayar.
- Hikâyesi: babası Demirhan Usta (Dursun'la aynı). Kendi sahnesi ("Kumsaldaki çekiç") yerine ailenin ortak sahnesi oynar.
- Deri, kürk ve kemik zırhlar elle yapılır (Tab).



### Zümrüt, Dursun ve Durmuş'un kuzenleri

Çayır dışındaki her ACT 1 biyomunda bir **aile ocağı** vardır: bir **cadı** (kazancı), bir **silahçı** ve bir **zırhçı**. On beşi de Cadı Zümrüt, Demirci Dursun ve Zırhçı Durmuş'un kuzenidir; hepsi **Elmas Nine**'nin torunlarıdır. ACT 2'de kuzen yoktur (mor ışığın ACT 2'de kaçırdığı bir akrabaları yok).

- **Görünüş:** cadılar Zümrüt'le, silahçılar Dursun'la, zırhçılar Durmuş'la **birebir aynıdır** (ten, saç, sakal/bıyık, şapka, önlük, çekiç tutuşu, portre). Yalnızca **adları farklıdır**. Her biyomun silahçısıyla zırhçısı kardeştir (yan yana çalışırlar) ve Dursun/Durmuş gibi birbirine benzeyen adlar taşır.
- **Örs sesi:** Dursun'un ve kuzen demircilerin çekiç sesi yalnızca oyun sürerken, 110 piksel yakınlarındayken duyulur; ana menüye dönünce (arkada dünya çizilmeye devam etse de) susar. Önceden demircinin yanında ana menüye dönülünce örs sesi menüde de çalmaya devam ediyordu.
- **Fark nerede:** cadıların **kazanındaki sıvının rengi** (adlarındaki değerli taşın rengi), demircilerin ise **çalışma yeri**: ocak, örs, çekiç ve askılar biyomdan biyoma daha iyi görünür (tablolar aşağıda). Renk farkı yalnız kazanda vardır; demircilerin hiçbir rengi değişmez.
- **Yer:** orijinaldeki gibi **dip dibe değiller**. Her biyomda iki kardeş demirci (silahçı + zırhçı) Dursun ile Durmuş gibi **aynı ocakta yan yana** çalışır; cadı ve kazanı ise **aynı biyomun başka bir köşesinde**, demircilerden uzakta yaşar (aralarında en az 200 piksel, aranan noktalar 70–120 karo ayrı). Yerler oyun açılırken bulunur: tabloda yazan noktaya en yakın, tamamı o biyomun yürünebilir toprağı olan açık alan (demirciler için 15 × 7, cadı için 9 × 7 karo) ve başka kişilere, köprüye, kaya yığınına en az 200 piksel uzak. Oradaki ağaçlar ve toplanabilirler kaldırılır. Keşfedilince haritada simgeleriyle (Zümrüt, Dursun, Durmuş simgesi) ve adlarıyla görünürler; haritada dokununca ok onları gösterir.
- **Ateş kuralı:** her kuzenin yanında **kendi kamp ateşi** yanar (cadının solunda, silahçının ve zırhçının sağ önünde). Kişilerin ateşleri gibi gece ışık verir ve çevresi (120 piksel) güvenlidir: saldırganlar uzaklaşır, mor ışık inmez. Kazanın altındaki ateş ve silahçının ocağı ayrıca ışık sayılır.
- **İlk konuşma:** kuzene ilk kez F ile yaklaşınca sırtı dönük ona, **bir önceki biyomdaki kuzeninin adıyla seslenirsin** (ör. Orman'daki cadıya "Zümrüt? Senin burada ne işin var?"). O da "Zümrüt mü?! Çayır'daki kuzenim Zümrüt'le tanışmışsın demek. Ben o değilim…" diye **kendini tanıtır**, kuzen olduklarını söyler ve **biraz kibirle** önceki kuzenini küçümseyip kendisinin daha iyi bir cadı/silahçı/zırhçı olduğunu anlatır. Önceki biyomun kuzeniyle henüz tanışmadıysan, tanıdığın en yakın önceki kuzenin adıyla seslenirsin (hiçbiri değilse Çayır'dakinin). "Kuzen misiniz gerçekten?" sorusuna Elmas Nine'den söz ederler.
- **İlk tanışmada** silahçı ve zırhçı kendine özel eşyaların tariflerini kitabına yazar ("Tarifi kitabında" bildirimi).
- **Konuşma menüsü:** cadı: Tarif öğren · "Kazanın neden …?" · görev/hikâye satırları · Hoşça kal. Silahçı: Silah dök · Aletimi bile · Ne dövebilirsin? · … Zırhçı: Zırh döv · Ne dövebilirsin? · … Konuşmalarındaki rastgele satırlar hep bir önceki kuzene laf sokar. Zümrüt, Dursun ve Durmuş'a da "Kuzenlerin var mı?" diye sorulabilir; kuzenlerini adlarıyla ve biyomlarıyla sayarlar.

#### Aileler

| Biyom | Cadı (kazan rengi) | Silahçı | Zırhçı | Cadının aranan noktası (karo) | Demircilerin aranan noktası (karo) |
|---|---|---|---|---|---|
| Çayır (eski) | Cadı Zümrüt (yeşil) | Demirci Dursun | Zırhçı Durmuş | – | – |
| Orman | Cadı Yakut (kırmızı, `#d8283a`) | Silahçı Durdu | Zırhçı Duran | 60, 75 | 175, 170 |
| Bataklık | Cadı Safir (mavi, `#2a5ad8`) | Silahçı Ali | Zırhçı Veli | 300, 40 | 330, 120 |
| Kayalık Dağ | Cadı Firuze (turkuaz, `#2ec4b6`) | Silahçı Kaya | Zırhçı Kayhan | 390, 420 | 290, 300 |
| Kül Diyarı | Cadı Mercan (mercan, `#ff6f5e`) | Silahçı Turan | Zırhçı Tufan | 600, 420 | 520, 330 |
| Mor Kristal Vadisi | Cadı İnci (inci beyazı, `#efe9f7`) | Silahçı Kudret | Zırhçı Kuvvet | 600, 50 | 520, 120 |

#### Kazancılar

Kuzen cadıların kazanı **Zümrüt'ün kazanıyla aynı mantıkta** çalışır: bütün ACT 1 tarifleri öğrenilir (Zor modda "Deneyerek bul" da), kazan eşya yapmaz, malzemeyi alıp tarifi öğretir (+12 XP). Kazan panelinin başlığında cadının adı yazar. Değişen tek şey sıvının ve buharın rengidir; cadının elindeki kepçeden sıçrayan damlalar da o renktedir. Zümrüt'ün bilmecesi ve anı geri getirmesi yalnızca Zümrüt'e özeldir.

#### Silahçılar ve zırhçılar: kademe kuralı

Örs kademesi kuralının tamamı: bkz. Sistemler › Üretim ve ekonomi › Tarifler: kazan, el yapımı, örs, ustalar (Örs).

- İşçilik ve bileme ücreti: bkz. Sistemler › Üretim ve ekonomi › Ekonomi. Silahçılar **Aletimi bile** de yapar.

| Kademe | Silahçı | Zırhçı | Dövülen (o kademenin eşyaları; alttakiler de dövülür) |
|---|---|---|---|
| 0 · Çayır | Demirci Dursun | Zırhçı Durmuş | Silah/balta/kazma (Ağ, Balık kapanı, Bola, Dokuma tezgâhı, Kemik zıpkın, Kürek, Meşale, Olta, Sapan, Sulama kabı, Tuzak, Tırmık, Tırpan, kazıyıcı, Çekiç taşı artık elle yapılır, bkz. Aletler · Nerede yapılır): Çam yayı, Boynuz kazma, Mızrak, Taş balta, Taş bıçak, Taş kazma, Taş kılıç, Tunç balta, Tunç savaş çekici, Tunç kazma, Tunç kılıç, Tunç mızrak, Tunç topuz, Bakır balta, Bakır savaş çekici, Bakır kazma, Bakır kılıç, Bakır mızrak, Bakır topuz, Tuzak, Tırmık, Tırpan, Çakmaktaşı balta, Çakmaktaşı bıçak, Çakmaktaşı kazma, Çakmaktaşı kazıyıcı, Çakmaktaşı mızrak, Çekiç taşı. Zırh: Bakır çizme, Bakır eldiven, Bakır miğfer, Bakır zırh, Ejder pulu eldiven, Fırtına tüyü başlık, Hurda çizme, Kristal miğfer, Mantar lifi eldiven, Meka çizme, Tunç eldiven, Tunç miğfer, Tunç zırh, Tunç çizme |
| 1 · Orman | Silahçı Durdu | Zırhçı Duran | Alet/silah: Meşe yayı, Bileği taşı, Granit balta, Granit savaş çekici, Granit kazma, Kemik iğne, Kirmen, Öğütme taşı. Zırh: Ceviz kabuğu miğfer, Meşe kabuk zırh |
| 2 · Bataklık | Silahçı Ali | Zırhçı Veli | Alet/silah: Kızılağaç yayı, Demir balta, Demir savaş çekici, Demir kazma, Demir kılıç, Demir mızrak, Demir topuz, Dişbudak yayı, Pişirme taşı, Timsah dişi kılıcı. Zırh: Demir eldiven, Demir miğfer, Demir zırh, Demir çizme, Timsah pulu zırh |
| 3 · Kayalık Dağ | Silahçı Kaya | Zırhçı Kayhan | Alet/silah: Akçaağaç yayı, Gümüş kılıç, Kuvars balta, Kuvars bıçak, Kuvars kazma, Kuvars kazıyıcı, Kuvars mızrak, Pirit çakmağı, Porsuk yayı, Çelik balta, Çelik savaş çekici, Çelik kazma, Çelik kılıç, Çelik mızrak, Çelik topuz. Zırh: Gümüş pullu zırh, Kartal tüyü miğfer, Çelik çizme, Çelik eldiven, Çelik miğfer, Çelik zırh |
| 4 · Kül Diyarı | Silahçı Turan | Zırhçı Tufan | Alet/silah: Ejder kılıcı, Ejder savaş çekici, Ejder topuzu, Ejder mızrağı, Ejder yayı, Ejder baltası, Ejder kazması, Kızıl sedir yayı, Bazalt bıçak, Bazalt kazıyıcı, Ejder kılıcı, Obsidyen balta, Obsidyen bıçak, Obsidyen kazma, Obsidyen kazıyıcı, Obsidyen mızrak, Taş havan, Kara çelik balta, Kara çelik savaş çekici, Kara çelik kazma, Kara çelik kılıç, Kara çelik mızrak, Kara çelik topuz. Zırh: Ejder miğferi, Ejder eldiveni, Ejder çizmesi, Ejder zırhı, Kara çelik çizme, Kara çelik eldiven, Kara çelik miğfer, Kara çelik zırh |
| 5 · Mor Kristal Vadisi | Silahçı Kudret | Zırhçı Kuvvet | Alet/silah: Gece ağacı yayı, Ametist kılıcı, Mor kristal balta, Mor kristal savaş çekici, Mor kristal kazma, Mor kristal kılıç, Mor kristal mızrak, Mor kristal topuz. Zırh: Işık pulu eldiven, Kristal ipek zırh, Mor kristal çizme, Mor kristal eldiven, Mor kristal miğfer, Mor kristal zırh |

#### Çalışma yerleri (görsel fark)

| Biyom | Silahçının ocağı ve örsü | Zırhçının örsü |
|---|---|---|
| Çayır (Dursun, Durmuş) | Gri taş ocak, küçük örs, küçük çekiç | Küçük örs, üstünde miğfer, askıda zincir zırh |
| Orman | Granit taşından ocak, kalın meşe kirişli baca; bir boy büyük örs, çelik başlı çekiç, yanında iki kılıçlık silah askısı. | Bir boy büyük örs, ahşap askıda demir çemberli kalkan ve miğfer. |
| Bataklık | Ocağın yanında deri körük ve su verme fıçısı; demir örs, koyu demir başlı ağır çekiç, askıda üç silah. | Demir örs, perçin tezgâhı ve tepeden tırnağa demir zırh giydirilmiş manken. |
| Kayalık Dağ | Taş ocağın ağzında gümüş kuşak; gümüş boynuzlu iri örs, gümüş bilezikli çekiç, dönen kuvars bileği çarkı. | Gümüş boynuzlu örs, iki askı: tüylü miğfer ve gümüş pullu zırh; gümüş bilezikli çekiç. |
| Kül Diyarı | Bazalttan ocak, içinde lav döner; kor gibi yanan yazılı kara örs, ucu kızgın balyoz, havada kıvılcımlar. | Kor yazılı kara örs, dikişleri kor gibi parlayan pullu zırh mankeni, ucu kızgın balyoz. |
| Mor Kristal Vadisi | Obsidyen ocakta mor kristal alev; ametist kakmalı obsidyen örs, başı parlayan ametist çekiç, havada süzülen kristal kıymıklar. | Ametist kakmalı obsidyen örs, ışıltılı kristal zırh mankeni, havada süzülen kristal kıymıklar. |

Çekiçler de kademeyle büyür: başı her biyomda biraz daha iri ve parlaktır; Kül Diyarı'nda ucu kızgın bir balyoz, Mor Kristal Vadisi'nde başı mor parlayan bir ametist çekiç olur. Çekiç örse inince sıçrayan kıvılcımların rengi de değişir (gümüş, kızıl, mor).

#### Kuzenlere özel silahlar ve zırhlar

Hepsi kazanda öğrenilir (tarifi tanışınca kitaba yazılır) ve yalnızca o biyomun ya da daha ilerideki biyomun demircisi döver.

| Eşya | Tür | Değer | Malzemeler | Döven | Fiyat |
|---|---|---|---|---|---|
| Granit savaş çekici | Kılıç (silah) | 27 hasar · 100 kullanım | 4 Granit, 1 Meşe sapı, 3 Yaban domuzu dişi, 1 Sinir kirişi | Silahçı Durdu (Orman) ve üstü | 112 |
| Meşe kabuk zırh | Zırh · Gövde | +30 savunma · direnç: kanama %15 | 6 Meşe odunu, 2 Deri parçası, 6 Kirpi dikeni, 2 Sinir | Zırhçı Duran (Orman) ve üstü | 543 |
| Ceviz kabuğu miğfer | Zırh · Baş | +15 savunma | 6 Ceviz, 2 Meşe odunu, 1 Deri parçası, 2 İri diken, 2 Taş | Zırhçı Duran (Orman) ve üstü | 280 |
| Timsah dişi kılıcı | Kılıç (silah) | 38 hasar · 140 kullanım | 4 Demir külçesi, 3 Timsah dişi, 1 Bataklık servisi sapı, 1 Deri parçası | Silahçı Ali (Bataklık) ve üstü | 1.011 |
| Timsah pulu zırh | Zırh · Gövde | +46 savunma · direnç: kanama %40, metal | 6 Demir cevheri, 3 Timsah derisi, 2 Bataklık kurdu postu, 2 Sinir | Zırhçı Veli (Bataklık) ve üstü | 1.177 |
| Gümüş kılıç | Kılıç (silah) | 44 hasar · 160 kullanım | 4 Gümüş külçesi, 3 Kuvars, 1 Ardıç sapı, 2 Kartal pençesi | Silahçı Kaya (Kayalık Dağ) ve üstü | 472 |
| Gümüş pullu zırh | Zırh · Gövde | +52 savunma · direnç: kanama %35, metal | 6 Gümüş cevheri, 3 Demir cevheri, 2 Deri parçası, 2 Ayı pençesi | Zırhçı Kayhan (Kayalık Dağ) ve üstü | 1.396 |
| Kartal tüyü miğfer | Zırh · Baş | +24 savunma · metal | 6 Kartal tüyü, 2 Gümüş cevheri, 2 Öküz boynuzu, 1 Deri parçası, 2 Taş | Zırhçı Kayhan (Kayalık Dağ) ve üstü | 435 |
| Ametist kılıcı | Kılıç (silah) | 58 hasar · 240 kullanım | 5 Ametist, 3 Obsidyen, 2 Kristal, 1 Işık ağacı sapı, 2 Gölge dişi | Silahçı Kudret (Mor Kristal Vadisi) ve üstü | 763 |
| Kristal ipek zırh | Zırh · Gövde | +72 savunma · direnç: kanama %25, yanık %25, zehir %25 | 5 Kristal ipek, 3 Ametist, 6 Demir cevheri, 2 Deri parçası | Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü | 2.554 |
| Işık pulu eldiven | Zırh · El | +18 savunma · direnç: zehir %35 | 4 Işık pulu, 2 Kristal, 1 Deri parçası, 3 Lif | Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü | 1.000 |

#### Hikâyeler ve ailenin sahnesi

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


### Çiftçi Ekin

**v3.43 (6 Kasım 2026, Boğaç):** genç bir çiftçi kız (turuncu saçlı, hasır şapkalı, yeşil elbiseli). Küçük **Bereket Adası**'nda doğup büyümüş; bir fırtınada salıyla Yıldızsız Ada'ya düşmüş, Çayır'da toprağı eşeleyip bir sebze köşesi kurmuş. Güler yüzlü, elleri hep toprak, konuşurken bitkilere "bebeğim" der. İlk görevinden sonra adasına dönmeye kalkar, akıntı onu Mor Kristal kıyısına atar; Barbaros onu adasına götürür, oradan sonra Ekin'in çiftliği ziyaret edilir. Görevleri: ACT 1 · "Çiftçi Ekin". Konuşma resmi kendisidir.

### Usta Sinan

**Yer:** Orman'da (2. biyom), tezgâhı ve kereste yığınının başında. **Tanışma:** her zaman; ilk konuşmada **Hasır yatak** hediye eder.

- **v3.39 (Boğaç): Marangoz Çınar ile birleşti.** Çınar oyundan kaldırıldı; onun işleri, ev ve barınak satışı dahil, Sinan'dadır. Görevleri 16'dan 8'e indi (ACT 1 › Ana görevler › Usta Sinan).
- Yere kurulan yapıları (Yapılar kategorisi; **Çit** artık el yapımıdır, Sinan yapmaz; üs kurmanın **Direk feneri**ni Sinan yapar: Sistemler › Üs kurma), yatakları ve **ev eşyalarını** (evin içine konur) yapar. Tarif kazanda öğrenilmiş, malzeme çantanda olmalı. İşçilik: bkz. Sistemler › Ekonomi. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **Ev ve barınak yapar** (sikkeyle; konuşmada "Ev ve barınak siparişi"): Yaprak barınağından Konak'a 8 ev. Yaprak barınağı dışındaki evlerde uyumak için içine yatak konmalıdır. Fiyatlar için "Evler ve barınaklar" tablosuna bak. Yaprak barınağı görevi açıkken malzemeler (8 Dal, 12 Yaprak, 4 Lif) çantandaysa konuşma doğrudan ev listesini açar. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **Atölye:** yere kurulur, seçtiğin bir tarifi 25 saniyede bir kendiliğinden üretir (en çok 50 tane biriktirir).
- Hikâyesi: kızı Zeynep (parçaları 8 görevine eşit aralıklarla dağılır).



### Avcı Doğan

**Yer:** Bataklık'ta, köprünün doğu ucundan yaklaşık 26 karo doğuda, kulübesinin yanında. **Tanışma:** köprüyü onarıp karşıya geçince.

- İlk konuşmada **Kamış çizme** (6 Kamış + 3 İp + 2 Yosun, el yapımı; bataklık çamurunda yavaşlamayı önler) ve **Panzehir** (3 Bataklık otu + 1 Zehir bezesi + 2 Su) tariflerini yazar.
- Demir madeni, Kara ejder ve mor ışık hakkında bilgi verir; eşinin kaçırılışını gördüğünü anlatır.
- Hikâyesi: oğlu Ayaz.



### Yıldızsız Gezgin, Yıldızsız Işıkçı

Takvime bağlı gezginler; ne zaman geldikleri ve ne yaptıkları "Oyun akışı › Gezginler ve takvim" tablosunda.



### Denizci Barbaros

**Yer:** Gemi tarifini öğrenince Mor Kristal Vadisi kıyısına düşen enkazın başında. ACT 2'de seni indirdiği kıyıda bekler. Kızı Meltem'i kaybetmiştir; yeni gemiye onun adını verir.



Son görev (Yeni bir gemi) bitince Barbaros'la konuş: hikâye sahnesi, ardından "Götür beni" → deniz yolculuğu (yaklaşık 14 sn) → **ACT 2**.


> **usta setleri:** her biyomun silahçısı ve zırhçısı kendi biyomunun usta setini döver (Aletler · Bütün setler). Yukarıdaki listelere ek olarak: Orman — Granit kılıç, Granit topuz, Granit mızrak, Ihlamur yayı, Meşe kabuk eldiven ve çizme; Bataklık — Timsah dişi savaş çekici, topuz, mızrak, balta, kazma, Söğüt yayı, Timsah miğfer, Timsah eldiven, Kamış çizme; Kayalık Dağ — Kuvars savaş çekici ve topuz, Huş yayı, Gümüş eldiven ve çizme; Mor Kristal Vadisi — Ametist savaş çekici ve topuz, Işık ağacı yayı, Ametist miğfer, Kristal ipek çizme, Obsidyen balta, kazma ve mızrak (artık Kudret döver); Çayır — Çakmaktaşı kılıç, savaş çekici ve topuz, Kemik yay (Kemik eldiven ve çizme elle yapılır).

### Nazlı'nın kuzenleri

Çayır'dan sonraki her biyomda Nazlı'nın bir kuzeni pazar kurar. **Nazlı'yla tıpatıp aynıdır**, yalnızca başındaki **yemeninin rengi** farklıdır; tezgâhının tentesi de o renktedir. Yeri: o biyomun demirci–zırhçı ocağının yanında (110–260 piksel ötede, kendi biyomunun kuru toprağında). Haritada pazar simgesiyle görünür.

| Biyom | Kuzen | Yemeni | Görevler (sırayla; ilki biyom keşfedilince açılır) |
|---|---|---|---|
| Orman | Pazarcı Fidan | yeşil | NF1 Mantar tezgâhı (4 Tavuk mantarı, 3 Mağara mantarı · 90 sikke, 60 XP) → NF2 Fındık zamanı (6 Fındık, 4 Kanlıca · 120, 80) → NF3 Karaca kürkü (3 Karaca derisi, 4 Ahududu · 150, 110) |
| Bataklık | Pazarcı Nilüfer | su yeşili | NN1 Nilüfer çiçeği (5 Nilüfer, 3 Su kestanesi · 140, 100) → NN2 Ördek pazarı (4 Ördek yumurtası, 6 Ördek tüyü · 170, 130) → NN3 Su samuru (2 Su samuru derisi, 6 Kızılcık · 200, 160) |
| Kayalık Dağ | Pazarcı Kardelen | kar beyazı | NK1 Dağ çayı (4 Dağ çayı, 4 Kekik · 200, 150) → NK2 Kardelen buketi (3 Kardelen, 4 Lavanta · 240, 190) → NK3 Kartal tüyü (4 Kartal tüyü, 3 Dağ keçisi derisi · 280, 230) |
| Kül Diyarı | Pazarcı Lale | kırmızı | NL1 Ateş biberi (4 Ateş biberi, 3 Ateş çiçeği · 300, 250) → NL2 Kehribar (5 Kehribar, 3 Kara tuz · 350, 300) → NL3 Kül kurdu (2 Kül kurdu postu, 3 Kül dişi · 420, 360) |
| Mor Kristal Vadisi | Pazarcı Menekşe | pembe | NM1 Ay otu (3 Ay otu, 3 Mor yosun · 450, 400) → NM2 Işık mantarı (4 Işık mantarı, 3 Gece zambağı · 520, 460) → NM3 Işık tilkisi (2 Işık tilkisi postu, 3 Kristal · 600, 540) |

- **Satış aynı:** kuzenin yanında Nazlı'nın pazarı açılır (aynı satış ve satın alma listeleri, aynı fiyatlar, toplu satış düğmeleri, envanterde "1 sat"). Pencere başlığında kuzenin adı yazar.
- **Tanışma:** ilk konuşmada "tıpatıp Nazlı, yalnızca yemenisi …" der, kendini tanıtır; tanışmadan önce başında yemeni renginde ünlem durur.
- **Görevler basittir:** hepsi o biyomun doğal malzemesini getirmektir (toplanan ya da avlanan); görev sistemi diğer kuzenlerinkiyle aynıdır (bir anda tek görev).
- **Konuşma resmi:** Nazlı'nın yüzü, kuzenin yemenisiyle.


# ACT 2 · İkinci ada

## Geçiş ve portallar

- **İlk geçiş deniz yoluyla olur.** ACT 1'in sonunda Denizci Barbaros'un "Yeni bir gemi" görevi bitince gemiyle ikinci adaya açılırsın. Barbaros seni karaya çıkardığı kıyıda bekler.
- **Gökbilimci Yıldız** iniş yerinin biraz kuzeyinde, Yüzen Kayalar'da yüksek bir kayanın üstündedir. Teleskobu ve **ACT 2 kazanı** onun yanındadır: ikinci adanın bütün tarifleri burada öğrenilir (birinci adadaki Zümrüt'ün kazanıyla aynı çalışır).
- **Portallar:** ikinci adaya ilk varışta **Barbaros'un yanındaki portal** ve birinci adada **Kemal'in yanındaki portal** açılır. Yıldız'ın üç görevi bitince ("Portal çekirdeği" ile) bütün portallar açılır. Birinci adada **her kişinin yanında** bir portal belirir (Kemal, Zümrüt, Nazlı, Dursun, Ekin, Sinan, Börü, Doğan): kişinin sağ yanında, ama hiçbir zaman kazanın, örsün, tezgâhın önünde ya da **Ekin'in tarlasının içinde** değil (tarla parsellerine en az 26 piksel uzak). İkinci adada iki portal vardır: **Yıldız'ın yanında** ve **Barbaros'un yanında**. Portaldan geçmek ücretsizdir; geçiş kaydeder, sayfayı yeniden yükler ve öbür adayı hazırlar.
- **İkinci adada birinci adanın kişileri yoktur.** Satış (Nazlı), alet bileme ve örs (Dursun, Durmuş), ev işleri (Usta Sinan) ve tarla için portaldan birinci adaya dönülür. Envanter ve sikke ortak olduğu için bir sorun çıkmaz.
- **İkinci adanın yerleşimi (yonca ada):** ada **yonca** biçimindedir (ızgara 790 × 568 karo, kara ~268.000 karo, v3.44); altı biyom eşit büyüklükte (her biri ~44.700 karo) ve zincir halinde sıralanır, her biyom yalnızca öncekine ve sonrakine değer: **Yüzen Kayalar** (güneybatı yaprağı, iniş yeri) → **Dev Mantar Ormanı** (batı) → *büyük nehir, köprü* → **Hurda Çölü** (kuzey) → **Kristal Golem Ocağı** (kuzeydoğu) → *sıradağ, kaya yığını* → **Ejder Volkanı** (doğu) → **Gök Rıhtımı** (güneydoğu yaprağı, adanın en uzak ucu). İki alt yaprağın arasında denizden bir körfez girer.
- **Engeller birinci adadaki gibidir:** Dev Mantar Ormanı ile Hurda Çölü arasında kıyıdan kıyıya bir **büyük nehir** ve üstünde **üç kırık köprü** (bir ana köprü, iki kısayol), Kristal Golem Ocağı ile Ejder Volkanı arasında kıyıdan kıyıya bir **sıradağ** ve tek geçidinde bir **kaya yığını** vardır. Kurallar aynıdır: her köprü ayrı ayrı **20 odunla** onarılır, kısayollar ana köprüden sonra; kaya yığını **2 Kaya patlatıcı** ve kuvars ya da daha iyi bir kazmayla patlatılır, patlayınca bütün sıradağ çöker. Odun ve patlatıcı yoksa portaldan birinci adaya dönülür. Köprülerin ve kaya yığınının durumu iki adada **ayrı ayrı** tutulur (birinci adada onardığın köprü ikinci adadakini onarmaz).
- Canavarlar çok güçlüdür (ACT 2 canavarları ACT 1'in en güçlülerinden de güçlüdür, aşağıdaki tablolara bak).

## Mor mana, asalar ve ateşli silahlar

**Mor mana** ikinci adada (ya da ilk mana iksirini içince) açılan yeni bir çubuktur.

- En çok mana: **100 + 3 × (seviye − 1)**. Kendiliğinden saniyede yaklaşık **1,5** dolar (Canlılık yemek etkisiyle 1,5 katı); **elde bir asa varken saniyede +8** daha.
- **Mana iksiri** içince +60 mana. Tarifi Efsun'un ilk görevinden sonra kitaba yazılır; Efsun 10 sikkeye yapar.
- **Asa** bir alettir: alet yuvasına konur, ele alınır; saldırı tuşu (sol tık / Boşluk / Vur düğmesi) büyüyü fırlatır, en yakın düşmana nişan alır.

| Silah | Kim yapar | Bir atış | Hasar | Bekleme | Menzil | Özel etki |
|---|---|---|---|---|---|---|
| Ateş asası ² | Büyücü Efsun (100 sikke) | 8 mana | 42 (+%3 / seviye) | 0,55 sn | 270 | yanık |
| Buz asası ² | Büyücü Efsun (200 sikke) | 10 mana | 46 (+%3 / seviye) | 0,7 sn | 280 | 3 sn dondurur (reislerde yarısı) |
| Yıldırım asası ² | Büyücü Efsun (300 sikke) | 15 mana | 72 (+%3 / seviye) | 0,8 sn | 300 | 3 kez sıçrar, her sıçramada %80 hasar |
| Tabanca ² | Silahçı Tufan (200 sikke) | 1 Tabanca mermisi | 44 | 0,42 sn | 340 | düz atış |
| Pompalı ² | Silahçı Tufan (400 sikke) | 1 Pompalı fişeği | 5 saçma × 24 | 1,05 sn | 210 | yelpaze |
| Işın kılıcı ² | Ejder Avcısı Tomris (800 sikke) | – | 60 (yakın dövüş) | – | kılıç | körelmez |

- **Mermi:** Tabanca mermisi (1 Pirinç külçesi + 1 Barut) bir yapımda **10 tane**, Pompalı fişeği (1 Pirinç külçesi + 2 Barut) bir yapımda **6 tane** çıkar. İkisi de el yapımıdır (Tab).
- **Meka zırh** ² (Mühendis Işın, 600 sikke): gövde yuvası, **+90 savunma**, zehir/yanık/kanama hasarının yarısını tutar.
- Asalar, silahlar ve ışın kılıcı körelmez (dayanıklılık 999).

## ACT 2 ustaları nasıl çalışır

- **Liste düzeni:** ustaların listelerinde ad solda, düğmeler sağdadır (Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni).

Bütün ACT 2 ustaları aynı kuralla çalışır:

1. Ustanın görevini yaparsın → tarif **kitabına yazılır** (oyunda "Tarifi kitabında" bildirimi çıkar).
2. Tarifi **Yıldız'ın kazanında öğrenirsin** (malzemeleri kazana at, "Öğren").
3. Malzemeleri çantana koyup ustayla konuşursun → "✦ … yap (N sikke)" seçeneği. ✦ = her şey hazır, · = bir eksik var. Usta malzemeyi ve işçilik ücretini alır, eşyayı verir.

| Usta | Nerede | Yaptıkları | Tarifleri hangi görev açar |
|---|---|---|---|
| Gökbilimci Yıldız | Yüzen Kayalar, inişin kuzeyinde yüksek kaya | ACT 2 kazanı (tarif öğretir), portallar | — |
| Büyücü Efsun | Dev Mantar Ormanı (inişe en yakın mantar ormanı köşesi) | Ateş/Buz/Yıldırım asası, Mana iksiri | Mana iksiri: pv1 · Ateş asası: pv3 · Buz asası: pv4 · Yıldırım asası: pv5 |
| Silahçı Tufan | Hurda Çölü | Tabanca, Pompalı | Pirinç külçesi + Barut: sl1 · Tabanca + mermi: sl3 · Pompalı + fişek: sl4 |
| Mühendis Işın | Kristal Golem Ocağı | Meka zırh | Kobalt/Titanyum külçesi + Enerji hücresi: mk1 · Meka zırh: mk3 |
| Ejder Avcısı Tomris | Ejder Volkanı | Işın kılıcı | Plazma hücresi: ej1 · Işın kılıcı: ej3 |
| Astronot Gökay | Gök Rıhtımı (adanın en uzak ucu) | Roket gövdesi, Roket motoru, Roket | Meteor demiri + Yıldız külçesi: as1 · Roket parçaları: as4 |

## ACT 2'nin akışı

1. Gemiyle in, **Yıldız** ile tanış (bütün ACT 2 kişileri haritada simgeleriyle görünür). Yıldız'ın 3 görevi: teleskobun ayağı (4 kalas + 2 halat), bir gece gözlem, portal çekirdeği (2 Kristal + 2 Demir levha + 2 Mor kıymık; bunlar birinci adadan). Bitince portallar açılır ve ilk ACT 2 anısı ("Sahildeki ışık") gelir.
2. **Efsun** (Dev Mantar Ormanı): mor mana ve ilk asa. 5 görev; 4. ve 5. görevi Işın ve Tomris ile tanışınca açılır.
3. **Tufan** (Hurda Çölü): tabanca ve pompalı. 4 görev.
4. **Işın** (Kristal Golem Ocağı): meka zırh. 3 görev.
5. **Tomris** (Ejder Volkanı): ışın kılıcı. 4 görev; sonuncusu **Kızıl ejder** (9.360 canlı).
6. **Gökay** (Gök Rıhtımı): 5 görev; göktaşları, uzaylı dronları, gölge muhafızlar, **Gök bekçisi** ve **Roket**. Roket bitince Gökay ile konuşup **Fırlat!** → fırlatma sahnesi → mor gemi → eşinle kavuşma → son kartı ("Yeniden birliktesiniz. Hikâye ACT 3 ile devam edecek."). **Kolla oynayana:** bu oturumda oyun kolu kullanıldıysa son kartta bir satır daha çıkar: *"Astronot Gökay'dan kolla oynayanlara bir sır: ana menüde Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A."* (hile kodu; Sistemler › Arena, hileler, kayıt › Hileler). Klavye ve dokunmatikle oynayan bu satırı görmez. Son karttan sonra oyuna devam edebilirsin; Gökay'dan yeniden fırlatılabilir.

Ustaların görevleri bittikçe eşinin **ACT 2 anıları** sırayla geri gelir: Sahildeki ışık (gk3), Yıldızsız yolcular (pv3), Şapka (sl4), Mor gemi (mk3), Son söz (ej4).

**Mor ışığın anıları:** ACT 1'den çıkarılan mor ışıklı 5 anı (Yıldız haritası silindi; Mor bir delik, Mektup, Son akşam, Bırakılan el, Mor fısıltı) ikinci adada bu sırayla gelir: uyurken %40, bayılınca %60, görev bitince %30. Şimdilik böyle; ACT 2 hikâyesi ayrıca değerlendirilecek (Sistemler › İzler ve anılar).


## Biyomlar

> **Not:** ikinci adada da harita aynı kuralla seyreltilir (ACT 1 › Adanın yerleşimi › Haritadaki miktarlar); **ağaçlar da** iki adada ortak kuralla iki adımda seyreltilir: önce %50, sonra kalanın %25'i (toplam ~%62,5; 7 Kasım 2026, Boğaç: ağaçlar belirgin azalsın). İkinci adada **5.822** ağaç vardır (v3.57 ölçümü; biyom başına: ACT 1 › Adanın yerleşimi › Haritadaki miktarlar). Bu bölümdeki "Adadaki sayısı" sütunları v3.45 yeni oyun ölçümüdür.

### Yüzen Kayalar — Güvenli

İniş yeri. Havada duran kayalar, bulut koyunları, rüzgâr kuşları. Gökbilimci Yıldız ve ACT 2 kazanı burada. Gece gök tazıları çıkar.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Gök söğüdü | Gök söğüdü odunu | 16 | – | 1. kademe (Taş balta) |
| Rüzgâr meşesi | Rüzgâr meşesi odunu | 18 | – | 1. kademe (Taş balta) |
| Bulut çamı | Bulut çamı odunu | 14 | – | 1. kademe (Taş balta) |
| Bulut elması | Bulut elması odunu | 16 | Bulut elması | 1. kademe (Taş balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Bulut pamuğu | 12 | 62 | 45 sn sonra yeniden çıkar |
| Gök kumu | 10 | 65 | 60 sn sonra yeniden çıkar |
| Gök mantarı | 34 | 57 | 60 sn sonra yeniden çıkar, çiğ yenir (+25 tokluk) |
| Gök otu | 14 | 56 | 50 sn sonra yeniden çıkar |
| Rüzgâr çiçeği | 16 | 62 | 55 sn sonra yeniden çıkar |
| Rüzgâr kristali | 40 | 49 | 110 sn sonra yeniden çıkar |
| Tüy yosunu | 10 | 63 | 45 sn sonra yeniden çıkar |
| Yüzer taş | 30 | 68 | 90 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Bulut kuvarsı | 34 | 2. kademe (Çakmaktaşı/Granit kazma) | 33 | 300 sn sonra yeniden çıkar |
| Gök demiri | 30 | 2. kademe (Çakmaktaşı/Granit kazma) | 33 | 300 sn sonra yeniden çıkar |
| Hafif taş | 12 | 1. kademe (Taş kazma) | 33 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Bulut koyunu | nötr | 1.200 | 216 | 40 | 116 | sürü 2–4 | Bulut koyunu eti %100; Bulut yünü %90 ×1–3 |
| Rüzgâr kuşu | zararsız | 20 | – | 70 | 15 | uçar | Rüzgâr tüyü %100 ×1–3; Rüzgâr kuşu eti %80 |
| Kaya kertenkelesi | nötr | 1.200 | 216 | 50 | 114 | – | Kertenkele pulu %90 ×1–2; Kertenkele eti %80 |
| Gök tazısı | saldırgan | 2.940 | 427 | 110 | 450 | gece, kanama etkisi, sürü 2–3 | Gök tazısı postu %85; Tazı dişi %60 ×1–2 |
| Fırtına kartalı | saldırgan | 2.570 | 477 | 100 | 515 | uçar | Fırtına tüyü %90 ×1–3; Kartal pençesi %50 ×1–2 |

### Dev Mantar Ormanı — Güvenli

Dev mantarlar ve spor ağaçları. Goblinler grup halinde gezer, okçuları uzaktan atar, şamanları zehirler. Büyücü Efsun burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Mavi mantar | Mavi mantar odunu | 22 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Spor ağacı | Spor ağacı odunu | 24 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Dev mantar | Dev mantar odunu | 20 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Kök ağacı | Kök ağacı odunu | 20 | Goblin eriği | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Büyü otu | 26 | 60 | 70 sn sonra yeniden çıkar |
| Dev spor | 28 | 62 | 80 sn sonra yeniden çıkar |
| Goblin otu | 12 | 60 | 50 sn sonra yeniden çıkar |
| Işıldak mantarı | 20 | 64 | 60 sn sonra yeniden çıkar |
| Kök yumrusu | 29 | 61 | 50 sn sonra yeniden çıkar, çiğ yenir (+29 tokluk) |
| Mantar şapkası | 33 | 63 | 55 sn sonra yeniden çıkar, çiğ yenir (+28 tokluk) |
| Spor tozu | 14 | 65 | 50 sn sonra yeniden çıkar |
| Sümük yosunu | 14 | 57 | 55 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Goblin bakırı | 16 | 1. kademe (Taş kazma) | 33 | 300 sn sonra yeniden çıkar |
| Kök taşı | 12 | 1. kademe (Taş kazma) | 33 | 300 sn sonra yeniden çıkar |
| Spor kristali | 40 | 2. kademe (Çakmaktaşı/Granit kazma) | 33 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Mantar böceği | zararsız | 40 | – | 30 | 17 | – | Böcek kabuğu %90 ×1–2; Spor tozu %100 ×1–2 |
| Spor salyangozu | nötr | 1.280 | 232 | 18 | 97 | – | Salyangoz sümüğü %90 ×1–2 |
| Goblin | saldırgan | 2.580 | 343 | 80 | 364 | sürü 2–4 | Goblin kulağı %80; Goblin bıçağı %40 |
| Goblin okçusu | saldırgan | 2.005 | 286 | 70 | 409 | uzaktan atar (200 menzil, 1 atış) | Goblin oku %80 ×1–3; Goblin kulağı %60 |
| Goblin şamanı | saldırgan | 3.725 | 477 | 60 | 727 | uzaktan atar (210 menzil, 3 atış), zehir etkisi | Şaman tüyü %60 ×1–2; Büyü otu %80 ×1–2 |
| Mantar geyiği | nötr | 1.800 | 330 | 62 | 152 | – | Geyik eti %100 ×1–2; Geyik derisi %80; Geyik boynuzu %40; Sinir %50 ×1–2; Kemik %50 ×1–2; Hayvan yağı %30 |

### Hurda Çölü — Tehlikeli

Geminin düşürdüğü dronların hurda çölü. Devriye robotları, lazer dronları ve dev bir hurda devi. Silahçı Tufan burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Pas ağacı | Pas ağacı odunu | 24 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Hurda palmiyesi | Hurda palmiyesi odunu | 22 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Kuru çınar | Kuru çınar odunu | 24 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Hurma | Hurma odunu | 22 | Hurma | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Bakır tel | 14 | 67 | 55 sn sonra yeniden çıkar |
| Çöl otu | 8 | 67 | 45 sn sonra yeniden çıkar |
| Eski devre | 30 | 57 | 90 sn sonra yeniden çıkar |
| Hurda parçası | 10 | 60 | 45 sn sonra yeniden çıkar |
| Kaktüs meyvesi | 12 | 52 | 60 sn sonra yeniden çıkar |
| Pas tozu | 8 | 55 | 45 sn sonra yeniden çıkar |
| Vida | 8 | 67 | 50 sn sonra yeniden çıkar |
| Yağ birikintisi | 14 | 66 | 70 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Barut kayası | 22 | 2. kademe (Çakmaktaşı/Granit kazma) | 30 | 300 sn sonra yeniden çıkar |
| Hurda yığını | 10 | 1. kademe (Taş kazma) | 30 | 300 sn sonra yeniden çıkar |
| Pirinç cevheri | 24 | 2. kademe (Çakmaktaşı/Granit kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Pas böceği | zararsız | 50 | – | 34 | 19 | – | Dişli %90 ×1–2; Pas tozu %100 ×1–2 |
| Hurda faresi | nötr | 1.320 | 311 | 70 | 96 | – | Bakır tel %80 ×1–2; Vida %90 ×1–3 |
| Devriye robotu | saldırgan | 2.080 | 445 | 70 | 428 | sürü 1–2 | Robot çekirdeği %70; Dişli %90 ×1–3 |
| Lazer dronu | saldırgan | 1.300 | 355 | 90 | 458 | uçar, uzaktan atar (220 menzil, 1 atış) | Lens %60; Pil %70 |
| Hurda devi | saldırgan | 5.940 | 1.038 | 34 | 1.282 | – | Motor %80; Ağır plaka %90 ×1–2 |
| Pas kirpisi | nötr | 1.300 | 260 | 30 | 130 | uzaktan atar (140 menzil, 3 atış) | Kirpi dikeni %100 ×2–4; Kemik %30 |

### Kristal Golem Ocağı — Tehlikeli

Kristal kayalıklar. Golemcikler, kristal yarasaları ve büyük golem. Mühendis Işın burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kristal çam | Kristal çam odunu | 30 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Taş ağacı | Taş ağacı odunu | 30 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Mavi sedir | Mavi sedir odunu | 32 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Kristal armut | Kristal armut odunu | 28 | Kristal armut | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Buz kristali | 36 | 59 | 90 sn sonra yeniden çıkar |
| Enerji taşı | 44 | 65 | 100 sn sonra yeniden çıkar |
| Golem tozu | 14 | 58 | 50 sn sonra yeniden çıkar |
| Gümüş kum | 14 | 65 | 60 sn sonra yeniden çıkar |
| Kaya çiçeği | 20 | 62 | 60 sn sonra yeniden çıkar |
| Kristal lifi | 18 | 58 | 60 sn sonra yeniden çıkar |
| Kristal mantarı | 24 | 73 | 70 sn sonra yeniden çıkar |
| Mavi yosun | 14 | 60 | 50 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Kobalt cevheri | 44 | 3. kademe (Kuvars/Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Kristal cevheri | 34 | 2. kademe (Çakmaktaşı/Granit kazma) | 30 | 300 sn sonra yeniden çıkar |
| Titanyum cevheri | 52 | 3. kademe (Kuvars/Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Taş kaplumbağası | nötr | 1.680 | 630 | 16 | 108 | – | Taş kabuk %90 |
| Buz tavşanı | zararsız | 30 | – | 66 | 17 | – | Buz tavşanı eti %100; Buz kürkü %80 |
| Kristal golemcik | saldırgan | 2.520 | 983 | 46 | 499 | sürü 1–2 | Golem parçası %90 ×1–3; Enerji taşı %40 |
| Kristal yarasası | saldırgan | 1.470 | 771 | 120 | 488 | uçar, kanama etkisi | Kristal kanat %80 ×1–2 |
| Büyük golem | saldırgan | 7.560 | 2.524 | 28 | 1.490 | – | Golem çekirdeği %70; Titanyum plaka %90 ×1–2 |
| Buz karacası | nötr | 2.600 | 760 | 66 | 184 | – | Karaca eti %100 ×1–2; Karaca derisi %80; Kemik %50; Sinir %40 |

### Ejder Volkanı — Ölümcül

Kızıl volkan. Yavru ejderler ateş tükürür, lav golemleri yakar; kızıl ejder adanın en güçlü canavarlarından. Ejder Avcısı Tomris burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Kömür ağacı | Kömür ağacı odunu | 34 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Lav palmiyesi | Lav palmiyesi odunu | 34 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Obsidyen dikeni | Obsidyen dikeni odunu | 38 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Ejder meyvesi | Ejder meyvesi odunu | 32 | Ejder meyvesi | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ejder otu | 28 | 67 | 70 sn sonra yeniden çıkar |
| Kor mantarı | 26 | 61 | 70 sn sonra yeniden çıkar |
| Kükürt tozu | 18 | 59 | 55 sn sonra yeniden çıkar |
| Lav çiçeği | 30 | 63 | 70 sn sonra yeniden çıkar |
| Magma camı | 44 | 62 | 100 sn sonra yeniden çıkar |
| Obsidyen kırığı | 30 | 60 | 80 sn sonra yeniden çıkar |
| Plazma taşı | 60 | 53 | 120 sn sonra yeniden çıkar |
| Volkan külü | 10 | 62 | 45 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Ejder kristali | 70 | 3. kademe (Kuvars/Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Magma cevheri | 56 | 3. kademe (Kuvars/Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Volkan demiri | 40 | 2. kademe (Çakmaktaşı/Granit kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Lav salyangozu | zararsız | 80 | – | 16 | 29 | – | Magma kabuğu %90 |
| Kor kertenkelesi | nötr | 2.080 | 538 | 60 | 142 | – | Kor kertenkelesi eti %100; Kor pulu %80 ×1–2 |
| Yavru ejder | saldırgan | 1.820 | 588 | 80 | 583 | uzaktan atar (210 menzil, 3 atış), yanık etkisi | Ejder dişi %70 ×1–2; Yavru ejder pulu %90 ×1–3 |
| Lav golemi | saldırgan | 3.130 | 848 | 36 | 716 | yanık etkisi | Magma çekirdeği %70; Magma cevheri %90 ×1–3 |
| Kızıl ejder | saldırgan | 9.360 | 1.355 | 60 | 2.508 | uzaktan atar (260 menzil, 5 atış), yanık etkisi | Ejder kalbi %100; Kızıl ejder pulu %100 ×2–4 |
| Kor domuzu | nötr | 3.000 | 640 | 50 | 197 | – | Yaban domuzu eti %100 ×1–2; Yaban domuzu derisi %70; Yaban domuzu dişi %45; Kemik %50 ×1–2; Hayvan yağı %40 |

### Gök Rıhtımı — Çok ölümcül

Adanın en uzak ucu, roket rampası. Uzaylı dronları, gölge muhafızlar ve dev Gök bekçisi. Astronot Gökay burada.

**Ağaçlar**

| Ağaç | Verdiği odun | Odun fiyatı | Meyve | Gereken balta |
|---|---|---|---|---|
| Gök kamışı | Gök kamışı odunu | 40 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Bulut kavağı | Bulut kavağı odunu | 40 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Yıldız akasyası | Yıldız akasyası odunu | 44 | – | 2. kademe (Çakmaktaşı/Granit balta) |
| Gök üzümü | Gök üzümü odunu | 38 | Gök üzümü | 2. kademe (Çakmaktaşı/Granit balta) |

**Toplanabilirler** (F ile, elde alet gerekmez)

| Eşya | Fiyat | Adadaki sayısı | Not |
|---|---|---|---|
| Ay çiçeği | 28 | 62 | 70 sn sonra yeniden çıkar |
| Bulut özü | 26 | 58 | 70 sn sonra yeniden çıkar |
| Füzyon taşı | 80 | 61 | 140 sn sonra yeniden çıkar |
| Göktaşı tozu | 24 | 48 | 60 sn sonra yeniden çıkar |
| Gök camı parçası | 36 | 61 | 90 sn sonra yeniden çıkar |
| Gök ipeği | 30 | 63 | 70 sn sonra yeniden çıkar |
| Meteor parçası | 50 | 59 | 110 sn sonra yeniden çıkar |
| Yıldız mantarı | 30 | 60 | 80 sn sonra yeniden çıkar |

**Madenler** (kazma elde, F)

| Maden | Fiyat | Gereken kazma | Adadaki sayısı | Not |
|---|---|---|---|---|
| Gök camı | 60 | 3. kademe (Kuvars/Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Meteor demiri | 70 | 3. kademe (Kuvars/Tunç kazma) | 30 | 300 sn sonra yeniden çıkar |
| Yıldız cevheri | 110 | 4. kademe (Bazalt/Demir kazma) | 30 | 300 sn sonra yeniden çıkar |

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri (ihtimal) |
|---|---|---|---|---|---|---|---|
| Gök medüzü | zararsız | 60 | – | 24 | 29 | uçar | Medüz jölesi %90 ×1–2 |
| Yıldız tilkisi | nötr | 2.160 | 707 | 84 | 173 | – | Yıldız tilkisi postu %80; Yıldız tilkisi eti %100 |
| Uzaylı dronu | saldırgan | 1.890 | 774 | 96 | 714 | uçar, uzaktan atar (240 menzil, 1 atış) | Uzaylı devresi %70; Mor çekirdek %40 |
| Gölge muhafız | saldırgan | 2.965 | 1.173 | 74 | 914 | kanama etkisi, sürü 1–2 | Muhafız zırhı parçası %80 ×1–2; Mor çekirdek %50 |
| Gök bekçisi | saldırgan | 9.720 | 1.756 | 40 | 3.360 | uzaktan atar (280 menzil, 5 atış) | Yakıt hücresi %100; Uzaylı devresi %100 ×2–4 |
| Yıldız geyiği | nötr | 3.000 | 850 | 62 | 197 | – | Geyik eti %100 ×1–2; Geyik derisi %80; Geyik boynuzu %40; Sinir %50 ×1–2; Kemik %50 ×1–2; Hayvan yağı %30 |


## Kişiler ve görevler

ACT 2'nin bütün kişileri ikinci adaya vardığın andan itibaren yerindedir ve konuşulabilir. Görev zincirleri onlarla tanışınca açılır. Ok ve görev kartı şu sırayı önerir: Yıldız → Efsun → Tufan → Işın → Tomris → Gökay. Efsun'un 4. ve 5. görevleri Işın ve Tomris ile tanışmayı bekler. ACT 2 görevlerinin ödülleri ACT 1'dekilerin kabaca on katıdır.

### Gökbilimci Yıldız

Yüzen Kayalar'da, inişin kuzeyindeki yüksek bir kayada, teleskobunun başında; ACT 2 kazanı yanındadır. Kırk yıldır gökyüzünü ve mor ışığı izler; portalı o icat etmiştir. Son görevi portalları açar ve ilk ACT 2 anısını (Sahildeki ışık) getirir.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Teleskobun ayağı | Getir: 4 Bulut çamı kalası, 2 Halat | – | 300 | 300 |
| 2 | Bir gece gözlem | Bir gece bekle (gün değişsin) | – | 250 | 350 |
| 3 | Portal çekirdeği | Getir: 2 Kristal, 2 Demir levha, 2 Mor kıymık | – | 500 | 650 |


### Büyücü Efsun · Dev Mantar Ormanı

İnişe en yakın mantar ormanı köşesinde, havada asılı mor bir ateşin başında. Onunla tanışınca **mor mana** çubuğu açılır. Asaları ve mana iksirini yapar (ücretler ve değerler ACT 2 girişindeki tabloda). Goblinler gruplar halinde gezer; şamanları zehir atar.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Büyü otları | Getir: 5 Büyü otu, 3 Işıldak mantarı | – | 350 | 375 |
| 2 | Goblin baskını | Avla: 4 Goblin | – | 500 | 550 |
| 3 | Asanın kalbi | Getir: 3 Spor kristali, 3 Goblin kulağı | – | 600 | 750 |
| 4 | Buzun dili | Getir: 4 Buz kristali, 2 Kristal kanat | Mühendis Işın ile tanış | 700 | 800 |
| 5 | Gökten yıldırım | Getir: 3 Ejder kristali, 1 Magma çekirdeği | Ejder Avcısı Tomris ile tanış | 900 | 1.050 |


Açtığı tarifler: Mana iksiri (1. görev), Ateş asası (3.), Buz asası (4.), Yıldırım asası (5.).

### Silahçı Tufan · Hurda Çölü

Geminin düşürdüğü dronların (robotların) dolaştığı hurda çölünde. Tabanca (200 sikke) ve Pompalı (400 sikke) yapar; mermiyi sen elle yaparsın.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Hurda toplama | Getir: 8 Hurda parçası, 4 Bakır tel | – | 400 | 450 |
| 2 | Devriye | Avla: 3 Devriye robotu | – | 600 | 650 |
| 3 | Robotun kalbi | Getir: 2 Robot çekirdeği, 4 Barut | – | 700 | 750 |
| 4 | Devin motoru | Getir: 1 Motor, 2 Ağır plaka | – | 900 | 950 |


Açtığı tarifler: Pirinç külçesi ve Barut (1. görev), Tabanca ve Tabanca mermisi (3.), Pompalı ve Pompalı fişeği (4.). "Devin motoru" görevindeki Motor, Hurda devi'nden düşer.

### Mühendis Işın · Kristal Golem Ocağı

Adanın güney ortasındaki kayalıklarda. **Meka zırh** yapar (600 sikke): gövde yuvası, +90 savunma, canı %25 artırır, hareketi %12 hızlandırır, zehir/yanık/kanama hasarının yarısını tutar.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Enerji taşları | Getir: 3 Enerji taşı, 4 Kristal cevheri | – | 600 | 650 |
| 2 | Golemcikler | Avla: 3 Kristal golemcik | – | 800 | 850 |
| 3 | Zırhın iskeleti | Getir: 2 Titanyum plaka, 4 Golem parçası | – | 1.000 | 1.100 |


Açtığı tarifler: Kobalt külçesi, Titanyum külçesi, Enerji hücresi (1. görev), Meka zırh (3.).

### Ejder Avcısı Tomris · Ejder Volkanı

Adanın doğusundaki volkanda. Ejderhalar geminin volkana döktüğü plazmayla büyümüş. **Işın kılıcı** yapar (800 sikke).

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Lav çiçekleri | Getir: 5 Lav çiçeği, 3 Magma cevheri | – | 800 | 900 |
| 2 | Yavrular | Avla: 3 Yavru ejder | – | 1.000 | 1.100 |
| 3 | Kılıcın kenarı | Getir: 3 Ejder dişi, 3 Plazma taşı | – | 1.200 | 1.300 |
| 4 | Kızıl ejder | Avla: 1 Kızıl ejder | – | 2.000 | 2.250 |


Açtığı tarifler: Plazma hücresi (1. görev), Işın kılıcı (3.). Son görevdeki **Kızıl ejder** ACT 2'nin en güçlü ikinci canavarıdır.

### Astronot Gökay · Gök Rıhtımı

Adanın en uzak ucunda, yarım kalmış bir fırlatma rampasının başında. Sevdiği Nehir'i uzaylılarla savaşırken kaybetmiş, onu gemiden geri almak istiyor. Roketin parçalarını o yapar: Roket gövdesi 1.000, Roket motoru 1.500, Roket 2.000 sikke.

| # | Görev | İstenen | Açılma şartı | Sikke | XP |
|---|---|---|---|---|---|
| 1 | Göktaşları | Getir: 4 Meteor parçası, 3 Gök camı | – | 1.000 | 1.250 |
| 2 | Dronlar | Avla: 4 Uzaylı dronu | – | 1.200 | 1.500 |
| 3 | Muhafızlar | Avla: 3 Gölge muhafız | – | 1.500 | 1.750 |
| 4 | Gök bekçisi | Avla: 1 Gök bekçisi | – | 2.500 | 3.000 |
| 5 | Roket | Getir: 1 Roket | – | 0 | 5.000 |


Açtığı tarifler: Meteor demiri külçesi ve Yıldız külçesi (1. görev), Roket gövdesi, Roket motoru ve Roket (4.). Son görevde roketi teslim edince Gökay'la konuşup **Fırlat!** de: fırlatma sahnesi → mor gemi → kavuşma → son kartı. "Gökyüzüne" ve "Yeniden birlikte" başarımları burada gelir. Kolla oynayana son kartta Gökay hile kodunu verir (ACT 2'ye giriş › Gökay).


# ACT 3 ve sonrası (henüz oyunda değil)

Bunlar Boğaç'la konuşulmuş kararlar; oyuna eklenmedi.

- **ACT 3:** yıldızsızların mor ışıklı gemisi. Oyun büyük bir uzaylı boss savaşıyla biter. Uzaya Astronot Gökay ile çıkılır; Barbaros'un ACT 3 ile bağı yok.
- **Köpekler:** robot köpeklerin gözlerindeki kameralarla yıldızsızlar seni baştan beri izliyormuş.
- **Şapka:** yıldızsızlar şapkayı bedeninden bilgi ve anı çalmak için kullanıyor; hafıza kaybının sebebi bu. Karakter yaratırken şapka seçtiysen içine metal bir şey yerleştiriyorlar, seçmediysen başına bir şapka geçiriyorlar ("Şapka" anısı).
- **Eş:** ikinci adaya hiç uğramadı; ilk ada yakınında kaçırıldı.
- **Kötü son:** "Yalnız dönüş" başarımı var ama kötü sonun kendisi henüz yazılmadı.
- **Planlanan gizli başarım (Boğaç, 28 Ekim 2026):** tanrı modu açıkken mor ışığa yakalanıp bayılmak gizli bir başarım olacak (adı ve simgesi henüz seçilmedi). Mor ışığın tanrı modunu da delmesi bilinçli bir tasarım kararıdır; "düzeltilmez".

## ACT 3 fikir notları (6 Kasım 2026, Boğaç; ACT 3'e geçince konuşulacak)

Bunlar karar değil, not: ACT 3 tasarlanırken Boğaç'la yeniden ele alınacak. Hiçbiri şimdilik oyuna eklenmez.

- **Köpek kamerası kayıtları (Boğaç: "kesin eklicez"):** yıldızsızların gemisinde bir oda; duvarda robot köpeklerin "kayıtları" oynar. Uydurma değil, kayıttaki **gerçek verilerden** kurulur: ör. "Gün 12, 03:14 · KÖPEK-02 · Denek Zümrüt'ün kazanına 5 kez çöp attı.", "Gün 23 · Denek 50 kez yumrukla Börü'ye saldırdı. Sebep anlaşılamadı.", "Denek 14 kez karanlıkta bayıldı. Her seferinde onu kumsala biz bıraktık." Bunun için ACT 1–2'de oyuncunun yaptıkları (bayılmalar, gizli şeyler, önemli anlar, gün ve saatleriyle) şimdiden kayda yazılmaya başlanabilir. **Ön hazırlık fikri:** ACT 1–2'de çok nadiren, yarım saniye ekran köpeğin gözünden görünür (balık gözü, köşede "● REC KÖPEK-03"), hiç açıklanmaz.
- **Oyunun kuralları hikâyeden gelir (Boğaç: "güzel ama daha derin düşünmek lazım, güzel bir hikâye sonuyla"):** oyunun mekanikleri yıldızsızların işi olarak açıklanır. Ham fikirler: "oyunda ölüm yok" → her bayılmada seni kumsala onlar taşıyor; bayılınca anı gelmesi → şapka bayıldığın an çalışıyor, anılar okunurken sızıyor; tanrı modunda bile mor ışığın bayıltması → hile kullanılmış kayıtta "Tanrı modunu açtın. Bizim üzerimizde işe yaramaz."; arenanın kayda hiç dokunmaması → arena gemideki simülasyon odası. Bu haliyle kullanılmaz; ACT 3'ün hikâye sonuyla birlikte yeniden yazılacak.
- **Sahte güncelleme notu:** ACT 3'teki büyük açıklamadan sonra ana menüdeki "Güncelleme notları" penceresinde gerçek not yerine yıldızsızların notu (ör. "Versiyon 3.∞ · Deneğin anıları başarıyla okundu. Düzeltmeler: {L} artık hatırlanmıyor."); sürüm etiketi geceleri "· izleniyor".
- **Duraklatma durdurmuyor:** ACT 3 gemisinin içinde Esc menüsü açılınca dünya durmaz; arkada bir Yıldızsız yürümeye devam eder, menünün üstünde "Biz durmayız." yazar.
- **Sahte çökme / oyunun "kapanması":** Boğaç'ın bunun için kendi planı var; ACT 3'te konuşulacak.
- **Kötü son:** Boğaç'ın kendi fikirleri var ("Onu hatırla" testi önerisi kullanılmayacak); ACT 3'te konuşulacak.
- **Uzun aradan sonra dönüş (Godot sürümü için):** oyuna uzun süre girmeyip dönen oyuncuyu oyun fark eder (ör. gece beliren sevdiğin kişi bir kez "Neredeydin?" der). Tarayıcı sekmesine bağlı fikirler (sekme adı, simge) Godot'a geçileceği için yapılmaz.


# Canavarlar

## Reisler (boss'lar)

Her canlı türünün bir **Reisi** vardır (ör. *Kurt Reisi*). Bir türden yeterince avlayınca o türün Reisi **son av düştüğü anda, onun yanında** belirir; büyük, mor çerçeveli can çubuğu olan, daha hızlı ve daha sert vuran bir sürümdür.

- **Kaç avdan sonra:** türün bolluğuna göre 5 ile 15 arası (çok can olan türlerde 2 eksik). Sayaç Almanak'ta görünür ("Reis: 3 / 7").
- **Her Reis bir kez:** bir türün Reisi yenilince o türün almanak kartı altına döner ve o türün Reisi **bir daha gelmez**.
- **Reise yenilmek:** Reis sahadayken ya da gelmek üzereyken bayılırsan Reis kaybolur, sayaç bir eksik kalır (ör. 6 / 7); o türden bir av daha Reisi yeniden getirir.
- **Reis kendi biyomunda:** Reis yalnızca türün kendi biyomunda, son avın düştüğü yerin çevresinde çıkar (önceden oyuncu o an neredeyse orada çıkıyordu; bataklıkta timsah avlayıp ormana yürüyünce Timsah Reisi ormanda çıkabiliyordu). Sayaç eski bir kayıttan dolu geldiyse Reis ancak oyuncu türün biyomuna girince gelir.
- **Uzaklaşınca kaybolur:** Reis sahadayken ya da gelmek üzereyken oyuncu **600 pikselden** fazla uzaklaşırsa Reis kaybolur, bildirim çıkar ve sayaç bir eksik kalır (ör. 6 / 7); o türden bir av daha Reisi yeniden getirir.
- **Canlılar biyomlarından çıkmaz:** her canlı ilk durduğu biyoma bağlıdır; sınıra gelince geri döner, kovalamayı sınırda bırakır (Reis kovalamayı bırakmaz ama sınırı geçmez). Geri itilmesi de onu sınırın ötesine atmaz. Mağaralarda, arenada ve derslerin alıştırma canavarlarında bu kural yoktur.
- **Güç:** canı türün 4 katı; hasarı 1,5 katı (Çayır türleri ve tehlikeli bölgeler) ya da 1,7 katı; XP = türün XP'si × 6 + 20.
- **Davranış:** canı %40'ın altına inince **öfkelenir** (kırmızılaşır, daha sert saldırır). Sürü hayvanlarının Reisi canı yarıya inince yanına 2 sürü üyesi çağırır.
- **Ödül:** türün düşürdükleri + 25 + (türün XP'si × 5) sikke. Reis öldürmek "İlk reis", "Reis avcısı" (5 farklı), "Reislerin korkusu" (10), "Reis yiyen" (20) ve "Bütün reisler" başarımlarını ilerletir.
- Börü'nün derslerindeki alıştırma canavarı öldürülünce av sayılmaz; ders Reis çağırmaz. Ders sürerken hiçbir Reis gelmez; o sırada dolan Reis ders bitince gelir.

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


# Tarifler · Tarif ansiklopedisi

> ACT 1 madenlerinin fiyatları ve yerleri değişti (**Aletler · Madenler ve ekipman merdiveni**). Bir madeni kullanan tariflerin fiyatı, maden fiyatındaki değişim × miktar × 1,3 kadar (zincir boyunca) kendiliğinden değişir; bu tablodaki türetilmiş fiyatlar henüz yeniden üretilmedi (değerleri). Yeni setlerin, ara ürünlerin ve Tunç/Demir set parçalarının fiyatları o bölümdeki tablolardadır.

## Tarifler nasıl çalışır (kısa)

- **Közlenmiş et ve balık:** ateşte közlenen et ve balık yenir; "pişmiş et/balık grubu" yoktur, tarifler belli bir pişmiş eti ister; "pişmiş et" isteyen tarif ve görevler (ör. Poyraz'ın "Kaptanın karnı") közlenmişi de kabul eder.
- **Her ateşte közlenir:** bütün kişilerin ateşlerinde (Nazlı, Durmuş, Dursun, kuzenler, Kemal…) çiğ et ve balık közlenir: çantanda çiğ yiyecek varken ateşin yanında **"[F] Ateşte közle"** yazar; ateşe tıklayınca (18 px) ya da 30 px yakınında E/F ile közleme penceresi açılır. Çiğ yiyecek yokken ateş hedef olmaz (yanındaki kişiyle konuşmayı engellemez).
- **Hiçbir tarif bıçak istemez:** eskiden Taş bıçak ya da Çakmaktaşı bıçak isteyen 64 tarif (saplar, kaşıklar, kabuklar, zıpkın, kürek, havyar…) artık alet istemez. **Reçine ağaçtan düşer:** Çam kesilince her odunla birlikte 1 **Çam reçinesi** (ve 1 Çam kozalağı), Ladin kesilince 1 **Ladin reçinesi** düşer; Çam/Ladin kabuğu ve reçine tarifleri kalktı. Görev oku ve "nerede bulunur" bilgisi ağaçların ekstra düşürdüklerini o ağaçtan çıkar sayar. Reçine isteyen tarif belli bir reçineyi ister (Çam reçinesi, Ladin reçinesi ya da Huş katranı). Eski kayıtlardaki Çam/Ladin kabuğu kendi reçinesine dönüşür.
- **Her biyomun seti kendi biyomunda yapılır:** bir biyomun silah ve zırh setleri (başlangıç, metal ve usta setleri) o biyomun (ya da önceki biyomların) malzemesiyle yapılabilir; hiçbir parça sonraki bir biyomdan malzeme istemez. Deri her biyomun hayvanından düşen Deri parçasıdır (aşağıda).
- **Tabaklama yok, zırh deri parçasıyla yapılır:** Tanin, Meşe tanini ve bütün tabaklanmış deri tarifleri oyundan kalktı. Derisi ya da postu olan her hayvan avlanınca derisinin yanında **Deri parçası** da düşürür (büyük hayvanlar — canı 60 ve üstü — 1–2 tane). Zırhlar, deri isteyen silahlar ve eşyalar (çanta, tulum, çadır, yatak, ok kılıfı…) eskiden istedikleri tabaklanmış deri yerine aynı sayıda Deri parçası ister. Hayvanların kendi derileri (Kurt derisi, Geyik derisi…) satılır ve görevlerde istenir.
- **Zırhlar doğadan düşenle, aletsiz yapılır:** bütün zırhlar ve setlerin zırh parçaları yalnızca doğadan toplanan ya da hayvandan düşen malzemeyle yapılır: Deri parçası, Sinir, Kemik, cevher, odun, pul, post. Külçe, levha, halka, kalas ve Sinir kirişi gibi ara ürünler istenmez; hiçbir zırh alet (Taş bıçak vb.) istemez. Dönüşüm: 1 külçe → 2 cevher (Tunç: 2 Bakır + 1 Kalay cevheri; Çelik: 3 Demir cevheri + 1 Taş kömürü; Kara çelik: 3 Demir cevheri + 2 Obsidyen), 1 Demir levha → 3, 1 Demir halka → 1 Demir cevheri, 1 Mor kristal levhası → 2 Kristal + 1 Ametist, 1 Meşe kalası → 2 Meşe odunu, 1 Sinir kirişi → 2 Sinir; İp ve Lif çıkarıldı. Metal setleri yine zırhçının örsünde dövülür. **Her parçanın tarifi farklıdır:** kazan tarifi malzemelerin cinsine bakarak bulduğu için aynı setin parçaları ayırt edici bir doğal malzeme alır: gövde zırhı yalın, miğfer/başlık +2 Taş, eldiven +3 Lif, çizme/çarık +3 Yaprak.
- **Her biyomun aletleri de o biyomda ya da öncekilerde bulunur:** bir aletin (ve aletin istediği aletin) malzemesi, o aleti gerektiren tariflerin biyomundan sonra gelmez. Çayır yemeklerinin ve ezmelerinin istediği taş aletler artık Çayır taşından yapılır: **Pişirme taşı** (Taş levha: Kumtaşı), **Öğütme taşı** (Kumtaşı), **Taş havan** (Taş kase: Kireçtaşı), **Kirmen** (Taş halka: Kireçtaşı). Kül Diyarı'nın **Ejder kılıcı** Mor Kristal Vadisi'nin altınını istemez (2 Ejder kemiği, 1 Kara çelik külçesi, 1 tabaklanmış deri, 1 Ateş yağı; Aletler bölümündeki tarif).

- **Öğrenmek:** Bir tarifi kullanmak için önce kazanda öğrenirsin. ACT 1'de **Cadı Zümrüt'ün kazanı** (ya da kuzen cadıların kazanları), ACT 2'de **Gökbilimci Yıldız'ın kazanı**. Malzemeleri kazana koyup öğrenirsin; malzemeler bu sırada harcanır.
- **Kazan listesinde yapılabilirler üstte parlar:** kazandaki tarif listesinde, malzemelerin (ve gereken aletin) şu an çantanda olduğu ve henüz öğrenmediğin tarifler listenin **en üstünde**, **"Şimdi yapılabilir"** başlığı altında toplanır ve **altın sarısı bir çerçeveyle yavaşça parlar** (yalnızca saydamlık oynar, ekranı yormaz). Başlık yalnızca "Tümü" sekmesinde ve arama yokken görünür; bir kategori ya da arama seçiliyken yapılabilirler o listenin başına çıkar ve yine parlar. Kategori başlıkları altında yalnızca yapılamayanlar kalır. Seçili tarife malzeme koymaya başlayınca (malzemeler kazana geçse bile) o tarif yapılabilir sayılmaya devam eder, yerinden oynamaz. Örs listesinde bu yoktur.
- **Öğreticide yalnızca istenen parlar:** öğretici kazanda belirli bir şey istiyorsa (ör. "Kaba meşale yap", "Keskin taş yap", "Sopa yap": parlayan satır, + düğmesi ya da Kaynat) yapılabilir tariflerin altın parlaması **gösterilmez**; yalnızca öğreticinin istediği şey parlar. Öğretici bir şey istemiyorsa yapılabilirler yine parlar.
- **"+" zincirleme yapar:** kazandaki ve örsteki malzeme satırlarının "+" düğmesi ile elle yapma listesindeki "Yap" düğmesi, eksik malzemeyi **çantandaki eşyalardan zincirleme** üretebiliyorsa açık olur. Kural tek: zincirdeki her tarifin **tarifini bilmen** (açık olması) ve **ham malzemenin çantada yetmesi** gerekir; aletler çantada olmalıdır. Örnek: sopa 2 keskin taş ister, her keskin taş 2 taş ister; çantada 4 taş ve iki tarif de açıksa "+" önce iki keskin taşı, sonra sopayı yapar. Eldeki hazır malzeme önce kullanılır; döngülü tarif zinciri (A için B, B için A) hiç denenmez; zincir en çok 6 basamaktır. Kazanda "+" satırın **eksik miktarı kadar** üretir (yetmiyorsa yetebildiği kadar). Zincir yetmiyorsa düğme gri kalır ve "Eksik: …" yazar.
- **Kitapta açılması:** Tarif kitabında bir tarifin açık görünmesi için bütün malzemelerini daha önce görmüş (eline almış) olman gerekir. Bir kişinin "tarifini kitabına yazdım" demesi de tarifi açar (satın alınmış sayılır).
- **Yapmak:** Öğrendikten sonra nerede yapıldığı tarifin türüne göre değişir (tablolardaki "Nerede yapılır" sütunu):
  - **Ateşte (7 Kasım 2026, Boğaç):** ateş gerektiren yemekler (közlenmiş, kızarmış, kavrulmuş, haşlanmış, tütsülenmiş, ızgara, tava, şiş, buğulama, pişmiş et/balık, Kor isteyenler ve malzemesinde **Ateş** ya da **Duman** olan bütün yemekler: çorbalar, ekmekler, güveç, pilaki, biftek, komposto…; tabloda "Ateşte (pişirme menüsü)", toplam 129 tarif). Ateşin başında **Ateş ve Duman malzemesi harcanmaz, ateş sağlar** (tabloda "Ateş (ateş sağlar)" diye yazılı); öbür malzemeler aynen harcanır. Yapı ve eşya olan ateş tarifleri (Tütsühane, fırınlar, kano, tutkal, düdük, Duman tütsüsü) El yapımında kalır. El yapımı listesinde **görünmez**; herhangi bir ateşin pişirme menüsünde yapılır (Sistemler › Yemek › Ateşte pişirme). Tarif yine kazanda öğrenilir.
  - **El yapımı (Tab):** kendin yaparsın; dokunmatikte el ikonu. Tarif listesinde **+** ile tek dokunuşta yapılır.
  - **Örs · Demirci Dursun / silahçı kuzenleri:** aletler ve silahlar. **Örs · Zırhçı Durmuş / zırhçı kuzenleri:** metal ve özel zırhlar. "… ve bütün kuzenleri döver" yazan eşya kademe 0'dır; "Silahçı Ali (Bataklık) ve üstü döver" yazan eşyayı Ali ve ondan sonraki biyomların silahçıları döver.
  - **Usta Sinan:** ev eşyaları (evin içine konur). **Usta Sinan:** yere kurulan yapılar ve yataklar.
  - **ACT 2 ustaları:** asalar (Efsun), ateşli silahlar (Tufan), meka zırh (Işın), ışın kılıcı (Tomris), roket (Gökay); işçilik ücreti alırlar.
- **Alet sütunu:** tarifte adı geçen alet çantanda olmalıdır ama harcanmaz.
- **"Herhangi" yok ("herhangi kafa karıştırıyor"):** hiçbir tarif ve görev "Herhangi sap", "Herhangi kalas" gibi bir grup istemez; her biri belli bir malzeme ister. Hangisi olduğu tarifin öbür malzemelerinin en çok hangi biyomdan geldiğine göre seçildi (eşitlikte ilerideki biyom; her biyomda bulunan Dal, Taş, Su, Ateş gibi malzemeler sayılmaz; hiçbiri belli bir biyoma ait değilse Çayır). Ağaçtan gelenler o biyomun ağacı: Çayır Çam, Orman Meşe, Bataklık Bataklık servisi, Kayalık Dağ Huş, Kül Diyarı Kül ağacı, Mor Kristal Vadisi Mor söğüt (ör. Çayır tarifleri Çam sapı, Orman tarifleri Meşe kalası ister). Kil: Çayır ve Orman Nehir, Bataklık Göl, Kayalık Dağ ve Kül Diyarı Kırmızı (tuğlada Kül Diyarı Cüruf tuğlası), Mor Kristal Beyaz. Reçine: Çayır Çam reçinesi, Orman Ladin reçinesi, Kayalık Dağ Huş katranı. Çakmak: Kıvılcım (Kayalık Dağ Pirit çakmağı, Kül Diyarı Kükürt çakmağı). Un: Çayır Yabani buğday unu, Orman Palamut unu, Bataklık Nilüfer kökü unu. ACT 2 metal külçeleri Taş kömürü ister. Tabloda her tarifin istediği yazar.
- **Fiyat:** temel satış fiyatı = malzemelerin toplam değeri × zincir çarpanı (tarifin kaç adımlık bir zincirin ucunda olduğuna göre ×1,20'den ×1,45'e kadar) + gereken aletin değerinin %10'u.

Toplam **978 tarif**: ACT 1 malzemeleriyle 911, ACT 2 malzemesi isteyen 67 (v3.57 oyun verisiyle sayıldı; üs kurmanın 7 yeni parçası dahil).

#### Yiyecek (282)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Acı biber ezmesi | 3 Ateş biberi, 1 Tuz | – | El yapımı (Tab) | 402 |
| Ahtapot salatası | 1 Ahtapot, 1 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 304 |
| Ahududu ezmesi | 3 Ahududu, 1 Su | Taş havan | El yapımı (Tab) | 43 |
| Ahududu suyu | 3 Ahududu, 1 Nehir çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 120 |
| Akçaağaç şurubu | 2 Akçaağaç özsuyu, Ateş (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 45 |
| Alıç ezmesi | 3 Alıç, 1 Su | Taş havan | El yapımı (Tab) | 128 |
| Alıç suyu | 3 Alıç, 1 Kırmızı çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 339 |
| Ardıç meyvesi ezmesi | 3 Ardıç meyvesi, 1 Su | Taş havan | El yapımı (Tab) | 128 |
| Ardıç meyvesi suyu | 3 Ardıç meyvesi, 1 Kırmızı çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 339 |
| Ateş çiçeği balı | 1 Ateş çiçeği, 1 Yabani bal, 1 Su | – | El yapımı (Tab) | 69 |
| Ateş narı şerbeti | 3 Ateş narı, 1 Kırmızı çömlek, 2 Su | – | El yapımı (Tab) | 485 |
| Avcı yahnisi | 3 Tavşan eti, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Ay elması reçeli | 3 Ay elması, 1 Yabani bal, 1 Beyaz çömlek | – | El yapımı (Tab) | 574 |
| Balık çorbası | 3 Kerevit, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 60 |
| Ballı ekmek | 1 Yabani mercimek yassı ekmeği, 1 Yabani bal, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 150 |
| Ballı fındık | 1 Kavrulmuş fındık, 1 Yabani bal, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 122 |
| Ballı kestane | 1 Kavrulmuş kestane, 1 Yabani bal, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 249 |
| Bal şarabı | 1 Bal şerbeti, 1 Nehir çömleği, 4 Su, 4 Yaprak | – | El yapımı (Tab) | 121 |
| Bal şerbeti | 1 Yabani bal, 5 Su, 1 Yaprak | – | El yapımı (Tab) | 24 |
| Barbunya tava | 2 Barbunya, 1 Yabani buğday unu, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 102 |
| Böğürtlen ezmesi | 3 Böğürtlen, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Böğürtlen suyu | 3 Böğürtlen, 1 Nehir çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Ceviz içi | 2 Ceviz, 2 Su, 1 Yaprak | Çekiç taşı | El yapımı (Tab) | 29 |
| Ceviz yağı | 1 Ceviz içi, 3 Su, 3 Yaprak | Öğütme taşı | El yapımı (Tab) | 48 |
| Çipura buğulama | 1 Çipura, 1 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 59 |
| Dağ çayı demi | 3 Dağ çayı, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 252 |
| Ejder meyvesi şerbeti ² | 3 Ejder meyvesi, 2 Su, 1 Nehir çömleği | – | El yapımı (Tab) | 312 |
| Ekmek | 2 Buğday unu, 1 Su | – | El yapımı (Tab) | 153 |
| Et şişi | 3 Tavşan eti, 1 Sopa, 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 28 |
| Goblin eriği reçeli ² | 3 Goblin eriği, 1 Nehir çömleği | – | El yapımı (Tab) | 221 |
| Gök üzümü suyu ² | 3 Gök üzümü, 2 Su | – | El yapımı (Tab) | 163 |
| Hamsi tava | 4 Hamsi, 1 Yabani buğday unu, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 52 |
| Hardal ezmesi | 3 Hardal otu, 1 Su | Taş havan | El yapımı (Tab) | 18 |
| Haşlanmış bıldırcın yumurtası | 2 Bıldırcın yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Haşlanmış keklik yumurtası | 2 Keklik yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Haşlanmış ördek yumurtası | 2 Ördek yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Haşlanmış turna kuşu yumurtası | 2 Turna kuşu yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Haşlanmış ur kekliği yumurtası | 2 Ur kekliği yumurtası, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 68 |
| Haşlanmış yaban kazı yumurtası | 2 Yaban kazı yumurtası, 1 Sıcak su, 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Havyar | 1 Mersin balığı, 1 Tuz kayası, 2 Yaprak | – | El yapımı (Tab) | 59 |
| Hurma ezmesi ² | 3 Hurma, 1 Nehir çömleği | – | El yapımı (Tab) | 221 |
| Isırgan çorbası | 3 Isırgan, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 150 |
| Işık mantarı çorbası | 3 Işık mantarı, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 537 |
| Işıl çorbası | 1 Işıl balığı, 1 Fener balığı, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 676 |
| İstavrit ızgara | 2 İstavrit, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 30 |
| İstiridye çorbası | 2 İstiridye, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 109 |
| Kalamar tava | 2 Kalamar, 1 Yabani buğday unu, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 192 |
| Kalkan tava | 1 Kalkan, 1 Yabani buğday unu, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 144 |
| Kara tuzlu et | 2 Ur kekliği eti, 1 Kara tuz | – | El yapımı (Tab) | 107 |
| Kavrulmuş fındık | 3 Fındık, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 70 |
| Kavrulmuş kestane | 3 Kestane, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 162 |
| Kavrulmuş su kestanesi | 2 Su kestanesi, Ateş (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 88 |
| Kavrulmuş yabani arpa | 3 Yabani arpa, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 38 |
| Kavrulmuş yabani buğday | 3 Yabani buğday, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 38 |
| Kavrulmuş yabani mercimek | 3 Yabani mercimek, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 70 |
| Kavrulmuş yabani nohut | 3 Yabani nohut, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 70 |
| Kavrulmuş yabani yulaf | 3 Yabani yulaf, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 38 |
| Kefal pilakisi | 2 Kefal, 1 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 65 |
| Kekikli balık | 1 Pişmiş kurbağa, 3 Kekik, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 138 |
| Kemik ilikli çorba | 3 Kemik, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Kılıç şiş | 1 Kılıç balığı, 2 Dal, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 228 |
| Kızarmış çayır mantarı | 3 Çayır mantarı, 1 Su | Pişirme taşı | Ateşte (pişirme menüsü) | 15 |
| Kızarmış kanlıca | 2 Kanlıca, 2 Su, 1 Yaprak | Pişirme taşı | Ateşte (pişirme menüsü) | 35 |
| Kızarmış kayın mantarı | 2 Kayın mantarı, 2 Su, 1 Yaprak | Pişirme taşı | Ateşte (pişirme menüsü) | 96 |
| Kızarmış kuzugöbeği | 1 Kuzugöbeği, 3 Su, 3 Yaprak | Pişirme taşı | Ateşte (pişirme menüsü) | 30 |
| Kızarmış mağara mantarı | 2 Mağara mantarı, 2 Su, 2 Yaprak | Pişirme taşı | Ateşte (pişirme menüsü) | 21 |
| Kızarmış tavuk mantarı | 2 Tavuk mantarı, 2 Su, 1 Yaprak | Pişirme taşı | Ateşte (pişirme menüsü) | 35 |
| Kızarmış yabani havuç | 3 Yabani havuç, 1 Su | Pişirme taşı | Ateşte (pişirme menüsü) | 15 |
| Kızılcık ezmesi | 3 Kızılcık, 1 Su | Taş havan | El yapımı (Tab) | 79 |
| Kızılcık suyu | 3 Kızılcık, 1 Göl çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 230 |
| Kök mantarlı güveç | 2 Kök mantarı, 1 Mağara kurdu eti, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 160 |
| Közlenmiş şiş | 1 Et şişi, 1 Kor, 5 Su, 4 Yaprak | – | Ateşte (pişirme menüsü) | 108 |
| Kristal armut kompostosu ² | 3 Kristal armut, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 167 |
| Kurutulmuş ahududu | 3 Ahududu, 3 Kuru ot | – | El yapımı (Tab) | 39 |
| Kurutulmuş alabalık | 2 Alabalık, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 88 |
| Kurutulmuş alıç | 3 Alıç, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş ardıç meyvesi | 3 Ardıç meyvesi, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş ateş narı | 3 Ateş narı, 3 Kuru ot | – | El yapımı (Tab) | 259 |
| Kurutulmuş ay elması | 3 Ay elması, 3 Kuru ot | – | El yapımı (Tab) | 378 |
| Kurutulmuş bıldırcın eti | 2 Bıldırcın eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 82 |
| Kurutulmuş böğürtlen | 3 Böğürtlen, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş çapak | 2 Çapak, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 82 |
| Kurutulmuş çayır mantarı | 3 Çayır mantarı, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş dağ keçisi eti | 1 Dağ keçisi eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 123 |
| Kurutulmuş geyik eti | 1 Geyik eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 87 |
| Kurutulmuş işık tilkisi eti | 1 Işık tilkisi eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 189 |
| Kurutulmuş kadife balığı | 2 Kadife balığı, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 84 |
| Kurutulmuş kanlıca | 2 Kanlıca, 3 Kuru ot | – | El yapımı (Tab) | 28 |
| Kurutulmuş karaca eti | 1 Karaca eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 97 |
| Kurutulmuş kartal eti | 1 Kartal eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 138 |
| Kurutulmuş kayın mantarı | 2 Kayın mantarı, 3 Kuru ot | – | El yapımı (Tab) | 87 |
| Kurutulmuş keklik eti | 2 Keklik eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 82 |
| Kurutulmuş kerevit | 2 Kerevit, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 84 |
| Kurutulmuş kızılcık | 3 Kızılcık, 3 Kuru ot | – | El yapımı (Tab) | 75 |
| Kurutulmuş kızılkanat | 2 Kızılkanat, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 84 |
| Kurutulmuş kristal geyik eti | 1 Kristal geyik eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 212 |
| Kurutulmuş kunduz eti | 2 Kunduz eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 101 |
| Kurutulmuş kurbağa | 3 Kurbağa, 1 Tuz, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 80 |
| Kurutulmuş kurt eti | 1 Kurt eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 84 |
| Kurutulmuş kuşburnu | 3 Kuşburnu, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş kuzugöbeği | 1 Kuzugöbeği, 3 Kuru ot, 1 Su, 1 Yaprak | – | El yapımı (Tab) | 22 |
| Kurutulmuş mağara ayısı eti | 1 Mağara ayısı eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 133 |
| Kurutulmuş mağara mantarı | 2 Mağara mantarı, 3 Kuru ot, 1 Su | – | El yapımı (Tab) | 15 |
| Kurutulmuş mersin balığı | 1 Mersin balığı, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 120 |
| Kurutulmuş meyve keki | 1 Yabani buğday unu, 1 Kurutulmuş böğürtlen, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 36 |
| Kurutulmuş muflon eti | 1 Muflon eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 123 |
| Kurutulmuş mürver | 3 Mürver, 3 Kuru ot | – | El yapımı (Tab) | 75 |
| Kurutulmuş ördek eti | 2 Ördek eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 109 |
| Kurutulmuş sazan | 2 Sazan, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 84 |
| Kurutulmuş sincap eti | 3 Sincap eti, 1 Tuz, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 92 |
| Kurutulmuş su samuru eti | 2 Su samuru eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Kurutulmuş tatlısu kefali | 2 Tatlısu kefali, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 84 |
| Kurutulmuş tatlısu levreği | 2 Tatlısu levreği, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 88 |
| Kurutulmuş tatlısu midyesi | 3 Tatlısu midyesi, 1 Tuz, 2 Su, 1 Yaprak | – | El yapımı (Tab) | 120 |
| Kurutulmuş tavşan eti | 2 Tavşan eti, 1 Tuz, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 82 |
| Kurutulmuş tavuk mantarı | 2 Tavuk mantarı, 3 Kuru ot | – | El yapımı (Tab) | 28 |
| Kurutulmuş turna balığı | 1 Turna balığı, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 97 |
| Kurutulmuş turna kuşu eti | 2 Turna kuşu eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Kurutulmuş ur kekliği eti | 1 Ur kekliği eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 131 |
| Kurutulmuş vaşak eti | 1 Vaşak eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 142 |
| Kurutulmuş yabani armut | 3 Yabani armut, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yabani elma | 3 Yabani elma, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yabani erik | 3 Yabani erik, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban atı eti | 1 Yaban atı eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 88 |
| Kurutulmuş yaban çileği | 3 Yaban çileği, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban domuzu eti | 1 Yaban domuzu eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 98 |
| Kurutulmuş yaban kazı eti | 2 Yaban kazı eti, 1 Tuz, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Kurutulmuş yaban mersini | 2 Yaban mersini, 3 Kuru ot | – | El yapımı (Tab) | 28 |
| Kurutulmuş yaban öküzü eti | 1 Yaban öküzü eti, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 129 |
| Kurutulmuş yayın | 1 Yayın, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 98 |
| Kurutulmuş yılan balığı | 1 Yılan balığı, 1 Tuz, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 97 |
| Kurutulmuş yıldız eriği | 3 Yıldız eriği, 3 Kuru ot | – | El yapımı (Tab) | 378 |
| Kuşburnu ezmesi | 3 Kuşburnu, 1 Su | Taş havan | El yapımı (Tab) | 128 |
| Kuşburnu suyu | 3 Kuşburnu, 1 Kırmızı çömlek, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 339 |
| Kül ekmeği | 1 Nilüfer kökü unu, 1 Kül, 1 Su | – | El yapımı (Tab) | 158 |
| Levrek şiş | 1 Levrek, 2 Dal, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 65 |
| Lüfer ızgara | 1 Lüfer, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 87 |
| Mantar çorbası | 2 Kanlıca, 1 Sıcak su, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 141 |
| Meyveli pemmikan | 1 Pemmikan, 1 Kurutulmuş böğürtlen, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 210 |
| Meyve karışımı | 3 Böğürtlen, 3 Ahududu | – | El yapımı (Tab) | 44 |
| Mürver ezmesi | 3 Mürver, 1 Su | Taş havan | El yapımı (Tab) | 79 |
| Mürver suyu | 3 Mürver, 1 Göl çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 230 |
| Nilüfer çorbası | 2 Nilüfer, 1 Sıcak su, 1 Su teresi | – | El yapımı (Tab) | 207 |
| Nilüfer kökü unu | 2 Nilüfer, 2 Su, 1 Yaprak | Öğütme taşı | El yapımı (Tab) | 74 |
| Orkinos biftek | 1 Orkinos, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 266 |
| Ot salatası | 3 Kuzukulağı, 3 Su teresi | – | El yapımı (Tab) | 93 |
| Palamut buğulama | 1 Palamut, 1 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 120 |
| Palamut ekmeği | 1 Palamut unu, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 48 |
| Palamut unu | 3 Meşe palamudu, 1 Su | Öğütme taşı | El yapımı (Tab) | 8 |
| Pemmikan | 1 Kurutulmuş sincap eti, 2 Hayvan yağı, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 137 |
| Pişmiş alabalık | 2 Alabalık, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 46 |
| Pişmiş bıldırcın eti | 2 Bıldırcın eti, Ateş (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 39 |
| Pişmiş bulut koyunu eti ² | 1 Bulut koyunu eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 99 |
| Pişmiş buz tavşanı eti ² | 1 Buz tavşanı eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 127 |
| Pişmiş çapak | 2 Çapak, Ateş (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 39 |
| Pişmiş dağ keçisi eti | 1 Dağ keçisi eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 62 |
| Pişmiş geyik eti | 1 Geyik eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 45 |
| Pişmiş işık tilkisi eti | 1 Işık tilkisi eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 114 |
| Pişmiş kadife balığı | 2 Kadife balığı, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 43 |
| Pişmiş karaca eti | 1 Karaca eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 48 |
| Pişmiş kartal eti | 1 Kartal eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 75 |
| Pişmiş keklik eti | 2 Keklik eti, Ateş (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 39 |
| Pişmiş kerevit | 2 Kerevit, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 43 |
| Pişmiş kertenkele eti ² | 1 Kertenkele eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 56 |
| Pişmiş kızılkanat | 2 Kızılkanat, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 43 |
| Pişmiş kor kertenkelesi eti ² | 1 Kor kertenkelesi eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 143 |
| Pişmiş kristal geyik eti | 1 Kristal geyik eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 137 |
| Pişmiş kunduz eti | 2 Kunduz eti, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 53 |
| Pişmiş kurbağa | 3 Kurbağa, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 38 |
| Pişmiş kurt eti | 1 Kurt eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 42 |
| Pişmiş mağara ayısı eti | 1 Mağara ayısı eti, Ateş (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 74 |
| Pişmiş mersin balığı | 1 Mersin balığı, Ateş (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 66 |
| Pişmiş muflon eti | 1 Muflon eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 62 |
| Pişmiş ördek eti | 2 Ördek eti, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 56 |
| Pişmiş rüzgâr kuşu eti ² | 1 Rüzgâr kuşu eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 93 |
| Pişmiş sazan | 2 Sazan, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 43 |
| Pişmiş sincap eti | 3 Sincap eti, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 44 |
| Pişmiş su samuru eti | 2 Su samuru eti, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 60 |
| Pişmiş tatlısu kefali | 2 Tatlısu kefali, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 43 |
| Pişmiş tatlısu levreği | 2 Tatlısu levreği, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 46 |
| Pişmiş tatlısu midyesi | 3 Tatlısu midyesi, Ateş (ateş sağlar), 2 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 70 |
| Pişmiş tavşan eti | 2 Tavşan eti, Ateş (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 39 |
| Pişmiş timsah eti | 1 Timsah eti, Ateş (ateş sağlar), 1 Su, 1 Yaprak | – | Ateşte (pişirme menüsü) | 55 |
| Pişmiş turna balığı | 1 Turna balığı, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 48 |
| Pişmiş turna kuşu eti | 2 Turna kuşu eti, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 60 |
| Pişmiş ur kekliği eti | 1 Ur kekliği eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 68 |
| Pişmiş vaşak eti | 1 Vaşak eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 78 |
| Pişmiş yaban atı eti | 1 Yaban atı eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 46 |
| Pişmiş yaban domuzu eti | 1 Yaban domuzu eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 49 |
| Pişmiş yaban kazı eti | 2 Yaban kazı eti, Ateş (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 60 |
| Pişmiş yaban öküzü eti | 1 Yaban öküzü eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 68 |
| Pişmiş yayın | 1 Yayın, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 49 |
| Pişmiş yılan balığı | 1 Yılan balığı, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 48 |
| Pişmiş yıldız tilkisi eti ² | 1 Yıldız tilkisi eti, Ateş (ateş sağlar), 3 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 159 |
| Sarımsaklı et | 1 Pişmiş sincap eti, 3 Yaban sarımsağı, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 101 |
| Spor ekmeği ² | 3 Spor tozu, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 167 |
| Taşta alabalık | 2 Alabalık, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 23 |
| Taşta çapak | 2 Çapak, 2 Su, 1 Yaprak | Pişirme taşı | El yapımı (Tab) | 17 |
| Taşta kadife balığı | 2 Kadife balığı, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta kerevit | 2 Kerevit, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta kızılkanat | 2 Kızılkanat, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta kurbağa | 3 Kurbağa, 1 Su | Pişirme taşı | El yapımı (Tab) | 15 |
| Taşta mersin balığı | 1 Mersin balığı, 4 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 38 |
| Taşta sazan | 2 Sazan, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta tatlısu kefali | 2 Tatlısu kefali, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 21 |
| Taşta tatlısu levreği | 2 Tatlısu levreği, 2 Su, 2 Yaprak | Pişirme taşı | El yapımı (Tab) | 23 |
| Taşta tatlısu midyesi | 3 Tatlısu midyesi, 1 Su | Pişirme taşı | El yapımı (Tab) | 44 |
| Taşta turna balığı | 1 Turna balığı, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 24 |
| Taşta yayın | 1 Yayın, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 25 |
| Taşta yılan balığı | 1 Yılan balığı, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 24 |
| Tekir tava | 2 Tekir, 1 Yabani buğday unu, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 52 |
| Turba ateşinde tütsü | 1 Ördek eti, 2 Turba, 1 Kıvılcım | – | Ateşte (pişirme menüsü) | 69 |
| Tütsülenmiş alabalık | 2 Alabalık, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 67 |
| Tütsülenmiş bıldırcın eti | 2 Bıldırcın eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Tütsülenmiş çapak | 2 Çapak, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Tütsülenmiş dağ keçisi eti | 1 Dağ keçisi eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 94 |
| Tütsülenmiş geyik eti | 1 Geyik eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 67 |
| Tütsülenmiş işık tilkisi eti | 1 Işık tilkisi eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 147 |
| Tütsülenmiş kadife balığı | 2 Kadife balığı, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 64 |
| Tütsülenmiş karaca eti | 1 Karaca eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 74 |
| Tütsülenmiş kartal eti | 1 Kartal eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 103 |
| Tütsülenmiş keklik eti | 2 Keklik eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Tütsülenmiş kerevit | 2 Kerevit, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 64 |
| Tütsülenmiş kızılkanat | 2 Kızılkanat, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 64 |
| Tütsülenmiş kristal geyik eti | 1 Kristal geyik eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 170 |
| Tütsülenmiş kunduz eti | 2 Kunduz eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 77 |
| Tütsülenmiş kurbağa | 3 Kurbağa, Duman (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 60 |
| Tütsülenmiş kurt eti | 1 Kurt eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 64 |
| Tütsülenmiş mağara ayısı eti | 1 Mağara ayısı eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 104 |
| Tütsülenmiş mersin balığı | 1 Mersin balığı, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 94 |
| Tütsülenmiş muflon eti | 1 Muflon eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 94 |
| Tütsülenmiş ördek eti | 2 Ördek eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 83 |
| Tütsülenmiş sazan | 2 Sazan, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 64 |
| Tütsülenmiş sincap eti | 3 Sincap eti, Duman (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 69 |
| Tütsülenmiş su samuru eti | 2 Su samuru eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 87 |
| Tütsülenmiş tatlısu kefali | 2 Tatlısu kefali, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 64 |
| Tütsülenmiş tatlısu levreği | 2 Tatlısu levreği, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 67 |
| Tütsülenmiş tatlısu midyesi | 3 Tatlısu midyesi, Duman (ateş sağlar), 2 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 95 |
| Tütsülenmiş tavşan eti | 2 Tavşan eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 61 |
| Tütsülenmiş turna balığı | 1 Turna balığı, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 74 |
| Tütsülenmiş turna kuşu eti | 2 Turna kuşu eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 87 |
| Tütsülenmiş ur kekliği eti | 1 Ur kekliği eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 96 |
| Tütsülenmiş vaşak eti | 1 Vaşak eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 107 |
| Tütsülenmiş yaban atı eti | 1 Yaban atı eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 68 |
| Tütsülenmiş yaban domuzu eti | 1 Yaban domuzu eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 75 |
| Tütsülenmiş yaban kazı eti | 2 Yaban kazı eti, Duman (ateş sağlar), 3 Su, 2 Yaprak | – | Ateşte (pişirme menüsü) | 87 |
| Tütsülenmiş yaban öküzü eti | 1 Yaban öküzü eti, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 100 |
| Tütsülenmiş yayın | 1 Yayın, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 75 |
| Tütsülenmiş yılan balığı | 1 Yılan balığı, Duman (ateş sağlar), 4 Su, 3 Yaprak | – | Ateşte (pişirme menüsü) | 74 |
| Yabani armut ezmesi | 3 Yabani armut, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yabani armut suyu | 3 Yabani armut, 1 Nehir çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yabani arpa hamuru | 1 Yabani arpa unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 26 |
| Yabani arpa lapası | 3 Yabani arpa, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Yabani arpa unu | 3 Yabani arpa, 1 Su | Öğütme taşı | El yapımı (Tab) | 14 |
| Yabani arpa yassı ekmeği | 1 Yabani arpa hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 52 |
| Yabani bira mayası | 1 Yabani arpa lapası, 1 Nehir çömleği, 4 Su, 4 Yaprak | – | El yapımı (Tab) | 312 |
| Yabani buğday hamuru | 1 Yabani buğday unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 26 |
| Yabani buğday lapası | 3 Yabani buğday, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Yabani buğday unu | 3 Yabani buğday, 1 Su | Öğütme taşı | El yapımı (Tab) | 14 |
| Yabani buğday yassı ekmeği | 1 Yabani buğday hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 52 |
| Yabani elma ezmesi | 3 Yabani elma, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yabani elma suyu | 3 Yabani elma, 1 Nehir çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yabani erik ezmesi | 3 Yabani erik, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yabani erik suyu | 3 Yabani erik, 1 Nehir çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yabani mercimek hamuru | 1 Yabani mercimek unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 57 |
| Yabani mercimek lapası | 3 Yabani mercimek, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 95 |
| Yabani mercimek unu | 3 Yabani mercimek, 1 Su | Öğütme taşı | El yapımı (Tab) | 39 |
| Yabani mercimek yassı ekmeği | 1 Yabani mercimek hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 91 |
| Yabani nohut hamuru | 1 Yabani nohut unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 57 |
| Yabani nohut lapası | 3 Yabani nohut, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 95 |
| Yabani nohut unu | 3 Yabani nohut, 1 Su | Öğütme taşı | El yapımı (Tab) | 39 |
| Yabani nohut yassı ekmeği | 1 Yabani nohut hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 91 |
| Yabani yulaf hamuru | 1 Yabani yulaf unu, 4 Su, 1 Yaprak | – | El yapımı (Tab) | 26 |
| Yabani yulaf lapası | 3 Yabani yulaf, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Yabani yulaf unu | 3 Yabani yulaf, 1 Su | Öğütme taşı | El yapımı (Tab) | 14 |
| Yabani yulaf yassı ekmeği | 1 Yabani yulaf hamuru, 3 Su, 3 Yaprak | Pişirme taşı | El yapımı (Tab) | 52 |
| Yaban çileği ezmesi | 3 Yaban çileği, 1 Su | Taş havan | El yapımı (Tab) | 14 |
| Yaban çileği suyu | 3 Yaban çileği, 1 Nehir çömleği, 3 Su, 2 Yaprak | – | El yapımı (Tab) | 81 |
| Yaban mersini ezmesi | 2 Yaban mersini, 2 Su, 1 Yaprak | Taş havan | El yapımı (Tab) | 33 |
| Yaban mersini suyu | 2 Yaban mersini, 1 Nehir çömleği, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 110 |
| Yankı çorbası | 2 Yankı mantarı, 1 Kör kertenkele eti, 2 Su, Ateş (ateş sağlar) | – | Ateşte (pişirme menüsü) | 91 |
| Ziyafet sofrası | 1 Avcı yahnisi, 1 Yabani buğday yassı ekmeği, 4 Su, 4 Yaprak | – | El yapımı (Tab) | 198 |

#### Ağaç (117)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akçaağaç kabuğu | 1 Akçaağaç odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 37 |
| Akçaağaç kalası | 2 Akçaağaç odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 64 |
| Akçaağaç kömürü | 2 Akçaağaç odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 88 |
| Akçaağaç sapı | 1 Akçaağaç kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 95 |
| Ardıç kabuğu | 1 Ardıç odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 36 |
| Ardıç kalası | 2 Ardıç odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 65 |
| Ardıç kömürü | 2 Ardıç odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 90 |
| Ardıç sapı | 1 Ardıç kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 95 |
| Ateş narı kalası | 2 Ateş narı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 114 |
| Ateş narı kömürü | 2 Ateş narı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 141 |
| Ateş narı sapı | 1 Ateş narı kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 161 |
| Ay elması kalası | 2 Ay elması odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 151 |
| Ay elması kömürü | 2 Ay elması odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 178 |
| Ay elması sapı | 1 Ay elması kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 209 |
| Bataklık servisi kalası | 2 Bataklık servisi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 54 |
| Bataklık servisi kömürü | 2 Bataklık servisi odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 81 |
| Bataklık servisi sapı | 1 Bataklık servisi kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 83 |
| Bulut çamı kalası ² | 2 Bulut çamı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 47 |
| Bulut elması kalası ² | 2 Bulut elması odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 52 |
| Bulut kavağı kalası ² | 2 Bulut kavağı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 114 |
| Ceviz kabuğu | 1 Ceviz odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 21 |
| Ceviz kalası | 2 Ceviz odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 34 |
| Ceviz kömürü | 2 Ceviz odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 59 |
| Ceviz sapı | 1 Ceviz kalası, 4 Dal, 3 Lif | – | El yapımı (Tab) | 56 |
| Çam kalası | 2 Çam odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Çam kömürü | 2 Çam odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Çam sapı | 1 Çam kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 31 |
| Dev mantar kalası ² | 2 Dev mantar odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 62 |
| Dikenli akasya kalası | 2 Dikenli akasya odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 114 |
| Dikenli akasya kömürü | 2 Dikenli akasya odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 141 |
| Dikenli akasya sapı | 1 Dikenli akasya kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 161 |
| Dişbudak kabuğu | 1 Dişbudak odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 26 |
| Dişbudak kalası | 2 Dişbudak odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 44 |
| Dişbudak kömürü | 2 Dişbudak odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 68 |
| Dişbudak sapı | 1 Dişbudak kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 69 |
| Ejder meyvesi kalası ² | 2 Ejder meyvesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 93 |
| Gece ağacı kalası | 2 Gece ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 153 |
| Gece ağacı kömürü | 2 Gece ağacı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 180 |
| Gece ağacı sapı | 1 Gece ağacı kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 212 |
| Gök kamışı kalası ² | 2 Gök kamışı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 114 |
| Gök söğüdü kalası ² | 2 Gök söğüdü odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 52 |
| Gök üzümü kalası ² | 2 Gök üzümü odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 109 |
| Hurda palmiyesi kalası ² | 2 Hurda palmiyesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 67 |
| Hurma kalası ² | 2 Hurma odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 67 |
| Huş kabuğu | 1 Huş odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 37 |
| Huş kalası | 2 Huş odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 64 |
| Huş katranı | 1 Huş kabuğu, 1 Ateş, 3 Dal, 3 Lif | – | El yapımı (Tab) | 83 |
| Huş kömürü | 2 Huş odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 88 |
| Huş sapı | 1 Huş kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 95 |
| Ihlamur kabuğu | 1 Ihlamur odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 19 |
| Ihlamur kalası | 2 Ihlamur odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 28 |
| Ihlamur kömürü | 2 Ihlamur odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 52 |
| Ihlamur sapı | 1 Ihlamur kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 48 |
| Işık ağacı kalası | 2 Işık ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 156 |
| Işık ağacı kömürü | 2 Işık ağacı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 183 |
| Işık ağacı sapı | 1 Işık ağacı kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 216 |
| Kara çam kalası | 2 Kara çam odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 112 |
| Kara çam kömürü | 2 Kara çam odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 139 |
| Kara çam sapı | 1 Kara çam kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 159 |
| Kavak kabuğu | 1 Kavak odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 12 |
| Kavak kalası | 2 Kavak odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 15 |
| Kavak kömürü | 2 Kavak odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 39 |
| Kavak sapı | 1 Kavak kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 31 |
| Kayın kabuğu | 1 Kayın odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 19 |
| Kayın kalası | 2 Kayın odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 28 |
| Kayın kömürü | 2 Kayın odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 52 |
| Kayın sapı | 1 Kayın kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 48 |
| Kestane kabuğu | 1 Kestane odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 37 |
| Kestane kalası | 2 Kestane odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 64 |
| Kestane kömürü | 2 Kestane odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 88 |
| Kestane sapı | 1 Kestane kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 95 |
| Kızılağaç kabuğu | 1 Kızılağaç odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 26 |
| Kızılağaç kalası | 2 Kızılağaç odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 44 |
| Kızılağaç kömürü | 2 Kızılağaç odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 68 |
| Kızılağaç sapı | 1 Kızılağaç kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 69 |
| Kızıl sedir kalası | 2 Kızıl sedir odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 117 |
| Kızıl sedir kömürü | 2 Kızıl sedir odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 144 |
| Kızıl sedir sapı | 1 Kızıl sedir kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 165 |
| Kök ağacı kalası ² | 2 Kök ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 62 |
| Kömür ağacı kalası ² | 2 Kömür ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 99 |
| Kristal armut kalası ² | 2 Kristal armut odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 83 |
| Kristal çam kalası ² | 2 Kristal çam odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 88 |
| Kuru çınar kalası ² | 2 Kuru çınar odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Kül ağacı kalası | 2 Kül ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 112 |
| Kül ağacı kömürü | 2 Kül ağacı odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 139 |
| Kül ağacı sapı | 1 Kül ağacı kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 159 |
| Ladin kalası | 2 Ladin odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 28 |
| Ladin kömürü | 2 Ladin odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 52 |
| Ladin sapı | 1 Ladin kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 48 |
| Lav palmiyesi kalası ² | 2 Lav palmiyesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 99 |
| Mavi mantar kalası ² | 2 Mavi mantar odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 67 |
| Mavi sedir kalası ² | 2 Mavi sedir odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 93 |
| Meşe kabuğu | 1 Meşe odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 20 |
| Meşe kalası | 2 Meşe odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 31 |
| Meşe kömürü | 2 Meşe odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 56 |
| Meşe sapı | 1 Meşe kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 51 |
| Meyve fidanı | 2 Elma tohumu, 2 Kuru ot, 2 Su | – | El yapımı (Tab) | 18 |
| Mor söğüt kalası | 2 Mor söğüt odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 151 |
| Mor söğüt kömürü | 2 Mor söğüt odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 178 |
| Mor söğüt sapı | 1 Mor söğüt kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 209 |
| Obsidyen dikeni kalası ² | 2 Obsidyen dikeni odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 109 |
| Pas ağacı kalası ² | 2 Pas ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Porsuk kabuğu | 1 Porsuk odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 38 |
| Porsuk kalası | 1 Porsuk odunu, 3 Dal, 3 Lif | Taş balta | El yapımı (Tab) | 40 |
| Porsuk kömürü | 1 Porsuk odunu, 1 Ateş, 3 Dal, 3 Lif | – | El yapımı (Tab) | 64 |
| Porsuk sapı | 1 Porsuk kalası, 4 Dal, 3 Lif | – | El yapımı (Tab) | 65 |
| Rüzgâr meşesi kalası ² | 2 Rüzgâr meşesi odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 57 |
| Söğüt kabuğu | 1 Söğüt odunu, 2 Yaprak, 1 Su | – | El yapımı (Tab) | 26 |
| Söğüt kalası | 2 Söğüt odunu, 2 Dal, 1 Lif | Taş balta | El yapımı (Tab) | 44 |
| Söğüt kömürü | 2 Söğüt odunu, 1 Ateş, 2 Dal, 2 Lif | – | El yapımı (Tab) | 68 |
| Söğüt sapı | 1 Söğüt kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 69 |
| Spor ağacı kalası ² | 2 Spor ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 73 |
| Taş ağacı kalası ² | 2 Taş ağacı odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 88 |
| Yıldız akasyası kalası ² | 2 Yıldız akasyası odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 125 |
| Yıldız eriği kalası | 2 Yıldız eriği odunu, 2 Dal, 2 Lif | Taş balta | El yapımı (Tab) | 151 |
| Yıldız eriği kömürü | 2 Yıldız eriği odunu, 1 Ateş, 3 Dal, 2 Lif | – | El yapımı (Tab) | 178 |
| Yıldız eriği sapı | 1 Yıldız eriği kalası, 3 Dal, 3 Lif | – | El yapımı (Tab) | 209 |

#### Zanaat (55)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akçaağaç kaşığı | 1 Akçaağaç sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 152 |
| Akrep kabuğu kalkanı | 3 Akrep kabuğu, 1 Kül ağacı kalası, 2 İp | – | El yapımı (Tab) | 298 |
| Ardıç kaşığı | 1 Ardıç sapı, 4 Lif, 4 İp | – | El yapımı (Tab) | 159 |
| Ateş yağı | 2 Çam reçinesi, 1 Hardal otu, 1 Çam kömürü | – | El yapımı (Tab) | 124 |
| Balık sepeti | 2 Söğüt sepeti, 3 Kerevit, 1 Lif | – | El yapımı (Tab) | 22 |
| Balık tutkalı | 1 Mersin balığı, 1 Kor, 5 Lif, 4 İp | – | El yapımı (Tab) | 108 |
| Balmumu | 1 Yabani bal, 1 Sıcak su, 4 Lif, 3 İp | – | El yapımı (Tab) | 87 |
| Barut ² | 2 Barut kayası, 1 Taş kömürü | – | El yapımı (Tab) | 75 |
| Bileme macunu | 2 Kumtaşı, 1 Çam reçinesi | – | El yapımı (Tab) | 43 |
| Boynuz kupa | 1 Öküz boynuzu, 3 Lif, 3 İp | – | El yapımı (Tab) | 48 |
| Bulut yünü ip ² | 3 Bulut yünü | – | El yapımı (Tab) | 67 |
| Ceviz kaşığı | 1 Ceviz sapı, 4 Lif, 4 İp | – | El yapımı (Tab) | 108 |
| Çam kaşığı | 1 Çam sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 69 |
| Deri çanta | 1 Deri parçası, 1 Kenevir halatı, 5 Lif, 4 İp | – | El yapımı (Tab) | 790 |
| Deri tulum | 1 Deri parçası, 1 Huş katranı, 5 Lif, 4 İp | – | El yapımı (Tab) | 360 |
| Diken iğnesi | 3 Kirpi dikeni, 1 Kemik | – | El yapımı (Tab) | 17 |
| Dişbudak kaşığı | 1 Dişbudak sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 118 |
| Duman tütsüsü | 2 Duman çiçeği, 2 Kuru ot | – | El yapımı (Tab) | 127 |
| Eğrelti yatağı | 3 Eğrelti, 3 Kuru ot | – | El yapımı (Tab) | 31 |
| Enerji hücresi ² | 2 Enerji taşı, 2 Bakır tel, 1 Pil | – | El yapımı (Tab) | 221 |
| Gece zambağı yağı | 3 Gece zambağı, 1 Beyaz çömlek | – | El yapımı (Tab) | 388 |
| Hasır | 3 Lif, 2 İp | – | El yapımı (Tab) | 17 |
| Hasırotu yatak | 3 Hasırotu, 1 Deri parçası, 4 Lif, 3 İp | – | Usta Sinan yapar, yere kurulur | 287 |
| Huş kabuğu kabı | 1 Huş kabuğu, 4 İp, 2 Lif | – | El yapımı (Tab) | 76 |
| Huş kaşığı | 1 Huş sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 152 |
| Ihlamur kaşığı | 1 Ihlamur sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 91 |
| Kamış hasır | 4 Kamış | – | El yapımı (Tab) | 67 |
| Kara cila | 3 Kül böceği kabuğu, 1 Çam reçinesi | – | El yapımı (Tab) | 157 |
| Kavak kaşığı | 1 Kavak sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 69 |
| Kaya patlatıcı | 3 Yarasa gübresi, 2 Turba, 1 Tuz, 1 Göl çömleği | – | El yapımı (Tab) | 236 |
| Kayın kaşığı | 1 Kayın sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 91 |
| Kenevir halatı | 7 Kenevir lifi | – | El yapımı (Tab) | 404 |
| Kenevir torba | 1 Kenevir lifi, 3 Lif, 3 İp | Kemik iğne | El yapımı (Tab) | 82 |
| Kestane kaşığı | 1 Kestane sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 152 |
| Keten ipliği | 1 Keten lifi, 3 Lif, 3 İp | Kirmen | El yapımı (Tab) | 87 |
| Keten kumaş | 1 Keten ipliği, 4 Lif, 3 İp | Dokuma tezgâhı | El yapımı (Tab) | 150 |
| Kızılağaç kaşığı | 1 Kızılağaç sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 118 |
| Kum torbası | 3 Kum, 1 Deri parçası, 4 Lif, 3 İp | – | El yapımı (Tab) | 240 |
| Ladin kaşığı | 1 Ladin sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 91 |
| Meşe kaşığı | 1 Meşe sapı, 4 Lif, 4 İp | – | El yapımı (Tab) | 102 |
| Midye kabuğu kaşık | 3 Tatlısu midyesi, 1 Lif | Bileği taşı | El yapımı (Tab) | 34 |
| Mor ip | 3 Mor sarmaşık | – | El yapımı (Tab) | 266 |
| Ok kılıfı | 1 Deri parçası, 4 İp, 2 Dal | – | El yapımı (Tab) | 240 |
| Plazma hücresi ² | 2 Plazma taşı, 1 Enerji hücresi, 1 Ejder kristali | – | El yapımı (Tab) | 539 |
| Porsuk kaşığı | 1 Porsuk sapı, 4 Lif, 4 İp | – | El yapımı (Tab) | 120 |
| Sarmaşık ipi | 4 Sarmaşık | – | El yapımı (Tab) | 36 |
| Saz örgüsü | 4 Saz | – | El yapımı (Tab) | 67 |
| Saz sepet | 2 Saz örgüsü, 3 İp, 1 Lif | – | El yapımı (Tab) | 194 |
| Söğüt kaşığı | 1 Söğüt sapı, 4 Lif, 3 İp | – | El yapımı (Tab) | 118 |
| Söğüt sepeti | 4 Söğüt dalı | – | El yapımı (Tab) | 5 |
| Sünger taşı bileği | 2 Sünger taşı, 1 Su | – | El yapımı (Tab) | 123 |
| Taş kase | 2 Kireçtaşı, 2 Lif, 2 İp (eskiden 2 Bazalt) | Bileği taşı | El yapımı (Tab) | 24 |
| Tohum yağı | 4 Elma tohumu, 1 Nehir çömleği | Taş havan | El yapımı (Tab) | 84 |
| Yosun yastık | 3 Yosun, 1 Deri parçası, 4 Lif, 3 İp | – | El yapımı (Tab) | 287 |
| Zehir yağı | 2 Sinek mantarı, 1 Çam reçinesi | – | El yapımı (Tab) | 75 |

#### Şifa (44)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Adaçayı çayı | 1 Kurutulmuş adaçayı, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 239 |
| Ateş çiçeği merhemi | 2 Ateş çiçeği, 1 Hayvan yağı, 2 Kül | – | El yapımı (Tab) | 398 |
| Ateş iksiri | 1 Ateş bezesi, 3 Su, 2 Ateş çiçeği | – | El yapımı (Tab) | 449 |
| Ay çayı | 2 Gece sefası, 2 Su, 1 Nane | – | El yapımı (Tab) | 30 |
| Ay ışığı iksiri | 3 Gece sefası, 1 Mor kıymık, 2 Su | – | El yapımı (Tab) | 82 |
| Ay otu iksiri | 3 Ay otu, 2 Su, 1 Işık mantarı | – | El yapımı (Tab) | 698 |
| Bataklık otu çayı | 2 Bataklık otu, 1 Sıcak su, 1 Su | – | El yapımı (Tab) | 165 |
| Civanperçemi çayı | 1 Kurutulmuş civanperçemi, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 239 |
| Gelincik çayı | 1 Kurutulmuş gelincik, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Gölge iksiri | 2 Gölge otu, 1 Örümcek gözü, 2 Su | – | El yapımı (Tab) | 744 |
| Ihlamur çayı | 3 Ihlamur çiçeği, 1 Sıcak su, 2 Su, 2 Yaprak | – | El yapımı (Tab) | 114 |
| Kardelen merhemi | 2 Kardelen, 1 Hayvan yağı | – | El yapımı (Tab) | 137 |
| Kekik çayı | 1 Kurutulmuş kekik, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 239 |
| Kertenkele merhemi ² | 2 Kertenkele pulu, 1 Damla taşı, 1 Su | – | El yapımı (Tab) | 143 |
| Kor merhemi | 2 Kor otu, 1 Hayvan yağı | – | El yapımı (Tab) | 288 |
| Kurutulmuş adaçayı | 3 Adaçayı, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş civanperçemi | 3 Civanperçemi, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş ebegümeci | 3 Ebegümeci, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Kurutulmuş gelincik | 3 Gelincik, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş hardal otu | 3 Hardal otu, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş isırgan | 3 Isırgan, 3 Kuru ot | – | El yapımı (Tab) | 50 |
| Kurutulmuş kekik | 3 Kekik, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş kuzukulağı | 3 Kuzukulağı, 3 Kuru ot | – | El yapımı (Tab) | 36 |
| Kurutulmuş lavanta | 2 Lavanta, 3 Kuru ot | – | El yapımı (Tab) | 87 |
| Kurutulmuş nane | 3 Nane, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş papatya | 3 Papatya, 3 Kuru ot | – | El yapımı (Tab) | 8 |
| Kurutulmuş rezene | 3 Rezene, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş sinirotu | 3 Sinirotu, 3 Kuru ot | – | El yapımı (Tab) | 123 |
| Kurutulmuş su teresi | 3 Su teresi, 3 Kuru ot | – | El yapımı (Tab) | 75 |
| Kurutulmuş yabani havuç | 3 Yabani havuç, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Kurutulmuş yaban sarımsağı | 3 Yaban sarımsağı, 3 Kuru ot | – | El yapımı (Tab) | 39 |
| Kuşburnu çayı | 1 Kurutulmuş kuşburnu, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 239 |
| Kükürtlü merhem | 1 Kükürt, 2 Hayvan yağı, 2 Yosun | – | El yapımı (Tab) | 207 |
| Lavanta çayı | 1 Kurutulmuş lavanta, 1 Sıcak su, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 196 |
| Lavanta yağı | 2 Lavanta, 2 Hayvan yağı, 1 Su, 1 Yaprak | – | El yapımı (Tab) | 125 |
| Mana iksiri ² | 2 Büyü otu, 2 Su, 1 Nehir çömleği | – | Büyücü Efsun yapar (10 sikke işçilik) | 306 |
| Nane çayı | 1 Kurutulmuş nane, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Panzehir | 3 Bataklık otu, 1 Zehir bezesi, 2 Su | – | El yapımı (Tab) | 148 |
| Papatya çayı | 1 Kurutulmuş papatya, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 65 |
| Rezene çayı | 1 Kurutulmuş rezene, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 69 |
| Sinirotu çayı | 1 Kurutulmuş sinirotu, 1 Sıcak su, 3 Su, 3 Yaprak | – | El yapımı (Tab) | 239 |
| Söğüt kabuğu çayı | 1 Söğüt kabuğu, 1 Sıcak su, 4 Su, 3 Yaprak | – | El yapımı (Tab) | 184 |
| Şifalı merhem | 3 Civanperçemi, 2 Hayvan yağı, 1 Su | – | El yapımı (Tab) | 184 |
| Yanık kök çayı | 2 Yanık kök, 2 Su, 1 Ateş | – | El yapımı (Tab) | 337 |

#### Alet kademeleri (40)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akrep ok ucu | 2 Akrep iğnesi, 1 İp | – | El yapımı (Tab) | 154 |
| Bazalt bıçak | 1 Bazalt pulu, 1 Kül ağacı sapı, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 429 |
| Bazalt kazıyıcı | 1 Bazalt pulu, 3 Kemik, 2 İp, 1 Dal, 1 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 275 |
| Bazalt ok ucu | 9 Bazalt pulu | – | El yapımı (Tab) | 2.259 |
| Bazalt pulu | 1 Yontulmuş bazalt, 2 İp, 2 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 191 |
| Bazalt sivri ucu | 8 Yontulmuş bazalt | – | El yapımı (Tab) | 1.374 |
| Boynuz kazma | 1 Geyik boynuzu, 1 Çam sapı, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 70 |
| Çakmaktaşı balta | 1 Yontulmuş çakmaktaşı, 1 Çam sapı, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 164 |
| Çakmaktaşı bıçak | 1 Çakmaktaşı pulu, 1 Çam sapı, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 111 |
| Çakmaktaşı kazıyıcı | 1 Çakmaktaşı pulu, 3 Kemik, 1 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 68 |
| Çakmaktaşı kazma | 1 Çakmaktaşı sivri ucu, 1 Çam sapı, 3 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 252 |
| Çakmaktaşı mızrak | 1 Çakmaktaşı sivri ucu, 1 Uzun sopa, 3 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 292 |
| Çakmaktaşı ok ucu | 8 Çakmaktaşı pulu | – | El yapımı (Tab) | 400 |
| Çakmaktaşı pulu | 1 Yontulmuş çakmaktaşı, 2 İp, 2 Dal, 1 Taş | Çekiç taşı | El yapımı (Tab) | 37 |
| Çakmaktaşı sivri ucu | 7 Yontulmuş çakmaktaşı | – | El yapımı (Tab) | 137 |
| Diken ok ucu | 3 İri diken, 1 İp | – | El yapımı (Tab) | 50 |
| Granit balta | 2 Granit, 1 Meşe sapı, 2 İp, 1 Taş | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 552 |
| Granit kazma | 3 Granit, 1 Meşe sapı, 2 İp, 2 Dal | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 789 |
| Kemik ok ucu | 3 Kemik, 2 Taş | Çekiç taşı | El yapımı (Tab) | 11 |
| Kuvars balta | 1 Yontulmuş kuvars, 1 Huş sapı, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.425 |
| Kuvars bıçak | 1 Kuvars pulu, 1 Huş sapı, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 341 |
| Kuvars kazıyıcı | 1 Kuvars pulu, 3 Kemik, 2 İp, 2 Dal, 1 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 216 |
| Kuvars kazma | 1 Kuvars sivri ucu, 1 Huş sapı, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.782 |
| Kuvars mızrak | 1 Kuvars sivri ucu, 1 Uzun sopa, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.385 |
| Kuvars ok ucu | 10 Kuvars pulu | – | El yapımı (Tab) | 1.903 |
| Kuvars pulu | 1 Yontulmuş kuvars, 3 İp, 2 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 144 |
| Kuvars sivri ucu | 8 Yontulmuş kuvars | – | El yapımı (Tab) | 948 |
| Lav camı ok ucu | 2 Lav camı, 1 İp | – | El yapımı (Tab) | 147 |
| Obsidyen balta | 1 Yontulmuş obsidyen, 1 Mor söğüt sapı, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 5.671 |
| Obsidyen bıçak | 1 Obsidyen pulu, 1 Kül ağacı sapı, 3 İp, 3 Dal, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 366 |
| Obsidyen kazıyıcı | 1 Obsidyen pulu, 3 Kemik, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 215 |
| Obsidyen kazma | 1 Obsidyen sivri ucu, 1 Mor söğüt sapı, 3 İp, 3 Dal, 3 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 5.987 |
| Obsidyen mızrak | 1 Obsidyen sivri ucu, 1 Uzun sopa, 3 İp, 3 Dal, 3 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 4.135 |
| Obsidyen ok ucu | 11 Obsidyen pulu | – | El yapımı (Tab) | 2.058 |
| Obsidyen pulu | 1 Yontulmuş obsidyen, 3 İp, 3 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 141 |
| Obsidyen sivri ucu | 10 Yontulmuş obsidyen | – | El yapımı (Tab) | 1.144 |
| Yontulmuş bazalt | 2 Bazalt, 2 İp, 1 Dal, 1 Taş | Çekiç taşı | El yapımı (Tab) | 132 |
| Yontulmuş çakmaktaşı | 3 Çakmaktaşı, 1 İp | Çekiç taşı | El yapımı (Tab) | 15 |
| Yontulmuş kuvars | 2 Kuvars, 2 İp, 1 Dal, 1 Taş | Çekiç taşı | El yapımı (Tab) | 91 |
| Yontulmuş obsidyen | 1 Obsidyen, 3 İp, 2 Dal, 2 Taş | Çekiç taşı | El yapımı (Tab) | 88 |

#### Temel aletler (70)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ağ | 3 Lif, 1 Halat, 1 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 63 |
| Alevli Bakır ok | 10 Bakır ok, 1 Ateş yağı | – | El yapımı (Tab) | 18 |
| Alevli Basit ok | 10 Basit ok, 1 Ateş yağı | – | El yapımı (Tab) | 16 |
| Alevli Çelik ok | 10 Çelik ok, 1 Ateş yağı | – | El yapımı (Tab) | 5.930 |
| Alevli Demir ok | 10 Demir ok, 1 Ateş yağı | – | El yapımı (Tab) | 926 |
| Alevli Kara çelik ok | 10 Kara çelik ok, 1 Ateş yağı | – | El yapımı (Tab) | 19.692 |
| Alevli Mor kristal ok | 10 Mor kristal ok, 1 Ateş yağı | – | El yapımı (Tab) | 5.220 |
| Alevli Tunç ok | 10 Tunç ok, 1 Ateş yağı | – | El yapımı (Tab) | 674 |
| Bağlı uç | 2 Keskin taş, 3 İp, 1 Dal | – | El yapımı (Tab) | 28 |
| Bakır ok | 1 Bakır külçesi, 4 Dal, 2 Keklik tüyü | – | El yapımı (Tab) | 4 |
| Balık kapanı | 2 Sepet, 3 İp, 1 Dal | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 33 |
| Basit ok | 2 Dal, 1 Keskin taş, 1 Lif | – | El yapımı (Tab) | 2 |
| Basit yay | 1 Uzun sopa, 3 İp, 2 Lif | – | El yapımı (Tab) | 90 |
| Bileği taşı | 2 Kumtaşı, 1 İp, 1 Dal, 1 Taş | Çekiç taşı | Örs · Silahçı Durdu (Orman) ve üstü döver | 17 |
| Bola | 1 Halat, 3 Nehir çakılı, 1 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 63 |
| Çekiç taşı | 4 Nehir çakılı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 5 |
| Çelik ok | 1 Çelik külçesi, 4 Dal, 2 Ur kekliği tüyü | – | El yapımı (Tab) | 489 |
| Demir ok | 1 Demir külçesi, 4 Dal, 2 Ördek tüyü | – | El yapımı (Tab) | 94 |
| Deniz oltası | 1 Olta, 1 Halat, 2 Bakır külçesi, 1 Uzun sopa | – | El yapımı (Tab) | 210 |
| Derin su oltası | 1 Makaralı olta, 3 Demir külçesi, 2 Kenevir halatı, 2 Huş katranı | – | El yapımı (Tab) | 2.227 |
| Dişbudak yayı | 1 Dişbudak sapı, 1 Sinir kirişi, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 128 |
| Dokuma tezgâhı | 1 Çam sapı, 1 Halat, 3 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 114 |
| Fırtına oltası | 1 Derin su oltası, 3 Gümüş külçesi, 2 Kenevir halatı, 2 Balık tutkalı | – | El yapımı (Tab) | 4.464 |
| Halat | 6 İp | – | El yapımı (Tab) | 38 |
| İp | 4 Lif | – | El yapımı (Tab) | 5 |
| Kamış ok gövdesi | 3 Kamış, 1 İp | – | El yapımı (Tab) | 62 |
| Kara çelik ok | 1 Kara çelik külçesi, 4 Dal, 2 Ur kekliği tüyü | – | El yapımı (Tab) | 1.630 |
| Kemik iğne | 2 Kemik, 2 Kum | Bileği taşı | Örs · Silahçı Durdu (Orman) ve üstü döver | 9 |
| Kemik olta iğnesi | 1 Kemik, 1 Keskin taş, 2 Lif | Kemik iğne | El yapımı (Tab) | 10 |
| Kemik zıpkın | 3 Kemik, 1 İp, 1 Uzun sopa | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 57 |
| Keskin Bakır ok | 10 Bakır ok, 1 Bileme macunu | – | El yapımı (Tab) | 9 |
| Keskin Basit ok | 10 Basit ok, 1 Bileme macunu | – | El yapımı (Tab) | 7 |
| Keskin Çelik ok | 10 Çelik ok, 1 Bileme macunu | – | El yapımı (Tab) | 5.921 |
| Keskin Demir ok | 10 Demir ok, 1 Bileme macunu | – | El yapımı (Tab) | 917 |
| Keskin Kara çelik ok | 10 Kara çelik ok, 1 Bileme macunu | – | El yapımı (Tab) | 19.683 |
| Keskin Mor kristal ok | 10 Mor kristal ok, 1 Bileme macunu | – | El yapımı (Tab) | 5.211 |
| Keskin taş | 2 Taş | – | El yapımı (Tab) | 3 |
| Keskin Tunç ok | 10 Tunç ok, 1 Bileme macunu | – | El yapımı (Tab) | 665 |
| Kirmen | 1 Sopa, 1 Taş halka, 2 İp, 2 Dal, 1 Taş | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 59 |
| Kürek | 1 Çam kalası, 2 Keskin taş, 2 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 41 |
| Makaralı olta | 1 Deniz oltası, 2 Tunç külçesi, 1 Kenevir halatı, 2 Bataklık servisi kalası | – | El yapımı (Tab) | 896 |
| Mızrak | 1 Sopa, 2 Keskin taş, 2 İp, 1 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 39 |
| Mor kristal ok | 1 Mor kristal levhası, 4 Dal, 2 Ur kekliği tüyü | – | El yapımı (Tab) | 546 |
| Olta | 1 Uzun sopa, 4 İp, 2 Dal, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 69 |
| Öğütme taşı | 2 Kumtaşı, 1 İp, 1 Dal, 1 Taş (eskiden 2 Granit) | Çekiç taşı | El yapımı (Tab) | 17 |
| Pişirme taşı | 1 Taş levha, 1 Ateş, 2 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 60 |
| Porsuk yayı | 1 Porsuk sapı, 1 Sinir kirişi, 3 İp, 2 Dal, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 130 |
| Sapan | 1 Deri parçası, 1 Halat, 3 İp, 3 Dal, 3 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 293 |
| Sepet | 1 Hasır, 4 İp, 1 Dal, 1 Taş | – | El yapımı (Tab) | 51 |
| Sivri taş | 6 Keskin taş | – | El yapımı (Tab) | 23 |
| Sopa | 3 Dal, 2 Keskin taş | – | El yapımı (Tab) | 12 |
| Taş balta | 1 Sopa, 2 Keskin taş, 2 İp, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 39 |
| Taş bıçak | 1 Sivri taş, 4 Dal, 1 İp, 1 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 43 |
| Taş havan | 1 Taş kase, 3 Nehir çakılı, 1 İp, 1 Dal, 1 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 45 |
| Taş kazma | 1 Sivri taş, 1 Sopa, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 64 |
| Taş kılıç | 1 Sopa, 4 Keskin taş, 2 İp, 1 Çakmaktaşı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 47 |
| Taş savaş çekici | 1 Sopa, 4 Taş, 3 İp | – | El yapımı (Tab) | 40 |
| Taş topuz | 1 Sopa, 2 Taş, 2 İp | – | El yapımı (Tab) | 31 |
| Tunç ok | 1 Tunç külçesi, 4 Dal, 2 Keklik tüyü | – | El yapımı (Tab) | 70 |
| Tuzak | 1 Halat, 1 Sopa, 2 İp, 2 Dal, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 84 |
| Uzun sopa | 1 Sopa, 4 Dal, 1 İp | – | El yapımı (Tab) | 28 |
| Yaprak kova | 4 Yaprak, 3 Lif | – | El yapımı (Tab) | 8 |
| Yıldız oltası | 1 Fırtına oltası, 4 Ametist, 1 Kristal ipek kumaş, 2 Gümüş külçesi | – | El yapımı (Tab) | 6.724 |
| Zehirli Bakır ok | 10 Bakır ok, 1 Zehir yağı | – | El yapımı (Tab) | 47 |
| Zehirli Basit ok | 10 Basit ok, 1 Zehir yağı | – | El yapımı (Tab) | 45 |
| Zehirli Çelik ok | 10 Çelik ok, 1 Zehir yağı | – | El yapımı (Tab) | 5.960 |
| Zehirli Demir ok | 10 Demir ok, 1 Zehir yağı | – | El yapımı (Tab) | 956 |
| Zehirli Kara çelik ok | 10 Kara çelik ok, 1 Zehir yağı | – | El yapımı (Tab) | 19.722 |
| Zehirli Mor kristal ok | 10 Mor kristal ok, 1 Zehir yağı | – | El yapımı (Tab) | 5.249 |
| Zehirli Tunç ok | 10 Tunç ok, 1 Zehir yağı | – | El yapımı (Tab) | 703 |

#### Süs (43)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Altın kolye | 2 Altın külçesi, 1 Kehribar, 1 İp | – | El yapımı (Tab) | 1.142 |
| Ametist yüzük | 2 Ametist, 1 Gümüş külçesi | – | El yapımı (Tab) | 433 |
| Ana tanrıça heykelciği | 1 Kil figürin, 1 Kırmızı boya, 4 İp, 4 Kum | – | El yapımı (Tab) | 289 |
| Av sahnesi duvar resmi | 1 Mağara resmi, 1 Kırmızı boya, 5 İp, 4 Kum | – | El yapımı (Tab) | 347 |
| Ay taşı kolyesi | 1 Ay taşı, 2 İp | – | El yapımı (Tab) | 131 |
| Balık pulu | 2 Sazan, 2 İp, 2 Kum | – | El yapımı (Tab) | 30 |
| Beyaz boncuk | 1 Islak beyaz kil, 4 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 77 |
| Boyalı çömlek | 1 Nehir çömleği, 1 Gelincik boyası, 4 İp, 3 Kum | – | El yapımı (Tab) | 123 |
| Boynuz tarak | 1 Geyik boynuzu, 3 İp, 3 Kum | – | El yapımı (Tab) | 39 |
| Cilalı kristal | 1 Kristal parçası, 4 İp, 4 Kum | Bileği taşı | El yapımı (Tab) | 177 |
| Diş kolye | 1 Kurt dişi, 4 İp, 2 Kum | – | El yapımı (Tab) | 40 |
| Domuz dişi muska | 1 Yaban domuzu dişi, 4 İp, 2 Kum | – | El yapımı (Tab) | 42 |
| El izi resmi | 1 Kırmızı okr tozu, 3 Su, 2 İp, 1 Kum | – | El yapımı (Tab) | 146 |
| Gölge dişi kolyesi | 3 Gölge dişi, 1 Kristal ipek | – | El yapımı (Tab) | 551 |
| Gölge pulu muska | 2 Gölge pulu, 1 Ayna ipeği | – | El yapımı (Tab) | 860 |
| Göl boncuğu | 1 Islak göl kili, 3 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 76 |
| Gümüş yüzük | 1 Gümüş külçesi, 1 Kehribar | – | El yapımı (Tab) | 313 |
| İnci kolye | 3 Sazlı inci, 1 Batık kök | – | El yapımı (Tab) | 230 |
| Kanat yelpazesi | 3 Kaya yarasası kanadı, 2 Dal | – | El yapımı (Tab) | 380 |
| Kartal pençesi kolyesi | 2 Kartal pençesi, 2 İp | – | El yapımı (Tab) | 75 |
| Kehribar boncuk | 1 Kehribar, 4 İp, 3 Kum | Bileği taşı | El yapımı (Tab) | 83 |
| Kehribar kolye | 1 Kehribar boncuk, 6 İp, 3 Kum | – | El yapımı (Tab) | 151 |
| Kemik kolye | 3 Kemik, 3 İp | – | El yapımı (Tab) | 27 |
| Kırmızı boncuk | 1 Islak kırmızı kil, 3 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 104 |
| Kıymık kolye | 2 Mor kıymık, 2 İp | – | El yapımı (Tab) | 88 |
| Kil figürin | 1 Islak beyaz kil, 2 Su, 1 Dal | – | El yapımı (Tab) | 55 |
| Kristal boynuz tılsımı | 1 Kristal boynuz, 1 Işık pulu, 2 İp | – | El yapımı (Tab) | 356 |
| Kristal çiçeği tacı | 3 Kristal çiçeği, 1 Mor sarmaşık | – | El yapımı (Tab) | 412 |
| Kristal kolye | 2 Dağ kristali, 1 Tavan ağı | – | El yapımı (Tab) | 360 |
| Kristal parçası | 1 Kristal, 4 İp, 3 Kum | Çekiç taşı | El yapımı (Tab) | 110 |
| Kül dişi muska | 2 Kül dişi, 1 Halat, 1 Kehribar | – | El yapımı (Tab) | 310 |
| Mağara resmi | 1 Kara boya, 1 Taş levha, 4 İp, 4 Kum | – | El yapımı (Tab) | 78 |
| Nehir boncuğu | 1 Islak nehir kili, 3 İp, 3 Kum | Kemik iğne | El yapımı (Tab) | 38 |
| Papatya tacı | 3 Papatya, 3 Lif | – | El yapımı (Tab) | 8 |
| Pençe kolye | 1 Ayı pençesi, 5 İp, 2 Kum | – | El yapımı (Tab) | 63 |
| Sarkıt parçası | 1 Sarkıt, 3 İp, 3 Kum | Çekiç taşı | El yapımı (Tab) | 31 |
| Taş halka | 2 Kireçtaşı, 2 İp, 1 Kum (eskiden 2 Granit) | Bileği taşı | El yapımı (Tab) | 20 |
| Taş totem | 2 Granit, 1 Yaban mersini boyası, 2 İp, 2 Kum | – | El yapımı (Tab) | 83 |
| Tatlısu incisi | 3 Tatlısu midyesi, 1 İp | – | El yapımı (Tab) | 42 |
| Timsah dişi kolye | 2 Timsah dişi, 2 İp, 1 Kemik | – | El yapımı (Tab) | 104 |
| Volkan camı muska | 2 Volkan camı, 1 Lav yılanı pulu | – | El yapımı (Tab) | 540 |
| Yarasa kanadı yelpazesi | 2 Yarasa kanadı, 1 Kül ağacı sapı, 2 İp | – | El yapımı (Tab) | 273 |
| Yıldız çelengi | 3 Yıldız çiçeği, 2 Mor sarmaşık | – | El yapımı (Tab) | 467 |

#### Taş ve kil (27)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ateş tuğlası | 3 Beyaz kil, 2 Kum, 1 Ateş | – | El yapımı (Tab) | 122 |
| Beyaz çömlek | 1 Islak beyaz kil, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 81 |
| Beyaz kase | 1 Beyaz çömlek, 5 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 123 |
| Beyaz kerpiç | 1 Islak beyaz kil, 3 Kuru ot, 2 Kum, 1 Su | – | El yapımı (Tab) | 54 |
| Beyaz tuğla | 1 Beyaz kerpiç, 1 Ateş, 4 Kum, 3 Su | – | El yapımı (Tab) | 106 |
| Cüruf tuğlası | 3 Cüruf, 2 Kül, 1 Su | – | El yapımı (Tab) | 263 |
| Göl çömleği | 1 Islak göl kili, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 87 |
| Göl kasesi | 1 Göl çömleği, 4 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 128 |
| Göl kerpici | 1 Islak göl kili, 3 Kuru ot, 1 Kum, 1 Su | – | El yapımı (Tab) | 58 |
| Göl tuğlası | 1 Göl kerpici, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 109 |
| Islak beyaz kil | 1 Beyaz kil, 4 Su, 1 Kum | – | El yapımı (Tab) | 36 |
| Islak göl kili | 2 Göl kili, 3 Su | – | El yapımı (Tab) | 40 |
| Islak kırmızı kil | 2 Kırmızı kil, 3 Su, 1 Kum | – | El yapımı (Tab) | 62 |
| Islak nehir kili | 2 Nehir kili, 3 Su | – | El yapımı (Tab) | 11 |
| Kırmızı çömlek | 1 Islak kırmızı kil, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 115 |
| Kırmızı kase | 1 Kırmızı çömlek, 5 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 166 |
| Kırmızı kerpiç | 1 Islak kırmızı kil, 3 Kuru ot, 2 Kum, 1 Su | – | El yapımı (Tab) | 88 |
| Kırmızı tuğla | 1 Kırmızı kerpiç, 1 Ateş, 4 Kum, 3 Su | – | El yapımı (Tab) | 150 |
| Kızıl cam | 3 Kızıl kum, 1 Ateş | – | El yapımı (Tab) | 199 |
| Kireç harcı | 1 Sönmemiş kireç, 5 Su, 2 Kum | – | El yapımı (Tab) | 59 |
| Kristal cam | 3 Kristal kum, 1 Ateş | – | El yapımı (Tab) | 292 |
| Nehir çömleği | 1 Islak nehir kili, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 49 |
| Nehir kasesi | 1 Nehir çömleği, 4 Kum, 4 Su | Bileği taşı | El yapımı (Tab) | 79 |
| Nehir kerpici | 1 Islak nehir kili, 3 Kuru ot, 1 Kum, 1 Su | – | El yapımı (Tab) | 20 |
| Nehir tuğlası | 1 Nehir kerpici, 1 Ateş, 3 Kum, 3 Su | – | El yapımı (Tab) | 60 |
| Sönmemiş kireç | 2 Kireçtaşı, 1 Ateş, 2 Kum, 2 Su | – | El yapımı (Tab) | 36 |
| Taş levha | 2 Kumtaşı, 2 Kum, 1 Su (eskiden 2 Arduvaz) | Çekiç taşı | El yapımı (Tab) | 12 |

#### Yapılar (25)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ağıl | 10 Çit | – | Usta Sinan yapar, yere kurulur | ~250 |
| Arı kovanı | 2 Söğüt sepeti, 1 Balmumu, 3 Taş, 2 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 145 |
| Ateş yeri | 1 Ateş, 4 Taş, 1 Dal, 1 Kum | – | Usta Sinan yapar, yere kurulur | 34 |
| Atölye | 4 Çam kalası, 4 Taş, 2 İp, 2 Sopa | – | Usta Sinan yapar, yere kurulur | 127 |
| Çit | 1 Meşe sapı, 2 Sarmaşık ipi, 2 Dal (→ 2 Çit) | – | El yapımı (Tab), İnşa kipiyle kurulur | ~20 |
| Çömlek fırını | 1 Kerpiç duvar, 1 Çam kömürü, 3 Taş, 3 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 331 |
| Deri çadır | 1 Kulübe iskeleti, 1 Deri parçası, 3 Taş, 3 Dal, 3 Kum | – | Usta Sinan yapar, yere kurulur | 410 |
| Erzak çukuru | 1 Taş levha, 3 Kuru ot, 1 Taş, 1 Dal | – | Usta Sinan yapar, yere kurulur | 22 |
| Hasır yatak | 2 Hasır, 6 Yaprak, 2 Sopa | – | Usta Sinan yapar, yere kurulur | 83 |
| İskele | 1 Bataklık servisi kalası, 1 Kenevir halatı, 3 Taş, 2 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 588 |
| Kamış kulübe | 1 Kulübe iskeleti, 1 Kamış kulübe çatısı, 3 Taş, 2 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 858 |
| Kamış kulübe çatısı | 6 Kamış hasır | – | Usta Sinan yapar, yere kurulur | 522 |
| Kerpiç duvar | 9 Nehir kerpici | – | Usta Sinan yapar, yere kurulur | 234 |
| Kerpiç ev | 1 Kerpiç duvar, 1 Kamış kulübe çatısı, 3 Taş, 3 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 1.007 |
| Kulübe | 1 Kulübe iskeleti, 1 Hasır, 3 Taş, 2 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 201 |
| Kulübe iskeleti | 7 Çam kalası | – | Usta Sinan yapar, yere kurulur | 131 |
| Kurutma rafı | 1 Çam sapı, 1 Hasır, 2 Taş, 2 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 70 |
| Megalit | 2 Granit, 1 Kenevir halatı, 2 Taş, 2 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 560 |
| Su testisi | 1 Nehir çömleği, 3 Su, 2 Taş, 2 Dal, 1 Kum | – | Usta Sinan yapar, yere kurulur | 77 |
| Tabakhane | 1 Deri tulum, 4 Taş, 4 Dal, 3 Kum | – | Usta Sinan yapar, yere kurulur | 663 |
| Taş çember | 11 Megalit | – | Usta Sinan yapar, yere kurulur | 8.117 |
| Taş fırın | 1 Nehir tuğlası, 1 Ateş yeri, 3 Taş, 3 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 138 |
| Tuz havuzu | 1 Tuz, 1 Göl kasesi, 3 Taş, 3 Dal, 3 Kum | – | Usta Sinan yapar, yere kurulur | 259 |
| Tütsühane | 1 Kulübe iskeleti, 1 Duman, 3 Taş, 3 Dal, 2 Kum | – | Usta Sinan yapar, yere kurulur | 234 |
| Yosun yalıtım | 3 Yosun, 1 Islak nehir kili, 1 Taş, 1 Dal | – | Usta Sinan yapar, yere kurulur | 67 |

#### İnşa parçaları (7)

Üs kurma parçaları (Sistemler › Üs kurma). Zemin, yol, çit, duvar ve kapı el yapımıdır ve kazanda öğrenilir; İnşa kipiyle kurulur. Fiyatlar tek parça içindir.

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ahşap parke | 1 Meşe kalası (→ 4) | – | El yapımı (Tab), İnşa kipiyle kurulur | ~6 |
| Çakıl yol | 3 Nehir çakılı, 1 Kum (→ 4) | – | El yapımı (Tab), İnşa kipiyle kurulur | ~2 |
| Dal çit | 4 Dal, 2 Lif (→ 2) | – | El yapımı (Tab), İnşa kipiyle kurulur | ~4 |
| Direk feneri | 1 Sopa, 1 Kil lamba, 1 Hayvan yağı | – | Usta Sinan yapar, İnşa kipiyle kurulur | ~170 |
| Tahta kapı | 2 Çit, 1 İp | – | El yapımı (Tab), İnşa kipiyle kurulur | ~54 |
| Taş duvar | 4 Taş, 1 Kireçtaşı, 1 Kum | – | El yapımı (Tab), İnşa kipiyle kurulur | ~8 |
| Toprak yol | 2 Taş, 1 Kum (→ 4) | – | El yapımı (Tab), İnşa kipiyle kurulur | ~1 |

#### Giyim (10)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Deri çarık | 1 Deri parçası, 2 Sinir, 3 Yaprak | – | El yapımı (Tab) | 276 |
| Kamış çizme | 6 Kamış, 3 İp, 2 Yosun | – | El yapımı (Tab) | 149 |
| Kemik çizme | 4 Kemik, 1 Deri parçası, 3 Yaprak | – | El yapımı (Tab) | 289 |
| Kemik eldiven | 4 Kemik, 2 Sinir, 1 Deri parçası, 3 Lif | – | El yapımı (Tab) | 298 |
| Kemik miğfer | 4 Kemik, 2 Sinir, 1 Deri parçası, 2 Taş | – | El yapımı (Tab) | 292 |
| Kemik zırh | 8 Kemik, 3 Sinir, 2 Deri parçası | – | El yapımı (Tab) | 623 |
| Kristal ipek kumaş | 4 Kristal ipek, 2 Lif | – | El yapımı (Tab) | 476 |
| Kürk başlık | 1 Deri parçası, 2 Sinir, 2 Taş | – | El yapımı (Tab) | 277 |
| Kürk eldiven | 1 Deri parçası, 2 Sinir, 3 Lif | – | El yapımı (Tab) | 270 |
| Kürk yelek | 2 Deri parçası, 2 Sinir | – | El yapımı (Tab) | 47 |

#### Av ve hayvan (6)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ağ kapanı | 3 Tavan ağı, 1 Rüzgâr taşı | – | El yapımı (Tab) | 420 |
| Balık yağı | 1 Yayın, 3 Su, 3 Lif | Taş havan | El yapımı (Tab) | 21 |
| Duman fişeği | 1 Duman özü, 1 Kükürt kristali, 1 Kül mantarı | – | El yapımı (Tab) | 420 |
| Sinir kirişi | 2 Sinir (su, lif ve Taş bıçak istemez) | – | El yapımı (Tab) | 16 |
| Sülük yemi | 2 Sülük, 1 Siyah balçık | – | El yapımı (Tab) | 160 |
| Yıldız tozu yemi | 2 Yıldız tozu, 1 Işık sporu | – | El yapımı (Tab) | 504 |

#### Ateş (18)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ateş | 1 Kıvılcım, 4 Dal, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Balmumu mumu | 1 Balmumu, 3 Lif, 3 Dal, 3 Yaprak | – | El yapımı (Tab) | 134 |
| Don yağı mumu | 2 Hayvan yağı, 3 Lif | – | El yapımı (Tab) | 11 |
| Duman | 1 Ateş, 4 Yaprak, 2 Dal | – | El yapımı (Tab) | 34 |
| Golem feneri | 1 Golem çekirdeği, 2 Kristal, 2 Mor söğüt kalası | – | El yapımı (Tab) | 1.188 |
| Hasırotu meşalesi | 3 Hasırotu, 2 Hayvan yağı | – | El yapımı (Tab) | 58 |
| Işık fitili | 2 Işık tozu, 2 Lif | – | El yapımı (Tab) | 216 |
| Kaba meşale | 2 Dal, 2 Lif, 2 Yaprak | – | El yapımı (Tab) | 7 |
| Kamp ateşi | 5 Dal, 3 Taş, 2 Kuru ot, 1 Çakmaktaşı | – | El yapımı (Tab) | 14 |
| Kav | 3 Kav mantarı, 1 Kıvılcım, 1 Dal, 1 Yaprak | – | El yapımı (Tab) | 98 |
| Kıvılcım | 3 Çakmaktaşı, 3 Taş | – | El yapımı (Tab) | 11 |
| Kil lamba | 1 Nehir kasesi, 2 Hayvan yağı, 4 Dal, 3 Yaprak | – | El yapımı (Tab) | 129 |
| Kor | 1 Ateş, 1 Çam kömürü, 4 Dal, 3 Yaprak | – | El yapımı (Tab) | 40 |
| Kozalak ateşi | 3 Çam kozalağı, 1 Kıvılcım, 1 Dal, 1 Yaprak | – | El yapımı (Tab) | 20 |
| Kükürt çakmağı | 2 Kükürt, 1 Pirit, 2 Kuru ot | – | El yapımı (Tab) | 156 |
| Meşale | 1 Sopa, 1 Çam reçinesi, 3 Dal, 3 Yaprak | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 61 |
| Pirit çakmağı | 1 Pirit, 3 Çakmaktaşı, 2 Dal, 1 Yaprak | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 47 |
| Taş lamba | 1 Taş kase, 2 Hayvan yağı, 2 Dal, 2 Yaprak | – | El yapımı (Tab) | 45 |

#### Zırh (50)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ametist miğfer | 2 Ametist, 1 Kristal ipek, 1 Deri parçası, 2 Taş | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 3.932 |
| Bakır çizme | 4 Bakır cevheri, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 251 |
| Bakır eldiven | 4 Bakır cevheri, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 259 |
| Bakır miğfer | 4 Bakır cevheri, 1 Deri parçası, 2 Sinir, 2 Taş | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 254 |
| Bakır zırh | 10 Bakır cevheri, 2 Deri parçası, 2 Sinir | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 542 |
| Ceviz kabuğu miğfer | 6 Ceviz, 2 Meşe odunu, 1 Deri parçası, 2 İri diken, 2 Taş | – | Örs · Zırhçı Duran (Orman) ve üstü döver | 948 |
| Çelik çizme | 6 Demir cevheri, 2 Taş kömürü, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.269 |
| Çelik eldiven | 6 Demir cevheri, 2 Taş kömürü, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.282 |
| Çelik miğfer | 6 Demir cevheri, 2 Taş kömürü, 1 Deri parçası, 2 Sinir, 2 Taş | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.275 |
| Çelik zırh | 15 Demir cevheri, 5 Taş kömürü, 2 Deri parçası, 2 Sinir | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 3.499 |
| Demir çizme | 4 Demir cevheri, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.001 |
| Demir eldiven | 4 Demir cevheri, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.011 |
| Demir miğfer | 4 Demir cevheri, 1 Deri parçası, 2 Sinir, 2 Taş | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.013 |
| Demir zırh | 10 Demir cevheri, 2 Deri parçası, 2 Sinir | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 2.786 |
| Ejder çizmesi | 1 Kara pul, 2 Kül kurdu postu, 3 Yaprak | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 3.108 |
| Ejder eldiveni | 1 Kara pul, 2 Lav pulu, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 3.116 |
| Ejder miğferi | 1 Kara pul, 3 Demir cevheri, 1 Deri parçası, 2 Taş | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 3.134 |
| Ejder pulu eldiven ² | 4 Yavru ejder pulu, 2 Ejder dişi, 1 Mantar lifi eldiven | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 2.924 |
| Ejder zırhı | 2 Kara pul, 6 Demir cevheri, 2 Deri parçası | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 7.720 |
| Fırtına tüyü başlık ² | 4 Fırtına tüyü, 2 Gök tazısı postu, 1 Demir miğfer | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 1.939 |
| Gümüş çizme | 2 Gümüş cevheri, 1 Demir cevheri, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.423 |
| Gümüş eldiven | 2 Gümüş cevheri, 1 Demir cevheri, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.438 |
| Gümüş pullu zırh | 6 Gümüş cevheri, 3 Demir cevheri, 2 Deri parçası, 2 Ayı pençesi | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 3.945 |
| Hurda çizme ² | 2 Ağır plaka, 6 Vida, 4 Dişli, 1 Demir çizme | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 1.597 |
| Işık pulu eldiven | 4 Işık pulu, 2 Kristal, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 3.953 |
| Kara çelik çizme | 6 Demir cevheri, 4 Obsidyen, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 2.828 |
| Kara çelik eldiven | 6 Demir cevheri, 4 Obsidyen, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 2.835 |
| Kara çelik miğfer | 6 Demir cevheri, 4 Obsidyen, 1 Deri parçası, 2 Sinir, 2 Taş | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 2.830 |
| Kara çelik zırh | 15 Demir cevheri, 10 Obsidyen, 2 Deri parçası, 2 Sinir | – | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | 6.984 |
| Kartal tüyü miğfer | 6 Kartal tüyü, 2 Gümüş cevheri, 2 Öküz boynuzu, 1 Deri parçası, 2 Taş | – | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | 1.422 |
| Kristal ipek çizme | 2 Kristal ipek, 1 Işık pulu, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 3.886 |
| Kristal ipek zırh | 5 Kristal ipek, 3 Ametist, 6 Demir cevheri, 2 Deri parçası | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 9.704 |
| Kristal miğfer ² | 3 Kristal kanat, 4 Golem parçası, 2 Kobalt külçesi, 1 Fırtına tüyü başlık | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 3.692 |
| Mantar lifi eldiven ² | 4 Böcek kabuğu, 4 Spor tozu, 2 Goblin kulağı, 1 Demir eldiven | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 1.486 |
| Meka çizme ² | 3 Titanyum külçesi, 2 Uzaylı devresi, 1 Muhafız zırhı parçası, 1 Hurda çizme | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 4.324 |
| Meka zırh ² | 4 Titanyum külçesi, 3 Kobalt külçesi, 2 Enerji hücresi, 1 Motor, 1 Golem çekirdeği | – | Mühendis Işın yapar (600 sikke işçilik) | 5.364 |
| Meşe kabuk çizme | 2 Meşe odunu, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Duran (Orman) ve üstü döver | 905 |
| Meşe kabuk eldiven | 2 Meşe odunu, 1 Deri parçası, 3 Kirpi dikeni, 3 Lif | – | Örs · Zırhçı Duran (Orman) ve üstü döver | 915 |
| Meşe kabuk zırh | 6 Meşe odunu, 2 Deri parçası, 6 Kirpi dikeni, 2 Sinir | – | Örs · Zırhçı Duran (Orman) ve üstü döver | 2.509 |
| Mor kristal çizme | 4 Kristal, 2 Ametist, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 3.538 |
| Mor kristal eldiven | 4 Kristal, 2 Ametist, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 3.547 |
| Mor kristal miğfer | 4 Kristal, 2 Ametist, 1 Deri parçası, 2 Sinir, 2 Taş | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 3.540 |
| Mor kristal zırh | 10 Kristal, 5 Ametist, 2 Deri parçası, 2 Sinir | – | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | 8.737 |
| Timsah eldiven | 1 Timsah derisi, 1 Demir cevheri, 3 Lif | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.135 |
| Timsah miğfer | 2 Timsah derisi, 1 Demir cevheri, 2 Sinir, 2 Taş | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 1.128 |
| Timsah pulu zırh | 6 Demir cevheri, 3 Timsah derisi, 2 Bataklık kurdu postu, 2 Sinir | – | Örs · Zırhçı Veli (Bataklık) ve üstü döver | 3.135 |
| Tunç çizme | 4 Bakır cevheri, 2 Kalay cevheri, 1 Deri parçası, 3 Yaprak | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 780 |
| Tunç eldiven | 4 Bakır cevheri, 2 Kalay cevheri, 1 Deri parçası, 3 Lif | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 788 |
| Tunç miğfer | 4 Bakır cevheri, 2 Kalay cevheri, 1 Deri parçası, 2 Sinir, 2 Taş | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 783 |
| Tunç zırh | 10 Bakır cevheri, 5 Kalay cevheri, 2 Deri parçası, 2 Sinir | – | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | 2.160 |

#### Ev eşyası (14)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ahşap karyola | 4 Çam kalası, 2 Deri parçası, 6 Kuru ot | – | Usta Sinan yapar (ev içine konur) | 475 |
| Asma fener | 1 Balmumu mumu, 1 Meşe kalası, 1 Halat | – | Usta Sinan yapar (ev içine konur) | 269 |
| Dolap | 5 Çam kalası, 1 Halat, 1 Gelincik boyası | – | Usta Sinan yapar (ev içine konur) | 174 |
| Duvar halısı | 2 Keten kumaş, 2 Mürver boyası, 1 Sopa | – | Usta Sinan yapar (ev içine konur) | 582 |
| Halı | 3 Keten kumaş, 2 Mürver boyası, 2 Keten ipliği | – | Usta Sinan yapar (ev içine konur) | 997 |
| Kilim | 3 Keten ipliği, 1 Mürver boyası, 6 Lif | – | Usta Sinan yapar (ev içine konur) | 437 |
| Masa | 3 Çam kalası, 4 Sopa, 2 İp | – | Usta Sinan yapar (ev içine konur) | 139 |
| Mor yosun yastığı | 4 Mor yosun, 3 Lif | – | Usta Sinan yapar (ev içine konur) | 342 |
| Perde | 2 Keten kumaş, 1 Sopa, 2 İp | – | Usta Sinan yapar (ev içine konur) | 429 |
| Raf | 2 Çam kalası, 2 İp, 1 Sopa | – | Usta Sinan yapar (ev içine konur) | 70 |
| Saksı | 1 Nehir çömleği, 2 Kum, 2 Papatya | – | Usta Sinan yapar (ev içine konur) | 72 |
| Sandalye | 2 Çam kalası, 2 Sopa, 2 İp | – | Usta Sinan yapar (ev içine konur) | 86 |
| Sandık | 4 Çam kalası, 1 Halat, 2 Taş | – | Usta Sinan yapar (ev içine konur) | 135 |
| Tabure | 1 Çam kalası, 3 Sopa, 1 İp | – | Usta Sinan yapar (ev içine konur) | 76 |

#### Boya (18)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Beyaz boya | 1 Beyaz kil, 2 Hayvan yağı, 2 Su, 2 Kum | – | El yapımı (Tab) | 42 |
| Böcek kabuğu boyası | 2 Kök böceği kabuğu, 1 Su | – | El yapımı (Tab) | 75 |
| Damla akı boyası | 2 Damla taşı, 1 Su | – | El yapımı (Tab) | 40 |
| Gelincik boyası | 3 Gelincik, 2 Hayvan yağı, 1 Su | – | El yapımı (Tab) | 16 |
| Işıltılı boya | 3 Güve tozu, 1 Su | – | El yapımı (Tab) | 182 |
| Kara boya | 1 Çam kömürü, 2 Hayvan yağı, 3 Su, 3 Kum | – | El yapımı (Tab) | 20 |
| Kırmızı boya | 1 Kırmızı okr tozu, 2 Hayvan yağı, 3 Su, 2 Kum | – | El yapımı (Tab) | 143 |
| Kırmızı okr tozu | 2 Kırmızı okr, 2 Su, 2 Kum | Taş havan | El yapımı (Tab) | 100 |
| Kükürt sarısı boya | 2 Kükürt kristali, 1 Su | – | El yapımı (Tab) | 210 |
| Liken boyası | 3 Liken, 1 Su | – | El yapımı (Tab) | 92 |
| Mor damar boyası | 2 Mor damar taşı, 1 Su | – | El yapımı (Tab) | 300 |
| Mor kök boyası | 2 Mor kök, 1 Su | – | El yapımı (Tab) | 188 |
| Mürver boyası | 3 Mürver, 2 Hayvan yağı, 1 Su | – | El yapımı (Tab) | 63 |
| Sarı boya | 1 Sarı okr tozu, 2 Hayvan yağı, 3 Su, 2 Kum | – | El yapımı (Tab) | 143 |
| Sarı okr tozu | 2 Sarı okr, 2 Su, 2 Kum | Taş havan | El yapımı (Tab) | 100 |
| Yaban mersini boyası | 2 Yaban mersini, 2 Hayvan yağı, 1 Su, 1 Kum | – | El yapımı (Tab) | 30 |
| Yıldız mürekkebi | 2 Yıldız tozu, 1 Su | – | El yapımı (Tab) | 211 |
| Yosun yeşili boya | 2 Parıltı yosunu, 1 Su | – | El yapımı (Tab) | 95 |

#### Taşıtlar (10)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Gemi | 8 Mor söğüt kalası, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek | Taş balta | El yapımı (Tab) | 2.913 |
| Kızak | 1 Çam kalası, 2 Hayvan yağı, 2 İp, 2 Dal | – | El yapımı (Tab) | 41 |
| Kütük salı | 2 Çam odunu, 1 Halat, 2 İp, 2 Dal | – | El yapımı (Tab) | 73 |
| Oyma kano | 2 Çam odunu, 1 Kor, 4 İp, 3 Dal | – | El yapımı (Tab) | 97 |
| Roket ² | 1 Roket gövdesi, 1 Roket motoru, 4 Uzaylı devresi, 6 Gök ipeği | – | Astronot Gökay yapar (2000 sikke işçilik) | 30.243 |
| Roket gövdesi ² | 4 Meteor demiri külçesi, 4 Titanyum külçesi, 3 Gök camı | – | Astronot Gökay yapar (1000 sikke işçilik) | 9.187 |
| Roket motoru ² | 2 Yıldız külçesi, 3 Plazma hücresi, 1 Ejder kalbi, 1 Yakıt hücresi | – | Astronot Gökay yapar (1500 sikke işçilik) | 14.000 |
| Sal | 1 Çam kalası, 1 Halat, 3 İp, 3 Dal | – | El yapımı (Tab) | 92 |
| Sandal küreği | 1 Çam kalası, 3 İp, 3 Dal | – | El yapımı (Tab) | 52 |
| Yelkenli sal | 1 Sal, 3 Hasır, 2 Halat, 2 Uzun sopa, 1 Sandal küreği | Taş balta | El yapımı (Tab) | 640 |

#### Metal (12)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Altın külçesi | 3 Altın cevheri, 1 Mor söğüt kömürü | – | El yapımı (Tab) | 409 |
| Bakır külçesi | 3 Bakır cevheri, 1 Çam kömürü | – | El yapımı (Tab) | 23 |
| Çelik külçesi | 2 Demir külçesi, 2 Huş kömürü, 1 Ateş tuğlası | – | El yapımı (Tab) | 625 |
| Demir halka | 1 Demir külçesi, 1 Turba, 2 Kum | – | El yapımı (Tab) | 188 |
| Demir külçesi | 3 Demir cevheri, 2 Turba, 1 Taş | – | El yapımı (Tab) | 120 |
| Demir levha | 2 Demir külçesi, 1 Turba | – | El yapımı (Tab) | 353 |
| Gümüş külçesi | 3 Gümüş cevheri, 1 Huş kömürü | – | El yapımı (Tab) | 195 |
| Kalay külçesi | 3 Kalay cevheri, 1 Meşe kömürü | – | El yapımı (Tab) | 69 |
| Kara çelik külçesi | 2 Çelik külçesi, 3 Obsidyen, 1 Kükürt, 2 Kül ağacı kömürü | – | El yapımı (Tab) | 2.122 |
| Mor kristal levhası | 3 Kristal, 2 Ametist, 1 Altın külçesi | – | El yapımı (Tab) | 998 |
| Tunç külçesi | 3 Bakır külçesi, 1 Kalay külçesi | – | El yapımı (Tab) | 191 |
| Tunç levha | 2 Tunç külçesi, 1 Meşe kömürü | – | El yapımı (Tab) | 566 |

#### Metal aletler (85)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Akçaağaç yayı | 3 Akçaağaç odunu, 2 Sinir kirişi, 1 Çelik külçesi | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.022 |
| Alevli Mızrak | 1 Mızrak, 1 Ateş yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 179 |
| Alevli Taş kılıç | 1 Taş kılıç, 1 Ateş yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 188 |
| Alevli Taş savaş çekici | 1 Taş savaş çekici, 1 Ateş yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 180 |
| Alevli Taş topuz | 1 Taş topuz, 1 Ateş yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 171 |
| Ametist kılıcı | 5 Ametist, 3 Obsidyen, 2 Kristal, 1 Işık ağacı sapı, 2 Gölge dişi | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 7.978 |
| Ametist savaş çekici | 4 Ametist, 2 Obsidyen, 1 Işık ağacı sapı, 1 Zehir yağı | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 9.403 |
| Ametist topuz | 2 Ametist, 1 Obsidyen, 1 Işık ağacı sapı, 1 Zehir yağı | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 5.717 |
| Bakır balta | 3 Bakır külçesi, 1 Çam sapı, 2 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 143 |
| Bakır kazma | 3 Bakır külçesi, 1 Çam sapı, 2 İp, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 146 |
| Bakır kılıç | 4 Bakır külçesi, 1 Çam sapı, 1 Deri parçası | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 346 |
| Bakır mızrak | 2 Bakır külçesi, 1 Uzun sopa, 3 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 150 |
| Bakır savaş çekici | 5 Bakır külçesi, 1 Çam sapı, 1 Sinir kirişi | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 211 |
| Bakır topuz | 3 Bakır külçesi, 1 Çam sapı, 2 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 143 |
| Çakmaktaşı kılıç | 3 Yontulmuş çakmaktaşı, 1 Çam sapı, 2 İp, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 398 |
| Çakmaktaşı savaş çekici | 4 Yontulmuş çakmaktaşı, 1 Çam sapı, 1 Sinir kirişi, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 243 |
| Çakmaktaşı topuz | 2 Yontulmuş çakmaktaşı, 1 Çam sapı, 2 İp, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 164 |
| Çam yayı | 3 Çam odunu, 1 Sinir kirişi, 1 Bakır külçesi | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 112 |
| Çelik balta | 3 Çelik külçesi, 1 Huş sapı, 2 İp | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 2.574 |
| Çelik kılıç | 4 Çelik külçesi, 1 Huş sapı, 1 Deri parçası | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 3.560 |
| Çelik mızrak | 2 Çelik külçesi, 1 Uzun sopa, 3 İp | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.730 |
| Çelik savaş çekici | 5 Çelik külçesi, 1 Huş sapı, 1 Sinir kirişi | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 4.207 |
| Çelik topuz | 3 Çelik külçesi, 1 Huş sapı, 2 İp | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 2.574 |
| Demir balta | 3 Demir külçesi, 1 Bataklık servisi sapı, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 806 |
| Demir kazma | 4 Demir külçesi, 1 Bataklık servisi sapı, 1 Sinir kirişi, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.125 |
| Çelik kazma | 3 Çelik külçesi, 1 Huş sapı, 2 İp, 2 Taş | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 2.576 |
| Demir kılıç | 5 Demir külçesi, 1 Bataklık servisi sapı, 1 Deri parçası, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.655 |
| Demir mızrak | 3 Demir külçesi, 1 Uzun sopa, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 771 |
| Demir savaş çekici | 5 Demir külçesi, 1 Bataklık servisi sapı, 1 Sinir kirişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.697 |
| Demir topuz | 3 Demir külçesi, 1 Bataklık servisi sapı, 2 İp | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.054 |
| Ejder baltası | 1 Ejder kemiği, 1 Kara çelik külçesi, 1 Kül ağacı sapı, 2 İp | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 6.007 |
| Ejder kazması | 1 Ejder kemiği, 1 Bazalt sivri ucu, 1 Kara çelik külçesi, 1 Kül ağacı sapı | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 6.672 |
| Ejder kılıcı | 2 Ejder kemiği, 1 Kara çelik külçesi, 1 Deri parçası, 1 Ateş yağı (eski tarif Mor Kristal Vadisi'nin altınını istiyordu) | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 7.539 |
| Ejder mızrağı | 1 Ejder kemiği, 1 Bazalt sivri ucu, 1 Uzun sopa, 3 İp, 1 Ateş yağı | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 3.616 |
| Ejder savaş çekici | 2 Ejder kemiği, 2 Kara çelik külçesi, 1 Kızıl sedir sapı, 1 Ateş yağı | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 10.398 |
| Ejder topuzu | 1 Ejder kemiği, 1 Kara çelik külçesi, 1 Kızıl sedir sapı, 1 Ateş yağı | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 5.998 |
| Ejder yayı | 3 Kül ağacı odunu, 1 Ejder kemiği, 2 Sinir kirişi | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 1.671 |
| Gece ağacı yayı | 3 Gece ağacı odunu, 2 Sinir kirişi, 1 Mor kristal levhası | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 2.211 |
| Granit kılıç | 3 Granit, 1 Meşe sapı, 1 Sinir kirişi, 1 Bileme macunu | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 1.213 |
| Granit mızrak | 2 Granit, 1 Uzun sopa, 3 İp, 1 Bileme macunu | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 532 |
| Granit savaş çekici | 4 Granit, 1 Meşe sapı, 3 Yaban domuzu dişi, 1 Sinir kirişi | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 1.300 |
| Granit topuz | 2 Granit, 1 Meşe sapı, 2 İp, 1 Bileme macunu | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 780 |
| Gümüş kılıç | 4 Gümüş külçesi, 3 Kuvars, 1 Ardıç sapı, 2 Kartal pençesi | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 2.576 |
| Huş yayı | 3 Huş odunu, 2 Sinir kirişi, 1 Gümüş külçesi | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 767 |
| Ihlamur yayı | 3 Ihlamur odunu, 2 Sinir kirişi, 1 Granit | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 295 |
| Işık ağacı yayı | 3 Işık ağacı odunu, 2 Sinir kirişi, 1 Ametist | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 2.097 |
| Kara çelik balta | 3 Kara çelik külçesi, 1 Kül ağacı sapı, 2 İp | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 8.440 |
| Kara çelik kazma | 3 Kara çelik külçesi, 1 Kül ağacı sapı, 2 İp, 2 Taş | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 8.442 |
| Kara çelik kılıç | 4 Kara çelik külçesi, 1 Kül ağacı sapı, 1 Deri parçası | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 11.371 |
| Kara çelik mızrak | 2 Kara çelik külçesi, 1 Uzun sopa, 3 İp | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 5.574 |
| Kara çelik savaş çekici | 5 Kara çelik külçesi, 1 Kül ağacı sapı, 1 Sinir kirişi | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 13.965 |
| Kara çelik topuz | 3 Kara çelik külçesi, 1 Kül ağacı sapı, 2 İp | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 8.440 |
| Kemik yay | 3 Kemik, 1 Uzun sopa, 1 Sinir kirişi | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 129 |
| Keskin Mızrak | 1 Mızrak, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 90 |
| Keskin Taş kılıç | 1 Taş kılıç, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 99 |
| Keskin Taş savaş çekici | 1 Taş savaş çekici, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 91 |
| Keskin Taş topuz | 1 Taş topuz, 1 Bileme macunu | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 81 |
| Kızılağaç yayı | 3 Kızılağaç odunu, 2 Sinir kirişi, 1 Demir külçesi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 426 |
| Kızıl sedir yayı | 3 Kızıl sedir odunu, 2 Sinir kirişi, 1 Kara çelik külçesi | – | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 2.961 |
| Kuvars savaş çekici | 3 Yontulmuş kuvars, 1 Ardıç sapı, 1 Sinir kirişi, 1 Bileme macunu | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 2.333 |
| Kuvars topuz | 2 Yontulmuş kuvars, 1 Ardıç sapı, 2 İp, 1 Bileme macunu | – | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.459 |
| Meşe yayı | 3 Meşe odunu, 1 Sinir kirişi, 1 Tunç külçesi | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 304 |
| Mor kristal balta | 3 Mor kristal levhası, 1 Mor söğüt sapı, 2 İp | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 6.070 |
| Mor kristal kazma | 3 Mor kristal levhası, 1 Mor söğüt sapı, 2 İp, 2 Taş | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 6.073 |
| Mor kristal kılıç | 4 Mor kristal levhası, 1 Mor söğüt sapı, 1 Deri parçası | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 8.242 |
| Mor kristal mızrak | 2 Mor kristal levhası, 1 Uzun sopa, 3 İp | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 3.985 |
| Mor kristal savaş çekici | 5 Mor kristal levhası, 1 Mor söğüt sapı, 1 Sinir kirişi | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 9.993 |
| Mor kristal topuz | 3 Mor kristal levhası, 1 Mor söğüt sapı, 2 İp | – | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 6.070 |
| Söğüt yayı | 3 Söğüt odunu, 2 Sinir kirişi, 1 Timsah dişi | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 405 |
| Timsah dişi balta | 2 Timsah dişi, 1 Demir külçesi, 1 Bataklık servisi sapı, 2 İp | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 756 |
| Timsah dişi kazma | 2 Timsah dişi, 2 Demir külçesi, 1 Bataklık servisi sapı, 2 Taş | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.112 |
| Timsah dişi kılıcı | 4 Demir külçesi, 3 Timsah dişi, 1 Bataklık servisi sapı, 1 Deri parçası | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.863 |
| Timsah dişi mızrak | 2 Timsah dişi, 1 Uzun sopa, 3 İp, 1 Zehir yağı | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 691 |
| Timsah dişi savaş çekici | 3 Timsah dişi, 2 Demir külçesi, 1 Bataklık servisi sapı, 1 Zehir yağı | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.730 |
| Timsah dişi topuz | 2 Timsah dişi, 1 Demir külçesi, 1 Bataklık servisi sapı, 1 Zehir yağı | – | Örs · Silahçı Ali (Bataklık) ve üstü döver | 1.078 |
| Tunç balta | 2 Tunç külçesi, 1 Meşe sapı, 2 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 572 |
| Tunç kazma | 3 Tunç külçesi, 1 Meşe sapı, 2 İp, 2 Taş | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 823 |
| Tunç kılıç | 4 Tunç külçesi, 1 Meşe sapı, 1 Deri parçası | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 1.242 |
| Tunç mızrak | 2 Tunç külçesi, 1 Uzun sopa, 3 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 553 |
| Tunç savaş çekici | 5 Tunç külçesi, 1 Meşe sapı, 1 Sinir kirişi | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 1.325 |
| Tunç topuz | 3 Tunç külçesi, 1 Meşe sapı, 2 İp | – | Örs · Silahçı Durdu (Orman) ve üstü döver | 820 |
| Zehirli Mızrak | 1 Mızrak, 1 Zehir yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 132 |
| Zehirli Taş kılıç | 1 Taş kılıç, 1 Zehir yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 140 |
| Zehirli Taş savaş çekici | 1 Taş savaş çekici, 1 Zehir yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 133 |
| Zehirli Taş topuz | 1 Taş topuz, 1 Zehir yağı | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 123 |

#### Müzik (12)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Boynuz borazan | 1 Öküz boynuzu, 3 Lif, 3 Dal | Bileği taşı | El yapımı (Tab) | 30 |
| Deri davul | 1 Deri parçası, 1 Nehir kasesi, 5 Lif, 5 Dal | – | El yapımı (Tab) | 337 |
| Gümüş çan | 3 Gümüş filizi, 1 Tavan ağı | – | El yapımı (Tab) | 440 |
| Kamış flüt | 3 Kamış, 1 Lif | Kemik iğne | El yapımı (Tab) | 53 |
| Kemik flüt | 3 Kemik, 1 Lif | – | El yapımı (Tab) | 21 |
| Kor zurnası | 2 Kor kabuğu, 1 Kor taşı | – | El yapımı (Tab) | 500 |
| Kök flütü | 1 Kök yılanı derisi, 1 Kök reçinesi, 1 Dal | – | El yapımı (Tab) | 95 |
| Kristal zil ² | 2 Kristal kanat, 1 Ayna taşı | – | El yapımı (Tab) | 700 |
| Pişmiş kil düdük | 1 Islak nehir kili, 1 Sopa, 3 Lif, 2 Dal | – | El yapımı (Tab) | 37 |
| Semender derisi tef | 2 Semender derisi, 2 Batık kök, 1 Dal | – | El yapımı (Tab) | 270 |
| Yankı çanı | 2 Yankı taşı, 1 Mor söğüt kalası, 1 İp | – | El yapımı (Tab) | 346 |
| Yarasa zarı davul | 3 Yarasa zarı, 2 Taş örümceği ipi, 2 Dal | – | El yapımı (Tab) | 130 |

#### Maden (6)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Gök demiri külçesi ² | 3 Gök demiri, 2 Taş kömürü, 1 Taş | – | El yapımı (Tab) | 149 |
| Kobalt külçesi ² | 3 Kobalt cevheri, 2 Taş kömürü | – | El yapımı (Tab) | 202 |
| Meteor demiri külçesi ² | 3 Meteor demiri, 2 Taş kömürü, 1 Füzyon taşı | – | El yapımı (Tab) | 408 |
| Pirinç külçesi ² | 3 Pirinç cevheri, 1 Taş kömürü | – | El yapımı (Tab) | 111 |
| Titanyum külçesi ² | 3 Titanyum cevheri, 2 Taş kömürü, 1 Enerji taşı | – | El yapımı (Tab) | 291 |
| Yıldız külçesi ² | 3 Yıldız cevheri, 1 Plazma hücresi | – | El yapımı (Tab) | 1.135 |

#### Tarım (6)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Buğday unu | 3 Buğday | – | El yapımı (Tab) | 48 |
| Hasat sepeti | 6 Lif, 2 Söğüt dalı | – | El yapımı (Tab) | 144 |
| Korkuluk | 2 Sopa, 4 Kuru ot, 1 İp | – | El yapımı (Tab) | 74 |
| Sulama kabı | 1 Nehir çömleği, 2 İp, 1 Sopa | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 96 |
| Tırmık | 2 Sopa, 3 Keskin taş, 1 İp | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 50 |
| Tırpan | 1 Uzun sopa, 2 Çakmaktaşı pulu, 2 İp, 1 Dal | – | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 153 |

#### Silah (5)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Işın kılıcı ² | 2 Titanyum külçesi, 2 Plazma hücresi, 2 Ejder dişi, 3 Kristal lifi | – | Ejder Avcısı Tomris yapar (800 sikke işçilik) | 6.447 |
| Pompalı ² | 1 Ağır plaka, 4 Dişli, 2 Hurda palmiyesi kalası, 6 Vida, 1 Motor | – | Silahçı Tufan yapar (400 sikke işçilik) | 2.600 |
| Pompalı fişeği ² | 1 Pirinç külçesi, 2 Barut | – | El yapımı (Tab) | 126 |
| Tabanca ² | 2 Gök demiri külçesi, 3 Dişli, 1 Çam sapı, 4 Vida | – | Silahçı Tufan yapar (200 sikke işçilik) | 1.447 |
| Tabanca mermisi ² | 1 Pirinç külçesi, 1 Barut | – | El yapımı (Tab) | 83 |

#### Temel (4)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Buhar | 1 Sıcak su, 1 Ateş, 4 Taş, 3 Su | – | El yapımı (Tab) | 83 |
| Gübre | 2 Yarasa gübresi, 3 Kuru ot | – | El yapımı (Tab) | 11 |
| Sıcak su | 4 Su, 1 Ateş, 2 Taş | – | El yapımı (Tab) | 34 |
| Tuz | 2 Tuz kayası, 2 Taş, 2 Su | Çekiç taşı | El yapımı (Tab) | 54 |

#### Bitki (3)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Isırgan lifi | 3 Isırgan, 1 Su | Taş havan | El yapımı (Tab) | 33 |
| Kenevir lifi | 2 Kenevir, 2 Su, 1 Lif | Taş havan | El yapımı (Tab) | 45 |
| Keten lifi | 2 Keten, 2 Su, 1 Lif | Taş havan | El yapımı (Tab) | 45 |

#### Büyü (9)

| Ürün | Malzemeler | Gereken alet (harcanmaz) | Nerede yapılır | Fiyat |
|---|---|---|---|---|
| Ateş asası ² | 1 Mavi mantar kalası, 2 Spor kristali, 3 Büyü otu, 1 Yüzer taş | – | Büyücü Efsun yapar (100 sikke işçilik) | 900 |
| Buz asası ² | 1 Kristal çam kalası, 3 Buz kristali, 1 Enerji taşı, 2 Büyü otu | – | Büyücü Efsun yapar (200 sikke işçilik) | 1.600 |
| Çamur Ana muskası | 1 Çamur Ana gözü, 2 Sazlı inci, 1 Semender derisi | – | El yapımı (Tab) | 1.400 |
| Dev yüreği tılsımı | 1 Dev yüreği, 2 Dağ kristali, 2 Kar likeni | – | El yapımı (Tab) | 2.000 |
| Işık Yutan kalbi tılsımı | 1 Işık Yutan kalbi, 2 Mor damar taşı, 2 Ayna taşı | – | El yapımı (Tab) | 4.200 |
| Kor tacı tılsımı | 1 Kor Kral tacı, 2 Kor taşı, 1 Volkan camı | – | El yapımı (Tab) | 2.800 |
| Kök özü iksiri | 1 Yaşlı Kök özü, 2 Kök mantarı, 1 Su | – | El yapımı (Tab) | 680 |
| Kraliçe tılsımı | 1 Kraliçe pençesi, 2 Yankı mantarı, 1 Taş örümceği ipi | – | El yapımı (Tab) | 420 |
| Yıldırım asası ² | 1 Kömür ağacı kalası, 3 Plazma taşı, 2 Ejder kristali, 3 Büyü otu | – | Büyücü Efsun yapar (300 sikke işçilik) | 3.200 |




# Aletler, silahlar ve zırhlar

## Nerede yapılır: örs ya da el

- **Örste (demirci ve zırhçılar) yalnızca silah, zırh, balta ve kazma dövülür:** kılıç, savaş çekici, topuz, mızrak, yay (ok atan yaylar), **bıçaklar**, asalar ve ateşli silahlar; baltalar ve kazmalar (Boynuz kazma dahil); efektli (alevli/zehirli/keskin) silahlar; bütün zırhlar.
- **Geri kalan bütün aletler elle yapılır** (El yapımı: bilgisayarda **Tab**, telefonda el ikonu): Tuzak, Sapan, Bola, Dişbudak yayı ve Porsuk yayı (küçük av aletleri), Olta, Ağ, Kemik zıpkın, Balık kapanı ve deniz oltaları, Kürek, Tırmık, Tırpan, Sulama kabı, meşaleler, kazıyıcılar, Kemik iğne, Kirmen, Dokuma tezgâhı, Bileği taşı, Çekiç taşı, Öğütme taşı, Pişirme taşı, Taş havan, Pirit çakmağı. Tarifleri eskisi gibi **kazanda öğrenilir**; öğrenilince El yapımı listesinde çıkar, demircinin listesinde çıkmaz.
- Elle yapılan bir aletten (dayanıklılığı olan) **aynı anda bir tane** taşınır: elindeyken yenisi yapılmaz ("zaten sende"), yeni yapılan tam keskinlikle gelir. Körelince Demirci Dursun eskisi gibi **bileyler**.

## Silah bilgisi her yerde yazar

**Ad:** eski **gürz** artık **savaş çekici** (Taş savaş çekici … Ametist savaş çekici, Ejder savaş çekici); topuz aynı kaldı. Eski kayıtlardaki gürzler yüklenince kendiliğinden yeni adı alır (arenada da).

Bir silahın ya da vuran bir aletin (kılıç, savaş çekici, topuz, mızrak, balta, kazma; yay, asa ve silahlarda hasar) değerleri şu yerlerde yazar:
- **Envanterde** eşyaya dokununca açılan kutuda ve eşyanın üstüne gelince (ipucu),
- **Alet kemerinde** yuvanın üstüne gelince (ipucu) ve kemerin eşya seçme listesinde,
- **Yapılırken**: kazanın ve örsün tarif listesinde ve El yapımı listesinde, tarifin adının altında.

Yazılanlar: **Hasar** (temel; seviye ve güç iksiri ayrıca artırır), **hız** (saniyede vuruş), **menzil** (piksel), **keskinlik** (şu anki/en çok; tarif listesinde en çok) ve varsa **etkisi** (alevli: yakar, zehirli: zehirler, keskin: kanatır). Değerler oyunun vuruşta kullandığı değerlerle aynıdır.

**Zırhlar da ne verdiğini gösterir:** aynı yerlerde (tarif listeleri, El yapımı, envanter, kemer ipucu) zırh parçalarının altında "🛡 Savunma +X · yuvası (baş/gövde/el/ayak)" ve varsa **direnç** (kanama/zehir/yanık %), **çamurda yavaşlamazsın**, **karanlıkta ışık verir** yazar. Değerler oyunun hasar hesabında kullandığı değerlerle aynıdır.

**Her yerde kısa etiket:** silah ya da zırh olan her eşya karesinin sol üst köşesinde kısa bir etiket durur: silahta **⚔hasar**, zırhta **🛡savunma** (envanter, envanterdeki kemer, tarif kitabı, kuşanma yuvaları, pazar ve diğer eşya kareleri). ekranın altındaki kemerde (H, 1, 2, 3… kutuları) etiket yoktur, üzerine gelince de hasar yazmaz; yalnızca eşyanın adı çıkar. Arenada da aynı kemer kullanılır, orada da yazmaz. Listelerde (giyme seçimi, kemer seçici, pazar satırları) adın altında tam satır yazar (pazarda her satırda **bir kez**, eşyanın adının altında; düğmelerin içine hiçbir şey yazılmaz — düzeltmesi); ("üzerine gelince yazsın, default yazmasın") listelerdeki bu uzun satırlar varsayılan olarak gizlidir; satırın üzerine gelince (ya da klavyeyle seçince) açılır. Tarif kitabının bilgi kutusunda ve envanterde seçili eşyada her zaman görünür; karelerdeki kısa ⚔/🛡 etiketi durur. üzerine gelince ya da dokununca tam bilgi ipucu çıkar. Tarif kitabında tarifi henüz açılmamış silah ve zırhın da özellikleri görünür.

## Madenler ve ekipman merdiveni

- **Her maden taş da verir:** kazmayla bir madene (cevher, kömür, kristal…) her vuruşta madenin kendisinin yanında **%50 ihtimalle 1 Taş** düşer (Taş madeni zaten taş verir).

ACT 1'in madenleri ve metal ekipmanı tek bir merdivene göre dizildi. Amaç: **her biyomda o biyomun madenleriyle bir öncekinden daha güçlü ve daha pahalı tam bir set yapılabilsin, biyom değiştirdikçe satılan madenler de daha pahalı olsun.** ACT 2 bu sürümde değişmedi (sonra aynı kurallarla ele alınacak).

### Kurallar

1. **Her biyomda tam 3 maden** vardır.
2. **Fiyat sürekli artar:** bir biyomun en ucuz madeni, önceki biyomun en pahalı madeninden pahalıdır.
3. **Her biyomda en az bir set** vardır: miğfer, zırh, eldiven, çizme, kılıç, mızrak, savaş çekici, topuz, balta, kazma. Her set bir öncekinden güçlü ve pahalıdır.
4. **Kademe = biyom numarası:** bir biyomun malzemesinden yapılan balta ve kazma o biyomun numarasını taşır (Çayır 1 … Mor Kristal Vadisi 6).
5. **Biyom N'nin madenleri ve ağaçları N − 1. kademe ister** (Çayır'da ve Orman'da 1). Böylece bir alet en çok bir sonraki biyomu keser ve kazar; 2. biyomun aleti 4. biyomu, 3. biyomun aleti 5. biyomu açamaz.
6. **Ergitilen metalde** kademe, tarifteki en geç biyomdan gelir (Tunç: Çayır'ın bakırı + Orman'ın kalayı → 2). **Dövüldüğü yer de buna uyar ("ormanda neden set yok"):** Tunç seti Orman'ın setidir; Orman'ın demircisi Durdu ve zırhçısı Duran (ve sonraki biyomlarınkiler) döver, Çayır'ın Dursun ve Durmuş'u dövmez. (Orman'ın örslerinde yalnızca usta seti çıkıyordu.)
7. Her madenden alet yapılmaz: madenlerin bir kısmı yemek (Tuz), yakıt (Taş kömürü), yapı (Kireçtaşı, Kumtaşı, Arduvaz), ateş (Pirit), şifa (Kükürt) ya da süs ve değer (Gümüş, Altın) içindir.

### Biyomların madenleri

| # | Biyom | Madenler (satış fiyatı) | Kazmak ve kesmek için | Set | Setin malzemesi |
|---|---|---|---|---|---|
| 1 | Çayır | Kireçtaşı **2** · Kumtaşı **3** · Bakır cevheri **5** | 1. kademe | Bakır | Bakır külçesi (Çayır ağaçlarının kömürüyle ergir) |
| 2 | Orman | Granit **10** · Taş kömürü **11** · Kalay cevheri **12** | 1. kademe | Tunç | Tunç külçesi (3 Bakır külçesi + 1 Kalay külçesi) |
| 3 | Bataklık | Arduvaz **18** · Tuz kayası **19** · Demir cevheri **20** | 2. kademe | Demir | Demir külçesi |
| 4 | Kayalık Dağ | Pirit **28** · Kuvars **29** · Gümüş cevheri **32** | 3. kademe | Çelik | Çelik külçesi (2 Demir külçesi + 2 Huş kömürü + 1 Ateş tuğlası; Ateş tuğlası = 3 Beyaz kil + 2 Kum + 1 Ateş, Beyaz kil Kayalık Dağ'da toplanır) |
| 5 | Kül Diyarı | Bazalt **45** · Kükürt **46** · Obsidyen **49** | 4. kademe | Kara çelik (obsidyen çeliği) | Kara çelik külçesi (2 Çelik külçesi + 3 Obsidyen + 1 Kükürt + 2 Kül ağacı kömürü) |
| 6 | Mor Kristal Vadisi | Kristal **62** · Ametist **67** · Altın cevheri **77** | 5. kademe | Mor kristal | Mor kristal levhası (3 Kristal + 2 Ametist + 1 Altın külçesi) |

- **Yer değiştiren madenler:** Kalay (Çayır → Orman), Kumtaşı (Orman → Çayır), Pirit (Kül Diyarı → Kayalık Dağ), Altın (Kayalık Dağ → Mor Kristal Vadisi), Obsidyen (Mor Kristal Vadisi → Kül Diyarı). Bataklık değişmedi. Yatak sayıları aynı (ilk iki biyomda 22, diğerlerinde 20), yatak 300 sn sonra yeniden dolar.
- **Fiyatın yayılması:** bir madenin fiyatı değişince, onu kullanan her tarifin fiyatı da değişim × miktar × 1,3 kadar değişir (zincir boyunca; v51'deki kural). Örnek: Demir külçesi 111 → 68, Altın külçesi 93 → 280, Gümüş külçesi 61 → 100.
- **Yeni ara ürünler** (el yapımı): Ateş tuğlası **56**, Çelik külçesi **277**, Kara çelik külçesi **966**, Mor kristal levhası **700**.

### Kademe merdiveni (balta ve kazma)

| Kademe | Alet malzemeleri | Kestiği/kazdığı biyomlar |
|---|---|---|
| 1 | Taş, Çakmaktaşı, Bakır | Çayır, Orman |
| 2 | Granit, Tunç | + Bataklık |
| 3 | Demir, Timsah dişi | + Kayalık Dağ |
| 4 | Kuvars, Çelik | + Kül Diyarı |
| 5 | Kara çelik, Ejder (Bazalt aletleri kalktı) | + Mor Kristal Vadisi |
| 6 | Mor kristal, Obsidyen | hepsi (ACT 2'ye hazırlık) |

- Bir biyomdaki **bütün madenler ve ağaçlar aynı kademeyi ister** (biyom içindeki eski farklar kalktı; ör. Orman'daki Meşe, Kayın, Ihlamur, Ceviz artık taş baltayla kesilir, Kayalık Dağ'daki Porsuk ve Ardıç 3. kademe ister).
- **Doğu geçidi** (Kayalık Dağ → Kül Diyarı) kaya yığını **4. kademe** kazma ister: Kuvars kazma ya da Çelik kazma ve üstü.
- Aynı kademede taş ve metal alet birlikte durur: taş aletler daha hızlı körelir, metal aletler daha dayanıklıdır.

> Usta setlerinin aletleri (Çakmaktaşı, Granit, Timsah dişi, Kuvars, Ejder, Obsidyen) yeni değerlerle **Bütün setler** bölümünde ve aşağıdaki alet tablosunda.

| Alet malzemesi | Kademe | İş süresi (sn) | Dayanıklılık | Baltanın silah hasarı | Kazmanın silah hasarı |
|---|---|---|---|---|---|
| Taş | 1 | 3 | 25 | 9 | 8 |
| Çakmaktaşı | 1 | 2,8 | 35 | 10 | 9 |
| Bakır | 1 | 2,6 | 45 | 12 | 11 |
| Granit | 2 | 2,3 | 40 | 16 | 14 |
| Tunç | 2 | 2,1 | 90 | 20 | 18 |
| Demir | 3 | 1,8 | 140 | 30 | 26 |
| Kuvars | 4 | 1,6 | 60 | 34 | 30 |
| Çelik | 4 | 1,5 | 190 | 38 | 34 |
| Obsidyen | 5 | 1,2 | 100 | 46 | 41 |
| Kara çelik | 5 | 1,1 | 240 | 50 | 45 |
| Mor kristal | 6 | 0,9 | 300 | 58 | 52 |

### Setler

Her hücrede **savunma ya da hasar · satış fiyatı**. Zırhçılar zırhları, silahçılar silahları ve aletleri döver; set hangi biyomun malzemesiyse o biyomun ustası ve ondan sonrakiler döver (Bakır ve Tunç: Dursun ve Durmuş ve bütün kuzenleri; Demir: Ali ve Veli; Çelik: Kaya ve Kayhan; Kara çelik: Turan ve Tufan; Mor kristal: Kudret ve Kuvvet).

| Set | Miğfer | Zırh | Eldiven | Çizme |
|---|---|---|---|---|
| 1 · Bakır | 8 · 254 | 16 · 542 | 5 · 259 | 5 · 251 |
| 2 · Tunç | 12 · 779 | 24 · 2.148 | 7 · 784 | 7 · 776 |
| 3 · Demir | 20 · 974 | 40 · 2.685 | 12 · 980 | 12 · 970 |
| 4 · Çelik | 28 · 1.218 | 54 · 3.356 | 16 · 1.225 | 16 · 1.212 |
| 5 · Kara çelik | 36 · 2.705 | 68 · 6.672 | 21 · 2.710 | 21 · 2.703 |
| 6 · Mor kristal | 45 · 3.381 | 84 · 8.340 | 26 · 3.388 | 26 · 3.379 |

| Set | Kılıç | Mızrak | Savaş çekici | Topuz | Balta | Kazma |
|---|---|---|---|---|---|---|
| 1 · Bakır | 16 · 346 | 15 · 150 | 18 · 211 | 14 · 143 | 12 · 143 | 11 · 146 |
| 2 · Tunç | 22 · 1.022 | 20 · 454 | 25 · 1.056 | 19 · 650 | 20 · 451 | 18 · 653 |
| 3 · Demir | 34 · 1.278 | 30 · 568 | 39 · 1.320 | 29 · 812 | 30 · 564 | 26 · 816 |
| 4 · Çelik | 46 · 1.667 | 41 · 825 | 53 · 1.862 | 39 · 1.134 | 38 · 1.134 | 34 · 1.136 |
| 5 · Kara çelik | 58 · 5.249 | 52 · 2.568 | 67 · 6.340 | 49 · 3.821 | 50 · 3.821 | 45 · 3.823 |
| 6 · Mor kristal | 72 · 6.561 | 64 · 3.210 | 83 · 7.925 | 61 · 4.776 | 58 · 4.776 | 52 · 4.779 |

- **Dirençler:** Demir zırh kanama %30; Çelik zırh kanama %35; Kara çelik zırh yanık %40, kanama %30; Mor kristal zırh kanama, yanık ve zehir %30. Demir, Çelik, Kara çelik ve Mor kristal çizmeler çamurda yavaşlatmaz. Bütün set parçaları metaldir.
- **Tarifler** (I = setin malzemesi; Tunç ve Demir'in eski 8 parçası eski tarifiyle kalır, yalnızca savaş çekici ve topuz yeni):
  - Miğfer: 2 I, 1 Deri parçası, 2 Sinir · Zırh: 5 I, 2 Deri parçası, 1 Sinir kirişi · Eldiven: 2 I, 1 Deri parçası, 2 İp · Çizme: 2 I, 1 Deri parçası, 4 Lif
  - Kılıç: 4 I, 1 sap (o biyomun ağacının sapı: Çayır Çam, Orman Meşe, Bataklık Bataklık servisi, Kayalık Dağ Huş, Kül Diyarı Kül ağacı, Mor Kristal Mor söğüt), 1 Deri parçası · Mızrak: 2 I, 1 Uzun sopa, 3 İp · Savaş çekici: 5 I, 1 sap, 1 Sinir kirişi · Topuz: 3 I, 1 sap, 2 İp · Balta: 3 I, 1 sap, 2 İp · Kazma: 3 I, 1 sap, 2 İp, 2 Taş
- **Fiyat kuralı:** parça fiyatı = en büyüğü (malzemelerin değeri × 1,3; parçanın taban değeri × kademe katsayısı; önceki setteki aynı parça × 1,25). Taban değerler: miğfer 100, zırh 260, eldiven 80, çizme 80, kılıç 180, mızrak 150, savaş çekici 210, topuz 140, balta 110, kazma 120; kademe katsayıları 1 · 2 · 3,5 · 5,5 · 8 · 12. Bu yüzden Tunç ve Demir parçalarının fiyatları da değişti (ör. Demir kılıç 1.086 → 1.278, artık Tunç kılıçtan pahalı).
- **Taş silahlar**: Taş kılıç başlangıç setinde; Çakmaktaşı, Kuvars ve Obsidyen mızrak usta setlerindedir (Bütün setler). Bazalt mızrak kalktı.
- Sonraki adım (bu sürümde yok): aynı kademedeki farklı silahlara dövüşü etkileyen özellikler (kanatma, yakma, zehirleme, sersemletme).

### Bütün setler: her türden 13 parça

- **Savaş çekici ve topuz farklı oynanır:** savaş çekici çarptığı yerin çevresine de vurur, isabetleri sersemletme biriktirir, geri iter, savururken az hasar alırsın ama yavaşlarsın; topuz hızlıdır, kombo sayacıyla hasarı %60'a kadar tırmanır, her 5. isabette kıvılcım sıçrar, taklası ucuzdur. Ayrıntı: Sistemler › Dövüş.
- **Set mantığı:** ACT 1'deki her silah, alet ve zırh bir **sete** aittir; bundan sonra eklenen her şey de bir sete eklenir. Bir set 11 parçadır: miğfer, zırh, eldiven, çizme, kılıç, savaş çekici, topuz, mızrak, yay, balta, kazma. Her türden (5 silah, 2 alet, 4 zırh yuvası) **13** parça vardır.
- **Tek istisna Kafa lambası:** baş yuvasına takılan, ışık veren özel bir eşyadır; hiçbir sete ait değildir ve sayıma girmez. Etkili biçimler (Alevli/Zehirli/Keskin X) ayrı parça sayılmaz. İkinci adanın (²) eşyaları ACT 2 düzenlenince ele alınacak.
- **13 set:** 1 başlangıç seti (Çayır, elle yapılır) + 6 metal seti (Bakır, Tunç, Demir, Çelik, Kara çelik, Mor kristal; örste) + 6 usta seti (her biyomun silahçısı ve zırhçısı kendi biyomunun malzemesiyle döver).
- **Usta seti** aynı biyomun metal setinden **%12 güçlüdür** (savunma ve hasar; dayanıklılık aynı). Silahları (kılıç, savaş çekici, topuz, mızrak) biyomun **etkisiyle doğar** ve tariflerinde o etkinin yağı vardır. Baltası ve kazması o biyomun metal setiyle **aynı kademededir**, %10 hızlı çalışır ama dayanıklılığı %55'tir. Yayları etki almaz (etkiyi ok taşır): metal yayından %12 güçlü, %5 hızlı, 10 px uzun menzilli, %30 az dayanıklı.
- **Fiyat:** usta parçası = en büyüğü (malzeme × 1,3; aynı biyomun metal setindeki parça × 1,15). Yeni başlangıç parçaları malzeme × 1,3.

| Set | Biyom · kim yapar | Etki | Miğfer · Zırh · Eldiven · Çizme (savunma) | Kılıç · Savaş çekici · Topuz · Mızrak · Yay (hasar) | Balta / Kazma (kademe) |
|---|---|---|---|---|---|
| Başlangıç | Çayır · elle | – | Kürk başlık 4 · **Kürk yelek** 8 · Kürk eldiven 3 · Deri çarık 3 | Taş kılıç 12 · **Taş savaş çekici** 13 · **Taş topuz** 10 · Mızrak 10 · Basit yay 8 | Taş balta / Taş kazma (1) |
| Bakır | Çayır · örs | – | Bakır miğfer 8 · Bakır zırh 16 · Bakır eldiven 5 · Bakır çizme 5 | Bakır kılıç 16 · Bakır savaş çekici 18 · Bakır topuz 14 · Bakır mızrak 15 · Çam yayı 12 | Bakır balta / Bakır kazma (1) |
| Usta: Kemik | Çayır · Dursun ve Durmuş | keskin | Kemik miğfer 9 · Kemik zırh 18 · **Kemik eldiven** 6 · **Kemik çizme** 6 | **Çakmaktaşı kılıç** 18 · **Çakmaktaşı savaş çekici** 20 · **Çakmaktaşı topuz** 16 · Çakmaktaşı mızrak 17 · **Kemik yay** 13 | Çakmaktaşı balta / Çakmaktaşı kazma (1) |
| Tunç | Orman · örs | – | Tunç miğfer 12 · Tunç zırh 24 · Tunç eldiven 7 · Tunç çizme 7 | Tunç kılıç 22 · Tunç savaş çekici 25 · Tunç topuz 19 · Tunç mızrak 20 · Meşe yayı 17 | Tunç balta / Tunç kazma (2) |
| Usta: Meşe ve granit | Orman · Durdu ve Duran | keskin | Ceviz kabuğu miğfer 13 · Meşe kabuk zırh 27 · **Meşe kabuk eldiven** 8 · **Meşe kabuk çizme** 8 | **Granit kılıç** 25 · Granit savaş çekici 28 · **Granit topuz** 21 · **Granit mızrak** 22 · **Ihlamur yayı** 19 | Granit balta / Granit kazma (2) |
| Demir | Bataklık · örs | – | Demir miğfer 20 · Demir zırh 40 · Demir eldiven 12 · Demir çizme 12 | Demir kılıç 34 · Demir savaş çekici 39 · Demir topuz 29 · Demir mızrak 30 · Kızılağaç yayı 26 | Demir balta / Demir kazma (3) |
| Usta: Timsah | Bataklık · Ali ve Veli | zehirli | **Timsah miğfer** 22 · Timsah pulu zırh 45 · **Timsah eldiven** 13 · Kamış çizme 13 | Timsah dişi kılıcı 38 · **Timsah dişi savaş çekici** 44 · **Timsah dişi topuz** 32 · **Timsah dişi mızrak** 34 · **Söğüt yayı** 29 | **Timsah dişi balta** / **Timsah dişi kazma** (3) |
| Çelik | Kayalık Dağ · örs | – | Çelik miğfer 28 · Çelik zırh 54 · Çelik eldiven 16 · Çelik çizme 16 | Çelik kılıç 46 · Çelik savaş çekici 53 · Çelik topuz 39 · Çelik mızrak 41 · Akçaağaç yayı 35 | Çelik balta / Çelik kazma (4) |
| Usta: Gümüş ve kuvars | Kayalık Dağ · Kaya ve Kayhan | keskin | Kartal tüyü miğfer 31 · Gümüş pullu zırh 60 · **Gümüş eldiven** 18 · **Gümüş çizme** 18 | Gümüş kılıç 52 · **Kuvars savaş çekici** 59 · **Kuvars topuz** 44 · Kuvars mızrak 46 · **Huş yayı** 39 | Kuvars balta / Kuvars kazma (4) |
| Kara çelik | Kül Diyarı · örs | – | Kara çelik miğfer 36 · Kara çelik zırh 68 · Kara çelik eldiven 21 · Kara çelik çizme 21 | Kara çelik kılıç 58 · Kara çelik savaş çekici 67 · Kara çelik topuz 49 · Kara çelik mızrak 52 · Kızıl sedir yayı 45 | Kara çelik balta / Kara çelik kazma (5) |
| Usta: Ejder | Kül Diyarı · Turan ve Tufan | alevli | **Ejder miğferi** 40 · Ejder zırhı 76 · **Ejder eldiveni** 24 · **Ejder çizmesi** 24 | Ejder kılıcı 65 · **Ejder savaş çekici** 75 · **Ejder topuzu** 55 · **Ejder mızrağı** 58 · **Ejder yayı** 50 | **Ejder baltası** / **Ejder kazması** (5) |
| Mor kristal | Mor Kristal Vadisi · örs | – | Mor kristal miğfer 45 · Mor kristal zırh 84 · Mor kristal eldiven 26 · Mor kristal çizme 26 | Mor kristal kılıç 72 · Mor kristal savaş çekici 83 · Mor kristal topuz 61 · Mor kristal mızrak 64 · Gece ağacı yayı 56 | Mor kristal balta / Mor kristal kazma (6) |
| Usta: Ametist ve obsidyen | Mor Kristal Vadisi · Kudret ve Kuvvet | zehirli | **Ametist miğfer** 50 · Kristal ipek zırh 94 · Işık pulu eldiven 29 · **Kristal ipek çizme** 29 | Ametist kılıcı 81 · **Ametist savaş çekici** 93 · **Ametist topuz** 68 · Obsidyen mızrak 72 · **Işık ağacı yayı** 63 | Obsidyen balta / Obsidyen kazma (6) |

Kalın adlar bu sürümde eklenen parçalardır. Kemik zırh parçaları ve başlangıç seti elle yapılır; usta setinin geri kalanını o biyomun silahçısı ve zırhçısı döver.

**Yeni ve değişen tarifler** (usta silahlarına etkinin yağı eklenir: Bileme macunu, Zehir yağı ya da Ateş yağı):

- Kemik eldiven: 4 Kemik, 2 Sinir, 1 Deri parçası
- Kemik çizme: 4 Kemik, 1 Deri parçası, 4 Lif
- Çakmaktaşı kılıç: 3 Yontulmuş çakmaktaşı, 1 Çam sapı, 2 İp, 1 Bileme macunu
- Çakmaktaşı savaş çekici: 4 Yontulmuş çakmaktaşı, 1 Çam sapı, 1 Sinir kirişi, 1 Bileme macunu
- Çakmaktaşı topuz: 2 Yontulmuş çakmaktaşı, 1 Çam sapı, 2 İp, 1 Bileme macunu
- Kemik yay: 3 Kemik, 1 Uzun sopa, 1 Sinir kirişi
- Meşe kabuk eldiven: 1 Meşe kalası, 1 Deri parçası, 3 Kirpi dikeni
- Meşe kabuk çizme: 1 Meşe kalası, 1 Deri parçası, 4 Lif
- Granit kılıç: 3 Granit, 1 Meşe sapı, 1 Sinir kirişi, 1 Bileme macunu
- Granit topuz: 2 Granit, 1 Meşe sapı, 2 İp, 1 Bileme macunu
- Granit mızrak: 2 Granit, 1 Uzun sopa, 3 İp, 1 Bileme macunu
- Ihlamur yayı: 3 Ihlamur odunu, 2 Sinir kirişi, 1 Granit
- Timsah miğfer: 2 Timsah derisi, 1 Demir halka, 2 Sinir
- Timsah eldiven: 1 Timsah derisi, 1 Demir halka, 2 İp
- Kamış çizme: 6 Kamış, 3 İp, 2 Yosun (el yapımı; setin örste dövülmeyen tek parçası)
- Timsah dişi savaş çekici: 3 Timsah dişi, 2 Demir külçesi, 1 Bataklık servisi sapı, 1 Zehir yağı
- Timsah dişi topuz: 2 Timsah dişi, 1 Demir külçesi, 1 Bataklık servisi sapı, 1 Zehir yağı
- Timsah dişi mızrak: 2 Timsah dişi, 1 Uzun sopa, 3 İp, 1 Zehir yağı
- Söğüt yayı: 3 Söğüt odunu, 2 Sinir kirişi, 1 Timsah dişi
- Timsah dişi balta: 2 Timsah dişi, 1 Demir külçesi, 1 Bataklık servisi sapı, 2 İp
- Timsah dişi kazma: 2 Timsah dişi, 2 Demir külçesi, 1 Bataklık servisi sapı, 2 Taş
- Gümüş eldiven: 1 Gümüş külçesi, 1 Demir halka, 1 Deri parçası
- Gümüş çizme: 1 Gümüş külçesi, 1 Demir halka, 1 Deri parçası, 4 Lif
- Kuvars savaş çekici: 3 Yontulmuş kuvars, 1 Ardıç sapı, 1 Sinir kirişi, 1 Bileme macunu
- Kuvars topuz: 2 Yontulmuş kuvars, 1 Ardıç sapı, 2 İp, 1 Bileme macunu
- Huş yayı: 3 Huş odunu, 2 Sinir kirişi, 1 Gümüş külçesi
- Ejder miğferi: 1 Kara pul, 1 Demir levha, 1 Deri parçası
- Ejder eldiveni: 1 Kara pul, 2 Lav pulu, 1 Deri parçası
- Ejder çizmesi: 1 Kara pul, 2 Kül kurdu postu, 4 Lif
- Ejder kılıcı: 2 Ejder kemiği, 1 Kara çelik külçesi, 1 Deri parçası, 1 Ateş yağı
- Ejder savaş çekici: 2 Ejder kemiği, 2 Kara çelik külçesi, 1 Kızıl sedir sapı, 1 Ateş yağı
- Ejder topuzu: 1 Ejder kemiği, 1 Kara çelik külçesi, 1 Kızıl sedir sapı, 1 Ateş yağı
- Ejder mızrağı: 1 Ejder kemiği, 1 Bazalt sivri ucu, 1 Uzun sopa, 3 İp, 1 Ateş yağı
- Ejder yayı: 3 Kül ağacı odunu, 1 Ejder kemiği, 2 Sinir kirişi
- Ejder baltası: 1 Ejder kemiği, 1 Kara çelik külçesi, 1 Kül ağacı sapı, 2 İp
- Ejder kazması: 1 Ejder kemiği, 1 Bazalt sivri ucu, 1 Kara çelik külçesi, 1 Kül ağacı sapı
- Ametist miğfer: 2 Ametist, 1 Kristal ipek, 1 Deri parçası
- Kristal ipek çizme: 2 Kristal ipek, 1 Işık pulu, 1 Deri parçası
- Ametist savaş çekici: 4 Ametist, 2 Obsidyen, 1 Işık ağacı sapı, 1 Zehir yağı
- Ametist topuz: 2 Ametist, 1 Obsidyen, 1 Işık ağacı sapı, 1 Zehir yağı
- Işık ağacı yayı: 3 Işık ağacı odunu, 2 Sinir kirişi, 1 Ametist
- Kürk yelek: 2 Deri parçası, 1 Sinir kirişi, 5 Lif, 4 İp · Taş savaş çekici: 1 Sopa, 4 Taş, 3 İp · Taş topuz: 1 Sopa, 2 Taş, 2 İp (elle)
- Obsidyen balta, Obsidyen kazma ve Obsidyen mızrağa 1 Ametist eklendi; balta ve kazma **6. kademe** (Mor Kristal Vadisi usta seti, Kudret döver). Çakmaktaşı, Kuvars ve Obsidyen mızrağa etkinin yağı eklendi.
- Boşta kalan malzemeler setlere geçti: **Lav pulu** Ejder eldiveninde, **Kül kurdu postu** Ejder çizmesinde, **Bazalt sivri ucu** Ejder mızrağı ve Ejder kazmasında, **Kızıl sedir sapı** Ejder savaş çekici ve topuzunda.
- **Yeni usta zırhlarının direnci:** Meşe kabuk eldiven ve çizme kanama %10; Timsah miğfer ve eldiven zehir %15; Gümüş eldiven ve çizme kanama %15; Ametist miğfer ve Kristal ipek çizme zehir %20. Kamış çizme çamurda yavaşlatmaz.

**Kaldırılanlar** (eski kayıtta eski fiyatıyla **sikkeye** çevrilir; çantada, giyilende ve yuvalarda olanlar; yüklenince "sikkeye çevrildi" yazar): Tavşan postu giysi (255), Geyik postu giysi (262), Karaca postu giysi (257), Kunduz postu giysi (262), Dağ keçisi postu giysi (258), Muflon postu giysi (258), Yaban domuzu postu giysi (258), Kurt postu giysi (257), Yaban öküzü postu giysi (267), Mağara ayısı postu giysi (270), Keten tunik (170), Boyalı tunik (296), Bataklık postu pelerin (100), Ayı postu pelerin (451), Kül postu pelerin (325), Timsah derisi zırh (158), Tüylü başlık (244), Bataklık çizmesi (479), Lav camı kılıcı (955), Kül böceği zırh (1736), Akrep kabuğu çizme (620), Lav pulu eldiven (550), Bazalt balta (92), Bazalt kazma (441), Bazalt mızrak (431); Alevli/Zehirli/Keskin Bazalt mızrak (431). Eski Alevli/Zehirli/Keskin Çakmaktaşı, Kuvars ve Obsidyen mızrak etkisiz mızrağa döner (artık etkileriyle doğarlar).

**Ad değişen:** Ejder pulu zırh → **Ejder zırhı** (eski kayıtta kendiliğinden). Ejder kılıcının tarifinde Altın külçesi yerine Kara çelik külçesi var (altın artık Mor Kristal Vadisi'nde, Turan'ın ejder görevi Kül Diyarı'nda).

**Görev değişiklikleri:** Turan'ın "Bazalt kazma" (TU2) → **Kara çelik kazma**, "Lavın kenarı" (TU4) ve kuzen görevi (kt3) → **Kara çelik kılıç** dövdür; Tufan'ın "Kül zırhı" (TF4) ve kuzen görevi (ku3) → **Kara çelik zırh** dövdür; Kaya'nın "Altın damar" (KA7) → 4 Altın cevheri yerine **4 Pirit** (altın artık Mor Kristal Vadisi'nde); KA8 piriti "dağın yamaçlarından" ister; Toygar'ın "Çamur yürüyüşü" (T1) Kamış çizmeyi Zırhçı Veli'ye yaptırmanı söyler. Turan ve Tufan'ın kendilerini anlatan sözleri Ejder setini anar.

**Arena:** oyundaki her silah, alet ve zırh arenada da seçilebilir (aynı listeden gelir; kaldırılanlar arenadan da kalktı, yeni setler arenada).


### Yaylar ve oklar

- **Yay** eldeyken vuruş (tık, Vur düğmesi) fare yönüne (telefonda en yakın düşmana) **bir ok atar**. Ok bir canlıya değince durur. Her atış yayı 1 köreltir (bilenince yenilenir); kör yay atmaz.
- **Ok gerekir:** her atış bir ok harcar. Hangi oku atacağını **envanterde seçersin**: okun üstüne dokun → **Yayla bunu at**; seçili okun kutusu altın çerçevelidir, yeniden dokunup **Seçimi kaldır** dersin. Seçim yoksa ya da seçili ok bittiyse yay çantadaki **en güçlü oku** atar (bitince bir kez "… bitti" yazar); aynı güçte etkili ok varsa önce onu. Ok hiç yoksa "Ok yok" yazar. Seçim kayda yazılır. Arenada ok harcanmaz.
- **Eski oklar kaldırıldı:** Ok, Tüylü ok, Zehirli ok ve Mor ok tarifleriyle birlikte oyundan çıktı. Eski kayıttaki bu okların hepsi tanesi tanesine **Basit ok** olur. Ok uçları ve Kamış ok gövdesi eşya olarak kalır.
- **Hasar** = yayın hasarı × okun çarpanı × (1 + 0,03 × (seviye − 1)) × Güç/Güçsüzlük. Okun hızı ve menzili yaydan gelir.
- Yay silah yuvasına girmez; elde tutulur (balta ve kazma gibi alet yuvasında). Silahlar listesinde ayrı bir **Yaylar** grubu vardır.
- Her biyomun yayı o biyomun ağacından ve setinin metalinden yapılır; o biyomun silahçısı ve ondan sonrakiler döver. Okları herkes elle yapar (bir yapımda 10 ok, Basit okta 5).

| Yay | Biyom | Hasar | Bekleme | Menzil | Dayanıklılık | Tarif | Nerede yapılır | Fiyat |
|---|---|---|---|---|---|---|---|---|
| Basit yay | El yapımı (herkes) | 8 | 0,75 sn | 240 | 60 | 1 Uzun sopa, 3 İp, 2 Lif | El yapımı (Tab) | 90 |
| Çam yayı | Çayır | 12 | 0,7 sn | 260 | 80 | 3 Çam odunu, 1 Sinir kirişi, 1 Bakır külçesi | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 112 |
| Meşe yayı | Orman | 17 | 0,68 sn | 280 | 110 | 3 Meşe odunu, 1 Sinir kirişi, 1 Tunç külçesi | Örs · Silahçı Durdu (Orman) ve üstü döver | 304 |
| Kızılağaç yayı | Bataklık | 26 | 0,66 sn | 300 | 150 | 3 Kızılağaç odunu, 2 Sinir kirişi, 1 Demir külçesi | Örs · Silahçı Ali (Bataklık) ve üstü döver | 426 |
| Akçaağaç yayı | Kayalık Dağ | 35 | 0,64 sn | 320 | 190 | 3 Akçaağaç odunu, 2 Sinir kirişi, 1 Çelik külçesi | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 1.022 |
| Kızıl sedir yayı | Kül Diyarı | 45 | 0,62 sn | 340 | 230 | 3 Kızıl sedir odunu, 2 Sinir kirişi, 1 Kara çelik külçesi | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 2.961 |
| Gece ağacı yayı | Mor Kristal Vadisi | 56 | 0,6 sn | 360 | 280 | 3 Gece ağacı odunu, 2 Sinir kirişi, 1 Mor kristal levhası | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 2.211 |

| Ok | Biyom | Hasar çarpanı | Tarif | Tanesinin fiyatı |
|---|---|---|---|---|
| Basit ok | El yapımı (herkes) | ×0,8 | 2 Dal, 1 Keskin taş, 1 Lif → 5 ok | 2 |
| Bakır ok | Çayır | ×1,0 | 1 Bakır külçesi, 4 Dal, 2 Keklik tüyü → 10 ok | 4 |
| Tunç ok | Orman | ×1,15 | 1 Tunç külçesi, 4 Dal, 2 Keklik tüyü → 10 ok | 21 |
| Demir ok | Bataklık | ×1,3 | 1 Demir külçesi, 4 Dal, 2 Ördek tüyü → 10 ok | 26 |
| Çelik ok | Kayalık Dağ | ×1,45 | 1 Çelik külçesi, 4 Dal, 2 Ur kekliği tüyü → 10 ok | 37 |
| Kara çelik ok | Kül Diyarı | ×1,6 | 1 Kara çelik külçesi, 4 Dal, 2 Ur kekliği tüyü → 10 ok | 127 |
| Mor kristal ok | Mor Kristal Vadisi | ×1,8 | 1 Mor kristal levhası, 4 Dal, 2 Ur kekliği tüyü → 10 ok | 159 |

- **Yayın özel vuruşları** (Dövüş · Özel vuruşlar tablosu): Hızlı atış, Delici ok, Çift ok, Gergin atış, Geri sıçrayıp atış, Ok yelpazesi; ultisi **Ok yağmuru**. Her ok atışı bir ok harcar (ulti harcamaz).

### Alevli, zehirli, keskin silahlar

- **Üç etki**, vuruşun kendi hasarının üstüne **ek hasar** olarak işler:

| Etki | Silahın adı | Canavara ne olur | Süre | Saniyede hasar | Üst üste |
|---|---|---|---|---|---|
| Yanık | **Alevli** … | yanar (turuncu alev, turuncu sayılar) | 3 sn | silah hasarının %20'si | yenilenir |
| Zehir | **Zehirli** … | zehirlenir (yeşil kabarcıklar, yeşil sayılar) | 6 sn | kat başına %10 | her isabet 1 kat, en çok 3 kat |
| Kanama | **Keskin** … | kanar (kırmızı damlalar, kırmızı sayılar) | 4 sn | %15 | yenilenir |

- **Silah hasarı** burada silahın tablodaki hasarıdır × (1 + 0,03 × (seviye − 1)); okta yayın hasarı × okun çarpanı × aynı seviye katsayısı.
- **Her silahın en çok bir etkisi** vardır; etki silah yapılırken tarifteki **yağdan** gelir. Reislerde süre yarıdır. Etkiler 1 saniyede bir vurur.
- **Kime işlemez:** yanık, kendisi yakan canavarlara (Kül Diyarı'nın ateşli canavarları, ejderler; meşalenin kuralı); zehir, kendisi zehirleyenlere; kanama, golemlere, robotlara, dronlara ve kabuklu taş canlılara. Börü'nün ders canlılarına ve evcil hayvanlara hiçbiri işlemez.
- Yakın dövüşte etki, yalnızca **70 piksel içindeki** isabette işler (kombolar dahil; fırlatılan mızrak ve topuz etki vermez). Okta etkiyi o anda atılan ok verir.

**Yağlar** (kazanda öğrenilir, elle yapılır, kategori Zanaat):

| Yağ | Tarif | Verdiği etki |
|---|---|---|
| Ateş yağı | 2 Çam reçinesi, 1 Hardal otu, 1 Çam kömürü | Alevli (yanık) |
| Zehir yağı | 2 Sinek mantarı, 1 Çam reçinesi | Zehirli (zehir) |
| Bileme macunu | 2 Kumtaşı, 1 Çam reçinesi | Keskin (kanama) |

- **Etkili silah:** ACT 1'in her kılıcı, savaş çekicini, topuzu ve mızrağı (imza silahları hariç) üç biçimde de yapılabilir: **Alevli X** = 1 X + 1 Ateş yağı, **Zehirli X** = 1 X + 1 Zehir yağı, **Keskin X** = 1 X + 1 Bileme macunu. Bunları her silahçı döver (silahı getirdiğin için usta sırası aranmaz). Hasar, menzil, dayanıklılık X ile aynı; fiyatı (X + yağ) × 1,1.
- **Etkili ok:** her biyomun oku için 10 ok + 1 yağ → 10 etkili ok (Alevli Bakır ok, Zehirli Demir ok, Keskin Mor kristal ok…), elle yapılır; tanesinin fiyatı ok + yağın onda biri, × 1,1. Atılacak ok envanterde seçilir; seçim yoksa yay en güçlü oku atar (aynı güçte etkili ok varsa önce onu).
- **İmza silahları** etkileriyle doğar ve tariflerine ilgili yağ eklendi: Granit savaş çekici **keskin** (+1 Bileme macunu), Timsah dişi kılıcı **zehirli** (+1 Zehir yağı), Gümüş kılıç **keskin** (+1 Bileme macunu), Lav camı kılıcı **alevli** (+1 Ateş yağı), Ejder kılıcı **alevli** (+1 Ateş yağı), Ametist kılıcı **zehirli** (+1 Zehir yağı). Bunların etkili biçimleri yoktur. (bütün usta setlerinin silahları etkileriyle doğar; tam liste **Bütün setler** tablosunda.)
- Baltalar, kazmalar ve yaylar etki almaz (yayda etkiyi ok taşır). Meşalenin kendi yakması değişmedi.
- **Arena:** silah listesinde kılıçlar, savaş çekiçleri ve topuzlar ayrı gruplardır; etkili biçimler listede ayrıca görünmez: elindeki silahın hemen altındaki **Etki** satırından Etkisiz / Alevli / Zehirli / Keskin seçilir (imza silahı için etkisi yazılır). Elinde yay varsa altında **Ok** satırı çıkar: "En güçlü" ya da her ok ve etkili ok seçilebilir. Bütün setler, imza parçaları, yaylar, baltalar ve kazmalar arenada seçilebilir.
- Simgeler: etkili silah ve okun simgesinin köşesinde etkinin işareti (alev, yeşil damla, kırmızı damla); yağlar küçük birer şişe.

### Silahların kademe kimliği

> Boğaç: "Bir sonraki seviyesi alındığında 'yeni bir şey aldım' hissini vermeli. Şu an aynı tip silahların tek farkı rengi. X yaydan Y yaya geçince bariz görsel fark göreyim; ok attığı da belli olsun, saldırılar kullanılan oka göre gitsin. Aynısı kılıç, mızrak, gürz, balta için de."

- **Kural:** her silah ve alet türünün (kılıç, savaş çekici, topuz, mızrak, balta, kazma, yay) **7 kademesi** vardır. Her kademe bir öncekinden **biçimiyle** ayrılır (renk tek fark değildir): boyu, ağzı, siperi, başı, süsü değişir; elde daha büyük görünür; savururken kendi izi, isabette kendi kıvılcımı ve kendi sesi vardır. Görünüş, envanterdeki simgede, elde, sırtta, savururken ve arenada aynıdır.
- **Usta parçaları** kendi kademesinin biçimini taşır ama kendi malzemesinin rengindedir ve üstünde doğduğu **etkinin rengiyle bir çizgi** vardır (keskin kırmızı, zehirli yeşil, alevli turuncu). Böylece aynı biyomun metal parçasıyla karışmaz.
- **Etkili biçimler** (Alevli / Zehirli / Keskin X) X'in çizimini ve köşede etkinin işaretini taşır (gibi).
- **Işın kılıcı** (ACT 2) bu merdivene girmez, kendi çizimiyle kalır.

| Kademe | Parçalar | Görünüş | Savurma izi | İsabet | Ses |
|---|---|---|---|---|---|
| 0 · Başlangıç | Taş kılıç, Taş savaş çekici, Taş topuz, Mızrak, Taş balta, Taş kazma, Basit yay | kaba yontulmuş taş, iple sarılı sap, kısa ve küçük | ince, gri toz izi | taş kırıntısı | boğuk, tok |
| 1 · Bakır | Bakır seti, Çam yayı · usta: Çakmaktaşı, Kemik yay | sade metal, düz ağız, küçük siper | sıcak bakır rengi ince iz | bakır kıvılcımı | kısa, tok bir metal "tınk" |
| 2 · Tunç | Tunç seti, Meşe yayı · usta: Granit, Ihlamur yayı | yaprak biçimli ağız, yuvarlak siper ve topuz düğmesi, bantlar | altın sarısı iz | altın kıvılcım | daha dolgun "çınk" |
| 3 · Demir | Demir seti, Kızılağaç yayı · usta: Timsah dişi, Söğüt yayı | daha uzun ve geniş, ortada oluk, geniş siper, sapta metal halkalar | kalın, beyaz çelik izi | beyaz kıvılcım ve küçük halka | metalik çınlama |
| 4 · Çelik | Çelik seti, Akçaağaç yayı · usta: Gümüş, Kuvars, Huş yayı | uzun, parlak keskin kenar, kıvrık siper, kabzada taş; elde ara sıra parıltı | mavi-beyaz parlak iz, ucunda parıltı yıldızı | bol kıvılcım, parlak halka | uzun, keskin "şiing" |
| 5 · Kara çelik | Kara çelik seti, Kızıl sedir yayı · usta: Ejder, Ejder yayı | koyu metal, dişli ya da dikenli, kızgın turuncu kenar; elde kor tüter | koyu kırmızı-turuncu iz, kor parçacıkları | kor patlaması, biraz daha sarsıntı | ağır gürleme ve kor çıtırtısı |
| 6 · Mor kristal | Mor kristal seti, Gece ağacı yayı · usta: Ametist, Obsidyen, Işık ağacı yayı | billur, parlayan çekirdek, kanatlı siper, çevresinde süzülen kristal kıymıkları; elde mor ışık | mor-beyaz ışık izi, kristal kıymıkları | kristal patlaması ve mor halka | kristal çan sesi |

- **Elde boyu** (piksel): kademe 0–1: 11 · 2–3: 12 · 4: 13 · 5: 14 · 6: 15.
- **Türlere göre biçim** (kademe 0 → 6):
  - **Kılıç:** kısa kaba taş ağız, siper yok → düz kısa ağız, küçük siper → yaprak ağız, yuvarlak siper → uzun ağız, oluk, geniş siper → çok uzun parlak ağız, kıvrık siper, kabzada taş → sırtı dişli kara ağız, dikenli siper, kızgın kenar → billur ağız, kanatlı siper, parlayan çekirdek.
  - **Savaş çekici:** iple bağlı taş yumru → küçük bakır kütük → bantlı tunç kütük → büyük demir baş, tepede sivri → iki yanı kanatlı çelik baş → iki yüzü dikenli kara baş, kızgın çatlaklar → büyük billur baş.
  - **Topuz:** taş yumru → bakır top → düğmeli tunç top → kanatlı demir topuz → altı kanatlı parlak çelik topuz → dikenli kara gürz yıldızı, kızgın → kristal dikenli parlayan top.
  - **Mızrak:** iple bağlı taş uç → küçük bakır yaprak uç → büyük tunç uç ve halka → uzun demir uç, yan kanatlar, sapta bantlar → yan ağızlı parlak çelik uç → dişli kara uç, kızgın kenar, dipte diken → uzun billur uç, parlayan.
  - **Balta:** iple bağlı taş kama → küçük bakır ağız → hilal tunç ağız → sakallı demir ağız → arkası sivri çelik hilal → çift ağızlı kara balta, kızgın kenarlar → çift billur hilal.
  - **Kazma:** tek kollu taş keser → kısa bakır kazma → uzun tunç kazma → uzun kıvrık demir kazma → parlak uçlu çelik kazma → kızgın uçlu, tepesi dikenli kara kazma → billur kollu parlayan kazma.
  - **Yay:** ince düz sopa yay → kalın yay, metal uçlar → uçları dışa kıvrık (kıvrık yay) → metal uçlar ve sargılı kabza → iki renkli bileşik yay, parlak → dikenli koyu yay, kızgın kiriş → billur kollu yay, ışıktan kiriş.

**Ok ve yay:**

- **Ok gerçekten ok gibi uçar:** gövde, uç ve tüyleriyle, uçtuğu yöne dönük çizilir; ucu ve tüyü **atılan oka göre** değişir (Basit ok taş uç gri tüy; Bakır ve Tunç okta keklik tüyü; Demir okta ördek tüyü; Çelik, Kara çelik ve Mor kristal okta ur kekliği tüyü). Kara çelik ok kor, Mor kristal ok mor ışık izi bırakır; etkili oklar etkisinin rengiyle iz bırakır (alevli turuncu, zehirli yeşil, keskin kırmızı). İsabette okun malzemesinin kıvılcımı ve kademesinin isabet sesi çıkar.
- **Elde yay:** yay nişan yönüne döner; atışa hazırken kirişte **atılacak ok** (seçili ya da en güçlü ok) takılı görünür. Atışta kiriş gerilip boşalır, yay hafifçe geri teper, ok çıkar; yay yeniden dolana kadar kiriş boştur. Kiriş sesi yayın kademesine göre: ince sopa yayın boğuk "tıng"ından kristal yayın çınlayan sesine.
- Hasar, hız ve menzil değişmedi (yukarıdaki tablolar); bu bölüm yalnızca görünüş, efekt ve ses.

**Yeni kademe duyurusu:** bir türün (kılıç, savaş çekici, topuz, mızrak, balta, kazma, yay) elindeki en yüksek kademesinden **daha yüksek kademede** bir parçayı ilk kez aldığında ekranın ortasında parçanın adıyla **"Yeni kademe! · %113 daha güçlü (öncekin: Bakır kılıç)"** yazısı çıkar (silahlarda ve yaylarda önceki en iyi parçana göre hasar farkı; balta ve kazmada "% daha hızlı", iş süresine göre). Bir türün ilk parçası için çıkmaz (karşılaştıracak önceki yok). Kısa bir zafer ezgisi çalar ve karakterin çevresinde kademenin renginde bir ışık halkası yayılır. Eski kayıtlarda o an sahip olunanlar sayılır, duyuru çıkmaz. Duyuru kayda yazılır (aynı kademe için bir daha çıkmaz).

**Arena:** arenada her silah aynı biçim, iz, isabet ve sesle görünür (arena aynı verilerden beslenir); yeni kademe duyurusu arenada çıkmaz.

**Performans:** iz ve isabet efektleri yalnızca savururken ve isabette çizilir; elde tüten kor ve parıltılar saniyede en çok birkaç parçacıktır. Oyun sırasında harita taranmaz.

### Savaş çekici ve topuz

- **Savaş çekici:** iki elle sallanan ağır silah. Vuruşu yavaş (0,62 sn), menzili 24, hasarı aynı setin kılıcından %15 fazla. Kombo ve ultileri sersemletir ve geri savurur.
- **Topuz:** tek elle hızlı silah. Vuruşu hızlı (0,36 sn), menzili 20, hasarı kılıçtan %15 az. Komboları art arda vuruşlardır.
- İkisi de silah yuvasına girer, kılıçlarla aynı yerde (Silahlar) listelenir, sallanırken baltanın yukarıdan inen vuruşuyla çizilir. Hareketleri ve ultileri **Dövüş · Özel vuruşlar** ve **Ulti** bölümlerinde.

## Aletler ve silahlar

- **Tür:** axe = balta (odun), pick = kazma (maden), shovel = kürek (kil), rake/can/scythe = tırmık/sulama kabı/tırpan (tarla), fish = olta/ağ/zıpkın, water = su kabı, torch = meşale, sword/spear = kılıç/mızrak (savaş çekici ve topuz da sword türündedir), bow = yay, staff = asa, gun = ateşli silah.
- **Kademe:** balta ve kazmanın kademesi hangi ağacı kesip hangi madeni kazabileceğini belirler (biyom tablolarındaki "Gereken balta/kazma"). Daha yüksek kademe her zaman alttakileri de keser.
- **Dayanıklılık:** her kullanımda 1 azalır; sıfırlanınca alet körelir ve çalışmaz. Demirci Dursun "Aletimi bile" ile bileme ücretine yeniler. Hile panelindeki "Sınırsız dayanıklılık" aletleri hiç köreltmez.
- **İş süresi:** bir toplamanın kaç saniye sürdüğü (yetenekler ve seviye kısaltır).

| Alet | Tür | Ne yapar | İş süresi (sn) | Dayanıklılık | Bileme ücreti | Kademe | Silah hasarı |
|---|---|---|---|---|---|---|---|
| Taş balta | axe | odun keser | 3 | 25 | 10 | 1 | 9 |
| Bakır balta | axe | odun keser | 2,6 | 45 | 32 | 1 | 12 |
| Çakmaktaşı balta | axe | odun keser | 2,34 | 25 | 36 | 1 | 13 |
| Tunç balta | axe | odun keser | 2,1 | 90 | 90 | 2 | 20 |
| Granit balta | axe | odun keser | 1,89 | 50 | 114 | 2 | 22 |
| Demir balta | axe | odun keser | 1,8 | 140 | 180 | 3 | 30 |
| Timsah dişi balta | axe | odun keser | 1,62 | 77 | 143 | 3 | 34 |
| Çelik balta | axe | odun keser | 1,5 | 190 | 250 | 4 | 38 |
| Kuvars balta | axe | odun keser | 1,35 | 105 | 287 | 4 | 43 |
| Kara çelik balta | axe | odun keser | 1,1 | 240 | 841 | 5 | 50 |
| Ejder baltası | axe | odun keser | 0,99 | 132 | 967 | 5 | 56 |
| Mor kristal balta | axe | odun keser | 0,9 | 300 | 1.051 | 6 | 58 |
| Obsidyen balta | axe | odun keser | 0,81 | 165 | 1.208 | 6 | 65 |
| Taş kazma | pick | maden kazar | 3 | 25 | 15 | 1 | 8 |
| Bakır kazma | pick | maden kazar | 2,6 | 45 | 32 | 1 | 11 |
| Çakmaktaşı kazma | pick | maden kazar | 2,34 | 25 | 55 | 1 | 12 |
| Tunç kazma | pick | maden kazar | 2,1 | 90 | 100 | 2 | 18 |
| Granit kazma | pick | maden kazar | 1,89 | 50 | 165 | 2 | 20 |
| Demir kazma | pick | maden kazar | 1,8 | 140 | 200 | 3 | 26 |
| Timsah dişi kazma | pick | maden kazar | 1,62 | 77 | 206 | 3 | 29 |
| Çelik kazma | pick | maden kazar | 1,5 | 190 | 250 | 4 | 34 |
| Kuvars kazma | pick | maden kazar | 1,35 | 105 | 287 | 4 | 38 |
| Kara çelik kazma | pick | maden kazar | 1,1 | 240 | 841 | 5 | 45 |
| Ejder kazması | pick | maden kazar | 0,99 | 132 | 967 | 5 | 50 |
| Mor kristal kazma | pick | maden kazar | 0,9 | 300 | 1.051 | 6 | 52 |
| Obsidyen kazma | pick | maden kazar | 0,81 | 165 | 1.209 | 6 | 58 |
| Taş kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 45 | 15 | – | 12 |
| Bakır kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 60 | 76 | – | 16 |
| Çakmaktaşı kılıç | sword | savaşır: hızlı ve güçlü vuruş · keskin: kanatır | 1 | 60 | 88 | – | 18 |
| Tunç kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 80 | 120 | – | 22 |
| Granit kılıç | sword | savaşır: hızlı ve güçlü vuruş · keskin: kanatır | 1 | 80 | 259 | – | 25 |
| Demir kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 120 | 240 | – | 34 |
| Timsah dişi kılıcı | sword | savaşır: hızlı ve güçlü vuruş · zehirli: zehirler | 1 | 120 | 323 | – | 38 |
| Çelik kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 160 | 367 | – | 46 |
| Gümüş kılıç | sword | savaşır: hızlı ve güçlü vuruş · keskin: kanatır | 1 | 160 | 422 | – | 52 |
| Kara çelik kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 200 | 1.155 | – | 58 |
| Ejder kılıcı | sword | savaşır: hızlı ve güçlü vuruş · alevli: yakar | 1 | 200 | 1.328 | – | 65 |
| Mor kristal kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 260 | 1.443 | – | 72 |
| Ametist kılıcı | sword | savaşır: hızlı ve güçlü vuruş · zehirli: zehirler | 1 | 260 | 1.660 | – | 81 |
| Taş savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 55 | 9 | – | 13 |
| Bakır savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 70 | 46 | – | 18 |
| Çakmaktaşı savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir · keskin: kanatır | 1 | 70 | 54 | – | 20 |
| Tunç savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 95 | 232 | – | 25 |
| Granit savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir · keskin: kanatır | 1 | 95 | 267 | – | 28 |
| Demir savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 140 | 290 | – | 39 |
| Timsah dişi savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir · zehirli: zehirler | 1 | 140 | 334 | – | 44 |
| Çelik savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 180 | 410 | – | 53 |
| Kuvars savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir · keskin: kanatır | 1 | 180 | 471 | – | 59 |
| Kara çelik savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 220 | 1.395 | – | 67 |
| Ejder savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir · alevli: yakar | 1 | 220 | 1.604 | – | 75 |
| Mor kristal savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir | 1 | 280 | 1.744 | – | 83 |
| Ametist savaş çekici | savaş çekici | savaş çekici: ağır, yavaş, sersemletir · zehirli: zehirler | 1 | 280 | 2.005 | – | 93 |
| Taş topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 45 | 7 | – | 10 |
| Bakır topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 60 | 32 | – | 14 |
| Çakmaktaşı topuz | topuz | topuz: hızlı, art arda vuruş · keskin: kanatır | 1 | 60 | 36 | – | 16 |
| Tunç topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 85 | 143 | – | 19 |
| Granit topuz | topuz | topuz: hızlı, art arda vuruş · keskin: kanatır | 1 | 85 | 164 | – | 21 |
| Demir topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 125 | 179 | – | 29 |
| Timsah dişi topuz | topuz | topuz: hızlı, art arda vuruş · zehirli: zehirler | 1 | 125 | 206 | – | 32 |
| Çelik topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 165 | 250 | – | 39 |
| Kuvars topuz | topuz | topuz: hızlı, art arda vuruş · keskin: kanatır | 1 | 165 | 287 | – | 44 |
| Kara çelik topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 205 | 841 | – | 49 |
| Ejder topuzu | topuz | topuz: hızlı, art arda vuruş · alevli: yakar | 1 | 205 | 967 | – | 55 |
| Mor kristal topuz | topuz | topuz: hızlı, art arda vuruş | 1 | 265 | 1.051 | – | 61 |
| Ametist topuz | topuz | topuz: hızlı, art arda vuruş · zehirli: zehirler | 1 | 265 | 1.208 | – | 68 |
| Mızrak | hunt | av ve savaş: uzaktan vurur | 3 | 20 | 12 | – | 10 |
| Bakır mızrak | hunt | av ve savaş: uzaktan vurur | 2,4 | 50 | 33 | – | 15 |
| Çakmaktaşı mızrak | hunt | av ve savaş: uzaktan vurur · keskin: kanatır | 2,5 | 50 | 55 | – | 17 |
| Tunç mızrak | hunt | av ve savaş: uzaktan vurur | 2 | 80 | 100 | – | 20 |
| Granit mızrak | hunt | av ve savaş: uzaktan vurur · keskin: kanatır | 1 | 80 | 115 | – | 22 |
| Demir mızrak | hunt | av ve savaş: uzaktan vurur | 1,6 | 120 | 200 | – | 30 |
| Timsah dişi mızrak | hunt | av ve savaş: uzaktan vurur · zehirli: zehirler | 1 | 120 | 144 | – | 34 |
| Çelik mızrak | hunt | av ve savaş: uzaktan vurur | 1,4 | 160 | 182 | – | 41 |
| Kuvars mızrak | hunt | av ve savaş: uzaktan vurur · keskin: kanatır | 1,6 | 160 | 209 | – | 46 |
| Kara çelik mızrak | hunt | av ve savaş: uzaktan vurur | 1,2 | 200 | 565 | – | 52 |
| Ejder mızrağı | hunt | av ve savaş: uzaktan vurur · alevli: yakar | 1 | 200 | 650 | – | 58 |
| Mor kristal mızrak | hunt | av ve savaş: uzaktan vurur | 1 | 260 | 706 | – | 64 |
| Obsidyen mızrak | hunt | av ve savaş: uzaktan vurur · zehirli: zehirler | 1,2 | 260 | 812 | – | 72 |
| Basit yay | bow | ok atar (ok harcar) | 0,75 | 60 | 20 | – | 8 |
| Çam yayı | bow | ok atar (ok harcar) | 0,7 | 80 | 25 | – | 12 |
| Kemik yay | bow | ok atar (ok harcar) | 0,66 | 56 | 28 | – | 13 |
| Meşe yayı | bow | ok atar (ok harcar) | 0,68 | 110 | 52 | – | 17 |
| Ihlamur yayı | bow | ok atar (ok harcar) | 0,65 | 77 | 59 | – | 19 |
| Kızılağaç yayı | bow | ok atar (ok harcar) | 0,66 | 150 | 69 | – | 26 |
| Söğüt yayı | bow | ok atar (ok harcar) | 0,63 | 105 | 80 | – | 29 |
| Akçaağaç yayı | bow | ok atar (ok harcar) | 0,64 | 190 | 109 | – | 35 |
| Huş yayı | bow | ok atar (ok harcar) | 0,61 | 133 | 125 | – | 39 |
| Kızıl sedir yayı | bow | ok atar (ok harcar) | 0,62 | 230 | 301 | – | 45 |
| Ejder yayı | bow | ok atar (ok harcar) | 0,59 | 161 | 346 | – | 50 |
| Gece ağacı yayı | bow | ok atar (ok harcar) | 0,6 | 280 | 376 | – | 56 |
| Işık ağacı yayı | bow | ok atar (ok harcar) | 0,57 | 196 | 433 | – | 63 |
| Sulama kabı | can | tarlayı sular | 1 | 25 | 10 | – | – |
| Ağ | fish | balık tutar (eline al, suya dön, E) | 3 | 25 | 15 | – | – |
| Balık kapanı | fish | balık tutar (eline al, suya dön, E) | 4 | 40 | 25 | – | – |
| Kemik zıpkın | fish | balık tutar (eline al, suya dön, E) | 2,5 | 30 | 20 | – | – |
| Olta | fish | balık tutar (eline al, suya dön, E) | 3 | 25 | 15 | – | – |
| Pompalı | gun | ateş eder (Pompalı fişeği) | 1 | 999 | 0 | – | – |
| Tabanca | gun | ateş eder (Tabanca mermisi) | 1 | 999 | 0 | – | – |
| Tırmık | rake | toprağı hazırlar | 1,4 | 30 | 8 | – | – |
| Tırpan | scythe | ürünü biçer | 1 | 30 | 12 | – | – |
| Boynuz kazma | shovel | kil kazar | 2 | 40 | 25 | – | – |
| Kürek | shovel | kil kazar | 3 | 25 | 10 | – | – |
| Ateş asası | staff | ateş topu atar (mana) | 1 | 999 | 0 | – | – |
| Buz asası | staff | buz oku atar (mana) | 1 | 999 | 0 | – | – |
| Yıldırım asası | staff | zincirleme yıldırım (mana) | 1 | 999 | 0 | – | – |
| Işın kılıcı | sword | plazma kılıç | 1 | 999 | 0 | – | 60 |
| Kaba meşale | torch | gece aydınlatır | 0 | 1.000.000 | 0 | – | – |
| Meşale | torch | gece aydınlatır | 0 | 1.000.000 | 0 | – | – |
| Bola | trap | küçük av (Tuzak: eline al, çayırda F ile kur) | 2,5 | 25 | 15 | – | – |
| Dişbudak yayı | trap | küçük av (Tuzak: eline al, çayırda F ile kur) | 2 | 35 | 30 | – | – |
| Porsuk yayı | trap | küçük av (Tuzak: eline al, çayırda F ile kur) | 2 | 40 | 40 | – | – |
| Sapan | trap | küçük av (Tuzak: eline al, çayırda F ile kur) | 2,5 | 25 | 20 | – | – |
| Tuzak | trap | küçük av (Tuzak: eline al, çayırda F ile kur) | 3 | 20 | 12 | – | – |
| Huş kabuğu kabı | water | su taşır | 2 | 1.000.000 | 0 | – | – |
| Yaprak kova | water | su taşır | 3 | 1.000.000 | 0 | – | – |


## Zırhlar

Beş yuva vardır: **baş, gövde, el, ayak, silah**. Özellikler penceresinden (C) giyilir. Canavar hasarı **25 / (25 + toplam savunma)** katına iner: 25 savunma hasarı yarıya, 75 savunma dörtte bire indirir.

| Zırh | Yuva | Savunma | Nerede yapılır | Not |
|---|---|---|---|---|
| Kafa lambası | Baş | 3 | – | ışık; setlere girmeyen tek özel eşya |
| Kürk başlık | Baş | 4 | El yapımı (Tab) | – |
| Bakır miğfer | Baş | 8 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Kemik miğfer | Baş | 9 | El yapımı (Tab) | – |
| Tunç miğfer | Baş | 12 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Ceviz kabuğu miğfer | Baş | 13 | Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Demir miğfer | Baş | 20 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Timsah miğfer | Baş | 22 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: zehir %15, metal |
| Çelik miğfer | Baş | 28 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Kartal tüyü miğfer | Baş | 31 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Kara çelik miğfer | Baş | 36 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Ejder miğferi | Baş | 40 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Mor kristal miğfer | Baş | 45 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | metal |
| Ametist miğfer | Baş | 50 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: zehir %20, metal |
| Kürk yelek | Gövde | 8 | El yapımı (Tab) | – |
| Bakır zırh | Gövde | 16 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Kemik zırh | Gövde | 18 | El yapımı (Tab) | – |
| Tunç zırh | Gövde | 24 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Meşe kabuk zırh | Gövde | 27 | Örs · Zırhçı Duran (Orman) ve üstü döver | direnç: kanama %15 |
| Demir zırh | Gövde | 40 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: kanama %30, metal |
| Timsah pulu zırh | Gövde | 45 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: kanama %40, metal |
| Çelik zırh | Gövde | 54 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %35, metal |
| Gümüş pullu zırh | Gövde | 60 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %35, metal |
| Kara çelik zırh | Gövde | 68 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %40, kanama %30, metal |
| Ejder zırhı | Gövde | 76 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %60, metal |
| Mor kristal zırh | Gövde | 84 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: kanama %30, yanık %30, zehir %30, metal |
| Kristal ipek zırh | Gövde | 94 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: kanama %25, yanık %25, zehir %25 |
| Kürk eldiven | El | 3 | El yapımı (Tab) | – |
| Bakır eldiven | El | 5 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Kemik eldiven | El | 6 | El yapımı (Tab) | – |
| Tunç eldiven | El | 7 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Meşe kabuk eldiven | El | 8 | Örs · Zırhçı Duran (Orman) ve üstü döver | direnç: kanama %10 |
| Demir eldiven | El | 12 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Timsah eldiven | El | 13 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: zehir %15, metal |
| Çelik eldiven | El | 16 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Gümüş eldiven | El | 18 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %15, metal |
| Kara çelik eldiven | El | 21 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Ejder eldiveni | El | 24 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Mor kristal eldiven | El | 26 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | metal |
| Işık pulu eldiven | El | 29 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: zehir %35 |
| Deri çarık | Ayak | 3 | El yapımı (Tab) | – |
| Bakır çizme | Ayak | 5 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Kemik çizme | Ayak | 6 | El yapımı (Tab) | – |
| Tunç çizme | Ayak | 7 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Meşe kabuk çizme | Ayak | 8 | Örs · Zırhçı Duran (Orman) ve üstü döver | direnç: kanama %10 |
| Demir çizme | Ayak | 12 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | çamur, metal |
| Kamış çizme | Ayak | 13 | El yapımı (Tab) | direnç: zehir %15, çamur |
| Çelik çizme | Ayak | 16 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | çamur, metal |
| Gümüş çizme | Ayak | 18 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %15, metal |
| Kara çelik çizme | Ayak | 21 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | çamur, metal |
| Ejder çizmesi | Ayak | 24 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Mor kristal çizme | Ayak | 26 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | çamur, metal |
| Kristal ipek çizme | Ayak | 29 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: zehir %20 |
| Hurda çizme ² | Ayak | 15 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Meka çizme ² | Ayak | 18 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: kanama %20, metal |
| Fırtına tüyü başlık ² | Baş | 22 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Kristal miğfer ² | Baş | 26 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: kanama %30, metal |
| Mantar lifi eldiven ² | El | 14 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: zehir %40 |
| Ejder pulu eldiven ² | El | 16 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: yanık %40 |
| Meka zırh ² | Gövde | 90 | Mühendis Işın yapar (600 sikke işçilik) | direnç: kanama %50, yanık %50, zehir %50, metal |


## Evler ve barınaklar (Usta Sinan; v3.39'a kadar Marangoz Çınar)

Fiyat: Sinan'a ödenen toplam sikke, malzeme ve işçilik dahil (tek tanım: Sistemler › Ev, ev içi ve döşeme).

| Yapı | Seviye | Fiyat (sikke) | Malzeme | Açıklama |
|---|---|---|---|---|
| Yaprak barınağı | Sv 1 | 25 | 8 Dal, 12 Yaprak, 4 Lif | Yatak gerekmez. Bir gecelik: uyanınca dağılır. |
| Deri çadır | Sv 3 | 300 | – | Kalıcı bir çadır. İçinde uyumak için yatak koymalısın. |
| Kulübe | Sv 4 | 450 | – | Dal ve taştan sağlam bir kulübe. Yatak ister. |
| Kamış kulübe | Sv 5 | 650 | – | Kamış çatılı, serin bir kulübe. Yatak ister. |
| Kerpiç ev | Sv 6 | 950 | – | Kalın kerpiç duvarlı ev. Yatak ister. |
| Ahşap ev | Sv 7 | 1.500 | – | Kalas duvarlı, kiremit çatılı ev. Yatak ister. |
| Taş ev | Sv 8 | 2.500 | – | Taştan sağlam bir ev. Yatak ister. |
| Konak | Sv 10 | 5.000 | – | Adanın en görkemli evi. Yatak ister. |


# Eşyalar · Eşya dizini

## Eşya resimleri (v3.37, Boğaç)

Her eşyanın adına uygun bir resmi vardır (Giriş › Kural). v3.37'ye kadar **194 eşya** resimsizdi ve adından renk alan bir "hediye paketi" kutusu olarak görünüyordu; hepsine gerçek resim çizildi. Resim envanterde, kitapta, elde, yere düşünce ve kurulunca aynıdır.
- **v3.43 tarla eşyaları:** altı tohum kesesi (her biri içindeki tohumun renginde), Buğday (başak demeti), Patates, Soğan, Kabak, Ayçiçeği, Buğday unu (çuval), Ekmek (somun), Korkuluk, Hasat sepeti (dolu sepet), Elma / Armut / Erik fidanı (saksıda fidan, meyvesinin renginde bir tomurcuk).

- **Pişmiş / Tütsülenmiş / Kurutulmuş / Taşta balık** (Sazan, Yayın, Tatlısu kefali, Kerevit, Turna balığı, Kızılkanat, Yılan balığı, Kadife balığı, Kurbağa, Mersin balığı, Çapak): çiğ halinin resminden: pişmiş kızarmış renkte ve ızgara izli, tütsülenmiş koyu ve dumanlı, kurutulmuş soluk ve tuzlu, taşta olan taş levhanın üstünde.
- **Deniz yemekleri:** tavada (Hamsi, Tekir, Barbunya, Kalkan tava), tabakta (Kalamar tava, Çipura buğulama, Orkinos biftek), ızgarada (İstavrit, Lüfer), kapta (Kefal pilakisi), şişte (Levrek, Kılıç şiş), kâsede (Ahtapot salatası); Kılıç balığı, Fener balığı ve Işıl balığı kendi biçimleriyle.
- **Mutfak:** kavrulmuş ve ballı yemişler, şişler, Ziyafet sofrası, salata, et, Dağ çayı demi (demlik), Bal şarabı (şişe).
- **Merhemler kapta, yağlar şişede, iksirler cam şişede, reçeller kavanozda, tohumlar çekirdek olarak, inciler sedefle.**
- **Yapılan şeyler:** Sapan, Bola, Kirmen, Dokuma tezgâhı, Ok kılıfı, Deri çanta, Deri tulum, Yelkenli sal, Atölye, çanlar, ipler (kangal), yelpazeler, tılsımlar, Golem feneri, Kaya patlatıcı, Semender derisi tef, Ağ kapanı, Kor zurnası, yemler…
- **Toplananlar ve canlı parçaları:** bölge bitkileri (Kardelen, Ay otu, Gece zambağı…), taşlar ve kristaller (Kükürt kristali, Volkan camı, Ayna taşı, Ametist…), tozlar, yosunlar, kökler, Sülük, Dev yüreği, Çamur Ana gözü, Kartal pençesi, Örümcek gözü…
- **Unutulan resim:** resmi olmayan bir eşya renkli kutu değil, sade bir bez torba olarak görünür; geliştirici araçları açıkken (`?debug`) oyun açıldıktan 12 saniye sonra konsola "resmi yok" listesi yazılır.

> ACT 1 madenlerinin fiyatları ve yerleri değişti (**Aletler · Madenler ve ekipman merdiveni**). Bir madeni kullanan tariflerin fiyatı, maden fiyatındaki değişim × miktar × 1,3 kadar (zincir boyunca) kendiliğinden değişir; bu tablodaki türetilmiş fiyatlar henüz yeniden üretilmedi (değerleri). Yeni setlerin, ara ürünlerin ve Tunç/Demir set parçalarının fiyatları o bölümdeki tablolardadır.

Oyundaki bütün eşyalar alfabetik sırada. **Nereden gelir** sütunu bir eşyayı elde etmenin bütün yollarını sayar: yerden toplama (hangi biyomda), ağaç, av (hangi canlı, yüzde kaç ihtimalle), balık, tarif (nerede öğrenilir ve kim yapar), kişilerin verdikleri. **Kullanıldığı tarifler** ilk altı tarifi gösterir; tamamı için tarif ansiklopedisinde malzeme adını arat.

| Eşya | Fiyat | Tür | Nereden gelir | Hangi tariflerde kullanılır |
|---|---|---|---|---|
| Acı biber ezmesi | 402 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Adaçayı | 21 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş adaçayı |
| Adaçayı çayı | 239 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ağ | 63 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Ağıl | ~250 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Ağır plaka ² | 70 | – | Av: Hurda devi düşürür %90 (ACT 2 · Hurda Çölü) | Hurda çizme, Pompalı |
| Ağ kapanı | 420 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ahşap ev | 900 | – | Usta Sinan yapar (1.500 sikke) | – |
| Ahşap karyola | 475 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Ahşap parke | ~6 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) (→ 4), İnşa kipiyle kurulur | – |
| Ahtapot | 133 | – | Deniz avı: Mor Derinlik (Gemici Poyraz'ın teknesiyle, Sv 22+, Yıldız oltası) %50 | Ahtapot salatası |
| Ahtapot salatası | 304 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Ahududu | 9 | yenir +9 | Yerden toplanır: Orman (ACT 1) | Ahududu ezmesi, Ahududu suyu, Kurutulmuş ahududu, Meyve karışımı |
| Ahududu ezmesi | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ahududu suyu | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akçaağaç kabuğu | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akçaağaç kalası | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akçaağaç sapı, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap … (+15) |
| Akçaağaç kaşığı | 152 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akçaağaç kömürü | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Akçaağaç odunu | 22 | – | Balta ile Akçaağaç ağacından: Kayalık Dağ (ACT 1) | Akçaağaç kabuğu, Akçaağaç kalası, Akçaağaç kömürü, Akçaağaç yayı |
| Akçaağaç özsuyu | 3 | yenir +8 | Akçaağaç ağacı kesilince 1 tane düşer | Akçaağaç şurubu |
| Akçaağaç sapı | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Akçaağaç kaşığı, Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta … (+22) |
| Akçaağaç şurubu | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Akçaağaç yayı | 1.022 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Akrep iğnesi | 55 | – | Av: Ateş akrebi düşürür %70 (ACT 1 · Kül Diyarı) | Akrep ok ucu |
| Akrep kabuğu | 45 | – | Av: Ateş akrebi düşürür %80 (ACT 1 · Kül Diyarı) | Akrep kabuğu kalkanı |
| Akrep kabuğu kalkanı | 298 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Akrep ok ucu | 154 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Alabalık | 5 | – | Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %24; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş alabalık, Pişmiş alabalık, Taşta alabalık, Tütsülenmiş alabalık |
| Alevli Bakır ok | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alevli Basit ok | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alevli Çelik ok | 5.930 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alevli Demir ok | 926 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alevli Kara çelik ok | 19.692 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alevli Mızrak | 179 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Alevli Mor kristal ok | 5.220 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alevli Taş kılıç | 188 | alet, silah 12 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Alevli Taş savaş çekici | 180 | alet, silah 13 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Alevli Taş topuz | 171 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Alevli Tunç ok | 674 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alıç | 30 | yenir +15 | Yerden toplanır: Kayalık Dağ (ACT 1) | Alıç ezmesi, Alıç suyu, Kurutulmuş alıç |
| Alıç ezmesi | 128 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Alıç suyu | 339 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Altın cevheri | 77 | – | Kazmayla kazılır: Mor Kristal Vadisi (ACT 1) | Altın külçesi |
| Altın kolye | 1.142 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Altın külçesi | 409 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın kolye, Mor kristal levhası |
| Ametist | 67 | – | Kazmayla kazılır: Mor Kristal Vadisi (ACT 1) · Av: Kristal golem düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Ametist kılıcı, Ametist miğfer, Ametist savaş çekici, Ametist topuz, Ametist yüzük, Işık ağacı yayı … (+10) |
| Ametist kılıcı | 7.978 | alet, silah 58 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Ametist miğfer | 3.932 | giyilir +50 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Ametist savaş çekici | 9.403 | alet, silah 93 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Ametist topuz | 5.717 | alet, silah 68 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Ametist yüzük | 433 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ana tanrıça heykelciği | 289 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç kabuğu | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç kalası | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Ardıç sapı, Asma fener, Atölye, Dolap … (+15) |
| Ardıç kaşığı | 159 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç kömürü | 90 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ardıç meyvesi | 30 | yenir +14, zehirli | Meyve ağacı (Ardıç): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ardıç ağacından toplanır: Kayalık Dağ (ACT 1) | Ardıç meyvesi ezmesi, Ardıç meyvesi suyu, Kurutulmuş ardıç meyvesi |
| Ardıç meyvesi ezmesi | 128 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç meyvesi suyu | 339 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ardıç odunu | 22 | – | Balta ile Ardıç ağacından: Kayalık Dağ (ACT 1) | Ardıç kabuğu, Ardıç kalası, Ardıç kömürü, Kütük salı, Oyma kano |
| Ardıç sapı | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ardıç kaşığı, Gümüş kılıç, Kuvars savaş çekici, Kuvars topuz |
| Ardıç tohumu | 3 | – | Ardıç ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Arduvaz | 18 | – | Kazmayla kazılır: Bataklık (ACT 1) | Taş levha |
| Arı kovanı | 145 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Armut fidanı | 45 | – | EK4'ten sonra Çiftçi Ekin satar (45 sikke) · Bereket Adası'nda fidan yerine dikilir, 3 günde Armut ağacı olur | – |
| Armut odunu | – | – | Balta ile Armut ağacından: Çayır (ACT 1) | – |
| Armut tohumu | 3 | – | Armut ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Asma fener | 269 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Ateş | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahtapot salatası, Akçaağaç kömürü, Akçaağaç şurubu, Ardıç kömürü, Ateş narı kömürü, Ateş tuğlası … (+117) |
| Ateş asası ² | 900 | alet | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Büyücü Efsun yapar (100 sikke işçilik) | – |
| Ateş bezesi | 90 | – | Av: Lav kertenkelesi düşürür %50 (ACT 1 · Kül Diyarı) · Av: Kül cini düşürür %60 (ACT 1 · Kül Diyarı) · Av: Kor yarasası düşürür %50 (ACT 1 · Kül Diyarı) | Ateş iksiri |
| Ateş biberi | 52 | yenir +17 | Yerden toplanır: Kül Diyarı (ACT 1) | Acı biber ezmesi |
| Ateş çiçeği | 36 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Ateş çiçeği balı, Ateş çiçeği merhemi, Ateş iksiri |
| Ateş çiçeği balı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş çiçeği merhemi | 398 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş iksiri | 449 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş narı | 62 | yenir +19 | Meyve ağacı (Ateş narı): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ateş narı ağacından toplanır: Kül Diyarı (ACT 1) | Ateş narı şerbeti, Kurutulmuş ateş narı |
| Ateş narı kalası | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Ateş narı sapı, Atölye, Dolap … (+15) |
| Ateş narı kömürü | 141 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ateş narı odunu | 40 | – | Balta ile Ateş narı ağacından: Kül Diyarı (ACT 1) | Ateş narı kalası, Ateş narı kömürü, Kütük salı, Oyma kano |
| Ateş narı sapı | 161 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Ateş narı şerbeti | 485 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ateş narı tohumu | 12 | – | Ateş narı ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Ateş tuğlası | 122 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çelik külçesi |
| Ateş yağı | 124 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Bakır ok, Alevli Basit ok, Alevli Çelik ok, Alevli Demir ok, Alevli Kara çelik ok, Alevli Mızrak … (+9) |
| Ateş yeri | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | Taş fırın |
| Atölye | 127 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Avcı yahnisi | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ziyafet sofrası |
| Av sahnesi duvar resmi | 347 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ayçiçeği | 23 | yenir +4 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | – |
| Ayçiçeği tohumu | 6 | – | Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Ayçiçeği) | – |
| Ayı pençesi | 22 | – | Av: Mağara ayısı düşürür %60 (ACT 1 · Kayalık Dağ) | Pençe kolye, Gümüş pullu zırh |
| Ayna ipeği | 250 | – | Mağara canlısı Ayna örümceği düşürür (Ayna Mağarası, Mor Kristal Vadisi) %80 ×1–2 | Gölge pulu muska |
| Ayna taşı | 90 | – | Mağarada yerden toplanır: Ayna Mağarası (Mor Kristal Vadisi, giriş Sv 42) | Işık Yutan kalbi tılsımı, Kristal zil |
| Ay çayı | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay çiçeği ² | 28 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Ay elması | 93 | yenir +24 | Meyve ağacı (Ay elması): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ay elması ağacından toplanır: Mor Kristal Vadisi (ACT 1) | Ay elması reçeli, Kurutulmuş ay elması |
| Ay elması kalası | 151 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Ay elması sapı, Dolap … (+15) |
| Ay elması kömürü | 178 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ay elması odunu | 54 | – | Balta ile Ay elması ağacından: Mor Kristal Vadisi (ACT 1) | Ay elması kalası, Ay elması kömürü, Kütük salı, Oyma kano |
| Ay elması reçeli | 574 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay elması sapı | 209 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Ay elması tohumu | 18 | – | Ay elması ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Ay ışığı iksiri | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay otu | 77 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Ay otu iksiri |
| Ay otu iksiri | 698 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ay taşı | 87 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Ay taşı kolyesi |
| Ay taşı kolyesi | 131 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bağlı uç | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bakır balta | 143 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Bakır cevheri | 5 | – | Kazmayla kazılır: Çayır (ACT 1) | Bakır çizme, Bakır eldiven, Bakır külçesi, Bakır miğfer, Bakır zırh, Tunç çizme … (+3) |
| Bakır çizme | 251 | giyilir +5 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Bakır eldiven | 259 | giyilir +5 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Bakır kazma | 146 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Bakır kılıç | 346 | alet, silah 16 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Bakır külçesi | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bakır balta, Bakır kazma, Bakır kılıç, Bakır mızrak, Bakır ok, Bakır savaş çekici … (+4) |
| Bakır mızrak | 150 | alet, silah 15 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Bakır miğfer | 254 | giyilir +8 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Bakır ok | 4 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Bakır ok, Keskin Bakır ok, Zehirli Bakır ok |
| Bakır savaş çekici | 211 | alet, silah 18 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Bakır tel ² | 14 | – | Yerden toplanır: Hurda Çölü (ACT 2) · Av: Hurda faresi düşürür %80 (ACT 2 · Hurda Çölü) | Enerji hücresi |
| Bakır topuz | 143 | alet, silah 14 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Bakır zırh | 542 | giyilir +16 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Balçık bezesi | 78 | – | Mağara canlısı Balçık kurbağası düşürür (Batık Mağara, Bataklık) %70 ×1 · Mağara reisi Çamur Ana düşürür (Batık Mağara, Bataklık) %100 ×3–5 | – |
| Balık çorbası | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık kapanı | 33 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Balık pulu | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık sepeti | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balık tutkalı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Fırtına oltası |
| Balık yağı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ballı ekmek | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ballı fındık | 122 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ballı kestane | 249 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Balmumu | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Arı kovanı, Balmumu mumu |
| Balmumu mumu | 134 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Asma fener |
| Bal şarabı | 121 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bal şerbeti | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bal şarabı |
| Barbunya | 26 | – | Deniz avı: Mercan Sığlığı (Gemici Poyraz'ın teknesiyle, Sv 10+, Makaralı olta) %50 | Barbunya tava |
| Barbunya tava | 102 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Barut ² | 75 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Pompalı fişeği, Tabanca mermisi |
| Barut kayası ² | 22 | – | Kazmayla kazılır: Hurda Çölü (ACT 2) | Barut |
| Basit ok | 2 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Basit ok, Keskin Basit ok, Zehirli Basit ok |
| Basit yay | 90 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bataklık kurdu postu | 30 | – | Av: Bataklık kurdu düşürür %80 (ACT 1 · Bataklık) | Timsah pulu zırh |
| Bataklık otu | 15 | – | Yerden toplanır: Bataklık (ACT 1) | Bataklık otu çayı, Panzehir |
| Bataklık otu çayı | 165 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bataklık servisi kalası | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bataklık servisi sapı, İskele, Makaralı olta |
| Bataklık servisi kömürü | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Bataklık servisi odunu | 17 | – | Balta ile Bataklık servisi ağacından: Bataklık (ACT 1) | Bataklık servisi kalası, Bataklık servisi kömürü, Kütük salı, Oyma kano |
| Bataklık servisi sapı | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Demir balta, Demir kazma, Demir kılıç, Demir savaş çekici, Demir topuz, Timsah dişi balta … (+4) |
| Batık kök | 32 | – | Mağarada yerden toplanır: Batık Mağara (Bataklık, giriş Sv 18) | İnci kolye, Semender derisi tef |
| Bazalt | 45 | – | Kazmayla kazılır: Kül Diyarı (ACT 1) | Taş kase, Yontulmuş bazalt |
| Bazalt bıçak | 429 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt kazıyıcı | 275 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Bazalt ok ucu | 2.259 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Bazalt pulu | 191 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Bazalt kazıyıcı, Bazalt ok ucu |
| Bazalt sivri ucu | 1.374 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ejder kazması, Ejder mızrağı |
| Beyaz boncuk | 77 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Beyaz boya | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Beyaz çömlek | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Beyaz kase | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Beyaz kerpiç | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Beyaz tuğla, Kerpiç duvar |
| Beyaz kil | 23 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Ateş tuğlası, Beyaz boya, Islak beyaz kil |
| Beyaz tuğla | 106 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Bıldırcın eti | 3 | – | Av: Bıldırcın düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş bıldırcın eti, Pişmiş bıldırcın eti, Turba ateşinde tütsü … (+1) |
| Bıldırcın tüyü | 2 | – | Av: Bıldırcın düşürür %80 (ACT 1 · Çayır) | – |
| Bıldırcın yumurtası | 3 | – | Av: Bıldırcın düşürür %40 (ACT 1 · Çayır) | Haşlanmış bıldırcın yumurtası |
| Bileği taşı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Beyaz kase (alet), Boynuz borazan (alet), Cilalı kristal (alet), Göl kasesi (alet), Kehribar boncuk (alet), Kemik iğne (alet) … (+5) |
| Bileme macunu | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı kılıç, Çakmaktaşı mızrak, Çakmaktaşı savaş çekici, Çakmaktaşı topuz, Granit kılıç, Granit mızrak … (+17) |
| Bola | 63 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Boyalı çömlek | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boynuz borazan | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boynuz kazma | 70 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Boynuz kupa | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Boynuz tarak | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Böcek kabuğu ² | 14 | – | Av: Mantar böceği düşürür %90 (ACT 2 · Dev Mantar Ormanı) | Mantar lifi eldiven |
| Böcek kabuğu boyası | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Böğürtlen | 2 | yenir +5 | Yerden toplanır: Çayır (ACT 1) | Böğürtlen ezmesi, Böğürtlen suyu, Kurutulmuş böğürtlen, Meyve karışımı |
| Böğürtlen ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Böğürtlen suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Börü'nün kemeri | 140 | giyilir +26 savunma | Börü'yü silahsız 50 yumrukla yenince verir (gövde zırhı +26 savunma, kanama direnci %20; değeri 140) | – |
| Buğday | 8 | – | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | Buğday unu |
| Buğday tohumu | 3 | – | Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Buğday) | – |
| Buğday unu | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ekmek |
| Buhar | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Bulut çamı kalası ² | 47 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Bulut çamı odunu ² | 14 | – | Balta ile Bulut çamı ağacından: Yüzen Kayalar (ACT 2) | Bulut çamı kalası, Kütük salı, Oyma kano |
| Bulut elması ² | 23 | yenir +8 | Bulut elması ağacından toplanır: Yüzen Kayalar (ACT 2) | – |
| Bulut elması kalası ² | 52 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Bulut elması odunu ² | 16 | – | Balta ile Bulut elması ağacından: Yüzen Kayalar (ACT 2) | Bulut elması kalası, Kütük salı, Oyma kano |
| Bulut kavağı kalası ² | 114 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Bulut kavağı odunu ² | 40 | – | Balta ile Bulut kavağı ağacından: Gök Rıhtımı (ACT 2) | Bulut kavağı kalası, Kütük salı, Oyma kano |
| Bulut koyunu eti ² | 19 | – | Av: Bulut koyunu düşürür %100 (ACT 2 · Yüzen Kayalar) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş bulut koyunu eti, Turba ateşinde tütsü |
| Bulut kuvarsı ² | 34 | – | Kazmayla kazılır: Yüzen Kayalar (ACT 2) | – |
| Bulut özü ² | 26 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Bulut pamuğu ² | 12 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Bulut yünü ² | 16 | – | Av: Bulut koyunu düşürür %90 (ACT 2 · Yüzen Kayalar) | Bulut yünü ip |
| Bulut yünü ip ² | 67 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Buz asası ² | 1.600 | alet | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Büyücü Efsun yapar (200 sikke işçilik) | – |
| Buz kristali ² | 36 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | Buz asası |
| Buz kürkü ² | 40 | – | Av: Buz tavşanı düşürür %80 (ACT 2 · Kristal Golem Ocağı) | – |
| Buz tavşanı eti ² | 28 | – | Av: Buz tavşanı düşürür %100 (ACT 2 · Kristal Golem Ocağı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş buz tavşanı eti, Turba ateşinde tütsü |
| Büyü otu ² | 26 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) · Av: Goblin şamanı düşürür %80 (ACT 2 · Dev Mantar Ormanı) | Ateş asası, Buz asası, Mana iksiri, Yıldırım asası |
| Ceviz | 9 | yenir +8 | Meyve ağacı (Ceviz): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Ceviz ağacından toplanır: Orman (ACT 1) · Av: Sincap düşürür %35 (ACT 1 · Orman) | Ceviz içi, Ceviz kabuğu miğfer |
| Ceviz içi | 29 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ceviz yağı |
| Ceviz kabuğu | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ceviz kabuğu miğfer | 948 | giyilir +15 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Ceviz kalası | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Ceviz sapı, Dolap … (+15) |
| Ceviz kaşığı | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ceviz kömürü | 59 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ceviz odunu | 10 | – | Balta ile Ceviz ağacından: Orman (ACT 1) | Ceviz kabuğu, Ceviz kalası, Ceviz kömürü, Kütük salı, Oyma kano |
| Ceviz sapı | 56 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Ceviz kaşığı, Çakmaktaşı balta … (+22) |
| Ceviz tohumu | 3 | – | Ceviz ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Ceviz yağı | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Cilalı kristal | 177 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Civanperçemi | 21 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş civanperçemi, Şifalı merhem |
| Civanperçemi çayı | 239 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Cüruf | 44 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Cüruf tuğlası |
| Cüruf tuğlası | 263 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Çakıl yol | ~2 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) (→ 4), İnşa kipiyle kurulur | – |
| Çakmaktaşı | 2 | – | Yerden toplanır: Orman, Çayır, Mor Kristal Vadisi, Kayalık Dağ, Bataklık, Kül Diyarı (ACT 1) | Kamp ateşi, Kıvılcım, Pirit çakmağı, Taş kılıç, Yontulmuş çakmaktaşı |
| Çakmaktaşı balta | 164 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı bıçak | 111 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Kemik flüt (alet), Sandal küreği (alet) |
| Çakmaktaşı kazıyıcı | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı kazma | 252 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı kılıç | 398 | alet, silah 18 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı mızrak | 292 | alet, silah 14 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı ok ucu | 400 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Çakmaktaşı pulu | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı bıçak, Çakmaktaşı kazıyıcı, Çakmaktaşı ok ucu, Tırpan |
| Çakmaktaşı savaş çekici | 243 | alet, silah 20 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çakmaktaşı sivri ucu | 137 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı kazma, Çakmaktaşı mızrak |
| Çakmaktaşı topuz | 164 | alet, silah 16 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çamur Ana gözü | 900 | – | Mağara reisi Çamur Ana düşürür (Batık Mağara, Bataklık) %100 ×1 | Çamur Ana muskası |
| Çamur Ana muskası | 1.400 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Çam kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Çam sapı, Dolap … (+15) |
| Çam kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Çam kozalağı | 1 | – | Çam ağacı kesilince 1 tane düşer | Kozalak ateşi |
| Çam kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş yağı, Bakır külçesi, Çömlek fırını, Kara boya, Kor |
| Çam odunu | 3 | – | Balta ile Çam ağacından: Çayır (ACT 1) · kesilince 1 Çam reçinesi de düşer | Çam kalası, Çam kömürü, Çam yayı, Kütük salı, Oyma kano |
| Çam reçinesi | 27 | – | Ağaç: Çam kesilince her odunla 1 tane (Çayır) | Ateş yağı, Bileme macunu, Kara cila, Meşale, Zehir yağı |
| Çam sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bakır balta, Bakır kazma, Bakır kılıç, Bakır savaş çekici, Bakır topuz, Boynuz kazma … (+10) |
| Çam yayı | 112 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Çapak | 3 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %28; balık kapanına da girer · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %14; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş çapak, Pişmiş çapak, Taşta çapak, Tütsülenmiş çapak |
| Çayır mantarı | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kızarmış çayır mantarı, Kurutulmuş çayır mantarı |
| Çekiç taşı | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Bazalt pulu (alet), Bileği taşı (alet), Ceviz içi (alet), Çakmaktaşı pulu (alet), Kemik ok ucu (alet), Kristal parçası (alet) … (+10) |
| Çelik balta | 2.574 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Çelik çizme | 1.269 | giyilir +16 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Çelik eldiven | 1.282 | giyilir +16 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Çelik kazma | 2.576 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Çelik kılıç | 3.560 | alet, silah 46 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Çelik külçesi | 625 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Akçaağaç yayı, Çelik balta, Çelik kazma, Çelik kılıç, Çelik mızrak, Çelik ok … (+3) |
| Çelik mızrak | 1.730 | alet, silah 41 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Çelik miğfer | 1.275 | giyilir +28 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Çelik ok | 489 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Çelik ok, Keskin Çelik ok, Zehirli Çelik ok |
| Çelik savaş çekici | 4.207 | alet, silah 53 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Çelik topuz | 2.574 | alet, silah 39 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Çelik zırh | 3.499 | giyilir +54 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Çipura | 17 | – | Deniz avı: Rüzgârlı Körfez (Gemici Poyraz'ın teknesiyle, Sv 6+, Deniz oltası) %33 | Çipura buğulama |
| Çipura buğulama | 59 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Çit | ~20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) (→ 2), İnşa kipiyle kurulur | Ağıl, Tahta kapı |
| Çöl otu ² | 8 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Çömlek fırını | 331 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Dağ çayı | 23 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Dağ çayı demi |
| Dağ çayı demi | 252 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Dağ keçisi derisi | 7 | – | Av: Dağ keçisi düşürür %80 (ACT 1 · Kayalık Dağ) | – (satılır, görevlerde istenir) |
| Dağ keçisi eti | 10 | – | Av: Dağ keçisi düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş dağ keçisi eti, Pişmiş dağ keçisi eti, Turba ateşinde tütsü … (+1) |
| Dağ kristali | 58 | – | Mağarada yerden toplanır: Rüzgâr Mağarası (Kayalık Dağ, giriş Sv 26) | Dev yüreği tılsımı, Kristal kolye |
| Dal | 1 | – | Yerden toplanır: Orman, Çayır, Bataklık, Kayalık Dağ, Kül Diyarı, Mor Kristal Vadisi (ACT 1) | Ağ, Akçaağaç kalası, Akçaağaç kömürü, Akçaağaç sapı, Ardıç kalası, Ardıç kömürü … (+199) |
| Dal çit | ~4 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) (→ 2), İnşa kipiyle kurulur | – |
| Damla akı boyası | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Damla taşı | 12 | – | Mağarada yerden toplanır: Yankı Mağarası (Çayır, giriş Sv 5) | Damla akı boyası, Kertenkele merhemi |
| Demir balta | 806 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir cevheri | 20 | – | Kazmayla kazılır: Bataklık (ACT 1) | Çelik çizme, Çelik eldiven, Çelik miğfer, Çelik zırh, Demir çizme, Demir eldiven … (+16) |
| Demir çizme | 1.001 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | Hurda çizme |
| Demir eldiven | 1.011 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | Mantar lifi eldiven |
| Demir halka | 188 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Demir çizme, Demir eldiven, Demir miğfer, Demir zırh, Gümüş pullu zırh |
| Demir kazma | 1.125 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir kılıç | 1.655 | alet, silah 34 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir külçesi | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çelik külçesi, Demir balta, Demir halka, Demir kazma, Demir kılıç, Demir levha … (+11) |
| Demir levha | 353 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Demir çizme, Demir eldiven, Demir miğfer, Demir zırh, Ejder zırhı, Gemi … (+4) |
| Demir mızrak | 771 | alet, silah 30 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir miğfer | 1.013 | giyilir +20 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | Fırtına tüyü başlık |
| Demir ok | 94 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Demir ok, Keskin Demir ok, Zehirli Demir ok |
| Demir savaş çekici | 1.697 | alet, silah 39 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir topuz | 1.054 | alet, silah 29 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Demir zırh | 2.786 | giyilir +40 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Deniz oltası | 210 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Makaralı olta |
| Derin su oltası | 2.227 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Fırtına oltası |
| Deri çadır | 410 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur · Usta Sinan yapar (300 sikke) | – |
| Deri çanta | 790 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Deri parçası | 15 | – | Av: derisi ya da postu olan her hayvan düşürür (büyükler 1–2; tabaklamanın yerine) | Ahşap karyola, Ametist miğfer, Bakır çizme, Bakır eldiven, Bakır kılıç, Bakır miğfer … (+59) |
| Deri çarık | 276 | giyilir +3 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Deri davul | 337 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Deri tulum | 360 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tabakhane |
| Dev mantar kalası ² | 62 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Dev mantar odunu ² | 20 | – | Balta ile Dev mantar ağacından: Dev Mantar Ormanı (ACT 2) | Dev mantar kalası, Kütük salı, Oyma kano |
| Dev spor ² | 28 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Dev yüreği | 1.300 | – | Mağara reisi Dağ Devi düşürür (Rüzgâr Mağarası, Kayalık Dağ) %100 ×1 | Dev yüreği tılsımı |
| Dev yüreği tılsımı | 2.000 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dikenli akasya kalası | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dikenli akasya sapı, Dolap … (+15) |
| Dikenli akasya kömürü | 141 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Dikenli akasya odunu | 40 | – | Balta ile Dikenli akasya ağacından: Kül Diyarı (ACT 1) | Dikenli akasya kalası, Dikenli akasya kömürü, Kütük salı, Oyma kano |
| Dikenli akasya sapı | 161 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Diken iğnesi | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Diken ok ucu | 50 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Direk feneri | ~170 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, İnşa kipiyle kurulur | – |
| Dişbudak kabuğu | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dişbudak kalası | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dişbudak sapı, Dolap … (+15) |
| Dişbudak kaşığı | 118 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dişbudak kömürü | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Dişbudak odunu | 14 | – | Balta ile Dişbudak ağacından: Bataklık (ACT 1) | Dişbudak kabuğu, Dişbudak kalası, Dişbudak kömürü, Kütük salı, Oyma kano |
| Dişbudak sapı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+23) |
| Dişbudak yayı | 128 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Dişli ² | 18 | – | Av: Pas böceği düşürür %90 (ACT 2 · Hurda Çölü) · Av: Devriye robotu düşürür %90 (ACT 2 · Hurda Çölü) | Hurda çizme, Pompalı, Tabanca |
| Diş kolye | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Dokuma tezgâhı | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Keten kumaş (alet) |
| Dolap | 174 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Domuz dişi muska | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Don yağı mumu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Duman | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tütsühane, Tütsülenmiş alabalık, Tütsülenmiş bıldırcın eti, Tütsülenmiş çapak, Tütsülenmiş dağ keçisi eti, Tütsülenmiş geyik eti … (+32) |
| Duman çiçeği | 46 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Duman tütsüsü |
| Duman fişeği | 420 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Duman özü | 196 | – | Mağara canlısı Duman cini düşürür (Kor Mağarası, Kül Diyarı) %60 ×1 | Duman fişeği |
| Duman tütsüsü | 127 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Duvar halısı | 582 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Ebegümeci | 1 | – | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş ebegümeci |
| Eğrelti | 7 | – | Yerden toplanır: Orman (ACT 1) | Eğrelti yatağı |
| Eğrelti yatağı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ejder baltası | 6.007 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder çizmesi | 3.108 | giyilir +24 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Ejder dişi ² | 120 | – | Av: Yavru ejder düşürür %70 (ACT 2 · Ejder Volkanı) | Ejder pulu eldiven, Işın kılıcı |
| Ejder eldiveni | 3.116 | giyilir +24 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Ejder kalbi ² | 900 | – | Av: Kızıl ejder düşürür %100 (ACT 2 · Ejder Volkanı) | Roket motoru |
| Ejder kazması | 6.672 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder kemiği | 200 | – | Av: Kara ejder düşürür %80 (ACT 1 · Kül Diyarı) | Ejder baltası, Ejder kazması, Ejder kılıcı, Ejder mızrağı, Ejder savaş çekici, Ejder topuzu … (+1) |
| Ejder kılıcı | 7.539 | alet, silah 52 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder kristali ² | 70 | – | Kazmayla kazılır: Ejder Volkanı (ACT 2) | Plazma hücresi, Yıldırım asası |
| Ejder meyvesi ² | 18 | – | Ejder meyvesi ağacından toplanır: Ejder Volkanı (ACT 2) | Ejder meyvesi şerbeti |
| Ejder meyvesi kalası ² | 93 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Ejder meyvesi odunu ² | 32 | – | Balta ile Ejder meyvesi ağacından: Ejder Volkanı (ACT 2) | Ejder meyvesi kalası, Kütük salı, Oyma kano |
| Ejder meyvesi şerbeti ² | 312 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Ejder mızrağı | 3.616 | alet, silah 58 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder miğferi | 3.134 | giyilir +40 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Ejder otu ² | 28 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Ejder pulu eldiven ² | 2.924 | giyilir +16 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Ejder savaş çekici | 10.398 | alet, silah 75 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder topuzu | 5.998 | alet, silah 55 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder yayı | 1.671 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Ejder zırhı | 7.720 | giyilir +60 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Ekmek | 153 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Elma fidanı | 40 | – | Çiftçi Ekin'in EK4 ödülü (1 tane) · EK4'ten sonra Ekin satar (40 sikke) · Bereket Adası'nda fidan yerine dikilir, 3 günde Elma ağacı olur | – |
| Elma odunu | – | – | Balta ile Elma ağacından: Çayır (ACT 1) | – |
| Elma tohumu | 3 | – | Elma ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| El izi resmi | 146 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Enerji hücresi ² | 221 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Meka zırh, Plazma hücresi |
| Enerji taşı ² | 44 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) · Av: Kristal golemcik düşürür %40 (ACT 2 · Kristal Golem Ocağı) | Buz asası, Enerji hücresi, Titanyum külçesi |
| Erik fidanı | 45 | – | EK4'ten sonra Çiftçi Ekin satar (45 sikke) · Bereket Adası'nda fidan yerine dikilir, 3 günde Erik ağacı olur | – |
| Erik odunu | – | – | Balta ile Erik ağacından: Çayır (ACT 1) | – |
| Erik tohumu | 3 | – | Erik ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Erzak çukuru | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Eski devre ² | 30 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Et şişi | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Közlenmiş şiş |
| Fener balığı | 162 | – | Deniz avı: Mor Derinlik (Gemici Poyraz'ın teknesiyle, Sv 22+, Yıldız oltası) %33 | Işıl çorbası |
| Fındık | 9 | yenir +8 | Ağaç: Fındık ağacı silkelenince (ACT 1 · Orman) · Av: Sincap düşürür %35 (ACT 1 · Orman) | Kavrulmuş fındık |
| Fındık odunu | 8 | – | Balta ile Fındık ağacından: Orman (ACT 1) | – (satılır) |
| Fırtına oltası | 4.464 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yıldız oltası |
| Fırtına tüyü ² | 40 | – | Av: Fırtına kartalı düşürür %90 (ACT 2 · Yüzen Kayalar) | Fırtına tüyü başlık |
| Fırtına tüyü başlık ² | 1.939 | giyilir +22 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | Kristal miğfer |
| Füzyon taşı ² | 80 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | Meteor demiri külçesi |
| Gece ağacı kalası | 153 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gece ağacı sapı … (+15) |
| Gece ağacı kömürü | 180 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Gece ağacı odunu | 55 | – | Balta ile Gece ağacı ağacından: Mor Kristal Vadisi (ACT 1) | Gece ağacı kalası, Gece ağacı kömürü, Gece ağacı yayı |
| Gece ağacı sapı | 212 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Gece ağacı yayı | 2.211 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Gece sefası | 10 | yenir +5 | Yalnız gece, karanlık iyice çökünce karada (Çayır/Orman) beliren beyaz çiçek; F ile toplanır | Ay çayı, Ay ışığı iksiri |
| Gece zambağı | 72 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Gece zambağı yağı |
| Gece zambağı yağı | 388 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gelincik | 2 | – | Yerden toplanır: Çayır (ACT 1) | Gelincik boyası, Kurutulmuş gelincik |
| Gelincik boyası | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Gelincik çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gemi | 2.913 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Geyik boynuzu | 9 | – | Av: Geyik düşürür %40 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %40 (ACT 2 · Dev Mantar Ormanı) · Av: Yıldız geyiği düşürür %40 (ACT 2 · Gök Rıhtımı) | Boynuz kazma, Boynuz tarak |
| Geyik derisi | 8 | – | Av: Geyik düşürür %80 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %80 (ACT 2 · Dev Mantar Ormanı) · Av: Yıldız geyiği düşürür %80 (ACT 2 · Gök Rıhtımı) | – (satılır, görevlerde istenir) |
| Geyik eti | 8 | – | Av: Geyik düşürür %100 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %100 (ACT 2 · Dev Mantar Ormanı) · Av: Yıldız geyiği düşürür %100 (ACT 2 · Gök Rıhtımı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş geyik eti, Pişmiş geyik eti, Turba ateşinde tütsü … (+1) |
| Goblin bakırı ² | 16 | – | Kazmayla kazılır: Dev Mantar Ormanı (ACT 2) | – |
| Goblin bıçağı ² | 60 | – | Av: Goblin düşürür %40 (ACT 2 · Dev Mantar Ormanı) | – |
| Goblin eriği ² | 21 | yenir +6 | Kök ağacı ağacından toplanır: Dev Mantar Ormanı (ACT 2) | Goblin eriği reçeli |
| Goblin eriği reçeli ² | 221 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Goblin kulağı ² | 30 | – | Av: Goblin düşürür %80 (ACT 2 · Dev Mantar Ormanı) · Av: Goblin okçusu düşürür %60 (ACT 2 · Dev Mantar Ormanı) | Mantar lifi eldiven |
| Goblin oku ² | 20 | – | Av: Goblin okçusu düşürür %80 (ACT 2 · Dev Mantar Ormanı) | – |
| Goblin otu ² | 12 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Golem çekirdeği | 600 | – | Av: Kristal golem düşürür %60 (ACT 1 · Mor Kristal Vadisi) · Av: Büyük golem düşürür %70 (ACT 2 · Kristal Golem Ocağı) | Golem feneri, Meka zırh |
| Golem feneri | 1.188 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Golem parçası ² | 36 | – | Av: Kristal golemcik düşürür %90 (ACT 2 · Kristal Golem Ocağı) | Kristal miğfer |
| Golem tozu ² | 14 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Göktaşı tozu ² | 24 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Gök camı ² | 60 | – | Kazmayla kazılır: Gök Rıhtımı (ACT 2) | Roket gövdesi |
| Gök camı parçası ² | 36 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Gök demiri ² | 30 | – | Kazmayla kazılır: Yüzen Kayalar (ACT 2) | Gök demiri külçesi |
| Gök demiri külçesi ² | 149 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Tabanca |
| Gök ipeği ² | 30 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | Roket |
| Gök kamışı kalası ² | 114 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Gök kamışı odunu ² | 40 | – | Balta ile Gök kamışı ağacından: Gök Rıhtımı (ACT 2) | Gök kamışı kalası, Kütük salı, Oyma kano |
| Gök kumu ² | 10 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Gök mantarı ² | 34 | yenir +3 | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Gök otu ² | 14 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Gök söğüdü kalası ² | 52 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Gök söğüdü odunu ² | 16 | – | Balta ile Gök söğüdü ağacından: Yüzen Kayalar (ACT 2) | Gök söğüdü kalası, Kütük salı, Oyma kano |
| Gök tazısı postu ² | 60 | – | Av: Gök tazısı düşürür %85 (ACT 2 · Yüzen Kayalar) | Fırtına tüyü başlık |
| Gök üzümü ² | 20 | – | Gök üzümü ağacından toplanır: Gök Rıhtımı (ACT 2) | Gök üzümü suyu |
| Gök üzümü kalası ² | 109 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Gök üzümü odunu ² | 38 | – | Balta ile Gök üzümü ağacından: Gök Rıhtımı (ACT 2) | Gök üzümü kalası, Kütük salı, Oyma kano |
| Gök üzümü suyu ² | 163 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Gölge dişi | 110 | – | Av: Gölge kurdu düşürür %60 (ACT 1 · Mor Kristal Vadisi) | Gölge dişi kolyesi, Ametist kılıcı |
| Gölge dişi kolyesi | 551 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gölge iksiri | 744 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gölge otu | 77 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Gölge iksiri |
| Gölge postu | 150 | – | Av: Gölge kurdu düşürür %80 (ACT 1 · Mor Kristal Vadisi) | – (satılır, görevlerde istenir) |
| Gölge pulu | 290 | – | Mağara canlısı Gölge semenderi düşürür (Ayna Mağarası, Mor Kristal Vadisi) %70 ×1 | Gölge pulu muska |
| Gölge pulu muska | 860 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Göl boncuğu | 76 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Göl çömleği | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Göl kasesi | 128 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Göl kerpici | 58 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Göl tuğlası, Kerpiç duvar |
| Göl kili | 14 | – | Yerden toplanır: Bataklık (ACT 1) | Islak göl kili |
| Göl tuğlası | 109 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Granit | 10 | – | Kazmayla kazılır: Orman (ACT 1) | Granit balta, Granit kazma, Granit kılıç, Granit mızrak, Granit savaş çekici, Granit topuz … (+3) |
| Granit balta | 552 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit kılıç | 1.213 | alet, silah 25 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit mızrak | 532 | alet, silah 22 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit savaş çekici | 1.300 | alet, silah 27 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit kazma | 789 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Granit topuz | 780 | alet, silah 21 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Gri vaşak postu | 150 | – | Mağara canlısı Mağara vaşağı düşürür (Rüzgâr Mağarası, Kayalık Dağ) %70 ×1 | – |
| Gübre | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gümüş cevheri | 32 | – | Kazmayla kazılır: Kayalık Dağ (ACT 1) | Gümüş çizme, Gümüş eldiven, Gümüş külçesi, Gümüş pullu zırh, Kartal tüyü miğfer |
| Gümüş çan | 440 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Gümüş çizme | 1.423 | giyilir +18 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Gümüş eldiven | 1.438 | giyilir +18 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Gümüş filizi | 52 | – | Mağarada yerden toplanır: Rüzgâr Mağarası (Kayalık Dağ, giriş Sv 26) · Mağara reisi Dağ Devi düşürür (Rüzgâr Mağarası, Kayalık Dağ) %100 ×3–5 | Gümüş çan |
| Gümüş kılıç | 2.576 | alet, silah 44 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Gümüş kum ² | 14 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Gümüş külçesi | 195 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ametist yüzük, Fırtına oltası, Gümüş kılıç, Gümüş yüzük, Huş yayı, Yıldız oltası |
| Gümüş pullu zırh | 3.945 | giyilir +52 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Gümüş yüzük | 313 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Güve tozu | 45 | – | Av: Mor güve düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Işıltılı boya |
| Hafif taş ² | 12 | – | Kazmayla kazılır: Yüzen Kayalar (ACT 2) | – |
| Halat | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ağ, Asma fener, Bola, Deniz oltası, Dokuma tezgâhı, Dolap … (+8) |
| Halı | 997 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Hamsi | 4 | – | Deniz avı: Kıyı Suları (Gemici Poyraz'ın teknesiyle, Sv 3+, Olta) %50 | Hamsi tava |
| Hamsi tava | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Hardal ezmesi | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hardal otu | 2 | – | Yerden toplanır: Çayır (ACT 1) | Ateş yağı, Hardal ezmesi, Kurutulmuş hardal otu |
| Hasat sepeti | 144 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hasır | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Gemi, Hasır yatak, Kulübe, Kurutma rafı, Sepet, Yelkenli sal |
| Hasırotu | 13 | – | Yerden toplanır: Bataklık (ACT 1) | Hasırotu meşalesi, Hasırotu yatak |
| Hasırotu meşalesi | 58 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hasırotu yatak | 287 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Hasır yatak | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Haşlanmış bıldırcın yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Haşlanmış keklik yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Haşlanmış ördek yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Haşlanmış turna kuşu yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Haşlanmış ur kekliği yumurtası | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Haşlanmış yaban kazı yumurtası | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Havuç | 13 | yenir +8 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | – |
| Havuç tohumu | 4 | – | Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Havuç) | – |
| Havyar | 59 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Hayvan yağı | 3 | – | Av: Geyik düşürür %30 (ACT 1 · Çayır) · Av: Yaban öküzü düşürür %60 (ACT 1 · Kayalık Dağ) · Av: Yaban domuzu düşürür %40 (ACT 1 · Orman) · Av: Mağara ayısı düşürür %60 (ACT 1 · Kayalık Dağ) · Av: Mantar geyiği düşürür %30 (ACT 2 · Dev Mantar Ormanı) · Av: Kor domuzu düşürür %40 (ACT 2 · Ejder Volkanı) · Av: Yıldız geyiği düşürür %30 (ACT 2 · Gök Rıhtımı) | Ateş çiçeği merhemi, Beyaz boya, Don yağı mumu, Gelincik boyası, Hasırotu meşalesi, Kara boya … (+13) |
| Hurda çizme ² | 1.597 | giyilir +15 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | Meka çizme |
| Hurda palmiyesi kalası ² | 67 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Hurda palmiyesi odunu ² | 22 | – | Balta ile Hurda palmiyesi ağacından: Hurda Çölü (ACT 2) | Hurda palmiyesi kalası, Kütük salı, Oyma kano |
| Hurda parçası ² | 10 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Hurda yığını ² | 10 | – | Kazmayla kazılır: Hurda Çölü (ACT 2) | – |
| Hurma ² | 10 | – | Hurma ağacından toplanır: Hurda Çölü (ACT 2) | Hurma ezmesi |
| Hurma ezmesi ² | 221 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Hurma kalası ² | 67 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Hurma odunu ² | 22 | – | Balta ile Hurma ağacından: Hurda Çölü (ACT 2) | Hurma kalası, Kütük salı, Oyma kano |
| Huş kabuğu | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Huş kabuğu kabı, Huş katranı |
| Huş kabuğu kabı | 76 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Huş kalası | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Huş kaşığı | 152 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Huş katranı | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Derin su oltası, Deri tulum |
| Huş kömürü | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çelik külçesi, Gümüş külçesi |
| Huş odunu | 22 | – | Balta ile Huş ağacından: Kayalık Dağ (ACT 1) | Huş kabuğu, Huş kalası, Huş kömürü, Huş yayı |
| Huş sapı | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çelik balta, Çelik kazma, Çelik kılıç, Çelik savaş çekici, Çelik topuz, Huş kaşığı … (+3) |
| Huş yayı | 767 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Ihlamur çayı | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ihlamur çiçeği | 2 | – | Ihlamur ağacı kesilince 2 tane düşer | Ihlamur çayı |
| Ihlamur kabuğu | 19 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ihlamur kalası | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Ihlamur kaşığı | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ihlamur kömürü | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ihlamur odunu | 8 | – | Balta ile Ihlamur ağacından: Orman (ACT 1) | Ihlamur kabuğu, Ihlamur kalası, Ihlamur kömürü, Ihlamur yayı |
| Ihlamur sapı | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Ihlamur yayı | 295 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Isırgan | 7 | – | Yerden toplanır: Orman (ACT 1) | Isırgan çorbası, Isırgan lifi, Kurutulmuş isırgan |
| Isırgan çorbası | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Isırgan lifi | 33 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Islak beyaz kil | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Beyaz boncuk, Beyaz çömlek, Beyaz kerpiç, Kil figürin |
| Islak göl kili | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Göl boncuğu, Göl çömleği, Göl kerpici |
| Islak kırmızı kil | 62 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kırmızı boncuk, Kırmızı çömlek, Kırmızı kerpiç |
| Islak nehir kili | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Nehir boncuğu, Nehir çömleği, Nehir kerpici, Pişmiş kil düdük, Yosun yalıtım |
| Işık ağacı kalası | 156 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Işık ağacı kömürü | 183 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Işık ağacı odunu | 56 | – | Balta ile Işık ağacı ağacından: Mor Kristal Vadisi (ACT 1) | Işık ağacı kalası, Işık ağacı kömürü, Işık ağacı yayı |
| Işık ağacı sapı | 216 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ametist kılıcı, Ametist savaş çekici, Ametist topuz |
| Işık ağacı yayı | 2.097 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Işık fitili | 216 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Işık mantarı | 90 | yenir +21 | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Ay otu iksiri, Işık mantarı çorbası |
| Işık mantarı çorbası | 537 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Işık pulu | 120 | – | Av: Işık engereği düşürür %80 (ACT 1 · Mor Kristal Vadisi) | Işık pulu eldiven, Kristal boynuz tılsımı, Kristal ipek çizme |
| Işık pulu eldiven | 3.953 | giyilir +18 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Işık sporu | 80 | – | Mağarada yerden toplanır: Ayna Mağarası (Mor Kristal Vadisi, giriş Sv 42) | Yıldız tozu yemi |
| Işık tilkisi eti | 35 | – | Av: Işık tilkisi düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş işık tilkisi eti, Pişmiş işık tilkisi eti, Turba ateşinde tütsü … (+1) |
| Işık tilkisi postu | 60 | – | Av: Işık tilkisi düşürür %80 (ACT 1 · Mor Kristal Vadisi) | – (satılır, görevlerde istenir) |
| Işık tozu | 80 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Işık fitili |
| Işık Yutan kalbi | 2.600 | – | Mağara reisi Işık Yutan düşürür (Ayna Mağarası, Mor Kristal Vadisi) %100 ×1 | Işık Yutan kalbi tılsımı |
| Işık Yutan kalbi tılsımı | 4.200 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Işıldak mantarı ² | 20 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Işıltılı boya | 182 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Işıl balığı | 225 | – | Deniz avı: Mor Derinlik (Gemici Poyraz'ın teknesiyle, Sv 22+, Yıldız oltası) %17 | Işıl çorbası |
| Işıl çorbası | 676 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Işın kılıcı ² | 6.447 | alet, silah 60 hasar | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ejder Avcısı Tomris yapar (800 sikke işçilik) | – |
| İnci kolye | 230 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| İp | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ağ, Akçaağaç kaşığı, Akrep kabuğu kalkanı, Akrep ok ucu, Altın kolye, Ana tanrıça heykelciği … (+163) |
| İri diken | 12 | – | Av: Oklu kirpi düşürür %100 (ACT 1 · Orman) | Diken ok ucu, Ceviz kabuğu miğfer |
| İskele | 588 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| İstavrit | 5 | – | Deniz avı: Kıyı Suları (Gemici Poyraz'ın teknesiyle, Sv 3+, Olta) %33 | İstavrit ızgara |
| İstavrit ızgara | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| İstiridye | 29 | – | Deniz avı: Mercan Sığlığı (Gemici Poyraz'ın teknesiyle, Sv 10+, Makaralı olta) %33 | İstiridye çorbası |
| İstiridye çorbası | 109 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kabak | 35 | yenir +10 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | – |
| Kabak tohumu | 8 | – | Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Kabak) | – |
| Kaba meşale | 7 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kadife balığı | 4 | – | Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %20; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %16; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş kadife balığı, Pişmiş kadife balığı, Taşta kadife balığı, Tütsülenmiş kadife balığı |
| Kafa lambası | 300 | giyilir +3 savunma | Yıldızsız Işıkçı ile takas: 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi (baş yuvasına takılır, gece kendiliğinden yanar) | – |
| Kaktüs meyvesi ² | 12 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Kalamar | 61 | – | Deniz avı: Fırtına Denizi (Gemici Poyraz'ın teknesiyle, Sv 18+, Fırtına oltası) %50 | Kalamar tava |
| Kalamar tava | 192 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kalay cevheri | 12 | – | Kazmayla kazılır: Orman (ACT 1) | Kalay külçesi |
| Kalay külçesi | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tunç külçesi |
| Kalkan | 54 | – | Deniz avı: Derin Mavi (Gemici Poyraz'ın teknesiyle, Sv 14+, Derin su oltası) %17 | Kalkan tava |
| Kalkan tava | 144 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kamış | 13 | – | Yerden toplanır: Bataklık (ACT 1) | Kamış çizme, Kamış flüt, Kamış hasır, Kamış ok gövdesi |
| Kamış çizme | 149 | giyilir +13 savunma | Tarif: Avcı Doğan ilk konuşmada yazar (Zümrüt'ün kazanında da öğrenilir) → El yapımı (Tab) | – |
| Kamış flüt | 53 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kamış hasır | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kamış kulübe çatısı |
| Kamış kulübe | 858 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur · Usta Sinan yapar (650 sikke) | – |
| Kamış kulübe çatısı | 522 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | Kamış kulübe, Kerpiç ev |
| Kamış ok gövdesi | 62 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kamp ateşi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kanat yelpazesi | 380 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kanlıca | 8 | – | Yerden toplanır: Orman (ACT 1) | Kızarmış kanlıca, Kurutulmuş kanlıca, Mantar çorbası |
| Karaca derisi | 6 | – | Av: Karaca düşürür %80 (ACT 1 · Orman) · Av: Buz karacası düşürür %80 (ACT 2 · Kristal Golem Ocağı) | – (satılır, görevlerde istenir) |
| Karaca eti | 7 | – | Av: Karaca düşürür %100 (ACT 1 · Orman) · Av: Buz karacası düşürür %100 (ACT 2 · Kristal Golem Ocağı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş karaca eti, Pişmiş karaca eti, Turba ateşinde tütsü … (+1) |
| Kara boya | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+2) |
| Kara cila | 157 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kara çam kalası | 112 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kara çam kömürü | 139 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kara çam odunu | 39 | – | Balta ile Kara çam ağacından: Kül Diyarı (ACT 1) | Kara çam kalası, Kara çam kömürü, Kütük salı, Oyma kano |
| Kara çam sapı | 159 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Kara çelik balta | 8.440 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kara çelik çizme | 2.828 | giyilir +21 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Kara çelik eldiven | 2.835 | giyilir +21 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Kara çelik kazma | 8.442 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kara çelik kılıç | 11.371 | alet, silah 58 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kara çelik külçesi | 2.122 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ejder baltası, Ejder kazması, Ejder kılıcı, Ejder savaş çekici, Ejder topuzu, Kara çelik balta … (+7) |
| Kara çelik mızrak | 5.574 | alet, silah 52 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kara çelik miğfer | 2.830 | giyilir +36 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Kara çelik ok | 1.630 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Kara çelik ok, Keskin Kara çelik ok, Zehirli Kara çelik ok |
| Kara çelik savaş çekici | 13.965 | alet, silah 67 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kara çelik topuz | 8.440 | alet, silah 49 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kara çelik zırh | 6.984 | giyilir +68 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | – |
| Kara pul | 400 | – | Av: Kara ejder düşürür %100 (ACT 1 · Kül Diyarı) | Ejder çizmesi, Ejder eldiveni, Ejder miğferi, Ejder zırhı |
| Kara tuz | 49 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kara tuzlu et |
| Kara tuzlu et | 107 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kardelen | 24 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kardelen merhemi |
| Kardelen merhemi | 137 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kartal eti | 15 | – | Av: Kartal düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kartal eti, Pişmiş kartal eti, Turba ateşinde tütsü … (+1) |
| Kartal pençesi | 22 | – | Av: Kartal düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Fırtına kartalı düşürür %50 (ACT 2 · Yüzen Kayalar) | Kartal pençesi kolyesi, Gümüş kılıç |
| Kartal pençesi kolyesi | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kartal tüyü | 14 | – | Av: Kartal düşürür %90 (ACT 1 · Kayalık Dağ) | Kartal tüyü miğfer |
| Kartal tüyü miğfer | 1.422 | giyilir +24 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | – |
| Kar likeni | 40 | – | Mağarada yerden toplanır: Rüzgâr Mağarası (Kayalık Dağ, giriş Sv 26) | Dev yüreği tılsımı |
| Kav | 98 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş, Kozalak ateşi, Turba ateşinde tütsü |
| Kavak kabuğu | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavak kalası | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kavak kaşığı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kavak kömürü | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kavak odunu | 3 | – | Balta ile Kavak ağacından: Çayır (ACT 1) | Kavak kabuğu, Kavak kalası, Kavak kömürü, Kütük salı, Oyma kano |
| Kavak sapı | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kavrulmuş fındık | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Ballı fındık |
| Kavrulmuş kestane | 162 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Ballı kestane |
| Kavrulmuş su kestanesi | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kavrulmuş yabani arpa | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kavrulmuş yabani buğday | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kavrulmuş yabani mercimek | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kavrulmuş yabani nohut | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kavrulmuş yabani yulaf | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kav mantarı | 21 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kav |
| Kaya çiçeği ² | 20 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Kaya patlatıcı | 236 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kaya yarasası kanadı | 104 | – | Mağara canlısı Kaya yarasası düşürür (Rüzgâr Mağarası, Kayalık Dağ) %80 ×1 | Kanat yelpazesi |
| Kayın kabuğu | 19 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kayın kalası | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kayın kaşığı | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kayın kömürü | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kayın mantarı | 32 | yenir +14 | Yerden toplanır: Kayalık Dağ (ACT 1) | Kızarmış kayın mantarı, Kurutulmuş kayın mantarı |
| Kayın odunu | 8 | – | Balta ile Kayın ağacından: Orman (ACT 1) | Kayın kabuğu, Kayın kalası, Kayın kömürü, Kütük salı, Oyma kano |
| Kayın sapı | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kefal | 13 | – | Deniz avı: Rüzgârlı Körfez (Gemici Poyraz'ın teknesiyle, Sv 6+, Deniz oltası) %50 | Kefal pilakisi |
| Kefal pilakisi | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kehribar | 40 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Altın kolye, Gümüş yüzük, Kehribar boncuk, Kül dişi muska |
| Kehribar boncuk | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kehribar kolye |
| Kehribar kolye | 151 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kekik | 21 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kekikli balık, Kurutulmuş kekik |
| Kekikli balık | 138 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kekik çayı | 239 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keklik eti | 3 | – | Av: Keklik düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş keklik eti, Pişmiş keklik eti, Turba ateşinde tütsü … (+1) |
| Keklik tüyü | 2 | – | Av: Keklik düşürür %85 (ACT 1 · Çayır) | Bakır ok, Tunç ok |
| Keklik yumurtası | 3 | – | Av: Keklik düşürür %30 (ACT 1 · Çayır) | Haşlanmış keklik yumurtası |
| Kemik | 2 | – | Av: Tavşan düşürür %30 (ACT 1 · Çayır) · Av: Geyik düşürür %50 (ACT 1 · Çayır) · Av: Karaca düşürür %50 (ACT 1 · Orman) · Av: Yaban öküzü düşürür %80 (ACT 1 · Kayalık Dağ) · Av: Yaban domuzu düşürür %50 (ACT 1 · Orman) · Av: Kurt düşürür %50 (ACT 1 · Çayır) · Av: Dikenli kirpi düşürür %30 (ACT 1 · Orman) · Av: Bataklık kurdu düşürür %50 (ACT 1 · Bataklık) · Av: Engerek düşürür %30 (ACT 1 · Orman) · Av: Oklu kirpi düşürür %40 (ACT 1 · Orman) · Av: Kunduz düşürür %30 (ACT 1 · Orman) · Av: Yaban atı düşürür %50 (ACT 1 · Çayır) · Av: Dağ keçisi düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Muflon düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Mağara ayısı düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Vaşak düşürür %50 (ACT 1 · Kayalık Dağ) · Av: Porsuk düşürür %30 (ACT 1 · Çayır) · Av: Mantar geyiği düşürür %50 (ACT 2 · Dev Mantar Ormanı) · Av: Pas kirpisi düşürür %30 (ACT 2 · Hurda Çölü) · Av: Buz karacası düşürür %50 (ACT 2 · Kristal Golem Ocağı) · Av: Kor domuzu düşürür %50 (ACT 2 · Ejder Volkanı) · Av: Yıldız geyiği düşürür %50 (ACT 2 · Gök Rıhtımı) | Bazalt kazıyıcı, Çakmaktaşı kazıyıcı, Diken iğnesi, Kemik çizme, Kemik eldiven, Kemik flüt … (+12) |
| Kemik çizme | 289 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik eldiven | 298 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik flüt | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik iğne | 9 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Beyaz boncuk (alet), Dağ keçisi postu giysi (alet), Geyik postu giysi (alet), Göl boncuğu (alet), Kamış flüt (alet), Karaca postu giysi (alet) … (+12) |
| Kemik ilikli çorba | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik kolye | 27 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik miğfer | 292 | giyilir +6 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik ok ucu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Kemik olta iğnesi | 10 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kemik yay | 129 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Kemik zıpkın | 57 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Kemik zırh | 623 | giyilir +11 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kenevir | 14 | – | Yerden toplanır: Bataklık (ACT 1) | Kenevir lifi |
| Kenevir halatı | 404 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Derin su oltası, Deri çanta, Fırtına oltası, İskele, Makaralı olta, Megalit |
| Kenevir lifi | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kenevir halatı, Kenevir torba |
| Kenevir torba | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kerevit | 4 | – | Av: Kerevit düşürür %100 (ACT 1 · Çayır) · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %18; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş kerevit, Pişmiş kerevit, Taşta kerevit, Tütsülenmiş kerevit |
| Kerpiç duvar | 234 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | Çömlek fırını, Kerpiç ev |
| Kerpiç ev | 1.007 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur · Usta Sinan yapar (950 sikke) | – |
| Kertenkele eti ² | 9 | – | Av: Kaya kertenkelesi düşürür %80 (ACT 2 · Yüzen Kayalar) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş kertenkele eti, Turba ateşinde tütsü |
| Kertenkele merhemi ² | 143 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Kertenkele pulu ² | 18 | – | Av: Kaya kertenkelesi düşürür %90 (ACT 2 · Yüzen Kayalar) | Kertenkele merhemi |
| Keskin Bakır ok | 9 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keskin Basit ok | 7 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keskin Çelik ok | 5.921 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keskin Demir ok | 917 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keskin Kara çelik ok | 19.683 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keskin Mızrak | 90 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Keskin Mor kristal ok | 5.211 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Keskin taş | 3 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bağlı uç, Basit ok, Kemik olta iğnesi, Kürek, Mızrak, Sivri taş … (+4) |
| Keskin Taş kılıç | 99 | alet, silah 12 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Keskin Taş savaş çekici | 91 | alet, silah 13 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Keskin Taş topuz | 81 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Keskin Tunç ok | 665 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kestane | 30 | yenir +15 | Meyve ağacı (Kestane): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Kestane ağacından toplanır: Kayalık Dağ (ACT 1) | Kavrulmuş kestane |
| Kestane kabuğu | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kestane kalası | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kestane kaşığı | 152 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kestane kömürü | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kestane odunu | 22 | – | Balta ile Kestane ağacından: Kayalık Dağ (ACT 1) | Kestane kabuğu, Kestane kalası, Kestane kömürü, Kütük salı, Oyma kano |
| Kestane sapı | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kestane tohumu | 3 | – | Kestane ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Keten | 14 | – | Yerden toplanır: Bataklık (ACT 1) | Keten lifi |
| Keten ipliği | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Halı, Keten kumaş, Kilim |
| Keten kumaş | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Duvar halısı, Halı, Perde |
| Keten lifi | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Keten ipliği |
| Kılıç balığı | 91 | – | Deniz avı: Fırtına Denizi (Gemici Poyraz'ın teknesiyle, Sv 18+, Fırtına oltası) %33 | Kılıç şiş |
| Kılıç şiş | 228 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kırmızı boncuk | 104 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kırmızı boya | 143 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ana tanrıça heykelciği, Av sahnesi duvar resmi, Boyalı çömlek, Dolap, Duvar halısı … (+3) |
| Kırmızı çömlek | 115 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahududu suyu, Alıç suyu, Ardıç meyvesi suyu, Ateş narı şerbeti, Ay elması reçeli, Bal şarabı … (+22) |
| Kırmızı kase | 166 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Deri davul, Kil lamba, Tuz havuzu |
| Kırmızı kerpiç | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kerpiç duvar, Kırmızı tuğla |
| Kırmızı kil | 22 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Islak kırmızı kil |
| Kırmızı okr | 35 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kırmızı okr tozu |
| Kırmızı okr tozu | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | El izi resmi, Kırmızı boya |
| Kırmızı tuğla | 150 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş fırın |
| Kıvılcım | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş, Kav, Kozalak ateşi, Turba ateşinde tütsü |
| Kıymık kolye | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızak | 41 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızarmış çayır mantarı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızarmış kanlıca | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızarmış kayın mantarı | 96 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızarmış kuzugöbeği | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızarmış mağara mantarı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızarmış tavuk mantarı | 35 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızarmış yabani havuç | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kızılağaç kabuğu | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılağaç kalası | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kızılağaç kaşığı | 118 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılağaç kömürü | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kızılağaç odunu | 14 | – | Balta ile Kızılağaç ağacından: Bataklık (ACT 1) | Kızılağaç kabuğu, Kızılağaç kalası, Kızılağaç kömürü, Kızılağaç yayı |
| Kızılağaç sapı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Kızılağaç yayı | 426 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Kızılcık | 18 | yenir +12 | Yerden toplanır: Bataklık (ACT 1) | Kızılcık ezmesi, Kızılcık suyu, Kurutulmuş kızılcık |
| Kızılcık ezmesi | 79 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılcık suyu | 230 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızılkanat | 4 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %13; balık kapanına da girer · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %17; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş kızılkanat, Pişmiş kızılkanat, Taşta kızılkanat, Tütsülenmiş kızılkanat |
| Kızıl cam | 199 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kızıl ejder pulu ² | 300 | – | Av: Kızıl ejder düşürür %100 (ACT 2 · Ejder Volkanı) | – |
| Kızıl kum | 43 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kızıl cam |
| Kızıl sedir kalası | 117 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kızıl sedir kömürü | 144 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Kızıl sedir odunu | 41 | – | Balta ile Kızıl sedir ağacından: Kül Diyarı (ACT 1) | Kızıl sedir kalası, Kızıl sedir kömürü, Kızıl sedir yayı |
| Kızıl sedir sapı | 165 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ejder savaş çekici, Ejder topuzu |
| Kızıl sedir yayı | 2.961 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | – |
| Kilim | 437 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Kil figürin | 55 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ana tanrıça heykelciği |
| Kil lamba | 129 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kireçtaşı | 2 | – | Kazmayla kazılır: Çayır (ACT 1) | Sönmemiş kireç |
| Kireç harcı | 59 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kirmen | 59 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Keten ipliği (alet) |
| Kirpi dikeni | 4 | – | Av: Dikenli kirpi düşürür %100 (ACT 1 · Orman) · Av: Oklu kirpi düşürür %80 (ACT 1 · Orman) · Av: Pas kirpisi düşürür %100 (ACT 2 · Hurda Çölü) | Diken iğnesi, Meşe kabuk eldiven, Meşe kabuk zırh |
| Kobalt cevheri ² | 44 | – | Kazmayla kazılır: Kristal Golem Ocağı (ACT 2) | Kobalt külçesi |
| Kobalt külçesi ² | 202 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Kristal miğfer, Meka zırh |
| Konak | 3.200 | – | Usta Sinan yapar (5.000 sikke) | – |
| Kor | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Balık tutkalı, Közlenmiş şiş, Oyma kano |
| Korkuluk | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kor kabuğu | 160 | – | Mağara canlısı Kor böceği düşürür (Kor Mağarası, Kül Diyarı) %80 ×1–2 · Mağara reisi Kor Kral düşürür (Kor Mağarası, Kül Diyarı) %100 ×3–5 | Kor zurnası |
| Kor kertenkelesi eti ² | 35 | – | Av: Kor kertenkelesi düşürür %100 (ACT 2 · Ejder Volkanı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş kor kertenkelesi eti, Turba ateşinde tütsü |
| Kor Kral tacı | 1.800 | – | Mağara reisi Kor Kral düşürür (Kor Mağarası, Kül Diyarı) %100 ×1 | Kor tacı tılsımı |
| Kor mantarı ² | 26 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Kor merhemi | 288 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kor otu | 47 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Kor merhemi |
| Kor pulu ² | 40 | – | Av: Kor kertenkelesi düşürür %80 (ACT 2 · Ejder Volkanı) | – |
| Kor tacı tılsımı | 2.800 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kor taşı | 60 | – | Mağarada yerden toplanır: Kor Mağarası (Kül Diyarı, giriş Sv 34) | Kor tacı tılsımı, Kor zurnası |
| Kor zurnası | 500 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kozalak ateşi | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kök ağacı kalası ² | 62 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Kök ağacı odunu ² | 20 | – | Balta ile Kök ağacı ağacından: Dev Mantar Ormanı (ACT 2) | Kök ağacı kalası, Kütük salı, Oyma kano |
| Kök böceği kabuğu | 28 | – | Mağara canlısı Kök böceği düşürür (Kök Mağarası, Orman) %80 ×1–2 | Böcek kabuğu boyası |
| Kök flütü | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kök mantarı | 20 | – | Mağarada yerden toplanır: Kök Mağarası (Orman, giriş Sv 10) | Kök mantarlı güveç, Kök özü iksiri |
| Kök mantarlı güveç | 160 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Kök özü iksiri | 680 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kök reçinesi | 24 | – | Mağarada yerden toplanır: Kök Mağarası (Orman, giriş Sv 10) · Mağara reisi Yaşlı Kök düşürür (Kök Mağarası, Orman) %100 ×3–5 | Kök flütü |
| Kök taşı ² | 12 | – | Kazmayla kazılır: Dev Mantar Ormanı (ACT 2) | – |
| Kök yılanı derisi | 32 | – | Mağara canlısı Kök yılanı düşürür (Kök Mağarası, Orman) %70 ×1 | Kök flütü |
| Kök yumrusu ² | 29 | yenir +5 | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Kömür ağacı kalası ² | 99 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kömür ağacı odunu ² | 34 | – | Balta ile Kömür ağacı ağacından: Ejder Volkanı (ACT 2) | Kömür ağacı kalası, Kütük salı, Oyma kano |
| Kör kertenkele eti | 18 | – | Mağara canlısı Kör kertenkele düşürür (Yankı Mağarası, Çayır) %100 ×1 | Yankı çorbası |
| Közlenmiş alabalık | 11 | – | Kamp ateşinde közlenir (çiğ hali: Alabalık) | – |
| Közlenmiş bıldırcın eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Bıldırcın eti) | – |
| Közlenmiş çapak | 7 | – | Kamp ateşinde közlenir (çiğ hali: Çapak) | – |
| Közlenmiş dağ keçisi eti | 22 | – | Kamp ateşinde közlenir (çiğ hali: Dağ keçisi eti) | – |
| Közlenmiş geyik eti | 16 | – | Kamp ateşinde közlenir (çiğ hali: Geyik eti) | – |
| Közlenmiş kadife balığı | 9 | – | Kamp ateşinde közlenir (çiğ hali: Kadife balığı) | – |
| Közlenmiş karaca eti | 15 | – | Kamp ateşinde közlenir (çiğ hali: Karaca eti) | – |
| Közlenmiş keklik eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Keklik eti) | – |
| Közlenmiş kerevit | 9 | – | Kamp ateşinde közlenir (çiğ hali: Kerevit) | – |
| Közlenmiş kızılkanat | 9 | – | Kamp ateşinde közlenir (çiğ hali: Kızılkanat) | – |
| Közlenmiş kunduz eti | 13 | – | Kamp ateşinde közlenir (çiğ hali: Kunduz eti) | – |
| Közlenmiş kurt eti | 13 | – | Kamp ateşinde közlenir (çiğ hali: Kurt eti) | – |
| Közlenmiş mağara ayısı eti | 35 | – | Kamp ateşinde közlenir (çiğ hali: Mağara ayısı eti) | – |
| Közlenmiş mersin balığı | 31 | – | Kamp ateşinde közlenir (çiğ hali: Mersin balığı) | – |
| Közlenmiş muflon eti | 22 | – | Kamp ateşinde közlenir (çiğ hali: Muflon eti) | – |
| Közlenmiş ördek eti | 12 | – | Kamp ateşinde közlenir (çiğ hali: Ördek eti) | – |
| Közlenmiş sazan | 9 | – | Kamp ateşinde közlenir (çiğ hali: Sazan) | – |
| Közlenmiş sincap eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Sincap eti) | – |
| Közlenmiş su samuru eti | 14 | – | Kamp ateşinde közlenir (çiğ hali: Su samuru eti) | – |
| Közlenmiş şiş | 108 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) · Kamp ateşinde közlenir (çiğ hali: şiş) | – |
| Közlenmiş tatlısu kefali | 9 | – | Kamp ateşinde közlenir (çiğ hali: Tatlısu kefali) | – |
| Közlenmiş tatlısu levreği | 11 | – | Kamp ateşinde közlenir (çiğ hali: Tatlısu levreği) | – |
| Közlenmiş tavşan eti | 7 | – | Kamp ateşinde közlenir (çiğ hali: Tavşan eti) | – |
| Közlenmiş timsah eti | 26 | – | Kamp ateşinde közlenir (çiğ hali: Timsah eti) | – |
| Közlenmiş turna balığı | 15 | – | Kamp ateşinde közlenir (çiğ hali: Turna balığı) | – |
| Közlenmiş turna kuşu eti | 14 | – | Kamp ateşinde közlenir (çiğ hali: Turna kuşu eti) | – |
| Közlenmiş yaban atı eti | 18 | – | Kamp ateşinde közlenir (çiğ hali: Yaban atı eti) | – |
| Közlenmiş yaban domuzu eti | 17 | – | Kamp ateşinde közlenir (çiğ hali: Yaban domuzu eti) | – |
| Közlenmiş yaban kazı eti | 14 | – | Kamp ateşinde közlenir (çiğ hali: Yaban kazı eti) | – |
| Közlenmiş yaban öküzü eti | 29 | – | Kamp ateşinde közlenir (çiğ hali: Yaban öküzü eti) | – |
| Közlenmiş yayın | 17 | – | Kamp ateşinde közlenir (çiğ hali: Yayın) | – |
| Kraliçe pençesi | 260 | – | Mağara reisi Yankı Kraliçesi düşürür (Yankı Mağarası, Çayır) %100 ×1 | Kraliçe tılsımı |
| Kraliçe tılsımı | 420 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal | 62 | – | Kazmayla kazılır: Mor Kristal Vadisi (ACT 1) · Av: Kristal golem düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Ametist kılıcı, Golem feneri, Işık pulu eldiven, Kristal parçası, Mor kristal çizme, Mor kristal eldiven … (+3) |
| Kristal armut ² | 14 | – | Kristal armut ağacından toplanır: Kristal Golem Ocağı (ACT 2) | Kristal armut kompostosu |
| Kristal armut kalası ² | 83 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Kristal armut kompostosu ² | 167 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | – |
| Kristal armut odunu ² | 28 | – | Balta ile Kristal armut ağacından: Kristal Golem Ocağı (ACT 2) | Kristal armut kalası, Kütük salı, Oyma kano |
| Kristal boynuz | 140 | – | Av: Kristal geyik düşürür %45 (ACT 1 · Mor Kristal Vadisi) | Kristal boynuz tılsımı |
| Kristal boynuz tılsımı | 356 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal cam | 292 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal cevheri ² | 34 | – | Kazmayla kazılır: Kristal Golem Ocağı (ACT 2) | – |
| Kristal çam kalası ² | 88 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Buz asası, Dolap … (+15) |
| Kristal çam odunu ² | 30 | – | Balta ile Kristal çam ağacından: Kristal Golem Ocağı (ACT 2) | Kristal çam kalası, Kütük salı, Oyma kano |
| Kristal çiçeği | 82 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Kristal çiçeği tacı |
| Kristal çiçeği tacı | 412 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal geyik derisi | 80 | – | Av: Kristal geyik düşürür %80 (ACT 1 · Mor Kristal Vadisi) | – (satılır, görevlerde istenir) |
| Kristal geyik eti | 53 | – | Av: Kristal geyik düşürür %100 (ACT 1 · Mor Kristal Vadisi) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kristal geyik eti, Pişmiş kristal geyik eti, Turba ateşinde tütsü … (+1) |
| Kristal ipek | 90 | – | Av: Kristal örümcek düşürür %90 (ACT 1 · Mor Kristal Vadisi) | Ametist miğfer, Gemi, Gölge dişi kolyesi, Kristal ipek çizme, Kristal ipek kumaş, Kristal ipek zırh |
| Kristal ipek çizme | 3.886 | giyilir +29 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Kristal ipek kumaş | 476 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yıldız oltası |
| Kristal ipek zırh | 9.704 | giyilir +72 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Kristal kanat ² | 230 | – | Av: Kristal yarasası düşürür %80 (ACT 2 · Kristal Golem Ocağı) | Kristal miğfer, Kristal zil |
| Kristal kolye | 360 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kristal kum | 67 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Kristal cam |
| Kristal lifi ² | 18 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | Işın kılıcı |
| Kristal mantarı ² | 24 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Kristal miğfer ² | 3.692 | giyilir +26 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Kristal parçası | 110 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Cilalı kristal |
| Kristal zil ² | 700 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Kulübe | 201 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur · Usta Sinan yapar (450 sikke) | – |
| Kulübe iskeleti | 131 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | Deri çadır, Kamış kulübe, Kulübe, Tütsühane |
| Kum | 1 | – | Yerden toplanır: Mor Kristal Vadisi, Orman, Çayır, Bataklık, Kayalık Dağ, Kül Diyarı (ACT 1) | Ana tanrıça heykelciği, Arı kovanı, Ateş tuğlası, Ateş yeri, Av sahnesi duvar resmi, Balık pulu … (+64) |
| Kumtaşı | 3 | – | Kazmayla kazılır: Çayır (ACT 1) | Bileği taşı, Bileme macunu, Öğütme taşı, Taş levha |
| Kum torbası | 240 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kunduz derisi | 5 | – | Av: Kunduz düşürür %75 (ACT 1 · Orman) · Av: Porsuk düşürür %75 (ACT 1 · Çayır) | – (satılır, görevlerde istenir) |
| Kunduz eti | 6 | – | Av: Kunduz düşürür %100 (ACT 1 · Orman) · Av: Porsuk düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kunduz eti, Pişmiş kunduz eti, Turba ateşinde tütsü … (+1) |
| Kurbağa | 2 | yenir +3, zehirli | Av: Zehirli kurbağa düşürür %60 (ACT 1 · Bataklık) | Balık çorbası, Balık sepeti, Kurutulmuş kurbağa, Pişmiş kurbağa, Taşta kurbağa, Tütsülenmiş kurbağa |
| Kurt derisi | 9 | – | Av: Kurt düşürür %75 (ACT 1 · Çayır) | – (satılır, görevlerde istenir) |
| Kurt dişi | 10 | – | Av: Kurt düşürür %50 (ACT 1 · Çayır) · Av: Bataklık kurdu düşürür %50 (ACT 1 · Bataklık) | Diş kolye |
| Kurt eti | 6 | zehirli | Av: Kurt düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş kurt eti, Pişmiş kurt eti, Turba ateşinde tütsü … (+1) |
| Kurutma rafı | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Kurutulmuş adaçayı | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Adaçayı çayı |
| Kurutulmuş ahududu | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş alabalık | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş alıç | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş ardıç meyvesi | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş ateş narı | 259 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş ay elması | 378 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş bıldırcın eti | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş böğürtlen | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş civanperçemi | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Civanperçemi çayı |
| Kurutulmuş çapak | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş çayır mantarı | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş dağ keçisi eti | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş ebegümeci | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş gelincik | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Gelincik çayı |
| Kurutulmuş geyik eti | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş hardal otu | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş isırgan | 50 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş işık tilkisi eti | 189 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kadife balığı | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kanlıca | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş karaca eti | 97 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kartal eti | 138 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kayın mantarı | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kekik | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kekik çayı |
| Kurutulmuş keklik eti | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kerevit | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kızılcık | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş kızılkanat | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kristal geyik eti | 212 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kunduz eti | 101 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kurbağa | 80 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kurt eti | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş kuşburnu | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kuşburnu çayı, Meyveli pemmikan |
| Kurutulmuş kuzugöbeği | 22 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş kuzukulağı | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş lavanta | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Lavanta çayı |
| Kurutulmuş mağara ayısı eti | 133 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş mağara mantarı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş mersin balığı | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş meyve keki | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş muflon eti | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş mürver | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş nane | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Nane çayı |
| Kurutulmuş ördek eti | 109 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş papatya | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Papatya çayı |
| Kurutulmuş rezene | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Rezene çayı |
| Kurutulmuş sazan | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş sincap eti | 92 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş sinirotu | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sinirotu çayı |
| Kurutulmuş su samuru eti | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş su teresi | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tatlısu kefali | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tatlısu levreği | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tatlısu midyesi | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş tavşan eti | 82 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş tavuk mantarı | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş turna balığı | 97 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş turna kuşu eti | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş ur kekliği eti | 131 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş vaşak eti | 142 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yabani armut | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yabani elma | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yabani erik | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yabani havuç | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yaban atı eti | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban çileği | 11 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yaban domuzu eti | 98 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban kazı eti | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban mersini | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kurutulmuş yaban öküzü eti | 129 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Pemmikan |
| Kurutulmuş yaban sarımsağı | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yayın | 98 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yılan balığı | 97 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kurutulmuş yıldız eriği | 378 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Meyveli pemmikan |
| Kuru çınar kalası ² | 73 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Kuru çınar odunu ² | 24 | – | Balta ile Kuru çınar ağacından: Hurda Çölü (ACT 2) | Kuru çınar kalası, Kütük salı, Oyma kano |
| Kuru ot | 1 | – | Yerden toplanır: Çayır (ACT 1) | Ahşap karyola, Beyaz kerpiç, Duman tütsüsü, Eğrelti yatağı, Erzak çukuru, Göl kerpici … (+44) |
| Kuşburnu | 30 | yenir +14 | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş kuşburnu, Kuşburnu ezmesi, Kuşburnu suyu |
| Kuşburnu çayı | 239 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kuşburnu ezmesi | 128 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kuşburnu suyu | 339 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kuvars | 29 | – | Kazmayla kazılır: Kayalık Dağ (ACT 1) | Yontulmuş kuvars, Gümüş kılıç |
| Kuvars balta | 1.425 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars bıçak | 341 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars kazıyıcı | 216 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars kazma | 1.782 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars mızrak | 1.385 | alet, silah 18 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars ok ucu | 1.903 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Kuvars pulu | 144 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kuvars bıçak, Kuvars kazıyıcı, Kuvars ok ucu |
| Kuvars savaş çekici | 2.333 | alet, silah 59 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuvars sivri ucu | 948 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kuvars kazma, Kuvars mızrak |
| Kuvars topuz | 1.459 | alet, silah 44 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Kuzugöbeği | 12 | yenir +8, zehirli | Yerden toplanır: Orman (ACT 1) | Kızarmış kuzugöbeği, Kurutulmuş kuzugöbeği |
| Kuzukulağı | 8 | yenir +7, zehirli | Yerden toplanır: Orman (ACT 1) | Kurutulmuş kuzukulağı, Ot salatası |
| Kükürt | 46 | – | Kazmayla kazılır: Kül Diyarı (ACT 1) | Kara çelik külçesi, Kükürtlü merhem, Kükürt çakmağı |
| Kükürtlü merhem | 207 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kükürt çakmağı | 156 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ateş, Kozalak ateşi, Turba ateşinde tütsü |
| Kükürt kristali | 66 | – | Mağarada yerden toplanır: Kor Mağarası (Kül Diyarı, giriş Sv 34) | Duman fişeği, Kükürt sarısı boya |
| Kükürt sarısı boya | 210 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kükürt tozu ² | 18 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Kül | 33 | – | Yerden toplanır: Kül Diyarı (ACT 1) · Av: Kül cini düşürür %100 (ACT 1 · Kül Diyarı) · Av: Kül böceği düşürür %100 (ACT 1 · Kül Diyarı) | Ateş çiçeği merhemi, Cüruf tuğlası, Kül ekmeği |
| Kül ağacı kalası | 112 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Kül ağacı kömürü | 139 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kara çelik külçesi |
| Kül ağacı odunu | 39 | – | Balta ile Kül ağacı ağacından: Kül Diyarı (ACT 1) | Ejder yayı, Kül ağacı kalası, Kül ağacı kömürü |
| Kül ağacı sapı | 159 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Ejder baltası, Ejder kazması, Kara çelik balta, Kara çelik kazma, Kara çelik kılıç … (+4) |
| Kül böceği kabuğu | 30 | – | Av: Kül böceği düşürür %90 (ACT 1 · Kül Diyarı) | Kara cila |
| Kül dişi | 80 | – | Av: Kül kurdu düşürür %50 (ACT 1 · Kül Diyarı) | Kül dişi muska |
| Kül dişi muska | 310 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kül ekmeği | 158 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kül kurdu postu | 120 | – | Av: Kül kurdu düşürür %80 (ACT 1 · Kül Diyarı) | Ejder çizmesi |
| Kül mantarı | 54 | – | Mağarada yerden toplanır: Kor Mağarası (Kül Diyarı, giriş Sv 34) | Duman fişeği |
| Kürek | 41 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Kürk başlık | 277 | giyilir +4 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kürk eldiven | 270 | giyilir +3 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kürk yelek | 47 | giyilir +8 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Kütük salı | 73 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ladin kalası | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Ladin kaşığı | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Ladin kömürü | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Ladin odunu | 8 | – | Balta ile Ladin ağacından: Orman (ACT 1) · kesilince 1 Ladin reçinesi de düşer | Kütük salı, Ladin kalası, Ladin kömürü, Oyma kano |
| Ladin reçinesi | 27 | – | Ağaç: Ladin kesilince her odunla 1 tane (Orman) | Kara cila, Meşale |
| Ladin sapı | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Lavanta | 22 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş lavanta, Lavanta yağı |
| Lavanta çayı | 196 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Lavanta yağı | 125 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Lav camı | 52 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Lav camı ok ucu |
| Lav camı ok ucu | 147 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Lav çiçeği ² | 30 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Lav palmiyesi kalası ² | 99 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Lav palmiyesi odunu ² | 34 | – | Balta ile Lav palmiyesi ağacından: Ejder Volkanı (ACT 2) | Kütük salı, Lav palmiyesi kalası, Oyma kano |
| Lav pulu | 110 | – | Av: Lav kertenkelesi düşürür %80 (ACT 1 · Kül Diyarı) | Ejder eldiveni |
| Lav yılanı pulu | 178 | – | Mağara canlısı Lav yılanı düşürür (Kor Mağarası, Kül Diyarı) %70 ×1 | Volkan camı muska |
| Lens ² | 60 | – | Av: Lazer dronu düşürür %60 (ACT 2 · Hurda Çölü) | – |
| Levrek | 20 | – | Deniz avı: Rüzgârlı Körfez (Gemici Poyraz'ın teknesiyle, Sv 6+, Deniz oltası) %17 | Levrek şiş |
| Levrek şiş | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Lif | 1 | – | Yerden toplanır: Çayır, Orman, Kül Diyarı, Bataklık, Mor Kristal Vadisi, Kayalık Dağ (ACT 1) | Ağ, Akçaağaç kalası, Akçaağaç kaşığı, Akçaağaç kömürü, Akçaağaç sapı, Ardıç kalası … (+165) |
| Liken | 22 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Liken boyası |
| Liken boyası | 92 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Lüfer | 32 | – | Deniz avı: Mercan Sığlığı (Gemici Poyraz'ın teknesiyle, Sv 10+, Makaralı olta) %17 | Lüfer ızgara |
| Lüfer ızgara | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Magma camı ² | 44 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Magma cevheri ² | 56 | – | Kazmayla kazılır: Ejder Volkanı (ACT 2) · Av: Lav golemi düşürür %90 (ACT 2 · Ejder Volkanı) | – |
| Magma çekirdeği ² | 160 | – | Av: Lav golemi düşürür %70 (ACT 2 · Ejder Volkanı) | – |
| Magma kabuğu ² | 50 | – | Av: Lav salyangozu düşürür %90 (ACT 2 · Ejder Volkanı) | – |
| Mağara ayısı derisi | 24 | – | Av: Mağara ayısı düşürür %90 (ACT 1 · Kayalık Dağ) | – (satılır, görevlerde istenir) |
| Mağara ayısı eti | 17 | – | Av: Mağara ayısı düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş mağara ayısı eti, Pişmiş mağara ayısı eti, Turba ateşinde tütsü … (+1) |
| Mağara kurdu eti | 32 | – | Mağara canlısı Mağara kurdu düşürür (Kök Mağarası, Orman) %100 ×1 | Kök mantarlı güveç |
| Mağara kurdu postu | 40 | – | Mağara canlısı Mağara kurdu düşürür (Kök Mağarası, Orman) %60 ×1 | – |
| Mağara mantarı | 4 | yenir +3, zehirli | Yerden toplanır: Orman, Çayır, Bataklık, Kayalık Dağ, Kül Diyarı, Mor Kristal Vadisi (ACT 1) | Kızarmış mağara mantarı, Kurutulmuş mağara mantarı |
| Mağara resmi | 78 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Av sahnesi duvar resmi |
| Makaralı olta | 896 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Derin su oltası |
| Mana iksiri ² | 306 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Büyücü Efsun yapar (10 sikke işçilik) | – |
| Mantar çorbası | 141 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mantar lifi eldiven ² | 1.486 | giyilir +14 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | Ejder pulu eldiven |
| Mantar şapkası ² | 33 | yenir +3 | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Masa | 139 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Mavi mantar kalası ² | 67 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Ateş asası, Atölye, Dolap … (+15) |
| Mavi mantar odunu ² | 22 | – | Balta ile Mavi mantar ağacından: Dev Mantar Ormanı (ACT 2) | Kütük salı, Mavi mantar kalası, Oyma kano |
| Mavi sedir kalası ² | 93 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Mavi sedir odunu ² | 32 | – | Balta ile Mavi sedir ağacından: Kristal Golem Ocağı (ACT 2) | Kütük salı, Mavi sedir kalası, Oyma kano |
| Mavi yosun ² | 14 | – | Yerden toplanır: Kristal Golem Ocağı (ACT 2) | – |
| Medüz jölesi ² | 40 | – | Av: Gök medüzü düşürür %90 (ACT 2 · Gök Rıhtımı) | – |
| Megalit | 560 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | Taş çember |
| Meka çizme ² | 4.324 | giyilir +18 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Meka zırh ² | 5.364 | giyilir +90 savunma | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Mühendis Işın yapar (600 sikke işçilik) | – |
| Mersin balığı | 16 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %3; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %25; balık kapanına da girer | Balık çorbası, Balık sepeti, Balık tutkalı, Havyar, Kurutulmuş mersin balığı, Pişmiş mersin balığı … (+2) |
| Meşale | 61 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Meşe kabuğu | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meşe kabuk çizme | 905 | giyilir +8 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Meşe kabuk eldiven | 915 | giyilir +8 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Meşe kabuk zırh | 2.509 | giyilir +30 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Meşe kalası | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+17) |
| Meşe kaşığı | 102 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meşe kömürü | 56 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Meşe odunu | 9 | – | Balta ile Meşe ağacından: Orman (ACT 1) | Ceviz kabuğu miğfer, Meşe kabuğu, Meşe kabuk çizme, Meşe kabuk eldiven, Meşe kabuk zırh, Meşe kalası … (+2) |
| Meşe palamudu | 1 | yenir +6, zehirli | Meşe ağacı kesilince 1 tane düşer | Palamut unu |
| Meşe sapı | 51 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çit, Granit balta, Granit kazma, Granit kılıç, Granit savaş çekici, Granit topuz … (+6) |
| Meşe yayı | 304 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Meteor demiri ² | 70 | – | Kazmayla kazılır: Gök Rıhtımı (ACT 2) | Meteor demiri külçesi |
| Meteor demiri külçesi ² | 408 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Roket gövdesi |
| Meteor parçası ² | 50 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Meyveli pemmikan | 210 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meyve fidanı | 18 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Meyve karışımı | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mızrak | 39 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Alevli Mızrak, Keskin Mızrak, Zehirli Mızrak |
| Midye kabuğu kaşık | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mor çekirdek ² | 360 | – | Av: Uzaylı dronu düşürür %40 (ACT 2 · Gök Rıhtımı) · Av: Gölge muhafız düşürür %50 (ACT 2 · Gök Rıhtımı) | – |
| Mor damar boyası | 300 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mor damar taşı | 86 | – | Mağarada yerden toplanır: Ayna Mağarası (Mor Kristal Vadisi, giriş Sv 42) · Mağara reisi Işık Yutan düşürür (Ayna Mağarası, Mor Kristal Vadisi) %100 ×3–5 | Işık Yutan kalbi tılsımı, Mor damar boyası |
| Mor ip | 266 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mor kıymık | 30 | – | Gece balık tutarken %5 ihtimalle oltaya takılır · Yalnız gece, karanlıkta karada beliren mor parıltı (Çayır/Orman); F ile toplanır | Ay ışığı iksiri, Kıymık kolye |
| Mor kök | 70 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Mor kök boyası |
| Mor kök boyası | 188 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Mor kristal balta | 6.070 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal çizme | 3.538 | giyilir +26 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal eldiven | 3.547 | giyilir +26 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal kazma | 6.073 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal kılıç | 8.242 | alet, silah 72 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal levhası | 998 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Gece ağacı yayı, Mor kristal balta, Mor kristal kazma, Mor kristal kılıç, Mor kristal mızrak, Mor kristal ok … (+2) |
| Mor kristal mızrak | 3.985 | alet, silah 64 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal miğfer | 3.540 | giyilir +45 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal ok | 546 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Mor kristal ok, Keskin Mor kristal ok, Zehirli Mor kristal ok |
| Mor kristal savaş çekici | 9.993 | alet, silah 83 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal topuz | 6.070 | alet, silah 61 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Mor kristal zırh | 8.737 | giyilir +84 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | – |
| Mor pusula | 250 | – | Eski Sisli Ada sonunun ödülü (kodda duruyor; güncel akışta ulaşılıp ulaşılmadığı test raporuna bakın) | – |
| Mor sarmaşık | 67 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Kristal çiçeği tacı, Mor ip, Yıldız çelengi |
| Mor söğüt kalası | 151 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Mor söğüt kömürü | 178 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Mor söğüt odunu | 54 | – | Balta ile Mor söğüt ağacından: Mor Kristal Vadisi (ACT 1) | Kütük salı, Mor söğüt kalası, Mor söğüt kömürü, Oyma kano |
| Mor söğüt sapı | 209 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Mor kristal balta, Mor kristal kazma, Mor kristal kılıç, Mor kristal savaş çekici, Mor kristal topuz, Obsidyen balta … (+1) |
| Mor yosun | 64 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Mor yosun yastığı |
| Mor yosun yastığı | 342 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Mor zehir | 130 | – | Av: Işık engereği düşürür %70 (ACT 1 · Mor Kristal Vadisi) | – |
| Motor ² | 180 | – | Av: Hurda devi düşürür %80 (ACT 2 · Hurda Çölü) | Meka zırh, Pompalı |
| Muflon derisi | 7 | – | Av: Muflon düşürür %80 (ACT 1 · Kayalık Dağ) | – (satılır, görevlerde istenir) |
| Muflon eti | 10 | – | Av: Muflon düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş muflon eti, Pişmiş muflon eti, Turba ateşinde tütsü … (+1) |
| Muhafız zırhı parçası ² | 220 | – | Av: Gölge muhafız düşürür %80 (ACT 2 · Gök Rıhtımı) | Meka çizme |
| Mürver | 18 | yenir +11, zehirli | Meyve ağacı (Mürver): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Mürver ağacından toplanır: Bataklık (ACT 1) | Kurutulmuş mürver, Mürver boyası, Mürver ezmesi, Mürver suyu |
| Mürver boyası | 63 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Mürver ezmesi | 79 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Mürver odunu | 14 | – | Balta ile Mürver ağacından: Bataklık (ACT 1) | – |
| Mürver suyu | 230 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
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
| Nilüfer | 14 | – | Yerden toplanır: Bataklık (ACT 1) | Nilüfer çorbası, Nilüfer kökü unu |
| Nilüfer çorbası | 207 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Nilüfer kökü unu | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği |
| Obsidyen | 49 | – | Kazmayla kazılır: Kül Diyarı (ACT 1) | Ametist kılıcı, Ametist savaş çekici, Ametist topuz, Kara çelik çizme, Kara çelik eldiven, Kara çelik külçesi … (+3) |
| Obsidyen balta | 5.671 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen bıçak | 366 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen dikeni kalası ² | 109 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Obsidyen dikeni odunu ² | 38 | – | Balta ile Obsidyen dikeni ağacından: Ejder Volkanı (ACT 2) | Kütük salı, Obsidyen dikeni kalası, Oyma kano |
| Obsidyen kazıyıcı | 215 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen kazma | 5.987 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen kırığı ² | 30 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Obsidyen mızrak | 4.135 | alet, silah 28 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | – |
| Obsidyen ok ucu | 2.058 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ok |
| Obsidyen pulu | 141 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Obsidyen bıçak, Obsidyen kazıyıcı, Obsidyen ok ucu |
| Obsidyen sivri ucu | 1.144 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Obsidyen kazma, Obsidyen mızrak |
| Ok kılıfı | 240 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Olta | 69 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Deniz oltası |
| Orkinos | 124 | – | Deniz avı: Fırtına Denizi (Gemici Poyraz'ın teknesiyle, Sv 18+, Fırtına oltası) %17 | Orkinos biftek |
| Orkinos biftek | 266 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Ot salatası | 93 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Oyma kano | 97 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Öğütme taşı | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | Ceviz yağı (alet), Nilüfer kökü unu (alet), Palamut unu (alet), Yabani arpa unu (alet), Yabani buğday unu (alet), Yabani mercimek unu (alet) … (+2) |
| Öküz boynuzu | 16 | – | Av: Yaban öküzü düşürür %50 (ACT 1 · Kayalık Dağ) | Boynuz borazan, Boynuz kupa, Kartal tüyü miğfer |
| Ördek eti | 5 | – | Av: Ördek düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş ördek eti, Pişmiş ördek eti, Turba ateşinde tütsü … (+1) |
| Ördek tüyü | 2 | – | Av: Ördek düşürür %85 (ACT 1 · Bataklık) | Demir ok |
| Ördek yumurtası | 3 | – | Av: Ördek düşürür %35 (ACT 1 · Bataklık) | Haşlanmış ördek yumurtası |
| Örümcek gözü | 100 | – | Av: Kristal örümcek düşürür %50 (ACT 1 · Mor Kristal Vadisi) | Gölge iksiri |
| Palamut | 45 | – | Deniz avı: Derin Mavi (Gemici Poyraz'ın teknesiyle, Sv 14+, Derin su oltası) %50 | Palamut buğulama |
| Palamut buğulama | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Palamut ekmeği | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Palamut unu | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Palamut ekmeği |
| Panzehir | 148 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Papatya | 1 | – | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş papatya, Papatya tacı, Saksı |
| Papatya çayı | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Papatya tacı | 8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Parıltı yosunu | 36 | – | Mağarada yerden toplanır: Batık Mağara (Bataklık, giriş Sv 18) | Yosun yeşili boya |
| Pas ağacı kalası ² | 73 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Pas ağacı odunu ² | 24 | – | Balta ile Pas ağacı ağacından: Hurda Çölü (ACT 2) | Kütük salı, Oyma kano, Pas ağacı kalası |
| Pas tozu ² | 8 | – | Yerden toplanır: Hurda Çölü (ACT 2) · Av: Pas böceği düşürür %100 (ACT 2 · Hurda Çölü) | – |
| Patates | 16 | yenir +5 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | – |
| Patates tohumu | 5 | – | Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Patates) | – |
| Pemmikan | 137 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Meyveli pemmikan |
| Pençe kolye | 63 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Perde | 429 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Pil ² | 50 | – | Av: Lazer dronu düşürür %70 (ACT 2 · Hurda Çölü) | Enerji hücresi |
| Pirinç cevheri ² | 24 | – | Kazmayla kazılır: Hurda Çölü (ACT 2) | Pirinç külçesi |
| Pirinç külçesi ² | 111 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Pompalı fişeği, Tabanca mermisi |
| Pirit | 28 | – | Kazmayla kazılır: Kayalık Dağ (ACT 1) | Kükürt çakmağı, Pirit çakmağı |
| Pirit çakmağı | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | Ateş, Kozalak ateşi, Turba ateşinde tütsü |
| Pişirme taşı | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | Kızarmış çayır mantarı (alet), Kızarmış kanlıca (alet), Kızarmış kayın mantarı (alet), Kızarmış kuzugöbeği (alet), Kızarmış mağara mantarı (alet), Kızarmış tavuk mantarı (alet) … (+20) |
| Pişmiş alabalık | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş bıldırcın eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş bulut koyunu eti ² | 99 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş buz tavşanı eti ² | 127 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş çapak | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş dağ keçisi eti | 62 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş geyik eti | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş işık tilkisi eti | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kadife balığı | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş karaca eti | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kartal eti | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş keklik eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kerevit | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş kertenkele eti ² | 56 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kızılkanat | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş kil düdük | 37 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Pişmiş kor kertenkelesi eti ² | 143 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kristal geyik eti | 137 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kunduz eti | 53 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş kurbağa | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş kurt eti | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş mağara ayısı eti | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş mersin balığı | 66 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş muflon eti | 62 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş ördek eti | 56 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş rüzgâr kuşu eti ² | 93 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş sazan | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş sincap eti | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş su samuru eti | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş tatlısu kefali | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş tatlısu levreği | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş tatlısu midyesi | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş tavşan eti | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş timsah eti | 55 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Pişmiş turna balığı | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş turna kuşu eti | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş ur kekliği eti | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş vaşak eti | 78 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş yaban atı eti | 46 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş yaban domuzu eti | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş yaban kazı eti | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş yaban öküzü eti | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Pişmiş yayın | 49 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş yılan balığı | 48 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | Kekikli balık |
| Pişmiş yıldız tilkisi eti ² | 159 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | Sarımsaklı et |
| Plazma hücresi ² | 539 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Işın kılıcı, Roket motoru, Yıldız külçesi |
| Plazma taşı ² | 60 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | Plazma hücresi, Yıldırım asası |
| Pompalı ² | 2.600 | alet | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Silahçı Tufan yapar (400 sikke işçilik) | – |
| Pompalı fişeği ² | 126 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Porsuk kabuğu | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Porsuk kalası | 40 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Porsuk kaşığı | 120 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Porsuk kömürü | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Porsuk odunu | 23 | – | Balta ile Porsuk ağacından: Kayalık Dağ (ACT 1) | Kütük salı, Oyma kano, Porsuk kabuğu, Porsuk kalası, Porsuk kömürü |
| Porsuk sapı | 65 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+23) |
| Porsuk yayı | 130 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | – |
| Raf | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Rezene | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş rezene |
| Rezene çayı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Robot çekirdeği ² | 90 | – | Av: Devriye robotu düşürür %70 (ACT 2 · Hurda Çölü) | – |
| Roket ² | 30.243 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Astronot Gökay yapar (2000 sikke işçilik) | – |
| Roket gövdesi ² | 9.187 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Astronot Gökay yapar (1000 sikke işçilik) | Roket |
| Roket motoru ² | 14.000 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Astronot Gökay yapar (1500 sikke işçilik) | Roket |
| Rüzgâr çiçeği ² | 16 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Rüzgâr kristali ² | 40 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Rüzgâr kuşu eti ² | 15 | – | Av: Rüzgâr kuşu düşürür %80 (ACT 2 · Yüzen Kayalar) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş rüzgâr kuşu eti, Turba ateşinde tütsü |
| Rüzgâr meşesi kalası ² | 57 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Rüzgâr meşesi odunu ² | 18 | – | Balta ile Rüzgâr meşesi ağacından: Yüzen Kayalar (ACT 2) | Kütük salı, Oyma kano, Rüzgâr meşesi kalası |
| Rüzgâr taşı | 42 | – | Mağarada yerden toplanır: Rüzgâr Mağarası (Kayalık Dağ, giriş Sv 26) | Ağ kapanı |
| Rüzgâr tüyü ² | 12 | – | Av: Rüzgâr kuşu düşürür %100 (ACT 2 · Yüzen Kayalar) | – |
| Saksı | 72 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Sal | 92 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yelkenli sal |
| Salyangoz sümüğü ² | 16 | – | Av: Spor salyangozu düşürür %90 (ACT 2 · Dev Mantar Ormanı) | – |
| Sandalye | 86 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Sandal küreği | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yelkenli sal |
| Sandık | 135 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Sapan | 293 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Sarımsaklı et | 101 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sarı boya | 143 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Sarı okr | 35 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Sarı okr tozu |
| Sarı okr tozu | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Sarı boya |
| Sarkıt | 6 | – | Yerden toplanır: Çayır, Bataklık, Mor Kristal Vadisi, Kül Diyarı, Kayalık Dağ, Orman (ACT 1) | Sarkıt parçası |
| Sarkıt parçası | 31 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sarmaşık | 7 | – | Yerden toplanır: Orman (ACT 1) | Sarmaşık ipi |
| Sarmaşık ipi | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çit |
| Saz | 13 | – | Yerden toplanır: Bataklık (ACT 1) | Saz örgüsü |
| Sazan | 4 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %24; balık kapanına da girer · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %12; balık kapanına da girer · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %8; balık kapanına da girer | Balık çorbası, Balık pulu, Balık sepeti, Kurutulmuş sazan, Pişmiş sazan, Taşta sazan … (+1) |
| Sazlı inci | 48 | – | Mağarada yerden toplanır: Batık Mağara (Bataklık, giriş Sv 18) | Çamur Ana muskası, İnci kolye |
| Saz örgüsü | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Saz sepet |
| Saz sepet | 194 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Semender derisi | 86 | – | Mağara canlısı Batak semenderi düşürür (Batık Mağara, Bataklık) %70 ×1 | Çamur Ana muskası, Semender derisi tef |
| Semender derisi tef | 270 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sepet | 51 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Balık kapanı |
| Sıcak su | 34 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Adaçayı çayı, Avcı yahnisi, Balık çorbası, Balmumu, Bataklık otu çayı, Buhar … (+26) |
| Sincap derisi | 2 | – | Av: Sincap düşürür %60 (ACT 1 · Orman) | – (satılır, görevlerde istenir) |
| Sincap eti | 2 | – | Av: Sincap düşürür %100 (ACT 1 · Orman) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş sincap eti, Pişmiş sincap eti, Turba ateşinde tütsü … (+1) |
| Sinek mantarı | 20 | yenir +11, zehirli | Yerden toplanır: Bataklık (ACT 1) | Zehir yağı |
| Sinir | 3 | – | Av: Tavşan düşürür %15 (ACT 1 · Çayır) · Av: Geyik düşürür %50 (ACT 1 · Çayır) · Av: Karaca düşürür %40 (ACT 1 · Orman) · Av: Yaban öküzü düşürür %60 (ACT 1 · Kayalık Dağ) · Av: Kurt düşürür %40 (ACT 1 · Çayır) · Av: Yaban atı düşürür %50 (ACT 1 · Çayır) · Av: Muflon düşürür %40 (ACT 1 · Kayalık Dağ) · Av: Mantar geyiği düşürür %50 (ACT 2 · Dev Mantar Ormanı) · Av: Buz karacası düşürür %40 (ACT 2 · Kristal Golem Ocağı) · Av: Yıldız geyiği düşürür %50 (ACT 2 · Gök Rıhtımı) | Bakır miğfer, Bakır zırh, Çelik miğfer, Çelik zırh, Demir zırh, Deri çarık … (+16) |
| Sinirotu | 21 | – | Yerden toplanır: Kayalık Dağ (ACT 1) | Kurutulmuş sinirotu |
| Sinirotu çayı | 239 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sinir kirişi | 16 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Akçaağaç yayı, Bakır savaş çekici, Çakmaktaşı savaş çekici, Çam yayı, Çelik savaş çekici, Demir balta … (+22) |
| Sivri taş | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş bıçak, Taş kazma |
| Siyah balçık | 30 | – | Mağarada yerden toplanır: Batık Mağara (Bataklık, giriş Sv 18) | Sülük yemi |
| Soğan | 13 | yenir +3 | Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç) | – |
| Soğan tohumu | 4 | – | Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar · Hasatta %45 ihtimalle 1 tane (Soğan) | – |
| Sopa | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Atölye, Duvar halısı, Et şişi, Hasır yatak, Kirmen, Korkuluk … (+17) |
| Söğüt dalı | 1 | – | Söğüt ağacı kesilince 2 tane düşer | Hasat sepeti, Söğüt sepeti |
| Söğüt kabuğu | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Söğüt kabuğu çayı |
| Söğüt kabuğu çayı | 184 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Söğüt kalası | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Söğüt kaşığı | 118 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Söğüt kömürü | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Söğüt odunu | 14 | – | Balta ile Söğüt ağacından: Bataklık (ACT 1) | Söğüt kabuğu, Söğüt kalası, Söğüt kömürü, Söğüt yayı |
| Söğüt sapı | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+22) |
| Söğüt sepeti | 5 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Arı kovanı, Balık sepeti |
| Söğüt yayı | 405 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Sönmemiş kireç | 36 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kireç harcı |
| Spor ağacı kalası ² | 73 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Spor ağacı odunu ² | 24 | – | Balta ile Spor ağacı ağacından: Dev Mantar Ormanı (ACT 2) | Kütük salı, Oyma kano, Spor ağacı kalası |
| Spor ekmeği ² | 167 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Ateşte (pişirme menüsü) | – |
| Spor kristali ² | 40 | – | Kazmayla kazılır: Dev Mantar Ormanı (ACT 2) | Ateş asası |
| Spor tozu ² | 14 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) · Av: Mantar böceği düşürür %100 (ACT 2 · Dev Mantar Ormanı) | Mantar lifi eldiven, Spor ekmeği |
| Su | 1 | – | Kap ile (Yaprak kova vb.) suyun kıyısında E | Adaçayı çayı, Ahtapot salatası, Ahududu ezmesi, Ahududu suyu, Akçaağaç kabuğu, Akçaağaç şurubu … (+329) |
| Sulama kabı | 96 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Su kestanesi | 18 | yenir +12 | Yerden toplanır: Bataklık (ACT 1) | Kavrulmuş su kestanesi |
| Su samuru derisi | 5 | – | Av: Su samuru düşürür %75 (ACT 1 · Bataklık) | – (satılır, görevlerde istenir) |
| Su samuru eti | 7 | – | Av: Su samuru düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş su samuru eti, Pişmiş su samuru eti, Turba ateşinde tütsü … (+1) |
| Su teresi | 14 | – | Yerden toplanır: Bataklık (ACT 1) | Kurutulmuş su teresi, Nilüfer çorbası, Ot salatası |
| Su testisi | 77 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Sülük | 62 | – | Mağara canlısı Mağara sülüğü düşürür (Batık Mağara, Bataklık) %80 ×1–2 | Sülük yemi |
| Sülük yemi | 160 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Sümük yosunu ² | 14 | – | Yerden toplanır: Dev Mantar Ormanı (ACT 2) | – |
| Sünger taşı | 45 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Sünger taşı bileği |
| Sünger taşı bileği | 123 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Şaman tüyü ² | 70 | – | Av: Goblin şamanı düşürür %60 (ACT 2 · Dev Mantar Ormanı) | – |
| Şifalı merhem | 184 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tabakhane | 663 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Tabanca ² | 1.447 | alet | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Silahçı Tufan yapar (200 sikke işçilik) | – |
| Tabanca mermisi ² | 83 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | – |
| Tabure | 76 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar (ev içine konur) | – |
| Tahta kapı | ~54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab), İnşa kipiyle kurulur | – |
| Taş | 1 | – | Yerden toplanır: Çayır, Orman, Mor Kristal Vadisi, Kül Diyarı, Bataklık, Kayalık Dağ (ACT 1) | Ağ, Ametist miğfer, Arı kovanı, Ateş yeri, Atölye, Bakır kazma … (+90) |
| Taşta alabalık | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta çapak | 17 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kadife balığı | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kerevit | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kızılkanat | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta kurbağa | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta mersin balığı | 38 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta sazan | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta tatlısu kefali | 21 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta tatlısu levreği | 23 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta tatlısu midyesi | 44 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta turna balığı | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta yayın | 25 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taşta yılan balığı | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taş ağacı kalası ² | 88 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Taş ağacı odunu ² | 30 | – | Balta ile Taş ağacı ağacından: Kristal Golem Ocağı (ACT 2) | Kütük salı, Oyma kano, Taş ağacı kalası |
| Taş balta | 39 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Akçaağaç kalası (alet), Ardıç kalası (alet), Ateş narı kalası (alet), Ay elması kalası (alet), Bataklık servisi kalası (alet), Bulut çamı kalası (alet) … (+46) |
| Taş bıçak | 43 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Silah olarak (hiçbir tarif alet olarak istemez) |
| Taş çember | 8.117 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Taş duvar | ~8 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab), İnşa kipiyle kurulur | – |
| Taş ev | 1.600 | – | Usta Sinan yapar (2.500 sikke) | – |
| Taş fırın | 138 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Taş halka | 20 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kirmen |
| Taş havan | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | Ahududu ezmesi (alet), Alıç ezmesi (alet), Ardıç meyvesi ezmesi (alet), Balık yağı (alet), Böğürtlen ezmesi (alet), Hardal ezmesi (alet) … (+14) |
| Taş kabuk ² | 40 | – | Av: Taş kaplumbağası düşürür %90 (ACT 2 · Kristal Golem Ocağı) | – |
| Taş kase | 24 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Taş havan, Taş lamba |
| Taş kazma | 64 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Taş kılıç | 47 | alet, silah 12 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | Alevli Taş kılıç, Keskin Taş kılıç, Zehirli Taş kılıç |
| Taş kömürü | 11 | – | Kazmayla kazılır: Orman (ACT 1) | Barut, Çelik çizme, Çelik eldiven, Çelik miğfer, Çelik zırh, Gök demiri külçesi … (+4) |
| Taş lamba | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Taş levha | 12 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Erzak çukuru, Mağara resmi, Pişirme taşı |
| Taş örümceği ipi | 22 | – | Mağara canlısı Taş örümceği düşürür (Yankı Mağarası, Çayır) %80 ×1–2 | Kraliçe tılsımı, Yarasa zarı davul |
| Taş savaş çekici | 40 | alet, silah 13 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Taş savaş çekici, Keskin Taş savaş çekici, Zehirli Taş savaş çekici |
| Taş topuz | 31 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Taş topuz, Keskin Taş topuz, Zehirli Taş topuz |
| Taş totem | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tatlısu incisi | 42 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Tatlısu kefali | 4 | – | Balık: Çayır/Orman suları (deniz), olta/ağ/zıpkın ile %32; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş tatlısu kefali, Pişmiş tatlısu kefali, Taşta tatlısu kefali, Tütsülenmiş tatlısu kefali |
| Tatlısu levreği | 5 | – | Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %17; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş tatlısu levreği, Pişmiş tatlısu levreği, Taşta tatlısu levreği, Tütsülenmiş tatlısu levreği |
| Tatlısu midyesi | 9 | – | Yerden toplanır: Orman (ACT 1) · Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %9; balık kapanına da girer · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %10; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş tatlısu midyesi, Midye kabuğu kaşık, Pişmiş tatlısu midyesi, Taşta tatlısu midyesi … (+2) |
| Tavan ağı | 112 | – | Mağara canlısı Tavan örümceği düşürür (Rüzgâr Mağarası, Kayalık Dağ) %80 ×1–2 | Ağ kapanı, Gümüş çan, Kristal kolye |
| Tavşan derisi | 3 | – | Av: Tavşan düşürür %70 (ACT 1 · Çayır) | – (satılır, görevlerde istenir) |
| Tavşan eti | 3 | – | Av: Tavşan düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş tavşan eti, Pişmiş tavşan eti, Turba ateşinde tütsü … (+1) |
| Tavuk mantarı | 9 | yenir +8 | Yerden toplanır: Orman (ACT 1) | Kızarmış tavuk mantarı, Kurutulmuş tavuk mantarı |
| Tazı dişi ² | 40 | – | Av: Gök tazısı düşürür %60 (ACT 2 · Yüzen Kayalar) | – |
| Tekir | 8 | – | Deniz avı: Kıyı Suları (Gemici Poyraz'ın teknesiyle, Sv 3+, Olta) %17 | Tekir tava |
| Tekir tava | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tırmık | 50 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tırpan | 153 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Timsah derisi | 45 | – | Av: Timsah düşürür %90 (ACT 1 · Bataklık) | Timsah eldiven, Timsah miğfer, Timsah pulu zırh |
| Timsah dişi | 35 | – | Av: Timsah düşürür %60 (ACT 1 · Bataklık) | Söğüt yayı, Timsah dişi balta, Timsah dişi kazma, Timsah dişi kılıcı, Timsah dişi kolye, Timsah dişi mızrak … (+2) |
| Timsah dişi balta | 756 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah dişi kazma | 1.112 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah dişi kılıcı | 1.863 | alet, silah 38 hasar | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah dişi kolye | 104 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Timsah dişi mızrak | 691 | alet, silah 34 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah dişi savaş çekici | 1.730 | alet, silah 44 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah dişi topuz | 1.078 | alet, silah 32 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Ali (Bataklık) ve üstü döver | – |
| Timsah eldiven | 1.135 | giyilir +13 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Timsah eti | 13 | – | Av: Timsah düşürür %100 (ACT 1 · Bataklık) | Pişmiş timsah eti |
| Timsah miğfer | 1.128 | giyilir +22 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Timsah pulu zırh | 3.135 | giyilir +46 savunma | Tarif: kazanda öğrenilir (Zümrüt ya da kuzen cadılar; tanışınca kitaba yazılır) → Örs · Zırhçı Veli (Bataklık) ve üstü döver | – |
| Titanyum cevheri ² | 52 | – | Kazmayla kazılır: Kristal Golem Ocağı (ACT 2) | Titanyum külçesi |
| Titanyum külçesi ² | 291 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Işın kılıcı, Meka çizme, Meka zırh, Roket gövdesi |
| Titanyum plaka ² | 120 | – | Av: Büyük golem düşürür %90 (ACT 2 · Kristal Golem Ocağı) | – |
| Tohum yağı | 84 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Toprak yol | ~1 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) (→ 4), İnşa kipiyle kurulur | – |
| Tunç balta | 572 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç çizme | 780 | giyilir +7 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Tunç eldiven | 788 | giyilir +7 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Tunç kazma | 823 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç kılıç | 1.242 | alet, silah 22 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç külçesi | 191 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Makaralı olta, Meşe yayı, Tunç balta, Tunç kazma, Tunç kılıç, Tunç levha … (+4) |
| Tunç levha | 566 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Tunç çizme, Tunç eldiven, Tunç miğfer, Tunç zırh |
| Tunç mızrak | 553 | alet, silah 20 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tunç miğfer | 783 | giyilir +12 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Tunç ok | 70 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Alevli Tunç ok, Keskin Tunç ok, Zehirli Tunç ok |
| Tunç savaş çekici | 1.325 | alet, silah 25 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Tunç topuz | 820 | alet, silah 19 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Silahçı Durdu (Orman) ve üstü döver | – |
| Tunç zırh | 2.160 | giyilir +24 savunma | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Turba | 14 | – | Yerden toplanır: Bataklık (ACT 1) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+14) |
| Turba ateşinde tütsü | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Turna balığı | 7 | – | Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %15; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %25; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş turna balığı, Pişmiş turna balığı, Taşta turna balığı, Tütsülenmiş turna balığı |
| Turna kuşu eti | 7 | – | Av: Turna kuşu düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş turna kuşu eti, Pişmiş turna kuşu eti, Turba ateşinde tütsü … (+1) |
| Turna kuşu tüyü | 2 | – | Av: Turna kuşu düşürür %85 (ACT 1 · Bataklık) | – |
| Turna kuşu yumurtası | 3 | – | Av: Turna kuşu düşürür %30 (ACT 1 · Bataklık) | Haşlanmış turna kuşu yumurtası |
| Tuz | 54 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Acı biber ezmesi, Kaya patlatıcı, Kurutulmuş alabalık, Kurutulmuş bıldırcın eti, Kurutulmuş çapak, Kurutulmuş dağ keçisi eti … (+34) |
| Tuzak | 84 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Tuz havuzu | 259 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Tuz kayası | 19 | – | Kazmayla kazılır: Bataklık (ACT 1) | Havyar, Tuz |
| Tütsühane | 234 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Tütsülenmiş alabalık | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş bıldırcın eti | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş çapak | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş dağ keçisi eti | 94 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş geyik eti | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş işık tilkisi eti | 147 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kadife balığı | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş karaca eti | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kartal eti | 103 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş keklik eti | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kerevit | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kızılkanat | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kristal geyik eti | 170 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kunduz eti | 77 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kurbağa | 60 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş kurt eti | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş mağara ayısı eti | 104 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş mersin balığı | 94 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş muflon eti | 94 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş ördek eti | 83 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş sazan | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş sincap eti | 69 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş su samuru eti | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş tatlısu kefali | 64 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş tatlısu levreği | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş tatlısu midyesi | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş tavşan eti | 61 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş turna balığı | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş turna kuşu eti | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş ur kekliği eti | 96 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş vaşak eti | 107 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş yaban atı eti | 68 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş yaban domuzu eti | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş yaban kazı eti | 87 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş yaban öküzü eti | 100 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş yayın | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tütsülenmiş yılan balığı | 74 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Tüy yosunu ² | 10 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | – |
| Ur kekliği eti | 9 | – | Av: Ur kekliği düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş ur kekliği eti, Pişmiş ur kekliği eti, Turba ateşinde tütsü … (+1) |
| Ur kekliği tüyü | 4 | – | Av: Ur kekliği düşürür %85 (ACT 1 · Kayalık Dağ) | Çelik ok, Kara çelik ok, Mor kristal ok |
| Ur kekliği yumurtası | 7 | yenir +15 | Av: Ur kekliği düşürür %35 (ACT 1 · Kayalık Dağ) | Haşlanmış ur kekliği yumurtası |
| Uzaylı devresi ² | 200 | – | Av: Uzaylı dronu düşürür %70 (ACT 2 · Gök Rıhtımı) · Av: Gök bekçisi düşürür %100 (ACT 2 · Gök Rıhtımı) | Meka çizme, Roket |
| Uzun sopa | 28 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bakır mızrak, Basit yay, Çakmaktaşı mızrak, Çelik mızrak, Demir mızrak, Deniz oltası … (+13) |
| Vaşak derisi | 24 | – | Av: Vaşak düşürür %85 (ACT 1 · Kayalık Dağ) | – (satılır, görevlerde istenir) |
| Vaşak eti | 17 | – | Av: Vaşak düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş vaşak eti, Pişmiş vaşak eti, Turba ateşinde tütsü … (+1) |
| Vida ² | 8 | – | Yerden toplanır: Hurda Çölü (ACT 2) · Av: Hurda faresi düşürür %90 (ACT 2 · Hurda Çölü) | Hurda çizme, Pompalı, Tabanca |
| Volkan camı | 74 | – | Mağarada yerden toplanır: Kor Mağarası (Kül Diyarı, giriş Sv 34) | Kor tacı tılsımı, Volkan camı muska |
| Volkan camı muska | 540 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Volkan demiri ² | 40 | – | Kazmayla kazılır: Ejder Volkanı (ACT 2) | – |
| Volkan külü ² | 10 | – | Yerden toplanır: Ejder Volkanı (ACT 2) | – |
| Yabani armut | 2 | yenir +7 | Meyve ağacı (Armut): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Armut ağacından toplanır: Çayır (ACT 1) | Kurutulmuş yabani armut, Yabani armut ezmesi, Yabani armut suyu |
| Yabani armut ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani armut suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani arpa | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kavrulmuş yabani arpa, Yabani arpa lapası, Yabani arpa unu |
| Yabani arpa hamuru | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani arpa yassı ekmeği |
| Yabani arpa lapası | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani bira mayası |
| Yabani arpa unu | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani arpa hamuru |
| Yabani arpa yassı ekmeği | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani bal | 12 | yenir +12 | Yerden toplanır: Orman (ACT 1) | Ateş çiçeği balı, Ay elması reçeli, Ballı ekmek, Ballı fındık, Ballı kestane, Balmumu … (+1) |
| Yabani bira mayası | 312 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani buğday | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kavrulmuş yabani buğday, Yabani buğday lapası, Yabani buğday unu |
| Yabani buğday hamuru | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani buğday yassı ekmeği |
| Yabani buğday lapası | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani buğday unu | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Barbunya tava, Hamsi tava, Kalamar tava, Kalkan tava, Kurutulmuş meyve keki, Tekir tava … (+1) |
| Yabani buğday yassı ekmeği | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani elma | 2 | yenir +7 | Meyve ağacı (Elma): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Elma ağacından toplanır: Çayır (ACT 1) | Kurutulmuş yabani elma, Yabani elma ezmesi, Yabani elma suyu |
| Yabani elma ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani elma suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani erik | 2 | yenir +6 | Meyve ağacı (Erik): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Erik ağacından toplanır: Çayır (ACT 1) | Kurutulmuş yabani erik, Yabani erik ezmesi, Yabani erik suyu |
| Yabani erik ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani erik suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani havuç | 2 | yenir +5 | Yerden toplanır: Çayır (ACT 1) | Kızarmış yabani havuç, Kurutulmuş yabani havuç |
| Yabani mercimek | 9 | yenir +7 | Yerden toplanır: Orman (ACT 1) | Kavrulmuş yabani mercimek, Yabani mercimek lapası, Yabani mercimek unu |
| Yabani mercimek hamuru | 57 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani mercimek yassı ekmeği |
| Yabani mercimek lapası | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani mercimek unu | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani mercimek hamuru |
| Yabani mercimek yassı ekmeği | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani nohut | 9 | yenir +7 | Yerden toplanır: Orman (ACT 1) | Kavrulmuş yabani nohut, Yabani nohut lapası, Yabani nohut unu |
| Yabani nohut hamuru | 57 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani nohut yassı ekmeği |
| Yabani nohut lapası | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani nohut unu | 39 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani nohut hamuru |
| Yabani nohut yassı ekmeği | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yabani yulaf | 2 | – | Yerden toplanır: Çayır (ACT 1) | Kavrulmuş yabani yulaf, Yabani yulaf lapası, Yabani yulaf unu |
| Yabani yulaf hamuru | 26 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Yabani yulaf yassı ekmeği |
| Yabani yulaf lapası | 114 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yabani yulaf unu | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kurutulmuş meyve keki, Kül ekmeği, Yabani yulaf hamuru |
| Yabani yulaf yassı ekmeği | 52 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ballı ekmek, Ziyafet sofrası |
| Yaban atı derisi | 10 | – | Av: Yaban atı düşürür %80 (ACT 1 · Çayır) | – (satılır, görevlerde istenir) |
| Yaban atı eti | 9 | – | Av: Yaban atı düşürür %100 (ACT 1 · Çayır) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban atı eti, Pişmiş yaban atı eti, Turba ateşinde tütsü … (+1) |
| Yaban çileği | 2 | yenir +6 | Yerden toplanır: Çayır (ACT 1) | Kurutulmuş yaban çileği, Yaban çileği ezmesi, Yaban çileği suyu |
| Yaban çileği ezmesi | 14 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban çileği suyu | 81 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban domuzu derisi | 9 | – | Av: Yaban domuzu düşürür %70 (ACT 1 · Orman) · Av: Kor domuzu düşürür %70 (ACT 2 · Ejder Volkanı) | – (satılır, görevlerde istenir) |
| Yaban domuzu dişi | 11 | – | Av: Yaban domuzu düşürür %45 (ACT 1 · Orman) · Av: Kor domuzu düşürür %45 (ACT 2 · Ejder Volkanı) | Domuz dişi muska, Granit savaş çekici |
| Yaban domuzu eti | 8 | – | Av: Yaban domuzu düşürür %100 (ACT 1 · Orman) · Av: Kor domuzu düşürür %100 (ACT 2 · Ejder Volkanı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban domuzu eti, Pişmiş yaban domuzu eti, Turba ateşinde tütsü … (+1) |
| Yaban kazı eti | 7 | – | Av: Yaban kazı düşürür %100 (ACT 1 · Bataklık) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban kazı eti, Pişmiş yaban kazı eti, Turba ateşinde tütsü … (+1) |
| Yaban kazı tüyü | 2 | – | Av: Yaban kazı düşürür %85 (ACT 1 · Bataklık) | – |
| Yaban kazı yumurtası | 3 | – | Av: Yaban kazı düşürür %35 (ACT 1 · Bataklık) | Haşlanmış yaban kazı yumurtası |
| Yaban mersini | 9 | yenir +9 | Yerden toplanır: Orman (ACT 1) | Kurutulmuş yaban mersini, Yaban mersini boyası, Yaban mersini ezmesi, Yaban mersini suyu |
| Yaban mersini boyası | 30 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Yaban mersini ezmesi | 33 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban mersini suyu | 110 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaban öküzü derisi | 14 | – | Av: Yaban öküzü düşürür %100 (ACT 1 · Kayalık Dağ) | – (satılır, görevlerde istenir) |
| Yaban öküzü eti | 15 | – | Av: Yaban öküzü düşürür %100 (ACT 1 · Kayalık Dağ) | Avcı yahnisi, Et şişi, Kara tuzlu et, Kurutulmuş yaban öküzü eti, Pişmiş yaban öküzü eti, Turba ateşinde tütsü … (+1) |
| Yaban sarımsağı | 8 | – | Yerden toplanır: Orman (ACT 1) | Kurutulmuş yaban sarımsağı, Sarımsaklı et |
| Yağ birikintisi ² | 14 | – | Yerden toplanır: Hurda Çölü (ACT 2) | – |
| Yakıt hücresi ² | 1.500 | – | Av: Gök bekçisi düşürür %100 (ACT 2 · Gök Rıhtımı) | Roket motoru |
| Yanık kök | 46 | – | Yerden toplanır: Kül Diyarı (ACT 1) | Yanık kök çayı |
| Yanık kök çayı | 337 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yankı çanı | 346 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yankı çorbası | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Ateşte (pişirme menüsü) | – |
| Yankı mantarı | 14 | – | Mağarada yerden toplanır: Yankı Mağarası (Çayır, giriş Sv 5) | Kraliçe tılsımı, Yankı çorbası |
| Yankı taşı | 82 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Yankı çanı |
| Yaprak | 1 | – | Yerden toplanır: Orman, Çayır, Bataklık, Kül Diyarı, Mor Kristal Vadisi, Kayalık Dağ (ACT 1) | Adaçayı çayı, Ahududu suyu, Akçaağaç kabuğu, Akçaağaç şurubu, Alıç suyu, Ardıç kabuğu … (+247) |
| Yaprak barınağı | 1 | – | Usta Sinan yapar (25 sikke, malzeme: 8 Dal, 12 Yaprak, 4 Lif) | – |
| Yaprak kova | 8 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yarasa gübresi | 3 | – | Yerden toplanır: Mor Kristal Vadisi, Kayalık Dağ, Kül Diyarı, Çayır, Orman, Bataklık (ACT 1) | Gübre, Kaya patlatıcı |
| Yarasa kanadı | 40 | – | Av: Kor yarasası düşürür %80 (ACT 1 · Kül Diyarı) | Yarasa kanadı yelpazesi |
| Yarasa kanadı yelpazesi | 273 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yarasa zarı | 16 | – | Mağara canlısı Mağara yarasası düşürür (Yankı Mağarası, Çayır) %80 ×1 · Mağara reisi Yankı Kraliçesi düşürür (Yankı Mağarası, Çayır) %100 ×3–5 | Yarasa zarı davul |
| Yarasa zarı davul | 130 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yaşlı Kök özü | 480 | – | Mağara reisi Yaşlı Kök düşürür (Kök Mağarası, Orman) %100 ×1 | Kök özü iksiri |
| Yavru ejder pulu ² | 90 | – | Av: Yavru ejder düşürür %90 (ACT 2 · Ejder Volkanı) | Ejder pulu eldiven |
| Yayın | 8 | – | Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %20; balık kapanına da girer · Balık: Kül Diyarı/Mor Kristal Vadisi suları, olta/ağ/zıpkın ile %34; balık kapanına da girer | Balık çorbası, Balık sepeti, Balık yağı, Kurutulmuş yayın, Pişmiş yayın, Taşta yayın … (+1) |
| Yelkenli sal | 640 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yılan balığı | 7 | – | Balık: Çayır/Orman suları (nehir/göl), olta/ağ/zıpkın ile %8; balık kapanına da girer · Balık: Bataklık/Kayalık Dağ suları, olta/ağ/zıpkın ile %10; balık kapanına da girer | Balık çorbası, Balık sepeti, Kurutulmuş yılan balığı, Pişmiş yılan balığı, Taşta yılan balığı, Tütsülenmiş yılan balığı |
| Yıldırım asası ² | 3.200 | alet | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → Büyücü Efsun yapar (300 sikke işçilik) | – |
| Yıldız akasyası kalası ² | 125 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+14) |
| Yıldız akasyası odunu ² | 44 | – | Balta ile Yıldız akasyası ağacından: Gök Rıhtımı (ACT 2) | Kütük salı, Oyma kano, Yıldız akasyası kalası |
| Yıldız cevheri ² | 110 | – | Kazmayla kazılır: Gök Rıhtımı (ACT 2) | Yıldız külçesi |
| Yıldız çelengi | 467 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yıldız çiçeği | 74 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Yıldız çelengi |
| Yıldız eriği | 93 | yenir +22 | Meyve ağacı (Yıldız eriği): eli boşken F ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane · Yıldız eriği ağacından toplanır: Mor Kristal Vadisi (ACT 1) | Kurutulmuş yıldız eriği |
| Yıldız eriği kalası | 151 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ahşap karyola, Akrep kabuğu kalkanı, Asma fener, Atölye, Dolap, Gemi … (+15) |
| Yıldız eriği kömürü | 178 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Altın külçesi, Bakır külçesi, Barut, Çömlek fırını, Demir halka, Demir külçesi … (+12) |
| Yıldız eriği odunu | 54 | – | Balta ile Yıldız eriği ağacından: Mor Kristal Vadisi (ACT 1) | Kütük salı, Oyma kano, Yıldız eriği kalası, Yıldız eriği kömürü |
| Yıldız eriği sapı | 209 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt bıçak, Boynuz kazma, Çakmaktaşı balta, Çakmaktaşı bıçak … (+21) |
| Yıldız eriği tohumu | 18 | – | Yıldız eriği ağacı baltayla kesilince %35 ihtimalle düşer | Meyve fidanı, Tohum yağı |
| Yıldız külçesi ² | 1.135 | – | Tarif: Yıldız'ın kazanı (ACT 2) öğrenilir → El yapımı (Tab) | Roket motoru |
| Yıldız mantarı ² | 30 | – | Yerden toplanır: Gök Rıhtımı (ACT 2) | – |
| Yıldız mürekkebi | 211 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Boyalı çömlek, Dolap, Duvar halısı, Halı, Kilim … (+1) |
| Yıldız oltası | 6.724 | alet | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yıldız tilkisi eti ² | 42 | – | Av: Yıldız tilkisi düşürür %100 (ACT 2 · Gök Rıhtımı) | Avcı yahnisi, Et şişi, Kara tuzlu et, Pişmiş yıldız tilkisi eti, Turba ateşinde tütsü |
| Yıldız tilkisi postu ² | 80 | – | Av: Yıldız tilkisi düşürür %80 (ACT 2 · Gök Rıhtımı) | – |
| Yıldız tozu | 90 | – | Yerden toplanır: Mor Kristal Vadisi (ACT 1) | Yıldız mürekkebi, Yıldız tozu yemi |
| Yıldız tozu yemi | 504 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yontulmuş bazalt | 132 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Bazalt pulu, Bazalt sivri ucu |
| Yontulmuş çakmaktaşı | 15 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Çakmaktaşı balta, Çakmaktaşı kılıç, Çakmaktaşı pulu, Çakmaktaşı savaş çekici, Çakmaktaşı sivri ucu, Çakmaktaşı topuz |
| Yontulmuş kuvars | 91 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Kuvars balta, Kuvars pulu, Kuvars savaş çekici, Kuvars sivri ucu, Kuvars topuz |
| Yontulmuş obsidyen | 88 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Obsidyen balta, Obsidyen pulu, Obsidyen sivri ucu |
| Yosun | 13 | – | Yerden toplanır: Bataklık (ACT 1) | Kamış çizme, Kükürtlü merhem, Yosun yalıtım, Yosun yastık |
| Yosun yalıtım | 67 | – | Tarif: Zümrüt'ün kazanı öğrenilir → Usta Sinan yapar, yere kurulur | – |
| Yosun yastık | 287 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yosun yeşili boya | 95 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Yüzer taş ² | 30 | – | Yerden toplanır: Yüzen Kayalar (ACT 2) | Ateş asası |
| Zehirli Bakır ok | 47 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehirli Basit ok | 45 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehirli Çelik ok | 5.960 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehirli Demir ok | 956 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehirli Kara çelik ok | 19.722 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehirli Mızrak | 132 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Zehirli Mor kristal ok | 5.249 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehirli Taş kılıç | 140 | alet, silah 12 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Zehirli Taş savaş çekici | 133 | alet, silah 13 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Zehirli Taş topuz | 123 | alet, silah 10 hasar | Tarif: Zümrüt'ün kazanı öğrenilir → Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | – |
| Zehirli Tunç ok | 703 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |
| Zehir bezesi | 16 | – | Av: Zehirli kurbağa düşürür %80 (ACT 1 · Bataklık) · Av: Engerek düşürür %60 (ACT 1 · Orman) | Panzehir |
| Zehir yağı | 75 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | Ametist kılıcı, Ametist savaş çekici, Ametist topuz, Obsidyen mızrak, Timsah dişi kılıcı, Timsah dişi mızrak … (+13) |
| Ziyafet sofrası | 198 | – | Tarif: Zümrüt'ün kazanı öğrenilir → El yapımı (Tab) | – |


# Yetenekler · Yetenek ağacı

Yetenekler üç ağaçtadır: **Savaş** (kırmızı), **Ekonomi** (altın sarısı) ve **Dayanıklılık** (yeşil). Her ağaçta **30 yetenek**, toplam **90 yetenek**.

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
- **Ek yetenekler:** Derin nefes III, Çabuk toparlanma II, Hafif adım II, Çevik atılma II-III, Uzun atılma, Güçlü kol IV, Savuşturma ustası I-II, Sıyrılma ustası, Usta tüccar II, Bereket II, Verimli toprak II, Sağlam yapı IV, Hızlı iyileşme IV, Doyurucu sofra, Kamp ateşi ustası, Tok karın, Kalın deri II-III, Dirençli beden, Demir mide II. Geri gelenler: Toptancı, Kazan bilgesi, Keskin göz, Bilmece ustası, Hızlı öğrenen I ve III.
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
| 7 | H6 | **Keskin göz I** (eskiden Kâşif gözü) | pusula | Kritik vuruş ihtimali +%3 (kritik vurabilen silahlarla) | Hızlı adımlar III | – | 3.000 | Sv 11 |
| 7 | K9 | Hafif adım II | tüy | Koşarken toplam %50 daha az enerji harcarsın | Hafif adım I | Rüzgâr gibi, Baykuş gözü | 3.000 | Sv 11 |
| 7 | K7 | Derin nefes III | nefes (ciğer) | En yüksek enerji toplam +%75 | Derin nefes II | – | 3.000 | Sv 11 |
| 7 | W4 | Güçlü kol IV | kılıç | Hasar toplam +%55 | Güçlü kol III | – | 3.000 | Sv 11 |
| 7 | V3 | Sıyrılma ustası | kıvılcım | Bir saldırının içinden taklayla geçince +6 yerine +14 enerji | Savuşturma ustası II | – | 3.000 | Sv 11 |
| 7 | A4 | Kemer IV | kemer | Alet yuvası 12 | Kemer III | – | 3.000 | Sv 11 |
| 7 | K8 | Çabuk toparlanma II | şimşek | Enerji iki kat hızlı dolar | Kemer III | – | 3.000 | Sv 11 |
| 7 | S3 | Çevik atılma II | hız çizgili ok | Atılma 7 enerji, bekleme 0,38 sn | Çevik atılma I | Çevik atılma III, Uzun atılma | 3.000 | Sv 11 |
| 8 | K4 | **Keskin göz II** (eskiden Rüzgâr gibi) | rüzgâr | Kritik vuruş ihtimali toplam +%6 | Keskin göz I | – | 5.000 | Sv 14 |
| 8 | H8 | **Ölümcül vuruş** (eskiden Baykuş gözü) | hilal | Kritik vuruş %50 yerine %80 fazla vurur | Keskin göz II | – | 5.000 | Sv 14 |
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
| 8 | H4 | Uzun kol | uzanan ok | F ile %50 daha uzaktan toplama | Usta işi II | – | 5.000 | Sv 14 |

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

46 başarım vardır. Başarımlar **cihaza** kaydedilir (bütün kayıt yuvaları için ortak). 🔒 işaretliler kazanılana kadar gizlidir. Başarımı kazanınca simgesindeki eşya da görünür. Arena (ana menü) iyi son ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır.

**Başarım kartı ekranın ortasında (v3.39, Boğaç: "sağ altta haritanın üzerinde değil, ortada göster; tıklarsa direk kaybolsun"):** bir başarım kazanılınca kartı (simgesi, "BAŞARIM KAZANILDI" ve adı) **ekranın ortasında**, biraz büyük, hafifçe büyüyerek belirir ve **3,6 saniye** kalır, sonra söner. Karta **tıklanınca (dokununca) hemen kaybolur**; sırada başka başarım varsa o gelir. Kart oyunu durdurmaz, kartın dışına tıklamak oyunu etkilemez. (v3.38'e kadar kart sağ altta, haritanın üstünde çıkıyordu.)

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
| Hatırladım 🔒 | Bütün anılarını geri getir. | 32 anı: ACT 1'in 22 anısı (tanışmadan evlenme teklifine), ikinci adada gelen 5 mor ışık anısı, 5 usta anısı (ACT 2 ustalarının son görevleri). |
| Adada bir ay | 30. güne ulaş. | – |
| Ejder avcısı 🔒 | Kül Diyarı'nın kara ejderini yen. | Kara ejder Kül Diyarı'nda. |
| Ada efsanesi | Seviye 25 ol. | – |
| Yaşayan ansiklopedi | 250 tarif bul. | – |
| Kazazede 🔒 | Denizci Barbaros'un yeni gemisini kur. | Barbaros'un son görevi "Yeni bir gemi" (dz4) bitince. |
| Gökyüzüne 🔒 | Gökay ile roketi fırlat. | Gökay ile roket fırlatılınca. |
| Açık deniz 🔒 | Barbaros'un gemisiyle adadan ayrıl: ACT 2. | Barbaros'un gemisiyle ikinci adaya geçince. |
| İlk düşüş | Bir kez bayıl. | Her bayılma sayılır: canavar, açlık, zehir, mor ışık. |
| İnatçı | 5 kez bayıl, yine de devam et. | Her bayılma sayılır. |
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
| Kehribar gözlüm 🔒 | Sevdiğin kişiyi kehribar gözlü yarat ve ACT 1'i tamamla. | karakter yaratmada sevdiğin kişinin göz rengi **Kehribar** olmalı; ACT 1, Barbaros'un gemisiyle ikinci adaya geçince (ya da ikinci adadayken) tamamlanmış sayılır. Kazanılana kadar listede "???" ve "Gizli başarım" görünür, hiçbir ipucu verilmez. **Platin'e sayılmaz** (belli bir karakter seçimini istediği için). |
| Denizde yürüyen 🔒 | Denizin üstünde yürü. | v3.30 (Boğaç): ACT 1 haritasında **denize hiç yürünmez**; ama her yeni oyunda rastgele bir kıyıdan denize doğru düz, 1 kare genişliğinde, **8–10 kare uzunluğunda gizli bir yol** vardır (bkz. ACT 1 › Denizdeki gizli yol). Yolun sonuna yürüyünce bayılırsın ve **Kemal'in yanında** uyanırsın; bu bir hata değil, bu başarımı kazandırır. Kazanılana kadar listede "???" ve "Gizli başarım" görünür, ipucu verilmez. **Platin'e sayılmaz** (rastgele bir yeri bulmaya bağlı). |
| Mor ışıkta o 🔒 | Gece beliren sevdiğin kişiyi 5 farklı gecede gör. | v3.30 (Boğaç), v3.34'te kendi kopyan yerine sevdiğin kişi (eski adı Öteki ben): bkz. Temel sistemler › Mor ışıkta o. Kazanılana kadar "???" görünür. Platin'e sayılır. |
| Görünmezlik iksiri 🔒 | Zümrüt'ün sabrını üç kez taşır. | v3.34: kazana hiçbir tarifte kullanılmayan 5 farklı malzemeyi üç kez atınca Zümrüt'ün verdiği iksiri içersin (bkz. Temel sistemler › Gizli şeyler). Platin'e sayılır. |
| Konuk 🔒 | Mor ışığın konuklarına dokunma. | v3.34: bir mor ışık saldırısını hiç Yıldızsız öldürmeden, bayılmadan sonuna kadar geçir (bkz. Gizli şeyler). Platin'e sayılır. |
| Platin | Bütün başarımları kazan. | **Şu an kazanılamaz:** "Yalnız dönüş" kazanılamadığı için. |


# Bilinen açıklar ve tutarsızlıklar

Belge hazırlanırken kodda görülenler. Oyun testinde doğrulananlar ve düzeltilenler ayrı test raporunda.

| # | Konu | Ne oluyor | Öneri |
|---|---|---|---|
| 2 | Kötü son | "Yalnız dönüş" başarımı ve dolayısıyla "Platin" kazanılamaz; kötü son yok. | Kötü son yazılana kadar başarımı gizle ya da Platin'den çıkar. |
| 6 | Ekin'in tohumları | Tohum dükkânı açılmıyor; Ekin bir yerde "satarım" bir yerde "satmam" diyor. | Karar ver, metni düzelt. |
| 8 | Gemi malzemesi | Gemi malzemeleri iki kez harcanıyor (kazanda öğrenirken ve Barbaros'un son görevinde). | Ya tarifi öğrenmeyi kaldır ya da görevi "gemiyi getir" yap. |
| 9 | Küçük tutarsızlıklar | Öğreticinin 13. adımında örste her şey bedava; Ekin yalnızca adı "Taş kazma" olan kazmayı kabul ediyor; Kemal'in 3. görevi "100 sikke" diyor ama yalnızca yetenek alınmış mı bakıyor; Poyraz'ın ilk siparişi XP'yi iki kez veriyor. | — |
| 10 | Ölü kod | Kaptan Poyraz, Balıkçı Rüstem, Sisli Ada ve sal sonu kodda duruyor ama çalışmıyor. Son Kemal görevinde iskelenin üstüne hâlâ sal oku çiziliyor; Rüstem'in kıyısında kimsesiz bir ateş yanıyor. | Temizlik. |
| 13 | Çevik atılma | Yeteneğin "kısa bekleme" kısmı çalışmıyor (takla beklemesi hep 0,68 sn); enerji indirimi çalışıyor. | Beklemeyi yeteneğe göre ayarla. |
| 14 | Kalın deri | Açıklaması "zehir, yanık ve çiğ et %40 az" diyor; zehir ve yanığı azaltmıyor, yalnızca çiğ et ve diken hasarını azaltıyor. | Etkiye bağla ya da metni düzelt. |
| 15 | Balık ve tuzak bölgeleri | Tablolar 6 biyoma değil 3 kuşağa göre: Kayalık Dağ'da bataklık balıkları, Mor Kristal Vadisi'nde Kül Diyarı balıkları çıkıyor; ACT 2'ye özel balık yok. | Biyom başına tablo. |
| 16 | Şanslı müşteri II | "Hepsini sat"ta hesaba katılmıyor. | – |
| 17 | Ev lambaları | Evin içi her zaman güvenli olduğu için lambaların işlevi yok, ama metinleri "mor ışık içeri giremez" diyor. | Lambaya başka bir işlev ver ya da metni değiştir. |
| 18 | İşlevsiz aletler | Sapan, Bola, Porsuk yayı, Dişbudak yayı "tuzak" türünde ama kurulamıyor ve silah olarak da kullanılmıyor. | Bir işlev ver ya da tariflerden çıkar. |
| 19 | Metinler | Zor modda "Dene" sonrası metin eski akışı anlatıyor; "Oyunlardaki gibi" başarımı telefonda yanlış hareketi tarif ediyor. | Metin düzeltmesi. |
| 20 | Yol oku (ACT 1 sonu) | Barbaros'un görevleri sürerken görev kartı "Barbaros ile konuş" diyor ama yol oku hâlâ Yaşlı Kemal'i gösteriyor. | Ok Barbaros'u göstermeli. |
| 21 | Arayüz | Oyun içi Ayarlar açıkken saat akıyor; Ayarlar düğme yazıları kesik ("Derinli", "Otoma"); ana menüde logo "Devam et"e biniyor; karakter yaratmada alt çubuk son satırları örtüyor; seviye 50'de "0 / Infinity XP · SV. 51". | Düzeltme. |
| 22 | Hile paneli | Panel dünyanın üstünde ve görev kartının altında; savaşırken yanlışlıkla "Günü bitir"e tıklanabiliyor (testte 100 gün atlandı). | Paneli kenara al ya da onay iste. |
| 23 | Diyaloglar | Teslimde hem "Başka iş var mı?" hem "❗ Senin için bir işim var" aynı anda çıkıyor; Sinan görev bitince de "Atölye kurmak mı?" diyor; Barbaros'ta "Hoşça kal" ilk sırada; Börü'de süren dersi bırakma seçeneği yok. | Düzeltme. |
| 24 | Eski metinler | Nazlı "otlar Çayır'da bolca olur" diyor, Nerede satırı Kayalık Dağ; Ekin "parçalarını Zümrüt'ün kazanında yaparsın" diyor (artık parçalar el yapımı). | Metin düzeltmesi. |
| 25 | E önceliği (ACT 1) | ACT 1 kişilerinin yanında bir taş/dal varken E önce onu topluyor. Kişiye tıklamak her zaman çalışıyor. | Karar: ACT 1'de de kişi öne alınsın mı? |
| 26 | Ev içi gece | Gece lambasız oda neredeyse simsiyah; konan eşya görünmüyor ("sandalye koyamadım" hissi). Telefonda döşeme paneli odanın üst sırasını, masaüstünde görev kartı panelin bir kısmını örtüyor. | Gece odaya hafif bir ışık; panel yerleşimi. |
| 27 | ACT 2 zorluğu | ACT 2'nin "Güvenli" biyomlarındaki canavarlar bile çok güçlü (Bulut koyunu 1.200 can, Goblin 2.580 can / 343 hasar); ACT 1 sonu ekipmanla bir goblin 1 dakikadan uzun sürüyor. | Denge kararı (Boğaç). |
| 28 | ACT 2 küçükleri | Yıldız'ın kazanının başlığı "Cadının kazanı"; hileyle geçişte görev kartı Kemal'i gösteriyor ve köprü/geçit başarımları bedava geliyor; Tabanca yakın hedefte ıskalayabiliyor (belirsiz). | Düzeltme. |
| 29 | Meşale (öğretici) | Sabah yakılan meşale gündüz de yanıp öğlen sönüyor. | Tasarım kararı. |


## İleride: Tarlacılık

> Tarlacılık şimdilik oyundan çıkarıldı; ileride yeniden eklenebilir. Eski düzen (geri getirilirse başlangıç noktası): Orman'da Çiftçi Ekin ve 4 × 3'lük tarlası; dört alet (Tırmık, Sulama kabı, Tırpan, Taş kazma) getirilince tarla açılır; tırmıkla hazırla, tohum ek, sula, biç; ürünler Buğday, Havuç, Patates, Soğan, Kabak, Ayçiçeği; H1–H8 görev zinciri; ürünlerden yapılan yemekler (Ekmek, Buğday unu, çorbalar, Çiftçi yahnisi, Patates püresi, Soğan halkası, Ayçiçek yağı…), Korkuluk ve Hasat sepeti. Geri gelirse biyom kuralları ve "önce belge" kuralıyla yeniden tasarlanır.


# Platformlar (Godot · PS5)

## Godot'ya geçiş (gelecek planı, henüz başlanmadı)

**Karar (5 Kasım 2026, Boğaç):** oyunun ileride Godot oyun motoruna taşınması planlanıyor. Amaç: Steam'de tam uyum (başarımlar, bulut kayıt, Steam Input), konsollar (bkz. **PlayStation 5 sürümü**), daha iyi performans ve ışık/efekt kalitesi. Bu bölüm işin büyüklüğünü, sırasını ve tahmini süresini yazar. Web sürümü taşıma bitene kadar oynanır ve güncellenir.

### Neden

- **Platformlar:** PS5, Xbox, Switch ancak bir oyun motoruyla; Steam'de başarımlar, bulut kayıt ve Steam Input. Xbox kablosuz aparatının Chrome/Edge'de kolu düşürmesi gibi tarayıcı sorunları kalmaz (bkz. Sistemler › Oyun kolu).
- **Performans:** ekran kartı doğrudan kullanılır; telefondaki donma ve yavaşlama sınırları (bkz. Performans kuralları) büyük ölçüde kalkar.
- **Görsel:** karanlık, meşale, mor ışık, kor ve kristal parıltıları için gerçek 2D ışık ve gölge.
- **Araçlar:** harita karo karo elle boyanabilir, animasyonlar görerek ayarlanır. Telefon için App Store ve Google Play uygulaması çıkar.
- **Kaybedilenler:** bir linkle anında oynama ve anında güncelleme. Godot'nun web çıktısı var ama daha ağır; asıl dağıtım indirme ve Steam olur. Geliştirme biraz yavaşlar: her sürüm derlenip paketlenir, görsel ayarlar daha çok Boğaç'ın denemesine dayanır.

### Neden Godot, neden Unity değil (6 Kasım 2026, Boğaç: "ileride bakarız, Unity'ye de geçebiliriz")

Karar şimdilik **Godot**. **Unity açık bir seçenek olarak kalır**, ileride yeniden değerlendirilebilir. **Unreal bu oyun için düşünülmez:** gücü gerçekçi 3D'de, 2D araçları zayıf, editörü çok ağır ve derlemesi yavaş; 2D piksel bir oyun için gereğinden büyük. (Ücreti: oyunun brüt geliri 1 milyon doları geçerse, eşiğin üstündeki gelirin %5'i.)

| | Godot | Unity |
|---|---|---|
| 2D piksel oyun | Çok iyi; piksel hassas çizim, hazır 2D ışık ve gölge | Çok iyi |
| Ücret (2026) | Tamamen ücretsiz, gelir payı yok; MIT lisansı, şartları değişemez | Yıllık gelir ve yatırım 200 bin doların altındaysa ücretsiz (Personal); üstünde ya da **konsola çıkmak için Unity Pro**: kişi başı yılda 2.310 dolar |
| Konsol (PS5, Xbox, Switch) | Motorun kendisinde yok; ücretli dış hizmet (W4 Consoles) | Resmi destek (Pro ile) |
| Dil | GDScript (Python'a ve bugünkü JavaScript'e yakın) | C# |
| Claude ile çalışmak | Çok rahat: sahne, kaynak ve ayar dosyalarının hepsi düz metin; bugünkü tek dosya gibi doğrudan yazılıp değiştirilir | Orta: sahneler ve ayarlar büyük ölçüde editörden yönetilir, Claude'un doğrudan yazması daha zor |
| Hazır eklenti ve kaynak | Daha az | Çok fazla (Asset Store) |
| Bu motorla çıkmış oyun | Daha az, ama artıyor | Çok fazla; olgun ve denenmiş |
| Editör ve derleme | Hafif, hızlı açılır, derleme kısa | Daha ağır |
| Güven | Açık kaynak; bir şirketin kararına bağlı değil | 2023'te "kurulum başına ücret" çıkarmaya kalkıp geri adım attı |

**Godot'nun seçilme sebepleri (bu oyun için):** (1) Claude kodu ve sahneleri doğrudan yazıyor, Boğaç test ediyor; Godot'nun metin dosyaları bu çalışma düzenine en uygun motor ve geçiş süresi buna bağlı. (2) Karanlık, meşale, mor ışık ve kor için 2D ışık hazır. (3) Hiç ücret ya da gelir payı yok. (4) GDScript, bugünkü kodun mantığını taşımayı kolaylaştırıyor.

**Unity'ye ne zaman yeniden bakılır:** konsollar (PS5, Xbox, Switch) birinci öncelik olursa ve Godot'nun ücretli konsol eklentisi yerine resmi konsol desteği istenirse; ya da Unity'nin hazır eklentilerinden birine (ör. çok oyunculu, ileri ışık) gerçekten ihtiyaç doğarsa. O zaman hesaba katılacaklar: konsola çıkmak için yıllık Pro ücreti, C#'a geçiş ve Claude'un editör yerine dosyalardan çalışmasının daha zor olması (geçiş süresi Godot tahmininden uzun olur). Taşımanın hazırlık aşaması (çizimlerin PNG'ye, seslerin WAV'a, verilerin ayrı dosyalara dökülmesi) iki motor için de aynıdır; bu yüzden o aşama karar değişse de boşa gitmez.

Fiyatlar 2026 listeleridir; geçişten önce yeniden bakılır.

### İşin büyüklüğü (4 Kasım 2026, Versiyon 3.25 itibarıyla)

| Ne | Bugün | Godot'da |
|---|---|---|
| Kod | Tek dosya, ~19.500 satır, 144 kod bloğu, JavaScript | GDScript ile baştan yazılır (otomatik çeviri yok) |
| Çizimler | Neredeyse hepsi kodla çiziliyor | Oyundan otomatik olarak PNG'ye dökülür, Godot'ya resim olarak girer |
| Sesler | Kodla üretiliyor | WAV dosyası olarak kaydedilip taşınır |
| Menüler, pencereler | Tarayıcı sayfa öğeleri | Godot arayüz sistemiyle baştan |
| Veriler (eşyalar, tarifler, canlılar, görevler, yetenekler) | Kodun içinde tablolar | Otomatik çıkarılıp Godot veri dosyalarına dönüştürülür |
| Kurallar | Bu belge (~6.400 satır) | Kılavuz olarak aynen kullanılır |

### Sıra ve tahmini süre

**Yalnızca yazılım süresi** (5 Kasım 2026, Boğaç: "testlerini ben yapıcam"): Claude'un kodu yazma süresi; testler ve deneme Boğaç'ta, paralel yürür. Bugünkü çalışma temposuna (her gün birkaç saatlik yoğun çalışma) göre tahmindir.

| Aşama | İçerik | Yazılım süresi |
|---|---|---|
| 0 · Deneme | İlk ada haritası, karakter, yürüme, oyun kolu, bir canlı ve vuruş. Karar noktası: devam mı? | 1–2 gün |
| 1 · Hazırlık | Bütün çizimlerin ve seslerin dökülmesi, verilerin çıkarılması, Godot projesinin iskeleti, otomatik derleme (Windows ve web) | 2–3 gün |
| 2 · Çekirdek | Harita ve biyomlar, hareket, çarpışma, kamera, gün-gece, karanlık ve ışık, toplama, envanter, alet kemeri, el yapımı, kayıt | 1 hafta |
| 3 · Dövüş | Silahlar ve kademeleri, kombolar, savaş çekici ve topuz, yay ve oklar, asalar, etkiler, savuşturma, takla, ulti, canlıların yapay zekâsı, reisler, arena | 1 hafta |
| 4 · İçerik ve hikâye | Kişiler ve konuşmalar, ana ve yan görevler, mağaralar, anılar ve ara sahneler, ACT 1 ve ACT 2 adaları, deniz yolculuğu, pazar ve ekonomi, 90 yetenek, 42 başarım | 2 hafta |
| 5 · Arayüz ve platform | Ana menü, ayarlar, tuş atama, oyun kolu, dokunmatik, Steam (başarımlar, bulut kayıt) | 4–5 gün |
| **Toplam yazılım** | | **yaklaşık 5–6 hafta** |

- Boğaç'ın testlerinden çıkan hataların düzeltilmesi bu sürenin içinde, aşamalar ilerlerken yapılır. Aşamalar sırayla gider; her aşamanın sonunda oynanabilir bir sürüm çıkar.

- **Konsol için ek:** PS5 başvurusu, kit ve sertifikasyon bu sürenin dışında (bkz. PlayStation 5 sürümü); Godot'nun konsol eklentisi (W4 Consoles) yıllık ücretlidir.
- **ACT 3:** henüz yazılmadı. Taşımadan önce bitirilirse taşıma süresine eklenir (iki kez yazılmaz). Taşıma sürerken web sürümüne yeni özellik eklenirse o özellik Godot'da da yazılır; bu yüzden taşıma sırasında web sürümü yalnızca hata düzeltmeleriyle sürer.

### Kredi (Claude kullanımı)

- Kesin kredi miktarı bilinmiyor: kullanım hesabın planına ve günlük sınırlara göre değişir, Claude bunu buradan göremez.
- Ölçü olarak: taşıma, **bugünkü yoğunlukta 5–6 haftalık kullanım** kadardır (son haftalardaki gibi her gün uzun oturumlar). Oturum başına iş miktarı, bir büyük web güncellemesi kadardır.
- Kredinin bir kısmı kod yazmaya değil, Godot'da görülmeden yapılan işin doğrulanmasına gider (derleme, ekran görüntüsüyle kontrol). Boğaç'ın erken ve sık denemesi bu kısmı küçültür.

### Önerilen başlangıç

1. **Aşama 0 (deneme)** web sürümünü durdurmadan yapılır; sonucuna göre karar verilir.
2. Tam taşımaya ACT 3'ün tasarımı belgede netleşince geçilir. Web sürümü dondurulur, yalnızca hata düzeltmesi alır.
3. **Steam'e erken çıkmak** istenirse, beklemeden bugünkü oyun bir kabukla (Electron) Steam'e konabilir; Godot sürümü hazır olunca güncelleme olarak onun yerini alır.


## PlayStation 5 sürümü (hedef, henüz başlanmadı)

**Karar (4 Kasım 2026, Boğaç):** Purple Light'ın PS5'e de çıkması isteniyor. Bu bölüm o yolun planıdır: nereye, nasıl başvurulur, oyunda neyin değişmesi gerekir. Bilgiler Kasım 2026'da Sony'nin ve oyun motorlarının yayımlanmış sayfalarından derlendi; başvurudan önce güncel hâli PlayStation Partners sitesinden yeniden kontrol edilir. Sony'nin ayrıntılı belgeleri (teknik kurallar, ücretler, gelir payı) gizlilik sözleşmesi altındadır, burada yalnızca açık bilgiler var.

### Neden bugünkü oyun doğrudan PS5'e gidemez

- PS5 yalnızca Sony'nin imzaladığı yazılımları çalıştırır; USB'den ya da tarayıcıdan bir HTML oyunu "kurulamaz". PS5'in gizli tarayıcısı resmî değildir, oyun dağıtımı için kullanılamaz.
- Purple Light tek bir HTML/JavaScript dosyasıdır (bkz. **Teknoloji · Kullanılan teknolojiler**). PS5 sürümü için oyun, PS5 desteği olan bir **oyun motoruna taşınır** (kod yeniden yazılır).
- Geliştirme ve deneme normal PS5'te değil, Sony'nin verdiği **geliştirme kiti (DevKit)** ve **test kitinde (TestKit)** yapılır. Bunlar yalnızca Sony'nin onayladığı geliştiricilere verilir.

### Yol haritası

| Adım | Ne yapılır | Not |
|---|---|---|
| 1. Oyunu bitir | ACT 1–3 tamam, oynanabilir sürüm. | Başvuruda en güçlü kanıt çalışan bir sürümdür. |
| 2. Şirket | Başvuru şirket/stüdyo bilgisi ister; genelde tüzel kişilik gerekir. | Türkiye'de şahıs şirketi mi limited mi yeteceği Sony'nin formunda ve bir mali müşavirle kontrol edilir. Stüdyo adı, web sitesi, kurumsal e-posta hazır olur. |
| 3. Motor seçimi ve taşıma | Oyun Godot, Defold, Unity ya da GameMaker'a taşınır; önce PC'de çalışır. | Aşağıda **Motor seçenekleri**. |
| 4. PC'de yayın (önerilen) | Steam'de mağaza sayfası, fragman, demo. | İlgi (istek listesi, oyuncu yorumları) hem Sony başvurusunu hem yayıncı görüşmelerini güçlendirir. |
| 5. PlayStation Partners kaydı | https://partners.playstation.net/ (kayıt: register.playstation.net/partnership). Ortaklık türü seçilir, şirket bilgileri girilir. | Başvuru ücretsizdir. |
| 6. İlk başvuru | Kısa proje özeti: tür ve stil, yaklaşık çıkış tarihi, başka platform planı, oyunu ayıran 1–2 özellik. | Sony bu aşamada uzun anlatım istemiyor. |
| 7. Sözleşme | Onay gelirse lisans ve gizlilik sözleşmeleri imzalanır. | Gelir payı ve şartlar sözleşmede yazar. |
| 8. DevNet ve kitler | PS5 DevNet'e (araçlar, belgeler, forum) erişim açılır. Kit istenir. | Sony 2022'den beri yeni kaydolan ve oyun fikri kabul edilen geliştiricilere **bir PS5 geliştirme kiti ve bir test kitini ücretsiz ödünç** veriyor (en çok 2 yıl, sonra iade). Programın sürüp sürmediği başvuruda sorulur. |
| 9. Motorun PS5 eklentisi | DevNet'te Development → Tools & Middleware → motorun sayfası → "Confirm status". Motor firması lisansı açar. | Godot için W4 Games, Unity için Unity Pro, GameMaker için Enterprise aboneliği gerekir. |
| 10. PS5'e özel işler | Kupalar, kayıt sistemi, DualSense, performans, yaş derecelendirmesi, mağaza sayfası, diller. | Aşağıda **PS5 için oyunda değişecekler**. |
| 11. Sertifikasyon | Sony'nin teknik ve içerik kontrolü; hata çıkarsa düzeltilip yeniden gönderilir. | Kurallar DevNet'te; erken okunur. |
| 12. Yayın | PlayStation Store'da çıkış. | |

**Alternatif yol: yayıncı ya da port şirketi.** Oyun PC'de ilgi görürse bir yayıncı ya da konsol port şirketi PS5 sürümünü, Sony başvurusunu, kitleri ve sertifikasyonu üstlenebilir (gelir paylaşılır). Küçük stüdyoların konsola çıkışında en yaygın yol budur (ör. Balatro, Playstack ile).

### Sony'ye sunum (pitch) dosyası

Sony'nin yayımladığı rehbere göre ayrıntılı sunumda olması gerekenler, Purple Light için karşılıklarıyla:

| Sony'nin istediği | Purple Light için |
|---|---|
| Kısa tanıtım ve oyunu farklı kılan şey | Hayatta kalma + üretim + hikâye; kayıp sevgilinin anıları, mor ışık gizemi, el yapımı piksel dünya. |
| Neden PlayStation'a uygun | Kolla oynanacak biçimde tasarlandı (oyun kolu düzeni), DualSense titreşimi, 46 başarımın kupaya dönüşmesi. |
| Ekip ve geçmiş | Boğaç (tasarım, yönetim), stüdyo bilgileri. |
| Çalışan sürüm ya da oynanış videosu | Yayındaki oyun (https://bogacavdar.github.io/purple-light/), PC sürümü, fragman. Sony çalışan sürümü en iyi sunum sayıyor. |
| İş soruları | Diğer platformlar (PC/Steam), hedef pazarlar, diller (Türkçe, İngilizce), iş modeli (tek seferlik satış), istenen destek, geliştirme ve pazarlama bütçesi, çıkış sonrası güncelleme planı (ACT 3). |

### Motor seçenekleri

| Motor | PS5 için ne gerekir | Purple Light'a uygunluğu |
|---|---|---|
| **Godot** | Açık kaynak, ücretsiz. PS5 desteği W4 Games'in **W4 Consoles** eklentisiyle: 8 kişiye kadar ekipte tek platform yılda 800 $ (2 platform 1.500 $, 3 platform 2.000 $; fiyatlar değişebilir). | 2D piksel oyun için iyi; en olası seçim. |
| **Defold** | Ücretsiz. PS5 eklentisi, Sony onayı DevNet'te doğrulanınca verilir. | 2D'ye uygun, hafif; topluluğu küçük. |
| **Unity** | PS5 için Unity Pro ya da Enterprise aboneliği. | Güçlü ama 2D piksel oyun için ağır ve pahalı. |
| **GameMaker** | Konsol için Enterprise aboneliği. | 2D'ye çok uygun; abonelik ücretli. |

Taşırken yeniden kullanılacaklar: bu tasarım belgesi (oyunun tam tanımı), bütün sayılar ve tablolar, harita verisi, metinler, piksel çizimler (dışa aktarılarak), müzik ve ses tasarımı. Yeniden yazılacak olan: kod.

### PS5 için oyunda değişecekler

- **Kupalar (Trophies):** 46 başarım PS5 kupalarına eşlenir; Platin zaten oyunda var. Sony'nin kupa kuralları (sayı, dağılım) DevNet'te.
- **Kontroller:** oyun kolu düzeni (**Sistemler › Oyun kolu**) temel alınır; DualSense'in dokunmatik yüzeyi, hoparlörü, tetik direnci isteğe bağlı eklenir. Klavye/fare ekranları ve dokunmatik düğmeler kaldırılır.
- **Kayıt:** tarayıcı kaydı yerine PS5'in kayıt sistemi; bulut kaydı.
- **Arayüz:** televizyonda uzaktan okunabilir yazı boyları; bütün menüler kolla gezilir; ekranda tuş simgeleri PlayStation'ınki (✕ ○ □ △).
- **Performans:** sabit kare hızı (en az 30, hedef 60 kare/sn), hızlı yükleme.
- **Yaş derecelendirmesi:** Avrupa ve Türkiye için PEGI, ABD için ESRB (IARC üzerinden ya da Sony'nin yönlendirmesiyle). İçerik (dövüş, kan efekti) buna göre gözden geçirilir.
- **Diller:** en az Türkçe ve İngilizce.
- **Mağaza:** kapak görselleri, fragman, açıklama, fiyat.

### Kaynaklar

- PlayStation Partners: https://partners.playstation.net/
- Sony, ücretsiz geliştirme donanımı (2022): https://sonyinteractive.com/en/news/blog/complimentary-development-hardware/
- Sony'nin sunum rehberi (WN Hub özeti): https://wnhub.io/news/stores-and-publishing/item-18374
- Defold PlayStation kılavuzu: https://defold.com/manuals/sony-playstation
- GameMaker konsol başvurusu: https://gamemaker.io/en/help/articles/application-process-for-console-access
- Unity, PlayStation geliştirme: https://support.unity.com/hc/en-us/articles/212064606-How-do-I-develop-to-PlayStation-platforms
- W4 Consoles fiyatları: https://gamefromscratch.com/w4-games-release-godot-w4-console-pricing/
