# Platformlar (Godot · PS5)

## Godot'ya geçiş (aşamalı; 25 Kasım 2026'da başlandı)

**Başlama kararı (25 Kasım 2026, Boğaç: "Aşamalı olarak godot'a taşıyabilir miyiz oyunu?" … "Bence yavaştan başlayalım buna, eninde sonunda yapacağız"):** taşıma **aşamalı ve biyom biyom** yapılır (aşağıda **Sıra ve tahmini süre**). Her adımın sonunda Godot'da oynanabilir bir oyun olur; web sürümü bu sırada yayında kalır ve oynanır. İlk iş **Deneme** adımıdır.

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

### İşin büyüklüğü (25 Kasım 2026, Versiyon 4.39 itibarıyla)

| Ne | Bugün | Godot'da |
|---|---|---|
| Kod | Tek dosya, ~24.900 satır, 226 kod bloğu, JavaScript | GDScript ile baştan yazılır (otomatik çeviri yok) |
| Çizimler | Çoğu kodla çiziliyor; oyuncu karakteri, kişiler, Çayır ve Yankı Mağarası canlıları, ağaçlar ve meyveler ComfyUI resmi (21–22 Kasım 2026) | Retro Diffusion ile yeniden üretilir, Godot'ya PNG olarak girer; yeni resmi olmayan ya da yenisi beğenilmeyen çizim oyundan otomatik PNG'ye dökülür (bkz. Görseller: Retro Diffusion) |
| Sesler | Kodla üretiliyor | WAV dosyası olarak kaydedilip taşınır |
| Menüler, pencereler | Tarayıcı sayfa öğeleri | Godot arayüz sistemiyle baştan |
| Veriler (eşyalar, tarifler, canlılar, görevler, yetenekler) | Kodun içinde tablolar | Otomatik çıkarılıp Godot veri dosyalarına dönüştürülür |
| Kurallar | Bu belge (~7.500 satır) | Kılavuz olarak aynen kullanılır |

### Sıra ve tahmini süre (aşamalı, biyom biyom; 25 Kasım 2026)

**Yalnızca yazılım süresi** (5 Kasım 2026, Boğaç: "testlerini ben yapıcam"): Claude'un kodu yazma süresi; testler ve deneme Boğaç'ta, paralel yürür. Bugünkü çalışma temposuna (her gün birkaç saatlik yoğun çalışma) göre tahmindir.

Taşıma sistem sistem değil **biyom biyom** gider: her adım bir biyomu ve o biyomun ilk kez gerektirdiği sistemleri getirir, adımın sonunda Godot sürümü o biyoma kadar baştan oynanır.

| Adım | Godot'da oynanabilen | Bu adımda yazılan sistemler | Yazılım süresi |
|---|---|---|---|
| 0 · Deneme | Çayır'ın bir parçası: karakter, 8 yön yürüme, oyun kolu ve klavye, bir canlı, vuruş | Proje iskeleti, veri ve harita aktarımı, web derlemesi | 1–2 gün |
| 1 · Çayır | Açılış, Çayır, Yankı Mağarası, Kemal'in görevleri | Hareket, harita, kamera, envanter, toplama, el yapımı, temel dövüş, konuşma, kayıt, ana menü | 1,5–2 hafta |
| 2 · Orman | Orman ve görevleri | İnşa, ev, evcil hayvanlar, gün-gece, karanlık ve ışık | 1 hafta |
| 3 · Bataklık | Bataklık ve mağarası | Silah kademeleri, etkiler, reisler, yan görevler | 1 hafta |
| 4 · Kayalık | Kayalık, halat yolları | Arena, pazar ve ekonomi | 4–5 gün |
| 5 · Kül Diyarı | ACT 1'in tamamı | Ara sahneler, anılar, başarımlar | 1 hafta |
| 6 · ACT 2 | Deniz yolculuğu ve ikinci ada | ACT 2'ye özel sistemler | 1,5 hafta |
| 7 · Platform | Steam (başarımlar, bulut kayıt), dokunmatik, telefon uygulaması | Mağaza ve derleme | 4–5 gün |
| **Toplam yazılım** | | | **yaklaşık 7–8 hafta** (yayılarak) |

