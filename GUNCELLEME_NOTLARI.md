# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 4.21 · 13 Kasım 2026

### Düzeltmeler
- **Purple Light ve CoffeBean artık ayrı uygulama olarak yüklenebiliyor.** İki oyunun uygulama kimliği aynı çıkıyordu; Chrome ikisini tek uygulama sanıyor, biri yüklenince diğerinin yerine geçiyordu (pencerede adı CoffeBean, içinde Purple Light). Purple Light'ın kimliği artık kendi klasörü. Eski karışık uygulama kaldırılıp oyun kendi adresinden yeniden yüklenmeli.

### Tasarım belgesi
- Teknoloji › Uygulama olarak yükleme: uygulama kimliği `/purple-light/` olarak yazıldı.

## Versiyon 4.20 · 13 Kasım 2026

### Oynanış
- **Meyve çalıları:** Böğürtlen, Ahududu, Yaban mersini, Kızılcık, Kuşburnu ve Alıç artık dünyada çalı olarak duruyor.
  - Her çalıdan 3 kez toplarsın: her seferinde yere bir meyve düşer, çalı yerinde kalır ve meyvesi azalmış görünür.
  - Üçüncü toplayışta çalı kaybolur, bir süre sonra kendi biyomunda başka bir yerde yeniden çıkar.
  - Çalının yanına gelince kaç meyve kaldığı yazar ("Böğürtlen çalısından topla (2 kaldı)").
- **Kemal'in ilk dersi:** artık 5 değil **3 böğürtlen** topla ve üçünü de ye; üçü de aynı çalıdan alınabilir.

### Görsel
- Yeni resimler: böğürtlen çalısı ve böğürtlen; diğer beş çalı ve meyveleri aynı resmin kendi rengine boyanmış hali.
- Nehir çakılı, Kuru ot, Kum, Dal ve Yaprak'ın ikonları yenilendi.

### Tasarım belgesi
- Toplama bölümüne "Meyve çalıları" eklendi; öğretici adımları 3 böğürtlene göre, eşya tablosundaki "nereden gelir" satırları çalıya göre güncellendi.

---

## Versiyon 4.19 · 13 Kasım 2026

### Oynanış
- **Hayvanlar seni fark ediyor:** saldırgan bir hayvan seni görünce başında sarı "?" çıkar, bir an durup bakar, sonra saldırır.
  - Dururken çok daha yakına, yürürken biraz daha yakına sokulabilirsin; koşarsan her zamanki uzaklıktan fark edilirsin.
  - Tavşan, keklik gibi zararsız hayvanlar da dururken ve yürürken daha geç kaçar, koşunca daha erken.
- **Nötr hayvanlar uyarıyor:** geyik, karaca, yaban atı, porsuk, öküz gibi bir hayvanın dibine girersen turuncu "!" çıkar, homurdanıp başını sallar. 1,5 saniye içinde uzaklaşmazsan saldırır.
- **Yaralı hayvanlar kaçıyor:** canı çok azalan hayvanların çoğu kan izi bırakarak kaçmaya çalışır; sıkışırsa ya da yetişirsen döner ve dövüşür. İri hayvanlar ve Reisler kaçmaz.
- **Güçlüden çekiniyorlar:** bir biyomun saldırgan hayvanları, o biyoma varış seviyesinin 15 seviye üstündeyken sana kendiliğinden saldırmaz, uzak durur. Vurursan dövüşür.
- **Hayvanlar birbirini avlıyor:** kurtlar tavşan, keklik, bıldırcın ve sincabı; Bataklık kurdu ve Timsah ördeği; Vaşak ve Kartal Ur kekliğini; Gölge kurdu Mor güveyi avlar. Avın leşi yerde kalır: eti yenmiştir, derisini ve tüyünü sen toplayabilirsin.
- **Her hayvanın kendi hamlesi var:**
  - Geyik, Karaca, Yaban atı, Kristal geyik: tekme ve geri sıçrama. Yaban kazı ve Turna kuşu: kanat çırpma.
  - Engerek, Kunduz, Su samuru, Işık tilkisi, Işık engereği: vur-kaç.
  - Yaban domuzu, Muflon, Dağ keçisi, Yaban öküzü: geri geri gidip hücum.
  - Mağara ayısı, Porsuk: ayağa kalkıp iki pençe (ilki sarı, ikincisi kırmızı).
  - Kartal, Kor yarasası: havaya yükselip dalış. Timsah: çamura gömülüp altından saldırı.
  - Kirpiler, Kül böceği: top olup yuvarlanma. Lav kertenkelesi, Kara ejder, Kristal örümcek: kuyruk süpürmesi. Ateş akrebi: zehirli iğne.
- **Kurtlar sürü halinde kuşatıyor:** en yakındaki önünden oyalar, öbürleri yanına ve arkana dolaşıp oradan saldırır.
- **Arkadan uyarı:** arkanda ya da uzakta biri saldırıya hazırlanırken karakterinin çevresinde o yöne bakan renkli bir ok yanıp söner.
- **Kayalık Dağ dengelendi:** Kartal (can 820, hasar 90), Vaşak (880, 95) ve Mağara ayısı (2.100, 115) artık Bataklık ile Kül Diyarı arasında. Reisleri de aynı oranda değişti.
- **Arena:** yeni hamleler ve kurtların kuşatması arenada da var.

### Tasarım belgesi
- Dövüş bölümüne "Hayvanların tutumu" ve "İmza hamleleri ve sürü taktiği" eklendi; Kayalık Dağ canlı tablosu ve Reis tablosu güncellendi.

---

## Versiyon 4.18 · 13 Kasım 2026

