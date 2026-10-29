# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md

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
