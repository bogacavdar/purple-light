# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 3.72 · 8 Kasım 2026

### Oynanış
- **Daha sade bir ada:** başlangıç kampının çevresi dışında dal, lif, taş, nehir çakılı, kum ve çakmaktaşı **%30 daha az**; biyom bitkileri **%25 daha az** ve artık tek tek serpilmiyor, **aynı türden 3–5'lik öbekler** halinde bitiyor (bir öbeğe gidince birkaç tane birden toplarsın). Toplanan bitki yine kendi türünün yanında yeniden çıkar, öbekler dağılmaz. Çayır ve Orman'da bir ekrandaki nesne sayısı ~38'den ~33'e indi; ekran benek benek görünmüyor. Ağaçlar ve madenlerin sayısı aynı.

### Düzeltmeler
- **Madenler yan yana yığılmaz:** aynı türden iki maden en az 6 kare, herhangi iki maden en az 3 kare arayla durur. Tükenen bir maden yeniden çıkarken de buna uyar (önceden yalnızca çok küçük bir boşluk aranıyordu, zamanla aynı kayalar üst üste yığılıyordu). Eski kayıtlarda kümelenmiş madenler oyun açılınca kendi biyomlarının içinde dağıtılır; maden sayıları değişmedi.

### Tasarım belgesi
- ACT 1 › Adanın yerleşimi › Haritadaki miktarlar: madenler arası mesafe kuralı; yeni "Sade harita" maddesi (temel malzemeler −%30, bitkiler −%25 ve öbek öbek, öbeklerin yeniden çıkışı).

---

## Versiyon 3.71 · 8 Kasım 2026

### Arayüz
- **Yeni imleç:** oyun alanındaki mor nişangâhın yerine **mor ışıklı piksel el**: krem renkli, ince mor kenarlı, parmak ucu morla parlayan, çevresinde soluk mor bir ışık olan bir el. Toplanacak, konuşulacak ya da kullanılacak bir şeyin üstüne gelince **avucunu açar**, mor ışık belirginleşir ve kıvılcım çıkar. Menülerdeki krem/mor ok aynı kaldı. (Yalnızca fareyle oynayanlar için; telefonda imleç yok.)

### Düzeltmeler
- **Leşlerde çift gölge:** yere düşen canlının altında artık tek gölge var (ayaktaki gölgesi leşle birlikte dönüp ikinci bir gölge gibi görünüyordu).
- **Kemal'in böğürtlenleri uygun yerde çıkar:** öğreticinin 5 böğürtleni (ve Zümrüt'ün, Börü'nün dersinde bırakılanlar, uzaktaki çalının yerine çıkan yeni çalı) artık en baştan kişilerden, ateşlerden (Kemal'in ateşi dahil), ağaçlardan uzak bir yere konur ve orada kalır; yanına gidince yer değiştirmez.
- **Robot köpeğin yokken R hiçbir şey açmaz:** köpekler menüsü, Ayarlar › Kontroller'deki "Robot köpekler" satırı ve kol menüsündeki düğme ilk köpek gelene kadar görünmez (ileride gelen bir şeyi önceden göstermesin).

### Tasarım belgesi
- ACT 1 › Adanın yerleşimi: öğreticinin bıraktığı malzemelerin yeri kuralı. Sistemler › Ölüm pozu ve leş: tek gölge. Sistemler › Kontroller: R tuşu köpek yokken; Fare imleci: mor ışıklı piksel el.

---

## Versiyon 3.70 · 8 Kasım 2026

