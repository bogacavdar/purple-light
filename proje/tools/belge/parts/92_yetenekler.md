# Yetenek ağacı

**v1.81'den itibaren** yetenekler üç renkli ağaçtadır: **Savaş** (kırmızı), **Ekonomi** (altın sarısı) ve **Dayanıklılık** (yeşil). Yetenek ekranı (Y) üstteki üç sekmeden birini gösterir.

- **Ağaçlar aşağıdan yukarı piramit gibi büyür:** 1. sırada 1, 2. sırada 2, … 6. sırada 6 yetenek; her ağaçta 21, toplam **63 yetenek**.
- **Başta her ağacın yalnızca en alttaki ilk yeteneği görünür.** Bir yeteneği alınca hemen üstündeki iki yetenek (sol üst ve sağ üst komşusu) görünür olur. Görünmeyen yerler boş kalır, piramidin şekli bozulmaz.
- Bazı yeteneklerin ayrıca **ön koşulu** vardır (tablodaki "Ön koşul"; ör. Hızlı adımlar III için önce II). Görünür ama ön koşulu eksik olan yetenekte "Önce: …" yazar.
- **Yukarı çıktıkça pahalı ve güçlü:** fiyat ve seviye şartı sıraya göre sabittir.

| Sıra | Fiyat | Seviye şartı |
|---|---|---|
| 1 (en alt) | 100 | – |
| 2 | 250 | Sv 2 |
| 3 | 500 | Sv 3 |
| 4 | 1.000 | Sv 5 |
| 5 | 2.500 | Sv 8 |
| 6 (en üst) | 5.000 | Sv 12 |

