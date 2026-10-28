# Oyunun akışı

Bu bölüm oyunu baştan sona, oyuncunun yapacağı sırayla anlatır. Ayrıntılar (her görevin istediği, ödülü) "Kişiler ve görevler" bölümlerinde.

## Açılış

1. **Ana menü:** Yeni oyun, Devam et, Kayıttan yükle, Ayarlar, Kayıtları dışa/içe aktar, Arena (kilitli), Çıkış. Menünün altında sürüm etiketi (ör. "Versiyon 1.81").
2. **Karakter yaratma:** ad, cinsiyet, ten, saç (stil ve renk), göz rengi, sakal/bıyık, gözlük, şapka. Ardından eşinin adı sorulur (eşin görünüşü sabittir: erkek kahraman uzun kızıl saçlı bir kadını, kadın kahraman kısa saçlı bir erkeği kaybeder).
3. **Zorluk:** Normal ya da Zor. Zor modda tarifler kapalıdır ve kazanda "Dene" ile deneyerek bulunur (ayrıntı: "Zorluk").
4. **Giriş sahnesi** (gemi, fırtına, mor ışık) ve **kumsalda uyanış**: Yaşlı Ekin seni bulur, adını sorar.

## Öğretici (13 adım)

Öğretici sürerken Kazan, Pazar ve Demirci menüleri kilitlidir; ilgili kişiyle tanışınca açılır.

**Öğreticiyi geçmek (v1.81):** kartın üstündeki "Eğitimi geç" önce bir uyarı açar. Ekin şunu söyler: öğretici adayı ilk kez görenler için önemlidir, oyunun ana mekaniklerini (toplama, yeme, kazan, el yapımı, satış, dövüş, atılma) öğretir; geçilirse öğretici boyunca verilecek **ödüller, XP ve eşyalar alınmaz**. İki seçenek vardır:

- **"Öğrenmek istiyorum"** → uyarı kapanır, öğretici kaldığı yerden sürer.
- **"Zaten biliyorum, geç"** → öğretici biter, menüler açılır, Ekin'in ilk ana görevi gelir. **Hiçbir şey otomatik verilmez:** meşale, balta, taş, tarif, XP ya da sikke yok; oyuncu her şeyi kendisi bulur (Normal modda tarifler malzemeleri görünce zaten açılır). O ana kadar kazandıkların sende kalır. Atılmayı bilmiyorsan Börü'yle konuşunca atılma dersini ücretsiz verir (aşağıda).

| Adım | Kim | Ne yaparsın | Sonuç |
|---|---|---|---|
| 1 | Ekin | Kampın çevresine konan 5 böğürtleni topla (telefonda önce sürükleyerek ve dokunarak yürüme) | — |
| 2 | Ekin | Yemek düğmesiyle (F) 5 böğürtlen ye | Cadı Zümrüt görünür; Ekin seni kuzeye, ormanın kıyısına yollar |
| 3 | Zümrüt | Zümrüt'e git ve konuş | Kazanın yanına 2 Dal, 2 Lif, 2 Yaprak konur |
| 4 | Zümrüt | Kazanda **Kaba meşale** tarifini öğren | Malzemeler yeniden konur |
| 5 | Zümrüt | El yapımı ekranında (Tab) meşaleyi yap, bir yuvaya koyup eline al | Kazanın yanına 4 Taş konur |
| 6 | Zümrüt | 4 taşı topla | — |
| 7 | Zümrüt | Kazanda **Keskin taş** tarifini öğren (2 Taş) | — |
| 8 | Zümrüt | Kalan 2 taşla elle Keskin taş yap | Zümrüt kuzeydoğudaki Nazlı'yı söyler |
| 9 | Nazlı | Pazarcı Nazlı ile tanış | Pazar "Sat" sekmesiyle açılır |
| 10 | Nazlı | Keskin taşı sat | Nazlı doğudaki Börü'yü söyler |
| 11 | Börü | Börü ile konuş, çıkan **kereviti yumrukla** (yumruk 4 hasar); ardından **atılma dersi** ve **yetenek ağacı** (aşağıda) | Atılma öğrenilir (ücretsiz); Taş balta, Sopa ve İp tarifleri öğrenilmiş olur; +6 Taş; Börü'nün yanına 3 Dal, 8 Lif, 4 Taş konur |
| 12 | Börü | Balta parçalarını elle yap: 2 Keskin taş → 1 Sopa → 2 Keskin taş → 2 İp (2 Taş da yanında kalsın) | — |
| 13 | Dursun | Kuzeydeki Demirci Dursun'da örste **Taş balta**yı döv (ücretsiz), sonra baltayı eline al | Öğretici biter; ok Ekin'i gösterir, Ekin ilk ana görevi verir |

