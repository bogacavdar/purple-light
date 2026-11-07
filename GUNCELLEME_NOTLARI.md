# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 3.61 · 7 Kasım 2026

### Oynanış

- **Döşe kolla:** evde Kol menüsünden Döşe'yi aç. Eşya listesinde yön tuşlarıyla gezilir, A eşyayı seçer. Sonra odada bir kare imleç belirir: yön tuşları ya da çubuk onu kaydırır, A koyar, Y döndürür, B bırakır. Listede X'e basınca imleç seçim yapmadan çıkar. Yerleşik bir eşyanın üstünde A, Taşı / Geri al / Döndür menüsünü açar. B ile Döşe biter.
- **Harita kolla:** sol (ya da sağ) çubuk haritayı kaydırır, LT / RT uzaklaştırır / yakınlaştırır, Y bulunduğun yere döner, B kapatır. Ortadaki artıyla A'ya basarsın: bir işaretin üstündeysen işaret kalkar, bir kişinin üstündeysen ok onu gösterir (yine basınca kalkar), başka yerde işaret konur.
- **Meşaleye reçine sür** Kol menüsünde (meşalen varken).
- **Kolla toplarken bakılan yön:** yanında birkaç toplanacak şey varken A, çubuğun (ya da yüzünün) gösterdiği şeyi alır, yalnızca en yakını değil. Yerde duran eşyalar yine önce alınır, kişiler sonra gelir. Klavyede F değişmedi.
- Standart dışı kollarda (tarayıcının "standard" demediği) yön tuşları da çalışır.

### Arayüz

- Börü'nün kerevit dersinde kart ve büyük uyarı kol açıkken kolun tuşlarını yazar ("Sol çubuk", "X ya da RT", "Atıl: B!", "Savuştur: LT!"). Ayrı ayrı yazılmış W A S D tek bir "Sol çubuk" olur.
- Ayarlar → Kontroller'deki kol düzeni ve kol bağlanınca çıkan bildirim yeni düzene göre ve bağlı kolun tuş adlarıyla yazılır.

### Proje

- Ölçüm: 3.59 ile 3.61 aynı ayarlarla ölçüldü; sayılar geliştirme notunda.

## Versiyon 3.60 · 7 Kasım 2026

### Oynanış

- **Oyun kolu ile her şey:** kol bağlıyken Start (PlayStation: Options) **Kol menüsünü** açar. Devam et'in altında Çanta, El yapımı, Karakter, Yetenekler, Tarif kitabı, Almanak, Görevler, Harita ve Robot köpekler var; evdeyken Döşe, öğreticide Eğitimi geç de buradan. Sonra her zamanki Kaydet, Yükle, Ayarlar, Kontroller, Ana menü gelir.
- Pencerelerde **LB / RB** önceki / sonraki sekmeye geçer (Yetenekler'de Savaş, Ekonomi, Dayanıklılık; Çanta'da bölümler; kazanda grup listesi). **LT / RT** bir önceki / sonraki pencereyi açar (Çanta, El yapımı, Tarif kitabı, Görevler, Karakter, Yetenekler, Harita).
- **Meşale kolla:** LB / RB ile kemerde gezerken boş elden önce meşale yuvası da bir durak. Meşale yuvası seçiliyken X'e kısa basınca meşaleyle vurursun, X'i basılı tutunca meşale yanar ya da söner.
- **Eşya yerleştirme kolla:** yatak, barınak, atölye gibi bir şey elindeyken gölgesi önünde durur ve seninle yürür. Yön tuşları ya da sağ çubuk onu birer kare kaydırır, A koyar, Y döndürür, B vazgeçer. Kurduğun bir şeyin yanında A'yı yarım saniye basılı tutarsan onu yerinden alıp taşırsın; kısa A eskisi gibi kullanır (yatağa yat, eve gir).
- R3 yalnızca ulti; ulti dolu değilken bir şey yapmaz (Robot köpekler Kol menüsünde).
- Açılış sahnesi A, B ya da Start ile geçilir.

