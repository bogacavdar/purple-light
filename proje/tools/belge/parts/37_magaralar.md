## Mağaralar

> Her biyomda bir mağara olacak; ilk pakette **Çayır** ve **Orman** mağaraları var. Bataklık, Kayalık Dağ, Kül Diyarı ve Mor Kristal Vadisi'ne de birer mağara eklendi; artık Act 1'in altı biyomunun her birinde bir mağara var. Yeni mağaraların her birinde 3 canlı türü, en dipte 1 yan görev kişisi ve bir boss, **4 yalnızca mağarada bulunan toplanabilir**, canlılardan düşen kendine özgü malzemeler ve az olan tarif türlerinden (Av ve hayvan, Müzik, Süs, Boya, Büyü; yemek yok) tarifler vardır. Mağaraya meşalesiz ve seviyesi yetmeyen giremez. İçeride kendi canlıları, Reis'leri, toplanan malzemeleri ve en dipte bir yan görev kişisi vardır; o kişinin görevi mağaranın **boss'una** götürür.

### Mağara girişlerinin görünüşü (v3.39, Boğaç: "mağara mağaraya benzesin, her biyomdaki farklı olsun, biyomuna uygun")

Her mağaranın dışarıdaki girişi kendi biyomuna göre çizilmiş, düzensiz kenarlı bir kaya tepesidir; ortasında kemerli, içe doğru kararan bir ağız ve ağzın çevresinde kemer taşları vardır. İçerideki ışık (mağaranın rengi) ağızda hafifçe nefes alır; tabela ve kapı yeri aynıdır.

| Mağara | Biyom | Görünüş |
|---|---|---|
| Yankı Mağarası | Çayır | gri kireçtaşı tepe, üstü çimenli ve çiçekli, kayada yosun lekeleri, yanında bir çalı; içeride mavi ışık |
| Kök Mağarası | Orman | toprak renkli kaya, ağzın üstünden ve yüzünden aşağı sarkan kalın ağaç kökleri, tepesinde küçük bir ağaç, dibinde eğrelti; içeride turuncu ışık |
| Batık Mağara | Bataklık | alçak, yarı batık, koyu yeşil ıslak kaya, ağır yosun, ağzın önüne sarkan sarmaşıklar, ağzın önünde bir su birikintisi ve kenarlarda sazlar; içeride yeşil ışık |
| Rüzgâr Mağarası | Kayalık Dağ | yüksek, sivri, mavi-gri kayalık, tepesinde ve çıkıntılarda kar, ağzın üstünde buz sarkıtları; içeride soğuk beyaz-mavi ışık |
| Kor Mağarası | Kül Diyarı | kara bazalt, içinden turuncu parlayan çatlaklar, ağzın altından sızan kor, tepede kül ve duman; içeride turuncu ışık |
| Ayna Mağarası | Mor Kristal Vadisi | koyu mor kaya, ağzın iki yanında ve tepede mor kristal kümeleri, ışıltılar; içeride mor ışık |

### Genel kurallar

