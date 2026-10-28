# Yetenek ağacı

**v1.82'den itibaren** yetenekler üç **gerçek ağaç** biçimindedir: **Savaş** (kırmızı), **Ekonomi** (altın sarısı) ve **Dayanıklılık** (yeşil). Her ağaçta 21 yetenek, toplam **63 yetenek**.

## Görünüş

- Yetenek ekranının (Y) üstünde **üç eşit sekme** vardır; pencerenin genişliğini tam üçe böler (Savaş · Ekonomi · Dayanıklılık). Bir sekmeye basınca o ağaç gösterilir ve ağacın **rengi, arka planı ve kenarlığı kategoriye göre değişir** (Savaş koyu kırmızı, Ekonomi koyu altın/kahve, Dayanıklılık koyu yeşil).
- Ağaç **alttan yukarı** büyür: en altta toprak ve gövde, gövdenin ucunda ağacın **kök yeteneği**; yetenekler (yuvarlaklar) kahverengi **dallarla** birbirine bağlanır, dallar yukarı çıktıkça incelir ve yanlara açılır, bir ağacın tacı gibi.
- **Pencerenin boyutu sabittir:** yeni yetenek görünse de ekran büyümez, kaymaz; bütün yetenekler baştan belli yerlerdedir. Üç ağacın alanı da aynı büyüklüktedir.
- **Her yeteneğin bir ikonu vardır** (oyundaki bir eşyanın piksel resmi; tablodaki "İkon" sütunu). Ağaçta yetenekler yalnızca **yuvarlak içinde ikon** olarak görünür, yazı yoktur. Alınan yetenek kategori rengiyle dolar; alınabilecek olan kategori renginde parlar; seviyesi ya da sikkesi yetmeyen soluktur.
- **Fare üzerine gelince** küçük bir kutuda yeteneğin **adı, ne işe yaradığı** ve fiyatı/durumu yazar. Telefonda dokununca aynı bilgi alttaki şeritte çıkar.
- Bir ikona dokununca/tıklayınca ağacın altındaki **bilgi şeridinde** adı, etkisi, fiyatı, seviye şartı ve **Al** düğmesi çıkar. Satın alma bu düğmeyle yapılır.

## Kurallar

- **Başta her ağacın yalnızca kök yeteneği görünür** (Koşu, Usta tüccar, Güçlü beden).
- **Bir yetenek alınınca yalnızca ona bağlı, hemen üstündeki yetenekler** görünür olur (tablodaki "Alınınca açılanlar"). Başka hiçbir yetenek açılmaz; alınmayan bir yeteneğin üstündekiler **görünmez** (dalı da çizilmez).
- Bu kural **sınırsız sikke (tanrı modu) açıkken de** aynıdır; tanrı modu ağacın tamamını göstermez, yalnızca sikkeyi sınırsız yapar.
- Fiyat ve seviye şartı yeteneğin **katına** (kökten kaçıncı basamak olduğuna) göredir; yukarı çıktıkça pahalı ve güçlü:

| Kat | Fiyat | Seviye şartı |
|---|---|---|
| 1 (kök) | 100 | – |
| 2 | 250 | Sv 2 |
| 3 | 500 | Sv 3 |
| 4 | 1.000 | Sv 5 |
| 5 | 2.500 | Sv 8 |
| 6 | 5.000 | Sv 12 |