### Oynanış
- **Hava artık mevsimden ve sıcaklıktan gelir.** Adanın bir sıcaklığı var: yıl boyunca yumuşak bir eğri (yaz ortası ~26°, kış ortası ~−3°), her günün kendi farkı, gün içinde 14:00'te en sıcak, 05:00'te en soğuk; Kayalık Dağ daha soğuk, Kül Diyarı ve Ejder Volkanı çok sıcak.
- **Yağmur mu kar mı, sıcaklık belirler:** 0°'nin altında kar (fırtınada tipi), üstünde yağmur. Sonbaharın son günleri ve ilkbaharın ilk günleri de soğuk gecelerde kar görebilir; kışın ılık bir günde yağmur da yağabilir. Tipide şimşek çakmaz.
- **Hava sırayla değişir:** açık → bulut → yağış → (fırtına) → bulut → açık; artık güneşli bir havadan birden fırtınaya geçilmez. Sis en çok sabahları çıkar.
- **Mevsime göre yağış:** kışın bulut yağışa en sık döner (%45) ve yağış uzun sürer (2,5–5 dk); yazın seyrek (%18) ve kısa (1–1,5 dk), ama yaz sağanaklarının çoğu kısa fırtınadır; sonbahar yağmurlu ve fırtınalı, ilkbahar arası.
- **Kar yerde birikir:** kar yağdıkça zemin önce yer yer, sonra her yer **yavaş yavaş beyazlar** (~5,5 dakikalık karda tamamen; tipide iki kat hızlı). Hava 0°'nin üstüne çıkınca **erir**; yağmur yağarsa 4 kat, güneşli gündüz 1,5 kat hızlı. Su, Kül Diyarı ve Ejder Volkanı karlanmaz; göller donmaz.

### Görsel
- Zeminde kar örtüsü: küçük beyaz öbekler belirip büyür ve birleşir, eriyince yine öbek öbek çekilir.

### Arayüz
- Saat kutusunun ikinci satırında mevsim ve sıcaklık ("Kış · −6°"); kar yağarken hava adı "Kar" ya da "Tipi". Kutu, satır sığsın diye kendi genişliğini ayarlar.

### Düzeltmeler
- Yağmur başladığında çıkan yazıda artık oyunda olmayan tarlalar anılmıyor.

### Kayıtlar
- Yerdeki kar örtüsü kayda yazılır; eski kayıtlar karsız açılır.

### Tasarım belgesi
- Sistemler › Gün, gece ve mor ışık: yeni **Hava, sıcaklık ve kar** bölümü (sıcaklık formülü, yağışın türü, hava zinciri ve mevsim tablosu, kar örtüsünün birikmesi ve erimesi, çizim). Mevsimler tablosundan eski hava oranı satırı kalktı; Hava maddesi buraya yönlendirir.

---

## Versiyon 3.69 · 8 Kasım 2026

### Oynanış
- **Mevsimler geldi.** Yıl 28 gün: her mevsim 7 gün sürer ve sırayla döner (1–7 İlkbahar, 8–14 Yaz, 15–21 Sonbahar, 22–28 Kış). İki adada da aynı. Yeni mevsim sabah büyük bir yazıyla duyurulur.
- **Geceler mevsime göre:** yazın gece 1,8 dakika, kışın 3,5 dakika (İlkbahar ve Sonbaharda 2,5). Saatler aynı kalır: gece yine 20:00–06:00, uyku yine 20:00–05:00.
- **Hava mevsime göre:** yaz çoğunlukla açık, sonbahar yağmurlu ve fırtınalı (kıyıya şişe vurma şansı da artar), kışın yağmur **Kar**, fırtına **Tipi** olur.
- **Toplarken:** İlkbaharda otlar, Yazın meyveler, Sonbaharda mantarlar %50 ihtimalle bir tane fazla gelir; sonbaharda ağaçtan düşen meyve (silkeleme, kesme, Sapan) 2 kat. **Kışın meyve yok:** dallar çıplak, çalılardan ve ağaçlardan meyve gelmez. Kışın meyve gerekirse Nazlı'dan satın alınabilir.
- **Mevsim balığı:** her mevsim bir balık iki kat sık vurur: İlkbahar Alabalık, Yaz Sazan, Sonbahar Turna balığı, Kış Mersin balığı. Göller kışın donmaz; balık her mevsim tutulur.
- **Kışın karın çabuk acıkır:** tokluk %25 daha hızlı düşer.
- **Mor gece:** her yılın son gecesi (28., 56., 84.… gün) yılın en uzun gecesidir (4 dakika). Gökyüzü mora çalar ve **mor ışık saldırısı kesin gelir**; evde ya da ateşin başında beklesen de dışarı çıktığın an gelir. Uyuyarak geçirirsen gelmez. Anılara dokunmaz.