1. **Giriş.** Mağaranın girişi büyüktür (genişliği ~4–5 ağaç, ~100 × 76 piksel kayalık bir tepe ve ortasında karanlık bir ağız). Ana kişilerden ve ateşlerden en az ~400 piksel uzakta, kendi biyomunda, ağaçsız bir yerdedir (ada her kurulduğunda aynı yer). Ağzın önünde ahşap bir tabela durur: mağaranın adı ve **seviye şartı** ("Yankı Mağarası · Sv 5").
2. **Şartlar.** **Girişe tıklayınca** karakter mağaranın ağzına yürür ve bir pencere açılır: "Mağaraya girmek ister misin?", altında iki şart işaretiyle (✓/✗ en az X. seviye, ✓/✗ elinde yanan bir meşale). **Mağaraya gir** düğmesi yalnızca iki şart da tamamsa basılır; **Vazgeç** (ya da Esc) kapatır, Enter girer. Ağzın önünde **F** de aynı pencereyi açar. Eski davranış (şart tutmazsa karakterin söylediği): seviye yetmiyorsa karakter "Bu mağara bana göre değil… en az **5. seviye** olmalıyım (şimdi 3)." der. Seviye yetiyor ama **elinde yanan bir meşale yoksa** "Meşalesiz giremem; içerisi zifiri karanlık." der (kafa lambası yetmez). İkisi de tamamsa girer.
3. **Yükleme.** Girerken kısa bir yükleme ekranı (~0,9 sn): mağaranın adı ve "Mağaraya giriliyor…". Çıkarken "Gün ışığına çıkılıyor…".
4. **İç alan.** Her mağara ayrı bir alandır: istenen boyut biyomun dörtte biriydi (~107 × 107 karo); adada kişilerden, ateşlerden ve yerlerden uzak, buna sığan en büyük kuru alan **~89 × 89 karo** (biyomun yaklaşık beşte biri) olduğu için mağaralar bu boyuttadır. İçinde kıvrımlı tüneller, ~18 yan kol ve oda, en dipte büyük bir oda vardır. Giriş en alttadır; en derin oda en uzak uçtadır. İçeride **hava yoktur** (yağmur, sis, rüzgâr, şimşek ve gök gürültüsü yok; dışarının hava ve ortam sesleri de içeri gelmez —: "mağarada yağmur yağıyor"), mor ışık gelmez, gün ışığı yoktur: her yer gece gibi karanlıktır.
5. **Meşale.** **Mağarada hava meşaleyi etkilemez ("mağarada meşale çok hızlı tükeniyor"):** dışarıda yağmur ya da fırtına varken meşale 2–2,7 kat hızlı yanar; içeride hava olmadığı için mağarada her zaman normal hızda yanar. Meşale sol eldeyken her saldırıda harcanan pay da mağarada **üçte birdir** (dışarıda %4,5, içeride %1,5). Mağarada meşalenin aydınlattığı alan **2 katıdır** (Kaba meşale 160 px, Meşale 230 px; ışığın dışı karanlıktır). Meşale içeride biterse (ya da elinden indirilirse) her yer **zifiri karanlık** olur; karakter "Meşalem bitti! Hiçbir şey göremiyorum…" der ve 1,5 sn sonra kendini mağaranın dışında, girişin önünde bulur (eldeki meşaleyi indirdiysen 3 sn içinde yeniden eline alırsan kalırsın). Mağaranın ağzından içeri vuran soluk bir ışık ve parlayan mantarlar ya da reçineler küçük ışık halkaları yapar ama yolu göstermeye yetmez.
6. **Çıkış.** İçeride girişin olduğu yerde ışıklı bir **"ÇIKIŞ" tabelası** ve aşağı ok durur (tabela mağara zemininin üstüne çizilir, önceden görünmüyordu). **Giriş ve çıkış sarı parlar:** dışarıda mağaranın ağzında, içeride çıkışta yerde nabız gibi atan sarı bir halka ve ışıltı vardır; gece de görünür (ağzın 60 px ışığı). Çıkış alanı 56 px'tir (tıklama 50 px). Başlangıç/çıkış noktası her zaman yürünebilir zemindedir (mağara kurulurken su ağzın üstündeki hücreyi silerse en yakın zemine alınır). Tabelaya tıklayınca ya da yanında **F**: "Mağaradan çıkıp gün ışığına dönmek ister misin?" penceresi, **Mağaradan çık** düğmesiyle. Bayılırsan mağaradan çıkarılırsın (her zamanki gibi uyanma yerinde uyanırsın).
7. **Kayıt.** Mağaradayken kaydedilirse oyun, kayıt açılınca seni **mağaranın girişinin önünde** başlatır. Mağarada açtığın yerler (harita) kaydedilir.
8. **Harita.** Dışarıda mağaranın girişi küçük ve büyük haritada **mağara simgesiyle** görünür (o biyoma ayak basmışsan); büyük haritada üzerine gelince adı ve şartı yazar ("Yankı Mağarası · Sv 5 · meşale"). Mağaranın içindeyken harita **mağaranın kendi haritasını** gösterir: yürüdükçe açılan tüneller, giriş ve en dipteki kişi.
9. **Canlılar.** Her mağarada **3 canlı türü** yaşar; yalnızca o mağarada çıkarlar (dışarıda yoktur). Mağarada dolaşırken çevrende (200–420 px) karanlıkta doğarlar. Her tür adanın öbür canlıları gibi **Reis** sayacına sahiptir: yeteri kadar avlayınca o türün Reisi gelir. Almanakta biyomun canlılarının altında ayrı bir **"Mağara: …"** bölümünde görünürler (mağaraya bir kez girmiş olmak yeter).
10. **Mağara boss'u.** Her mağaranın bir boss'u vardır; kendi büyük resmiyle çizilir (mor parıltılı, iri; bkz. Boss'ların görünüşü). Yalnızca en dipteki kişinin görevinde çağrılır. Almanakta mağara bölümünün sonunda durur:
    - hiç karşılaşılmadıysa: kapalı kart ("???", "Henüz karşılaşmadın");
    - karşılaşıp yenemediysen (bayıldıysan): özellikleri açılır (can, hasar, hız, hamleler, düşürdükleri) ama kart **altın değildir** ("Karşılaştın, henüz yenemedin");
    - yendiysen kart kendiliğinden **altın** olur ("★ Yenildi").
11. **Yan görev.** Her mağaranın en derin odasında bir **yan görev kişisi** vardır (yan görev kuralları geçerlidir: ana görevle birlikte yapılır, bayılınca yalnızca yan görev iptal olur). Kişi başında mavi "?" ile görünür; yalnızca mağaranın içinden ulaşılır (dış haritada işaret yoktur). Görev bir hikâyeyle başlar, mağarada toplanan bir malzemeyi ister, sonra boss'u çağırır. Boss'la karşılaşıp bayıldıysan ve kişiye **ikinci kez** gidersen, görev en baştan başlamaz: kişi doğrudan "Hazır mısın?" diye sorar ve boss hemen çağrılır. Boss yenilince kişiye dönülür; görev biter.
12. **Malzemeler.** Mağaranın ağzının önünde **Sarkıt** ve **Yarasa gübresi** (7'şer) çıkar; adada başka yerde yoktur. Mağarada **2 toplanabilir** malzeme (duvar diplerinde, her girişte yeniden dizilir; içerideyken yeniden çıkmaz) ve canlılardan düşen malzemeler vardır. **Hepsinin bir satış fiyatı vardır** (Nazlı'ya satılır) ve her biri **en az bir tarifte** kullanılır. Bu tarifler **kazandan öğrenilir** (malzemeler bir kez bulununca Normal modda açık görünür); çoğu tarif kitabında az tarif olan kategorilerdendir (Büyü, Müzik, Boya, Şifa, Av ve hayvan) ve iki tanesi yemektir.

### 1 · Yankı Mağarası (Çayır · Sv 5)

Çayır'ın kayalık bir köşesinde, ağzından serin hava ve damla sesleri gelen alçak tavanlı bir mağara. Duvarlarda mavi parlayan mantarlar, tavandan sarkan damla taşları.

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Mağara yarasası | saldırgan | 22 | 7 | 78 | 10 | uçar, 2–4'lü sürü | Yarasa zarı (%80) |
| Kör kertenkele | nötr | 40 | 9 | 40 | 12 | vurulunca saldırır | Kör kertenkele eti (her zaman), Kertenkele pulu 1–2 (%60) |
| Taş örümceği | saldırgan | 55 | 12 | 56 | 16 | ısırığı kanatır | Taş örümceği ipi 1–2 (%80) |

**Yarasaların görünüşü (10 Kasım 2026, Boğaç: "mağara yarasaları ve leşleri çok kötü olmuş; yerde gözükmüyorlar, leşleri ayrı gölgeleri ayrı yere düşüyor, yarasaya da benzemiyorlar"):** Mağara yarasası (ve onun çizimini kullanan Kaya yarasası, Kristal yarasa, Yankı Kraliçesi) önden görülen bir yarasadır: sivri iki kulak, iri parlak gözler (kovalarken kırmızı), iki küçük beyaz diş, açık gövde göğsü ve iki yana açılan, kemikleri belli, alt kenarı tırtıklı zar kanatlar. Kanatlarını **üç kareyle** çırparak (yukarı, düz, aşağı) yerden biraz yüksekte uçar; gölgesi tam altında yerdedir. **Leşi:** vurulunca dönmeden **yere süzülüp düşer**, kanatları iki yana açık, gözleri kapalı (✕) **gölgesinin tam üstünde** yatar. Yankı Kraliçesi aynı yarasanın büyüğüdür (mor tonlu, altın taçlı).

**Kör kertenkele ve Taş örümceği (10 Kasım 2026, Boğaç: "kör kertenkele de kertenkeleye benzer bir canlı olsun", "taş örümceği de örümceğe benzemiyor"):** ikisi de üstten görünür, başı yürüdüğü yöne bakar ve iki kareyle yürür. **Kör kertenkele:** soluk pembe, uzun gövde, yanlara açılan dört pençeli bacak, sırtında açık bir şerit, uzun ve sallanan kuyruk, süt beyazı kör gözler. **Taş örümceği:** gri, iri karın (sırtında koyu bir haç işareti) ve küçük baş, iki yana dörder **eklemli bacak**, kırmızı gözler (kovalarken daha parlak) ve iki beyaz diş. Leşleri yuvarlanmaz; durdukları gibi yere yatar, gözleri söner.

**Boss'ların görünüşü (10 Kasım 2026, Boğaç: "boss da hiç bossa benzememiş"):** mağara boss'ları başka bir canlının resmini ödünç almaz; her birinin kendi büyük resmi vardır, ekranda oyuncunun yaklaşık üç katı boydadır, iki kareyle kıpırdar, çevresinde mor parıltı ve başının üstünde uzun can çubuğu durur. Leşleri de aynı resmin yana yatmış halidir; Almanak'ta da bu resim görünür.

| Boss | Görünüşü |
| --- | --- |
| Yankı Kraliçesi | Mor tüylü, iri bir yarasa; başında altın taç, kanatları açık |
| Yaşlı Kök | Yürüyen yaşlı bir ağaç kütüğü: tepesinde yosun ve mor çiçekli taç, dal kolları, mor yanan kızgın gözler, kök ayaklar, gövdede amber reçine damlaları |
| Çamur Ana | Dev bir balçık kurbağası: şişen gırtlak, sarı yarık gözler, sırtında kamış tacı, sırtında mor parlayan kabarcıklar, ağzından damlayan balçık |
| Dağ Devi | Taştan bir dev: karla örtülü omuzlar ve baş, buz mavisi gözler, göğsünde mor ışıklı çatlak, omuzlarından çıkan gümüş kristaller, iri taş yumruklar (biri kalkıp iner) |
| Kor Kral | Kara bazalttan bir kral: gövdesinde akan lav damarları, başında alevleri titreyen altın taç, elinde ateşli asa, kor gibi yanan gözler |
| Işık Yutan | Havada süzülen kapkara bir yaratık: altı göz, ışığı yutan dişli dev ağız (içinde mor girdap), sırtında mor ayna kristalleri, altında kıpırdayan dokunaçlar |

**Boss · Yankı Kraliçesi** (taçlı dev yarasa): can 900, hasar 22, hız 62, uçar, XP 400; düşürdükleri: Kraliçe pençesi (her zaman), Yarasa zarı 3–5.

**Toplanabilenler:** Yankı mantarı (mavi parlar; elle), Damla taşı (elle).

**Yan görev · Madenci Kaya — "Yankı Kraliçesi"** (en dipteki odada, elinde feneriyle oturan yaşlı bir madenci)
- *Hikâye:* "Kırk yıl bu mağarada damla taşı kazdım. Bir gece mor ışık mağaranın ağzına indi; yarasalar delirdi. En dipteki büyük yarasa, **Yankı Kraliçesi**, o geceden beri uyumuyor. Çığlığı taşları çatlatıyor; bir gün tavan çökecek ve köyün içtiği dere bu mağaradan çıkıyor. Onu yuvasından çıkarmanın tek yolu ışık: Yankı mantarları ona annesini hatırlatır. **4 Yankı mantarı** getir, fenerime koyayım."
- *Getir:* 4 Yankı mantarı. Kaya mantarları fenerine koyar: "Işık hazır. Kulaklarını tıka evlat… geliyor!"
- *Boss:* Yankı Kraliçesi odaya iner; yen.
- *Dön:* "Mağara sustu. Damlaları dinle… artık yalnızca su sesi var. Sağ ol." Görev biter.
- *İkinci deneme:* "Yine geldin. Fener hazır, mantarlar yerinde. Kraliçeyi çağırayım mı?" → **Çağır**.
- *Ödül:* 310 Vio · 260 XP (boss'u yenince ayrıca Reis ödülü: Vio ve boss'un XP'si). *Sonra:* "Damla taşı kazmaya döndüm. Kraliçe olmadan mağara çok sessiz, biraz da özlüyorum."

**Malzemeler ve fiyatlar**

| Malzeme | Nereden | Fiyat (Vio) | Kullanıldığı tarif |
|---|---|---|---|
| Yankı mantarı | toplanır | 14 | Yankı çorbası, Kraliçe tılsımı |
| Damla taşı | toplanır | 12 | Kertenkele merhemi, Damla akı boyası |
| Yarasa zarı | Mağara yarasası | 16 | Yarasa zarı davul |
| Kör kertenkele eti | Kör kertenkele | 18 | Yankı çorbası (çiğ de yenir) |
| Kertenkele pulu | Kör kertenkele | 18 | Kertenkele merhemi |
| Taş örümceği ipi | Taş örümceği | 22 | Yarasa zarı davul, Kraliçe tılsımı |
| Kraliçe pençesi | Yankı Kraliçesi | 260 | Kraliçe tılsımı |

**Tarifler (kazanda öğrenilir)**

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Yankı çorbası | Yiyecek | 2 Yankı mantarı, 1 Kör kertenkele eti, 2 Su, 1 Ateş | 91 |
| Kertenkele merhemi | Şifa | 2 Kertenkele pulu, 1 Damla taşı, 1 Su | 143 |
| Damla akı boyası | Boya | 2 Damla taşı, 1 Su | 40 |
| Yarasa zarı davul | Müzik | 3 Yarasa zarı, 2 Taş örümceği ipi, 2 Dal | 130 |
| Kraliçe tılsımı | Büyü | 1 Kraliçe pençesi, 2 Yankı mantarı, 1 Taş örümceği ipi | 420 |

### 2 · Kök Mağarası (Orman · Sv 10)

Orman'ın derininde, yaşlı ağaçların köklerinin tavandan sarktığı geniş bir mağara. Duvarlarda amber renkli reçine damlaları parlar, yerde soluk mantarlar.

**Canlılar**

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kök böceği | saldırgan | 90 | 18 | 44 | 24 | sert kabuk | Kök böceği kabuğu 1–2 (%80) |
| Kök yılanı | saldırgan | 70 | 16 | 58 | 22 | ısırığı zehirler | Kök yılanı derisi (%70) |
| Mağara kurdu | saldırgan | 120 | 22 | 66 | 30 | 2–3'lü sürü | Mağara kurdu eti (her zaman), Mağara kurdu postu (%60) |

**Boss · Yaşlı Kök** (yürüyen yaşlı ağaç kütüğü): can 2000, hasar 38, hız 40, XP 900; düşürdükleri: Yaşlı Kök özü (her zaman), Kök reçinesi 3–5.

**Toplanabilenler:** Kök reçinesi (amber parlar; elle). Orman'ın mantarı Kanlıca dışarıda, ağaçların dibinde çıkar.

**Yan görev · Kökçü Fidan — "Yaşlı Kök"** (en dipteki odada, köklerin arasında diz çökmüş genç bir şifacı)
- *Hikâye:* "Ninemin ıhlamuru bu mağaranın tam üstünde. Kökleri buraya kadar iner. Bir gece mor ışık köklere sızdı; kökler birbirine sarıldı, bir canlıya dönüştü: **Yaşlı Kök**. Ormanın suyunu içiyor, ağaçlar kuruyor, ninemin ıhlamuru da. Kalbini kabukla örtmüş; kabuğu yakmak için reçineden ateş macunu yapacağım. **3 Kök reçinesi** getir."
- *Getir:* 3 Kök reçinesi. "Macun hazır. Kabuğu tutuşunca vur, hep vur! Geliyor…"
- *Boss:* Yaşlı Kök topraktan yükselir; yen.
- *Dön:* "Kökler gevşedi… duyuyor musun? Yukarıda ıhlamurun yaprakları hışırdıyor. Teşekkür ederim." Görev biter.
- *İkinci deneme:* "Yine geldin. Macun hâlâ sıcak. Yaşlı Kök'ü uyandırayım mı?" → **Uyandır**.
- *Ödül:* 500 Vio · 450 XP (boss'u yenince ayrıca Reis ödülü). *Sonra:* "Köklere su taşıyorum. Ihlamur bu bahar çiçek açacak."

**Malzemeler ve fiyatlar**

| Malzeme | Nereden | Fiyat (Vio) | Kullanıldığı tarif |
|---|---|---|---|
| Kök reçinesi | toplanır | 24 | Kök flütü |
| Kök böceği kabuğu | Kök böceği | 28 | Böcek kabuğu boyası |
| Kök yılanı derisi | Kök yılanı | 32 | Kök flütü |
| Mağara kurdu eti | Mağara kurdu | 32 | Kanlıcalı güveç (çiğ de yenir) |
| Mağara kurdu postu | Mağara kurdu | 40 | – (satılır; Deri parçası da düşer) |
| Yaşlı Kök özü | Yaşlı Kök | 480 | Kök özü iksiri |

**Tarifler (kazanda öğrenilir)**

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kanlıcalı güveç | Yiyecek | 2 Kanlıca, 1 Mağara kurdu eti, 2 Su, 1 Ateş | 160 |
| Böcek kabuğu boyası | Boya | 2 Kök böceği kabuğu, 1 Su | 75 |
| Kök flütü | Müzik | 1 Kök yılanı derisi, 1 Kök reçinesi, 1 Dal | 95 |
| Kök özü iksiri | Büyü | 1 Yaşlı Kök özü, 2 Kök reçinesi, 1 Su | 680 |

### Yeni mağaraların ortak kuralları

- **Canlıların görünüşü:** yeni canlılar adadaki akrabalarının biçiminde, kendi renkleriyle çizilir (ör. Batak semenderi yeşil bir Lav kertenkelesi, Lav yılanı kızıl bir Engerek; Kaya yarasası, Kristal yarasa, Tavan örümceği, Ayna örümceği ve Kor böceği Yankı ve Kök mağaralarının canlılarının renk değiştirmiş halidir). Boss'lar başka bir canlının büyütülmüşü değildir, her birinin kendine ait büyük resmi vardır (bkz. Boss'ların görünüşü).
- **Toplanabilenler:** her yeni mağarada 4 toplanabilir yalnızca o mağarada çıkar. Parlayanlar (Parıltı yosunu, Gümüş filizi, Dağ kristali, Kükürt kristali, Kor taşı, Mor damar taşı, Işık sporu, Ayna taşı, Yıldız tozu) çevrelerini hafifçe aydınlatır.
- **Sesler:** bütün mağara canlılarının ve boss'larının kendi saldırı sesi vardır (bkz. ACT 1 › Canlı sesleri).
- **Yan görev kalıbı:** dipteki kişi bir hikâye anlatır, mağarada toplanan bir malzemeden **4** tane ister, boss'u çağırır; boss yenilince kişiyle konuşulur. İkinci denemede boss doğrudan çağrılır.
- **Mağaranın yeri:** mağaraların içi için seçilen alan artık mağara girişlerinden önce seçilir; altı giriş bu alana konmaz (altı mağarayla bir giriş bu alanı kapatabiliyordu).

### 3 · Batık Mağara (Bataklık · Sv 18)

Bataklığın altında, tavanından su sızan, yerleri balçıklı bir mağara. Duvarlarda yeşil parlayan yosunlar, suyun içinde batmış kökler.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Mağara sülüğü | saldırgan | 300 | 30 | 40 | 60 | 2–3'lü sürü, ısırığı kanatır | Sülük 1–2 (%80) |
| Balçık kurbağası | saldırgan | 420 | 34 | 38 | 75 | uzaktan atar (140 menzil, 2 atış), zehir | Balçık bezesi (%70) |
| Batak semenderi | saldırgan | 520 | 40 | 50 | 85 | – | Semender derisi (%70) |

**Boss · Çamur Ana** (dev kurbağa): can 3.600, hasar 75, hız 34, XP 1.500, zehirler; düşürdükleri: Çamur Ana gözü (her zaman), Balçık bezesi 3–5.

**Toplanabilenler:** Parıltı yosunu (yeşil parlar), Siyah balçık, Batık kök, Sazlı inci.

**Yan görev · Sazcı Nail — "Çamur Ana"** (yaşlı bir sazcı): köyün kuyusu mağaranın altından beslenir; mor ışıktan beri Çamur Ana suyu balçığa çeviriyor. **4 Parıltı yosunu** ister, ondan ışıklı bir yem yapar; Çamur Ana yeme gelir, yen. Ödül: **700 Vio · 680 XP**. Sonra: "Kuyudan yine tatlı su çıkıyor."

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Parıltı yosunu | toplanır | 36 | Yosun yeşili boya |
| Siyah balçık | toplanır | 30 | Sülük yemi |
| Batık kök | toplanır | 32 | Semender derisi tef, İnci kolye |
| Sazlı inci | toplanır | 48 | İnci kolye, Çamur Ana muskası |
| Sülük | Mağara sülüğü | 62 | Sülük yemi |
| Balçık bezesi | Balçık kurbağası | 78 | – (satılır) |
| Semender derisi | Batak semenderi | 86 | Semender derisi tef, Çamur Ana muskası |
| Çamur Ana gözü | Çamur Ana | 900 | Çamur Ana muskası |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Sülük yemi | Av ve hayvan | 2 Sülük, 1 Siyah balçık | 160 |
| Semender derisi tef | Müzik | 2 Semender derisi, 2 Batık kök, 1 Dal | 270 |
| İnci kolye | Süs | 3 Sazlı inci, 1 Batık kök | 230 |
| Yosun yeşili boya | Boya | 2 Parıltı yosunu, 1 Su | 95 |
| Çamur Ana muskası | Büyü | 1 Çamur Ana gözü, 2 Sazlı inci, 1 Semender derisi | 1.400 |

### 4 · Rüzgâr Mağarası (Kayalık Dağ · Sv 26)

Dağın içinde, rüzgârın uğuldayarak geçtiği soğuk bir mağara. Duvarlarda gümüş damarlar ve buz gibi kristaller, tavandan sarkan saçaklar.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kaya yarasası | saldırgan | 520 | 50 | 80 | 110 | uçar, 2–4'lü sürü | Kaya yarasası kanadı (%80) |
| Tavan örümceği | saldırgan | 700 | 58 | 56 | 130 | zehir | Tavan ağı 1–2 (%80) |
| Mağara vaşağı | saldırgan | 1.000 | 66 | 84 | 160 | kanama | Gri vaşak postu (%70) |

**Boss · Dağ Devi** (mor ışığın taşları birbirine yapıştırdığı dev; Mağara ayısı biçiminde): can 6.000, hasar 125, hız 36, XP 2.400; düşürdükleri: Dev yüreği (her zaman), Gümüş filizi 3–5.

**Toplanabilenler:** Gümüş filizi (parlar), Dağ kristali (parlar), Rüzgâr taşı, Kar likeni.

**Yan görev · Dağcı Tuncay — "Dağ Devi"** (ipi kopmuş bir dağcı): Dağ Devi uyandı, tavandan kaya yağıyor, yol kapandı. **4 Gümüş filizi** ister, bir çan döver; çanın sesiyle dev çıkar, yen. Ödül: **1.000 Vio · 1.060 XP**.

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Gümüş filizi | toplanır / Dağ Devi | 52 | Gümüş çan |
| Dağ kristali | toplanır | 58 | Kristal kolye, Dev yüreği tılsımı |
| Rüzgâr taşı | toplanır | 42 | Ağ kapanı |
| Kar likeni | toplanır | 40 | Dev yüreği tılsımı |
| Kaya yarasası kanadı | Kaya yarasası | 104 | Kanat yelpazesi |
| Tavan ağı | Tavan örümceği | 112 | Gümüş çan, Ağ kapanı, Kristal kolye |
| Gri vaşak postu | Mağara vaşağı | 150 | – (satılır) |
| Dev yüreği | Dağ Devi | 1.300 | Dev yüreği tılsımı |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Gümüş çan | Müzik | 3 Gümüş filizi, 1 Tavan ağı | 440 |
| Ağ kapanı | Av ve hayvan | 3 Tavan ağı, 1 Rüzgâr taşı | 420 |
| Kristal kolye | Süs | 2 Dağ kristali, 1 Tavan ağı | 360 |
| Kanat yelpazesi | Süs | 3 Kaya yarasası kanadı, 2 Dal | 380 |
| Dev yüreği tılsımı | Büyü | 1 Dev yüreği, 2 Dağ kristali, 2 Kar likeni | 2.000 |

### 5 · Kor Mağarası (Kül Diyarı · Sv 34)

Kül Diyarı'nın altında, yarıklarından kor ışığı sızan sıcak bir mağara. Duvarlarda sarı kükürt, yerde volkan camı parçaları.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kor böceği | saldırgan | 1.300 | 92 | 34 | 220 | yanık | Kor kabuğu 1–2 (%80) |
| Lav yılanı | saldırgan | 1.100 | 105 | 60 | 240 | yanık | Lav yılanı pulu (%70) |
| Duman cini | saldırgan | 1.000 | 98 | 46 | 260 | uzaktan atar (190 menzil, 3 atış), yanık | Duman özü (%60) |

**Boss · Kor Kral** (ocakların ateşini yutan dev kertenkele): can 8.500, hasar 165, hız 38, XP 3.400, yakar; düşürdükleri: Kor Kral tacı (her zaman), Kor kabuğu 3–5.

**Toplanabilenler:** Kükürt kristali (parlar), Kor taşı (parlar), **Kül mantarı** (Kül Diyarı'nın tek mantarı), Volkan camı.

**Yan görev · Ocakçı Alev — "Kor Kral"** (bir demircinin kızı): mor ışık babasının yüz yıllık ocağının ateşini mağaraya çekti, Kor Kral onu yuttu. **4 Kükürt kristali** ister, bir duman yakar; Kor Kral dumana gelir, yen. Ödül: **1.400 Vio · 1.800 XP**.

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Kükürt kristali | toplanır | 66 | Kükürt sarısı boya, Duman fişeği |
| Kor taşı | toplanır | 60 | Kor zurnası, Kor tacı tılsımı |
| Kül mantarı | toplanır | 54 | Duman fişeği |
| Volkan camı | toplanır | 74 | Volkan camı muska, Kor tacı tılsımı |
| Kor kabuğu | Kor böceği / Kor Kral | 160 | Kor zurnası |
| Lav yılanı pulu | Lav yılanı | 178 | Volkan camı muska |
| Duman özü | Duman cini | 196 | Duman fişeği |
| Kor Kral tacı | Kor Kral | 1.800 | Kor tacı tılsımı |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kükürt sarısı boya | Boya | 2 Kükürt kristali, 1 Su | 210 |
| Duman fişeği | Av ve hayvan | 1 Duman özü, 1 Kükürt kristali, 1 Kül mantarı | 420 |
| Kor zurnası | Müzik | 2 Kor kabuğu, 1 Kor taşı | 500 |
| Volkan camı muska | Süs | 2 Volkan camı, 1 Lav yılanı pulu | 540 |
| Kor tacı tılsımı | Büyü | 1 Kor Kral tacı, 2 Kor taşı, 1 Volkan camı | 2.800 |

### 6 · Ayna Mağarası (Mor Kristal Vadisi · Sv 42)

Vadinin altında, duvarları ayna gibi parlayan ama ışığı yutan bir mağara. Mor damarlar, yerde yıldız tozu gibi ışıltılar.

| Canlı | Mizaç | Can | Hasar | Hız | XP | Özellik | Düşürdükleri |
|---|---|---|---|---|---|---|---|
| Kristal yarasa | saldırgan | 1.200 | 135 | 86 | 330 | uçar, 2–4'lü sürü | Kristal kanat (%80) |
| Ayna örümceği | saldırgan | 1.500 | 160 | 58 | 380 | uzaktan atar (180 menzil, 3 atış), zehir | Ayna ipeği 1–2 (%80) |
| Gölge semenderi | saldırgan | 2.000 | 185 | 64 | 420 | kanama | Gölge pulu (%70) |

**Boss · Işık Yutan** (ışıkla beslenen, Kara ejder biçiminde dev bir gölge): can 12.000, hasar 250, hız 32, XP 5.000; düşürdükleri: Işık Yutan kalbi (her zaman), Mor damar taşı 3–5.

**Toplanabilenler:** Mor damar taşı (parlar), Işık sporu (parlar), Ayna taşı (parlar), Yıldız tozu (parlar).

**Yan görev · Gökbilimci Nur — "Işık Yutan"** (mor ışığı inceleyen bir bilgin): mağara ışığı içiyor, dipteki Işık Yutan büyüdükçe vadinin kristalleri sönüyor. **4 Işık sporu** ister, fenerini doldurur; Işık Yutan ışığa gelir, yen. Ödül: **2.000 Vio · 2.580 XP**. Sonra Nur bir ipucu verir: mor ışık düştüğü yerde bir şey doğuruyor.

| Malzeme | Nereden | Fiyat | Tarif |
|---|---|---|---|
| Mor damar taşı | toplanır / Işık Yutan | 86 | Mor damar boyası, Işık Yutan kalbi tılsımı |
| Işık sporu | toplanır | 80 | Yıldız tozu yemi |
| Ayna taşı | toplanır | 90 | Kristal zil, Işık Yutan kalbi tılsımı |
| Yıldız tozu | toplanır | 90 | Yıldız tozu yemi |
| Kristal kanat | Kristal yarasa | 230 | Kristal zil |
| Ayna ipeği | Ayna örümceği | 250 | Gölge pulu muska |
| Gölge pulu | Gölge semenderi | 290 | Gölge pulu muska |
| Işık Yutan kalbi | Işık Yutan | 2.600 | Işık Yutan kalbi tılsımı |

| Tarif | Kategori | Malzemeler | Fiyat |
|---|---|---|---|
| Kristal zil | Müzik | 2 Kristal kanat, 1 Ayna taşı | 700 |
| Mor damar boyası | Boya | 2 Mor damar taşı, 1 Su | 300 |
| Gölge pulu muska | Süs | 2 Gölge pulu, 1 Ayna ipeği | 860 |
| Yıldız tozu yemi | Av ve hayvan | 2 Yıldız tozu, 1 Işık sporu | 504 |
| Işık Yutan kalbi tılsımı | Büyü | 1 Işık Yutan kalbi, 2 Mor damar taşı, 2 Ayna taşı | 4.200 |

### Teknik not (mağaranın yeri)

Mağaranın içi adanın üstünde, kişilerden, ateşlerden ve yerlerden en az ~360 piksel uzak, ulaşılabilir kuru bir alana kurulur (bütün mağaralar aynı alanı paylaşır; aynı anda yalnızca birinin içinde olunur). İçerideyken o alanın ağaçları, toplanabilirleri, zemini ve havası gizlenir; altındaki su ya da ulaşılamayan yerler mağarada kaya duvar olur. Mağaradayken o alanın biyomu "keşfedilmiş" sayılmaz.

**Mağarada su yoktur (10 Kasım 2026, Boğaç: "mağaranın etrafından su toplanabiliyor; orası bir ada değil, mağara"):** mağaranın içindeyken adanın o köşesindeki göl, nehir ya da deniz yok sayılır: "Su al" damlası çıkmaz, su doldurulamaz, olta atılamaz, kil kazılamaz.

**Duvarın ardına vurulmaz (10 Kasım 2026, Boğaç: "mağara duvarlarından geçmemeli saldırılarım; ben hasar almadan buradan vurabiliyorum"):** mağarada senin vuruşların (yakın dövüş ve hamleler) ile canlı arasında duvar varsa vuruş ona değmez; köşenin ardındaki canlıya ancak duvarın etrafından dolaşıp yüz yüze gelince vurulur.
