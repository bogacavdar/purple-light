# Bilinen açıklar ve tutarsızlıklar

Belge hazırlanırken kodda görülenler. Oyun testinde doğrulananlar ve düzeltilenler ayrı test raporunda.

| # | Konu | Ne oluyor | Öneri |
|---|---|---|---|
| 1 | Kerevit kapanı | Börü'nün "Kapan ustası" görevi "Nerede: Çayır" diyordu; kapana kerevit yalnızca Bataklık/Kayalık Dağ sularında girer. | **Düzeltildi v1.79:** Nerede satırı Bataklık. |
| 2 | Kötü son | "Yalnız dönüş" başarımı ve dolayısıyla "Platin" kazanılamaz; kötü son yok. | Kötü son yazılana kadar başarımı gizle ya da Platin'den çıkar. |
| 3 | ACT 2'den dönüş | Birinci adaya dönmenin tek yolu portaldı; portal Ülker'in 3. görevi bitince açılıyordu ve o görev yalnızca birinci adada bulunan malzemeler istiyor. | **Düzeltildi v1.76:** Levent ve Ekin portalları ikinci adaya varınca hep açık. |
| 4 | Meyve ağacı odunu | Elma, Armut, Erik ağaçları kesilebiliyor; verdikleri odunun fiyatı yok, hiçbir tarifte kullanılmıyor. | Fiyat ve "Herhangi odun" grubuna ekle ya da meyve ağaçlarını yine kesilmez yap. |
| 5 | Tüccar Nuri'nin tarifleri | Tarif satış kodu var ama menüden açılmıyor; Zümrüt "tüccardan tarif alabilirsin" diyor. | Menüye ekle ya da Zümrüt'ün sözünü değiştir. |
| 6 | Hasan'ın tohumları | Tohum dükkânı açılmıyor; Hasan bir yerde "satarım" bir yerde "satmam" diyor. | Karar ver, metni düzelt. |
| 7 | Ev fiyatları | Rıza alt fiyat kuralıyla satıyor: Taş ev 4.049 (arsanın ipucu metni 2.500 diyor), Deri çadır (Sv 3) 1.039 ile Kulübe'den (Sv 4, 510) pahalı. | Ev fiyatlarını alt fiyat kuralından muaf tut. |
| 8 | Gemi malzemesi | Gemi malzemeleri iki kez harcanıyor (kazanda öğrenirken ve Levent'in son görevinde). | Ya tarifi öğrenmeyi kaldır ya da görevi "gemiyi getir" yap. |
| 9 | Küçük tutarsızlıklar | Öğreticinin 13. adımında örste her şey bedava; Hasan yalnızca adı "Taş kazma" olan kazmayı kabul ediyor; Ekin'in 3. görevi "100 sikke" diyor ama yalnızca yetenek alınmış mı bakıyor; Nuri'nin ilk siparişi XP'yi iki kez veriyor. | — |
| 10 | Ölü kod | Kaptan Poyraz, Balıkçı Rüstem, Sisli Ada ve sal sonu kodda duruyor ama çalışmıyor. Son Ekin görevinde iskelenin üstüne hâlâ sal oku çiziliyor; Rüstem'in kıyısında kimsesiz bir ateş yanıyor. | Temizlik. |
| 11 | ACT 2'de ACT 1 gezginleri | Işıkçı ve Nuri'nin gemisi ikinci adada birinci adanın koordinatlarında çıkıyordu. | **Düzeltildi v1.77.** |
| 11b | ACT 2 kişileri | Haritada yoktular; Pervin ve Tuna ile yanlarındaki bitki yüzünden E ile konuşulamıyordu. | **Düzeltildi v1.77.** |
| 12 | Ölüm sayacı | "İlk düşüş" ve "İnatçı" "öl ya da bayıl" diyor ama yalnızca gece mor ışıkla ölmek sayılıyor. | Bayılmada da sayacı artır. |
| 13 | Çevik atılma | Yeteneğin "kısa bekleme" kısmı çalışmıyor (takla beklemesi hep 0,68 sn); enerji indirimi çalışıyor. | Beklemeyi yeteneğe göre ayarla. |
| 14 | Kalın deri | Açıklaması "zehir, yanık ve çiğ et %40 az" diyor; zehir ve yanığı azaltmıyor, yalnızca çiğ et ve diken hasarını azaltıyor. | Etkiye bağla ya da metni düzelt. |
| 15 | Balık ve tuzak bölgeleri | Tablolar 6 biyoma değil 3 kuşağa göre: Kayalık Dağ'da bataklık balıkları, Mor Kristal Vadisi'nde Kül Diyarı balıkları çıkıyor; ACT 2'ye özel balık yok. | Biyom başına tablo. |
| 16 | Şanslı müşteri II | "Hepsini sat"ta hesaba katılmıyor. | – |
| 17 | Ev lambaları | Evin içi her zaman güvenli olduğu için lambaların işlevi yok, ama metinleri "mor ışık içeri giremez" diyor. | Lambaya başka bir işlev ver ya da metni değiştir. |
| 18 | İşlevsiz aletler | Sapan, Bola, Porsuk yayı, Dişbudak yayı "tuzak" türünde ama kurulamıyor ve silah olarak da kullanılmıyor. | Bir işlev ver ya da tariflerden çıkar. |
| 19 | Metinler | Zor modda "Dene" sonrası metin eski akışı anlatıyor; "Oyunlardaki gibi" başarımı telefonda yanlış hareketi tarif ediyor. | Metin düzeltmesi. |
| 20 | Yol oku (ACT 1 sonu) | Levent'in görevleri sürerken görev kartı "Levent ile konuş" diyor ama yol oku hâlâ Yaşlı Ekin'i gösteriyor. | Ok Levent'i göstermeli. |
| 21 | Arayüz | Oyun içi Ayarlar açıkken saat akıyor; Ayarlar düğme yazıları kesik ("Derinli", "Otoma"); ana menüde logo "Devam et"e biniyor; karakter yaratmada alt çubuk son satırları örtüyor; seviye 50'de "0 / Infinity XP · SV. 51". | Düzeltme. |
| 22 | Hile paneli | Panel dünyanın üstünde ve görev kartının altında; savaşırken yanlışlıkla "Günü bitir"e tıklanabiliyor (testte 100 gün atlandı). | Paneli kenara al ya da onay iste. |
| 23 | Diyaloglar | Teslimde hem "Başka iş var mı?" hem "❗ Senin için bir işim var" aynı anda çıkıyor; Kemal görev bitince de "Atölye kurmak mı?" diyor; Levent'te "Hoşça kal" ilk sırada; Börü'de süren dersi bırakma seçeneği yok. | Düzeltme. |
| 24 | Eski metinler | Nazlı "otlar Çayır'da bolca olur" diyor, Nerede satırı Kayalık Dağ; Hasan "parçalarını Zümrüt'ün kazanında yaparsın" diyor (artık parçalar el yapımı). | Metin düzeltmesi. |
| 25 | E önceliği (ACT 1) | ACT 1 kişilerinin yanında bir taş/dal varken E önce onu topluyor (ACT 2'de v1.77'de kişiler öne alındı). Kişiye tıklamak her zaman çalışıyor. | Karar: ACT 1'de de kişi öne alınsın mı? |
| 26 | Ev içi gece | Gece lambasız oda neredeyse simsiyah; konan eşya görünmüyor ("sandalye koyamadım" hissi). Telefonda döşeme paneli odanın üst sırasını, masaüstünde görev kartı panelin bir kısmını örtüyor. | Gece odaya hafif bir ışık; panel yerleşimi. |
| 27 | ACT 2 zorluğu | ACT 2'nin "Güvenli" biyomlarındaki canavarlar bile çok güçlü (Bulut koyunu 1.200 can, Goblin 2.580 can / 343 hasar); ACT 1 sonu ekipmanla bir goblin 1 dakikadan uzun sürüyor. | Denge kararı (Boğaç). |
| 28 | ACT 2 küçükleri | Ülker'in kazanının başlığı "Cadının kazanı"; hileyle geçişte görev kartı Ekin'i gösteriyor ve köprü/geçit başarımları bedava geliyor; Tabanca yakın hedefte ıskalayabiliyor (belirsiz). | Düzeltme. |
| 29 | Meşale (öğretici) | Sabah yakılan meşale gündüz de yanıp öğlen sönüyor. | Tasarım kararı. |
