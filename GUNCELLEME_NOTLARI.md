# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 5.32 · 27 Kasım 2026

### Proje
- **Godot: kontroller:**
  - Bir kişiye, kazana, çalıya ya da yerdeki eşyaya tıklayınca karakter oraya yürüyüp konuşuyor ya da topluyor.
  - H eli boşaltıyor, Alt + Enter tam ekrana alıyor.
  - Kemer yuvasına sağ tıklayınca o yuvaya ne gireceğini seçiyorsun; sol tık o aleti eline alıyor.

## Versiyon 5.31 · 27 Kasım 2026

### Proje
- **Godot: ekran düzeni:**
  - Sol üstte adları yazılı büyük Can, Enerji ve Tokluk çubukları; altında kare düğmeler: Envanter, El yapımı, Yetenekler, Yemek.
  - Sağ üstte Çıkış, Ayarlar ve Başarımlar; sağ altta Almanak'ın yanında Tarif kitabı.
  - Ekrandaki uzun tuş yardımı kalktı; tuşlar Ayarlar › Kontroller'de.
  - Pencereler kenarından tutulup çekilerek büyütülebiliyor.

## Versiyon 5.30 · 27 Kasım 2026

### Proje
- **Godot: yeni envanter penceresi:**
  - Solda sekmeli eşya listesi, sağda giyim figürü ve karakter. Giysiyi figürdeki yuvaya, aleti alttaki kemere sürükleyebiliyorsun. Seçili eşyanın bilgisi ve düğmeleri (Ye, Giy, Eline al…) altta.
  - Aynı şeyi art arda toplayınca bildirim "+2, +3 Odun" diye birikiyor.

## Versiyon 5.29 · 27 Kasım 2026

### Proje
- **Godot: fare imleci ve köpek günlüğü:**
  - Fare imleci artık mor ışıkta piksel bir el; toplanacak ya da konuşulacak bir şeyin üstüne gelince el açılıyor.
  - Robot köpeklerin ACT 3 için tuttuğu gizli günlük Godot'ta da tutuluyor (oyunda görünmez).

## Versiyon 5.28 · 27 Kasım 2026

### Proje
- **Godot: küçük eksikler:**
  - F'ye basınca ne olacağı kemerin üstünde yazıyor (topla, kaz, konuş, pişir, mağaraya gir…); yapılamıyorsa neden yapılamadığı sarıyla yazıyor. Yakında canavar varsa vuruşunun hasarı görünüyor.
  - Çanta ve kemerdeki silahların hasarı, zırhların savunması karelerin köşesinde.
  - Canlılar kendi bölgelerinden çıkmıyor; kovalama bölge sınırında bitiyor.

## Versiyon 5.27 · 27 Kasım 2026

### Proje
- **Godot: canlıların sesleri:** Her canlının vurulunca ve ölünce kendi sesi var; saldırmaya hazırlanırken de kendi saldırı sesini çıkarıyor. Canavarlar artık karakterin içine girip dolanmıyor.

## Versiyon 5.26 · 27 Kasım 2026

### Proje
- **Godot: gece beliren yazılımcı:** Gerçek saat gece 02:00 ile 06:00 arasındaysa, oyunun gecesinde bir yerde gözlüklü Boğaç beliriyor. Yanına gidince saatin kaç olduğunu söyleyip oyunu kapattırıyor.

## Versiyon 5.25 · 27 Kasım 2026

### Proje
- **Godot: kıyıya vuran şişeler:** Fırtına dinince kıyıya bazen bir şişe vuruyor. İçinde ada halkının mor ışığa kaybettiği birine yazdığı bir mektup var; okunan mektuplar Kitap › Ada halkı'nda saklanıyor.

## Versiyon 5.24 · 27 Kasım 2026