### Görsel
- **58 eşyanın yeni resmi var:** PixelLab'da 32×32 çizilmiş yeni ikonlar. Envanterde ve kitapta tam boyda, elde ve yerde küçük görünürler.
  - Bütün baltalar (Taş'tan Obsidyen'e 13 balta).
  - Taş, Bakır, Demir, Çelik, Mor kristal ve Obsidyen kazma.
  - Bakır, Demir, Çelik, Kara çelik ve Mor kristal kılıç, Ejder kılıcı, Demir savaş çekici, Basit yay.
  - Odun, Taş, Çakmaktaşı, Bakır ve Demir cevheri, Taş kömürü, Kuvars, Ametist, Obsidyen, Kızıl ejder pulu.
  - Bakır, Tunç, Demir, Gümüş, Kara çelik ve Altın külçesi.
  - Lif, Halat, Deri parçası, Timsah derisi, Kemik, Keklik tüyü, Kurt dişi, Deri çanta.
  - Ateş, Mana ve Kök özü iksiri, Ekmek, Pişmiş keklik eti, Kızılcık, Meşale.

### Tasarım belgesi
- Eşyalar bölümüne yeni resimli eşyaların listesi eklendi.
- Godot'ya geçiş planına görseller yazıldı: sıra (oyun biter → Godot denemesi yeni görsellerle → taşıma ve görseller birlikte), araç (Retro Diffusion ya da PixelLab; ilk PixelLab sayfası tarz örneği), tahmini maliyet (~205 $, yalnız ACT 1 ~100 $).

---

## Versiyon 4.17 · 12 Kasım 2026

### Oynanış
- **Malzemeler biyomdan biyoma değerleniyor:** bir biyomun eti, derisi, tüyü, yumurtası, dişi, balığı, meyvesi ya da otu artık önceki biyomun sıradan malzemesinden en az %20 daha değerli. Örnekler: Sincap derisi 2 → 6, Dağ keçisi derisi 7 → 36, Kurbağa 2 → 9, Söğüt dalı 1 → 10. Hiçbir malzeme ucuzlamadı.
- **Yaptığın eşyaların fiyatı yine malzemelerinden hesaplanıyor.** 4.16'daki sabit fiyat eğrisi kalktı.
- **Fazla malzeme isteyen tarifler azaldı:** fiyat sırasını bunlar bozuyordu.
  - Tunç külçesi 1 Bakır külçesi ve 1 Kalay külçesi ister (3 Bakır külçesi yerine).
  - Çelik külçesi 1 Demir külçesi ister (2 yerine), Kara çelik külçesi 1 Çelik külçesi ister (2 yerine). Kara çelik külçesi 2.122 → 899.
  - Demir külçesi Taş yerine Odun kömürüyle, Altın külçesi 4 Altın cevheriyle eritiliyor.
  - Çakmaktaşı ve Obsidyen ok ucu 2 pul, Kuvars ok ucu 3 pul ister (8, 11 ve 10 yerine).
  - Bazı kolye ve yüzükler daha az ya da daha çok taş istiyor.
- **Sonuç:** her biyomda karşına çıkan miğfer, zırh, eldiven, çizme, kılıç, savaş çekici, topuz, mızrak, yay, balta, kazma, kolye ve yüzük bir öncekinden pahalı. Aynı biyomda usta parçası metal parçasından pahalı, başlangıç parçaları Bakırdan ucuz.
  - Kılıç: Bakır 346 · Tunç 787 · Demir 1.655 · Çelik 2.583 · Kara çelik 4.949 · Mor kristal 8.242.
  - Oklar tane fiyatıyla: Basit 2, Kara çelik 165, Mor kristal 196.
- Hasar, savunma, bileme ücretleri ve dükkân fiyatları değişmedi.

### Tasarım belgesi
- Aletler'deki "Fiyat basamağı" bölümünün yerine "Fiyat düzeni" geldi; madenler tablosundaki külçe tarifleri ve bütün fiyatlar güncellendi.

---

## Versiyon 4.16 · 12 Kasım 2026

### Oynanış
- **Fiyatlar biyom sırasına oturdu:** her biyomda karşına çıkan eşya bir öncekinden daha değerli.
  - 13 türün her biri set sırasıyla tek bir düzgün fiyat eğrisine oturdu: miğfer, gövde zırhı, eldiven, çizme, kılıç, savaş çekici, topuz, mızrak, yay, balta, kazma, kolye, yüzük.
  - Sonraki biyomun parçası, öncekinin her parçasından pahalı.
  - Aynı biyomda usta parçası, metal parçasından pahalı.
- **Örnekler:**
  - Kara çelik kılıç 11.371 → 5.120, Mor kristal kılıç 8.242 → 9.450, Ametist kılıcı 7.986 → 12.850.
  - Kara çelik savaş çekici 13.965 → 5.900.
  - Kamış çizme 145 → 915.
  - Gölge dişi kolyesi 551 → 280, Ametist yüzük 433 → 1.030.
- **Oklar tane fiyatıyla:** eskiden bir Kara çelik oku 1.823 Vio'ya satılabiliyordu. Artık Basit 2, Bakır 4, Tunç 7, Demir 13, Çelik 25, Kara çelik 48, Mor kristal 90.
- **Külçeler biyom sırasıyla:** Bakır 38 → Altın 1.180.
- **Kısa yaylar** aynı biyomun uzun yayının %60'ı.
- Hasar, savunma, bileme ücretleri ve dükkân fiyatları değişmedi.

### Tasarım belgesi
- Aletler'e "Fiyat basamağı" bölümü; bütün tablolardaki fiyatlar güncellendi.

---

## Versiyon 4.15 · 12 Kasım 2026

### Oynanış
- **Karışık tarifler sadeleşti:**
  - **Taş uçlu balta, kazma ve mızraklar** (Çakmaktaşı, Kuvars, Obsidyen) artık yalnız uç, sap, İp ve en çok bir ek malzeme istiyor; Dal ve Taş istemiyor. Mızraklar etkilerini veren yağı (Bileme macunu, Zehir yağı), Obsidyen balta ve kazma bir Ametist istiyor.
  - **Bütün gövde zırhları** yarı malzemeyle yapılıyor. Örneğin Kara çelik zırh 29 yerine 15 malzeme, Çelik zırh 24 yerine 13 malzeme istiyor.
  - **Ametist kılıcı** 6 yerine 4 malzeme istiyor: Ametist, Kadim odun sapı, Gölge dişi, Mor zehir.
- Fiyatlar ve özellikler değişmedi.

