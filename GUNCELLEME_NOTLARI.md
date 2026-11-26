# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 4.56 · 26 Kasım 2026

### Proje
- **Godot: yetenek ağacı:**
  - Y ile açılıyor. Web'deki üç ağaç (Savaş, Ekonomi, Dayanıklılık) aynı yerleri, dalları, ikonları ve fiyatlarıyla Godot'ta.
  - Üstüne gelince yeteneğin ne yaptığı görünüyor. Tıklayınca alınıyor ve nasıl kullanılacağı anlatılıyor.
  - Koşmak için artık Koşu gerekiyor (100 Vio). Börü dersten sonra ağacı gösteriyor.
  - Enerji, hız, hasar, savuşturma, atılma, can, satış, XP, toplama, aletler ve tokluk yetenekleri işliyor. Kritik vuruş, zırh, zehir gibi henüz Godot'ta olmayan sistemlerin yetenekleri alınabiliyor; etkileri o sistemlerle gelecek.
  - Can artık zamanla yavaş yavaş doluyor. Enerji çubuğu web'deki gibi yeşil.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.55 · 26 Kasım 2026

### Proje
- **Godot: enerji, savuşturma ve Börü'nün dersleri:**
  - Can çubuğunun altında mavi enerji çubuğu var. Koşu, vuruş, atılma ve savuşturma enerji harcar; biterse "Nefesin kesildi!" ya da "Yoruldun!" yazar.
  - Saldırıların "!"i renkli: beyaz ve sarı savuşturulur, kırmızı savuşturulamaz.
  - Sağ tık ya da E savuşturur; doğru anda basarsan hayvan sersemler. Basılı tutarsan gard alırsın, darbeler yumuşar.
  - Atılmayı ve savuşturmayı Börü kerevitle ücretsiz öğretiyor (4 sıyrılma, 4 savuşturma). Bilmeden atılınca oyun bunu Börü'nün öğrettiğini söylüyor.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.54 · 26 Kasım 2026

### Proje
- **Godot: Çayır'ın bütün canlıları geldi:** tavşan ve kurdun yanına keklik, bıldırcın, kerevit, porsuk, geyik ve yaban atı. Web'deki gibi Çayır'da dolaştıkça çevrende doğuyorlar; kurtlar yalnız gece ve ilk seviyelerde tek başına çıkıyor. Geyik ve yaban atı sürüyle geziyor; vurursan saldırıyorlar. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.53 · 26 Kasım 2026