### Proje
- **Godot: işe yarayan eşyalar ve meşale:**
  - Olta yemleri daha nadir balık getiriyor. Duman fişeği yakındaki canavarları sersemletiyor, Duman tütsüsü saldırganları 2 dakika uzak tutuyor.
  - Bıçaklar avda fazladan deri ve et getiriyor, çantalar bayılınca kaybı azaltıyor, Gübre tarlayı hızlandırıyor, Ok kılıfı yayı hızlandırıyor, Golem feneri hiç sönmüyor.
  - Elinde silah yokken yanan meşalenle vurabiliyor ve canavarı tutuşturabiliyorsun. L ile meşaleye reçine sürüp tazeliyorsun.
  - Közlenmiş yiyeceklerin resimleri geldi.

## Versiyon 5.23 · 27 Kasım 2026

### Proje
- **Godot: kamp ateşi ve ateşte pişirme:**
  - Kamp ateşi kemere giriyor; elindeyken vur ya da V ile önüne kuruluyor. Işık veriyor, yanında gece güvendesin, canın hızlı doluyor; odun atınca uzun yanıyor, yağmurda çabuk sönüyor. Haritada alevle görünüyor.
  - Her ateşin başında F ile pişirme menüsü açılıyor: çiğ et ve balığı közlüyorsun, kazanda öğrendiğin ateş yemeklerini pişiriyorsun. Pişen yemek kendiliğinden çantana geliyor.

## Versiyon 5.22 · 27 Kasım 2026

### Proje
- **Godot: yemeklerin etkileri:**
  - Her yiyecek web'deki gibi etki veriyor: Güç, Şifa, Çeviklik, Gece gözü, Doygunluk, Canlılık, Panzehir, Ateş kalkanı, Pıhtı, Dayanıklılık. Zehirli ve tuhaf yiyeceklerin kötü etkileri de var.
  - X'e kısa basınca en uygun yiyecek yeniyor; basılı tutunca kategorili yemek listesi açılıyor. Bir şeyi ilk kez yiyince ne yaptığını öğreniyorsun.
  - Etkin etkiler, çubukların altında süreleriyle görünüyor.

## Versiyon 5.21 · 27 Kasım 2026

### Proje
- **Godot: müzik aletleri çalınıyor:**
  - Flütler, düdük, borazan, zurna, davullar, tef, çanlar ve zil kemere giriyor. Eldeyken vur tuşu aletin kendi ezgisini nota nota çalıyor; her aletin kendi sesi var.

## Versiyon 5.20 · 27 Kasım 2026

### Proje
- **Godot: Tuncay'ın halat yolları:**
  - Doğan'ın "Dağ yolu" görevinden sonra Dağcı Tuncay, Kayalık Dağ'daki kuzenlerin ocağının yanında halat satıyor.
  - Üç kestirme kurulabiliyor. Direğin dibinde F'ye basınca halatla öbür uca hızla kayıyorsun; kayarken canavarlar sana dokunamıyor.
  - Kurulu halatlar iki haritada da kesik mavi çizgiyle görünüyor.

## Versiyon 5.19 · 27 Kasım 2026

### Proje
- **Godot: üşüme ve ayak izleri:**
  - Kışın donarken karakter üşüyor, ekranın köşelerinden buz kristalleri büyüyor. Yanan meşale ya da bir ateş ısıtıyor; çok üşürsen can düşüyor.
  - Yürürken yere ayak izi kalıyor. Karda daha büyük ve uzun süre kalıyor, yağmurda çabuk siliniyor.

## Versiyon 5.18 · 27 Kasım 2026

