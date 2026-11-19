# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 4.29 · 19 Kasım 2026

### Görsel
- **Karakter yaratma ekranında, envanterde, karakter penceresinde ve arenada da yeni çizim:** karakterini oluştururken gördüğün figür artık oyunda yürüyen figürle aynı; sürükleyerek ya da Döndür'le 8 yöne çevrilebilir.
- **Her saç biçimi ayrı çizildi (ComfyUI):** erkekte Kısa, Dağınık, Yana taranmış, Dikleştirilmiş, Uzun, At kuyruğu, Kel; kadında Uzun, At kuyruğu, Örgü, Topuz, Küt, Kısa, İki kuyruk, Kel. Hepsi 8 yönde, adım adım yürür.
- **Seçenekler yeni çizimde de görünür:** bıyık, sakal, buff, gözlük, şapka (kasket, bere, hasır, kovboy, silindir, fes, korsan, bandana, çiçek tacı) ve saç tokası her yönde başın üstünde; göz rengi de boyanır. Kadında Tişört seçilince tunik eteği ve bacaklar pantolon renginde.
- Sevdiğin kişinin seçimi, ara sahneler ve konuşma resmi eski çizimle.

### Düzeltmeler
- Kadın karakter sola ve sağa yürürken ters yöne bakıyordu; düzeldi.

### Tasarım belgesi
- Sistemler › Yeni ikonlarla › "Oyuncunun karakteri": yaratma ekranı ve figürler, saç biçimleri, aksesuarlar, Tişört/Elbise rengi.

---

## Versiyon 4.28 · 19 Kasım 2026

### Görsel
- **Karakterin yeni çizimi, 8 yönde gerçek yürüyüş:** oyun dünyasında oyuncunun karakteri (erkek ve kadın) baştan çizildi. Kenarlardaki beyaz/yeşil hale kalktı, çapraz yönler (sağ-aşağı, sol-aşağı, sağ-yukarı, sol-yukarı) artık gerçekten o yana dönük.
- **Zıplama yok, adım var:** yürürken gövde ve baş yerinde kalır, bacaklar adım atar (her yönde 4 adım karesi; koşarken adımlar hızlanır). Durunca duruş karesine döner.
- Erkek: kısa saç, gömlek ve pantolon; kadın: uzun saç, tunik elbise. Ten, saç, üst ve alt rengi karakter yaratmada seçtiğin renklere boyanır (çizme boyanmaz).
- Karakter yaratma ekranı, karakter penceresi ve ara sahneler eski çizimle.

### Tasarım belgesi
- Sistemler › Yeni ikonlarla: "Oyuncunun karakteri" maddesi eklendi (8 yön, 4 adım karesi, zıplamasız yürüyüş, boyanan bölümler).

---

## Versiyon 4.27 · 19 Kasım 2026

### Oynanış
- **Reisler tek kurala bağlandı:**
  - Bir Reis türünün 4 katı canla gelir; hızlı türlerin (Bataklık kurdu, Kartal, Vaşak, Kül kurdu, Kor yarasası, Gölge kurdu…) Reisi 3 katıyla.
  - Türüyle aynı hasarla vurur. Etkisi 1,5 kat; uzaktan atanlar bir atış fazla ve biraz daha sık atar.
  - Hiçbir Reis yardıma sürü çağırmaz.
  - ACT 1'de bir Reis en az 100 can ve 10 hasarla gelir.
  - Verdiği XP ve Vio türün temel XP'sinden hesaplanır.
  - Ör. Bataklık Kurdu Reisi 1.200 can · 46 hasar, Timsah Reisi 4.000 · 66.
- **Mağara boss'ları** yenilince Reis ödülü yerine o mağaranın görev ödülü kadar Vio verir: Yankı Kraliçesi 310, Yaşlı Kök 500, Çamur Ana 700, Dağ Devi 1.000, Kor Kral 1.400, Işık Yutan 2.000. Görevi veren kişinin ödülü yine ayrıca gelir. Boss'un düşürdükleri leşinde kalır, leşe F ile alınır.
- **Bataklık canlıları:**
  - Ördek 30 can; Yaban kazı 260 · 30; Turna kuşu 300 · 32; Su samuru 340 · 36.
  - Bataklık kurdu 400 · 46, kanaması daha hafif. Timsah 1.000 · 66.
  - Verdikleri XP değişmedi.
- **Kuşaklar:** Timsah Bataklık'ın orta kuşağına Seviye 20'den itibaren gelir. Kayalık Dağ canlıları daha erken seviyede gelir (Yaban öküzü 23, Kartal 25/23, Vaşak 25); Kayalık Dağ canlıları seni Seviye 36'dan sonra güçlü görüp çekinir.
- **Batık Mağara:** Çamur Ana 2.000 can · 32 hasar, zehri daha hafif. Sülükler 1–2'li gelir, mağara daha yavaş dolar.
- **Balta ve kazma** bir canlıya aynı kademenin topuzundan sert vurmaz (ör. Demir balta 26, Granit kazma 19). Ağaç kesme ve kazma hızı aynı.
- **Kamış çizme:** savunma 9, değeri 151 Vio.
- **Görevler:**
  - Ali'nin 2. görevi 250, 4. görevi 300 Vio; Veli'nin 4. görevi 500 Vio.
  - Ali'nin ilk görevinde Demir cevheri için doğru kazma yazar (granit ya da tunç). Görev kartı, elindeki kazma bir madeni kazamıyorsa hangi kazmanın gerektiğini söyler.
