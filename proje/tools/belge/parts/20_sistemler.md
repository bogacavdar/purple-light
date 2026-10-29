# Kontroller

| Tuş (bilgisayar) | Ne yapar | Telefonda |
|---|---|---|
| WASD / oklar | Yürü | Kanvası sürükle (görünmez joystick) ya da gideceğin yere dokun |
| Shift | Koş (Koşu yeteneği gerekir) | Çift dokunuş |
| F | Topla, konuş, kapı, yatak, ağacı silkele (v2.04'e kadar E idi). F yalnızca **hemen yanındaki** şeye yönelir: karakterin bir kare çevresi, çaprazlar dahil (en çok ~30 px; iki kare ötedekine gitmez, o zaman hiçbir şey yapmaz). Ağaca yalnızca **elde balta varken**, madene/kayaya yalnızca **elde kazma varken** gider (çantada olması yetmez; v2.07). Sol tıkla elde baltasızken bir ağaca, elde kazmasızken bir madene tıklamak oraya yürütmez, yalnızca o yöne vurur. Elde balta varsa önce ağaç, elde kazma varsa önce maden seçilir; yoksa en yakın toplanacak şey (çalı, yerdeki taş/dal, meyvesi olgun ağaç). Ayağının dibindeki düşmüş eşyalar her zaman önce alınır (v2.05) | Nesneye dokun |
| Q / sol tık | Vur. **Sol tık her zaman tıklanan yöne vurur**, tam tıklanan açıya (çaprazlar dahil; karakter 8 yönlü pozla o yana döner); el boşken yumruk, elde silah/alet varsa onunla (v2.03–2.04). Bir kişiye, kazana/örse/pazara, kurulmuş bir eşyaya ya da toplanacak bir şeye (çalı, maden, ağaç) tıklamak oraya gidip konuşur/toplar. **Yere düşmüş bir eşyaya** (av, odun, taş) tıklamak oraya yürür ve eşya toplanır (v2.10); üstünde bir hayvan varsa önce ona vurulur. **Bir hayvan sana saldırırken** (ekranda seni kovalayan bir hayvan varsa ya da son 3 saniyede ısırıldıysan) sol tık hiçbir şeyi toplamaz, kimseyle konuşmaz, yere düşene yürümez: **her zaman tıklanan yöne vurur** (v2.10). F tuşu ve telefondaki düğmeler bundan etkilenmez; onlarla toplamak sürer. Boş yere tıklamak karakteri yürütmez; yürümek WASD/oklarla |
| Boşluk | Atıl / takla (Börü'nün atılma dersinden sonra); yerleştirirken döndür | **Atıl** düğmesi |
| Sağ tık / E | Savuştur (bas) · savunma duruşu, gard (basılı tut); E sağ tıkla aynıdır (v2.04) | **Savuş** düğmesi |
| R | Ulti (çubuk doluyken); değilse robot köpekler menüsü (arenada R yalnızca ulti) | **Ulti** düğmesi (yalnızca ulti atar, köpek menüsünü açmaz; v1.87) |
| X | En uygun yemeği ye (basılı tut: yemek listesi; v2.04'e kadar F idi) | Tabak simgesi |
| H | Eli boşalt (meyve silkelemek için) | El düğmesi |
| 1–0 | Alet yuvasındaki aleti ele al | Alttaki kutuya dokun |
| Tab | El yapımı | El simgesi |
| B / T / P / K | Kazan / Demirci / Pazar / Tarif kitabı | Menü simgeleri |
| I / C / Y / G | Envanter / Karakter (giyim, istatistik) / Yetenekler / Görevler | Menü simgeleri |
| M / N | Büyük harita / bulunduğun yere işaret koy | Küçük haritaya dokun |
| V | Kamp ateşi kur | – |
| L | Elindeki meşaleye reçine sür | – |
| O / Esc | Ayarlar / duraklat | Çark simgesi |

- **Vuruş tamponu (v2.16):** bir vuruş bitmeden (bekleme süresi dolmadan) yeniden vurursan (sol tık ya da Q) basış kaybolmaz: bekleme bitince (basıştan en çok 0,8 sn sonrasına kadar) **son bastığın yöne** vurulur. Karakter yalnızca vuruş gerçekten atılırken o yöne döner (önceden bekleme sırasında tıklanınca karakter dönüyor ama vurmuyordu).

- Bütün tuşlar **Ayarlar → Kontroller**'den yeniden atanabilir. Telefondaki dövüş düğmelerinin yeri ve boyutu (%60–200) aynı yerden ayarlanır.
- F (toplama tuşu) hiç vurmaz; yalnızca toplar ve konuşur. Diyaloglarda, anılarda ve balık tutarken de F ilerletir (E artık gard tuşu). Hile tuşu "+100 XP" X'ten J'ye geçti. Tuşlar değişse de oyundaki bütün yazılar yeni tuşları gösterir; fareyle bir şeyin üstüne gelince çıkan ipucu da ("F ile topla", "F ile konuş", "sol tık ya da Q ile vur"; v2.06). Ayarlar → Kontroller → "Varsayılana dön" bu yeni tuşlara döner.
- **Karakterin 8 yönü (v1.94, çapraz pozlar v2.02):** karakter yürüdüğü yöne göre 8 pozdan birine döner: **ön** (aşağı), **arka** (yukarı), **sağ/sol profil** (yalnızca tam yana yürürken) ve dört **çapraz** poz; çaprazda karakter bütünüyle döner. **Ön-çapraz** (sağ-aşağı / sol-aşağı): yüz hafif yana dönük (karakter yaratma ekranındaki gibi); gövde gidilen yöne 1 piksel kayar, uzak yanı 2 sütun gölgededir, yaka o yana döner; yalnızca yakın kol görünür (uzak kol hiç çizilmez); bacaklar birbirine yakın, gidilen yandaki ayak bir adım yukarıda, ayak uçları gidilen yöne bakar. **Arka-çapraz** (sağ-yukarı / sol-yukarı): başın yalnızca arkası (saç) görünür, yanak/kulak/göz yok, baş **normal boyda**; sırt dönük çizilir: yakın yan gölgede, ortada sırt çizgisi; yalnızca yakın kol görünür; **ayaklar ön-çaprazdaki çizimle aynıdır** (gidilen yandaki ayak bir adım yukarıda, ayak uçları o yana). 2.01'deki aynalanmış ayaklar beğenilmedi, 2.02'de bu hale geri dönüldü (Boğaç, 29 Ekim 2026). Elde alet varsa kol gidilen yöne uzanır. Yön hareketin açısından seçilir: yatay ve dikey bileşenin ikisi de yeterince büyükse (yaklaşık 22°–68° arası) çapraz poz. Durunca son poz kalır; vururken, toplarken ya da biriyle konuşurken karakter o işe dönük 4 yönlü poza geçer. Karakter yaratma ekranında sürükleyerek çevirince aynı 8 poz görülür (Boğaç, 29 Ekim 2026).
- **Telefonda sol menü kutusu (v2.22):** sol üstteki ☰ düğmesi menü kutusunu açar; **Envanter (çanta)** ve **Yemek** düğmeleri de bu kutunun içindedir (önceden ☰'ün yanında dışarıda dururlardı). Öğretici bu düğmelerden birini gösterdiğinde (parladığında) kutu bir kez kendiliğinden açılır ve ☰ parlar.
- **Telefonda Vur düğmesi yürüdüğün yöne vurur (v2.22):** sol taraftaki görünmez joystick'le yürürken **Vur**'a basınca karakter tam yürüdüğün yöne vurur; **çapraz** yürüyorsan çapraza vurur (karakter 8 yönlü pozla o yana döner). Yakında bir canlı varsa yine ona kilitlenir, ama önce yürüdüğün yöndekini seçer. Dururken basınca son baktığın yöne vurur (eskisi gibi).
- Telefon yatay oynanır; dikey tutulunca "Telefonunu yan çevir" ekranı çıkar ("Yine de dikey oyna" ile geçilebilir).

# Temel sistemler

## Can, tokluk, enerji

Değerler seviyeyle artar. 16. seviyeden sonra her seviye bu hesaplarda **iki seviye** sayılır.

| Değer | Sv 1 | Sv 10 | Sv 16 | Sv 25 | Sv 50 | Not |
|---|---|---|---|---|---|---|
| En yüksek can | 100 | 145 | 175 | 265 | 515 | + Dayanıklılık ağacındaki can yetenekleri |
| Zırh (temel) | 0 | 9 | 15 | 24 | 49 | **seviye − 1** (iki katına sayma kuralı burada yok) + Zırh I–IV yetenekleri (v1.81) |
| Can yenilenmesi (/sn) | 0,10 | 0,19 | 0,25 | 0,43 | 0,93 | tokluk > 70 iken ×1,5; tokluk 0 iken yenilenmez; Hızlı iyileşme ×2/×3/×4 |
| En yüksek enerji | 100 | 136 | 160 | 232 | 432 | + Derin nefes yetenekleri |
| Enerji yenilenmesi (/sn) | 14 | 18,5 | 21,5 | 30,5 | 55,5 | harcamadan 0,6 sn sonra başlar; yürürken ×0,6 |
| Vuruş hasarı çarpanı | 1,00 | 1,27 | 1,45 | 1,72 | 2,47 | her seviye +%3; Güçlü kol ×1,10/×1,25/×1,40 |
| Satış çarpanı (seviyeden) | 1,00 | 1,09 | 1,15 | 1,33 | 1,83 | – |

- Toplama hızı her seviye +%3 (33. seviyede durur), yürüme hızı her seviye +%2 (21. seviyede, 1,5 katta durur), şans her seviye +%0,5 (23. seviyede durur).
- **Tokluk** 100'den 0'a **12 dakikada** iner (Tok karın ile 16 dakikada) (ilk 2 gün yarı hızda, 3–4. gün ¾ hızda). 35'in altında uyarı, 25'in altında mide guruldar. **0 olunca saniyede 1,6 can** gider.
- **Yemek** yiyince tokluk değerinin %80'i kadar (Doyurucu sofra ile %120'si) can 15 saniyeye yayılarak dolar. Tıka basa tokken de yemek yenir (v1.88): tokluk 100'ü geçmez ama yemeğin canı ve yan etkileri (güçlendirmeler, çiğ etin mide bulantısı) yine işler; tanrı modunda da yenir.
- **Enerji**: koşu saniyede 18, atılma 14, savuşturma 5, her vuruş 4 (yumruk) – 10 (balta/kazma) yer. Enerji biterse "Yoruldun": %30'a dolana kadar koşamaz, vuramazsın. Enerji %35'in altındaysa vuruşlar yavaşlar.
- **Kamp ateşinin** 64 piksel yakınında saniyede +1,4 can (Kamp ateşi ustası ile +2,8).
- Diken: böğürtlen 3, çakmaktaşı 2 can yakar (ilk 3 toplayışta kesin, sonra %20; eldiven giyiliyse hiç). Kirpiye çıplak elle vurmak 3 can.

## Bayılma

- **Oyunda ölüm yok (v2.10, Boğaç):** karakter hiçbir zaman ölmez, oyun hiç bitmez. Canavar, açlık, zehir, gece mor ışık: hepsi **bayıltır** ve her bayılmadan sonra uyanırsın. Oyundaki ve belgedeki bütün yazılar "öl" değil "bayıl" der. (Canavarları öldürmek, av ve Reis avı bundan ayrıdır.)
- **Can 0 olunca bayılırsın.** Taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) **%20'si ve sikkelerin %20'si kaybolur**; kalan her şey düştüğün yerde bir **çantada** kalır (haritada kurukafa). Çantanın üstüne yürüyünce her şey geri gelir. Kumsaldaki uyanış yerinde can %50 ile uyanırsın.
- Görev eşyaları kaybolmaz (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları; Ekin'in külçe görevi sırasında o külçe).
- Bayıldıktan sonra 60 sn Reis çıkmaz. Bayılmak %60 ihtimalle bir anı açar.
- **Tanrı modu** (hile) açıkken canavar, açlık ya da zehirle bayılmazsın. **Mor ışık ise tanrı modunda bile bayıltır** (Boğaç'ın kararı, bilinçli: oyunun adı Mor Işık). Gece ışıksız kalırsan tanrı modu seni korumaz.

## Gün, gece ve mor ışık

- **Gündüz 06:00–20:00 = 8 dakika**, **gece 20:00–06:00 = 2,5 dakika**; bir gün yaklaşık 10,5 dakika. Menü ya da konuşma açıkken dünya durur.
- 19:00'dan itibaren kararır; 21:00–04:30 tam karanlıktır.
- **Zifiri karanlık kuralı:** gece elinde meşale yoksa, kafa lamban yoksa, bir ışığın (kamp ateşi vb.) içinde ya da bir evin içinde değilsen sayaç başlar: 3,5 sn "Kim var orada?!", 6,5 sn "Bir şey yaklaşıyor…", **8. saniyede mor ışık iner ve bayılırsın**. İlk gece süre 20 sn'dir ve **ilk gece hiçbir şey kaybolmaz**; sonraki gecelerde bayılmadaki gibi %20 kayıp. Ertesi sabah 06:00'da kumsalda uyanırsın.
- İlk kez meşalesiz karanlığa yakalanınca biri sana bir kez **bedava Kaba meşale** fırlatır. İlk 3 gün 17:30'da "Hava kararıyor" uyarısı gelir.
- **Güvenli yerler** (saldırgan canavarlar uzaklaşır, mor ışık gelmez): Ekin'in kampı (352 px), kişilerin ateşleri (kuzenlerin ateşleri dahil), Dursun'un ocağı, Zümrüt'ün kazanı (120 px), kendi kamp ateşin (100 px), evin içi. Ateş böcekleri ve mor kıymıklar ışık sayılmaz.
- **Güvenli yerlere canavar girmez (v2.22):** kavga edebilen canlılar (*saldırgan* ve *nötr*, Reisler dahil) aşağıdaki güvenli yerlerin sınırında durur, içeri **adım atmaz**; kişilerin yanına gelemez. Seni kovalarken sen güvenli yere girersen sınırda kalır, sonra vazgeçer. Bir şekilde içerde kalmış biri (ör. hücum ya da sıçrama ile) en yakın kenardan dışarı yürür. *Zararsız* canlılar (tavşan, geyik…) eskisi gibi dolaşır. Börü'nün ders canlıları ve arena bu kuraldan muaf.

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
| Kazanda yeni tarif öğrenmek | 12 |
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

- **Yetenek ağacı** (Y; v1.83): üç renkli ağaç — **Savaş** (kırmızı), **Ekonomi** (altın) ve **Dayanıklılık** (yeşil); her birinde 30 yetenek (toplam 90). Yetenekler sade, iki renkli ikonlu yuvarlaklardır; hepsi açılınca bir ağaç silüeti çizer. Başta yalnızca kök yetenek görünür; bir yetenek alınınca **yalnızca ona bağlı üstündekiler** açılır. Satın alma ikona tıklayarak. Fiyat ve seviye şartı kata göre: 100 (–), 250 (Sv 2), 400 (Sv 3), 600 (Sv 4), 1.000 (Sv 6), 1.800 (Sv 8), 3.000 (Sv 11), 5.000 (Sv 14). Tam liste "Yetenek ağacı" bölümünde.
- **Koşu** Savaş ağacının ilk yeteneğidir: yalnızca 100 sikke; seviye, köprü ya da Atılma şartı yok.
- **Atılma** yetenek ağacında değildir: öğreticide Börü ücretsiz öğretir (bkz. "Oyunun akışı").

## Zorluk

İki mod vardır. **Zor mod** yalnızca tarif keşfini değiştirir (canavarlar, açlık, ekonomi aynı):

- Tarif kitabı kapalıdır; malzemeleri görmek tarifi açmaz.
- Kazanda iki sekme olur: **Tarifle kaynat** ve **Deneyerek bul**. "Dene"ye en çok 6 farklı malzeme atılır; hiçbir şey harcanmaz. Cevaplar yol gösterir: "yeni tarif buldun", "en yakın tarife N malzeme eksik", "bildiğin bir tarifte birlikte", "tek başına bir şey olmuyor", "yanlış yer (örs)". Her tarifin malzeme türü kümesi benzersizdir.
- Kitapta **Tarif satın al**: rastgele kapalı bir tarif 50 sikke.

## Ekonomi

- **Satış** yalnızca Pazarcı Nazlı'ya. Birim fiyat = temel fiyat × satış çarpanı. Satış çarpanı = (1 + Ticaret yüzdesi + Değerli işçilik (yapılmış eşyada) + Toptancı (Hepsini sat) + Keşif defteri ustalığı) × seviye çarpanı; **en çok 2,3**.
- **Fiyatsız eşya satılmaz (v2.17):** her eşyanın bir fiyatı olmalı; fiyatı bulunmayan bir eşya pazarda **satılmaz** ("Bu eşyayı Nazlı almıyor"), "Hepsini sat" onu atlar. Meyve ağacı odunları (Elma, Armut, Erik, Mürver) **3 sikke** ve "Herhangi odun" grubundalar (v2.16'ya kadar fiyatları yoktu; satınca sikke **NaN** oluyordu).
- **Bozuk sikke onarımı (v2.17):** kayıt açılırken ya da oyun sırasında sikke sayı değilse (NaN), oyun bunu düzeltir: kayıttaki en son geçerli sikke miktarına (otomatik ve elle kayıtların içinden en yenisi, yoksa 0) döner ve "Sikkelerin onarıldı" der. Görev sayaçlarındaki bozuk değerler de 0'dan sürer.
- **Şanslı müşteri** satışta %5 (II ile toplam %12) + şans ihtimalle iki kat öder.
- **Satın alma:** yalnızca Nazlı, yalnızca daha önce eline geçmiş **doğal** malzemeler (tohumlar dahil). Alış fiyatı temel fiyatın 2,6 ile 5,6 katı arası (pahalı ve tehlikeli bölge malzemesi daha pahalı).
- Başka hiçbir kişi sikkeyle eşya satmaz; ustalar malzemeyi senden alıp **işçilik** ister (Dursun/Durmuş %15, Kemal %20, ACT 2 ustaları sabit ücret). Rıza evleri sikkeyle yapar.
- **Temel fiyat** formülü: malzemelerin toplam değeri × (1,15 + 0,05 × zincir adımı, en çok 6) + gereken aletin değerinin %10'u.

## Tarifler: kazan, el yapımı, örs, ustalar

- **Kazan yalnızca öğretir:** malzemeleri koyup kaynatırsın, malzemeler gider, tarif öğrenilir (+12 XP); ürün çıkmaz. ACT 1'de Zümrüt'ün ve beş kuzen cadının (Yakut, Safir, Firuze, Mercan, İnci) kazanları, ACT 2'de Ülker'in kazanı. Bütün ACT 1 kazanları aynı tarifleri öğretir.
- **Tarif kitabı** (K): bir tarif öğrenilmiş, bir kişi tarafından kitaba yazılmış ya da (Normal modda) bütün malzemeleri ve aletleri en az bir kez görülmüşse **açık** görünür. Kapalı tariflerin adı titreşen harflerle, bilinmeyen malzemeler "?" ile görünür. Kitapta bir tarife **Takip et** dersen malzemeleri ve elindeki sayıları ekranın üstünde görürsün (aynı anda 1 tarif).
- **El yapımı (Tab):** öğrenilmiş ve örste dövülmeyen, yapı ya da ev eşyası olmayan her tarif. Yap / ×5 / Hepsi.
- **Örs:** aletler ve silahlar Demirci Dursun'da ve silahçı kuzenlerinde, örste dövülen zırhlar Zırhçı Durmuş'ta ve zırhçı kuzenlerinde. **Kademe kuralı (v1.84):** her demirci yalnızca kendi biyomunun ve öncekilerin malzemesiyle yapılan eşyaları döver (Dursun/Durmuş: yalnız Çayır); ayrıntı "Zümrüt, Dursun ve Durmuş'un kuzenleri" bölümünde. Örs listesinde bir ara parçanın yanındaki **+** o parçayı elindeki malzemeden hemen yapıp örse koyar.
- **Telefonda bütün pencereler (v2.21):** telefon yatay tutulunca kişilerin ve menülerin bütün pencereleri (Nazlı'nın pazarı, demirciler, Usta Kemal, El yapımı, envanter, yetenek ağacı, tarif kitabı, yemek, köpekler…) **bütün ekranı** kaplar; üstte boşluk kalmaz (öğretici kartı varsa yalnızca ~40 piksel). Başlık satırı ve araç satırı incedir (başlık solda, Kapat sağda), içerik kendi içinde kayar.
- **Telefona göre sıkı düzen (v2.22):** telefon yatay tutulunca bütün pencerelerde sekmeler (Hepsi/Yiyecekler…, Sat/Satın al, Savaş/Ekonomi…, Tarifler/Keşif defteri…) tek ve ince bir satırdır, sığmazsa yana kayar; düğmeler ve satırlar alçak, yazılar küçüktür; uzun açıklama yazıları gizlenir. Ekran ekran:
  - **Envanter:** giysi yuvaları karakterin yanında **tek ince şerit** (her yuva küçük simge + ad); "bir giysi seç…" ve "Taşınabilir eşyaları alttaki yuvalara koy…" yazıları gizli (bir eşya seçilince eylem düğmeleri yine çıkar). Böylece eşyalar açılır açılmaz görünür.
  - **Pazar:** her eşya **tek satır**: ad ×adet, yanında küçük ipucu ("Kazanda şimdi 5 tarifte işe yarar"), fiyat, **1 sat** ve **Hepsi** düğmeleri; ekrana çok daha fazla eşya sığar.
  - **El yapımı:** üstteki uzun açıklama gizli; meşale durumu ince bir satır; tarif satırları alçak, yaptığın eşya hemen görünür.
  - **Yetenek ağacı:** ağaç pencerenin geri kalanını doldurur, düğümler küçüktür.
  - **Tarif kitabı:** üstteki açıklama gizli.
  - **"Yeni malzeme bulundu"** yazısı bir pencere açıkken ekranın ortasına değil **altına, küçük** çıkar; menünün üstünü kapatmaz.
  - **Ayarlar:** pencere ekranın genişliğine yayılır, müzik düğmelerinin yazısı kesilmez.
  - **Ana menü:** "PURPLE LIGHT" yazısı küçülüp sağa kayar; soldaki düğmeler (Yeni oyun, Yükle…) yazının üstüne binmez.
  - **Konuşma penceresi (v2.26):** uzun konuşmalar (ör. görev anlatımları) ekranın üstünden taşmaz: pencere en çok **görünen ekran yüksekliği** kadar olur (iPhone'da adres çubuğu hesaba katılır), yazı kendi içinde kayar, **cevap düğmeleri hep altta görünür**; yazı harf harf gelirken pencere son satırı izler, bitince yukarı kaydırıp baştan okunabilir. Yazılar ve düğmeler telefona göre biraz küçüktür.
- **Telefonda kazan ve örs ekranı (v2.20):** telefon yatay tutulunca kazan (ve örs) penceresi **bütün ekranı** kaplar; ekranın üstünde boşluk bırakılmaz (yalnızca öğretici kartı varsa onun yüksekliği kadar, ~40 piksel). Başlık satırı ince (başlık solda, Kapat sağda), arama satırı tek ve ince satır. Altta iki sütun: solda **tarif listesi** (ekranın ~%38'i), sağda seçilen tarif, malzemeler, kazan, düğmeler ve envanter; ikisi de **kendi içinde kayar**. Kazan alanı alçalır, yazılar ve kareler küçülür. Bilgisayar ve tablet görünümü değişmez.
- **Usta Kemal:** yapılar, yataklar, ev eşyaları. **Atölye** kurulursa seçtiğin tarifi 25 sn'de bir kendisi üretir (en çok 50).
- **Zümrüt'ün bilmecesi:** bilinmeyen bir tarifi ipucuyla sorar; öğrenince 30 + 2 × fiyat sikke ve 20 XP.

## Aletler, dayanıklılık, kademe

- Her toplama, isabet ya da balık aletin 1 kullanımını yer. Dayanıklılık rengi yeşilden kırmızıya döner; sıfırda alet çalışmaz, silah yumruk gibi vurur. **Bileme** (Dursun ve silahçı kuzenleri): aletin değerinin onda biri. Kova ve asalar/ateşli silahlar körelmez.
- **Alet yuvaları:** 5 (Alet kemeri dalıyla 6/7/8/10/12). Yuva doluysa yeni alet yere düşer; yerdeki eşya 180 sn sonra kaybolur.
- **Mıknatıs:** yere düşen küçük eşyalar (yeni düşenler yarım saniye bekler) **21 px** yakına gelince sana doğru süzülür (1.89'a kadar 30 px'ti; %30 kısaltıldı). 10 px içinde hızla çekilir, 6 px'te toplanır; E ile 28 px içindekiler alınır.
- **Ağaç kesince dal ve yaprak düşer (v2.25):** baltayla her kesişte ağacın odununun yanında **1 Dal** ve **1 Yaprak** düşer (Söğüt'ün söğüt dalı ve meyve ağaçlarının meyvesi eskisi gibi ayrıca düşer).
- **İş çubuğunun yazısı:** balta ile ağaç keserken "**Kesiliyor: Çam ağacı**" (ağacın adı), kazma ile kazarken "**Kazılıyor: …**", öbür toplamalarda "Toplanıyor: …" yazar.
- **Balta kademesi:** Taş 1 · Çakmaktaşı, Granit 2 · Kuvars, Tunç 3 · Bazalt, Demir 4 · Obsidyen 5.
  - 1: Çam, Ladin, Kavak, Elma, Armut, Erik · 2: Meşe, Ceviz, Mürver, Kayın, Ihlamur, Kızılağaç · 3: Huş, Söğüt, Kestane, Akçaağaç, Dişbudak, Bataklık servisi · 4: Ardıç, Porsuk, Kara çam, Kül ağacı, Dikenli akasya, Kızıl sedir, Ateş narı · 5: Mor söğüt, Gece ağacı, Işık ağacı, Yıldız eriği, Ay elması · ACT 2: Yüzen Kayalar ağaçları 1, diğerleri 2.
- **Kazma kademesi** (aynı sıra): 1: Bakır, Kalay, Kireçtaşı, Taş kömürü, Kumtaşı, Granit, Tuz kayası · 2: Kuvars, Arduvaz, Demir cevheri · 3: Bazalt, Gümüş, Altın, Kükürt, Pirit · 4: Obsidyen, Ametist · 5: Kristal (yalnızca Obsidyen kazma). Bir maden damarı 3–5 vuruşta tükenir, 300 sn sonra yeniden dolar.

## Zırh ve durum etkileri

- Beş yuva: baş, gövde, eller, ayaklar, silah. Giyilen eşyaların toplamı **savunma**dır; Keşif defterinin Giyim ve Zırh ustalıkları +5'er savunma verir.
- **Zırh** (v1.81) karakterin temel özelliğidir: **seviye − 1** (Sv 1'de 0, Sv 50'de 49) + Dayanıklılık ağacındaki Zırh I–IV yetenekleri (+5 / toplam +12 / +20 / +30). Eşyaya bağlı değildir, hiç çıkmaz.
- Alınan **fiziksel hasar × 25 / (25 + savunma + zırh)**. Zehir, yanık ve kanama da bu oranın yarısı kadar yumuşar. Karakter ekranında "Zırh", "Savunma" ve toplam hasar azalması ayrı ayrı yazar. (Ekin'in "Savunmanı 60'a çıkar" görevi yalnızca eşya savunmasını sayar.)
- **Çamur:** Bataklık çamurunda yavaşlarsın (×0,6); Kamış çizme, Demir çizme, Bataklık çizmesi, Hurda çizme ve Meka çizme bunu önler.
- **Durum etkileri** canavarlardan, alev/zehir gölünden ve zehirli yemekten gelir: **zehir**, **kanama**, **yanık** belirli süre saniyede can yakar; zırh bunu da yarı oranda yumuşatır. Dirençler: Bataklık postu pelerin (zehir %30), Timsah derisi zırh (kanama %40), Kül postu pelerin (yanık %40), Lav pulu eldiven (yanık %30), Demir zırh (kanama %30), Ejder pulu zırh (yanık %60), Mantar lifi eldiven (zehir %40), Kristal miğfer (kanama %30), Ejder pulu eldiven (yanık %40), Meka çizme (kanama %20), Meka zırh (üçü de %50); kuzenlerin zırhları: Meşe kabuk zırh (kanama %15), Timsah pulu zırh (kanama %40), Bataklık çizmesi (zehir %25), Gümüş pullu zırh (kanama %35), Kül böceği zırh (yanık %50), Akrep kabuğu çizme (zehir %35), Kristal ipek zırh (üçü de %25), Işık pulu eldiven (zehir %35). Dayanıklılık ağacındaki Zehre/Ateşe/Kanamaya dayanıklı yetenekleri ilgili hasarı ayrıca %40 azaltır (çarpılarak birleşir); Çelik beden üçünün süresini yarıya indirir; Son nefes canın dörtte birinin altındayken fiziksel hasarı %25 azaltır.
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
- Haritada: bayıldığın yerler (kurukafa), kurduğun ev/yatak/tuzaklar, kişiler.
- **Görevi olan kişiler büyük haritada parlar (v1.90):** üstünde **!** olan (görev veren) her kişinin simgesinin arkasında sarı bir ışık ve dışa doğru açılan iki sarı halka, **?** olan (görevi teslim edilecek) kişide yeşil ışık ve halkalar olur; haritayı açan nereye gideceğini hemen görür. Şu an üstünde çalıştığın görevin kişisi ayrıca sarı zeminli işaretle gösterilir.
- **Keşif defteri** (Kitap): her tarif kategorisinde yaptığın tariflerin oranı. **%25** → sikke, **%50** → kalıcı **ustalık**, **%100** → sikke + 100 XP. Ustalıklar: Yiyecek (tokluk %20 yavaş iner), Şifa (can 1,5 kat hızlı), alet kategorileri (%20 körelmeme), Giyim ve Zırh (+5 savunma), Ateş (meşale %30 uzun), Ağaç (odun %20 hızlı), Taş ve kil (%20 hızlı), Av ve hayvan (ganimet +%10); diğerleri o kategorinin eşyalarını %15 pahalı sattırır.

## Almanak (v2.13)

Sağ altta, küçük haritanın hemen üstünde **Başarımlar**'ın solunda küçük bir **kitap** simgesi (kısayol **U**, Ayarlar → Kontroller'den değişir). Haritanın üstündeki üç düğme (Almanak, Başarımlar, Özellikler) **eşit boyuttadır** ve üçü birlikte haritanın genişliğini geçmez (v2.14). Telefonda düğmeler sağ sütunda alt alta. Adanın canlılarını bölge bölge gösterir.

- **Sol sütun: keşfettiğin biyomlar.** Yalnızca adım bastığın biyomlar görünür, ilk girdiğin sırayla. Çayır'dan hiç çıkmadıysan yalnızca Çayır vardır; Orman'a ilk adım attığında ekranda "Orman" yazısı çıkar ve almanakta **2. satır** olarak Orman açılır. Henüz bilmediğin biyom hiç gösterilmez (sayı da yazmaz).
- **Sağ taraf: seçili biyomun bütün canlıları** (o biyomda karşılaşılabilecek her tür, gece çıkanlar ve seviyeyle gelenler dahil). Her canlı bir kart:
  - **İlk kez öldürülene kadar:** kapkara bir siluet ve **???**; hiçbir bilgi yok.
  - **İlk kez öldürülünce açılır:** resmi, adı, huyu (zararsız / nötr / saldırgan), can, hasar, hız, uzaktan saldırısı ve bıraktığı etki (zehir, yanık…), düşürdükleri, kaç tane avladığın.
  - **Saldırılar ve etkiler (v2.22):** açılan kartta ayrıca şunlar yazar: **Saldırılar** (ısırık/vuruş hasarı; uzaktan saldırıyorsa kaç mermi attığı ve kaç saniyede bir), **Etki** (her isabette bıraktığı zehir/kanama/yanık: saniyede yaklaşık kaç can, kaç saniye), **Özel hamleler** (her biri kısa açıklamasıyla: Sıçrama · iniş çevresine hasar ve itme; Hücum · çarparsa uzağa iter; Sersemleten kükreme · 1,1 sn sersem; Alev püskürtme · yanık; Buz parçaları · 1,3 sn donma; Ağ · 3 sn yavaşlama; Şok · 0,8 sn sersem; Zehir gölü · yerde 5 sn zehir; Yakalayıp fırlatma · savuşturulamaz; Üçlü saldırı · üç vuruş), **Özellikler** (Bağışıklık · ara sıra kısa süre hasar almaz; Çevik · mermilerden ve vuruşlardan yana sıçrar; İri · sıçrama ve hücumu kırmızıdır, savuşturulamaz) ve Reisi olan türlerde **Reisin ek hamleleri** (Reis her zaman kükreme ve üçlü saldırı da yapar). Bilgiler canlının gerçek değerlerinden gelir.
  - **Reis sayacı:** kartın altında "Reis: 3 / 7" (o türden kaç avladın / Reis için kaç gerekir). Sayaç dolunca Reis gelir.
  - **Reis yenilince kart altın rengine döner** ("Reis yenildi"). Her türün Reisi **yalnızca bir kez** yenilir: kart altına boyandıktan sonra o türden ne kadar avlarsan avla Reis bir daha gelmez.
- **Yeni canlı almanağa eklenince (v2.18):** bir türü **ilk kez** öldürdüğünde ekranın ortasında büyük bir yazı çıkar: canlının adı ve altında "**Almanağa eklendi** · U ile bak" (yeni malzeme bulunca çıkan yazıyla aynı yerde, sıraya girer). Her yeni tür için bir kez; Reisler ve ders canlıları sayılmaz.
- **İlk avında almanak gösterilir (v2.18):** oyunda **ilk kez** bir canlı öldürdüğünde (almanakta hiç açık kart yokken) Almanak düğmesi **mavi parlar** ve yanında yanıp sönen bir **ok** olur (öğreticinin gösterme kuralı gibi); ekranda "Almanağı aç: U" yazar. Parlama ve ok, Almanak açılınca söner. Telefonda düğme ☰ menüsünün içindeyse önce ☰ parlar.
- **Reise yenilirsen:** Reis sahadayken (ya da gelmek üzereyken) bayılırsan Reis kaybolur ve sayaç **bir eksik** kalır (ör. 6 / 7), sanki onu çağıran son av hiç yapılmamış gibi. O türden bir tane daha avlayınca Reis yeniden gelir; yenene kadar böyle sürer. (Bayıldıktan sonra 60 sn hiçbir Reis gelmez kuralı geçerli.)
- Almanak açıkken oyun durur. Kaydedilecek yeni bir şey yok: biyomlar, avlar ve Reisler zaten kayıtta; eski kayıtlarda bugüne kadar avladıkların açık gelir.

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
| Kılıç | Taş 12 · Tunç 22 · Granit gürz 27 · Demir 34 · Timsah dişi kılıcı 38 · Gümüş kılıç 44 · Ejder kılıcı 52 · Lav camı kılıcı 55 · Ametist kılıcı 58 · Işın kılıcı 60 | 22 | 0,42 sn |
| Mızrak | Mızrak 10 · Çakmaktaşı 14 · Kuvars 18 · Tunç 20 · Bazalt 22 · Obsidyen 28 · Demir 30 | 30 | 0,6 sn |
| Balta | Taş 9 · Çakmaktaşı/Granit 12 · Kuvars 16 · Tunç 20 · Bazalt 24 · Demir 30 · Obsidyen 36 | 20 | 0,5 sn |
| Kazma | Taş 8 · Çakmaktaşı/Granit 11 · Kuvars 14 · Tunç 18 · Bazalt 21 · Demir 26 · Obsidyen 32 | 20 | 0,5 sn |
| Asalar, ateşli silahlar | ACT 2 bölümündeki tablo | 210–340 | |

- **Vuruş ne zaman değer (v2.08):** vuruşun çizildiği yer (karakterin göğsü) ile canlının **gövdesi** arasındaki uzaklık, silahın menzili + canlının boyu + 3 pikseli geçmiyorsa ve canlı vuruş yönünün en çok ~95° yanındaysa (çaprazlar dahil, geniş bir koni) vuruş değer ve hasar verir. Vuruş efekti canlının görseline değdiği an hasar sayılır; çok yakındaki (gövdesine yapışık) canlı yönden bağımsız vurulur. Yumruk ve tek elli silahlar ilk değdiği canlıya vurur.
- **Canlının her yeri sayılır (v2.12):** uzaklık canlının gövde noktasına değil, **çiziminin kapladığı kutuya** (kıskaçlar, kuyruk, boynuz, kanat dahil; gölge ve can çubuğu hariç; her tür ilk vuruşta bir kez ölçülür, yöne göre aynalanır, büyük Reislerde boyla çarpılır) ölçülür: göğüsten kutunun en yakın noktasına uzaklık silahın menzili + 3 pikseli geçmiyorsa ve o nokta vuruş yönünün en çok ~95° yanındaysa vuruş değer. Böylece kerevitin kıskacına, geyiğin boynuzuna değen vuruş da hasar verir. **Bütün canlılarda** (iki adada da, Reisler dahil) geçerlidir; çizimi ölçülemeyen bir canlı olursa yukarıdaki eski kural kullanılır.

- Gerçek hasar = silah × (1 + 0,03 × (seviye − 1)) × Güç etkisi 1,2 × Güçsüzlük 0,8. Silah yuvasındaki silah, elde silah yokken kullanılır.
- Vuruş üç evrelidir (hazırlık, darbe, takip); isabette kısa bir donma olur, ıskalarsan bir an açık kalırsın. Her isabet silahı 1 köreltir.
- Reisler ve iri türler (Timsah, Yaban öküzü, Kara ejder, Mağara ayısı, golemler, ejderler, robotlar, muhafızlar) vuruşla geri itilmez.

## Atılma, savuşturma, savunma

- **Atılma / takla** (Boşluk; öğreticide Börü ücretsiz öğretir): 0,38 sn, 50 piksel; boyunca **dokunulmazsın**. 14 enerji, bekleme 0,68 sn (Çevik atılma I/II/III: 9/7/5 enerji, 0,45/0,38/0,30 sn; Uzun atılma: %25 daha uzağa). Bir saldırının içinden taklayla geçersen "Sıyrıldın!" +6 enerji (Sıyrılma ustası ile +14).
- **Savuşturma da öğrenilir (v2.15):** oyunun başında savuşturma ve gard (sağ tık / E, telefonda Savuş düğmesi) **kapalıdır**; Börü takla dersinin hemen ardından ücretsiz öğretir (öğretici, 11. adım). Öğreticiyi atlayan Börü ile konuşunca ücretsiz öğrenir. Bilmeden basınca "Savuşturmayı henüz bilmiyorsun: Savaşçı Börü öğretir" der; telefonda Savuş düğmesi öğrenilince görünür. v2.14 ve önceki kayıtlarda takla (Atılma) biliniyorsa savuşturma da bilinir sayılır.
- **Savuşturma** (sağ tık, darbe değmeden hemen önce): 0,2 sn pencere (telefonda 0,25; Savuşturma ustası I/II ile ×1,3 / ×1,6), 5 enerji. Başarılıysa hasar almazsın, canavar geri savrulur ve **1,6 sn sersemler**, +6 enerji, ulti +10. Fırlatılan diken, ateş ve büyüler de savuşturulur.
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

- Börü bir **alıştırma canavarı** salar: ısırığı zayıftır (canının %5'i), XP ve ganimet vermez, av ve Reis sayaçlarına sayılmaz, Börü'den 230 pikselden uzağa gitmez. Ölürse ya da kaybolursa Börü'nün yanındaysan 1,5 sn sonra yenisi gelir; sayı sınırı yoktur (v1.79; önceden ders başına 16'da kesiliyor, ders bitirilemez kalıyordu). "Tek vuruşta öldür" hilesi alıştırma canavarına işlemez (v1.79).
- **Ders sürerken Reis gelmez** (v1.79): ders sırasında vahşi hayvan avlayıp bir Reisin sayısını doldurursan Reis ders bitince (ya da bırakılınca) gelir.
- Alandan çıkınca sorulan "Derse dön" seni Börü'nün yakınına (yaklaşık 140 piksel) geri koyar (v1.79; önceden 230 pikselde, sınırın dibinde bırakıyordu). Vuruş adımlarında saldırmaz ve canı gitmez; "bitir" adımında canı kolayca bitecek kadar azalır; savuşturma ve kaçma adımlarında 2,2–3,2 saniyede bir saldırır.
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
- **Saldırı:** v2.15'ten beri ayrı bir hazırlık beklemesi yok: kırmızı **"!"** belirdiği an (0,1 sn içinde) canavar sana doğru **atılır** (0,3 sn) → ısırık. (v2.14'e kadar: 0,42 sn hazırlık, hedef çizgisi, dolan halka, sonra 0,2 sn atılış.) Menzilliler 0,6 sn hazırlanıp atar. Bir canavar son saldırısından 1 sn geçmeden yenisine başlayamaz (Reisler hariç).
- **Atılış hep sana doğru, kaçarsan işlemez (v2.15):** canavar ! ile birlikte o an **bulunduğun yere** atılır; atılış başladıktan sonra **yolu değişmez**, düz gider. ! görünür görünmez takla atarsan (ya da yolundan çekilirsen) kaçarsın, ısırık işlemez; sana değerse ısırık işler. Çok erken atılan takla biter ve işe yaramaz. Üstüne atlayan **bütün canlılar** böyledir; Börü'nün alıştırma kereviti de (orada atılış 0,45 sn, daha yavaş). **Savuşturma** (sağ tık / E basılı, telefonda Savuş) da kaçırır: ısırık değmeden en çok 0,2 sn önce basılırsa beyaz ve sarı ! savuşturulur (kırmızı ! yalnızca taklayla kaçılır). !'in rengi atılışla birlikte görünür; sarı ve kırmızı vuruşlara eklenen ayrı bekleme (0,18 / 0,3 sn) kalktı.
- **Saldırırken yüzü hep sana dönük (v2.18):** bir canavar saldırıya geçtiği andan bitene kadar (kırmızı/sarı işaret, menzillinin 0,6 sn hazırlığı, Reis hamlelerinin hazırlığı, kükreme, alev, kavrama, üçlü vuruş, hamleden sonraki yorgunluk) yüzünü hep karakterine çevirir; sen etrafında dönsen de sırtını dönmez. Geri geri kaçan menzilliler de sana bakarak çekilir. Yalnızca gövdesiyle hızla yol aldığı anlarda (atılış, sıçramada havadayken, hücumda koşarken) gittiği yöne bakar. Tam üstünde ya da altındayken (yatayda 3 pikselden yakın) yönünü değiştirmez, titremesin diye.
- **Doğma:** canlılar oyuncunun 330–470 piksel çevresinde doğar, 760 pikselden uzaklaşınca silinir. Gece canlıları gündüz uzaktaysa silinir.

**Özel hamleler** (kovalarken arada bir):

| Hamle | Renk | Ne yapar, nasıl kaçılır |
|---|---|---|
| Sıçrama | sarı (iri türde kırmızı) | v2.15: işaret çıktığı an (0,12 sn) **o an bulunduğun yere** atlar; havadayken (0,42 sn) yolu değişmez. İniş çevresine hasar ve itme. Yana çekil ya da inerken taklada ol. |
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

Ana menüde **⚔ Arena**; iyi ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır. Seviye (1/10/25/50), giyim ve silah seçilir; iki adanın bütün canlıları ve Reisleri ile dövüşülür. Arenada bütün yetenekler, **atılma** ve **savuşturma/gard** açıktır (v2.24; önceden savuşturma kapalıydı, telefonda Savuş düğmesi çıkmıyordu). Varsayılan olarak kimsenin canı gitmez (hasar ölçülür), enerji/mana/mermi sınırsızdır; "Gerçek dövüş" anahtarıyla gerçek olur. Arenada hiçbir şey kaydedilmez ve başarım işlemez. **Arena kayda asla dokunmaz (v2.24):** arenaya bir kez girildikten sonra sayfa yeniden açılana kadar hiçbir kayıt (otomatik ya da elle) yazılmaz; arenadan çıkarken de yazılmaz. (v2.23'e kadar arenadan çıkarken sayfa kapanırken çalışan otomatik kayıt, arena karakterini — ör. 50. seviye — gerçek oyunun otomatik kaydının üstüne yazıyordu; o kayıt geri gelmez, elle kayıtlar etkilenmedi.)

## Hileler

- **Açmak:** ana menüde klavyeyle `cheat` yaz (tekrar yazınca kapanır) ya da telefonda Ayarlar başlığına art arda 3 kez dokun. Sayfa her açıldığında bütün hile anahtarları kapalı başlar.
- **Tanrı modu:** can, tokluk, enerji, mana hep dolu; canavarla ve açlıkla bayılmazsın, ama **mor ışık seni yine bayıltır** (bilinçli). **Hile paneli:** +100 sikke, +100 XP, +2 saat, günü bitir, zamanı sar, eşya arama (miktar 1/10/50/100). **Tek vuruşta öldür**, **Sınırsız dayanıklılık**, **Sınırsız sikke**, **Gece ışığı**, **Hile kısayolları** (Z +100 sikke, X +100 XP), **ACT 2'ye geç**, **Bütün ara sahneler açık**, **Seviyeyi en üste çıkar**, **Haritayı tamamen aç**.

## Kayıt

- Otomatik kayıt + 3 elle kayıt yuvası (tarayıcıda).
- **Üzerine yazma (v2.15):** kaydetme menüsünde dolu bir yuvaya basınca bir soru çıkar: "Bu yuvada bir kayıt var (Seviye…, tarih). Yeni kaydı üzerine yazayım mı?" → **Üzerine yaz** / **Vazgeç**. (Önceden "bir kez daha bas" uyarısıydı.)
- **Kaydı sil (v2.15):** kaydetme ve yükleme menülerinde her dolu yuvanın yanında **Sil** düğmesi (yükleme menüsünde otomatik kayıt da silinebilir). Basınca sorar: "Kayıt 2 silinecek. Emin misiniz? Bu geri alınamaz." → **Eminim, sil** / **Vazgeç**. Silinince yuva boşalır.
- Otomatik kayıt dakikada bir, görev durumu değişince, sekme gizlenince, sayfa kapanırken ve menüye dönerken alınır; ara sahne, uyanış, deniz yolculuğu ve can 0 iken alınmaz.
- **Aynı oyun iki sekmede (v2.10):** başka bir sekmede oyun açılınca (Devam et, Yükle, Yeni oyun ya da adalar arası geçiş) bu sekme "eski" sayılır ve artık **otomatik kayıt almaz** (yoksa arka plandaki eski sekme dakikada bir eski halini yazıp yeni sekmedeki ilerlemenin üstüne geçiyordu; "Devam et" eski kaydı açıyordu). Eski sekmeye dönünce bir kez uyarı çıkar: "Bu oyun başka bir sekmede ilerledi…". O sekmede bir kayıt yüklenir ya da yeni oyun başlatılırsa sekme yeniden kaydeder; elle kayıt her zaman alınır. "Devam et" her zaman en yeni kaydı (otomatik ya da elle) açar.
- **Dışa aktar:** bütün kayıtlar tek bir kod (`HAMMADDE1:` ile başlar) ya da dosya. **İçe aktar:** kodu yapıştır ya da dosyayı seç. Kayıtlar her adreste ayrıdır (claude.ai sürümü ile GitHub sürümü arasında bu yolla taşınır).
- Başarımlar, toplama/av listeleri ve tuş atamaları cihaza ayrı kaydedilir.
- Adresin sonuna `?debug` eklenince geliştirici araçları açılır (`window.__ham`).
