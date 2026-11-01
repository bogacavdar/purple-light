# Aletler, silahlar ve zırhlar

## Madenler ve ekipman merdiveni (v2.48, Boğaç)

ACT 1'in madenleri ve metal ekipmanı tek bir merdivene göre dizildi. Amaç: **her biyomda o biyomun madenleriyle bir öncekinden daha güçlü ve daha pahalı tam bir set yapılabilsin, biyom değiştirdikçe satılan madenler de daha pahalı olsun.** ACT 2 bu sürümde değişmedi (sonra aynı kurallarla ele alınacak).

### Kurallar

1. **Her biyomda tam 3 maden** vardır.
2. **Fiyat sürekli artar:** bir biyomun en ucuz madeni, önceki biyomun en pahalı madeninden pahalıdır.
3. **Her biyomda en az bir set** vardır: miğfer, zırh, eldiven, çizme, kılıç, mızrak, gürz, topuz, balta, kazma. Her set bir öncekinden güçlü ve pahalıdır.
4. **Kademe = biyom numarası:** bir biyomun malzemesinden yapılan balta ve kazma o biyomun numarasını taşır (Çayır 1 … Mor Kristal Vadisi 6).
5. **Biyom N'nin madenleri ve ağaçları N − 1. kademe ister** (Çayır'da ve Orman'da 1). Böylece bir alet en çok bir sonraki biyomu keser ve kazar; 2. biyomun aleti 4. biyomu, 3. biyomun aleti 5. biyomu açamaz.
6. **Ergitilen metalde** kademe, tarifteki en geç biyomdan gelir (Tunç: Çayır'ın bakırı + Orman'ın kalayı → 2).
7. Her madenden alet yapılmaz: madenlerin bir kısmı yemek (Tuz), yakıt (Taş kömürü), yapı (Kireçtaşı, Kumtaşı, Arduvaz), ateş (Pirit), şifa (Kükürt) ya da süs ve değer (Gümüş, Altın) içindir.

### Biyomların madenleri

