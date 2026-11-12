# Sistemler

## Kontroller

| Tuş (bilgisayar) | Ne yapar | Telefonda |
|---|---|---|
| WASD / oklar | Yürü | Kanvası sürükle (görünmez joystick) ya da gideceğin yere dokun |
| Shift | Koş (Koşu yeteneği gerekir) | Çift dokunuş |
| F | Topla, konuş, kapı, yatak, ağacı silkele. F yalnızca **hemen yanındaki** şeye yönelir: karakterin bir kare çevresi, çaprazlar dahil (en çok ~30 px; iki kare ötedekine gitmez, o zaman hiçbir şey yapmaz). Ağaca yalnızca **elde balta varken**, madene/kayaya yalnızca **elde kazma varken** gider (çantada olması yetmez). Sol tıkla elde baltasızken bir ağaca, elde kazmasızken bir madene tıklamak oraya yürütmez, yalnızca o yöne vurur. Elde balta varsa önce ağaç, elde kazma varsa önce maden seçilir; yoksa en yakın toplanacak şey (çalı, yerdeki taş/dal, meyvesi olgun ağaç). Ayağının dibindeki düşmüş eşyalar ve yerdeki toplanabilir her zaman önce alınır; kişi, kapı ve öbür etkileşimler ancak yerde alınacak bir şey yokken seçilir (7 Kasım 2026, Boğaç: "Önce yerdeki envanter olmalı") | Nesneye dokun |
| Q / sol tık | Vur. **Sol tık her zaman tıklanan yöne vurur**, tam tıklanan açıya (çaprazlar dahil; karakter 8 yönlü pozla o yana döner); el boşken yumruk, elde silah/alet varsa onunla. Bir kişiye, kazana/örse/pazara, kurulmuş bir eşyaya ya da toplanacak bir şeye (çalı, maden, ağaç) tıklamak oraya gidip konuşur/toplar. **Yere düşmüş bir eşyaya** (av, odun, taş) tıklamak oraya yürür ve eşya toplanır; üstünde bir hayvan varsa önce ona vurulur. **Bir hayvan sana saldırırken** (ekranda seni kovalayan bir hayvan varsa ya da son 3 saniyede ısırıldıysan) sol tık hiçbir şeyi toplamaz, kimseyle konuşmaz, yere düşene yürümez: **her zaman tıklanan yöne vurur**. F tuşu ve telefondaki düğmeler bundan etkilenmez; onlarla toplamak sürer. Boş yere tıklamak karakteri yürütmez; yürümek WASD/oklarla |
| Boşluk | Atıl / takla (Börü'nün atılma dersinden sonra); yerleştirirken döndür | **Atıl** düğmesi |
| Sağ tık / E | Savuştur (bas) · savunma duruşu, gard (basılı tut); E sağ tıkla aynıdır | **Savuş** düğmesi |
| R | Ulti (çubuk doluyken); değilse robot köpekler menüsü (arenada R yalnızca ulti). **Henüz robot köpeğin yokken R hiçbir şey açmaz** (v3.71, Boğaç: ileride gelen bir şeyi önceden göstermesin); Ayarlar › Kontroller'deki "Robot köpekler" satırı ve kol menüsündeki "Robot köpekler" düğmesi de ilk köpek gelene kadar görünmez. | **Ulti** düğmesi (yalnızca ulti atar, köpek menüsünü açmaz) |
| X | En uygun yemeği ye (basılı tut: yemek listesi) | Tabak simgesi |
| H | Eli boşalt (meyve silkelemek için) | El düğmesi |
| 1–0 | Alet yuvasındaki aleti ele al | Alttaki kutuya dokun |
| Yuvaya sağ tık | **Yuvadaki eşyayı değiştir:** oyun sırasında, envanteri açmadan; kemerin üstünde taşınabilir eşyalarının listesi açılır, birini seçince o yuvaya girer (başka yuvadaysa yer değiştirir); "Yuvayı boşalt" de var. Esc ya da dışarı tıklamak kapatır | Yuvaya **basılı tut** (0,5 sn) |
| Tab | El yapımı | El simgesi |
| K | Tarif kitabı | Sağ alttaki kitap simgesi. **Kazan, Demirci ve Pazar'ın kısayolu ve düğmesi yoktur:** oraya gidip kişiye ya da kazana dokunarak açılır |
| I / C / Y / G | Envanter / Karakter (giyim, istatistik) / Yetenekler / Görevler | Menü simgeleri |

**Telefonda Görevler ("telefonda görevleri açamadım"):** telefonda ☰ içindeki **Görevler** düğmesi her zaman Görevler panelini açar (eskiden bir ders sürerken yalnızca ders kartını katlayıp açıyordu, panel açılmıyordu). Ders sürerken panelin en üstünde **Ders** kartı (dersin adı ve ne yapılacağı) yazar.

| M / T | Büyük harita / bulunduğun yere işaret koy | Küçük haritaya dokun |
| N | İnşa kipi (dışarıda) | ☰ içinde **İnşa** düğmesi |
| V | Kamp ateşi kur | – |
| L | Elindeki meşaleye reçine sür | – |
| O / Esc | Ayarlar / duraklat | Çark simgesi |

- **Vuruş tamponu:** bir vuruş bitmeden (bekleme süresi dolmadan) yeniden vurursan (sol tık ya da Q) basış kaybolmaz: bekleme bitince (basıştan en çok 0,8 sn sonrasına kadar) **son bastığın yöne** vurulur. Karakter yalnızca vuruş gerçekten atılırken o yöne döner (önceden bekleme sırasında tıklanınca karakter dönüyor ama vurmuyordu).

- **Alt + Enter tam ekran:** bilgisayarda Alt + Enter (sol Alt ya da **Alt Gr**; v3.25, Boğaç: Alt Gr ile çalışmıyordu) oyunu tam ekrana alır, yeniden basınca tam ekrandan çıkar (Esc de çıkarır). Her ekranda çalışır (ana menü, oyun, pencereler); o tuşa basış başka bir şey yapmaz (Enter bir pencereyi onaylamaz). Atanamayan sabit bir kısayoldur.
- **Tam ekran açılışta geri gelir (v3.39, Boğaç: "F5 ile yenilediğimde ya da oyunu açtığımda tam ekran olsun"):** bilgisayarda oyun tam ekrandayken sayfa yenilenir (F5, Ctrl+R) ya da kapanıp yeniden açılırsa, oyun **ilk tıklamada ya da ilk tuşa basışta kendiliğinden** yeniden tam ekrana geçer (ana menüdeki ilk tıklama dahil). Tarayıcılar sayfa açılır açılmaz, oyuncu hiçbir şeye basmadan tam ekrana geçmeye izin vermez; bu yüzden geçiş ilk dokunuşla olur. Yenileme ya da kapanma tam ekranı "kapattım" diye saymaz; tam ekran yalnızca oyuncu kendisi çıkınca (Alt + Enter, Esc ya da Ayarlar'daki Tam ekran kutusu) kapalı hatırlanır ve o zaman açılışta tam ekrana geçilmez. Seçim bu tarayıcıda saklanır (oyuncunun kendi seçimi).
- Bütün tuşlar **Ayarlar → Kontroller**'den yeniden atanabilir. Telefondaki dövüş düğmelerinin yeri ve boyutu (%60–200) aynı yerden ayarlanır.
- F (toplama tuşu) hiç vurmaz; yalnızca toplar ve konuşur. Diyaloglarda, anılarda ve balık tutarken de F ilerletir (E artık gard tuşu). Hile tuşu "+100 XP" X'ten J'ye geçti. Tuşlar değişse de oyundaki bütün yazılar yeni tuşları gösterir; fareyle bir şeyin üstüne gelince çıkan ipucu da ("F ile topla", "F ile konuş", "sol tık ya da Q ile vur"). Ayarlar → Kontroller → "Varsayılana dön" bu yeni tuşlara döner.
- **Karakterin 8 yönü (çapraz pozlar):** karakter yürüdüğü yöne göre 8 pozdan birine döner: **ön** (aşağı), **arka** (yukarı), **sağ/sol profil** (yalnızca tam yana yürürken) ve dört **çapraz** poz; çaprazda karakter bütünüyle döner. **Ön-çapraz** (sağ-aşağı / sol-aşağı): yüz hafif yana dönük (karakter yaratma ekranındaki gibi); gövde gidilen yöne 1 piksel kayar, uzak yanı 2 sütun gölgededir, yaka o yana döner; yalnızca yakın kol görünür (uzak kol hiç çizilmez); bacaklar birbirine yakın, gidilen yandaki ayak bir adım yukarıda, ayak uçları gidilen yöne bakar. **Arka-çapraz** (sağ-yukarı / sol-yukarı): başın yalnızca arkası (saç) görünür, yanak/kulak/göz yok, baş **normal boyda**; sırt dönük çizilir: yakın yan gölgede, ortada sırt çizgisi; yalnızca yakın kol görünür; **ayaklar ön-çaprazdaki çizimle aynıdır** (gidilen yandaki ayak bir adım yukarıda, ayak uçları o yana). Elde alet varsa kol gidilen yöne uzanır. Yön hareketin açısından seçilir: yatay ve dikey bileşenin ikisi de yeterince büyükse (yaklaşık 22°–68° arası) çapraz poz. Durunca son poz kalır; vururken, toplarken ya da biriyle konuşurken karakter o işe dönük 4 yönlü poza geçer. Karakter yaratma ekranında sürükleyerek çevirince aynı 8 poz görülür (Boğaç, 29 Ekim 2026).
- **Telefonda sol menü kutusu:** sol üstteki ☰ düğmesi menü kutusunu açar; **Envanter (çanta)** ve **Yemek** düğmeleri de bu kutunun içindedir (önceden ☰'ün yanında dışarıda dururlardı). Öğretici bu düğmelerden birini gösterdiğinde (parladığında) kutu bir kez kendiliğinden açılır ve ☰ parlar.
- **Telefonda Vur düğmesi yürüdüğün yöne vurur:** sol taraftaki görünmez joystick'le yürürken **Vur**'a basınca karakter tam yürüdüğün yöne vurur; **çapraz** yürüyorsan çapraza vurur (karakter 8 yönlü pozla o yana döner). Yakında bir canlı varsa yine ona kilitlenir, ama önce yürüdüğün yöndekini seçer. Dururken basınca son baktığın yöne vurur (eskisi gibi). **Yakında düşman varsa ona vurur:** telefonda yakın dövüşte (yumruk, meşale, kılıç, mızrak, balta, kazma…) **Vur**'a basınca çevrende (150 piksel içinde) seni kovalayan ya da saldırgan bir canavar varsa, yürüdüğün ya da baktığın yön ne olursa olsun karakter **en yakın düşmana döner ve ona vurur** (tam açıyla, çaprazlar dahil). Birden çok düşman varsa en yakını, eşit yakınlıkta önündeki seçilir. Yakında düşman yoksa eskisi gibidir: 110 piksel içindeki zararsız bir hayvana (önündekine öncelik) ya da yürüdüğün/baktığın yöne vurur. Uzaktan silahlarda (asa, tüfek) hedef seçimi değişmedi (240 piksel).
- Telefon yatay oynanır; dikey tutulunca "Telefonunu yan çevir" ekranı çıkar ("Yine de dikey oyna" ile geçilebilir).

- **Fare imleci (v3.32, Boğaç: "normal mouse imleci gibi olmasın"):** bilgisayarda (fareyle) imleç oyunun piksel tarzındadır: her yerde koyu kenarlı **krem rengi piksel ok**; basılabilen şeylerin (düğmeler, sekmeler, eşya kutuları, alet yuvaları) üstünde aynı ok **mor** olur; oyun sahnesinin üstünde (oynarken) **mor ışıklı piksel el** (v3.71, Boğaç: "nişana benzemesin, mor ile eli birleştir"; öncelik fareyle oynayanlar, ilk hedef Steam): krem renkli, ince koyu mor kenarlı, yukarıyı gösteren bir el; işaret parmağının ucu morla parlar ve elin çevresinde soluk mor bir ışık vardır; imlecin ucu (tıklanan nokta) işaret parmağının ucudur. Fare **toplanacak, konuşulacak ya da kullanılacak bir şeyin** üstündeyken (tıklamanın yürüyüp yapacağı şeyler: kişi, çalı, maden, ağaç, kazan, örs, yerdeki eşya, kapı…) el **avucunu açar** ve mor ışık belirginleşir, iki küçük kıvılcım çıkar; su ve boş zemin bu sayılmaz. Bu, fare her kıpırdadığında en çok saniyede ~12 kez denetlenir. Yazı kutularında yazı imleci kalır. Ana menüde sahnenin üstünde de ok görünür. Dokunmatik ekranlarda imleç yoktur.

### Oyun kolu

Oyun bir **oyun kolu** ile de oynanır (Xbox, PlayStation ve çoğu Bluetooth kol; tarayıcının standart kol düzeni). Kol bağlanınca bir bildirim çıkar ve **Ayarlar → Kontroller** penceresinde kol düzeni yazar. Kol, oyuna klavyenin **varsayılan** tuşlarına basıyormuş gibi davranır; bu yüzden tuşları değiştirmek kolu etkilemez. **Klavyeyle yapılabilen her şey kolla da yapılır** (7 Kasım 2026, Boğaç: "Kolla her şeyi yapabilmek istiyorum"; arena, deniz ekranı, balık tutma, anılar dahil).

| Kol | Oyunda | Klavyedeki karşılığı |
|---|---|---|
| Sol çubuk | Yürü (8 yön) | WASD |
| L3 (sol çubuğa bas) | Koş: basınca çubuk bırakılana kadar koşar | Shift |
| A (PlayStation: ✕) | Topla / konuş / kullan | F |
| X (PS: □) ya da RT (R2) | Vur, **nişan yardımıyla** (v3.25, aşağıda) | Q / sol tık |
| B (PS: ○) | Atıl / takla | Boşluk |
| Y (PS: △) | En uygun yemeği ye (basılı tut: yemek listesi) | X |
| LT (L2), basılı tut | Savuştur / gard | E |
| Sağ çubuk (v3.32, Boğaç) | **Nişan:** sol çubukla yürürken sağ çubuğu hangi yöne çevirirsen karakter o yöne döner ve vuruşlar, oklar, asa ve ateşli silah atışları o yöne gider (nişan yardımı yalnızca o yöndeki canlıları seçer). Bırakınca nişan yürüdüğün yöne döner. | fare imleci |
| R3 (sağ çubuğa bas) | Ulti (robot köpekler Kol menüsünde: "Köpekleri çağır"; klavyede tuşu aynı) | R |
| LB / RB (L1 / R1) | Alet kemerinde önceki / sonraki **dolu** yuva; boş yuvaları atlar, boş el ve **meşale yuvası** da birer durak (7 Kasım 2026, Boğaç); meşale elindeyken **X'e kısa basmak vurur** (X ya da RT vurur kuralı aynen), **X'i basılı tutmak (~0,4 sn)** meşaleyi yakar/söndürür; pencere içinde LB/RB sekme değiştirir (arenada RB silahı elden alıyordu; arenada boş el durağı yok) | fare tekerleği |
| Yön tuşları | Yukarı El yapımı · aşağı Envanter · sol Tarif kitabı · sağ Görevler | Tab · I · K · G |
| Select / Back (PS: Paylaş) | Büyük harita; **basılı tut:** arayüz odak kipi (ekrandaki düğmeler arasında gezinme) | M |
| Start / Menu (PS: Options) | Duraklat ve **Kol menüsü**nü aç (aşağıda) | Esc |

- **Pencerelerde ve menülerde** (ana menü, karakter yaratma, konuşma, envanter, ayarlar…) sol çubuk ya da yön tuşları seçili düğmeyi o yöndeki düğmeye taşır (basılı tutunca tekrarlar). Önce **aynı satırdaki** (sağ/sol) ya da **aynı sütundaki** (yukarı/aşağı) en yakın düğmeye gidilir; orada düğme yoksa o yöne bakan 45°lik açı içindeki en yakın düğmeye; o da yoksa seçim yerinde kalır (yiyecek listesinde sağdaki "Ye"den sola basınca yukarıdaki sekmeye çıkıyordu). seçili düğme mavi bir çerçeveyle görünür. **A** seçili düğmeye basar (seçili düğme yoksa F'ye basılmış gibi ilerletir: anılar, balık tutma), **B** Esc gibi kapatır/geri döner, kaydırıcıda sol/sağ değeri değiştirir. **Nişan yardımı (v3.25, Boğaç: "vuruşlar gittiğim yöne vurmuyor; yakında biri varsa telefondaki gibi otomatik ona vursun"):** yalnızca kolla vururken; fareyle oynarken yoktur. Vur'a basınca vuruş şuraya gider: (1) yakın dövüşte 150 piksel içindeki **saldırgan** bir canlıya (seni kovalayan, saldıran, saldırgan huylu ya da reis; çubuğun yönüne en yakın olan seçilir), (2) yoksa önündeki en yakın canlıya (yakın dövüşte 110, yay, asa ve tabancada 240 piksel; çubuğun yönüne bakanlar önce), (3) hiçbiri yoksa **sol çubuğun gösterdiği yöne**, çubuk bırakılmışsa baktığın yöne. Karakter vurduğu yöne döner. Vuruş fareyle tıklamanın aynısıdır: basılı tutmak ağır vuruş, art arda basmak kombo, yayda ok o noktaya gider. Bu kurallar telefondaki Vur düğmesiyle aynıdır. **Seçim yerinde kalır (v3.25, Boğaç: böğürtlen yerken her seferinde aşağı inmek gerekiyordu):** bir düğmeye A ile basınca pencere yeniden çizilse de (ör. yiyecek listesinde "Ye") seçim aynı düğmede ya da o düğme gittiyse onun yerindeki en yakın düğmede kalır. **Ad yazmak (v3.25, Boğaç: A rastgele ad veriyordu):** ad kutusundayken A **ekran klavyesini** açar (Türkçe harfler, Boşluk, Sil, Tamam; ilk harf ve boşluktan sonraki harf büyük, gerisi küçük yazılır). Klavyede çubuk ya da yön tuşlarıyla gez, **A** harfi yazar, **X** siler, **B** klavyeyi kapatıp ad kutusuna döner, **Start** ya da **Tamam** klavyeyi kapatıp seçimi ekranın Tamam düğmesine taşır. Rastgele ad için ekrandaki "Rastgele" düğmesine A ile basılır.
- **Pencere açılınca ilk kullanılabilir şey seçili gelir (v3.32, Boğaç):** kolla bir pencere açılınca (ya da pencerenin bir sekmesine geçilince) seçim kapatma düğmesinde ya da sekmelerde değil, **listedeki ilk kullanılabilir şeyde** başlar: kazanda/örste ilk tarif, El yapımı'nda yapılabilen ilk eşya, yemekte ilk yenilebilir şey (Ye düğmesi), envanterde ilk eşya; başka pencerelerde içerikteki ilk düğme.
- **Tuş yazıları son kullanılan aygıta göre (7 Kasım 2026, Boğaç):** öğretici kartları, istemler ("F Taş topla"), ders kartları, yetenek açıklamaları, ipuçları ve ekrandaki bütün tuş yazıları **en son kullanılan giriş aygıtına** göre yazılır ve aygıt değişince **hemen** değişir. Kol yazıları kolun ilk girdisiyle başlar, klavye ya da farenin ilk girdisiyle biter; kol bağlı ama dokunulmamışsa klavye yazıları kalır; çubuğun ölü bölge içindeki titremesi geçiş sayılmaz:
  - **Klavye/fare:** klavye tuşu (ayarlardaki atamaya göre; ör. "F'ye bas", "sol tık").
  - **Kol:** kolun tuşu (ör. "A'ya bas"). Kolun türü adından anlaşılır: **Xbox** → A/B/X/Y, LB/RB, LT/RT, Start, View (Select); **PlayStation/DualSense** → ✕/○/□/△, L1/R1, L2/R2, Options, Create. Tür bilinmiyorsa Xbox adları kullanılır. Kola özel yazılar: sayı tuşlarıyla yuva seçimi "LB / RB ile"; "X'e tıkla ya da yanında F'ye bas" türü yazılar "X'e gidip A'ya bas"; kemer ipucu "çantada seç (A), yanıp sönen yuvada A".
  - **Telefon/tablet (dokunma):** dokunma düğmesinin adı (ör. "Atıl düğmesine dokun").
- Kol klavye ya da fare kullanılınca susmaz; ikisi birlikte kullanılabilir. Kol ayrılınca basılı kalan tuşlar bırakılır.
- **Titreşim:** hasar alınca kol titrer (alınan hasarla güçlenir); titreşimi desteklemeyen kolda bir şey olmaz.
- Kol yalnızca bağlıyken okunur: kol yokken oyuna hiçbir yük eklenmez.
- **Kol kopuyorsa (v3.26, Boğaç'ın denemesi):** Xbox kolu **Xbox kablosuz aparatıyla** bağlıyken Chrome ve Edge'de (masaüstü uygulaması da Chrome/Edge'dir) tarayıcı kolu okumaya başladığı an bağlantı kopabiliyor; bu oyundan değil, aparat ile Chrome/Edge arasındaki uyumsuzluktan (kolu okuyan her sayfada oluyor, ör. hardwaretester.com). **Firefox'ta sorun yok**; kabloyla bağlamak da çözer. Kalıcı çözüm tarayıcı dışı sürüm (bkz. Platformlar › Godot'ya geçiş). Oyunun içinde bu konuda bir yazı yoktur (v3.27, Boğaç: oyuncuya adım adım iş yaptırılmaz).
- **Hile kodu:** ana menüde ve açılış ekranlarında (yükleme, zorluk, karakter yaratma, ayarlar) Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A hile ayarlarını açar/kapatır (Sistemler › Arena, hileler, kayıt › Hileler). **Kod girerken odak serbestçe gezer (7 Kasım 2026, Boğaç; önceki "kod girerken menü oynamaz" kuralının yerine):** yön basışları seçili düğmeyi her zamanki gibi taşır; yalnızca kodun son **B** ve **A** basışları yutulur (hiçbir düğmeye basmaz, geri dönmez); kod tamamlanınca seçim kodun başladığı düğmeye döner. Kod bozulursa (başka bir tuş ya da 2 sn ara) menü normal çalışır.
- **Çıkış kolla onay ister (7 Kasım 2026, Boğaç):** kolla A hiçbir zaman doğrudan **Çıkış**'ı çalıştırmaz; Çıkış kolla seçilince "Çıkılsın mı?" onayı sorulur.
- **Menüde çubuk eşiği:** pencerelerde ve menülerde sol çubuğun **yarım itişi** (~%40) seçimi taşır; çubuk eşiğin biraz altına inmeden ikinci adım atılmaz (histerezis), böylece titreme seçimi zıplatmaz.
- **Standart olmayan kol düzeni:** tarayıcının standart düzeninde görünmeyen kollarda yön tuşları (D-pad) eksenden okunur.
- **Kol menüsü (7 Kasım 2026, Boğaç: "kola özel menü koy, tuşları ayarla, ne gerekiyorsa"):** oyun içinde **Start** (PS: Options) oyunu duraklatır ve Kol menüsünü açar; kolla bütün pencerelere ve eylemlere giden **asıl yol** budur.
  - Dikey liste: **Devam** (duraklatmayı kapatır; Start'ın eski işi ilk satırdadır), Çanta, El yapımı, Karakter, Yetenekler, Kitap/Almanak, Görevler, Harita, Döşe (yalnızca evdeyken), Binek, Köpekleri çağır, Meşaleye reçine sür (elde meşale varken), Kaydet, Ayarlar, Hile paneli (hile modu açıkken), Ana menüye dön. **Ana menüye dön** onay sorar. **Hile paneli:** arama kutusu ekran klavyesiyle yazılır, Options (Start) sonuçlara geçer, B çıkar.
  - Yukarı/aşağı (yön tuşları ya da sol çubuk) seçer, **A** açar, **B** kapatır/geri döner; Start yeniden basılınca menü kapanır, oyun sürer.
  - Açılan pencerelerde her zamanki odak gezinimi geçerlidir; **LB/RB** sekme, **LT/RT** pencere değiştirir (oyun içinde LT savuşturma olarak kalır).
  - Oyun içi hızlı tuşlar (vur, atıl, savuştur, topla, meşale, LB/RB, yön tuşu kısayolları) aynen kalır; Select basılı tutunca açılan arayüz odak kipi de kalır, ama asıl yol Kol menüsüdür.
- **Kolla her şey yapılır (7 Kasım 2026, Boğaç):** klavye ve fareyle yapılan her iş kolla da yapılır:
  - **Eşya/mobilya yerleştirme** (yapılar, Döşe kipinde ev eşyası): yerleştirilecek eşyanın hayaleti oyuncuyu izler; **sağ çubuk ya da yön tuşları** hayaleti kare kare kaydırır, **A** koyar, **Y** döndürür, **B** vazgeçer (B döndürmez). **Konmuş eşyayı geri almak:** üstündeyken **A basılı tut**.
  - **Döşe kipi:** eşya şeridinde yön tuşları/çubuk gezer, **A** eşyayı seçer, **X** odadaki imlece geçer; imleci yön tuşları/çubuk taşır, **A** koyar (konmuş eşyanın üstündeyse Taşı / Geri al / Döndür menüsünü açar), **Y** döndürür, **B** seçili eşyayı bırakır; şeritteyken **B** = Bitti.
  - **Meşale:** LB/RB döngüsünde meşale yuvası da bir duraktır; seçiliyken **X'e kısa basmak vurur** (yanan meşale vurduğunu tutuşturur), **X'i basılı tutmak (~0,4 sn)** meşaleyi yakar/söndürür; A etkileşim olarak kalır, Y hızlı yemektir; meşaleyi elden yere koymak ve meşaleye reçine sürmek de kolla yapılır (hangi tuşa bağlanacağı Yazılımcının eşleme tablosundadır).
  - **Öğretici kartı:** "Anladım" ve "Eğitimi geç" düğmeleri kol seçimine girer; kart açıkken **B** kartı 6 sn bırakır (sonra yeniden görünür).
  - **Pencereler:** Karakter, Yetenekler, Almanak, binek, büyük harita (işaret koyma, kaydırma, yakınlaştırma), Döşe düğmeleri ve eşya şeridi, açılır listeler kolla kullanılır; pencere içinde LB/RB sekme değiştirir.
  - **Pencerelerde odak:** pencere, öğreticinin yanıp sönen düğmesinde ya da eşyasında açılır (yanıp sönme pencere açıldıktan 0,7 sn içinde başlasa da). Basılan yöndeki koni içinde öğe yoksa seçim o yöndeki en yakın öğeye gider. Kazanda ve örste **X = Hepsini koy**. Kategori (sekme) değişince seçim o kategorinin ilk tarifine geçer.
  - **Büyük harita:** çubuk kaydırır, **LT/RT** yakınlaştırır/uzaklaştırır, **A** ortadaki artının yerine işaret koyar ya da kaldırır, artı bir kişinin üstündeyse onu hedef yapar; **Y** haritayı kendi yerine döndürür, **B** kapatır.
  - **A ile toplama/konuşma (kolda):** erişimde birden çok şey varsa A çubuğun/bakışın yönündekini seçer; ama **yerdeki eşya yine önce** alınır (Boğaç; Kontroller › F), kişiler ondan sonra gelir. Klavyedeki F'nin davranışı değişmez.
  - **Ekrandaki öbür düğmeler** (sol menü, köşe düğmeleri) Select basılı tutulunca açılan **arayüz odak kipi**yle seçilir.

## Arayüz ve pencereler

> Bu maddeler v3.43'e kadar "Tarifler: kazan, el yapımı, örs, ustalar" başlığının içindeydi; ekran düzeniyle ilgili oldukları için buraya taşındı. "Konuşma penceresi" ayrı başlık olarak aşağıdadır.

- **Tarif ve sipariş listelerinde satır düzeni (7 Kasım 2026, Boğaç):** bütün tarif ve sipariş listelerinde her satırda **solda** küçük resim, adı ve "sende N", **sağda** düğmeler durur (düğmeler her satırda aynı sırada ve aynı genişlikte, alt alta tek sütun). Bu düzen şu listelerin hepsinde geçerlidir: el yapımı, kazanın tarif listesi, örs paneli, Usta Sinan'ın yapı/ev eşyası siparişi ve ev listesi, ACT 2 ustalarının listeleri (Efsun, Tufan, Işın, Tomris, Gökay) ve ekranın üstündeki takip şeridi.
- **Bilgisayarda görev kartı büyük, konuşma yazısı küçük:** genişliği 900 pikselden fazla ve fareyle oynanan ekranda sağ üstteki görev kartı daha geniştir (en çok 540 px; yazı 17 px, başlık 13,5 px, düğmeler 15 px); kişilerin konuşma kutusunda metin 16,5 px, ad 15,5 px, seçenek düğmeleri 15 px'tir (önce 19 / 17 / 17 px). Bir menü açıkken görev kartı eskisi gibi daralır. Telefon düzeni değişmedi.
- **Bilgisayarda kart yazıları daha büyük:** fareyle oynanan ve 720 pikselden geniş ekranda (telefon görünümü değilken) öğretici/ana görev kartı 18 px (bir menü açıkken 16 px, 3 satır), yan görev kartı 16 px (alt satırı 15 px, genişliği 480 px) ve takip çipleri 17 px yazıyla gösterilir. Alttaki **1-2-3-4-5 alet kemeri** iki kat büyür: kutular 92 px, simgeler 64 px, tuş numarası 18 px. Telefon görünümü değişmez.
- **Bilgisayarda sol üst iki kat büyük:** saat, Can / Enerji / Tokluk çubukları ve etki çipleri (Canlılık, Gece gözü, Bulantı…) iki kat büyüktür (çubuklar 46 px, yazılar sütun genişliğine göre en çok 24 px). Sol menünün kare düğmeleri sütunu **Vio kutusuna kadar** doldurur: solda yalnızca **Envanter, El yapımı, Yetenek ağacı, Yemek** ve (gelince) **Robot köpekler** durur. ("çok büyük olmuş, oyunu kapatıyor") kareler **yan yana üçlü, iki sıra** dizilir ve küçüktür: kenarı ekran genişliğinin %4,2'si, en az 48, en çok 84 px (1920 px ekranda 81 px); sıra genişliği üç kare kadardır. Robot köpeklerin yeri baştan ayrılır, gelince kareler değişmez. **Başarımlar** sağ üstte Çıkış ve Ayarlar'ın altına, onlarla aynı boyda taşındı; **Tarif kitabı** sağ altta Başarımlar'ın eski yerine, Almanak'la aynı boyda geçti (telefonda ☰ menüsünde kalır); **Görevler ve etkiler en az Tokluk boyunda:** bilgisayarda Görevler/Gizle düğmesi sütunun bütün genişliğini kaplar ve en az Tokluk çubuğu kadar yüksektir (46 px); etki çipleri (Canlılık, Gece gözü, Bulantı…) da her biri sütun genişliğinde ve en az 46 px yüksekliktedir, alt alta dizilir. **Kemer küçüldü:** bilgisayarda alttaki 1–5 kemer yuvaları ve meşale yuvası 92 px'ten **64 px**'e küçüldü (simgeler 44 px). **İnce Menü çubuğu:** **Menü ▾** artık Görevler'in yanında değil, kare düğmelerin **altında** sütun genişliğinde ince bir çubuktur (22 px); basınca kare düğmeler gizlenir/açılır (katlıyken çubuk Görevler'in altında kalır). **Menü katlanır:** Menü düğmesine basınca kare düğmeler gizlenir (kısayol tuşları çalışmaya devam eder), bir daha basınca açılır. Seçim bu tarayıcıda hatırlanır (oyuncunun kendi seçimi; otomatik ayar değil). Katlıyken kare boyu değişmez. Telefon görünümünde bu düğme yoktur (orada menü zaten açılır kapanır).
- **Eylem yazısı kemerin üstünde (9 Kasım 2026, Boğaç: "su al yazısı kemerin arkasında yarım gözüküyor"):** "F Su al…", "E Konuş" gibi eylem yazısı her zaman alet kemerinin (1–5) 8 px üstünde durur, kemerin arkasında kalmaz.
- **Envanter ve Özellikler penceresi (9 Kasım 2026, Boğaç: "bu envanter ekranını değiştirelim, çok çirkin duruyor"):** bilgisayarda:
  - **Yerleşim:** pencerenin solunda eşya listesi, sağında listeden bağımsız duran giyim figürü ile karakter; liste kaydırılınca sağ taraf yerinde kalır.
  - **Giyim figürü:** renksiz bir insan figürü çizilidir; giyim yuvaları figürün üstündedir: **Baş** kafada, **Gövde** göğüste, **Eller** sol elde, **Silah** sağ elde, **Ayaklar** ayakta. Figürün yanında **karakterin kendisi** durur ve giydiği her şeyle (miğfer, gövde zırhının rengi, eldiven, çizme, elindeki silah) çizilir. Altında Savunma ve Zırh yazar. Envanterde bir giysi ya da silah seçilince uyan yuva parlar; yuvaya tıklayınca giyilir, dolu yuvaya tıklayınca çıkar. Aynı figür **Özellikler** (karakter) penceresinde de vardır: Karakter sekmesinde seviye ve özellik puanları solda, figür ve karakter sağdadır (pencere envanter kadar geniştir); yuvaya tıklayınca o yuvaya uyan eşyaların listesi figürün altında açılır.
  - **Eldeki eşya figürde (9 Kasım 2026, Boğaç: "elimde balta var, silah olarak da bunu görmem lazım"):** figürün sağ elindeki **Silah** yuvası o an elinde tuttuğun eşyayı gösterir (balta, kazma, olta…; meşale sol eldedir, burada görünmez); elin boşsa giydiğin silahı. Karakter de elindekiyle çizilir. Dolu Silah yuvasına tıklayınca elindeki bırakılır (elin boşalır, eşya yuvasında kalır).
  - **Sürükleyerek giy ve eline al:** listedeki bir giysiyi figürdeki uyan yuvaya sürükleyince giyilir; bir taşınabilir eşyayı (alet) Silah yuvasına sürükleyince ya da seçip Silah yuvasına tıklayınca **eline alınır**: alet yuvalarında değilse önce boş bir alet yuvasına konur. Bütün alet yuvaları doluysa sorulur: "Yuvaların dolu: hangisinin yerine?" ve yuvalar resimleriyle sıralanır; seçilen yuvadaki eşya envantere döner, yeni eşya oraya girer ve eline alınır. "Eline al" düğmesi de aynı soruyu sorar.
  - **Seçili eşya:** figürün ve karakterin altında seçili eşyanın adı, bilgisi ve düğmeleri (Ye, Giy, Yuvaya koy, Eline al, Yere bırak…) durur.
  - **Liste:** eşyalar kare kutucuklar yerine **alt alta liste** halindedir (her satırda bir eşya): her satırda solda küçük resmi, adı ve sağda adedi (aletlerde keskinliği). Sekmeler (Hepsi, Yiyecekler, Malzemeler…) listenin üstündedir.
  - **Alet yuvaları pencerede ikinci kez çizilmez:** ekranın altındaki asıl alet kemeri ve meşale yuvası envanter açıkken de görünür ve kullanılır: bir taşınabilir eşyayı listeden alttaki yuvaya sürükle ya da eşyayı seçip yuvaya tıkla; dolu yuvaya tıklayınca o eşya seçilir ("Yuvadan çıkar" ile çıkarılır). Telefonda pencere bütün ekranı kapladığı için alet yuvaları pencerede kalır.
- **Toplama bildirimi birikir:** yerden bir şey toplayınca köşede çıkan "+1 Odun" bildirimi ekrandayken aynı şeyden bir daha toplarsan yeni "+1" çıkmaz, aynı bildirim **+2, +3 Odun** diye güncellenir ve süresi baştan başlar. Bildirim kaybolduktan sonra toplanan yeniden +1'den sayılır.
- **Telefonda bütün pencereler:** telefon yatay tutulunca kişilerin ve menülerin bütün pencereleri (Nazlı'nın pazarı, demirciler, Usta Sinan, El yapımı, envanter, yetenek ağacı, tarif kitabı, yemek, köpekler…) **bütün ekranı** kaplar; üstte boşluk kalmaz (öğretici kartı varsa yalnızca ~40 piksel). Başlık satırı ve araç satırı incedir (başlık solda, Kapat sağda), içerik kendi içinde kayar.
- **Telefona göre sıkı düzen:** telefon yatay tutulunca bütün pencerelerde sekmeler (Hepsi/Yiyecekler…, Sat/Satın al, Savaş/Ekonomi…, Tarifler/Keşif defteri…) tek ve ince bir satırdır, sığmazsa yana kayar; düğmeler ve satırlar alçak, yazılar küçüktür; uzun açıklama yazıları gizlenir. Ekran ekran:
  - **Telefonda sürükleme:** telefonda ve tablette sürükleme parmak olaylarıyla çalışır, tarayıcının kaydırması ya da uzun basış menüsü sürüklemeyi kesmez. **Envanter:** taşınabilir bir eşyaya (ya da dolu bir alet yuvasına) parmağını koyup **kaydırdığın an** eşya parmağının ucunda gelir (beklemek gerekmez); alttaki yuvalardan birinin (çantadaki ya da ekranın altındaki) üstünde bırakınca oraya girer, dolu bir yuvayı yuvaların dışına bırakınca yuva boşalır. **Kazan ve örs:** alttaki eşya kutularından birini kaydırınca eşya parmakla gelir; **kazanın (örsün) üstünde** bırakınca bir tane konur (Zor modda denemeye atılır). Sürüklerken parmak pencerenin üst ya da alt kenarına gelirse liste kendiliğinden kayar, kazan görünmüyorsa ona ulaşılır. Dokun (1 tane koy / seç) ve basılı tut (gerekenin hepsini koy) eskisi gibidir. Eşyaların arasındaki boşluktan ya da eşya olmayan yerden kaydırınca liste kayar.
  - **Yürürken alet seçmek:** telefonda bir parmağın yön tuşunda/kolunda yürürken öbür parmakla alt kutulardaki bir alete (meşale, balta…) ya da boş ele dokununca **hemen seçilir**; durmak gerekmez. Dokunuş parmağı kaldırınca sayılır (yerinden 12 pikselden az oynamış ve 0,5 sn'den kısa olmalı; daha uzunu sürüklemedir). Eskiden telefon, ekranda başka bir parmak varken dokunuşu tıklama saymıyordu.
  - **Envanter:** giysi yuvaları karakterin yanında **tek ince şerit** (her yuva küçük simge + ad); "bir giysi seç…" ve "Taşınabilir eşyaları alttaki yuvalara koy…" yazıları gizli (bir eşya seçilince eylem düğmeleri yine çıkar). Böylece eşyalar açılır açılmaz görünür.
  - **Eşyanın tam adı (v3.29, Boğaç: "seçtiğimin tam halini görebilmeliyim, basılı tutarsam seçmeden de"):** kutucuklarda uzun adlar kısalır ("Çam…"). Telefonda ve tablette bir kutucuğa **dokununca** eşyanın tam adı kutucuğun hemen üstünde küçük bir balonda ~2,5 sn görünür (envanter, el yapımı, kazan, örs, yemek, pazar: adı kısalan her kutucuk). Envanterde bir kutucuğa **basılı tutunca** (~0,4 sn) tam ad balonda çıkar ve parmak kalkana kadar durur; bu basış eşyayı **seçmez**. Taşınabilir eşyada basılı tutup kaydırınca sürükleme eskisi gibi çalışır. Bilgisayarda fare üstüne gelince tam ad zaten görünür.
  - **El yapımında malzeme kutusu hiç kesilmez (8 Kasım 2026, Boğaç: "meşalenin bile bilgileri yarım yazıyor"):** bilgisayarda malzeme kartı Yap düğmesinin üstünde, yer yoksa altında açılır, pencerenin dışına taşmaz; telefonda dokununca açılan kutu satırın altında, listenin son iki satırında satırın **üstünde** açılır. **Pencere hep aynı boyda açılır (8 Kasım 2026, Boğaç: "standart bir boyutta aç pencereyi, hep tarif sayısına göre büyütme"):** bilgisayarda el yapımı penceresi tarif sayısı ne olursa olsun kemerin üstüne kadar uzanan sabit boydadır; liste içinde kayar.
  - **Pazar:** her eşya **tek satır**: ad ×adet, yanında küçük ipucu ("Kazanda şimdi 5 tarifte işe yarar"), fiyat, **Sat** ve **Hepsi** düğmeleri; ekrana çok daha fazla eşya sığar.
  - **Pazar sütunları:** fiyat, ▼ adet ▲, **Sat** ve **Hepsi** her satırda aynı genişlikte durur; fiyat 1, 2 ya da 3 haneli de olsa düğmeler alt alta aynı yerdedir (fiyat sağa yaslı). Nazlı'nın **Keskin taşı sat** dersinde (öğretici 9–10. adım) Keskin taş satış listesinin **en üstünde** durur. **Bilgisayarda menü pencereleri (pazar kuralının yerine):** bilgisayarda (fareyle, 900 pikselden geniş ekran) **bütün menü pencereleri** (pazar, kazan, örs, envanter, el yapımı, tarif kitabı, yetenekler…) içindeki her şeyle birlikte **%20 büyük** gösterilir ve aşağıda **alet kemerinin hemen üstüne** kadar uzar: 2.84'teki pencerenin altıyla kemer arasındaki boşluğun yalnızca üçte biri kalır (oyun kemerin gerçek yerini ölçer). Pencere ekranın üstünden 70 piksel aşağıda başlar (öğretici kartı açıkken 132); içerik pencerenin içinde kaydırılır. Pencere ekrana sığacak kadar daralır; pazar penceresi en çok **600 piksel** geniştir (aşağıda "Pazar penceresi derli toplu"). Telefon görünümü değişmez.
  - **Pazar penceresi derli toplu (9 Kasım 2026, Boğaç: "arama çubuğu neredeyse görünmüyor, Vio ile Kapat uyumsuz, ekran çok sağa uzuyor, çok az satır sığıyor, Sat/Satın al çok büyük; daha ince uzun, her şey küçülüp sığmalı, butonların renkleri ve boyları farklı olmamalı, özet ve anlaşılır olmalı"):** bilgisayarda pazar penceresi **ince ve uzundur**: en çok 600 piksel geniş, boyu alet kemerinin üstüne kadar (her açılışta aynı). **Başlık satırı:** başlık solda; **Vio sayacı ve Kapat aynı boyda** yan yana; Kapat'ın yanında "(Esc)" yazmaz, üstüne gelince yazar (bütün menü pencerelerinde böyle). **Araç satırı:** arama çubuğu bütün genişlikte; altında üç toplu satış düğmesi eşit üç sütun, kısa adlarla: **Hepsini sat** (aletler, zırhlar ve eşyalar hariç), **Fazlasını sat** (kazandaki açık tariflere yeteni bırakır), **Gerekmeyeni sat** (bütün tariflere yeteni bırakır); uzun açıklama üstüne gelince yazar. **Sat / Satın al** ince, iki eşit parçalı bir anahtardır (seçili olan açık renkli). Açıklama yazısı ("Fiyatlar sabit…") gizlidir. **Satırlar tek satırdır:** solda ad ×adet ve yanında küçük ipucu ("3 tarif", "ileride 4 tarif"; tamamı üstüne gelince), sağda sabit genişlikte fiyat, ▼ adet ▲, **Sat**, **Hepsi** (satışta düğmelerde toplam tutar yazmaz, birim fiyat solda yazıyor; Boğaç, 9 Kasım 2026) (Satın al'da 1 al, 10 al · n). **Bütün düğmeler aynı boyda ve aynı renkte** (koyu zemin, ince kenar; üstüne gelince mavi kenar, basılamayan soluk).
  - **El yapımı:** üstteki uzun açıklama gizli; meşale durumu ince bir satır; tarif satırları alçak, yaptığın eşya hemen görünür.
  - **Savuş düğmesi her zaman yuvarlak ("neden oval"):** Savuş, Atıl düğmesiyle aynı boyda tam bir dairedir; düğmeler Ayarlar'dan yerinden oynatıldıktan sonra da (eskiden o durumda boyu yazısına göre kalıyor, oval görünüyordu).
  - **Yetenek ağacı:** ağaç pencerenin geri kalanını doldurur, düğümler küçüktür. ("telefonda üst üste biniyor") telefonda ağaç 520×440 piksellik sabit bir tahtadır, çerçevesinin içinde yukarı aşağı kaydırılır (eskiden ~250×220 pikseldi, yakın düğümler birbirinin üstüne biniyordu). Ağaç açılınca en alttan (Koşu tarafından) başlar; yetenek alınca kaydırdığın yer korunur.
  - **Tarif kitabı:** üstteki açıklama gizli.
  - **"Yeni malzeme bulundu"** yazısı bir pencere açıkken ekranın ortasına değil **altına, küçük** çıkar; menünün üstünü kapatmaz.
  - **Ayarlar:** pencere ekranın genişliğine yayılır, müzik düğmelerinin yazısı kesilmez.
  - **Ana menü:** "PURPLE LIGHT" yazısı küçülüp sağa kayar; soldaki düğmeler (Yeni oyun, Yükle…) yazının üstüne binmez.
- **Telefonda kazan ve örs ekranı:** telefon yatay tutulunca kazan (ve örs) penceresi **bütün ekranı** kaplar; ekranın üstünde boşluk bırakılmaz (yalnızca öğretici kartı varsa onun yüksekliği kadar, ~40 piksel). Başlık satırı ince (başlık solda, Kapat sağda), arama satırı tek ve ince satır. Altta iki sütun: solda **tarif listesi** (ekranın ~%38'i), sağda seçilen tarif, malzemeler, kazan, düğmeler ve envanter; ikisi de **kendi içinde kayar**. Kazan alanı alçalır, yazılar ve kareler küçülür. Bilgisayar ve tablet görünümü değişmez.

### Erişilebilirlik (v3.68, 8 Kasım 2026, Boğaç)

Ayarlar penceresinde Titreşim'in hemen üstünde iki seçenek vardır. İkisi de başta **kapalıdır**; seçim bu cihazda hatırlanır (oyuncunun kendi seçimi, bütün kayıtlar için ortak).

- **Renk körü modu:** açıkken oyunun "var / yok / yapılabilir" anlamı taşıyan renkleri, renk körlüğünün her türünde (kırmızı-yeşil ve mavi-sarı) ayırt edilebilen bir palete geçer ve her duruma renkten bağımsız bir **işaret** eklenir. Palet (Okabe–Ito paletinden, koyu zemine göre açılmış):

| Anlam | Normal renk | Renk körü modunda | İşaret |
|---|---|---|---|
| Yeterli / tamam / öğrenildi / yapılabilir tarif | yeşil #8FD46B | **mavi** #56B4E9 | ✓ |
| Eksik / olmaz / yanlış | kırmızı #FF8A6A, #FF6A5A | **turuncu** #E8743A | ✗ |
| Eksik ama elindekilerden yapılır | sarı #F2D070 | **açık sarı** #F0E442 | + |

  - **Nerede:** el yapımı listesi, ateşin pişirme menüsü ve Usta Sinan'ın ev listesindeki malzeme satırları (her malzemenin önünde ✓, ✗ ya da +); takip şeridi (tamam olan kutu ve "hazır" mavi; kutudaki ✓ zaten vardır); kazandaki tarif listesi ("öğrenildi" ve yapılabilir tarifler), Zor moddaki "Dene" cevapları; görev ve ders kartlarındaki "tamam" işaretleri; yan görev ve keşif defteri kartlarının "bitti" çerçeveleri.
  - **İnşa kipi:** yapının, döşemenin, zeminin ya da duvarın konacağı yeri gösteren gölge, konabiliyorsa **mavi**, konamıyorsa **turuncu** olur (normalde yeşil / kırmızı).
  - Almanaktaki huy rengi (zararsız / nötr / saldırgan) yazıyla da yazdığı için değişmez; can, tokluk ve enerji çubuklarının üstünde adları yazar, onlar da değişmez. Eşya resimleri, biyom renkleri ve mor ışık değişmez (oyunun adı Mor Işık; mor her modda mor kalır).
- **Kalp atışını ekranda göster:** açıkken, gece beliren sevdiğin kişi göründüğü sürece (bkz. Mor ışıkta o) her kalp atışında ekranın kenarları da **iki kez** ("güm-güm", sesle aynı anda) yumuşak bir mor ışıkla nabız gibi atar. Sesi kapalı oynayan ya da duyamayan oyuncu da kalp atışını görür. O kaybolunca, oyun duraklatılınca ya da bir pencere açılınca durur.

### Pencerelerin boyutu

- **Bilgisayarda pencereler kenarından büyütülür (9 Kasım 2026, Boğaç):** çanta, el yapımı, kazan, pazar, kitap gibi açılır pencereler farenin olduğu bilgisayarda **sol, sağ ve alt kenarından** (ve alt köşelerinden) tutulup çekilerek büyütülür ya da küçültülür; kenara gelince imleç çift ok olur. Pencere ekranın ortasında kalır, iki yana eşit büyür. **Yazılar, resimler, düğmeler büyümez:** yalnızca pencere genişler; aşağı büyütülünce listede kaydırmadan daha çok satır görünür. En küçük ~360 × 260, en büyük ekran kadar. Her pencere türünün boyutu oyun açık kaldığı sürece hatırlanır (kapatıp açınca aynı boyutta gelir); sayfa yenilenince varsayılana döner. Dokunmatik ekranda yoktur.
- **Yetenek ağacı pencereyi doldurur (9 Kasım 2026, Boğaç: "yazı ekrana sığmıyor"):** bilgisayarda yetenek ağacının yüksekliği sabit değil, pencerenin gövdesi kadardır; pencere büyütülünce ağaç da büyür. Bir yeteneğin üstüne gelince çıkan açıklama kartı her zaman ağacın görünen kısmının içinde kalır.
- **Yetenek alınca pencere yerinde kalır (10 Kasım 2026, Boğaç: "skill verdiğimde aşağıya doğru kayıyor, aynı yerde kalmalı ekran"):** bir yetenek alınınca ağaç yeniden çizilir ama pencere ve ağaç **olduğu yerde** kalır; basılan düğüm ve açılan "Yetenek açıldı" kutusunun Tamam düğmesi pencereyi kaydırmaz.
- **El yapımı penceresi biraz daha geniştir (9 Kasım 2026, Boğaç: "yap butonları pencerenin tam yanında kalmış"):** genişliği 560'tan **620**'ye çıktı; satırın en sağındaki Yap düğmesiyle pencere kenarı arasında boşluk kalır.

- **Evet/Hayır kutusu oyunun görünüşünde (9 Kasım 2026, Boğaç: "bu yazı hiç oyuna olmamış"):** köprü onarma, görevi bırakma gibi onay kutuları öbür pencereler gibi koyu yeşil zeminli, altın çerçeveli; başlık altın renkte ve kalın, ana düğme altın, öbürü koyu.

### Konuşma penceresi

- **Adlara gelen ekler Türkçe ses uyumuna uyar:** bir kişi ya da eşya adına ek eklenirken (yönelme, belirtme, iyelik…) ekin ünlüsü adın son ünlüsüne, ünsüzü son sese göre seçilir ve özel adlarda kesme işareti konur: "Şifa'ya", "Kemal'e", "Börü'nün", "Dursun'a", "Kayhan'ı".

- **Konuşma penceresi:** uzun konuşmalar (ör. görev anlatımları) ekranın üstünden taşmaz: pencere en çok **görünen ekran yüksekliği** kadar olur (iPhone'da adres çubuğu hesaba katılır), yazı kendi içinde kayar, **cevap düğmeleri hep altta görünür**; yazı harf harf gelirken pencere son satırı izler, bitince yukarı kaydırıp baştan okunabilir. **Yazı harf harf akarken ilk basış** (tık, dokunuş, tuş ya da seçenek numarası) **yazıyı tamamlar, ikinci basış seçer.** Yazılar ve düğmeler telefona göre biraz küçüktür.
- **Pencere dışına basmak = "Anladım" (kalıcı kural):** konuşma penceresi seçim yapılmadan kapatılırsa (pencerenin dışına tıklama/dokunma, Esc, X) oyuncu pencereyi okumuş sayılır ve sade cevap seçilmiş olur: yalnızca kapatan bir seçenek varsa ("Sonra", "Hoşça kal") o, tek seçenek varsa o, yoksa ana (vurgulu) seçenek. Böylece "Hazırım" / "Anladım" bekleyen bir ders ya da görev hiçbir zaman takılı kalmaz. **Eklenen her yeni pencere bu kurala uyar.**
- **Sahneler de aynı kurala uyar:** anı sahneleri ve ada halkı sahneleri (Elmas Nine dahil) Esc ya da dışına tıklama/dokunmayla kapanır ve **sonuna kadar okunmuş** sayılır: XP verilir, anı defterine yazılır (Boğaç'ın "pencere dışına basmak = Anladım" kuralının uygulaması).

## Hayatta kalma

### Can, tokluk, enerji

**Seviye puanları (v3.40, Boğaç: "otomatik level ile bunların artmasını oyundan kaldırıcaz… kullanıcı kendi kararı ile arttıracak"):** özellikler artık seviyeyle kendiliğinden artmaz. Her seviye atlayışta **seviye puanı** kazanılır ve oyuncu Karakter penceresinde (C) dilediği özelliğin yanındaki **+** düğmesine basıp puanı oraya verir. Verilen puan geri alınmaz.

- **Puan (v3.41, Boğaç: "hepsine %2-3 vermesi ile 1'ine vermesi dengeleri bozmamalı, çok geç gelişim hissi de vermemeli"):** 2–10. seviyeye çıkarken her seviye **2**, 11–30. seviyeye çıkarken her seviye **3**, 31. seviyeden sonra her seviye **4** puan. Toplam: 10. seviyede 18, 16. seviyede 36, 30. seviyede 78, 60. seviyede **198** puan.
- **En üst seviye 60** (eskiden 50). 11 özelliğin her biri en çok **18 puan** alır; 11 × 18 = 198, yani **60. seviyede bütün özellikler tam dolar**.
- **Bir özelliğin tavanı seviyeyle açılır:** bir özellik en çok **1 + seviye ÷ 3** (aşağı yuvarlanır) puan alabilir: 2. seviyede 1, 10. seviyede 4, 16. seviyede 6, 30. seviyede 11, 51. seviyeden sonra 18. Böylece bütün puanları tek bir özelliğe yığmak dengeyi bozmaz (10. seviyede Güç'e 4 puan = 1,32×; eski sistemde 10. seviyede bütün özellikler kendiliğinden 1,27× idi). Tavan dolunca **+** sönük kalır; tablonun altında "Bu seviyede bir özellik en çok N puan alabilir" yazar.
- **Tavan dolunca:** Karakter penceresinde bir özellik tavanına ulaşınca **+** düğmesinin yerinde "Sv N'de açılır" yazar (N, o özelliğin bir sonraki puanının açıldığı seviye).
- **Gelişim hissi:** bütün puanlar eşit dağıtılırsa 16. seviyeye kadar eski sistemle aynı hızda (16. seviyede %18), sonra biraz daha yavaş ilerler; ama her puan tek başına eskiden bir seviyenin verdiğinden çok daha büyük bir artış verir ve her seviyede 2–4 puan gelir.
- **Bir puan, eski bir seviyeden fazlasını verir (v3.40, Boğaç):** eskiden her seviye kendiliğinden küçük bir artış veriyordu (can +5, enerji +4, toplama +0,03, hareket +0,02, satış +0,01, şans +%0,5, hasar +%3, zırh +1, mana +3…); şimdi bir puan o özelliğe bundan daha büyük bir artış verir (tabloda "Puan başına").
- **Açıklama:** her **+** düğmesinin üstüne gelince (telefonda özelliğin adının altında her zaman) o özelliğin ne işe yaradığı kısaca yazar (ör. Toplama hızı: "Dal, taş, bitki, odun ve maden toplarken daha hızlı olursun.").
- **Gruplu tablo (9 Kasım 2026, Boğaç: "yetenek ağacındaki gibi benzer özellikler gruplu, alt alta"):** Karakter penceresindeki özellik tablosu yetenek ağacının üç dalıyla gruplanır, her grubun mavi bir başlığı vardır: **Ekonomi** (Toplama hızı, Satış değeri, Şans) · **Savaş** (Güç, Kritik vuruş ihtimali, Hareket hızı, En yüksek enerji, Enerji yenilenmesi, En yüksek mana) · **Dayanıklılık** (En yüksek can, Can yenilenmesi, Zırh).
- **Kritik vuruş ihtimali tabloda:** Savaş grubunda o an elindeki silahla kritik vuruş ihtimalin yazar (ör. "%2,4 · Demir kılıç"; balta, kazma ve yumrukta "yok · kritik vuramaz"). Bu satıra puan verilmez (ihtimal seviyeyle, Keskin göz yeteneğiyle, silahın türü ve kademesiyle artar; bkz. Kritik vuruş), bu yüzden + düğmesi yoktur.
- **Verilmemiş puan (9 Kasım 2026, Boğaç: "verilmeyen skill puanlarını bariz şekilde hatırlat"):** verilmemiş puan varken (1) seviye çubuğunun yanında parlayan bir "**N puan ver**" düğmesi durur, basınca Karakter penceresi açılır; (2) Karakter düğmesi yanıp söner ve köşesinde sarı sayı durur; (3) Karakter penceresinde listenin üstünde sarı çerçeveli "N verilmemiş seviye puanın var" şeridi çıkar ve verilebilen **+** düğmeleri yanıp söner. Tablonun altında da "Verilmemiş seviye puanı: N" yazar.
- **İlk seviye dersi (9 Kasım 2026, Boğaç: "2. seviye olunduğu an bariz şekilde öğret"):** ilk kez seviye atlayınca (2. seviye) "Seviye atladın" yazısından hemen sonra ekranın ortasında bir öğretici kartı açılır: seviye puanının ne olduğunu ve Karakter penceresinde bir özelliğin yanındaki **+** ile verildiğini anlatır; "Puanımı vereyim" düğmesi Karakter penceresini açar. Kartın dışına basmak "Anladım" sayılır. İlk puan verilince ders biter (bir kez); hatırlatmalar puan kaldıkça sürer.
- **Eski kayıtlar:** eski kayıttaki seviyenin bütün puanları verilmemiş olarak gelir (ör. 20. seviyede 48 puan); özellikler 0 puandan başlar.
- **Arenada** seçilen seviyenin puanları bütün özelliklere eşit dağılmış sayılır (60. seviyede hepsi tam).

| Özellik | 0 puan | Puan başına | 18 puan (tam) | Not |
|---|---|---|---|---|
| Toplama hızı | 1,00 | +0,08 | 2,44 | toplama süresi bu sayıya bölünür |
| Hareket hızı | 1,00 | +0,025 | 1,45 | |
| Satış değeri | 1,00 | +0,05 | 1,90 | |
| Şans (tüm ihtimallere) | +%0 | +%0,8 | +%14,4 | |
| En yüksek can | 100 | +24 | 532 | + Dayanıklılık ağacındaki can yetenekleri |
| Can yenilenmesi (/sn) | 0,10 | +0,05 | 1,00 | tokluk > 70 iken ×1,5; tokluk 0 iken yenilenmez; Hızlı iyileşme ×2/×3/×4 |
| En yüksek enerji | 100 | +19 | 442 | + Derin nefes yetenekleri |
| Enerji yenilenmesi (/sn) | 14 | +2,5 | 59 | harcamadan 0,6 sn sonra başlar; yürürken ×0,6 |
| Güç (vuruş hasarı çarpanı) | 1,00 | +0,08 | 2,44 | bütün silahlar, oklar, asalar; Güçlü kol ×1,10/×1,25/×1,40 |
| Zırh (temel) | 5 | +2,5 (yuvarlanır) | 50 | çıplak karakterin de zırhı vardır (v3.40, Boğaç); + Zırh I–IV yetenekleri |
| En yüksek mana | 100 | +8 | 244 | |

- Kritik vuruş ihtimalinin seviye payı (aşağıda) seviyeye bağlı kalır.
- **Tokluk** 100'den 0'a **12 dakikada** iner (Tok karın ile 16 dakikada; kışın %25 daha hızlı, bkz. Mevsimler) (ilk 2 gün yarı hızda, 3–4. gün ¾ hızda). 35'in altında uyarı, 25'in altında mide guruldar. **0 olunca saniyede 1,6 can** gider.
- **Yemek** yiyince tokluk değerinin %80'i kadar (Doyurucu sofra ile %120'si) can 15 saniyeye yayılarak dolar. Tıka basa tokken de yemek yenir: tokluk 100'ü geçmez ama yemeğin canı ve yan etkileri (güçlendirmeler, çiğ etin mide bulantısı) yine işler; tanrı modunda da yenir.
- **Enerji**: koşu saniyede 18, atılma 14, savuşturma 5, her vuruş 4 (yumruk) – 10 (balta/kazma) yer. Enerji biterse "Yoruldun": %30'a dolana kadar koşamaz, vuramazsın. Enerji %35'in altındaysa vuruşlar yavaşlar.
- **Kamp ateşinin** 64 piksel yakınında saniyede +1,4 can (Kamp ateşi ustası ile +2,8).
- Diken: böğürtlen 3, çakmaktaşı 2 can yakar (ilk 3 toplayışta kesin, sonra %20; eldiven giyiliyse hiç). Kirpiye çıplak elle vurmak 3 can.

### Bayılma

- **Oyunda ölüm yok:** karakter hiçbir zaman ölmez, oyun hiç bitmez. Canavar, açlık, zehir, gece mor ışık: hepsi **bayıltır** ve her bayılmadan sonra uyanırsın. Oyundaki ve belgedeki bütün yazılar "öl" değil "bayıl" der. (Canavarları öldürmek, av ve Reis avı bundan ayrıdır.)
- **Can 0 olunca bayılırsın.** Taşıdığın her yığının (aletler ve kurulabilir yapılar hariç) **%20'si ve Vio’ların %20'si kaybolur**; kalan her şey düştüğün yerde bir **çantada** kalır (haritada kurukafa). Çantanın üstüne yürüyünce her şey geri gelir. Kumsaldaki uyanış yerinde can %50 ile uyanırsın.
- Görev eşyaları kaybolmaz (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları; Kemal'in külçe görevi sırasında o külçe).
- Bayıldıktan sonra 60 sn Reis çıkmaz. Bayılmak %60 ihtimalle bir anı açar.
- **Tanrı modu** (hile) açıkken canavar, açlık ya da zehirle bayılmazsın. **Mor ışık ise tanrı modunda bile bayıltır** (Boğaç'ın kararı, bilinçli: oyunun adı Mor Işık). Gece ışıksız kalırsan tanrı modu seni korumaz.

### Gün, gece ve mor ışık

- **Gündüz 06:00–20:00 = 8 dakika**, **gece 20:00–06:00 = 2,5 dakika**; bir gün yaklaşık 10,5 dakika. Menü ya da konuşma açıkken dünya durur.
- 19:00'dan itibaren kararır; 21:00–04:30 tam karanlıktır.
- **Zifiri karanlık kuralı:** gece elinde meşale yoksa, kafa lamban yoksa, bir ışığın (kamp ateşi vb.) içinde ya da bir evin içinde değilsen sayaç başlar: 3,5 sn "Kim var orada?!", 6,5 sn "Bir şey yaklaşıyor…", **8. saniyede mor ışık iner ve bayılırsın**. İlk gece süre 20 sn'dir ve **ilk gece hiçbir şey kaybolmaz**; sonraki gecelerde bayılmadaki gibi %20 kayıp. Ertesi sabah 06:00'da kumsalda uyanırsın.
- İlk kez meşalesiz karanlığa yakalanınca biri sana bir kez **bedava Kaba meşale** fırlatır. İlk 3 gün 17:30'da "Hava kararıyor" uyarısı gelir.
- **Güvenli yerler** (saldırgan canavarlar uzaklaşır, mor ışık gelmez): Kemal'in kampı (352 px), kişilerin ateşleri (kuzenlerin ateşleri dahil), Dursun'un ocağı, Zümrüt'ün kazanı (120 px), kendi kamp ateşin (100 px), evin içi. Ateş böcekleri ışık sayılmaz. **Gece çıkan parlak bitkiler (Gece sefası, Mor kıymık) toplanana kadar ışık sayılır:** yanlarında (yaklaşık 31–34 piksel, yani toplama menzilinin dışına taşan bir halka içinde) durduğun sürece mor ışık sana dokunmaz. Bitkiyi **topladığın an** ışığı da gider; çevrede başka ışık (meşale, lamba, ateş, Gece gözü) yoksa karanlıkta kalırsın ve mor ışık vurur (normal uyarı süresiyle). Bitkinin çevresindeki parlak halka da bu menzile uyar.
- **Güvenli yerdeyken canavarlar uzak durur:** eskiden ateşe girip çıkarak kurtları hasar almadan öldürebiliyordun (ateşin içindeyken saldırmıyorlar ama yanında bekliyorlardı). Artık sen bir güvenli yerin içindeyken (kişi ateşi, kamp ateşin, ocak, kazan, Kemal'in kampı) sana **160 piksel**den yakın olan saldırgan (ya da kızdırdığın) her canavar senden uzaklaşır: tam hızıyla 160 pikselin dışına kaçar ve orada bekler, atılışı ve hazırlığı iptal olur. Güvenli yerden çıkınca yine kovalar. Böylece ateşin kenarından vurulabilecek bir yerde durmazlar.
- **Gündüz olunca gece canlıları gider:** yalnızca gece çıkan canlılar (Kurt gibi) sabah olunca (06:00) artık kalmaz: kovalamayı bırakır, senden uzağa koşar ve 300 pikselden uzaklaşınca ya da en geç **6 saniye** sonra toz bulutuyla kaybolur. Eskiden yalnızca ekranın çok dışındakiler kayboluyor, yakındakiler gündüz de kalıyordu. Reis'ler ve yan görev canavarları bu kurala girmez (görev bitene kadar kalırlar).
- **Güvenli yerlere canavar girmez:** kavga edebilen canlılar (*saldırgan* ve *nötr*, Reisler dahil) aşağıdaki güvenli yerlerin sınırında durur, içeri **adım atmaz**; kişilerin yanına gelemez. Seni kovalarken sen güvenli yere girersen sınırda kalır, sonra vazgeçer. Bir şekilde içerde kalmış biri (ör. hücum ya da sıçrama ile) en yakın kenardan dışarı yürür. *Zararsız* canlılar (tavşan, geyik…) eskisi gibi dolaşır. Börü'nün ders canlıları ve arena bu kuraldan muaf.

#### Boğaç, gece beliren yazılımcı (v3.30; v3.37, Boğaç: yalnızca gerçek gece 02:00–06:00)

- **Yalnızca gerçekten geç saatte (v3.37, Boğaç):** Boğaç yalnızca oyuncunun **gerçek saati** (cihazın saati) **02:00 ile 06:00 arasındayken** çıkabilir. Bu saatlerin dışında oyunda gece olsa da hiç belirmez. Gerçek saat 02:00–06:00 arasındayken, oyundaki **her gece** (20:00–06:00) gecenin rastgele bir anında, haritanın (o anki adanın) rastgele bir yerinde, yürünebilen bir karada belirir ve yalnızca **15 saniye** kalır (gerçek saniye; oyun duraklatılınca sayaç da durur), sonra kaybolur. Bir gecede bir kez çıkar; uyuyarak geçen gecede çıkmaz. Haritada ya da hiçbir yerde işareti, ipucu yoktur. (v3.30–3.36'da gerçek saate bakmadan her oyun gecesi çıkıyordu.)
- **Görünüşü:** varsayılan erkek karaktere benzer (kahve saç, açık ten, mavi pantolon) ama koyu gri tişörtlü ve **kare gözlüklüdür**. Belirirken ve kaybolurken çevresinde kısa bir mor parıltı olur. Konuşma kutusunda kendi resmi görünür.
- Yanına varınca (yaklaşık 22 piksel) kendiliğinden konuşur ve **gerçek saati söyler** (v3.37, Boğaç): "Saat 02:47 olmuş. Kapat oyunu artık." (saat ve dakika cihazın o anki saatidir) · "Tamam". Konuşma bitince (ya da pencere dışına basılınca) **oyun kaydedilir ve ana menüye dönülür** (Ana menüye dön düğmesiyle aynı: otomatik kayıt).
- **Bir kez (v3.30, Boğaç: "1 kere konuştuktan sonra bir daha gelmesin, şimdilik"):** Boğaç'la bir kez konuşunca o oyunda (kayıtta) bir daha hiç belirmez. Yeni bir oyunda yine çıkar.

#### Mor ışıkta o: gece beliren sevdiğin kişi (v3.30; v3.34, Boğaç: kendi kopyan yerine sevdiğin kişi)

- Bazı gecelerde (her gece **%40** ihtimalle, tam karanlıkta 21:00–04:30 arasında rastgele bir anda) adada **sevdiğin kişi** belirir, ama **mor ışığın etkisi altındaymış gibi**: gözleri mor parlar, başının çevresinde soluk mor bir hale vardır, çevresinde mor zerreler yükselir; başının üstünde onun adı yazar. Karakter yaratmadaki görünüşüyle çizilir. Ekranın içinde, senden yaklaşık 100–140 piksel uzakta, yürünebilen bir yerde durur, yüzü sana dönüktür, konuşmaz. Çevresinde soluk mor bir ışık vardır (karanlıkta görünsün diye). (v3.30–3.33'te burada karakterinin kendi kopyası çıkıyordu.)
- Ona doğru yürümeye başladığın an (aradaki uzaklık ~14 piksel azalınca) **birden kaybolur** (küçük bir mor duman). Yaklaşmazsan 25 saniye sonra kendiliğinden kaybolur. Bir gecede en çok bir kez çıkar.
- Evin içinde, mağarada, denizde yolculukta, konuşma ya da pencere açıkken, ara sahnede ve arenada çıkmaz.
- **Kalp atışı (v3.37, Boğaç):** o göründüğü sürece **kalp atışı** duyulur: iki vuruşlu ("güm-güm"), derin ve boğuk bir ses, yaklaşık **0,9 saniyede bir**. Her vuruşla birlikte **telefon** (Ayarlar'da Titreşim açıksa, titreşimi destekleyen telefonlarda) ve bağlı **oyun kolu** (titreşimi olan kollarda) iki kısa, hafif titreşimle atar. O kaybolunca kalp atışı ve titreşim hemen durur. Oyun duraklatılınca ya da bir pencere açılınca da durur. Ayarlar'da **Kalp atışını ekranda göster** açıksa her vuruşta ekranın kenarları da mor bir nabızla atar (bkz. Arayüz › Erişilebilirlik).
- **5 farklı gecede** onu gören (ekranda en az 0,6 saniye kalmış olması yeter) gizli **Mor ışıkta o** başarımını kazanır (eski adı Öteki ben; eski sayaç sürer). Görülen geceler cihazda sayılır (başarımlar gibi, bütün kayıtlar için ortak).

#### Seni hatırlıyorum: aynı karakterle yeni oyun (v3.37, Boğaç)

- Bu cihazda **yeni bir oyuna** başlayıp Kemal adını sorduğunda, karakterinin **görünüşü** (karakter yaratmadaki bütün seçimler: cinsiyet, ten, göz, saç, sakal, kıyafet ve renkleri, gözlük, şapka) **ve adı** bu cihazda daha önce başlatılmış bir oyundakiyle **birebir aynıysa** (adda büyük/küçük harf önemsiz), Kemal adını duyunca bir an durur. Görünüş ya da ad farklıysa hiçbir şey olmaz.
  - **İkinci kez** (aynı karakter daha önce bir kez başlatılmış): Kemal: "<i>(Kemal bir an durur, yüzüne uzun uzun bakar.)</i> {Ad}… Seni daha önce de bu kumsalda bulmuş muydum? Aynı yüz, aynı ad… <i>(Başını sallar.)</i> Yaşlandım evlat, aldırma." · "Hatırlamıyorum…"
  - **Üçüncü kez ve sonrası:** Kemal: "<i>(Kemal geri çekilir.)</i> {Ad}. Yine sen. Bu kaçıncı oluyor evlat? Her seferinde aynı kumsal, aynı yüz, aynı ad… ve her seferinde hiçbir şey hatırlamıyorsun. <i>(Gözü denize kayar.)</i> Neyse. Unut gitsin, ben de unuturum." · "Ne demek istiyorsun?"
  - Ardından konuşma her zamanki gibi sürer (Kemal sevdiğin kişinin adını sorar).
- Hangi karakterlerin başlatıldığı **cihazda** saklanır (başarımlar gibi, bütün kayıtlar için ortak; en çok son 30 karakter). Bir karakter Kemal ona adını söylediği an kaydedilir; kayıt yüklemek ya da Devam et sayılmaz, yalnızca Yeni oyun. Oyunun hiçbir yerinde anlatılmaz.

#### Gizli şeyler (v3.34, Boğaç)

Oyunun hiçbir yerinde anlatılmaz; oyuncu kendisi bulur.

- **Zümrüt'ün kazanına çöp:** kazanın tarif ekranında (Tarifle kaynat) **hiçbir tarifte kullanılmayan** bir malzemeye (deri, kabuk, kömür, kaşık gibi; aletler, zırhlar, kemer eşyaları hariç) dokununca o malzemeden **1 tane kazana atılır**: kazan fokurdar, mor duman yükselir ("X kazanda kaynadı… mor bir duman yükseldi"). Seçili tarif olmasa da olur. **5 farklı** böyle malzeme atınca Zümrüt kızar ve sayaç sıfırlanır:
  - 1. kez: "Evlat! Ne yapıyorsun? Kazanım çöp tenekesi değil! Attığın her şey duman oldu."
  - 2. kez: "Yine mi?! Bu kazan bana ninemden kaldı, evlat! Bir daha görmeyeyim."
  - 3. kez: "Peki, peki… Madem bu kadar meraklısın. Bak, senin çöplerinden tuhaf bir şey kaynadı. Al iç bakalım… Aaa! Neredesin evlat?!" Karakter bunu içer ve **10 saniye görünmez** olur: yarı saydam (neredeyse görünmez) çizilir, canlılar onu görmez (kovalayan bırakır, saldırmaz, atış yapmaz). Gizli başarım **Görünmezlik iksiri**. Sonraki her 5 çöpte Zümrüt yalnızca kızar (1. ve 2. sözler sırayla), iksir bir daha çıkmaz. Sayaç kayıtta saklanır.
- **Börü'yü yenmek:** elin boşken (silahsız, yumrukla) Börü'nün yanında (~26 piksel) **50 kez vurursan** (vuruşlar arasında en az 0,2 sn) Börü pes eder: "Tamam, tamam! Pes ediyorum! Yumrukların taş gibi olmuş evlat. Al, bu kemeri gençliğimde bir ayıdan kazanmıştım. Artık senin." Sana **Börü'nün kemeri** verir: **gövdeye giyilen** bir zırh, **26 savunma** (orman zırhları kadar), kanamaya %20 direnç, kahverengi deri. Arenada da seçilebilir. Bir kez verilir (kayıtta saklanır); sonra 50 vuruşta "Yine mi? Kemerimi aldın ya!" der.
- **100. gecede yıldızlar:** "Yıldızsız Ada"da yıllar sonra bir gece yıldızlar çıkar: **100., 200., 300.… günün gecesinde** (20:00–06:00) gökyüzünde parlayan yıldızlar görünür (ekranın her yerinde hafifçe yanıp sönen beyaz ve mor noktalar), yıldız ışığı her yeri aydınlatır: o gece meşale gerekmez ve **mor ışık gelmez**. Gecenin başında ekranda "Gökyüzünde yıldızlar…" yazısı çıkar.
- **Eski kamp ateşi:** her yeni oyunda adanın ıssız bir köşesinde (Kemal'in kampından en az ~120 kare uzakta, yürünebilen bir yerde) **sönmüş bir kamp ateşi** vardır: kül, kararmış taşlar ve yanında üstüne **karakterinin adı kazınmış** bir taş. Yanına gelince karakter: "Bu taşa… benim adım kazınmış: {ad}. Ben buraya ne zaman geldim?" Yer kayıtta saklanır.
- **Ayna:** suyun (göl, nehir, deniz) kenarında, yüzün suya dönük **10 saniye hiçbir şey yapmadan** (yürümeden, hiçbir tuşa basmadan, su ya da başka bir şey toplamadan, olta atmadan, bir pencere açık değilken; v3.35, Boğaç: su toplarken görülmesin) durursan sudaki yansımanda bir anlığına (3 sn) **sevdiğin kişinin yüzü** belirir (soluk, ters, dalgalanarak), sonra kaybolur. En çok 2 dakikada bir.
- **Dans (v3.35, Boğaç):** yürüme tuşlarıyla (klavye, kol ya da ekrandaki yön) art arda **sol, sağ, sol, sağ, sol, sağ** (3 kez sol-sağ; basışlar arasında en çok 0,6 sn, hepsi 3 sn içinde, neredeyse yerinden oynamadan) basınca karakter **dans etmeye başlar** (sağa sola sallanır, zıplar, üstünde notalar çıkar) ve tuşları bıraksan da **dans etmeye devam eder**. **Başka herhangi bir tuşa** (ya da yine bir yön tuşuna) basınca, yürüyünce ya da bir pencere açılınca dans biter. **20 saniye** dans edince yakındaki (300 piksel) zararsız ve nötr hayvanlar (tavşan, keklik, geyik…) yanına yürür ve senin çevrende **eşit aralıklı bir çember** (yaklaşık 50 piksel yarıçap) üzerinde yerlerini alır; yerlerine varınca **durur, yüzlerini sana döner ve seni izler**, kaçmazlar (v3.36, Boğaç: bir bıldırcın gelip kaçmaya çalışıyordu). Dans sürdükçe orada kalırlar, dans bitince dağılırlar. **Dans ederken şarkı (v3.36, Boğaç):** dans sürdükçe karakter mırıldanarak şarkı söyler: "la-la" diye, kısa, neşeli, kendini tekrarlayan bir ezgi (8 notalık iki cümle). Ses tonu karakterine göredir: **erkekse kalın** (Re3 çevresi), **kadınsa ince** (Re4 çevresi). Ses efektleri sesinden çalar; dans bitince susar.
- **İnatçı balıkçı:** aynı yere (ilk atışın 24 piksel çevresine) art arda **100 kez** olta atarsan (başka bir yere atınca sayaç sıfırlanır) sudan **yaşlı bir balık** çıkar ve konuşur: "Yüz kez! Yüz kez aynı yere attın oltayı! Ben bu suyun en yaşlısıyım; seni artık tanıyorum. Ama beni yakalayamazsın, inatçı. Hoşça kal!" ve suya dalıp kaybolur (sıçrama). Bir kez olur (kayıtta saklanır).
- **Barışçı (mor ışık saldırısı):** bir saldırıda **hiçbir Yıldızsız'ı öldürmeden** saldırının sonuna kadar (4 dakika) bölgede kalıp **bayılmazsan**, saldırı biterken kalan Yıldızsızlar durur, sana el sallar (başlarının üstünde mor "~" işareti), sonra ışıkla gider; ekranda "Konuk · Yıldızsızlar el salladı" yazar. Gizli başarım **Konuk**.
- **Gece 03:00:** gerçek saat (cihazın saati) **03:00–03:59** arasındaysa Kemal'le konuşunca sözüne şöyle başlar: "Bu saatte uyanık mısın evlat? Git yat." (oturumda bir kez).
- **Devam ederken bir satır:** ana menüde **Devam et**'e basıp oyuna girince ekranın ortasında birkaç saniyeliğine (4 sn) şiirsel tek bir satır belirip kaybolur; her girişte sıradaki satır (bu cihazda sırayla döner): "Denizin her yeri derin değildir." · "Bazı geceler ada yalnız değildir." · "Kazan bazen tarifsiz de bir şey verir." · "Su, bakana başka bir yüz gösterir." · "Yıldızsız Ada'nın da yıldızlı bir gecesi vardır." · "Adada senden önce de bir ateş yanmıştı." · "Yumruk da bir dildir; Börü onu anlar." · "Ayakların ritmi tutunca ada da seninle dans eder." · "Sabır, suyun dibindekini bile yüzeye çıkarır." · "Her yabancı düşman değildir." · "Gece yarısından sonra bazı yüzler yalnızca bir kez görünür." Oyuncuya iş tarif etmez, yalnızca merak uyandırır.

#### Işık kaynakları

| Işık | Yarıçap | Süre | Not |
|---|---|---|---|
| Kaba meşale | 80 px | 220 sn (yalnızca eldeyken yanar) | 2 Dal + 2 Lif + 2 Yaprak, el yapımı |
| Meşale | 115 px | 340 sn | Dursun döver |

- **Meşale yuvası:** meşale alet kemerine **takılmaz**; kemerin hemen solunda ona ayrılmış tek bir **meşale yuvası** vardır (boşken soluk bir meşale simgesi görünür). Meşale envanterden bu yuvaya sürüklenir ya da meşaleye dokunup yuvaya dokunulur; kemerin bir yuvasına bırakılan meşale de bu yuvaya geçer, yuvaya meşale dışında bir şey takılmaz. **Yuvaya basmak** (bilgisayarda tıklama ya da **"** tuşu, 1'in solundaki tuş; Ayarlar → Kontroller'den değişir) meşaleyi **yakar** ve sol ele alır; bir daha basmak **söndürür**. Meşale yalnızca yanarken tükenir; yuvada sönük dururken azalmaz. Yuvada kalan miktar (sağ üst köşede, beyaz ve siyah kenarlı) ve yanma çubuğu (altta) görünür. Yanan meşale elde başka silah yoksa **vurur** (7 hasar). Fare tekerleği yalnızca kemerde gezer. Eski kayıtta kemerdeki meşale kendiliğinden meşale yuvasına taşınır. İlk karanlıkta Kemal'in verdiği meşale de doğrudan yuvaya konur. **Envanterde de görünür (v3.37, Boğaç):** envanterin "Alet yuvaları" sırasında, 1. yuvanın solunda aynı meşale yuvası durur (içindeki meşale, sayısı, yanıyorsa turuncu çerçeve). Envanterde meşaleye dokunup bu yuvaya dokunmak (ya da sürüklemek) meşaleyi yuvaya koyar; meşale seçili değilken dokunmak yakar/söndürür. Yuvaya meşale dışında bir şey konmaz. **Biten meşalenin yerine öbürü (v3.37, Boğaç):** yanan meşale tükenince elinde **başka bir meşale** varsa (önce aynı türden, yoksa öbür tür: Meşale ↔ Kaba meşale) o meşale kendiliğinden yuvaya geçer ve **yanmaya devam eder**; ekranda "{Biten} bitti · {Yeni} yandı" yazar. Elinde hiç meşale kalmadıysa yuva boşalır ve karanlıkta kalırsın.
| Kafa lambası | 125 px | sonsuz | Baş yuvası; Işıkçı'dan takasla |
| Kamp ateşi | – | 330 sn; 2 Dal +95 sn, 1 odun +190 sn, 1 Kav +285 sn; en çok 720 sn | **Alet yuvasına girer:** yapınca boş bir yuvaya kendiliğinden konur (envanterde "Yuvaya koy / Eline al" da var); **elindeyken tıkla** (telefonda **Vur**) → önüne kurulur. Ayrıca V tuşu ya da envanterde "Yak". **Haritada görünür:** yanan her kamp ateşin hem köşedeki küçük haritada hem büyük haritada titreşen turuncu bir alevle gösterilir (keşfedilmemiş yerde de, gece de); büyük haritada üstünde "Kamp ateşi" yazar. Sönünce haritadan kalkar. Yağmurda 1,6 kat hızlı söner |

- Meşale sol elde taşınır; sağ elde silah olabilir. Yağmurda 2 kat, fırtınada 2,7 kat hızlı biter. **Elde iki silah olmaz:** iki el yalnızca meşale için vardır (sol elde meşale, sağ elde bir silah ya da alet). Silah yuvasındaki silah sırtta durur ve **yalnızca sağ el boşken** (ya da elde silah/alet olmayan bir şey varken) görünür; sağ elde balta, kazma, kılıç ya da mızrak varken sırttaki silah çizilmez, böylece elde iki silah varmış gibi görünmez. Dövüşte yine yalnızca tek silah kullanılır (eldeki; elde yoksa yuvadaki).
- **Çapraz yürürken meşale titremez:** çapraz yürürken meşale ve eldeki eşya, karakterin çapraz pozunun gidilen yönüne göre çizilir; karakterin yönü de iki yön arasında kararsızken (çubukla çapraza yakın yürürken) her karede değişmez, ancak öbür yön açıkça baskın olunca döner. Eskiden meşale her karede sağ ve sol el arasında gidip gelip yanıp sönüyordu.
- **Meşale silahtır da:** **meşalenin kendisiyle** vurduğun her canavar (10 Kasım 2026, Boğaç: meşale yanarken mızrak, kılıç, balta gibi başka bir silahla vurmak tutuşturmaz; yalnızca gerçek bir vuruş tutuşturur, canavarın seni fark etmesi tutuşturmaz) (normal vuruş, kombolar, güçlü vuruş, ulti; senden en çok 60 piksel uzaktaki) **tutuşur**: **4 sn** boyunca yanar ve yavaş yavaş can kaybeder: Kaba meşalede ~1,5 saniyede **1**, Meşalede saniyede **1** (her saniye bir turuncu hasar sayısı; bir yanık toplam Kaba meşalede 2–3, Meşalede 4 can). Yanan canavarın üstünde **turuncu bir parıltı** ve yukarı uçan alevler görünür. Yanarken yeniden vurursan süre baştan başlar (yanık üst üste binmez). Yanıkla ölen canavar normal avlanmış sayılır (XP ve ganimet). Kendisi yakan canavarlar (Lav kertenkelesi, Kül cini gibi saldırısı yanık bırakanlar) tutuşmaz; Börü'nün ders canavarları ve arenanın canavarları da tutuşmaz. Uzaktan atışlar (asa, fırlatılan mızrak) tutuşturmaz.
- **Her saldırı meşaleden yer:** meşaleyle yaptığın her saldırı (başka silahla vururken meşale yalnızca zamanla yanar) (isabet etsin etmesin) meşalenin tam süresinin **%4,5'ini** yer (Kaba meşalede ~10 sn, Meşalede ~15 sn); bu, zamanla yanmaya ektir. Bir meşale yalnızca vuruşla ~22 saldırıda biter. Aynı vuruşun birden çok canavara değmesi tek saldırı sayılır (0,25 sn içinde en çok bir kez). Sınırsız dayanıklılık hilesi açıkken yemez. **Reçine** (L): Meşale +%65, Kaba meşale +%50 süre. Her sürüşte 1 reçine harcanır (sıra: Çam reçinesi, Ladin reçinesi, Huş katranı); reçine yoksa yalnızca "Reçinen yok." yazar (v3.29, eski uyarı kalkan kabuk tarifini gösteriyordu). Biten meşale yığından 1 eksilir, varsa yenisi yanar.
- Kamp ateşinin başında **F** (toplama/konuşma tuşu): odun at ya da **pişirme menüsünü** aç.
- **Ateşte pişirme (7 Kasım 2026, Boğaç):** tarifler yine **kazanda öğrenilir**; ama ateş gerektiren yemekler (közlenmiş, kızarmış, kavrulmuş, haşlanmış, tütsülenmiş, ızgara, tava, şiş, buğulama, pişmiş et/balık, Kor isteyenler ve malzemesinde Ateş ya da Duman olan bütün yemekler; tam liste Tarif ansiklopedisinde "Ateşte" yazanlar, 129 tarif) **El yapımı listesinde görünmez**, **ateşte** yapılır. Ateşin başında **Ateş ve Duman malzemesi harcanmaz, ateş sağlar**; öbür malzemeler harcanır.
  - **Pişirme menüsü:** herhangi bir ateşe (kamp ateşi ya da kişilerin ateşleri) F, tıklama/dokunma ya da kolda A ile açılır; eski "Ateşte közle" penceresinin genişlemiş halidir. Çiğ et/balık közleme ve ateşte yapılabilen **öğrenilmiş** tarifler listelenir; her satırda ad solda, **Yap · ×5 · Hepsi** düğmeleri sağdadır (liste düzeni kuralı). Çantada çiğ yiyecek olmasa da ateşte yapılabilen bir tarif varsa menü açılır. F önceliği değişmez: önce yerdeki eşya, sonra kişi (Boğaç; böylece ateşin yanındaki kişiyle konuşmak engellenmez), sonra ateş.
  - **Pişme süresi:** her yemek ateşte kısa bir süre pişer (bir tanesi ~3 sn; ×5 ve Hepsi sırayla pişer). Ateşin üstünde ve menüde bir **ilerleme çubuğu** görünür. Pişen yemek bitince **kendiliğinden çantaya** gelir; oyuncu bu sırada uzaklaşabilir (pişirme ateşte sürer). Yanma yoktur. Bir ateşte aynı anda tek pişirme sırası vardır; yeni istek sıranın sonuna eklenir.
  - **Sıra ve malzemeler:** malzemeler yemek sıraya alınınca harcanır. Ateş sıra sürerken sönerse pişmemiş yemeklerin malzemeleri çantaya döner. Oyun kaydedilince ateşte pişmekte olanlar **hemen pişmiş sayılır** ve çantaya gelir (pişirme sırası kayda yazılmaz).
  - **Kamp ateşinde yakıt:** kamp ateşinde pişen her yemek ateşin yanma süresinden **4 sn** yer; kamp ateşinin menüsünde ateşin kalan süresi ve **Odun at** düğmesi görünür. Kişilerin ateşleri sönmez.
  - **Ara malzeme olarak elde yapılmaz:** ateş yemekleri, bir tarifte ara malzeme olarak gerekse de El yapımı'nın "+" zincirinde elde yapılmaz; ateşte pişirilir.
- **Önce yanındaki toplanır:** kamp ateşinin ya da bir tuzağın hemen yanında toplanabilir bir şey (lif, dal…) varsa **F** / Topla önce onu toplar; ateşin menüsü ancak yanında toplanacak bir şey kalmayınca açılır.
- **Kişilerin ateşinde yemek:** Kemal'in ve öbür kişilerin kamplarındaki ateşlerde de çiğ et ve balık közlenir ve pişirme menüsü açılır: ateşin **üstüne tıkla / dokun** (uzaktaysan karakter yürür, varınca açılır) ya da ateşin hemen yanındayken (~16 piksel) ve çantanda çiğ et ya da balık varken **F**'ye bas. Pencerede "Hepsini közle" ve tek tek közleme vardır; kişilerin ateşi sönmez, odun istemez. Çiğ yemeğin yoksa "Çiğ et ya da balık getirirsen közleyebilirsin" der.
- **Elde kazmayla madene sol tık:** elinde kazma varken bir madenin (taşın, cevherin) üstüne sol tıklayınca karakter madene yürür ve kazar; tıklama madenin bütün görüntüsünü tutar (eskiden yalnızca ortasındaki küçük nokta sayılıyordu, kenarına tıklayınca vuruş yapılıyordu). Yakında canavar olsa da kazmayla madene tıklamak kazar.

#### Hava

Havanın sırası, sıklığı ve süresi mevsime göre değişir (bkz. Hava, sıcaklık ve kar) (Bataklık ve Kayalık Dağ'da sis daha sık, yaklaşık %20; öbürleri o kadar azalır). Bataklık ve Kayalık Dağ'ın üstünde her zaman ince bir sis süzülür, sisli havada her yerde yoğun sis olur; ateşler, meşale ve fener sisin içinde ışık açar. Grafik kalitesi en düşük düzeydeyse (otomatik kalite) Orta Diyar'ın sürekli ince sisi çizilmez, sisli hava yine çizilir. Yağmur/fırtına: meşale ve kamp ateşi çabuk biter, **tarladaki tohumlar kendiliğinden sulanır**, balık %30 daha çabuk vurur; fırtınada şimşek çakar. Kül Diyarı'nda yağmur yerine **kül fırtınası** olur. Siste saldırganlar seni %40 daha geç fark eder.

#### Mevsimler (v3.69, 8 Kasım 2026, Boğaç)

**Çayır'da yerdeki toplanabilirlerin görünüşü (9 Kasım 2026, Boğaç teker teker seçti):** Çayır'da yerde duran toplanabilirler için Boğaç'a şimdiki hali ve iki yeni çizim gösterildi; seçilenler oyundaki görünüştür (eşya bir başka biyomda da çıkıyorsa orada da aynı görünür; envanter resimleri değişmedi):
- **Dal:** ince, yatay bir çubuk; yukarı çıkan küçük bir çatal ve ucunda yeşil tomurcuk.
- **Yaprak:** dik duran, iki tonlu yeşil yaprak; koyu orta damar ve yan damarlar, altında kahverengi sap.
- **Kum:** üstünde dalga izleri olan kum tepeciği.
- **Ebegümeci:** saplar üstünde üç pembe-mor çiçek, altta yuvarlak yapraklar.
- **Hardal otu:** dallanan sap üstünde sarı çiçek kümeleri.
- **Nane:** eski çizimin aynısı, yeşilleri biraz koyu.
- **Yaban çileği:** üçlü yapraklar, altında kırmızı meyveler.
- **Havuç:** yarısı toprağa gömülü turuncu havuç, toprak tümseği ve yeşil filizler ("Yabani havuç" kalktı, yerden toplanan da tarladaki **Havuç**'tur).
- **Yarasa gübresi:** içinde açık renkli kırıntılar olan koyu yığın.
- Taş, Lif, Kuru ot, Nehir çakılı, Çakmaktaşı, Böğürtlen, Gelincik, Papatya, Rezene, Yabani buğday, Kireçtaşı, Kumtaşı, Bakır cevheri ve Sarkıt olduğu gibi kaldı.

**Sol üstteki gün, saat, hava ve mevsim (9 Kasım 2026, Boğaç):** bilgisayarda can çubuğunun hemen üstünde, kutusuz, tek satır:
- **Gün:** yalnızca yazı ("12. gün"); hava adı ve mevsim adı burada yazmaz.
- **Saat:** dijital saat gibi koyu bir kutuda büyük rakamlarla ("19:50"); gece mavimsi yanar. Üstüne gelince gündüz ve gecenin süresi kısaca yazar: "Gündüz 06:00–20:00 · 8 dk", "Gece 20:00–06:00 · 2,5 dk" (gecenin süresi o mevsiminki).
- **Hava durumu:** yalnızca bir simge (☀ gündüz açık, 🌙 gece açık, ☁ bulutlu, 🌧 yağmur, ⛈ fırtına, 🌫 sis, ❄ kar, 🌋 kül fırtınası). Üstüne gelince adı ve sıcaklık yazar.
- **Mevsim çemberi:** dört renkli bir çember (İlkbahar yeşil, Yaz sarı, Sonbahar turuncu, Kış açık mavi; yukarıdan saat yönünde) ve üstünde yılın 28 gününü dönen bir **ok**; ok saat gibi yavaş yavaş ilerler. Üstüne gelince dört mevsim renkleriyle sıralanır, içinde bulunulan mevsim işaretlidir ("İlkbahar · 3/7. gün · Yaz'a 4 gün").
- Telefonda saat kutusu eskisi gibidir.

Yıl **28 gündür**: her mevsim **7 gün** sürer ve sırayla döner. 1–7. gün **İlkbahar**, 8–14 **Yaz**, 15–21 **Sonbahar**, 22–28 **Kış**; 29. gün yeniden İlkbahar. Mevsimler **iki adada da** aynıdır (gün iki adada ortak). Saat kutusunun ikinci satırında mevsim ve sıcaklık yazar ("Yaz · 18°"). Yeni mevsim sabah 06:00'da büyük bir yazıyla duyurulur ("Yaz geldi" ve bir alt satır); oyunun ilk sabahı duyurulmaz. Mağarada, evin içinde ve arenada mevsim görüntüsü yoktur; kurallar sürer.

| | İlkbahar | Yaz | Sonbahar | Kış |
|---|---|---|---|---|
| Görünüş | uçuşan beyaz ve pembe çiçek yaprakları | ılık, aydınlık bir renk | sarı, turuncu, kızıl düşen yapraklar; sıcak bir renk | soğuk, beyazımsı bir renk; kar yağınca yer yavaş yavaş beyazlar (aşağıda "Hava, sıcaklık ve kar") |
| Gece (20:00–06:00) | 2,5 dk | **1,8 dk** | 2,5 dk | **3,5 dk** |
| Toplarken | otlar (Otlar sınıfı) %50 ihtimalle +1 | meyveler %50 ihtimalle +1 | mantarlar %50 ihtimalle +1; ağaçtan düşen meyve (silkeleme, kesme, Sapan) **2 kat** | **meyve yok**: çalılardan, ağaçlardan (silkeleme, kesme, Sapan) meyve gelmez; "Kış: dallar çıplak, meyve baharda" yazar |
| Mevsim balığı (vurma ihtimali 2 kat) | Alabalık | Sazan | Turna balığı | Mersin balığı |
| Tokluk | – | – | – | **%25 daha hızlı** düşer |

- **Gece uzunluğu:** saatler değişmez (gece yine 20:00–06:00, uyku 20:00–05:00); yalnızca gecenin gerçek süresi değişir. Gündüz her mevsim 8 dakikadır.
- **Hava mevsimden gelir:** yağışın sıklığı, süresi, türü (yağmur ya da kar) ve yerdeki kar aşağıdaki "Hava, sıcaklık ve kar" kurallarıyla belirlenir.
- **Kışın meyve:** Pazarcı Nazlı'nın satın alma listesi (daha önce eline geçmiş doğal malzemeler) kışın da açıktır; meyve isteyen bir görev kışın oradan tamamlanabilir. Robot köpeklerin topladıklarına mevsim dokunmaz.
- **Göller donmaz:** kışın da su olduğu gibidir, balık her mevsim tutulur.
- **Mor gece:** her yılın son gecesi (28., 56., 84.… günün gecesi) **yılın en uzun gecesidir: 4 dakika** sürer. Gece başlarken (20:00) "Mor gece · Yılın en uzun gecesi" yazar, gökyüzü bütün gece hafifçe mora çalar ve **mor ışık saldırısı kesin gelir** (bkz. Mor ışık saldırıları ve Yıldızsızlar): 20:00'da evde, mağarada ya da güvenli bir yerdeysen saldırı ertelenmez, **dışarı çıktığın an** (gece bitene kadar) gelir. Uyuyarak geçirirsen gelmez. O gece normal sırasına denk gelen saldırı ayrıca gelmez. Mor gece anılara dokunmaz (anı tetikleri her gece nasılsa öyledir).

#### Hava, sıcaklık ve kar (v3.70, 8 Kasım 2026, Boğaç: "mevsim mantığı ile hava durumu mantığı arasında bir mantık olması lazım")

- **Sıcaklık:** adanın o anki sıcaklığı hava durumu simgesinin üstüne gelince yazar ("Bulutlu · 2°"); kar yağarken simge ❄ olur ve adı "Kar" ya da "Tipi"dir (telefonda saat kutusunun ikinci satırında mevsimin yanında yazar). Dört parçadan oluşur:
  - **Yılın eğrisi:** 11,5 + 15 × cos(2π × (yılın günü − 11) / 28); en sıcak yaz ortası (11. gün, ~26,5°), en soğuk kış ortası (25. gün, ~−3,5°), ilkbahar ve sonbahar ortası ~11,5°. Mevsimler arasında sıcaklık sıçramaz, gün gün değişir: sonbaharın son günleri (~2°) ve ilkbaharın ilk günleri de soğuktur.
  - **Günün farkı:** her gün kendi farkını taşır (−3° ile +3° arası; aynı gün hep aynı).
  - **Gün içi:** en sıcak 14:00 (+4°), en soğuk 05:00 (−4°), arası yumuşak geçiş.
  - **Yer:** Kayalık Dağ −6°, Mor Kristal Vadisi −2°, Bataklık +1°, Kül Diyarı +18°; ikinci adada Hurda Çölü +6°, Ejder Volkanı +18°, Gök Rıhtımı −4°; öbür biyomlar 0. Sıcaklık oyuncunun bulunduğu yere göre hesaplanır.
- **Yağışın türü:** kar **yalnızca kışın** yağar (9 Kasım 2026, Boğaç: "ilkbaharda kar yağmasın, kışın yağsın"): kışın yağış başladığında sıcaklık **0,5°'nin altındaysa kar** (fırtınada **tipi**), üstündeyse yağmur (fırtına) yağar; öbür mevsimlerde sıcaklık ne olursa olsun yağmur yağar (ilkbaharın soğuk gecelerinde de). Yağış sürerken hava ısınırsa kar yağmura, soğursa yağmur kara döner. Kar ve tipinin etkileri (meşale, kamp ateşi, balık) yağmur ve fırtınayla aynıdır; tipide şimşek çakmaz. Kül Diyarı'nda yağış yine kül fırtınasıdır.
- **Hava zinciri:** hava rastgele zıplamaz, sırayla değişir: **açık → bulut → yağış → (fırtına) → bulut → açık**; sis sabahları (05:00–10:00) daha sık çıkar ve açık ya da bulutluya döner. Mevsim, bulutun yağışa dönme ihtimalini, fırtınanın payını ve her havanın ne kadar süreceğini belirler:

| | İlkbahar | Yaz | Sonbahar | Kış |
|---|---|---|---|---|
| Bulut yağışa döner | %30 | %18 | %35 | %45 |
| Yağışın fırtına payı | %15 | %40 (kısa yaz sağanakları) | %30 | %20 |
| Açık hava sürer (sn) | 180–360 | 300–520 | 160–320 | 140–280 |
| Yağış sürer (sn) | 100–200 | 50–100 | 120–240 | 150–300 |
| Fırtına / tipi sürer (sn) | 60–120 | 50–90 | 90–160 | 90–180 |

  Bulut ve sis her mevsim 90–180 sn sürer. Bataklık ve Kayalık Dağ'da sis iki kat sık. Oyunun ilk günü (Kemal'le tanışana kadar) hava açıktır.
- **Kar örtüsü:** kar yağdıkça yer **yavaş yavaş beyazlar**: örtü kar yağarken saniyede %0,3 (tipide %0,6) artar; boş bir yer ~5,5 dakikalık karda tamamen beyazlar. Önce yer yer beyaz lekeler belirir, sonra birleşir. Sıcaklık 0,5°'nin altındayken örtü erimez.
  - **Erime:** sıcaklık 0,5°'nin üstündeyken örtü saniyede (sıcaklık × %0,025) azalır; **yağmur yağarken 4 kat**, gündüz açık havada güneşte 1,5 kat hızlı. Örneğin ilkbaharda 10°'lik yağmurda kar ~1,5 dakikada, 5°'lik açık gecede ~13 dakikada erir. Erirken beyaz lekeler yavaş yavaş küçülür.
  - Kar yalnızca karaya (çimen, orman zemini, kum) yağar; su, Kül Diyarı ve Ejder Volkanı karlanmaz. Göller donmaz. Yollar ve döşemeler de karla örtülür.
  - Örtü bütün ada için tek bir değerdir ve kayda yazılır; ikinci adaya geçince aynı örtü sürer.
- **Üşüme (9 Kasım 2026, Boğaç: "kışın 0 derece ve altında karakter üşüsün, ya meşale ya da bir ateş bulması gereksin; köşelerden başlayan ve gitgide şiddetlenen buzlanma; çok üşürsek can hızlı düşsün"):** karakterin bir **üşüme** değeri vardır (0–100, ekranda sayı olarak yazmaz; buzlanmadan görülür).
  - **Ne zaman üşür:** **kışın** (22–28. günler) ve bulunduğu yerin sıcaklığı **0° ya da altındayken**, gece de gündüz de. Öbür mevsimlerde üşümez. Mağarada, evin içinde ve deniz yolculuğunda üşümez; arenada ve konuşma/pencere açıkken üşüme durur.
  - **Ne kadar hızlı:** 0°'de üşüme ~3 dakikada dolar; her 6° daha soğukta bir kat daha hızlı (−6°'de ~1,5 dakika, −12°'de 1 dakika).
  - **Isınmak:** elinde **yanan bir meşale** varken üşüme artmaz, yavaşça azalır (~2 dakikada sıfırlanır). Bir **ateşin yanında** (yaklaşık 4 kare: kamp ateşi, kişilerin ateşleri, Kemal'in ateşi, ocak/fırın, Zümrüt'ün kazanı) ya da evin içinde hızla ısınır (~20 sn'de sıfırlanır). Soğuk geçince (kış bitince ya da sıcaklık 0°'nin üstüne çıkınca) üşüme ~1 dakikada geçer.
  - **Buzlanma:** üşüdükçe ekranın **dört köşesinden buz kristalleri** başlar, üşüme arttıkça büyüyüp ekranın ortasına doğru ilerler ve koyulaşır; ısınınca geri çekilir. Buzlanma oyun dünyasının üstünde, sol üstteki çubukların ve düğmelerin altında durur (onları kapatmaz).
  - **Can kaybı:** üşüme **75**'i geçince can düşmeye başlar: 75'te saniyede 1 can, 100'de saniyede en yüksek canın **%2**'si (en az 4 can); bu sırada ekran kırmızı yanıp söner ve karakterin üstünde "Donuyorsun!" yazar. Bu yüzden bayılırsan sebep "soğuk" yazar.
  - **Uyarılar:** üşüme ilk kez 15'i geçince bir kez "Üşüyorsun: elinde yanan bir meşale ya da bir ateşin yanı seni ısıtır." yazar (her kış bir kez); 75'i geçince "Donuyorsun! Hemen bir ateş bul." yazar.
  - Üşüme kayda yazılır.
- **Grafik:** kar yağarken çizgi yerine kar taneleri yağar (tipide yoğun ve yana savrulur). Kar örtüsü 16 × 16 karelik parçalar halinde önceden çizilir ve yalnızca örtü %1 değişince yenilenir (karede en çok 2 parça, bellekte en çok 24 parça); örtü yokken hiç çizim yapılmaz.

#### Uyku

- Uyku yalnızca **20:00–05:00** arası. Uyuyunca saat 06:00 olur, can ve enerji dolar, tokluk 20 azalır; %40 ihtimalle bir rüya anısı gelir.
- Yataklar: Hasır yatak (Usta Sinan ilk tanışmada hediye eder), Hasırotu yatak, Ahşap karyola. Yatak açıkta da kurulabilir; evde içeri yerleştirilir. **Yaprak barınağı** yatak istemez ama bir gecelik (uyanınca dağılır).

## Gelişim

### Seviye, XP ve yetenekler

- **Biyom XP çarpanları:** canlı XP'si biyomuna göre çarpılır: Çayır ve Orman ×1, **Bataklık ×1,5**, Kayalık Dağ ×2, Kül Diyarı ×1,5, Mor Kristal Vadisi ×1,5. Biyom tablolarındaki XP sütunu çarpan uygulanmış değerdir. Bataklık kurdunun temel XP'si 76'dır (sabit; çarpanla 114).

- En üst seviye **60** (v3.41; eskiden 50). Gereken XP 16. seviyeye kadar her seviye %35 artar (1→2: 40, 5: 133, 10: 596, 16: 3.606), sonra yavaş artar (25: 5.553, 49: 10.746, 59: 12.909). Seviye atlayınca özellikler değil **seviye puanı** gelir (yukarıda "Seviye puanları").

| Kaynak | XP |
|---|---|
| Kazanda yeni tarif öğrenmek | 12 |
| Elle yeni ürün / tekrar | 12 / 2 |
| Örste yeni alet ya da zırh / tekrar | 8 / 2 |
| Zor modda "Dene" ile tarif bulmak | 5 |
| Avlamak | türün XP'si (tablolarda) |
| Reis | türün XP'si × 6 + 20 |
| Toplamak (her düğüm, ağaç, meyve) | 1 |
| Balık | 3 + fiyatın yarısı |
| Tuzaktan av almak | 4 |
| Közleme | parça başına 1 (bir seferde en çok 30) |
| Ateşte yeni yemek / tekrar | 12 / 2 (el yapımı gibi) |
| Keşif defterinde bir kategoriyi bitirmek | 100 |
| Anı | 25 + 15 × anının sırası |
| Ada halkı hikâye sahnesi / Zümrüt'ün bilmecesi | 40 / 20 |
| Köprü onarımı / Doğu geçidi | 40 / 320 |
| Görevler, Börü'nün dersleri | tablolarda |

**Görev dışı ek XP yok:** köprü onarmak ve kaya yığını/sıradağ patlatmak (ACT 1 ve ACT 2) kendi başına XP vermez; bunların XP'si yalnızca ilgili görevin ödülüdür.

- **Yetenek ağacı** (Y): üç renkli ağaç — **Savaş** (kırmızı), **Ekonomi** (altın) ve **Dayanıklılık** (yeşil); her birinde 30 yetenek (toplam 90). Yetenekler sade, iki renkli ikonlu yuvarlaklardır; hepsi açılınca bir ağaç silüeti çizer. Başta yalnızca kök yetenek görünür; bir yetenek alınınca **yalnızca ona bağlı üstündekiler** açılır. Satın alma ikona tıklayarak. Fiyat ve seviye şartı kata göre: 100 (–), 250 (Sv 2), 400 (Sv 3), 600 (Sv 4), 1.000 (Sv 6), 1.800 (Sv 8), 3.000 (Sv 11), 5.000 (Sv 14). Tam liste "Yetenekler · Yetenek ağacı" bölümünde.
- **Koşu** Savaş ağacının ilk yeteneğidir: yalnızca 100 Vio; seviye, köprü ya da Atılma şartı yok.
- **Atılma** yetenek ağacında değildir: öğreticide Börü ücretsiz öğretir (bkz. "Oyun akışı › Öğretici").

### Evcil hayvanlar (v3.42, 6 Kasım 2026, Boğaç)

> Evcilleştirmeyi **Çoban Davut** öğretir (ACT 1 · "Çoban Davut"). Bir canlı ancak Davut'un o canlıyı anlatan görevi alınınca (ya da bitince) evcilleşir.

**Her biyomda bir canlı evcilleşir** (3 binek, 3 savaşçı):

| Biyom | Canlı | Türü | Nasıl | Sevdiği yiyecek | Özelliği |
|---|---|---|---|---|---|
| Çayır | Yaban atı | binek | yetişkin, doğrudan | Yabani elma | hız ×1,8; düz yolda en iyisi |
| Orman | Kurt | savaşçı | yavru (in) | Tavşan eti | hızlı saldırır (can 260, hasar 14, 0,8 sn); gece canavar yaklaşınca hırlar |
| Bataklık | Timsah | savaşçı | yavru (in) | Sazan | yavaş ama sağlam (can 520, hasar 22, 1,4 sn); ısırdığını 1,5 sn yavaşlatır |
| Kayalık Dağ | Dağ keçisi | binek | yetişkin, doğrudan | Tuz kayası | hız ×1,5; Kayalık Dağ'da ×1,9 |
| Kül Diyarı | Lav kertenkelesi | savaşçı | yavru (in) | Kül böceği kabuğu | can 380, hasar 18, 1 sn; vurduğuna yanık (3 sn); ateşe dayanıklı |
| Mor Kristal Vadisi | Kristal geyik | binek | yetişkin, doğrudan | Ay otu | hız ×2,0; gece boynuzu hafif ışık verir (meşale sayılmaz) |

- **Önce ağıl (Boğaç):** dünyada kurulmuş bir **ağıl** yoksa hiçbir canlı evcilleşmez (Davut'un ilk görevi dışında bütün evcilleştirme ağıldan sonra). Ağıl bir yapıdır (tarifi kazanda öğrenilir: 10 Çit); malzemesini götürünce **Usta Sinan** kurar, oyuncu istediği yere koyar (3 × 3 karo). Ağıla dokununca **ağıl penceresi** açılır: kimin yanında kimin ağılda kalacağı seçilir, baygın binek ayağa kaldırılır, ölen yoldaşların adları okunur. Pencerenin dışına basmak kapatır.
- **Güven çubuğu:** sevdiği yiyecek çantandayken canlıya yaklaşınca "Yere bırak: …" çıkar; yiyeceği **yere bırakırsın** ve en az ~80 piksel geri çekilip beklersin. Canlı yanında biri varken yemez; gelir, 2 sn yer, başının üstündeki **güven çubuğu** (kalp) %25 dolar. Bir besleme ile sonraki arasında en az **1 oyun saati** geçmeli (evcilleştirme bir güne yayılır). Yakınında (~160 piksel) koşarsan, ona vurursan ya da üstüne yürürsen ürker, çubuk %30 iner; çubuk boşken kaçarsa o gün bir daha yanaşmaz. 4 beslemede (%100) evcilleşir.
- **Yavru yolu (savaşçılar):** her savaşçı türünün kendi biyomunda bir **ini** vardır (yeri haritada gösterilmez; Davut anlatır). Anne inin yanındayken yaklaşılmaz (saldırır); anne avdayken (gündüz) yavruya yiyecek bırakılır. Yavru evcilleşince seninle gelir, **2 oyun günü** içinde büyür; büyüyene kadar savaşmaz ve canavarlar ona saldırmaz.
- **İsim:** evcilleşince isim penceresi açılır (en çok 12 harf; bir öneriyle gelir). İsim konuşmalarda, yoldaşın başının üstünde ve ağılda görünür.
- **Yanında en çok 1 binek ve 2 savaşçı** dolaşır; ötekiler ağılda bekler. Ağılda kimin yanına geleceği seçilir.
- **Seviye yok (Boğaç):** yoldaşlar seviye atlamaz, güçlenmez; her türün değeri sabittir.
- **Savaşçı:** 30–60 piksel arkanda yürür; **senin vurduğuna** ve **sana saldırana** (~160 piksel içinde) saldırır (bütün haritayı taramaz). Kendiliğinden yavaşça iyileşir; sevdiği yiyecekle beslersen canının %40'ı dolar.
- **Savaşçı ölebilir (Boğaç):** canı biterse ölür ve geri gelmez. Adı ağıldaki küçük bir **taşa** yazılır; Davut bir sonraki konuşmada onun için tek bir söz söyler. Aynı türün ininde **3 oyun günü** sonra yeni bir yavru doğar; aynı yolla yeniden evcilleştirilir.
- **Binek:** yanına gelip **Bin** (bilgisayarda **B** ya da yanındayken E; telefonda Bin/İn düğmesi bineğin yanındayken kendiliğinden çıkar). Binince binek biraz büyük çizilir, karakter sırtında oturur. Binerken koşu enerjisi harcanmaz; vurulmaz, toplanmaz (toplamaya ya da vurmaya basınca kendiliğinden inersin). Köprülerden geçer; mağaraya, eve ve suya giremez (kapıda kendiliğinden inersin).
- **Binek ölmez, ağılda canlanır (Boğaç):** canavarlar bineğe de vurur; canı biterse yere düşersin, binek bayılıp ağıla döner. Ağılda sevdiği yiyecekten 3 tane verince yeniden ayağa kalkar.
- **Performans:** yanında en çok 3 hayvan; yoldaşlar yalnızca kendi çevrelerine bakar (performans kuralı 5).
- **Arena:** evcil hayvanlar arenada görünmez (arenada olup olmayacakları henüz konuşulmadı).
- **Mağara ve ev:** mağaraya ya da evin içine girerken bineğinden inersin; yoldaşlar dışarıda bekler, çıkınca yanına gelir.

### Zorluk

İki mod vardır. **Zor mod** yalnızca tarif keşfini değiştirir (canavarlar, açlık, ekonomi aynı):

- Tarif kitabı kapalıdır; malzemeleri görmek tarifi açmaz.
- Kazanda iki sekme olur: **Tarifle kaynat** ve **Deneyerek bul**. "Dene"ye en çok 7 farklı malzeme atılır; hiçbir şey harcanmaz. Bir malzemeye kazandayken yeniden dokununca adedi 1 artar (elindeki kadar; kazandaki çipte "×N" yazar), çipin × işareti onu kazandan çıkarır. Cevaplar yol gösterir: "yeni tarif buldun", "en yakın tarife N malzeme eksik", "bildiğin bir tarifte birlikte", "tek başına bir şey olmuyor", "yanlış yer (örs)". Çoğu tarifin malzeme türü kümesi benzersizdir; o zaman adetler önemli değildir. Aynı malzeme türleriyle birden çok tarif varsa (ör. Tunç balta ve Tunç topuz, Tabure/Sandalye/Raf) kazan adetlere de bakar: atılan adetler bir tarifle tam tutuyorsa o tarif bulunur; tutmuyorsa "Bu malzemelerle birden çok tarif var; adetleri değiştirerek dene" der, tarifleri söylemez (en yakın tarife kaç adet fark olduğunu söyler). Malzeme türü, adedi ve yeri birebir aynı olan tarifler (Öğütme taşı ile Bileği taşı; Bakır, Çelik, Kara çelik ve Mor kristal balta ile topuzu) **birlikte bulunur**: kazan "İki tarif buldun: Bakır balta ve Bakır topuz" der, ikisi birden öğrenilir, her biri için ayrı XP verilir. Böylece her tarif kazanda bulunabilir (Boğaç: her tarif kazandan çıkar).
- Kitapta **Tarif satın al**: rastgele kapalı bir tarif 50 Vio.

## Üretim ve ekonomi

### Ekonomi

- **Satış** yalnızca Pazarcı Nazlı'ya. Birim fiyat = temel fiyat × satış çarpanı. Satış çarpanı = (1 + Ticaret yüzdesi + Değerli işçilik (yapılmış eşyada) + Toptancı (Hepsini sat) + Keşif defteri ustalığı) × seviye çarpanı; **en çok 2,3**.
- **Fiyatsız eşya satılmaz:** her eşyanın bir fiyatı olmalı; fiyatı bulunmayan bir eşya pazarda **satılmaz** ("Bu eşyayı Nazlı almıyor"), "Hepsini sat" onu atlar. Meyve ağacı odunları (Elma, Armut, Mürver) **3 Vio** (satınca Vio **NaN** oluyordu).
- **Bozuk Vio onarımı:** kayıt açılırken ya da oyun sırasında Vio sayı değilse (NaN), oyun bunu düzeltir: kayıttaki en son geçerli Vio miktarına (otomatik ve elle kayıtların içinden en yenisi, yoksa 0) döner ve "Vio’ların onarıldı" der. Görev sayaçlarındaki bozuk değerler de 0'dan sürer.
- **Miktarla satış:** Nazlı'nın satış listesinde her satırda bir **miktar kutusu** var: aşağı (▼) ve yukarı (▲) okları ile birer birer azalır/artar, ya da kutuya sayı elle yazılır; **Sat** düğmesi yazılan kadarını satar (yanında o miktarın tutarı yazar), **Hepsi** eskisi gibi tümünü. Miktar 1 ile eldeki adet arasında tutulur. Oklara (dokunmatikte de) **basılı tutunca** sayı kendiliğinden değişmeye başlar ve hızlanır: 0,4 sn sonra saniyede ~5 adım, giderek saniyede ~20 adıma çıkar; **2,5 sn'den uzun** basılı tutunca **10'ar 10'ar** değişir. Bilgisayarda kutu seçiliyken klavyenin ↑/↓ tuşları da aynısını yapar (basılı tutunca 2,5 sn sonra 10'ar). Kutuda Enter satar.
- **Tarif malzemesi satılırken uyarı:** bildiğin ya da açık olan bir tarifte kullanılan bir malzemeyi satarken (tek satır, "Hepsi", "Hepsini sat") önce bir soru çıkar: "**Emin misin?** X şu tariflerde kullanılıyor: A, B, C…" · **Evet, sat** / **Vazgeç**. Toplu satışta kaç çeşidin tariflerde kullanıldığı yazar. "**Bu malzeme için bir daha sorma**" seçeneği o malzeme için soruyu oyunun bu oturumunda kapatır (oyun yeniden açılınca yine sorar). Öğreticinin "şunu sat" adımında (parlayan düğme) soru çıkmaz. **"Kazanda işe yaramayanları sat":** bu düğme **hiçbir tarifte kullanılan** malzemeyi satmaz: ne bildiğin/açık tariflerin malzemesini ne de henüz keşfetmediğin tariflerinkini; o yüzden soru da çıkarmaz. Düğmedeki tutar da yalnızca bunları sayar. Eskiden yalnızca keşfedilmemiş tarifleri dışarıda bıraktığı için bildiğin tariflerin malzemelerini satıp yine soru soruyordu.
- **Nazlı'da üç toplu satış düğmesi (v3.33, Boğaç; "Kazanda işe yaramayanları sat"ın yerine):** üçü de **aletleri, silahları, zırhları, alet kemerine (1–5) konabilen her şeyi, yapıları ve kamp ateşini satmaz** (yalnızca malzeme ve eşya satar). Düğmede satılacakların toplam tutarı yazar; yalnızca fazla satıldığı için "Emin misin?" sorusu çıkmaz.
  1. **Aletler, zırhlar ve eşyalar hariç hepsini sat:** satılabilen her şeyin hepsini satar (eskisi gibi).
  2. **Kazandaki açık tariflere yeteni bırak:** Zümrüt'ün kazanında **şu an öğrenilebilen** (listede sarı "yeni" yazan; açık ama henüz öğrenmediğin) bütün tarifleri toplar; her malzeme için bu tariflerin hepsinin istediği adet kadarını ayırır (ör. açık tarifler toplam 19 Sap istiyorsa 19 Sap sende kalır), fazlasını satar. Bu tariflerde geçmeyen malzemenin hepsi satılır.
  3. **Bütün tariflere yeteni bırak:** aynısını **henüz öğrenmediğin bütün tarifler** için yapar (şimdi açık olanlar ve ileride açılacaklar): ör. öğrenmediğin bütün tarifler toplam 300 Taş istiyorsa ve sende 305 Taş varsa yalnızca 5 Taş satılır.
  - **Ara parçalar da sayılır (v3.36, Boğaç):** bir tarif kendisi de bir tarif olan bir parça istiyorsa (ör. Sopa), çantanda o parçadan eksik kalan kadarı yapmak için gereken malzemeler de (Sopa'nın Dal'ı, Lif'i…) ayrılır, zincir boyunca (parçanın parçası da). Elindeki hazır parçalar bu ihtiyaçtan düşülür.
  - Hesap: bir tarif bir malzemeyi "şunlardan biri" diye istiyorsa (ör. herhangi bir odun) o adet o gruptaki her malzeme için ayrılır (fazla değil, eksik satılsın diye). Öğrendiğin tarifler sayılmaz. Satıştan sonra "N çeşidin fazlası satıldı · +X Vio" yazar; satılacak fazla yoksa "Tariflerin ihtiyacından fazla satılık bir şeyin yok." 
- **Şanslı müşteri** satışta %5 (II ile toplam %12) + şans ihtimalle iki kat öder.
- **Satın alma:** yalnızca Nazlı, yalnızca daha önce eline geçmiş **doğal** malzemeler (tohumlar dahil). Alış fiyatı temel fiyatın 2,6 ile 5,6 katı arası (pahalı ve tehlikeli bölge malzemesi daha pahalı).
- Başka hiçbir kişi Vio’yla eşya satmaz; ustalar malzemeyi senden alıp **işçilik** ister: Dursun, Durmuş ve silahçı/zırhçı kuzenleri eşya fiyatının %15'i (en az 2), Sinan %20'si (en az 3), ACT 2 ustaları sabit ücret. Alet bilemenin tam ücreti aletin değerinin onda biri, silahlarda beşte biri; ödenen, aletin ne kadar körelmiş olduğuna göre o kadarı (bkz. Aletler, dayanıklılık, kademe). Usta Sinan evleri de Vio’yla yapar.
- **Robot köpekler ne toplar (9 Kasım 2026, Boğaç: "robota neden havuç toplatamıyorum; benim yerden toplayabildiğim şeyleri taşıması gerekmiyor mu"):** elle yerden toplayabildiğin **her şeyi** (dal, taş, bitkiler, meyveler, Havuç, mantarlar, kil… hangi biyomda olursa olsun); yalnızca kazma isteyen madenleri ve mağaradakileri toplamaz. Köpek menüsünde yalnızca daha önce eline geçmiş olanlar seçilebilir (Dal her zaman).
- **Robot köpeklerin taşıma kapasitesi:** köpekler topladıklarını artık hemen envanterine koymaz; **sırtlarında en çok 20 eşya** taşırlar. Sırtı dolan köpek işi bırakıp **sana koşar**, yanına gelince taşıdıklarını teslim eder: köpeğin üstünde küçük "+8 Dal", "+12 Taş" gibi satırlar belirir, ekranda "Karabaş getirdi: +8 Dal, +12 Taş" bildirimi çıkar ve eşyalar ancak o anda envantere geçer; sonra köpek işine döner. Köpekler menüsünde her köpeğin **taşıdığı** (ör. "taşıdığı: 7/20 · 4 Dal, 3 Taş") görünür. Sırtı dolmadan **Yanıma çağır** dersen köpek gelir ve o ana kadar topladığını yine aynı şekilde teslim eder. Taşınan eşyalar kayda yazılır; eski kayıtta köpeklerin sırtı boş başlar.
- **Temel fiyat** formülü: malzemelerin toplam değeri × (1,15 + 0,05 × zincir adımı, en çok 6) + gereken aletin değerinin %10'u.

### Tarifler: kazan, el yapımı, örs, ustalar

- **Kazan yalnızca öğretir:** malzemeleri koyup kaynatırsın, malzemeler gider, tarif öğrenilir (+12 XP); ürün çıkmaz. ACT 1'de Zümrüt'ün ve beş kuzen cadının (Yakut, Safir, Firuze, Mercan, İnci) kazanları, ACT 2'de Yıldız'ın kazanı. Bütün ACT 1 kazanları aynı tarifleri öğretir.
- **Kazanda öğrenilenler aşağıda (v3.36, Boğaç):** kazanın tarif listesinde her grubun içinde **öğrenilmiş** (yeşil, "öğrenildi") tarifler en alta iner; henüz öğrenilmemişler üstte kalır. Listenin en üstünde **"Öğrenilenleri gösterme"** kutusu vardır: işaretlenince öğrenilmiş tarifler listede hiç görünmez; kaldırılınca geri gelir. Seçim bu cihazda hatırlanır. (Örsteki listeye dokunmaz; orada yalnızca dövebildiklerin görünür.) **Liste yerinde kalır (v3.36, Boğaç):** listenin aşağısından bir tarif seçince (ya da malzeme koyunca, pencere yenilenince) sol liste en başa kaymaz, olduğu yerde kalır; aynısı örs ve sağdaki malzeme kutuları için de geçerlidir. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **Tarif kitabı** (K): bir tarif öğrenilmiş, bir kişi tarafından kitaba yazılmış ya da (Normal modda) bütün malzemeleri ve aletleri en az bir kez görülmüşse **açık** görünür. Kapalı tariflerin adı titreşen harflerle, bilinmeyen malzemeler "?" ile görünür. **Seçilen tarifin kutusu hep görünür (v3.37, Boğaç):** kitabın en üstündeki, seçilen tarifin adını, malzemelerini ve nerede yapıldığını gösteren kutu sayfa aşağı kaydırılınca da yukarıda sabit kalır; aşağıdaki bir tarife dokunduğunda ya da üstüne geldiğinde adı yerinden kaymadan görünür. Kitapta bir tarife **Takip et** dersen malzemeleri ve elindeki sayıları ekranın üstünde görürsün (aynı anda 1 tarif).
  - **Bilgi kutusundaki silah/zırh özellikleri (9 Kasım 2026, Boğaç: "ekranın yarısını silahın özellikleri kapatmış"):** silah ya da zırh tarifinin üstüne gelince özellikleri (hasar, vuruş/sn, menzil, kritik, keskinlik; zırhta savunma, yuva, direnç) malzemelerin altında **tek sıra küçük kartlar** olarak yazar; resmin altına sığdırılmaz, kutu kısa kalır.
  - **Tarif kitabının bilgi kutusu hep aynı boyda (10 Kasım 2026, Boğaç: "hepsi benzer şekilde gözükmeli, aşağı yukarı kaymamalı"):** tarif kitabında hangi karenin üstüne gelinirse gelinsin bilgi kutusu **aynı yükseklikte** durur; altındaki kareler yukarı aşağı kaymaz. Kapalı tarifte de silahın özellikleri açık tarifteki gibi malzemelerin altında küçük kartlarla yazar (resmin altına sıkışmaz).
  - **Listede düğmeler kaymaz (10 Kasım 2026, Boğaç: "bunlar böyle sağa kaymamalı"):** El yapımı ve kazan listelerinde bir silah ya da zırh satırının üstüne gelince adının altında çıkan özellik satırı, adın sütununa sığacak şekilde alt satıra geçer; satır genişlemez, Takip et / ×5 / Hepsi / Yap düğmeleri yerinde kalır ve liste yana kaymaz.
  - **El yapımında özellikler kartta (10 Kasım 2026, Boğaç: "el yapımındaki bu hasar şeylerini de açılan karta taşı, alta satır olarak ekleme"):** El yapımı listesinde silah ya da zırh satırının altına özellik satırı **eklenmez**; özellikler (hasar, vuruş/sn, menzil, kritik, keskinlik; zırhta savunma, yuva, direnç) üstüne gelince açılan **malzeme kartında**, malzemelerin altında yazar (telefonda dokununca açılan malzeme kutusunda). Satır yüksekliği değişmez, liste oynamaz.
- **El yapımı (Tab):** öğrenilmiş ve örste dövülmeyen, yapı ya da ev eşyası olmayan her tarif. Yap / ×5 / Hepsi. Düğme düzeni: aşağıda "El yapımı düğmeleri".
- **Tarifteki alet yerine daha iyisi:** bir tarif alet olarak "Taş balta" istiyorsa **her balta** (aynı ya da daha yüksek kademeli) yeter; kazma için de aynısı. Tarif ekranında "Alet: Taş balta ya da daha iyisi · Demir balta" gibi görünür. Alet tarifte harcanmaz. (52 tarif Taş balta istiyor: kalaslar, saplar ve benzerleri.)
- **"Herhangi" parçalar kalktı:** hiçbir tarif grup istemez; kazan ve örsteki **+** düğmesi tarifin istediği parçayı yapar (bkz. Tarifler › "Herhangi" yok).
- **El yapımı listesi sıkı (v3.37, Boğaç: "koskoca ekranda 3 tarifi görmemeliyim"):** her tarif **tek satırdır**: **solda** küçük resim ve tarifin adı ("· sende 5" ile), **sağda** küçük düğmeler (Takip et · ×5 · Hepsi (n) · Yap; Kamp ateşinde Yak; 7 Kasım 2026, Boğaç: "tariflerin ismini sola, yap butonunu sağa alalım"), satırın yüksekliği yaklaşık bir düğme kadar; ekranda alt alta 12–15 tarif görünür. **Malzemeler** satırda yazmaz (yeşil: yeterli, sarı: eksik parça elle yapılabilir, kırmızı: eksik; meşalelerde "x dk yanar"). **Bilgisayarda (9 Kasım 2026, Boğaç: "yazılar üst üste binmemeli, yapın üzerine gelince ufak bir kart ile gösterilebilir"):** satırın ya da **Yap** düğmesinin üstüne gelince malzemeler, Yap düğmesinin hemen üstünde (yer yoksa altında) duran, kenarlı ve gölgeli **küçük bir kartta** görünür; kart satırların yazılarıyla karışmaz (opak, en üstte). **Telefonda** tarifin adına dokununca satırın hemen altında küçük, opak bir kutuda açılır. Yapılamayan tarifin adı soluktur.
- **El yapımı kategorili (10 Kasım 2026, Boğaç: "el yapımı şeyleri de kategorize eder misin, silahlar, zırhlar vs."):** liste başlıklara ayrılır, sırası: **Silahlar** (yay, sapan, bola, asa, ateşli silah ve mermisi, el yapımı savaş çekici ve topuz), **Zırh ve giyim**, **Aletler** (olta, ağ, kova, tuzak, kürek, tırmık…), **Ateş ve ışık** (ateş, kamp ateşi, meşale, mum, kav), **Yiyecek ve şifa**, **Büyü ve tılsım**, **Yapılar ve ev eşyası** (çit, yol, zemin, korkuluk), **Taşıtlar** (sal, kano, kızak, gemi), **Süs, boya ve müzik**, **Zanaat** (kaşık, kase, sepet, tulum…), **Malzemeler** (keskin taş, ip, sopa, kalas, sap, kömür, külçe, kil işleri ve öbür ara parçalar). Boş başlık gösterilmez. Her başlığın içinde önce şu an yapabildiklerin, sonra öbürleri (adlarına göre) gelir; arama yapınca da başlıklar kalır.
- **El yapımı düğmeleri:** Her satırda aynı düğmeler **aynı sırada ve aynı genişlikte** durur, böylece alt alta tek sütun olurlar: satırın sağında **Takip et · ×5 · Hepsi (n) · Yap**; **Yap en sağdadır** (9 Kasım 2026, Boğaç: "yap butonu en sağa alınabilir"; Kamp ateşinin **Yak** düğmesi de en sağda); **solda** resim, tarifin adı ve "sende N". Basılabilen düğme renkli, basılamayan (malzeme yetmiyor, 5'e yetmiyor, birden fazla yapılamıyor) soluk ama yerinde durur; düğmeler satırdan satıra kaymaz. Yapılamayan tarifin yalnızca adı ve malzemesi soluk görünür. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **El yapımında renkler (v3.36, Boğaç):** tarif satırındaki her malzeme yeterliyse **yeşil**, yetmiyorsa **kırmızı** yazar; ama eksik bir parçayı (ör. Sopa) elindekilerden önce yapıp tarifi tamamlayabiliyorsan (Yap düğmesi açık) o parça kırmızı değil **sarı** yazar ve yanında "yapılır" der: Yap'a basınca önce o parça yapılır.
- **Takip:** en çok **3 tarif** birlikte takip edilir; ekranın üstündeki şeritte en yenisi en üstte durur (telefonda 2 satır görünür). 4. tarif takibe alınınca en eskisi bırakılır ve bildirim çıkar. **Şeritte Yap:** takip edilen tarif **elle yapılabiliyorsa** (öğrenilmiş, örste dövülmeyen, yapı ya da ev eşyası olmayan) ve bütün malzemeleri tamamsa satırda yeşil **Yap** düğmesi çıkar; basınca el yapımı ekranı açılmadan yapılır. Kazanda öğrenilecek ya da örste dövülecek tariflerde Yap çıkmaz. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
- **Takip şeridi küçük simgeler (9 Kasım 2026, Boğaç: "emojiler şeklinde küçük küçük yap, üstüne gelince ne olduğu şık bir tasarımla okunsun; görevin üstüne binmesin"):** şeritte yazı yoktur: her takip edilen tarif bir satırdır; satırın başında tarifin **resmi**, yanında her malzemenin **küçük kare resmi** ve köşesinde sayısı (ör. 0/2; tamamsa yeşil çerçeve ve ✓). Satır köşeleri hafif yuvarlak, koyu yarı saydam; tarif hazırsa satırın çerçevesi yeşil. Bir resmin üstüne gelince (telefonda dokununca) koyu, solunda mavi şerit olan şık bir kart çıkar: malzemenin ya da tarifin adı, sende kaç tane olduğu ve nereden geldiği. Şerit küçük olduğu için sağ üstteki görev kartının üstüne binmez. Yap, + ve × düğmeleri yine satırın sonundadır.
- **Takip şeridi düzenli (v3.38, Boğaç: "düzensiz duruyorlar, alt alta gelsin kutucuklar; uzun olanları kısalt, üstüne gidince tam adı yazar"):** takip edilen tariflerin satırları aynı genişliktedir ve kutucuklar **sütun sütun alt alta** durur: solda tarifin adı (sabit genişlik), sonra her malzeme aynı genişlikte bir kutucukta (resim, ad, sayı; yanında + düğmesinin yeri boş olsa da ayrılır), en sağda ×. Sığmayan adlar "…" ile kısalır; üstüne gelince (telefonda dokununca) tam adı görünür.
- **Takip şeridi kıpırdamaz, en çok malzemeli tarif üstte (v3.39, Boğaç: "+1 dal, +1 lif bildirimi takip edilenleri sağa sola kaydırıyor; en fazla malzeme içereni en üstte göster"):** şeridin yeri yalnızca takip edilen tarifler ya da malzemeleri değişince yeniden hesaplanır; bir şey toplayınca (sayılar, "hazır", Yap düğmesi) şeridin sol kenarı yerinde kalır, şerit sağa sola kaymaz. Takip edilen tarifler (en çok 3) **malzeme sayısına göre** sıralanır: en çok malzemesi olan en üstte (eşitse son eklenen üstte). Bu yalnızca görünüştür: 4. tarif eklenince yine **en eski eklenen** takipten çıkar, kalanlar yeniden sıralanır.
- **Takip şeridinde + ile parça yapmak (v3.36, Boğaç):** takip ettiğin bir tarifin eksik bir parçası kendisi elle yapılan bir tarifse (ör. Sopa, İp, Keskin taş) ve onu şu an elindekilerden yapabiliyorsan, şeritte o parçanın kutusunun yanında küçük bir **+** düğmesi çıkar. Basınca eksik kadarı (yapabildiğin kadar) hemen yapılır; gerekirse onun da parçaları önce yapılır (kazandaki + gibi zincirle). Yalnızca **öğrendiğin ve elle yapılan** tarifler bu yolla yapılır (örste dövülenler, yapılar ve aletler hariç). Ekranda "2 Sopa yapıldı (önce: Keskin taş)" yazar.
- **Örs:** aletler ve silahlar Demirci Dursun'da ve silahçı kuzenlerinde, örste dövülen zırhlar Zırhçı Durmuş'ta ve zırhçı kuzenlerinde. **Kademe kuralı:** her demirci yalnızca kendi biyomunun ve öncekilerin malzemesiyle yapılan eşyaları döver (Dursun/Durmuş: yalnız Çayır); kuralın tamamı bu maddenin altında; kuzenlerin tanıtımı "ACT 1 › Kişiler › Zümrüt, Dursun ve Durmuş'un kuzenleri" bölümünde. Örs listesinde bir ara parçanın yanındaki **+** o parçayı elindeki malzemeden hemen yapıp örse koyar. **Seçili tarif başka örse taşınmaz:** bir demircinin örsünde seçtiğin tarif (ör. Dursun'da Taş balta), o eşyayı dövmeyen başka bir demircinin örsü açılınca (ör. Durmuş) seçili kalmaz: seçim kalkar, örse koyduğun parçalar envanterine döner ("N malzeme envanterine döndü"). Her örste yalnızca o demircinin dövdüğü eşyalar seçilebilir. (Satır düzeni: Sistemler › Arayüz ve pencereler › Tarif ve sipariş listelerinde satır düzeni.)
  - Her örsün bir **kademesi** vardır: Dursun ve Durmuş **0 (Çayır)**, Orman kuzenleri 1, Bataklık 2, Kayalık Dağ 3, Kül Diyarı 4, Mor Kristal Vadisi 5.
  - Bir eşyanın kademesi, **ana malzemesinin** en erken toplanabildiği biyomdur: malzeme zincirinin içindeki her ham maddenin ilk çıktığı biyomlardan en ileridekidir. Deri parçası bu hesaba katılmaz (her zırhın astarıdır; her biyomun hayvanından düşer, tabaklama yoktur). ACT 2 malzemeli zırhlar (²) kademe 0 sayılır, Durmuş ve bütün zırhçılar döver.
  - Bir demirci **kendi kademesindeki ve altındaki** bütün eşyaları döver; ayrıca **kendine özel** eşyaları vardır. Yani Dursun ile Durmuş yalnızca Çayır malzemesiyle (taş, çakmaktaşı, çakıl, bakır + kalay = tunç…) yapılanları döverken, bir sonraki biyomun kuzenleri o biyoma özgü silah ve zırhları da döver. Silahçılar alet ve silah, zırhçılar zırh döver.
  - Örs panelinde, öğrendiğin ama o demircinin kademesini aşan eşyalar üstte bir notla listelenir: "… bunları dövemez: Demir kılıç → Silahçı Ali (Bataklık)". Kazanda bir örs tarifini öğrenince çıkan mesaj da onu dövebilen **ilk** demircinin adını söyler.
- **Usta Sinan:** yapılar, yataklar, ev eşyaları ve Atölye (bkz. ACT 1 › Kişiler › Usta Sinan).
- **Zümrüt'ün bilmecesi:** bkz. ACT 1 › Kişiler › Cadı Zümrüt (Bilmece).

### Aletler, dayanıklılık, kademe

- Her toplama, isabet ya da balık aletin 1 kullanımını yer. Dayanıklılık rengi yeşilden kırmızıya döner; sıfırda alet çalışmaz, silah yumruk gibi vurur. **Bileme** (Dursun ve silahçı kuzenleri): aletin değerinin onda biri. Kova ve asalar/ateşli silahlar körelmez.
- **Körelmiş aletle F (v3.36, Boğaç):** elindeki balta ya da kazma tamamen körelmişse (dayanıklılığı 0) **F** (topla) ağaca ya da madene yönelmez; aletin hiç yokmuş gibi yerdeki eşyaya, bitkiye ya da yakındaki başka bir şeye yönelir (eskiden körelmiş baltayla ağaca gidip boşuna "köreldi" diyordu).
- **Alet yuvaları:** 5 (Alet kemeri dalıyla 6/7/8/10/12). Yuva doluysa yeni alet yere düşer; yerdeki eşya 180 sn sonra kaybolur.
- **Mıknatıs:** yere düşen küçük eşyalar (yeni düşenler yarım saniye bekler) **21 px** yakına gelince sana doğru süzülür 10 px içinde hızla çekilir, 6 px'te toplanır; F ile 28 px içindekiler alınır; **F beklemez** (9 Kasım 2026, Boğaç: "leş yere düşer düşmez F ile toplayabilmeliyim"): öldürülen canlının, kırılan dalın düşürdükleri daha havadayken bile (düşecekleri yere 28 px yakınsan) F ile hemen alınır. Yalnızca senin yere bıraktığın eşya bir an bekler.
- **Ağaç kesince dal ve yaprak düşer:** baltayla her kesişte ağacın odununun yanında **1 Dal** ve **1 Yaprak** düşer (Söğüt'ün söğüt dalı ve meyve ağaçlarının meyvesi eskisi gibi ayrıca düşer).
- **Yerdeki yaprak daha küçük:** dünyada yerde duran toplanabilir **Yaprak** eskisinin **%70'i** boyunda çizilir (gölgesiyle birlikte). Toplama mesafesi, envanter simgesi ve sayıları değişmez.
- **İş çubuğunun yazısı:** balta ile ağaç keserken "**Kesiliyor: Çam ağacı**" (ağacın adı), kazma ile kazarken "**Kazılıyor: …**", öbür toplamalarda "Toplanıyor: …" yazar.
- **Balta ve kazma kademesi (ayrıntı: Aletler · Bütün setler):** Taş, Çakmaktaşı, Bakır 1 · Granit, Tunç 2 · Demir, Timsah dişi 3 · Kuvars, Çelik 4 · Kara çelik, Ejder 5 · Mor kristal, Obsidyen 6.
  - Ağaçlar biyoma göre: Çayır ve Orman 1 (Çam, Kavak, Elma, Armut, Meşe, Ladin, Kayın, Ihlamur, Ceviz) · Bataklık 2 (Söğüt, Kızılağaç, Dişbudak, Mürver, Bataklık servisi) · Kayalık Dağ 3 (Akçaağaç, Huş, Porsuk, Kestane, Ardıç) · Kül Diyarı 4 (Kül ağacı, Kızıl sedir, Kara çam, Dikenli akasya, Ateş narı) · Mor Kristal Vadisi 5 (Mor söğüt, Gece ağacı, Işık ağacı, Yıldız eriği, Ay elması) · ACT 2: Yüzen Kayalar ağaçları 1, diğerleri 2 (değişmedi).
- **Kazma kademesi** (aynı sıra, biyoma göre): Çayır ve Orman 1 (Kireçtaşı, Kumtaşı, Bakır, Granit, Taş kömürü, Kalay) · Bataklık 2 (Arduvaz, Tuz kayası, Demir) · Kayalık Dağ 3 (Pirit, Kuvars, Gümüş) · Kül Diyarı 4 (Bazalt, Kükürt, Obsidyen) · Mor Kristal Vadisi 5 (Kristal, Ametist, Altın). Bir maden damarı 3–5 vuruşta tükenir, 300 sn sonra yeniden dolar.
- **Maden kayaları geçilmez:** yerdeki maden kayalarının (cevher damarları; çizimleri öbür toplanabilirlerin iki katı büyüklüğünde, yaklaşık 32 × 28 piksel) **çiziminin çevresi** bir duvardır: kayanın görünen şekline uyan basamaklı bir sınır (alt kısmı 32, ortası 24, tepesi 14 piksel geniş; tepeden tabana 28 piksel) ve çevresinde 5 piksellik pay. Karakter de canavarlar da kayanın görseline giremez; kayanın arkasından (üstünden) geçerken ayakların kayanın tepesinin üstünde durur. Eskiden yalnızca tabandaki küçük bir elips engeldi (çizimin üst yarısının içine yürünebiliyordu) ve oyun açıldıktan sonra yerleşen kayalar hiç engel olmuyordu; artık her kaya, ne zaman çıkmış olursa olsun engeldir. Kazılıp tükenen kaya engel olmaz. Karakter bir kayanın içinde kalmışsa (eski kayıt) kendiliğinden kayanın hemen altına (orası doluysa üstüne, sonra yanına) alınır; bu üçü de ağaç ya da başka bir engelle doluysa çevresindeki en yakın boş yere alınır (çeyrek saniyede bir bakılır). Tükenip başka yerde yeniden çıkan kaya da **çıktığı anda** engel olur (önceden bir buçuk saniye kadar içine girilebiliyordu). **Toplanabilirler kayanın üstünde çıkmaz:** dal, taş, lif, ot, meyve gibi toplanabilirler bir maden kayasının çizim alanına (aynı sınır + 5 piksel) yerleşmez; yeniden çıkarken de kayanın üstüne düşmez. Ada kurulurken ya da sonradan bir kayanın üstüne denk gelmiş olan toplanabilir, ekranın dışındayken başka bir yere taşınır.
- **Yeniden doğma kendi biyomunda:** tükenen her toplanabilir (bitki, taş, dal, maden) yeniden doğarken **ilk doğduğu biyomda** boş bir yer seçer; Bataklık'ta biten demir cevheri yine Bataklık'ta çıkar, Orman'a kaymaz. Canlılar da yalnızca oyuncunun bulunduğu biyomun kendi canlılarından doğar ve o biyomun dışına çıkmaz (Canavarlar bölümü).

### Zırh ve durum etkileri

- Yedi yuva: baş, gövde, eller, ayaklar, silah, boyun (kolye), yüzük (Aletler › Kolye ve yüzükler). Giyilen eşyaların toplamı **savunma**dır; Keşif defterinin Giyim ve Zırh ustalıkları +5'er savunma verir.
- **Zırh** karakterin temel özelliğidir: **5 + 2,5 × Zırh puanı** (seviye puanlarıyla artar; Sistemler › Gelişim) + Dayanıklılık ağacındaki Zırh I–IV yetenekleri (+5 / toplam +12 / +20 / +30). Eşyaya bağlı değildir, hiç çıkmaz.
- Alınan **fiziksel hasar × 25 / (25 + savunma + zırh)**. Zehir, yanık ve kanama da bu oranın yarısı kadar yumuşar. Karakter ekranında "Zırh", "Savunma" ve toplam hasar azalması ayrı ayrı yazar. (Kemal'in "Savunmanı 60'a çıkar" görevi yalnızca eşya savunmasını sayar.)
- **Çamur:** Bataklık çamurunda yavaşlarsın (×0,6); Kamış çizme, Demir çizme, Çelik çizme, Kara çelik çizme, Mor kristal çizme, Hurda çizme ve Meka çizme bunu önler.
- **Durum etkileri** canavarlardan, alev/zehir gölünden ve zehirli yemekten gelir: **zehir**, **kanama**, **yanık** belirli süre saniyede can yakar; zırh bunu da yarı oranda yumuşatır. Dirençler: Demir zırh (kanama %30), Çelik zırh (kanama %35), Kara çelik zırh (yanık %40, kanama %30), Mor kristal zırh (kanama, yanık, zehir %30), Ejder zırhı (yanık %60), Mantar lifi eldiven (zehir %40), Kristal miğfer (kanama %30), Ejder pulu eldiven (yanık %40), Meka çizme (kanama %20), Meka zırh (üçü de %50); kuzenlerin zırhları: Meşe kabuk zırh (kanama %15), Timsah pulu zırh (kanama %40), Gümüş pullu zırh (kanama %35), Ejder zırhı (yanık %60), Kristal ipek zırh (üçü de %25), Işık pulu eldiven (zehir %35). Dayanıklılık ağacındaki Zehre/Ateşe/Kanamaya dayanıklı yetenekleri ilgili hasarı ayrıca %40 azaltır (çarpılarak birleşir); Çelik beden üçünün süresini yarıya indirir; Son nefes canın dörtte birinin altındayken fiziksel hasarı %25 azaltır.
- **Canavarlara etki:** alevli, zehirli ve keskin silahlar ve oklar canavarı yakar, zehirler ya da kanatır (ayrıntı: Aletler · Alevli, zehirli, keskin silahlar). Meşale de eskisi gibi yakar.
- **Yemek kalkanları:** Panzehir zehri tamamen keser, Ateş kalkanı yanığı %70, Pıhtı kanamayı %60 azaltır.

### Yemek

- **Tokluk değeri:** çiğ meyve ve sebzeler 2–12 (biyom tablolarında), çiğ et 6, çiğ balık 4, közlenmiş et/balık 12–32, pişmiş yemek tarifleri 10–65 (pahalı tarif daha doyurur). Şifa tarifleri doğrudan can verir (15–60).
- **İyi etkiler** yemeğin türüne göre 60–240 sn sürer: **Güç** (+%20 vuruş: et, şiş, yahni), **Şifa** (can 3 kat hızlı: çorba, lapa), **Doygunluk** (tokluk inmez: ekmek, kek, patates), **Çeviklik** (+%12 hız: bal, şerbet), **Canlılık** (enerji 1,5 kat: çay, meyve suyu), **Gece gözü** (karanlıkta görme: mantar, balık, gece sefası), **Panzehir**, **Ateş kalkanı**, **Pıhtı**. Nadir pişmiş yemeklerde ek **Dayanıklılık** (can sınırı +%20).
- **Toplanan yiyecekler biyom biyom iyileşir ("her biyomda daha iyi statlı yiyecekler bulmalıyız, hem tokluk hem özellik"):** ileriki biyomun yiyeceği hem daha çok doyurur hem etkisi daha uzun sürer hem de daha çok can verir. Orman'dan başlayarak zehirsiz her toplanan yiyecek biyom başına **+3 can** verir (Orman 3, Bataklık 6, Kayalık Dağ 9, Kül Diyarı 12, Mor Kristal 15, ACT 2'de 18–21); bazılarının ayrıca ek canı vardır. Etki süresi: Çayır **60 sn**, Orman 90, Bataklık 120, Kayalık Dağ 150, Kül Diyarı 180, Mor Kristal **210 sn** (ACT 2'de 240–270).

| Biyom | Yiyecek · tokluk · etki (anında can) |
|---|---|
| Çayır | Böğürtlen 5 (+4 can) · Yaban çileği 6 Çeviklik · Yabani armut 7 Doygunluk · Yabani elma 7 Canlılık (+2 can) · Havuç 5 Gece gözü |
| Orman | Ahududu 9 Şifa · Yaban mersini 9 Gece gözü · Fındık 8 Güç · Ceviz 8 Dayanıklılık · Yabani bal 12 Çeviklik (+7 can) · Akçaağaç özsuyu 8 Canlılık · Yabani nohut 7 · Yabani nohut 7 (hepsi +3 can) · Kanlıca 8, Kuzukulağı 7, Meşe palamudu 6 (zehirli, can vermez) |
| Bataklık | Kızılcık 12 Pıhtı · Su kestanesi 12 (+14 can) (+6 can) · Dut 11 Çeviklik (+6 can) · Mürver 11, Sinek mantarı 11 (zehirli) |
| Kayalık Dağ | Alıç 15 Şifa · Kestane 15 Doygunluk · Ur kekliği yumurtası 15 Güç · Kayın mantarı 14 (+9 can) · Kuşburnu 14 (+21 can) · Ardıç meyvesi 14 (zehirli) |
| Kül Diyarı | Ateş narı 19 Ateş kalkanı (+18 can) · İncir 19 Doygunluk (+16 can) · Ateş biberi 17 Güç (+12 can) |
| Mor Kristal Vadisi | Ay elması 24 Dayanıklılık (+21 can) · Yıldız eriği 22 Çeviklik · Işık mantarı 21 Gece gözü (+15 can) |
| Yüzen Kayalar (ACT 2) | Bulut elması 26 Canlılık (+22 can) · Rüzgâr eriği 26 Çeviklik (+18 can) · Gök mantarı 25 Gece gözü (+18 can) |
| Dev Mantar Ormanı (ACT 2) | Goblin eriği 29 Çeviklik · Spor elması 29 Gece gözü (+21 can) · Kök yumrusu 29 Doygunluk |
| Hurda Çölü (ACT 2) | Çöl inciri 31 Doygunluk (+24 can) · Keme 30 Doygunluk (+24 can) |
| Kristal Golem Ocağı (ACT 2) | Buz armudu 33 Dayanıklılık (+27 can) |
| Ejder Volkanı (ACT 2) | Lav narı 35 Ateş kalkanı (+30 can) |
| Gök Rıhtımı (ACT 2) | Yıldız kirazı 37 Canlılık (+37 can) |

  Ekili ürünler (Havuç Gece gözü, Kabak ve Patates Doygunluk, Soğan Panzehir, Ayçiçeği Güç) ve Gece sefası (Gece gözü) bir biyoma ait değildir, eski değerlerindedir. Pişmiş yemeklerin tokluğu malzemelerinden hesaplandığı için ileriki biyomun meyvesiyle yapılan yemek de daha doyurucu olur. Arenada yemek yoktur; etkiler arenanın etki seçicisinde aynen vardır.
- **Bütün yemeklerin etkisi var (v3.35, Boğaç: "közlenmiş şeyler yalnızca tokluk veriyor; bütün yemekler toplanabilirler gibi ek özellik versin, fiyatına uygun, her biyomda daha kaliteli etkiler ve satış değerleri"):** yenebilen **her şey** (çiğ et ve balık, közlenmiş/pişmiş/kızarmış/kavrulmuş/haşlanmış/kurutulmuş/tütsülenmiş her şey, bütün yemek tarifleri, deniz balıkları ve yemekleri, ekili ürünler) tokluğun yanında **en az bir iyi etki** ve **can** verir. Kural:
  - **Kademe (biyom):** her yemeğin bir kademesi vardır: Çayır 0, Orman 1, Bataklık 2, Kayalık Dağ 3, Kül Diyarı 4, Mor Kristal Vadisi 5; ACT 2'de Yüzen Kayalar 6, Dev Mantar Ormanı 7, Hurda Çölü 8, Kristal Golem Ocağı 9, Ejder Volkanı 10, Gök Rıhtımı 11. Toplanan yiyecek kendi biyomunun, avın eti avlandığı biyomun kademesindedir; közlenmiş/pişmiş bir şey çiğinin kademesinde, bir tarif malzemelerinin en yükseğindedir. Biyomu belli olmayanlar (balıklar, deniz ürünleri, ekili ürünler, mağara avları) fiyatından kademelenir: 6 Vio’nun altı 0 · 10'un altı 1 · 16'nın altı 2 · 25'in altı 3 · 40'ın altı 4 · 60'ın altı 5 · 90'ın altı 6 · 130'un altı 7 · üstü 8.
  - **Etki türü** (yemeğin kendi etkisi yoksa): et → **Güç**; balık ve deniz ürünü → **Gece gözü**; yumurta → **Dayanıklılık**; kuruyemiş, tahıl, baklagil, maya, yağ → **Doygunluk**; bal, reçel, komposto, ballı tatlı → **Çeviklik**; salata, yeşillik, çiğ meyve, sebze → **Canlılık**; mantar → **Gece gözü**; hiçbiri değilse **Doygunluk**. Pişmiş (közlenmiş ya da tarifle yapılmış) yemek kademe 3 ve üstündeyse ikinci etki olarak **Şifa**, kademe 5 ve üstündeyse ayrıca **Dayanıklılık** verir.
  - **Süre:** 60 sn + kademe başına 30 sn (Çayır 60 sn … Mor Kristal 210 sn … Gök Rıhtımı 390 sn); pişmiş yemekte +30 sn; en çok 420 sn.
  - **Can:** çiğ yiyecek kademe × 3 (zehirliler hariç; eskisi gibi); pişmiş yemek 4 + kademe × 5 (tariflerin eski can bonusundan hangisi büyükse).
  - **Satış değeri:** her yiyeceğin fiyatı kademesiyle artar: fiyat × (1 + 0,15 × kademe) (Çayır aynı, Orman +%15 … Mor Kristal +%75, Gök Rıhtımı +%165). Pişmiş yemeklerin tokluğu fiyatlarından hesaplandığı için ileriki biyomun yemeği biraz daha da doyurur.
- **Kötü etkiler** ucuz ve garip yiyeceklerde (ihtimal ucuzda %90, pahalıda %20): Ağırlık (−%20 hız), Halsizlik (enerji yarı hızda), Bulantı (can yenilenmez), Güçsüzlük (−%20 vuruş). Çiğ et ayrıca %35 ihtimalle 4 can yakar.
- **Zehirli yiyecekler:** Mürver, Meşe palamudu, Sinek mantarı, Kurt eti, Kurbağa (çiğ), Kuzukulağı, Kanlıca, Ardıç meyvesi. Bir kez yiyince listede "zehirli!" yazar.
- Bir yemeği ilk kez yiyene kadar listede etkisi "Bilgim yok" görünür.
- **Yemek listesi kategorili:** yemek listesi (yemek düğmesine basılı tut / sağ tık, bilgisayarda X'i basılı tut) artık tek uzun liste değildir. Üstte **kategori sekmeleri** vardır; yalnızca elinde o türden yiyecek olan sekmeler görünür ve her sekmenin yanında kaç çeşit olduğu yazar. Önce sekme seçilir, sonra o sekmedeki yiyeceğin **Ye** düğmesine basılır. Sekmeler (bu sırayla): **Meyveler** (çalı meyveleri, ağaç meyveleri, yemişler), **Sebze ve tahıl**, **Otlar**, **Mantarlar**, **Etler** (çiğ ve pişmiş), **Balıklar** (balık, kerevit, midye…; çiğ ve pişmiş), **Yemekler** (kazanda öğrenilen yemek tarifleri: çorba, güveç, reçel, kurutulmuş…), **Şifa** (merhem, çay gibi can veren tarifler), **Diğer**. Liste son seçtiğin sekmeyle açılır (o sekmede yiyecek kalmadıysa ilk dolu sekmeyle). Yemek düğmesine kısa basınca en uygun yiyeceği doğrudan yeme eskisi gibidir.

## Toplama ve tarım

### Balık tutma

- Alet: **Ağ** (en kolay), **Olta**, **Kemik zıpkın**. Eline al, suya dön, E. Şamandıra dalınca 1,05 sn içinde E (iki kez kaçırırsan balık gider), sonra gidip gelen ibre **yeşil alandayken** bir daha bas. Yürürsen ya da bir şey saldırırsa olta çekilir.
- Zor balıklar (yeşil alan dar): Mersin balığı, Turna balığı, Yayın, Alabalık, Tatlısu levreği.
- **Mevsim balığı:** her mevsimde bir türün ağırlığı aşağıdaki tablodakinin 2 katıdır (İlkbahar Alabalık, Yaz Sazan, Sonbahar Turna balığı, Kış Mersin balığı; bkz. Mevsimler).
- Her atışta %5 çöp (Dal, Yosun, Kemik), gece ayrıca %5 **Mor kıymık**.

| Sular | Ne çıkar (ağırlık) |
|---|---|
| Çayır/Orman · deniz | **kıyıdan tutulmaz**; deniz balıkları Poyraz'la denize açılınca ("ACT 1 › Gemici Poyraz ve deniz") |
| Çayır/Orman · nehir ve göl | Alabalık 28, Kızılkanat 20, Tatlısu levreği 20, Çapak 16, Sazan 14, **Tatlısu kefali 12**, Tatlısu midyesi 10, Yılan balığı 9 |
| Bataklık / Kayalık Dağ (nehir ve göl; deniz kıyısında tutulmaz) | Yayın 24, Kadife balığı 24, **Kerevit eti 22**, Turna balığı 18, Yılan balığı 12, Tatlısu midyesi 12, Sazan 10 |
| Kül Diyarı / Mor Kristal Vadisi (nehir ve göl) | Yayın 30, Mersin balığı 22, Turna balığı 22, Kadife balığı 14 |

### Tuzaklar ve balık kapanı

- En çok **6** tuzak + kapan (toplam). Haritada kahverengi kare, dolunca sarı.
- **Tuzak:** elde Tuzak, çimen ya da orman zeminde E. 110–230 sn sonra bir av düşer: Çayır/Orman'da Tavşan, Keklik, Sincap; Bataklık/Kayalık Dağ'da Ördek, Keklik, Tavşan; doğuda Tavşan. Avın normal ganimetini verir.
- **Balık kapanı** (2 Sepet + 3 İp + 1 Dal; Dursun döver): elde kapan varken yakındaki suya E, kapan suyun kenarına konur. 130–250 sn sonra **o bölgenin balık listesinden 2 balık** (yukarıdaki tablonun nehir satırları; kapan ağırlığa bakmaz, listedeki her balık eşit ihtimalle çıkar). Kerevit yalnızca Bataklık/Kayalık Dağ sularında çıkar: her çekilişte 1/7, yani bir kapan boşaltmada yaklaşık %27 ihtimalle en az bir kerevit.
- Dolu tuzağa E: av alınır, tuzak kendiliğinden yeniden kurulur ve dayanıklılığı 1 düşer (Tuzak 20, Kapan 40 kullanım). Boş tuzağa E: "Bekle" ya da "Tuzağı topla". Her av +4 XP.

### Gece buluntuları

Karanlık çökünce (gece), ışık olmayan çimen ve orman zemininde çevrende belirir, sabah kaybolur:

- **Gece sefası:** yakınında 3 tane (Kül Diyarı'nda ve Mor Kristal Vadisi'nde çıkmaz). Yenir (+5 tokluk, Gece gözü 120 sn). Zümrüt'ün görevi ve Işıkçı takası için.
- **Mor kıymık:** 1 tane (3. günden sonra 2). Işıkçı takası; Zümrüt'e 2 tane verince sıradaki anı erken gelir.
- **Ateş böcekleri:** gece sefalarının çevresinde; yalnızca görüntü.

### Tarım

> **Tarlacılık şimdilik oyunda yok** (bkz. Açıklar · İleride: Tarlacılık). Aşağıdaki eski düzen ileride geri gelirse başlangıç noktasıdır.

Bkz. "Çiftçi Ekin". Tarla 4 × 3 = 12 parsel. Adımlar (aletler çantada, E): tırmıkla hazırla → tohum ek → **sula** (yalnızca sulanmış tohum büyür; yağmur da sular) → olgunlaşınca tırpanla biç.

| Ürün | Büyüme (sulanmışken) | Hasat | Tohum fiyatı | Ürün fiyatı |
|---|---|---|---|---|
| Buğday | 60 sn | 2–4 | 3 | 8 |
| Havuç | 80 sn | 2–4 | 4 | 10 |
| Soğan | 90 sn | 2–4 | 4 | 10 |
| Patates | 100 sn | 2–5 | 5 | 12 |
| Ayçiçeği | 120 sn | 2–3 | 6 | 16 |
| Kabak | 150 sn | 1–2 | 8 | 24 |

Hasatta %45 ihtimalle 1 tohum geri gelir. Tohum Ekin'in ödüllerinden, hasattan ve (bir kez görüldükten sonra) Nazlı'dan alınır. Meyve ağaçları silkelendikten 150 sn sonra yeniden meyve verir.

## Ev, harita ve defterler

### Ev, ev içi ve döşeme

- Ev **Usta Sinan**'dan (Orman; v3.39'a kadar Marangoz Çınar) Vio’yla alınır, envantere gelir; bir yuvaya koyup yere kurarsın (Boşluk döndürür, Esc iptal). Taş ev de diğer evler gibi istediğin yere kurulur (Kemal'in yanındaki "SATILIK" arsa kaldırıldı; haritada arsa, tabela ya da arsa ipucu yoktur).
- **Evlerin görünüşü (v3.39, Boğaç: "ev eve benzesin, her ev farklı, pahalılaştıkça daha lüks"):** her ev kendine özgü çizilir ve fiyatı arttıkça daha görkemli görünür (envanterde, yerde ve kurulunca aynı resim):
  - **Yaprak barınağı** (25): çapraz dallardan bir çatma, üstü kat kat yapraklı, önünde kütük.
  - **Deri çadır** (300): direkleri tepeden çıkan, dikişli deri parçalarından konik çadır; boyalı bir şerit, açık kapı kanadı, kazıklar.
  - **Kulübe** (450): taş temel, dal örgü duvarlar, sivri saman çatı, alçak kapı.
  - **Kamış kulübe** (650): kısa kazıklar üstünde, demet demet kamış duvarlar, dik kamış çatı, kamış perdeli kapı ve küçük merdiven.
  - **Kerpiç ev** (950): sıvalı kerpiç duvarlar, düz dam ve korkuluğu, duvardan çıkan ahşap kirişler, küçük derin pencere, mavi ahşap kapı, kapıda testi ve dama merdiven.
  - **Ahşap ev** (1.500): kalas duvarlar, kiremit çatı, panjurlu pencereler, taş baca, çiçeklik, basamak.
  - **Taş ev** (2.500): yontma taş duvarlar, arduvaz çatı, dumanı tüten baca, kemerli kapı, ışığı yanan pencereler, köşede sarmaşık, taş basamaklar.
  - **Konak** (5.000): iki katlı, beyaz sıvalı ve ahşap kirişli duvarlar, kiremit kırma çatı ve iki çatı penceresi, iki sütunlu ve üçgen alınlıklı giriş, çift kanatlı kapı, ışığı yanan çok pencere, iki baca, fenerler ve çalılar.
- Yaprak barınağı dışındaki her evde **F = içeri gir**. **F önceliği (7 Kasım 2026, Boğaç: "Önce yerdeki envanter olmalı"):** F her zaman **önce yerdeki eşyayı** alır (ayağının dibindeki düşmüş eşya ve yerdeki toplanabilir; Kontroller'deki kural); yerde alınacak bir şey yoksa kişi (konuş), ev kapısı (içeri gir), kamp ateşi, kurulu tuzak ve diğerleri seçilir. İçeride ada donar (canavarlar, oklar durur) ama saat, açlık ve hava sürer. **İçeride mor ışık gelmez.**
- Üst çubukta **Döşe** / **Dışarı çık**. Döşe kipinde envanterdeki ev eşyasını seç, ızgarada bir kareye tıkla (R ya da seçili eşyanın yanındaki görünür **Döndür** düğmesi döndürür; Döndür düğmesi yalnızca kare olmayan eşyalarda, ör. 1×2, 2×3, görünür); konmuş eşyaya tıklayınca geri alırsın. Kapının önü boş kalmalı; duvar eşyaları (raf, asma fener, perde, duvar halısı, resimler) üstteki duvar şeridine, halı ve kilim zemine (üstünden yürünür), diğerleri zemine konur. Eşyalar üst üste konmaz. **Döşeme her saatte yapılabilir;** gece kısıtı yalnızca uyku içindir.
- **Ev içinde ekran:** ev içindeyken (Döşe kipi dışında da) alet çubuğu ve uyarılar odayı, kapıyı ve duvar şeridini örtmez; oda bu alanların arasına sığdırılır. Telefonda ev içinde **Vur** düğmesi gizlidir ve sol menü kapalı başlar.
- **Döşe kipinin ekranı:** Döşe kipinde oda bütün ekranı kullanır. Eşya listesi odayı örtmez, ekranın altında **yatay bir şerit** olarak durur. Alet çubuğu, sol menü ve dövüş düğmeleri gizlenir; duyurular Döşe kipi bitene kadar bekler. Telefonda (yatay) eşya şeritten seçilip odadaki kareye **dokunarak** yerleştirilir.
- **Yatak uyarısı:** "Yatağı yerleştir…" yazısı evin içine bir yatak konunca hemen kalkar.
- Ev eşyaları: yataklar (Hasır yatak 1×2, Hasırotu yatak 1×2, Ahşap karyola 2×2), lambalar (Taş lamba, Kil lamba, Asma fener), Taş/Çömlek fırını 2×1, Tabure, Sandalye, Masa 2×1, Sandık, Dolap, Raf, Halı 3×2, Kilim 2×1, Perde, Duvar halısı, Saksı, Boyalı çömlek, Kil figürin, Ana tanrıça heykelciği, Taş totem, Su testisi, Mağara resmi, Av sahnesi duvar resmi, El izi resmi. Hepsi kazanda öğrenilir ve **Usta Sinan** yapar.
- **Kupa panosu (v3.68, 8 Kasım 2026, Boğaç: Reis kupaları):** duvara asılan, **3 kare genişliğinde** ahşap bir pano (tarifi kazanda öğrenilir: 2 Odun kalası, 1 Tunç levha, 2 İp, 1 Sopa; Usta Sinan yapar; 887 Vio). Bu kayıtta yenilen **her Reis için** panoda küçük **altın bir kalkan** belirir (iki sıra, en çok 14 kalkan görünür; 14'ten fazla Reis yenilince sağ üst köşede bir yıldız parlar). Kalkanlar kendiliğinden gelir; bir Reis yenince her evdeki pano hemen güncellenir. Süstür; başka bir işlevi yoktur.

- **Ev fiyatı (tek tanım, 6 Kasım 2026, Boğaç):** aşağıdaki tablodaki fiyat, evi Usta Sinan'dan sipariş edince ödenen **toplam Vio’dur: malzeme ve işçilik dahil**, ayrıca malzeme istenmez. Fiyat seviyeyle artan bir merdivendir (Deri çadır 300 → Kulübe 450 → Kamış kulübe 650 → Kerpiç ev 950 → Ahşap ev 1.500 → Taş ev 2.500 → Konak 5.000); başka bir fiyat kuralı (alt fiyat vb.) evlere uygulanmaz. Tek istisna Yaprak barınağı: 25 Vio ve malzemesi (8 Dal, 12 Yaprak, 4 Lif). Tarifi kazanda öğrenilmiş evler (Deri çadır, Kulübe, Kamış kulübe, Kerpiç ev) kendi malzemenle de Sinan'a yaptırılabilir; o zaman yalnız işçilik ödenir (Sistemler › Ekonomi); Sinan'ın ev listesinde bu evlerin altında "Kendi malzemenle: işçilik N Vio" satırı görünür. Eşya dizinindeki fiyat, evin **satış** değeridir.
- **Konmuş eşyayı taşımak:** Döşe kipinde konmuş bir eşyaya dokununca/tıklayınca küçük bir menü açılır: **Taşı / Geri al / Döndür**. Eşya sürüklenip başka uygun bir kareye bırakılabilir; bırakılan yer uygun değilse eşya eski yerine döner.
- **İlk girişte Döşe kendiliğinden:** çantada ev eşyası varken bir eve **ilk kez** girince Döşe kipi kendiliğinden açılır (yalnızca ilk girişte).

| Ev | Seviye | Fiyat (Vio) | Oda | Not |
|---|---|---|---|---|
| Yaprak barınağı | 1 | 25 + malzeme | yok | Bir gecelik, yatak istemez |
| Deri çadır | 3 | 300 | 5×4 | |
| Kulübe | 4 | 450 | 6×4 | |
| Kamış kulübe | 5 | 650 | 7×5 | |
| Kerpiç ev | 6 | 950 | 8×6 | |
| Ahşap ev | 7 | 1.500 | 9×6 | |
| Taş ev | 8 | 2.500 | 10×7 | İstediğin yere |
| Konak | 10 | 5.000 | 12×8 | |

### Harita, işaretler, defterler

- **Görev dışı süs işaret yoktur:** haritanın keşfedilmemiş yerlerinde görevle ilgisi olmayan süs işaretleri (gelip giden "?" gibi) yoktur; haritadaki her "?" bir yan görev işaretidir.
- **Harita açıkken ekran yazıları üstüne binmez:** büyük harita açıkken gün başı yazısı ("YENİ BİR GÜN · N. Gün") ve benzeri ekran ortası duyurular harita penceresinin üstüne çizilmez; harita kapanınca gösterilir. Haritadaki yan kişi işaretleri yalnızca yan görev kuralına göre çıkar (ACT 1 › Yan görevler › Haritada yan görevler: keşfedilmiş yerde kişinin yerinde "?", keşfedilmemiş yerde yakınken sisli daire; biyom başına en çok 2).
- **Bekleyen duyurular sırayla gelir:** harita, Döşe kipi, bir ara sahne ya da bir pencere yüzünden bekleyen duyurular, engel kalkınca **sırayla** gösterilir; her biri kendi süresi kadar ekranda kalır, üst üste binmez. Açık dünyada aynı anda gelen duyurular da (ör. gün başı yazısıyla birlikte "Tarla genişledi" gibi küçük bildirimler) aynı kurala uyar: sırayla gösterilir, üst üste binmez.

- **Kazan, Demirhane ve Pazar düğmesiz:** sol menüde Kazan, Demirci ve Pazar düğmeleri, B / T / P kısayolları ve uzaktan basınca yol gösteren ok **yoktur**. Kazan Zümrüt'ün yanında kazana dokunarak, demirhane Dursun'la (ya da kuzen demircilerle) konuşarak, pazar Nazlı'yla konuşarak açılır; yerlerini oyuncu kendisi bulur (öğreticinin ve görevlerin kendi okları sürer).
- Sağ altta küçük harita; **M** büyük harita (tekerlek, sürükleme ya da +/− ile yakınlaştır). Geçtiğin yerin çevresi açılır (Kâşif gözü ile iki kat). Gece harita kararır ama kişiler görünür.
- **Telefonda büyük harita:** küçük haritaya dokununca açılan büyük harita pencerenin bütün boşluğunu kaplar (adanın en-boy oranıyla, sığan en büyük boy). Renk açıklamaları ve bilgi yazısı (keşif yüzdesi, nasıl kaydırılır) haritanın altında yer kaplamaz; sağ üstteki +, −, ◎ düğmelerinin altındaki **i** düğmesiyle haritanın üstünde açılıp kapanır (varsayılan kapalı, keşif yüzdesi açıklamanın ilk satırında). Bilgisayarda değişiklik yok.
- **N** bulunduğun yere işaret koyar (ad + 5 renk, en çok 40). Büyük haritada bir kişinin simgesine dokununca ok onu gösterir; varınca, ✕ ile ya da **sağ tıkla** kalkar. Kendi işaretinde "Yol göster".
- Haritada: bayıldığın yerler (kurukafa), kurduğun ev/yatak/tuzaklar, kişiler.
- **Haritada kendi işaretin sabittir:** haritadaki (küçük ve büyük) kendi yüzünün çevresindeki sarı hale **yanıp sönmez**, hep açık durur (eskiden saniyede üç kez açılıp kapanıyordu).
- **Haritada deniz baştan açıktır:** küçük ve büyük haritada **bütün deniz karoları** (adayı çevreleyen deniz) keşfedilmemiş gri dumanla örtülmez; baştan görünür. Yalnızca kara, nehir ve göl keşfedilince açılır. Bu yalnızca **çizimdir**: deniz karoları "keşfedilmiş" sayılmaz, bu yüzden keşif yüzdesi, "Adayı tanı" adımı ve Kâşif başarımı eskisi gibi karadan hesaplanır.
- **Duraklatınca hava ve ortam durur:** Esc menüsü (ya da oyunu durduran herhangi bir pencere: harita, yetenek ekranı vb.) açıkken arkadaki oyun **tamamen donar**: yağmur damlaları, sis kayması, ateşböcekleri, havadaki toz/yaprak gibi ortam hareketleri ve yağmurun su halkaları da durur; menü kapanınca kaldığı yerden sürer (eskiden menüde yağmur ve sis akmaya devam ediyordu). Çizim yine yapılır, yalnızca zaman ilerlemez.
- **Görevi olan kişiler büyük haritada parlar:** görev veren her kişinin simgesinin üstünde **!** yazar ve simge parlar (henüz tanışmadığın kişi de: görevi varsa haritada yeri görünür; 9 Kasım 2026, Boğaç: "Çoban Davut'un görevi varsa haritada işaretlenmeli") (arkasında sarı bir ışık ve dışa doğru açılan iki sarı halka); haritayı açan nereye gideceğini hemen görür. Başka görev işareti yoktur (kural: ACT 1 › Ana görevler › Temel kurallar, 2. madde). Şu an üstünde çalıştığın görevin kişisi ayrıca sarı zeminli işaretle gösterilir.
- **Keşif defteri** (Kitap): her tarif kategorisinde yaptığın tariflerin oranı. **%25** → Vio, **%50** → kalıcı **ustalık**, **%100** → Vio + 100 XP. Ustalıklar: Yiyecek (tokluk %20 yavaş iner), Şifa (can 1,5 kat hızlı), alet kategorileri (%20 körelmeme), Giyim ve Zırh (+5 savunma), Ateş (meşale %30 uzun), Ağaç (odun %20 hızlı), Taş ve kil (%20 hızlı), Av ve hayvan (ganimet +%10); diğerleri o kategorinin eşyalarını %15 pahalı sattırır.

### Almanak

Sağ altta, küçük haritanın hemen üstünde **Tarif kitabı**'nın solunda küçük bir **kitap** simgesi (kısayol **U**, Ayarlar → Kontroller'den değişir). Haritanın üstündeki üç düğme (Almanak, Başarımlar, Özellikler) **eşit boyuttadır** ve üçü birlikte haritanın genişliğini geçmez. Telefonda düğmeler sağ sütunda alt alta. Adanın canlılarını bölge bölge gösterir.

- **Sol sütun: keşfettiğin biyomlar.** Yalnızca adım bastığın biyomlar görünür, ilk girdiğin sırayla. Çayır'dan hiç çıkmadıysan yalnızca Çayır vardır; Orman'a ilk adım attığında ekranda "Orman" yazısı çıkar ve almanakta **2. satır** olarak Orman açılır. Henüz bilmediğin biyom hiç gösterilmez (sayı da yazmaz).
- **Sağ taraf: seçili biyomun bütün canlıları** (o biyomda karşılaşılabilecek her tür, gece çıkanlar ve seviyeyle gelenler dahil). Her canlı bir kart:
  - **İlk kez öldürülene kadar:** kapkara bir siluet ve **???**; hiçbir bilgi yok.
  - **İlk kez öldürülünce açılır:** resmi, adı, huyu (zararsız / nötr / saldırgan), can, hasar, hız, uzaktan saldırısı ve bıraktığı etki (zehir, yanık…), düşürdükleri, kaç tane avladığın.
  - **Saldırılar ve etkiler:** açılan kartta ayrıca şunlar yazar: **Saldırılar** (ısırık/vuruş hasarı; uzaktan saldırıyorsa kaç mermi attığı ve kaç saniyede bir), **Etki** (her isabette bıraktığı zehir/kanama/yanık: saniyede yaklaşık kaç can, kaç saniye), **Özel hamleler** (her biri kısa açıklamasıyla: Sıçrama · iniş çevresine hasar ve itme; Hücum · çarparsa uzağa iter; Sersemleten kükreme · 1,1 sn sersem; Alev püskürtme · yanık; Buz parçaları · 1,3 sn donma; Ağ · 3 sn yavaşlama; Şok · 0,8 sn sersem; Zehir gölü · yerde 5 sn zehir; Yakalayıp fırlatma · savuşturulamaz; Üçlü saldırı · üç vuruş), **Özellikler** (Bağışıklık · ara sıra kısa süre hasar almaz; Çevik · mermilerden ve vuruşlardan yana sıçrar; İri · sıçrama ve hücumu kırmızıdır, savuşturulamaz) ve Reisi olan türlerde **Reisin ek hamleleri** (Reis her zaman kükreme ve üçlü saldırı da yapar). Bilgiler canlının gerçek değerlerinden gelir.
  - **Reis sayacı:** kartın altında "Reis: 3 / 7" (o türden kaç avladın / Reis için kaç gerekir). Sayaç dolunca Reis gelir.
  - **Reis yenilince kart altın rengine döner** ("Reis yenildi"). Her türün Reisi **yalnızca bir kez** yenilir: kart altına boyandıktan sonra o türden ne kadar avlarsan avla Reis bir daha gelmez.
- **Yeni canlı almanağa eklenince:** bir türü **ilk kez** öldürdüğünde ekranın ortasında büyük bir yazı çıkar: canlının adı ve altında "**Almanağa eklendi** · U ile bak" (yeni malzeme bulunca çıkan yazıyla aynı yerde, sıraya girer). Her yeni tür için bir kez; Reisler ve ders canlıları sayılmaz.
- **İlk avında almanak gösterilir:** oyunda **ilk kez** bir canlı öldürdüğünde (almanakta hiç açık kart yokken) Almanak düğmesi **mavi parlar** ve yanında yanıp sönen bir **ok** olur (öğreticinin gösterme kuralı gibi); ekranda "Almanağı aç: U" yazar. Parlama ve ok, Almanak açılınca söner. Telefonda düğme ☰ menüsünün içindeyse önce ☰ parlar.
- **Bakılmamış yeniler sayılır:** almanağa yeni bir şey girince (bir canlıyı ilk kez avladığında kartı açılır; bir **Reis**'i yendiğinde kartı altına döner) Almanak düğmesinin köşesinde **bakmadığın yenilerin sayısı** kırmızı bir rozetle yazar. Almanağı açınca o kartların köşesinde **"YENİ"** yazar; sol sütunda bölgenin yanında da o bölgedeki yeni sayısı görünür. Kartın **üstüne fareyle gelince** (telefonda karta dokununca) "YENİ" kalkar ve sayı bir azalır; hepsine bakınca rozet kaybolur. Bakılanlar kayıtla saklanır; eski bir kayıt açılınca o ana kadarki her şey bakılmış sayılır. ("yeni bir şey olmasa da yanıyor") sayı yalnızca almanakta kartı olan canlıları sayar (kartı olmayan ders/ikinci ada/arena canlıları sayıyı hiç söndürmüyordu). Kartta "yeni" etiketi adın yanında küçük, sabit bir yazıdır (resmin üstüne binmez, yanıp sönmez).
- **Rozet ve düğme yanıp sönmez, yavaşça nabız atar (7 Kasım 2026, Boğaç: "Bu çok hızlı yanıp sönüyor"):** sol menüde yeni bir şey olunca dikkat çeken düğmeler (Kitap/Almanak düğmesi ve üstündeki kırmızı sayı rozeti) ani açılıp kapanarak yanıp sönmez; **yavaş, yumuşak bir nabız** atar: bir döngü ~**1,8 sn**, saydamlık ve büyüklük yumuşakça artıp azalır. Bakılmamış yeni kaldıkça nabız sürer.
- **Kartlar aynı boyutta:** almanaktaki her canlı kartı aynı yüksekliktedir (300 px, telefonda 270 px); uzun yazı (hareketler, tarifler) kartın içinde kaydırılır, satırları uzatmaz. Ad tek satırdır; sığmazsa "…" ile kısalır, üzerine gelince tamamı görünür.
- **Başka bölgenin canlısı:** her canlının kartı kendi bölgesinin sayfasındadır (Engerek → Orman). Yan görevde başka bölgenin canlısı çıkar (Bataklık'taki görevde Engerek, Kayalık Dağ'da Kurt, Çayır'da Yaban domuzu); onu avlayınca kartı **görevin bölgesinin sayfasında da** en sonda görünür, altında "Başka bölgenin canlısı · yan görevde karşına çıktı" yazar. Bu konuk kartlar o sayfanın sayısına (x / y canlı) katılmaz. Eskiden "Almanağa eklendi" yazıp avladığın bölgenin sayfasında görünmüyordu. Ayrıca henüz gitmediğin bir bölgenin canlısını avlarsan (ör. Orman'ın kenarından seni kovalayıp Çayır'a giren bir Engerek) o bölgenin sayfası almanakta açılır; sayfada yalnızca avladıkların görünür, gerisi ??? kalır.
- **Reise yenilirsen:** Reis sahadayken (ya da gelmek üzereyken) bayılırsan Reis kaybolur ve sayaç **bir eksik** kalır (ör. 6 / 7), sanki onu çağıran son av hiç yapılmamış gibi. O türden bir tane daha avlayınca Reis yeniden gelir; yenene kadar böyle sürer. (Bayıldıktan sonra 60 sn hiçbir Reis gelmez kuralı geçerli.)
- **Tatlı su balıkları sayfası (10 Kasım 2026, Boğaç: "almanakta tutulan balıklar da yazmalı; gölden kefal falan bir şeyler yakaladım ama almanakta bir şey olmadı"):** biyomların altında **🎣 Tatlı su balıkları** sayfası vardır (Deniz canlıları sayfasının üstünde). Nehirde ve gölde tutulabilen her balık sularına göre üç başlık altında (Çayır/Orman · Bataklık/Kayalık Dağ · Kül Diyarı/Mor Kristal Vadisi; bkz. Balık tutma) bir kart olarak durur. Tutulana kadar karanlık ve **???** ("Henüz tutmadın", nerede tutulduğu yazar); **ilk kez tutunca açılır**: resmi, adı, nerede tutulduğu, fiyatı, zorluğu (zor balıklarda yeşil alan dar), hangi tariflerde kullanıldığı ve kaç tane tuttuğun. İlk kez tutulan her balık için ekranın ortasında "**Almanağa eklendi** · U ile bak" yazar. Sayılar zaten kayıtta olan balık sayaçlarından gelir: eski kayıtlarda bugüne kadar tuttukların açık gelir.
- **Yıldızsızlar sayfası (v3.30):** ilk mor ışık saldırısından sonra biyomların altında ayrı bir **Yıldızsızlar** sayfası çıkar (bkz. Mor ışık saldırıları).
- Almanak açıkken oyun durur. Kaydedilecek yeni bir şey yok: biyomlar, avlar ve Reisler zaten kayıtta; eski kayıtlarda bugüne kadar avladıkların açık gelir.

### İzler ve anılar

- **İzler** (Kitap → İzler): eşinden kalan 6 mor parıltı. **Kelebekli kolye** (Çayır kumsalı; sevdiğin kişinin cinsiyeti ne olursa olsun kolyedir, ona senin aldığın kolye; üstünde **beş lacivert kelebek**, üçü altta, ikisi üstte; zinciri kopmuş; eskiden kadınsa "Kopmuş kolye", erkekse "Kopmuş bileklik"), Islak defter sayfası (Orman), Tuhaf metal parçası (Bataklık), Çamurdaki izler (Doğan'ın güneydoğusu; yanında kadınsa bir küpe, erkekse deri bir cüzdan), Yıldız haritası ve Mor kristal (doğu). Üstüne gidip E. Sonuncusu "Gerçek" sahnesini açar.
  - Kolyenin yazısı: "Kumun içinde bir şey parlıyor: ince bir zincir, üstünde beş **lacivert kelebek**, üçü altta, ikisi üstte. Bu, {L} için aldığın kolye! 'En sevdiğim kolye oldu' demişti. Zinciri kopmuş, ama kıyıya vurmuş. Demek ki o da bu sularda bir yerdeydi…"
- **Anılar** (Kitap → Anılar,: "asıl hikâye"). **ACT 1'in anıları romantik ve güzel olan kısımdır; mor ışık ACT 2'de öğrenilir.** Anılarda "sen" oynadığın karakter, "o" sevdiğin kişidir (karakter yaratmada 2. adımda seçilen; cinsiyeti ne olursa olsun roller aynıdır). Her biri +25 + 15 × iç sıra XP (oyunun anı listesindeki yeri, 0'dan; 25 ile 505 arası). Anı sahnesi Esc ya da dışına tıklamayla kapanırsa sonuna kadar okunmuş sayılır (XP ve anı defteri aynı; Konuşma penceresi kuralı).
  - **ACT 1 · 22 anı, her zaman bu sırayla gelir** (sıra atlanmaz; bir anı gelmeden sonrakisi gelmez):

| # | Anı | Ne oluyor | Resim |
|---|---|---|---|
| 1 | Sınıfta bir doğum günü | Üniversitede **aynı sınıftasınız** ama hiç konuşmadınız. Bir arkadaşınızın doğum günü kutlanıyor; pastayı o keser. O: "Ben keserim! Herkese yetecek, merak etmeyin." "Dilim dilim herkese dağıttı. Son tabağı da uzattığında pastadan ona hiç kalmamıştı. Hiç dert etmedi; gülümsedi." "Sen o gülümsemeye **hayranlıkla** baktın. {Saçları} pencereden gelen ışıkta parlıyordu. Onu ilk kez o gün gerçekten gördün." | Sınıf: yeşil tahtada "İyi ki doğdun!", pencereden ışık, arkadaşlar, mumlu pasta; dilimler arkadaşlara gider, sonunda boş tabak. **v3.32 (Boğaç: pasta karakteri kapatıyordu):** küçük masa ve pasta ikinizin arasındadır; sen solda, o masanın sağında, yüzü sana dönük, ikiniz de tam görünürsünüz |
| 2 | Voleybol | **Okulun voleybol sahasında** arkadaşlarla maç, aynı takımdasınız (**komik anı**; o çok iyi oynar, sen beceremezsin). Sen: "Merak etme, ben buradayım. Top bana gelsin yeter." "Top sana geldi; kaçırdın. Bir daha geldi; kafana çarptı. Üçüncüsünde fileye takıldın." "O ise her topa yetişti, her smaçı vurdu. Sayıyı alınca dönüp sana baktı." O: "Top bana gelsin yeter, öyle mi? Sen bu sefer sadece alkışla!" "Maçı o kazandı. Sen bütün maç boyunca ona baktın." | Okul binasının önünde çizgili saha, file, arkadaşlar; top kafana çarpar (başında yıldızlar), o zıplayıp smaç vurur |
| 3 | Konser | Voleyboldan birkaç gün sonra bir yaz konseri: kalabalık, renkli ışıklar. O: "Bu şarkıya bayılıyorum!" **İlk kez birbirinizden etkilendiğiniz gece:** "Şarkı boyunca gözleriniz birkaç kez buluştu. İkiniz de hemen başka yere baktınız; ama ikiniz de gülümsüyordunuz." Sonra **onu evine bırakırsın**: "Kapıda bir an durdu, el salladı. Eve dönerken hâlâ gülümsüyordun." | Gece sahne, renkli ışık hüzmeleri, dans eden kalabalık, notalar; son satırda ay ışığında onun evi, kapıda el sallar |
| 4 | Açık hava sineması | Yaz gecesi, arkadaşlarla açık hava sineması; **sen o gece gelemezsin**. "{L} perdeye pek bakmadı. Gözü hep girişteydi; gelen her gölgede seni aradı." O (gece sana yazdığı mesajda): "Film güzeldi… ama yanımdaki yer boş kaldı." "O mesajı okuyunca anladın: o da seni düşünüyordu." | Gece, büyük perde, arkadaşlar; o battaniyede tek başına, yanındaki yer boş (kesik çizgi); girişe bakar, sonra telefonunda mesaj balonu |
| 5 | Maket ödevi | **Gündüz** (gece değil), güneşli bir öğleden sonra okulun atölyesinde bir **maket**. **O ödevi anlıyor;** iş yalnızca el oyalayıcı olduğu için sen yardım edersin: "Ödevi o çoktan çözmüştü; ama minicik parçaları kesip yapıştırmak saatler sürecekti." O: "Nasıl yapılacağını biliyorum… sadece bu ufacık parçalar bitmek bilmiyor!" Sen: "Sen ölçüp çiz, ben keseyim. Çatıyı da ben tutarım." "Akşam olmadan maket bitti; küçük evin çatısı dimdik duruyordu. 'İyi ki geldin,' dedi. O cümleyi günlerce düşündün." | Güneşli atölye, pencereden ışık, raflarda kartonlar; masada küçük karton ev, çatısı eğri eğri sallanır, son satırda düzgün durur; yapıştırıcı, maket bıçağı |
| 6 | Bir mesaj | Gece, odanda; yazıp yazıp siliyorsun. Sen (mesaj): "Yarın yanıma sevgilim olarak gelir misin?" Üç nokta… O: "Bunun cevabı için sana sarılmam lazım." "Ertesi gün geldi ve sana sarıldı. Cevap buydu. O gün sevgili oldunuz." | Karanlık oda, telefon ışığı, mesaj balonları; son satırda sarılma |
| 7 | Otogarda | **Gece**, otogar, peronların ışıkları yanıyor, otobüs kalkmak üzere. "O çok utangaçtı; 'seni seviyorum' demeye bir türlü dili varmıyordu." O: "Kendine dikkat et… tamam mı?" "Otobüse binmeden bir an durdunuz. Ve ilk kez öpüştünüz. Söyleyemediği her şey o andaydı." | Gece otogar: yıldızlar, ay, peron lambaları, camları yanan otobüs; kalp |
| 8 | Yağmurda şemsiye | **Gündüz, bardaktan boşanırcasına yağmur**. "Sen hiç şemsiye taşımazdın. O gün yoldaki bir büfeden bir şemsiye aldın: **o ıslanmasın diye**." O: "Sen şemsiye taşımazdın ki?" Sen: "Bunu senin için aldım." "İkiniz de aynı şemsiyenin altına sığdınız; ikinizden de tek damla su süzülmedi. Yağmurun sesi hiç bu kadar güzel gelmemişti." | Gri gündüz, bulutlar, ıslak sokak ve binalar, büfe, su birikintilerinde halkalar; yağmur şemsiyenin altına girmez, kenarından damlar |
| 9 | Bisiklet | Bir gün iki bisiklet kiralarsınız; yan yana, ağır ağır, ağaçlı bir yolda. O: "Yavaş git, bu an bitmesin." "Yol bitti, siz bitmesin diye bir tur daha attınız." | Ağaçlı yol, gün batımı, dönen tekerlekler, uçuşan yapraklar |
| 10 | Waffle | Başka bir gün, küçük bir kafe, pencere kenarı; çikolatalı, çilekli kocaman bir waffle. O: "Yarısı senin… ama çilekler benim!" "Bir ara göz göze geldiniz. Sen gözlerini ondan alamadın." O (kızararak): "Öyle süzük süzük bakma… utanıyorum." "Burnunun ucuna çikolata bulaşmıştı. Söylemedin; biraz daha öyle kalsın istedin." | Kafe masası, waffle, iki fincan, buhar |
| 11 | Peçeteden gül | Bir kafede, kahveler gelene kadar peçeteyi katlayıp **peçeteden bir gül** yaparsın, gerçeğinden ayırt edilmez. O: "Dur, ben de yaparım! Bu kadar zor olamaz." "On dakika sonra masada bir şey vardı: saçak saçak, hiçbir şeye benzemeyen bir peçete." O: "Bu bir gül! …Biraz rüzgâr yemiş bir gül. Tamam… sadece bir peçete. Gülme!" "Güldün. O da güldü. Kahveler geldi, gülmeye devam ettiniz." (komik anı) | Kafe masası, fincanlar; senin önünde beyaz, katlanmış bir **peçete gülü** (kat kat yapraklar, burgulu peçete sapı, peçeteden bir yaprak; şekere benzemesin), onun önünde saçak saçak, hiçbir şekle benzemeyen bir peçete, üstte soru işaretleri |
| 12 | Sinema biletleri | Defalarca sinema: komedi, korku, aşk filmleri. "O her bileti saklardı: bir kutuda, tek tek, tarihleriyle." O: "Bunlar bizim. Bir gün sayarız, kaç film izlemişiz diye." | Salon, perde; önde bilet kutusu |
| 13 | Tavla | Bir akşam tavla. Sen: "Tavlada beni kimse yenemez." "Üç el üst üste kaybettin. Son elde bir de mars oldun." O (tatlı tatlı dalga geçerek): "Kimse yenemez, öyle mi? Dur, dur, kıpırdama…" "Tavlanın başında suratını asmışken telefonuyla fotoğrafını çekti; fotoğrafa şeytan boynuzu çizip altına kocaman 'LOSER' yazdı. O fotoğraf hâlâ telefonunda." | Masada **kapalı bir tavla kutusu** ve zarlar (tahta yüzleri kapatmasın, yüzler görünür); sen üzgün, o zıplıyor; flaş, sonra telefon ekranında fotoğrafın: **mor şeytan boynuzları tam kafanın üstünde** (v3.30, Boğaç; eskiden kırmızıydı ve kafanın çok üstünde havada duruyordu) ve kırmızı LOSER |
| 14 | Kardan kalp | Kar yağan bir gün; sokak lambalarının altında kar taneleri. Eğilip kardan **kalp biçiminde bir kartopu** yaparsın. Sen: "Bu sana. Ama atmak yok!" O (çok hoşuna gider): "Çok güzel! Erimesin diye ne yapacağım şimdi?" "Eriyene kadar eldiveninin içinde tuttu onu. Yanakları soğuktan mı kızarmıştı, yoksa…" | Karlı akşam, sokak lambası, yağan kar; elinden onun eline geçen beyaz kardan kalp |
| 15 | Çay kenarında kahvaltı | Bir sabah, **teklifin sonradan yapılacağı o çayın kenarında** kahvaltı: örtü, sıcak poğaçalar, ince belli bardaklarda çay. O: "Poğaçanın en sıcağı benim, haberin olsun." "Kuşlar, suyun sesi, buharı tüten çay. O sabah burayı çok sevdiniz." | Sabah, akan çay (teklifteki çayır ve ağaçlar), örtü, poğaça, çaydanlık, çay bardakları |
| 16 | Doğum günü pastası | Senin doğum günün, **parkta**: ağaçların altındaki bankta bir sürpriz. O: "Sürpriz! Kendim yaptım!" "**Yuvarlak** bir pasta; üstünde **siyah damla çikolatalardan** bir kalp. Yanında **bir şişe** soğuk limonata." "Hayatının en güzel pastasıydı. Limonatayı da ikiniz paylaştınız." | Park: gökyüzü, ağaçlar, çimen, yol, bank; bankta mumlu yuvarlak pasta, üstünde siyah damla çikolatadan kalp; yanında küçük bir limonata şişesi |
| 17 | Şatonun önünde | Yeşil tepeler, ağaçlar; arkada masallardan çıkmış beyaz bir şato (sivri kuleler, mavi çatılar). Yanda yapay bir göl, üstünde küçük bir korsan gemisi. Sen: "Dur, kıpırdama… şimdi gülümse!" "Deklanşör tıkladı. O fotoğrafta şato arkada kaldı; gözler hep ona gitti." | Gündüz, doğa, şato, göl ve korsan gemisi; deklanşörde beyaz flaş |
| 18 | Hamburger | Bir hamburgerci, kocaman iki hamburger. O: "Ben bunu bitiremem… sen yer misin?" "Seninki çoktan bitmişti. Yine de yedin. Sonra hep böyle oldu: yarısı hep sana kaldı." | Masa, iki **küçük** hamburger, patates, içecek; masanın ortasında, yüzleri kapatmaz |
| 19 | Kaktüs | İlk işin; evden çalışıyorsun. Kapı çalar: bir paket, içinde **küçük bir cam fanus** ve bir not. "Fanusun içinde minicik bir kaktüs, yanında el ele iki figür: siz." O (notta): "Yeni işin kutlu olsun! Sen çiçeğe bakamazsın, biliyorum. O yüzden dünyanın en dayanıklı çiçeğini yolladım. Bunu da öldürürsen konuşacağız." "Fanusu masanın köşesine koydun. Her gün ona baktın, her gün onu düşündün." | Evde çalışma masası, bilgisayar, kapıda paket; masada cam fanus: içinde kaktüs ve el ele iki küçük figür; not kâğıdı |
| 20 | Kelebekli kolye | Küçük bir kutu, ince bir zincir, üstünde **beş lacivert kelebek: üçü altta, ikisi üstte** (gümüş değil). Sen: "Görünce seni hatırlattı." O: "Çok güzel… Bu en sevdiğim kolye oldu!" Kelebekli kolyeyi (iz) bulduysan son satır: "Kumsalda bulduğun lacivert kelebekler… o kolyeydi." | Açık kutu, zincirde beş lacivert kelebek (3 altta, 2 üstte), etrafta uçan mavi tonlarda kelebekler |
| 21 | Yüzme dersi | **İlk tatiliniz** (teklifin hemen öncesi), masmavi deniz. O: "Ben yüzme bilmiyorum… beni bırakma ama!" Sen: "Bırakmam. Yeşil can simidin var, ben de buradayım." "Can simidinin içinde ayaklarını çırpmayı, kollarını açmayı gösterdin. Simidi sen tuttun, o yüzdü." (**yeşil bir can simidiyle** öğretirsin) "O gün yüzmeyi öğrendi. Her kulaçta dönüp sana baktı." | Deniz, güneş, şemsiye; ikiniz suda, o beyaz çizgili yeşil can simidinin içinde, yanında sen; son satırda simitsiz yüzer |
| 22 | Çay kıyısında söz | **Evlenme teklifi, son anı** (**yalnızca ACT 1'in sonunda, Barbaros'un gemisine binmeden hemen önce** gelir: Meltem yapılınca Barbaros'a "**Götür beni**" dediğinde önce bu anı oynar, kapanınca deniz yolculuğu başlar; tetiklerle gelmez. Metni aynı kalır, yalnızca **gece** geçer): "Bir yaz gecesi, ay ışığında bir çayır, ağaçların gölgesi, önünüzden şırıl şırıl bir çay akıyor. Kadehlerde şarap…" Biri erkek biri kadınsa erkek teklif eder, hemcinste oynadığın karakter (kuralı aynen). | Gece, ay ve suda yansıması, yıldızlar, ateş böcekleri |

  - **Resimlerdeki yazılar ("bu yazı hiç okunmuyor"):** anı resimlerindeki kelimeler (mesaj balonları, tahtadaki "İyi ki doğdun!", sinemadaki mesaj, PERON 7, BURGER, LOSER) küçük resmin içine çizilmez; resmin üstüne **gerçek yazı** olarak konur, resim ne kadar büyürse büyüsün keskin okunur (resimle birlikte büyür). Mesaj balonları uzun cümleye göre geniştir.
  - **Nasıl gelir:** her tetikte **sıradaki** anı gelir (1–21; 22. anı, teklif, tetiklerle gelmez, yukarıya bak; o ana kadar gelmemiş anılar sonra da sırayla gelmeye devam eder). Tetikler: kazanda **10, 25, 50, 100 ve 175** tarif (her eşik bir kez, gün şartı yok), **uyurken %40**, **bayılınca %60**, **bir görev bitince %30** (Kemal'inki dahil) ve Zümrüt'e **2 Mor kıymık** vermek (gün şartı yok). Uyku/bayılma/görev tetikleri gün şartına bakar: sıradaki anı en erken şu günde gelir: 1–3. anı 1. gün, 4–5. anı 2. gün, 6–7. anı 3. gün, sonra her anı bir gün sonra (8. anı 4. gün, 9. anı 5. gün, 10–11. anı 6. gün, 12. anı 7. gün, 13–14. anı 8. gün, sonra her anı bir gün sonra … 21. anı 15. gün), teklif (22.) gemiye binerken.
  - Kartın başlığı nasıl geldiğini yazar: "Bir rüya gördün" (uyku), "Bayılırken bir anı" (bayılma), "Bir anı geri geldi" (tarif, görev, Mor kıymık).
  - 22 anının hepsi gelince (sonuncusu kapanınca): "ACT 1'in bütün anıları geri geldi."
  - **İkinci adada** uyku/bayılma/görev tetiği önce mor ışık anılarından sıradakini getirir; onlar bitince ACT 1'in sıradaki anısını.
  - Kitap › Anılar'da önce ACT 1 (x / 22; teklifin yerinde "ACT 1'in sonunda, Barbaros'un gemisine binmeden hemen önce" yazar), sonra "ACT 2 · Mor ışık" (6 mor ışık anısı ve 5 usta anısı) listelenir; gelmemiş anının yerinde nasıl geleceği yazar.
  - **ACT 2 · mor ışığın anıları (10 anı):** ACT 1'den çıkarılan **mor ışıklı 5 anı** ACT 2'de gelir: Mor bir delik, Mektup, Son akşam, Bırakılan el, Mor fısıltı (metinleri ve resimleri aynı). Yalnızca ikinci adadayken, bu sırayla, uyurken (%40), bayılınca (%60) ya da görev bitince (%30) gelir; gün şartı yoktur. (için geçici; Boğaç ACT 2 anılarını ayrıca değerlendirecek.) Ustaların kilit görevleriyle gelen 5 ACT 2 anısı (Sahildeki ışık, Yıldızsız yolcular, Şapka, Mor gemi, Son söz) aynen kalır.
  - **Kaldırılan anılar:** Yağmurlu çarşı, Yanık ekmek, Kumsalda ilk dans, Kırık pusula ve Hastane koridoru oyundan tamamen çıktı (asıl hikâyeye uymuyordu; yağmur anısının yerini "Yağmurda şemsiye" aldı). ("böyle saçma bir anı asla olmaz") mor ışık anılarından **Yıldız haritası** da tamamen silindi. Çıkan anıların metinleri ve resimleri koddan da kaldırıldı.
  - Toplam **32 anı** (22 ACT 1 + 5 mor ışık + 5 usta). "Hatırladım" başarımı 32'yi ister.
- **Telefonda anı tam ekran:** dokunmatik ekranda bir anı gelince resmi ekranı kaplar (en-boy oranı korunur, ekrana sığan en büyük boy). Başlık ("Bir anı geri geldi" ve anının adı) üstte, anlatım yazısı ve Devam düğmesi altta, küçük yazıyla ve yarı saydam koyu zemin üstünde resmin **üstüne** biner. Bilgisayarda değişiklik yok.
- **Ada halkının hikâyeleri:** görev veren 8 kişinin her biri mor ışık yüzünden birini kaybetmiştir (Poyraz'ın hikâyesi yok); görevler hikâyeyi parça parça açar, sonunda bir sahne (+40 XP). Kitap → Ada halkı.
- **Kıyıya vuran şişeler (v3.68, 8 Kasım 2026, Boğaç):** bir **fırtına dinince** %60 ihtimalle, oyuncunun 10–32 kare çevresinde denize değen bir kumsal karesine bir **Şişedeki mektup** vurur ve ekranda "Fırtına dindi. Dalgalar kıyıya bir şeyler bırakmış olabilir." yazar (yeri gösterilmez). Kıyıda bir şişe dururken (en çok 2 gün) yenisi gelmez. Şişe yerden alınınca mektup hemen okunur (konuşma penceresinde, okuyanın resmiyle), eşya çantada kalmaz. Oyuncu mektup yazmaz; mektuplar ada halkının mor ışığa kaybettiği kişilere yazdıklarıdır, rastgele sırayla gelir, her biri bir kez:

| Kimden | Kime |
|---|---|
| Yaşlı Kemal | eşi Saliha |
| Cadı Zümrüt | kız kardeşi Ayşen |
| Pazarcı Nazlı | kardeşi Cem |
| Savaşçı Börü | ağabeyi Kaan |
| Demirci Dursun ve Zırhçı Durmuş | babaları Demirhan Usta |
| Usta Sinan | kızı Zeynep |
| Avcı Doğan | oğlu Ayaz |
| Denizci Barbaros | kızı Meltem |
| Zümrüt, Dursun, Durmuş ve kuzenleri | Elmas Nine |

  Okunan mektuplar **Kitap › Ada halkı**'nın altında "Kıyıya vuran mektuplar x / 9" başlığıyla tam metinleriyle durur. Dokuzu da bulununca "Kıyıya vuran bütün mektupları buldun." yazar ve bir daha şişe gelmez. Her bulunan mektup köpek günlüğüne de yazılır (bkz. ACT 3 › Köpek kamerası kayıtları). Arenada şişe gelmez.

## Üs kurma

> **Üs kurma (7 Kasım 2026, Boğaç):** oyuncu dışarıda kendine bir üs kurar: yol ve zemin döşer, çit, duvar ve kapıyla bir avlu çevirir, mor ışığa karşı fener diker. Boğaç'ın kararları: fenerler **yalnızca mor ışıktan korur** (canavarı uzaklaştırmaz); Reis'ler tahtayı da taşı da kırar, orta güçteki hayvanlar yalnızca tahtayı, güçlü hayvanlar ikisini de; kırılan parça onarılır; çit ve zemini **oyuncu elle yapar**; **Derin kuşakta da** kurulur; yolda yürüme **%15 hızlı**; uçan canlılar çitin üstünden geçer ama kırmaz; tamamen çevrili avluda canlı doğmaz. Bu bölüm yalnızca oyunda olan parçaları anlatır.

### İnşa kipi

- **Açma:** sol menüde / ☰ içinde **İnşa** düğmesi; klavyede **N** (Ayarlar → Kontroller'den değişir); kolda Kol menüsündeki satır dışarıdayken **İnşa**, evin içindeyken **Döşe** olur; kolda parça şeridinde **X** parçasız imleç verir. Evin içinde ve mağarada İnşa açılmaz (evde Döşe vardır).
- **Ekran:** oyuncunun çevresinde karo çizgileri görünür; altta Döşe'deki gibi yatay bir şerit: zemin, çit, duvar, kapı, fener ve çantadaki sayıları. Şeritte sınır da yazar ("1.950 / 2.000").
- **Koyma:** her parça **1 karo**dur ve ızgaraya oturur. Çit ve duvar komşularıyla kendiliğinden birleşir (uç, düz, köşe, T, haç).

  | Cihaz | Koy | Çizgi ya da dikdörtgen boya | Sil | Menü / döndür | Çık |
  |---|---|---|---|---|---|
  | Bilgisayar | tık | basılı tutup sürükle | sağ tık | R döndürür | Esc |
  | Telefon | dokun | sürükle | – | uzun bas: menü | İnşa düğmesi |
  | Kol | A | A basılı + sağ çubuk | X | Y döndürür | B |

- Konmuş parçaya dokununca (Döşe'deki gibi) **Taşı / Geri al / Döndür** menüsü açılır. **Geri al:** parça çantaya tam döner. Yıkık parçaya dokununca menü **Onar / Kaldır**dır; **Kaldır** parçayı siler ve yere 1 malzeme düşürür. Sürükleyerek boyanır, sürükleyerek silinir.
- Uygun olmayan karoda hayalet kırmızıdır ve "Buraya konmaz" yazar (talimat vermez); kaya olan karoda "Burada kaya var" yazar.
- **Dünya durmaz:** gece ve canavarlar sürer; inşa ederken vurulursan kip kapanır.

### Zemin ve yol

- Zemin ve yol karolarının üstünde ağaç, bitki, maden ve toplanabilir **çıkmaz**: ne ada kurulurken, ne yeniden doğarken, ne ağaç yeniden büyürken.
- Üstünden herkes yürür. **Yol** türlerinde oyuncu **%15 hızlı** yürür (binekte de).

| Parça | Tür | Tarif (el yapımı, kazanda öğrenilir) | Karo fiyatı |
|---|---|---|---|
| Toprak yol | yol | 2 Taş, 1 Kum → 4 | 1 |
| Çakıl yol | yol | 3 Nehir çakılı, 1 Kum → 4 | 2 |
| Ahşap parke | zemin | 1 Sert odun kalası → 4 | 10 |

### Çit, duvar ve kapı

Her parça **tahta** ya da **taş** sınıfındadır; kırma kuralı buna göre işler.

| Parça | Sınıf | Tarif (el yapımı, kazanda öğrenilir) | Etki | Canı | Fiyat |
|---|---|---|---|---|---|
| Dal çit | tahta | 4 Dal, 2 Lif → 2 | **Yavaşlatır:** canlı ×0,35 hızla geçer; oyuncuyu yavaşlatmaz | 60 | 4 |
| Çit | tahta | 1 Sert odun sapı, 2 Sarmaşık ipi, 2 Dal → 2 | Durdurur | 240 | 82 |
| Taş duvar | taş | 4 Taş, 1 Kireçtaşı, 1 Kum → 1 | Durdurur | 800 | 8 |
| Tahta kapı | tahta | 2 Çit, 1 İp → 1 | Oyuncu, evcil hayvan ve görev kişileri geçer | 240 | 227 |

- **Kapı:** oyuncu 1 karo yakına gelince kendiliğinden açılır, uzaklaşınca kapanır; düğmesi yoktur.
- **Taş duvar** Çayır malzemesiyle yapılır ama ağırdır: erken oyuncu birkaç duvar karosuyla kapısının çevresini korur; geniş bir avluyu taşla çevirmek ilerleyen biyomların işidir.

### Kırma, yıkık parça ve onarım

- Bir canlı bir parçaya yalnızca **oyuncunun yakınında, onu kovalarken** ve yolu o parçayla kesilmişken (ya da hücumla çarpınca) vurur. Uzaktaki çitlere kimse dokunmaz.
- **Vuruş başına parçaya verilen hasar** canlının hasarının yarısıdır, en çok 1,2 sn'de bir; hücum çarpması ×2.
- Sınıfının kıramadığı parçaya canlı vurmaz: önünde bekler, sonra vazgeçer. Arada durduran bir parça varken üstünden ısıramaz.
- Uzaktan atanlar parçalara vurmaz.
- **Uçanlar** çitin ve duvarın **üstünden geçer**, kırmaz (Boğaç).
- **Kırılınca** parça **yıkık** olur ve geçilir; kaybolmaz, resmi yıkık parçadır; yere 1 malzemesi düşer. Yıkık parçanın menüsü **Onar / Kaldır**; Kaldır 1 malzeme daha düşürür.
- **Onarım:** hasarlı ya da yıkık parçanın yanında F etiketi "**Onar: X (1 Dal)**" ya da "**Onar: X (1 Taş)**" olur (tahta 1 Dal, taş 1 Taş); canı tam dolar. Hasarlı parça kendiliğinden onarılmaz; hasar resimde çatlakla görünür (3 kademe).

**Kırma sınıfları:**

| Sınıf | Neyi kırar | Kimler |
|---|---|---|
| **Zayıf** | hiçbir şey | zararsızlar, küçük gövdeliler (kemirgen, kuş, kabuklu, böcek, sürüngen), uzaktan atanlar, uçanlar |
| **Orta** | yalnızca tahta (çit, kapı) | yakın dövüşte saldıran ya da hücum eden dört ayaklılar (kurtlar, domuzlar, vaşak, geyikler, keçiler) |
| **Güçlü** | tahta ve taş | iri türler (vuruşla geri itilmeyenler) |
| **Reis** | tahta ve taş | her türün Reis'i (zayıf bir türünki de) ve mağara boss'ları |

| Biyom | Zayıf | Orta | Güçlü |
|---|---|---|---|
| Çayır | Tavşan, Keklik, Bıldırcın, Kerevit, Porsuk | Geyik, Yaban atı, Kurt | – |
| Orman | Sincap, Kunduz, Dikenli kirpi, Engerek, Oklu kirpi | Karaca, Yaban domuzu | – |
| Bataklık | Ördek, Yaban kazı, Turna kuşu, Su samuru, Zehirli kurbağa | Bataklık kurdu | Timsah |
| Kayalık Dağ | Ur kekliği, Kartal (uçar) | Dağ keçisi, Muflon, Vaşak | Yaban öküzü, Mağara ayısı |
| Kül Diyarı | Kül böceği, Kül cini, Lav kertenkelesi, Kor yarasası (uçar) | Kül kurdu, Ateş akrebi | Kara ejder |
| Mor Kristal Vadisi | Işık engereği, Kristal örümcek, Mor güve (uçar) | Işık tilkisi, Gölge kurdu, Kristal geyik | Kristal golem |
| Mor ışık baskını | Yıldızsız gözcü, Yıldızsız sürüngen, Yıldızsız tükürücü | Yıldızsız dev | – |

- Nötr canlılar yalnızca kızdırılınca kovalar; o zaman sınıfları işler.
- **Yeni bir canlı eklenince sınıfı da yazılır**; listede olmayan canlı "zayıf" sayılır.
- Mağaralarda inşa yoktur (mağara canlılarının sınıfı yalnızca tutarlılık için: Mağara kurdu ve Mağara vaşağı orta, öbürleri zayıf).

### Avlu

Durduran parçalarla (Çit, Taş duvar) ve kapılarla **tamamen çevrili** alanın içinde canlı **doğmaz** (Boğaç). Avluyu yalnızca çit, taş duvar ve kapı kapatır: Dal çit yavaşlattığı için saymaz; Direk feneri tek karelik katı bir parçadır ama avlu kapatmaz; yıkık parça da saymaz. Çevrili olup olmadığına yalnızca bir parça konup kalkınca ya da kırılınca bakılır (en çok 64 × 64 karo).

### Dış ışık: Direk feneri

| Fener | Tarif (Usta Sinan yapar) | Yarıçap | Yakıt | Fiyat |
|---|---|---|---|---|
| Direk feneri | 1 Sopa, 1 Kil lamba, 1 Balçık bezesi | 90 px | bir gece; her gece 1 Hayvan yağı ya da 2 Reçine; en çok 6 gecelik yakıt alır | 301 |

- Fenerin ışığının içinde **mor ışık gelmez**; canavarlar ışıktan uzaklaşmaz, içine de girer (Boğaç: fenerler yalnızca mor ışıktan korur).
- Fener 20:00'de kendiliğinden yanar, 06:00'da söner. Yakıtı biten fener o gece yanmaz.
- Yakıt fenere **F** ile konur, etiket "**Fenere yakıt koy**" (yerde alınacak eşya yoksa; F önceliği). Direk feneri tek karelik katıdır: üstünden geçilmez.
- Yanan fenerler haritada kamp ateşi gibi görünür.
- **Gece:** güvenli olan fenerin ışığıdır, çit değil. Zifiri karanlık sayacı ışığın sınırından çıkınca başlar. Tanrı modu kuralı aynıdır (mor ışık tanrı modunda da bayıltır).

### Nereye kurulur, sınırlar

- **Her biyomda ve her kuşakta** kurulur, Derin dahil (Boğaç); kuşaklar yalnızca canlıların doğmasını belirler.
- **Kurulmaz:** su ve ulaşılamaz karo; ağaç (önce kesilir); başka yapı; kişilerin ve ateşlerinin **6 karo** çevresi; görev yerlerinin **8 karo** çevresi (köprüler, Doğu geçidi, gemi enkazı, mağara ağızları, iz yerleri, kuzen ailelerinin ocak ve kazanları, yan kişilerin yeri); Kemal'in kampının güvenli alanı; Ekin'in tarlası.
- **Çit, duvar ve kapı** köprü uçlarına ve geçide 4 karodan yakın kurulmaz; zemin ve yol oraya da konur.
- Mağarada, evin içinde (orada Döşe var), Bereket Adası'nda ve ikinci adada kurulmaz.

| Parça (kayıt başına) | Sınır |
|---|---|
| Zemin ve yol | 2.000 karo |
| Çit, duvar, kapı | 600 parça |
| Fener | 24 |

- **Kayıt:** zemin ve çit/duvar ızgara olarak, sıkıştırılmış karo listesi şeklinde saklanır; parça canları yalnızca hasarlı parçalar için tutulur; fener yakıtları yapılarla birlikte saklanır.

### Çit ve Ağıl

- **Çit el yapımıdır** (Boğaç: çit ve zemini oyuncu elle yapar); adı aynı kaldığı için görevler ve Ağıl bozulmaz. Tarifi tahtadır: 1 Sert odun sapı, 2 Sarmaşık ipi, 2 Dal → **2 Çit**; kazanda öğrenilir. Usta Sinan'ın sipariş listesinde Çit yoktur.
- **Ağıl** aynı kalır: tarif 10 Çit, Usta Sinan kurar. Fiyatı malzemesinden hesaplanır: 1.107.
- **Eski kayıtlar:** çantadaki Çit'ler geçerlidir; dünyada kurulu Çit'ler açılışta İnşa ızgarasına aynı yerde Çit olarak taşınır; Sinan'a verilmiş ve bekleyen bir Çit siparişi varsa iade edilir (Çit çantaya, ücret geri).
- **Çit'in resmi** çittir (dikmeler ve iki kat kalas); çantada, kitapta ve İnşa şeridinde aynı resim.
- **Arena:** İnşa parçaları silah, zırh ya da etki olmadığı için arenaya etkisi yoktur.

## Dövüş

### Silahlar

| Tür | Hasar | Menzil | Bekleme |
|---|---|---|---|
| Yumruk | 4 | 16 | 0,45 sn |
| Meşale (başka silah yoksa) | 7 | 19 | 0,48 sn |
| Kılıç | Taş 12 · Bakır 16 · Çakmaktaşı 18 · Tunç 22 · Granit 25 · Demir 34 · Timsah dişi kılıcı 38 · Çelik 46 · Gümüş kılıç 52 · Kara çelik 58 · Işın kılıcı 60 · Ejder kılıcı 65 · Mor kristal 72 · Ametist kılıcı 81 | 22 | 0,42 sn |
| Savaş çekici | Taş 13 · Bakır 18 · Çakmaktaşı 20 · Tunç 25 · Granit 28 · Demir 39 · Timsah dişi 44 · Çelik 53 · Kuvars 59 · Kara çelik 67 · Ejder 75 · Mor kristal 83 · Ametist 93 | 24 | 0,62 sn |
| Topuz | Taş 10 · Bakır 14 · Çakmaktaşı 16 · Tunç 19 · Granit 21 · Demir 29 · Timsah dişi 32 · Çelik 39 · Kuvars 44 · Kara çelik 49 · Ejder 55 · Mor kristal 61 · Ametist 68 | 20 | 0,36 sn |
| Mızrak | Mızrak 10 · Bakır 15 · Çakmaktaşı 17 · Tunç 20 · Granit 22 · Demir 30 · Timsah dişi 34 · Çelik 41 · Kuvars 46 · Kara çelik 52 · Ejder 58 · Mor kristal 64 · Obsidyen 72 | 30 | 0,6 sn |
| Balta | Taş 9 · Bakır 12 · Çakmaktaşı 13 · Granit 22 · Tunç 20 · Demir 30 · Timsah dişi 34 · Çelik 38 · Kuvars 43 · Kara çelik 50 · Ejder 56 · Mor kristal 58 · Obsidyen 65 | 20 | 0,5 sn |
| Kazma | Taş 8 · Bakır 11 · Çakmaktaşı 12 · Tunç 18 · Granit 20 · Demir 26 · Timsah dişi 29 · Çelik 34 · Kuvars 38 · Kara çelik 45 · Ejder 50 · Mor kristal 52 · Obsidyen 58 | 20 | 0,5 sn |
| Yay | Basit 8 · Çam 12 · Kemik 13 · Meşe 17 · Ihlamur 19 · Kızılağaç 26 · Söğüt 29 · Akçaağaç 35 · Huş 39 · Kızıl sedir 45 · Ejder 50 · Gece ağacı 56 · Işık ağacı 63 (× okun çarpanı) | 240–370 | 0,75–0,57 sn |
| Asalar, ateşli silahlar | ACT 2 bölümündeki tablo | 210–340 | |

- **Vuruş ne zaman değer:** vuruşun çizildiği yer (karakterin göğsü) ile canlının **gövdesi** arasındaki uzaklık, silahın menzili + canlının boyu + 3 pikseli geçmiyorsa ve canlı vuruş yönünün en çok ~95° yanındaysa (çaprazlar dahil, geniş bir koni) vuruş değer ve hasar verir. Vuruş efekti canlının görseline değdiği an hasar sayılır; çok yakındaki (gövdesine yapışık) canlı yönden bağımsız vurulur. Yumruk ve tek elli silahlar ilk değdiği canlıya vurur.
- **Canlının her yeri sayılır:** uzaklık canlının gövde noktasına değil, **çiziminin kapladığı kutuya** (kıskaçlar, kuyruk, boynuz, kanat dahil; gölge ve can çubuğu hariç; her tür ilk vuruşta bir kez ölçülür, yöne göre aynalanır, büyük Reislerde boyla çarpılır) ölçülür: göğüsten kutunun en yakın noktasına uzaklık silahın menzili + 3 pikseli geçmiyorsa ve o nokta vuruş yönünün en çok ~95° yanındaysa vuruş değer. Böylece kerevitin kıskacına, geyiğin boynuzuna değen vuruş da hasar verir. **Bütün canlılarda** (iki adada da, Reisler dahil) geçerlidir; çizimi ölçülemeyen bir canlı olursa yukarıdaki eski kural kullanılır.
  - **Özel vuruşlarda da (9 Kasım 2026, Boğaç: "mızrak değmesine rağmen atların kafasına hasar yemedikleri oldu; silahlar temas ettikleri ilk canlıya vurmalı"):** ters kesik, derin dürtme, delip geçme, hamle gibi özel vuruşların alanı da canlının yalnızca ayak dairesine değil, **çiziminin kapladığı kutunun her yerine** (baş, boyun, kuyruk) bakar; mızrağın ucu atın başına değerse vurur.
  - **Silahın çizildiği yay (9 Kasım 2026, Boğaç: "meşale baya baya değiyor ama hasar almıyorlar; canlının neresine değerse değsin bütün silahlar vurmalı"):** normal vuruşta da silahın savrulduğu yay (vuruş yönünün iki yanına ~77°, menzil + 8 px) canlının çiziminin kapladığı kutunun herhangi bir yerine değerse vuruş sayılır (yalnızca 4 yöne bakan dar bir koni değil). Yön, farenle nişan aldığın yöndür. Meşale, yumruk, kılıç, mızrak, balta: hepsi.
- **Sıkışan canlı çıkar (9 Kasım 2026, Boğaç: "reis suda takıldı, hiçbir şey yapmıyor"):** bir canlı (Reisler dahil) giremeyeceği bir yerde (su, duvar) kalırsa olduğu yerde donmaz; en yakın girebileceği yere yürüyüp devam eder.

- Gerçek hasar = silah × Güç özelliği (1 + 0,08 × Güç puanı) × Güçlü kol yeteneği × Güç etkisi 1,2 × Güçsüzlük 0,8. **Seviye hasarı doğrudan artırmaz**; artış seviye puanlarından ve yeteneklerden gelir. Silah yuvasındaki silah, elde silah yokken kullanılır. **Eldeki silah doğrudan kullanılır, "sırt" yoktur:** alet kemerinden bir silahı eline aldığında vuruşlar o silahla yapılır; silah kemerde ve çantada yerinde kalır, hiçbir yuvaya taşınmaz. Kemerde tekerlekle ya da 1–5 tuşlarıyla gezinmek yalnızca eldekini değiştirir, kemerdeki eşyaları yerinden oynatmaz. Kemerdeki bir yuvanın eşyasını değiştirmek için yuvaya sağ tıklanır ya da basılı tutulur.
- Vuruş üç evrelidir (hazırlık, darbe, takip); isabette kısa bir donma olur, ıskalarsan bir an açık kalırsın. Her isabet silahı 1 köreltir.
- Reisler ve iri türler (Timsah, Yaban öküzü, Kara ejder, Mağara ayısı, golemler, ejderler, robotlar, muhafızlar) vuruşla geri itilmez.

### Atılma, savuşturma, savunma

- **Atılma / takla** (Boşluk; öğreticide Börü ücretsiz öğretir): **0,46 sn** (animasyon biraz uzasın; önce 0,38), 50 piksel; boyunca **dokunulmazsın**. 14 enerji, bekleme 0,76 sn (Çevik atılma I/II/III: 9/7/5 enerji, 0,45/0,38/0,30 sn; Uzun atılma: %25 daha uzağa). Bir saldırının içinden taklayla geçersen "Sıyrıldın!" +6 enerji (Sıyrılma ustası ile +14).
- **Takla görüntüsü:** takla artık karakterin döndürülmüş resmi değil, **16 adımlık** bir animasyon: 8 ana poz (çömelme, öne atılma, top olma, üç top hâlinde yuvarlanma pozu, diz üstü açılma, doğrulma) ve her ikisinin arasında bir ara poz. Pozlar karakterin kendi çiziminden (ten, saç, şapka/miğfer, gövde zırhı, eldiven, çizme) parça parça kurulur: baş, gövde ve bacaklar ayrı ayrı yer değiştirir; elde tutulan alet/silah ve meşale takla boyunca görünmez. Sağa/sola taklada karakter yan döner ve yuvarlanır; yukarı/aşağı taklada öne doğru takla (baş aşağı geçerken sırtı görünür). Arkasında bir önceki adımın soluk izi kalır. **Piksel bütünlüğü ("sağa sola gözleri pörtletiyor"):** poz, karakterin kendi piksel boyunda küçük bir tuvalde döndürülüp bütün olarak ekrana konur; böylece her piksel aynı boyda kalır (büyük ekran resmini döndürmek bazı satırları uzatıp gözleri büyütüyordu). Dönüş 11,25°'lik adımlarla yapılır, 12°'den küçük eğiklik dik çizilir. süre **0,46 sn** (mesafe yine 50 piksel, takla biraz daha yavaş). **Gözler:** top hâlindeki dört pozda (ve aralarındaki adımlarda) gözler sıkıca kapalı çizilir; dönen açık gözler kapkara büyümüş gibi görünüyordu. Geri almak istenirse bu sürümün değişikliği geri alınır (eski 4 pozlu dönme geri gelir).
- **Savuşturma da öğrenilir:** oyunun başında savuşturma ve gard (sağ tık / E, telefonda Savuş düğmesi) **kapalıdır**; Börü takla dersinin hemen ardından ücretsiz öğretir (öğretici, 11. adım). Öğreticiyi atlayan Börü ile konuşunca ücretsiz öğrenir. Bilmeden basınca "Savuşturmayı henüz bilmiyorsun: Savaşçı Börü öğretir" der; telefonda Savuş düğmesi öğrenilince görünür.
- **Savuşturma** (sağ tık, darbe değmeden hemen önce): 0,2 sn pencere (telefonda 0,25; Savuşturma ustası I/II ile ×1,3 / ×1,6), 5 enerji. Başarılıysa hasar almazsın, canavar geri savrulur ve **1,6 sn sersemler**, +6 enerji, ulti +10. Fırlatılan diken, ateş ve büyüler de savuşturulur.
- **Darbe renkleri** (canavarın başındaki "!"): **beyaz** = normal, savuşturulur · **sarı** = ağır (×1,4 hasar), savuşturulur · **kırmızı** "!!" = savuşturulamaz (×1,7 hasar), ancak takla ile kaçılır. Reisin yere vurması ve yakalama da savuşturulamaz.
- **Savunma duruşu** (sağ tık basılı tut): %45 hızla yürürsün, vuramazsın; fiziksel hasar beyazda ×0,35, sarıda ×0,45, kırmızıda ×0,7. Her engel enerji yer; enerji biterse kalkan düşer.

### Özel vuruşlar (kombolar)

| Giriş | Hamle |
|---|---|
| Çift tık (0,18 sn içinde) | **Çift vuruş** |
| Basılı tut (0,55 sn halka dolar), bırak | **Güçlü vuruş** |
| Takla sırasında ya da hemen sonra tık | **Takla vuruşu** (en çok **3,5 sn**'de bir; arada aynı giriş normal vuruş olur ve karakterin üstünde gri "… N sn" yazar. 10 Kasım 2026, Boğaç: "ard arda spamleyince çok güçlü oluyor") |
| Tık → takla (0,9 sn içinde) → tık | **Bitirici** |
| Vuruşun hareketi bittiği an tık (0,26 sn pencere) | **Ritimli 2. vuruş**; onun bitişinde yine tık: **Ritimli 3. vuruş** |

Her silahın kendi hamleleri vardır (parantezde hasar çarpanı ve enerji):

| Silah | Çift vuruş | Güçlü vuruş | Takla vuruşu | Bitirici | Ritim 2. | Ritim 3. |
|---|---|---|---|---|---|---|
| Kılıç | Çift kesik (×0,85+×0,95; 10) | Dönen kesik, 360° (×2,2; 18) | Hamle (×1,6; 12) | Kılıç fırtınası (3×0,9 + ×2,1, sersem; 22) | Ters kesik (×1,5; 6) | Ağır kesik (×2,6, sersem; 10) |
| Mızrak | Çifte dürtme (×0,9+×1,15; 10) | Mızrak fırlatma, delip geçer (×2,4; 18) | Koşarak saplama (×1,8; 12) | Sırıkla sıçrama, çevre (×2,2, sersem; 22) | Derin dürtme (×1,5; 6) | Delip geçme (×2,6, sersem; 10) |
| Savaş çekici | Çifte ezme: iki ezme, ikincisi önüne kısa bir çatlak açar (×1,0+×1,3; 11) | **Yer yarığı:** önüne 110 px ilerleyen bir çatlak, üstündekiler (×2,4, sersem 1,2 sn; 20) | Ezerek atılma: atılıp yere iner, iniş yerinde küçük krater (çevre 30 px ×1,8, sersem 0,4 sn; 13) | **Deprem çekici:** önüne giderek büyüyen 3 ezme kraterı (×1,2 / ×1,6 / ×2,4, sonuncusu sersem 1,2 sn; 24) | Yandan ezme (×1,7; 8) | Kafa ezen: tepeden indirir, çarptığı yerde krater (çevre 26 px ×3, sersem 1 sn; 12) |
| Topuz | Üçlü darbe: dar, çok hızlı üç vuruş (3×0,7; 9) | **Bumerang:** topuz fırlatılır, 200 px gider ve geri döner; gidişte ve dönüşte vurur (her geçiş ×1,6; 16) | **Zikzak:** iki kısa atılış, her birinde en yakın düşmana (2×1,2; 10) | **Kombo patlatma:** kombo sayacını harcar: ×(1,5 + 0,5×kombo), kombo 3 ve üstüyse kıvılcım 2 düşmana daha sıçrar; sayaç sıfırlanır (20) | Hızlı darbe (×1,4; 5) | **Çan çalan:** metal bir çınlama, sersem 0,7 sn (×2,2; 8) |
| Balta/kazma | Geri savuruş (×1,25; 10) | Yere vurma, çevre (×2,6, sersem; 18) | Dönerek biçme (×1,5; 12) | Ezici darbe (×3,2, sersem; 22) | Yan savuruş (×1,6; 7) | Kafa kıran (×3, sersem; 11) |
| Yumruk | Çifte yumruk (8) | Güçlü yumruk (×3, sersem; 16) | Omuz atma (×1,3; 10) | Tekme kombosu (4×0,75 + ×1,7; 20) | Kroşe (×1,5; 5) | Aparkat (×2,6, sersem; 9) |
| Meşale | Alev savuruşu (×1,5; 10) | Ateş çemberi (×2,4; 18) | Ateşli hamle (×1,8; 12) | Alev patlaması (×3; 22) | Kor savuruşu (×1,6; 7) | Alev kesiği (×2,4; 11) |
| Yay (ok) | Çift ok, ±0,08 rad (2×1,0; 2 ok, 8) | Gergin atış (×3, menzil ×1,3; 1 ok, 14) | Geri sıçrayıp atış (×1,5; 1 ok, 10) | Ok yelpazesi, 5 ok (5×0,9; 5 ok, 18) | Hızlı atış (2×0,9; 2 ok, 5) | Delici ok (×2,6, hız ×1,3; 1 ok, 8) |
| Asa (mana) | Üçlü atış (×2 mana) | Büyük büyü ×3 (×3) | Kaçarken atış (×1,5) | Büyü halkası, 8 yön (×4) | İkiz atış (×1,4) | Güç topu ×2,8 (×2,2) |
| Ateşli (mermi) | Çift atış (2) | Nişanlı atış ×3 (1) | Kayarak atış, 3 yayılım (3) | Şarjör boşaltma, 5 atış (5) | Seri atış (2) | Delici mermi ×3,2 (1) |

- **Kritik vuruş:** kritik vuruş normal hasarın **%50 fazlasını** vurur (Ölümcül vuruş yeteneğiyle **%80**); vuranın başında kırmızı "KRİTİK!" yazar, kısa tiz bir ses çıkar.
  - **Savuşturmayla sersemlettiğin canlıya ilk vuruşun her zaman kritiktir** (her silahla, yumrukla bile). Sersemlik vurmadan geçerse bu hak kalkar.
  - **İhtimal** = (seviye: 2. seviyeden başlayarak her seviye **%0,2**, 50. seviyede %9,8, 60. seviyede %11,8 · Keskin göz I **%3** / II **%6** · silahın biyom kademesi **×%1**) × **silah türü**.
  - **Silahın kademesi:** yalnızca ilerleyen biyomların silahları kritik vurabilir. Başlangıç, Bakır, Kemik/Çakmaktaşı setleri ve Basit yay, Odun yayı ve Kemik yay (kademe 0) **kritik vuramaz**; Tunç, Granit, Meşe ve Granit yayı 1; Demir, Timsah, Kızılağaç ve Timsah dişi yayı 2; Çelik, Gümüş, Kuvars, Akçaağaç ve Gümüş yayı 3; Kara çelik, Ejder, Obsidyen, Kor odun yayı 4; Mor kristal, Ametist, Gece ağacı ve Ametist yayı 5; ACT 2 silahları (ateşli silahlar, asalar, Işın kılıcı) 6.
  - **Silah türü:** yay ve ateşli silah **×1,5**, mızrak **×1,2**, topuz **×1,1**, kılıç **×1**, asa **×0,8**, savaş çekici **×0,6**; balta, kazma, meşale ve yumruk **hiç kritik vuramaz** (savuşturma sonrası ilk vuruş hariç).
  - Örnek (50. seviye, yeteneksiz): Demir kılıç %11,8 · Mor kristal savaş çekici %8,9 · Mor kristal topuz %16,3 · Mor kristal mızrak %17,8 · Ametist yayı %22,2 · Tabanca %23,7.
  - Silahın bilgi satırında kritik ihtimali yazar ("kritik %11,8" ya da "kritik vuramaz"). Arenada da aynen geçerlidir.
  - **Yetenek ağacı (Savaş):** üç yetenek değişti: Kâşif gözü → **Keskin göz I** (+%3), Rüzgâr gibi → **Keskin göz II** (toplam +%6, Keskin göz I'den sonra), Baykuş gözü → **Ölümcül vuruş** (kritik %80, Keskin göz II'den sonra). Bunları önceden almış olanlar yeni hallerine sahip olur; harita açılma alanı ve koşu hızı herkes için eski temel değerindedir (7 karo, 1,6 kat), karanlıkta çevreni görme yalnızca meşale, lamba ya da Gece gözü etkisiyle olur.
- **Silahların karakteri ("kılıç, savaş çekici ve topuz kullanış olarak da efekt olarak da farklı olmalı"):** kılıç dengeli silahtır (orta hız, geniş yay; değişmedi). Savaş çekici ve topuzun kendi kuralları vardır; arenada da aynen geçerlidir:
  - **Savaş çekici: yavaş, ağır, kalabalığa karşı.** (1) **Çarptığı yere de vurur:** her isabet, vurulanın çevresindeki (36 px) öbür düşmanlara hasarının **yarısını** verir. (2) **Sersemletme birikir:** aynı düşmana 3 saniye içinde **3 isabet** onu **1 sn** sersemletir (Reis ve boss 0,5 sn); sayaç sıfırlanır. (3) **Geri itme iki kat.** (4) **Sağlam duruş:** savururken aldığın hasar **%25 az**. (5) Bedeli: savururken **%40 yavaş** yürürsün; vuruş hızı en yavaş silah (0,62 sn). Efektler toprak ve taş: kraterler, çatlaklar, toz, sıçrayan taşlar; ses kalın bir gümleme.
  - **Topuz: hızlı, hareketli, tek hedefe karşı.** (1) **Kombo sayacı:** 1,2 sn içinde yapılan her isabet bir sonrakinin hasarını **%10** artırır, en çok **%60** (6 isabet; aynı anda birden çok düşmana değmek tek isabet sayılır). Vurulunca ya da 1,2 sn isabet olmazsa sayaç sıfırlanır; sayaç karakterin üstünde yazar ("Kombo ×4"). (2) **Kıvılcım:** her **5. isabette** bir kıvılcım en yakın başka düşmana (120 px içinde) sıçrar, o isabetin **0,8** katı hasar verir. (3) **Hareketli:** vururken yavaşlamazsın; taklanın enerjisi **%30 az**. (4) Bedeli: özel hamlelerinin yayı dar, geri itmesi yarı. Efektler metal ve şimşek: kıvılcımlar, yıldız parlamaları, şimşekler; ses metal çınlaması.
  - İlk kez savaş çekici ya da topuz eline aldığında bu kurallar kısa bir bildirimle anlatılır.
- **Kilit:** ACT 1'de her özel vuruş ve ulti **Börü'den dersi alınana kadar kapalıdır** (kapalı hamle normal vuruş olur). ACT 2'ye geçince ve arenada hepsi açılır.

### Ulti

- Altın ulti çubuğu: her isabet +1,5, özel vuruş +4, ritimli 2. +5, ritimli 3. +10, başarılı savuşturma +10. Dolunca **R** (telefonda Ulti). Ulti boyunca hasar almazsın.
- ACT 1'de ulti dersi Kara ejder ya da Kristal golem Reisi yenilince açılır; ACT 2'de kendiliğinden öğrenilir.

| Silah | Ulti | Etki |
|---|---|---|
| Kılıç | Kılıç dansı | 8 yönlü dönüş (her biri ×1,2) + ×3 patlama, sersem 1 sn |
| Mızrak | Mızrak yağmuru | Fare yönündeki alana 12 mızrak, her biri ×1,5 |
| Balta | Deprem | Büyüyen 3 halka, ×2,4, sersem 1 sn |
| Savaş çekici | Dağ yaran | Fare yönüne sıçrar; indiği yerden 4 çapraz yöne 120 px çatlak açılır, çatlak boyunca kayalar fışkırır (×2,6, sersem 1,4 sn), ortada ×2 halka |
| Topuz | Gök gürültüsü | Çevrendeki (220 px) en yakın 6 düşmana sırayla şimşek iner (her biri ×2,2, sersem 0,5 sn), sonunda gök gürültüsü (çevre 70 px ×1,5); kombo sayacı dolar (6) |
| Yumruk | Öfke | 10 yumruk + son ×4 |
| Meşale | Ateş fırtınası | 3 ateş halkası ×2 |
| Yay | Ok yağmuru | Fare yönündeki alana 16 ok yağar, her biri ×1,4, sersem 0,3 sn; ok harcamaz |
| Asa | Meteor | Fare yönüne ×5, sersem 1,2 sn |
| Ateşli | Kurşun yağmuru | 20 atış (pompalıda 10), mermi harcamaz |

### Börü'nün dövüş dersleri

Savaşçı Börü ile konuşup "Dövüş dersleri" (yalnızca ACT 1'de, öğretici bittikten sonra). Ücret peşin; ders bitince hamle kalıcı açılır ve XP verilir. Ders için o bölgeyi gezmiş olman gerekir (haritada en az 60 karesi açılmış olmalı).

- Börü bir **alıştırma canavarı** salar: ısırığı zayıftır (canının %5'i; bütün alıştırma canavarlarında, mağara ayısı dahil); öğretir, cezalandırmaz (9 Kasım 2026, Boğaç: "oyunu öğretiyor musun yoksa sinir mi ediyorsun"; "dibime girene kadar saldırmıyorlar, girince ne zaman saldıracakları belli olmuyor"; "savuşturmayı öğretirken kırmızı atak yaptıramazsın"). **Kerevit dersi gibi dövüşür:** senden bir adım uzakta (gövdesi + 30 px) durur ve çevrende hafifçe döner; 1,2–2,2 sn sonra üstünde **!** çıkar ve **0,6 sn** öyle bekler (titrer), sonra sana **bir kez atılır** (0,3 sn), değerse ısırır, sonra yine bir adım geri çekilir. **Kırmızı (savuşturulamaz) vuruş ve yer sarsması yapmaz** (! hep beyaz, bazen sarı); seni canının **¼**'ünün altına indirmez; savuşturulunca sersemler. XP ve ganimet vermez, av ve Reis sayaçlarına sayılmaz, Börü'den 230 pikselden uzağa gitmez. Ölürse ya da kaybolursa Börü'nün yanındaysan 1,5 sn sonra yenisi gelir; sayı sınırı yoktur (önceden ders başına 16'da kesiliyor, ders bitirilemez kalıyordu). "Tek vuruşta öldür" hilesi alıştırma canavarına işlemez.
- **Ders sürerken Reis gelmez**: ders sırasında vahşi hayvan avlayıp bir Reisin sayısını doldurursan Reis ders bitince (ya da bırakılınca) gelir.
- Alandan çıkınca sorulan "Derse dön" seni Börü'nün yakınına (yaklaşık 140 piksel) geri koyar (önceden 230 pikselde, sınırın dibinde bırakıyordu). Vuruş adımlarında saldırmaz ve canı gitmez; "bitir" adımında canı kolayca bitecek kadar azalır; savuşturma ve kaçma adımlarında 2,2–3,2 saniyede bir saldırır.
- Soldaki ders kutusu yalnızca şimdiki adımı gösterir ("adım 1/2"). Börü'de "Dersi yeniden anlat" ve "Dersi baştan başlat" var. Öğrenilmiş dersler ücretsiz tekrar çalışılır (XP vermez).

| Ders | Seviye | Bölge şartı | Ücret | XP | Alıştırma canavarı | Adımlar |
|---|---|---|---|---|---|---|
| Takla vuruşu | 3 | Çayır (Atılma gerekli) | 150 | 40 | Kurt | Saldırırken takla at, 3 kez kurtul → takla vuruşuyla 4 isabet |
| Çift vuruş | 6 | Orman | 300 | 60 | Yaban domuzu | Çift vuruşla 7 isabet (ders domuzu hiç ölmez, "bitir" adımı kalktı) |
| Ritimli 2. vuruş | 12 | Bataklık | 600 | 100 | Bataklık kurdu | Ritimli 2. vuruşla 5 isabet |
| Ritimli 3. vuruş | 15 | Kayalık Dağ | 1.000 | 160 | Muflon | Sırayla: 3 savuşturma → ritimli 3. vuruşla 3 isabet |
| Güçlü vuruş | 17 | Kayalık Dağ | 1.200 | 180 | Yaban öküzü | Savuşturarak 3 canavarı sersemlet → sersem canavara 3 güçlü vuruş |
| Bitirici | 21 | Kül Diyarı (Atılma gerekli) | 2.000 | 300 | Kül kurdu | Takla ile 3 kaçış → bitiriciyle 3 isabet |
| Ulti | – | Kara ejder ya da Kristal golem Reisi yenilmiş | 2.500 | 500 | Mağara ayısı | Çubuk dolunca R: ulti ile 3 isabet (derste çubuk 3 kat hızlı dolar) |

### Canavarlar nasıl savaşır

- **Mizaç:** *zararsız* kaçar; *nötr* vurulunca karşılık verir, 220 piksel uzaklaşınca sakinleşir; **ilk vuruşta hemen sana döner ve saldırır:** yakınındayken (110 piksel içinde) vurulduğu an sana bakar, kırmızı "!" ile sana atılır (vurmayı sürdürmen gerekmez); uzaktan (ok, büyü) vurulduysa seni kovalar. Eskiden vurulan nötr canlı yavaş kalkıyordu, sen art arda vurdukça geri savruluyor, uzun süre karşılık veremiyordu. **Kıyıdaki Kerevit (nötr)** artık kızınca saniyede 46 piksel koşar (eskiden 14); *saldırgan* fark etme menziline girince saldırır, menzilin iki katı uzaklaşınca bırakır. Güvenli bölgede saldırgan canavar saldırmaz. Aynı anda en çok 4 canavar kovalar.
- **Fareyle canlının üstüne gelince:** yalnızca **kısa tek etiket** çıkar: canlının adı ve altında ne yaptığı (zararsız / kızdırırsan saldırır / saldırgan · vur). İmlecin yanında can, huy ve düşürdüklerini sayan ikinci kutu artık çıkmaz (bunlar Almanak'ta).
  - **Etiketin görünüşü (9 Kasım 2026, Boğaç: "daha şık bir tasarımda olsun"):** koyu yarı saydam, köşeleri hafif yuvarlak küçük bir kart; solunda ince renkli bir şerit (canlıda huyuna göre: saldırgan kırmızı, kızdırırsan saldırır turuncu, zararsız yeşil; ağaç, maden, kişi ve yerdeki eşyada oyunun altın rengi). Ad kalın, altındaki satır küçük ve soluk. İmlecin sağ üstünde durur, ekranın kenarından taşmaz.
  - **Dövüşte çıkmaz (9 Kasım 2026, Boğaç: "bir hayvana vurduğumda ya da saldırı altındayken yazmasınlar"):** bir canlıya vurduktan sonraki **3 saniye**, seni kovalayan ya da sana kızmış bir canlı ekrandayken ve ısırıldıktan sonraki 3 saniye boyunca hiçbir üzerine gelme etiketi (canlı, ağaç, eşya) görünmez.
- **Sürüler:** sürü hayvanının birine vurunca ya da saldırgan sürüye yaklaşınca hepsi gelir; sırayla saldırırlar (6. seviyeden önce aynı anda 1, sonra 2).
- **Saldırı:** ayrı bir hazırlık beklemesi yok: kırmızı **"!"** belirdiği an (0,1 sn içinde) canavar sana doğru **atılır** (0,3 sn) → ısırık. Menzilliler 0,6 sn hazırlanıp atar. Bir canavar son saldırısından 1 sn geçmeden yenisine başlayamaz (Reisler hariç).
- **Canavar içinden geçmez, içinde dolanmaz (9 Kasım 2026, Boğaç: "arkama doğru geçiyor", "içimde dolanıyor"):** yürüyen canavar senin önünde, kendi boyu kadar uzakta durur (gövde yarıçapı + 10 px); hiçbir canavar senin içinde duramaz, gövdesi kadar dışarı itilir. Atılış sana değdiği an **durur** (önceden arkana kadar geçip gidiyordu); ısırığın menzili değişmedi.
- **Atılış hep sana doğru, kaçarsan işlemez:** canavar ! ile birlikte o an **bulunduğun yere** atılır; atılış başladıktan sonra **yolu değişmez**, düz gider. ! görünür görünmez takla atarsan (ya da yolundan çekilirsen) kaçarsın, ısırık işlemez; sana değerse ısırık işler. Çok erken atılan takla biter ve işe yaramaz. Üstüne atlayan **bütün canlılar** böyledir; Börü'nün alıştırma kereviti de (orada atılış 0,45 sn, daha yavaş). **Savuşturma** (sağ tık / E basılı, telefonda Savuş) da kaçırır: ısırık değmeden en çok 0,2 sn önce basılırsa beyaz ve sarı ! savuşturulur (kırmızı ! yalnızca taklayla kaçılır). !'in rengi atılışla birlikte görünür; sarı ve kırmızı vuruşlara eklenen ayrı bekleme (0,18 / 0,3 sn) kalktı.
- **Saldırırken yüzü hep sana dönük:** bir canavar saldırıya geçtiği andan bitene kadar (kırmızı/sarı işaret, menzillinin 0,6 sn hazırlığı, Reis hamlelerinin hazırlığı, kükreme, alev, kavrama, üçlü vuruş, hamleden sonraki yorgunluk) yüzünü hep karakterine çevirir; sen etrafında dönsen de sırtını dönmez. Geri geri kaçan menzilliler de sana bakarak çekilir. Yalnızca gövdesiyle hızla yol aldığı anlarda (atılış, sıçramada havadayken, hücumda koşarken) gittiği yöne bakar. Tam üstünde ya da altındayken (yatayda 3 pikselden yakın) yönünü değiştirmez, titremesin diye.
- **Önce başını çevirir, sonra başının doğrultusunda atılır:** canlılar yandan çizilir; eskiden karakter üstte ya da alttayken canavar yan durup dikine atılıyordu ("yan saldırı"). Artık üstüne atlayan **bütün canlılar** (Börü'nün alıştırma kereviti de) saldırı menziline girince (menzil + 24 piksel) gövdesini **başı sana bakacak şekilde döndürür** (saniyede ~14 radyan, en çok 90°: tam üstündeysen başı yukarı, tam altındaysan aşağı bakar), ! ile atılırken başının gösterdiği doğrultuda gider; atılış boyunca başı gittiği yöne bakar. Saldırı bitince ya da uzaklaşınca yavaşça (saniyede ~8 radyan) yeniden yatay durur. Can çubuğu, ! işareti ve hedef çizgisi dönmez, eski yerinde çizilir. Sersemken, geri savrulurken ve Reis'in özel hamlelerinde (sıçrama, hücum…) dönmez. Zamanlamalar (! 0,1 sn, atılış 0,3 sn; kerevitte 0,45 sn) değişmez. **Reis dönmez ("tek bir can barı olsun"):** Reis'lerin çizimi hiç döndürülmez; dönünce Reis'in mor can çubuğu ve adı yan yatıyor, üstüne ikinci küçük bir can çubuğu çıkıyordu. Reis'in tek can çubuğu taçlı uzun mor çubuktur.
- **Sıkışan canlı yine saldırır:** bir canavar seni kovalarken bir engele (kaya, duvar, ağaç, su kenarı) takılıp sana yaklaşamazsa ve sen ona yakın dövüşle vurabiliyorsan, artık güvenle kesilemez. Kovalayan bir canlı **0,4 sn** yerinde sayar ve sen **44 piksel** içindeysen, bekleme süresi dolunca normal saldırısını yapar (başını çevirir, kırmızı/sarı/beyaz **!** ile atılır). Atılışı engele takılsa da kıskacı/dişi engelin üstünden yetişir: atılış sürerken 44 piksel içindeysen isabet eder (savuşturma ve atılmayla yine kaçınılır). Örnek: kumsalda iki kaya arasına sıkışan kerevit. Uzaktan silahlar (asa, tüfek) ve uzaktan saldıran canlılar etkilenmez.
- **Canlılar canını yeniler:** hasar almış bir canlı (hayvan, canavar, Reis, boss) **6 saniye** hiç hasar almazsa ve **dövüşte değilse** canını yavaş yavaş yeniler: saniyede tam canının **%4**'ü (boştan doluya ~25 sn), tam cana kadar. Dövüşte sayılır: seni kovalarken 200 pikselden yakınsa, saldırıya hazırlanıyor ya da atılıyorsa. Yeni bir hasar 6 saniyeyi baştan başlatır. Yani kaçıp geri gelirsen ya da uzun ara verirsen yaraladığın canlı iyileşmiş olur; kesintisiz bir dövüşte iyileşmez. Yanma (meşale) da hasar sayılır.
- **Doğma:** canlılar oyuncunun 330–470 piksel çevresinde doğar, 760 pikselden uzaklaşınca silinir. Bataklık, Kayalık Dağ, Kül Diyarı ve Mor Kristal'de doğacak noktanın **kuşağı** (Giriş/Orta/Derin) hangi canlının doğabileceğini belirler (kuşak kuralı: ACT 1 › Biyomlar › Bataklık). Gece canlıları gündüz uzaktaysa silinir.

**Özel hamleler** (kovalarken arada bir):

| Hamle | Renk | Ne yapar, nasıl kaçılır |
|---|---|---|
| Sıçrama | sarı (iri türde kırmızı) | işaret çıktığı an (0,12 sn) **o an bulunduğun yere** atlar; havadayken (0,42 sn) yolu değişmez. İniş çevresine hasar ve itme. Yana çekil ya da inerken taklada ol. |
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

### Ölüm pozu ve leş (v3.37, Boğaç)

- **Ölüm pozu:** öldürdüğün her canlı (Reisler, mağara canlıları, ACT 2 canlıları dahil) olduğu yerde **yan yatarak yere düşer** (yaklaşık 0,35 saniyelik bir devrilme), sonra hareketsiz yatar; altında **tek** koyu bir gölge olur (canlının ayaktayken altında duran gölgesi leşte çizilmez; v3.71), can çubuğu görünmez.
- **Düşürdükleri leşin içindedir:** bir canlıyı öldürünce düşürdükleri artık hemen yere saçılmaz. Ekranda "{Canlı} avlandı · leşini topla" yazar. **Leşin yanına gidip topla** (bilgisayarda **E**, telefonda toplama düğmesi; üstünde "{Canlı} leşini topla" yazar): eşya toplar gibi çubuk dolar. Süre canlının büyüklüğüne göredir: **0,8 + √can / 12 saniye, en çok 3 saniye** (Toplayıcılık yetenekleri hızlandırır). Yürürsen ya da bir canavar sana saldırıyorsa toplama yarıda kalır. Çubuk dolunca leş kaybolur ve içindekiler leşin yerinde **yere saçılır** (yerdeki eşya kuralları geçerlidir: 180 sn sonra kaybolur, görev eşyaları kaybolmaz). İçinde bir şey yoksa "Leşte işe yarar bir şey yok" yazar.
- **Toplanmayan leş kaybolur (oyun saatiyle):** leş yerde **4 oyun saati** kalır; son **1 oyun saati** boyunca yanıp söner, sonra içindekilerle birlikte kaybolur (gündüz 4 oyun saati gerçekte yaklaşık 2,3 dakikadır; uyuyunca geçen saatler de sayılır).
  - **Gün dönümünde kaybolmaz (10 Kasım 2026, Boğaç: "geyikler öldürmüştüm, 16. gün yazısıyla yeni öldürdüğüm cesetler bir anda kayboldular"):** 4 saat kesintisiz oyun saatiyle sayılır; gece yarısı ve sabah 06:00'daki "N. Gün" geçişi süreyi atlatmaz. (Gece 00:00–06:00 arasında öldürülen leş, gün sayısı sabah arttığı için 24 saat yaşlanmış sayılıp siliniyordu.) Aynı kesintisiz saat evcil hayvanların büyüme ve yeniden gelme sürelerinde ve tarladaki fidanlarda da kullanılır.
- **Kaybolmayan leşler:** Reis leşleri ve içinde görev eşyası (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları) olan leşler toplanana kadar kalır, yanıp sönmez.
- **Kayıt:** yerdeki leşler (yeri, türü ve içindekiler) kayda yazılır; kayıt yüklenince yerlerinde durur.
- **İstisnalar:** Kemal'in ilk dövüş dersindeki ve Börü'nün dövüş derslerindeki canlıların düşürdükleri eskisi gibi hemen yere düşer; leşleri yalnızca görüntüdür, 3 saniye sonra söner. **Yıldızsızlar** Vio’yu eskisi gibi doğrudan keseye bırakır; leşleri 3 saniye içinde mor bir dumanla kaybolur. **Arenada** ölen canlının leşi 3 saniye yatıp söner, toplanmaz.

### Mor ışık saldırıları ve Yıldızsızlar (v3.30, Boğaç)

Belirli günlerde mor ışık, karakterin bulunduğu bölgeye **o dünyadan olmayan, mor renkli uzaylı canlılar** indirir: **Yıldızsızlar**.

- **Ne zaman (v3.31, Boğaç: gece, gecenin başladığı an, belli günler):** saldırı **gecenin başladığı an (20:00)** gelir. Günleri sabittir: **6, 11, 18, 22, 31, 37, 40, 48, 53, 60, 64, 73, 79, 82, 90, 95…** (aralar sırayla 5, 7, 4, 9, 6, 3, 8 gün ve bu sıra tekrar eder; aralar hep 3–9 gün; v3.31, Boğaç: 10 günlük ara çok uzun, kaldırıldı). **Özel olaylı günlere denk gelmez:** 5. gün (Yıldızsız Gezgin'in köpeği), 15. gün (Yıldızsız Işıkçı gelmeye başlar), 20. gün (mor sinyal) ve ilk 3 gün; sıradaki gün bunlardan biriyse bir sonraki olaysız güne kayar. Her iki adada da olur; arenada olmaz. **Mor gece**'de (her yılın son gecesi) bu sıradan bağımsız olarak saldırı kesin gelir ve ertelenmez (bkz. Mevsimler).
- **Ertelenir:** gece başladığı an (20:00) **evin içindeysen, mağaradaysan, deniz yolculuğundaysan ya da kendi yaktığın bir kamp ateşinin yanındaysan** saldırı o gün olmaz (kişilerin kampları ve ateşleri artık saldırıyı ertelemez; 9 Kasım 2026, Boğaç), **bir sonraki olaysız güne** kayar (ör. 11. günde evdeysen 12. gün). Uyuyarak geçen gece de ertesi olaysız güne kayar. O an bir konuşma ya da pencere açıksa, kapanınca gelir (20:00–21:00 arası). Bir saldırı olunca sıradaki, listedeki ilk en az 3 gün sonraki gündür. Sıradaki saldırının günü kayıtta saklanır.
- **Gece aydınlıktır:** saldırı sürerken bütün ada mor ışıkla aydınlanır (meşale gerekmez, mor ışık seni bayıltmaz); her Yıldızsız da kendi soluk ışığıyla parlar.
- **Başlarken (9 Kasım 2026, Boğaç: "belirli bir bölgede değil tüm adada mora döndürmeli aurayı, her yere gelebilmeliler, NPC'ler dahil; mor bir halka içerisinde değil"):** ekranda "Mor ışık saldırısı! · Yıldızsızlar geliyor" yazar, uğultu ve gümbürtü duyulur. **Bütün ada mora bürünür** (ekranın her yerinde mor bir örtü, çevrende yükselen mor zerreler); halka yoktur. Yıldızsızlar, gökten inen **mor ışık sütunlarıyla** (0,7 sn) **o an bulunduğun yerin çevresine** (7–16 kare) iner; sen nereye gidersen gelirler (kişilerin kampları dahil).
- **İki dalga:** önce yarısı iner; ilk dalgadan en çok 1 tane kalınca ya da 20 sn geçince kalanı iner. Sayı: (4 + (gün / 5) + (seviye / 6)) × 0,75 (yuvarlanır), en az 3, en çok 9 (9 Kasım 2026, Boğaç: "sayıları ve güçleri %25 azalt").
- **Peşini bırakmazlar (v3.31, Boğaç: "birden ben yokmuşum gibi bırakıp gidiyorlar"):** öbür canlılar kendi biyomlarının sınırında kovalamayı bırakıp geri döner; Yıldızsızlar bu kurala uymaz, biyom sınırını geçip seni kovalamaya devam eder. **Kişilerin kamplarına da girerler** (Kemal'in kampı, Zümrüt'ün kazanı, Dursun'un ocağı, kişilerin ateşleri; 9 Kasım 2026, Boğaç); yalnızca **senin yaktığın kamp ateşinin** yanına ve evin içine girmezler.
- **Kişiler yardım eder (9 Kasım 2026, Boğaç: "Börü savaşsın, Zümrüt büyü yapsın, Kemal can takviyesi versin"):** dövüş bir kişinin yanına gelirse (sen ~22 kare yakınındaysan ya da bir Yıldızsız ~20 kare yakınındaysa) o kişi savaşa katılır; ilk katıldığında başının üstünde bir söz ve ekranda bir bildirim çıkar. Yıldızsızlar onlara saldırmaz, yalnızca sana saldırır.
  - **Savaşçı Börü** savaşır: yerinin ~16 kare çevresindeki en yakın Yıldızsız'a koşar, saniyede bir vurur (senin silahının bir vuruşunun 1,1 katı). Saldırı bitince yerine yürüyerek döner.
  - **Cadı Zümrüt** büyü yapar: ~17 kare içindeki bir Yıldızsız'a 3,5 saniyede bir yeşil-mor bir ışın yollar (senin vuruşunun 1,4 katı).
  - **Yaşlı Kemal** yaralarını sarar: onun ~10 kare yakınındaysan 5 saniyede bir tam canının **%8**'i kadar can verir.
  - Yardımcıların öldürdükleri de Vio düşürür (sana yazılır).
- **Bitiş:** bütün Yıldızsızlar ölünce "Mor ışık çekildi" yazar ve ada eski rengine döner. Bayılırsan ya da 4 dakika (gerçek) geçerse saldırı yarıda biter, kalan Yıldızsızlar ışıkla geri çekilir. Uzaklaşmak saldırıyı bitirmez.
- **Görünüşleri (10 Kasım 2026, Boğaç: "daha uzaylı gibi mor canlılar olmalılar, mor ışıkları daha parlak olmalı"):** dört tür de koyu mor gövdeli, bu dünyaya benzemeyen uzaylı biçimlerdedir (aşağıdaki tabloda); gözleri yeşil yanar, kovalarken kırmızıya döner. Her birinin çevresinde nabız gibi atan **parlak mor bir ışık** vardır; gözleri, çekirdekleri, benekleri ve anten uçları ayrıca parlar. Saldırıda her Yıldızsız çevresini (48 px) aydınlatır. Kıpırdarlar: gözcünün dokunaçları ve antenleri, sürüngenin bacakları, tükürücünün gövdesi, devin bacakları; dev ağır vuruştan önce kollarını kaldırır.
- **Türler (gücüne ve güne göre):** saldırıya hangi türlerin geleceği seviyene ve güne göre belirlenir:

| Tür | Ne zaman gelir | Nasıl savaşır | Can (silahının kaç vuruşu) | Hasar (tam canının) | Vio |
|---|---|---|---|---|---|
| Yıldızsız gözcü | her saldırıda | yerden biraz yukarıda süzülen, saydam kubbeli başında tek dev gözü, uçları parlayan iki anteni ve dört dokunacı olan küçük canlı; hızlı, ısırır | 3 vuruş × 0,75 | %5 × 0,75 | 6–10 |
| Yıldızsız sürüngen | her saldırıda | yerde sürünen, uzun başlı, sırtı dikenli ve parlayan benekli, sekiz bacaklı, kuyruğunun ucu parlayan canlı | 6 vuruş × 0,75 | %8 × 0,75 | 12–20 |
| Yıldızsız tükürücü | seviye 5 ya da 8. gün | sümüklü böcek gövdeli, saplı iki gözlü, karnında parlayan bir kesesi olan canlı; uzaktan mor top tükürür (kenara çekil) | 4 vuruş × 0,75 | %6 × 0,75 | 10–16 |
| Yıldızsız dev | seviye 12 ya da 18. gün (saldırıda en çok 2) | iri kafalı, üç çekik kara gözlü, uzun pençeli kollu, göğsünde parlayan çekirdek; ağır vuruşundan önce durup kollarını kaldırır (kaç!) | 14 vuruş × 0,75 | %14 × 0,75 | 40–60 |

  - **Can**, elindeki (ya da silah yuvandaki) silahın bir vuruşunun hasarıyla ölçülür (en az 6 sayılır) ve günle artar: her gün +%2, en çok +%80. **Hasar** tam canının yüzdesidir ve günle aynı oranda artar; zırhın bunu da azaltır. Yani güçlendikçe Yıldızsızlar da güçlenir. Hepsi saldırgandır, seni uzaktan görür ve kovalar. Bütün can ve hasarlar tablodaki değerin **0,75** katıdır (9 Kasım 2026, Boğaç).
  - **XP:** türün vuruş sayısının 3 katı × (1 + seviye × 0,15).
- **Vio düşürürler:** her Yıldızsız ölünce yerde altın parıltısı çıkar ve tablodaki kadar **Vio** doğrudan keseye eklenir ("+12 Vio"); sayı gün ve seviyeyle artar (× (1 + gün × 0,03) × (1 + seviye × 0,04)). Eşya düşürmezler.
- **Reisleri yoktur:** kaç tane avlarsan avla Yıldızsız Reisi gelmez. "Avcıların avcısı" ve "Ganimet avcısı" başarımlarına sayılmazlar.
- **Almanak:** ilk saldırıdan sonra almanağın sol sütununda biyomların altında **Yıldızsızlar** sayfası açılır; dört türün kartı oradadır (öldürülene kadar siluet ve ???). Kartta can ve hasar, son saldırıdaki değerleridir; düşürdükleri "Vio".
- **Arena:** dört tür arenanın canlı listesinde **Yıldızsızlar** başlığıyla seçilebilir (son mor ışık saldırısındaki değerleriyle; o oturumda saldırı olmadıysa başlangıç değerleriyle: gözcü 23 can, sürüngen 45, tükürücü 30, dev 105).

## Arena, hileler, kayıt

### Arena

Ana menüde **⚔ Arena**; iyi ya da kötü son başarımı kazanılınca ya da hile modu açıkken açılır. Seviye (1/10/25/50/60; seçilen seviyenin puanları bütün özelliklere eşit dağılır), giyim ve silah seçilir; iki adanın bütün canlıları ve Reisleri ile dövüşülür. Arenada bütün yetenekler, **atılma** ve **savuşturma/gard** açıktır (önceden savuşturma kapalıydı, telefonda Savuş düğmesi çıkmıyordu). Varsayılan olarak kimsenin canı gitmez (hasar ölçülür), enerji/mana/mermi sınırsızdır; "Gerçek dövüş" anahtarıyla gerçek olur. Arenada hiçbir şey kaydedilmez ve başarım işlemez. **Arena kayda asla dokunmaz:** arenaya bir kez girildikten sonra sayfa yeniden açılana kadar hiçbir kayıt (otomatik ya da elle) yazılmaz; arenadan çıkarken de yazılmaz. (o kayıt geri gelmez, elle kayıtlar etkilenmedi.)
- **Meşale yuvası arenada:** silah seçicisinin altında **"Sol el · meşale yuvası"** satırı vardır: Meşalesiz, Kaba meşale ya da Meşale. Seçilen meşale yanar ve sol ele geçer; elde başka silah yoksa meşale vurur (7 hasar). Yuva arenada da tıklanınca söner/yanar.

### Hileler

- **Açmak:** ana menüde klavyeyle `cheat` yaz (tekrar yazınca kapanır) ya da telefonda Ayarlar başlığına art arda 3 kez dokun. **Oyun kolunda:** ana menüde **Yukarı, Yukarı, Aşağı, Aşağı, Sol, Sağ, Sol, Sağ, B, A** (yönler yön tuşlarıyla ya da sol çubukla; tuşlar arasında en çok 2 saniye) girilince hile ayarları açılır, yeniden girilince gizlenip kapanır (`cheat` yazmakla aynı). Son A'ya basış o anda seçili düğmeye basmaz. Kod oyunun içinde girilirse "Hile kodu ana menüde çalışır" yazar. Sayfa her açıldığında bütün hile anahtarları kapalı başlar.
- **Açınca Hile modu da açılır (telefonda hileler açılamıyordu):** eskiden 3 dokunuş (ya da `cheat`) yalnızca hile ayarlarını **görünür** yapıyordu; asıl **Hile modu** anahtarı ayrıca ana menünün Ayarlar'ından açılmalıydı ve oyunun içindeki Ayarlar'da bu anahtar gizli olduğu için oyuna girince hiçbir hile görünmüyordu. Artık: (1) hile ayarları açıldığı an **Hile modu da kendiliğinden açılır** (tek tek hileler yine kapalı başlar; oyun içindeki Ayarlar'da hepsi görünür). (2) **Hile modu anahtarı oyunun içindeki Ayarlar'da da görünür**; oradan açılıp kapatılabilir. (3) Dokunarak ya da tıklayarak (ana menüde 3 kez dokunma, Ayarlar başlığına 3 kez dokunma) hile ayarları yalnızca **açılır**, bir daha dokunmak onları **kapatmaz** (eskiden ana menüde hızlıca 3 kez dokunmak hepsini yanlışlıkla kapatıyordu). Kapatmak için Hile modu anahtarını kapat ya da klavyeyle yeniden `cheat` yaz.
- **Kalıcı değildir:** Hile modu sekme/oturum boyunca açık kalır, sayfa yenilenince kapanır (cihazda kalıcı bayrak tutulmaz).
- **Ekrandaki yazılar:** anahtarın adı yalnızca "Hile modu"dur ("test için" yazmaz); Tanrı modunun açıklaması mor ışıktan söz etmez (oyuncuya ipucu vermesin). **Eşya araması:** arama kutusuna yazarken oyunun tuşları (ör. F = topla) çalışmaz; "e" harfi yazılabilir.
- **Sınırsız Vio açıkken de** görev ve satış Vio’ları hesaba yazılır (Vio sayısı tutarlı kalır; hile kapanınca kazanılmış Vio’lar yerindedir).
- **Tanrı modu:** can, tokluk, enerji, mana hep dolu; canavarla ve açlıkla bayılmazsın, ama **mor ışık seni yine bayıltır** (bilinçli). **Hile paneli:** +100 Vio, +100 XP, +2 saat, günü bitir, zamanı sar, eşya arama (miktar 1/10/50/100; ev eşyaları ve yapılar dahil oyundaki bütün eşyalar aramada çıkar). **Tek vuruşta öldür**, **Sınırsız dayanıklılık**, **Sınırsız Vio**, **Gece ışığı**, **Hile kısayolları** (Z +100 Vio, X +100 XP), **ACT 2'ye geç**, **Seviyeyi en üste çıkar**, **Haritayı tamamen aç**.

- **Bütün sahneler (v3.32, Boğaç: hile modundan çıkarıldı):** ara sahneleri ve anıları istediğin zaman izleme artık hile modunda **yoktur** ("Bütün ara sahneler açık" anahtarı ve Keşif defterindeki liste kaldırıldı). Yalnızca **ana menüde klavyeyle `love` yazınca** açılır (yeniden yazınca kapanır; bu cihazda hatırlanır; ekranda "Bütün sahneler açıldı" / "kapandı" yazar). Bir başarımı yoktur, hile modu sayılmaz. Açıkken **Kitap › Anılar**'ın en üstünde **Bütün sahneler** bölümü çıkar: her sahne **küçük resmiyle** (anılarda sahnenin kendi çiziminden alınmış küçük resim; açılış sahnesi, deniz yolculuğu, roket ve kişilerin hikâyelerinde adıyla mor bir kart) bir kutudur; kutuya basınca sahne baştan oynar. Bütün anılar (henüz gelmemiş olanlar dahil) ve bütün ara sahneler buradadır.

### İstatistikler ve oyun süresi

Karakter penceresinin (C) **İstatistikler** sekmesinde kartlar şöyle sıralanır: gün hayatta kaldın · **aktif oyun süresi** · **menüde geçen süre** · yürüdüğün yol · avlanan canlı · yenilen reis · tutulan balık · yapılan eşya · öğrenilen tarif · kazanılan Vio · harcanan Vio · bayılma · toplanan malzeme.

**Oyun süresi iki ayrı sayılır (8 Kasım 2026, Boğaç):** iki sayaç da kayda yazılır ve gerçek saatle (saniye) sayılır; oyunun hızı, uyku ve zaman atlama bunları etkilemez.
- **Aktif oyun süresi:** bir oyun açıkken ve dünya akarken geçen süre. Yürümek, dövüşmek, konuşmak, ara sahneler ve uyumak bu süreye girer.
- **Menüde geçen süre:** bir oyun açıkken bir menü ya da pencere açık olduğunda geçen süre. Duraklatma, Ayarlar, büyük harita, envanter, kitap, Karakter, tezgâhlar, Ağıl, arena gibi ekranlar bu süreye girer. Konuşma penceresi menü sayılmaz, aktif süreye girer.
- **Hiçbirine sayılmaz:** ana menü (kayıt seçme ekranı), karakter yaratma ve sekme arka plandayken geçen süre. Cihaz uykuya geçince ya da sekme durunca araya giren süre de sayılmaz; tek seferde en çok 2 sn eklenir.
- **Eski kayıtlar:** bu sayaçlardan önce alınmış kayıtlarda aktif oyun süresi, kayıttaki eski oyun süresiyle başlar; menüde geçen süre 0'dan başlar.
- Oyun bitince çıkan sonuç ekranındaki **Süre**, aktif oyun süresidir.

### Kayıt

- Otomatik kayıt + 3 elle kayıt yuvası (tarayıcıda).
- **Yan görev XP hatasından etkilenen kayıtlar silinir (v3.45, 6 Kasım 2026, Boğaç):** v3.44'te yan görev bitince XP olarak kişinin x konumu veriliyordu. v3.45'ten önceki bir kayıtta **en az bir yan görev bitmişse** o kayıt açılışta silinir, oyun ana menüde açılır; yan görev bitirmemiş kayıtlar korunur. Silinince yalnızca tek cümlelik bir bilgi çıkar: "Kaydın eski bir hatadan etkilendiği için silindi." (adım tarif edilmez; ana menüde başlığın ve öbür katmanların **üstünde**, okunur, **5 sn** kalır).
- **Ada değişince eski kayıtlar silinir:** harita değişikliğiyle (harita sürümü `MAPV` artınca) eski kayıt açılışta silinir, oyun ana menüde açılır. Bildirim tek cümledir: "Ada değiştiği için eski kayıt silindi." (adım tarif edilmez; ana menüde başlığın ve öbür katmanların **üstünde**, okunur, **5 sn** kalır).
- **Anılar adıyla saklanır:** kayıt, görülen anıları **adıyla** saklar; bir anı eklenip çıkınca kayıtlar kaymaz.
- **Üzerine yazma:** kaydetme menüsünde dolu bir yuvaya basınca bir soru çıkar: "Bu yuvada bir kayıt var (Seviye…, tarih). Yeni kaydı üzerine yazayım mı?" → **Üzerine yaz** / **Vazgeç**. (Önceden "bir kez daha bas" uyarısıydı.)
- **Kaydı sil:** kaydetme ve yükleme menülerinde her dolu yuvanın yanında **Sil** düğmesi (yükleme menüsünde otomatik kayıt da silinebilir). Basınca sorar: "Kayıt 2 silinecek. Emin misiniz? Bu geri alınamaz." → **Eminim, sil** / **Vazgeç**. Silinince yuva boşalır.
- Otomatik kayıt dakikada bir, görev durumu değişince, sekme gizlenince, sayfa kapanırken ve menüye dönerken alınır; ara sahne, uyanış, deniz yolculuğu ve can 0 iken alınmaz.
- **Aynı oyun iki sekmede:** başka bir sekmede oyun açılınca (Devam et, Yükle, Yeni oyun ya da adalar arası geçiş) bu sekme "eski" sayılır ve artık **otomatik kayıt almaz** (yoksa arka plandaki eski sekme dakikada bir eski halini yazıp yeni sekmedeki ilerlemenin üstüne geçiyordu; "Devam et" eski kaydı açıyordu). Eski sekmeye dönünce bir kez uyarı çıkar: "Bu oyun başka bir sekmede ilerledi…". O sekmede bir kayıt yüklenir ya da yeni oyun başlatılırsa sekme yeniden kaydeder; elle kayıt her zaman alınır. "Devam et" her zaman en yeni kaydı (otomatik ya da elle) açar.
- **Dışa aktar:** bütün kayıtlar tek bir kod (`HAMMADDE1:` ile başlar) ya da dosya. **İçe aktar:** kodu yapıştır ya da dosyayı seç. Kayıtlar her adreste ayrıdır (claude.ai sürümü ile GitHub sürümü arasında bu yolla taşınır).
- Başarımlar, toplama/av listeleri ve tuş atamaları cihaza ayrı kaydedilir.
- Adresin sonuna `?debug` eklenince geliştirici araçları açılır (`window.__ham`).

## Müzik aletleri (12 Kasım 2026, Boğaç: "müzik aletlerini de çalınabilir yap, uygun seslerde, eline alındığında çalınsın")

- Bütün müzik aletleri **elde tutulur**: kemere takılır, kemerden seçilince eline alınır. Eldeyken **vuruş** (fare tıkı, Vur düğmesi, Boşluk) silah sallamaz, aletin **sıradaki notasını** çalar ve başının üstünde aletin renginde bir ♪ çıkar. Art arda basınca aletin kendi ezgisi çalınır; 2,5 saniye basmazsan ezgi baştan başlar. Ses, oyunun ses ayarındaki **efekt** düzeyine bağlıdır.
- Her aletin kendi sesi vardır: **Kemik flüt** ince ve tiz bir flüt; **Kamış flüt** nefesli bir kamış; **Kök flütü** pes, tahtamsı bir flüt; **Pişmiş kil düdük** yumuşak bir okarina; **Boynuz borazan** pes bir boru çağrısı; **Kor zurnası** genizden, titrek bir zurna (hicaz tınısında); **Deri davul** tok bir "düm-tek"; **Yarasa zarı davul** daha ince, kuru bir davul; **Semender derisi tef** zilli bir tef; **Yankı çanı** yankılanan bir çan; **Gümüş çan** berrak bir çan; **Kristal zil** cam gibi parlayan bir zil.
- Davul ve tef daha sık (0,18 sn), çan ve zil daha seyrek (0,3 sn), öbürleri 0,24 sn arayla çalınabilir. Çalmak hasar vermez, canlıları ürkütmez; alet aşınmaz. Alet El yapımı listesinde ve envanterde "Süs, boya ve müzik" başlığındadır.
