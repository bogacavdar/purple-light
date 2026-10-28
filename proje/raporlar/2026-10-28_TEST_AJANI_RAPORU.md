# Test ajanı raporu · 28 Ekim 2026

Test ajanının (Claude alt ajanı) bu gece yaptığı test: ACT 1'in tamamı ve genel konular. ACT 2 testi ve Boğaç'ın 1–4. maddeleri **Ana oturum raporu**nda.

> Test: 28 Ekim 2026, gece. Başlangıç sürümü **Versiyon 1.75**, bitiş **Versiyon 1.80** (depo `main`).
> **ACT 2 ve Boğaç'ın 1., 2., 3. maddeleri:** ana oturum test etti → **bkz. Ana oturum raporu**.
> Kayıtlar (yüklemek için `?debug` ile aç, `__ham.ev('applyState('+json+')')`): `/home/claude/qa/saves/01_after_tutorial.json`, `02_main_done.json`, `03_paused_cift_vurus_dersi.json` (kilitli ders), `04_v179_after_fixes.json`, `05_before_act2.json` (ACT 1 tamam, Levent'in "Götür beni" teklifi önünde).

## 1. Özet
- **Bu ajanın bulduğu: 24 hata/sorun** — Yüksek 2, Orta 6, Düşük 16. Ayrıca ana oturumun bildirdiği 2 madde (kötü son yok; tarla portalı) doğrulandı.
- **Düzeltilen: 8** (hepsi **v1.79**'da; 2 Yüksek + 4 Orta + 2 Düşük). Tarla portalı (Boğaç 4) ana oturumun düzeltmesi, v1.79 commit'imin içinde gitti.
- **Gönderilen sürüm (bu ajan): v1.79** (`8138e77`). Ana oturum v1.76, v1.77, v1.78, v1.80'i gönderdi.
- Kritik (oyunu durduran) hata: ACT 1'de bulunmadı. En ağır olan, Börü'nün Çift vuruş dersinin bitirilemez hâle gelmesiydi (Yüksek, düzeltildi).
- Konsol: bütün oyun boyunca **hiç `pageerror` yok**; yalnızca çevrimdışı ortamda dış kaynak yüklenemedi hatası ve Canvas/WebGL performans uyarıları.
- ACT 1'in tamamı oynandı: öğretici, Ekin'in 14 ana görevi, **41 yan görevin hepsi**, Börü'nün **7 dersinin hepsi (Ulti dahil)**, Levent'in ACT 2 teklifine kadar.

## 2. Boğaç'ın 6 maddesi
| # | Madde | Durum | Kanıt / sebep / düzeltme |
|---|---|---|---|
| 1 | Gece ev içine sandalye koyamama | Ana oturum | Bkz. Ana oturum raporu (v1.79'da masaüstü ve telefonda yeniden üretilemedi; gece oda simsiyah olduğu için eşya görünmüyor; telefonda döşeme paneli odanın üst sırasını örtüyor). |
| 2 | ACT 2'de NPC'lere tıklayamama | Ana oturum (v1.77'de düzeltildi) | ACT 1 karşılığı: E, kişinin yanında toplanabilir bir şey varsa önce onu topluyor (Ekin'in yanında dal, Levent'in yanında çakıl). Kişiye **tıklamak** her zaman konuşmayı açıyor, düğüm bitince E de konuşuyor; ACT 1'de kalıcı bir kilit yok. Bu kural belgede (B4) bilinçli. |
| 3 | ACT 2'de haritada NPC'leri görememe | Ana oturum (v1.77'de düzeltildi) | — |
| 4 | Tarlanın ortasındaki portal | **Düzeldi (v1.79)** | Ana oturum doğruladı: Hasan'ın portalı (1266,3284) tarla parsellerinin ortasındaydı. `pClear` (v76) tarla parsellerinden 26 px uzak tutuyor; portal artık (1266,3242). Ben gerçek tarlada tırmık→ek→sula→biç döngüsünü sorunsuz oynadım. |
| 5 | Kerevit kapanından kerevit gelmemesi | **Düzeldi (v1.79)** | Gerçek oyunda Çayır'daki nehre kurulan balık kapanından **15 avda 0 kerevit** (Alabalık, Levrek, Sazan, Kızılkanat, Midye, Yılan balığı, Çapak — "alakasız bir sürü şey"); büyük nehrin doğu yakasına (bölge 1) kurulan kapandan **15 avda 3 kerevit**. Sebep: Börü "bataklıktaki suya bırak" derken görevin **"Nerede" satırı Çayır** diyordu (satır kerevit *hayvanının* yaşadığı Çayır kumsalından hesaplanıyordu, kapan avından değil); `FISHT[0]` (nehrin batısı) listesinde kerevit yok. Belge "kerevit yalnız Bataklık/Kayalık Dağ suları" diyor; kod belgeye uyduruldu: **"Nerede" satırı artık Bataklık**'ı gösterir (v150, `q.id==='a2'`). Kapan av olasılığı belgedeki gibi (bir boşaltmada ~%27; bir av 130–250 sn → ortalama ~8–11 dk gerçek zaman). 6 tuzak sınırı belgede yazılı, bilinçli. |
| 6 | Börü'nün görevleri/dersleri, öğreticide Reis | **Düzeldi (v1.79)** | Börü'nün 5 yan görevi sorunsuz. Bulunanlar: (a) **Çift vuruş dersi kilitleniyordu**: ders başına 16 alıştırma canavarı sınırı (`spawnFoe`, `FOE.n>=16`) dolunca yeni canavar gelmiyordu; "Tek vuruşta öldür" hilesi alıştırma canavarını ilk darbede öldürdüğü için "çift vuruşla bitir" sayılmıyor, sınır çabuk doluyordu → sınır kalktı, hile alıştırma canavarına işlemiyor. (b) **Ders sırasında Reis gelebiliyordu**: ders içinde vahşi kurt öldürmek Kurt sayacını 8→10 yaptı; `bossCheck` ders sırasında açıktı → artık ders sürerken Reis beklemede, ders bitince geliyor (denendi: Kurt Reisi dersten çıkınca geldi). Asıl öğreticide (`tz>0`) Reis zaten kodla engelli; Boğaç'ın "öğretici sırasında Reis" dediği büyük ihtimalle Börü'nün dersi. (c) **"Derse dön"** oyuncuyu 280'lik sınırın dibine (230 px) koyuyordu; bir takla soruyu yeniden açıyor, 230 px tasmalı canavar 230–280 arasındaki oyuncuya ulaşamıyor, takla adımı hiç ilerlemiyordu → artık 140 px. (d) "Sana şu kurdun getirdim" dil hatası ve yanlış "öğreteceğim bir şey yok" başlığı düzeltildi. **Düzeltmeden sonra 7 dersin 7'si de bitti, Ulti dahil** (Ulti hiç test edilmemişti: Kara ejder öldürüldü, ders açıldı, R ile 3 ulti isabeti ~60 sn). |

## 3. Bulunan hatalar
| No | Yer | Önem | Nasıl tekrarlanır | Beklenen / olan | Durum |
|---|---|---|---|---|---|
| H1 | ACT 1 · Börü · Çift vuruş dersi | Yüksek | Tek vuruş hilesi açık (ya da düz vuruşla) "2 canavarı çift vuruşla bitir" adımında domuzları öldür. | 16 canavardan sonra hiç canavar gelmiyor, ders bitirilemiyor (yalnız Börü → Dersi yeniden anlat → Anladım ile tek tek). | **Düzeltildi v1.79** |
| H2 | ACT 1 · Börü "Kapan ustası" | Yüksek | Görevi al, "Nerede: Çayır"a güvenip Çayır nehrine kapan kur. | Hiç kerevit gelmez. | **Düzeltildi v1.79** (Nerede: Bataklık) |
| H3 | Börü dersleri · Reis | Orta | Ders sürerken yakındaki vahşi hayvanları avla. | Ders ortasında Reis çıkabiliyordu. | **Düzeltildi v1.79** |
| H4 | Börü dersleri · alan | Orta | Takla adımında kenara takla at, "Derse dön". | Soru tekrar tekrar çıkıyor; kenarda duran oyuncuya canavar saldırmıyor. | **Düzeltildi v1.79** (140 px) |
| H5 | Ekin "Kamp kur, bir gece bekle" | Orta | Gece kamp ateşinin başında 60 sn hiçbir şeye dokunmadan bekle. | Sayaç 61'e çıktı ama kart 0/60'da kaldı, görev tamamlanmadı (bir dal toplayınca birden tamamlandı). `tickCamps` `renderTut` çağırmıyordu. | **Düzeltildi v1.79** (denendi: 58/60 → Tamamlandı kendiliğinden) |
| H6 | Kayıt yükleme · envanter | Orta | Bir eşyayı sıfıra indir, ana menüye çık, Devam et, yine topla. | Envanterde Dal, Lif, Yaprak, Taş… iki kez listeleniyordu (`cleanSave` 0'ları `inv`'den atıyor, `order`'da bırakıyor; `gain` yeniden ekliyor). | **Düzeltildi v1.79** |
| H7 | Börü ders metni | Düşük | Bir derse "Hazırım". | "Sana şu kurdun / yaban domuzunun getirdim". | **Düzeltildi v1.79** ("Sana bir kurt getirdim") |
| H8 | Börü ders listesi | Düşük | Bir dersi bitir, "Yeni ders". | 5 ders alınabilirken "Şimdilik sana öğreteceğim yeni bir şey yok". | **Düzeltildi v1.79** |
| H9 | Levent'in görevi (ACT 1 sonu) | Orta | Ekin'in 14. görevini bitir, Levent'in görevleri sürerken ya da gemi hazırken bak. | Görev kartı "Levent ile konuş" diyor, yol oku hâlâ "Yaşlı Ekin 512 m"i gösteriyor (Levent yanımızdayken). | Açık |
| H10 | Bayılma · başarım | Düşük | Gündüz bir hayvana yenil, bayıl. | `deaths` artmıyor; "İlk düşüş" metni "öl ya da bayıl" diyor ama yalnızca gece mor ışıkla ölüm sayılıyor (belgede #12). Gece ölümüyle "İlk düşüş" ve "İnatçı" kazanıldı. | Açık |
| H11 | Yan görev teslimi | Düşük | Bir görevi teslim et. | Teşekkür diyaloğunda hem "Başka iş var mı?" hem "❗ Senin için bir işim var: …" aynı anda. | Açık |
| H12 | Karakter penceresi | Düşük | Seviye 50'de C. | "0 / Infinity XP · sonraki seviyeye Infinity XP", "SV. 51". | Açık |
| H13 | Ayarlar | Düşük | Oyun içinde Ayarlar'ı aç. | Ayarlar açıkken saat akıyor (3 sn'de ~5 oyun dk). Müzik/çözünürlük düğmelerinde yazı kesik ("Bölgey", "Derinli", "Otoma", "Yüksel"). | Açık |
| H14 | Ana menü / hile paneli | Düşük | Kayıtlı oyunla ana menü; oyunda hile paneli açık. | Logo "Devam et" düğmesine biniyor. Hile paneli görev kartı ve başarım bildiriminin altında kalıyor; panel dünyanın üstünde durduğu için savaşırken yanlışlıkla "Günü bitir"e tıklanabiliyor (bende 100 gün atladı). | Açık |
| H15 | Öğretici · meşale | Düşük | Öğreticide meşaleyi sabah ele al. | 170 sn yanma gündüz de tükeniyor; öğlen sönüyor (akşam ayrıca hatırlatma var). | Açık (tasarım) |
| H16 | Ekin "Koşmak" mini dersi | Düşük | Tanrı modu açıkken koş. | Enerji düşmediği için ders bitmez (hile etkileşimi). | Açık |
| H17 | Nazlı "Tezgâh için otlar" | Düşük | Görevi al. | Nazlı "Çayır yerlerinde bolca olur" diyor; "Nerede" satırı Kayalık Dağ. | Açık |
| H18 | Hasan'ın tırmık sözü | Düşük | Hasan → "Nereden başlayayım?" | "Parçalarını Zümrüt'ün kazanında yaparsın" (artık parçalar Tab ile elde yapılıyor). | Açık |
| H19 | Börü · süren ders | Düşük | Ders sürerken Börü → Dövüş dersi (sürüyor). | Menüde "Dersi bırak" yok; yalnız alandan çıkıp soruya "Evet" denerek bırakılıyor. "Dersi yeniden anlat" metni sıralı olmayan derslerde de "Ders (sırayla)" diyor. | Açık |
| H20 | Kemal'in selamı | Düşük | Atölye görevi bittikten sonra Kemal'le konuş. | "Atölye kurmak mı? Tarifi bildin mi önce, ona bak." her seferinde. | Açık |
| H21 | Levent menüsü | Düşük | Levent ile konuş. | "Hoşça kal" ilk sırada, "Tamam" sonda. | Açık |
| H22 | Karakter yaratma | Düşük | Yeni oyun. | Alt "Geri/Devam" çubuğu son satırları (Pantolon, Gözlük) yarı örtüyor. | Açık |
| H23 | `gain` / hile | Düşük | Fiyatı olmayan bir adla `gain` + "İlk keşif ödülü" yeteneği. | Sikke `NaN` oluyor. Oyundaki 825 tarifin ve bütün ganimetlerin fiyatı var (kontrol edildi); yalnız hile/elle ad yazınca olur. | Açık (koruma önerilir) |
| H24 | E önceliği (ACT 1) | Düşük | Ekin, Levent, Dursun'un yanında bir taş/dal varken E. | E önce düğümü topluyor; kişiye tıklayınca konuşuluyor. Belgede bilinçli kural (v48 B4); ACT 2'de v1.77'de kişiler öne alındı, ACT 1'de değil. | Açık (karar Boğaç'ın) |

Ana oturumdan gelip doğrulananlar: **kötü son yok** (aşağıda), **tarla portalı** (düzeldi). "Mor ışık tanrı modunda da öldürür" **bilinçli karar** (Boğaç), hata değil.

## 4. Yapılamayanlar
- **"Yalnız dönüş" (kotuson) ve dolayısıyla "Platin":** `window.__plBadEnd`'i true yapan kod yok, kötü son yazılmamış (belgede de yazılı).
- **Bayılmayla "İlk düşüş":** yapılamaz; yalnız gece mor ışık ölümü sayılıyor (H10). Başarım yine de gece ölümüyle kazanılabiliyor.
- **"Kesesi dolu" (zengin):** "Sınırsız sikke" hilesi açıkken kazanılamaz (bilinçli). Ben hile kapalıyken geçerken kazandım.
- **İki adalık başarımlar** (toplatum, madentum, agactum, canlitum, dusentum, reishep, tariftum, ani'nin ACT 2 parçası): ACT 1 tek başına yetmez; ACT 2 için bkz. Ana oturum raporu.
- v1.79'dan önce: Çift vuruş dersi hileyle bitirilemez hâle geliyordu; Kapan ustası Çayır'da yapılamıyordu (ikisi de düzeldi).

## 5. Başarımlar (ACT 1 oturumu, 28 / 41)
| Başarım | Kazanıldı | Nasıl / neden |
|---|---|---|
| hile (Oyunlardaki gibi) | ✓ | Ana menüde "cheat" yazarak (gerçek klavye) |
| tarif1, tarif25, tarif100, tarif250 | ✓ | İlk tarif kazanda gerçek; gerisi toplu öğretme (ev) |
| gece1, hafta, ay | ✓ | Gün ilerledikçe (hile paneliyle zaman) |
| av1, kurt | ✓ | Gerçek vuruşla |
| kopru, kaya, iz | ✓ | Ekin'in ana görevleri |
| lvl10, lvl25 | ✓ | "Seviyeyi en üste çıkar" hilesi |
| kesif | ✓ | "Haritayı aç" hilesi |
| zengin | ✓ | Sınırsız sikke kapalıyken sikke > 1000 |
| gorev10 | ✓ | 41 yan görev |
| levent | ✓ | Levent'in gemisi |
| ejder | ✓ | Kara ejder (tek vuruş hilesi) |
| balik | ✓ | Gerçek olta mini oyunu, 10 balık |
| kopek | ✓ | Yıldızsız Gezgin'den robot köpek (gerçek diyalog) |
| olum1, olum5 | ✓ | Gece ışıksız kalıp mor ışıkla 5 ölüm |
| reis1, reis5, reis10, reis20 | ✓ | ACT 1'in 34 türünün Reisi (oyunun `spawnBoss`'u + tek vuruş) |
| ani | ✗ | 11/17 anı; kalanları rastgele (uyku/bayılma/görev) ve ACT 2 görevleri |
| tariftum | ✗ | ACT 2 tarifleri gerekir |
| toplatum, madentum, agactum, canlitum, dusentum | ✗ | İki ada gerekir |
| reishep | ✗ | ACT 2 Reisleri gerekir |
| roket, act2, iyison | ✗ | ACT 2 (ana oturum) |
| kotuson, platin | ✗ | **İmkânsız** (kötü son yok) |

## 6. Test edilenler ve yolu
| Ne | Yol |
|---|---|
| Ana menü "cheat", yeni oyun, karakter, zorluk, giriş sahnesi, ad verme | Gerçek tıklama/klavye |
| Öğreticinin bütün adımları (böğürtlen, yeme, kazanda tarif, Tab el yapımı, envanterden kuşağa sürükleme, keskin taş, Nazlı'da satış, Börü kerevit, balta parçaları, Dursun örsü) | Gerçek tıklama, E, Tab, I, sayı tuşları, fare sürükleme |
| Ayarlar'dan hileler, hile paneli eşya arama | Gerçek tıklama |
| Ekin 1–14 | 5 odun, köprü, yetenek ağacı, Koşmak, kamp ateşi kurma, kazma ile maden, Tab ile külçe, Durmuş'ta zırh dövme + giyme, Doğu geçidi, lav kertenkelesi, izler: gerçek etkileşim; malzemeler/tarifler kısmen hile/ev() |
| 41 yan görev | Konuşma, kabul, teslim, "Başka iş var mı?" hep gerçek diyalog düğmeleri; getirme malzemeleri hileyle; av görevleri gerçek vuruş (hayvanlar ev() ile yakına çıkarıldı); Nazlı'ya gerçek satış; Dursun/Durmuş örsünde gerçek dövme; Kemal'e atölye/çit yaptırıp "Eline al" + tıklama ile yere koyma; Rıza'dan barınak ve Ahşap ev; barınakta gece E ile uyuma; Kamış çizme Tab'la; Nuri'ye teslim |
| Hasan'ın tarlası | 4 alet Dursun'da gerçek dövme; tırmık→ek→sula→60 sn→tırpan E ile |
| Kerevit kapanı | Kapan Dursun'da dövüldü, E ile suya bırakıldı (iki bölgede); av süresi ev() ile kısaltıldı |
| Börü'nün 7 dersi (Ulti dahil) | Sayfa içinde çalışan bot, oyunun kendi klavye/fare olaylarıyla (Boşluk, Q, sol/sağ tık, basılı tutma, R) |
| Balık tutma | Olta, E, Boşluk mini oyunu (gerçek tuş olayları) |
| Robot köpek | Yıldızsız Gezgin ile gerçek diyalog |
| Ölüm/bayılma | Gece ışıksız bekleme; hp=1 + kurt saldırısı |
| Reisler | Oyunun `__p4.spawnBoss` + tek vuruş |
| Kaydet → yükle | Esc → Oyunu kaydet → Kayıt 2; sayfa yenilendi; ana menü → Yükle → Kayıt 2: görevler, dersler, gün, köpek, kurulu yapılar, zırh, başarımlar korundu |
| v1.79 düzeltmeleri | Kilitli ders kaydından (03) devam edilerek tarayıcıda tek tek doğrulandı; chk.js 0 hata; v48_bugs.js FAIL listesi v1.78 ile aynı (eski testler) |

## 7. Eklenen hileler, değiştirilen dosyalar, commitler
- Hile eklenmedi (mevcut panel ve ev() yeterli oldu).
- **v1.79** (`8138e77`): `index.html`, `proje/Hammadde_prototip.html` (aynı değişiklik), `proje/Hammadde_tasarim_belgesi.md` (önce belge: Börü dersleri, Reisler, Kapan ustası, portallar, görevler), `proje/DEVAM_NOTU.md`. Kod: `spawnFoe` sınırı, v155 tek vuruş `!a.ders`, `window.__plLessonOn` + `bossCheck`/`tickBossQ`, `pushBack` 140 px, ders metni ve başlığı, v150 a2 Nerede, `tickCamps` → `renderTut`, `gain` → `order` tekrarı yok. Ana oturumun `pClear` tarla düzeltmesi de bu commit'te.
- Test araçları (depoda değil): `/home/claude/qa/srv.js`, `helpers.js`, `bot.js`, `side.js`, `patch179.py`.

## 8. Telefon görünümü
- Bu ajan denemedi; iş bölümüyle ana oturuma geçti (ev içi döşeme ve ACT 2 telefonda denendi) → bkz. Ana oturum raporu.