### Arayüz
- **El yapımı listesinin başlıkları eşyanın ne işe yaradığına göre:** "Zanaat" başlığı kalktı.
  - Oklar "Silahlar"da.
  - Çanta, torba, ok kılıfı, bıçaklar, olta yemleri, Gübre, Kaya patlatıcı ve tariflerde alet olarak kullanılanlar (iğne, bileği taşı, havan…) "Aletler"de.
  - Hasırotu yatak "Yapılar ve ev eşyası"nda.
  - İp, hasır, kumaş ve yağ gibi ara parçalar "Malzemeler"de.
  - Kitap'taki Keşif defteri ve ödülleri aynı.

### Tasarım belgesi
- Tarifler'e "Törpüleme" bölümü; değişen tarifler ve malzemelerin kullanıldığı yerler güncellendi. Sistemler › El yapımı kategorili: yeni başlıklar.

---

## Versiyon 4.14 · 12 Kasım 2026

### Oynanış
- **İşe yaramayan 44 eşya oyundan kalktı** (listesi konuşuldu):
  - Süs: boncuklar, taçlar, yelpazeler, muskalar.
  - Aletler: kazıyıcılar, çakmaklar, odun kaşıkları.
  - Ateş: Don yağı mumu, Hasırotu meşalesi, Kozalak ateşi.
  - Taşıtlar: Kızak, Kütük salı, Oyma kano.
  - Kap ve eşyalar: sepetler, kaseler, Kum torbası, Eğrelti yatağı, Yosun yastık, Akrep kabuğu kalkanı ve diğerleri.
  - Yalnız bunlar için yapılan Kristal parçası, Saz örgüsü ve Isırgan lifi de kalktı.
- **Topladığın her malzeme işe yarıyor:** yalnız bu eşyalarda kullanılan 13 malzeme, kendi biyomlarında işe yarayan bir tarife girdi:
  - Akrep kabuğu Kara çelik eldivende, Lav yılanı pulu Kara çelik çizmede, Yarasa kanadı Ejder miğferinde.
  - Gölge pulu Mor kristal çizmede, Ayna ipeği Kristal ipek çizmede, Kristal boynuz Ametist miğferde.
  - Kaya yarasası kanadı Gümüş eldivende, Pirit Pençe kolyede.
  - Kristal çiçeği Ay otu iksirinde, Yıldız çiçeği Gölge iksirinde.
  - Sarkıt Taş kasede, Çam kozalağı Meşalede, Eğrelti Meşe kabuk çizmede.
- Pençe kolyenin fiyatı 57'den 91'e çıktı (Pirit girdi).

### Kayıtlar
- Eski kayıtlarda kalkan eşyalar çantadan, sandıktan, kemerden ve yerden kalkar; elindekiler son fiyatlarıyla Vio olarak ödenir.

### Tasarım belgesi
- Tarifler'e "Ayıklama" bölümü; tarif ve eşya tabloları, sayılar (1.239 eşya, 768 tarif) güncellendi.

---

## Versiyon 4.13 · 12 Kasım 2026

### Oynanış
- **Kaldırılan 47 eşya geri geldi:** 4.12'de kaldırılan boncuklar, taçlar, yelpazeler, kazıyıcılar, çakmaklar, kaşıklar, taşıtlar, sepetler, kaseler ve diğerleri eski tarifleriyle yerinde. Hangilerinin kalkacağına birlikte karar verilecek. (4.12'de bunlar için ödenen Vio sende kalır.)
- **İşe yaramayan eşyalara iş:**
  - **Mağara boss tılsımları Kupa panosuna asılıyor:** Kupa panosu olan bir eve girince çantandaki tılsımlar panoya asılır ve kalıcı etki verir:
    - Kraliçe: +%4 hasar.
    - Çamur Ana: +%25 can yenilenmesi.
    - Dev yüreği: +80 can.
    - Kor tacı: +%6 hasar ve +4 zırh.
    - Işık Yutan kalbi: +40 mana ve +%3 şans.
  - **Olta yemleri:** çantada Sülük yemi ya da Yıldız tozu yemi varken nadir balık gelme şansı artar; her atışta bir yem gider.
  - **Duman fişeği:** elde vur tuşuyla atılır; yakındaki canavarlar 3,5 saniye sersemler.
  - **Duman tütsüsü:** elde vur tuşuyla yakılır; saldırgan canavarlar 2 dakika yaklaşamaz.
  - **Kök özü iksiri:** içilir; +60 can, 10 dakika Şifa ve Canlılık.
  - **Bıçaklar:** çantadaki en iyi bıçak avdan düşen deri, post ve etin bir fazla gelme şansını artırır (%15–35).
  - **Golem feneri:** meşale yuvasına giren, hiç sönmeyen ve tutuşturmayan fener.
  - **Işık fitili:** meşaleyi reçine gibi tazeler.
  - **Ok kılıfı:** çantadayken yay %15 hızlı çekilir.
  - **Deri çanta ve Kenevir torba:** bayılınca kaybedilen pay %20 yerine %10 ya da %15 olur.
  - **Gübre:** ekili tarlayı sularken bir tane gider; o ürün %50 hızlı büyür.
- **Tavşan derisi Kürk eldivende** (5 Tavşan derisi) ve **Közlenmiş kerevit** (+16 tokluk, 2 dakika Çeviklik) 4.12'deki gibi kalıyor.

### Tasarım belgesi
- Tarifler'e "İşe yarayan eşyalar" bölümü; Işık kaynakları tablosuna Golem feneri; Kupa panosuna tılsımlar; eşya dizininde bu eşyaların ne işe yaradığı; tarif ve eşya sayıları (815 tarif, 1.286 eşya) düzeltildi. 4.12'nin "Ayıklama" bölümü kalktı.

---

## Versiyon 4.12 · 12 Kasım 2026