- **Yan görevler:**
  - Hekim Şifa'nın kazanında her dalgada tek canavar gelir; Şifa'nın son sözü yenilendi.
  - Avcı Kartal'ın yanında beklerken her dalgada bir Bataklık kurdu ve bir Engerek gelir.
- **Av yeri:** Bataklık ve sonrasında bir canlıyı avlama görevinde haritadaki sarı bölge, o canlının senin seviyende gerçekten çıktığı yerleri gösterir (ör. "Bataklık'ın derinleri, köprüden uzakta"). Seviye atlayınca bölge güncellenir.
- **Mağaradayken** görev sırası ve tarif ayak işi o mağaranın biyomuna göre seçilir (Batık Mağara'da Bataklık kişileri ve Safir).
- **Dut ve İncir** ağaçları kesilmez, yalnız silkelenir.
- **"Yeni ders" kartı** başka bir ders kartının üstüne açılmaz; önceki kapanınca gelir.

### Tasarım belgesi
- Reis kuralı ve hızlı tür; mağara boss'unun ödülü; Bataklık ve Batık canlı tabloları; Kayalık kuşakları; balta ve kazma hasarı; Kamış çizme; ödüller; Şifa ve Kartal; av sarı bölgesi; kazancı ve mağara.

=====================================================================

---

## Versiyon 4.26 · 18 Kasım 2026

### Oynanış
- **Yükseltme zinciri:** her silah, alet ve zırh bir öncekinin yükseltmesidir. Bakır kılıç bir Taş kılıç, Tunç kılıç bir Çakmaktaşı kılıç ister; kılıç, savaş çekici, topuz, mızrak, balta, kazma, yay, miğfer, gövde zırhı, eldiven ve çizmede hep böyle. Üstündeki ya da elindeki parça da kullanılır: yenisi aynı yere kendiliğinden takılır (çantada aynısı varsa önce o kullanılır). Körelmiş parça da olur, yenisi tam keskin gelir. Satırda ve görev kartında "Önceki kademe" yazar. Kamış çizme zincirin dışında kalır.
- **Fiyatlar:** zincirdeki parçanın değeri kendi değerine önceki parçanın yarısı eklenerek bulunur (ör. Granit kılıç 1.444, Ametist kılıcı 15.956). Ustanın işçiliği yalnız parçanın kendi değerinden alınır.
- **Silah, zırh, takı ve aletler satılmaz:** hiçbir pazarcıya satılmazlar ve satış listesinde görünmezler. Oklar, meşaleler, malzemeler ve yemekler eskisi gibi satılır.
- **Canlılar:** Çayır canlıları güçlendi (Kurt 125 can · 16 hasar, Geyik 110 · 15, Yaban atı 150 · 17). Orman ve mağaralar yeniden dengelendi; Yankı Mağarası kolaylaştı (yarasalar 1–2'li gelir, Yankı Kraliçesi 350 can). Verdikleri XP değişmedi.
- **Reisler:** her Reis en az 100 can ve 10 hasarla gelir. Çayır ve Orman Reisleri artık sürü çağırmaz ve türleri kadar hızlı vurur.
- **Düşen eşyalar:** her eşya kendi ihtimaliyle düşer; Tavşan derisi gerçekten %70 düşer. Avdan biraz daha çok eşya çıkar.
- **İlk gece bayılmak kayıpsız:** oyunun ilk gecesinde neyle bayılırsan bayıl hiçbir şey kaybolmaz.
- **Kurt:** Seviye 1–5'te gece sahada en çok bir Kurt olur.
- **Topuz:** hasarı kılıcın dörtte üçü (Taş 9, Bakır 12, Çakmaktaşı 14…) ve biraz yavaş (0,40 sn). Mızrak hızlandı (0,5 sn).
- **Tuzak:** Çayır'da Tavşan, Keklik ve Bıldırcın; Orman'da Sincap ve Tavşan yakalar.
- **Engerek** artık %90 ihtimalle Zehir bezesi düşürür.
- **Görevler:**
  - Börü'nün "Kuzeye keşif" görevi Orman'dan önce bir çakmaktaşı silahı ve bir zırh parçası ister, 120 Vio verir.
  - Duran'ın "Kabuk zırh" görevi 450 Vio verir.
  - "Ocak başı" ve "Çatlak sap" 4 sert odun, "Servi sapı" 3 sağlam odun, "Pruvadaki fener" 4 kadim odun ister.
  - Cadı Yakut'un ilk görevi Orman'a varınca açılır.
  - Usta Sinan ilk tanışmada hediyesinin ardından ilk görevini de verir.
- **Ayak işleri:**
  - "Tarif öğren" işini artık bulunduğun biyomun cadısı verir: Çayır'da Zümrüt, Orman'da Yakut.
  - Yalnızca bir kişi görev bekliyorsa, sıradaki görevin eksik malzemesi ya da tarifi için bir ayak işi de çıkar.
- **Pamuk** bir engele takılırsa ya da çok geride kalırsa yanına gelir.
- **Toprak'ın kuşu:** yuvanın yanında "1 Kuru ot gerekli" yazar; Toprak da kuru ot götürmeni söyler.
- **Mağara kapısı** meşalen yanmıyorsa onu meşale yuvasından nasıl yakacağını söyler.
- "Başında siyah ! olan kişiyle konuş" yazısı ilk görev bitince artık görünmez.
- Dursun "Taş balta Çayır'ın ve Orman'ın ağaçlarını keser" der.
- Orman canlıları seni Seviye 25'ten sonra güçlü görüp çekinir.

### Tasarım belgesi
- Yükseltme zinciri ve üstündeki parçanın yükseltilmesi; canlı ve Reis tabloları; silah tablosu; "Tek parça eşyalar satılmaz"; Kemal'in ayak işleri ve kazancılar; B5; düşme yüzdeleri; bayılma; tuzak; sürülerin boyu; Pamuk; Toprak; mağara kapısının meşale satırı.

### Tasarım belgesi
- Oyuncunun Orman'a varış seviyesi ölçüme göre ~10 olarak yazıldı; köprü Seviye 12'de açılır. Canlı, Reis ve mağara tabloları, yükseltme zinciri (tür tür kademe tablosu ve özel parçalar), satış kuralı, ayak işleri ve görev satırları güncellendi.


---

## Versiyon 4.24 · 14 Kasım 2026

### Oynanış
- **Rezene kalktı:** Çayır'daki yeri öbür otlara (Ebegümeci, Gelincik, Hardal otu, Nane, Papatya, Yabani buğday) dağıldı; tarifleri de kalktı. E6 görevi artık 2 **Nane** istiyor. Eski kayıtlarda Rezene Nane'ye, Rezene çayı Nane çayına döner.
- **Yeni adlar:** Yaban çileği → **Çilek**, Yabani elma → **Elma**, Yabani armut → **Armut** (ezmeleri, suları ve kurutulmuşları da). Eski kayıtlardaki eşyalar kendiliğinden yeni adına geçer.

### Görsel
- **Yeni ikonlar:** Taş, Çakmaktaşı, Dal, Lif, Kum, Kuru ot, Nehir çakılı, Yaprak, Sarkıt, Yarasa gübresi, Ebegümeci, Hardal otu, Nane, Papatya, Yabani buğday, Havuç, Çilek, Böğürtlen, Kireçtaşı, Kumtaşı, Bakır cevheri, Elma ve Armut yeni resimleriyle (envanterde, kitapta, elde, yerde). Çilek yerde de yeni resmiyle duruyor.
- **Böğürtlen çalısı** yeni çizimiyle (olgun, yarım, toplanmış hali).
- **Maden kayaları:** Kireçtaşı (çatlaklı krem-beyaz blok), Kumtaşı (katmanlı kahve-turuncu kaya), Bakır cevheri (turuncu bakır topaklı koyu kaya) yeni çizimleriyle.
- **Ağaçlar:** Çam, Kavak, Elma ve Armut yeni çizimleriyle; olgun Elma ve Armut ağaçlarının tacında meyveler görünür, silkeleyince kaybolur.
- **Zemin:** Çayır'ın çimi (açık ve koyu), kum ve su (göl, derin deniz, sığ kıyı) yeni dokularla; yan yana karolar dikişsiz birleşir. Dalgalar, parıltı ve kıyı köpüğü eskisi gibi.
- **Kişiler:** Yaşlı Kemal, Cadı Zümrüt, Pazarcı Nazlı, Demirci Dursun, Zırhçı Durmuş, Savaşçı Börü, Çiftçi Ekin, Usta Sinan ve Avcı Doğan yeni çizimleriyle: uzaktayken önden durur, yanına gelince sana döner, işini yaparken işine bakar, yürürken adım atar. Konuşma kutusundaki resimleri de yeni çizimden.
- **Kuzenler:** 15 kuzen (cadılar, demirciler, zırhçılar) Zümrüt, Dursun ve Durmuş'un yeni çizimiyle; konuşma resimleri de.
- **Kişilerin eşyaları:** Zümrüt'ün kazanı, Dursun'un ocağı ve örsü, Durmuş'un örsü ve zırh askısı, Nazlı'nın tezgâhı, Sinan'ın tezgâhı ve kereste yığını, Doğan'ın kulübesi, Börü'nün talim kuklası ve Kemal'in kamp ateşinin taş halkası yeni çizimleriyle. Alevler, kabarcıklar, kıvılcımlar, duman ve testere eskisi gibi hareketli. Kuzen cadıların kazanı da yeni çizimde, iksiri her kuzenin kendi renginde.

### Tasarım belgesi
- Sistemler › Yeni ikonlarla: maden kayaları ve ağaçlar, zemin karoları, kişiler ve kişilerin eşyaları bölümleri; Çilek, Elma, Armut adları; Meyve çalılarının resimleri.
- Eşyalar: yeni ikonlu eşyaların listesi, yeni adlar; Rezene kalktı.
- ACT 1: Çayır otlarının sayıları Rezene'nin yerini alacak biçimde güncellendi; E6 2 Nane istiyor.
- Tarifler ve başarımlar: tarif sayısı 766, eşya sayısı 1.236.

---

## Versiyon 4.23 · 14 Kasım 2026

### Görsel
- **Gelincik yeni resmiyle:** iki kırmızı gelincik, sağdaki daha yukarıda ve sapı hafifçe kıvrık; dipte ince koyu yeşil çimen. Envanterde, kitapta ve yerde aynı resim.
- Dal yerde yan yatıyor, Yaprak biraz dönük duruyor.
- Yerdeki Nehir çakılı, Kum, Dal, Kuru ot ve Yaprak'ın gölgesi artık resmin tam altında (Kum'un gölgesi aşağıda kalıyordu).

### Tasarım belgesi
- Eşyalar › Yeni ikonlar: Boğaç'ın ComfyUI ile çizdirip seçtiği ikonlar için yeni bölüm (şimdilik Gelincik).
- Sistemler › Çayır'da yerdeki toplanabilirlerin görünüşü: Gelincik'in yeni görünüşü yazıldı.

---

## Versiyon 4.22 · 13 Kasım 2026

### Düzeltmeler
- Kemal, 3 böğürtlen toplanınca artık "Üçü de tamam evlat!" diyor ("Beşi de tamam" değil).

### Görsel
- Nehir çakılı, Kum, Dal, Kuru ot ve Yaprak yerde toplanmayı beklerken de yeni resimleriyle görünüyor (önce yalnızca envanterde değişmişti).

### Tasarım belgesi
- Eşyalar bölümüne bu beş malzemenin yerdeki resminin de yeni olduğu yazıldı.

---

## Versiyon 4.21 · 13 Kasım 2026

### Düzeltmeler
- **Purple Light ve CoffeBean artık ayrı uygulama olarak yüklenebiliyor.** İki oyunun uygulama kimliği aynı çıkıyordu; Chrome ikisini tek uygulama sanıyor, biri yüklenince diğerinin yerine geçiyordu (pencerede adı CoffeBean, içinde Purple Light). Purple Light'ın kimliği artık kendi klasörü. Eski karışık uygulama kaldırılıp oyun kendi adresinden yeniden yüklenmeli.

### Tasarım belgesi
- Teknoloji › Uygulama olarak yükleme: uygulama kimliği `/purple-light/` olarak yazıldı.

---

## Versiyon 4.20 · 13 Kasım 2026

### Oynanış
- **Meyve çalıları:** Böğürtlen, Ahududu, Yaban mersini, Kızılcık, Kuşburnu ve Alıç artık dünyada çalı olarak duruyor.
  - Her çalıdan 3 kez toplarsın: her seferinde yere bir meyve düşer, çalı yerinde kalır ve meyvesi azalmış görünür.
  - Üçüncü toplayışta çalı kaybolur, bir süre sonra kendi biyomunda başka bir yerde yeniden çıkar.
  - Çalının yanına gelince kaç meyve kaldığı yazar ("Böğürtlen çalısından topla (2 kaldı)").
- **Kemal'in ilk dersi:** artık 5 değil **3 böğürtlen** topla ve üçünü de ye; üçü de aynı çalıdan alınabilir.

### Görsel
- Yeni resimler: böğürtlen çalısı ve böğürtlen; diğer beş çalı ve meyveleri aynı resmin kendi rengine boyanmış hali.
- Nehir çakılı, Kuru ot, Kum, Dal ve Yaprak'ın ikonları yenilendi.

### Tasarım belgesi
- Toplama bölümüne "Meyve çalıları" eklendi; öğretici adımları 3 böğürtlene göre, eşya tablosundaki "nereden gelir" satırları çalıya göre güncellendi.

---

## Versiyon 4.19 · 13 Kasım 2026

### Oynanış
- **Hayvanlar seni fark ediyor:** saldırgan bir hayvan seni görünce başında sarı "?" çıkar, bir an durup bakar, sonra saldırır.
  - Dururken çok daha yakına, yürürken biraz daha yakına sokulabilirsin; koşarsan her zamanki uzaklıktan fark edilirsin.
  - Tavşan, keklik gibi zararsız hayvanlar da dururken ve yürürken daha geç kaçar, koşunca daha erken.
- **Nötr hayvanlar uyarıyor:** geyik, karaca, yaban atı, porsuk, öküz gibi bir hayvanın dibine girersen turuncu "!" çıkar, homurdanıp başını sallar. 1,5 saniye içinde uzaklaşmazsan saldırır.
- **Yaralı hayvanlar kaçıyor:** canı çok azalan hayvanların çoğu kan izi bırakarak kaçmaya çalışır; sıkışırsa ya da yetişirsen döner ve dövüşür. İri hayvanlar ve Reisler kaçmaz.
- **Güçlüden çekiniyorlar:** bir biyomun saldırgan hayvanları, o biyoma varış seviyesinin 15 seviye üstündeyken sana kendiliğinden saldırmaz, uzak durur. Vurursan dövüşür.
- **Hayvanlar birbirini avlıyor:** kurtlar tavşan, keklik, bıldırcın ve sincabı; Bataklık kurdu ve Timsah ördeği; Vaşak ve Kartal Ur kekliğini; Gölge kurdu Mor güveyi avlar. Avın leşi yerde kalır: eti yenmiştir, derisini ve tüyünü sen toplayabilirsin.
- **Her hayvanın kendi hamlesi var:**
  - Geyik, Karaca, Yaban atı, Kristal geyik: tekme ve geri sıçrama. Yaban kazı ve Turna kuşu: kanat çırpma.
  - Engerek, Kunduz, Su samuru, Işık tilkisi, Işık engereği: vur-kaç.
  - Yaban domuzu, Muflon, Dağ keçisi, Yaban öküzü: geri geri gidip hücum.
  - Mağara ayısı, Porsuk: ayağa kalkıp iki pençe (ilki sarı, ikincisi kırmızı).
  - Kartal, Kor yarasası: havaya yükselip dalış. Timsah: çamura gömülüp altından saldırı.
  - Kirpiler, Kül böceği: top olup yuvarlanma. Lav kertenkelesi, Kara ejder, Kristal örümcek: kuyruk süpürmesi. Ateş akrebi: zehirli iğne.
- **Kurtlar sürü halinde kuşatıyor:** en yakındaki önünden oyalar, öbürleri yanına ve arkana dolaşıp oradan saldırır.
- **Arkadan uyarı:** arkanda ya da uzakta biri saldırıya hazırlanırken karakterinin çevresinde o yöne bakan renkli bir ok yanıp söner.
- **Kayalık Dağ dengelendi:** Kartal (can 820, hasar 90), Vaşak (880, 95) ve Mağara ayısı (2.100, 115) artık Bataklık ile Kül Diyarı arasında. Reisleri de aynı oranda değişti.
- **Arena:** yeni hamleler ve kurtların kuşatması arenada da var.

### Tasarım belgesi
- Dövüş bölümüne "Hayvanların tutumu" ve "İmza hamleleri ve sürü taktiği" eklendi; Kayalık Dağ canlı tablosu ve Reis tablosu güncellendi.

---

## Versiyon 4.18 · 13 Kasım 2026

### Görsel
- **58 eşyanın yeni resmi var:** PixelLab'da 32×32 çizilmiş yeni ikonlar. Envanterde ve kitapta tam boyda, elde ve yerde küçük görünürler.
  - Bütün baltalar (Taş'tan Obsidyen'e 13 balta).
  - Taş, Bakır, Demir, Çelik, Mor kristal ve Obsidyen kazma.
  - Bakır, Demir, Çelik, Kara çelik ve Mor kristal kılıç, Ejder kılıcı, Demir savaş çekici, Basit yay.
  - Odun, Taş, Çakmaktaşı, Bakır ve Demir cevheri, Taş kömürü, Kuvars, Ametist, Obsidyen, Kızıl ejder pulu.
  - Bakır, Tunç, Demir, Gümüş, Kara çelik ve Altın külçesi.
  - Lif, Halat, Deri parçası, Timsah derisi, Kemik, Keklik tüyü, Kurt dişi, Deri çanta.
  - Ateş, Mana ve Kök özü iksiri, Ekmek, Pişmiş keklik eti, Kızılcık, Meşale.

### Tasarım belgesi
- Eşyalar bölümüne yeni resimli eşyaların listesi eklendi.
- Godot'ya geçiş planına görseller yazıldı: sıra (oyun biter → Godot denemesi yeni görsellerle → taşıma ve görseller birlikte), araç (Retro Diffusion ya da PixelLab; ilk PixelLab sayfası tarz örneği), tahmini maliyet (~205 $, yalnız ACT 1 ~100 $).

---

## Versiyon 4.17 · 12 Kasım 2026

### Oynanış
- **Malzemeler biyomdan biyoma değerleniyor:** bir biyomun eti, derisi, tüyü, yumurtası, dişi, balığı, meyvesi ya da otu artık önceki biyomun sıradan malzemesinden en az %20 daha değerli. Örnekler: Sincap derisi 2 → 6, Dağ keçisi derisi 7 → 36, Kurbağa 2 → 9, Söğüt dalı 1 → 10. Hiçbir malzeme ucuzlamadı.
- **Yaptığın eşyaların fiyatı yine malzemelerinden hesaplanıyor.** 4.16'daki sabit fiyat eğrisi kalktı.
- **Fazla malzeme isteyen tarifler azaldı:** fiyat sırasını bunlar bozuyordu.
  - Tunç külçesi 1 Bakır külçesi ve 1 Kalay külçesi ister (3 Bakır külçesi yerine).
  - Çelik külçesi 1 Demir külçesi ister (2 yerine), Kara çelik külçesi 1 Çelik külçesi ister (2 yerine). Kara çelik külçesi 2.122 → 899.
  - Demir külçesi Taş yerine Odun kömürüyle, Altın külçesi 4 Altın cevheriyle eritiliyor.
  - Çakmaktaşı ve Obsidyen ok ucu 2 pul, Kuvars ok ucu 3 pul ister (8, 11 ve 10 yerine).
  - Bazı kolye ve yüzükler daha az ya da daha çok taş istiyor.
- **Sonuç:** her biyomda karşına çıkan miğfer, zırh, eldiven, çizme, kılıç, savaş çekici, topuz, mızrak, yay, balta, kazma, kolye ve yüzük bir öncekinden pahalı. Aynı biyomda usta parçası metal parçasından pahalı, başlangıç parçaları Bakırdan ucuz.
  - Kılıç: Bakır 346 · Tunç 787 · Demir 1.655 · Çelik 2.583 · Kara çelik 4.949 · Mor kristal 8.242.
  - Oklar tane fiyatıyla: Basit 2, Kara çelik 165, Mor kristal 196.
- Hasar, savunma, bileme ücretleri ve dükkân fiyatları değişmedi.

### Tasarım belgesi
- Aletler'deki "Fiyat basamağı" bölümünün yerine "Fiyat düzeni" geldi; madenler tablosundaki külçe tarifleri ve bütün fiyatlar güncellendi.

---

## Versiyon 4.16 · 12 Kasım 2026

### Oynanış
- **Fiyatlar biyom sırasına oturdu:** her biyomda karşına çıkan eşya bir öncekinden daha değerli.
  - 13 türün her biri set sırasıyla tek bir düzgün fiyat eğrisine oturdu: miğfer, gövde zırhı, eldiven, çizme, kılıç, savaş çekici, topuz, mızrak, yay, balta, kazma, kolye, yüzük.
  - Sonraki biyomun parçası, öncekinin her parçasından pahalı.
  - Aynı biyomda usta parçası, metal parçasından pahalı.
- **Örnekler:**
  - Kara çelik kılıç 11.371 → 5.120, Mor kristal kılıç 8.242 → 9.450, Ametist kılıcı 7.986 → 12.850.
  - Kara çelik savaş çekici 13.965 → 5.900.
  - Kamış çizme 145 → 915.
  - Gölge dişi kolyesi 551 → 280, Ametist yüzük 433 → 1.030.
- **Oklar tane fiyatıyla:** eskiden bir Kara çelik oku 1.823 Vio'ya satılabiliyordu. Artık Basit 2, Bakır 4, Tunç 7, Demir 13, Çelik 25, Kara çelik 48, Mor kristal 90.
- **Külçeler biyom sırasıyla:** Bakır 38 → Altın 1.180.
- **Kısa yaylar** aynı biyomun uzun yayının %60'ı.
- Hasar, savunma, bileme ücretleri ve dükkân fiyatları değişmedi.

### Tasarım belgesi
- Aletler'e "Fiyat basamağı" bölümü; bütün tablolardaki fiyatlar güncellendi.

---

## Versiyon 4.15 · 12 Kasım 2026

### Oynanış
- **Karışık tarifler sadeleşti:**
  - **Taş uçlu balta, kazma ve mızraklar** (Çakmaktaşı, Kuvars, Obsidyen) artık yalnız uç, sap, İp ve en çok bir ek malzeme istiyor; Dal ve Taş istemiyor. Mızraklar etkilerini veren yağı (Bileme macunu, Zehir yağı), Obsidyen balta ve kazma bir Ametist istiyor.
  - **Bütün gövde zırhları** yarı malzemeyle yapılıyor. Örneğin Kara çelik zırh 29 yerine 15 malzeme, Çelik zırh 24 yerine 13 malzeme istiyor.
  - **Ametist kılıcı** 6 yerine 4 malzeme istiyor: Ametist, Kadim odun sapı, Gölge dişi, Mor zehir.
- Fiyatlar ve özellikler değişmedi.

### Arayüz
- **El yapımı listesinin başlıkları eşyanın ne işe yaradığına göre:** "Zanaat" başlığı kalktı.
  - Oklar "Silahlar"da.
  - Çanta, torba, ok kılıfı, bıçaklar, olta yemleri, Gübre, Kaya patlatıcı ve tariflerde alet olarak kullanılanlar (iğne, bileği taşı, havan…) "Aletler"de.
  - Hasırotu yatak "Yapılar ve ev eşyası"nda.
  - İp, hasır, kumaş ve yağ gibi ara parçalar "Malzemeler"de.
  - Kitap'taki Keşif defteri ve ödülleri aynı.

### Tasarım belgesi
- Tarifler'e "Törpüleme" bölümü; değişen tarifler ve malzemelerin kullanıldığı yerler güncellendi. Sistemler › El yapımı kategorili: yeni başlıklar.

---

## Versiyon 4.14 · 12 Kasım 2026

### Oynanış
- **İşe yaramayan 44 eşya oyundan kalktı** (listesi konuşuldu):
  - Süs: boncuklar, taçlar, yelpazeler, muskalar.
  - Aletler: kazıyıcılar, çakmaklar, odun kaşıkları.
  - Ateş: Don yağı mumu, Hasırotu meşalesi, Kozalak ateşi.
  - Taşıtlar: Kızak, Kütük salı, Oyma kano.
  - Kap ve eşyalar: sepetler, kaseler, Kum torbası, Eğrelti yatağı, Yosun yastık, Akrep kabuğu kalkanı ve diğerleri.
  - Yalnız bunlar için yapılan Kristal parçası, Saz örgüsü ve Isırgan lifi de kalktı.
- **Topladığın her malzeme işe yarıyor:** yalnız bu eşyalarda kullanılan 13 malzeme, kendi biyomlarında işe yarayan bir tarife girdi:
  - Akrep kabuğu Kara çelik eldivende, Lav yılanı pulu Kara çelik çizmede, Yarasa kanadı Ejder miğferinde.
  - Gölge pulu Mor kristal çizmede, Ayna ipeği Kristal ipek çizmede, Kristal boynuz Ametist miğferde.
  - Kaya yarasası kanadı Gümüş eldivende, Pirit Pençe kolyede.
  - Kristal çiçeği Ay otu iksirinde, Yıldız çiçeği Gölge iksirinde.
  - Sarkıt Taş kasede, Çam kozalağı Meşalede, Eğrelti Meşe kabuk çizmede.
- Pençe kolyenin fiyatı 57'den 91'e çıktı (Pirit girdi).

### Kayıtlar
- Eski kayıtlarda kalkan eşyalar çantadan, sandıktan, kemerden ve yerden kalkar; elindekiler son fiyatlarıyla Vio olarak ödenir.

### Tasarım belgesi
- Tarifler'e "Ayıklama" bölümü; tarif ve eşya tabloları, sayılar (1.239 eşya, 768 tarif) güncellendi.

---

## Versiyon 4.13 · 12 Kasım 2026

### Oynanış
- **Kaldırılan 47 eşya geri geldi:** 4.12'de kaldırılan boncuklar, taçlar, yelpazeler, kazıyıcılar, çakmaklar, kaşıklar, taşıtlar, sepetler, kaseler ve diğerleri eski tarifleriyle yerinde. Hangilerinin kalkacağına birlikte karar verilecek. (4.12'de bunlar için ödenen Vio sende kalır.)
- **İşe yaramayan eşyalara iş:**
  - **Mağara boss tılsımları Kupa panosuna asılıyor:** Kupa panosu olan bir eve girince çantandaki tılsımlar panoya asılır ve kalıcı etki verir:
    - Kraliçe: +%4 hasar.
    - Çamur Ana: +%25 can yenilenmesi.
    - Dev yüreği: +80 can.
    - Kor tacı: +%6 hasar ve +4 zırh.
    - Işık Yutan kalbi: +40 mana ve +%3 şans.
  - **Olta yemleri:** çantada Sülük yemi ya da Yıldız tozu yemi varken nadir balık gelme şansı artar; her atışta bir yem gider.
  - **Duman fişeği:** elde vur tuşuyla atılır; yakındaki canavarlar 3,5 saniye sersemler.
  - **Duman tütsüsü:** elde vur tuşuyla yakılır; saldırgan canavarlar 2 dakika yaklaşamaz.
  - **Kök özü iksiri:** içilir; +60 can, 10 dakika Şifa ve Canlılık.
  - **Bıçaklar:** çantadaki en iyi bıçak avdan düşen deri, post ve etin bir fazla gelme şansını artırır (%15–35).
  - **Golem feneri:** meşale yuvasına giren, hiç sönmeyen ve tutuşturmayan fener.
  - **Işık fitili:** meşaleyi reçine gibi tazeler.
  - **Ok kılıfı:** çantadayken yay %15 hızlı çekilir.
  - **Deri çanta ve Kenevir torba:** bayılınca kaybedilen pay %20 yerine %10 ya da %15 olur.
  - **Gübre:** ekili tarlayı sularken bir tane gider; o ürün %50 hızlı büyür.