### Börü'nün atılma dersi (v1.81, 11. adımın içinde)

1. Kerevit yumrukla yenilince Börü "Şimdi kaçmayı öğren" der ve yanına **yeni bir kerevit** çıkar. Bu kerevit can yakmaz, ölmez; yalnızca saldırır. Atılma bu derste **ücretsiz** öğrenilir (yetenek ağacında satılmaz).
2. Kerevit bir an bekler, üstünde kırmızı **!** belirir, sonra sana atılır.
3. **İlk saldırıda** kerevit tam vuracakken **oyun durur** ve ekranın ortasında büyük harflerle "**Boşluk'a bas!**" (telefonda "**Atıl düğmesine dokun!**") yazar. Basınca oyun devam eder, karakter takla atar ve kereviti savuşturur ("Sıyrıldın!").
4. Sonra kerevit **3 kez daha** saldırır; oyun artık durmaz. Saldırı anında (kırmızı ! görününce ya da kerevit atıldığında) Boşluk'a basarsan sayılır; geç ya da erken kalırsan "Bir daha!" der, can gitmez. Ekranda "Sıyrılma: 1/4" sayacı vardır.
5. 4 sıyrılma (1 + 3) olunca Börü esprili bir dille "**İlk ders tamam!**" der: her kavgaya girmek akıllıca değildir, bazen tabanları yağlamak gerekir; bunun için hızlı koşmayı bilmek gerekir.
6. **Yetenek ağacı zorunlu:** Börü'nün tek seçeneği "Yetenek ağacını aç"tır. Ağaç ikonu (Y) yanıp söner ve ekranın ortasında "Yetenek ağacını aç" yazar; açılana kadar öğretici ilerlemez. Ağaç açılınca Savaş ağacındaki **Koşu** yanıp söner ve üstte Börü'nün notu çıkar: ağaçlar aşağıdan yukarı büyür; Koşu 100 sikke; Nazlı'ya bir şeyler satıp **100 sikke biriktirip** ilk iş bunu almak akıllıca olur.
7. Ağaç kapatılınca öğretici kaldığı yerden sürer: Börü Taş balta tarifini verir (12. adım).

Öğreticiyi geçen ve atılmayı bilmeyen biri sonradan Börü'yle konuşursa Börü aynı dersi ücretsiz teklif eder ("Öğret" / "Sonra").

### Öğreticiden sonraki kısa dersler

Kartın altında kısa dersler çıkar: **koşma dersi** (köprü onarılınca; Koşu 100 sikke, Koşu zaten alındıysa çıkmaz), **meşale dersi** (2. ve 3. gün 17:30). İlk gece meşalesi olmayana biri bir Kaba meşale fırlatır (bir kez).

## ACT 1 yol haritası

Ekin'in ana görevleri oyunun omurgasıdır; aynı anda adadaki her kişinin kendi yan görev zinciri vardır (Görevler defteri: G).

