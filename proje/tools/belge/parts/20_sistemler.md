# Kontroller

| Tuş (bilgisayar) | Ne yapar | Telefonda |
|---|---|---|
| WASD / oklar | Yürü | Kanvası sürükle (görünmez joystick) ya da gideceğin yere dokun |
| Shift | Koş (Koşu yeteneği gerekir) | Çift dokunuş |
| E | Topla, konuş, kapı, yatak, ağacı silkele | Nesneye dokun |
| Q / sol tık | Vur (sol tıkla hayvana tıklamak da vurur) | **Vur** düğmesi (yakın canavara kilitlenir) |
| Boşluk | Atıl / takla (Atılma yeteneği gerekir); yerleştirirken döndür | **Atıl** düğmesi |
| Sağ tık | Savuştur (bas) · savunma duruşu (basılı tut) | **Savuş** düğmesi |
| R | Ulti (çubuk doluyken); değilse robot köpekler menüsü | **Ulti** düğmesi |
| F | En uygun yemeği ye | Tabak simgesi |
| H | Eli boşalt (meyve silkelemek için) | El düğmesi |
| 1–0 | Alet yuvasındaki aleti ele al | Alttaki kutuya dokun |
| Tab | El yapımı | El simgesi |
| B / T / P / K | Kazan / Demirci / Pazar / Tarif kitabı | Menü simgeleri |
| I / C / Y / G | Envanter / Karakter (giyim, istatistik) / Yetenekler / Görevler | Menü simgeleri |
| M / N | Büyük harita / bulunduğun yere işaret koy | Küçük haritaya dokun |
| V | Kamp ateşi kur | – |
| L | Elindeki meşaleye reçine sür | – |
| O / Esc | Ayarlar / duraklat | Çark simgesi |

- Bütün tuşlar **Ayarlar → Kontroller**'den yeniden atanabilir. Telefondaki dövüş düğmelerinin yeri ve boyutu (%60–200) aynı yerden ayarlanır.
- E artık hiç vurmaz; yalnızca toplar ve konuşur.
- Telefon yatay oynanır; dikey tutulunca "Telefonunu yan çevir" ekranı çıkar ("Yine de dikey oyna" ile geçilebilir).

# Temel sistemler

## Can, tokluk, enerji

Değerler seviyeyle artar. 16. seviyeden sonra her seviye bu hesaplarda **iki seviye** sayılır.

| Değer | Sv 1 | Sv 10 | Sv 16 | Sv 25 | Sv 50 | Not |
|---|---|---|---|---|---|---|
| En yüksek can | 100 | 145 | 175 | 265 | 515 | + Sağlık dalı yetenekleri |
| Can yenilenmesi (/sn) | 0,10 | 0,19 | 0,25 | 0,43 | 0,93 | tokluk > 70 iken ×1,5; tokluk 0 iken yenilenmez |
| En yüksek enerji | 100 | 136 | 160 | 232 | 432 | + Derin nefes yetenekleri |
| Enerji yenilenmesi (/sn) | 14 | 18,5 | 21,5 | 30,5 | 55,5 | harcamadan 0,6 sn sonra başlar; yürürken ×0,6 |
| Vuruş hasarı çarpanı | 1,00 | 1,27 | 1,45 | 1,72 | 2,47 | her seviye +%3 |
| Satış çarpanı (seviyeden) | 1,00 | 1,09 | 1,15 | 1,33 | 1,83 | – |