- **Tavşan derisi Kürk eldivende** (5 Tavşan derisi) ve **Közlenmiş kerevit** (+16 tokluk, 2 dakika Çeviklik) 4.12'deki gibi kalıyor.

### Tasarım belgesi
- Tarifler'e "İşe yarayan eşyalar" bölümü; Işık kaynakları tablosuna Golem feneri; Kupa panosuna tılsımlar; eşya dizininde bu eşyaların ne işe yaradığı; tarif ve eşya sayıları (815 tarif, 1.286 eşya) düzeltildi. 4.12'nin "Ayıklama" bölümü kalktı.

---

## Versiyon 4.12 · 12 Kasım 2026

### Oynanış
- **İşe yaramayan 47 eşya oyundan kalktı:** yapılabilen ama hiçbir işe yaramayan eşyalar (takılmayan, kullanılmayan, yenmeyen, kurulmayan) gitti:
  - Süsler: boncuklar, taçlar, yelpazeler, üç muska/tılsım, Boynuz tarak, Tatlısu incisi, Cilalı kristal, Sarkıt parçası, Balık pulu.
  - Dört kazıyıcı, iki çakmak.
  - Don yağı mumu, Hasırotu meşalesi, Kozalak ateşi.
  - Kızak, Kütük salı, Oyma kano.
  - Dört odun kaşığı, Midye kabuğu kaşık, Boynuz kupa, sepetler, Kum torbası, Sünger taşı bileği, Eğrelti yatağı, Yosun yastık, Akrep kabuğu kalkanı, iki kase.
  - Onlar için yapılan Kristal parçası, Saz örgüsü ve Isırgan lifi.