### Proje
- **Godot, Adım 1f-3b-1 (Nazlı'nın pazarı) oynanabilir:** Nazlı'yla konuşunca pazar açılıyor. Sat sekmesinde miktarla, tek tek ya da hepsini satıyorsun; üç toplu satış düğmesi web'deki gibi (hepsini sat, kazandaki açık tariflere yeteni bırak, bütün tariflere yeteni bırak). Tarifte kullanılan bir malzemeyi satarken "Emin misin?" soruyor. Satın al sekmesinde gördüğün doğal malzemeler ve tarifini bildiğin eşyalar var. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.52 · 26 Kasım 2026

### Proje
- **Godot, Adım 1f-3a (giriş sahnesi ve uyanış) oynanabilir:** yeni oyun artık web'deki giriş sahnesiyle açılıyor: gün batımında gemide yemek, mor ışık, gemi batıyor, "Tut elimi!", su altında sevdiğin kişi uzaklaşıyor. Sahnede yaratıcıda seçtiğin iki karakter oynuyor; "Geç" ile atlanabiliyor. Sonra ACT 1 kartı, kumsalda uyanış, Kemal'in gelişi ve konuşması, senin ve sevdiğin kişinin adı. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.51 · 25 Kasım 2026

### Proje
- **Godot, Adım 1f-2 (karakter yaratma) oynanabilir:** Yeni oyun artık karakter yaratmayla başlıyor: önce kendi karakterin, sonra sevdiğin kişi, en sonda zorluk. Ten, yüz, göz rengi, saç biçimi ve rengi, kıyafet ve renkleri seçiliyor; önizleme her seçimde hemen değişiyor, Döndür ve Rastgele var. Oyunda karakterin seçtiğin görünüşle yürüyor. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.50 · 25 Kasım 2026

### Proje
- **Godot, Adım 1f-1 (ana menü, kayıt, gün-gece, bayılma) oynanabilir:** oyun artık ana menüyle açılıyor (Devam et, Yeni oyun, Kayıttan yükle). Esc ile oyun içi menü: kaydet (3 yuva), yükle, ana menüye dön; otomatik kayıt da var. Gün ve gece döngüsü geldi: akşam kararıyor, ateşler ve meşale ışık veriyor; gece ışıksız kalırsan mor ışık iniyor ve bayılıyorsun. Bayılınca eşyaların ve Vio'nun bir kısmı gidiyor, kalanı düştüğün yerde kurukafalı bir çantada bekliyor. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.49 · 25 Kasım 2026

### Proje
- **Godot, Adım 1e-2 (Yankı Mağarası: canlılar, boss, Madenci Kaya) oynanabilir:** mağarada yarasalar, kör kertenkeleler ve taş örümcekleri dolaşıyor; en dipte fenerli Madenci Kaya seni bekliyor. 4 Yankı mantarı getirince Yankı Kraliçesi geliyor; yenince Kaya'ya dön. Mağaranın ağzında Sarkıt ve Yarasa gübresi toplanıyor. Godot'da artık her canlı avlanınca kendi düşenlerini bırakıyor ve XP veriyor. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.48 · 25 Kasım 2026

### Proje
- **Godot, Adım 1e-1 (Yankı Mağarası: giriş, iç, ışık) oynanabilir:** Çayır'daki mağaranın kaya tepesi, tabelası ve ağzı geldi; seviye 5 ve yanan bir meşaleyle giriliyor. İçerisi zifiri karanlık; meşale çevreni aydınlatıyor, mantarlar mavi parlıyor. Meşale sönerse birkaç saniye sonra dışarı çıkıyorsun. Yankı mantarı ve Damla taşı toplanıyor, küçük harita mağarada yürüdükçe açılıyor. Meşale yuvası kemerin solunda (" tuşu ya da tıklayınca yanar/söner). Canlılar, Yankı Kraliçesi ve Madenci Kaya sıradaki parçada. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.47 · 25 Kasım 2026

### Proje
- **Godot, Adım 1d-3 (görev sahneleri ve dersler) oynanabilir:** görevler artık web'deki gibi kısa bir sahneyle veriliyor: siyah şeritler, üstte anlatım yazısı, başların üstünde konuşma balonları, duygu işaretleri, kişinin hareketleri, duman ya da kıvılcım gibi efektler, kameranın görev yerine kayması, istenen eşyanın resmi, anılarda sepya ve gecede koyu renk. Tıklayınca sonraki adım, Esc ile atlanır. Dersi olan görevlerde "Yeni ders" kartı çıkıyor. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.46 · 25 Kasım 2026

### Proje
- **Godot, Adım 1d-2 (görev sistemi) oynanabilir:** Çayır'ın altı kişisinin ana görevleri geldi. Görevi olan kişinin başında "!" ve parlama var (küçük haritada da); konuşunca görev başlar, sağ üstte görev kartı, küçük haritada sarı bölge, kişiye dönerken ok. Bitince görevi verene dön, ödül oracıkta. Kimsede iş yoksa Kemal ya da Zümrüt küçük bir ayak işi verir. Köprü, balık, kamp ateşi gibi henüz Godot'da olmayan şeyleri isteyen görevler o sistemler gelince açılacak. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.45 · 25 Kasım 2026

### Proje
- **Godot, Adım 1d-1 (kişiler ve ustalar) oynanabilir:** Çayır'ın kişileri (Kemal, Zümrüt, Dursun, Durmuş, Nazlı, Börü) kendi yerlerinde; yanlarında F ile konuşma penceresi açılır (dışına basmak "Anladım"). Zümrüt'ün kazanında malzemeyle tarif öğrenilir (+12 XP), Dursun ve Durmuş'un örsünde öğrenilen tarif işçilik ödenerek dövülür. Vio, XP ve seviye ekranda. Görevler sıradaki parçada (1d-2). Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.44 · 25 Kasım 2026

### Proje
- **Godot, Adım 1c (el yapımı) oynanabilir:** Tab ile el yapımı ekranı (bildiğin tarifler, malzemeler ve sendeki adetleri, eksikler, Yap düğmesi), K ile tarif kitabı (web'in 766 tarifinin hepsi, kategori kategori; örste dövülenler ve Usta Sinan'ın kurdukları ayrıca belirtilir). Zümrüt'ün kazanı gelene kadar G tuşu Çayır tariflerini de öğretir. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.43 · 25 Kasım 2026

### Proje
- **Godot, Adım 1b (toplama ve çanta) oynanabilir:** F ile toplama (önce yerdeki eşyalar), ağaç kesme ve meyve silkeleme, kazmayla maden kazma, yere düşen eşyalar (üstünden yürüyünce alınır), çanta (I), 1–5 alet kemeri, aletlerin aşınması, tokluk ve yemek (X). Kemal ve el yapımı gelene kadar G tuşu deneme için Taş balta, Taş kazma ve Taş kılıç verir. Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.42 · 25 Kasım 2026

### Proje
- **Godot, Adım 1 · Çayır başladı; ilk parça (dünya) oynanabilir:** Godot denemesinde artık adanın tamamı var: zemin web'deki ComfyUI dokularıyla (çimen tutamları, kum, su), denizde dalgalar, nehirde akıntı, kıyıda gelip giden köpük, adanın bütün ağaçları ve toplanabilirleri, sağ altta küçük harita. Link aynı: https://bogacavdar.github.io/purple-light/godot-deneme/

### Tasarım belgesi
- Platformlar › Godot'ya geçiş: Adım 1'in altı parçası (dünya, toplama ve çanta, el yapımı, Kemal ve görevleri, Yankı Mağarası, oyunun başı ve kayıt).

---

## Versiyon 4.41 · 25 Kasım 2026

### Görsel
- **Godot denemesinde toplanabilirler web'deki gibi net:** kuru ot, böğürtlen, papatya, taşlar ve öbür toplanabilirler web oyununun çizdiği ayrıntıyla görünüyor (önce oyun dünyasının küçük piksel boyutunda kaydedildikleri için leke gibi duruyorlardı).

---

## Versiyon 4.40 · 25 Kasım 2026

### Tasarım belgesi
- **Godot'ya geçiş başladı:** Platformlar › Godot'ya geçiş bölümü aşamalı, biyom biyom taşıma planına göre yeniden yazıldı (Deneme, Çayır, Orman, Bataklık, Kayalık, Kül Diyarı, ACT 2, Platform). Web sürümü bu sırada yayında kalır; taşınmış biyomlara web'de yalnız hata düzeltmesi ve denge ayarı yapılır.
- **Godot denemesi oynanabilir:** https://bogacavdar.github.io/purple-light/godot-deneme/ adresinde Çayır'ın bir parçası Godot'da: yeni karakterle 8 yön yürüme, koşu, atılma, Tavşan ve Kurt, vuruş; klavye ve oyun kolu.

---

## Versiyon 4.39 · 22 Kasım 2026

### Görsel
- **Karakterler NPC'ler gibi:** oyuncu ve sevdiği kişi, Kemal ve öbür kişiler gibi ComfyUI'de tek parça yeniden çizildi; boyları NPC'ler kadar, gözler ve pembe yanaklar her yönde.
- **Saç her yönde düzgün:** her saç biçimi (erkek: Kısa, Dağınık, Yana taranmış, Dikleştirilmiş, Uzun, At kuyruğu, Kel; kadın: Uzun, At kuyruğu, Örgü, Topuz, Küt, Kısa, İki kuyruk, Kel) karakterin kendi bütün çizimi; artık başın üstüne sonradan eklenmiyor. Yan görünüşteki saçsız kafa ve yüzdeki lekeler gitti.
- **Yüzler** (Sakin, Güler yüzlü, Çilli, Ciddi) ağız, çil ve kaşla ayrılıyor; **elbise** eteğiyle görünüyor.
- Çaprazlarda baş ve gövde öbür yönlerle aynı oranda.
- **Ara sahnelerde** (teknedeki akşam yemeği dahil) yana bakan karakter tam profil yerine hafif dönük duruyor.

### Arayüz
- Karakter yaratmada yüzün büyütülmüş görünümü kaldırıldı; önizleme yalnız tam boy (telefonda da).
- Şapka, gözlük, bıyık, sakal, buff ve saç tokası şimdilik gizli; yeni tarzda çizilip sonraki sürümde geri gelecek. Eski kayıtlardaki seçimler silinmedi.

### Tasarım belgesi
- Sistemler › Oyuncunun karakteri: NPC'ler gibi tek parça çizim, saç biçimleri, yüzler, elbise, ara sahnede hafif dönük duruş. Akış › Karakter yaratma: önizleme.

---

## Versiyon 4.38 · 22 Kasım 2026

### Görsel
- **Canlılar basit ve tatlı tarzda yeniden çizildi (ComfyUI):** Tavşan (uzun dik kulaklar, beyaz ponpon kuyruk), Keklik, Bıldırcın, Kerevit, Porsuk, Kurt, Geyik ve Yaban atı artık kalın hatlı, sevimli ve ilk bakışta tanınan resimler; küçük canlılar okunaklı olsun diye büyütüldü. Yankı Mağarası'nın yarasası, Kör kertenkelesi, Taş örümceği ve Yankı Kraliçesi de aynı tarzda (yarasa kanat çırpar, kertenkele ve örümcek üstten görünür, Kraliçe taçlı; kovalarken gözler kırmızı yanar).

### Tasarım belgesi
- ACT 1 › Çayır › Çayır canlılarının görünüşü; Mağaralar › Yankı Mağarası canlılarının resmi.

---

## Versiyon 4.37 · 22 Kasım 2026

### Görsel
- **Karakterin NPC'lerle aynı boyda:** oyuncu ve sevdiği kişi yeniden çizildi; artık Kemal ve öbür kişiler kadar (30 piksel gövde), büyükçe başlı. Gözler, kaşlar ve ağız dünyada da seçiliyor. Bütün çizimler ComfyUI'den: kadın ve erkek temel gövde beş yönden (sağa bakanlar aynası), saç biçimleri, şapkalar, gözlükler, bıyık ve sakallar, yüzler, elbise, buff ve çiçek toka bu gövdenin üstüne ayrı ayrı çizildi.
- **Net 8 yönlü adımlama:** her yönde bir duruş ve dört adım karesi. Bacaklar artık eğilip bükülmüyor; uyluk ve baldır iki parça halinde öne-arkaya kayıyor, adım atmayan ayak kalkıyor. Çaprazda ve yanda yakın bacak uzak bacağın önünde, arada koyu bir çizgi var; bacaklar birbirine karışmıyor.
- **Her seçim karakterin üstünde görünür:** saç biçimi, saç rengi (kaş, bıyık ve sakal da aynı renkte), ten, göz rengi, tişört/elbise, pantolon, gözlük, şapka ve şapka rengi, bıyık, sakal, buff ve toka her yönde kendi çizimiyle.

### Arayüz
- **Karakter yaratma:** önizlemede karakter tam boy ve yanında yüzü iki kat büyük görünüyor; yüz artık hiç kesilmiyor. Telefonda da aynı.
- **Yeni seçenek "Yüz":** Sakin, Güler yüzlü, Çilli, Ciddi (kaşlar ve ağız yüzle değişir). Rastgele düğmesi yüzü de seçer.

### Kayıtlar
- Eski kayıtlar olduğu gibi açılır; yüz seçimi olmayan karakter "Sakin" yüzle görünür.

### Tasarım belgesi
- Sistemler › Yeni ikonlarla › Oyuncunun karakteri: NPC boyu, ComfyUI katmanları, 8 yön 4 kare yürüyüş, yüz seçimi. Akış › Karakter yaratma: Yüz satırı ve önizleme.

---

