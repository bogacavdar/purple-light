# Purple Light · Giriş ve kurallar

Sürüm: **Versiyon 3.95** ile birebir (9 Kasım 2026). Bu sürümün ve önceki sürümlerin değişiklikleri: [Güncelleme notları](https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html).

> **KURAL: OYUNCUYA İŞ YAPTIRILMAZ (Boğaç, 5 Kasım 2026):** oyun oyuncuya asla "şuna bas, şunu güncelle, şu klasörü bul, kısayol oluştur, başka tarayıcıda aç, kabloyla bağla" gibi adım adım iş tarif etmez (pencere, bildirim, yardım metni, güncelleme notu dahil). Bir şeyi oyun **otomatik** yapabiliyorsa yapar (tek tıkla yükleme gibi); yapamıyorsa o özellik o cihazda **hiç gösterilmez**. Oyunun kendi kontrolleri (hangi tuş ne yapar) bu kuralın dışındadır.

> **KURAL: HER EŞYANIN KENDİ RESMİ OLUR (Boğaç, 6 Kasım 2026):** oyundaki her eşyanın (malzeme, yemek, alet, yapı, ACT 2 eşyaları dahil) **adına ve gerçeğine uygun** bir resmi vardır; bu resim envanterde, tarif kitabında, elde, **yere düştüğünde** ve **kurulduğunda** (yapılarda) kullanılır. Adıyla ilgisi olmayan, adından renk alan "hediye paketi" kutusu **hiçbir eşyada görünmez**. Yeni bir eşya eklenirken resmi de aynı sürümde, ne olduğuna göre (yemek tabakta ya da tavada, iksir şişede, merhem kapta, taş taş gibi…) çizilir. Resmi olmayan bir eşya bulunursa bu bir hatadır. v3.37'de 194 eşyanın hediye paketi yerine gerçek resmi çizildi (Eşyalar › Eşya resimleri). Resmi unutulmuş bir eşya oyunda sade, nötr bir bez torba olarak görünür (renkli kutu değil) ve geliştirici araçları açıkken (`?debug`) konsola yazılır (kontrol önbelleği silmez, yalnızca karşılaştırır).

> **KURAL: CANLI KENDİ ADINDA EŞYA DÜŞÜRMEZ (Boğaç, 9 Kasım 2026: "kerevitten kerevit düşmesi gibi durumlar olmamalı, kerevit eti düşüyor olmalı"):** bir canlı avlanınca kendi adını taşıyan bir eşya düşürmez; ondan çıkan eşya ne olduğunu söyler (ör. Kerevit → **Kerevit eti**). Yeni canlı ya da düşme eklenince, her pakette eşya denetiminde bakılır: hiçbir canlının düşürdüğü eşyanın adı bir canlının adıyla aynı olamaz.

> **PARA BİRİMİ: VİO (Boğaç, 9 Kasım 2026: "Vio yap gitsin, morun bir tonundan esinlendik"):** oyunun parası **Vio**’dur (violet, menekşe moru). Küçük resmi mor bir paradır (açık mor parıltılı, koyu mor kenarlı). Belgede ve oyunda her yerde büyük harfle **"Vio"** yazılır (9 Kasım 2026, Boğaç), ekler kesme işaretiyle ayrılır; çekimleri: Vio’yu, Vio’ya, Vio’nun, Vio’da, Vio’lar, Vio’luk ("50 Vio’luk"), Vio’n ("Vio’nu say").

> **KURAL: BÜYÜKLÜK YÜZDESİ ALAN İÇİNDİR (Boğaç, 6 Kasım 2026):** bir harita, biyom ya da bölge için "%X büyüt/küçült" denince **alanı** %X değişir; kenar katsayısı √(1+X) olur (ör. %50 büyütmek: kenar ×√1,5 ≈ ×1,2247). Şüphe varsa belgeye yazmadan önce Boğaç'a sorulur.

> **KURAL: TÜREYEN SAYILAR BİRLİKTE DEĞİŞİR (Boğaç, 6 Kasım 2026):** belgede bir sayı değişince ondan hesaplanan bütün sayılar (biyom başına alan, adet, oran) aynı commit'te güncellenir.

> **KURAL: BELGE YALNIZCA BUGÜNÜ ANLATIR (6 Kasım 2026, Boğaç):** son 20 sürümün değişiklikleri geri alınabilir (her sürüm `main`'de `vX.YZ:` ile başlayan ayrı bir commit; ayrıntılar DEVAM_NOTU'nda); daha eski sürümlerin geçmişi belgede, notlarda tutulmaz.

> **KURAL: BOĞAÇ'IN KARARI YALNIZCA BOĞAÇ'A SORULARAK DEĞİŞİR (7 Kasım 2026, Boğaç: "bu kararı ben vermiştim"):** belgede ya da CLAUDE.md'de Boğaç'a ait bir kararı (Boğaç adıyla ya da tarihiyle yazılmış kural) değiştiren ya da daraltan her öneri **önce Boğaç'a sorulur**; Yönetici onaylayamaz. Analist her belge değişikliğinden önce belgede (ve sürüm etiketleri temizlenmiş eski kurallar için depo geçmişinde) ilgili Boğaç kararını arar.