### Oynanış
- **İşe yaramayan 47 eşya oyundan kalktı:** yapılabilen ama hiçbir işe yaramayan eşyalar (takılmayan, kullanılmayan, yenmeyen, kurulmayan) gitti:
  - Süsler: boncuklar, taçlar, yelpazeler, üç muska/tılsım, Boynuz tarak, Tatlısu incisi, Cilalı kristal, Sarkıt parçası, Balık pulu.
  - Dört kazıyıcı, iki çakmak.
  - Don yağı mumu, Hasırotu meşalesi, Kozalak ateşi.
  - Kızak, Kütük salı, Oyma kano.
  - Dört odun kaşığı, Midye kabuğu kaşık, Boynuz kupa, sepetler, Kum torbası, Sünger taşı bileği, Eğrelti yatağı, Yosun yastık, Akrep kabuğu kalkanı, iki kase.
  - Onlar için yapılan Kristal parçası, Saz örgüsü ve Isırgan lifi.
- **Boşta kalan malzemeler işe yarıyor:** yalnız bu eşyalarda kullanılan malzemeler kendi biyomlarındaki zırh, iksir ve aletlerin tarifine girdi:
  - Kürk eldiven artık 5 Tavşan derisiyle yapılıyor.
  - Akrep kabuğu Kara çelik eldivende, Lav yılanı pulu Kara çelik çizmede, Yarasa kanadı Ejder miğferinde.
  - Gölge pulu Mor kristal çizmede, Ayna ipeği Kristal ipek çizmede, Kristal boynuz Ametist miğferde.
  - Kaya yarasası kanadı Gümüş eldivende, Pirit Gümüş çizmede.
  - Kristal çiçeği Ay otu iksirinde, Yıldız çiçeği Gölge iksirinde.
  - Sarkıt Taş kasede, Çam kozalağı Meşalede, Eğrelti Meşe kabuk çizmede.
- **Közlenmiş kerevit:** kerevit eti artık kamp ateşinde közlenebiliyor; yiyince +16 tokluk ve 2 dakika Çeviklik (hareket +%12) veriyor.

### Kayıtlar
- Eski kayıtlarda kalkan eşyalar çantadan, sandıktan, kemerden ve yerden kalkar; elinde olanlar son fiyatlarıyla Vio olarak ödenir.

### Tasarım belgesi
- Tarifler'e "Ayıklama" bölümü; tarif ve eşya tabloları, sayılar (1.239 eşya, 768 tarif) güncellendi.

---

## Versiyon 4.11 · 12 Kasım 2026

### Oynanış
- **Müzik aletleri çalınıyor:** 12 müzik aletinin hepsi eline alınabiliyor (kemere tak, kemerden seç). Eldeyken vuruş tuşu (tık, Vur, Boşluk) aletin sıradaki notasını çalıyor, başının üstünde bir ♪ çıkıyor; art arda basınca aletin kendi ezgisi çalınıyor.

### Ses
- Her aletin kendi sesi var: Kemik flüt tiz bir flüt, Kamış flüt nefesli bir kamış, Kök flütü pes ve tahtamsı, Pişmiş kil düdük okarina gibi, Boynuz borazan pes bir boru, Kor zurnası genizden ve titrek bir zurna, Deri davul tok bir "düm-tek", Yarasa zarı davul daha kuru, Semender derisi tef zilli, Yankı çanı yankılanan, Gümüş çan berrak bir çan, Kristal zil cam gibi parlıyor.

### Tasarım belgesi
- Sistemler'e "Müzik aletleri" bölümü; Eşya dizininde aletlerin türü "çalınır".

---

## Versiyon 4.10 · 12 Kasım 2026

### Oynanış
- **Kolye ve yüzük takılıyor:** giyilecek yuva sayısı 5'ten 7'ye çıktı; Özellikler penceresindeki ve envanterdeki figürde yeni **Boyun** ve **Yüzük** yuvaları var. Arenada da seçilebiliyorlar.
- **Her setin bir kolyesi ve bir yüzüğü var:** 13 setin her birinde bir kolye ve bir yüzük, her birinin kendi etkisi var (can, enerji, mana, zırh, savunma, hasar, hız, toplama hızı, satış fiyatı, şans, can ve enerji yenilenmesi, kanama/yanık/zehir direnci, çamurda yavaşlamamak). Etkiler biyomdan biyoma büyüyor: örneğin Diş kolye +20 can, Ay taşı kolyesi +120 can ve +50 mana; Bakır yüzük satışa +%4, Altın yüzük +%12 satış ve +%4 şans; Ametist yüzük +%10 hasar ve +%4 hız. Hangi parçanın hangi sete ait olduğu ve etkileri tasarım belgesinde (Aletler › Kolye ve yüzükler).
- **Yeni takılar (elle yapılır, kazanda öğrenilir):** Palamut kolyesi, Taş yüzük, Bakır yüzük, Kemik yüzük, Tunç yüzük, Granit yüzük, Demir yüzük, Timsah yüzüğü, Kehribar yüzük, Ejder yüzüğü.
- **Değişen takılar:** Altın kolye artık **Altın yüzük** (2 Altın külçesi, 1 Kehribar), Kristal kolye artık **Kristal yüzük**; Gümüş yüzük Kehribar yerine Yontulmuş kuvars istiyor. Domuz dişi muska ve Kül dişi muska boyna takılıyor.

### Görsel
- Bütün kolye ve yüzüklerin resimleri yeniden çizildi: her kolyenin kendi sarkacı (diş, pençe, inci, kehribar, ay taşı…), her yüzüğün kendi metali ve taşı var.

### Kayıtlar
- Eski kayıttaki Altın kolye ve Kristal kolye kendiliğinden Altın yüzük ve Kristal yüzük oluyor.

### Tasarım belgesi
- Aletler'e "Kolye ve yüzükler" bölümü (yuvalar, etkiler, 13 setin kolye ve yüzüğü, tarifleri, fiyatları); Zırhlar ve Sistemler'de yedi yuva; set 13 parça; Tarifler ve Eşya dizininde yeni ve değişen takılar.

---

## Versiyon 4.09 · 11 Kasım 2026

