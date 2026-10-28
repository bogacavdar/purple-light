# Hammadde — Yeni sohbet için devam notu

## 📥 KURAL: Tasarım belgesi her zaman indirilebilir (28 Ekim 2026, Boğaç)
- belge her güncellendiğinde depo kökündeki indirilebilir kopyalar da aynı commit'te yenilenir: `belge.html` (telefonda ve PC'de açılır, internetsiz çalışır, tablolarda arama var), `belge.pdf` (yazdırmaya/paylaşmaya uygun) ve `belge.md`. Tek komut: depo kökünden `bash proje/tools/belge/yayinla.sh`. Yayındaki adresler (test eden arkadaşlara bunlar gönderilir): https://bogacavdar.github.io/purple-light/belge.html · https://bogacavdar.github.io/purple-light/belge.pdf · https://bogacavdar.github.io/purple-light/belge.md . claude.ai artifact'ı (https://claude.ai/artifact/KAJf8nuvZLFCFfbqx6XBA9) de güncellenir. Güncellemeden sonra Boğaç'a dosyaları ayrıca gönderme; linkler hep günceldir.

## 🟣 KARAR: Mor ışık tanrı modunda da öldürür (28 Ekim 2026, Boğaç)
- Bilinçli tasarım, hata DEĞİL: oyunun adı Mor Işık; tanrı modu (hile) canavar/açlık/zehre karşı korur ama gece ışıksız kalınca mor ışık yine öldürür. Bunu "düzeltme". İleride gizli bir başarım olacak: tanrı modu açıkken mor ışığa ölmek (adı/simgesi henüz yok).

## 📘 KURAL: Önce tasarım belgesi, sonra kod (28 Ekim 2026, Boğaç)
- Tasarım belgesi (`proje/Hammadde_tasarim_belgesi.md` + `proje/Purple_Light_belgeler.html`) güncellenmeden **hiçbir geliştirme yapılmaz**. Sıra: (1) değişikliği önce belgeye yaz (ilgili bölüm, tablo, sayı), (2) sonra kodu belgeye göre değiştir, (3) commit'te belge ve kod birlikte gider. **Belge ile kod çelişirse belge doğru kabul edilir**: kod belgeye uydurulur (belge açıkça yanlışsa önce Boğaç'a sorulur, belge düzeltilir, sonra kod). Hata düzeltmesi bile oyunun davranışını değiştiriyorsa belgedeki ilgili satır aynı commit'te güncellenir. Belgenin aranabilir HTML'i `md`'den üretilir; üretim araçları yoksa `md`'yi güncellemek yeterli, HTML'in eskidiğini DEVAM_NOTU'na yaz.

## 🔢 KURAL: Sürüm adı biçimi (27 Ekim 2026, Boğaç)
- v127'den itibaren ilk rakamdan sonra nokta: 127. sürüm **Versiyon 1.27**, 134. sürüm **Versiyon 1.34**, 200. sürüm **Versiyon 2.00**. Menüdeki `#verlab`, commit mesajı (`v1.27: …`) ve bu dosyadaki başlıklar (`## v1.27 …`) aynı biçimde. Bir sonraki sürüm = son + 0.01. Eski başlıklar (v126 ve öncesi) değişmez.