### Görsel
- İlkbaharda uçuşan çiçek yaprakları, yazın ılık bir ışık, sonbaharda düşen sarı-turuncu-kızıl yapraklar, kışın durmadan yağan kar ve soğuk bir renk; kar ve tipide yağmur çizgileri yerine kar taneleri. Mor gecede gökyüzü mor. Grafik kalitesi en düşükteyken yalnızca kar çizilir (yaprak, çiçek ve renk yok).

### Arayüz
- Saatin yanında mevsim yazar ("9. gün · 06:00 · Yaz"); kışın hava adı Kar ya da Tipi.

### Kayıtlar
- Mor gece saldırısının görüldüğü kayda yazılır (aynı gece yeniden gelmesin diye) ve köpek günlüğüne de girer. Mevsim günden hesaplanır; eski kayıtlar kendi günlerinin mevsiminde açılır.

### Tasarım belgesi
- Sistemler › Gün, gece ve mor ışık: yeni **Mevsimler** bölümü (takvim, gece süreleri, hava oranları, toplama, mevsim balıkları, kışın tokluk, Mor gece). Hava, Tokluk, Balık tutma ve Mor ışık saldırıları maddelerine mevsim notları; Aletler › Sapan'a mevsim notu; ACT 3 › köpek günlüğüne Mor gece.

---

## Versiyon 3.68 · 8 Kasım 2026