### Oynanış
- **Her eşyanın tek tarifi var:** aynı eşyayı başka malzemeyle veren 130 ikinci tarif ("Kürk yelek (Sincap derisi ile)" gibi) kalktı. Tarif kitabında, kazanda ve El yapımı listesinde her eşya artık bir kez görünür. Toplam 805 tarif.
- **Kullanılmayan kalan malzemeler kendi biyomlarındaki tariflere girdi:** hayvan derileri kendi biyomunun setinde Deri parçasının yerine geçiyor (örneğin Bakır miğfer Kurt derisiyle, Tunç çizme Yaban domuzu derisiyle, Çelik zırh Yaban öküzü derisiyle, Mor kristal miğfer Gölge postuyla yapılıyor). Tüyler oklara girdi (Tunç okta Bıldırcın, Çelik okta Turna kuşu, Kara çelik okta Yaban kazı tüyü). Merhemler ve boyalar kendi yağlarını istiyor (Kor merhemi Tohum yağı, Mürver boyası Balık yağı). ACT 2'nin malzemeleri de kendi biyomlarının tariflerinde (Barut Kükürt tozuyla, Tabanca Lens ve Yağ birikintisiyle, Meka zırh Mor çekirdek ve Buz kürküyle gibi). Değişen tariflerin hepsi tasarım belgesinin Tarifler bölümündeki "Tek tarif" tablosunda.
- **İki yeni Maden tarifi:** 2 Gök camı parçasından Gök camı, 1 Meteor parçasından Meteor demiri yapılıyor.
- **Bazı eşyalar oyundan kalktı:** hiçbir tarifte yeri olmayan Kavak, Kayın, Ihlamur, Dişbudak, Kızılağaç, Porsuk, Akçaağaç, Kestane ve Ardıç kabuğu (bu ağaçlar artık kabuk düşürmüyor; kabuk yalnız Meşe, Ceviz, Söğüt ve Huş'tan düşüyor), Bazalt ok ucu, Meyve fidanı, Ağ kapanı, Cüruf tuğlası ve Goblin oku (goblin okçusu artık yalnız Goblin kulağı düşürüyor).
- **Durdu'nun "Bileğinin taşı" görevi** Kayın kabuğu yerine 5 Meşe kabuğu istiyor.
- **Fiyatlar:** girdisi pahalılaşan eşyalar biraz pahalandı (örneğin Ateş çiçeği merhemi 398 → 898, Deri tulum 338 → 370, Demir mızrak 771 → 995).

### Kayıtlar
- Eski kayıtta bildiğin ikinci tarifler eşyanın tek tarifine dönüyor; çantandaki, sandığındaki ya da yerdeki kalkan eşyalar son fiyatlarıyla Vio olarak ödeniyor. Bir kez bildirim çıkıyor.

### Tasarım belgesi
- Tarifler'de "Varyant tarifler" bölümünün yerine "Tek tarif" bölümü (kural, hangi malzeme nereye girdi, kalkanlar, fiyatlar); tarif tabloları, Eşya dizini, Aletler (set tarifleri), ACT 1 (ağaç kabukları, Durdu'nun görevleri), ACT 2 biyomları, Mağaralar ve Canavarlar buna göre güncellendi.

---

## Versiyon 4.08 · 10 Kasım 2026

### Oynanış
- **Taş kazma daha ucuz:** tarifi artık yalnızca 1 Sivri taş, 1 Sopa ve 2 İp (2 Dal ve 2 Taş kalktı). Fiyatı 46 → 41 Vio. Sıfırdan yapılınca 10 Taş, 2 Dal ve 7 Lif gidiyor.

- **Işıkçı'nın lambası artık bir yan görev:** Yıldızsız Işıkçı ile konuşup "Bunları bulacağım" deyince **"Hiç bitmeyen ışık"** yan görevi alınıyor; kartta ne kadar Mor kıymık, Gece sefası ve Tunç külçesi topladığın yazıyor. Bu görev biyomun 2 yan görev sınırına sayılmıyor: Yurt'ta iki yan görevin açıkken de üçüncü olarak alınabiliyor. Takas edince görev bitiyor; lambayı önceden almışsan görev bitmiş sayılıyor. Yan görev sayısı 43 oldu.

### Görsel
- **Yıldızsızlar uzaylıya benziyor:** mor ışık saldırısında gelen canlılar baştan çizildi. **Gözcü** saydam kubbeli tek dev gözlü, antenli, dokunaçlı; **sürüngen** uzun başlı, dikenli, sekiz bacaklı; **tükürücü** saplı gözlü, karnında parlayan keseli; **dev** iri kafalı, üç çekik kara gözlü, pençeli. Gözleri yeşil yanıyor (kovalarken kırmızı), çevrelerinde nabız gibi atan parlak mor bir ışık var ve çevrelerini daha geniş aydınlatıyorlar.
- **Mağara boss'ları kendi resimleriyle:** boss'lar artık başka bir canlının büyütülmüş hali değil, her birinin kendine özgü büyük resmi var: **Yaşlı Kök** mor gözlü, yosun taçlı, yürüyen yaşlı bir ağaç; **Çamur Ana** kamış taçlı, gırtlağı şişen dev bir balçık kurbağası; **Dağ Devi** karlı omuzlu, gümüş kristalli, göğsünde mor çatlak olan taştan bir dev; **Kor Kral** lav damarlı, alev taçlı, ateşli asalı bir bazalt kral; **Işık Yutan** altı gözlü, ışığı yutan dişli ağzı ve mor kristalleriyle havada süzülen kapkara bir yaratık. Hepsi kıpırdıyor, can çubukları başlarının üstünde; almanakta ve leşlerinde de aynı resim var.
- **Mağara yarasaları gerçek yarasa:** sivri kulaklı, iri gözlü, dişli, kemikleri belli zar kanatlı; kanatlarını üç kareyle çırparak uçuyor, gölgesi tam altında. Leşi dönmeden yere süzülüp kanatları açık halde **gölgesinin üstüne** düşüyor (önceden havada, gölgesinden ayrı yerde kalıyordu). Yankı Kraliçesi aynı yarasanın büyük, mor ve taçlı hali.
- **Kör kertenkele ve Taş örümceği:** kertenkele artık uzun gövdeli, dört pençeli bacaklı, sallanan kuyruklu, soluk pembe ve kör gözlü; örümcek iri karınlı, sekiz eklemli bacaklı, kırmızı gözlü. İkisi de yürürken bacak oynatıyor, leşleri yuvarlanmadan yere yatıyor.
- **Silah ve alet resimleri baştan çizildi:** balta, kazma, mızrak, kılıç, savaş çekici ve topuz artık başının şeklinden hemen ayırt ediliyor (balta yana açılan ağız, kazma iki yana kıvrılan kollar, mızrak yaprak uçlu uzun sap, kılıç namlu ve balçak, savaş çekici iri köşeli baş, topuz yuvarlak çıkıntılı baş). Setin rengi başında; güç arttıkça büyüyor ve süsleniyor: taş setler ip bağlı tahta saplı, ortadakiler metal bilezikli, üst setler çift ağızlı ve sargılı, en güçlüler kara saplı, altın süslü ve değerli taşlı.

