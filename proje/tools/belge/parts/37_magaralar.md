# ACT 1 · Mağaralar (v2.32)

> **v2.32, Boğaç (30 Ekim 2026).** Her biyomda bir mağara olacak; ilk pakette **Çayır** ve **Orman** mağaraları var. Mağaraya meşalesiz ve seviyesi yetmeyen giremez. İçeride kendi canlıları, Reis'leri, toplanan malzemeleri ve en dipte bir yan görev kişisi vardır; o kişinin görevi mağaranın **boss'una** götürür.

## Genel kurallar

1. **Giriş.** Mağaranın girişi büyüktür (genişliği ~4–5 ağaç, ~100 × 76 piksel kayalık bir tepe ve ortasında karanlık bir ağız). Ana kişilerden ve ateşlerden en az ~400 piksel uzakta, kendi biyomunda, ağaçsız bir yerdedir (ada her kurulduğunda aynı yer). Ağzın önünde ahşap bir tabela durur: mağaranın adı ve **seviye şartı** ("Yankı Mağarası · Sv 5").
2. **Şartlar.** **Girişe tıklayınca (v2.66, Boğaç)** karakter mağaranın ağzına yürür ve bir pencere açılır: "Mağaraya girmek ister misin?", altında iki şart işaretiyle (✓/✗ en az X. seviye, ✓/✗ elinde yanan bir meşale). **Mağaraya gir** düğmesi yalnızca iki şart da tamamsa basılır; **Vazgeç** (ya da Esc) kapatır, Enter girer. Ağzın önünde **F** de aynı pencereyi açar. Eski davranış (şart tutmazsa karakterin söylediği): seviye yetmiyorsa karakter "Bu mağara bana göre değil… en az **5. seviye** olmalıyım (şimdi 3)." der. Seviye yetiyor ama **elinde yanan bir meşale yoksa** "Meşalesiz giremem; içerisi zifiri karanlık." der (kafa lambası yetmez). İkisi de tamamsa girer.
3. **Yükleme.** Girerken kısa bir yükleme ekranı (~0,9 sn): mağaranın adı ve "Mağaraya giriliyor…". Çıkarken "Gün ışığına çıkılıyor…".
4. **İç alan.** Her mağara ayrı bir alandır: istenen boyut biyomun dörtte biriydi (~107 × 107 karo); adada kişilerden, ateşlerden ve yerlerden uzak, buna sığan en büyük kuru alan **~89 × 89 karo** (biyomun yaklaşık beşte biri) olduğu için mağaralar bu boyuttadır. İçinde kıvrımlı tüneller, ~18 yan kol ve oda, en dipte büyük bir oda vardır. Giriş en alttadır; en derin oda en uzak uçtadır. İçeride **hava yoktur** (yağmur, sis, rüzgâr, şimşek ve gök gürültüsü yok; dışarının hava ve ortam sesleri de içeri gelmez — v2.72, Boğaç: "mağarada yağmur yağıyor"), mor ışık gelmez, gün ışığı yoktur: her yer gece gibi karanlıktır.
5. **Meşale.** **Mağarada hava meşaleyi etkilemez (v2.66, Boğaç: "mağarada meşale çok hızlı tükeniyor"):** dışarıda yağmur ya da fırtına varken meşale 2–2,7 kat hızlı yanar; içeride hava olmadığı için mağarada her zaman normal hızda yanar. Meşale sol eldeyken her saldırıda harcanan pay da mağarada **üçte birdir** (dışarıda %4,5, içeride %1,5). Mağarada meşalenin aydınlattığı alan **2 katıdır** (Kaba meşale 160 px, Meşale 230 px; ışığın dışı karanlıktır). Meşale içeride biterse (ya da elinden indirilirse) her yer **zifiri karanlık** olur; karakter "Meşalem bitti! Hiçbir şey göremiyorum…" der ve 1,5 sn sonra kendini mağaranın dışında, girişin önünde bulur (eldeki meşaleyi indirdiysen 3 sn içinde yeniden eline alırsan kalırsın). Mağaranın ağzından içeri vuran soluk bir ışık ve parlayan mantarlar ya da reçineler küçük ışık halkaları yapar ama yolu göstermeye yetmez.
6. **Çıkış.** İçeride girişin olduğu yerde ışıklı bir **"ÇIKIŞ" tabelası** ve aşağı ok durur (v2.66; v2.77: tabela mağara zemininin üstüne çizilir, önceden görünmüyordu). **Giriş ve çıkış sarı parlar (v2.77, Boğaç):** dışarıda mağaranın ağzında, içeride çıkışta yerde nabız gibi atan sarı bir halka ve ışıltı vardır; gece de görünür (ağzın 60 px ışığı). Çıkış alanı 56 px'tir (tıklama 50 px). Başlangıç/çıkış noktası her zaman yürünebilir zemindedir (mağara kurulurken su ağzın üstündeki hücreyi silerse en yakın zemine alınır). Tabelaya tıklayınca ya da yanında **F**: "Mağaradan çıkıp gün ışığına dönmek ister misin?" penceresi, **Mağaradan çık** düğmesiyle. Bayılırsan mağaradan çıkarılırsın (her zamanki gibi uyanma yerinde uyanırsın).
7. **Kayıt.** Mağaradayken kaydedilirse oyun, kayıt açılınca seni **mağaranın girişinin önünde** başlatır. Mağarada açtığın yerler (harita) kaydedilir.
8. **Harita.** Dışarıda mağaranın girişi küçük ve büyük haritada **mağara simgesiyle** görünür (o biyoma ayak basmışsan); büyük haritada üzerine gelince adı ve şartı yazar ("Yankı Mağarası · Sv 5 · meşale"). Mağaranın içindeyken harita **mağaranın kendi haritasını** gösterir: yürüdükçe açılan tüneller, giriş ve en dipteki kişi.
9. **Canlılar.** Her mağarada **3 canlı türü** yaşar; yalnızca o mağarada çıkarlar (dışarıda yoktur). Mağarada dolaşırken çevrende (200–420 px) karanlıkta doğarlar. Her tür adanın öbür canlıları gibi **Reis** sayacına sahiptir: yeteri kadar avlayınca o türün Reisi gelir. Almanakta biyomun canlılarının altında ayrı bir **"Mağara: …"** bölümünde görünürler (mağaraya bir kez girmiş olmak yeter).
10. **Mağara boss'u.** Her mağaranın bir boss'u vardır; doğrudan **Reis biçimindedir** (mor parıltılı, iri). Yalnızca en dipteki kişinin görevinde çağrılır. Almanakta mağara bölümünün sonunda durur:
    - hiç karşılaşılmadıysa: kapalı kart ("???", "Henüz karşılaşmadın");
    - karşılaşıp yenemediysen (bayıldıysan): özellikleri açılır (can, hasar, hız, hamleler, düşürdükleri) ama kart **altın değildir** ("Karşılaştın, henüz yenemedin");
    - yendiysen kart kendiliğinden **altın** olur ("★ Yenildi").
