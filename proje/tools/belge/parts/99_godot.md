# Gelecek planı: Godot'ya geçiş (henüz başlanmadı)

**Karar (5 Kasım 2026, Boğaç):** oyunun ileride Godot oyun motoruna taşınması planlanıyor. Amaç: Steam'de tam uyum (başarımlar, bulut kayıt, Steam Input), konsollar (bkz. **PlayStation 5 sürümü**), daha iyi performans ve ışık/efekt kalitesi. Bu bölüm işin büyüklüğünü, sırasını ve tahmini süresini yazar. Web sürümü taşıma bitene kadar oynanır ve güncellenir.

## Neden

- **Platformlar:** PS5, Xbox, Switch ancak bir oyun motoruyla; Steam'de başarımlar, bulut kayıt ve Steam Input. Xbox kablosuz aparatının Chrome/Edge'de kolu düşürmesi gibi tarayıcı sorunları kalmaz (bkz. Sistemler › Oyun kolu).
- **Performans:** ekran kartı doğrudan kullanılır; telefondaki donma ve yavaşlama sınırları (bkz. Performans kuralları) büyük ölçüde kalkar.
- **Görsel:** karanlık, meşale, mor ışık, kor ve kristal parıltıları için gerçek 2D ışık ve gölge.
- **Araçlar:** harita karo karo elle boyanabilir, animasyonlar görerek ayarlanır. Telefon için App Store ve Google Play uygulaması çıkar.
- **Kaybedilenler:** bir linkle anında oynama ve anında güncelleme. Godot'nun web çıktısı var ama daha ağır; asıl dağıtım indirme ve Steam olur. Geliştirme biraz yavaşlar: her sürüm derlenip paketlenir, görsel ayarlar daha çok Boğaç'ın denemesine dayanır.

## İşin büyüklüğü (4 Kasım 2026, Versiyon 3.25 itibarıyla)

| Ne | Bugün | Godot'da |
|---|---|---|
| Kod | Tek dosya, ~19.500 satır, 144 kod bloğu, JavaScript | GDScript ile baştan yazılır (otomatik çeviri yok) |
| Çizimler | Neredeyse hepsi kodla çiziliyor | Oyundan otomatik olarak PNG'ye dökülür, Godot'ya resim olarak girer |
| Sesler | Kodla üretiliyor | WAV dosyası olarak kaydedilip taşınır |
| Menüler, pencereler | Tarayıcı sayfa öğeleri | Godot arayüz sistemiyle baştan |
| Veriler (eşyalar, tarifler, canlılar, görevler, yetenekler) | Kodun içinde tablolar | Otomatik çıkarılıp Godot veri dosyalarına dönüştürülür |
| Kurallar | Bu belge (~6.400 satır) | Kılavuz olarak aynen kullanılır |

## Sıra ve tahmini süre

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

## Kredi (Claude kullanımı)

- Kesin kredi miktarı bilinmiyor: kullanım hesabın planına ve günlük sınırlara göre değişir, Claude bunu buradan göremez.
- Ölçü olarak: taşıma, **bugünkü yoğunlukta 5–6 haftalık kullanım** kadardır (son haftalardaki gibi her gün uzun oturumlar). Oturum başına iş miktarı, bir büyük web güncellemesi kadardır.
- Kredinin bir kısmı kod yazmaya değil, Godot'da görülmeden yapılan işin doğrulanmasına gider (derleme, ekran görüntüsüyle kontrol). Boğaç'ın erken ve sık denemesi bu kısmı küçültür.

## Önerilen başlangıç

1. **Aşama 0 (deneme)** web sürümünü durdurmadan yapılır; sonucuna göre karar verilir.
2. Tam taşımaya ACT 3'ün tasarımı belgede netleşince geçilir. Web sürümü dondurulur, yalnızca hata düzeltmesi alır.
3. **Steam'e erken çıkmak** istenirse, beklemeden bugünkü oyun bir kabukla (Electron) Steam'e konabilir; Godot sürümü hazır olunca güncelleme olarak onun yerini alır.