### Düzeltmeler
- **Mağarada duvarın ardına vurulmuyor:** mağara duvarının köşesinden, canlı sana ulaşamazken ona vurabiliyordun; artık aranızda duvar varsa vuruşun (yakın dövüş ve hamleler) değmiyor.
- **Mağarada su alınmıyor:** mağaranın içindeyken dışarıdaki göl ya da denizden su alınabiliyor, olta atılabiliyordu; artık mağarada su yok.
- **Mağara canlıları almanakta sayılıyor:** mağarada avladığın canlılar biyomun sayfasının altında duruyordu ama soldaki sayıya eklenmiyordu ("Çayır 0/8"); artık sayılıyorlar. Mağaradayken almanak o mağaranın bölümünde açılıyor.
- **Leşler gün dönümünde kaybolmuyor:** gece yarısından sonra avladığın canlıların leşleri sabah "N. Gün" yazısı çıkınca bir anda kayboluyordu; artık yine 4 oyun saati yerde kalıyor. Evcil hayvanların büyümesi ve tarladaki fidanlar da aynı saatle sayılıyor.

### Oynanış
- **Almanakta tatlı su balıkları:** almanakta yeni bir **🎣 Tatlı su balıkları** sayfası var. Nehirde ve gölde tutulabilen 13 balık sularına göre dizili; tuttuğun balığın kartı açılıyor (nerede tutulur, fiyatı, zorluğu, tarifleri, kaç tane tuttuğun), ilk tuttuğunda "Almanağa eklendi" yazıyor. Eski kayıtlarda bugüne kadar tuttukların açık geliyor.

### Arayüz
- **El yapımı başlık başlık:** liste artık türlere ayrılıyor: Silahlar, Zırh ve giyim, Aletler, Ateş ve ışık, Yiyecek ve şifa, Büyü ve tılsım, Yapılar ve ev eşyası, Taşıtlar, Süs, boya ve müzik, Zanaat, Malzemeler. Her başlıkta önce yapabildiklerin geliyor. Uzun adlar artık düğmeleri dışarı itmiyor.
- **Yetenek alınca ekran kaymıyor:** yetenek ağacında bir yetenek alınca pencere aşağı kayıyordu; artık olduğu yerde kalıyor.
- **Tarif kitabının bilgi kutusu hep aynı boyda:** hangi tarifin üstüne gelirsen gel kutu aynı yükseklikte duruyor, altındaki kareler kaymıyor. Kapalı tariflerde de silahın özellikleri resmin altına sıkışmak yerine küçük kartlarla malzemelerin altında yazıyor; zırhta 🛡 işareti çıkıyor.
- **El yapımında silah özellikleri kartta:** bir silahın ya da zırhın üstüne gelince hasar, vuruş hızı, menzil, kritik ve keskinlik artık satırın altına eklenmiyor; açılan malzeme kartında, malzemelerin altında yazıyor (telefonda dokununca açılan kutuda). Liste oynamıyor.

### Tasarım belgesi
- Sistemler › Mor ışık saldırıları'na Yıldızsızların görünüşü; ACT 1 › Mağaralar'a "Boss'ların görünüşü" tablosu; Yan görevler'e Işıkçı istisnası (2 sınırına sayılmayan yan görev, toplam 43); Akış'ta Işıkçı satırı.
- Tarifler ve Eşya dizininde Taş kazmanın tarifi ve fiyatı güncellendi; Sistemler › El yapımı'na "özellikler kartta" ve "tarif kitabının bilgi kutusu hep aynı boyda" kuralları, Dövüş › Ölüm pozu ve leş'e "gün dönümünde kaybolmaz" eklendi; Eşyalar › Eşya resimleri'ne "Silah ve alet resimleri" bölümü eklendi; Sistemler'e "El yapımı kategorili", "Yetenek alınca pencere yerinde kalır" ve Almanak'a "Tatlı su balıkları sayfası" eklendi; Mağaralar'a yarasa, kertenkele ve örümcek görünüşü ile "mağarada su yoktur" ve "duvarın ardına vurulmaz" eklendi.

---

## Versiyon 4.07 · 10 Kasım 2026

