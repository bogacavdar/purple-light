# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md

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
