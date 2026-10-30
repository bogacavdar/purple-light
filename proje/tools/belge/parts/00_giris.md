# Purple Light · Tasarım Belgesi

Sürüm: **Versiyon 2.37** ile birebir (30 Ekim 2026). Bu sürümde: her açılışta ve yeni oyunda yükleme ekranı (menü donmaz), başlangıç bölgesi yükleme sırasında önceden çizilir, mavi öğretici parlamaları telefonda hafif; öğretici yeni haritada baştan sona denendi. Bütün sürümlerin değişiklikleri: [Güncelleme notları](https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html).

> **Kural (Boğaç, 28 Ekim 2026):** Bu belge oyunun doğru kabul edilen tanımıdır. Geliştirme önce burada yazılır, sonra koda geçer; belge ile kod çelişirse belge doğrudur ve kod belgeye uydurulur.

## Bu belge nasıl okunur

- **Bir şeyin nasıl yapıldığını mı arıyorsun?** En alttaki **Eşya dizini**ne git, adını ara. Her eşyanın yanında nereden geldiği (hangi biyomda toplandığı, hangi canlıdan düştüğü, hangi tarifle yapıldığı) ve hangi tariflerde kullanıldığı yazar.
- **Bir tarifin içeriği:** **Tarif ansiklopedisi**, kategori kategori. Her satırda malzemeler, gereken alet, *nerede yapıldığı* (el yapımı, örs, usta) ve fiyatı var.
- **Bir bölgede ne var:** **ACT 1** ve **ACT 2** bölümlerinde her biyom ayrı başlık: ağaçlar, toplanabilirler, madenler, canlılar.
- **Bir NPC ne istiyor:** **Kişiler ve görevler** bölümü. Her görevin istediği, açılma şartı ve ödülü tablo halinde.
- **²** işareti: o eşya ya da tarif ACT 2 adasına ait (malzemesi yalnızca ikinci adada çıkar).
- **Fiyat** her yerde *temel satış fiyatıdır*; oyunda seviye ve Ekonomi ağacının yetenekleri bunu artırır.

## Oyun bir bakışta

**Purple Light (Mor Işık)** tek oyunculu, piksel sanatlı bir keşif ve hayatta kalma oyunu. Gemin batmış, eşini mor bir ışık götürmüş; **Yıldızsız Ada**'nın kumsalında hafızasız uyanıyorsun. Bir taştan başlayıp toplayarak, kazanda tarif keşfederek, ustalara alet ve zırh yaptırarak, avlanarak ve adanın insanlarına yardım ederek güçlenirsin. Amaç eşini bulmak.

- **Temel döngü:** topla → kazanda tarifi öğren → elle ya da ustaya yap → sat ya da kullan → güçlen → daha tehlikeli bölgeye geç.
- **ACT 1 · Yıldızsız Ada:** 6 biyom (Çayır → Orman → Bataklık → Kayalık Dağ → Kül Diyarı → Mor Kristal Vadisi), 26 kişi (11 kişi ve Çayır dışındaki her biyomda Zümrüt, Dursun ve Durmuş'un birer cadı, silahçı ve zırhçı kuzeni), Yaşlı Ekin'in ana görev zinciri. Sonunda Denizci Levent ile yeni bir gemi yapıp ikinci adaya geçersin.
- **ACT 2 · İkinci ada:** aynı boyutta, fantastik bir ada: Yüzen Kayalar → Dev Mantar Ormanı → Hurda Çölü → Kristal Golem Ocağı → Ejder Volkanı → Gök Rıhtımı. Büyü (mor mana ve asalar), ateşli silahlar, meka zırh. Sonunda Astronot Tuna ile roket yapılır ve mor ışıklı gemiye fırlatılır.
- **Son:** roket gemiye ulaşır; geminin içinde eşinle kavuşursun ("Yeniden birlikte"). Hikâye ACT 3 ile sürecek (henüz oyunda değil).
- **Gerçek:** eşini kaçıranlar adalarda köpek ve fener satan **yıldızsız yolcular**; mor ışık onların gemisi. Robot köpekler ve şapka seni izlemek ve anılarını okumak için verilmiş (ACT 3'te açılacak).

## Adalar ve dünya ölçüsü

- **Yıldızsız Ada 804 × 785 karo** (hilal), **ikinci ada 692 × 720 karo** (yonca); bir karo 16 piksel. İkisinde de kara yaklaşık 282.000 karo, geri kalanı denizdir (v2.35; önce ikisi de 645 × 464 karolu dikdörtgen adalardı). Bir anda yalnızca bir ada bellekte durur; adalar arası geçiş bir yükleme ekranıyla yapılır.
- Envanter, sikke, seviye, gün ve saat iki adada ortaktır.
- Her adada 6 biyom vardır (**eşit büyüklükte**, her biri yaklaşık 47.000 karo; v2.35'ten beri adanın şekli boyunca **zincir halinde** sıralanır, her biyom yalnızca öncekine ve sonrakine değer; 1-2, 3-4, 5-6 ortak bölgedir, 2→3 ve 4→5 arasında keskin bir sınır vardır); biyomun tehlike seviyesi canavarların gücünü belirler: **Güvenli** (ilk iki biyom), **Tehlikeli** (3. ve 4.), **Ölümcül** (5.), **Çok ölümcül** (6.).
- Oyun içinde biyomlar 3 tehlike kuşağına ayrılır ve balık tabloları, tuzak ganimetleri bu kuşağa göre değişir: **Kuşak 0** = Çayır + Orman, **Kuşak 1** = Bataklık + Kayalık Dağ, **Kuşak 2** = Kül Diyarı + Mor Kristal Vadisi (ACT 2'de aynı sırayla).