| # | Biyom | Madenler (satış fiyatı) | Kazmak ve kesmek için | Set | Setin malzemesi |
|---|---|---|---|---|---|
| 1 | Çayır | Kireçtaşı **2** · Kumtaşı **3** · Bakır cevheri **5** | 1. kademe | Bakır | Bakır külçesi (Çayır ağaçlarının kömürüyle ergir) |
| 2 | Orman | Granit **6** · Taş kömürü **7** · Kalay cevheri **9** | 1. kademe | Tunç | Tunç külçesi (3 Bakır külçesi + 1 Kalay külçesi) |
| 3 | Bataklık | Arduvaz **10** · Tuz kayası **12** · Demir cevheri **14** | 2. kademe | Demir | Demir külçesi |
| 4 | Kayalık Dağ | Pirit **16** · Kuvars **18** · Gümüş cevheri **24** | 3. kademe | Çelik | Çelik külçesi (2 Demir külçesi + 2 Herhangi kömür + 1 Ateş tuğlası; Ateş tuğlası = 3 Beyaz kil + 2 Kum + 1 Ateş, Beyaz kil Kayalık Dağ'da toplanır) |
| 5 | Kül Diyarı | Bazalt **26** · Kükürt **28** · Obsidyen **34** | 4. kademe | Kara çelik (obsidyen çeliği) | Kara çelik külçesi (2 Çelik külçesi + 3 Obsidyen + 1 Kükürt + 2 Herhangi kömür) |
| 6 | Mor Kristal Vadisi | Kristal **40** · Ametist **50** · Altın cevheri **70** | 5. kademe | Mor kristal | Mor kristal levhası (3 Kristal + 2 Ametist + 1 Altın külçesi) |

- **Yer değiştiren madenler:** Kalay (Çayır → Orman), Kumtaşı (Orman → Çayır), Pirit (Kül Diyarı → Kayalık Dağ), Altın (Kayalık Dağ → Mor Kristal Vadisi), Obsidyen (Mor Kristal Vadisi → Kül Diyarı). Bataklık değişmedi. Yatak sayıları aynı (ilk iki biyomda 22, diğerlerinde 20), yatak 300 sn sonra yeniden dolar.
- **Fiyatın yayılması:** bir madenin fiyatı değişince, onu kullanan her tarifin fiyatı da değişim × miktar × 1,3 kadar değişir (zincir boyunca; v51'deki kural). Örnek: Demir külçesi 111 → 68, Altın külçesi 93 → 280, Gümüş külçesi 61 → 100.
- **Yeni ara ürünler** (el yapımı): Ateş tuğlası **56**, Çelik külçesi **277**, Kara çelik külçesi **966**, Mor kristal levhası **700**.

### Kademe merdiveni (balta ve kazma)

| Kademe | Alet malzemeleri | Kestiği/kazdığı biyomlar |
|---|---|---|
| 1 | Taş, Çakmaktaşı, Bakır | Çayır, Orman |
| 2 | Granit, Tunç | + Bataklık |
| 3 | Demir | + Kayalık Dağ |
| 4 | Kuvars, Çelik | + Kül Diyarı |
| 5 | Bazalt, Obsidyen, Kara çelik | + Mor Kristal Vadisi |
| 6 | Mor kristal | hepsi (ACT 2'ye hazırlık) |

- Bir biyomdaki **bütün madenler ve ağaçlar aynı kademeyi ister** (biyom içindeki eski farklar kalktı; ör. Orman'daki Meşe, Kayın, Ihlamur, Ceviz artık taş baltayla kesilir, Kayalık Dağ'daki Porsuk ve Ardıç 3. kademe ister).
- **Doğu geçidi** (Kayalık Dağ → Kül Diyarı) kaya yığını **4. kademe** kazma ister: Kuvars kazma ya da Çelik kazma ve üstü.
- Aynı kademede taş ve metal alet birlikte durur: taş aletler daha hızlı körelir, metal aletler daha dayanıklıdır.

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
| Bazalt | 5 | 1,3 | 80 | 44 | 39 |
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

| Set | Kılıç | Mızrak | Gürz | Topuz | Balta | Kazma |
|---|---|---|---|---|---|---|
| 1 · Bakır | 16 · 346 | 15 · 150 | 18 · 211 | 14 · 143 | 12 · 143 | 11 · 146 |
| 2 · Tunç | 22 · 1.022 | 20 · 454 | 25 · 1.056 | 19 · 650 | 20 · 451 | 18 · 653 |
| 3 · Demir | 34 · 1.278 | 30 · 568 | 39 · 1.320 | 29 · 812 | 30 · 564 | 26 · 816 |
| 4 · Çelik | 46 · 1.667 | 41 · 825 | 53 · 1.862 | 39 · 1.134 | 38 · 1.134 | 34 · 1.136 |
| 5 · Kara çelik | 58 · 5.249 | 52 · 2.568 | 67 · 6.340 | 49 · 3.821 | 50 · 3.821 | 45 · 3.823 |
| 6 · Mor kristal | 72 · 6.561 | 64 · 3.210 | 83 · 7.925 | 61 · 4.776 | 58 · 4.776 | 52 · 4.779 |

- **Dirençler:** Demir zırh kanama %30; Çelik zırh kanama %35; Kara çelik zırh yanık %40, kanama %30; Mor kristal zırh kanama, yanık ve zehir %30. Demir, Çelik, Kara çelik ve Mor kristal çizmeler çamurda yavaşlatmaz. Bütün set parçaları metaldir.
- **Tarifler** (I = setin malzemesi; Tunç ve Demir'in eski 8 parçası eski tarifiyle kalır, yalnızca gürz ve topuz yeni):
  - Miğfer: 2 I, 1 Herhangi tabaklanmış deri, 2 Sinir · Zırh: 5 I, 2 Herhangi tabaklanmış deri, 1 Sinir kirişi · Eldiven: 2 I, 1 Herhangi tabaklanmış deri, 2 İp · Çizme: 2 I, 1 Herhangi tabaklanmış deri, 4 Lif
  - Kılıç: 4 I, 1 Herhangi sap, 1 Herhangi tabaklanmış deri · Mızrak: 2 I, 1 Uzun sopa, 3 İp · Gürz: 5 I, 1 Herhangi sap, 1 Sinir kirişi · Topuz: 3 I, 1 Herhangi sap, 2 İp · Balta: 3 I, 1 Herhangi sap, 2 İp · Kazma: 3 I, 1 Herhangi sap, 2 İp, 2 Taş
- **Fiyat kuralı:** parça fiyatı = en büyüğü (malzemelerin değeri × 1,3; parçanın taban değeri × kademe katsayısı; önceki setteki aynı parça × 1,25). Taban değerler: miğfer 100, zırh 260, eldiven 80, çizme 80, kılıç 180, mızrak 150, gürz 210, topuz 140, balta 110, kazma 120; kademe katsayıları 1 · 2 · 3,5 · 5,5 · 8 · 12. Bu yüzden Tunç ve Demir parçalarının fiyatları da değişti (ör. Demir kılıç 1.086 → 1.278, artık Tunç kılıçtan pahalı).
- **Taş silahlar** setlerin yanında kalır: Taş kılıç 12; Çakmaktaşı mızrak 14; Kuvars mızrak **36**; Bazalt mızrak **46**; Obsidyen mızrak **48** (kademe sırasına göre yükseltildi). Ustaların imza silahları: Granit gürz 27 (artık gürz gibi vurur), Timsah dişi kılıcı 38, Gümüş kılıç 50, Lav camı kılıcı 62, Ejder kılıcı 66, Ametist kılıcı 78 (v2.49 dengelemesi, aşağıda).
- Sonraki adım (bu sürümde yok): aynı kademedeki farklı silahlara dövüşü etkileyen özellikler (kanatma, yakma, zehirleme, sersemletme).

### Dengeleme: imza parçaları ve el yapımı giysiler (v2.49, Boğaç)

- **Kural:** ustaların imza parçaları kendi biyomlarının setinin biraz üstündedir; el yapımı post, pelerin ve kabuk giysiler bir önceki biyomun seti kadar korur (örse gitmeden giyilebilen ucuz seçenek).
- **Silahlar:** Gümüş kılıç 44 → **50**, Lav camı kılıcı 55 → **62**, Ejder kılıcı 52 → **66**, Ametist kılıcı 68 → **78**. (Granit gürz 27 ve Timsah dişi kılıcı 38 zaten setin üstündeydi.)
- **İmza zırhları:** Kartal tüyü miğfer 24 → **31**, Gümüş pullu zırh 52 → **58**, Ejder pulu zırh 60 → **76**, Kül böceği zırh 64 → **72**, Kristal ipek zırh 72 → **90**, Işık pulu eldiven 18 → **29**, Akrep kabuğu çizme 18 → **24**. (Ceviz kabuğu miğfer 15, Meşe kabuk zırh 30, Timsah pulu zırh 46, Bataklık çizmesi 14 zaten setin üstündeydi.) Dirençleri değişmedi.
- **El yapımı:** Kamış çizme 4 → **7**, Bataklık postu pelerin 14 → **22**, Timsah derisi zırh 20 → **26**, Mağara ayısı postu giysi 12 → **32**, Ayı postu pelerin 15 → **36**, Kül postu pelerin 26 → **50**, Lav pulu eldiven 10 → **16**. Çayır ve Orman'ın post giysileri (5–11) ve başlıkları değişmedi.

### Yaylar ve oklar (v2.49, Boğaç)

- **Yay** eldeyken vuruş (tık, Vur düğmesi) fare yönüne (telefonda en yakın düşmana) **bir ok atar**. Ok bir canlıya değince durur. Her atış yayı 1 köreltir (bilenince yenilenir); kör yay atmaz.
- **Ok gerekir:** her atış çantadaki **en güçlü oktan** bir tane harcar. Ok yoksa "Ok yok" yazar. Eski **Ok, Tüylü ok, Zehirli ok, Mor ok** da atılabilir ama yalnızca yeni oklar bitince (×1, ×1,1, ×1,2, ×1,5). Arenada ok harcanmaz.
- **Hasar** = yayın hasarı × okun çarpanı × (1 + 0,03 × (seviye − 1)) × Güç/Güçsüzlük. Okun hızı ve menzili yaydan gelir.
- Yay silah yuvasına girmez; elde tutulur (balta ve kazma gibi alet yuvasında). Silahlar listesinde ayrı bir **Yaylar** grubu vardır.
- Her biyomun yayı o biyomun ağacından ve setinin metalinden yapılır; o biyomun silahçısı ve ondan sonrakiler döver. Okları herkes elle yapar (bir yapımda 10 ok, Basit okta 5).

| Yay | Biyom | Hasar | Bekleme | Menzil | Dayanıklılık | Tarif | Nerede yapılır | Fiyat |
|---|---|---|---|---|---|---|---|---|
| Basit yay | El yapımı (herkes) | 8 | 0,75 sn | 240 | 60 | 1 Uzun sopa, 3 İp, 2 Lif | El yapımı (Tab) | 90 |
| Çam yayı | Çayır | 12 | 0,7 sn | 260 | 80 | 3 Çam odunu, 1 Sinir kirişi, 1 Bakır külçesi | Örs · Demirci Dursun ve bütün silahçı kuzenleri döver | 112 |
| Meşe yayı | Orman | 17 | 0,68 sn | 280 | 110 | 3 Meşe odunu, 1 Sinir kirişi, 1 Tunç külçesi | Örs · Silahçı Durdu (Orman) ve üstü döver | 235 |
| Kızılağaç yayı | Bataklık | 26 | 0,66 sn | 300 | 150 | 3 Kızılağaç odunu, 2 Sinir kirişi, 1 Demir külçesi | Örs · Silahçı Ali (Bataklık) ve üstü döver | 315 |
| Akçaağaç yayı | Kayalık Dağ | 35 | 0,64 sn | 320 | 190 | 3 Akçaağaç odunu, 2 Sinir kirişi, 1 Çelik külçesi | Örs · Silahçı Kaya (Kayalık Dağ) ve üstü döver | 495 |
| Kızıl sedir yayı | Kül Diyarı | 45 | 0,62 sn | 340 | 230 | 3 Kızıl sedir odunu, 2 Sinir kirişi, 1 Kara çelik külçesi | Örs · Silahçı Turan (Kül Diyarı) ve üstü döver | 1.368 |
| Gece ağacı yayı | Mor Kristal Vadisi | 56 | 0,6 sn | 360 | 280 | 3 Gece ağacı odunu, 2 Sinir kirişi, 1 Mor kristal levhası | Örs · Silahçı Kudret (Mor Kristal Vadisi) ve üstü döver | 1.710 |

| Ok | Biyom | Hasar çarpanı | Tarif | Tanesinin fiyatı |
|---|---|---|---|---|
| Basit ok | El yapımı (herkes) | ×0,8 | 2 Dal, 1 Keskin taş, 1 Lif → 5 ok | 2 |
| Bakır ok | Çayır | ×1,0 | 1 Bakır külçesi, 4 Dal, 2 Herhangi tüy → 10 ok | 4 |
| Tunç ok | Orman | ×1,15 | 1 Tunç külçesi, 4 Dal, 2 Herhangi tüy → 10 ok | 21 |
| Demir ok | Bataklık | ×1,3 | 1 Demir külçesi, 4 Dal, 2 Herhangi tüy → 10 ok | 26 |
| Çelik ok | Kayalık Dağ | ×1,45 | 1 Çelik külçesi, 4 Dal, 2 Herhangi tüy → 10 ok | 37 |
| Kara çelik ok | Kül Diyarı | ×1,6 | 1 Kara çelik külçesi, 4 Dal, 2 Herhangi tüy → 10 ok | 127 |
| Mor kristal ok | Mor Kristal Vadisi | ×1,8 | 1 Mor kristal levhası, 4 Dal, 2 Herhangi tüy → 10 ok | 159 |

- **Yayın özel vuruşları** (Dövüş · Özel vuruşlar tablosu): Hızlı atış, Delici ok, Çift ok, Gergin atış, Geri sıçrayıp atış, Ok yelpazesi; ultisi **Ok yağmuru**. Her ok atışı bir ok harcar (ulti harcamaz).

### Gürz ve topuz

- **Gürz:** iki elle sallanan ağır silah. Vuruşu yavaş (0,62 sn), menzili 24, hasarı aynı setin kılıcından %15 fazla. Kombo ve ultileri sersemletir ve geri savurur.
- **Topuz:** tek elle hızlı silah. Vuruşu hızlı (0,36 sn), menzili 20, hasarı kılıçtan %15 az. Komboları art arda vuruşlardır.
- İkisi de silah yuvasına girer, kılıçlarla aynı yerde (Silahlar) listelenir, sallanırken baltanın yukarıdan inen vuruşuyla çizilir. Hareketleri ve ultileri **Dövüş · Özel vuruşlar** ve **Ulti** bölümlerinde.

## Aletler ve silahlar

- **Tür:** axe = balta (odun), pick = kazma (maden), shovel = kürek (kil), rake/can/scythe = tırmık/sulama kabı/tırpan (tarla), fish = olta/ağ/zıpkın, water = su kabı, torch = meşale, sword/spear = kılıç/mızrak (gürz ve topuz da sword türündedir), bow = yay (v2.49), staff = asa, gun = ateşli silah.
- **Kademe:** balta ve kazmanın kademesi hangi ağacı kesip hangi madeni kazabileceğini belirler (biyom tablolarındaki "Gereken balta/kazma"). Daha yüksek kademe her zaman alttakileri de keser.
- **Dayanıklılık:** her kullanımda 1 azalır; sıfırlanınca alet körelir ve çalışmaz. Demirci Dursun "Aletimi bile" ile bileme ücretine yeniler. Hile panelindeki "Sınırsız dayanıklılık" aletleri hiç köreltmez.
- **İş süresi:** bir toplamanın kaç saniye sürdüğü (yetenekler ve seviye kısaltır).

| Alet | Tür | Ne yapar | İş süresi (sn) | Dayanıklılık | Bileme ücreti | Kademe | Silah hasarı |
|---|---|---|---|---|---|---|---|
| Bazalt balta | axe | odun keser | 1,3 | 80 | 100 | 5 | – |
| Çakmaktaşı balta | axe | odun keser | 2,8 | 35 | 25 | 1 | – |
| Demir balta | axe | odun keser | 1,8 | 140 | 180 | 3 | – |
| Granit balta | axe | odun keser | 2,3 | 40 | 25 | 2 | – |
| Kuvars balta | axe | odun keser | 1,6 | 60 | 50 | 4 | – |
| Obsidyen balta | axe | odun keser | 1,2 | 100 | 250 | 5 | – |
| Taş balta | axe | odun keser | 3 | 25 | 10 | 1 | – |
| Tunç balta | axe | odun keser | 2,1 | 90 | 90 | 2 | – |
| Sulama kabı | can | tarlayı sular | 1 | 25 | 10 | – | – |
| Ağ | fish | balık tutar (eline al, suya dön, E) | 3 | 25 | 15 | – | – |
| Balık kapanı | fish | balık tutar (eline al, suya dön, E) | 4 | 40 | 25 | – | – |
| Kemik zıpkın | fish | balık tutar (eline al, suya dön, E) | 2,5 | 30 | 20 | – | – |
| Olta | fish | balık tutar (eline al, suya dön, E) | 3 | 25 | 15 | – | – |
| Pompalı | gun | ateş eder (Pompalı fişeği) | 1 | 999 | 0 | – | – |
| Tabanca | gun | ateş eder (Tabanca mermisi) | 1 | 999 | 0 | – | – |
| Bazalt mızrak | hunt | av ve savaş: uzaktan vurur | 1,3 | 70 | 100 | – | 46 |
| Çakmaktaşı mızrak | hunt | av ve savaş: uzaktan vurur | 2,5 | 30 | 25 | – | 14 |
| Demir mızrak | hunt | av ve savaş: uzaktan vurur | 1,6 | 120 | 200 | – | 30 |
| Kuvars mızrak | hunt | av ve savaş: uzaktan vurur | 1,6 | 55 | 50 | – | 36 |
| Mızrak | hunt | av ve savaş: uzaktan vurur | 3 | 20 | 12 | – | 10 |
| Obsidyen mızrak | hunt | av ve savaş: uzaktan vurur | 1,2 | 90 | 250 | – | 48 |
| Tunç mızrak | hunt | av ve savaş: uzaktan vurur | 2 | 80 | 100 | – | 20 |
| Bazalt kazma | pick | maden kazar | 1,3 | 80 | 120 | 5 | – |
| Çakmaktaşı kazma | pick | maden kazar | 2,8 | 35 | 30 | 1 | – |
| Demir kazma | pick | maden kazar | 1,8 | 140 | 200 | 3 | – |
| Granit kazma | pick | maden kazar | 2,3 | 40 | 30 | 2 | – |
| Kuvars kazma | pick | maden kazar | 1,6 | 60 | 60 | 4 | – |
| Obsidyen kazma | pick | maden kazar | 1,2 | 100 | 300 | 5 | – |
| Taş kazma | pick | maden kazar | 3 | 25 | 15 | 1 | – |
| Tunç kazma | pick | maden kazar | 2,1 | 90 | 100 | 2 | – |
| Tırmık | rake | toprağı hazırlar | 1,4 | 30 | 8 | – | – |
| Tırpan | scythe | ürünü biçer | 1 | 30 | 12 | – | – |
| Boynuz kazma | shovel | kil kazar | 2 | 40 | 25 | – | – |
| Kürek | shovel | kil kazar | 3 | 25 | 10 | – | – |
| Ateş asası | staff | ateş topu atar (mana) | 1 | 999 | 0 | – | – |
| Buz asası | staff | buz oku atar (mana) | 1 | 999 | 0 | – | – |
| Yıldırım asası | staff | zincirleme yıldırım (mana) | 1 | 999 | 0 | – | – |
| Demir kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 120 | 240 | – | 34 |
| Ejder kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 200 | 600 | – | 66 |
| Işın kılıcı | sword | plazma kılıç | 1 | 999 | 0 | – | 60 |
| Taş kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 45 | 15 | – | 12 |
| Tunç kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 80 | 120 | – | 22 |
| Granit gürz | sword | gürz: ağır ve sert vuruş | 1 | 100 | 25 | – | 27 |
| Timsah dişi kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 140 | 222 | – | 38 |
| Gümüş kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 160 | 104 | – | 50 |
| Lav camı kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 200 | 210 | – | 62 |
| Ametist kılıcı | sword | savaşır: hızlı ve güçlü vuruş | 1 | 240 | 168 | – | 78 |
| Kaba meşale | torch | gece aydınlatır | 0 | 1.000.000 | 0 | – | – |
| Meşale | torch | gece aydınlatır | 0 | 1.000.000 | 0 | – | – |
| Bola | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2,5 | 25 | 15 | – | – |
| Dişbudak yayı | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2 | 35 | 30 | – | – |
| Porsuk yayı | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2 | 40 | 40 | – | – |
| Sapan | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 2,5 | 25 | 20 | – | – |
| Tuzak | trap | küçük av (Tuzak: eline al, çayırda E ile kur) | 3 | 20 | 12 | – | – |
| Bakır balta | axe | odun keser | 2,6 | 45 | 32 | 1 | – |
| Bakır kazma | pick | maden kazar | 2,6 | 45 | 32 | 1 | – |
| Çelik balta | axe | odun keser | 1,5 | 190 | 250 | 4 | – |
| Çelik kazma | pick | maden kazar | 1,5 | 190 | 250 | 4 | – |
| Kara çelik balta | axe | odun keser | 1,1 | 240 | 841 | 5 | – |
| Kara çelik kazma | pick | maden kazar | 1,1 | 240 | 841 | 5 | – |
| Mor kristal balta | axe | odun keser | 0,9 | 300 | 1.051 | 6 | – |
| Mor kristal kazma | pick | maden kazar | 0,9 | 300 | 1.051 | 6 | – |
| Bakır mızrak | hunt | av ve savaş: uzaktan vurur | 2,4 | 50 | 33 | – | 15 |
| Çelik mızrak | hunt | av ve savaş: uzaktan vurur | 1,4 | 160 | 182 | – | 41 |
| Kara çelik mızrak | hunt | av ve savaş: uzaktan vurur | 1,2 | 200 | 565 | – | 52 |
| Mor kristal mızrak | hunt | av ve savaş: uzaktan vurur | 1 | 260 | 706 | – | 64 |
| Bakır kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 60 | 76 | – | 16 |
| Bakır gürz | sword | savaşır: ağır, yavaş, sersemletir | 1 | 70 | 46 | – | 18 |
| Bakır topuz | sword | savaşır: hızlı, art arda vuruş | 1 | 60 | 32 | – | 14 |
| Tunç gürz | sword | savaşır: ağır, yavaş, sersemletir | 1 | 95 | 232 | – | 25 |
| Tunç topuz | sword | savaşır: hızlı, art arda vuruş | 1 | 85 | 143 | – | 19 |
| Demir gürz | sword | savaşır: ağır, yavaş, sersemletir | 1 | 140 | 290 | – | 39 |
| Demir topuz | sword | savaşır: hızlı, art arda vuruş | 1 | 125 | 179 | – | 29 |
| Çelik kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 160 | 367 | – | 46 |
| Çelik gürz | sword | savaşır: ağır, yavaş, sersemletir | 1 | 180 | 410 | – | 53 |
| Çelik topuz | sword | savaşır: hızlı, art arda vuruş | 1 | 165 | 250 | – | 39 |
| Kara çelik kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 200 | 1.155 | – | 58 |
| Kara çelik gürz | sword | savaşır: ağır, yavaş, sersemletir | 1 | 220 | 1.395 | – | 67 |
| Kara çelik topuz | sword | savaşır: hızlı, art arda vuruş | 1 | 205 | 841 | – | 49 |
| Mor kristal kılıç | sword | savaşır: hızlı ve güçlü vuruş | 1 | 260 | 1.443 | – | 72 |
| Mor kristal gürz | sword | savaşır: ağır, yavaş, sersemletir | 1 | 280 | 1.744 | – | 83 |
| Mor kristal topuz | sword | savaşır: hızlı, art arda vuruş | 1 | 265 | 1.051 | – | 61 |
| Basit yay | bow | ok atar (ok harcar) | 0,75 | 60 | 20 | – | 8 |
| Çam yayı | bow | ok atar (ok harcar) | 0,7 | 80 | 25 | – | 12 |
| Meşe yayı | bow | ok atar (ok harcar) | 0,68 | 110 | 52 | – | 17 |
| Kızılağaç yayı | bow | ok atar (ok harcar) | 0,66 | 150 | 69 | – | 26 |
| Akçaağaç yayı | bow | ok atar (ok harcar) | 0,64 | 190 | 109 | – | 35 |
| Kızıl sedir yayı | bow | ok atar (ok harcar) | 0,62 | 230 | 301 | – | 45 |
| Gece ağacı yayı | bow | ok atar (ok harcar) | 0,6 | 280 | 376 | – | 56 |
| Huş kabuğu kabı | water | su taşır | 2 | 1.000.000 | 0 | – | – |
| Yaprak kova | water | su taşır | 3 | 1.000.000 | 0 | – | – |


## Zırhlar

Beş yuva vardır: **baş, gövde, el, ayak, silah**. Özellikler penceresinden (C) giyilir. Canavar hasarı **25 / (25 + toplam savunma)** katına iner: 25 savunma hasarı yarıya, 75 savunma dörtte bire indirir.

| Zırh | Yuva | Savunma | Nerede yapılır | Not |
|---|---|---|---|---|
| Deri çarık | Ayak | 3 | El yapımı (Tab) | – |
| Kamış çizme | Ayak | 7 | El yapımı (Tab) | – |
| Tunç çizme | Ayak | 7 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Demir çizme | Ayak | 12 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | çamur, metal |
| Bataklık çizmesi | Ayak | 14 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: zehir %25, çamur |
| Hurda çizme ² | Ayak | 15 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Meka çizme ² | Ayak | 18 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: kanama %20, metal |
| Akrep kabuğu çizme | Ayak | 24 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: zehir %35 |
| Tüylü başlık | Baş | 3 | El yapımı (Tab) | – |
| Kafa lambası | Baş | 3 | – | – |
| Kürk başlık | Baş | 4 | El yapımı (Tab) | – |
| Kemik miğfer | Baş | 6 | El yapımı (Tab) | – |
| Tunç miğfer | Baş | 12 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Ceviz kabuğu miğfer | Baş | 15 | Örs · Zırhçı Duran (Orman) ve üstü döver | – |
| Demir miğfer | Baş | 20 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Fırtına tüyü başlık ² | Baş | 22 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | – |
| Kartal tüyü miğfer | Baş | 31 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Kristal miğfer ² | Baş | 26 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: kanama %30, metal |
| Kürk eldiven | El | 3 | El yapımı (Tab) | – |
| Tunç eldiven | El | 7 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Lav pulu eldiven | El | 16 | El yapımı (Tab) | direnç: yanık %30 |
| Demir eldiven | El | 12 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | metal |
| Mantar lifi eldiven ² | El | 14 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: zehir %40 |
| Ejder pulu eldiven ² | El | 16 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | direnç: yanık %40 |
| Işık pulu eldiven | El | 29 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: zehir %35 |
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
| Mağara ayısı postu giysi | Gövde | 32 | El yapımı (Tab) | – |
| Bataklık postu pelerin | Gövde | 22 | El yapımı (Tab) | direnç: zehir %30 |
| Ayı postu pelerin | Gövde | 36 | El yapımı (Tab) | – |
| Timsah derisi zırh | Gövde | 26 | El yapımı (Tab) | direnç: kanama %40 |
| Tunç zırh | Gövde | 24 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Kül postu pelerin | Gövde | 50 | El yapımı (Tab) | direnç: yanık %40 |
| Meşe kabuk zırh | Gövde | 30 | Örs · Zırhçı Duran (Orman) ve üstü döver | direnç: kanama %15 |
| Demir zırh | Gövde | 40 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: kanama %30, metal |
| Timsah pulu zırh | Gövde | 46 | Örs · Zırhçı Veli (Bataklık) ve üstü döver | direnç: kanama %40, metal |
| Gümüş pullu zırh | Gövde | 58 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %35, metal |
| Ejder pulu zırh | Gövde | 76 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %60, metal |
| Kül böceği zırh | Gövde | 72 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %50, metal |
| Kristal ipek zırh | Gövde | 90 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: kanama %25, yanık %25, zehir %25 |
| Meka zırh ² | Gövde | 90 | Mühendis Işın yapar (600 sikke işçilik) | direnç: kanama %50, yanık %50, zehir %50, metal |
| Bakır miğfer | Baş | 8 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Bakır zırh | Gövde | 16 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Bakır eldiven | El | 5 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Bakır çizme | Ayak | 5 | Örs · Zırhçı Durmuş ve bütün zırhçı kuzenleri döver | metal |
| Çelik miğfer | Baş | 28 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Çelik zırh | Gövde | 54 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | direnç: kanama %35, metal |
| Çelik eldiven | El | 16 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | metal |
| Çelik çizme | Ayak | 16 | Örs · Zırhçı Kayhan (Kayalık Dağ) ve üstü döver | çamur, metal |
| Kara çelik miğfer | Baş | 36 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Kara çelik zırh | Gövde | 68 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | direnç: yanık %40, kanama %30, metal |
| Kara çelik eldiven | El | 21 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | metal |
| Kara çelik çizme | Ayak | 21 | Örs · Zırhçı Tufan (Kül Diyarı) ve üstü döver | çamur, metal |
| Mor kristal miğfer | Baş | 45 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | metal |
| Mor kristal zırh | Gövde | 84 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | direnç: kanama %30, yanık %30, zehir %30, metal |
| Mor kristal eldiven | El | 26 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | metal |
| Mor kristal çizme | Ayak | 26 | Örs · Zırhçı Kuvvet (Mor Kristal Vadisi) ve üstü döver | çamur, metal |


## Evler ve barınaklar (Marangoz Çınar)

| Yapı | Seviye | Çınar'ın aldığı ücret | Tasarımdaki liste fiyatı | Malzeme | Açıklama |
|---|---|---|---|---|---|
| Yaprak barınağı | Sv 1 | 5 | 5 | 8 Dal, 12 Yaprak, 4 Lif | Yatak gerekmez. Bir gecelik: uyanınca dağılır. |
| Deri çadır | Sv 3 | 1.039 | 300 | – | Kalıcı bir çadır. İçinde uyumak için yatak koymalısın. |
| Kulübe | Sv 4 | 510 | 450 | – | Dal ve taştan sağlam bir kulübe. Yatak ister. |
| Kamış kulübe | Sv 5 | 650 | 650 | – | Kamış çatılı, serin bir kulübe. Yatak ister. |
| Kerpiç ev | Sv 6 | 958 | 950 | – | Kalın kerpiç duvarlı ev. Yatak ister. |
| Ahşap ev | Sv 7 | 2.278 | 1.500 | – | Kalas duvarlı, kiremit çatılı ev. Yatak ister. |
| Taş ev | Sv 8 | 4.049 | 2.500 | – | Taştan sağlam bir ev. Yatak ister. |
| Konak | Sv 10 | 8.097 | 5.000 | – | Adanın en görkemli evi. Yatak ister. |