- **Taşıma sürerken web sürümü:** yayında kalır. Godot'ya taşınmış biyomlara web'de yalnız hata düzeltmesi ve denge ayarı yapılır (yeni sistem eklenirse iki kez yazılır); henüz taşınmamış biyomlara web'de yeni özellik eklenebilir.
- **Veriler tek yerde:** eşyalar, tarifler, fiyatlar, canlılar, görevler ve harita web oyunundan otomatik çıkarılıp Godot'ya aktarılır; web'de bir sayı değişince Godot da aynı aktarımla alır.
- **Kayıtlar:** web kaydı dosyaya alınıp Godot'da açılabilir; ilerleme kaybolmaz.
- **Görseller:** her biyom taşınırken o biyomun resimleri yeni tarzla (ComfyUI; Retro Diffusion kararı için aşağıdaki Görseller bölümü) yenilenir; resimler iki kez yapılmaz. Web'de zaten ComfyUI'de çizilmiş olanlar (oyuncu karakteri, kişiler, Çayır ve Yankı Mağarası canlıları, ağaçlar, meyveler) aynen taşınır.
- **Nerede:** Godot projesi depoda ayrı `godot` dalında durur (yayını etkilemez). Deneme ve adımların web derlemesi oynanabilir bir linkle Boğaç'a verilir. Godot (4.7.1) Claude'un çalışma ortamında da çalışır; derleme ve ekran görüntüsüyle kontrol orada yapılır.
- Boğaç'ın testlerinden çıkan hataların düzeltilmesi bu sürenin içinde, aşamalar ilerlerken yapılır.

- **Konsol için ek:** PS5 başvurusu, kit ve sertifikasyon bu sürenin dışında (bkz. PlayStation 5 sürümü); Godot'nun konsol eklentisi (W4 Consoles) yıllık ücretlidir.
- **ACT 3:** henüz yazılmadı. Web'de yazılırsa ACT 2'den sonra ayrı bir adım olarak taşınır; doğrudan Godot'da yazılırsa iki kez yazılmaz.

### Kredi (Claude kullanımı)

- Kesin kredi miktarı bilinmiyor: kullanım hesabın planına ve günlük sınırlara göre değişir, Claude bunu buradan göremez.
- Ölçü olarak: taşıma, **bugünkü yoğunlukta 5–6 haftalık kullanım** kadardır (son haftalardaki gibi her gün uzun oturumlar). Oturum başına iş miktarı, bir büyük web güncellemesi kadardır.
- Kredinin bir kısmı kod yazmaya değil, Godot'da görülmeden yapılan işin doğrulanmasına gider (derleme, ekran görüntüsüyle kontrol). Boğaç'ın erken ve sık denemesi bu kısmı küçültür.

### Görseller: Retro Diffusion (12 Kasım 2026, Boğaç)