> **KURAL: HER EŞYANIN FİYATI, HER MALZEMENİN TARİFİ OLUR (8 Kasım 2026, Boğaç):** (1) oyundaki her eşyanın bir fiyatı olur; fiyatı 0 ya da tanımsız (`DB.p`/`PRICE_`, `priceOf` boş) eşya **kritik hatadır**. (2) Bir malzeme (ham madde ya da ara ürün; yenen, giyilen, kullanılan son ürün değil) hiçbir tarifin girdisinde yoksa **kritik hatadır**. (3) Bir tarif elde edilemeyen bir girdi istiyorsa (ne tarifi ne toplama/av/düşme/satıcı/görev kaynağı varsa) **büyük hatadır**. Yeni eşya, malzeme ya da tarif eklenince ve her pakette Analist bu üç denetimi oyunun çalışan verisinden yapar (`DB`, `PRICE_`, `addRec`, düşme ve satıcı tabloları); fiyat biyom eğrisine uygun verilir (keskin sıçrama yok). Belgedeki fiyat tablolarında da boş fiyat hücresi kalmaz.

> **Kural (Boğaç, 28 Ekim 2026):** Bu belge oyunun doğru kabul edilen tanımıdır. Geliştirme önce burada yazılır, sonra koda geçer; belge ile kod çelişirse belge doğrudur ve kod belgeye uydurulur.

## Belge haritası