- **Koşu** Savaş ağacının köküdür: yalnızca **100 sikke**; seviye, köprü ya da Atılma şartı yok.
- **Atılma ağaçta değildir:** öğreticide Savaşçı Börü ücretsiz öğretir (öğreticiyi geçen, Börü'yle konuşunca aynı dersi ücretsiz alır). Ayrıntı: "Oyunun akışı → Börü'nün atılma dersi".
- **Bilgelik dalı kaldırıldı.** Sezgi, Akıl yürütme, İpucu ustası I-II ve Bilmece ustası Normal modda gereksizdi (tarifler Normal modda zaten açık). *Not: Zor mod tasarlanırken tarif ipucu yetenekleri yeniden düşünülecek.* Kazan bilgesi, Keskin göz, Toptancı, Pazarlıkçı I-IV, Sağlam yapı I, Hızlı öğrenen I ve III de çıkarıldı (Pazarlıkçı'nın yerine Ekonomi'nin kökü "Usta tüccar" geldi).
- **Eski kayıtlar:** kaldırılan bir yeteneğe sahip kayıt açılınca o yeteneğin eski parası sikke olarak iade edilir ve bir bildirim çıkar. Elde kalan yetenekler alınmış kalır; alınmış bir yeteneğin altındaki (ona giden yoldaki) yetenekler de görünür olur ki ağaçta boşlukta asılı kalmasın.

## Savaş (kırmızı)

| Kat | Kimlik | Yetenek | İkon | Etki | Bağlı olduğu (önce bu alınır) | Alınınca açılanlar | Fiyat | Seviye |
|---|---|---|---|---|---|---|---|---|
| 1 | K1 | Koşu | Kamış çizme | Shift ile (telefonda çift dokunarak) koş; enerji harcar | kök (baştan görünür) | Kemer I, Hızlı adımlar I, Derin nefes I, Çevik atılma | 100 | – |
| 2 | A1 | Kemer I | Kenevir torba | Alet yuvası 5 → 6 | Koşu | Kemer II | 250 | Sv 2 |
| 2 | H1 | Hızlı adımlar I | Deri çarık | Hareket hızı +%10 | Koşu | Hızlı adımlar II, Kâşif gözü | 250 | Sv 2 |
| 2 | K2 | Derin nefes I | Kamış flüt | En yüksek enerji +%25 | Koşu | Çabuk toparlanma, Rüzgâr gibi | 250 | Sv 2 |
| 2 | S2 | Çevik atılma | Kartal tüyü | Atılma %35 daha az enerji, daha kısa bekleme | Koşu | Güçlü kol I | 250 | Sv 2 |
| 3 | A2 | Kemer II | Deri çanta | Alet yuvası 7 | Kemer I | Kemer III | 500 | Sv 3 |
| 3 | H2 | Hızlı adımlar II | Tunç çizme | Hareket hızı toplam +%20 | Hızlı adımlar I | Hızlı adımlar III | 500 | Sv 3 |
| 3 | H6 | Kâşif gözü | Mor pusula | Haritada açılan alan neredeyse iki kat genişler | Hızlı adımlar I | Baykuş gözü | 500 | Sv 3 |
| 3 | K3 | Çabuk toparlanma | Bal şerbeti | Enerji %50 daha hızlı dolar | Derin nefes I | Derin nefes II | 500 | Sv 3 |
| 3 | K4 | Rüzgâr gibi | Fırtına tüyü | Koşu hızı 1,6 kattan 1,85 kata çıkar | Derin nefes I | Hafif adım | 500 | Sv 3 |
| 3 | W1 | Güçlü kol I | Taş kılıç | Bütün saldırıların hasarı +%10 | Çevik atılma | Güçlü kol II | 500 | Sv 3 |
| 4 | A3 | Kemer III | Balık sepeti | Alet yuvası 8 | Kemer II | Kemer IV | 1.000 | Sv 5 |
| 4 | H3 | Hızlı adımlar III | Demir çizme | Hareket hızı toplam +%30 | Hızlı adımlar II | Hızlı adımlar IV | 1.000 | Sv 5 |
| 4 | H8 | Baykuş gözü | Kafa lambası | Karanlıkta yakın çevreni hep biraz görürsün | Kâşif gözü | – | 1.000 | Sv 5 |
| 4 | K5 | Derin nefes II | Boynuz borazan | En yüksek enerji toplam +%50 | Çabuk toparlanma | – | 1.000 | Sv 5 |
| 4 | K6 | Hafif adım | Keklik tüyü | Koşarken %30 daha az enerji harcarsın | Rüzgâr gibi | – | 1.000 | Sv 5 |
| 4 | W2 | Güçlü kol II | Tunç kılıç | Hasar toplam +%25 | Güçlü kol I | Güçlü kol III | 1.000 | Sv 5 |
| 5 | A4 | Kemer IV | Dolap | Alet yuvası 10 | Kemer III | Kemer V | 2.500 | Sv 8 |
| 5 | H7 | Hızlı adımlar IV | Meka çizme | Hareket hızı toplam +%40 | Hızlı adımlar III | – | 2.500 | Sv 8 |
| 5 | W3 | Güçlü kol III | Demir kılıç | Hasar toplam +%40 | Güçlü kol II | – | 2.500 | Sv 8 |
| 6 | A8 | Kemer V | Sandık | Alet yuvası 12 | Kemer IV | – | 5.000 | Sv 12 |

## Ekonomi (altın sarısı)

| Kat | Kimlik | Yetenek | İkon | Etki | Bağlı olduğu (önce bu alınır) | Alınınca açılanlar | Fiyat | Seviye |
|---|---|---|---|---|---|---|---|---|
| 1 | E1 | Usta tüccar | Altın külçesi | Pazarda satış fiyatları +%50 | kök (baştan görünür) | Çevik eller I, Şanslı müşteri, Tutumlu usta I | 100 | – |
| 2 | G1 | Çevik eller I | Hasat sepeti | Toplama süresi −%15 | Usta tüccar | Çevik eller II, Oduncu, Bereket | 250 | Sv 2 |
| 2 | T3 | Şanslı müşteri | Gümüş yüzük | Her satışta %5 ihtimalle çift ödeme | Usta tüccar | Şanslı müşteri II, İlk keşif ödülü | 250 | Sv 2 |
| 2 | Z1 | Tutumlu usta I | Kemik iğne | Yaparken %10 ihtimalle bir malzeme elde kalır | Usta tüccar | Tutumlu usta II, Değerli işçilik, Usta işi | 250 | Sv 2 |
| 3 | G2 | Çevik eller II | Tırmık | Toplama süresi toplam −%30 | Çevik eller I | Çevik eller III, Uzun kol | 500 | Sv 3 |
| 3 | G5 | Oduncu | Taş balta | Odun %50 daha hızlı | Çevik eller I | Taşçı | 500 | Sv 3 |
| 3 | G4 | Bereket | Buğday | %10 ihtimalle iki malzeme | Çevik eller I | Verimli toprak | 500 | Sv 3 |
| 3 | T8 | Şanslı müşteri II | Ametist yüzük | Çift ödeme ihtimali toplam %12 | Şanslı müşteri | – | 500 | Sv 3 |
| 3 | T6 | İlk keşif ödülü | Ay taşı | Yeni malzeme ilk bulunduğunda fiyatının 5 katı sikke | Şanslı müşteri | Hızlı öğrenen | 500 | Sv 3 |
| 3 | Z2 | Tutumlu usta II | Kirmen | Malzeme kalma ihtimali toplam %20 | Tutumlu usta I | Tutumlu usta III | 500 | Sv 3 |
| 3 | Z4 | Değerli işçilik | Boyalı çömlek | Birleştirilerek yapılan eşyalar +%15 değerli | Tutumlu usta I | Değerli işçilik II | 500 | Sv 3 |
| 3 | Z3 | Usta işi | Atölye | Elle yaparken %5 ihtimalle iki ürün | Tutumlu usta I | Usta işi II | 500 | Sv 3 |
| 4 | G3 | Çevik eller III | Tırpan | Toplama süresi toplam −%45 | Çevik eller II | – | 1.000 | Sv 5 |
| 4 | H4 | Uzun kol | Kemik zıpkın | E ile %50 daha uzaktan toplama | Çevik eller II | – | 1.000 | Sv 5 |
| 4 | G6 | Taşçı | Taş kazma | Taş, çakmaktaşı, çakıl, kum, kil %50 daha hızlı | Oduncu | Su taşıyıcı | 1.000 | Sv 5 |
| 4 | G8 | Verimli toprak | Gübre | Malzemeler %40 daha çabuk yeniden çıkar | Bereket | – | 1.000 | Sv 5 |
| 4 | B5 | Hızlı öğrenen | Işık tozu | Kazandığın bütün XP +%20 | İlk keşif ödülü | – | 1.000 | Sv 5 |
| 4 | Z5 | Tutumlu usta III | Dokuma tezgâhı | Malzeme kalma ihtimali toplam %30 | Tutumlu usta II | – | 1.000 | Sv 5 |
| 4 | Z6 | Değerli işçilik II | Kehribar kolye | Yapılan eşyalar toplam +%30 değerli | Değerli işçilik | – | 1.000 | Sv 5 |
| 4 | Z7 | Usta işi II | Dişli | İki ürün ihtimali toplam %12 | Usta işi | – | 1.000 | Sv 5 |
| 5 | G7 | Su taşıyıcı | Deri tulum | Su %50 daha hızlı | Taşçı | – | 2.500 | Sv 8 |

## Dayanıklılık (yeşil)

| Kat | Kimlik | Yetenek | İkon | Etki | Bağlı olduğu (önce bu alınır) | Alınınca açılanlar | Fiyat | Seviye |
|---|---|---|---|---|---|---|---|---|
| 1 | D1 | Güçlü beden | Ayı pençesi | En yüksek can +50 | kök (baştan görünür) | Hızlı iyileşme I, Sağlam yapı I, Zırh I | 100 | – |
| 2 | C2 | Hızlı iyileşme I | Adaçayı çayı | Can iki kat hızlı yenilenir | Güçlü beden | Hızlı iyileşme II, Demir mide | 250 | Sv 2 |
| 2 | C3 | Sağlam yapı I | Kurt postu giysi | En yüksek can toplam +100 | Güçlü beden | Sağlam yapı II, Zehre dayanıklı | 250 | Sv 2 |
| 2 | D2 | Zırh I | Kemik zırh | Zırh +5 | Güçlü beden | Zırh II, Sağlam aletler I | 250 | Sv 2 |
| 3 | C6 | Hızlı iyileşme II | Kardelen merhemi | Can üç kat hızlı yenilenir | Hızlı iyileşme I | Hızlı iyileşme III | 500 | Sv 3 |
| 3 | C7 | Demir mide | Avcı yahnisi | Zehirli yiyecek ve çiğ et %60 daha az dokunur | Hızlı iyileşme I | Kalın deri | 500 | Sv 3 |
| 3 | C5 | Sağlam yapı II | Ayı postu pelerin | En yüksek can toplam +175 | Sağlam yapı I | Sağlam yapı III | 500 | Sv 3 |
| 3 | D3 | Zehre dayanıklı | Panzehir | Zehir hasarı −%40 | Sağlam yapı I | Ateşe dayanıklı | 500 | Sv 3 |
| 3 | D5 | Zırh II | Tunç zırh | Zırh toplam +12 | Zırh I | Zırh III | 500 | Sv 3 |
| 3 | A5 | Sağlam aletler I | Bileği taşı | Aletler %20 daha geç körelir | Zırh I | Sağlam aletler II | 500 | Sv 3 |
| 4 | C9 | Hızlı iyileşme III | Ay ışığı iksiri | Can dört kat hızlı yenilenir | Hızlı iyileşme II | – | 1.000 | Sv 5 |
| 4 | C4 | Kalın deri | Geyik derisi | Zırhın tutmadığı anlık hasarlar (çiğ et, zehirli yemek, diken, göl) %40 daha az | Demir mide | – | 1.000 | Sv 5 |
| 4 | C8 | Sağlam yapı III | Ejder kalbi | En yüksek can toplam +250 | Sağlam yapı II | Son nefes | 1.000 | Sv 5 |
| 4 | D4 | Ateşe dayanıklı | Kor merhemi | Yanık hasarı −%40 | Zehre dayanıklı | Kanamaya dayanıklı | 1.000 | Sv 5 |
| 4 | D7 | Zırh III | Demir zırh | Zırh toplam +20 | Zırh II | Zırh IV | 1.000 | Sv 5 |
| 4 | A6 | Sağlam aletler II | Demir halka | Aletler toplam %40 daha geç körelir | Sağlam aletler I | Sağlam aletler III | 1.000 | Sv 5 |
| 5 | D8 | Son nefes | Gölge iksiri | Canın dörtte birinin altındayken aldığın fiziksel hasar −%25 | Sağlam yapı III | – | 2.500 | Sv 8 |
| 5 | D6 | Kanamaya dayanıklı | Kanlıca | Kanama hasarı −%40 | Ateşe dayanıklı | Çelik beden | 2.500 | Sv 8 |
| 5 | D10 | Zırh IV | Ejder pulu zırh | Zırh toplam +30 | Zırh III | – | 2.500 | Sv 8 |
| 5 | A7 | Sağlam aletler III | Ağır plaka | Aletler toplam %60 daha geç körelir | Sağlam aletler II | – | 2.500 | Sv 8 |
| 6 | D9 | Çelik beden | Demir levha | Zehir, yanık ve kanama yarı sürede geçer | Kanamaya dayanıklı | – | 5.000 | Sv 12 |

Satış fiyatı bütün yeteneklerle birlikte en çok temel fiyatın 2,3 katına çıkar (değişmedi).
Direnç yetenekleri eşya dirençleriyle ve yemek kalkanlarıyla çarpılarak birleşir (ör. Bataklık postu pelerin %30 + Zehre dayanıklı %40 → zehir 0,7 × 0,6 = 0,42).