11. **Yan görev.** Her mağaranın en derin odasında bir **yan görev kişisi** vardır (yan görev kuralları geçerlidir: ana görevle birlikte yapılır, bayılınca yalnızca yan görev iptal olur). Kişi başında mavi "?" ile görünür; yalnızca mağaranın içinden ulaşılır (dış haritada işaret yoktur). Görev bir hikâyeyle başlar, mağarada toplanan bir malzemeyi ister, sonra boss'u çağırır. Boss'la karşılaşıp bayıldıysan ve kişiye **ikinci kez** gidersen, görev en baştan başlamaz: kişi doğrudan "Hazır mısın?" diye sorar ve boss hemen çağrılır. Boss yenilince kişiye dönülür; görev biter.
12. **Malzemeler.** Her mağarada **Mağara mantarı** da toplanır (v2.77, Boğaç: yalnızca mağaraların içinde çıkar, dışarıda yoktur; çiğ yenir, zehirli). Ayrıca mağarada **2 toplanabilir** malzeme (duvar diplerinde, her girişte yeniden dizilir; içerideyken yeniden çıkmaz) ve canlılardan düşen malzemeler vardır. **Hepsinin bir satış fiyatı vardır** (Nazlı'ya satılır) ve her biri **en az bir tarifte** kullanılır. Bu tarifler **kazandan öğrenilir** (malzemeler bir kez bulununca Normal modda açık görünür); çoğu tarif kitabında az tarif olan kategorilerdendir (Büyü, Müzik, Boya, Şifa, Av ve hayvan) ve iki tanesi yemektir.

## 1 · Yankı Mağarası (Çayır · Sv 5)

Çayır'ın kayalık bir köşesinde, ağzından serin hava ve damla sesleri gelen alçak tavanlı bir mağara. Duvarlarda mavi parlayan mantarlar, tavandan sarkan damla taşları.

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Mağara yarasası | saldırgan | 22 | 7 | 78 | 10 | uçar, 2–4'lü sürü | Yarasa zarı (%80) |
| Kör kertenkele | nötr | 40 | 9 | 40 | 12 | vurulunca saldırır | Kör kertenkele eti (her zaman), Kertenkele pulu 1–2 (%60) |
| Taş örümceği | saldırgan | 55 | 12 | 56 | 16 | ısırığı kanatır | Taş örümceği ipi 1–2 (%80) |

**Boss · Yankı Kraliçesi** (Reis biçiminde dev yarasa): can 900, hasar 22, hız 62, uçar, XP 400; düşürdükleri: Kraliçe pençesi (her zaman), Yarasa zarı 3–5.

**Toplanabilenler:** Yankı mantarı (mavi parlar; elle), Damla taşı (elle).

**Yan görev · Madenci Kaya — "Yankı Kraliçesi"** (en dipteki odada, elinde feneriyle oturan yaşlı bir madenci)
- *Hikâye:* "Kırk yıl bu mağarada damla taşı kazdım. Bir gece mor ışık mağaranın ağzına indi; yarasalar delirdi. En dipteki büyük yarasa, **Yankı Kraliçesi**, o geceden beri uyumuyor. Çığlığı taşları çatlatıyor; bir gün tavan çökecek ve köyün içtiği dere bu mağaradan çıkıyor. Onu yuvasından çıkarmanın tek yolu ışık: Yankı mantarları ona annesini hatırlatır. **4 Yankı mantarı** getir, fenerime koyayım."
- *Getir:* 4 Yankı mantarı. Kaya mantarları fenerine koyar: "Işık hazır. Kulaklarını tıka evlat… geliyor!"
- *Boss:* Yankı Kraliçesi odaya iner; yen.
- *Dön:* "Mağara sustu. Damlaları dinle… artık yalnızca su sesi var. Sağ ol." Görev biter.
- *İkinci deneme:* "Yine geldin. Fener hazır, mantarlar yerinde. Kraliçeyi çağırayım mı?" → **Çağır**.
- *Ödül:* 300 sikke · 250 XP (boss'u yenince ayrıca Reis ödülü: sikke ve boss'un XP'si). *Sonra:* "Damla taşı kazmaya döndüm. Kraliçe olmadan mağara çok sessiz, biraz da özlüyorum."

**Malzemeler ve fiyatlar**

| Malzeme | Nereden | Fiyat (sikke) | Kullanıldığı tarif |
|---|---|---|---|
| Yankı mantarı | toplanır | 14 | Yankı çorbası, Kraliçe tılsımı |
| Damla taşı | toplanır | 12 | Kertenkele merhemi, Damla akı boyası |
| Yarasa zarı | Mağara yarasası | 16 | Yarasa zarı davul |
| Kör kertenkele eti | Kör kertenkele | 14 | Yankı çorbası (çiğ de yenir) |
| Kertenkele pulu | Kör kertenkele | 18 | Kertenkele merhemi |
| Taş örümceği ipi | Taş örümceği | 22 | Yarasa zarı davul, Kraliçe tılsımı |
| Kraliçe pençesi | Yankı Kraliçesi | 260 | Kraliçe tılsımı |

**Tarifler (kazanda öğrenilir)**

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Yankı çorbası | Yiyecek | 2 Yankı mantarı, 1 Kör kertenkele eti, 2 Su, 1 Ateş | 70 |
| Kertenkele merhemi | Şifa | 2 Kertenkele pulu, 1 Damla taşı, 1 Su | 75 |
| Damla akı boyası | Boya | 2 Damla taşı, 1 Su | 40 |
| Yarasa zarı davul | Müzik | 3 Yarasa zarı, 2 Taş örümceği ipi, 2 Dal | 130 |
| Kraliçe tılsımı | Büyü | 1 Kraliçe pençesi, 2 Yankı mantarı, 1 Taş örümceği ipi | 420 |

## 2 · Kök Mağarası (Orman · Sv 10)

Orman'ın derininde, yaşlı ağaçların köklerinin tavandan sarktığı geniş bir mağara. Duvarlarda amber renkli reçine damlaları parlar, yerde soluk mantarlar.

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kök böceği | saldırgan | 90 | 18 | 44 | 24 | sert kabuk | Kök böceği kabuğu 1–2 (%80) |
| Kök yılanı | saldırgan | 70 | 16 | 58 | 22 | ısırığı zehirler | Kök yılanı derisi (%70) |
| Mağara kurdu | saldırgan | 120 | 22 | 66 | 30 | 2–3'lü sürü | Mağara kurdu eti (her zaman), Mağara kurdu postu (%60) |

**Boss · Yaşlı Kök** (Reis biçiminde, köklerden örülmüş dev bir canlı): can 2000, hasar 38, hız 40, XP 900; düşürdükleri: Yaşlı Kök özü (her zaman), Kök reçinesi 3–5.

**Toplanabilenler:** Kök mantarı (elle), Kök reçinesi (amber parlar; elle).

**Yan görev · Kökçü Fidan — "Yaşlı Kök"** (en dipteki odada, köklerin arasında diz çökmüş genç bir şifacı)
- *Hikâye:* "Ninemin ıhlamuru bu mağaranın tam üstünde. Kökleri buraya kadar iner. Bir gece mor ışık köklere sızdı; kökler birbirine sarıldı, bir canlıya dönüştü: **Yaşlı Kök**. Ormanın suyunu içiyor, ağaçlar kuruyor, ninemin ıhlamuru da. Kalbini kabukla örtmüş; kabuğu yakmak için reçineden ateş macunu yapacağım. **3 Kök reçinesi** getir."
- *Getir:* 3 Kök reçinesi. "Macun hazır. Kabuğu tutuşunca vur, hep vur! Geliyor…"
- *Boss:* Yaşlı Kök topraktan yükselir; yen.
- *Dön:* "Kökler gevşedi… duyuyor musun? Yukarıda ıhlamurun yaprakları hışırdıyor. Teşekkür ederim." Görev biter.
- *İkinci deneme:* "Yine geldin. Macun hâlâ sıcak. Yaşlı Kök'ü uyandırayım mı?" → **Uyandır**.
- *Ödül:* 500 sikke · 450 XP (boss'u yenince ayrıca Reis ödülü). *Sonra:* "Köklere su taşıyorum. Ihlamur bu bahar çiçek açacak."

**Malzemeler ve fiyatlar**

| Malzeme | Nereden | Fiyat (sikke) | Kullanıldığı tarif |
|---|---|---|---|
| Kök mantarı | toplanır | 20 | Kök mantarlı güveç, Kök özü iksiri |
| Kök reçinesi | toplanır | 24 | Kök flütü |
| Kök böceği kabuğu | Kök böceği | 28 | Böcek kabuğu boyası |
| Kök yılanı derisi | Kök yılanı | 32 | Kök flütü |
| Mağara kurdu eti | Mağara kurdu | 22 | Kök mantarlı güveç (çiğ de yenir) |
| Mağara kurdu postu | Mağara kurdu | 40 | – (satılır; Deri parçası da düşer) |
| Yaşlı Kök özü | Yaşlı Kök | 480 | Kök özü iksiri |

**Tarifler (kazanda öğrenilir)**

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kök mantarlı güveç | Yiyecek | 2 Kök mantarı, 1 Mağara kurdu eti, 2 Su, 1 Ateş | 110 |
| Böcek kabuğu boyası | Boya | 2 Kök böceği kabuğu, 1 Su | 75 |
| Kök flütü | Müzik | 1 Kök yılanı derisi, 1 Kök reçinesi, 1 Dal | 95 |
| Kök özü iksiri | Büyü | 1 Yaşlı Kök özü, 2 Kök mantarı, 1 Su | 680 |

## Teknik not (mağaranın yeri)

Mağaranın içi adanın üstünde, kişilerden, ateşlerden ve yerlerden en az ~360 piksel uzak, ulaşılabilir kuru bir alana kurulur (iki mağara aynı alanı paylaşır; aynı anda yalnızca birinin içinde olunur). İçerideyken o alanın ağaçları, toplanabilirleri, zemini ve havası gizlenir; altındaki su ya da ulaşılamayan yerler mağarada kaya duvar olur. Mağaradayken o alanın biyomu "keşfedilmiş" sayılmaz.