Oyunun görselleri Godot'ya geçişle birlikte **Retro Diffusion** (piksel sanatına özel yapay zekâ, abonelik yok, resim başına ödeme, lisanslı verilerle eğitilmiş) ile yenilenir. Sıra: **oyun web'de biter → Godot denemesi (Aşama 0) yeni görsellerle → taşıma ve görseller birlikte**. (25 Kasım 2026: Boğaç taşımaya oyun web'de bitmeden, aşamalı başlama kararı verdi; sıra yukarıda. 21–22 Kasım'dan beri web'deki yeni resimler Boğaç'ın isteğiyle onun bilgisayarındaki ComfyUI'de Claude tarafından üretiliyor; Deneme bu resimlerle yapılır. Retro Diffusion ya da PixelLab ile karşılaştırma isteğe bağlı kalır.) Web sürümüne yapay zekâ resimleri yalnız Boğaç istediğinde ve küçük sayfalar halinde eklenir (bkz. Eşyalar › PixelLab ikonları); bütün oyunu web'de yenilemek yapılmaz: tek dosyalı web oyununa yüzlerce PNG gömmek dosyayı şişirir, telefonda açılışı yavaşlatır ve Godot'da iş iki kez yapılmış olur. Web'e eklenen sayfalar Godot'da aynen kullanılır.

- **Araç:** Retro Diffusion ya da PixelLab; Boğaç'ın PixelLab'da ürettiği ilk 64 ikonluk sayfa (12 Kasım 2026) tarz örneğidir, sonraki her istekte referans olarak verilir. Aşama 0'da ikisi aynı eşyalarla karşılaştırılır.
- **Aşama 0:** tek biyomun eşya ikonları, bir canlı ve zemin karoları Retro Diffusion ile üretilir, koddan dökülmüş eski resimlerle yan yana gösterilir. Boğaç hem Godot'ya geçişe hem yeni görsellere aynı denemede karar verir.
- **Taşıma:** "evet" denirse çizimler Godot'ya girerken biyom biyom yenileriyle değiştirilir; eskiler önce taşınıp sonra ayrıca değiştirilmez.
- **Kim üretir:** Claude'un çalıştığı ortam Retro Diffusion'a erişemez; resimleri Boğaç üretir, Claude PNG'leri Godot'ya yerleştirir, boyut ve paleti düzeltir, karşılaştırma sayfası hazırlar.
- **Birlik:** bütün resimler tek palet ve tek tarz kuralıyla üretilir (aynı ışık yönü, aynı çizgi kalınlığı, tepeden bakış). Uymayan resim kullanılmaz.
- **Oyuncunun üstündeki eşyalar:** zırh, kask ve silah oyuncunun üstüne bugünkü gibi katman katman çizilir; oyuncunun her hareketi her eşya için yeniden üretilmez.
- **Steam:** oyunda yapay zekâyla üretilmiş içerik varsa Steam mağaza sayfasında beyan istenir; Steam'e çıkmadan önce kuralın güncel hali kontrol edilir.

**Tahmini maliyet** (Versiyon 4.17 sayılarıyla, ortalama 2,5 deneme; tek denemede yaklaşık 85 $, bol denemeyle 350–400 $):

| Görsel | Adet | Beklenen |
|---|---|---|
| Eşya ikonları (32×32) | 1.239 | 62 $ |
| Yetenek ve başarım ikonları | ~150 | 7,5 $ |
| Canlılar (resim, 4 yönlü yürüme, saldırı; reisler aynı resmi büyütüp renklendirir) | 76 | 46 $ |
| Kişiler (resim, yürüme, konuşma yüzü) | ~55 | 14 $ |
| Oyuncu hareketleri | ~15 | 11 $ |
| Reisler ve uzaylılar (büyük) | ~10 | 28 $ |
| Ağaçlar (normal ve kesilmiş) | ~60 | 9 $ |
| Bitki ve maden kaynakları | ~130 | 6,5 $ |
| Yerleştirilen eşyalar, evler, yapılar | ~100 | 7,5 $ |
| Zemin karoları (12 biyom, mağaralar, geçişler) | ~30 set | 9 $ |
| Efektler | ~30 | 5 $ |
| **Toplam** | | **~205 $** |

Yalnız ACT 1 yapılırsa yaklaşık 100 $. Reislere ayrı resim +14 $, arka plan temizleme +18 $.


### Adım 0 · Deneme (25 Kasım 2026, yapıldı)

Godot 4.7.1 projesi `godot` dalında (`godot/`). Oynanır hali: https://bogacavdar.github.io/purple-light/godot-deneme/ (tek iş parçacıklı web derlemesi; ilk açılışta motor ~10 MB iner).
- **Aktarım:** `godot/tools/disa_aktar.js` web oyununu açıp haritayı (başlangıç çevresinde 80×60 karelik Çayır parçası), zemin karolarını, oyuncu karakterinin 8 yön × 5 karesini, Tavşan ve Kurt'un resimlerini ve sayılarını, ağaçları ve yerdeki toplanabilirleri oyunun kendi verisinden döker; elle yazılmış sayı yoktur.
- **Oynanış:** web'deki tuşlarla 8 yön yürüme, Shift ile koşu, Boşluk ile atılma, Q ya da sol tık ile vuruş; oyun kolu (sol çubuk, L3, X/RT, B). Su ve ağaç gövdesi geçilmez, arkasındaki oyuncuyu ağaç yarı saydam gösterir. Tavşan kaçar; Kurt görünce kovalar, kırmızı "!" ile atılıp ısırır; can bitince karakter başlangıçta uyanır. Vurulan canlı beyaz parlar, can çubuğu ve hasar sayısı çıkar, ölen canlı devrilir.
- **Denemeye özel (web'de yok):** Kurt gündüz de vardır (ölünce 12 sn sonra yenisi gelir); 1 tuşu (kolda Y) yumrukla Taş kılıç arasında geçiş yapar.
- **Bu adımda yok:** toplama, envanter, düşen eşyalar, savuşturma, ulti, gün-gece ve ışık, sesler, dokunmatik düğmeler (Adım 1 · Çayır'da gelir).

### Başlangıç (25 Kasım 2026)

1. **Deneme (Adım 0):** web sürümünü durdurmadan Çayır'ın bir parçasıyla yapılır; ComfyUI'de çizilmiş karakter ve canlılarla. Sonucu Boğaç oynar; Adım 1'e geçmeye o karar verir.
2. **Steam'e erken çıkmak** istenirse, beklemeden bugünkü oyun bir kabukla (Electron) Steam'e konabilir; Godot sürümü hazır olunca güncelleme olarak onun yerini alır.