- **Boşta kalan malzemeler işe yarıyor:** yalnız bu eşyalarda kullanılan malzemeler kendi biyomlarındaki zırh, iksir ve aletlerin tarifine girdi:
  - Kürk eldiven artık 5 Tavşan derisiyle yapılıyor.
  - Akrep kabuğu Kara çelik eldivende, Lav yılanı pulu Kara çelik çizmede, Yarasa kanadı Ejder miğferinde.
  - Gölge pulu Mor kristal çizmede, Ayna ipeği Kristal ipek çizmede, Kristal boynuz Ametist miğferde.
  - Kaya yarasası kanadı Gümüş eldivende, Pirit Gümüş çizmede.
  - Kristal çiçeği Ay otu iksirinde, Yıldız çiçeği Gölge iksirinde.
  - Sarkıt Taş kasede, Çam kozalağı Meşalede, Eğrelti Meşe kabuk çizmede.
- **Közlenmiş kerevit:** kerevit eti artık kamp ateşinde közlenebiliyor; yiyince +16 tokluk ve 2 dakika Çeviklik (hareket +%12) veriyor.

### Kayıtlar
- Eski kayıtlarda kalkan eşyalar çantadan, sandıktan, kemerden ve yerden kalkar; elinde olanlar son fiyatlarıyla Vio olarak ödenir.

