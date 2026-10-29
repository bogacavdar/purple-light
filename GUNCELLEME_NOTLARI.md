# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md

---

## Versiyon 2.24 · 29 Ekim 2026

**Düzeltmeler**
- **Önemli: arena kaydı bozuyordu.** Oyunu yarıda bırakıp arenaya girince ve arenadan çıkınca, sayfa kapanırken çalışan otomatik kayıt arenadaki karakteri (ör. 50. seviye) gerçek oyunun **otomatik kaydının** üstüne yazıyordu; "Devam et" arena karakteriyle açılıyordu. Artık arenaya bir kez girildikten sonra sayfa yeniden açılana kadar hiçbir kayıt yazılmıyor, arenadan çıkarken de yazılmıyor.
- **Arenada savuşturma yoktu:** arenada bütün yetenekler açılıyordu ama savuşturma (Börü'nün dersiyle öğrenilir) açılmıyordu; telefonda Savuş düğmesi çıkmıyordu. Artık arenada savuşturma ve gard da açık.

**Oynanış**
- **Oyun başında kampın yanına fazladan malzeme konmuyor:** önceden konan 1 dal, 4 taş, 1 lif ve 1 yaprak kaldırıldı (bazen sahile düşen "taş" buydu). Öğreticinin kendi malzemeleri (böğürtlenler, Zümrüt'ün meşale malzemeleri ve 4 taşı) aynen duruyor. Yeni başlayan oyunlarda geçerli.

**Kayıtlar**
- Arenanın üzerine yazdığı otomatik kayıt geri getirilemiyor (oyunda tek otomatik kayıt yuvası var); elle yapılan kayıtlar (Kayıt 1–3) etkilenmedi.

**Tasarım belgesi**
- Arena: "kayda asla dokunmaz" ve "savuşturma açık"; öğretici: başlangıçta kampın yanına malzeme konmaz. Sürüm satırı 2.24.

## Versiyon 2.23 · 29 Ekim 2026

**Düzeltmeler**
- **Acil: telefonda Börü'nün savuşturma dersi ilerlemiyordu.** Oyun durup "Savuş düğmesine dokun!" diyordu ama Savuş düğmesi ekranda yoktu (düğme ancak ilk savuşturmadan sonra çıkıyordu). Artık savuşturma dersi başladığı andan itibaren Savuş düğmesi Atıl düğmesinin solunda görünüyor; oyun durduğunda da mavi parlıyor ve ok onu gösteriyor.

**Tasarım belgesi**
- Oyunun akışı, Börü'nün savuşturma dersi: telefonda Savuş düğmesinin baştan görünmesi; sürüm satırı 2.23.

## Versiyon 2.22 · 29 Ekim 2026

**Oynanış**
- **Canavarlar kişilerin yanına giremiyor:** kavga edebilen canlılar (saldırgan, nötr ve Reisler) güvenli yerlerin (Ekin'in kampı, kişilerin ve kuzenlerin ateşleri, Dursun'un ocağı, Zümrüt'ün kazanı, kendi kamp ateşin) sınırında duruyor, içeri adım atmıyor. Güvenli yere kaçarsan seni kovalayan canavar kenarda kalıp vazgeçiyor. İçeri bir şekilde düşen (hücum, sıçrama) en yakın kenardan dışarı yürüyor. Zararsız canlılar (tavşan, geyik…) eskisi gibi dolaşıyor.
- **Telefonda Vur yürüdüğün yöne vuruyor:** joystick'le yürürken Vur'a basınca karakter tam yürüdüğün yöne, çapraz yürüyorsan çapraza vuruyor. Yakında canlı varsa önce yürüdüğün yöndekine kilitleniyor. Dururken eskisi gibi baktığın yöne vuruyor.

**Arayüz**
- **Telefonda bütün ekranlar elden geçti** (yalnızca yatay telefon; bilgisayar ve tablet aynı):
  - Sekmeler tek ince satır (sığmazsa yana kayar), düğmeler ve satırlar alçak, uzun açıklamalar gizli.
  - **Envanter:** giysi yuvaları tek ince şerit; eşyalar açılır açılmaz görünüyor.
  - **Pazar:** her eşya tek satır; ekrana iki kat eşya sığıyor.
  - **El yapımı:** açıklama gizli, satırlar sıkı; yaptığın meşale listenin başında hemen görünüyor.
  - **Yetenek ağacı** pencereyi dolduruyor; **tarif kitabı**nda açıklama gizli.
  - **"Yeni malzeme bulundu"** yazısı bir pencere açıkken alta, küçük çıkıyor.
  - **Ayarlar** genişledi, müzik düğmelerinin yazıları kesilmiyor; **ana menü**de "PURPLE LIGHT" yazısı sağa kaydı, düğmeler üstüne binmiyor.
- **Telefonda envanter ve yemek düğmeleri ☰ kutusunun içinde.** Öğretici bunlardan birini gösterdiğinde kutu bir kez kendiliğinden açılıyor ve ☰ parlıyor.
- **Almanakta saldırılar ve etkiler:** açılan kartlarda artık saldırılar (ısırık hasarı, uzaktan kaç mermi ve kaç saniyede bir), her isabette bıraktığı etki (saniyede kaç can, kaç saniye), özel hamleler (her biri kısa açıklamasıyla), özellikler (bağışıklık, çevik, iri) ve Reisin ek hamleleri yazıyor.
- **Zümrüt'ün kazan derslerinde kazan parlıyor:** meşale (ve keskin taş) dersinde tarif seçildikten sonra malzemeler konana kadar kazan alanı mavi parlıyor.

**Tasarım belgesi**
- Kontroller (telefonda sol menü kutusu, Vur yönü, telefona göre sıkı düzen), güvenli yerlere canavar girmemesi, almanak kart bilgileri, Zümrüt'ün 4. ve 7. adımı; Teknoloji bölümüne "İleride: çok oyunculu (plan, henüz yok)" notu (bulgular ve maliyet tahminiyle). Sürüm satırı 2.22.

## Versiyon 2.21 · 29 Ekim 2026

**Düzeltmeler**
- **Acil: telefonda bütün pencereler sığmıyordu.** Kazanda olduğu gibi diğer pencereler de (El yapımı, Nazlı'nın pazarı, demirciler, Usta Kemal, envanter, yetenek ağacı, tarif kitabı, yemek, köpekler…) ekranın üstünde ~100 piksel boşluk bırakıp alt yarıya sıkışıyordu.

**Arayüz**
- **Telefona özel pencere düzeni:** telefon yatay tutulunca bütün pencereler ekranın tamamını kaplıyor (öğretici kartı varsa yalnızca onun kadar yer bırakıyor). Başlık satırı ve arama/araç satırı ince; içerik kendi içinde kayıyor. Kazan ve örslerdeki iki sütunlu düzen (2.20) aynen duruyor. Bilgisayar ve tablette hiçbir şey değişmedi.

**Tasarım belgesi**
- "Telefonda bütün pencereler" kuralı; sürüm satırı 2.21.

## Versiyon 2.20 · 29 Ekim 2026

**Düzeltmeler**
- **Ciddi: telefonda kazan ekranı sığmıyordu.** Telefon yatay tutulunca kazan penceresi ekranın üstünde ~100 piksel boşluk bırakıp yalnızca alt yarıya sıkışıyordu (telefon, bilgisayar boyutu sayılıyordu); başlık ve arama satırı da bu alanın yarısını yiyordu, liste ve kazan kesik görünüyordu.

**Arayüz**
- **Telefona özel kazan ve örs ekranı:** pencere artık bütün ekranı kaplıyor (öğretici kartı varsa yalnızca onun kadar yer bırakıyor). Başlık satırı ve arama satırı ince; altta iki sütun var: solda tarif listesi, sağda seçtiğin tarif, malzemeler, kazan, düğmeler ve envanterin. İki sütun da kendi içinde kayıyor. Kazan alanı alçaldı, yazılar ve kareler telefona göre küçüldü. Örsler (Dursun, Durmuş ve kuzenleri) de aynı düzende. Bilgisayar ve tablette hiçbir şey değişmedi.

**Tasarım belgesi**
- "Tarifler: kazan, el yapımı, örs, ustalar" bölümüne "Telefonda kazan ve örs ekranı"; sürüm satırı 2.20.

## Versiyon 2.19 · 29 Ekim 2026

**Arayüz**
- **Yeni canlı almanağa eklenince ekranda büyük yazı:** bir türü ilk kez öldürünce ekranın ortasında canlının adı ve altında "Almanağa eklendi · U ile bak" yazıyor. Önceden yalnızca küçük, çabuk kaybolan bir bildirim çıkıyordu ve gözden kaçıyordu. Her yeni tür için bir kez çıkıyor; Reisler ve ders canlıları sayılmıyor.
- **İlk avında almanak gösteriliyor:** oyunda ilk kez bir canlı öldürdüğünde Almanak düğmesi **mavi parlıyor** ve yanında yanıp sönen bir **ok** çıkıyor; birkaç saniye sonra "İlk avın almanağa eklendi! Almanağı aç: U" yazıyor. Almanağı açınca parlama ve ok sönüyor. Telefonda Almanak ☰ menüsünün içindeyse önce ☰ parlıyor.

**Tasarım belgesi**
- Almanak bölümüne "Yeni canlı almanağa eklenince" ve "İlk avında almanak gösterilir" kuralları; sürüm satırı 2.19.

## Versiyon 2.18 · 29 Ekim 2026

**Oynanış**
- **Canavarlar saldırırken yüzünü hep sana döner.** Saldırı başladığı andan bitene kadar canavar sana bakıyor: kırmızı/sarı "!" işareti, ok/diken atanların hazırlığı, Reis hamlelerinin hazırlığı, kükreme, alev, kavrama, üçlü vuruş ve hamleden sonraki yorgunluk. Geri geri çekilen menzilliler de sana bakarak çekiliyor. Yalnızca gövdesiyle hızla yol aldığı anlarda (atılış, sıçramada havadayken, hücumda koşarken) gittiği yöne bakıyor. Tam üstünde ya da altındayken titremesin diye yön değiştirmiyor.

**Düzeltmeler**
- **Meşale dersi:** Cadı Zümrüt'ün dersinde meşaleye tıklayınca doğru yuva yanıp sönüyordu ama meşaleyi basılı tutup sürükleyince hiçbir yuva gösterilmiyordu. Artık sürüklerken de aynı yuva yanıp sönüyor, bırakınca sönüyor. Bu, envanterden sürüklenen bütün taşınabilir eşyalar için geçerli.
- **Yetenek ağacında Koşu yarım görünüyordu:** Börü'nün dersinden sonra ağaç açılınca en alttaki Koşu alt kenardan kesiliyordu. Ağacın altında ve üstünde artık boşluk var; Koşu alt kenarın biraz üstünde tam görünüyor. Gerekirse pencere kendiliğinden kayıyor.

**Arayüz**
- **Sikke yetmezken Koşu'ya basınca** yetenek ağacı kendiliğinden kapanıyor ve Börü anlatıyor: ne kadar sikke eksik olduğunu, Nazlı'ya bir şeyler satıp sikke toplamanı, 100 sikken olunca **Y**'ye basıp (telefonda ağaç ikonuna dokunup) ağacı açmanı ve oradan istediğin geliştirmeleri alabileceğini söylüyor. Ders sırasında ağacı kapatınca çıkan Börü konuşması da aynı bilgiyi veriyor.
- **Ekin'in böğürtlen konuşması:** bilgisayarda Ekin artık "Çalının yanına git ve **F**'ye bas; böğürtlen yere düşer, üstünden yürüyünce alırsın" diyor. Toplama tuşunu değiştirdiysen o tuşu söylüyor.

**Tasarım belgesi**
- Oyunun akışı: gösterme kuralına "sürüklerken de gösterilir"; Börü dersine Koşu'nun tam görünmesi ve sikke yetmezken Börü'nün konuşması; Ekin'in 1. adımına F ile toplama. Canavarlar nasıl savaşır: "saldırırken yüzü hep sana dönük". Sürüm satırı 2.18.

## Versiyon 2.17 · 29 Ekim 2026

**Düzeltmeler**
- **Ciddi: "NaN sikke".** Meyve ağaçlarının odunlarının (Elma, Armut, Erik, Mürver) fiyatı yoktu; birini Nazlı'ya satınca sikke "NaN" oluyor, pazar da bozuluyordu. Bu odunlar artık **3 sikke** ve tariflerde "herhangi odun" yerine kullanılabiliyor. Oyundaki bütün eşyaların (1.299 tane) fiyatı tek tek denendi; fiyatı olmayan başka eşya kalmadı. Bundan sonra fiyatı olmayan bir eşya olursa satılmıyor ("Bu eşyayı Nazlı almıyor"), "Hepsini sat" onu atlıyor.
- **Bozuk sikke onarımı:** sikkesi NaN olmuş bir kayıt açılınca oyun sikkeyi kayıtlardaki **en son geçerli** miktara (otomatik ya da elle kayıtların en yenisi) döndürüyor ve "Sikkelerin onarıldı: … sikke" diyor; geçerli bir kayıt yoksa 0. Oyun sırasında NaN olursa son geçerli miktara dönüyor. Görev sayaçlarındaki (ör. "150 sikkelik satış") bozuk değerler 0'dan devam ediyor. Kaydın geri kalanı olduğu gibi kalıyor.
- **Ciddi: ekran maviye dönüyordu.** Uzun oyunda, özellikle telefonda, ekran kartının belleği doluyor; zemin ve ağaç resimleri boş çizildiği için arkadaki mavi görünüyordu (kişiler, gölgeler ve küçük eşyalar duruyordu). Artık telefonda daha az ekran kartı belleği kullanılıyor, eski resimler daha çabuk bırakılıyor; ekran kartı "bellek doldu" derse resimler boşaltılıp yeniden yükleniyor, bir dakika içinde ikinci kez olursa oyun kaydedip klasik çizimle yeniden açılıyor.

**Kayıtlar**
- NaN sikkeli kayıtlar açılınca sikke onarılıyor (yukarıda); başka hiçbir şeye dokunulmuyor.

**Tasarım belgesi**
- Ekonomi (fiyatsız eşya, sikke onarımı), Teknoloji (ekran kartı belleği), Açıklar #4 düzeldi; sürüm satırı 2.17.

## Versiyon 2.16 · 29 Ekim 2026

**Düzeltmeler**
- **Ciddi:** bir yöne vurduktan hemen sonra öbür yöne vurmaya çalışınca karakter yalnızca dönüyor, vuruş gerçekleşmiyordu (ilk vuruşun bekleme süresi bitmeden basılan vuruş yutuluyordu). Artık bekleme sırasında basılan vuruş saklanıyor ve bekleme biter bitmez (basıştan en çok 0,8 sn sonrasına kadar) **son bastığın yöne** atılıyor; karakter de ancak vuruş atılırken dönüyor. Sol tık ve Q için geçerli.

**Tasarım belgesi**
- Kontroller'e "Vuruş tamponu" kuralı; sürüm satırı 2.16.

## Versiyon 2.15 · 29 Ekim 2026

**Oynanış**
- **Canlıların atılışı değişti (hepsi):** ayrı hazırlık beklemesi kalktı; canlının üstünde **!** çıktığı an (0,1 sn içinde) sana doğru atılır. Atılış o an **bulunduğun yere** gider ve **yolu sonradan değişmez**; 0,3 sn sürer. Doğru anda **takla** atar ya da **savuşturursan** ısırık işlemez, sana değerse işler. !'in rengi (beyaz / sarı / kırmızı) atılışla birlikte görünür; sarı ve kırmızıya eklenen ayrı bekleme kalktı. Kırmızı yalnızca taklayla atlatılır. Özel hamlelerden **Sıçrama** da işaret çıktığı an atlar.
- **Savuşturma artık öğreniliyor:** oyunun başında savuşturma ve gard (sağ tık / E, telefonda Savuş) kapalı. Börü takla dersinin hemen ardından ücretsiz öğretir: ilk saldırıda oyun durur ve "Sağ tık'a bas!" der, sonra 3 savuşturma daha. Öğreticiyi atlayan Börü ile konuşunca öğrenir.
- **Takla dersi keskinleşti:** ilk saldırıda karakter yürüyemez; kerevit ! ile atılır, **tam değecekken** oyun durur ve "Boşluk'a bas!" der (ondan önce basmak takla attırmaz). Sonraki 3 saldırıda: kerevit değmeden kaçarsan ya da değdiği an taklada isen "Sıyrıldın!"; erken basarsan "Erken!", hiç basmazsan "Değdi!". Derste yönsüz atılan takla kerevitin yolundan yana gider.

**Düzeltmeler**
- Börü'nün takla dersinde Börü'nün üstünde yön oku kalıyordu; ders sürerken artık hiçbir ok çıkmıyor.

**Arayüz**
- Kaydetme ve yükleme menülerinde her dolu yuvanın yanında **Sil** düğmesi; "Kayıt 2 silinecek. Emin misiniz?" diye sorar (Eminim, sil / Vazgeç).
- Dolu yuvaya kaydederken artık soru çıkıyor: "Bu yuvada bir kayıt var. Yeni kaydı üzerine yazayım mı?" (Üzerine yaz / Vazgeç).

**Kayıtlar**
- v2.14 ve önceki kayıtlarda takla biliniyorsa savuşturma da bilinir sayılır.

**Tasarım belgesi**
- Kayıt (silme, üzerine yazma), Atılma/savuşturma (savuşturma öğrenilir), Canavarlar nasıl savaşır (atılış kuralları, Sıçrama), öğretici (takla ve savuşturma dersleri, ok yok); sürüm satırı 2.15.

## Versiyon 2.14 · 29 Ekim 2026

**Düzeltmeler**
- **Ciddi:** menüye dönüp "Yeni oyun" (ya da "Devam et" / "Yükle") deyince harita yeniden kurulmuyordu; önceki oyunun haritaya bıraktıkları kalıyordu. Ekin'in koyduğu böğürtlenler her yeni oyunda üst üste biniyor, öğreticinin taşları, kesilen ağaçlar, kazılan madenler yeni oyuna taşınıyordu. Artık bu sekmede bir oyun oynandıktan sonra yeni oyun ya da kayıt yükleme sayfayı kısa bir "Yükleniyor…" ekranıyla yeniden açıyor; harita her seferinde temiz. Yeni oyunda doğrudan karakter yaratmaya geçiyorsun, yüklemede kaldığın yerden devam ediyorsun.

**Arayüz**
- Almanak düğmesi sağ üstten küçük haritanın üstüne, Başarımlar'ın soluna taşındı. Haritanın üstündeki üç düğme (Almanak, Başarımlar, Özellikler) eşit boyutta ve üçü birlikte haritanın genişliğini geçmiyor. Telefonda menü çekmecesinde, Başarımlar'ın yanında.

**Tasarım belgesi**
- Akış → Ana menü'ye "Temiz dünya" kuralı; Almanak düğmesinin yeri; sürüm satırı 2.14.

**Proje**
- Çalışma kuralı: Boğaç bir hatayı "ciddi" diye bildirirse "paket çık" beklenmeden düzeltilip hemen paket çıkılıyor.

## Versiyon 2.13 · 29 Ekim 2026

**Arayüz**
- **Almanak:** sağ üstte Ayarlar'ın yanında yeşil bir kitap (kısayol **U**, Ayarlar → Kontroller'den değişir). Açıkken oyun durur; Esc ya da U kapatır.
  - Solda yalnızca **adım bastığın biyomlar**, keşif sırasıyla. Yeni bir biyoma ilk girince "Almanak: Orman eklendi" yazar ve yeni satır açılır. Her satırda kaç canlıyı açtığın ve kaç Reis yendiğin (ör. 3/7 ★1).
  - Sağda o biyomun bütün canlıları. Avlamadığın canlı **kara siluet ve ???**; ilk avlayınca "Almanak: Kerevit açıldı" yazar ve kart açılır: resmi, huyu, can, hasar, hız, uzaktan saldırısı, bıraktığı etki, düşürdükleri, kaç tane avladığın.
  - Kartın altında **Reis sayacı** (ör. Reis: 3 / 9) ve dolum çubuğu. Reis yenilince kart **altına** döner: "★ Kurt Reisi yenildi".

**Oynanış**
- **Her Reis yalnızca bir kez yenilir.** Kart altına döndükten sonra o türün Reisi bir daha gelmez (önceden her seferinde %50 daha çok avla yeniden geliyordu).
- **Reise yenilirsen** (Reis sahadayken ya da gelmek üzereyken bayılırsan; gece mor ışıkla da) Reis kaybolur ve sayaç bir eksik kalır (ör. 14 / 15). O türden bir av daha Reisi yeniden getirir; yenene kadar böyle.

**Kayıtlar**
- Kayda yeni bir şey yazılmaz. Eski kayıtlarda bugüne kadar avladıkların Almanak'ta açık gelir; daha önce yendiğin Reislerin kartları altındır ve o Reisler bir daha gelmez.

**Tasarım belgesi**
- Sistemler'e "Almanak" bölümü eklendi; Reisler bölümünde "her Reis bir kez" ve "Reise yenilmek" kuralları; sürüm satırı 2.13.

## Versiyon 2.12 · 29 Ekim 2026

**Düzeltmeler**
- Vuruşlar canlının kıskacına, boynuzuna, kuyruğuna değse bile hasar vermiyordu (yalnızca gövdenin ortası sayılıyordu). Artık canlının **çiziminin neresine değerse** vuruş sayılıyor. Bütün canlılarda, iki adada da, Reisler dahil.
- Öğreticide meşale henüz indirilmeden üstteki takip satırı "4 Taş" istiyor ve haritadaki taşlar mavi parlıyordu (taşlar yeni çıkmış gibi görünüyordu). Artık meşale inene kadar takip satırı "Meşaleyi elinden indir" diyor; hiçbir taş parlamıyor.

**Arayüz**
- NPC'lerin seslendiği mavi balon ("Parçalar tamam! Dursun'a git" gibi) sen yürüdükçe sağa sola, yukarı aşağı zıplıyordu. Artık yeri bir kez seçiliyor ve konuşan kişiye göre sabit kalıyor; karakterin önüne gelse bile kaçmıyor. Yalnızca bir menü kutusunun altında yarım saniyeden uzun kalırsa bir kez yer değiştiriyor. Konuşan ekrandan çıkarsa balon kenarda duruyor, küçük sarı bir ok onun yönünü gösteriyor.

**Oynanış**
- Nazlı keskin taşı alınca hesabı anlatıyor: bir taş 1 sikke, iki taş 2 sikke; birleştirip yaptığın keskin taş 3 sikke, aradaki 1 sikke senin emeğin. Yaptığın şeyleri yeniden birleştirdikçe değerleri katlanır. (Eski metin "iki taşın ayrı ayrı bir sikke etmez" diyerek çelişiyordu.)

**Tasarım belgesi**
- Vuruş kuralı (canlının her yeri sayılır), seslenme balonu, öğretici tablosu (meşale ve Nazlı adımları); sürüm satırı 2.12.

**Proje**
- Çalışma kuralı: değişikliklerden sonra "Paket çıkayım mı?" diye sorulmuyor; paket Boğaç "paket çık" deyince çıkıyor.

## Versiyon 2.11 · 29 Ekim 2026

**Oynanış**
- **Harita sadeleşti** (kalabalık geliyordu). Kampın çevresi (yaklaşık 20 karo) aynı kaldı; geri kalan her yerde:
  - Temel malzemeler yaklaşık yarıya indi: Dal 800, Lif 700, Taş 550, Yaprak 450, Nehir çakılı 400, Kum 350, Çakmaktaşı 300 (önce 1650 / 1410 / 990 / 840 / 720 / 600 / 450). Azaldıkları için **%30 daha çabuk** yeniden çıkıyorlar (ör. Dal 25 → 18 sn).
  - Biyom bitkileri tür başına 68'den yaklaşık 40'a; Kuru ot 150 → ~90, Böğürtlen 110 → ~80, su kenarı bitkileri 42 → ~30.
  - Ağaçlar yaklaşık %20 azaldı (seyreltme %18 → %35); ormanlar hâlâ orman, aralarında yürüyecek yer açıldı. Her ağaç türü yine bol.
  - Madenler ve mağara buluntuları değişmedi.
  - Bütün adada toplanabilir sayısı yaklaşık 12.200'den 7.100'e, ağaç sayısı 13.300'den 10.600'e indi. Eski kayıtlar da yeni yoğunlukla açılır (harita her açılışta kurulur).

**Düzeltmeler**
- Öğreticide Zümrüt'ün taş adımı meşale bitmeden geliyordu (taşlar haritaya çıkıyor, taş konuşması başlıyordu). Artık sıra: meşaleyi yap → Zümrüt yalnızca meşaleyi anlatır → meşaleyi eline al (yanar) → Zümrüt gece/gündüz kuralını anlatır → meşaleyi elinden indir → **ancak o zaman** Zümrüt taşları anlatır ve kazanın yanına 4 taş konur.

**Tasarım belgesi**
- ACT 1 → Adanın yerleşimi'ne "Haritadaki miktarlar" bölümü eklendi (her şeyin sayısı neye göre belirlenir); ACT 1 biyom tablolarındaki "Adadaki sayısı" ve yeniden çıkma süreleri yeniden ölçüldü; ACT 2 tablolarına not düşüldü; öğretici tablosu (5. ve 6. adım) güncellendi; sürüm satırı 2.11.

## Versiyon 2.10 · 29 Ekim 2026

**Oynanış**
- **Oyunda ölüm yok:** canavar, açlık, zehir ve gece mor ışık seni bayıltır; her bayılmadan sonra uyanırsın. Oyundaki yazılar artık "öl" değil "bayıl" diyor (Tanrı modu açıklaması: "bayılmazsın, mor ışık yine bayıltır").
- Öğreticide Zümrüt meşaleyi anlattıktan sonra kart **"Meşaleyi elinden indir"** diyor; meşalenin kutusu okla parlıyor. Meşale inmeden taş görevine geçilmiyor; inince "Meşale indi. Şimdi kazanın yanındaki 4 taşı topla." yazıyor.
- Fareyle **yere düşmüş bir eşyaya** (av, odun, taş) tıklayınca karakter oraya yürüyüp eşyayı alıyor.
- **Bir hayvan sana saldırırken** (ekranda seni kovalayan bir hayvan varsa ya da son 3 saniyede ısırıldıysan ya da uzaktan vurulduysan) sol tık hiçbir şeyi toplamıyor, kimseyle konuşmuyor, bir yere yürümüyor: **hep tıkladığın yöne vuruyor**. F tuşu ve telefon bundan etkilenmiyor.

**Düzeltmeler**
- "İlk düşüş" ve "İnatçı" başarımları yalnızca gece mor ışıkla bayılmayı sayıyordu; artık her bayılma sayılıyor ("Bir kez bayıl.", "5 kez bayıl, yine de devam et."). Eski kayıtlardaki bayılmalar da sayılır.
- Oyun iki sekmede açıkken arka plandaki eski sekme dakikada bir eski halini otomatik kayda yazıyordu; sayfa yenilenince "Devam et" eski bir kaydı açıyordu. Artık oyunu en son açan sekme (Devam et, Yükle, Yeni oyun) otomatik kaydeder; eski sekme susar ve bir kez uyarır.

**Kayıtlar**
- Eski kayıtlar sorunsuz açılır. Paketten önce açık kalmış eski sürüm sekmelerini bir kez kapatmak iyi olur (onlarda bu koruma yok).

**Tasarım belgesi**
- Bayılma bölümü (ölüm yok kuralı), mor ışık ve tanrı modu satırları, başarımlar, açıklar listesi (#12 düzeldi), Ekin ve Act 3 notları "bayıl" oldu; Kontroller'de sol tık kuralları (yere düşen eşya, saldırı altında), Kayıt'ta iki sekme kuralı, öğretici tablosunda meşaleyi indirme; sürüm satırı 2.10.

## Versiyon 2.09 · 29 Ekim 2026

**Oynanış**
- Börü'nün dersinde yetenek ağacı açılınca **Koşu** mavi parlıyor ve okla gösteriliyor; ağacı kapatınca Börü Koşu'nun **100 sikke** olduğunu, Nazlı'ya satıp biriktirmeni ve ilk iş onu almanı anlatıyor.
- Dursun'un ilk görevi değişti: **"Ocağa odun"**: "Baltan var, değil mi? Örsün ateşi odun yer, bana 8 çam odunu kes getir." (Eski "İlk baltan" görevi öğreticide zaten yapılıyordu.) Bu görev ancak örste bir balta dövülünce açılıyor; öğreticiyi atlayan, balta tarifini öğrenip ilk baltasını dövdürünce açılıyor.
- Bir şeyi **yapmayı ya da dövmeyi** isteyen görevler o şeyin **tarifi öğrenilmeden açılmıyor** (görev tarifi kendisi veriyorsa hariç). Örneğin Dursun'un "Keskin işler" (Taş kazma) görevi Taş kazma tarifini öğrenince açılıyor.
- Görevlerde artık **kimse seni başka birine yönlendirmiyor**. "X ile tanış" görevleri yerine yer görevleri geldi: Ekin'in "Kıyıdaki duman" (Mor Kristal Vadisi'ne git), Börü'nün "Kuzeye keşif" (Orman'a git), Toygar'ın "Dağ yolu" (Kayalık Dağ'a in). Teşekkürlerdeki "şuna uğra, ona selam söyle" cümleleri değişti.

**Arayüz**
- Görevi hazır olan ama **henüz tanışmadığın** kişiler haritada, keşfetmediğin yerde bile, kendi konumlarında **parlak sarı, nabız gibi atan büyük bir "?"** ile görünüyor. Gidip tanışınca "?" kalkıyor, kişinin simgesi beliriyor ve görevi alabiliyorsun.
- Ana menüde **Hakkında** penceresine "Tasarım belgesine buradan ulaşabilirsiniz" bağlantısı geldi: belge oyunun içinde tam ekran açılıyor (Kapat / Esc, "Yeni sekmede aç"). Belge oyunla birlikte cihaza kaydediliyor; **internetsiz de** açılıyor.

**Düzeltmeler**
- Gece, görev sahnesindeki konuşma balonları karanlığın altında kalıp okunmuyordu; artık karanlığın üstünde çiziliyor.

**Tasarım belgesi**
- Görev kuralları (tarif kuralı, yönlendirme yok, haritada "?", gece okunurluk), görev tablosu (D1, D2, E5, B5, T6), Börü'nün atılma dersi ve Açılış bölümü (Hakkında'daki belge) güncellendi; sürüm satırı 2.09.