### Oynanış
- **Her biyomun tek bir odunu var:** bir biyomdaki bütün ağaçlar (meyve ağaçları dahil) kesilince aynı odunu veriyor. Odunun adı ağacı değil gücünü söylüyor ve her biyomda bir öncekinden kuvvetli: Çayır **Odun**, Orman **Sert odun**, Bataklık **Sağlam odun**, Kayalık Dağ **Güçlü odun**, Kül Diyarı **Kor odun**, Mor Kristal Vadisi **Kadim odun**; ACT 2'de **Ulu**, **Yüce**, **Efsane** ve **Ölümsüz odun**.
- **Kalas, sap, kömür ve kaşık da odunun adında:** Meşe kalası artık **Sert odun kalası**, Huş sapı **Güçlü odun sapı**, Çam kömürü **Odun kömürü** gibi. "Çam kalası (Kavak odunu ile)" gibi ağaç ağaç ayrı kalas tarifleri kalktı; her biyomda tek kalas tarifi var.
- **Yaylar yeni adlarıyla:** Çam yayı → Odun yayı, Meşe yayı → Sert odun yayı, Kızılağaç yayı → Sağlam odun yayı, Akçaağaç yayı → Güçlü odun yayı, Kızıl sedir yayı → Kor odun yayı, Gece ağacı yayı → Kadim odun yayı; usta yayları malzemesinin adını aldı: Granit yayı, Timsah dişi yayı, Gümüş yayı, Ametist yayı (Ejder yayı aynı). Dişbudak ve Porsuk yayı artık Sağlam kısa yay ve Güçlü kısa yay. Güçleri aynı.
- **Kabuklar ağaçtan düşüyor:** Meşe, Kayın, Ihlamur, Ceviz, Kavak, Dişbudak, Kızılağaç, Söğüt, Huş, Porsuk, Akçaağaç, Kestane ve Ardıç kesilince odunla birlikte 1 kabuğu da düşüyor; kabuk tarifleri kalktı. Meşe kabuk zırh, eldiven, çizme ve Ceviz kabuğu miğfer odun yerine o ağacın kabuğunu istiyor.
- **Görevler yeni odunu istiyor:** belirli bir ağacın odununu isteyen görevler o biyomun odununu istiyor. Aynı kişi aynı şeyi iki kez istemesin diye birkaç görev değişti: Usta Sinan'ın Ocak başı 2 Sert odun kalası, Durdu'nun Çatlak sap 2 Sert odun sapı ve Bileğinin taşı 5 Kayın kabuğu, Ali'nin Servi sapı 2 Sağlam odun sapı, Barbaros'un Pruvadaki fener 2 Kadim odun kalası istiyor.

### Kayıtlar
- **Eski kayıtlar çevriliyor:** kayıt açılınca ağaç adlı her odun, kalas, sap, kömür, kaşık ve yay yeni adına dönüyor (çanta, sandık, kemer, köpek çantası, yer, kitap); aynı yeni ada düşenler toplanıyor. Bir kez bildirim çıkıyor.

### Tasarım belgesi
- Yeni bölüm: Tarifler › Sade malzeme › **Biyom başına tek odun** (odunlar, fiyatları, ağaçları, kalas/sap/kömür/kaşık, yaylar, kabuklar, görevler). Biyom tablolarında, tarif ve eşya dizinlerinde ağaç adlı odunlar ve türeyenleri yeni adlarıyla, fiyatları oyundakiyle aynı.

---

## Versiyon 4.06 · 10 Kasım 2026

### Oynanış
- **Temel parçalar ucuzladı:** Sivri taş artık 4 Keskin taş (6 yerine), Sopa 2 Dal + 1 Keskin taş + 1 Lif (3 Dal + 2 Keskin taş yerine), İp 3 Lif (4 yerine). Örneğin bir Taş kazma sıfırdan 16 Taş, 5 Dal, 8 Lif yerine artık 12 Taş, 4 Dal, 7 Lif istiyor.
- **Fiyatlar yeni malzemelere göre:** İp 5 → 4, Sopa 12 → 8, Sivri taş 23 → 15 Vio. Bunları kullanan bütün tariflerin fiyatı da düştü (198 eşya; ör. Taş kazma 64 → 46, Uzun sopa 28 → 22, Halat 38 → 30, Taş balta 39 → 31). Fiyatı kendi metal setine göre belirlenen silah ve aletler (tunç, demir, kuvars…) ile oltalar değişmedi.
- **Börü'nün balta dersi yeni tariflere göre:** önce 1 Keskin taş, sonra Sopa (2 dal, 1 keskin taş, 1 lif), sonra baltanın ağzı için 2 Keskin taş, en son 2 İp (her biri 3 lif). Börü yanına da buna göre bırakıyor (ör. çantan boşsa 2 dal ve 7 lif).
- **Güvercinler yeniden görünüyor:** Bulut'un kaçan güvercinleri (ve aynı şekilde sesle bulunan bıldırcın, kurbağalar, çanlar, kristaller) artık dünyada hep görünüyor; yalnızca haritada ve mini haritada gösterilmiyor. Önceden ancak dibine gelince beliriyorlardı.

### Arayüz
- **El yapımı listesi yana kaymıyor:** bir silahın (ör. Taş savaş çekici) üstüne gelince adının altında çıkan özellik satırı listeyi genişletip Takip et / ×5 / Hepsi / Yap düğmelerini sağa itiyordu; artık yazı alt satıra geçiyor, düğmeler yerinde kalıyor.

### Tasarım belgesi
- Tarif ve eşya tablolarındaki fiyatlar, Börü'nün balta dersi, yan görevlerde sesle bulunan şeylerin görünmesi ve listede özellik satırının kaydırmaması güncellendi.

---

## Versiyon 4.05 · 10 Kasım 2026

### Oynanış
- **Takla vuruşu 3,5 saniyede bir:** taklanın içinde ya da hemen sonunda yapılan takla vuruşu (Hamle, Koşarak saplama, Zikzak…) ard arda yapılınca çok güçlüydü; artık 3,5 saniyede bir yapılabiliyor. Arada aynı tık normal vuruş oluyor, karakterin üstünde gri "Koşarak saplama 3 sn" gibi kalan süre yazıyor. Hasarı aynı.
- **Bileme ücreti aşınmaya göre:** Dursun'a bileterken ücret artık aletin ne kadar körelmiş olduğuna göre: tamamen körse tam ücret, biraz körse az. Silahların tam bileme ücreti iki katına çıktı (iki kat dayandıkları için).
- **Silahlar iki kat dayanıyor:** kılıç, savaş çekici, topuz, mızrak ve yaylar artık iki kat geç köreliyor (ör. Mızrak 20 → 40 vuruş). Meşaleler ve aletler (balta, kazma…) aynı. Eski kayıtta elindeki silahın kalan keskinliği de iki katına çıkıyor.
- **Mor ışık bütün adayı sarıyor:** saldırıda artık mor bir halka yok; bütün ada mora bürünüyor ve aydınlanıyor. Yıldızsızlar sen nereye gidersen çevrene iniyor; kaçmak saldırıyı bitirmiyor. Kişiler (Börü, Zümrüt, Kemal) dövüş yanlarına gelince yardıma katılıyor.