### Arayüz

- **Ekrandaki tuş yazıları en son kullandığın aygıta göre:** kola dokunduğun an öğretici kartları, ipuçları, sol menüdeki tuş harfleri ve meşale yuvası kolun tuşlarını yazar ("yanında A", "Yemek için Y"); klavyeye basınca ya da fareyi oynatınca hemen klavye harflerine döner. Kolun adına göre Xbox (A, B, X, Y, LB, RB…) ya da PlayStation (✕, ○, □, △, L1, R1…) adları kullanılır.
- Öğreticinin "Anladım" düğmesi ve "Yeni ders" kartı kol açıkken kendiliğinden seçili gelir; A basar. B kartı birkaç saniyeliğine bırakır, yürüyebilirsin.
- Kolla ana menüde Çıkış'a basınca önce "Oyundan çıkılsın mı?" diye sorulur.
- Kolla menülerde gezmek: sağa basınca ana menüden önce en üstteki simgeye gidilir (doğrudan Çıkış'a değil). Pazarda pencere Sat düğmesinde açılır, adet kutusunda yukarı / aşağı adedi değiştirir. Kazanın grup listesi sol / sağ ile değişir. Arama kutuları kol gezinmesinde atlanır. Seçili eşya alttaki alet şeridinin altında kalmaz.
- Menülerde çubuğu hafif (yarıya kadar) itmek de yeter.

### Düzeltmeler

- Ana menüde kolla yukarı bir kez gidiyor, ikinci basışta gitmiyordu (hile kodunu yazıyorsun sanıyordu). Artık menü her basışta oynar. Hile kodu yine çalışır: kodun son B ve A'sı hiçbir düğmeye basmaz, kod bitince seçim kodu yazmaya başladığın yere döner.

### Tasarım belgesi

- Sistemler › Oyun kolu bölümü yeni düzene göre yazıldı (Kol menüsü, meşale, yerleştirme, tuş yazıları).

## Versiyon 3.59 · 7 Kasım 2026

### Denge

- Kül Diyarı'nın girişinde Kül cini Seviye 36'dan önce çıkmaz; ilk adımlarda yalnızca Kül böcekleri var.
- Mor Kristal Vadisi'nin girişinde Kristal örümcek ve Işık engereği Seviye 44'ten önce çıkmaz.

### Düzeltmeler

- Konuşabileceğin kişilerin dibinde artık yerde toplanacak bir şey (taş, kum, dal…) çıkmaz; F'ye basınca doğrudan kişiyle konuşursun (Barbaros'un yanındaki kum gibi).
- "Bir anı geri geldi" ve ada halkı sahneleri Esc'e ya da dışına basınca biter (sonuna kadar okunmuş sayılır). Eskiden bayıldıktan sonra açılan anı Esc ile kapanmıyor, arkada ada donmuş bekliyordu.

## Versiyon 3.58 · 7 Kasım 2026

Oyun aynı; bu sürüm tasarım belgesini tamamlar.

### Tasarım belgesi