- Toplama hızı her seviye +%3 (33. seviyede durur), yürüme hızı her seviye +%2 (21. seviyede, 1,5 katta durur), şans her seviye +%0,5 (23. seviyede durur).
- **Tokluk** 100'den 0'a **12 dakikada** iner (ilk 2 gün yarı hızda, 3–4. gün ¾ hızda). 35'in altında uyarı, 25'in altında mide guruldar. **0 olunca saniyede 1,6 can** gider.
- **Yemek** yiyince tokluk değerinin %80'i kadar can 15 saniyeye yayılarak dolar. Tamamen tokken (≥ 99) yemek yenmez.
- **Enerji**: koşu saniyede 18, atılma 14, savuşturma 5, her vuruş 4 (yumruk) – 10 (balta/kazma) yer. Enerji biterse "Yoruldun": %30'a dolana kadar koşamaz, vuramazsın. Enerji %35'in altındaysa vuruşlar yavaşlar.
- **Kamp ateşinin** 64 piksel yakınında saniyede +1,4 can.
- Diken: böğürtlen 3, çakmaktaşı 2 can yakar (ilk 3 toplayışta kesin, sonra %20; eldiven giyiliyse hiç). Kirpiye çıplak elle vurmak 3 can.

## Bayılma ve ölüm