### Tasarım belgesi
- Tarifler'e "Ayıklama" bölümü; tarif ve eşya tabloları, sayılar (1.239 eşya, 768 tarif) güncellendi.

---

## Versiyon 4.11 · 12 Kasım 2026

### Oynanış
- **Müzik aletleri çalınıyor:** 12 müzik aletinin hepsi eline alınabiliyor (kemere tak, kemerden seç). Eldeyken vuruş tuşu (tık, Vur, Boşluk) aletin sıradaki notasını çalıyor, başının üstünde bir ♪ çıkıyor; art arda basınca aletin kendi ezgisi çalınıyor.

### Ses
- Her aletin kendi sesi var: Kemik flüt tiz bir flüt, Kamış flüt nefesli bir kamış, Kök flütü pes ve tahtamsı, Pişmiş kil düdük okarina gibi, Boynuz borazan pes bir boru, Kor zurnası genizden ve titrek bir zurna, Deri davul tok bir "düm-tek", Yarasa zarı davul daha kuru, Semender derisi tef zilli, Yankı çanı yankılanan, Gümüş çan berrak bir çan, Kristal zil cam gibi parlıyor.

### Tasarım belgesi
- Sistemler'e "Müzik aletleri" bölümü; Eşya dizininde aletlerin türü "çalınır".