- Tarif listesi tamamlandı: 971 tarif.
- Eşya dizini tam: her eşyanın nereden geldiği yazıyor (mağara buluntuları ve mağara canlılarının düşürdükleri hangi mağarada, deniz balıkları hangi bölgede ve hangi oltayla, Börü'nün kemeri nasıl alınır).
- Adadaki ağaç sayıları güncellendi.
- Çelik kazma tarif tablosuna eklendi.

### Proje

- Belgeyi oyundan üreten araçlar artık mağaraların ve deniz avının verisini de okuyor.

## Versiyon 3.57 · 7 Kasım 2026

### Oynanış

- **"Doğu geçidini aç"** görevi Kaya patlatıcı tarifini bilmeden de alınır; Kayalık Dağ'a varınca Cadı Firuze'de "!" seni bekler. Görevi veren kişi tarifi nerede öğreneceğini söyler.
- **Görev kartı hep sıradaki adımı gösterir:** hangi malzemeyi nerede bulacağın, hangi tarifi kazanda öğreneceğin, ne yapacağın ve nereye gideceğin; "şimdi ne yapacağım" demezsin.
- Ağaçlar biraz daha seyrek; ada daha ferah.

### Arayüz

- Dikkat çeken düğmeler (Almanak ve kırmızı sayısı, ders ışıkları, menü düğmesi) artık hızlı yanıp sönmez; yavaş ve yumuşak bir nabız atar.
- El yapımı listesinde resim ve ad solda, Yap · ×5 · Hepsi · Takip et düğmeleri sağda; bütün tarif ve sipariş listeleri aynı düzende.

### Düzeltmeler

- Kemal Kaya patlatıcının malzemelerini doğru söylüyor (kömür değil, turba).

## Versiyon 3.56 · 7 Kasım 2026

### Oynanış

- **F her zaman önce yerdekini alır:** ayağının dibinde toplanacak bir şey varsa F önce onu toplar; kişiyle konuşmak, kapıdan girmek ve öbür işler yerde bir şey kalmayınca.
- **"Doğu geçidini aç"** yine Kaya patlatıcı tarifini kazanda öğrendikten sonra verilir (Kemal, Doğan ya da Firuze); tarifi bilmiyorsan Kemal seni ona götürür. Tarifi öğrenmeden almış olduğun görev, oyunu açınca geri bırakılır ve tarifi öğrenince yeniden verilir.

## Versiyon 3.55 · 7 Kasım 2026

### Denge

- **Kayalık Dağ, Kül Diyarı ve Mor Kristal Vadisi de derinleştikçe zorlaşıyor:** bir önceki bölgeden girdiğin yerde sakin ya da hafif canlılar var, içeri yürüdükçe tehlikeliler başlar, en derinde bölgenin bütün canlıları seni bekler.
- **Kayalık Dağ:** girişte Kartal Seviye 30'dan, Yaban öküzü Seviye 28'den sonra çıkar; Vaşak yalnızca içeride, Mağara ayısı yalnızca en derinde.
- **Kül Diyarı:** girişte önce yalnızca Kül böceği ve Kül cini var; Ateş akrebi ve Kül kurdu içeride, Kara ejder en derinde.
- **Mor Kristal Vadisi:** Gölge kurdu içeride Seviye 45'ten sonra, Kristal golem en derinde.
- **Kül kurtları ve Gölge kurtları** önce ikili gezer, seviyen yükseldikçe sürüleri büyür.

## Versiyon 3.54 · 7 Kasım 2026

### Oynanış

- **Yeni biyoma varınca orada da iş var:** "Doğu geçidini aç" görevini Kayalık Dağ'daki Cadı Firuze'den (ya da "Dağ yolu"ndan sonra Avcı Doğan'dan), "Eşinden kalan izler" görevini Kül Diyarı'ndaki Cadı Mercan'dan da alabilirsin; Kemal'e dönmen gerekmez. Ödül yine bir kez.
- "Doğu geçidini aç" görevi Kaya patlatıcı tarifini bilmeden de alınır; görev kartı tarifi kazanda öğrenmeni hatırlatır.
- **Elmas Nine'nin sahnesi** artık ailenin son görevini teslim ettiğin an oynar; sonradan, bir yere giderken ya da Kemal'le konuşurken birden açılmaz.

### Düzeltmeler

- Köprü onarımı ve kaya yığını patlatmak (iki adada da) görev ödülünün üstüne fazladan XP vermiyor (köprü 120, geçit 400 XP).
- Bir kişinin hemen yanında F, yerde ya da elde ne olursa olsun önce o kişiyle konuşur.
- Ara sahne sürerken başarım kartı ve duyurular üstüne binmez; sahne bitince sırayla gelir.
- Kemal geçit için doğru kazmayı söylüyor: kuvars ya da çelik kazma.

### Arayüz

- Görev kartı, tarifi henüz öğrenilmemiş bir şey varsa yazar: "Tarif: Kaya patlatıcı (kazanda öğren)".

## Versiyon 3.53 · 7 Kasım 2026

### Düzeltmeler

- Avcı Doğan'ın başında, onunla tanışmadan önce de "!" çıkar; Bataklık'a gelince onu bulmak kolay.
- Gün başındaki "YENİ BİR GÜN" yazısıyla aynı anda gelen küçük bildirimler artık üstüne binmez; yazı kapanınca birer birer gelir.
- Kemal köprü işini vermeden kırık köprü artık "onar" demez, yalnızca "Kırık köprü" yazar.

### Arayüz

- Köprüyü onarırken verilmemiş seviye puanın varsa pencerede "N seviye puanın bekliyor." yazar.
- Karakter penceresinde bir özellik bu seviyenin sınırına gelince + yerine "Sv N'de açılır" yazar.

## Versiyon 3.52 · 7 Kasım 2026

### Denge

- **Bataklık artık derinleştikçe zorlaşıyor:** köprüye yakın kıyıda yalnızca sakin hayvanlar ve (Seviye 12'den sonra) Zehirli kurbağa var. Biraz içeride Bataklık kurdu Seviye 20'den, Timsah Seviye 22'den sonra çıkar; en derinde ise her şey seni bekler.
- **Kurt sürüleri seviyenle büyür:** Bataklık kurtları önce en çok ikili gezer, Seviye 22'den sonra üçlü, Seviye 25'ten sonra tam sürü.
- **Bataklık köprüsü görevi Seviye 12'de açılır,** Börü'nün "Ritimli 2. vuruş" dersi de Seviye 12'de. Görevi zaten almış ya da bitirmiş olanlar etkilenmez.
- **Orman'ın sonu daha zorlu:** Engerek (can 120, vuruş 20, 26 XP) ve Oklu kirpi (can 330, vuruş 30, 61 XP) güçlendi. Oklu kirpi Seviye 10'dan sonra önce köprüye yakın yerlerde, Seviye 14'ten sonra bütün Orman'da çıkar.
- **Bataklık kurdu** biraz zayıfladı (can 450, vuruş 52, 114 XP). Bataklık'taki bütün canlılar 1,5 kat XP verir.
- **Vaşak** daha çetin: can 1.050, vuruş 112.
- **Yan görev ödülleri:** Lale, Ela ve Mor Kristal'in altı görevinin ödülleri yeniden ayarlandı.

## Versiyon 3.51 · 7 Kasım 2026

### Düzeltmeler

- **Bataklık görevleri açılmıyordu:** Avcı Doğan ilk konuşmada Kamış çizme ve Panzehir tariflerini artık gerçekten öğretiyor; "Çamur yürüyüşü" görevi açılıyor ve Bataklık'taki görev zinciri sürüyor. Doğan'la daha önce tanışmış oyuncular da tarifleri kayıt yüklenince ya da Doğan'la bir sonraki konuşmada alır.
- **Köprüye her odun:** kırık köprüler için her tür odun sayılır (Çam, Meşe, Kayın, Ladin…).
- Görevler penceresinde artık eski birleştirme yuvaları görünmüyor.
- Adlara gelen ekler doğru: "Hekim Şifa'ya götür", "Seviye 6'ya ulaş".
- Sınırsız sikke açıkken de yan görevlerin sikkesi kesene eklenir.

### Oynanış

- **Kamış çizme elle yapılır:** 6 Kamış, 3 İp, 2 Yosun; savunma 13, değeri 149 sikke.
- Hekim Şifa'nın kazanını beklerken önce bir Engerek, sonra iki kez birer Bataklık kurdu gelir.
- Bir kişinin hemen yanındayken F önce o kişiyle konuşur, yerdeki bir şeyi toplamaz.

### Arayüz

- Seviye atlayınca kısa bir "+N seviye puanı" yazısı çıkar; birden çok seviye atlarsan tek yazıda toplanır.
- Gün başı yazısı ile seviye yazısı artık dünyada da üst üste binmez, sırayla gelir.
- Telefonda ev içinde Vur düğmesi gizlenir, sol menü kapalı açılır.

---

## Versiyon 3.50 · 6 Kasım 2026

### Arayüz

- Harita, Döşe ya da bir pencere yüzünden bekleyen duyurular artık sırayla gelir: önce gün, sonra seviye, sonra keşifler ve başarımlar; hiçbiri üst üste binmez.
- Ev içinde oda, alttaki alet çubuğunun ve üstteki uyarının arasına sığar; kapı ve duvar şeridi örtülmez.
- Usta Sinan'ın ev listesinde, tarifini öğrendiğin evlerin altında "Kendi malzemenle: işçilik N sikke" yazar.
- Hile modu açıkken Arena düğmesinde "Kilitli" yazısı görünmez.

### Düzeltmeler

- Hile modu artık cihazda kalmıyor: sayfayı yenileyince kapanır; oyunun kendi açıp kapanmalarında (yeni oyun, ada değişimi, arena) açık kalır.

---

## Versiyon 3.49 · 6 Kasım 2026

### Oynanış

- **Evini döşemek kolaylaştı:** Döşe'ye basınca oda bütün ekranı kaplar, eşyaların altta bir şeritte durur; alet çubuğu, menüler ve dövüş düğmeleri gizlenir. Telefonda eşyayı şeritten seçip odada yerine dokunarak koyarsın.
- Seçtiğin eşyanın hemen yanında **Döndür** düğmesi var.
- Konmuş bir eşyaya dokununca **Taşı / Geri al / Döndür** çıkar; eşyayı sürükleyerek de taşıyabilirsin. Uygun olmayan yere bırakırsan eşya yerinde kalır.
- Çantanda ev eşyası varken bir eve ilk kez girdiğinde Döşe kendiliğinden açılır.
- Evin kapısının önündeyken F önce kapıyı açar; yerdeki bir şeyi toplamaz.
- Yatağı koyunca "Yatağı yerleştir" yazısı hemen kalkar.

### Denge

- **Ev fiyatları tablodaki gibi:** Deri çadır 300, Kulübe 450, Kamış kulübe 650, Kerpiç ev 950, Ahşap ev 1.500, Taş ev 2.500, Konak 5.000 sikke. Yaprak barınağı 25 sikke ve malzemesi. Tarifini öğrendiğin evleri kendi malzemenle Usta Sinan'a yalnızca işçilik ödeyerek yaptırabilirsin.

### Arayüz

- Döşe sırasında ve büyük harita açıkken duyurular beklemeye alınır, sonra gösterilir.
- Ders kartlarında, yetenek açıklamalarında, boş envanter yazısında ve ev içindeki yazılarda doğru tuş (F) yazar.
- Usta Sinan'ın sipariş penceresi evleri artık kendisinin yaptığını söyler.
- Hile paneli aramasında evler ve ev eşyaları da çıkar; hile modu açıkken Arena açıktır.

---

## Versiyon 3.48 · 6 Kasım 2026

### Oynanış

- Yaprak barınağı görevinde malzemeleri çantana koyup Usta Sinan'a gidince doğrudan ev listesi açılır.
- Usta Sinan'ın 3.47'de eklenen yönlendirme cümlesi kaldırıldı.

### Denge

- **Yan görev ödülleri yeniden ayarlandı:** her yan görev, onu açan ana görevin ödülünün 1,5–2,5 katı kadar sikke ve XP verir; hiçbiri 3.46'daki değerinin altına düşmez. 3.47'de erken yan görevler fazla XP verip seviye atlatıyordu.

### Arayüz

- Büyük haritada ana görevin "!"i de yan görevin "?"si kadar büyük ve okunur.
- Fareyle bir kişinin üstüne gelince ipucu doğru tuşu (F) yazar.
- "Yeni ders" kartı açık bir pencerenin (konuşma, sipariş, pazar, harita) üstüne binmez; pencere kapanınca çıkar.

---

## Versiyon 3.47 · 6 Kasım 2026

### Oynanış

- **Görev işaretleri bulunduğun yere göre:** iki "!" önce bulunduğun bölgedeki kişilerde çıkar. Orman'a varınca Usta Sinan'ın ilk görevi hemen görünür.
- **Börü'nün kaçma dersi:** öğreticiyi geçtiysen ders seni Börü'nün yanında tutmaz; uzaklaşırsan ders biter, istediğin zaman Börü'den yeniden alabilirsin.
- **Yaban domuzları geceleri:** Orman'da yaban domuzu artık yalnızca gece çıkar ve gördüğü an saldırır.
- Usta Sinan'ın sana henüz işi yokken ilk sözü seni nereye gideceğine yönlendirir.

### Denge

- **Yan görev ödülleri yükseldi:** bütün yan görevler artık aynı bölgenin ana görevlerinden belirgin biçimde fazla sikke ve XP verir (ör. Güvercinci Bulut 210 sikke · 170 XP, Kristalci Yaren 1.240 sikke · 2.070 XP).
- Sincap avı 5 XP verir.
- Sürü hâlinde gelen saldırgan canlılar düşük seviyede her bölgede küçük gelir: Seviye 1–3'te 2, Seviye 4–6'da 2–3.

### Arayüz

- Büyük haritada yan görev "?"si ve sisli daire, haritayı ne kadar uzaklaştırırsan uzaklaştır okunur büyüklükte kalır.

### Tasarım belgesi

- Orman bölümü oyunla karşılaştırıldı: Deri parçası oranları, canlıların doğma koşulları, sürü boyunun seviyeyle büyümesi, Sarkıt ve yeni yan görev ödülleri eklendi.

---

## Versiyon 3.46 · 6 Kasım 2026

### Kayıtlar

- Eski bir kayıt silindiğinde çıkan bilgi artık ana menüde her şeyin üstünde, okunur büyüklükte ve 5 saniye görünür: "Kaydın eski bir hatadan etkilendiği için silindi." ya da "Ada değiştiği için eski kayıt silindi."

---

## Versiyon 3.45 · 6 Kasım 2026

### Oynanış

- **Porsuk Çayır'da:** Çayır'da artık porsuk da dolaşır (tek başına, günün her saatinde).
- Yerdeki yaprak sayısı artık her yeni oyunda aynı.

### Düzeltmeler

- **Yan görevler fazla XP veriyordu:** bir yan görev bitince, görevin XP ödülü yerine binlerce XP verilebiliyordu (ör. Güvercinci Bulut 50 yerine 3.000'den fazla XP; karakter birden çok seviye atlıyordu). Artık her yan görev tablodaki XP'yi verir.

### Kayıtlar

- Yan görevlerin fazla XP verdiği hatadan etkilenen kayıtlar (3.45'ten önce en az bir yan görevi bitmiş kayıtlar) açılışta silinir ve yeni oyun başlar. Yan görev bitirmemiş kayıtlar olduğu gibi kalır.
- Bir kayıt silinince çıkan kısa bilgi artık 5 saniye ekranda kalır; harita değiştiği için silinen kayıtlarda "Ada değiştiği için yeni oyun başladı." yazar.

### Arayüz

- **Yan görevler haritada:** saati gelmiş, görevi bekleyen bir yan kişi keşfettiğin bir yerdeyse büyük haritada ve köşedeki haritada tam yerinde bir **"?"** ile görünür. Bu "?" ana görevin "!" işareti kadar büyük ve parlaktır. Henüz keşfetmediğin bir yerdeyse ancak yanına yaklaşınca haritada sisli bir daire belirir. Bir bölgede aynı anda en çok iki yan görev işareti olur.
- Haritanın keşfedilmemiş yerlerinde gelip giden süs soru işaretleri kaldırıldı; artık haritadaki her "?" gerçekten bir yan kişidir.
- **Harita açıkken yazılar üstüne binmez:** büyük harita açıkken "Yeni bir gün", yeni malzeme, seviye ve seviye puanı yazıları ve başarım kartı haritanın üstünde çıkmaz; harita kapanınca gösterilir.
- Kamp ateşinin ilk ipucu artık doğru tuşu (F) yazar.
- Orman'daki satıcı Bekir'in adı artık "Seyyar satıcı Bekir".

### Tasarım belgesi

- Çayır bölümü oyunla karşılaştırıldı: haritadaki miktarlar 3.44 ölçüsüne göre, Porsuk, Deri parçası ve Yaban atının çıkma seviyesi, yan görevlerin harita işaretleri, Mavi'nin yeri ve görev açılma koşulları güncellendi.

---

## Versiyon 3.44 · 6 Kasım 2026

### Arayüz

- **Görev işaretleri sadeleşti:** ana görevlerin tek işareti artık görev veren kişinin üstündeki siyah **!** ve parlamadır; dünyada, köşedeki haritada ve büyük haritada aynı. İşi bitince çıkan yeşil "?" ve mavi işaretler kalktı. Henüz tanışmadığın görev sahibi ve karaya oturan Gemici Poyraz da haritada parlayan bir **!** ile görünür. Yan görevlerin sisli mor "?" işareti aynı kaldı.

### Düzeltmeler

- **Biyomlar doğru büyüklükte:** 3.40'ta "her biyomu %50 büyüt" kararı yanlış uygulanmış, biyomlar istenenden çok fazla büyümüştü (en ve boy 1,5 kat, alan 2,25 kat; 968 × 696 karo). Artık her biyom 3.39'a göre **alanca %50** büyük: iki ada da 790 × 568 karo. Adaların şekli, biyomların sırası, nehir, köprüler ve sıradağ aynı; göller de aynı oranda büyüdü, Bataklık'ta 30 gölcük var. Ağaçlar, taşlar, bitkiler ve madenler yine aynı sıklıkta; biyomlar arasında yürümek eskisinden kısa sürer.

### Kayıtlar

- Harita değiştiği için eski kayıtlar açılışta silinir; yeni bir oyunla başlanır.

### Tasarım belgesi

- Belge bölümlere ayrıldı: 15 üst bölüm ve en başta her konunun nerede yazdığını gösteren bir belge haritası.
- Birden çok yerde yazan bilgiler tek yerde toplandı; oyunda artık olmayan eski görev tabloları belgeden çıkarıldı (belge yalnızca oyunun bugünkü halini anlatır).
- Yeni kural: bir harita, biyom ya da bölge için "%X büyüt/küçült" denince alanı %X değişir.
- Ada ve biyom büyüklükleri yeni sayılarla güncellendi.
- Belge yalnızca oyunun bugünkü halini anlatır: eski sürüm izleri temizlendi, oyundan kalkmış kurallar çıkarıldı.
- Güncelleme notları artık son 20 sürümü (3.25–3.44) tutar.

---

## Versiyon 3.43 · 6 Kasım 2026

### Oynanış
- **Çiftçi Ekin (Çayır, ana görev):** korkuluğu her gece kayboluyor. Saman izlerini takip et; korkuluğu yürüten aç kirpiye bir yabani elma bırak. Görevden sonra Ekin "adama döneceğim" deyip gider.
- **Barbaros'un yanında Ekin:** Barbaros'un dördüncü görevini (Yelken ipi) teslim edince Ekin enkazın yanında belirir; akıntı onu oraya atmış. Barbaros onu adasına götürür. Barbaros'un son görevi (gemi, ACT 2'ye geçiş) bu olaydan sonra gelir.
- **Bereket Adası:** Barbaros'un yanındaki kayıkla gidilen küçük bir ada. Ekin'in evi, ambarı, tarlası, kuyusu, tavukları, fidan yerleri var. Canavar çıkmaz, mor ışık inmez, gece güvenlidir.
- **Tarla geri geldi:** tırmıkla hazırla, tohum ek, sulama kabıyla sula, tırpanla biç. Ürünler sen adada değilken de büyür. Ekin tohum ve fidan satar; fidan dikince üç günde gerçek bir meyve ağacı olur.
- **Ekin'in 7 yeni görevi:** dört alet, ilk başak, yeni korkuluk, ilk fidan, tarlayı büyütmek, bereketli sepet ve ekmek kokusu.
- **Yeni tarifler:** Korkuluk, Hasat sepeti, Buğday unu, Ekmek.

### Görsel
- Ekin, kirpi ve devrilmiş korkuluk, saman izleri, adanın kumsalı ve iskelesi, ambar, kuyu, tavuklar, fidanlar; tohum keseleri, başak, un çuvalı, ekmek, korkuluk, hasat sepeti ve fidan resimleri.

### Tasarım belgesi
- "Çiftçi Ekin · Çayır → Bereket Adası" bölümü oyundaki haliyle güncellendi.

## Versiyon 3.42 · 6 Kasım 2026

### Oynanış
- **Evcil hayvanlar:** her biyomda bir canlı evcilleşir. Binekler: Yaban atı (Çayır), Dağ keçisi (Kayalık Dağ), Kristal geyik (Mor Kristal Vadisi). Savaşçılar: Kurt (Orman), Timsah (Bataklık), Lav kertenkelesi (Kül Diyarı).
- **Nasıl:** canlının sevdiği yiyeceği yanına bırak, birkaç adım geri çekil ve bekle. Yerse başının üstündeki güven çubuğu dolar; koşarsan ya da vurursan ürker. Dört beslemede evcilleşir ve ona bir ad koyarsın. Savaşçılar inlerindeki yavrudan evcilleşir: gündüz yavru yalnızdır, gece anne inin başında bekler.
- **Önce ağıl:** dünyada bir ağıl kurulmadan hiçbir canlı evcilleşmez. Ağılda kimin yanında kimin ağılda kalacağını seçersin.
- **Yanında 1 binek ve 2 savaşçı** dolaşır. Bineğe **B** ile (telefonda Bin düğmesiyle) binersin; çok daha hızlı gidersin. Savaşçılar senin vurduğuna ve sana saldırana saldırır; kurt hızlı, timsah ısırdığını bırakmaz, kertenkele yakar.
- **Ölüm:** savaşçı ölürse geri gelmez; adı ağıldaki taşa yazılır, 3 gün sonra ininde yeni bir yavru doğar. Binek ölmez: bayılıp ağıla döner, sevdiği yiyecekten 3 tane verince ayağa kalkar.
- **Çoban Davut ana görev oldu:** Pamuk'un görevi artık onun ilk ana görevi. Sonraki görevleri evcilleştirme üzerine: ağıl, at, kurt, timsah, dağ keçisi, lav kertenkelesi, kristal geyik. Her evcilleştirmeden sonra bir sonraki biyomda karşına çıkar. Ağıl kurmadıysan Kemal hatırlatır.
- **Yeni yan görev · Gece öten kuş (Çayır):** uykusu kaçmış Toprak her gece ağlayan bir kuşu duyuyor. Kuşu sesinden bul, yuvasını yeniden kur.

### Görsel
- Ağılın kendi çizimi (çit, yemlik, saman), kurt ini, timsah yuvası, kertenkele kaya çatlağı, binince bineğin sırtında oturan karakter, yoldaşların ad etiketleri.

### Ses
- Bıldırcının alçak, yumuşak ötüşü.

### Tasarım belgesi
- "Evcil hayvanlar", "Çoban Davut", "Gece öten kuş" bölümleri; Çiftçi Ekin ve Bereket Adası'nın tasarımı (henüz oyunda yok).