## 🔁 KURAL: Her güncellemede GitHub da güncellenir
- Depo: https://github.com/bogacavdar/purple-light (dal `main`, ilk gönderim 25 Ekim 2026'da yapıldı; Claude'un yazma izni var).
- Her sürümde, artifact yayınlandıktan sonra **aynı turda** depo da güncellenir: kökteki `index.html` = `Hammadde_prototip.html` + `<link rel="manifest">` ve `apple-touch-icon` satırları (11. satırdan sonra; `github_pages/index.html` ile aynı), `proje/` klasörü = güncel prototip, `recipes3.json`, `DEVAM_NOTU.md`, `Hammadde_tarifler.md`, `Hammadde_tasarim_belgesi.md`, `tests/`.
- Yol: yeni oturumda `add_repo` (bogacavdar/purple-light, push) → `git clone --depth 1` → dosyaları kopyala → commit (Türkçe mesaj, sürüm numarasıyla) → `git push`. Kullanıcıya oyunun adresini hatırlat: https://bogacavdar.github.io/purple-light/
- GitHub Pages ayarını (Settings → Pages → main, /root) oturum açamıyor (API proxy'de kapalı); Boğaç bir kez kendisi açar.

## ⭐ BURADAN BAŞLA (26 Ekim 2026 akşamı, v62)
- Yayındaki sürüm **v65** (v63–v65 notları en altta). v65 harita değişikliğiyle eski kayıtlar bir kez silindi (MAPV 4). Önceki: **v62** (GitHub `main`, https://bogacavdar.github.io/purple-light/). Bu turda v51–v62 yapıldı; ayrıntılar dosyanın sonundaki v51…v62 bölümlerinde.
- Özet: yalnızca Nazlı satar (doğal malzeme), ustalar malzeme + işçilikle yapar, ağırlıklı ganimet · Zırhçı Durmuş · gece 2,5 dk, meşale bir gece, reçine (L) · Işıkçı 15. gün akşamı sabit yerde (takas), köpekçi 5. gün hediye / 20. gün mor sinyal (en çok 5) · NPC görev zincirleri + Görevler paneli (G) + mavi takip · ev içleri ve döşeme (13 Ev eşyası tarifi, 660 tarif) · 7 rastgele anı · telefon performansı (parça parça zemin, otomatik kalite) · ada halkının hikâyeleri ve ara sahneler · en üst seviye 50 · ad girişinde Enter · balta dersi düzeltmeleri.
- Yeni kod blokları `</body>` öncesinde: `v55-q` (görevler), `v56-room` (ev içi), `v57-mem` (anılar), `v58-perf` (performans), `v59-story` (hikâyeler), `v62-axe` (balta dersi). Hepsi `window.__plEval` ile oyunun kapsamında çalışır.
- Çalışma düzeni (Boğaç): test yok, yalnızca `chk.js`; Boğaç kendi test eder. Ajan yok, token önemli. Her adım ayrı sürüm olarak `main`'e gönderilir.
- Sırada: final (gizemin çözülmesi, herkesin kurtarılması, kötü son, bütün NPC görevlerini bitirenlere ayrı son), Boğaç'ın telefon testlerinden gelecek düzeltmeler. Belgeler sayfası: https://claude.ai/artifact/4QA8Uj1R2r7wzthLM4Wesj

## ⭐ Önceki başlangıç (26 Ekim 2026, v48)
- **Çalışma düzeni (Boğaç'ın kararı):** önce geliştir → hızlı kontrol (chk.js 0 hata, `tests/v48_bugs.js` + `tests/v48_ui.js` ALL OK, oyun açılıyor) → hemen `main`'e gönder → sonra kapsamlı test turu, bulunanlar düzeltme sürümüyle.
- **v48 (v48a–v48d, GitHub'da):** QA turu (kayıtta çift `qv` anahtarı görevleri geri sarıyordu, Sisli Ada kayıt koruması, kare hatası dondurmuyor, içe aktarmada XSS, para döngüleri, 117 fiyat, ilk gece affedici, E önce malzeme toplar, zehir F'de yenmez); yeni envanter (sekmeler + atanabilir alet yuvaları: `belt[i]`, `beltSet`, `holdTool`; eşyalar envantere gider, yere düşmez; dokunmatikte basılı tut-sürükle ya da dokun→dokun); kare tarif kitabı (bulunmayan "?"); kazana tek tek / basılı tut hepsi; takip çubuğu + mavi parıltı (`trackRecipe`, kayıtta `b3_trk`); NPC "gel" çağrıları; kilitli NPC ikonları; yemek düğmesi; ağaç tepesi saydamlığı; savaşçı **Börü** (eski Alp; Tolga KULLANILMAZ); karakter: göz rengi, kel, ayrı bıyık/sakal; XP 2 kat yavaş, `MAXLV=100`; kirpi elle vurunca can yakar + Oklu kirpi (Sv8+gün5 ya da Sv10); 8 ağaç, 9 hayvan, 26 bitki/kil → 647/647 tarif yapılabilir; yeni ana menü (ada sahnesi, gündüz-gece, mor ışık gece, 3 düğme, çark/kapı), yeni ikon, 4 müzik (Ada/Sis/Gece/Derinlik), Kontroller menüsü (tuş atama `hammadde.b5.keys.v1`, dokunmatik düğme yerleri `hammadde.b5.layout.v1`), hileler (∞ sikke, en üst seviye, haritayı aç).
- **v49 / v49.1 (26 Ekim, GitHub'da):** ada adı **Yıldızsız Ada** (kayıt anahtarları ve `HAMMADDE1:` öneki aynı); toplanabilirler ve 30 canlı yeniden çizildi (`<script id="v49-p1">` eşya/bitki/maden, `v49-p2` canlılar, `drawAnimal` `a.scale`/`a.tint` destekler); Özellikler'de İstatistikler (`p4_st`); her türün Reisi (av sayısı bolluğa göre, sonraki %50 fazla); vuruş hissi (savuruş izi, isabette donma/sarsıntı, enerji harcayan savuruş, düşman uyarı halkası, atılarak sıyrılma) — hepsi `v49-p4`; öğretici: parıltı nesnenin kendi kenarına oturur (canvas gölgesi), takip çubuğu büyük, öğreticinin istediği hep çubukta, ok yalnızca istenene, örs/kazan satırına dokununca eldeki ara ürün konur ve "+" yalnızca yetmiyorsa çıkar, Tab vurgusu, meşaleyi ele alma adımı (`v49-p3`). Yeni ikon: tepeye inen mor ışık + karanlıkta gözler. Ana menü: büyük logo, rastgele açılı mor ışık, gece gözler.
- **Kod düzeni:** ana kod bir IIFE içinde; v48 eklemeleri `</body>` öncesindeki `<script id="v48-b3|b4|b5">` bloklarında ve `window.__plEval` (`function start(d){` önünde) ile oyunun kapsamında çalışır. Birçok eski fonksiyon bu bloklarda sarmalanmıştır; değişiklik yaparken önce sarmalayıcıya bak. CSS: `<style id="v48-b3-css">`, `<style id="v48-b5-css">`.
- **Açık konular:** Boğaç v48'i oynayıp geri bildirim verecek; XP temposu (Sv5 ≈ 35 dk gerçek oyun) ve erken savaş dengesi gözden geçirilecek; claude.ai artifact'ı v48 ile güncellenmedi (yayın GitHub Pages'te).

## Önceki başlangıç (25 Ekim 2026, v47)
- **v47 (artifact Version 53, GitHub'a gönderildi):** konuşmalar harf harf yazılıyor ve her NPC'nin kendi mırıltı sesi var; karakter ekranında cinsiyete göre saç stilleri, sakal, ince gözlükler, birbirinden farklı şapkalar; NPC'ler oyuncuyla aynı detaylı çizimde (göz kırpma, nefes, sana dönme, küçük efektler); Taş balta adım adım; ilk görev ("Taş balta yap") kalktı; Alp atılmayı öğretiyor ama Atılma artık yetenek (Savaş dalı, 100 sikke), Koşu ondan sonra; enerji barı mavi ve canın altında; 8 dal × 8 yetenek; altın sikke ikonu ve satışa göre büyüyen sikke sesleri; açlıkta mide guruldaması + kırmızı bar; zehirli yiyecekler (yeşil surat, bir kez yiyince öğrenilir); boşta kalan malzemelere 7 yeni tarif; pazarda kazan uyarısı + "Kazanda işe yaramayanları sat"; hotbar'ın solunda el (toplama) düğmesi; haritada büyük NPC ikonları ve oyuncunun kafası; adanın altında deniz payı (HUD karaya binmez).

## Önceki başlangıç (v46)
- **v46 (artifact Version 52, aynı link):** Claude oyunu baştan oynadı, bulduğu hataları düzeltti ve Boğaç'ın onayladığı 9 fikri ekledi: kamp ateşi, balık tutma, tuzaklar/balık kapanı, gece buluntuları (ay çiçeği, mor kıymık, ateş böcekleri), Mavi'nin 5 anısı, Zümrüt'ün bilmeceleri, harita işaretleri, gün sonu özeti ve oynanabilir **Sisli Ada** (final öncesi bölüm). Ayrıntı en altta "v46" bölümünde.
- Boğaç'ın kararı: fiyatların kesirli görünmesi (7,1 sikke) **hata değil**; seviye ve yetenek ağacı fiyatı artırdığı için normal.

## Önceki başlangıç notu (v45)
- **v45 (artifact Version 51):** yeni eğitim akışı, kazan yalnızca tarif öğretir, meyve ağaçları, daha vahşi canavarlar, fareyle ad, harita ikonları/yakınlaştırma/kaydırma, hile: zamanı sar (basılı tut) + Ayarlar'da Gece ışığı.
- **GitHub:** v46 ile depoya gönderildi (bkz. en üstteki KURAL). Oyun adresi: https://bogacavdar.github.io/purple-light/
- **Oyunun adı artık Purple Light** (Türkçe alt başlık: Mor Işık). Ada adı oyun içinde hâlâ Hammadde Adası; dosya adları ve kayıt anahtarları (`hammadde.saves.v1`) eski kayıtlar bozulmasın diye değişmedi. Ana menüde her 7 saniyede bir logonun üstüne mor bir ışık düşer (`.logo.pl`, `plbeam`). Yayındaki sürüm: artifact Version 50.
- **Prototip (link değişmeyecek, hep aynı artifact güncellenir):** https://claude.ai/artifact/ApSQG1LVugQT7M7jbEfoJV — yayındaki sürüm: artifact Version 49 (oyun içi v44). `downloads` yeteneği açık (kayıt dosyası indirme için).
- **Tasarım belgesi (Claude Docs):** https://claude.ai/artifact/RSf9VtWHAewVx6TtRSUtkS — doc id `c5f06e43-7820-4d7c-a944-878ada63128b`; ana sekme gövdesi `6272b036-9d99`, "Fikir otoparkı" sekmesi `7a37f882-4d94`. Son eklenen bölüm: "İkinci perde: metal, bölgeler ve gerçek (v44)".
- **GitHub:** Boğaç'ın hesabı https://github.com/bogacavdar — GitHub Pages + "Ana Ekrana Ekle" yayını için GitHub bağlandı; oturum yeni depo açamıyor. Boğaç `purple-light` adında boş, herkese açık bir depo açınca dosyalar (github_pages/) gönderilecek, sonra Settings → Pages açılacak.
- **Kurallar:** `?.` ve `??` yok (yerine `nn(a,b)`), kod ES2018 ile ayrıştırılarak kontrol edilir (`tests/chk.js`, acorn: `NODE_PATH=/opt/node-tools/node_modules`). Fiyat formülü: malzeme toplamı × (1,15 + 0,05 × min(adım,6)) + aletin %10'u (`build_data.py` mantığı). Zor modda her tarifin malzeme türü seti benzersiz. `?debug` → `window.__ham` (ev(kod) ile her şey çağrılabilir).
- **Çalışma şekli:** Boğaç istekleri madde madde yazar ve "yap" der; Claude yapar, test eder, aynı artifact'a yayınlar, belgeyi ve bu notu günceller, zip verir.
- **Dosyalar:** `Hammadde_prototip.html` (oyun), `recipes3.json` (tarif verisi, 638 tarif; `f` alanı = örste dövülen ama alet olmayan zırhlar), `Hammadde_tarifler.md` (v44 bölümü sonda), `Hammadde_tasarim_belgesi.md/.docx` (eski dışa aktarım; güncel olan Claude Docs), `tests/` (Playwright; `v44_t1..t4.js` yeni: `node tests/v44_t1.js <ekran klasörü> Hammadde_prototip.html`).

### Oyunun şu anki hali (özet)
- Açılış: ana menü (Yeni oyun, Devam, Kayıttan yükle, Ayarlar, **Kayıtları dışa/içe aktar**, Çıkış) → karakter yaratma → zorluk → giriş sahnesi → kumsalda uyanış.
- 18 görev (Ekin): Taş balta → 5 odun → köprü (100 sikke = Koşu'nun fiyatı; koşu dersi burada başlar) → yaprak barınağı → 100 sikke → Sv5 → Tüccar → Usta Kemal → 10 tarif → Sv8 → 25 tarif → **tunç külçesi → tunç alet → Avcı Toygar → demir külçesi → savunma 40 → lav kertenkelesi → 6 iz**. Sonra Sv10: Kaptan Poyraz gelir, **Balıkçı Rüstem**'e yollar (haritanın doğuş yerine en uzak köşesi, Kül Diyarı'nda). Rüstem: 1 Kara pul, 3 Tunç külçesi, 4 Demir levha, 6 Halat, 1 Ejder kemiği + bütün izler → tekneyle **Sisli Ada** = oyun sonu.
- Hikâye: eş kaçırıldı; köpek ve lamba satan yıldızsız uzaylılar gemiye saldırdı, mor ışık onların gemisi. Final uzayda olacak.
- Alet/maden kademeleri (Taş → Granit/Çakmaktaşı → Kuvars/Tunç → Bazalt/Demir → Obsidyen), dayanıklılık yeşilden kırmızıya, 5 alet yuvası (+Alet kemeri dalı 6/7/8/10), yuva doluysa alet yerde kalır, yerdeki eşya 180 sn'de kaybolur.
- Bölge malzemeleri, bataklık çamuru/sisi/sesleri, kül diyarı sesleri, hava durumu, yemek seçim penceresi ve yemek etkileri, keşif defteri (kategori %25/%50/%100), Yıldızsız Işıkçı (5 meşale bitince + 1000 sikke → kafa lambası).

### Açık konular / sıradaki fikirler
- GitHub Pages yayını (Boğaç'ın hesabında depo + erişim) ve PWA manifest; iPhone'da gerçek tam ekran.
- Boğaç v44'ü oynayıp geri bildirim verecek; denge (bölge hasarları, metal fiyatları, kademe süreleri) buna göre ayarlanacak.
- Balık tutma hâlâ yok (balık tarifleri ölü); Sisli Ada ve uzay finali (Fikir otoparkı).
- Yetenek metinlerinde Türkçe karakter hatası için örnek ekran görüntüsü bekleniyor.

---
## Eski notlar (ayrıntı, sürüm sürüm)

Bu notu ve aşağıdaki dosyaları yeni sohbete ekleyip "Hammadde projesine buradan devam ediyoruz" demen yeterli.

## Yön (24 Ekim 2026 kararı)
Oyun artık bir **keşif ve hayatta kalma** oyunu: hayatta kalmak için gereken tarifleri keşfetmek. Örnekler: Dave the Diver, Graveyard Keeper. Belgede bu yön için "Tasarım sütunları", "Hayatta kalma baskıları" ve "Fikir otoparkı" sekmesi var. Yeni fikirler önce otoparka yazılır.

## Proje
- **Oyun:** "Hammadde" (çalışma adı). Tek oyunculu, 2D piksel art, idle / üretim / keşif oyunu. Adada ham madde topla, kazanda çok bileşenli tariflerle birleştir, sat, aletleri ve yetenekleri geliştir. Ölçek sınırsız: taştan galaksiye. Hedef platformlar: Steam, PS, Android, iOS.
- **Dil:** Bütün konuşmalar ve oyun içi metinler Türkçe.
- **Çalışma düzeni:** önce konuş ve planla → tasarım belgesini güncelle → tarayıcı prototipini (tek HTML dosyası) güncelle → Boğaç test edip geri bildirim verir. Hemen kod yazılmaz; büyük değişikliklerden önce fikir konuşulur.
- **Tasarım tercihleri:** büyük ve okunaklı yazılar, ikonlu menüler, ses ve müzik, her şeyin adım adım ve sırayla açılması.

## Dosyalar
- `Hammadde_tasarim_belgesi.md`: tasarım belgesinin son hali (Claude Docs'taki "Hammadde: Oyun Tasarım Belgesi").
- `Hammadde_tarifler.md`: güncel tarif veritabanı (585 tarif, zincir çarpanlı fiyatlar, her tarifin "Adım" sayısı). Belgedeki eski "Taş Çağı tarifleri" sekmesi eski ikili sistemi gösteriyor; bu dosya geçerli olan.
- `recipes3.json`: prototipin kullandığı tarif verisi: `R` (tarifler: r ürün, i malzemeler, t aletler, c kategori), `c` (Herhangi grupları), `p` (fiyatlar), `t` (alet listesi), `seeds`, `crops`.
- `Hammadde_prototip.html`: oynanabilir prototip (tek dosya, tarayıcıda açılır). Yayındaki sürüm: v38.

## Prototipin teknik yapısı
- Tek HTML dosyası. Canvas 2D ile piksel çizim, arayüz DOM ile. Tarif verisi `<script type="application/json" id="db">` içinde.
- Kayıtlar tarayıcının localStorage'ında: 3 elle kayıt yuvası ve otomatik kayıt.
- Ses: OfflineAudioContext ile üretilen lo-fi müzik ve efektler. AudioContext oyuncunun ilk tıklamasında açılır.
- Test için adresin sonuna `?debug` eklenince `window.__ham` açılır: `give(n)`, `add(isim,adet)`, `inv()`, `tut()`, `sk(id)`, `fs()`, `ws()`, `tp('npc'|'witch'|'farmer'|'field')`, `plots()`, `pot()`, `skip()` (eğitimi atla, Meltem'i getir), `judge([malzemeler])` (kazanın deneme cevabı), `learned()`, `open()` (açık tarif sayısı), `price(isim)`, `q(i)` (i. göreve atla), `qs()`, `won()`, `tp('dock')`.
- İndirilip tek başına açılabilmesi için CSS'te `[hidden]{display:none!important}` kuralı olmalı.
- **Eski iPhone uyumu (önemli kural):** Kodda `?.` ve `??` KULLANILMAZ; iOS 13.4'ten eski Safari bunları görünce bütün betiği çalıştırmaz (ekran görünür ama hiçbir düğme çalışmaz). Yerine `nn(a,b)` (a boşsa b), `cl(el)` (varsa tıkla), `cst(el,seçici)` (güvenli closest) yardımcıları var. Kod ES2018 sınırında tutulur; değişiklikten sonra betikleri ES2018/2019 ile ayrıştırarak kontrol et. `flat`, `flatMap`, `Object.fromEntries`, `queueMicrotask` için yedekler başlıkta. Pointer Events yoksa yön tuşları ve E dokunma olaylarıyla çalışır.
- **Dokunmatik kontrol:** `body.joymode` (dokunmatik + Pointer Events) yön tuşlarını ve E'yi gizler. Kanvasta sürükle = joystick (`joy`), dokun/tıkla = `startGoal` → `pickAt` hedefi bulur → `stepGoal` yürütür → `arrive` `interact(hedef)` çağırır. Fare tıklaması da yürür/toplar. Su kenarında mavi damla ipucu (`drawWaterHint`). Joystick halkası çizilmez (görünmez). Telefon eğitimi: 1/5 sürükleyerek yürü (ekranda kayan parmak izi) → dokunarak yürü (`tapMoved`, parmak + halka işareti) → harita → dala dokun (dal ekranda görünmüyorsa karakterin yanına getirilir, üstünde dokunma halkaları).
- **Telefon yatay oynanır:** dikey tutulan telefonda (dokunmatik, genişlik ≤600 px) "Telefonunu yan çevir" ekranı çıkar; "Yine de dikey oyna" o oturum için kapatır, Android'de "Tam ekran ve yatay" düğmesi yönü kilitler. Yatay telefonda (yükseklik ≤520 px) sıkı düzen: solda sikke + görev + 3×2 menü, sağ üstte ayar ve karakter, altta yön tuşları / XP çubuğu / E, üstte geniş ve kısa öğretici kartı; menü açıkken kart iki satıra iner (`body.menuopen`).
- **iPhone/iPad:** iOS'ta dosya önizlemesi (Dosyalar, Mesajlar, Mail, uygulama içi dosya) JavaScript çalıştırmaz; oyun Safari'de bağlantıdan açılmalı (Paylaş → Ana Ekrana Ekle ile tam ekran olur). JS çalışmazsa başlık ekranında kırmızı bir uyarı kalır. Açılışta yakalanan her hata ekranın altında kırmızı kutuda yazılır. Ses Safari için ön ekli `webkitOfflineAudioContext`, 44,1 kHz yedeği ve olay tabanlı render ile üretilir. Sıkıştırarak yakınlaştırma ve sayfa esnemesi kapalı.

## Oyunda şu an olanlar
- **v38 yenilikleri:**
  - **Eğitime iki ders eklendi:**
    - Savaşçı Alp (`alp`, `ftut`, `talkAlp`, `drawAlp`): Ekin'in kampının yanında; yumrukla Kerevit avlatır (`spawnTutCrab`, `ANIM.Kerevit` hareketsiz). `tut===4` bitince başlar, sonra `startWitchLesson()` çalışır.
    - Hızlı yapım dersi (`ctut`): ilk keskin taştan sonra Sopa ve `+` öğretilir.
  - **`+` kuralı:** Yalnızca ✓ (`foundSet`) olan tariflerde çalışır.
  - **Meşale ve gece:**
    - Meşale dersi (`torchTut`): 1. gün 17:30'da başlar. Kaba meşale (yeni tarif, elle yapılır: `handCraft`). GT türü `torch`, `TORCHL` ışık yarıçapı.
    - Zifiri gece (`darkness`, `drawDarkness` maske).
    - İlk gece meşale yoksa korku ve bayılma (`nightScare`, `knockedOut`): aletler dışında her yığının %30'u kaybolur.
  - **Ekin'in kampı:** `wakeSpot` yanına taşındı.
  - **Bildirim kuyruğu:** `annQ`, `lvlFirst`; seviye bildirimi önce gelir.
  - **Can:**
    - Can çubuğu büyüdü.
    - Hasar alınınca kırmızı ekran efekti (`#hurtfx`) ve hasara göre büyüyen -X yazısı (`floats.size`).
    - Yenilenme 5 kat yavaşladı (`hpRe`).
    - Yemek 15 sn boyunca can doldurur (`mealHeal`).
  - **Bilgelik dalı:** Yalnızca Zor modda görünür.
  - **NPC hareketleri:** `idle` nefes alma; Ekin ateşi karıştırır, Zümrüt elinden ateş çıkarır, Hasan tarla kenarında yürür (`tickNPCs`).
  - **Hile paneli:** Hayvan düşürmeleri eklendi; 5×4 görünür, kaydırılır.
  - Toplam 592 tarif.
- **v37 yenilikleri:**
  - **Hayvan mizaçları** (`ANIM[k].temper`):
    - Zararsız (tavşan, sincap, keklik, ördek): kaçar.
    - Nötr (geyik, karaca, Sv4'ten sonra yaban öküzü): vurulursa karşılık verir, uzaklaşınca sakinleşir.
    - Saldırgan (yaban domuzu, kurt).
  - **Rastgele düşürmeler:** `drops: [ad, en az, en çok, ihtimal, tür]`; tür yemek, zırh, silah ya da zanaat olur. Öldürünce kaç tarifin açıldığı yazılır.
  - **Ekipman:** 5 yuva (`equip`: bas, govde, el, ayak, silah), `EQUIP` (savunma ve renk), `wear`, `unwear`. Zırh hayvan hasarını `25/(25+savunma)` katına indirir (`hurt(n, neden, phys)`). Silah yuvası el boşken kullanılır.
  - **Figür:** Özellikler penceresinde figür ve yuvalar (`dollHTML`, `drawDoll`). Giyilenler dünyada da görünür (`eqLook`, `eqOpts`; `drawChibi` miğfer, eldiven ve çarık çizer).
  - **Yeni tarifler:** Kemik miğfer ve Kemik zırh (toplam 591).
- **Sırada (Boğaç onayladı):**
  - v38: aynı adada tehlike seviyeli biyom bölgeleri (kayalık dağ, bataklık, karanlık orman).
  - v39: mor ışık gizemi, gece seviyeye göre yabancı yaratıklar.
- **v36 yenilikleri:**
  - **Açlık:** `food` 100'den 12 dakikada 0'a iner; sıfırda can dakikada 10 azalır. Uyumak 20 tokluk yer; 70'in üstünde can 1,5 kat hızlı dolar. Cadının dersinden sonra başlar (`hungerOn`).
  - **Yemek:** `foodVal` ve `RAWFOOD`; Yiyecek tariflerinde değer fiyattan gelir (10–65). Şifa tarifleri can verir (`healVal`). Çiğ et %35 ihtimalle mideye dokunur. F ya da turuncu çubuk en uygun yemeği yer (`eatBest`); envanterde "Ye" düğmeleri var.
  - **Hayvanlar** (`ANIM`, `animals`, `tickAnimals`, `drawAnimal`):
    - Tavşan ve geyik kaçar.
    - Yaban domuzu ormanda saldırır (9 hasar).
    - Kurt geceleri avlanır (11 hasar, parlayan gözler).
    - Ekin'in kampının 22 kare çevresi güvenli (`SAFE_R`). Hayvanlar oyuncunun çevresinde doğar, uzaklaşınca kaybolur.
  - **Savaş:** Boşluk, tıklama, dokunma ya da E ile saldırılır (`attack`, `weapon`, `WDMG`).
    - Yeni Taş kılıç (örste, 12 hasar; GT türü `sword`, Dursun satar ve biler). İlk saldırıda tarifi kitaba yazılır.
    - Mızraklar 10–28 hasar, balta ve kazma 7, yumruk 3. Hasar seviye başına %3 artar.
    - Av et, deri, diş, kemik ve sinir verir. Toplam 589 tarif.
  - Yeni sesler: `swing`, `hit`, `growl`.
- **v35 yenilikleri:**
  - **Ada alanı 20 kat büyüdü:** `W=322, H=232`, `MAPV=2`. Değer gürültüsüyle (`vnoise`, `fbm`) kıyı, 2 nehir ve 3 göl üretilir. Zemin karo önbelleğinden yalnızca görünen kısım çizilir (`TILEC`, `tvar`, `drawGround`). Ağaçlar ızgarada tutulur (`TGRID`, `treesNear`, `rebuildTG`). Küçük harita oyuncuyu ortalayan bir pencere gösterir.
  - **Yerleşim:** Başlangıç güney kıyısında; Nazlı doğuda, Dursun batıda, Zümrüt batı ormanında, Usta Kemal kuzeybatıda (`usta`, `bench`, `lumber`), Hasan ve tarla kuzeydoğuda uzakta.
  - **Eski kayıtlar:** `mv` farklıysa ilerleme korunur; konum başlangıca, keşif sıfırlanır, yerleştirilenler silinir. `qv` yoksa ve `tut>=15` ise tut +2 kaydırılır (iki yeni görev).
  - **Görevler:** 2. görev Sv 5; 5. görev tüccarın ilk siparişi (`trader.called`, `trader.firstDone`, sabit 5 dal + 5 taş + 3 lif); 6. görev Usta Kemal'i bulmak; 8. görev Sv 8. Toplam 11 görev. Gemi `nextAt=Infinity` ile başlar, görevle çağrılır.
  - **Alet çubuğu:** `hotList`, `hand`, `held`, `useTool(kind)`, `toolHint`, `needTool`. 1–0 tuşları, fare tekerleği, kutuya dokunma; aynı kutu ikinci kez seçilince el boşalır. Alet elde olmadan balta, kürek, kova ve tarla işleri yapılmaz; el doluyken toplanmaz. Eldeki alet `drawHeld` ile çizilir. Hile tuşları Z (+100 sikke) ve X (+100 XP).
  - **Gün döngüsü:** `dayT` dakika cinsinden, 06:00–20:00 8 dk, gece 4 dk. `tickClock`, `skyNow`, `drawSky` (çarpma boyası ve gece ışıkları), `#clock`, `dayBanner`. Yatak (`sleepBed`) yalnızca gece; uyanınca 06:00, can ve enerji dolu.
  - **Usta Kemal:** `talkUsta`, `openUsta`, `renderUsta`, `ustaPrice`. İlk karşılaşmada hediye Hasır yatak verir. Bilinen tarifleri sikkeyle yapar; yapılar (`PLACEABLE`: Yapılar kategorisi ve yataklar) yalnızca onda yapılır, kazanda kaynatılmaz.
  - **Yerleştirme:** `placing`, `startPlace`, `placeOK`, `doPlace`, `rotatePlace` (Q), `cancelPlace` (Esc), `pickUp` (uzun basış), `placed[]` kayıtta `pl`. Kaplanan alan `FOOT`; çarpışma `placedBlock`.
  - **Atölye:** Otomatik üretim binası (`o.ws`, `tickWorkshops`, `renderWorkshop`, `WS_DUR=25`). Yeni tarifler: Hasır yatak, Atölye (toplam 588).
  - **Kazan:** `+` yaptığı şeyi kazana/örse koyar; örste de çalışır. Tarifler kategoriye göre gruplanır (`CATS`, `potCat`); arama ada ya da içindekine göre (`potBy`). Yeni açılan tarif grubunun en altına gelir (`openSeq`, kayıtta `os`).
- **v34 yenilikleri:**
  - Cadının adı **Zümrüt** oldu (eski adı Meltem; ekler: Zümrüt'ün, Zümrüt'e).
  - Saç renkleri: kahraman kahverengi saçlı, kız kızıl saçlı ve açık mavi elbiseli (`LOOK`).
  - **Can** (`hp`, `maxHP`, `hpRegen`): her zaman görünür. Böğürtlen 3, çakmaktaşı 2 can yakar (`HURT`). Can sıfırlanırsa `faint()`: Ekin'in ateşinde can yarıyla uyanırsın, kayıp yok.
  - **Enerji** (`st`, `maxSt`, `stRegen`) ve **koşu**: Shift, telefonda çift dokunuş (`joy.run`, `goal.run`). `wantsRun`, `tickVitals`, `renderVitals` ve `#vitals` çubukları; enerji biterse `tired`. Değerler seviyeyle büyür (`STAT.hp/hpRe/st/stRe`).
  - Yeni dallar: **Dayanıklılık** (K1 Koşu lv10/100 sikke, K2–K6) ve **Sağlık** (C1–C5). Yetenekler `lv` alanıyla kendi seviye şartını taşır (`lvOf`).
  - Seviye 10'da Ekin'in koşu dersi (`runTut` 1 → 2 → 3, `checkRunLesson`): Koşu'yu al, enerji yarının altına inene kadar koş, Anladım.
  - Kazanda bileşen kısayolu: alt tarifi olan bileşenin yanında **+** (`subRecipe`, `canQuick`, `quickBrew`). Eksikse kırmızı ipucu (`missingFor`). Tarif listesinde elde kaç tane olduğu görünür.
  - Hasan 4. alet olarak **Taş kazma** ister (2 kabak + 2 ayçiçeği tohumu, 60 sikke).
  - Su için kap gerekir: **Yaprak kova** (4 Yaprak + 3 Lif, yeni tarif, 586 tarif) ya da Huş kabuğu kabı. GT türü `water`, aşınmaz, Dursun satmaz (`wearTool`, `needBucket`).
  - Hile panelinde 13 temel malzeme simgesi var, her tık +10 (`CHEAT_RES`).
  - Grafikler: elle çizilmiş piksel haritaları (`PIXI` simgeler, `PIXW` ada nesneleri). Bütün simgelere ışık ve kontur eklenir (`lightCanvas`, `outlineCanvas`). Ağaçlar `treeSprite` ile yaprak kümelerinden üretilir, tür başına 3 çeşit; rüzgârda satır satır salınır. Çimen detayı ayrı bir rastgele kaynakla eklenir, ada yerleşimi değişmez.
- **Giriş sahnesi (v33):** yeni oyunda `startCine()` ayrı bir tuvalde (`#cine`, 240×135 sahne, tam sayı ölçek) 30 sn oynar: gemide akşam yemeği → mor ışık → çarpma → alabora ("Tut elimi!") → su altı (kız uzaklaşıp kaybolur, dipte açılıp kapanan mor göz) → karanlık + hafıza cümleleri. Geç / Esc / Enter / boşluk atlar. Yalnızca yeni oyunda, tekrar izleme yok. Sesler ses motorunda üretilir: `hum, crash, creak, splash, blub, gasp, deep, surf`; `audio.play(ad,{loop,vol,fade})` ve `audio.musicTo(v,sn)`.
- **Uyanış (`wake`):** kahraman deniz kıyısındaki kumda (`wakeSpot`, iskeleden uzak) gözleri kapalı yatar, kırpıştırıp kalkar; Ekin kumsaldan (`ekinWalkIn`) yürüyüp gelir. `wakeTalk()` → kahraman adını hatırlamaz, oyuncu ona ad verir (`heroName`), sonra kıza ad verir (`loveName`); ikisi de kayda yazılır (`hn`, `ln`). Sonra `met=true`, eğitim Ekin'in ağzından başlar, Ekin kamp ateşine döner. Sahne ve uyanış sırasında otomatik kayıt yapılmaz, HUD gizlidir (`body.cine`).
- **Karakterler:** `drawChibi(g,x,y,LOOK.hero|LOOK.love,{fx,fy,step,sit,arm,closed,mouth})` ile çizilen tatlı insansı chibi'ler (21 px). Kahraman sarı saç/gömlek, kız uzun pembe saç + fiyonk + elbise. Amaç: kızı bulmak (adı görev 8–9 ve kazanma ekranında geçer).
- Başlık ekranı, zorluk seçimi (Normal / Zor; Zor modda kırmızı uyarı ekranı), yeni oyunda siyah ekran + hikâye cümlesi + yumuşak açılış, Esc ile duraklatma menüsü, kayıt/yükleme, ayarlar (müzik ve efekt sesi ayrı).
- **Zor mod keşfi:** kazanda "Tarifle kaynat" / "Deneyerek bul" sekmeleri. En fazla 6 malzeme türü atılır, adet önemsiz, hiçbir şey harcanmaz. Kazan sıcak-soğuk cevap verir (tarif açıldı / N malzeme eksik / alet eksik / sonuç yok) ve deneme günlüğü tutar. Her tarifin malzeme türü kümesi benzersiz.
- **Görsel:** canlı palet, deniz dalgaları ve pırıltı, nehir akıntısı, kıyı köpüğü, rüzgârda salınan ağaç/çalı/çimen, kelebek, düşen yaprak, bulut gölgesi, sıcak ışık + kenar karartma.
- **Eğitim 5 adım + Cadının dersi:** yürü (WASD, ilerleme çubuğu) → haritayı M ile aç/kapat → dal topla → sat → yetenek ağacı → Meltem belirir, 2 taşla keskin taş kaynat ve sat → Ekin belirir. Keskin taş = 2 taş (4 bileşen kuralının tek istisnası).
- **Harita:** sağ alt köşede her zaman küçük harita (masaüstünde 264×191, XP çubuğu ona yer açar; yatay telefonda E'nin üstünde 132×96), keşfedilmemiş yerler gri duman + ara sıra beliren siyah ?. M büyük harita. Keşif `exp` alanında saklanır. Tab = Demirci. H6 yeteneği artık "Kâşif gözü" (açılan çember 7 → 12 kare).
- **Yerleşim ve NPC'ler:** Ekin başlangıçta; Meltem batı ormanı (spotAt(330,430)); Hasan+tarla doğu (tx 52, ty 28); **Pazarcı Nazlı** güneydoğu (spotAt(700,650)); **Demirci Dursun** güneybatı (spotAt(420,630)); iskele güney. Kazan (B) yalnızca Meltem'in, Pazar (P) yalnızca Nazlı'nın, Demirci (Tab) yalnızca Dursun'un yanında açılır; uzaktayken düğmede konum iğnesi (`.far`). Nazlı bilinen toplanabilir malzemeleri satış fiyatının 3 katına satar (Pazar → Satın al). 49 alet (DB.t) yalnızca örste (`station='forge'`) dövülür, kazan listesinde yok; eski Malzemeci = Dursun'un "Al ve bile" sekmesi. Zor modda yanlış yerde deneme `wrong:` sonucu verir.
- **Yol gösterme:** `guideKey()` hedefi seçer (eğitim satış adımları, kazan adımı, Ekin konuşma/ödül, görevlerin `go` alanı, Hasan'ın aletleri, kapalı menüye basınca `guideTo`). Karakterin çevresinde pusula oku + ad + metre, hedef ekrandaysa üstünde zıplayan ok, haritalarda sarı halka.
- **Tarif satın alma** yalnızca Zor modda (kitap 50, tüccar 25). **Sikke sayacı** büyük ve vurgulu, XP çubuğunun üstünde; para kazanınca altın saçılır + altın sesi (`goldBurst`). **Eğitim/görev kartı** sağ üstte, ayarların solunda; adım bitince açık menü kapanır (`tutClose`).
- **Kapalı tarif adları:** bilinmeyen harfler titreyen kutucuk (`.gx`), bilinmeyen malzeme kırmızı ?. **Hile modu:** ayarlarda; 5 = +100 sikke, 6 = +100 XP.
- **Son:** Ekin'in 8. görevi Yelkenli sal (sal, 3 hasır, 2 halat, 2 uzun sopa, kürek, hasat sepeti; taş balta), 9. görev salı tüccar kumsalındaki iskeleden denize indirmek → kararan ekran → kazanma ekranı (süre, seviye, tarif, sikke, mod) → adaya dönüp devam edilebilir.
- **Fiyat:** temel fiyat = malzeme toplamı × zincir çarpanı (1 adım ×1,20 … 6+ adım ×1,45) + aletin %10'u.
- Toplama (yeşil süre çubuğu), kıyıdaki malzemelerin yeniden doğması, pazar, envanter, tarif kitabı (kapalı tarifler maskeli: "??şe k?lası").
- XP ve seviye sistemi (gereken XP = 20·1,35^(seviye−1)), karakter özellikleri, 27 yetenekli ağaç, Demirci Dursun'un "Al ve bile" sekmesi (alet satışı, dayanıklılık, bileme).
- **NPC sırası:** NPC'siz 3 adımlık eğitim → Yaşlı Ekin (7 görev) → ilk görev teslim edilince Cadı Meltem ve kazanı (3 adımlık "Cadının dersi") → tam 500 sikkede Yıldızsız Gezgin (başka gezegenden "hediye" robot köpeği 500 sikkeye satar, ilk köpeğin malzemesi seçilince toz bulutu olup kaybolur, karakter "Ne garip bir adam…" der; sonraki köpekler R menüsünden, her biri 1,6 kat). Köpekler temel değerlerin %50'siyle çalışır (DOG_SPEED 36, DOG_WORK 2), çağrılıp sevilebilir. Tüccar Nuri gemiyle gelir (ilk gemi 150. saniyede, 10 dakika kalır).
- **Çiftçi Hasan:** baştan beri adada. Sırayla Tırmık → Sulama kabı → Tırpan ister ve her birine tohum + sikke + XP verir. Tarla 4×3: tırmıkla → ek → sula → bekle → tırpanla biç. Ürünler: buğday, havuç, patates, soğan, kabak, ayçiçeği.

## Açık konular ve sonraki adım fikirleri
- Belgedeki eski "Taş Çağı tarifleri" sekmesi, `Hammadde_tarifler.md` ile değiştirilmeli.
- İmkânsız mod (tarif satın alma ve ipucu yok) henüz oyunda değil; belgede planlandı.
- Bir sonraki biyom (çayır ya da kayalık) ve ona giden alet/taşıt: adadaki kaynaklarla 584 tarifin yalnızca ~85'i yapılabiliyor.
- Kızın akıbeti ve mor ışığın ne olduğu (giriş sahnesi ipucu bıraktı; sonraki biyom hikâyesine bağlanabilir).
- Belgenin "Açık sorular" bölümü: nihai ad, para kazanma modeli, motor (Godot mu Unity mi), ekip.

## v39 — Karanlık, el yapımı, sürüler, açlık
- Karanlık: elde meşale yoksa oyuncunun ışığı yok (darkness .985). Işık kaynakları tek yerde: `lightSources()`, `litAt(x,y)`.
- NPC ateşleri: `FIRES` (Nazlı, Hasan, Kemal, Alp) + Ekin kamp ateşi, Dursun ocağı, Zümrüt kazanı. `nearCamp` artık hepsini kapsıyor (120 px).
- Gece kuralı (her gece): `darkness()>=.7`, ışıksız, ateş ışığı dışında → `darkT` 8 sn → `nightAttack()` (mor hüzme `beam`, can 0) → `nightDeath()` (%30 kayıp, ertesi sabah 06:00 Ekin'in yanında, Ekin alay eder; ilk sefer farklı metin). `torchHint` meşaleyi çıkar uyarısı bir kere.
- Meşale dayanıklılığı: `TORCHB` (Kaba 600 sn, Meşale 900 sn), yalnızca elde tutulurken `tickTorch` ile yanar; `torchBurn` kayıtta (`tb`). Alet kutusunda turuncu çubuk.
- El yapımı (Tab, `mode='hand'`, `renderHand`): ✓ bilinen, alet istemeyen, derinlik ≤2, ≤3 çeşit tarifler; meşaleler tarif öğrenilince. Demirci kısayolu T. Yeni buton `b-hand`.
- Sürüler: `PACK`, `packId`, `madPack(a)`; vurunca ya da saldırgan sürüye yaklaşınca hepsi saldırır; sürü merkezine toplanır. Lv<4 saldırgan sürü en çok 3.
- Açlık baştan açık (`hungerOn=met&&!wake`), yeni oyunda tokluk 8 → Ekin'in yemeği 50. Tokluk 0'da can −1,6/sn. Domuz/kurt `wild` (tut>=11 ya da gün>1).
- Dersler: `ytut` (1 böğürtlen topla → 2 ye → 3), `htut` (ctut bitince: Tab ile keskin taş). `wakeDone` → yemek diyaloğu → `wakeDone2`.
- Testler: v39_t.js (yeni), testlerde `wakeDone();wakeDone2()` kullan.

## v40 — Toplama hissi
- Hedef çerçevesi kaldırıldı; `drawGlints` toplanabilir düğümlerde ara sıra parıltı.
- Yere düşen malzeme: `drops`, `dropItem(n,x,y,q)`, `tickDrops`, `drawDrops`. Node/ağaç/kil toplama → yere düşer (oyuncudan uzağa, 12–21 px); üstüne yürüyünce (6 px, 10 px'de hafif çekim) `add()`. Kayıtta `dr`, `dh`.
- `drawTree`: oyuncu ağacın arkasındaysa ağaç %42 opak.
- `unstick`: 1 sn ilerleyemezsen yana `slide` (önü açık en yakın yan nokta, 30 px'e kadar).
- Yetenek metinlerinde Türkçe hata bulunamadı (masaüstü ve telefonda bakıldı); kullanıcıdan örnek istendi.

## v41 — Hasar hissi, diyalog kapatma
- Hasar sesi `ouch` (renderOuch: gövde darbesi + çatırtı + kısa inleme); `hurt()` hasara göre ses düzeyi, ekran sarsıntısı (`shake`, `shakeP`), telefonda titreşim.
- Diyalog: sağ üstte × (`#dclose`), dünyaya tıklamak/dokunmak da kapatır; `canLeaveDlg()` uyanış sahnesi ve mor hüzme sırasında kapatmayı engeller (Esc de).
- Dokunarak/tıklayarak yürürken engele takılınca `trySlide` ile yandan dolaşır (en çok 5 deneme), hemen "gidilemiyor" demez.

## v42 — Madenler, ganimet, HUD
- Madenler: `MINES` (11 tür, ~170 yatak, spawn'dan 26 karo uzakta), node `mine:true,left`; kazma şart (`useTool('pick')`, süre ×1.5), 3–5 vuruş, tükenince 300 sn sonra başka yerde. Çizim `case 'ore'`, ikonlar drawIcon'da (cevheri / külçesi). 6 yeni Metal tarifi (598 tarif), fiyatlar formülle.
- Av ganimeti `dropItem` ile yere. Su/engel içine düşen drop `shoreSpot` ile seker (`d.hop`).
- `underAttack()` (kovalayan hayvan 170 px ya da son 3 sn ısırık): toplama başlamaz/kesilir, dokunma düz yürüyüş olur.
- El yapımı: Yap / ×5 / Hepsi (`data-q`), `handCraft(r,quiet)`.
- Hile: `cheatTime()`, +2 saat, Geceye sar (21:00).
- Minimap/büyük harita gece kararır; işaretler yalnızca ışıkta (`lit`).
- HUD: `#vit` (can/tokluk/enerji) saatin altında; `layoutHUD()` masaüstünde ikon boyutunu (`--ibs`, `--lw`) sikke kutusuna kadar ayarlar; telefon yatayda sabit küçük düzen. `.ib kbd` gizli; telefonda tuş geçen metinler TOUCH'a göre.

## v43 — İki yaka, karakter yaratma, oyun sonu
- Harita W=456,H=328, MAPV=3. Büyük nehir `DIV0→DIV1` (RIV[DIVA..DIVB]) adayı ikiye böler. `ZONE` (0 Yurt, 1 Bataklık, 2 Kül Diyarı), `zoneAt`, `RIVX`. Karo paletleri 6–11 (bataklık/kül). Ağaç türleri: Söğüt (bataklık), Ardıç (kül).
- Kırık köprü `bridge` {x0,x1,y,fixed}; `BRIDGE_CELLS` reach'e dahil, `onBridge` yalnızca fixed iken blocked'ı aşar. `fixBridge()` 40 odun (Herhangi odun), `drawBridge`.
- Ağaç kademesi: `TREE_TIER` (Çam 1, Meşe/Söğüt 2, Huş/Ardıç 3), `AXE_TIER`. Taş balta tarifi: Sopa, 2 Keskin taş, 2 İp, 2 Taş (fiyat 39).
- Görev sırası değişti (qv:3 göçü restore'da): Taş balta, 5 odun, köprü, yaprak barınağı, 100 sikke, Lv5, Tüccar, Kemal, 10 tarif, Lv8, 25 tarif. Sal görevleri kalktı (launch hedefi kapalı).
- Savaş: ANIM can ×1.3; bölge canavarları (`z`), `ranged`, `fx`, `reach`, `wind`. Yakın saldırı: wind (kırmızı !, hedef çizgisi) → lunge → `biteHit`. Menzilli: `fireShot`, `shots`, `tickShots`. Durumlar `pfx` (zehir, kanama, yanık), `addFx`, `#fxbar`. Atılma `doDodge` (Q / #dodgebtn), dokunulmazlık. Bölge afişi `tickZone`, atmosfer `drawZoneAir`.
- Ölüm: `deathDrop()` %20 malzeme+sikke kaybı, kalanı `graves`'e; doğuş `wakeSpot`; `claimGrave` (üstüne yürü / E); haritada kafatası. `deathTalk`.
- Marangoz Rıza (`carp`, spawn+22T,-22T): `HOUSES` listesi, `renderCarp`, `useHouse` (yatak koyma `o.bed`), yaprak barınağı bir gecelik (`shelterSlept`). Taş ev Ekin'in yanındaki `ekinPlotSpot()` arsasına sabit (`fixed`). `houseSprite`.
- Kaptan Poyraz (`kaptan`, dock'a ~14 karo): tüm görevler + Lv10 → gelir (`tickKaptan`); `KAPTAN_WANT` 1 Kara pul + 3 Tunç külçesi → `launchBoat` → `endingScreen` (tekne metni).
- Kova uyarısı: `waterSpot` sabit kalır, `waterWarned` bir kez gösterir.
- Ana menü: `#tbg` canvas sahnesi (`titleLoop`), Çıkış `quitApp()` (#quit), oyunda `#b-exit` → `exitToMenu()`.
- Karakter yaratma `#creator`: `CC`, `cLook`, `buildLook`, `applyLook`; drawChibi yeni alanlar `hs` (short/long/tail), `dress`, `gl`, `hat`, `hatC`, `flower`, `gender`. Kadın kahramanda eş `LOVE_M`. Kayıt `lk`, `ll`.
- Testler: map_t, cb_t, p3_t, ui_t, mig.js, perf.js (≈54 fps, yükleme ≈1.4 sn).

## v44 — İkinci perde (teknik)
- Veri: `build_data.py` (scratchpad'te üretildi, mantığı yukarıda) 40 yeni tarif ekler; `DB.f` = örste dövülen zırhlar, `FORGED` = DB.t ∪ DB.f (istasyon seçimi artık TOOLS yerine FORGED). Granit balta/kazma yeni.
- Kademeler: `TREE_TIER`, `AXE_TIER`, `PICK_TIER`, `ORE_TIER`, `AXE_FOR`, `PICK_FOR`. Metal GT ladder'ları (axe/pick/hunt/sword). `WDMG`, `EQUIP` (res: etki direnci, mud: çamur geçirmez, lamp). `resOf`, `mudProof`, `durCol`.
- Bölge bitkileri: `ZPLANT` (zone, kural, adet, görünüm, yeniden doğma), `ZR` (findSpot bölge kısıtı; Böğürtlen yalnızca Yurt), çizim `drawPlant`, `PLANTC`. Yeni madenler MINES'ta; `MINE_Z` (demir bataklık+).
- Çamur: `MUD`, `mudAt`, karo paleti 12; hız ×0,6.
- NPC: `toygar` + `hut` (zoneSpot), `lampman` (checkLampman, talkLamp, `torchesUsed`), `balikci` (en uzak kumsal, BALIK_WANT, talkBalikci, drawFishBoat; `launchBoat(from)` genelleşti, sailing.from). `LATE` bayrağı: blocked() sondaki nesnelere başlatmadan önce dokunmasın.
- İzler: `CLUES` (6), `clues` Set, `findClue`, `clueText`, `drawClues`, GUIDE 'clue'.
- Etkiler: `BUFFS`, `buffOf`, `pbuff`, `addBuff`, `tickBuffs`, `buffOn`; #fxbar'da kesikli çerçeve.
- Keşif defteri: `codex`, `CODEX_PERK`, `perk(cat)`, `checkCodex` (yeni tarif bulununca), `bookTab` (rec/codex/clue), `renderCodex`, `renderClues`.
- Hava: `weather`, `nextWeather`, `tickWeather`, `drawWeatherTint`, `drawWeather` (yağmur/kül, sis düşük çözünürlüklü katmanda `FOGL`, şimşek), `WEATHER`. Ses: `renderSwamp/Ash/Rain/Wind/Thunder`, `tickAmb` (AMB döngüleri, müzik seviyesi).
- Yemek: `openEat`, mod 'eat', `renderEat`; F ve tokluk çubuğu açar.
- Kemer: `hotN`, `hotThing`, `hotCount`, `hotFree`, `beltFull`, `dropTool`, `beltFront`; gain() yuva doluysa yere bırakır; `DROP_LIFE` 180.
- Kayıt aktarma: `exportCode`/`parseCode` ("HAMMADDE1:" + base64 JSON), #xfer modalı; dosya indirme önce `claude.use('downloads')`, yoksa blob linki.
- Kayıt alanı `v44:{tg,tt,cl,kl,bf,cx,wx,tu,lm,bk,mh}`.
- Ölçüm: masaüstü headless 60 fps, bataklıkta yağmur/sis ≈52 fps; yükleme ≈1,4 sn.

## v45 — Yeni ilk saat ve kazan kuralı (teknik)
- **Kazan yalnızca tarif öğretir:** `brew()` pot istasyonunda malzemeleri tüketir, `foundSet`'e ekler, ürün vermez; ikinci kez "zaten öğrendin". Öğrenilenler yeşil (`.rb.learned`, kitapta `li.learned`). Pot listesi örste dövülenler dahil bütün tarifleri gösterir (`stOK`). Pot içindeki `+` kısayolu kaldırıldı (yalnızca örste).
- **Yapmak:** Tab (`handSimple` = FORGED ve yapı olmayan her şey, `handKnown` = foundSet). Örs yalnızca öğrenilmiş FORGED tarifleri döver; `forged` Set (ilk dövülen aletler; Dursun yalnızca onları satar). Kayıtta `v45.fg`, eski kayıtta found∩TOOLS.
- **Eğitim `tz` (1–13):** 1 böğürtlen topla (5) → 2 ye (5, `tzEat`) → 3 Zümrüt'e git → 4 Kaba meşale öğren → 5 aynı malzemelerle Tab'la yap → 6 4 taş → 7 Keskin taş öğren → 8 Tab'la yap → 9 Nazlı → 10 keskin taşı sat → 11 Alp (yumruk, kerevit) → 12 Alp Taş balta+Sopa+İp tarifini verir, parçaları Tab'la yap → 13 Dursun döver → `tzFinish` (tut=12, Ekin'in "5 odun" görevi). Malzemeler `tzPlace` ile görüş alanına konur; ok `tzGuideKey`/`tzmat`. Eski eğitim (tut 0–10, ftut/ctut/htut/ytut) tz açıkken kapalı. "Eğitimi geç" → `tzSkip`.
- **NPC sırası:** Ekin (122,321) → Zümrüt (-2,-29 karo) → Nazlı (+30,-51) → Alp (+62,-36) → Dursun (+70,-71); Rıza (-34,-22) batıya taşındı. Uyanış: tokluk 25, çorba yok.
- **Gece yardımı:** ilk kez meşalesiz karanlığa yakalanınca bir kez Kaba meşale gelir (`helpTorch`).
- **Canavarlar:** saldırganların aggro ×1,5; domuz şarj (reach 46), kurtlar güçlendi, gece 2 sürü; yeni **Engerek** (Yurt, Sv2+, zehir tüküren) ve **Kül cini** (3'lü ateş); kurbağa ve lav 3'lü atış; kara ejder 5'li ateş yağmuru. `#hovertip`: fare hayvanın üstünde → ad, mizaç, can, menzil, etki.
- **Meyve ağaçları:** TREE_TYPES 5–10 (Elma, Armut, Erik, Ceviz, Kestane, Mürver) + Ardıç meyvesi; `vnH` ile yerleşir (rnd sırası bozulmaz). Boş elle E = silkele (`FRUIT_RE` 150 sn); noCut olanlar kesilmez. Yeni ZPLANT: yabani havuç, yaban mersini, alıç, kanlıca, yaban sarımsağı, kuzukulağı, kızılcık.
- **Harita:** `MAPIC` 9×9 piksel ikonlar (`mki`), büyük harita `mapZ` (1–10) + `mapC` merkez; tekerlek, sürükleme, +/−/◎ düğmeleri.
- **Hile/ayar:** `#c-night` basılı tut = `timeHold` (saat 45× hızlı). Ayarlar → Gece ışığı (`settings.nightLight`; `lampOn()` bunu da sayar).


## v46 — Oynayarak bulunan hatalar, dövüş dengesi, 9 yeni özellik (teknik)
**Hatalar**
- D1 eğitim kilidi: `helpTorch` gece meşalesi verirken tz 1–4 arasında tarifi `foundSet`'e eklemez; `brew()` tz 4/7'de tarif zaten biliniyorsa `tzLearned` çağırır (eski kayıtlar da kurtulur).
- D2 menüler dünyayı durdurur: `frame` içinde `hold=(v46Hold()||((craftOpen||dlgOpen)&&!sailing))&&!wake&&!beam` → saat, açlık, hayvanlar, oklar, etkiler, hava, can/enerji durur.
- D3 açlık: `hungerEarly()` (eğitimde ya da gün ≤2: ×0,5; gün ≤4: ×0,75). Böğürtlen ve benzeri yemişler +6.
- D4 mezar: `graveSpot()` açık, yürünür, NPC/ateş/kazandan 26 px uzak yer seçer; eski kayıtlarda da taşınır. Alma yarıçapı 14, `target()` mezarı en önce görür, tıklayınca üstüne yürür.
- D5 meşale elindeyken toplanır (`isTorch` "elin dolu" kontrolünden muaf).
- D6 diyalog sayı tuşu boş arama kutusuna yazılmaz; `closeCraft` girişin odağını bırakır; gün afişi açıkken duyurular bekler (`lvlUntil`); eğitimin ilk adımında "Karnın guruldadı" çıkmaz.
- Ek: `frame` dt negatif olamaz (yeniden yüklemede `arc` negatif yarıçap hatası veriyordu).

**Dövüş dengesi (Yurt öğrenme bölgesi; bataklık ve Kül Diyarı aynı sert)**
- Can ×1,3 ve saldırganlık menzili ×1,5 yalnızca bölge canavarlarına (`z`); Yurt'ta menzil ×1,15.
- Domuz hasar 9, hız 50, hazırlık 0,72 sn; kurt 10/66/0,6; engerek 6 hasar, zehir 1,5/4 sn, atış 2,6 sn; kirpi kanaması 1/4 sn.
- Sürüler sırayla saldırır (`packBusy`: Sv<6 aynı anda 1, sonra 2); Sv<4 saldırgan sürü en çok 2, Sv<7 en çok 3; uzak kovalamayı bırakırlar (aggro ×2).
- Isırık sonrası dokunulmazlık 0,7 sn; yumruk 4, balta/kazma 8 hasar.

**Yeni (hepsi dosyanın sonundaki v46 bloğunda; kancalar: target/pickAt/interact/updatePrompt/frame/drawDarkness/lightSources/nearCamp/foodVal/buffOf/dayBanner/snapshot/applyState/start/talkWitch/tickSailing/endingScreen/drawMap/renderMapPanel/bookTabs)**
- Kamp ateşi: yeni tarif (5 Dal, 3 Taş, 2 Kuru ot, 1 Çakmaktaşı · Ateş · 14 sikke; recipes3.json'a da eklendi). Tab ile yapılır, **V** ya da el menüsündeki **Yak** ile kurulur (`camps`, 330 sn, odun +95 sn, en çok 720). Işık + güvenli bölge (100 px), yanında can hızlı dolar; E: odun at, çiğ et/balık közle (`KOZ`: "Közlenmiş …" ürünleri, fiyatları DB.p'de, doyuruculuk `V46FOOD`).
- Balık tutma: olta/ağ/kemik zıpkın elde, suya dön, E → bekle → "Vurdu!" (1 sn içinde bas) → ibre yeşilde bas. Bölge/deniz-nehre göre balık tablosu (`FISHT`), zorluk `FISH_HARD`, alet genişliği `FISH_W`, gece %5 mor kıymık. Dayanıklılık 1 düşer.
- Tuzaklar: Tuzak elde çayırda E (en çok 6, `traps`); 110–230 sn sonra tavşan/keklik/sincap (bataklıkta ördek) ganimeti; E ile al ya da topla. Balık kapanı suya bırakılır, balık yakalar. Haritada kahverengi kare, avlıysa sarı.
- Gece: `Ay çiçeği` (yenir, Gece gözü 2 dk) ve `Mor kıymık` (30 sikke) oyuncunun 150–450 px çevresinde doğar, sabah kaybolur; ateş böcekleri; karanlıkta küçük ışık delikleri (`v46Glows`, güvenlik saymaz).
- Anılar: `MEMS` 5 sahne (10/25/50/100/175 tarif), kendi tuvalinde piksel sahne + satırlar; Zümrüt 2 mor kıymığı eritirse sıradaki anı erken gelir. Kitap › **Anılar** sekmesinden yeniden izlenir. Eski kayıtlarda yalnızca en son eşik oynar.
- Zümrüt'ün bilmeceleri: "Bir bilmecen var mı?" → görülmüş malzemelerden açılabilir bir tarif (`pickRiddle`, ipuçları `RHINT`); kazanda öğrenince 30 + fiyat×2 sikke, 20 XP.
- Harita işaretleri: **N** bulunduğun yere, büyük haritada 📍 kipiyle dokunduğun yere; ad + 5 renk, düzenle/sil (`marks`, en çok 40).
- Gün sonu özeti: yeni günde (`dayBanner`→`v46NewDay`) tarif, XP, kese, av, balık, közleme, tuzak, keşif farkı + bir ipucu.
- Sisli Ada: Rüstem'in teknesi artık doğrudan bitişe değil, ayrı bir sahneye götürür (`sis`, kendi tuvali 320×180, sis, pusula). 3 iz (kurdele, fener, tasma) → taş halka → mor gemi iner, camın ardında Mavi → "Mor pusula" eşyası → bitiş ekranı (yeni metin). "Sahneyi geç" var.
- Kayıt alanı `v46:{cp,tr,mk,me,rd,rn,ds,dx,sd,h,ft}`.
- Test: `node tests/v46_t.js <ekran klasörü> Hammadde_prototip.html` (14 kontrol). v44_t1–t4 de geçiyor (t2'de "won false" beklenen: artık önce Sisli Ada açılıyor).


## v47 — Ses, karakter, NPC, eğitim, yetenek ağacı (teknik)
- **Konuşma:** `say()` sonunda `typeDlg(who)`: #dtext metin düğümleri boşaltılıp ~42 harf/sn geri yazılır, noktalamada kısa durak. Yazarken tuş/dokunuş önce metni tamamlar (`finishType`), seçenekler soluk (`.dch.typing`). Ses: `audio.synth(f)` (gerçek zamanlı WebAudio), `VOICES[npc adı]` = taban frekans, dalga, filtre, sapma, hız; `babble()` her iki harfte bir blip. Kamp/tuzak gibi nesnelerde ses yok.
- **Karakter:** `drawChibi` saç bölümü yeniden yazıldı: erkek `HS_E` (short, messy, side, spiky, buzz, long, tail), kadın `HS_K` (long, tail, braid, bun, bob, pixie, twin); `L.beard` (biyik, keci, sakal); gözlük `round` ince altın çerçeve, `kare` ince çerçeve, `sun` koyu cam; şapkalar `HATS_E/HATS_K`: kasket, ponponlu bere, hasır, kovboy, silindir, fes, korsan, bandana, çiçek tacı. `o.sick` yüzü yeşile çevirir.
- **NPC'ler:** `NPCL` görünümleri + `npcDraw()` (drawChibi, nefes `bob`, göz kırpma `closed`, 80 px içinde oyuncuya döner). Ekin şapka/pipo dumanı/asa, Zümrüt sivri şapka/iksir, Nazlı küpe/el sallama, Dursun önlük/çekiç kıvılcımı, Alp kalkan/kılıç, Hasan tulum/dirgen, Kemal/Rıza önlük, Toygar kukuleta/yay. Eşyalar (tezgâh, örs, kulübe) aynı.
- **Eğitim:** `tzAlpDone` iki diyalog: atılma bir yetenek (Savaş, 100 sikke), pazar satışı; sonra balta. `axeStep` 0–3 (`AXE_STEPS`: 2 keskin taş → sopa → 2 keskin taş → 2 ip) → tz 13; kart `axeCard()`. İlk 100 sikkede (`coinWatch`) Atılma duyurusu.
- **Görevler:** "Taş balta yap" QUESTS'ten çıktı (17 görev). `tzFinish` → tut 11 + `axeInfo`: Ekin'in ilk konuşması "Ooo, baltanı yapmışsın!" + ağaç kademeleri. Kayıt `qv:4`; qv 3 kayıtlarda tut ≥12 ise tut−1. `checkRunLesson` tut ≥13.
- **Yetenek ağacı:** 8 dal × 8 (Bilgelik artık normal modda da görünür). Yeni: T7 T8, Z5–Z8, H7 H8, B4–B8, S1 Atılma, S2 Çevik atılma (Dayanıklılık dalı = Savaş; K1 Koşu artık S1'den sonra), A5–A8, C6–C8. 5000 sikkelik olanlar Sv12. Eski kayıtlarda (v47 alanı yoksa) Sv>1 ya da görevler başladıysa S1 hediye. Etkiler: tradePct, sell lucky, sellMult, forge keep + `v47Craft` (elle yaparken malzeme kalması / çift ürün), gainXP çarpanı, ipucu süresi, bilmece ödülü, wearsNow, hotN, hpRegen, maxHP, speedMult, karanlıkta 38 px görüş, Z8 +10 XP.
- **Enerji:** `#stbar` canın altına taşındı, mavi; atılma 14 (S2: 9) enerji. Bar S1 ya da K1 varken görünür.
- **Sikke:** coinbox ikonu CSS ile yuvarlak altın; `goldBurst` → `coinSound(n)` (1–9, 10–99, 100–999, 1000+ jackpot).
- **Açlık:** `tickStomach`: tokluk <25 → mide guruldaması (`stomachGrowl`) + baloncuk ("Açım…"), bar kırmızı yanıp söner.
- **Zehir:** `POISON` (Mürver, Meşe palamudu, Sinek mantarı [artık yenir], Kurt eti, Kuzukulağı); yenince 0,6 sn sonra `addFx('zehir')`, `sickT`, `poisonKnown` (yeme listesinde "zehirli!"). C7 Demir mide %60 azaltır.
- **Yeni tarifler (boşta kalan malzemeler):** Ay çayı, Ay ışığı iksiri, Kıymık kolye, Diken iğnesi, Timsah dişi kolye, Kül dişi muska, Ateş iksiri (DB + recipes3.json; iksir etkileri V46BUFF'ta).
- **Pazar:** `potUses(n)` (öğrenilmemiş, açık tarif) → "Kazanda şimdi N tarifte işe yarar"; `potLater` → "İleride N tarifte lazım olabilir"; `#sellsafe` yalnızca şimdi işe yaramayanları satar.
- **El düğmesi:** hotbar'ın başında `#handbtn` (H): eli boşaltır, yakında toplanacak bir şey varsa hemen toplar.
- **Harita:** NPC ikonları büyük (`mki` ölçeği 2,4/3,3/4), oyuncu `headIcon()` (kendi kafası). Kamera alttan `SEA_PAD()` kadar denize taşar, `drawSeaPad` dalgalı deniz çizer.
- Testler: v46_t geçiyor; v44_t1/t2 diyalog yazma ve 17 görev için güncellendi.

## v51 — Ekonomi (27 Ekim 2026 planı, Boğaç'ın kararları)
- Pazarcı Nazlı dışında kimse para karşılığı satmaz. Dursun'un "Al ve bile" sekmesi yalnızca **Bile** (satın alma yok); alet kaybolursa/kırılırsa örste yeniden dövülür (`laborFee(r)` = fiyatın %15'i, eğitimde ücretsiz). `smithOf(r)` hangi demircinin döveceğini söyler.
- Usta Kemal yalnızca yapılar: tarif **kazanda öğrenilmiş** olmalı (`foundSet`), malzemeler oyuncudan, `ustaPrice` = işçilik (%20). Yapı tarifleri artık kazanda öğrenilebilir (brew'da PLACEABLE engeli yalnızca örste). `ustaMakes(x)` uzmanlık süzgeci.
- Hasan tohum satmaz (Nazlı satar); Nuri tarif satmaz.
- Nazlı: `isRaw`, `rawList` (görülmüş, tarifi olmayan doğal malzemeler; `RAW_NO` hariç), `rawTier` (fiyat kademesi + bölge `rawZone`), `rawPrice` = fiyat × (2,6 + 0,6 × kademe).
- Ganimet: `dropRoll(D,must)` — p≥1 olanlar hep düşer, kalanlardan ağırlıklı 1–3 çekiliş (`dropRolls`: can ≥55 → 2, ≥150 → 3; şans +1). Reis (hepsi p=1) hepsini düşürür. Tuzaklar da aynı. Fare ipucunda (avlanmış tür) olasılıklar yazar (`dropOdds`).
- Fiyatlar: zor canavarların parçaları yükseldi (boynuz, diş, ayı pençesi, timsah dişi…); onları kullanan tarifler fark × 1,3 ile güncellenir (PRICE_ tanımının hemen altında).

## v52 — Demirci kardeşler
- Yeni NPC **Zırhçı Durmuş** (`durmus`, `anvil2`), Dursun'un yanındaki ikinci örs (yer: Dursun'un çevresinde açık ilk nokta). `smithOf(r)`: `DB.f` (örste dövülen zırhlar) → Durmuş, gerisi Dursun. `forgeWho` örsü kimin açtığını tutar (konuşmadan ya da en yakın demirci, `nearestSmith`); örs listesi yalnızca o demircinin işlerini gösterir; Durmuş'ta Bile sekmesi yok. Kayıtta `dm`.
- Kancalar: blocked, target, interact, prompt, pickAt, çizim (`drawDurmus`), harita ikonu (`MAPIC.durmus`), GUIDE, VOICES, TALK.

## v53 — Gece ve meşale
- Gece 4 → 2,5 dk (`NIGHT_S=150`, `tickClock`). Meşale elde yanar: `TORCHB` Kaba 110 sn, Meşale 170 sn (bir gece). `torchRate`: yağmur ×2, fırtına ×2,7, sis ×1,15, ateş yanında ×1 (Ateş kodeksi ×0,75). Eski kayıtlarda fazla kalan süre kırpılır.
- `feedTorch()` (L tuşu, El yapımı menüsündeki "Reçine sür"): 1 Herhangi reçine → Meşale +%65, Kaba +%50. `torchWarn`: %35'te "kalacak bir yer bulsam iyi olur" balonu, %12'de ikinci uyarı, yağmurda bir kez uyarı.
- Hile: "Günü bitir" (`#c-day`) sabah 06:00'ya atlar.

## v54 — Yıldızsızlar
- Işıkçı (`lampman`): `LAMP_DAY=15`, her akşam 18:00–05:30 (`lampEve`) sabit `lampSpot`'ta (Yurt'ta, Ekin'in kuzeybatısı) belirir, haritada mavi ikon; sabah söner, ertesi akşam yine gelir; takas yapılınca (`LAMP_WANT`: 5 Mor kıymık, 3 Gece sefası, 1 Tunç külçesi) kaybolur (`gone`). Sikke yok.
- Gezgin (`wiz`): `WIZ_DAY1=5` gün oyuncunun yanında belirir, ilk köpeği **hediye** eder (`wiz.plan` = ilk köpek verildi). `WIZ_DAY2=20` ikinci gelişte (`wiz.v2`) **Mor sinyal** verir (`wiz.sig`). Köpekler menüsünde mesajlaşma kutusu (`dogMsgs`, `.sigbox`), `orderDog()` → mor ışık sütunu (`dogBeams`, `drawDogBeam`) → `spawnDog(x,y)`. `DOG_MAX=5`. Eski satın alma (`buyDog`) kullanılmıyor.
- `DOG_MATS` genişledi (ot, keten, kenevir, şifalı otlar, kil, kamış…); menüde yalnızca görülmüş olanlar.

## v55 — Görevler (`<script id="v55-q">`)
- Ekin'in zinciri 17 → 12 görev (`Q4KEYS`→`Q5KEYS`, restore'da `qv<5` göçü; `qv:5`). Rıza barınağı → `carp1`, Nuri'nin ilk siparişi → `nuri1` (gemi kendiliğinden gelir: köprü onarılınca ya da 3. gün; gemi yanaşınca görev otomatik alınır/biter), Dursun tunç → `smith_bronze`. "Usta Kemal'i bul" ve "Toygar'ı bul" kalktı (Ekin'in metinleri onları anıyor). Eski kayıtta bitmiş taşınan görevler NPC görevi olarak bitmiş sayılır.
- `NQ`: her NPC'nin sabit görev zinciri (Zümrüt 5, Nazlı 5, Börü 5, Dursun 4, Durmuş 4, Hasan 3, Kemal 3, Rıza 3, Toygar 4, Nuri 1). Türler: `bring` (teslimde alınır), `kill` (kills[] farkı), `cnt` (QC sayaçları: `sold`, `trap:X`, `fish:X`, `gather:X`, `craft:X`), `done/p` özel. `req/rt` kilit. Bir NPC'den sırayla tek tek; aynı anda birçok NPC'nin görevi açık olabilir.
- Konuşma: `say` sarmalayıcısı NPC'nin ana menüsüne (Hoşça kal/Sonra… seçeneği olan) görev seçeneği ekler (❗ iş var / ✔ teslim / durum). Nazlı'nın işi varsa önce kısa bir konuşma açar. NPC başında mavi ! (iş var), sarı ? (teslim).
- Panel: G / görev düğmesi → `openMenu('qlog')` (`renderQlog`); ders kartı açıkken eski davranış. Kartı gizle/göster panelde.
- Takip: `QS.tr` (en çok 4) → `QG` kümeleri (node/ağaç/hayvan/yerdeki eşya) b3 parıltısına eklendi (aynı mavi). Fare üstüne gelince `#qtip` mavi yazı; yanında durunca dünyada mavi "Görev: …" yazısı. Ok/yol gösterme yok.
- Kayıt: `v55:{a,d,tr,qc}`. Görev bitince `window.__v57.quest(q)` çağrılır (anılar için).

## v56 — Ev içleri (`<script id="v56-room">`)
- Yaprak barınağı dışındaki evlerde E = içeri gir (`useHouse`→`enterRoom`). Oda boyutu `RSZ` (Deri çadır 5×4 … Konak 12×8), stil `RSTY`. Oda ayrı tuval `#roomcv` (z-index 1, HUD üstte), üstte `#roomui` çubuğu (Döşe / Dışarı çık). Ada donar (oyuncu hareketi `roomBusy`, `tickAnimals`/`tickShots` durur); saat, açlık, hava sürer.
- Eşyalar `DEC` (w,h,L: floor/rug/wall, k: bed/lamp, çizim). Döşe kipinde envanterdeki eşya seçilir, ızgaraya konur (R/Döndür), yerleşik eşyaya tıklayınca geri alınır. Kapı hücresi boş kalır. Kayıt: ev nesnesinde `o.room.it[{n,x,y,r}]` (placed ile kaydedilir); eski `o.bed` ilk girişte yatağa dönüşür.
- Yatak: E ile gece uyunur (`sleepBed(o)`, `o.bed`). Lamba (Taş/Kil lamba, Asma fener) odadayken `roomSafe()` → gece kuralı (`exposed`) işlemez; lambasız odada gece karanlık sayılır, mor ışık gelir (oda kapanır).
- 13 yeni tarif, kategori **Ev eşyası** (660 tarif): Tabure, Sandalye, Masa, Sandık, Dolap, Raf, Halı, Kilim, Perde, Duvar halısı, Saksı, Ahşap karyola, Asma fener. Elle yapılmaz; kazanda öğrenilir, Usta Kemal malzeme + işçilikle yapar. Simgeleri oda çiziminden üretilir. recipes3.json da güncel.

## v57 — Anılar (`<script id="v57-mem">`)
- 5 tarif anısı aynı. 7 yeni anı `MEMS`'e eklendi (indeks 5–11): `ev` (sleep/faint/quest) ve `min` (en erken gün). `memEvent(ev)`: olasılık `CH` (uyku %40, bayılma %60, görev %30), uygun ve görülmemiş anılardan rastgele biri `memUnlock` ile sıraya girer; `memTick` uygun anda açar. Her anı bir kez (mems).
- Kancalar: `sleepBed` (gece uyuyunca), `faint` ve `nightDeath` (bayılma), Ekin'in `turnIn`'i ve NPC görevleri (`window.__v57.quest`).
- Kart başlığı türe göre ("Bir rüya gördün" / "Bayılırken bir anı"), `memKind` kayıtta `v57.k`. Yeni sahneler `memScene` sarmalayıcısında (i ≥ 5). Kitap › Anılar her anının nasıl gelebileceğini yazar. "Mor fısıltı" 20. günden, "Bırakılan el" 25. günden önce görünmez.

## v58 — Telefon performansı (`<script id="v58-perf">` + ana kodda küçük değişiklikler)
- Ölçüm (844×390, dpr 3, CPU ×4 yavaş): önce ≈6 fps; sonra gündüz ≈60 fps, gece ≈30–60 fps (kaliteye göre).
- Çözünürlük: dünya tuvali artık telefonda en çok 2× yoğunlukta (`PERF.cap`, `resize`). Kare süresi izleyicisi (`watch`): 2 sn üst üste ort. >24 ms → bir kademe aşağı; uzun süre <15 ms → 20 sn'de bir, bir kademe yukarı. `PERF.lvl` 1: 1,5×, 2: 1,25× + vinyet yok + ucuz parıltı (`gl`) + karanlık maskesi ¼, 3: 1× + daha az su köpüğü/parçacık. Hile/test: `__v58.setLvl(n)`.
- Zemin 16×16 karoluk parçalar halinde (256 px) ilk yaklaşıldığında pişirilir (`bake`, kare başına en çok 1, görüş çevresi önceden), LRU sınırı telefonda 36. Eksik parça o kare karo karo çizilir.
- Su: hazır renk dizileri, kıyı köpüğü parça listelerinde (`SB`).
- Düğümler: `PERF.vis` (kamera 32 px kayınca ya da 0,4 sn'de bir yeniden), çizim, parıltı, toplama hedefi, gece ışıkları, ağaç tepesi saydamlığı bunu kullanır. Yeniden doğma ve ağaç sayaçları saniyede 5 kez. Otlar (`TUFTS`) kameraya göre süzülür.
- Karanlık maskesi yarım (düşük kalitede ¼) çözünürlükte, gökyüzü ışık havuzları ¼ katmanda, vinyet önbellekte. Harita sisi düşük kalitede saniyede 1. Ev içindeyken ada hiç çizilmez.

## v59 — Ada halkının hikâyeleri (`<script id="v59-story">`)
- Görev veren herkesin (Ekin dahil) mor ışıkla bağlantılı bir geliş hikâyesi ve kaybettiği biri var (`ST_`): Ekin → eşi Saliha (ana zincirde 2/4/6/8/10/12. görevden sonra), Zümrüt → büyükannesi Ayşen Nine, Nazlı → kardeşi Cem, Börü → ağabeyi Kaan, Dursun ve Durmuş → babaları Demirhan Usta (iki ayrı bakış), Hasan → kızı Gül, Kemal → annesi Hatice Ana, Rıza → nişanlısı Defne, Toygar → oğlu Ayaz, Nuri → yeğeni Deniz.
- Her biten görev bir parça açar (`unlocked`); NPC menüsünde "📖 Sen bu adaya nasıl geldin? / devamını anlat", görev teslim edilince de hemen sunulur. Bütün parçalar duyulunca "📖 O geceyi anlat" → kısa sahne (`playScene`, `#npcsc`, 240×135, mor ışık sütunu ile götürülme; Durmuş'unki kumsaldaki çekiç). Sahne bitince +40 XP ve anılar için görev kancası.
- Kitap › **Ada halkı** sekmesi: duyulan parçalar, sahneyi yeniden izle. Kayıt `v59:{h,s}`.
- Final (herkesin kurtarılması / kötü son) henüz yok; hikâyeler buna göre açık uçlu.

## v60 — En üst seviye 50, telefonda hile modu ve bataklık performansı
- `MAXLV=50` (eski kayıtlarda 50'nin üstü 50'ye iner). XP eğrisi 16'ya kadar aynı, sonra `3606×(1+0,06×(L−16))` → 1'den 50'ye ≈245 bin XP (eskiden 100'e ≈9 milyon). İçerikteki en yüksek seviye şartı 12, değişmedi.
- Özellikler `effL(L)` ile: 16'dan sonra her seviye iki sayılır (Sv50 ≈ eski Sv84 gücü); hız/toplama/şans tavanları aynı kaldı (21/33/23).
- Ağaçlar: tepe salınımı satır satır çiziliyordu (ağaç başına ≈30 drawImage); artık her sprite yarım adımlık hazır salınım kopyaları tutar (`c.__sw`), ağaç tek drawImage. Bataklıkta en büyük kazanç.
- Kalite kademesi: 2+ bölge tonu yok, yağmur damlası ×0,75; 3 bataklık sisi yok (sis havası hariç), yağmur ×0,5.
- İzleyici: bir kademe yükseldikten sonra 30 sn içinde yine düşerse o cihaz o kademeye bir daha çıkmaz (`floorL`) → ileri geri sallanma yok.
- Boşta (requestIdleCallback): çevredeki zemin parçaları önceden pişirilir, tarif ikonları önceden çizilir (kitabın ilk açılışı hafifler). Seviye atlama yazısı ayrı katmanda (`will-change`).
- Ölçüm (844×390, CPU ×4): hile + Sv50 + harita açık: yürüyüş/çatışma 30–60 fps, bataklık 100 ms → 17–33 ms, gece/yağmur ≈30 fps, Kül Diyarı ≈60 fps; 90 sn oturumda bellek sabit (≈20 MB).

## v61 — Ad girişinde Enter
- `askName`: telefon klavyesinin Enter / Bitti tuşu adı onaylar (keydown + keypress, keyCode 13 da sayılır), giriş kutusunda `enterkeyhint="done"`.

## v62 — Telefon açılışındaki siyah kareler, balta dersi
- Siyah kareler: kalite kademesi değişince tuval boyutu izleyicinin karesinde değişiyordu (temizlenen tuval bir kare boş kalıyordu). Artık `PERF.pend` ile boyut, oyun karesinin içinde çizimden hemen önce uygulanır. İzleyici oyuna girdikten sonraki ilk 6 sn'yi ölçmez (açılıştaki hazırlık yüzünden gereksiz düşüş olmasın).
- Balta dersi (tz 12): adım artık eldekilerden hesaplanır (`axeNeedStep`, örsteki parçalar da sayılır), geri de gider. Yeni 5. adım: **2 taş** (Taş balta tarifinde vardı, adımlarda yoktu: taşı keskin taşa çeviren oyuncu "parçalar tamam" görüyordu). tz 13'teyken bir parça eksilirse tz 12'ye döner. Toplama adımında ok o malzemeyi gösterir.
- Dövdükten sonra "Baltayı elime alayım" → `window.__axeHold` dersi (`<script id="v62-axe">`): yuvaya koy → eline al (yuva yanıp söner) → `tzFinish`, Ekin'e ok.

## v63 — Boğaç'ın telefon notları (`<script id="v63">` + `<style id="v63-css">`)
- Karakter yaratma: önizleme (`.cprev`) kayan kartın içinde yapışkan (dar ekranda üstte şerit), ekran her açılışta en üstten açılır (`showCreator` sarmalı; `c-go` odağı kaydırıyordu). Önizlemeyi fareyle/parmakla sürükleyince 360° döner (`V63.cang`, 8 görünüş: ön, ¾, profil, arka…; Döndür düğmesi 90°).
- Gerçek profiller: `drawChibi` fx≠0 iken `profR` ile yandan çizer (tek göz, burun, kulak, saçın arkası; her saç stili, sakal/bıyık, gözlük, şapka ve miğfer için yan görünüş), sol profil aynalanır. Eski ¾ görünüş `o.q34` ile hâlâ çağrılabilir. Yön: baskın eksen (sağ→sağ profil, yukarı→arka, aşağı→ön); çaprazda yatay kazanır. Ev içinde sola dönüş düzeltildi. Kafa artık eldiven rengini almıyor.
- Yumruk: elde silah yokken savuruşta yumruk görünür, sağ-sol sırayla (`__p4.sw.k==='fist'` → `o.punch`).
- Telefon: baygınken (uyanma sahnesi, ara sahne) kaydırma işareti yok; yön yuvarlağı parmağın altında değil, sol altta sabit (girdi yine her yerden).
- Oklar: malzeme okları (`tzmat`, `berry`) tarifin **her** eksik malzemesi için ayrı ok çizer; yerde duran (düşmüş, toplanmamış) eşyalar önce gösterilir, düğümler en çok 25 m (400 px) uzaktan.
- Mıknatıs: yerdeki küçük eşyalar 30 px (≈2 m) içinden karaktere süzülür (oyuncunun bıraktığı aletler `keep` hariç).
- Mavi parıltı (`gl`) kalın ve daha parlak: geniş aura + mavi kenar + açık çekirdek.
- Otomatik yeme kalktı: tabak düğmesi ve F yiyecek listesini açar; her satırda **Ye** düğmesi. Eğitimde (tz 2) önce tabak düğmesi, sonra böğürtlenin Ye düğmesi yanıp söner.

## v64 — Boğaç'ın ikinci notları (`<script id="v64">` + `<style id="v64-css">`, profR yeniden)
- Açılışta yanıp sönen "Bu bir önizleme…" (`#nojs`) uyarısı tamamen kaldırıldı.
- Yan profil (`profR`) yeniden çizildi: kafa 9 px genişlik, yuvarlak, burun çıkıntısı yok, tek büyük göz; saçın arkası ve şapkalar daraldı.
- Kaybedilen kişi hep aynı: erkek kahraman → uzun kızıl saçlı kadın, kadın kahraman → kısa kahverengi saçlı adam (`setLove`, `applyLook` ve `restore` sonrası; eski kayıttan kalan `hs` vb. temizlenir). Ad girişi, yaratma notu, Toygar'ın anlattığı ve Sisli Ada'daki yüz cinsiyete göre.
- Toplarken hasar yok (`HURT` boş: böğürtlen dikeni, çakmaktaşı). C4 "Kalın deri" artık zehir, yanık ve çiğ eti azaltır (zaten `hurt` fiziksel olmayan hasarı azaltıyordu); eğitim metinlerinden diken uyarısı çıktı.
- Diyaloglar hikâyelere göre: Ekin "onu bulacağız" demiyor (ışığın aldığını kendisi de bilir, söz veremez); Zümrüt'ün eski "kazan her şeyi yapar" sözleri "kazan tarif öğretir" oldu, büyükannesine gönderme; Hasan tarlayı "biri için" ekiyor; Dursun "silah demircisi".
- Konuşma portreleri: Ekin, Zümrüt, Nazlı, Dursun, Durmuş, Hasan, Kemal, Rıza, Toygar, Börü için dünyadaki görünüşlerinden (NPCL + şapka/pipo/önlük) çizilir (`#dlg.v64 img.v64p`); eğitim kartındaki küçük resim de öyle. Nuri, Rüstem, Kaptan, Büyücü ve Işıkçı eski SVG'lerini kullanır.

## v65 — İki kat ada, altı bölge (`<script id="v65">`, ana kodda dünya üretimi, `v48-b5` müzik)
- Harita 645×464 karo (alan ≈2×). `MAPV=4`: eski kayıtlar açılışta bir kez silinir (`window.__v65wiped`, başlıkta uyarı), `cleanSave` başka harita kaydını açmaz.
- Bölgeler: `ZONE` artık tehlike kademesi (0 batı/yurt, 1 büyük nehirle sıradağ arası, 2 sıradağın doğusu); `BIO` (0 Çayır, 1 Orman, 2 Bataklık, 3 Kayalık Dağ, 4 Kül Diyarı, 5 Mor Kristal Vadisi), `bioAt`, `BNAME/BDANGER/BCOL`. Orman yurdun kuzeyi, Dağ orta bölgenin kuzeyi (köprünün 24 karo kuzeyinden), Kristal en doğu.
- Sıradağ: karo 5 (`RIDGEX`), suyla aynı engel (`isWater` 5'i de sayar; su alma/balık için `isWet`). Tek geçit `PASS`, kapalıyken `rockfall` (blocked + reach 0). Ekin'in yeni ana görevi "Doğu geçidini aç": 2 Kaya patlatıcı (yarasa gübresi, kömür, tuz, çömlek) + kuvars kazma ya da üstü. Kayıtta `v65.rf`.
- İkinci nehir artık orta bölgeden kuzey kıyıya akar (doğuyu ikiye bölmesin diye); bataklık gölleri güney-ortada.
- Her bölgede 5 ağaç türü, 7 canlı, 14 bitki/buluntu, 3 maden (`BTREE`, `BANIM`, `BPLANT`, `BORE` v65 bloğunda). Yeni: 11 ağaç (odun/kalas/sap/kömür zinciri), 13 canlı (Ur kekliği, Kartal, Vaşak, Kül böceği, Kor yarasası, Ateş akrebi, Mor güve, Işık tilkisi, Kristal geyik, Gölge kurdu, Kristal örümcek, Işık engereği, Kristal golem), 26 bitki/buluntu, Ametist madeni; hepsi en az bir tarifte (DB'ye ≈100 tarif eklendi, toplam 759). Bölgesel bitkiler ve madenler v65'te silinip bölge bölge yeniden dizilir; ağaçlar bölgeye göre türlenir, %18 seyreltildi.
- Meyve ağaçları: boş elle silkelenir, balta eldeyken kesilir: odun + 1–2 meyve kesin, %35 tohum (`ty.seed`, "Herhangi meyve tohumu": Meyve fidanı, Tohum yağı).
- Madenler 2×2 büyük çizilir (4 kat alan), üstünden geçilmez (`mineAt` ızgarası), toplama menzili 13 px daha geniş.
- Bölge hissi: ilk girişte büyük başlık (`V65.seen`, kayıtta), her bölgenin hava rengi/parçacıkları, haritada bölge renkleri + açıklama; büyük haritada keşfedilmiş yerin üstüne gelince bölge adı (`#v65mt`). Müzik ayarı "Bölgeye göre" (varsayılan): Ada, Orman, Sis, Dağ, Derinlik, Kristal; yurtta gece Gece.
- Yan profil: burun, kaş, dudak, çene; gözlük yandan cam kenarı + sap; kel karakterde saç tokası yok (yaratmada satır da gizli).
- Hız: `findSpot` artık düğüm ızgarası (`nodeNear`) kullanır.

## v66 — Yan profil (Boğaç'ın seçimi)
- `profR` (v63 bloğu) yeniden: Boğaç 10 seçenekten "2"yi (tek piksel burun ucu) seçti, yanak ön profildeki gibi belirgin pembe (#ff9a9a, 2 piksel), kahkül öne taranmış ("S2"), kafanın arkası büyük ve yuvarlak, saç enseye kadar sarıyor ("Y3"), gövde 4 piksel genişliğinde (ince). Bütün saç stilleri, şapkalar, sakal/bıyık ve gözlükler buna göre uyarlandı. Önizleme `scratchpad/prof` altında üretilmişti (repo dışında).
- v66.2: karakter yaratmada erkek saçlarından 'Kazınmış' kaldırıldı (Kel var). 'buzz' çizimi Kel ve bazı NPC'ler (Ekin, Dursun, Kaan, Demirhan) için kodda duruyor.
- v66.3: erkek karakter elbise ve çiçekli toka seçemez (satırlar gizli, buildLook da zorlar); erkek şapkalarına 'Buff' (renkli bant, arkada düğüm) eklendi, ön/arka/yan çizimi var.
- v66.4: karakter yaratma önizlemesi ve Karakter penceresindeki figür, şapkanın yüksekliğine göre dikeyde ortalanır (chibiTop/chibiFeet); ponponlu bere ve silindir artık kesilmez.
- v66.5: Buff artık çene/boyun buff'ı (şapka listesinden çıktı). Erkeklerde Sakal satırından sonra 'Buff' (Yok, Düz, Kuru kafa, Alev, Çizgili, Kamuflaj, Kurt dişi) ve 'Buff rengi'. LOOK.hero.buff (renk) + buffS (desen); ön/arka buffFB, yan profR, desenler buffPat.
- v66.6: İnce çerçeve gözlük açık gri (#6a6a78) ve gerçekten ince (yalnızca üst çizgi + kısa yanlar); yan profilde güneş gözlüğü gözü örten küçük koyu cam + kulağa sap.
- v66.7: sinematiklerde (giriş #cine, anılar #mem-c, ada halkı sahneleri #npcsc… oyun tuvali dışındaki her tuval; karakter yaratma #cprev hariç) fx'li çizimler otomatik ¾ (o.q34): tam yan profil yok.

## v67 — küçük düzeltmeler (`<script id="v67">` yunuslar)
- Sınırsız sikke hilesi açıkken sayaçta yalnızca ∞ görünür (sayı gizli), "+N sikke" yazıları çıkmaz.
- Köprü 20 odunla onarılır (`BRIDGE_WOOD`).
- NPC'ler yürümüyorlarken yan profil değil, sana hafif dönük önden (`npcDraw` → `q34`); yürüyen Ekin yan profilde.
- Açık denizde ara sıra (18–48 sn) yunus zıplar (bazen iki tane), görüş alanında ve kıyıdan en az 2 karo uzakta; sıçrama efektli.
- Sırada (v68): çizimi WebGL'e taşımak (performans).
- v67.1: ağaçlar dinlenmez; 3 kesişte devrilip yok olur (`treeChopped`), 200–300 sn sonra aynı bölgede, ekranda görünmeyen uygun bir yerde aynı türden yenisi çıkar (`regrow`, kayda yazılmaz).
- v67.2: kesilen ağaç hasarlı görünür: 1. kesişte gövdede çentik + talaş, 2. kesişte iki yanlı derin kesik, dökülen yapraklar, hafif yatma.
- v67.3: köprü ve doğu geçidi görevleri sürerken üst ortadaki takip çubuğunda gerekenler yazar (`crossRow`: odun x/20; kaya patlatıcı x/2 + kuvars kazma).

## v68 — Ekran kartıyla çizim (`<script id="v68-gl">` db JSON'dan hemen önce, `<script id="v68">` ayar anahtarı)
- `GL2D`: Canvas 2D API'nin oyunun kullandığı kısmını (fillRect, drawImage, yol/elips/yay/çizgi, fillText/strokeText, radyal/doğrusal degrade, globalAlpha, dönüşümler, source-over/lighter/multiply/destination-out, shadowBlur için ucuz parıltı taklidi, setLineDash) WebGL üçgenlerine çevirip toplu çizer. Ana tuval: `ctx=(window.__mkGL2D&&window.__mkGL2D(cv))||cv.getContext('2d')`.
- Küçük kaynaklar (≤192 px) 2048'lik atlas sayfalarında (en çok 6, dolunca sıfırlanır), büyükler kendi dokusunda (600 kare kullanılmazsa silinir). Her 2D tuvalin değiştiği `CanvasRenderingContext2D.prototype` yamasıyla izlenir (`canvas.__v`), doku yalnız değişince yeniden yüklenir. Yazılar ölçeğinde küçük tuvallere çizilip önbelleklenir.
- Kare sonunda mikro görevde `flush`. `preserveDrawingBuffer:true`. `ctx.__fwd(g)` çizimleri geçici olarak gerçek bir 2D bağlama yönlendirir (`capAnim` canavar portreleri bunu kullanır).
- Güvenlik: WebGL yoksa ya da kurulamazsa klasik 2D. Karede GL2D kaynaklı hata ya da bağlam kaybı olursa `localStorage['hammadde.gl']='0'` + kayıt + yeniden yükleme. Ayarlar › "Ekran kartıyla çiz" (değişince oyun yeniden açılır).
- Bilinen farklar: `ctx.filter` (Reis'lerin mor gölgesi) yok sayılır; `source-atop` gibi desteklenmeyen karışımlar normal çizilir; parıltı gerçek bulanıklık değil, çevrede kopyalar.
- v68.1: GL varsayılan KAPALI (Boğaç'ta ilerlemiş kayıtla 'Devam et' siyah ekran). Yalnızca Ayarlar anahtarı ('hammadde.gl'='2') açar.
- v68.2: siyah ekranın sebebi: `drawLight` vinyet degradesini `ctx.createRadialGradient` ile alıp sıradan bir 2D tuvale boyuyordu; GL2D kendi Grad nesnesini verdiği için o tuval siyah doluyor ve bütün ekranı örtüyordu. Artık GL2D gerçek bir CanvasGradient verir (`__g` içinde kendi kopyası). Headless Chromium (swiftshader) ile kayıttan devam, gündüz ve gece görüntüsü kontrol edildi. GL yeniden varsayılan açık; ayar anahtarı `hammadde.gl2` (herkes açık başlar).

## v69 — köpek hatası, kazan simgesi (`<script id="v69">`)
- Hata: Yıldızsız Gezgin'le her konuşmada "Hediye seni bekliyor" → yeni köpek (sınır da aşılıyordu). Artık hediye bir kez (`wiz.plan` sonrası yalnızca veda / sinyal hatırlatması), `wizSell` ikinci kez çalışmaz, `spawnDog` `DOG_MAX`'ı asla aşmaz. Köpeği verince 0,7 sn sonra toz bulutuyla kaybolur (`wizVanish`).
- Zorunlu düzeltme: işaretsiz (`v69d` yok) her kayıt yüklenince köpek sayısı 1'e iner ve oyuncuya söylenir; işaret yalnızca düzeltme çalıştıktan ya da yeni oyundan sonra kayda yazılır. Headless Chromium'la eski kayıt taklidiyle denendi (3 → 1).
- Kazan düğmesinin simgesi artık cadı kazanı (kara kazan, yeşil kaynayan iksir, altında ateş).
- Gezgin'e hikâye yazılmayacak (Boğaç): onun kaybettiği kimse yok, eşini kaçıranlarla bağlantılı.
- v69.1 (Boğaç): eski kayıtlar (`v69e` işareti yok) yüklenince köpekler tamamen silinir (0), mor sinyal kuyruğu ve mesajlar temizlenir, Gezgin sıfırlanır; 5. gün geçmişse hemen gelir, konuşunca 1 köpek verir ve toz bulutuyla gider (20. günde mor sinyal için yine gelir). Headless Chromium'la uçtan uca denendi.
- v69.2: 20. gün dönüşü kalıyor (Boğaç); Gezgin ilk hediyeden sonra en erken ertesi gün döner (`wiz.goneDay`), 20. günü geçmiş kayıtta kaybolur kaybolmaz yeniden belirmez.

## v69.3 (26 Ekim 2026)
- Kazan tarif listesinde, öğrenilmiş ve elde yapılabilen bir tarifin malzemesi yetiyorsa satırda "+" düğmesi çıkar; basınca hemen elde yapılır (handCraft → renderCraft). Kod `<script id="v69">` içinde.
- Yunus yeniden çizildi (Boğaç'ın seçimi "S"): kavisli gövde, kısa gaga, geriye kıvrık sırt yüzgeci, yatay çatallı kuyruk, gri renk. 43x20 piksel ızgara `<script id="v67">` içinde DROWS/DPAL; bir kez offscreen canvas'a çizilip yay boyunca döndürülerek basılır. Zıplama len 56, yükseklik 24, süre 1.4 sn.

## v69.4 (26 Ekim 2026)
- Kazandaki "+" artık kazana konmuş malzemeleri de sayar (`potMiss`: pot.put geçici olarak inv'e eklenip missingFor bakılır). Envanter yetmiyor ama kazanla yetiyorsa "+" önce kazanı boşaltır (returnAll), sonra handCraft yapar; eşya envantere girer.

## v69.5 (26 Ekim 2026)
- Kazanda öğrenilecek tarifin malzeme satırlarında, o malzeme kendisi bir tarifse ve eksikse "+" çıkar (önceden yalnız örste vardı: `const sub=FG&&...` → `(FG||!foundSet.has(x.r))&&...`). Basınca quickBrew: malzemesi varsa 1 tane yapılır ve doğrudan kazana atılır; eksikse satırda ne eksik olduğu yazar. Tarif listesindeki v69.3 "+" (envantere yapar) yerinde kaldı.

## v69.6 (26 Ekim 2026) — acil düzeltme
- v69.5'te kazan açılmıyordu: satır içine eklenen `// v69.5` yorumu aynı satırdaki `let sb='';` bildirimini yoruma çevirdi → renderCraft "sb is not defined". Yorum silindi. Ders: tek satırlık kod satırlarının ortasına `//` yorum koyma.

## v69.7 (26 Ekim 2026)
- Kazan/örs malzeme satırı "+": alt tarif henüz ✓ (öğrenilmiş) olmasa da açıksa (isOpen) ve malzeme yetiyorsa yapılır, öğrenilir ve kazana atılır (canQuick artık foundSet istemiyor). Örn. Keskin taş eksikken envanterde 2 Taş varsa + çalışır.
- v69.3'teki tarif listesi "+" kaldırıldı (Boğaç: "+" yalnız seçilen bilinmeyen tarifin malzeme satırlarında olsun).
- Ekin'in akşam "meşaleni al / meşale yap" uyarısı (duskCheck) yalnız ilk 3 günde çıkar; 27. günde çıkması saçmaydı.

## v69.8 (26 Ekim 2026)
- Görevler sekmesi: her görev kartında "📌 Sağ üstte göster" düğmesi (Ekin'in ana görevi dahil). Seçilen yan görev sağ üstteki görev kartında yazar (`QS.pin`, v55-q içinde; kayda `v55.pin` olarak girer; görev bitince/yoksa Ekin'in ana görevine döner). Aynı düğmeye tekrar basınca ana göreve döner. Ders/eğitim kartları (tz, qPeek, lessonCard, tut<11) önceliklidir.
- "Takip et / Takibi bırak" düğmeleri yuvarlak hap düğmeler oldu (.qbtns .qb); takipteyken mavi "✓ Takip ediliyor", sağ üstteyken sarı "📌 Sağ üstte".

## v69.9 (26 Ekim 2026)
- Hep tek bir şey takip edilir: bir görev ya da bir tarif. Görev takip edilince tarif takibi düşer, tarif takip edilince görev takibi düşer (trackQ ↔ trackRecipe, `clrRec`, `window.__qglow`). Eski kayıtlarda yalnız sonuncusu kalır (QS.tr ve b3_trk slice(-1)).
- Takip edilen görevin istedikleri ekranın üstündeki çubukta (#b3trk) x/y çipleri olarak çıkar (`window.__qrow` v55-q'da; B3 rows() onu tarif yerine koyar; × ile takip bırakılır, `Q:<id>`). Görev kabul edilirken takip açılırsa da aynı kural.

## v70 (26 Ekim 2026)
- Hileler gizli: Ayarlar'daki "Hile modu", altındaki hile bloğu (#b5cheat) ve kırmızı hile paneli yalnız klavyede art arda c-h-e-a-t yazılınca görünür (ses + toast). Tekrar yazınca gizlenir ve bütün hileler kapanır. Kilit `localStorage['hammadde.cheatok']`; kilitliyken settings.cheat/b5inf/b5scn zorla kapatılır (Z/X da çalışmaz). Kod `<script id="v69c">`, CSS `body:not(.cheatok) ...{display:none}`.
- Yeni hile: "Bütün ara sahneler açık" (settings.b5scn). Açıkken Kitap › Keşif defteri'nin başında 24 sahne: açılış sineması (replay modu: bitince startWake çağrılmaz, oyundaki dalga sesi korunur), bütün anılar (openMem), Ada halkının sahneleri (`window.__plStory`, v59-story). Final ekranı listede yok (oyun durumunu değiştirir).

## v70.1 (26 Ekim 2026)
- Ev içinde mor ışık hiç zarar vermez: `roomSafe=()=>!!R.on` (eskiden yalnız lamba varsa güvenliydi). Lambasız odadaki mor pencere parıltısı yalnız görsel kaldı; uyarı mesajı artık çıkmaz.

## v70.2 (26 Ekim 2026)
- Yunus ters atlıyordu: sola giden yunusta açı zaten ~π iken bir de π ekleniyordu (burun arkada). Artık `rotate(ang)` + sola giderken `scale(1,-1)`: burun hep gidilen yöne bakar.
- Yunus %65 boyuta indi; zıplama len 42, yükseklik 20, süre 1.3 sn; gölge küçüldü.

## v70.3 (26 Ekim 2026)
- Gece ışığı da hile kilidinde: `label[for=nightlight]` yalnız cheat yazılınca görünür; kilitlenince settings.nightLight kapanır.
- Ekran kartıyla çiz: kutu işaretlenince hemen değil, Ayarlar Tamam ile kapanınca uygulanır (v68 script: `apply()` s-close tıklaması + closeSettings sarmalayıcı); "Ekran kartıyla çizim açık/kapalı · oyun yeniden açılıyor" uyarısı.
- Büyük harita: kişi simgeleri yakınlaştıkça büyür (sc=min(9,3+(mapZ-1)*.75)); simgeye dokununca ok oraya yön gösterir (MAPHITS, mapTap, GUIDE.__map, 60 sn).
- Sol menü simgeleri dünyadaki objelerden: Kazan (yeşil iksirli kara kazan, altında ateş), Pazar (kırmızı-beyaz tenteli tezgâh, mallar), Demirci (örs, kızgın demir, çekiç). Yemek düğmesi: but (et ve kemik).
- "İskelede söz" anısı → "Çay kıyısında söz": yeşil çayır, ağaçların altında, önden akan çay, piknik örtüsü, şarap şişesi ve kadehler.

## v70.4 (26 Ekim 2026)
- Kural (Boğaç): uzun zaman önce kaçırılan biri, kaçırılan kişinin yakınından büyük olamaz (iyi sonda hepsi kurtarılacak; çok yaşlıların ömrü yetmez).
  - Zümrüt (40 yıl önce, 12 yaşında): büyükannesi Ayşen Nine → altı yaşındaki kız kardeşi Ayşen. Hikâye, sahne ve görünüş (çocuk, siyah at kuyruğu, yeşil elbise) güncellendi; ay otunu hasta anneleri için aramaya gelmişler.
  - Kemal: annesi Hatice Ana → kızı Hatice (çırağı); hikâye, sahne, görünüş (kahverengi saç).
  - Ekin (40 yıl): eşi Saliha kalır, "benden on yaş gençti" eklendi.
  - Demirhan Usta (babası) "beş yıl önce", Kaan (ağabey) "iki yıl önce" olarak sahnelere yazıldı.
  - Diğerleri zaten küçük/akran: Cem, Gül, Defne, Ayaz, Deniz.

## v71 (26 Ekim 2026)
- Başarımlar (`<script id="v71">`): 22 başarım (ilk tarif, ilk gece, 25/100/250 tarif, ilk av, köprü, 7./30. gün, köpek, 10 balık, seviye 10/25, 10 yan görev, 1000 sikke (sınırsız sikke açıkken sayılmaz), 10 kurt, adanın yarısı, bütün izler, bütün anılar, kara ejder, kötü son = Sisli Ada'yı bulmadan ayrılmak (won&&!sisDone), iyi son = Sisli Ada'da eşini görmek (won&&sisDone)). Her birinin ikonu bir eşya ikonu (icon()).
- 1,5 sn'de bir kontrol; kazanılınca sağ altta altın kart (#achcard, 3,6 sn, sıra ile) + ses. Sağdaki ayarlar düğmesinin yanında madalya düğmesi (#b-ach) → liste (#achov), kazanılanlar altın + ★, kazanılmayanlar gri ikon.
- Kayıt cihaz başına ortak: localStorage 'hammadde.ach'. Eski kayıtta şartı zaten sağlananlar ilk açılışta kazanılır. `window.__plAch`.

## v71.1 (26 Ekim 2026)
- Başarımlar kare: liste kare kutu ızgarası (ikon + ad), kazanılan altın + ★; kazanılmayan gri ikon ve "???" adıyla. Üstüne gelince/dokununca kısa açıklama balonu (data-tip, ::after); gizlilerde "???". Kazanma kartı da kare (132×132).

## v71.2 (26 Ekim 2026)
- Evlilik teklifi anısında (MEMS[2]) hep erkek teklif eder: kadın kahramanda soldaki uzanan kişi eş (erkek), konuşmalar yer değiştirir (MEM2K/MEM2M, openMem başında memFix()).

## v71.3 (26 Ekim 2026)
- Telefonda hile açma: Ayarlar penceresindeki "Ayarlar" başlığına hızlıca (0,7 sn arayla) 3 kez dokun → hile ayarları açılır/gizlenir (klavyedeki "cheat" ile aynı, v69c).

## v72 (26 Ekim 2026)
- Ara sahne müziği (`<script id="v72">`): iki döngü OfflineAudioContext ile bir kez üretilir (audio.b5.mk/rendered/add): `mz_rom` (Do majör I–vi–IV–V, müzik kutusu + sıcak pad, 68 bpm) ve `mz_giz` (alçak La pedalı, minör kabarmalar, uzak cam çanlar, rüzgâr). Anılar romantik; "Mor bir delik", "Son akşam", "Mor fısıltı", "Bırakılan el" gizemli; Ada halkı sahneleri gizemli. #memov / #npcsc görünürlüğü MutationObserver ile izlenir; açıkken oyun müziği .12'ye iner, kapanınca 1'e döner. Açılış sineması kendi sesleriyle kalır.
- Telefonda 3 dokunuş düzeltildi: iPhone başlığa (h2) click göndermiyordu → pointerdown, 0,8 sn aralık, cursor:pointer, touch-action:manipulation.
- Ana menünün altında küçük "Versiyon 72" (#verlab). CLAUDE.md'ye her sürümde güncelleme kuralı eklendi.

## v73 (26 Ekim 2026)
- Süren etkiler (zehir, yanık, kanama) güçlendi: addFx'te dps ×1.3, süre ×1.6 (toplam hasar ~2 kat). Direnç/panzehir/ateşsiz/pıhtı yine uygulanır.
- Titreşim (`<script id="v73">`): Ayarlar'da yalnız telefonda görünen "Titreşim" (settings.vib, varsayılan açık). hurt() sarmalandı: can düşünce navigator.vibrate (hasara göre 35–160 ms, bayılınca çift). Süren etki tikleri titretmez. iPhone Safari navigator.vibrate desteklemez → ayarı açınca uyarı.
- Telefonda Ayarlar başlığına 3 dokunuşta titreşim (açılınca çift, kapanınca tek).
- Menüde "Versiyon 73".

## v74 (26 Ekim 2026)
- Yemek etkileri (`<script id="v74">`): bir yiyecek ilk kez yenene kadar Yemek listesinde "Bilgim yok"; yenince tokluk, can, enerji ve etkiler yazar (bilinenler kayıtta `v74.k`; eski kayıtta zehirli bilinenler bilinir).
  - Nadirlik r = log(fiyat+1)/log(400) (0–1). İyi etki süresi 45+r·300 sn, kötü etki süresi 25+r·110 sn.
  - İyi: pişmiş yemek anında can (4+r·30); değerli (r>.62) yemeğe ek Dayanıklılık (can sınırı +%20) ya da Şifa; meyve/içecek enerji (+10+r·45 anında ve Canlılık); çiğ meyve, kuruyemiş, sebze için RAWGOOD tablosu (Ceviz/Fındık/Kestane: Dayanıklılık, Havuç: Gece gözü, Kuşburnu: Şifa …).
  - Kötü (yalnız tuhaf şeylerde, ODD): çiğ et (Bulantı + Güçsüzlük), çiğ balık, çiğ mantarlar, çiğ baklagiller, çiğ yumurta, Meşe palamudu, Mürver, Gece sefası, Işık mantarı, Ateş biberi… Olasılık .95−r·.9 (en az .2, en çok .9; zehirlilerde her zaman). Yeni zehirler: Kuzugöbeği, Mağara mantarı, Ardıç meyvesi.
  - Yeni durumlar: Dayanıklılık, Ağırlık (hareket −%20), Halsizlik (enerji yarı hızda), Bulantı (can dolmaz), Güçsüzlük (vuruş −%20). STAT.hp/hpRe/stRe/move sarmalandı.
- ACT kartları (`<script id="v74b">`): açılış sinemasından sonra siyah ekranda "ACT 1 · Yıldızsız Ada"; adadan ayrılınca (Rüstem'le Sisli Ada'ya ya da gemiyle) "ACT 2 · Sisin ötesi". Sinema tekrarında çıkmaz.
- Menüde "Versiyon 74".

## v75 (27 Ekim 2026) — ACT 2'ye geçiş: Denizci Levent
- Eski son kaldırıldı: Kaptan Poyraz artık gelmez (tickKaptan kapalı), Rüstem ve Sisli Ada açılmaz (yüklemede kaptan.state='away', balikci.shown=false). Kod duruyor ama ulaşılmaz. Boğaç: "ACT 2 bir son değil, yeni bir başlangıç; sonu ayrı konuşacağız."
- Yeni tarif **Gemi** (Taşıtlar, alet Taş balta): 8 Herhangi kalas, 4 Halat, 3 Demir levha, 6 Hasır, 2 Kristal ipek. Ekin'in son görevi bitince `bought.add('Gemi')`; Ekin'in son teşekkürü gemiyi işaret eder.
- `const denizci` (ana betik, kaptan'ın altında): Mor Kristal Vadisi'nin (BIO 5) denize bakan kıyısının ortası; bx/by enkaz/gemi yeri. Gemi tarifi öğrenilince (foundSet) state='here', duyuru, ok 40 sn.
- Görevler (v55: giver 'denizci'): dz1 Kardelen merhemi + 2 Ay otu; dz2 2 Gölge kurdu; dz3 2 Ay taşı + 4 Kristal; dz4 gemi malzemeleri (= Gemi tarifi).
- Hikâye (v59 ST_.denizci): kızı Meltem, 6 yıl önce, 10 yaşında; sahne "Levent · Yanan deniz" (bg storm). dz4 teslim edilince Levent'le konuşunca hikâye tam açılır ve sahne oynar (`__plStory.first`); sahne kapanınca Levent "seni başka bir adaya götürebilirim" der.
- `<script id="v75">`: çizim (enkaz → dz4 sonrası drawBoat), konuşma (`window.__talkDz`), hedef/dokunma/istem/ok (ana betikte denizci satırları), son görev kartı (Gemi → Levent → Açık deniz), kayıt `v75{s,m,a}`.
- Deniz yolculuğu sineması (#voyov, 240×135 tuval, ~14 sn: gemi, küçülen ada, gün batımından geceye, ufukta mor parıltı, 3 altyazı, dalga + romantik müzik, Geç düğmesi/Esc) → "ACT 2 · Açık deniz" kartı → adaya dönülür (ACT 2 içeriği henüz yok), D.act2=true.
- Başarımlar: kötü/iyi son yerine "Kazazede" (dz4) ve "Açık deniz" (ACT 2).
- Menüde "Versiyon 75". Test yapılmadı (CLAUDE.md: yalnız chk.js).

## v76 (27 Ekim 2026) — ACT 2'nin ilk sürümü: ikinci ada, Ülker, portallar
- Plan ve kararlar: `proje/ACT2_TASARIM.md`.
- **Tek ada bellekte:** `const ISLE` (sessionStorage 'hammadde.isle', 1/2) T/W/H'den önce. Ada değişince kayıt yapılır, veri sessionStorage 'hammadde.pending'e konur, sayfa yükleme ekranıyla (#ldscr, body'nin başında, satır içi betikle hemen görünür) yeniden açılır ve otomatik yüklenir (v76 boot, 'load' sonrası).
- **İkinci ada üretimi:** fbm tohumu ISLE 2'de +400 (aynı boru hattı, başka kıyılar, ormanlar, sırt, nehirler). BNAME/BCOL: Yüzen Kayalar, Dev Mantar Ormanı, Hurda Çölü, Kristal Golem Ocağı, Ejder Volkanı, Gök Rıhtımı. Zemin renkleri `pal` üzerine yazılır. Köprü ve geçit ISLE 2'de açık. Bitki, maden ve hayvanlar **şimdilik ilk adanınkiler** (v77'den itibaren biyom biyom değişecek).
- **İlk adanın insanları ISLE 2'de yok:** konumları -1e5'e taşınır (npc, witch, cauldron, market, stall, smith, anvil, furnace, durmus, anvil2, farmer, usta, bench, lumber, alp, carp, toygar, hut, kaptan, balikci, lampman, dock, field, plots, FIRES, CLUES).
- **Kayıt biçimi:** üst düzey = ada 1 dünyası; `d.i2` = ada 2'nin x, y, exp, pl, gv, cp, tr; `d.isle` = bulunulan ada; `d.i2.arrive` ('land' | 'portal') ve `d.arrive1` (portal sahibi) varış yeri. applyState sarmalayıcısı başka adanın kaydını görünce o adaya yeniden yükler. ISLE 2'de snapshot ada 1 değerlerini saklanan I1'den geri yazar.
- **XTRA:** ana betikte genel etkileşim listesi (target, pickAt, istem, interact). Portallar ve Ülker bununla.
- **Gökbilimci Ülker** (Yüzen Kayalar, inişe ~24 karo): görevler gk1 4 kalas + 2 halat, gk2 bir gece bekle, gk3 2 kristal + 2 demir levha + 2 mor kıymık → portallar açılır (`v76.pk`). Hikâyesi (v59 ST_.gok, sahne "Ülker · Teleskoptaki göz"): uzay bilgisi, kaçırılan yakını yok.
- **Portallar:** ada 1'de Ekin, Zümrüt, Nazlı, Dursun, Hasan, Kemal, Börü, Rıza, Toygar'ın yanında; ada 2'de Ülker'in ve Levent'in yanında. Ücretsiz; ada 2'ye geçişte Ülker'in portalına, ada 1'e dönüşte Ekin'in portalına varılır.
- **Levent** ISLE 2'de iniş kıyısında, gemisiyle bekler. Deniz yolculuğu sonunda ACT 2 kartı → ikinci adaya iniş (travel 2,'land').
- **Hile:** Ayarlar › hile bloğunda "ACT 2'ye geç" (gemi, Levent görevleri, sahne tamam sayılır, adaya iner). Ara sahne listesine "ACT 2: Deniz yolculuğu" (tekrar izleme, geçiş yapmaz); Ülker'in sahnesi Ada halkı listesinden otomatik gelir. Hile malzeme paneline ACT 2 malzemeleri, eklendikçe CHEAT_RES'e eklenecek.
- Yeni oyun ISLE 2'deyken başlatılırsa sayfa ada 1'e yeniden açılır ve "Yeni oyun" kendiliğinden basılır.
- Menüde "Versiyon 76". Test yapılmadı (yalnız chk.js).

## v77 (27 Ekim 2026) — ACT 2: Yüzen Kayalar + Dev Mantar Ormanı, mor mana, Ateş asası, Büyücü Pervin
- İçerik üretimi: `scratchpad/act2/content.py` mantığı → `<script id="v77-data">` (window.__I2C: trees/plants/ores/anim/woodc/iconk/iconc; window.__I2TPL: 16×16 ikon şablonları). DB'ye fiyatlar, kalas/pişmiş et tarifleri, Mana iksiri (Şifa), Ateş asası (Büyü), Bulut yünü ip, Gök demiri külçesi, Spor ekmeği, Goblin eriği reçeli eklendi (gen77.py).
- v65 bloğu ISLE 2'de `I2C` ile biyom 0–1'in BTREE/BPLANT/BORE/BANIM satırlarını değiştirir (ağaç türleri, RES/RULE/PLANTC, MINES/ORE_TIER, ANIM/PACK). Biyom 2–5 şimdilik ilk adanın içeriği.
  - Yüzen Kayalar: Bulut çamı, Gök söğüdü, Rüzgâr meşesi, Bulut elması · Gök otu, Bulut pamuğu, Rüzgâr çiçeği, Tüy yosunu, Gök mantarı, Yüzer taş, Gök kumu, Rüzgâr kristali · Gök demiri, Bulut kuvarsı, Hafif taş · Bulut koyunu, Rüzgâr kuşu, Kaya kertenkelesi, Gök tazısı (gece), Fırtına kartalı.
  - Dev Mantar Ormanı: Dev mantar, Mavi mantar, Spor ağacı, Kök ağacı (Goblin eriği) · Spor tozu, Işıldak mantarı, Büyü otu, Goblin otu, Mantar şapkası, Sümük yosunu, Dev spor, Kök yumrusu · Spor kristali, Goblin bakırı, Kök taşı · Mantar böceği, Spor salyangozu, Goblin (sürü), Goblin okçusu (ok atar), Goblin şamanı (zehir atar).
- `<script id="v77">`: yeni eşyaların ikonları (PIXI), WOODC, RAWFOOD, hile malzeme listesine bütün ACT 2 malzemeleri (iki adada da), yaratık çizimleri.
- **Mor mana:** yeni çubuk (#mnbar, mor), en çok 100+3·(seviye−1), saniyede 1,5 dolar (Canlılık ile 2,25); Mana iksiri +60. ACT 2'de ya da Pervin'le tanışınca görünür. Kayıt `v77.mn/mo/pm`.
- **Ateş asası** (GT kind 'staff'): alet yuvasına konur; saldırı ateş topu atar (12 mana, 0,55 sn, 42·seviye çarpanı hasar, 270 px, en yakın hedefe ya da dokunulan yaratığa nişan). Mermiler `shots` (kendi rAF döngüsü), çizim v55Ents ile.
- **Büyücü Pervin** (Dev Mantar Ormanı'nın inişe en yakın yeri): görevler pv1 5 Büyü otu + 3 Işıldak mantarı (Mana iksiri tarifini açar), pv2 4 Goblin, pv3 3 Spor kristali + 3 Goblin kulağı (Ateş asası tarifini açar). Asayı ve iksiri o yapar (tarif öğrenilmiş + malzeme + emek). Hikâyesi (ST_.pervin): büyü yok, gemi artığı kıymık enerjisi.
- **Ülker'in kazanı:** ISLE 2'de kazan Ülker'in yanına taşındı (ACT 2 tarifleri burada öğrenilir).
- Menüde "Versiyon 77". Test yapılmadı (yalnız chk.js).

## v78 (27 Ekim 2026) — ACT 2: Hurda Çölü, ateşli silahlar, Silahçı Tamer
- İçerik üreteci depoya taşındı: `proje/tools/act2/` (content.py = biyom tabloları, icons.py = 16×16 ikon şablonları, gen_act2.py = DB fiyat/tarifleri + v77-data bloğu; `python3 proje/tools/act2/gen_act2.py`, tekrar çalıştırılabilir).
- Hurda Çölü (biyom 2): Hurda palmiyesi, Pas ağacı, Kuru çınar, Hurma · Hurda parçası, Pas tozu, Bakır tel, Çöl otu, Kaktüs meyvesi, Vida, Eski devre, Yağ birikintisi · Hurda yığını, Pirinç cevheri, Barut kayası · Pas böceği, Hurda faresi, Devriye robotu, Lazer dronu (ışın atar), Hurda devi.
- Yeni tarifler: Pirinç külçesi, Barut, Tabanca mermisi (bir yapışta 10), Pompalı fişeği (bir yapışta 6), Tabanca, Pompalı, Hurma ezmesi.
- v77'ye `window.__plFire(S,dm,hedef,açı)` ve `__plAim` eklendi (çizgi mermi, iz yoğunluğu).
- `<script id="v78">`: GT kind 'gun'; Tabanca (58 hasar, 0,42 sn, 340 px), Pompalı (5 saçma × 30, 1,05 sn, 210 px, ±0,26 rad). Mermi envanterden düşer, yoksa "mermi yok". Ateş sesi (gürültü patlaması), sarsıntı, kovan. handCraft sarmalayıcı: mermi tarifi bir kutu verir.
- **Silahçı Tamer** (Hurda Çölü'nün inişe en yakın yeri): sl1 8 Hurda parçası + 4 Bakır tel (Pirinç külçesi, Barut), sl2 3 Devriye robotu, sl3 2 Robot çekirdeği + 4 Barut (Tabanca + mermisi), sl4 Motor + 2 Ağır plaka (Pompalı + fişeği). Silahları o yapar (tarif Ülker'in kazanında öğrenilir). Hikâyesi (ST_.tamer, sahne "Eriyen gülleler", bg fort): gemiye karşı savaşan ordu; robotlar geminin bıraktığı bekçiler.
- Menüde "Versiyon 78". Test yapılmadı.

## v79 (27 Ekim 2026) — ACT 2: Kristal Golem Ocağı, Meka zırh, Buz asası, Mühendis Selin
- Kristal Golem Ocağı (biyom 3): Kristal çam, Taş ağacı, Mavi sedir, Kristal armut · Buz kristali, Golem tozu, Mavi yosun, Kaya çiçeği, Kristal mantarı, Enerji taşı, Gümüş kum, Kristal lifi · Kristal cevheri, Kobalt, Titanyum · Taş kaplumbağası, Buz tavşanı, Kristal golemcik (sürü), Kristal yarasası, Büyük golem.
- Tarifler: Kobalt/Titanyum külçesi, Enerji hücresi, Meka zırh (Zırh), Buz asası (Büyü), Kristal armut kompostosu, Pişmiş buz tavşanı eti.
- `<script id="v79">`: EQUIP['Meka zırh'] (gövde, savunma 90, zehir/yanık/kanama %50 direnç) + giyilince can sınırı ×1,25 ve hız ×1,12 (STAT sarmalayıcı). Buz asası (16 mana, 34 hasar, 3 sn dondurur): v77 STAFF'a eklenir (`window.__plStaff`), mermi `S.freeze` → `a.frz`; tickAnimals sarmalayıcısı donmuş yaratığı yerinde tutar, saldırtmaz; buzlu görünüm.
- **Mühendis Selin**: mk1 3 Enerji taşı + 4 Kristal cevheri (külçe/hücre tarifleri), mk2 3 Kristal golemcik, mk3 2 Titanyum plaka + 4 Golem parçası (Meka zırh tarifi). Zırhı o yapar (600 sikke). Hikâyesi (ST_.selin): gemi kaçırdıklarını sayıyor; sayı dolunca durmayı bekleyen bir şey.
- Pervin'e pv4 (Selin ile tanışınca): 4 Buz kristali + 2 Kristal kanat → Buz asası tarifi; Pervin yapar (200 sikke).
- Menüde "Versiyon 79". Test yapılmadı.

## v80 (27 Ekim 2026) — ACT 2: Ejder Volkanı, Işın kılıcı, Yıldırım asası, Ejder Avcısı Alara
- Ejder Volkanı (biyom 4): Kömür ağacı, Lav palmiyesi, Obsidyen dikeni, Ejder meyvesi · Lav çiçeği, Kükürt tozu, Ejder otu, Kor mantarı, Plazma taşı, Volkan külü, Obsidyen kırığı, Magma camı · Ejder kristali, Magma cevheri, Volkan demiri · Lav salyangozu, Kor kertenkelesi, Yavru ejder (ateş atar), Lav golemi, Kızıl ejder (patron gibi, 4200 can).
- Tarifler: Plazma hücresi, Işın kılıcı (Silah), Yıldırım asası (Büyü), Ejder meyvesi şerbeti, Pişmiş kor kertenkelesi eti.
- v77 mermi sistemi: `S.chain` (vurduğu yaratıktan 110 px içindeki bir sonrakine %80 hasarla sıçrar; `hs` kümesiyle aynı hedef iki kez vurulmaz).
- `<script id="v80">`: Işın kılıcı = GT 'sword', weapon() sarmalayıcı (120 hasar, 32 erim, 0,3 sn) + mavi plazma savuruşu ve vınlama. Yıldırım asası (22 mana, 72 hasar, 3 sıçrama). Ejderlerin çizimleri.
- **Ejder Avcısı Alara** (Ejder Volkanı): ej1 5 Lav çiçeği + 3 Magma cevheri (Plazma hücresi), ej2 3 Yavru ejder, ej3 3 Ejder dişi + 3 Plazma taşı (Işın kılıcı tarifi), ej4 Kızıl ejder (Ejder kalbi düşer; ACT 2 sonunda işe yarayacak). Kılıcı o yapar (800 sikke). Hikâyesi (ST_.alara): gemi motorunu soğutmak için plazmasını volkana boşaltıyor; ejderler bununla büyüdü.
- Pervin'e pv5 (Alara ile tanışınca): 3 Ejder kristali + 1 Magma çekirdeği → Yıldırım asası (Pervin yapar, 300 sikke).
- Menüde "Versiyon 80". Test yapılmadı.

## v81 (27 Ekim 2026) — ACT 2: Gök Rıhtımı, Astronot Tuna, roket, ACT 2'nin sonu
- Gök Rıhtımı (biyom 5): Gök kamışı, Bulut kavağı, Yıldız akasyası, Gök üzümü · Göktaşı tozu, Ay çiçeği, Gök ipeği, Meteor parçası, Füzyon taşı, Bulut özü, Yıldız mantarı, Gök camı parçası · Meteor demiri, Yıldız cevheri, Gök camı · Gök medüzü, Yıldız tilkisi, Uzaylı dronu (mor ışın), Gölge muhafız (kaçıranların askerleri, sürü), Gök bekçisi (6000 can, Yakıt hücresi düşürür).
- Tarifler: Meteor demiri külçesi, Yıldız külçesi, Roket gövdesi, Roket motoru (Ejder kalbi + Yakıt hücresi ister), Roket, Gök üzümü suyu, Pişmiş yıldız tilkisi eti.
- **Astronot Tuna** (Gök Rıhtımı, rampanın yanında): as1 4 Meteor parçası + 3 Gök camı (külçe tarifleri), as2 4 Uzaylı dronu, as3 3 Gölge muhafız, as4 Gök bekçisi (roket tarifleri), as5 Roket getir. Gövdeyi, motoru ve roketi o birleştirir. Hikâyesi (ST_.tuna): sevgilisi Nehir iki yıl önce gölge muhafızlarla savaşta yaralandı, ışık onu gemiye aldı; gemi topladıklarını saklıyor.
- Rampa çizimi (roket bitince üstünde roket). as5'ten sonra Tuna ile konuşunca **fırlatma sineması** (#rkov, ~15,6 sn: geri sayım, kalkış, adalar küçülür, gökyüzü kararır, mor gemi belirir, 4 altyazı) → "ACT 3 · Mor gemi" kartı → Gök Rıhtımı'na dönülür (ACT 3 yok). `tuna.launched` kayıtta (v81).
- Başarım "Gökyüzüne" (roket fırlatıldı). Hile ara sahne listesine "ACT 2 sonu: Roket" (tekrar izleme, sayılmaz).
- Menüde "Versiyon 81". Test yapılmadı.

## v82 (27 Ekim 2026) — ACT 2: eşin yeni anıları
- `<script id="v82">`: MEMS'e 5 ACT 2 anısı (act2:1, ev:[] → uyku/bayılma olaylarıyla gelmez): Sahildeki ışık (gk3), Yıldızsız yolcular (pv3), Şapka (sl4), Mor gemi (mk3), Son söz (ej4). Görev bitince `memUnlock` ile kuyruğa girer, sakin bir anda oynar.
- Konu (ACT2_TASARIM.md): eş ilk adanın kıyısında, biz baygınken mor ışıklı gemiye alındı; ışıkta pelerinli "yıldızsız yolcular" ve metal köpek vardı; biri bize şapkayı taktı ("onu sakin tutar"); gemide sayısız uyuyan yüz; son söz "Yıldızların ötesinde bile". Köpeğin kamerası ve şapkanın beyin kontrolü ACT 3'e saklı.
- memScene sarmalayıcısıyla 5 yeni sahne (gece kumsalı, ışık sütunu, pelerinliler, metal köpek, şapka, mor gemi, yükselen gemi). v72 müziğinde gizemli listede. Kitap › Anılar'da kilitliyken "ACT 2'de, ikinci adanın ustalarına yardım ettikçe".
- Menüde "Versiyon 82". Test yapılmadı.

## v83 (27 Ekim 2026)
- ACT 3 henüz yok: roket sinemasından ve "ACT 3 · Mor gemi" kartından sonra kısa bir son sahne (v81 içinde `hug`): mor geminin içi, kapsüller, eş kapsülden çıkıp koşar, sarılırlar, kalpler, 4 altyazı ("Buldun beni." / "Söz vermiştim. Yıldızların ötesinde bile."), romantik müzik. Ardından son kartı (#endov): mor "Purple Light", "Yeniden birliktesiniz.", "Hikâye ACT 3 ile devam edecek." + Oyuna devam et / Ana menü.
- Ana menüye "Hakkında" (#about, `<script id="v83">`): mor "Purple Light", altında "Bir Boğaç Çavdar oyunu." (şirket, ekip, test eden isimleri sonra). Piksel portre denendi, Boğaç beğenmedi; eklenmedi.
- Ekin artık başta spoiler vermiyor: "ışık yukarı götürür" sözü kalktı ("Deniz bazen insandan en sevdiğini alır; ama umudu alamaz"); isim sonrası "Kaybettiğini soran çok olur…"; kendi hikâyesinde "mor ışık yükseldi" yerine "gökyüzü tuhaf bir renge boyandı". Gerçek, görevlerle yavaş yavaş açılır.
- Rastgele isimler: erkek (kahraman + erkek eş) Boğaç, Selçuk, Tolga, Alp, Anıl, Rıdvan, Cumhur, Enes, Engin, Mehmet, Mertcan, Derman, Eren, Halil, Doğukan, Cengiz; kadın (kahraman + kadın eş) Aysel, Su, Cemre, Tuğçe, Nilgün, Hilal, Büşra, Gül, Gülnihal, Ilgın, Selen, Dünya (olmayanlar eklendi).
- Menüde "Versiyon 83". Test yapılmadı.

## v84 (27 Ekim 2026)
- Hakkında: "Bir Boğaçhan Çavdar oyunu." Menüde "Versiyon 84".

## v85 (27 Ekim 2026)
- Hakkında: yazılar tırnaklı ("Purple Light", "Bir Boğaçhan Çavdar oyunu."). Menüde "Versiyon 85".

## v86 (27 Ekim 2026)
- Hakkında: Purple Light tırnaksız; altında Bir “Boğaçhan Çavdar” oyunu. Menüde "Versiyon 86".

## v87 (27 Ekim 2026)
- Hakkında: “Boğaçhan Çavdar” kalın ve altın sarısı. Menüde "Versiyon 87".

## v88 (27 Ekim 2026)
- Ayarlar: **Tam ekran** anahtarı (bilgisayar ve Android; iPhone'da gizli). Tercih localStorage `hammadde.fs`; açıksa oyun yeniden açılınca ilk tıklama/tuşta tam ekrana geçer. Tam ekranda Keyboard Lock ile Esc oyuna gider (Chrome/Edge; çıkmak için Esc basılı tutulur). Eski `s-full` düğmesi gizlendi.
- Ayarlar: **Çözünürlük** (Otomatik/Yüksek/Orta/Düşük) → `hammadde.res`. PERF.cap bir getter oldu: Otomatik iken izleyicinin değeri, diğerlerinde devicePixelRatio × 1/0.75/0.5 (en az 0.5). Hemen uygulanır.
- Menüde "Versiyon 88".

## v89 (27 Ekim 2026)
- Mavi parıltı (`gl`): parıltı geçişlerinden sonra nesnenin temiz bir kopyası en üste çiziliyor; `lighter` geçişi kalktı (nesnenin üstünde çizgi/şerit olmuyor).
- Hile: "cheat" yazma ve telefonda Ayarlar başlığına 3 dokunuş yalnızca ana menüde (`onTitle`) çalışır. Oyun içinde Ayarlar'da hile anahtarları (cheat, b5inf, b5scn, gece ışığı) gizli (`body.setgame`); hile açıksa yalnızca eylem düğmeleri (ACT 2, seviye, harita) görünür. Ana menüde eylem düğmeleri gizli (`body.settitle`). `openSettings` sarmalandı.
- Gizli başarım `hile` "Oyunlardaki gibi" (simge Mor pusula): hile ana menüde açılınca anında verilir (`__plAch.grant`), localStorage `hammadde.cheatach`; daha önce `cheatok` olanlara da verilir. Başarımlar cihaz genelinde, her kayıtta görünür.
- Tuna hikâyesi 4. parça: "Keşke her şey oyunlardaki gibi olsa… ana menüde “cheat” yazmıştım…" ipucu.
- Tam ekran varsayılan: `hammadde.fs` yoksa da ilk tıklama/tuşta tam ekran; yalnızca kullanıcı kapatırsa (`0`) açılmaz.
- Menüde "Versiyon 89".

## v90 (27 Ekim 2026)
- v89 hatası: `b-set`/`p-set` eski `openSettings`'i doğrudan tuttuğu için sarmalayıcı çalışmıyordu; ana menüden açılan `settitle` sınıfı oyunda kalıyor, ACT 2/seviye/harita düğmeleri gizleniyordu. Artık sınıflar `#settings` görünürlüğü (MutationObserver) ve 0,5 sn'lik kontrolle `onTitle`'a göre konuyor.
- Gece ışığı anahtarı kırmızı hile bölümünün (`#b5cheat`) içine taşındı; etkisi de yalnızca hile açıkken (`lampOn`: `settings.nightLight&&settings.cheat`).
- Ana menüdeki hile bölümünde not: ACT 2'ye geç / seviye / harita düğmeleri oyun içindeki Ayarlar'da.
- Menüde "Versiyon 90".

## v91 (27 Ekim 2026)
- Ana menüdeki Ayarlar'da hileden yalnızca "Hile modu" anahtarı var (`body.settitle #b5cheat` gizli). Oyun içinde hile anahtarı gizli, `#b5cheat`'in hepsi (sınırsız sikke, ara sahneler, gece ışığı, ACT 2, seviye, harita) hile açıkken görünür. b5tnote kaldırıldı.
- Tam ekran: tarayıcı sekmesinde tıklamasız tam ekran mümkün değil (kullanıcı hareketi şart). Yüklü uygulama (manifest `display: fullscreen`) Android'de doğrudan tam ekran açılır.
- Menüde "Versiyon 91".

## v92 (27 Ekim 2026)
- `<script id="v92">`: Başarımlar düğmesi (`#b-ach`) masaüstünde `#b-char`'ın hemen soluna sabitlenir (0,4 sn'de bir ve resize'da `placeAch`); telefonda (`v50m`) DOM'da b-char'ın arkasına taşınır. Sağ sütun artık Çıkış → Ayarlar.
- Envanterde ekipman şeridi (`.ieq`): küçük karakter figürü (`#ieqc`, eqLook/eqOpts ile, silah dahil) + 5 yuva (Baş, Gövde, Eller, Ayaklar, Silah). Seçili eşyanın yuvası sarı parlar; dokununca giyilir. Dolu yuvaya dokununca çıkarılır. Boş yuvaya uyan tek eşya varsa doğrudan giyilir. `renderInvPanel` sarmalandı.
- Kask/şapka altında saç: `spiky` ve `bun` saçlar miğfer ya da şapka varken çizilmez (önden, arkadan, yandan). Miğfer zaten şapka/bandana/çiçeğin yerine çiziliyordu.
- Menüde "Versiyon 92".

## v93 (27 Ekim 2026) — kritik düzeltme
- Ekin'in 13 görevi bitince (Gemi tarifi henüz öğrenilmemişken) `renderTut` her çağrıda `haveOf is not defined` hatası veriyordu: `haveOf` v48-b3 bloğunun eval kapsamında, ana kodda görünmüyor. Sonuç: diyaloglar kapanmıyor (`bye` → renderTut hata), "Görevi bitirdim" döngüye giriyor, ACT 2'ye geçilemiyordu. "Son · Bir gemi" kartındaki sayaç artık `expand(n)` ile envanterden sayıyor.
- Menüde "Versiyon 93". Yalnız chk.js (0 hata).

## v94 (27 Ekim 2026)
- Ses: `audio.hold(on)` (AudioContext suspend/resume). `<script id="v94">`: sayfa gizlenince (ekran kilidi, uygulama değişimi: visibilitychange, pagehide, telefonda blur) ses durur, geri gelince devam eder. Neden: iOS'ta `audioSession.type='playback'` sesi kilit ekranında da çalıyordu.
- Tam ekran telefonda yok: v88 anahtarı ve otomatik tam ekran yalnızca dokunmatik olmayan cihazlarda; `r-full` ve `s-full` dokunmatikte gizli.
- Ayarlar: köşede × düğmesi (sticky) ve karanlık arka plana dokununca kapanma (ikisi de `s-close`'u tıklar). Ana menüde Ayarlar'dan çıkılamıyor raporu için; olası neden telefonda ilk dokunuşta açılan tam ekranın tıklamayı yutmasıydı.
- Hile (telefon): ana menüde boş bir yere (logo dahil, düğmeler hariç) 0,8 sn arayla 3 dokunuş da hile anahtarını açar/kapar (Ayarlar başlığındaki 3 dokunuşu tetikler).
- Menüde "Versiyon 94".

## v95 (27 Ekim 2026)
- Tuna'nın hile ipucu ve "Oyunlardaki gibi" başarımının açıklaması cihaza göre: dokunmatikte "ana menüde ekrana art arda 3 kez dokunmuştum", klavyede "“cheat” yazmıştım" (`TOUCH`).
- Menüde "Versiyon 95".

## v96 (27 Ekim 2026) — kritik düzeltme (ACT 2)
- ACT 2 ustaları (Pervin, Tamer, Selin, Alara, Tuna) hiç görev teklif etmiyordu: v55 `say` sarmalayıcısı görev seçeneğini yalnız birden fazla seçenekli konuşmalara ekliyordu (`ch.length>1`); bu ustaların konuşmalarında tek seçenek ("Hoşça kal") var. Koşul `ch.length>1||c.t==='Hoşça kal'` oldu. ACT 2 Ülker'den sonra ilerlemiyordu, roket ve ACT 2 sonu ulaşılamazdı.
- Menüde "Versiyon 96". Yalnız chk.js (0 hata) + Claude'un kayıttan yükleyip Pervin'le denemesi (görev teklifi geliyor).

## v97 (27 Ekim 2026)
- Ana menüde Ayarlar'ın solunda madalya düğmesi (`#t-ach`, `.tib`): başarımlar listesini açar (cihazdaki bütün oyunlarda kazanılanlar, `hammadde.ach`). Köşede kazanılan sayısı (`#t-achn`).
- Menüde "Versiyon 97".

## v98 (27 Ekim 2026)
- Başarımlar 23 → 36, hepsinin simgesi farklı (eşya ikonları). Yeni: İlk düşüş / İnatçı (`deaths` ≥1 / ≥5), İlk reis / Reis avcısı / Reislerin korkusu / Reis yiyen (farklı reis türü ≥1/5/10/20, `__p4.s.bd`), Bütün reisler (`__p4AB` ada 1 türleri + `__I2C.anim`, Kara ejder hariç: 58 tür), Yol açıcı (`rockfall.cleared`), Her şeyi bilen (bütün `DB.R`), Toplayıcı (`__I1G` ada 1 bitki+maden + `__I2C` plants/ores; `__p4.s.g`'de en az 1), Yeniden birlikte (iyi son: sarılma sahnesi bitince `grant('iyison')`, tekrar izlemede verilmez), Yalnız dönüş (kötü son: `window.__plBadEnd`, kötü son henüz yok → şimdilik kazanılamaz).
- "İlk gece" → "İlk gün" (İlk günü ve geceyi hayatta atlat). Köprücü ve Açık deniz (ACT 2) zaten vardı.
- `window.__p4AB` (v49-p4) ve `window.__I1G` (v65) dışa açıldı.
- Menüde "Versiyon 98".

## v99 (27 Ekim 2026)
- Toplayıcı başarımı artık yerden toplama anını sayıyor: düğüm/maden (`tg.n.name`) ve kil/kum (`g.name`) toplandığında `window.__plGot(ad)` → localStorage `hammadde.gath` (cihaz geneli küme). Eskiden yalnızca envantere giren eşya adına (`__p4.s.g`) bakıyordu; o da hâlâ sayılıyor.
- Menüde "Versiyon 99".

## v100 (27 Ekim 2026)
- Başarımlar 36 → 41. Yeni: Maden kâşifi (iki adanın her madeni, `__I1O` + I2C ores, `gotOf`), Oduncu (her ağaç türü, `treeChopped` sarmalandı → localStorage `hammadde.tree`; `__I1T` + I2C trees), Avcıların avcısı (her canlı türü, `__I1A` = ada 1 BANIM + I2C anim; öldürülenler `hammadde.kill`), Ganimet avcısı (canlılardan düşebilecek her eşya, ANIM/I2C drops; envanterde görülenler `hammadde.items`), **Platin** (bütün başarımlar; listede üstte platin şerit, kendi gümüş-beyaz kupa simgesi `PLAT`).
- Liste: `SECRET` kümesi (iz, ani, ejder, levent, roket, act2, iyison, kotuson, hile, kaya, kopru) kazanılana kadar ???; diğerleri adıyla ve açıklamasıyla gri görünür. `PROG` olanlarda çubuk + "x / y". En iyi ilerleme localStorage `hammadde.achp`'de (ana menüde de görünür); `track()` her `check()`te.
- Ada 1 listeleri ada 2 üzerine yazmadan önce `window.__I1T`, `__I1O`, `__I1A` olarak saklanıyor. Bütün reisler artık `allAnim()` − Kara ejder − `ANIM[k].boss`.
- Menüde "Versiyon 100".

## v101 (27 Ekim 2026)
- "Yeni" başarımlar: localStorage `hammadde.achseen` (görülenler; ilk açılışta o ana kadar kazanılanların hepsi görülmüş sayılır). Kazanılmış ama görülmemiş kart `li.new`: köşede sarı "YENİ" etiketi ve parlama; fareyle üstüne gelince, odaklanınca ya da dokununca görülür olur.
- Sayaçlar artık yalnızca yeni olanları sayar: ana menüdeki madalya (`#t-achn`) ve oyun içindeki başarımlar düğmesi (`#b-achn`, yeni).
- Menüde "Versiyon 101".

## v102 (27 Ekim 2026)
- Önceden kazanılan başarımlar da ilk açılışta "YENİ" görünür: görülenler kümesi yeni anahtarda (`hammadde.achseen2`) boş başlar (v101'in `hammadde.achseen` anahtarı artık kullanılmıyor). Sayaç oyuncu kartlara baktıkça azalır.
- Menüde "Versiyon 102".

## v103 (27 Ekim 2026) — Claude'un oyun turunda bulduğu hataların düzeltmesi
- Bitiş kartı (#endov) açıkken dünya durur (`fading`); kartın arkasında yaratık vurmaz.
- Mor izler (CLUES) tıklayınca/dokununca da alınır (`pickAt`'te iz hedefi). İmlecin tam altındaki malzeme, arkasındaki kişiden önce seçilir.
- Ekin'in demir görevi Toygar'la tanışmadan "Toygar'ın dediği gibi" demez. Ekin'in "Sen buraya nasıl geldin?" seçeneği "Gemin nasıl battı?" oldu (📖 hikâye seçeneğiyle aynı soruyordu).
- İkinci adada bayılınca konuşan Ülker (Ekin değil). Eşya kaybı yoksa düğme "Anladım".
- ACT 2'ye geçince görev kartı "Son · Açık deniz"de takılı kalmaz (ACT 2 / portal yazısı).
- "Şapka" anısı oyuncunun seçtiği şapkayla çelişmiyor: yolcular başına bir şey dokunduruyor; "köpek ve fener satan" yolcular.
- Zümrüt meşale dersi: önce meşaleyi eline al, sonra 4 taş; gündüz meşale tutma uyarısı. Yeme dersi bitince Yemek penceresi kapanır.
- Koşu dersi uyarısı Ekin'in görevleri bitince / ACT 2'de görünmez. Ad kutusuna diyalogdan kalan rakam yazılmaz.
- Örsten sonra takip çubuğu "Baltayı eline al" gösterir. Elde asa/silah varken ipucu "ateş et · <silah>" der.
- Zaten tamamlanmış her Ekin görevi kabul edilirken hemen biter (eskiden yalnız seviye görevleri).
- Kayıtta sıfır adetli envanter girdileri yazılmaz. Deniz yolculuğunda tekne sallanırken bulanıklaşmaz.
- Alet karelerinde ad "T a.." diye kesilmiyordu: Dursun'un `.tool` satır stili `.tile.tool`'a da uyuyordu (`.tool:not(.tile)`).
- Yol bulma: `findPath` 4 px ızgara (sığarsa) ve yolu seyreltmez; ağaç gövdesinin köşesinde "Oraya buradan gidilemiyor" kalmaz. Oyuncu katı bir şeyin içinde kalırsa en yakın boş yere çıkar.
- Ana menü adası: sağdaki burun düz bir blok yerine denize iner; sis şeridi dikişsiz döner (dikey kesik kayboldu).
- `<script id="v103">`: "Yeni malzeme" afişi açık pencerelerin üstüne değil altına; masaüstünde kazan/örs paneli tarif seçince zıplamaz; yerdeki malzeme bir kişinin üstünde kalırsa yanına taşınır; bayılınca görev eşyaları (Kaya patlatıcı, Ejder kalbi, Yakıt hücresi, roket parçaları, açık yan görevlerin istedikleri, Ekin'in tunç/demir görevindeki külçe) çantada kalır; aynı anda en çok 4 yaratık kovalar; Demir kılıç, Tunç kılıç ve Gemi'nin kendi ikonu var.
- Kontrol: chk.js 0 hata; Boğaç'ın bu sohbette istediği test turu kapsamında headless Chromium ile tek tek denendi (yol bulma, iz tıklama, alet karesi, ikinci adada bayılma, ACT 2 kartı, ana menü adası).
- Menüde "Versiyon 103".

## v104 (27 Ekim 2026) — "Şapka" anısı, Boğaç'ın kurgusuna göre
- Şapka, yıldızsızların bedenimizden bilgi ve anı çalmak için kullandığı şey (köpekler izlemek için). v82 "Şapka" anısının satırları artık açılırken kuruluyor (MEMS getter): karakterde şapka varsa yolcular şapkanın içine soğuk, metal bir şey yerleştiriyor; yoksa başına bir şapka geçiriyorlar. Yeni satır: "O günden beri anıların hep yarım… sanki biri onları tek tek okuyup götürüyor." ACT2_TASARIM.md'deki ACT 3 notu da güncellendi.
- Menüde "Versiyon 104". chk.js 0 hata.

## v105 (27 Ekim 2026) — Arena (dövüş mekaniklerini deneme alanı)
- Ana menüde "Yükle"nin altında **⚔ Arena** düğmesi (`#t-arena`). Kilitli (gri, "Kilitli · oyunu bitir ya da hile modunu aç") ta ki iyi/kötü son başarımı (`hammadde.ach` içinde `iyison`/`kotuson`) kazanılana ya da hile modu (`hammadde.cheatok`='1') açılana kadar; 0,8 sn'de bir yeniden bakılır.
- `<script id="v105-arena">` + `<style id="v105-arena-css">` (en sonda; sarmalayıcıların en dışı). Arena atılacak bir oyun başlatır: `applyState(null)`, son kayıttaki karakter görünüşü (`lk`), bütün yetenekler açık, seviye seçilebilir (1/10/25/50, varsayılan 25), gün ortası sabit, hava açık, kendiliğinden canlı/reis/gece canlısı doğmaz.
- Halka: adanın Yurt bölgesinde, bütün NPC'lerden, ateşlerden ve köprüden uzak, 10 karelik kuru/ulaşılır bir çayır (`findCenter`); içindeki ağaçlar ve düğümler kalkar, zeminde taş halka ve 8 mangal (`drawGraves` ve `v55Ents` sarmalandı).
- Seçim ekranı (`#arov`): solda karakter figürü + yuvalar (Baş, Gövde, Ayaklar, Elde, Eller; figürün kafasına/gövdesine/ayağına dokunmak da yuvayı seçer), altta o yuvaya uyan **bütün** eşyalar (`EQUIP`) ya da elde tutulacak bütün silah/aletler (`GT` türleri sword, hunt, staff, gun, axe, pick, torch + yumruk). Sağda iki adanın bütün canlıları bölge bölge (ada 1: `window.__I1B`, ada 2: `__I2C.anim`; birinci adadayken ada 2 canlıları `ANIM` ve `__I2A`'ya eklenir), portre, can/hasar/hız, mizaç ve özellik etiketleri; her kartta **Dövüş** ve **♛ Reis** (Kara ejder hariç; `__p4.makeBoss`). Kaç tane: 1/2/3/5.
- Kimsenin canı azalmaz: `hurt` ve `tickFx` hasarı gösterir (sayı, kırmızı ekran, sarsıntı) ama can geri dolar; `faint`/`knockedOut` arenada işlemez; `killAnimal` arenada işlemez, canlının çubuğu düşer ve 1,4 sn sonra (ya da 0'ın altına inince hemen) dolar. Enerji, mana (`__plMana.on/max` eklendi) ve mermi sınırsız, aletler körelmez.
- Üst şerit (`#arhud`): rakip adı, verilen hasar (toplam, son vuruş, 5 sn ortalaması /sn), alınan hasar (toplam, son); Seçim, ↻ Yeniden (aynı rakibi baştan getirir, oyuncuyu halkanın ortasına alır), Kızdır (nötr canlılar da saldırır), Çık. Halkadan çok uzaklaşan canlı geri gelir.
- Hiçbir şey kaydedilmez (`saveTo`, `snapshot`, hot snapshot), başarım/cihaz sayaçları işlemez (v71 `check`, `gput`, `__plGot` `window.__plArena`'ya bakar). Çıkış (Çık, Esc menüsünde "Ana menüye dön", Çıkış düğmesi) sayfayı yeniden yükler; dünya temiz açılır. Duraklat menüsünde kaydet/yükle/aktar gizli.
- Oyuna da yarayan düzeltme (v49-p4): v65 ve ACT 2 canlılarının reisleri gri kurt gibi çiziliyordu (reis çizimi p4'ün iç çizicisini çağırıyordu). Artık `window.__p2ART`'ta olmayan türlerin reisi bütün çizim zincirinden geçer ve elle büyütülür.
- `window.__I1B` (v65, ada 1 bölge listeleri), `window.__p2ART` (v49-p2), `__p4.makeBoss`/`__p4.BIG` dışa açıldı.
- Menüde "Versiyon 105". Kontrol: chk.js 0 hata (Boğaç'ın kuralı gereği başka test yapılmadı).

## v106 (27 Ekim 2026) — Arena sınırı
- Arena halkası duvar oldu: `blocked` sarmalandı; arenadayken halkanın merkezinden `AR.R-6` (138 px) uzağı dolu sayılır. Oyuncu yürüyerek, koşarak, atılarak ya da savrularak çıkamaz; canlılar (`moveA`, geri tepme, hamle) da çıkamaz. Asa mermileri kenarda söner (onlar da `blocked`'a bakıyor); canlıların attıkları kenardan geçebilir.
- Menüde "Versiyon 106". chk.js 0 hata.

## v107 (27 Ekim 2026) — Arena yalnızca dövüş
- Arenada (`body.arena`) dövüş dışı her şey gizli: saat, tokluk, sikke, görev, menü çubuğu, sağ sütun (çıkış, ayarlar, karakter, harita), başarım ve yemek düğmeleri, seviye/XP, alet kutuları, toplama çubuğu, takip çubuğu ve okları, E düğmesi, yazılı ipuçları (`#prompt:not(.act)`). Kalanlar: can/enerji/mana, etki çubuğu, dokunmatikte joystick, Atıl ve hedefteki eylem düğmesi, Arena şeridi.
- Tuşlar: arenada yalnızca WASD, oklar, Shift (koş), Boşluk (vur), Q (atıl) ve Esc geçer (`AR.keys`, window capture; tuş ataması çevrilmiş olayı da süzer). Fare tekerleği kapalı. Silah/zırh yalnızca Seçim ekranından.
- Halkanın dışı karanlık (`drawAmbient` sarmalandı: kalın koyu çember + yumuşak kenar); ada görünmez.
- Her seçimde arenada **tek** canlı belirir (öncekinin yerini alır; "Kaç tane" kalktı). Rakip hasar almaz: vuruş sayısı, parlama, savrulma görünür ama can her karede dolar ve `drawAnimal` arena canlısını hep tam canla çizer (çubuk inmez). Verilen hasar şeritte sayılır.
- Menüde "Versiyon 107". chk.js 0 hata.

## v108 (27 Ekim 2026) — Arena adadan bağımsız bir yer
- Arenadayken adanın hiçbir şeyi çizilmez: `drawGround` yerine koyu bir zemin ve arena tabanı; `drawSeaPad`, `drawField`, `drawWater`, `drawPier`, `drawBridge`, `drawTufts`, `drawGlints`, `drawDrops`, `drawGraves`, `drawClues`, `drawWaterHint`, `drawV46World` arenada boş; `drawAmbient` yerine duvar + tribün resmi.
- İki resim bir kez piksel piksel çizilir (`mkArena`, `AW.floor` / `AW.outer`): tırmıklanmış kum taban, kenarda iki sıra taş döşeme, ortada mor mühür ve çapraz kılıçlar, mor iç çember; taş duvar (harçlı bloklar), dışında kat kat tribün ve renkli seyirciler, sonra karanlık. Duvarın üstünde 8 mangal. Duvar/tribün resmi dünyadaki her şeyin (ağaç, kişi) üstüne çizildiği için halkanın dışı görünmez.
- Halka çizimi (`drawRing`, `drawGraves`/`v55Ents` kancaları) kalktı. Sınır aynı (`blocked`, `AR.R-6`).
- Menüde "Versiyon 108". chk.js 0 hata.

## v109 (27 Ekim 2026) — Elde silahla E ve sol tık saldırır (oyun geneli)
- `weaponHeld()`: elde kılıç, mızrak, asa ya da ateşli silah (`GT` türü sword/hunt/staff/gun) var mı. Balta, kazma, meşale ve boş el eskisi gibi.
- E: elde silah varken `attack()` (Boşluk gibi). Hedef bir kişi/istasyon/özel şeyse (`E_TALK`: npc, pot, witch, farmer, market, smith, durmus, trader, wiz, usta, alp, carp, denizci, kaptan, toygar, xtra, lamp, balik, dog, placed, grave, clue, bridge, rockfall, v46) E yine konuşur/kullanır; böylece silah elde dururken de konuşulabilir, çanta ve mor izler alınabilir.
- Sol tık (fare): elde silah varken tıklanan yöne hemen vurur (`attack({x,y})`; bir canlıya tıklanırsa ona döner, asa/silah oraya nişan alır), yürümez. Tıklanan yer `E_TALK` türündeyse eskisi gibi oraya yürünür. Dokunmatik değişmedi.
- Arena: E de geçen tuşlara eklendi (`AR.keys`).
- Menüde "Versiyon 109". chk.js 0 hata.

## v110 (27 Ekim 2026) — Savuşturma (parry) ve renkli saldırılar
- `<script id="v110-parry">` (en sonda). **Sağ tık** savuşturma penceresini açar: `WIN=0,2 sn` içinde inen vuruş savuşturulur. Bekleme `CD=0,6 sn` (başarılı olunca 0,15 sn), 5 enerji. Dokunmatikte Atıl'ın solunda **Savuş** düğmesi (`#parrybtn`, Atıl'ın yerine göre konumlanır).
- Her hamle hazırlığının (`a.wind`) bir rengi var (`a.atkT`, hazırlık başlarken `roll`): beyaz = normal, sarı = ağır (hasar ×1,4, hazırlık +0,18 sn), kırmızı = savuşturulamaz (hasar ×1,7, hazırlık +0,3 sn). Reisler: %30 kırmızı, %35 sarı; ağır türler (`HEAVY` ya da can ≥300): %20 kırmızı, %30 sarı; hasarı ≥8 ve canı ≥35 olanlar: %30 sarı; menzilliler hep beyaz. Renk, başın üstündeki "!" (kırmızıda çift "!!" ve titreyen halka) ve yere düşen hedef halkasıyla görünür; eski kırmızı hazırlık çizimi bu renkli çizimle değişti (`drawAnimal` sarmalandı).
- Savuşturma: hasar yok, canavar geri savrulur ve sersemler (`a.stun` 1,6 sn, reis 1,1 sn; başının üstünde dönen yıldızlar; yerinden kımıldamaz, hazırlık/hamle/yere vurma iptal), kısa duraklama, çınlama sesi, kıvılcım, +6 enerji, "Savuşturuldu!". Fırlatılanlar (diken, tükürük, ateş) da pencerede savuşturulur. Kırmızı vuruş ve reisin yere vurması savuşturulamaz.
- Boğaç'ın isteği: oyuncu ne zaman savuşturacağını, atılacağını, vuracağını kendisi bulur; açıklayıcı ipucu ya da "Erken" yazısı yok.
- Menüde "Versiyon 110". chk.js 0 hata.

## v111 (27 Ekim 2026) — Canavarların özel hamleleri; Arena yalnız bilgisayarda
- `<script id="v111-moves">` (en sonda). Türlere göre özel hamleler (`SP`), kovalarken arada bir sıradan ısırık yerine biri başlar (`mvCd` 3,6–6,2 sn, reiste 2,6–5,2; ilk 1,2–3,2 sn). Her hamle önce yerde işaretlenir ve başında v110 renkli "!" çıkar:
  - **Sıçrama** (sarı; iri türlerde/reiste kırmızı): çömelir (işaret seni izler), sonra kilitlenen yere 0,42 sn'de atlar (gölge yerde kalır), inişte çevresine vurur (×1,3) ve iter.
  - **Hücum** (sarı/kırmızı): yönünü bir şeritle gösterir, sonra o hatta koşar (çarpınca ×1,2 ve uzağa iter), duvara ya da engele çarpınca durur; ardından 0,55 sn yorgun bekler.
  - **Sersemleten kükreme** (kırmızı): çevresinde büyüyen halka; patlayınca içindeysen hasar (×0,5) ve 1,1 sn sersemlersin.
  - **Alev püskürtme** (kırmızı): koni; 0,75 sn yanar, içindeysen 0,14 sn'de bir hasar ve yanık.
  - **Buz parçaları** (beyaz, 3 parça): değerse 1,3 sn donarsın. **Ağ** (beyaz): 3 sn yavaşlarsın (%45 hız). **Şok** (beyaz): 0,8 sn sersemlersin.
  - **Zehir gölü**: üstüne fırlatılan zehir düştüğü yerde 5 sn kalan bir gölcük olur; içinde zehir ve hasar.
  - Reislerin hepsinde kükreme de var. Atılma ve dokunulmazlık hepsinden korur; savuşturma beyaz ve sarıyı çevirir (fırlatılanlar dahil), kırmızıyı çeviremez. Savuşturulan canavar sersemler ve hamlesi biter.
- Oyuncu durumları (`PS`, `window.__plPS`): sersem ve donmuş iken yürüyemez, vuramaz, atılamaz, savuşturamaz (yıldızlar / buz kalıbı); yavaşken ağ çizgileri. `resetState` sıfırlar.
- v110'dan `window.__plParryHit` dışa açıldı; arena kartlarında canlının hamleleri etiket olarak görünür (`window.__plMovesOf`).
- Arena düğmesi yalnızca fare + üzerine gelme olan cihazlarda (`(hover:hover) and (pointer:fine)`). Telefonlar şimdilik ayrı depodaki v104'ü oynar: https://github.com/bogacavdar/purple-light-phone (aynı köken: bogacavdar.github.io, kayıtlar ortak).
- Menüde "Versiyon 111". chk.js 0 hata.

## v112 (27 Ekim 2026) — Telefonlar şimdilik v104'ü oynar
- Boğaç'ın kararı: yeni dövüş özellikleri (Arena, savuşturma, hamleler) bilgisayarda oturana kadar telefon ve tabletler v104'ü oynar. Seçilen çözüm: v104'ün kopyası bu depoda `telefon/index.html` (manifest, ikon ve `sw.js` yolları `../`). Kök `index.html`'de 11. satırdan sonraki 4. satır (prototipte yok): fare + üzerine gelme yoksa (`(hover:hover) and (pointer:fine)` değil) `location.replace('telefon/')`; `?pc` atlar, 4 sn içinde ikinci yönlendirme yapılmaz (`sessionStorage pl.redir`).
- Ana ekrana eklenmiş uygulama aynı kalır (start_url ve scope `/purple-light/`, `telefon/` onun içinde); kayıtlar ortak (aynı köken). `sw.js`'e `telefon/` ve `telefon/index.html` önbellek listesine eklendi (internetsiz açılışta yönlendirme döngüsü olmasın).
- Yedek: https://github.com/bogacavdar/purple-light-phone deposunda da aynı v104 var (https://bogacavdar.github.io/purple-light-phone/, Pages açılırsa).
- Prototip türetme: `index.html` satırları [:11] + [15:].
- Menüde "Versiyon 112". chk.js 0 hata (kök ve telefon/).

## v113 (27 Ekim 2026) — Atılma takla oldu (deneme)
- `<script id="v113-roll">`: `drawPlayer` sarmalandı; `dodge` sürerken (0,24 sn) karakter gövde ortası (ayaktan 7 px yukarı) çevresinde atılma yönüne doğru bir tam tur döner (yukarı/aşağı atılınca öne takla), ortada %18 büzülür ve 3 px seker; yerde toz çıkar. Hareket, süre ve dokunulmazlık aynı.
- Boğaç deneyecek; beğenmezse `ROLL=false` yapmak eski kaymayı geri getirir.
- Menüde "Versiyon 113". chk.js 0 hata.

## v114 (27 Ekim 2026) — Takla: dönmek yerine açılı duruşlar
- Boğaç: tam tur dönme değil, farklı açılarla takla atıyormuş gibi görünsün. `v113-roll` değişti: atılma `STEPS=4` duruşa bölünür (0,06 sn'de bir), her duruş bir çeyrek tur daha dönmüş ve aralarında geçiş yok (elle çizilmiş kareler gibi). Yan duruşlarda %22 büzülme ve genişleme, ters duruşta hafif basılma; bir önceki duruş arkada %35 saydam iz olarak kalır; 3 px sekme ve toz aynı.
- `STEPS` artırılırsa daha çok açı, `ROLL=false` eski kayma.
- Menüde "Versiyon 114". chk.js 0 hata.

## v115 (27 Ekim 2026) — Daha yavaş, daha kısa takla
- `v113-roll`: `doDodge` ve `tickDodge` sarmalandı. Takla 0,38 sn (eskiden 0,24), yaklaşık 34 px (eskiden 48); hızlı başlar ve yavaşlayarak durur (hız ×1,7'den ×0,3'e). Her duruş ~0,095 sn görünür. Bekleme en az 0,68 sn. Atılma boyunca dokunulmazlık da 0,38 sn oldu.
- `ROLL=false` hepsini eski haline getirir.
- Menüde "Versiyon 115". chk.js 0 hata.

## v116 (27 Ekim 2026) — HATALI: sözdizimi hatası (bkz. v117)
- Yan taklaları kısaltma denemesi; eklenen satır sonu `//` notu satırın kalanını yoruma çevirdi, `v113-roll` bloğu hiç çalışmadı (takla yerine eski kayma). v117 düzeltir.

## v117 (27 Ekim 2026) — Takla: her yönde aynı mesafe, belirgin görüntü
- Asıl neden: atılma sırasında normal yürüme/koşma da sürüyordu (tuş basılıyken takla mesafesine yürüme, koşarken koşma eklenirdi). Ana hareket kodunda `if(dodge&&dodge.T){mx=0;my=0}`: takla sırasında yürünmez. Mesafe her yönde `RD=50` px (yürürken atılmadaki eski düz taklaya yakın), 0,38 sn, yavaşlayarak.
- Görüntü: eski atılma karakteri %55 saydam çiziyordu (`drawPlayer` içinde `if(dodge)globalAlpha=.55`); takla çiziminde `dodge` geçici olarak boşaltılır, karakter tam opak. Arkada iki iz (%55 ve %28), daha çok toz.
- Menüde "Versiyon 117". chk.js 0 hata (bu kez sonuç kontrol edilerek gönderildi).

## v118 (27 Ekim 2026) — Kombolar (sol tık)
- `<script id="v118-combo">` (en sonda). Sol tık (fare) girişleri: **tek tık** = her zamanki vuruş (`attack`); **çift tık** (0,3 sn içinde) = `double`; **basılı tut** = 0,22 sn sonra odak halkası dolmaya başlar (0,55 sn'de dolar, ses + parıltı; dolarken %45 hızla yürürsün), dolunca bırakınca `charged`; **takla sırasında / bittikten 0,3 sn içinde tık** = `dash`; **tık → takla (0,9 sn içinde) → tık** = `cdc` (bitirici). Hamle bitince kısa toparlanma (`C.cd`).
- Silah türleri ve hamleler (`CB`): 
  - Kılıç: Çift kesik · Dönen kesik (360°, ×2,2) · Hamle (ileri atılıp delen kesik, ×1,6) · Kılıç fırtınası (3 hızlı kesik + çapraz X, ×2,1, sersemletir).
  - Mızrak: Çifte dürtme (ikincisi daha uzun) · Mızrak fırlatma (delip geçen, ×2,4, eşya kaybolmaz) · Koşarak saplama (×1,8, uzağa iter) · Sırıkla sıçrama (havalanıp iner, çevreye ×2,2, sersemletir).
  - Balta/kazma: Geri savuruş (geniş, ×1,25) · Yere vurma (çevre ×2,6, sersemletir) · Dönerek biçme (×1,5) · Ezici darbe (dar, ×3,2, çok iter).
  - Yumruk: Çifte yumruk · Güçlü yumruk (×3, sersemletir) · Omuz atma · Tekme kombosu (4 vuruş + son tekme).
  - Meşale: Alev savuruşu · Ateş çemberi · Ateşli hamle · Alev patlaması.
  - Asa (mana × maliyet): Üçlü atış · Büyük büyü (×3, büyük) · Kaçarken atış (2 yayılımlı) · Büyü halkası (8 yöne).
  - Ateşli silah (mermi): Çift atış · Nişanlı atış (×3, uzun menzil) · Kayarak atış (3 yayılımlı) · Şarjör boşaltma (5 hızlı).
- Hamleler enerji yer (8–22; arenada bedava), asa mana, silah mermi. Yapılan hamlenin adı karakterin üstünde kısa bir yazıyla çıkar (geri bildirim; ne zaman yapılacağı söylenmez).
- Hangi tıklar kombo: elde silah (v109 gibi) → her sol tık; balta/kazma/meşale → yalnızca bir canlıya tıklanınca (ağaç/taş için eski davranış); boş el → yalnızca arenada. Kişi/istasyon/çanta/iz tıklaması eskisi gibi (`E_TALK`). E ve Boşluk yalnızca tek vuruş.
- Menüde "Versiyon 118". chk.js 0 hata.

## v119 (27 Ekim 2026) — Kalkan (sağ tık basılı) ve görünmez savuşturma penceresi
- Sağ tık **basma anı** hâlâ savuşturma penceresini açar (0,2 sn, bekleme 0,6 sn) ama pencere artık çizilmez (eski mavi halka ve yay kalktı); yalnızca başarılı savuşturmanın parlaması görünür. Zamanlamayı oyuncu kendisi bulur.
- Sağ tık **basılı tutulunca** kalkan (`PR.hold`; dokunmatikte Savuş düğmesi basılı): karakterin önünde (fareye dönük) tahta-metal kalkan çizilir; %45 hızla yürür (`PS.slow`); vuramaz, kombo yapamaz (atılabilir). Kalkan savuşturma değildir: gelen fiziksel hasarı azaltır — beyaz ×0,35, sarı ×0,45, kırmızı ×0,7 (rengi `window.__plHitCol`: v110 ısırık ve v111 hamle darbesi bildirir; fırlatılanlar beyaz sayılır). Her engellenen vuruş enerji yer (6 + kalan hasarın %40'ı); enerji biterse kalkan düşer, 1 sn kaldırılamaz, 0,5 sn sersem ("Kalkan düştü!"). Engellenince kısa çınlama ve kıvılcım. Arenada enerji sınırsız.
- Böylece doğru anda basan savuşturur (hasar yok, rakip sersem), kalkanla dolaşan yalnızca daha az hasar alır.
- Menüde "Versiyon 119". chk.js 0 hata.

## v120 (27 Ekim 2026) — Yakalayıp fırlatma, canavar kombosu, mermiden kaçma
- (`v111-moves` içinde.) **Yakalayıp fırlatma** (`grab`, kırmızı): iri türler (ayı, golemler, hurda devi, gölge muhafız, timsah, öküz, kızıl ejder, gök bekçisi, golemcik, devriye robotu) dibine girersen (gövde + 18 px) öncelikle bunu dener. Uyarı: başının üstünde pembe-kırmızı **el**, çevresinde daralan halka (0,5 sn). Tutarsa 0,6 sn elinde kalırsın (`PS.pin`), sonra uzağa fırlatılırsın (`PS.thr`, 0,26 sn havada dönerek), hasar ×1,4 ve kısa sersemlik. Savuşturulamaz; atılarak kaçılır. Iskalarsa 0,45 sn toparlanır.
- **Üçlü saldırı** (`combo3`): kurtlar, vaşak, goblin, domuz, ayı, gölge muhafız, robot, golemcik, yavru ejder, timsah, akrep ve bütün reisler. Başının üstünde **üç nokta**: geçenler gri, sıradaki o vuruşun renginde yanıp söner; her vuruşta farklı perdede bip. Hazırlıklar 0,5 / 0,32 / 0,58 sn, her biri ayrı duruş (geri yaslanma, çömelme, şahlanma), vuruşta öne atılma; renk dizileri rastgele (y-n-y, n-y-n, n-n-y, y-y-n; reiste üçüncü %45 kırmızı). Her vuruş ayrı savuşturulur: ilk ikisi yalnızca çevrilir, üçüncüsü de savuşturulursa canavar sersemler. Yiyen vuruş ×0,8 (kırmızı ×1,2).
- **Mermiden kaçma**: çevik türler (`DODGE`: kurtlar, tazı, vaşak, goblinler, kartallar, dronlar, yarasalar, gölge muhafız, örümcek, engerekler, yavru ejder, ışık tilkisi) ve reisler, üstlerine gelen asa topunu, mermiyi ya da fırlatılan mızrağı (0,38 sn içinde çarpacaksa) %55 (reis %35) ihtimalle yana sıçrayarak savuşturur; bekleme 1,2–2,4 sn. `window.__plPShots` (v77 asa/mermi) ve `window.__plSPR` (v118 mızrak) dışa açıldı.

## v121 (27 Ekim 2026) — Bağışıklık
- `IMM` türleri (kristal canlılar, golemler, gölge muhafız, gök bekçisi, ışık engereği, dronlar, robotlar, goblin şamanı, kül cini, ejderler, lav golemi, hurda devi) ve reisler kovalarken ara sıra 2,5 sn bağışık olur (`a.imm`, bekleme 9–16 sn, ilki 4–9 sn): mavi parıltı, titreşen kalkan halkası, mavi kıvılcımlar, çınlama. Bu sürede hiçbir vuruş/büyü/mermi/kombo can götürmez (`imHp`'ye geri alınır, `killAnimal` işlemez, geri savrulmaz); vuruş sayıları mavi "Etkisiz" olur. Kendisi saldırmaya devam eder. Arena kartlarında "Bağışıklık" etiketi.
- Menüde "Versiyon 121". chk.js 0 hata.

## v122 (27 Ekim 2026) — Ritimli 2'li / 3'lü kombo
- `v118-combo`'ya eklendi. Tek tıkla vuruştan sonra, vuruşun hareketi **bittiği an** (`tapDur`: p4 savuruşunun ant+str+fol süresi; asada `S.cd`, tabancada 0,42, pompalıda 1,05 sn) açılan **0,14 sn**'lik pencereye (`RW`) tıklanırsa 2. hamle (`c2`); o hamle bitince (kendi süresi) açılan pencereye tıklanırsa 3. hamle (`c3`, en güçlüsü). Pencereden önce tıklamak (hareket sürerken) zinciri kırar ve o tık boşa gider; hareket sürerken tekrar tekrar basmak da kırar. Pencereyi kaçırmak zinciri baştan başlatır. Pencere gösterilmez; tutunca hamlenin adı ve yükselen bir çınlama.
- Çift tık artık 0,18 sn içindeki iki tık (`DBL`; eskiden 0,3) — ritim penceresiyle karışmasın diye.
- Hamleler: Kılıç: Ters kesik (×1,5) → Ağır kesik (×2,6, sersemletir). Mızrak: Derin dürtme → Delip geçme (çok uzun, ×2,6). Balta: Yan savuruş → Kafa kıran (×3, sersemletir). Yumruk: Kroşe → Aparkat (×2,6). Meşale: Kor savuruşu → Alev kesiği (çevre). Asa: İkiz atış → Güç topu (×2,8). Ateşli silah: Seri atış → Delici mermi (×3,2, uzun menzil). Enerji 5–11 (arenada bedava), asa mana, silah mermi.
- Menüde "Versiyon 122". chk.js 0 hata.

## v123 (27 Ekim 2026) — Ulti
- `<script id="v123-ulti">` + `<style id="v123-ulti-css">`. Can/enerji/mana altında altın **Ulti** çubuğu (`#ulbar`, `window.__plUlt`: v, gain, fill). Dolma: isabet eden her vuruş +2,5 (vuruş sayısı çıkan her yaratık isabeti; "Etkisiz" sayılmaz), kombo hamlesi +4 (v118 `doMove`), ritim 2. hamle +5, 3. hamle +10 (v118 `rhythm`), başarılı savuşturma +7 (v110 `parried`). Ulti sürerken dolmaz. Kayda yazılmaz.
- Dolunca (100) çubuk parlar, eldeki silahın çevresinde altın ışık ve kıvılcım (`drawHeld` sarmalandı), dörtlü çınlama. **R** ultiyi açar (tam değilse R eski işini yapar; arenada R yalnızca ulti). Ulti boyunca hasar yok (`pInv`), altın halka, ekran parlaması, adı duyurulur.
- Ultiler (`ULT`, v118'in `window.__plCB` araçlarıyla): Kılıç **Kılıç dansı** (8 yönlü dönüş + ×3 patlama, sersemletir) · Mızrak **Mızrak yağmuru** (fare yönündeki alana 12 mızrak düşer) · Balta **Deprem** (büyüyen 3 halka, ×2,4, sersemletir) · Yumruk **Öfke** (10 yumruk + ×4 son) · Meşale **Ateş fırtınası** (3 ateş halkası) · Asa **Meteor** (0,65 sn sonra fare yönüne düşen meteor, ×5) · Ateşli silah **Kurşun yağmuru** (20 atış, pompalıda 10; mermi harcamaz).
- Arena şeridinde **Ulti doldur** düğmesi; arena tuşlarına R eklendi.
- Menüde "Versiyon 123". chk.js 0 hata.

## v124 (27 Ekim 2026) — Kalkan görseli yerine savunma duruşu
- Boğaç: kalkan resmi kötü; yalnızca duruş değişsin. `drawShield` artık çağrılmıyor. Sağ tık basılıyken (`PR.hold`, atılma dışında) `drawPlayer` sarmalanır: karakter fareye doğru hafif eğilir (±0,1 rad), %12 çömelir ve %6 genişler, darbe alınca geri sarsılır; elindeki silah göğsün önünde yatay tutulur (`drawHeld` sarmalandı; elde bir şey yoksa çizilmez). Engelleme kıvılcımı ve sesi aynı.
- Menüde "Versiyon 124". chk.js 0 hata.

## v125 (27 Ekim 2026) — Bağışıklık görüntüsü canavarın üstünde
- Boğaç: bağışıklık halkaları beğenilmedi, canavarın üstüne otursun. Geniş mavi zemin parıltısı ve kalkan halkaları kalktı. Bağışıkken canavar mavi bir gölge parıltısıyla (`shadowBlur`, gövde kenarını izler, nabız gibi) ve mavi renk tonuyla (`a.tint`, p2 çizimli canlılarda) çizilir; kıvılcımlar yalnızca gövdenin üstünden yükselir.
- Menüde "Versiyon 125". chk.js 0 hata.

## v126 (27 Ekim 2026) — Zorluğa göre düşman davranışı; arenada gerçek dövüş ve Tab
- `v111-moves`: `tierOf(a)` = canlının yaşadığı bölgenin sırası / 11 (ada 1: Çayır 0 … Mor Kristal Vadisi 5; ada 2: Yüzen Kayalar 6 … Gök Rıhtımı 11), reiste +0,25. Bununla: özel hamle beklemesi ×(1−0,5T), hamle başlatma ihtimali ×(1+T), üçlü kombo ağırlığı 1+2T, yakalama ihtimali dt×(2+2T); mermiden kaçma %20+%50T (+%10 reis), bekleme (2,2−1,2T)+0–(1,2−0,6T) sn; bağışıklık süresi 1,2+2,2T sn, bekleme (15−8T)+0–(7−3T) sn, ilk (6−3T)+0–4 sn, başlama ihtimali dt×(0,35+0,7T).
- Arena **Gerçek dövüş** (`AR.real`, seçim ekranının başlığında anahtar): açıkken oyuncunun ve rakibin canı gerçekten gider; enerji ve mana da gerçek (`window.__plArenaFree` kapanır: kombo, kalkan ve silah bedelleri işler). Rakip ölünce (`foeDown`) "Kazandın!", oyuncu düşünce (`defeat`) "Yenildin" duyurulur (verilen/alınan hasarla), 1,6 sn sonra seçim ekranı açılır. Her yeni rakipte can, enerji ve mana dolar. Şeritte rakip adının yanında "GERÇEK". Yine kayıt ya da başarım yok.
- Arenada **Tab** seçim ekranını açar/kapatır (ekran açıkken oyun duraklatılmış: saldırılar, mermiler, hamleler durur).
- Menüde "Versiyon 126". chk.js 0 hata.

## v1.27 (27 Ekim 2026) — Sürüm adı biçimi
- Boğaç'ın kuralı: sürümler artık "Versiyon 1.27" biçiminde (ilk rakamdan sonra nokta). Menü etiketi "Versiyon 1.27"; kural `CLAUDE.md`'ye ve bu dosyanın başına yazıldı. Oyunda başka değişiklik yok. chk.js 0 hata.

## v1.32 (27 Ekim 2026) — Telefon da aynı sürüm, dokunmatik dövüş düğmeleri
- Boğaç: telefonlar artık v104'te kalmasın, bilgisayarla aynı sürümü oynasın. Kök `index.html`'in 15. satırındaki yönlendirme bir not satırıyla değiştirildi; `telefon/` yedek.
- `<script id="v132-dokun">` (yalnız `(hover:hover) and (pointer:fine)` olmayan cihazlarda; bilgisayarda hiçbir şey yapmaz, `body.ph`):
  - **Vur** (`#atkbtn`): v118'in fare olaylarını nişan noktasında taklit eder (`PointerEvent` `pointerType:'mouse'`, cv'ye). Böylece çift dokunuş, ritim, basılı tutma, takla vuruşu ve bitirici aynı koddan çalışır; Börü'nün dersleri de aynı şekilde sayar. Silah yoksa (yumruk, alet) düz `attack()`. Yumuşak kilit: önündeki en yakın canavar (menzil 110, asa ve tüfekte 240; zararsızlar geride sayılır).
  - **Atıl**: eski `#dodgebtn`. **Savuştur**: v110'un `#parrybtn`'ı. **Ulti** (`#ultbtn`): çubuk dolunca görünür, R tuşu olayı yollar.
  - Varsayılan yerler: Vur, Atıl'ın üstünde (1,45 kat büyük); Ulti, Vur'un solunda; Savuştur, Atıl'ın solunda (v110).
  - Börü'nün ders metinleri telefonda düğme adlarıyla yazılır ("Vur'a dokun", "Atıl ile takla at", "Ulti düğmesi"). Ders paneli telefonda daha küçük.
- Düğme düzenleyici (B5 bloğu): `LAYEL`'e Vur, Savuştur ve Ulti eklendi; bir düğmeye dokununca üst şeritte **− / + boyut** çıkar (%60–%200, `LAY[id].s`, `placeEl` `scale()` ile). Ayarlar → Kontroller → "Düğmelerin yerini ve boyutunu ayarla". v110 parry `place()` özel yer varsa dokunmaz (`window.__plLayHas`, `__plLayS`).
- Telefonda zamanlama biraz daha geniş (bilgisayar aynı): çift dokunuş 0,25 s (0,18), ritim penceresi 0,20 s (0,14), takla sonrası 0,36 s (0,30), savuşturma 0,25 s (0,20).
- Arena düğmesi telefonda da ana menüde.
- Kontrol: chk.js 0 hata, oyun bilgisayarda ve telefon profilinde açılıyor.

## v1.31 (27 Ekim 2026) — Takla Boşluk'ta
- Boğaç: "Boşluk ile takla atılmalı." Ana tuş işleyicisinde **Boşluk = atılma/takla** (yerleştirirken döndürür), **Q = vuruş** (sol tık da vurur, kombolar sol tıkta). Tuş ayarları listesi (`KB`) de buna göre: `dodge` varsayılanı `Space`, `attack` varsayılanı `KeyQ`. Balık tutma ve R mini oyunu Boşluk'u kendi yakalama dinleyicilerinde alır, değişmedi.
- Metinler: Atılma yeteneği, Börü'nün "atılırsan" konuşması, Reis uyarısı, lav kertenkelesi ipucu (2 yer), yerleştirme ("Boşluk ile döndür", Döndür düğmesi), kerevit dersi ("yanına gidip ona tıkla"), ilk ısırık ipucu ("Vurmak için hayvana tıkla"), v129 takla dersi.
- Kontrol: chk.js 0 hata, oyun açılıyor.

## v1.30 (27 Ekim 2026) — Börü'nün dersinde antrenman canavarı ve "aferin"
- Boğaç'ın istediği akış: Börü önce diyalogla anlatır → "Hazırım" → derse uygun bir canavarı oyuncunun yanına çıkarır ("Sana şu kurdun getirdim, üzerinde dene") → görevler 3–5 kez yapılır → Börü "Aferin evlat! … artık senin" der, sonra "Yeni hamle" duyurusu.
- Ders canavarları (`LES[].foe`): Takla vuruşu Kurt · Çift vuruş Yaban domuzu · Ritim 2 Bataklık kurdu · Ritim 3 Muflon · Güçlü vuruş Yaban öküzü · Bitirici Kül kurdu · Ulti Mağara ayısı. `a.ders=true`, hep saldırgan (`mad`), v111 özel hamleleri kapalı (`mvCd`), ısırığı canın %5'i (`biteHit` sarmalı, etki yok), XP vermez. Bitirme görevi kalan derste normal can, yoksa ×3 can.
- Ölürse ya da uzaklaşırsa (420 px) oyuncu Börü'nün 240 px yakınındayken 2,5 s sonra yenisi çıkar (ders başına en çok 16). Ders bitince ya da kayıt yüklenince ders canavarları kaybolur. Kayıttan sürdürülen derste canavar Börü'ye gelince çıkar.
- Düzeltme: v1.29'un isabet sayacı `a._lh` kullanıyordu; v128'in Reis karşı saldırısı da aynı alanı kullanıyordu. Sayaç artık `a._l9`.
- Kontrol: chk.js 0 hata, oyun açılıyor.

## v1.29 (27 Ekim 2026) — Börü'nün dövüş dersleri + XP planı
- **Hamleler artık Börü'den sikkeyle öğreniliyor** (`<script id="v129-ders">`, son blok). Börü'nün genel konuşmasına "Dövüş dersleri" seçeneği eklenir (`say` sarmalı, yalnızca `talkAlp`'in genel dalında ve `ftut>=3` iken). Ders = sikke öde → hamle denemelik açılır → sol ortadaki panelde (`#lesson`) görevler; hepsi bitince hamle kalıcı (`L.own`), duyuru + küçük XP.
- Ders tablosu (`LES`): Takla vuruşu Sv3·Çayır·150 (Atılma gerekli: 3 saldırıdan takla ile kaç + 4 takla vuruşu isabeti) · Çift vuruş Sv6·Orman·300 (5 isabet + çift vuruşla 2 canavar bitir) · Ritimli 2. vuruş Sv10·Bataklık·600 (5 isabet) · Ritimli 3. vuruş Sv15·Kayalık·1000 (3 savuşturma + 3 isabet) · Güçlü vuruş Sv17·Kayalık·1200 (3 savuşturma + sersemlemiş canavara 3 güçlü vuruş) · Bitirici Sv21·Kül·2000 (Atılma gerekli: 3 takla ile kaçış + 3 isabet) · Ulti: Kara ejder ya da Kristal golem Reisi yenilince, 2500 (3 ulti isabeti; derste çubuk ×3 hızlı dolar). Biyom şartı v128'in `V.b`'si (gidilen en uzak biyom).
- `__plMoveOK` v129'da yeniden yazıldı: arena, 2. ada ve 2. adaya gitmiş kayıt (`V.a`) → hepsi açık; 1. adada öğrenilen ya da şu an dersi süren hamle açık. v128'in biyoma girişte "Yeni hamle" duyurusu susturuldu (`hush`, `V.told` dolu tutulur). v128'in ulti duyurusu "Ulti dersi açıldı · Börü sana ultiyi öğretebilir" oldu.
- Sayaç kancaları (kaynağa eklendi): v118 `rhythm`/`doMove` → `window.__plMoveEv(type)`; v111 `impact` takla sırasında → `window.__plEvade(a)`; `biteHit` en dış sarmal (takla sırasında ısırık = kaçış). İsabet: hamleden sonraki 0,9 s'de bir canavarın canı düşerse (ulti 1,8 s); bitirme: aynı pencerede `killAnimal`; savuşturma: `__plParry.n` artışı; sersem: hamle anında 90 px içinde `a.stun>0`. Aynı canavardan kaçış 0,8 s'de bir sayılır; ders kereviti (`a.tut`) sayılmaz.
- Kayıt: `v129={o:[öğrenilenler],c:{k,p}|null,n:[duyurulanlar]}`. Eski kayıtlar: v1.28'in açtığı hamleler (`v128.t`, yoksa biyoma göre) ve ulti (`V.u`) bedelsiz öğrenilmiş sayılır.
- **XP planı (tasarım dokümanındaki "XP planı (v1.29)")**: Ekin'in tunç/demir/savunma/lav/izler görev XP'si ×4 (240/320/240/480/600), doğu geçidi 80→320; Toygar, Durmuş ve Levent görevleri ×4; 2. ada görevleri (Tuna, Alara, Selin, Tamer, Pervin, Gök) ×2,5. Canavar XP'si: Kayalık ×2, Kül ve Mor ×1,5, 2. ada ×1,2 (Yüzen Kayalar ×1,5); yeni nötrler (Porsuk, Mantar geyiği, Pas kirpisi, Buz karacası, Kor domuzu, Yıldız geyiği) kendi biyomlarının nötr ortalamasına çıkarıldı. Reis XP'si dokunulmadı.
- Ekin'in savunma görevi 40 → **60** (tunç takım 50; bir demir parça daha gerekir; görev Demir zırh tarifini de verir).
- Kontrol: chk.js 0 hata, oyun açılıyor (test yok kuralı). Boğaç'ın oyununda her biyoma girişteki seviye not edilecek; 2 seviyeden fazla sapan biyomun çarpanı ayarlanır.

## v1.28 (27 Ekim 2026) — Dövüş dengesi (arena denge raporundan)
- Kaynak: Claude'un arena raporu (https://claude.ai/artifact/QLZ7kQpz6nRjizmVNt6DwZ). Botla 2.233+ gerçek arena dövüşü; Boğaç denenmiş maddelerin hepsini onayladı, denenmemişler denenip eklendi.
- Yeni blok `<script id="v128-denge">` (en sonda, en dıştaki sarmalayıcı; `window.__v128`). Kaynakta düzenlenenler: `makeBoss` (v49-p4), v111 mermiden kaçma, v78 `GUNS`, v118 `GUN` + kilitler + Hamle çarpanı, v123 ulti dolum/kilit, v110 savuşturma ulti +10, arena `wStat` balta hasarı.
- **Sarsılmazlık:** Reisler ve iri türler (`BIG`) vuruşla geri itilmez (yapay zekâ durmaz). Diğerleri 2 sn'de en çok 3 kez itilir, sonra 1,2 sn itilmez. Sersemletme ve savuşturma eskisi gibi.
- **Etkiler:** `addFx` hasarı × (0,5 + 0,5 × `armorMul()`).
- **Reis kuralı:** can ×4; vuruş türün vuruşu ×1,7 (Orman) / ×1,5 (Çayır ve diğerleri; "canın %12'si" kalktı); menzilli +1 mermi. Mevcut Reis kayıtları `fixBoss` ile yeniden hesaplanır, `__p4.makeBoss` sarmalandı.
- **Mermiden kaçma** en çok %45 (`Math.min(.45, …)`).
- **Canavar değerleri:** `SET` (biyoma göre hedef: normal 5–15 sn, Reis 20–55 sn; isabetle ölme 14/10/7). XP √(yeni can/eski can) kadar arttı. Oklu kirpi 3 diken, kanama 0,8. Kara ejder 2.880 can. Golem Ocağı ve Gök Rıhtımı hasarı +%15. 2. ada değerleri `__I2C.anim` verisine de yazılır (arena).
- **Nötr canlılar:** Kerevit, Kunduz, Su samuru, Turna kuşu, Kül böceği, Işık tilkisi, Bulut koyunu, Kaya kertenkelesi, Spor salyangozu, Hurda faresi, Taş kaplumbağası, Kor kertenkelesi, Yıldız tilkisi nötr (Alp'in ders kereviti `a.tut` zararsız kalır). Yeni nötrler (`NEWN`, akrabasının çizimiyle renkli): Porsuk (Çayır), Mantar geyiği, Pas kirpisi, Buz karacası, Kor domuzu, Yıldız geyiği (2. ada biyom 1–5); kendi doğurucuları `spawnAnimals` sarmalayıcısında.
- **Yeni davranışlar:** geri sıçrama (çevikler, %12 + %25 × kademe), arka savurma (iri türler, arkalarındaysan), Reis karşı vuruşu (1,5 sn'de 4 isabet), öfke (%40 can altı: kırmızı, %25 hızlı, hamleler sık), yardım çağırma (sürü Reisleri yarı canda 2 tür), sahte hazırlık (2. ada Reisleri, %25).
- **Silahlar:** balta/kazma kademeli (`AXE`, `window.__plAxeDmg`); Işın kılıcı 60 (0,3 sn, menzil 32 aynı); Tabanca 44, Pompalı saçma 24; asa manası Ateş 8 / Buz 10 / Yıldırım 15, Buz hasarı 46, asa eldeyken mana 8/sn dolar. Kılıç Hamlesi Orman'dan sonra ×1,35 (`__plDashK`).
- **Hamleler biyom biyom** (`window.__plMoveOK`, kayıtta `v128={b,u,a,t}`): Çayır dash · Orman çift tık · Bataklık ritim 2 · Kayalık Dağ ritim 3 + basılı tut · Kül Diyarı bitirici. Kilitli hamle normal vuruş olur. İlk kez girilen biyomda "Yeni hamle" duyurusu. Ulti: Kara ejder ya da Kristal golem Reisi ölünce (ya da 2. adaya geçince); dolum isabet +1,5, savuşturma +10. Eski kayıtlar `V65.seen`'den hesaplanır. Arenada hepsi açık.
- **2. ada zırhları** (Zırhçı Durmuş döver, `ARMORSET`; biyoma girince tarifi kitaba): Fırtına tüyü başlık 22, Mantar lifi eldiven 14 (zehir %40), Hurda çizme 15 (çamur), Kristal miğfer 26 (kanama %30), Ejder pulu eldiven 16 (yanık %40), Meka çizme 18 (çamur, kanama %20). Her biri bir öncekini malzeme olarak ister.
- Kontrol: chk.js 0 hata; v48_bugs.js ve v48_ui.js v1.27'de de aynı 6 FAIL / zaman aşımı veriyordu (testler eski), yeni hata yok; v1.28 bot turu (aşağıda).
- **Buz asası:** dondurulan canlı, donması bittikten sonra 3 sn yeniden donmaz; Reis yarı süre donar (bot testi Buz asası + bol manayla sürekli dondurma kilidi buldu).
- Son ayar (bot testinden sonra): 2. ada biyom 2–5 canavar hasarı ×1,25 / ×1,4 / ×1,25 / ×1,3; yeni 2. ada nötrlerinin hasarı ve canı yükseltildi. 2. adaya ilk geçişte "Ulti öğrendin" duyurusu.
- **v1.28 bot sonucu** (516 + 104 dövüş, gerçek oyun dosyası): normal canavar 5–17 sn; Reis usta %14–64, orta %8–47 canla, 18–65 sn; 620 dövüşte 5 ölüm (bot her uyarıyı görüyor, gerçek oyuncu daha çok ölür). Kilit/kayıt kontrolü: Bataklık'a girince dash+çift+ritim 2 açıldı, kayıt gidip geldi, eski kayıt `V65.seen`'den açtı, Kara ejder ultiyi açtı, 2. adada biyomlara girdikçe zırh tarifleri kitaba geldi.

## v1.33 (27 Ekim 2026) — Boğaç'ın notları
- Envanter: alet yuvasına konan eşyalar üstteki listede (Taşınabilir eşyalar / Hepsi) görünmez; yalnızca alttaki yuvalarda durur (`renderInvPanel` listesi süzülür).
- Kerevitler yavaşça yürür (`still` kerevitte yok sayılır). Börü'nün dersindeki kerevit Börü'nün yanında dolaşır (26 px tasma), hiç karşılık vermez, ipucu "zararsız" der. Börü'nün iki giriş cümlesi: "Kıyıda ağır ağır yürür ama ne kaçar ne ısırır…" (saldırı uyarısı ileride saldıran hayvanlar için).
- Sis yeniden yazıldı (`drawFog`, `fogNoise`): dünyaya bağlı iki katman yumuşak gürültü, rüzgârla kayar, gece koyu; ateşler, kamp ateşleri, eldeki meşale ve kafa lambası sisi açar (destination-out). Bataklıkta hafif, sis havasında yoğun.
- Zırhçı Durmuş'un kendi ateşi var (`addFire(durmus,…)`).
- Mavi parıltı (çeper) yalnız öğreticide (`tz>0`): tarif takibi ve görevler artık nesneleri mavi çevrelemez (`refreshGlow`, `refreshQG`).
- Elde ne olursa olsun toplanabilir şeyler toplanır ("Elin dolu" kalktı); alet çubuğundaki el (H) kutusu gizlendi.
- Haritada gece de kişiler ve yerler görünür (simgeler karanlık katmanın üstüne ikinci kez çizilir). Başında ! ya da ? olan kişilerin harita simgesinin üstünde de küçük ! / ? var (Ekin altın/yeşil, yan görevler mavi/sarı; `window.__plQMarkAt`).
- Yaprak: yerde nadir (açılışta uzaktaki yaprakların ~%72'si kalkar, yeniden çıkma 90 sn), her balta vuruşunda ağaçtan 1–2 yaprak düşer (`<script id="v133">`). Yerdeki yaprak çizimi için Boğaç'a 6 seçenek gönderildi; seçilince ayrı sürüm.
- Kontrol: chk.js 0 hata; oyun açılıyor; sis ve gece haritası tek tek bakıldı.
- Menüde "Versiyon 1.33".

## v1.34 (27 Ekim 2026)
- Mızrak simgeleri: "Mızrak" büyük M ile başladığı için `/mızrak$/` kuralına uymuyor, düz bir kare çıkıyordu. `<script id="v134">` yedi mızrağa (Mızrak, Çakmaktaşı, Kuvars, Bazalt, Obsidyen, Tunç, Demir) PIXI simgesi veriyor: çapraz ahşap sap, lif bağ, malzemenin renginde sivri uç.
- Yerde duran (henüz toplanmamış) yaprak artık çalı değil, çimenin üstünde tek bir yaprak (Boğaç'ın seçimi "B · Tek yaprak"; v49-p1 içindeki `P1W['Yaprak']`). Envanter simgesi değişmedi.
- Kontrol: chk.js 0 hata; oyun açılıyor; yerdeki yaprak ve envanterdeki mızraklara bakıldı.
- Menüde "Versiyon 1.34".

## v1.35 (27 Ekim 2026)
- E artık hiç saldırmaz: yalnızca toplar ve konuşur/kullanır. Yakındaki yaratıklar E'nin hedefinden çıkarılır (`eTarget`), bu yüzden bir hayvanın yanında bile E arkasındaki malzemeyi, kişiyi ya da istasyonu bulur. Vuruş Q ve fareyle. Hayvan ipucu "Q · vur" gösterir. Arenada E eskisi gibi vurur.
- Menüde "Versiyon 1.35". chk.js 0 hata.

## v1.36 (27 Ekim 2026)
- Arenada da E vurmaz; vuruş her yerde Q ve fareyle (E işleyicisindeki arena dalı kaldırıldı).
- E önceliği toplamada: hedef ağaç ya da maden (veya hiç hedef yok) ise E önce 28px içindeki yere düşmüş eşyaların hepsini anında toplar (`ePick`), yoksa REACH içindeki maden olmayan bir kaynağı (çalı, taş, yaprak…) toplar; ancak ikisi de yoksa ağaca/madene vurur (`eFirst`). Ağaç kesip E'ye basınca düşenlerin ağaçla çakışması böylece çözüldü.
- Meşale + ikinci silah: meşale eldeyken karakterin "Silah" yuvasındaki silah vurur (hasar, menzil ve savurma görseli o silahın; `p4Kind`, `kindOf`, `swingP4` güncellendi; fareyle hayvana tıklayınca da vurur). Yuvada silah yoksa meşalenin kendisi vurur (7 hasar, 19 menzil; yumruk 4). Meşale ilk kez ele alındığında yuva boşsa ve çantada silah varsa bir kez ipucu çıkar.
- Sis daha ağır ve tek yönde akar: iki katman da aynı yöne (sağa, hafif aşağı), hızlar 9/15 → 2.2/3.1, rüzgârın etkisi 0.4'e indi.
- Menüde "Versiyon 1.36". chk.js 0 hata.

## v1.37 (27 Ekim 2026)
- Zümrüt'ün "Kazanın dili" görevi artık "3 yeni tarif" değil, **toplam 10 tarif** ister (`found.length>=10`). Eski hâli, bütün tarifleri öğrenmiş oyuncuda yeni tarif kalmadığı için görevi bitirilemez bırakıyordu. 10 tarifi zaten bilen oyuncu görevi alır almaz tamamlar.
- Menüde "Versiyon 1.37". chk.js 0 hata.

## v1.38 (27 Ekim 2026)
- Elde ne olursa olsun (kılıç, mızrak, tüfek, asa…) E yerdeki kaynakları toplar: `gatherTarget` içindeki "eli boş mu" şartı kalktı (`free=true`); kazma gerektiren madenler eskisi gibi kazma ister.
- E, konuşma hedefi (kişi, istasyon…) yoksa her durumda önce yakındaki düşmüş eşyaları toplar (`eFirst` yalnızca ağaç/maden için değil).
- Menüde "Versiyon 1.38". chk.js 0 hata.

## v1.39 (27 Ekim 2026)
- Meşale + kılıç/mızrak artık doğrudan kuşaktan: meşale eldeyken bir kılıç ya da mızrak yuvasına basınca el meşalede kalır, o silah öteki ele geçer (`offW`); aynı yuvaya yine basınca bırakılır. Elde kılıç varken meşaleye geçince kılıç da öteki elde kalır. Öteki eldeki silahın yuvası turuncu kesik çizgiyle işaretli, karakterin yanında görünür ve vuruşu o yapar (`weapon()` önce `offOK()`, sonra "Silah" yuvasına bakar). Meşale elden çıkınca `offW` silinir. Eski "Silah olarak tak" yolu da çalışır.
- Menüde "Versiyon 1.39". chk.js 0 hata.

## v1.40 (27 Ekim 2026)
- Meşale + silah taşınırken kuşakta iki yuva birden yanar (ikisi de `.on`; v1.39'daki turuncu kesik çizgi kalktı). İkisine de tıklanır: meşale eldeyken silah yuvası silahı öteki ele alır/bırakır, meşale yuvası meşaleyi bırakır.
- Menüde "Versiyon 1.40". chk.js 0 hata.

## v1.41 (27 Ekim 2026)
- İki el modeli (Boğaç): meşale her zaman **sol ele** geçer ve sol ele geçebilen tek eşya odur (`leftT`); geri kalan her şey sağ elde (`hand`). İkisi birbirinden bağımsız: meşale yuvasına basmak yalnızca meşaleyi takar/çıkarır, öteki yuvalar yalnızca sağ eli değiştirir. Kuşakta ikisi birden yanar. H (eli boşalt) yalnızca sağ eli boşaltır. Fare tekeri meşale yuvalarını atlar.
- `torchHeld()` önce `leftT`'ye bakar; ışık, yanma süresi, sis, öğretici adımları hepsi bunu kullandığı için değişmeden çalışır. Eski kayıtta sağ elde duran meşale ilk karede sol ele taşınır (`tickTorch`). `leftT` kayda `lt` olarak yazılır.
- Vuruş: sağ eldeki silah (yoksa "Silah" yuvası) vurur; ikisi de yoksa ve sol elde meşale varsa meşale vurur (7 hasar), o da yoksa yumruk. Meşale karakterin öbür elinde çizilir (`drawLeftT`).
- v1.39–1.40'taki `offW` (meşalenin yanına silah alma) kaldırıldı; bu model onun yerini tutuyor.
- Menüde "Versiyon 1.41". chk.js 0 hata.

## v1.42 (27 Ekim 2026)
- Envanterde taşınabilir eşyayı yuvaya sürükleme bazen hiç başlamıyor ya da yarıda kalıyordu: döşemenin içindeki `<img>` tarayıcının kendi resim sürüklemesini başlatıyor, bu da `pointercancel` ile bizim sürüklemeyi iptal ediyordu (`draggable="false"` yalnızca düğmedeydi). Düzeltme: `#cbody img, #hotbar img` için `-webkit-user-drag:none`, envanterde `dragstart` engelleniyor, farede `pointerdown` varsayılanı (metin seçimi) engelleniyor.
- Eşya artık ekranın altındaki kuşağa (`#hotbar [data-hs]`) da bırakılabilir, yalnızca çantadaki kuşağa değil (`bsAt`). Üstüne gelinen yuva iki kuşakta da vurgulanır; iptal olunca vurgu temizlenir.
- Menüde "Versiyon 1.42". chk.js 0 hata.

## v1.43 (27 Ekim 2026)
- Yaşlı Ekin'in "10 farklı tarif öğren" görevi (`t10` yuvası, sıra ve kayıt anahtarı aynı) yerine **"Üç balık tut."**: Ağ ya da Olta yap, sudan 3 balık çıkar (`fishTotal>=3`; ödül aynı, 60 sikke + 30 XP). Zümrüt'ün "Kazanın dili" (toplam 10 tarif) göreviyle aynı şeyi istemesin diye (Boğaç).
- Menüde "Versiyon 1.43". chk.js 0 hata.

## v1.44 (27 Ekim 2026)
- Yaşlı Ekin'in "10 tarif" (v1.43'te "Üç balık tut") yuvası dört göreve dönüştü, sırayla (Boğaç hepsini seçti); hepsi 60 sikke + 30 XP:
  1. **Adayı tanı:** haritanın %30'unu keşfet (`exploredCount>=W*H*.3`).
  2. **Geceleri uluyan kurdu avla:** görev alınınca kurt sayısı not edilir (`EKQ.wb`), sonra 1 kurt.
  3. **Dışarıda kamp kur, bir gece ateşinin başında bekle:** gece, yanan bir kamp ateşinin 48px yakınında toplam 60 sn (`EKQ.cs`, `tickCamps` içinde sayılır).
  4. **Bir tuzak kur ve içine düşeni al:** tuzaktan ilk av (`EKQ.tr`, tuzaktan av alınınca artar).
- `EKQ` kayda `ekq` olarak yazılır; kayıt sürümü `qv:6`. Göç: `qv<6` kayıtta "10 tarif" yuvasını geçmiş oyuncunun `tut` değeri +3 kayar; tam o yuvadaysa ilk yeni görevden "konuş" durumunda başlar.
- Not (Boğaç sordu): "Seviye 8'e ulaş" görevi ayrıca 250 sikkelik bir yetenek ister; ödül ikisi birden olunca verilir.
- Menüde "Versiyon 1.44". chk.js 0 hata.

## v1.45 (27 Ekim 2026)
- Ekin'in dört yeni görevi kolaydan zora sıralandı: Tuzak → Kamp gecesi → Kurt → Adayı tanı (%30 keşif). Yuvalar ve kayıt göçü aynı (v1.44'ten birkaç dakikalık kayıtlarda o dört yuvadaki görev yer değiştirmiş olabilir).
- Menüde "Versiyon 1.45". chk.js 0 hata.

## v1.46 (27 Ekim 2026)
- Fareyle bir ağacın, madenin, toplanabilir kaynağın ya da yere düşmüş bir eşyanın üstüne gelince küçük bir etiket çıkar: adı ve ne gerektiği (ağaç: "baltayla kesilir" / "silkelenir"; maden: gereken kazma; kaynak: "E ile topla"; yerdeki eşya: "üstünden yürü ya da E"). `<script id="v146">`, `#hovtip` DOM etiketi; hedef `pickAt` ile bulunur, kamera kayınca 200 ms'de bir yenilenir. Diyalog, panel, başlık ekranında gizli; yalnızca fare (dokunmatikte yok).
- Menüde "Versiyon 1.46". chk.js 0 hata.

## v1.47 (27 Ekim 2026)
- Yaratık can çubuğu: eskiden yalnızca dolu kısım parlak çiziliyordu, boş kısım neredeyse siyahtı (`#11170f`); bu yüzden yarı canlı bir öküz "canı çok az" gibi görünüyordu (Boğaç). Yeni `hpBar(x,y,w,k)`: koyu çerçeve, görünür koyu kırmızı boş kısım, renk yeşil (>%50) → sarı (>%25) → kırmızı. Dört çizim yolunun hepsi kullanıyor; büyük hayvanlarda çubuk sprite genişliğine göre (M.W·0,7, 14–32 px). Yaban öküzünün canı kodda 860 (değişmedi).
- Menüde "Versiyon 1.47". chk.js 0 hata.

## v1.48 (27 Ekim 2026)
- Büyük nehir kuzeyde ve güneyde denize kadar akar: eskiden kıyı kumu (`edge<13`) nehri ezip iki ucta yürünebilir bir şerit bırakıyordu; artık büyük nehrin kendi ıslaklık haritası (`wetD`, RIV[DIVA..DIVB]) kumdan önce gelir. Doğuya tek geçiş köprü. (Harita her açılışta aynı üretilir; o şeritte kaydedilmiş bir oyuncu suya düşebilir, çok küçük ihtimal.)
- Haritada ölünen yerler (`graves`) büyük piksel kuru kafa (7×7, küçük haritada 14 px, büyükte 21 px), arkasında yanıp sönen mor hale.
- Hileler tek tek (Boğaç): ana menüdeki "Hile modu" yalnızca seçenekleri gösterir, kendiliğinden hiçbir hile açılmaz. Oyun içindeki Ayarlar'da ayrı anahtarlar: **Tanrı modu** (`b5god`), **Hile paneli** (`b5pad`, sağdaki kırmızı panel), **Hile kısayolları** (`b5keys`, Z/X), Gece ışığı, Sınırsız sikke, Bütün ara sahneler; düğmeler: ACT 2, seviye, harita. Sayfa her açıldığında bu anahtarların hepsi kapalı başlar (`settings` yüklenince sıfırlanır).
- Tanrı modu: `window.__plGod`; her karenin başında ve sonunda can, açlık (100), enerji ve mana doldurulur, `tired` kalkar; `hurt` ve `faint` Tanrı modunda hiçbir şey yapmaz.
- Menüde "Versiyon 1.48". chk.js 0 hata.

## v1.49 (27 Ekim 2026) — kritik düzeltme
- v1.48'de WASD/ok tuşları çalışmıyordu (Esc'ye basınca düzeliyordu). Sebep: yeni "Hile kısayolları" kutusuna `id="b5keys"` verilmişti; bu kimlik zaten tuş atama penceresinindi (`#b5keys`). Tuş çevirici (`translate`, v8529) `$('b5keys').hidden` false görünce her tuşu tuş atama menüsüne yolluyordu. Kutunun kimliği ve ayar adı `b5hk` oldu.
- Güvenlik: oyuncu bir su karosunun üstündeyse (köprü ve tekne dışında) 0,5 sn'de bir en yakın kıyıya çıkarılır (`<script id="v149">`). v1.48'de kapanan nehir ağzı şeridinde kaydedilmiş oyunlar için.
- Kontrol: chk.js 0 hata; oyun açılıp "Devam et" ile girilince A tuşuyla yürünüyor; suya konan oyuncu kıyıya çıkıyor (Boğaç'ın bildirdiği hata için hızlı bakıldı).
- Menüde "Versiyon 1.49".

## v1.50 (27 Ekim 2026)
- **Mükerrer görevler:** Ekin'in v1.44'te eklenen "Bir tuzak kur" ve "Geceleri uluyan kurdu avla" görevleri silindi; Savaşçı Börü'nün "Kapan ustası" ve "Kurt sürüsü" görevleri aynı şeyi istiyordu. Ekin'de kamp gecesi ve "Adayı tanı" kaldı. Kayıt sürümü `qv:7`; göç (`qv<7`): o dört yuvadan biri silinen göreve denk geliyorsa bir sonrakine "konuş" durumunda geçer, sonraki görevlerin sırası 2 geri kayar. Eski kayıtlar bozulmaz.
- **Görev kaybı:** Görev alınınca, teslim edilince ya da ana görev ilerleyince (tut, qState, yan görevlerin açık listesi ve biten sayısı) bir saniye içinde `auto` kaydı yazılır; sayfa kapanırken/yenilenirken de (`pagehide`, `beforeunload`). Eskiden yalnızca dakikada bir ve sekme gizlenince kaydediliyordu, güncellemeden sonra yenileyince son dakikada alınan görev kayboluyor ve yeniden veriliyordu.
- **Nerede:** yan görevlerin (22 tanesi) teklif metnine ve görev defteri kartına, ana görevlerden tunç, demir ve lav kertenkelesinin ipucuna "Nerede: <biyom>: <yön ve yol>" satırı eklenir (`<script id="v150">`, `window.__plWhere`). Biyom, kaynak düğümlerinin, ağaçların ve hayvan listelerinin (`window.__I1B`, düşen ganimetler dahil) gerçek yerlerinden hesaplanır; yol tarifi: Çayır/Orman yurt (nehrin batısı, güney/kuzey), Bataklık köprünün karşısı ve güneyi, Kayalık Dağ köprünün kuzeyi, Kül Diyarı Doğu geçidinden, Mor Kristal Vadisi en doğu. Ada 2'de eklenmez.
- **Sınırsız dayanıklılık** hilesi (`b5dur`, `window.__plDur`): aletler ve silahlar körelmez (`wearsNow` false), meşale sönmez (`torchRate` 0). Diğer hileler gibi her açılışta kapalı.
- Büyük nehirde kalan oyuncu her zaman **batı (yurt) kıyısına** çıkarılır; köprüsüz biri doğuda mahsur kalmasın.
- Büyük haritada bir kişinin simgesinin üstüne gelince biyom yerine kişinin adı yazar (`MAPHITS`). Dünyada fareyle bir kişinin, kazanın, bir hayvanın ya da köpeğin üstüne gelince adı yazar (v146 etiketi). Küçük haritanın sol altında bulunduğun biyomun adı (kendi renginde).
- Menüde "Versiyon 1.50". chk.js 0 hata; oyun hatasız açılıyor (yan görevlerin "Nerede" satırları ve tunç ipucu kontrol edildi).

## v1.51 (27 Ekim 2026)
- Kayıt yuvasına basınca artık her zaman ne olduğu yazar: "Kayıt 1: oyun kaydedildi"; dolu yuvada ilk basış "üzerine yazmak için bir kez daha bas" der (eskiden sessizce yalnızca "Üzerine yaz?" oluyordu, oyuncu kaydettiğini sanıyordu); bir sahnenin ortasında kayıt reddedilirse bunu söyler.
- Kontrol (Boğaç'ın "kaydettiğim halde görevleri yeniden alıyorum" sorusu için): yan görev alınıp Kayıt 1'e kaydedildi, sayfa yenilendi, "Devam et" ile girildi; görevler ve ana görev durumu yerinde. Tekrar hissinin asıl sebebi v1.44'te Ekin'e eklenen ve Börü'nün görevleriyle aynı olan iki görevdi (v1.50'de silindi).
- Menüde "Versiyon 1.51". chk.js 0 hata.

## v1.52 (27 Ekim 2026)
- **Sepet** artık alet değil (DB `t` listesinden çıktı): kazanda öğrenilince Tab'dan (el yapımı) yapılır, Dursun'a gerek yok; tariflerde girdi olarak harcanır.
- **Balık kapanı** = 2 Sepet + 3 İp + 1 Dal (eskiden 2 Söğüt sepeti: bataklıktaki söğüdü kuvars/tunç baltayla kesmek gerekiyordu). Balık kapanı hâlâ alet, Dursun döver.
- Menüde "Versiyon 1.52". chk.js 0 hata; oyun hatasız açılıyor.

## v1.53 (27 Ekim 2026)
- Balık kapanı tarif kitabında açılmıyordu: bir tarifin açılması için girdilerinin hepsinin "görülmüş" olması gerekiyor; v1.52'de girdisi Sepet olunca, eline hiç Sepet geçmemiş oyuncuda kapan kapalı kalıyordu. `isOpen`: tarifini öğrendiğin bir eşya da görülmüş sayılır. Böylece Sepet'i öğrenen (İp ve Dal'ı da görmüş) oyuncunun kitabında Balık kapanı açılır. Akış: kitapta açılır → Zümrüt'ün kazanında öğren → Dursun örsünde döver.
- Menüde "Versiyon 1.53". chk.js 0 hata; oyunda isOpen('Balık kapanı') Sepet öğrenilince true oluyor.

## v1.54 (27 Ekim 2026)
- **Yaprak barınağı:** "Yaprak barınağı" görevi açıkken malzemeler (8 Dal, 12 Yaprak, 4 Lif) çantadaysa ve barınağın yoksa, Rıza ile konuşmak doğrudan siparişler listesini açar (`talkCarp` sarmalayıcısı, `<script id="v154">`); listeden Yaprak barınağı seçilip bitirilir.
- **Hile paneli:** sağdaki kırmızı panelin üstünde arama kutusu (bütün eşyalar: hile malzemeleri, fiyat listesi ve tarif sonuçları; en fazla 40 sonuç) ve miktar seçimi 1 / 10 / 50 / 100 (varsayılan 10). Kutuda yazarken oyun tuşları çalışmaz; Esc aramayı temizler.
- **Bölgeye git dersleri** (Börü'nün dövüş dersleri "Bataklık'a git" vb., `V.b`): haritada bir bölgenin en az 60 kara karesi açıldıysa oraya gidilmiş sayılır (3 sn'de bir hesaplanır). Bataklık ve Kayalık Dağ'da nehirden 14 kareden yakın yerler sayılmaz; karşı kıyıdan görmek yetmez.
- Menüde "Versiyon 1.54". chk.js 0 hata; oyun hatasız açılıyor; hile panelinde "tunç" araması 10 sonuç veriyor, 50 seçilince 50 ekleniyor.

## v1.54 (27 Ekim 2026)
- **Yaprak barınağı:** "Yaprak barınağı" görevi açıkken malzemeler (8 Dal, 12 Yaprak, 4 Lif) çantadaysa ve barınağın yoksa, Rıza ile konuşmak doğrudan siparişler listesini açar (`talkCarp` sarmalayıcısı, `<script id="v154">`); listeden Yaprak barınağı seçilip bitirilir.
- **Hile paneli:** sağdaki kırmızı panelin üstünde arama kutusu (bütün eşyalar: hile malzemeleri, fiyat listesi ve tarif sonuçları; en fazla 40 sonuç) ve miktar seçimi 1 / 10 / 50 / 100 (varsayılan 10). Kutuda yazarken oyun tuşları çalışmaz; Esc aramayı temizler.
- **Bölgeye git dersleri** (Börü'nün dövüş dersleri "Bataklık'a git" vb., `V.b`): haritada bir bölgenin en az 60 kara karesi açıldıysa oraya gidilmiş sayılır (3 sn'de bir hesaplanır). Bataklık ve Kayalık Dağ'da nehirden 14 kareden yakın yerler sayılmaz; karşı kıyıdan görmek yetmez.
- Menüde "Versiyon 1.54". chk.js 0 hata; oyun hatasız açılıyor; hile panelinde "tunç" araması 10 sonuç veriyor, 50 seçilince 50 ekleniyor.

## v1.55 (27 Ekim 2026)
- Yeni hile **Tek vuruşta öldür** (`b5one`, `window.__plOne`, `<script id="v155">`): her karede, bir önceki kareden beri canı azalmış her yaratık (reisler dahil) hemen ölür (`killAnimal`); hangi saldırı yolundan gelirse gelsin (kılıç, mızrak, ok, ulti…). Diğer hileler gibi her açılışta kapalı.
- Menüde "Versiyon 1.55". chk.js 0 hata; oyunda 5 hasar alan bir yaban öküzü (860 can) tek seferde öldü.

## v1.56 (27 Ekim 2026)
- **Balık kapanı:** elde kapan varken yanındaki herhangi bir su (yalnızca baktığın yön değil) "Balık kapanını suya bırak" olur, "Su topla" değil; fareyle 48 px içindeki suya tıklayınca da bırakılır (`<script id="v156">`). Suya bırakılmış kapan 34 px'ten alınır ve sudan önce gelir (E önce kapanı toplar).
- Hile panelindeki arama kutusu dışarı tıklanınca bırakılır (odak kalkar).
- **Harita hedefi:** bir kişinin simgesine dokununca konan hedef artık 60 sn değil, varana ya da kaldırılana kadar durur; aynı kişiye yine dokununca, haritadaki ✕ düğmesiyle ya da hedefe varınca (26 px) kalkar. Kendi işaretlerinde "Yol göster" düğmesi: işareti kaydedip ok ile oraya yönlendirir; işaret silinince hedef de kalkar.
- Menüde "Versiyon 1.56". chk.js 0 hata; oyunda kapan nehir kıyısında yana bakarken suya bırakıldı ve hemen ardından E hedefi kapan oldu.

## v1.57 (27 Ekim 2026)
- Balık kapanı suyun en yakın kenarına konur: oyuncunun çevresinde (önce bakılan/tıklanan yön) 34 px içindeki ilk su noktası bulunur, 3 px içeri bırakılır (eskiden 26 px ötedeki su noktasına gidiyordu). Denemede kıyıdan 10 px.
- Büyük haritada **sağ tık**: bir işaretin (📍) ya da okun hedefinin üstünde kaldırır; üstüne gelince etikette "Sağ tık: kaldır" yazar (`<script id="v157">`). Boş yere sağ tıklayınca nasıl kullanılacağını söyler.
- Rıza'nın ev/barınak listesinde fiyat düğmeleri hepsi aynı boyda (128 px), tek satır, binlik ayraçlı ("Yaptır · 2.500").
- Menüde "Versiyon 1.57". chk.js 0 hata.

## v1.58 (27 Ekim 2026)
- Haritada kurduğun evler, barınaklar ve yataklar kendi resimleriyle (sarı çerçeveli küçük simge) görünür; büyük haritada üstüne gelince adı yazar (`MAPHITS` k:'placed').
- Kuşak (1–0): bir eşya bitince ya da yere kurulunca (kapan, tuzak, ev…) yuvası boşalır; eskiden silik "kalmadı" hayaleti kalıyordu.
- Menüde "Versiyon 1.58". chk.js 0 hata; haritada barınak ve yatak simgesi çıktı, biten tuzağın yuvası boşaldı.

## v1.59 (27 Ekim 2026)
- **Ritimli vuruşlar:** süre değişmedi; ritim penceresi açılınca (40 ms önceden başlayıp pencere boyunca) oyuncunun çevresinde bir halka parlar: 2. vuruş için **sarı**, 3. vuruş için **turuncu**. Yalnızca o hareket açıldıysa görünür. Dersler (Ritimli 2. ve 3. vuruş) halkayı anlatır.
- **Savuşturma:** derslerde nasıl yapıldığı yazar: bilgisayarda farenin **sağ tuşu**, dokunmatikte sağdaki **Savuş** düğmesi ("takla değil"); darbe değmeden hemen önce basılır, beyaz ve sarı darbeler savuşturulur, kırmızı savuşturulamaz.
- Menüde "Versiyon 1.59". chk.js 0 hata; oyun hatasız açılıyor, halka çizimi hatasız.

## v1.60 (27 Ekim 2026)
- Börü'nün derslerinde adımlar **sırayla** sayılır (`bump`: yalnızca ilk bitmemiş adım ilerler): örneğin Ritimli 3. vuruşta önce 3 savuşturma, sonra 3 ritimli 3. vuruş.
- Dersin o anki adımı bir vuruş adımıysa (`hit:…`, ör. ritimli 2./3. vuruş, çift vuruş) alıştırma canavarı saldırmaz (öfkesi, hamlesi, atılışı kapanır; kovalamayı bırakır). Savuşturma ve sersemletme adımlarında saldırır (savuşturmak için gerekli).
- Menüde "Versiyon 1.60". chk.js 0 hata; oyun hatasız açılıyor.

## v1.61 (27 Ekim 2026)
- **Ritim kolaylaştı:** pencere bilgisayarda 0,14 → 0,26 sn, dokunmatikte 0,2 → 0,32 sn; pencere açılmadan 0,08 sn önceki tıklama da sayılır (`RE`).
- **Ritim işareti belirgin:** vuruştan sonra sarı (3. vuruş için turuncu) bir halka karakterin üstüne doğru daralır; pencere açılınca dolu parlak halka ve üstünde **ŞİMDİ!** (3. vuruşta **YİNE!**) yazar. Yalnızca o hareket açıksa (ya da dersi sürüyorsa).
- **Öğreticide neden görünmüyordu:** ritim yalnızca "dövüş tıklaması" sayılan fare tıklamalarında başlıyordu; elde silah yoksa (balta, meşale…) yalnızca tam hayvanın üstüne tıklamak sayılıyordu, Q tuşuyla ise ritim hiç başlamıyordu (arenada her tıklama dövüş tıklaması olduğu için orada görünüyordu). Artık Börü'nün dersi sürerken her sol tık dövüş tıklamasıdır ve **Q** ile de ritim yapılır.
- Menüde "Versiyon 1.61". chk.js 0 hata; Q'dan sonra halka ve ŞİMDİ! ekranda görüldü (2D çizimde).

## v1.62 (27 Ekim 2026)
- Ders ortasında alınmış bir kayıtla girince dersin yeni anlatımı (savuşturmanın nasıl yapıldığı, halka, sıralı adımlar) hiç görünmüyordu; anlatım yalnızca ders başlarken çıkıyor. Börü'de "Dersin nasıldı?" yerine **"Dersi yeniden anlat"**: dersin metnini ve adımları sırayla (✓ bitti, ▶ şimdiki, • sıradaki, sayılarla) gösterir; "Anladım, sürdürüyorum" alıştırma canavarı yoksa yenisini salar; **"Dersi baştan başlat"** sayaçları sıfırlar (ücretsiz). Ders ortasındaki bir kayıt açılınca 2,5 sn sonra bunu hatırlatan bir not çıkar.
- Menüde "Versiyon 1.62". chk.js 0 hata; oyun hatasız açılıyor.

## v1.63 (27 Ekim 2026)
- Ders sırasında Börü'den uzaklaşınca ders iptal edilir: 260 px'te bir kez uyarı, 360 px'i geçince ders kapanır, alıştırma canavarı kaybolur, ders ücreti geri verilir (`tickFoes`). Ders ortası bir kayıt Börü'den uzakta açılırsa da ders iptal olur ve ücret döner.
- Menüde "Versiyon 1.63". chk.js 0 hata; oyun hatasız açılıyor.

## v1.64 (27 Ekim 2026)
- **Yeni oyun temiz başlar:** "Yeni oyun" (`startNew` → `applyState(null)` → `resetState`) yan görevleri (v55 `QS`: açık, biten, takip edilen, sabitlenen; `QC` sayaçları), Doğu geçidinin açıklığını (`rockfall.cleared`, `ROCK_CELLS` erişimi) ve görülen bölgeleri (`V65.seen`) önceki oyundan taşıyordu. `<script id="v164">` bunları `resetState`'te sıfırlar; kayıt yüklemede kayıttaki değerler yine geri gelir (denendi).
- Ritimli 3. vuruş dersinde 2. vuruş (ritimli 2.) dersi alınmamış olsa da yapılabilir (`__plMoveOK`): hile ile seviye atlayıp doğrudan 3. vuruş dersine girince kombo hiç başlamıyor, halka da çıkmıyordu.
- Menüde "Versiyon 1.64". chk.js 0 hata; yeni oyunda yan görevler/geçit/bölgeler sıfır, kayıt yükleyince görevler yerinde.

## v1.65 (27 Ekim 2026)
- Dersten uzaklaşınca artık hemen kapanmaz: Börü'den 280 px'ten uzağa gidince 10 saniyelik geri sayım başlar (uyarı notu ve her saniye karakterin üstünde "Derse dön: N"); 240 px'e dönersen sayım durur ("Derse döndün, devam"). Süre dolarsa ders iptal olur, ücret geri verilir. Diyalog/menü açıkken sayım ilerlemez.
- Menüde "Versiyon 1.65". chk.js 0 hata; oyun hatasız açılıyor.

## v1.66 (27 Ekim 2026)
- Uyarıya rağmen uzaklaşmaya devam edersen (Börü'den 440 px) ders geri sayımı beklemeden iptal olur; 280–440 px arasında 10 sn geri sayım sürer. Uyarı metni bunu söyler.
- Menüde "Versiyon 1.66". chk.js 0 hata.

## v1.67 (27 Ekim 2026)
- **Çift vuruş dersi:** v1.60'ta bütün derslerin adımları sıralı yapılmıştı; çift vuruşta "5 isabet" bitmeden "2 canavarı çift vuruşla bitir" sayılmıyordu, domuz da çift vuruşla ölüp boşa gidiyordu. Sıralı adım artık yalnızca `seq:1` olan derste (Ritimli 3. vuruş: önce savuşturma); diğerlerinde her adım aynı anda sayılır.
- **Alıştırma canavarı ölmez:** dersin "bitir" (`kill:`) dışında bitmemiş adımı varken Börü'nün canavarı ölmez; öldürecek vuruş isabet sayılır, canavar canı yenilenmiş olarak kalır ("Dayanıyor!"). Yalnızca "bitir" adımları kaldığında ölebilir.
- Saldırmama kuralı (v1.60) sıralı olmayan derslerde: kalan adımların hepsi vuruş adımıysa canavar saldırmaz.
- Menüde "Versiyon 1.67". chk.js 0 hata; oyun hatasız açılıyor.

## v1.68 (27 Ekim 2026)
- **Ders alanından çıkış sorulur:** Börü'den 280 px'ten uzağa çıkınca oyun durur ve Börü sorar: "Derse dön" (karakter alana, Börü'ye ~230 px'e geri konur) ya da "Evet, dersi bırak" (ders tamamen kapanır, alıştırma canavarı kaybolur, ücret geri verilir; yeniden almak için Börü'den dersi baştan almak gerekir). Diyalog seçimsiz kapanırsa "Derse dön" sayılır. v1.65–1.66'daki geri sayım kaldırıldı.
- **Görev bitince yeni görev hemen:** bir yan görev teslim edilince, o kişinin sıradaki işi açıksa teşekkür diyaloğunda "Başka iş var mı?" çıkar ve yeni görev aynı konuşmada teklif edilir (eskiden diyaloğu kapatıp yeniden konuşmak gerekiyordu). Börü'nün dersi bitince "Aferin" diyaloğunda alınabilecek ders varsa "Yeni ders" düğmesi ders listesini açar.
- Menüde "Versiyon 1.68". chk.js 0 hata; oyun hatasız açılıyor.

## v1.69 (27 Ekim 2026)
- "İki canavarı çift vuruşla bitir" ikinci öldürmeyi saymıyordu: öldürme yalnızca hamle başladıktan 0,9 sn içinde ve o hamlenin vuruşuyla gelirse sayılıyordu; çift vuruştan sonra son darbe çoğu zaman düz bir tıklamaydı ya da süre geçmişti. Artık dersin canavarı son özel hamleden (`LM`) sonraki 2 sn içinde ölürse o hamleyle "bitirilmiş" sayılır.
- Menüde "Versiyon 1.69". chk.js 0 hata; oyun hatasız açılıyor.

## v1.70 (27 Ekim 2026)
- **Alıştırma canavarı alanda kalır:** Börü'den 230 px'ten uzağa gidemez, sınırda geri döner.
- **Alıştırma canavarı sessiz ölür:** ganimet ve XP vermez, `kills` sayacına eklenmez; böylece Reis (boss) çıkışlarını ve av görevlerini tetiklemez (dersle domuz öldürmek Reis çağırıyordu). Ders sayaçları ("bitir" adımları) yine sayılır.
- Ders iptalinde (alandan çıkıp "Evet, dersi bırak") ücret geri verilir (v1.63'ten beri; sınırsız sikke hilesi açıkken gerek yok).
- Menüde "Versiyon 1.70". chk.js 0 hata; oyun hatasız açılıyor.

## v1.71 (27 Ekim 2026)
- **Düzenli saldırı ritmi** (`<script id="v171">`): bir canavar son saldırısından 1 sn geçmeden yeni saldırı başlatamaz (yeni başlayan pençe/hamle/atılış iptal, `atk` beklemesi uzar; reisler hariç); öfkeli, kovalayan, sersem olmayan ve menzilindeki bir canavar 2,5 sn saldırmadıysa saldırı beklemesi sıfırlanır. Zararsızlar ve öğreticideki kerevit hariç; arenada kapalı.
- **Ders paneli tek adım:** soldaki "Börü'nün dersi" kutusu yalnızca şimdiki adımı ve "adım N/M" gösterir; bitince sıradakine geçer.
- **Dersleri ücretsiz tekrar:** Börü'nün ders listesinde öğrenilmiş her ders için "tekrar çalış (ücretsiz)"; tekrarda ücret alınmaz, bitince XP verilmez, iptalde geri verilecek ücret yoktur. Tekrar sırasında kayıt alınırsa tekrar kaydedilmez.
- (Kullanıcının isteği zaten var: "bitir" adımı dışında alıştırma canavarı ölmez (v1.67), ölünce Reis'e/av sayacına sayılmaz (v1.70).)
- Menüde "Versiyon 1.71". chk.js 0 hata; oyun hatasız açılıyor.

## v1.72 (28 Ekim 2026)
- **Alıştırma canavarı soldaki adıma göre davranır** (`curStep` artık her derste ilk bitmemiş adım):
  - Savuşturma / takla ile kaçma / sersemletme adımı: saldırır, ama düzenli aralıkla (iki saldırı arası en az 2,2 sn, en çok ~3,2 sn) ki savuşturmaya vakit kalsın.
  - Vuruş/kombo adımı (`hit:`): saldırmaz ve canı hiç gitmez (her karede dolu tutulur; isabetler yine sayılır).
  - "Bitir" adımı (`kill:`): saldırmaz; canı silahının ~2,4 vuruşluk hasarına iner, kolayca bitirilir. Ganimet/XP/Reis/av sayacı yok (v1.70).
- **ŞİMDİ!/YİNE! halkası yalnızca Ritimli 2. ve 3. vuruş derslerinde** görünür; arenada, normal oyunda ve diğer derslerde (ör. takla vuruşu, bitirici) görünmez. Ritim pencereleri aynı.
- Menüde "Versiyon 1.72". chk.js 0 hata; oyun hatasız açılıyor.

## v1.73 (28 Ekim 2026)
- "Bitir" adımında 2. domuz gelmiyordu: Börü'nün yanında kamp ateşi varken `nearCamp` saldırgan hayvanları sakinleştirip kaçırıyordu; ders sürerken Börü'nün 340 px çevresinde kamp ateşi/güvenli alan sayılmaz (`window.__plLessonAt`).
- Yeni alıştırma canavarı daha çabuk gelir (1,5 sn) ve Börü'den 300 px'e kadar her yerde; oyuncunun yanında yer bulunamazsa Börü'nün çevresinde doğar.
- Menüde "Versiyon 1.73". chk.js 0 hata; oyun hatasız açılıyor.

## v1.74–v1.75 (28 Ekim 2026) — Boğaç'ın isteğiyle bütün Börü dersleri tarayıcıda oynanarak test edildi
- **Kritik (v1.71'den beri):** saldırı düzenleyici, hamlenin hazırlığından (`wind`) sonra gelen atılışı (`lunge`) yeni bir saldırı sanıp iptal ediyordu; canavarların darbeleri hiç inmiyordu (savuşturma/takla adımları sayılmıyordu, "saldırmıyor" hissi). Artık saldırı yalnızca boştayken başlarsa "yeni" sayılır.
- **Güçlü vuruş dersi:** savuşturulan canavar geri itilip ağır vuruşun menzilinden çıkıyordu; derste sersemleyen alıştırma canavarı oyuncunun 20 px yakınında tutulur.
- Ders sayaçları "1. adım: 2/3" biçiminde (iki adım aynı adı taşıyıp karışıyordu); alıştırma canavarının üstünde hasar sayıları gösterilmez.
- **Portallar:** kişinin önüne değil yanına (sağ yan, ~44 px) konur; kazan, örs, fırın, tezgâh ve kişilerden uzak tutulur (`pClear`). Zümrüt'ün portalı kazanın önüne çıkıp kazana erişimi kapatıyordu.
- Test sonucu (2D çizim, tanrı modu, otomatik oyuncu): Takla vuruşu, Çift vuruş, Ritimli 2. vuruş, Ritimli 3. vuruş, Güçlü vuruş ve Bitirici derslerinin hepsi baştan sona bitti. Ulti dersi test edilmedi.
- Menüde "Versiyon 1.75". chk.js 0 hata.

## v1.76 (28 Ekim 2026) — ACT 2'den dönüş kilidi (ana oturum, test turunda bulundu)
- ACT 2'den ACT 1'e dönmenin tek yolu portaldı; portallar Ülker'in gk3 "Portal çekirdeği" görevi bitince açılıyordu ve o görev yalnızca ACT 1'de bulunan malzemeler istiyor (2 Kristal, 2 Demir levha). Fazladan getirmeyen oyuncu ikinci adada kalıyordu. Artık ACT 2'ye bir kez varınca (`denizci.act2`) **Levent'in yanındaki portal (ACT 2)** ve **Ekin'in yanındaki portal (ACT 1)** her zaman açık (`pOk`, v76). Diğer portallar yine gk3 ile açılır.
- Portalın 16 px yakınında E her zaman portalı kullanır (`target` sarmalayıcısı); Ekin'in portalının dibindeki taş ve dal önce toplanıyordu, portal seçilemiyordu.
- Menüde "Versiyon 1.76". chk.js 0 hata; denendi: hileyle ACT 2'ye geçip Levent portalından ACT 1'e, Ekin portalından ACT 2'ye geçildi.

## v1.77 (28 Ekim 2026) — ACT 2 haritası ve konuşma (Boğaç'ın 2. ve 3. maddeleri; ana oturum testi)
- **ACT 2 kişileri haritada yoktu** (Boğaç: "haritada NPC'leri göremedim"): harita yalnız ACT 1 kişilerini çiziyordu. Artık ikinci adada Ülker, Pervin, Tamer, Selin, Alara, Tuna ve Levent büyük ve küçük haritada kendi simgeleriyle (teleskop, asa, tabanca, dişli, ışın kılıcı, roket, gemi) görünür; keşfedilmemiş yerde de görünürler. Simgeye dokununca yol oku konur (`mapObj`). Levent birinci adada da (enkazın başındayken) haritada.
- **ACT 2 kişileriyle E ile konuşulamıyordu** (Boğaç: "bazı NPC'lere tıklayamadım"): yanlarında bir bitki/maden düğümü varsa E her zaman onu topluyordu ("toplanacak şey konuşmadan önce gelir" kuralı). Pervin'in yanında Lif, Tuna'nın dibinde Meteor parçası vardı; ikisiyle E ile hiç konuşulamıyordu. Artık ACT 2 kişisi düğümden en az 10 px uzak değilse kişi seçilir (`target` sarmalayıcısı, v76). Fareyle tıklamak zaten çalışıyordu.
- **Tüccar Nuri ve Işıkçı ikinci adada da çıkıyordu**, birinci adanın koordinatlarında (Nuri'nin gemisi ACT 2 kumsalında, haritada "Tüccar Nuri"). İkisi artık yalnız Yıldızsız Ada'ya gelir.
- Menüde "Versiyon 1.77". chk.js 0 hata; denendi: ACT 2 haritasında 7 simge, bütün ACT 2 kişilerine fareyle tıklanıyor ve 14–26 px'ten E ile konuşuluyor.

## v1.78 (28 Ekim 2026) — "önce belge" kuralı, Tanrı modu ve mor ışık
- **Kural:** CLAUDE.md'nin ve bu dosyanın en üstüne yazıldı: tasarım belgesi güncellenmeden geliştirme yok; belge ile kod çelişirse belge doğru. Belge araçları `proje/tools/belge/` (README orada).
- Tanrı modu (hile) açıkken gece ışıksız kalınca mor ışık yine öldürüyordu (sikkenin ve yığınların %20'si gidiyordu). Belgede "Tanrı modu: ölmezsin" yazdığı için kod belgeye uyduruldu: Tanrı modunda karanlık sayacı işlemez.
- Menüde "Versiyon 1.78". chk.js 0 hata.

## v1.79 (28 Ekim 2026) — QA turu: Börü dersleri, kerevit kapanı, kamp görevi, envanter
Kaynak: tarayıcıda oynanarak yapılan QA turu (/home/claude/qa/AJAN_RAPORU.md). Önce tasarım belgesi güncellendi (Börü'nün dersleri, Reisler, Kapan ustası, portallar, görevler), sonra kod.
- **Çift vuruş dersi kilitleniyordu:** ders başına 16 alıştırma canavarı sınırı dolunca (ör. "Tek vuruşta öldür" hilesiyle ya da düz vuruşla bitirilen domuzlar sayılmayınca) yeni canavar gelmiyordu, ders bitirilemiyordu. Sınır kalktı (`spawnFoe`, `FOE.n>=999`); "Tek vuruşta öldür" (v155) alıştırma canavarına (`a.ders`) işlemez. Denendi: hile açıkken Çift vuruş dersi bitti.
- **Ders sırasında Reis gelmez:** `window.__plLessonOn` (v129); `bossCheck` ve `tickBossQ` ders sürerken bekler. Ders sırasında dolan Reis ders bitince/bırakılınca gelir (denendi: Kurt Reisi dersten çıkınca geldi).
- **"Derse dön"** oyuncuyu Börü'den 140 px'e koyar (önce 230'du, 280'lik sınırın dibinde; bir takla yine soruyu açıyordu, canavar da 230 tasmasıyla oyuncuya ulaşamıyordu).
- **Ders metinleri:** "Sana şu kurdun getirdim" → "Sana bir kurt getirdim" (`l.foe` küçük harf). Ücretsiz tekrar seçeneği listede olunca başlık "Şimdilik öğreteceğim yeni bir şey yok" diyordu; artık alınabilir ders varsa "Hangisini öğrenmek istersin?".
- **Kapan ustası (Boğaç 5. madde):** "Nerede" satırı Çayır diyordu (kerevit hayvanının yaşadığı yerden hesaplanıyordu); kapana kerevit yalnızca Bataklık/Kayalık Dağ sularında girer. Satır artık Bataklık'ı gösterir (v150, `q.id==='a2'`). Denendi: Çayır nehrinde 15 avda 0, doğu kıyısında 15 avda 3 kerevit.
- **Kamp gecesi görevi:** sayaç ilerliyor ama kart 0/60'da kalıyor, görev başka bir olay olana kadar tamamlanmıyordu; `tickCamps` her saniye `renderTut` çağırır.
- **Envanterde çift kutu:** kayıt 0 adetli eşyaları `inv`'den atıp `order`'da bırakıyordu; `gain` yeniden ekleyince aynı eşya iki kez listeleniyordu. `gain` artık `order`'da varsa eklemez.
- Tarla portalı: Hasan'ın portalı tarlanın içine düşüyordu (Boğaç 4. madde), pClear tarla parsellerini dışlıyor — ana oturum.
- Belgenin HTML'i (`Purple_Light_belgeler.html`) bu sürümde yeniden üretilmedi; ana oturum üretecek.
- Menüde "Versiyon 1.79". chk.js 0 hata; v48_bugs.js'deki FAIL'ler v1.78'de de aynı (eski testler).


## v1.81 (28 Ekim 2026) — öğretici atlama uyarısı, Börü'nün atılma dersi, Zırh, üç renkli yetenek ağacı
Önce belge (parts/00, 10, 20, 40, 92), sonra kod. Boğaç bakıp geri dönüş yapacak.
- **Eğitimi geç:** `tzSkip` artık Ekin'in uyarısını açar ("Öğrenmek istiyorum" / "Zaten biliyorum, geç"). Geçen hiçbir şey almaz (tarif, balta, meşale, XP, sikke yok); yalnızca menüler açılır ve Ekin'in ilk görevi gelir. Telefondaki "Emin misin? Geç" ön onayı kapatıldı (`if(false&&…)`).
- **Atılma dersi** (`v181` bloğu, `window.__plDL`): kerevit yumruklanınca `tzAlpDone` sarmalayıcısı Börü'nün ders konuşmasını açar → `S1` ücretsiz verilir (ağaçta yok, gizli bayrak) → `tut:true, dl:true` kerevit; bekle → kırmızı ! (0,8 sn) → atılma. İlk saldırıda `paused=true` ile oyun durur, ortada "Boşluk'a bas!" (telefonda "Atıl düğmesine dokun!"); basınca `release()` → `doDodge()`. Sonra 3 saldırı daha (atılma, ! görüldükten sonra ya da saldırı anında sayılır; ıskalama can yakmaz). 4 sıyrılma → Börü "İlk ders tamam" → "Yetenek ağacını aç" zorunlu (ortada yazı, ikon yanıp söner) → ağaçta Koşu yanıp söner + Börü notu → ağaç kapanınca asıl `tzAlpDone` (balta tarifleri) sürer. Öğreticiyi geçen ve S1'i olmayan biri Börü'yle konuşunca aynı dersi ücretsiz alır (`talkAlp` sarmalayıcısı). `coinWatch` artık Koşu'yu duyurur; Atılma/Koşu ders metinleri 100 sikke Koşu'ya göre.
- **Zırh:** `zirhOf()=seviye−1 + Zırh I–IV (5/12/20/30)`; `armorMul=25/(25+armorDef()+zirhOf())`. `armorDef` yalnızca eşya (Ekin'in savunma 60 görevi değişmedi). Karakter/envanter ekranlarında Zırh ayrıca yazar.
- **Yetenek ağacı:** `SKT` → `SKILLS` (row/col/r), 3 ağaç × 21. Görünürlük `skSeen` (alttaki iki komşudan biri alınmış), fiyat sıraya göre `SKROWC` (100…5000), seviye `LVREQ`. Sekmeler `skTab`. Yeni yetenekler: E1 (satış +%50), D1 (can +50), W1–3 (`skDmg`, bütün hasar formüllerinde), D2/D5/D7/D10 (zırh), D3/D4/D6 (direnç, `addFx` sarmalayıcısı), D8 (Son nefes, `hurt`), D9 (Çelik beden, süre ×0,5), C9 (yenilenme ×4). Can: C3 100 / C5 175 / C8 250. Kaldırılanlar `SKGONE`: kayıt açılınca eski fiyatları iade edilir (Bilgelik: Zor mod tasarlanırken yeniden düşünülecek).
- Ekin'in 3. görevi ("ilk yeteneğini al") artık gizli S1'i saymaz.
- Test yapılmadı (kural); yalnızca chk.js 0 hata.

## v1.80 (28 Ekim 2026) — v1.78'in tanrı modu değişikliği geri alındı
- Boğaç: mor ışığın tanrı modunda da öldürmesi bilinçli (bkz. en üstteki KARAR). v1.78'de eklenen `!window.__plGod` koşulu kaldırıldı; belge (Temel sistemler → Bayılma ve ölüm, Hileler; ACT 3 notları → planlanan gizli başarım) buna göre güncellendi.
- Menüde "Versiyon 1.80". chk.js 0 hata.
