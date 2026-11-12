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
| Çizimler | Neredeyse hepsi kodla çiziliyor | Retro Diffusion ile yeniden üretilir, Godot'ya PNG olarak girer; yeni resmi olmayan ya da yenisi beğenilmeyen çizim oyundan otomatik PNG'ye dökülür (bkz. Görseller: Retro Diffusion) |
| Sesler | Kodla üretiliyor | WAV dosyası olarak kaydedilip taşınır |
| Menüler, pencereler | Tarayıcı sayfa öğeleri | Godot arayüz sistemiyle baştan |
| Veriler (eşyalar, tarifler, canlılar, görevler, yetenekler) | Kodun içinde tablolar | Otomatik çıkarılıp Godot veri dosyalarına dönüştürülür |
| Kurallar | Bu belge (~6.400 satır) | Kılavuz olarak aynen kullanılır |

### Sıra ve tahmini süre

**Yalnızca yazılım süresi** (5 Kasım 2026, Boğaç: "testlerini ben yapıcam"): Claude'un kodu yazma süresi; testler ve deneme Boğaç'ta, paralel yürür. Bugünkü çalışma temposuna (her gün birkaç saatlik yoğun çalışma) göre tahmindir.

| Aşama | İçerik | Yazılım süresi |
|---|---|---|
| 0 · Deneme | İlk ada haritası, karakter, yürüme, oyun kolu, bir canlı ve vuruş; tek biyom Retro Diffusion resimleriyle, yanında koddan dökülmüş eski resimler. Karar noktası: Godot'ya geçilsin mi, yeni görseller kullanılsın mı? | 1–2 gün |
| 1 · Hazırlık | Bütün çizimlerin (yeni görsel kararı verildiyse yalnız yenisi gelmeyenlerin) ve seslerin dökülmesi, verilerin çıkarılması, Godot projesinin iskeleti, otomatik derleme (Windows ve web) | 2–3 gün |
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

### Görseller: Retro Diffusion (12 Kasım 2026, Boğaç)

Oyunun görselleri Godot'ya geçişle birlikte **Retro Diffusion** (piksel sanatına özel yapay zekâ, abonelik yok, resim başına ödeme, lisanslı verilerle eğitilmiş) ile yenilenir. Sıra: **oyun web'de biter → Godot denemesi (Aşama 0) yeni görsellerle → taşıma ve görseller birlikte**. Web sürümüne yapay zekâ resimleri yalnız Boğaç istediğinde ve küçük sayfalar halinde eklenir (bkz. Eşyalar › PixelLab ikonları); bütün oyunu web'de yenilemek yapılmaz: tek dosyalı web oyununa yüzlerce PNG gömmek dosyayı şişirir, telefonda açılışı yavaşlatır ve Godot'da iş iki kez yapılmış olur. Web'e eklenen sayfalar Godot'da aynen kullanılır.

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

### Önerilen başlangıç

1. **Aşama 0 (deneme)** web sürümünü durdurmadan, tek biyom Retro Diffusion görselleriyle yapılır; sonucuna göre hem geçişe hem görsellere karar verilir.
2. Tam taşımaya ACT 3'ün tasarımı belgede netleşince geçilir. Web sürümü dondurulur, yalnızca hata düzeltmesi alır.
3. **Steam'e erken çıkmak** istenirse, beklemeden bugünkü oyun bir kabukla (Electron) Steam'e konabilir; Godot sürümü hazır olunca güncelleme olarak onun yerini alır.