- **Can 0 olunca bayılırsın.** Taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) **%20'si ve sikkelerin %20'si kaybolur**; kalan her şey düştüğün yerde bir **çantada** kalır (haritada kurukafa). Çantanın üstüne yürüyünce her şey geri gelir. Kumsaldaki uyanış yerinde can %50 ile uyanırsın.
- Görev eşyaları kaybolmaz (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları; Ekin'in külçe görevi sırasında o külçe).
- Bayıldıktan sonra 60 sn Reis çıkmaz. Bayılmak %60 ihtimalle bir anı açar.
- **Tanrı modu** (hile) açıkken ölünmez.

## Gün, gece ve mor ışık

- **Gündüz 06:00–20:00 = 8 dakika**, **gece 20:00–06:00 = 2,5 dakika**; bir gün yaklaşık 10,5 dakika. Menü ya da konuşma açıkken dünya durur.
- 19:00'dan itibaren kararır; 21:00–04:30 tam karanlıktır.
- **Zifiri karanlık kuralı:** gece elinde meşale yoksa, kafa lamban yoksa, bir ışığın (kamp ateşi vb.) içinde ya da bir evin içinde değilsen sayaç başlar: 3,5 sn "Kim var orada?!", 6,5 sn "Bir şey yaklaşıyor…", **8. saniyede mor ışık iner ve ölürsün**. İlk gece süre 20 sn'dir ve **ilk gece hiçbir şey kaybolmaz**; sonraki gecelerde bayılmadaki gibi %20 kayıp. Ertesi sabah 06:00'da kumsalda uyanırsın.
- İlk kez meşalesiz karanlığa yakalanınca biri sana bir kez **bedava Kaba meşale** fırlatır. İlk 3 gün 17:30'da "Hava kararıyor" uyarısı gelir.
- **Güvenli yerler** (saldırgan canavarlar uzaklaşır, mor ışık gelmez): Ekin'in kampı (352 px), kişilerin ateşleri, Dursun'un ocağı, Zümrüt'ün kazanı (120 px), kendi kamp ateşin (100 px), evin içi. Ateş böcekleri ve mor kıymıklar ışık sayılmaz.

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
| Kazanda yeni tarif öğrenmek | 12 (Kazan bilgesi ile 22) |
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

- **Yetenek ağacı** (Y): 8 dal × 8 = 64 yetenek, sikkeyle alınır. Fiyat seviye şartını belirler: 100 → Sv 1, 250 → Sv 2, 500 → Sv 3, 1.000 → Sv 5, 2.500 → Sv 8, 5.000 → Sv 12 (Savaş dalında bazılarının kendi şartı var). Bütün dallar Normal ve Zor modda görünür. Tam liste "Yetenek ağacı" bölümünde.
- **Koşu** yeteneği için önce **Atılma** alınmalı ve köprü onarılmış olmalı.

## Zorluk

İki mod vardır. **Zor mod** yalnızca tarif keşfini değiştirir (canavarlar, açlık, ekonomi aynı):

- Tarif kitabı kapalıdır; malzemeleri görmek tarifi açmaz.
- Kazanda iki sekme olur: **Tarifle kaynat** ve **Deneyerek bul**. "Dene"ye en çok 6 farklı malzeme atılır; hiçbir şey harcanmaz. Cevaplar yol gösterir: "yeni tarif buldun", "en yakın tarife N malzeme eksik", "bildiğin bir tarifte birlikte", "tek başına bir şey olmuyor", "yanlış yer (örs)". Her tarifin malzeme türü kümesi benzersizdir.
- Kitapta **Tarif satın al**: rastgele kapalı bir tarif 50 sikke.

## Ekonomi

- **Satış** yalnızca Pazarcı Nazlı'ya. Birim fiyat = temel fiyat × satış çarpanı. Satış çarpanı = (1 + Ticaret yüzdesi + Değerli işçilik (yapılmış eşyada) + Toptancı (Hepsini sat) + Keşif defteri ustalığı) × seviye çarpanı; **en çok 2,3**.
- **Şanslı müşteri** satışta %5 (II ile toplam %12) + şans ihtimalle iki kat öder.
- **Satın alma:** yalnızca Nazlı, yalnızca daha önce eline geçmiş **doğal** malzemeler (tohumlar dahil). Alış fiyatı temel fiyatın 2,6 ile 5,6 katı arası (pahalı ve tehlikeli bölge malzemesi daha pahalı).
- Başka hiçbir kişi sikkeyle eşya satmaz; ustalar malzemeyi senden alıp **işçilik** ister (Dursun/Durmuş %15, Kemal %20, ACT 2 ustaları sabit ücret). Rıza evleri sikkeyle yapar.
- **Temel fiyat** formülü: malzemelerin toplam değeri × (1,15 + 0,05 × zincir adımı, en çok 6) + gereken aletin değerinin %10'u.

## Tarifler: kazan, el yapımı, örs, ustalar

- **Kazan yalnızca öğretir:** malzemeleri koyup kaynatırsın, malzemeler gider, tarif öğrenilir (+12 XP); ürün çıkmaz. ACT 1'de Zümrüt'ün, ACT 2'de Ülker'in kazanı.
- **Tarif kitabı** (K): bir tarif öğrenilmiş, bir kişi tarafından kitaba yazılmış ya da (Normal modda) bütün malzemeleri ve aletleri en az bir kez görülmüşse **açık** görünür. Kapalı tariflerin adı titreşen harflerle, bilinmeyen malzemeler "?" ile görünür. Kitapta bir tarife **Takip et** dersen malzemeleri ve elindeki sayıları ekranın üstünde görürsün (aynı anda 1 tarif).
- **El yapımı (Tab):** öğrenilmiş ve örste dövülmeyen, yapı ya da ev eşyası olmayan her tarif. Yap / ×5 / Hepsi.
- **Örs:** aletler ve silahlar Demirci Dursun'da, örste dövülen zırhlar Zırhçı Durmuş'ta. Örs listesinde bir ara parçanın yanındaki **+** o parçayı elindeki malzemeden hemen yapıp örse koyar.
- **Usta Kemal:** yapılar, yataklar, ev eşyaları. **Atölye** kurulursa seçtiğin tarifi 25 sn'de bir kendisi üretir (en çok 50).
- **Zümrüt'ün bilmecesi:** bilinmeyen bir tarifi ipucuyla sorar; öğrenince 30 + 2 × fiyat sikke ve 20 XP.

## Aletler, dayanıklılık, kademe

- Her toplama, isabet ya da balık aletin 1 kullanımını yer. Dayanıklılık rengi yeşilden kırmızıya döner; sıfırda alet çalışmaz, silah yumruk gibi vurur. **Bileme** (Dursun): aletin değerinin onda biri. Kova ve asalar/ateşli silahlar körelmez.
- **Alet yuvaları:** 5 (Alet kemeri dalıyla 6/7/8/10/12). Yuva doluysa yeni alet yere düşer; yerdeki eşya 180 sn sonra kaybolur.
- **Balta kademesi:** Taş 1 · Çakmaktaşı, Granit 2 · Kuvars, Tunç 3 · Bazalt, Demir 4 · Obsidyen 5.
  - 1: Çam, Ladin, Kavak, Elma, Armut, Erik · 2: Meşe, Ceviz, Mürver, Kayın, Ihlamur, Kızılağaç · 3: Huş, Söğüt, Kestane, Akçaağaç, Dişbudak, Bataklık servisi · 4: Ardıç, Porsuk, Kara çam, Kül ağacı, Dikenli akasya, Kızıl sedir, Ateş narı · 5: Mor söğüt, Gece ağacı, Işık ağacı, Yıldız eriği, Ay elması · ACT 2: Yüzen Kayalar ağaçları 1, diğerleri 2.
- **Kazma kademesi** (aynı sıra): 1: Bakır, Kalay, Kireçtaşı, Taş kömürü, Kumtaşı, Granit, Tuz kayası · 2: Kuvars, Arduvaz, Demir cevheri · 3: Bazalt, Gümüş, Altın, Kükürt, Pirit · 4: Obsidyen, Ametist · 5: Kristal (yalnızca Obsidyen kazma). Bir maden damarı 3–5 vuruşta tükenir, 300 sn sonra yeniden dolar.

## Zırh ve durum etkileri

- Beş yuva: baş, gövde, eller, ayaklar, silah. Alınan **fiziksel hasar × 25 / (25 + savunma)**. Keşif defterinin Giyim ve Zırh ustalıkları +5'er savunma verir.
- **Çamur:** Bataklık çamurunda yavaşlarsın (×0,6); Kamış çizme, Demir çizme, Hurda çizme ve Meka çizme bunu önler.
- **Durum etkileri** canavarlardan, alev/zehir gölünden ve zehirli yemekten gelir: **zehir**, **kanama**, **yanık** belirli süre saniyede can yakar; zırh bunu da yarı oranda yumuşatır. Dirençler: Bataklık postu pelerin (zehir %30), Timsah derisi zırh (kanama %40), Kül postu pelerin (yanık %40), Lav pulu eldiven (yanık %30), Demir zırh (kanama %30), Ejder pulu zırh (yanık %60), Mantar lifi eldiven (zehir %40), Kristal miğfer (kanama %30), Ejder pulu eldiven (yanık %40), Meka çizme (kanama %20), Meka zırh (üçü de %50).
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
- Haritada: ölünen yerler (kurukafa), kurduğun ev/yatak/tuzaklar, kişiler.
- **Keşif defteri** (Kitap): her tarif kategorisinde yaptığın tariflerin oranı. **%25** → sikke, **%50** → kalıcı **ustalık**, **%100** → sikke + 100 XP. Ustalıklar: Yiyecek (tokluk %20 yavaş iner), Şifa (can 1,5 kat hızlı), alet kategorileri (%20 körelmeme), Giyim ve Zırh (+5 savunma), Ateş (meşale %30 uzun), Ağaç (odun %20 hızlı), Taş ve kil (%20 hızlı), Av ve hayvan (ganimet +%10); diğerleri o kategorinin eşyalarını %15 pahalı sattırır.

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
| Kılıç | Taş 12 · Tunç 22 · Demir 34 · Ejder kılıcı 52 · Işın kılıcı 60 | 22 | 0,42 sn |
| Mızrak | Mızrak 10 · Çakmaktaşı 14 · Kuvars 18 · Tunç 20 · Bazalt 22 · Obsidyen 28 · Demir 30 | 30 | 0,6 sn |
| Balta | Taş 9 · Çakmaktaşı/Granit 12 · Kuvars 16 · Tunç 20 · Bazalt 24 · Demir 30 · Obsidyen 36 | 20 | 0,5 sn |
| Kazma | Taş 8 · Çakmaktaşı/Granit 11 · Kuvars 14 · Tunç 18 · Bazalt 21 · Demir 26 · Obsidyen 32 | 20 | 0,5 sn |
| Asalar, ateşli silahlar | ACT 2 bölümündeki tablo | 210–340 | |

- Gerçek hasar = silah × (1 + 0,03 × (seviye − 1)) × Güç etkisi 1,2 × Güçsüzlük 0,8. Silah yuvasındaki silah, elde silah yokken kullanılır.
- Vuruş üç evrelidir (hazırlık, darbe, takip); isabette kısa bir donma olur, ıskalarsan bir an açık kalırsın. Her isabet silahı 1 köreltir.
- Reisler ve iri türler (Timsah, Yaban öküzü, Kara ejder, Mağara ayısı, golemler, ejderler, robotlar, muhafızlar) vuruşla geri itilmez.

## Atılma, savuşturma, savunma

- **Atılma / takla** (Boşluk; Atılma yeteneği): 0,38 sn, 50 piksel; boyunca **dokunulmazsın**. 14 enerji (Çevik atılma ile 9), bekleme 0,68 sn. Bir saldırının içinden taklayla geçersen "Sıyrıldın!" +6 enerji.
- **Savuşturma** (sağ tık, darbe değmeden hemen önce): 0,2 sn pencere (telefonda 0,25), 5 enerji. Başarılıysa hasar almazsın, canavar geri savrulur ve **1,6 sn sersemler**, +6 enerji, ulti +10. Fırlatılan diken, ateş ve büyüler de savuşturulur.
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

- Börü bir **alıştırma canavarı** salar: ısırığı zayıftır (canının %5'i), XP ve ganimet vermez, av ve Reis sayaçlarına sayılmaz, Börü'den 230 pikselden uzağa gitmez. Vuruş adımlarında saldırmaz ve canı gitmez; "bitir" adımında canı kolayca bitecek kadar azalır; savuşturma ve kaçma adımlarında 2,2–3,2 saniyede bir saldırır.
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
- **Saldırı:** hazırlık (renkli "!", hedef çizgisi, yerde dolan halka) → atılış → ısırık. Menzilliler 0,6 sn hazırlanıp atar. Bir canavar son saldırısından 1 sn geçmeden yenisine başlayamaz (Reisler hariç).
- **Doğma:** canlılar oyuncunun 330–470 piksel çevresinde doğar, 760 pikselden uzaklaşınca silinir. Gece canlıları gündüz uzaktaysa silinir.

**Özel hamleler** (kovalarken arada bir):

| Hamle | Renk | Ne yapar, nasıl kaçılır |
|---|---|---|
| Sıçrama | sarı (iri türde kırmızı) | İşaret seni izler, sonra kilitlendiği yere atlar; iniş çevresine hasar ve itme. Yana çekil. |
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
- **Tanrı modu:** can, tokluk, enerji, mana hep dolu; ölmezsin. **Hile paneli:** +100 sikke, +100 XP, +2 saat, günü bitir, zamanı sar, eşya arama (miktar 1/10/50/100). **Tek vuruşta öldür**, **Sınırsız dayanıklılık**, **Sınırsız sikke**, **Gece ışığı**, **Hile kısayolları** (Z +100 sikke, X +100 XP), **ACT 2'ye geç**, **Bütün ara sahneler açık**, **Seviyeyi en üste çıkar**, **Haritayı tamamen aç**.

## Kayıt

- Otomatik kayıt + 3 elle kayıt yuvası (tarayıcıda). Dolu yuvaya ilk basış "üzerine yazmak için bir kez daha bas" der.
- Otomatik kayıt dakikada bir, görev durumu değişince, sekme gizlenince, sayfa kapanırken ve menüye dönerken alınır; ara sahne, uyanış, deniz yolculuğu ve can 0 iken alınmaz.
- **Dışa aktar:** bütün kayıtlar tek bir kod (`HAMMADDE1:` ile başlar) ya da dosya. **İçe aktar:** kodu yapıştır ya da dosyayı seç. Kayıtlar her adreste ayrıdır (claude.ai sürümü ile GitHub sürümü arasında bu yolla taşınır).
- Başarımlar, toplama/av listeleri ve tuş atamaları cihaza ayrı kaydedilir.
- Adresin sonuna `?debug` eklenince geliştirici araçları açılır (`window.__ham`).