- **Koşu** artık Savaş ağacının ilk yeteneğidir: yalnızca **100 sikke**; seviye, köprü ya da Atılma şartı yoktur.
- **Atılma ağaçta değildir:** öğreticide Savaşçı Börü ücretsiz öğretir (öğreticiyi geçen, Börü'yle konuşunca aynı dersi ücretsiz alır). Ayrıntı: "Oyunun akışı → Börü'nün atılma dersi".
- **Bilgelik dalı kaldırıldı.** Sezgi, Akıl yürütme, İpucu ustası I-II ve Bilmece ustası Normal modda gereksizdi (tarifler Normal modda zaten açık). *Not: Zor mod tasarlanırken tarif ipucu yetenekleri yeniden düşünülecek.* Kazan bilgesi, Keskin göz, Toptancı, Pazarlıkçı I-IV, Sağlam yapı I, Hızlı öğrenen I ve III de çıkarıldı (Pazarlıkçı'nın yerine Ekonomi'nin ilk yeteneği "Usta tüccar" geldi).
- **Eski kayıtlar:** kaldırılan bir yeteneğe sahip kayıt açılınca o yeteneğin eski parası sikke olarak iade edilir ve bir bildirim çıkar. Elde kalan yetenekler alınmış kalır.

## Savaş (kırmızı)

Koşu, enerji, hareket, atılma, hasar ve alet kemeri.

| Sıra | Kimlik | Yetenek | Etki | Ön koşul |
|---|---|---|---|---|
| 1 | K1 | Koşu | Shift ile (telefonda çift dokunarak) koş; enerji harcar | – |
| 2 | H1 | Hızlı adımlar I | Hareket hızı +%10 | – |
| 2 | K2 | Derin nefes I | En yüksek enerji +%25 | – |
| 3 | S2 | Çevik atılma | Atılma %35 daha az enerji, daha kısa bekleme | – |
| 3 | K3 | Çabuk toparlanma | Enerji %50 daha hızlı dolar | – |
| 3 | A1 | Kemer I | Alet yuvası 5 → 6 | – |
| 4 | W1 | Güçlü kol I | Bütün saldırıların hasarı +%10 (yumruk, silah, asa, ateşli silah) | – |
| 4 | H2 | Hızlı adımlar II | Hareket hızı toplam +%20 | H1 |
| 4 | K4 | Rüzgâr gibi | Koşu hızı 1,6 kattan 1,85 kata çıkar | – |
| 4 | A2 | Kemer II | Alet yuvası 7 | A1 |
| 5 | W2 | Güçlü kol II | Hasar toplam +%25 | W1 |
| 5 | H6 | Kâşif gözü | Haritada açılan alan neredeyse iki kat genişler | – |
| 5 | K6 | Hafif adım | Koşarken %30 daha az enerji harcarsın | K4 |
| 5 | H3 | Hızlı adımlar III | Hareket hızı toplam +%30 | H2 |
| 5 | A3 | Kemer III | Alet yuvası 8 | A2 |
| 6 | W3 | Güçlü kol III | Hasar toplam +%40 | W2 |
| 6 | H8 | Baykuş gözü | Karanlıkta yakın çevreni hep biraz görürsün | H6 |
| 6 | K5 | Derin nefes II | En yüksek enerji toplam +%50 | K2 |
| 6 | H7 | Hızlı adımlar IV | Hareket hızı toplam +%40 | H3 |
| 6 | A4 | Kemer IV | Alet yuvası 10 | A3 |
| 6 | A8 | Kemer V | Alet yuvası 12 | A4 |

## Ekonomi (altın sarısı)

Ticaret, toplayıcılık ve zanaat.

| Sıra | Kimlik | Yetenek | Etki | Ön koşul |
|---|---|---|---|---|
| 1 | E1 | Usta tüccar | Pazarda satış fiyatları +%50 | – |
| 2 | G1 | Çevik eller I | Toplama süresi −%15 | – |
| 2 | Z1 | Tutumlu usta I | Yaparken %10 ihtimalle bir malzeme elde kalır | – |
| 3 | G5 | Oduncu | Odun %50 daha hızlı | – |
| 3 | G6 | Taşçı | Taş, çakmaktaşı, çakıl, kum, kil %50 daha hızlı | – |
| 3 | Z4 | Değerli işçilik | Birleştirilerek yapılan eşyalar +%15 değerli | – |
| 4 | G7 | Su taşıyıcı | Su %50 daha hızlı | – |
| 4 | G2 | Çevik eller II | Toplama süresi toplam −%30 | G1 |
| 4 | G4 | Bereket | %10 ihtimalle iki malzeme | – |
| 4 | Z2 | Tutumlu usta II | Malzeme kalma ihtimali toplam %20 | Z1 |
| 5 | H4 | Uzun kol | E ile %50 daha uzaktan toplama | – |
| 5 | G8 | Verimli toprak | Malzemeler %40 daha çabuk yeniden çıkar | G4 |
| 5 | T3 | Şanslı müşteri | Her satışta %5 ihtimalle çift ödeme | – |
| 5 | Z3 | Usta işi | Elle yaparken %5 ihtimalle iki ürün | – |
| 5 | Z6 | Değerli işçilik II | Yapılan eşyalar toplam +%30 değerli | Z4 |
| 6 | B5 | Hızlı öğrenen | Kazandığın bütün XP +%20 | – |
| 6 | G3 | Çevik eller III | Toplama süresi toplam −%45 | G2 |
| 6 | T6 | İlk keşif ödülü | Yeni malzeme ilk bulunduğunda fiyatının 5 katı sikke | – |
| 6 | T8 | Şanslı müşteri II | Çift ödeme ihtimali toplam %12 | T3 |
| 6 | Z5 | Tutumlu usta III | Malzeme kalma ihtimali toplam %30 | Z2 |
| 6 | Z7 | Usta işi II | İki ürün ihtimali toplam %12 | Z3 |

Satış fiyatı bütün yeteneklerle birlikte en çok temel fiyatın 2,3 katına çıkar (değişmedi).

## Dayanıklılık (yeşil)

Can, zırh, can yenilenmesi, zehir/yanık/kanama direnci ve alet sağlamlığı.

| Sıra | Kimlik | Yetenek | Etki | Ön koşul |
|---|---|---|---|---|
| 1 | D1 | Güçlü beden | En yüksek can +50 | – |
| 2 | C2 | Hızlı iyileşme I | Can iki kat hızlı yenilenir | – |
| 2 | D2 | Zırh I | Zırh +5 | – |
| 3 | C7 | Demir mide | Zehirli yiyecek ve çiğ et %60 daha az dokunur | – |
| 3 | C3 | Sağlam yapı I | En yüksek can toplam +100 | – |
| 3 | A5 | Sağlam aletler I | Aletler %20 daha geç körelir | – |
| 4 | D3 | Zehre dayanıklı | Zehir hasarı −%40 | – |
| 4 | C6 | Hızlı iyileşme II | Can üç kat hızlı yenilenir | C2 |
| 4 | D5 | Zırh II | Zırh toplam +12 | D2 |
| 4 | A6 | Sağlam aletler II | Aletler toplam %40 daha geç körelir | A5 |
| 5 | D4 | Ateşe dayanıklı | Yanık hasarı −%40 | – |
| 5 | C4 | Kalın deri | Zırhın tutmadığı anlık hasarlar (çiğ et, zehirli yemek, diken, göl) %40 daha az | – |
| 5 | C5 | Sağlam yapı II | En yüksek can toplam +175 | C3 |
| 5 | D6 | Kanamaya dayanıklı | Kanama hasarı −%40 | – |
| 5 | D7 | Zırh III | Zırh toplam +20 | D5 |
| 6 | D9 | Çelik beden | Zehir, yanık ve kanama yarı sürede geçer | – |
| 6 | C9 | Hızlı iyileşme III | Can dört kat hızlı yenilenir | C6 |
| 6 | C8 | Sağlam yapı III | En yüksek can toplam +250 | C5 |
| 6 | D8 | Son nefes | Canın dörtte birinin altındayken aldığın fiziksel hasar −%25 | – |
| 6 | D10 | Zırh IV | Zırh toplam +30 | D7 |
| 6 | A7 | Sağlam aletler III | Aletler toplam %60 daha geç körelir | A6 |

Direnç yetenekleri eşya dirençleriyle ve yemek kalkanlarıyla çarpılarak birleşir (ör. Bataklık postu pelerin %30 + Zehre dayanıklı %40 → zehir 0,7 × 0,6 = 0,42).