### Düzeltmeler
- **Mızrak artık yakmıyor:** meşale yanarken mızrakla (ya da başka bir silahla) vurunca canavar tutuşuyordu; artık yalnızca meşalenin kendisiyle vurunca tutuşuyor. Başka silahla vururken meşale de vuruş başına aşınmıyor, yalnızca zamanla yanıyor. Bir canavarın seni fark etmesi de (vurmadan) artık onu tutuşturmuyor.

### Görsel
- **Tek başına açık yeşil karolar gitti:** ormanın içinde tek kalmış açık yeşil çimen karoları ve bir karo kalınlığındaki şeritler (ya da çimende tek orman karosu) artık çevreleriyle aynı görünüyor. Yalnızca görünüş değişti; ağaçlar ve toplanabilirler aynı yerde.

### Arayüz
- **Kazanda "+" ile yapılabilenler de parlıyor:** Zümrüt'ün kazanında "Şimdi yapılabilir" listesine artık eksik parçası çantandakilerle "+" düğmesiyle yapılabilen tarifler de giriyor (ör. Kıvılcım'ın malzemesi varsa Ateş). Önceden yalnızca bütün parçası hazır olanlar parlıyordu.
- **Tarif kitabında silah özellikleri düzgün:** bir silaha ya da zırha gelince özellikleri (hasar, vuruş hızı, menzil, kritik, keskinlik) resmin altında dar bir sütuna sıkışıp yarım ekranı kaplıyordu; artık malzemelerin altında tek sıra küçük kartlarda.
- **Eylem yazısı kemerin üstünde:** "Su al", "Konuş" gibi eylem yazıları alet kemerinin arkasında yarım kalıyordu; artık hep kemerin biraz üstünde.

---

## Versiyon 4.04 · 9 Kasım 2026

### Oynanış
- **Sarı bölgeli işlerde ok yok:** bir şey toplamak, avlamak ya da aramak gereken ana görevlerde (ör. Kanlıca, Pamuk) artık ok ve "Kanlıca 8 m" gibi yazı çıkmıyor; yer haritada sarı gösteriliyor, aradığını sen buluyorsun. Ok yalnızca bir kişiye ya da belli bir yere gidilecekken çıkıyor.
- **Silah değdiği yere vuruyor:** meşale (ve bütün silahlar) bir canlının herhangi bir yerine değince artık hasar veriyor; vuruş, silahın savrulduğu yayın tamamına bakıyor (önceden dört yöne bakan dar bir alana bakıyordu, kurtların başına ya da üstüne değen meşale boşa gidiyordu).
- **Robot köpekler elle topladığın her şeyi toplar:** köpek menüsünde artık yalnızca 23 malzeme değil, yerden elle toplayabildiğin ve daha önce eline geçmiş her şey var (Havuç, mantarlar, öbür biyomların bitkileri…); yalnızca kazma isteyen madenler ve mağaradakiler yok.
- **Pazarcılar demircilerin dibinde değil:** Orman, Bataklık, Kayalık Dağ, Kül Diyarı ve Mor Kristal Vadisi'ndeki pazarcılar (Fidan, Nilüfer, Kardelen, Lale, Menekşe) artık demirci ve zırhçının ocağından uzakta, 30 kare kadar ötede kendi tezgâhını kuruyor.
- **Canavarlar içinde dolanmıyor:** yürüyen canavar önünde, kendi boyu kadar uzakta duruyor; atılışı sana değince duruyor, arkana geçip gitmiyor.
- **Börü'nün alıştırma canavarları (Kerevit dersi hariç) öğretiyor:** ritimli 3. vuruş, güçlü vuruş, ulti gibi derslerdeki canavarlar artık Kerevit dersindeki gibi dövüşüyor: senden bir adım uzakta duruyor, üstünde **!** çıkıp bir an bekliyor, sonra bir kez atılıyor ve geri çekiliyor; ne zaman vuracağı belli. Kırmızı (savuşturulamaz) vuruş ve yer sarsması yapmıyorlar, canının yalnızca %5'i kadar vuruyorlar ve seni canının dörtte birinin altına indirmiyorlar.

---

## Versiyon 4.03 · 9 Kasım 2026

### Arayüz
- **Onay kutuları oyunun görünüşünde:** köprü onarma, görevi bırakma gibi "Evet / Vazgeç" kutuları açık renkli, oyuna uymayan bir kutuydu; artık öbür pencereler gibi koyu zeminli, altın çerçeveli. Köprü kutusundaki ilgisiz "seviye puanın bekliyor" satırı kaldırıldı.

---

## Versiyon 4.02 · 9 Kasım 2026

### Oynanış
- **Mor ışık saldırıları %25 daha hafif:** Yıldızsızların sayısı (en çok 9) ve canları ile vuruşları %25 azaldı.
- **Yıldızsızlar kişilerin kamplarına da giriyor:** Kemal'in kampı, Zümrüt'ün kazanı, Dursun'un ocağı ve kişilerin ateşleri artık seni korumuyor; saldırıyı da ertelemiyor. Yalnızca kendi yaktığın kamp ateşi ve evin içi güvenli.
- **Kişiler yardım ediyor:** mor ışık onların yanına gelirse savaşa katılıyorlar:
  - **Savaşçı Börü** Yıldızsızlara koşup kılıç sallıyor, bitince yerine dönüyor.
  - **Cadı Zümrüt** birkaç saniyede bir büyü ışını yolluyor.
  - **Yaşlı Kemal** yanındaysan birkaç saniyede bir yaralarını sarıyor (canının %8'i).

### Düzeltmeler
- **Silahlar değdiği yere vuruyor:** mızrakla (ve öbür silahların özel vuruşlarıyla) atların kafasına ya da bir canlının uzun yerlerine değince hasar gitmiyordu; artık canlının çizildiği her yer sayılıyor.
- **Suda takılan canlılar:** Kerevit Reisi gibi suya ya da duvara sıkışan bir canlı olduğu yerde donup kalıyordu; artık en yakın kuru yere çıkıp savaşa devam ediyor.