1. **Yurt (Çayır, Orman):** 5 odun kes → kırık köprüyü 20 odunla onar → ilk yetenek → Seviye 5 → bir gece kendi kamp ateşinin başında bekle → haritanın %30'u → Seviye 8 + 250 sikkelik yetenek → 25 tarif. Bu sırada Zümrüt, Nazlı, Börü, Dursun, Durmuş, Hasan, Kemal, Rıza ile tanışılır; 5. gün Yıldızsız Gezgin bir **robot köpek** hediye eder; köprü onarılınca ya da 3. günden sonra Tüccar Nuri'nin gemisi kumsala gelmeye başlar.
2. **Metal çağı (köprünün karşısı):** Bakır + kalay → **tunç külçesi**; Bataklık'ta demir cevheri → **demir külçesi**; tunç/demir zırhlarla **savunma 60**. Bataklık'ta Avcı Toygar ile tanışılır (Kamış çizme ve Panzehir tarifleri).
3. **Doğu geçidi:** Sıradağdaki kaya yığını Kül Diyarı yolunu kapatır. **2 Kaya patlatıcı** (3 Yarasa gübresi + 2 kömür + 1 tuz + 1 çömlek) ve kuvars ya da daha iyi bir kazmayla yığının başında açılır ("Yol açıcı" başarımı).
4. **Kül Diyarı:** bir **lav kertenkelesi** avla (Ateş çiçeği merhemi tarifi gelir). Kara ejder burada.
5. **İzler:** eşinden kalan 6 mor iz (2 yurtta, 2 Bataklık tarafında, 2 doğuda). Son iz Mor Kristal Vadisi'nde ve "Gerçek" sahnesini oynatır. Ekin kırk yıl önce kendi gemisini de mor ışığın batırdığını anlatır ve **Gemi** tarifini kitabına yazar.
6. **Levent:** Gemi tarifini kazanda öğrenince Mor Kristal Vadisi kıyısına bir enkaz çarpar ve **Denizci Levent** belirir. 4 görevi: Kardelen merhemi + 2 Ay otu, 2 Gölge kurdu, 2 Ay taşı + 4 Kristal, son olarak **gemi malzemeleri** (8 kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek). Gemi ("Meltem") yapılınca Levent kızının hikâyesini anlatır ve "Götür beni" ile deniz yolculuğu başlar → **ACT 2**.

> Gemi malzemeleri iki kez gerekir: bir kez tarifi kazanda öğrenirken, bir kez de Levent'in son görevinde. Ülker'in "Portal çekirdeği" görevi **2 Kristal ve 2 Demir levha** ister ve bunlar yalnızca birinci adada bulunur (2 Mor kıymık ikinci adanın gecelerinde de çıkar). v1.76'dan beri ikinci adaya bir kez varınca **Levent'in yanındaki portal** (ACT 2) ve **Ekin'in yanındaki portal** (ACT 1) hep açıktır; eksik malzemeyi almak için birinci adaya dönebilirsin.

## ACT 2 yol haritası

ACT 2 bölümündeki "ACT 2'nin akışı"na bak: Ülker (portallar) → Pervin (asa) → Tamer (tabanca) → Selin (meka zırh) → Alara (ışın kılıcı) → Tuna (roket) → fırlatma → kavuşma ve son kartı. Bütün ACT 2 ustaları varıştan itibaren yerindedir; sıra yalnızca ok ve görev kartıyla yönlendirilir, istersen sırayı bozabilirsin.

## Gezginler ve takvim

| Kim | Ne zaman | Ne yapar |
|---|---|---|
| Yıldızsız Gezgin | 5. gün | Bir robot köpek hediye eder (köpek seçtiğin malzemeyi senin için toplar). |
| Yıldızsız Gezgin | 20. gün | **Mor sinyal** verir: köpekler menüsünden sikkeyle köpek ısmarlanır. Fiyat 500 × 1,6^(sahip olunan köpek), 10'a yuvarlanır: 800 → 1.280 → 2.050 → 3.280. En çok 5 köpek. |
| Tüccar Nuri | köprü onarılınca ya da 3. günden sonra | Kumsaldaki iskeleye yanaşır, 10 dakika kalır, 6–9 dakika sonra yine gelir. Sipariş ister: ilki 5 Dal + 5 Taş + 3 Lif = 64 sikke; sonrakiler rastgele 2–3 ucuz malzeme, ödeme 3 × (değerleri) + 25 sikke. |
| Yıldızsız Işıkçı | 15. günden sonra her akşam 18:00–05:30 | Yurtta sabit bir yerde (haritada mavi nokta). 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi karşılığında **Kafa lambası** verir, sonra bir daha gelmez. |