**Proje**
- Yeni çalışma kuralı: değişiklikler yapılır ama paket ancak Boğaç "paket çık" deyince çıkar; bekleyen işler `bekleyen-paket` dalında durur (CLAUDE.md ve yayın skill'i).
- Uygulama önbelleği (`sw.js`) `purple-light-v2` oldu ve tasarım belgesini de saklıyor.

---

## Versiyon 2.08 · 29 Ekim 2026

**Düzeltmeler**
- Vuruş efekti canlıya değdiği hâlde hasar vermiyordu (özellikle çapraz vuruşlarda; örneğin Börü'nün kerevit dersinde). Vuruşun değip değmediği artık vuruşun çizildiği yerden (karakterin göğsü) canlının gövdesine göre ve canlının boyu hesaba katılarak, daha geniş bir açıyla ölçülüyor: efekt canlıya değdiği an hasar veriyor. Bütün canlılar için geçerli.

**Oynanış**
- Öğreticide balta parçaları tamamlanınca artık **Börü** "Şimdi kuzeydeki Demirci Dursun'a git, baltayı o döver, benden selam söyle" diyor (önceden Dursun "Börü haber yolladı" diye çağırıyordu). Dursun'a gidince önce onunla **tanışıyorsun**, sonra parçaları görüp örsü açıyor.

**Tasarım belgesi**
- Silahlar bölümüne "vuruş ne zaman değer" kuralı, öğretici 13. adıma Börü'nün yönlendirmesi ve Dursun'la tanışma eklendi; sürüm satırı 2.08.

---

## Versiyon 2.07 · 29 Ekim 2026

**Düzeltmeler**
- F, baltan çantada olunca elinde olmasa da en yakın ağaca yöneliyor, sonra "taş balta gerekli" uyarısı veriyordu. Artık ağaca yalnızca **elinde balta varken**, madene yalnızca **elinde kazma varken** yöneliyor.
- Sol tıkla elinde balta yokken bir ağaca, kazma yokken bir madene tıklayınca karakter oraya yürüyüp uyarı alıyordu; artık yürümüyor, yalnızca o yöne vuruyor.

**Tasarım belgesi**
- Kontroller tablosundaki F satırı güncellendi; sürüm satırı 2.07.

---

## Versiyon 2.06 · 29 Ekim 2026

**Düzeltmeler**
- Öğreticide Dursun'un balta adımı bozuktu: balta dövüldükten sonra "Hepsini koy" yeniden parlıyor, Dursun'un penceresi düğmeye basmadan kapanınca öğretici "Dursun'a git, döv" adımında kalıp malzemeyi ikinci kez istiyordu. Artık balta dövüldüğü anda "baltayı eline al" adımına geçiliyor; Dursun'la yeniden konuşursan "baltan zaten dövüldü, eline al" diyor, ikinci kez dövdürmüyor.
- Fareyle bir şeyin üstüne gelince çıkan ipuçları hâlâ "E ile topla / E ile konuş" diyordu; artık bağlı tuşu gösteriyor ("F ile topla", "F ile konuş", "sol tık ya da Q ile vur").

**Tasarım belgesi**
- Öğretici 13. adım ve tuş yazıları maddesi güncellendi; sürüm satırı 2.06.

---

## Versiyon 2.05 · 29 Ekim 2026

**Oynanış**
- F artık yalnızca **hemen yanındaki** şeye yöneliyor: karakterin bir kare çevresi, çaprazlar dahil. İki kare ötedeki bir şeye gitmiyor; o zaman F hiçbir şey yapmıyor. Yaklaşınca F en yakındakini topluyor.
- Baltan yoksa ağaca, kazman yoksa madene/kayaya gitmiyor.
- Elinde balta varsa önce ağaca, kazma varsa önce madene yöneliyor; yoksa en yakın toplanacak şeye (çalı, yerdeki taş/dal, meyvesi olgun ağaç). Ayağının dibindeki düşmüş eşyalar her zaman önce alınıyor.

**Tasarım belgesi**
- Kontroller tablosundaki F satırı bu kurallarla güncellendi; sürüm satırı 2.05.

---

## Versiyon 2.04 · 29 Ekim 2026

**Oynanış**
- **Tuşlar değişti:** toplama/konuşma artık **F** (eskiden E), yemek **X** (eskiden F; basılı tutunca yemek listesi), **E** sağ tık gibi **savuşturur / basılı tutunca gard alır**. Diyaloglarda, anılarda ve balık tutarken ilerletmek de F. Hile tuşu "+100 XP" J oldu.
- **F ile otomatik toplama:** menzilde bir şey yoksa F'ye basınca karakter en yakındaki toplanacak şeye (çalı, taş, maden, ağaç; en çok ~6 karo) kendisi yürüyüp topluyor.
- **Sol tık tam tıklanan yöne vuruyor:** çaprazlar dahil her açıya; karakter de o yana (8 yönlü pozla) dönüyor. Önceden 4 yönden birine vuruyordu.

**Arayüz**
- Oyundaki bütün yazılar (öğretici, ipuçları, konuşmalar) yeni tuşları gösteriyor. Ayarlar → Kontroller'de yeni "Savuştur / gard" satırı var; "Varsayılana dön" yeni tuşlara döner. Daha önce kendi tuşlarını atadıysan seninkiler korunuyor.

**Tasarım belgesi**
- Kontroller tablosu yeni tuşlarla güncellendi; sürüm satırı 2.04.

---

## Versiyon 2.03 · 29 Ekim 2026

**Oynanış**
- Bilgisayarda **sol tık her zaman vuruyor**: el boşken yumruk, elde silah ya da alet varsa onunla, tıkladığın yöne. Önceden yalnızca elde silah varken vuruyordu, yoksa Q gerekiyordu.
- Bir kişiye, kazana/örse/pazara, kurulmuş bir eşyaya ya da toplanacak bir şeye (çalı, maden, ağaç) tıklamak eskisi gibi oraya gidip konuşuyor/topluyor.
- Boş yere tıklamak artık karakteri yürütmüyor; yürümek WASD ya da ok tuşlarıyla. Telefonda bir şey değişmedi.

**Tasarım belgesi**
- Kontroller tablosunda "Q / sol tık" satırı güncellendi; sürüm satırı 2.03.

---

## Versiyon 2.02 · 29 Ekim 2026

**Görsel**
- Arka-çaprazdaki ayaklar 2.00'deki haline geri döndü (2.01'deki aynalama geri alındı).

**Tasarım belgesi**
- "Karakterin 8 yönü" maddesinde arka-çapraz ayaklar 2.00'deki tarife döndü; sürüm satırı 2.02.

---

## Versiyon 2.01 · 29 Ekim 2026

**Düzeltmeler**
- Arka-çaprazda ayaklar ters duruyordu (sağ-yukarı giderken sol-yukarıya gidiyormuş gibi). Ayaklar aynalandı; artık gidilen yöne bakıyor.

**Tasarım belgesi**
- "Karakterin 8 yönü" maddesinde arka-çapraz ayaklar düzeltildi; sürüm satırı 2.01.

---

## Versiyon 2.00 · 29 Ekim 2026

**Görsel**
- Çapraz pozlarda (önde ve arkada) gövdenin yanına yapışık duran uzak kol pikselleri tamamen kaldırıldı; yalnızca yakın kol görünüyor.
- Arka-çaprazda baş yeniden normal boyda (%10 küçültme geri alındı).
- Arka-çaprazda ayaklar artık ön-çaprazdaki gibi gidilen yöne bakıyor: sol-yukarıda sol-yukarıya, sağ-yukarıda sağ-yukarıya.

**Tasarım belgesi**
- "Karakterin 8 yönü" maddesi güncellendi; sürüm satırı 2.00.

---

## Versiyon 1.99 · 29 Ekim 2026

**Görsel**
- Ön-çapraz (sağ-aşağı / sol-aşağı): gövde artık dönmüş görünüyor. Gövde gidilen yöne kayıyor, uzak yanı gölgede, yaka o yana dönük. Sağ çaprazda sağ kol, sol çaprazda sol kol gövdeden ayrı duruyordu; artık gövdeye yapışık.
- Arka-çapraz (sağ-yukarı / sol-yukarı): düz duran sırt dönük çizildi (yakın yan gölgede, ortada sırt çizgisi). Ayaklar ters duruyordu; artık öbür ayak önde ve bir adım yukarıda ("öneri 2").

**Tasarım belgesi**
- "Karakterin 8 yönü" maddesi yeni çapraz gövdelerle yeniden yazıldı; sürüm satırı 1.99.

- Belgenin başındaki sürüm satırı kısaldı: yalnızca son sürümün tek cümlelik özeti ve güncelleme notlarına bağlantı (eski sürümlerin listesi kaldırıldı).

---

## Versiyon 1.98 · 29 Ekim 2026

**Görsel**
- Arka-çapraz (sağ-yukarı / sol-yukarı) pozda başın yalnızca arkası (saç) görünüyor: yanak, kulak ve göz yok. Baş gövdeye göre %10 küçük. Gövdenin yanında, kulağın altında kalan ayrık pikseller (uzak kol) kalktı. Seçtiğin "Öneri D".

**Tasarım belgesi**
- "Karakterin 8 yönü" maddesinde arka-çapraz poz Öneri D'ye göre güncellendi; sürüm satırı 1.98.

---

## Versiyon 1.97 · 29 Ekim 2026

**Görsel**
- Arka-çapraz (sağ-yukarı / sol-yukarı) pozda baş yeniden 1.94'teki gibi: ince yanak şeridi ve burun ucu, büyük kulak yok. Gövde, kollar ve ayaklar 1.96'daki çapraz haliyle kalıyor.

**Tasarım belgesi**
- "Karakterin 8 yönü" maddesinde arka-çapraz baş tarifi güncellendi; sürüm satırı 1.97.

---

## Versiyon 1.96 · 29 Ekim 2026

**Görsel**
- Çapraz pozlarda karakter artık **bütünüyle** çapraz dönüyor: gövde daralıyor ve uzak yanı gölgede kalıyor, uzak kol gövdenin arkasına geçiyor, yakın kol öne geliyor, ayaklar çapraz basıyor (uzak ayak bir adım geride, ayak uçları gidilen yöne). Elde alet varsa kol gidilen yöne uzanıyor.
- Arka-çapraz (sağ-yukarı / sol-yukarı) baş yeniden çizildi: senin seçtiğin **Seçenek 1**. Saç yüzü kapatmıyor; dönülen yanda yanak ve **küçültülmüş kulak** görünüyor, göz görünmüyor.
- Karakter yaratma ekranında çevirince ön-çapraz ve arka-çapraz pozlar da aynı yeni gövdeyle görünüyor.

**Tasarım belgesi**
- "Karakterin 8 yönü" çapraz gövde ve arka-çapraz baş seçimiyle güncellendi; sürüm satırı 1.96.

---

## Versiyon 1.95 · 29 Ekim 2026

**Düzeltmeler**
- Ekin'in "Böğürtlen ye" adımı bitince soldaki yemek düğmesi parlamaya devam ediyordu (yemek menüsü açılıp kapanınca öğretici parlamayı unutuyordu). Artık adım biter bitmez parlama ve ok sönüyor; aynı düzeltme öğreticideki bütün parlayan düğmeler için geçerli.

**Tasarım belgesi**
- Öğreticinin "gösterme kuralı"na "adım bitince parlama söner" eklendi; sürüm satırı 1.95.

---

## Versiyon 1.94 · 29 Ekim 2026

**Görsel**
- Karakter artık **8 yöne** bakıyor. Çapraz yürürken yana dönmüş gibi görünmüyor:
  - Sağ-aşağı / sol-aşağı: karakter yaratma ekranındaki **hafif yana bakan ön poz**.
  - Sağ-yukarı / sol-yukarı: yeni **arkadan, başı hafif o yana dönük poz** (yanağın ve kulağın bir kısmı görünüyor).
  - Tam yana yürürken yan profil; yukarı arka, aşağı ön (eskisi gibi).
- Durunca son poz kalıyor. Vururken, toplarken ya da konuşurken karakter o işe dönüyor.
- Karakter yaratma ekranında karakteri sürükleyip çevirince arka-çapraz pozlar da görünüyor (önceden düz arka görünüyordu).

**Tasarım belgesi**
- Kontroller bölümüne "Karakterin 8 yönü" eklendi; sürüm satırı 1.94.

---

## Versiyon 1.93 · 29 Ekim 2026

**Oynanış**
- Görev sahneleri artık **göreve özel**: kişi kendi yerinde, konuşma balonlarıyla **o görevi kendi sözleriyle** cümle cümle anlatıyor (en çok 4 balon). Arada karakterin tepki veriyor ("Anlat bakalım.", "Dinliyorum."), en sonda işi üstleniyor ("Tamam, hallederim!", "Bana bırak.").
- Her balon okuma süresi kadar kalıyor; tık/dokunuş ya da bir tuş sonraki balona geçiyor, **Esc** sahnenin kalanını geçiyor.
- Sahneden sonra açılan pencere kısa: görevin adı, 📍 nerede yapılacağı ve ödül. Kişi uzaktaysa sahne yine atlanıyor, görev eskisi gibi tam metinle veriliyor.

**Görsel**
- Konuşma balonları birden çok satıra kırılıyor; kişinin balonu sarımsı, karakterinki beyaz; köşede "tıkla ▸ / dokun ▸" ipucu.

**Tasarım belgesi**
- "Görev sahnesi" maddesi göreve özel balonlu konuşmayla yeniden yazıldı; sürüm satırı 1.93.

---

## Versiyon 1.92 · 29 Ekim 2026

**Oynanış**
- Her görevden önce kısa bir **görev sahnesi** giriyor (yaklaşık 3 saniye): ekranın üstüne ve altına siyah sinema şeritleri kayıyor, karakterin kişiye dönüp yanına yürüyor, başında bir selam balonu çıkıyor ("Selam Dursun! Bir işin mi var?" gibi), kişi kısa bir balonla cevap veriyor ("Hah, tam seni düşünüyordum!" gibi). Sonra kişi görevi konuşma penceresinde anlatıyor; "Tamam"a basınca görev başlıyor ve "Görev başladı: …" yazıyor.
- Sahne bir tıkla ya da bir tuşla geçilebiliyor. Kişi uzaktaysa, arenada ya da denizdeyken sahne atlanıyor.

**Görsel**
- Görev sahnesi için siyah sinema şeritleri ve kişinin başında sarımsı konuşma balonu.

**Tasarım belgesi**
- Görev kurallarına "Görev sahnesi" maddesi eklendi; sürüm satırı 1.92.

---

## Versiyon 1.91 · 29 Ekim 2026

**Arayüz**
- Görev yeri artık küçük bir sarı çemberle değil, **görevin yapılabileceği her yerin sarıya boyanmasıyla** gösteriliyor (büyük ve küçük haritada, yavaşça parlayarak, gece de):
  - Toplanacak/kazılacak/kesilecek şey: bulunduğu **bütün biyomlar** (her yerde çıkıyorsa bütün ada).
  - Avlanacak hayvan ya da hayvandan düşen şey: hayvanın yaşadığı bütün biyomlar.
  - Balık ve nehir kili: **nehirler ve sığ sular**.
  - Bir biyoma gitme: o biyomun tamamı.
  - Bir kişiye ya da yere gitme: o kişinin çevresinde büyük, nabız gibi atan sarı ışık ve halkalar.
- **Ok:** sarı bölgenin içindeysen (o biyomdaysan) ok çıkmıyor; dışındaysan ok seni bölgenin en yakın yerine götürüyor.
- Görev konuşmasındaki 📍 satırı biyomların adını yazıyor ("Orman, Bataklık · haritada sarı bölge").
- Oyun içinde etrafına çizilen kesikli sarı çember kaldırıldı (bölge görevlerinde).

**Tasarım belgesi**
- "Yol gösterme: ok ve sarı bölge" bölümü yeniden yazıldı; sürüm satırı 1.91.

---

## Versiyon 1.90 · 29 Ekim 2026

**Arayüz**
- Büyük haritada (M) görevi olan kişiler artık belirgin şekilde parlar: üstünde **!** olan herkesin arkasında sarı bir ışık ve dışa doğru açılan iki sarı halka, **?** olan (teslim edilecek görev) kişilerde yeşil ışık ve halkalar var. Haritayı açınca nereye gideceğin hemen görünür. Kuzenler de dahil.

**Tasarım belgesi**
- "Harita, işaretler, defterler" bölümüne görevli kişilerin haritada parlaması eklendi; sürüm satırı 1.90.

---

## Versiyon 1.89 · 29 Ekim 2026

**Oynanış**
- Yere düşen eşyaları çeken mıknatısın menzili %30 kısaldı (30 → 21 piksel). Eşyalar artık ancak yanlarına gelince sana süzülür.
- Börü'nün atılma dersindeki kerevit artık doğadaki gibi davranır: yürüyerek yaklaşır, uzaklaşırsan peşinden yürür, bekler, kırmızı **!** ile saldırır ve saldırıdan sonra olduğu yerde kalır. Başka bir yere ışınlanıp durmaz.
- Börü'nün yumruk dersinde (bilgisayarda) dövüş doğru öğretilir: **WASD ya da yön tuşlarıyla** yürü, **sol tıkla** vur. Bu derste sol tık yürütmez, tıkladığın yöne yumruk atar.
- Zümrüt meşaleyi eline aldırınca meşaleyi anlatır: gündüz işe yaramaz, gece içindir; yalnızca elindeyken yanar ve Kaba meşale yaklaşık iki dakikada biter (yağmurda daha çabuk). Gündüz elinden indirmeni, akşam yeniden almanı ve yedek yapmanı söyler.

**Düzeltmeler**
- Börü'nün atılma dersi bitince "Yetenek ağacını aç" adımı artık kaybolmuyor: konuşma penceresi kapansa bile ağaç ikonu parlamaya devam eder. Börü'nün üstündeki ok kalkar; Börü'ye tıklarsan dersi ya da kereviti ikinci kez vermez, yalnızca "önce yetenek ağacını aç" der.
- Öğreticide el yapımı ekranındaki **Yap** düğmeleri (Sopa, Keskin taş, İp) artık gerçekten yanıp söner; İp listenin aşağısındaysa liste oraya kayar.
- Ekin'in "Böğürtlen ye" adımında yemek düğmesi okun yanında parlamıyordu; artık parlar.

**Görsel**
- Demirci Dursun ve silahçı kuzenleri örse yarı hızda vurur (saniyede 1,8 vuruştan 0,9'a); kıvılcımlar da yarı sıklıkta çıkar.
- Balta ile ağaç keserken iş çubuğunda "Toplanıyor: Çam odunu" yerine "**Kesiliyor: Çam ağacı**" yazar; kazma ile kazarken "**Kazılıyor: …**" yazar.

**Ses**
- Demircilerin çekiç çınlaması yarı sıklıkta çalar; sürekli çınlama bitti.

**Arayüz**
- Öğreticide basman gereken her düğme **mavi parlar** ve yanında yanıp sönen bir **ok** olur: yemek düğmesi ve Böğürtlen'in Ye düğmesi, yetenek ağacı ikonu, balta parçalarının Yap düğmeleri, Dursun'un örsünde önce **Hepsini koy** sonra **Döv**, balta dövülünce sırayla envanter düğmesi → Taş balta → boş alet yuvası → alttaki kutusu.

**Tasarım belgesi**
- Öğretici tablosu (2., 5., 11., 12. ve 13. adımlar), "gösterme kuralı" ve Börü'nün atılma dersi (kerevitin yürümesi, yetenek ağacı adımı) güncellendi.
- Sistemler bölümüne mıknatıs menzili (21 px) ve iş çubuğu yazıları eklendi; Dursun'un bölümüne çekiç hızı eklendi; sürüm satırı 1.89.

---

## Versiyon 1.88 · 29 Ekim 2026

**Oynanış**
- Tıka basa tokken de yemek yenir. Tokluk 100'ü geçmez; yemeğin canı ve yan etkileri (güçlendirmeler, çiğ etin mide bulantısı) yine işler.

**Düzeltmeler**
- Tanrı modunda öğreticinin "böğürtlen ye" adımı yapılamıyordu (tokluk hep doluydu); artık yapılıyor.

**Arayüz**
- "Tıka basa toksun" uyarısı kaldırıldı.

**Tasarım belgesi**
- Temel sistemler → Can, tokluk, enerji: yemek satırı "tokken de yenir, tanrı modunda da" diye güncellendi.
- Belgenin başındaki sürüm satırı 1.86'da kalmıştı; 1.88'e (1.87 ve 1.88 özetleriyle) güncellendi.
- Belge sayfasının kenar çubuğundaki sürüm 1.77'de kalmıştı; artık sürüm satırından kendiliğinden alınıyor.

**Proje**
- `GUNCELLEME_NOTLARI.md` eklendi (bu dosya); her sürümde güncellenip Boğaç'a gönderilir.
- `CLAUDE.md`, `DEVAM_NOTU.md` ve yayın skill'ine güncelleme notu kuralı eklendi.

---

## Versiyon 1.87 · 28 Ekim 2026

**Düzeltmeler**
- Telefonda **Ulti** düğmesine basınca ulti yerine Robot köpekler menüsü açılıyordu (arenada ve açık dünyada). Artık ulti atılıyor; R'nin köpek menüsü görevi bilgisayarda değişmedi.

**Tasarım belgesi**
- Kontroller tablosu, R satırı: "arenada R yalnızca ulti; Ulti düğmesi yalnızca ulti atar, köpek menüsünü açmaz".

**Proje**
- Yayın adımları skill olarak depoya eklendi: `.claude/skills/purple-light-surum-yayinla/SKILL.md`.

---

## Versiyon 1.86 · 28 Ekim 2026

**Oynanış · ACT 1 görev sistemi baştan**
- Eski ACT 1 görevlerinin hepsi kaldırıldı (Ekin'in 14 görevi, yan görevler, kuzenlerin 45 görevi). Yerine 27 kişide **139 yeni görev**.
- Aynı anda **tek görev** yapılır. Haritada aynı anda en çok **2 kişi** iş bekler.
- Konuşunca görev hemen başlar ("Kabul et" düğmesi yok). Tanışılmamış biriyse önce tanışma konuşması, ardından görev gelir.
- Görevdeyken iş veren biriyle konuşursan "Şu an bir işin var; önce onu bitir" der; kazan, örs, pazar gibi hizmetler çalışmaya devam eder.
- Görev bitince görevi verenin yanına (2 karo) gidince kendiliğinden biter. Gitmek, tanışmak, köprü, patlama, izler ve gemi işleri yapıldığı anda biter.
- Görev kartındaki **×** ya da görevi verenin menüsündeki "📜 Görev" satırıyla bırakılır; ilerleme silinir.
- Her görev, istediği malzeme oyunda bir kez bulunmadan açılmaz.
- Ekin yalnızca ana yolun 5 görevini verir (ilk iş, köprü, patlama, izler, Levent'i bulmak). Kimsede iş kalmazsa sıradaki kilitli görevin eksiğini kapatan bir "ayak işi" verir.
- Aletler, ateş, balık, tuzak, satış, maden gibi öğrenme işleri Dursun, Rıza, Börü, Nazlı, Durmuş ve kuzenlere dağıtıldı.
- Köprü, kaya yığını ve Levent'in gemi enkazı görev alınmadan kullanılamaz. Kısayol köprüleri ana köprüden sonra görevsiz onarılır.
- Ekin'in koşu dersi artık köprü görevi bitince başlar.
- Hikâye parçaları yeni görevlere eşit aralıkla bağlandı; Elmas Nine sahnesi 18 akrabanın yeni görevleri bitince oynar.
- Görev alınınca, bitince ya da bırakılınca oyun otomatik kaydeder.
- Rıza: barınak görevinde malzemeler çantadaysa doğrudan sipariş listesini açar.

**Görsel**
- Görevi olan kişinin başında **sarı zemin üzerinde siyah !** ve çevresinde **sarı parlama** (dünyada).
- Küçük haritada ve büyük haritada görev veren kişi **parlar** ve başında siyah ! çıkar; keşfedilmemiş yerde olsa da görünür.
- İstenen şeyin yeri dünyada **kesikli, dönen sarı çember** (yaklaşık 12 karo), haritalarda sarı çember.
- Tanışılmamış kişilerin eski sarı ! işaretleri ve eski mavi !/sarı ? görev işaretleri ACT 1'de kalktı.
- Köprü, kaya yığını ve gemi için **yüzsüz onay penceresi** (krem kâğıt üzerine koyu yazı).
- Karakterin başında **konuşma balonu**: "Aa, sandığımdan kolaymış!", "Kulaklarımı tıkasam iyi olur…", "Vay be!", "İşte ACT 1'in sonu… ya da başlangıcı.", görevsiz gelince "Buradan nasıl geçebilirim acaba?" (bir kez).
- **Ders kartı:** ekranın üstünde, sarı çerçeveli, adım adım (Devam / Dersi geç), ilgili düğmeler yanıp söner. 18 ders.
- Görev kartı: başlık "<Kişi> · Görev", ilerleme, 📍 yer satırı ve köşede **×** düğmesi; görev yokken "Başında siyah ! olan kişiyle konuş" yazar.
- Görevler paneli (G) yeni düzen: aktif görev, "Seni bekleyenler", tamamlanan sayısı, "Bu işi bırak".

**Ses**
- Görev alma, bitirme (sikke), bırakma ve ders adımlarında oyunun mevcut efektleri.

**Kayıtlar**
- Eski kayıtlarda görev ilerlemesi sıfırlanır; envanter, yapılar ve dünya kalır. Açılışta uyarı çıkar.

**Tasarım belgesi**
- Yeni bölüm "ACT 1 · Görevler (görev sistemi v2)": kurallar, yol gösterme, 18 ders, köprü/kaya/gemi, ayak işleri, 27 kişinin görev tabloları.
- "ACT 1 yol haritası" yeni zincire göre yeniden yazıldı.
- Eski "ACT 1 · Kişiler ve görevler" bölümü referans olarak işaretlendi.
- Belgenin parçaları (`parts/*.md`) yeniden bölündü; belge üretme komutu 1.86 içeriğini koruyor.

---

## Versiyon 1.85 · 28 Ekim 2026

**Oynanış**
- Ada yeniden çizildi: **altı biyom eşit büyüklükte** ve sırayla: Çayır (güneybatı) → Orman (kuzeybatı) → Bataklık (kuzey orta) → Kayalık Dağ (güney orta) → Kül Diyarı (güneydoğu) → Mor Kristal Vadisi (kuzeydoğu).
- Büyük nehirde **üç kırık köprü**, her biri ayrı onarılır (20 odun). Kuzeydeki (Orman ↔ Bataklık) ana köprü; ikisi Çayır ↔ Kayalık Dağ arasında kısayol.
- Kaya yığını Kayalık Dağ ile Kül Diyarı arasında; patlayınca **bütün sıradağ çöker**, sınır tamamen kalkar.
- Başlangıç kumsalı, tarla, göl, izler ve kişilerin yerleri yeni haritaya taşındı.

**Görsel**
- Yeni ada haritası (biyom şekilleri, nehirler, göller, bataklık gölcükleri).
- Haritada üç köprü işareti; sıradağ çökünce harita da güncellenir.
- Patlamada sıradağ boyunca toz ve taş parçacıkları, ekran sarsıntısı.

**Kayıtlar**
- Eski haritadan gelen kayıt kumsalda başlar, harita yeniden keşfedilir; envanter ve ilerleme korunur (uyarı çıkar).

**Tasarım belgesi**
- "Adanın yerleşimi" ve biyom bölümleri yeni haritaya göre güncellendi; köprü ve doğu geçidi kuralları yazıldı.

---

## Versiyon 1.84 · 28 Ekim 2026

**Oynanış**
- **15 yeni NPC:** Zümrüt, Dursun ve Durmuş'un kuzenleri; Çayır dışındaki her biyomda bir cadı, bir silahçı, bir zırhçı (Orman: Yakut, Durdu, Duran · Bataklık: Safir, Ali, Veli · Kayalık Dağ: Firuze, Kaya, Kayhan · Kül Diyarı: Mercan, Turan, Tufan · Mor Kristal Vadisi: İnci, Kudret, Kuvvet).
- İlk karşılaşmada onlara önceki biyomdaki akrabanın adıyla seslenirsin; "ben o değilim, kuzeniz" deyip onu küçümserler.
- Cadıların kazanı bütün tarifleri öğretir.
- **Kademe kuralı:** her demirci yalnızca kendi biyomunun malzemesiyle (ve öncekilerin) yapılanları döver; Dursun ve Durmuş artık yalnız Çayır malzemesi.
- **Kuzenlere özel 15 eşya:** Granit gürz, Timsah dişi kılıcı, Gümüş kılıç, Lav camı kılıcı, Ametist kılıcı ve 10 zırh parçası.
- Bütün aile görevleri bitince **Elmas Nine** ortak ara sahnesi (mor ışık ninelerini kaçırmış).
- Zümrüt, Dursun ve Durmuş'a "Kuzenlerin var mı?" sorusu.

**Görsel**
- Kuzenler Zümrüt, Dursun ve Durmuş'la birebir aynı görünür; cadıların **kazan sıvısı** adlarındaki taşın renginde (kırmızı, mavi, turkuaz, mercan, inci beyazı).
- Demircilerin **ocak, örs, çekiç ve askıları** biyomdan biyoma daha gösterişli (granit ocak → demir örs ve manken → gümüş boynuzlu örs → lav dönen bazalt ocak → ametist kakmalı obsidyen örs); kıvılcım renkleri değişir.
- Her kuzenin yanında kendi kamp ateşi.
- 15 özel eşyanın simgeleri; kuzen cadıların konuşma penceresi çerçevesi kazan renginde.
- Elmas Nine ara sahnesi (18 akraba ateş başında, geçmişte dağ evindeki mor ışık).
- Haritada kuzenlerin simgeleri.

**Tasarım belgesi**
- Yeni bölüm "Zümrüt, Dursun ve Durmuş'un kuzenleri": aileler, kazancılar, kademe tablosu, çalışma yerleri, özel eşyalar, hikâyeler ve ailenin sahnesi.