---

## Versiyon 4.10 · 12 Kasım 2026

### Oynanış
- **Kolye ve yüzük takılıyor:** giyilecek yuva sayısı 5'ten 7'ye çıktı; Özellikler penceresindeki ve envanterdeki figürde yeni **Boyun** ve **Yüzük** yuvaları var. Arenada da seçilebiliyorlar.
- **Her setin bir kolyesi ve bir yüzüğü var:** 13 setin her birinde bir kolye ve bir yüzük, her birinin kendi etkisi var (can, enerji, mana, zırh, savunma, hasar, hız, toplama hızı, satış fiyatı, şans, can ve enerji yenilenmesi, kanama/yanık/zehir direnci, çamurda yavaşlamamak). Etkiler biyomdan biyoma büyüyor: örneğin Diş kolye +20 can, Ay taşı kolyesi +120 can ve +50 mana; Bakır yüzük satışa +%4, Altın yüzük +%12 satış ve +%4 şans; Ametist yüzük +%10 hasar ve +%4 hız. Hangi parçanın hangi sete ait olduğu ve etkileri tasarım belgesinde (Aletler › Kolye ve yüzükler).
- **Yeni takılar (elle yapılır, kazanda öğrenilir):** Palamut kolyesi, Taş yüzük, Bakır yüzük, Kemik yüzük, Tunç yüzük, Granit yüzük, Demir yüzük, Timsah yüzüğü, Kehribar yüzük, Ejder yüzüğü.
- **Değişen takılar:** Altın kolye artık **Altın yüzük** (2 Altın külçesi, 1 Kehribar), Kristal kolye artık **Kristal yüzük**; Gümüş yüzük Kehribar yerine Yontulmuş kuvars istiyor. Domuz dişi muska ve Kül dişi muska boyna takılıyor.

