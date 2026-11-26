# Purple Light · Güncelleme notları

En yeni sürüm en üstte. Her sürümde **bütün** değişiklikler yazılır: oynanış, görsel, ses, arayüz, tasarım belgesi ve proje/araçlar.

- Oyun: https://bogacavdar.github.io/purple-light/
- Belge: https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.md
- Bu notlar: https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html · https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.pdf

---

## Versiyon 4.61 · 26 Kasım 2026

### Proje
- **Godot: karakter penceresi, zırh ve seviye puanları:**
  - C ile açılan karakter penceresinde yedi kuşanma yuvası var; giysi, silah, kolye ve yüzük giyiliyor.
  - Zırh ve savunma hayvanların hasarını azaltıyor; zırhların zehir, yanık ve kanama dirençleri işliyor.
  - Her seviye atlayışta seviye puanı geliyor; puanlar toplama, satış, şans, güç, hız, can, enerji ve zırh gibi özelliklere veriliyor. Verilmemiş puan varken seviyenin yanında "N puan ver" düğmesi duruyor; ilk seviyede bunu anlatan bir kart açılıyor.
  - Elin boşken vuruşlar silah yuvasındaki silahla yapılıyor. Bütün kılıç, gürz, topuz ve mızraklar web'deki hasarlarıyla geldi.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.60 · 26 Kasım 2026

### Proje
- **Godot: Orman'ın kişileri:**
  - Cadı Yakut (kırmızı kazan), Silahçı Durdu, Zırhçı Duran, Pazarcı Fidan ve Usta Sinan web'deki yerlerinde.
  - Kuzenlerle web'deki gibi tanışılıyor ("Dursun? Örsünü buraya mı taşıdın?"). Durdu ve Duran tanışınca imza silah ve zırhlarının tarifini kitaba yazıyor.
  - Örsler artık kademeyle dövüyor: Dursun ve Durmuş Çayır kademesini, Durdu ve Duran Orman'a kadarını. Örs, dövemediği tarifleri kimin dövebileceğini söylüyor.
  - Yakut, Durdu, Duran, Fidan ve Sinan'ın görevleri geldi. Sinan'ın yapı ve ev isteyen görevleri inşa gelince açılacak.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.59 · 26 Kasım 2026

### Proje
- **Godot: Orman canlıları (Adım 2 başladı):**
  - Orman'da sincap, karaca, kunduz, yaban domuzu (gece), dikenli kirpi, engerek ve oklu kirpi dolaşıyor.
  - Kirpiler diken, engerek zehir atıyor. Atışlardan yana atılarak kaçılıyor; savuşturma onları geri çeviriyor.
  - Zehir ve kanama bir süre can yakıyor; sol üstte kalan süresi görünüyor.
  - Orman canlılarının resimleri şimdilik web'deki çizimler.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.58 · 26 Kasım 2026

### Proje
- **Godot: web oyunundaki kayıt açılıyor:**
  - Aynı tarayıcıda web oyununu oynadıysan Godot'un ana menüsünde "Web oyunundaki kaydı aç" düğmesi çıkıyor. Kayıt seçilince Godot'ta kaldığın yerden sürüyorsun; web kaydın değişmiyor.
  - Taşınanlar: çanta, kemer, Vio, seviye, tarifler, yetenekler, ana görevler, öğretici adımı, gün, görünüş ve adlar.
  - Godot'ta henüz olmayanlar (yan görevler, ACT 2, ev, köpekler, çiftlik) taşınmıyor; web kaydında duruyor.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

---

## Versiyon 4.57 · 26 Kasım 2026

### Proje
- **Godot: öğretici:**
  - Yeni oyunda Kemal'in konuşmasından sonra web'deki 13 adımlı öğretici başlıyor: böğürtlen, Zümrüt'ün kazanı, meşale, keskin taş, Nazlı'da satış, Börü'nün dersleri, taş balta ve Dursun'un örsü.
  - Sağ üstteki kartta ne yapılacağı yazıyor, ok yolu gösteriyor. Eksik malzemeler yakına konuyor.
  - Börü önce kerevite yumrukla vurduruyor. Atılma ve savuşturmanın ilk denemesinde oyun duruyor ve hangi tuşa basılacağını söylüyor.
  - "Eğitimi geç" ile öğretici atlanabiliyor; tarifler, balta ve meşale veriliyor. Öğretici bitince görevler Kemal'den başlıyor.
  - Link: https://bogacavdar.github.io/purple-light/godot-deneme/

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

