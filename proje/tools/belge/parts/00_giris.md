# Purple Light · Tasarım Belgesi

Sürüm: **Versiyon 1.88** ile birebir (29 Ekim 2026; sayılar 1.75 üzerinde ölçüldü, sonraki sürümlerin değişiklikleri işlendi; 1.81: öğretici atlama uyarısı, Börü'nün atılma dersi, Zırh özelliği, üç renkli yetenek ağacı; 1.82–1.83: yetenek ağaçları ağaç biçiminde, ikonlu, ağaç başına 30 yetenek; 1.84: Zümrüt, Dursun ve Durmuş'un 15 kuzeni, demircilerde kademe kuralı, kuzenlere özel 15 silah/zırh, 45 yeni görev ve Elmas Nine'nin ortak ara sahnesi; 1.85: adanın yeni yerleşimi: altı eşit biyom sırayla, üç ayrı onarılan köprü, patlayınca çöken sıradağ; 1.86: ACT 1'in görev sistemi baştan: tek görev, siyah !, sarı çember, 139 görev, Ekin'in ayak işleri, dersler, köprü/patlama/gemi onay pencereleri; 1.87: telefonda Ulti düğmesi yalnızca ulti atar; 1.88: tokken de yemek yenir). Bu belgedeki bütün sayılar (can, hasar, fiyat, ihtimal, adet) oyunun çalışan halinden ölçülerek çıkarıldı; kodu açmadan bir şeyin oyunda nasıl yapıldığını buradan bulabilmelisin.

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

- Her ada **645 × 464 karo** (bir karo 16 piksel). Bir anda yalnızca bir ada bellekte durur; adalar arası geçiş bir yükleme ekranıyla yapılır.
- Envanter, sikke, seviye, gün ve saat iki adada ortaktır.
- Her adada 6 biyom vardır (v1.85'ten beri **eşit büyüklükte**: ada 3 sütun × 2 sıraya bölünür, her biyom yaklaşık 46.000 yürünebilir karo); biyomun tehlike seviyesi canavarların gücünü belirler: **Güvenli** (ilk iki biyom), **Tehlikeli** (3. ve 4.), **Ölümcül** (5.), **Çok ölümcül** (6.).
- Oyun içinde biyomlar 3 tehlike kuşağına ayrılır ve balık tabloları, tuzak ganimetleri bu kuşağa göre değişir: **Kuşak 0** = Çayır + Orman, **Kuşak 1** = Bataklık + Kayalık Dağ, **Kuşak 2** = Kül Diyarı + Mor Kristal Vadisi (ACT 2'de aynı sırayla).