### Proje
- **Godot: mevsimler ve hava geldi:**
  - Yıl 28 gün, her mevsim 7 gün. Gece uzunluğu mevsime göre değişiyor; kışın karın daha çabuk acıkıyor.
  - Toplamada mevsim farkı var: baharda ot, yazın meyve, sonbaharda mantar ve ağaçtan iki kat meyve; kışın meyve yok. Her mevsimin kendi balığı var.
  - Hava sırayla değişiyor: açık, bulutlu, yağmur, fırtına, sis. Kışın soğukta kar ve tipi yağıyor, yer yavaş yavaş beyazlıyor ve sonra eriyor.
  - Yağmurda meşale çabuk bitiyor, tarlalar kendiliğinden sulanıyor, balık daha çabuk vuruyor. Fırtınada şimşek çakıp gök gürlüyor; Kül Diyarı'nda kül fırtınası var.
  - Bataklık ve Kayalık Dağ hep ince bir sis altında; sisli havada her yer sisli, ışıklar sisi açıyor.
  - Mor gece: yılın son gecesi en uzun gece ve mor ışık saldırısı kesin geliyor.
  - Saatin yanında hava, mevsim, sıcaklık ve dönen mevsim çemberi var.

## Versiyon 5.17 · 27 Kasım 2026

### Proje
- **Godot: sesler ve müzik geldi:**
  - Web'deki bütün sesler ve müzikler birebir aynı.
  - Her bölgenin kendi müziği var, bölge değişince yumuşakça geçiyor; Çayır ve Orman'da gece Gece müziği, mağarada Derinlik çalıyor.
  - Bataklık'ta bataklık sesi, Kül Diyarı'nda kül rüzgârı, deniz kenarında hafif dalga sesi var.
  - Toplama, tarif öğrenme, yapma, örs, Vio, seviye, savurma, isabet, darbe, balık, büyü ve Yıldızsız baskını sesleri çalıyor.
  - Ses düzeyi Ayarlar'daki Müzik ve Efekt sürgülerinden.

## Versiyon 5.16 · 27 Kasım 2026

### Proje
- **Godot: silahçılarda bileme ve "Derse dön":**
  - Silahçı kuzenler de körelen aletlerini biliyor ("Aletimi bile").
  - Börü'nün dersinden uzaklaşınca oyun duruyor, Börü soruyor: "Derse dön" seni yanına getiriyor, "Dersi bırak" ödediğin ücreti geri veriyor.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 5.15 · 27 Kasım 2026

### Proje
- **Godot: Balık defteri, Bütün sahneler, konuk kartlar:**
  - Poyraz'la konuşunca "Balık defteri" almanağın Deniz canlıları sayfasını açıyor.
  - Ana menüde `love` yazınca Tarif kitabı › Anılar'ın en üstünde "Bütün sahneler" açılıyor: açılış, deniz yolculuğu, roket, kişilerin hikâyeleri ve bütün anılar; kutuya basınca sahne baştan oynuyor.
  - Bir canlıyı kendi bölgesinin dışında avlarsan almanakta avladığın bölgenin sayfasında da "Başka bölgeden" olarak görünüyor.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 5.14 · 27 Kasım 2026

### Proje
- **Godot: kendi işaretin ve yol gösterme:**
  - T tuşuyla bulunduğun yere adlı, renkli bir işaret koyabiliyorsun (en çok 40).
  - Büyük haritada bir işarete tıklayınca "Yol göster" ya da "Sil"; bir kişiye tıklayınca mavi bir ok seni ona götürüyor. Varınca ok kendiliğinden kalkıyor; sağ tık da kaldırıyor.
  - Haritada bayıldığın yerler, kurduğun evler, yataklar ve balık tuzakları da görünüyor.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 5.13 · 27 Kasım 2026

### Proje
- **Godot: kayıkla gelen yoldaşlar ve Kupa panosu:**
  - Bereket Adası'na kayıkla gidip gelirken yanındaki yoldaşlar ve binek de geliyor.
  - Kupa panosunda yendiğin her Reis için küçük altın bir kalkan beliriyor.
  - Panolu bir eve girince çantandaki mağara boss tılsımları panoya asılıyor ve kalıcı etki veriyor (ör. Dev yüreği tılsımı +80 can).
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---