### Görsel
- Bütün kolye ve yüzüklerin resimleri yeniden çizildi: her kolyenin kendi sarkacı (diş, pençe, inci, kehribar, ay taşı…), her yüzüğün kendi metali ve taşı var.

### Kayıtlar
- Eski kayıttaki Altın kolye ve Kristal kolye kendiliğinden Altın yüzük ve Kristal yüzük oluyor.

### Tasarım belgesi
- Aletler'e "Kolye ve yüzükler" bölümü (yuvalar, etkiler, 13 setin kolye ve yüzüğü, tarifleri, fiyatları); Zırhlar ve Sistemler'de yedi yuva; set 13 parça; Tarifler ve Eşya dizininde yeni ve değişen takılar.

---

## Versiyon 4.09 · 11 Kasım 2026

### Oynanış
- **Her eşyanın tek tarifi var:** aynı eşyayı başka malzemeyle veren 130 ikinci tarif ("Kürk yelek (Sincap derisi ile)" gibi) kalktı. Tarif kitabında, kazanda ve El yapımı listesinde her eşya artık bir kez görünür. Toplam 805 tarif.
- **Kullanılmayan kalan malzemeler kendi biyomlarındaki tariflere girdi:** hayvan derileri kendi biyomunun setinde Deri parçasının yerine geçiyor (örneğin Bakır miğfer Kurt derisiyle, Tunç çizme Yaban domuzu derisiyle, Çelik zırh Yaban öküzü derisiyle, Mor kristal miğfer Gölge postuyla yapılıyor). Tüyler oklara girdi (Tunç okta Bıldırcın, Çelik okta Turna kuşu, Kara çelik okta Yaban kazı tüyü). Merhemler ve boyalar kendi yağlarını istiyor (Kor merhemi Tohum yağı, Mürver boyası Balık yağı). ACT 2'nin malzemeleri de kendi biyomlarının tariflerinde (Barut Kükürt tozuyla, Tabanca Lens ve Yağ birikintisiyle, Meka zırh Mor çekirdek ve Buz kürküyle gibi). Değişen tariflerin hepsi tasarım belgesinin Tarifler bölümündeki "Tek tarif" tablosunda.
- **İki yeni Maden tarifi:** 2 Gök camı parçasından Gök camı, 1 Meteor parçasından Meteor demiri yapılıyor.
- **Bazı eşyalar oyundan kalktı:** hiçbir tarifte yeri olmayan Kavak, Kayın, Ihlamur, Dişbudak, Kızılağaç, Porsuk, Akçaağaç, Kestane ve Ardıç kabuğu (bu ağaçlar artık kabuk düşürmüyor; kabuk yalnız Meşe, Ceviz, Söğüt ve Huş'tan düşüyor), Bazalt ok ucu, Meyve fidanı, Ağ kapanı, Cüruf tuğlası ve Goblin oku (goblin okçusu artık yalnız Goblin kulağı düşürüyor).
- **Durdu'nun "Bileğinin taşı" görevi** Kayın kabuğu yerine 5 Meşe kabuğu istiyor.
- **Fiyatlar:** girdisi pahalılaşan eşyalar biraz pahalandı (örneğin Ateş çiçeği merhemi 398 → 898, Deri tulum 338 → 370, Demir mızrak 771 → 995).

### Kayıtlar
- Eski kayıtta bildiğin ikinci tarifler eşyanın tek tarifine dönüyor; çantandaki, sandığındaki ya da yerdeki kalkan eşyalar son fiyatlarıyla Vio olarak ödeniyor. Bir kez bildirim çıkıyor.

### Tasarım belgesi
- Tarifler'de "Varyant tarifler" bölümünün yerine "Tek tarif" bölümü (kural, hangi malzeme nereye girdi, kalkanlar, fiyatlar); tarif tabloları, Eşya dizini, Aletler (set tarifleri), ACT 1 (ağaç kabukları, Durdu'nun görevleri), ACT 2 biyomları, Mağaralar ve Canavarlar buna göre güncellendi.

---