### Oynanış
- **Sapan işe yarıyor:** eldeyken vuruş bir **taş** atar (her atış 1 Taş). Bir **kuşa** (keklik, ördek, ur kekliği…) değerse kuş 3 saniye sersemler. Nişanı bir **meyve ağacının** tacına alırsan ağacın dibine 1 meyvesi düşer (tohumu olan ağaçta %20 bir de tohum); her ağaç günde bir kez meyve verir. Hasar 5, menzil 200 px.
- **Bola işe yarıyor:** fırlatılır ama harcanmaz. Değdiği canlının ayaklarına dolanır, canlı **5 saniye %35 hızla** yürür. Kaçan tavşanı, geyiği yakalamak ya da saldırgan bir canlıdan uzaklaşmak için birebir. Reisler hasar alır ama sersemlemez, yavaşlamaz.
- **Dişbudak yayı ve Porsuk yayı artık gerçek yay:** ikisi de **kısa yay**. Biyomlarının asıl yayıyla saniyedeki hasarı aynı, ama daha sık atar, menzili kısa ve daha çok ok harcar (Dişbudak 20 hasar / 0,5 sn / 250 px; Porsuk 27 / 0,49 sn / 270 px). Bütün yaylar gibi örste dövülür.
- **Kupa panosu:** Usta Sinan'ın yaptığı, duvara asılan 3 kare genişliğinde bir pano (2 Çam kalası, 1 Tunç levha, 2 İp, 1 Sopa; 896 sikke). Yendiğin her Reis için üstünde altın bir kalkan belirir.
- **Kıyıya vuran şişeler:** fırtına dinince bazen kıyıya bir şişe vurur. İçinde ada halkından birinin mor ışığa kaybettiği kişiye yazdığı bir mektup var (Kemal, Zümrüt, Nazlı, Börü, Dursun ile Durmuş, Sinan, Doğan, Barbaros ve kuzenlerin Elmas Nine'ye mektubu; toplam 9). Okuduklarını Kitap › Ada halkı'nın altında bulursun.
- **Üç yeni başarım (gizli değil):** İlk anı (bir anı), Anılar dönüyor (ACT 1'in 11 anısı), Tanıştığımız günden beri (ACT 1'in 22 anısının hepsi). Toplam 49 başarım.

### Arayüz
- **Ayarlar › Renk körü modu:** açınca tamam / eksik / yapılır renkleri mavi, turuncu ve açık sarıya döner (renk körlüğünün her türünde ayırt edilir). Malzeme satırlarında ✓ ✗ + işaretleri çıkar; takip şeridi, kazan listesi, Zor modun cevapları ve görev kartları da aynı paleti kullanır; inşa gölgesi mavi (konur) ya da turuncu (konmaz) olur.
- **Ayarlar › Kalp atışını ekranda göster:** açınca gece beliren sevdiğin kişi göründüğünde her kalp atışıyla ekranın kenarları da mor bir nabızla atar; sesi kapalı oynayan da kalp atışını görür.
- Arenanın silah seçicisinde yeni **Fırlatma** grubu (Sapan, Bola); kısa yaylar Yaylar grubunda.

### Kayıtlar
- Her kayıt artık gizli bir **köpek günlüğü** tutar (bayılmalar, başarımlar, Reisler, anılar, kıyıya vuran mektuplar; gün ve saatiyle). Oyunda görünmez; ACT 3 için şimdiden yazılıyor. Bulunan mektuplar da kayda yazılır. Eski kayıtlar boş günlükle ve hiç mektup bulunmamış olarak açılır.

### Tasarım belgesi
- Sistemler › Arayüz: yeni **Erişilebilirlik** başlığı (renk körü paleti tablosu, kalp atışı göstergesi); Mor ışıkta o maddesine gösterge eklendi.
- Sistemler › Ev: Kupa panosu. Sistemler › İzler ve anılar: Kıyıya vuran şişeler (9 mektubun kimden kime olduğu).
- Aletler: Sapan ve Bola bölümü, kısa yaylar (yaylar tablosuna iki satır), aletler tablosunda Sapan/Bola yeni tür; Sapan ve Bola'nın "Nerede yapılır"ı El yapımı olarak düzeltildi (oyunda zaten elle yapılıyordu).
- Başarımlar: 3 anı başarımı, 46 → 49 (PS5 bölümündeki sayı da).
- ACT 3: köpek günlüğünün şimdiden tutulduğu ve neleri yazdığı.
- Bilinen açıklar: #18 (işlevsiz aletler) kapandı.
- Belgenin başındaki sürüm satırı artık her yayında oyunun sürümünden yazılır (3.59'da kalmıştı).

---

## Versiyon 3.67 · 8 Kasım 2026

### Oynanış
- **Kamış ok gövdesi oyundan kalktı:** hiçbir ok gövde istemiyordu. Elindeki gövdeler kendi malzemelerine döner: her biri 3 Kamış + 1 İp (çanta, sandık, köpek sırtı, yer; hepsi). Tarif kitabından da düştü. Kamış hâlâ Kamış hasır, Kamış flüt ve Kamış çizmede kullanılıyor.
- **Kemik ok ucu artık alet istemiyor:** elle yapılıyor, Çekiç taşı gerekmiyor (fiyatı 11 sikke kalıyor).
- **Davut'un "Hayvanlara bir yuva" (CB2) görevi:** ödül 80 → **300 sikke** (XP 60 aynı).
- **Ahşap karyola 738 sikke** (önce 475'te kalmıştı; boya eklenince fiyatı boyanın payı kadar arttı). Usta Sinan'ın işçiliği 95 → 148.
- **Zor modda "Deneyerek bul":** kazana en çok **7** farklı malzeme atılır (6'ydı; Obsidyen mızrak 7 malzemeli). Kazandaki bir malzemeye yeniden dokununca **adedi artar** (çipte "×N"). Aynı malzemelerle birden çok tarif varsa (ör. Tabure/Sandalye/Raf, aynı metalin baltası ve savaş çekici) kazan adetlere de bakar; tutmuyorsa "birden çok tarif var; adetleri değiştirerek dene" der ve en yakın tarife kaç adet fark olduğunu söyler. Malzemesi, adedi ve yeri birebir aynı olan tarifler (Öğütme taşı ile Bileği taşı; Bakır, Çelik, Kara çelik, Mor kristal balta ile topuzu) birlikte bulunur: "İki tarif buldun: Bakır balta ve Bakır topuz", ikisi de öğrenilir, ikisine de XP.

### Düzeltmeler
- **Etkili okların fiyatı düzeldi:** Keskin/Alevli/Zehirli oklar normal okun ~10 katına satılıyordu (Keskin Tunç ok 680). Artık belgedeki kural: tanesi ok + yağın onda biri, × 1,1 (Keskin Tunç ok 98, Alevli Kara çelik ok 2.033; 21 okun hepsi). Pazar ve tarif ekranları yeni fiyatı gösterir.
- **Kazanda görünmeyen 40 tarif:** Usta Sinan'ın kurduğu 33 yapı (Ağıl, Kulübe, Kerpiç ev, Çömlek fırını, Hasır yatak…) ve 7 inşa parçası (Toprak yol, Çakıl yol, Ahşap parke, Dal çit, Çit, Taş duvar, Tahta kapı) kazanın tarif listesinde yoktu; inşa parçaları tarif kitabında da görünmüyordu. Artık hepsi kazanda öğrenilir (Davut'un Ağıl görevi takılmaz).
- **İkinci tarifler (varyantlar) asıl tarifle aynı:** "Bakır ok (Bıldırcın tüyü ile)", "Tunç ok (Yaban kazı tüyü ile)", "Demir ok (Turna kuşu tüyü ile)" artık asıl tarif gibi ok ucunu da ister ve asıl tarif kadar ok verir (Tunç/Demir 3 yerine 10, Bakır 14 yerine 18; Goblin oklu Basit ok 7 yerine 11). "Ahşap karyola (Gölge postu ile)" artık Kükürt sarısı boyayı da ister.

### Tasarım belgesi
- Tarifler › Ev eşyası: boyalı ev eşyası fiyat kuralı (kural eski fiyatın altında kalırsa eski fiyat + boya × zincir çarpanı; karyola 738).
- Tarifler › Varyant tarifler: "varyant, asıl tarifin bugünkü girdileriyle aynıdır" cümlesi; 3 ok satırına uç ve adet, karyola satırına boya; Goblin oku satırı → 11.
- Sistemler › Zorluk: Deneyerek bul 7 malzeme, adet artırma, aynı türlü tariflerde adet kuralı, birebir aynı tarifler birlikte bulunur.
- Eşyalar: Çekiç taşının kullanıldığı yerlerden Kemik ok ucu çıktı.
- (Yönetici/Analist yazdı: CB2 300, Kemik ok ucu alet istemez, Kamış ok gövdesi kalktı, etkili ok fiyatları.)

---

## Versiyon 3.66 · 8 Kasım 2026

### Oynanış
- **Artık her malzemenin bir işi var.** Önceden yalnızca satılabilen 146 malzeme (ağaç kömürleri, kabuklar, saplar, kalaslar, deri ve postlar, tüyler, tuğlalar, camlar, Demir halka, Tunç levha, meyve ağacı odunları ve diğerleri) artık bir tarifte kullanılıyor.
- **İkinci tarifler:** birçok eşyanın artık ikinci bir yapılış yolu var. Tarif kitabında "Kürk yelek (Sincap derisi ile)" gibi ayrı bir satır olarak görünür, kazanda ayrıca öğrenilir. Yapılınca aynı eşya çıkar; fiyatı ve görevlerdeki sayımı aynıdır. Örnekler: her hayvanın derisi deri parçası yerine, tuğlalar fırın ve kerpiç evde, camlar Kil lamba ve Golem fenerinde, Bazalt ok ucu Kara çelik okta.
- **Oklar ok ucu istiyor:** her ok kendi ucuyla yapılır: Basit ok ← Kemik ok ucu, Bakır ok ← Diken, Tunç ok ← Lav camı, Demir ok ← Akrep, Çelik ok ← Çakmaktaşı, Mor kristal ok ← Kuvars, Kara çelik ok ← Obsidyen ya da Bazalt ok ucu. Bir yapımda çıkan ok sayısı arttı (Basit 11, Bakır 18, Mor kristal 11, diğerleri 10), ok başına fiyat en çok %25 arttı.
- **Boyalar ev eşyalarında:** Kilim, Halı, Duvar halısı, Perde, Dolap, Sandık, Masa, Ahşap karyola, Asma fener ve Mor yosun yastığı birer boya ister, Boyalı çömlek Yıldız mürekkebi ister. Bu eşyaların değeri ve Usta Sinan'ın işçiliği buna göre arttı (ör. Kilim 437 → 615).

### Tasarım belgesi
- Yeni kural: her eşyanın fiyatı olur, her malzeme bir tarifte kullanılır, hiçbir tarif elde edilemeyen bir malzeme istemez.
- Tarifler › Varyant tarifler bölümü eklendi; ok, etkili ok ve ev eşyası fiyatları yenilendi; Armut, Elma, Erik odununun eksik fiyatı (3) yazıldı.
- Üs kurma bölümü oyunla eşitlendi: kesin parça fiyatları, İnşa N / harita T, Direk feneri avluyu kapatmaz, kayaya kurulmaz, Onar/Kaldır, fener 6 gecelik yakıt.

---

## Versiyon 3.65 · 8 Kasım 2026

### Oynanış

- **Üs kurma geldi.** Evinin çevresinde, dışarıda kendine bir üs kurabilirsin. **N** tuşu (ya da alt çubuktaki İnşa düğmesi, kolda Kol menüsünde "İnşa") İnşa kipini açar; oyun bu sırada durmaz, bir canlı sana vurursa kip kapanır.
- **Zemin ve yollar:** Toprak yol, Çakıl yol ve Ahşap parke El yapımı'nda yapılır (bir yapımda 4 karo), basılı tutup sürükleyerek boyanır. Üstlerinde ağaç, bitki ya da maden yeniden çıkmaz. Toprak ve Çakıl yolda %15 daha hızlı yürürsün (binekte de).
- **Çit, duvar, kapı:**
  - Dal çit kapanmaz ama canlıları üçte birine yakın yavaşlatır.
  - Çit ve Taş duvar yolu keser. Çit artık El yapımı'nda yapılır, bir yapımda 2 Çit çıkar.
  - Tahta kapı sana, evcil hayvanlarına ve sana eşlik edenlere açıktır, yabani canlılara kapalıdır. Döndürülebilir (R).
- **Canlılar çiti kırabilir:** yalnızca seni kovalarken ve yakınındayken.
  - Küçük canlılar hiçbir şey kırmaz.
  - Kurt gibi orta güçteki canlılar yalnızca dal ve tahta parçaları kırar.
  - Ayı, timsah gibi güçlüler taş duvarı da kırar; Reisler her şeyi kırar.
  - Uçan canlılar üstünden geçer ama kırmaz. Çitin arkasından ısırılmazsın.
  - Hasar alan parçada çatlaklar görünür. Kırılan parça yıkık kalır ve 1 malzeme düşürür; yanına gidip **F** ile 1 Dal (taş duvarda 1 Taş) vererek onarırsın.
- **Avlu:** çit, taş duvar ve kapıyla tamamen çevirdiğin alanın (en çok 64×64 karo) içinde canlı doğmaz. Bir parça kırılınca avlu açılır, onarınca geri gelir.
- **Direk feneri:** gece 20:00'de yanar, 06:00'da söner, her gece bir yakıt harcar. Yakıtı **F** ile koyarsın (1 Hayvan yağı ya da 2 Reçine). Işığının içine mor ışık gelmez; canavarları uzaklaştırmaz. Yanan fenerler haritada görünür. Usta Sinan yapar.
- Kurulamayan yerde gölge kırmızı olur ve nedeni yazar (su, ağaç, kaya, kişilere ya da ateşe çok yakın, köprü ve mağara ağzının önü, sınır doldu gibi). Sınırlar: 2.000 zemin, 600 çit ve duvar, 24 fener.
- Usta Sinan'ın K3 görevine İnşa dersi eklendi.

### Arayüz

- **Haritaya işaret koyma tuşu N'den T'ye taşındı** (N artık İnşa). Ayarlar › Kontroller'den değiştirilebilir.
- İnşa kipinde altta parça şeridi ve sayaçlar görünür. Koymadan önce parçanın gölgesini görürsün. Kurulmuş bir parçaya tıklayınca (dokunmatikte basılı tutunca) Taşı / Geri al seçenekleri çıkar (kapıda Döndür, hasarlı ya da yıkık parçada Onar, yıkıkta Kaldır); sağ tıkla sürüklemek siler.
- Kolda: şeritten parçayı seç, yön tuşları ya da sağ çubuk imleci kaydırır, A koyar (basılı tutup kaydırınca boyar), X siler, Y döndürür, B geri. Evin içinde Kol menüsündeki aynı yer Döşe olarak kalır.
- **Oyun süresi ikiye ayrıldı:** Karakter › İstatistikler'de **aktif oyun süresi** (dünya akarken) ve **menüde geçen süre** (çanta, kitap, harita, Ayarlar, duraklatma gibi bir pencere açıkken) ayrı yazar. İkisi de gerçek saatle sayılır; ana menüde ve sekme arka plandayken geçen süre sayılmaz. Oyun sonu ekranındaki "Süre" aktif oyun süresidir.

### Görsel

- Yollar, parke, çitler, taş duvar, kapı (açık/kapalı), fener ve yıkık parçalar için yeni resimler. Çit simgesi gerçek bir çit gibi çizildi.

### Fiyatlar

- Toprak yol 1, Çakıl yol 2, Ahşap parke 10, Dal çit 4, Çit 82, Taş duvar 8, Tahta kapı 228, Direk feneri 209 sikke. Ağıl'ın tarifi aynı kaldı, Çit ucuzladığı için fiyatı 1.107'ye düştü.

### Kayıtlar

- Yapılar kayda girer. Eski kayıtlarda yere kurulmuş Çit'ler kendiliğinden yeni sisteme taşınır.
- Eski kayıtlarda aktif oyun süresi kayıttaki oyun süresiyle başlar, menü süresi 0'dan başlar.

### Tasarım belgesi

- Sistemler › Üs kurma bölümü eklendi (1. aşama). Tariflere İnşa parçaları, Usta Sinan'a Direk feneri, K3'e İnşa dersi yazıldı.
- Sistemler › İstatistikler ve oyun süresi bölümü eklendi.

---

## Versiyon 3.64 · 8 Kasım 2026

### Arayüz

- **Kolla pencereler doğru yerde açılır:** öğretici bir düğmeyi ya da eşyayı yakıp söndürüyorsa pencere doğrudan onda açılır (El yapımı'nda yanıp sönen "Yap", Çanta'da yanıp sönen balta). Yanıp sönme pencere açıldıktan hemen sonra başlasa da seçim oraya geçer.
- Çantada giysi yuvalarının her birinden aşağı basınca eşyalara inilir. Alttaki alet şeridinin altında kalan eşya görünür olacak kadar kaydırılır.
- Kazanda ve örste kolun X'i "Hepsini koy"a basar. Kazanda grup LB / RB ile değişince seçim listenin ilk tarifine geçer.
- Kol menüsünde "Ana menüye dön" önce sorar.
- Hile paneline Kol menüsünden ("Hile paneli") gidilir. Arama kutusuna A ile ekran klavyesi açılır, Options / Start ile sonuçlara geçilir, B ile panelden çıkılır.
- **Kolda doğru tuş yazıları:**
  - Börü'nün "Yetenek ağacını aç" uyarısı "Start → Yetenekler" der (PlayStation'da Options).
  - "2 tuşuna bas" gibi sayı tuşları "LB / RB ile kemerde ona gel" olur.
  - "Kaba meşale simgesini yuvaya sürükle" yerine çantada seçip A'ya basmayı anlatır.
  - "kazana tıkla ya da yanında A'ya bas" kolda "kazana gidip A'ya bas" olur.
  - Meşale kartı "bir daha basılı tutunca söner" der, El yapımı'ndaki "(L)" kolda görünmez.
  - Zümrüt'ün "Tab'a bas"ı klavyede bağlı tuşu, kolda ↑'yı söyler.
- Börü'nün dersleri boyunca öğretici kartı aşamayı gösterir: "Börü · Atılma (n/4)", "Börü · Savuşturma (n/4)", "Börü · Yetenek ağacı". Önceden hep "Kereviti vur" yazıyordu.

### Düzeltmeler

- Öğretici geçilmişken Börü'nün ücretsiz atılma dersi yarıda bırakılıp oyun kaydedilince atılma öğrenilmiş sayılıyordu; artık sayılmaz (ders yeniden teklif edilir).

### Denge

- Üç ham eşya kendi biyomunun fiyat aralığına indi: Yabani bal 13 → 12, Ateş biberi 72 → 52, Işık mantarı 123 → 90. Bunları kullanan tarifler kuralla birlikte değişti (Acı biber ezmesi 402 → 324, Işık mantarı çorbası 537 → 408, Ay otu iksiri 698 → 655, ballı tarifler 1'er sikke).

## Versiyon 3.63 · 7 Kasım 2026

### Oynanış

- **Ateşte pişirme:** ateş isteyen yemekler (kavrulmuş, kızarmış, haşlanmış, tütsülenmiş, ızgara, tava, şiş, buğulama, çorbalar, ekmekler, güveç, pişmiş et ve balık…; 129 tarif) artık El yapımı listesinde yok. Tarifi yine kazanda öğrenirsin, yemeği **ateşte** yaparsın.
- Kamp ateşine ya da kişilerin ateşlerine F, tıklama, dokunma ya da kolda A ile **pişirme menüsü** açılır. Menüde çiğ et ve balık közleme ile öğrendiğin ateş yemekleri var; her satırda Yap · ×5 · Hepsi. Kamp ateşinde ayrıca "Odun at" düğmesi ve ateşin kaç dakika yanacağı görünür.
- Ateşin başında **Ateş ve Duman malzemesi harcanmaz**, ateş sağlar. Öbür malzemeler harcanır.
- Her yemek ateşte ~3 saniyede pişer. ×5 ve Hepsi sırayla pişer, ateşin üstünde ve menüde ilerleme çubuğu görünür. Pişen yemek kendiliğinden çantana gelir; bu arada uzaklaşabilirsin. Yemek yanmaz.
- Kamp ateşinde her yemek ateşten biraz yer. Ateş pişirme bitmeden sönerse pişmeyen malzemeler çantana döner.
- Çantanda çiğ yiyecek olmasa da yapabileceğin bir ateş yemeği varsa kişilerin ateşinde menü açılır.
- Ateşte ilk kez yapılan yemek 12 XP, sonrakiler 2 XP verir (el yapımı gibi). Közleme parça başına 1 XP.

## Versiyon 3.62 · 7 Kasım 2026

### Düzeltmeler

- **Börü'nün atılma dersi artık takılmaz:** kerevit bir yere sıkışır, itilir ya da oyun çok yavaş akarsa bile en geç 5 saniyede yeniden saldırır. Çok uzakta kalırsa yanına döner.
- **Ders sırasında alınmış bir kayıt yüklenince öğretici kilitlenmez:** Börü'nün kereviti geri gelir. Onu vurunca atılma dersi baştan başlar.
- Kol menüsünden "Oyunu kaydet" ve "Kayıttan yükle" ilk boş yuvada (yoksa ilk yuvada) açılır, "Geri"de değil.
- Kolla kazanda grup listesi sol / sağ ile artık değişmez (seçim yanındaki düğmeye geçer). Grup LB / RB ile değişir. Kazan boş bir grupla kalmışsa kolla açılınca bütün tarifler geri gelir.
- Çantada meşaleyi A ile seçince seçim kendiliğinden meşale yuvasına geçer (bir daha A: yuvaya girer).

### Arayüz

- Meşale yazıları kolda doğru tarif eder: "LB / RB ile meşale yuvasını seç, sonra X'i basılı tut" (PlayStation'da L1 / R1, □).
- Kol açıkken ders kartlarında ve ipuçlarında fare sözleri ("tıkla ya da", "… düğmesine tıkla") düşer, pencerelerdeki "(Esc)" görünmez, Zümrüt'ün "Tab'a bas"ı kolun tuşunu söyler.
- Tuş adından sonraki ek, yeni adın okunuşuna uyar: "A'ya bas", "B'ye", "X'e", "LB'ye", "✕'ya".
- Kol yazılarına kol tuşu harfi ikinci kez klavye tuşu sanılıp değiştirilmez (meşale yazısında "X basılı" "J basılı" oluyordu).
- LB / RB kemerde boş eldeyken boş el kutusu da mavi çerçeveyle gösterilir.
- Ad yazma ekran klavyesi DualSense'te ✕ / □ / ○ / Options yazar ve dar ekranda taşmaz.

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