- **Giriş ve kurallar:** sürüm, belgenin temel kuralları, belgeyi okuma rehberi, oyunun özeti, adalar ve dünya ölçüsü.
- **Teknoloji:** kullanılan diller ve araçlar, performans kuralları, dosya düzeni, hedef ortamlar.
- **Oyun akışı:** açılış, öğretici, ACT 1 ve ACT 2 yol haritaları, gezginler ve takvim.
- **Sistemler:** kontroller, arayüz, hayatta kalma, gelişim, üretim ve ekonomi, toplama ve tarım, ev ve kayıt defterleri, dövüş, arena/hileler/kayıt.
- **ACT 1 · Yıldızsız Ada:** adanın yerleşimi, 6 biyom, ana görevler, yan görevler, mağaralar, deniz, kişilerin tanıtımları ve hikâyeleri.
- **ACT 2 · İkinci ada:** geçiş, mana ve ateşli silahlar, 6 biyom, kişiler ve görevler.
- **ACT 3 ve sonrası:** henüz oyunda olmayan fikir notları.
- **Canavarlar:** Reisler (boss'lar) ve canlıların genel kuralları.
- **Tarifler:** tarif ansiklopedisi, kategori kategori.
- **Aletler:** alet, silah, zırh, madenler ve ekipman merdiveni, evler.
- **Eşyalar:** eşya dizini (nereden gelir, nerede kullanılır).
- **Yetenekler:** yetenek ağacı.
- **Başarımlar.**
- **Bilinen açıklar ve tutarsızlıklar.**
- **Platformlar (Godot · PS5):** gelecekteki motor geçişi ve PS5 sürümü planları.

## Bu belge nasıl okunur

- **Bütün belgede ara:** sayfanın en üstündeki **arama çubuğu** belgenin tamamını tarar: başlıklar, metinler, listeler ve **tablo satırları** (tarifler, eşyalar, canlılar, görevler). Birden çok sözcük yazarsan hepsini içeren yerler çıkar; Türkçe harfler önemsizdir ("kerevit" ile "Kerevit", "cadi" ile "Cadı" aynı). Sonuca tıklayınca belge o yere kayar ve sözcükler işaretlenir. **/** ya da **Ctrl+K** aramaya geçer, **↑ ↓** sonuçlar arasında gezer, **Enter** gider, **Esc** kapatır. Bir tablonun kendi süzgeci ("Bu tabloda ara") yalnızca o tabloyu süzer; genel arama hepsini kapsar.

- **Bir şeyin nasıl yapıldığını mı arıyorsun?** En alttaki **Eşya dizini**ne git, adını ara. Her eşyanın yanında nereden geldiği (hangi biyomda toplandığı, hangi canlıdan düştüğü, hangi tarifle yapıldığı) ve hangi tariflerde kullanıldığı yazar.
- **Bir tarifin içeriği:** **Tarif ansiklopedisi**, kategori kategori. Her satırda malzemeler, gereken alet, *nerede yapıldığı* (el yapımı, örs, usta) ve fiyatı var.
- **Bir bölgede ne var:** **ACT 1** ve **ACT 2** bölümlerinde her biyom ayrı başlık: ağaçlar, toplanabilirler, madenler, canlılar.
- **Bir NPC ne istiyor:** **ACT 1 › Ana görevler**, **ACT 1 › Yan görevler** ve **ACT 2 › Kişiler ve görevler** bölümleri. Her görevin istediği, açılma şartı ve ödülü tablo halinde.
- **²** işareti: o eşya ya da tarif ACT 2 adasına ait (malzemesi yalnızca ikinci adada çıkar).
- **Fiyat** her yerde *temel satış fiyatıdır*; oyunda seviye ve Ekonomi ağacının yetenekleri bunu artırır.

## Oyun bir bakışta

**Purple Light (Mor Işık)** tek oyunculu, piksel sanatlı bir keşif ve hayatta kalma oyunu. Gemin batmış, eşini mor bir ışık götürmüş; **Yıldızsız Ada**'nın kumsalında hafızasız uyanıyorsun. Bir taştan başlayıp toplayarak, kazanda tarif keşfederek, ustalara alet ve zırh yaptırarak, avlanarak ve adanın insanlarına yardım ederek güçlenirsin. Amaç eşini bulmak.

- **Temel döngü:** topla → kazanda tarifi öğren → elle ya da ustaya yap → sat ya da kullan → güçlen → daha tehlikeli bölgeye geç.
- **ACT 1 · Yıldızsız Ada:** 6 biyom (Çayır → Orman → Bataklık → Kayalık Dağ → Kül Diyarı → Mor Kristal Vadisi), 26 kişi (11 kişi ve Çayır dışındaki her biyomda Zümrüt, Dursun ve Durmuş'un birer cadı, silahçı ve zırhçı kuzeni), Yaşlı Kemal'in ana görev zinciri. Sonunda Denizci Barbaros ile yeni bir gemi yapıp ikinci adaya geçersin.
- **ACT 2 · İkinci ada:** aynı boyutta, fantastik bir ada: Yüzen Kayalar → Dev Mantar Ormanı → Hurda Çölü → Kristal Golem Ocağı → Ejder Volkanı → Gök Rıhtımı. Büyü (mor mana ve asalar), ateşli silahlar, meka zırh. Sonunda Astronot Gökay ile roket yapılır ve mor ışıklı gemiye fırlatılır.
- **Son:** roket gemiye ulaşır; geminin içinde eşinle kavuşursun ("Yeniden birlikte"). Hikâye ACT 3 ile sürecek (henüz oyunda değil).
- **Gerçek:** eşini kaçıranlar adalarda köpek ve fener satan **yıldızsız yolcular**; mor ışık onların gemisi. Robot köpekler ve şapka seni izlemek ve anılarını okumak için verilmiş (ACT 3'te açılacak).

## Adalar ve dünya ölçüsü

- İki ada da **790 × 568 karo** ızgaradadır (v3.40, Boğaç: "her bir biyomu %50 büyüt, haritanın genel şeklini bozmadan"; v3.39'a kadar 645 × 464). **Kararın açıklaması (v3.44, 6 Kasım 2026, Boğaç):** "%50 büyüt" **alanın** %50 artması demektir; kenar başına katsayı √1,5 ≈ 1,2247'dir (645 × 464 → 790 × 568). v3.40–3.43'te yanlışlıkla kenar ×1,5 yapılmıştı (968 × 696, alan ×2,25); bu bir hataydı ve v3.44'te düzeltildi. Yıldızsız Ada hilal (kara ~208.000 karo), ikinci ada yonca (kara ~268.000 karo); bir karo 16 piksel. Şekil aynı, alan v3.39'a göre 1,5 kat; haritaya serpilen şeyler (dal, taş, bitki, maden, ağaç) aynı sıklıkta kalsın diye sayıları da 1,5 katına çıkar (v3.39'a göre). Göl yarıçapları ve deniz payı kenar katsayısıyla (×1,2247) büyür (deniz payı 10 → 12 karo); Bataklık gölcükleri sayı olarak 20 → 30 olur. Eski kayıtlar bu sürümde (v3.44) silinir (Boğaç'ın kararı). Bir anda yalnızca bir ada bellekte durur; adalar arası geçiş bir yükleme ekranıyla yapılır.
- Envanter, Vio, seviye, gün ve saat iki adada ortaktır.
- Her adada 6 biyom vardır (**eşit büyüklükte**: Yıldızsız Ada'da her biri ~34.700, ikinci adada ~44.700 karo (v3.44); adanın şekli boyunca **zincir halinde** sıralanır, her biyom yalnızca öncekine ve sonrakine değer; 1-2, 3-4, 5-6 ortak bölgedir, 2→3 ve 4→5 arasında keskin bir sınır vardır); biyomun tehlike seviyesi canavarların gücünü belirler: **Güvenli** (ilk iki biyom), **Tehlikeli** (3. ve 4.), **Ölümcül** (5.), **Çok ölümcül** (6.).
- Oyun içinde biyomlar 3 tehlike kuşağına ayrılır ve balık tabloları, tuzak ganimetleri bu kuşağa göre değişir: **Kuşak 0** = Çayır + Orman, **Kuşak 1** = Bataklık + Kayalık Dağ, **Kuşak 2** = Kül Diyarı + Mor Kristal Vadisi (ACT 2'de aynı sırayla).
