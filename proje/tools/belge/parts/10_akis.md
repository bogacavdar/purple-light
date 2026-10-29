# Oyunun akışı

Bu bölüm oyunu baştan sona, oyuncunun yapacağı sırayla anlatır. Ayrıntılar (her görevin istediği, ödülü) "Kişiler ve görevler" bölümlerinde.

## Açılış

1. **Ana menü:** Yeni oyun, Devam et, Kayıttan yükle, Ayarlar, Kayıtları dışa/içe aktar, Arena (kilitli), Çıkış. Menünün altında sürüm etiketi (ör. "Versiyon 1.81").
   - **Hakkında** penceresinde "Bir Boğaçhan Çavdar oyunu" yazısının altında **"Tasarım belgesine buradan ulaşabilirsiniz"** bağlantısı vardır (v2.09). Tıklanınca bu tasarım belgesi oyunun içinde, tam ekran bir pencerede açılır (aranabilir hali, `belge.html`); sağ üstteki **Kapat** ya da Esc ile Hakkında'ya dönülür. Belge yeni sekmede de açılabilir ("Yeni sekmede aç").
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
| 2 | Ekin | Yemek düğmesiyle (F) 5 böğürtlen ye (soldaki yemek düğmesi mavi parlar ve ok onu gösterir; yemek listesi açılınca Böğürtlen'in **Ye** düğmesi parlar) | Cadı Zümrüt görünür; Ekin seni kuzeye, ormanın kıyısına yollar |
| 3 | Zümrüt | Zümrüt'e git ve konuş | Kazanın yanına 2 Dal, 2 Lif, 2 Yaprak konur |
| 4 | Zümrüt | Kazanda **Kaba meşale** tarifini öğren | Malzemeler yeniden konur |
| 5 | Zümrüt | El yapımı ekranında (Tab) meşaleyi yap, bir yuvaya koyup eline al | Kazanın yanına 4 Taş konur. Meşale ele gelince Zümrüt **meşaleyi anlatır**: gündüz işe yaramaz, gece içindir; yalnızca eldeyken yanar ve Kaba meşale yaklaşık **110 saniye** yanınca biter (yağmurda daha çabuk); gündüz elinden indir, akşam karanlığında eline al, yedeğin olsun |
| 6 | Zümrüt | 4 taşı topla | — |
| 7 | Zümrüt | Kazanda **Keskin taş** tarifini öğren (2 Taş) | — |
| 8 | Zümrüt | Kalan 2 taşla elle Keskin taş yap | Zümrüt kuzeydoğudaki Nazlı'yı söyler |
| 9 | Nazlı | Pazarcı Nazlı ile tanış | Pazar "Sat" sekmesiyle açılır |
| 10 | Nazlı | Keskin taşı sat | Nazlı doğudaki Börü'yü söyler |
| 11 | Börü | Börü ile konuş, çıkan **kereviti yumrukla** (yumruk 4 hasar). Bilgisayarda dövüş şöyle öğretilir: **WASD ya da yön tuşlarıyla** yürüyüp kerevite yaklaş, **sol tıkla** vur (bu derste sol tık yürütmez, tıklanan yöne yumruk atar; telefonda kerevite dokunulur); ardından **atılma dersi** ve **yetenek ağacı** (aşağıda) | Atılma öğrenilir (ücretsiz); Taş balta, Sopa ve İp tarifleri öğrenilmiş olur; +6 Taş; Börü'nün yanına 3 Dal, 8 Lif, 4 Taş konur |
| 12 | Börü | Balta parçalarını elle yap: 2 Keskin taş → 1 Sopa → 2 Keskin taş → 2 İp (2 Taş da yanında kalsın). Sıradaki parçanın malzemesi tamamsa el ikonu (Tab) parlar; el yapımı ekranında o parçanın (Keskin taş, Sopa ya da İp) **Yap** düğmesi mavi parlar, ok onu gösterir ve liste oraya kayar | — |
| 13 | Dursun | Parçalar tamamlanınca **Börü** "Şimdi kuzeydeki Demirci Dursun'a git, baltayı o döver, benden selam söyle" der (Dursun'un önceden haberi yoktur). Dursun'a gidince önce **tanışılır** (Dursun kendini tanıtır, "Börü yolladı, selamı var"), sonra parçaları görüp örsü açar. Örste **Taş balta**yı döv (ücretsiz): önce **Hepsini koy**, sonra **Döv** düğmesi sırayla parlar ve okla gösterilir. Sonra baltayı eline al: önce envanter (çanta, I) düğmesi, envanter açılınca **Taş balta**, seçilince boş bir **alet yuvası**, en son alttaki kutusu sırayla parlar ve okla gösterilir. Balta dövüldüğü anda öğretici "baltayı eline al" adımına geçer (Dursun'un penceresi düğmeye basılmadan kapansa bile); bu adımda Dursun'la konuşulursa yeniden balta dövdürmez, malzeme istemez, "baltan zaten dövüldü, eline al" der (v2.06) | Öğretici biter; ok Ekin'i gösterir, Ekin ilk ana görevi verir |

**Gösterme kuralı (v1.89):** öğretici bir düğmeye basmanı istediğinde o düğme (sol menüdeki ikonlar, menülerin içindeki Ye/Yap/Hepsini koy/Döv düğmeleri, envanterdeki eşya, alet yuvası) **mavi parlar** ve yanında yanıp sönen bir **ok** olur. Sıra gerekiyorsa düğmeler sırayla parlar. Adım biter bitmez parlama ve ok söner (örneğin 5 böğürtlen yenince yemek düğmesi artık parlamaz).

### Börü'nün atılma dersi (v1.81, 11. adımın içinde)

1. Kerevit yumrukla yenilince Börü "Şimdi kaçmayı öğren" der ve yanına **yeni bir kerevit** çıkar. Bu kerevit can yakmaz, ölmez; yalnızca saldırır. Atılma bu derste **ücretsiz** öğrenilir (yetenek ağacında satılmaz).
2. Kerevit doğadaki gibi davranır: **yürüyerek** sana yaklaşır (sen uzaklaşırsan peşinden yürür), yakına gelince bir an bekler, üstünde kırmızı **!** belirir, sonra sana atılır. Saldırıdan sonra olduğu yerde kalır ve yeniden yürüyerek yaklaşır; hiçbir zaman başka bir yere ışınlanmaz.
3. **İlk saldırıda** kerevit tam vuracakken **oyun durur** ve ekranın ortasında büyük harflerle "**Boşluk'a bas!**" (telefonda "**Atıl düğmesine dokun!**") yazar. Basınca oyun devam eder, karakter takla atar ve kereviti savuşturur ("Sıyrıldın!").
4. Sonra kerevit **3 kez daha** saldırır; oyun artık durmaz. Saldırı anında (kırmızı ! görününce ya da kerevit atıldığında) Boşluk'a basarsan sayılır; geç ya da erken kalırsan "Bir daha!" der, can gitmez. Ekranda "Sıyrılma: 1/4" sayacı vardır.
5. 4 sıyrılma (1 + 3) olunca Börü esprili bir dille "**İlk ders tamam!**" der: her kavgaya girmek akıllıca değildir, bazen tabanları yağlamak gerekir; bunun için hızlı koşmayı bilmek gerekir.
6. **Yetenek ağacı zorunlu:** Börü'nün tek seçeneği "Yetenek ağacını aç"tır. Ders biter bitmez soldaki ağaç ikonu (Y) mavi parlar, ok onu gösterir ve ekranın ortasında "Yetenek ağacını aç" yazar; Börü'nün üstündeki ok kalkar. Konuşma penceresi kapansa da bu sürer; ağaç açılmadan Börü'yle konuşulursa Börü yalnızca "önce yetenek ağacını aç" der, dersi ya da kereviti **tekrar vermez**. Ağaç açılana kadar öğretici ilerlemez. Ağaç açılınca Savaş ağacındaki **Koşu** yanıp söner ve üstte Börü'nün notu çıkar: ağaçlar aşağıdan yukarı büyür; Koşu 100 sikke; Nazlı'ya bir şeyler satıp **100 sikke biriktirip** ilk iş bunu almak akıllıca olur.
   - Ağaç açılınca Savaş ağacındaki **Koşu** mavi parlar ve yanında yanıp sönen bir ok olur (v2.09).
7. Ağaç kapatılınca Börü önce **bilgilendirir**: "Gördün mü, en alttaki parlayan **Koşu**. Onu almak **100 sikke** ister. Nazlı'ya bir şeyler sat, 100 sikke biriktir; ilk işin Koşu'yu almak olsun." ("Anladım" düğmesi). Sonra öğretici kaldığı yerden sürer: Börü Taş balta tarifini verir (12. adım).

Öğreticiyi geçen ve atılmayı bilmeyen biri sonradan Börü'yle konuşursa Börü aynı dersi ücretsiz teklif eder ("Öğret" / "Sonra").

### Öğreticiden sonraki kısa dersler

Kartın altında kısa dersler çıkar: **koşma dersi** (Ekin'in köprü görevi bitince; Koşu 100 sikke, Koşu zaten alındıysa çıkmaz), **meşale dersi** (2. ve 3. gün 17:30). İlk gece meşalesi olmayana biri bir Kaba meşale fırlatır (bir kez).

## ACT 1 yol haritası

v1.86'dan beri ACT 1 tek görevlik bir zincirle ilerler (ayrıntı: **ACT 1 · Görevler**). Ekin'in yalnızca ana yolda 5 görevi vardır; gerisi adadaki 26 kişiye dağılmıştır ve birbirini açar.

1. **Çayır:** Ekin'in ilk işi (6 dal, 2 kuru ot) → Dursun aletleri öğretir (taş balta, kazma, çakmaktaşı balta, bileme, tunç) → Rıza kalas ve barınak, Nazlı meyve, balık, satış ve tuzak, Börü kamp ateşi, dövüş ve taş kılıç, Durmuş kemik, kiriş, tunç levha, Zümrüt otlar ve kazan. Börü oyuncuyu **Orman**'a yollar (Hasan ile tanışma).
2. **Orman:** Hasan'ın tarlası (dört alet), Kemal'in yapıları, kuzenler Yakut, Durdu, Duran. Hasan'ın ikinci işi bitince Ekin'in **köprü** görevi açılır (Seviye 6).
3. **Köprünün ötesi:** Bataklık'ta Toygar ve kuzenler Safir, Ali (demir), Veli. Toygar'ın son işi oyuncuyu **Kayalık Dağ**'a götürür (Firuze, Kaya, Kayhan).
4. **Doğu geçidi:** Kayalık Dağ'a varınca ve Seviye 10'da Ekin'in **patlatma** görevi: 2 kaya patlatıcı + tunç ya da kuvars kazma; patlayınca bütün sıradağ çöker ("Yol açıcı" başarımı).
5. **Kül Diyarı:** Mercan, Turan, Tufan. Kül Diyarı'na varınca Ekin'in **izler** görevi: 6 mor iz; bitince **Gemi** tarifi kitaba yazılır, Levent'in enkazı Mor Kristal Vadisi kıyısına çarpar. Ekin'in son işi: Levent'i bul.
6. **Mor Kristal Vadisi:** Levent'in 5 görevi (pusula için kristal, Kudret'in obsidyen kazmasını ister) ve son olarak **gemi malzemeleri** enkaza (8 kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek). Gemi ("Meltem") yapılınca Levent kızının hikâyesini anlatır ve "Götür beni" ile deniz yolculuğu başlar → **ACT 2**. İnci, Kudret, Kuvvet de buradadır.

> **Kuzenler (v1.84):** Orman'dan Mor Kristal Vadisi'ne her biyomda Zümrüt, Dursun ve Durmuş'un birer kuzeni yaşar (cadı, silahçı, zırhçı). Her biri o biyomun malzemesiyle yapılan eşyaları döver ya da tarifleri öğretir ve 5'er görev verir. Zümrüt, Dursun, Durmuş ve 15 kuzenin bütün görevleri bitince ortak ara sahne oynar: mor ışık ninelerini, **Elmas Nine**'yi kaçırmıştır.

> Ülker'in "Portal çekirdeği" görevi **2 Kristal ve 2 Demir levha** ister ve bunlar yalnızca birinci adada bulunur (2 Mor kıymık ikinci adanın gecelerinde de çıkar). v1.76'dan beri ikinci adaya bir kez varınca **Levent'in yanındaki portal** (ACT 2) ve **Ekin'in yanındaki portal** (ACT 1) hep açıktır; eksik malzemeyi almak için birinci adaya dönebilirsin.

## ACT 2 yol haritası

ACT 2 bölümündeki "ACT 2'nin akışı"na bak: Ülker (portallar) → Pervin (asa) → Tamer (tabanca) → Selin (meka zırh) → Alara (ışın kılıcı) → Tuna (roket) → fırlatma → kavuşma ve son kartı. Bütün ACT 2 ustaları varıştan itibaren yerindedir; sıra yalnızca ok ve görev kartıyla yönlendirilir, istersen sırayı bozabilirsin.

## Gezginler ve takvim

| Kim | Ne zaman | Ne yapar |
|---|---|---|
| Yıldızsız Gezgin | 5. gün | Bir robot köpek hediye eder (köpek seçtiğin malzemeyi senin için toplar). |
| Yıldızsız Gezgin | 20. gün | **Mor sinyal** verir: köpekler menüsünden sikkeyle köpek ısmarlanır. Fiyat 500 × 1,6^(sahip olunan köpek), 10'a yuvarlanır: 800 → 1.280 → 2.050 → 3.280. En çok 5 köpek. |
| Tüccar Nuri | köprü onarılınca ya da 3. günden sonra | Kumsaldaki iskeleye yanaşır, 10 dakika kalır, 6–9 dakika sonra yine gelir. Sipariş ister: ilki 5 Dal + 5 Taş + 3 Lif = 64 sikke; sonrakiler rastgele 2–3 ucuz malzeme, ödeme 3 × (değerleri) + 25 sikke. |
| Yıldızsız Işıkçı | 15. günden sonra her akşam 18:00–05:30 | Yurtta sabit bir yerde (haritada mavi nokta). 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi karşılığında **Kafa lambası** verir, sonra bir daha gelmez. |
