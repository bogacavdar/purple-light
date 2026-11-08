## v3.88 (9 Kasım 2026) · envanter/karakter iki sütun, seviye puanı dersi ve hatırlatması

**Değişen yerler:** `v387env`: envanterde `cbody` içeriği `.pfgrid` > `.pfl` (sekmeler + tek sütun liste) ve `.pfr` (sticky; `.pftop.pfi` figür + karakter + `.pfside` içinde `.iact`); Karakter sekmesinde `renderCraft` sarmalı `.pftop.pfc` ile zırh notunu sağa (`.pfr`), seviye/özellik tablosunu sola alır ve `cpanel.wide` ekler. Yeni blok `v388sp`: ilk seviye atlayışta (`SPTUT` 0→1) 2,6 sn sonra `#spcard` öğretici kartı (dışına basmak kapatır), puan kaldıkça `#spchip` ("N seviye puanı ver", XP çubuğunun sağ üstünde; telefonda çubuğun sağında), Karakter düğmesi `pulse`, pencerede `.spcallin` şeridi ve `.spplus.spwant`. Belge: 20_sistemler.md Envanter ve Seviye puanları maddeleri. Sürüm etiketi `Versiyon 3.88`.

**Geri alma:** `git revert` bu commit (iki sütun düzeni ve `v388sp` gider; v3.87 düzeni kalır).

**Kontrol:** chk.js 0 hata. 1920×1080: envanter (liste solda, figür sağda), Karakter (tablo solda). Tıklama denemesi v3.87'deki gibi geçti. `gainXP(45)` → 2. seviye: kart açıldı, "Puanımı vereyim" pencereyi açtı, şerit ve parlayan + göründü, + ile puan verildi (`SPTUT` 2). 844×390 telefonda kart ve düğme görünüyor. Konsol hatası yok.

## v3.87 (9 Kasım 2026) · envanter: figür, karakter, liste, alttaki yuvalar

**Değişen yerler:** yeni blok `v387env` (dosyanın sonunda): bilgisayarda (`body:not(.v50m)`) `renderInvPanel` sarmalı v92'nin `.ieq` şeridini siler, yerine `.pftop` (renksiz figür `.pfig` + `.pfs[data-ieq]` yuvaları, `#pfchar` karakter tuvali, `.pfside` içine taşınan `.iact`) koyar; v92'nin `data-ieq` tıklaması aynen çalışır. `dollHTML`/`drawDoll` sarmalı: Özellikler penceresinde aynı figür (`data-eqs`, `.eqpick` korunur). CSS: `.cpanel.invm .tiles` liste (240 px satır), `.ibelt` gizli; envanter açıkken `body.v387inv` ile `#hotbar`/`#torchslot` z-index 7; `#hotbar` için yakalayan tıklama (seçili taşınabiliri yuvaya koyar / yuvadakini seçer) ve sürükleme başlangıcı (`idrag`, mevcut `bsAt` bırakmayı alır); seçili eşyanın gideceği yuva `.v387want`. Telefon (v50m) değişmedi. Belge: 20_sistemler.md Envanter maddesi. Sürüm etiketi `Versiyon 3.87`.

**Geri alma:** `git revert` bu commit (`v387env` bloğu ve belge maddesi gider; eski kutucuklu envanter ve pencere içi alet yuvaları geri gelir).

**Kontrol:** chk.js 0 hata. 1920×1080 ekran görüntüsü: envanter ve Özellikler. Tıklama denemesi: Eller yuvasına tıkla → Kürk eldiven giyildi, tekrar → çıktı; Taş balta seçili + alttaki 3. yuvaya tıkla → yuvaya girdi, pencere açık kaldı; Özellikler'de Eller → liste açıldı → giyildi. Konsol hatası yok.

## v3.86 (9 Kasım 2026) · öbekler kalktı, toplanacaklar %20 az

**Değişen yerler:** `v372sade` yeniden yazıldı: öbek kurma, `GAP`/`spotOk`/`putP`, `KIN` ve `findSpot` sarmalı (öbeğe yeniden çıkış) silindi; bitkiler yerinde kalır, `hz(x,y,3.1)≥.6` silinir (%40); temel malzemeler `hz(x,y,91.7)<.44` (%44), Yaprak `<.2` (%20). `window.__plSade` kalktı. Sürüm etiketi `Versiyon 3.86`.

**Geri alma:** `git revert` bu commit (v3.78'in öbekli hali geri gelir).

**Kontrol:** chk.js 0 hata. Yeni oyun: öbekte duran bitki 2888 → 40, 16 px'ten yakın 80; biyom başına toplanabilir ACT 1 429/394/427/494/417/489, ACT 2 303/253/318/302/304/297 (önceden 525/489/474/577/506/568 ve 369/298/405/369/375/353). Kurulum 12 ms.

## v3.85 (9 Kasım 2026) · kamp ağaçları halkadan seyrek

**Değişen yerler:** `v375kamp`: `MINPINE` 12 → 6; korunan çamlar halkanın payına sayılır (`keep2=(keep×n−safe)/(n−safe)`). Sürüm etiketi `Versiyon 3.85`.

**Geri alma:** `MINPINE=12`, `keep` ile seyreltme.

**Kontrol:** chk.js 0 hata. Yeni oyun: kampta ekran başına ağaç 9,3 → 5,0 (halka 6,9), 6 Çam; Zümrüt'ün kazanı çevresi ekran görüntüsüyle bakıldı.

## v3.84 (8 Kasım 2026) · meyvesiz ağaçlar %50 seyrek

**Değişen yerler:** v77 ağaç türleme döngüsü: tür atandıktan sonra `!tr.type.fruit&&!nearSp&&hash(tx,ty,653)<.5` olan ağaç alınmaz (kamp sonra `v375kamp` ile halkasının sıklığına iner). Sürüm etiketi `Versiyon 3.84`.

**Geri alma:** o satırı sil.

**Kontrol:** chk.js 0 hata. Yeni oyun ağaç: ACT 1 2.811 (Çayır 675: Elma 88, Armut 96, Çam 255, Kavak 236; meyve ağaçları değişmedi), ACT 2 3.343. Kamp: ekran başına 9,3 ağaç, 12 Çam. Ölçüm (`olcum.js`, 4): açılış js 11124 → 10292 ms, oyun 10 sn js 4205 → 4437 ms (gürültü içinde).

## v3.83 (8 Kasım 2026) · el yapımı malzeme kutusu, meşale yuvası yanıp sönmesi

**Değişen yerler:** yeni `<style id="v383ui">` (`#craft .book.hand` son iki satırda `br+small` kutusu `bottom:100%`; bilgisayarda `#craft.cm-hand .cpanel{height:var(--plMaxH)}`: pencere hep aynı boyda) ve `<script id="v383meşale">` (`renderTut` sarmalı + 400 ms: kart metni "yanıp sönen … meşale yuvası" diyorsa `#torchslot.pulse`; tz yolu bunu hiç eklemiyordu, yalnız `torchTut===2` ekliyordu). Sürüm etiketi `Versiyon 3.83`.

**Geri alma:** iki bloğu sil.

**Kontrol:** chk.js 0 hata. 1920×1080'de yalnız Kaba meşale bilinirken üstüne gelince kutu tam görünüyor (ekran görüntüsü); tz=6 kartında `#torchslot` `pulse` animasyonunda.

## v3.82 (8 Kasım 2026) · ACT 2 çiğ yiyecekleri FOODT'ten

**Değişen yerler:** v77 bloğundaki `Object.assign(RAWFOOD,{'Bulut elması':8,'Goblin eriği':6,'Gök mantarı':3,'Kök yumrusu':5})` silindi (FOODT'teki 26/29/25/29 eziliyordu; belge FOODT'i yazıyordu). `FOODT`'a `'Keme':[8,30,'doygun']`; `v373sade`'deki `RAWFOOD['Keme']=4` silindi. Sürüm etiketi `Versiyon 3.82`.

**Geri alma:** satırı geri koy (ya da `git revert`).

**Kontrol:** chk.js 0 hata. Yeni oyun ACT 2 çiğ tokluk: Gök mantarı 25, Bulut elması 26, Rüzgâr eriği 26, Kök yumrusu 29, Spor elması 29, Goblin eriği 29, Keme 30, Çöl inciri 31, Buz armudu 33, Lav narı 35, Yıldız kirazı 37.

## v3.81 (8 Kasım 2026) · ACT 2'nin kullanılmayan 36 malzemesine tarif

**Değişen yerler:** `v373sade` v3.81 satırları: `dish()` (yeni yemek; fiyat = girdiler × 1,4 + 12, ateşliler `FIRE_R`) ve `vary()` (var olan tarifin bir malzemesi değişir; `VO`, fiyat asılınki, istasyon kümeleri kopyalanır); 11 yemek, 18 varyant; `window.__plA2New`. Sürüm etiketi `Versiyon 3.81`.

**Geri alma:** `git revert` bu commit (yalnız `v373sade`'deki v3.81 bloğu).

**Kontrol:** chk.js 0 hata. Denetim (3.80 ↔ 3.81): tarif 968 → 997 (varyant 157 → 175), eşya 1326 → 1337, bilinmeyen 0, fiyatsız 0, kullanılmayan ham 105 → 69 (ACT 2'nin 36'sı tarifte). Yemeklerin hepsi yenir (tokluk 36–60), resimleri torba değil (çorba/çay kabı, renkleri farklı).

**Ayrıca:** `v380bitki` yerleştirmesi düğüm ızgarasını her eklemede değil sonda bir kez kuruyor (açılışta 488 ms → ölçülmeyecek kadar az). Ölçüm (`olcum.js`, 4; 3.75 ↔ 3.81): açılış js 10712 → 11124 ms, oyun 10 sn js 4006 → 4205 ms (ölçüm gürültüsü içinde; telefonda denenmeli).

## v3.80 (8 Kasım 2026) · ACT 2'de yalnız kendi bitkileri, mağara ağzında Sarkıt/Yarasa gübresi, benzer bitkiler birleşti

**Değişen yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):** v77 yerleşim: ISLE 2'de `window.__I1G` (ACT 1 biyom bitkileri ve madenleri) adları da silinir; `MINEPL` maden çevresi yerleşimi silindi. Yabani mercimek, yulaf, arpa, Saz, Hasırotu, Kızıl kum, Cüruf, Sünger taşı, Işık tozu, Kristal kum kaynaktan silindi (`BPLANT`, `B4PLANT`/`ZPLANT`, `PLANTC`, `FOODT`, `ODD`, `NEWP`, ad açıklamaları, `P1I`/`P1W`, v337 bitki resim tablosu). Görevler: VE7, TU8, IN3 (+`ki3`). Yarasa gübresi ipuçları ("mağara ağızlarında"). `v373sade` v3.80 satırları: `REPL` (ham + ürünleri: unu/lapası/hamuru/yassı ekmeği/kavrulmuş; Saz/Hasırotu → Kamış; Kızıl kum → Kırmızı okr; Cüruf → Kül; Sünger taşı → Lav camı; Işık tozu → Yıldız tozu; Kristal kum → Kristal). Yeni `<script id="v380bitki">`: ACT 1 mağara kapılarına (`__plCaves[].door`) 7 Sarkıt + 7 Yarasa gübresi (34–80 px, ağzın önü ve yanları), `findSpot` sarmalı (kendi biyomunun bir mağara ağzında yeniden çıkar), ISLE 2'de yok. Sürüm etiketi `Versiyon 3.80`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Denetim (3.79 ↔ 3.80): eşya 1351 → 1326, tarif 983 → 968, bilinmeyen 0, fiyatsız 0, yeni kullanılmayan ham 0. Bitki türü/adet: ACT 1 Çayır 10/525, Orman 11/489, Bataklık 12/474, Kayalık 13/577, Kül 11/506, Mor 12/568; ACT 2 8/369, 7/298, 9/405, 8/369, 8/375, 8/353. Mağara ağzı: 6 mağara × 7 = 42 Sarkıt, 42 Yarasa gübresi (ekran görüntüsüyle bakıldı). Eski kayıt: 3 Yabani mercimek + 1 nohut → 4 nohut, Yabani arpa lapası → Yabani buğday lapası, 2 Saz + 2 Hasırotu → 4 Kamış, Kızıl kum → Kırmızı okr, Işık tozu → Yıldız tozu, Kristal kum → Kristal.

## v3.79 (8 Kasım 2026) · her biyomda iki meyve ağacı

**Değişen yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):** Erik kaynaktan silindi (`TREE_TYPES`, `TREE_TIER`, `FRUITC`, `RAWFOOD`, `SEEDS`, `BTREE`, `FOODT`, almanak `trees`, `P1I['Yabani erik']`, `A['Erik tohumu']`, `SAPL`/`A['Erik fidanı']`, odun fiyat listesi; eski yeniden türlenen `TT[5+…]/TT[10]` satırı). `TREE_TYPES`'a Dut, İncir (`noCut`); `BTREE` Bataklık/Kül; `__I2C.trees` her biyoma bir yeni meyve ağacı (`noCut`). Biyoma göre türleme: `w = meyve ? .45/nF : 1` (meyve ağacı sayısı aynı). `FOODT`'a 8 yeni meyve. `v373sade` v3.79 satırları: `GONE379`, Erik `REPL`/`FOODX`, 8 meyveye fiyat, `FRUITC` rengi ve "X ezmesi" tarifi (3 meyve + 1 Su, Taş havan, fiyat `round(f×3×1,25+4)`); tarif silme kuralı (girdisi FOODX olan, Erik varyantı); `walk` fidan `k` alanı (`SPEC1` Erik → Armut); bildirim metni genel. Yeni `<script id="v379meyve">`: 8 meyve resmi (kendi `A` haritası + `icon` sarmalı, yalnız bu adların önbelleği silinir). Sürüm etiketi `Versiyon 3.79`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Denetim (3.78 ↔ 3.79): eşya 1341 → 1351, tarif 979 → 983 (varyant 159 → 157), bilinmeyen 0, fiyatsız 0, yeni kullanılmayan ham 0. Meyve ağaçları: Çayır Elma 88 + Armut 96 (önce 184 Elma), Orman Ceviz 78 + Fındık 56, Bataklık Mürver 41 + Dut 34, Kayalık Ardıç 65 + Kestane 54, Kül Ateş narı 21 + İncir 24, Mor Ay elması 30 + Yıldız eriği 28; ACT 2 Bulut elması 83 + Rüzgâr eriği 93, Goblin eriği 110 + Spor elması 114, Hurma 64 + Çöl inciri 69, Kristal armut 72 + Buz armudu 56, Ejder meyvesi 28 + Lav narı 37, Gök üzümü 38 + Yıldız kirazı 32. Resimler torba değil (görüntüyle bakıldı). Eski kayıt: 3 Erik odunu + 1 Çam odunu → 4 Çam odunu, Erik fidanı/tohumu → Armut, dikili Erik → Armut, 2 Yabani erik → 4 sikke.

## v3.78 (8 Kasım 2026) · öbeklerde bitkiler üst üste binmez

**Değişen yerler:** `v372sade`: `GAP=18`; `spotOk` yerleştirilmiş bitkilere ızgarayla (`putP`, 18 px hücre) bakar ve `placed` artık bütün türler için tek (öbekler birbirine de binmez); öbek halkası `r=GAP+0..14` (18–32 px); yeniden çıkışta `nodeNear(x,y,GAP)`. Sürüm etiketi `Versiyon 3.78`.

**Geri alma:** `GAP`'i 9, halkayı `10+…*18` yap ve `placed`'i grup başına diziye geri çevir (ya da `git revert`).

**Kontrol:** chk.js 0 hata. Yeni oyun, bitki 3762 → 3702: en yakın komşusu 16 px'ten yakın olan 2144 → 13, 10 px'ten yakın 204 → 6 (öbeklenmeyen kamp çevresi); öbekte duran 2888. Kurulum 36 → 50 ms (bir kez).

## v3.77 (8 Kasım 2026) · biyom + mağara tek mantar, Keme, tekrarlayan görev malzemeleri

**Değişen yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):** Çayır mantarı, Mağara mantarı, Kök mantarı kaynaktan silindi (ilk bitki tablosu, `DOG_MATS`, `RHINT`, `PLANTC`, `B4PLANT`, `RAWFOOD`, `P1I`/`P1W`, `BPLANT`, `MINEPL` ve döngüdeki istisna, `POISON`, `ODD`, mağara `RAW` ve `CAVES[].raw`, v372 `SKIP`, `FIRE_R`); `addR('Kök mantarlı güveç')` → `Kanlıcalı güveç` (2 Kanlıca, `PX_` resmi aynı), `Kök özü iksiri` 2 Kök reçinesi; Yankı mantarı çiziminden Kök dalı kalktı. Çizim kuralı: mantar dalına `(^| )[Kk]eme$`, çorba dalına `güveç$`. `__I2C.plants[2]`'ye Keme. Görev verisi: Y1, Y6, NF1, NF2, Z7, DU7, AL6, KA7, KA8 ("Pençe ve çakmak"), ME8, KU8. `v373sade` v3.77 satırları: 7 eşya `FOODX` + `OLDP` (sikke), `REPL['Kök mantarlı güveç']`, Keme fiyatı 22 / `RAWFOOD`, `Kızarmış keme` tarifi (66, ateş). Sürüm etiketi `Versiyon 3.77`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Denetim (3.76 ↔ 3.77): eşya 1344 → 1341, tarif 980 → 979, bilinmeyen 0, fiyatsız 0, yeni kullanılmayan ham 0 (Mağara kurdu eti Kanlıcalı güveçte). Mantar sayımı: ACT 1 Kanlıca 49, Sinek 43, Kayın 37, Işık 43 (dışarıda; Yankı ve Kül mağarada); ACT 2 Gök 41, Işıldak 50, Keme 42, Kristal 43, Kor 44, Yıldız 41. Resim: Keme, Kızarmış keme, Kanlıcalı güveç iki adada da torba değil. Eski kayıt: 3 Çayır + 2 Kök + 2 Mağara mantarı → 54 sikke, Kök mantarlı güveç → Kanlıcalı güveç.

## v3.76 (8 Kasım 2026) · her biyomda tek mantar

**Değişen yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):** Tavuk mantarı, Kuzugöbeği, Kav mantarı kaynaktan silindi: ilk bitki tablosu (Kav), `PLANTC`, `B4PLANT`, `RAWFOOD`, `P1I`/`P1W` resimleri, `BPLANT`, `POISON`, `ODD`, yiyecek etkisi tablosu, `NEWP`; Mantar şapkası: `__I2C.plants[1]`, ACT 2 `RAWFOOD` ve etki tablosu. `B4PLANT` döngüsünde `ISLE===2&&k==='Kayın mantarı'` atlanır. `FIRE_R` listesinden iki kızarmış; tür regex'lerinden kuzugöbeği. Görev verisi (Y3, Y6, NF1, FI2/kf2) Kanlıca / Kayın mantarı ve metinleri. `v373sade`: `REPL`'e 6 eşleme (tarifler ve eski kayıt çevirisi bu yolla), Kurutulmuş tavuk mantarı/kuzugöbeği `FOODX`. Sürüm etiketi `Versiyon 3.76`. `DB` JSON'a dokunulmadı (kalkan tarifler `v373sade`'de düşer).

**Geri alma:** `git revert` bu commit (belge ve kod birlikte).

**Kontrol:** chk.js 0 hata. Denetim (3.75 ↔ 3.76): eşya 1350 → 1344, tarif 982 → 980, bilinmeyen girdi 0, fiyatsız 0, yeni kullanılmayan ham 0. Mantar sayımı: ACT 1 Çayır mantarı 41, Kanlıca 49, Sinek 44, Kayın 38, Işık 50; ACT 2 Gök 47, Işıldak 50, Kristal 50, Kor 48, Yıldız 41. Eski kayıt: 3 Tavuk + 1 Kanlıca + 2 Kuzugöbeği → 6 Kanlıca, 4 Kav mantarı → 4 Kayın mantarı, Kızarmış kuzugöbeği → Kızarmış kanlıca.

## v3.75 (8 Kasım 2026) · başlangıç kampı da seyrelir

**Değişen yerler:** yeni `<script id="v375kamp">` (en sonda; sayfa açılınca bir kez, `built` korumalı, 11 ms): kamp (spawn'dan < 20 karo) halkanın (20–40 karo) sıklığına iner. Ağaçlar: `keep = halka yoğunluğu / kamp yoğunluğu`, `hz(x,y,4.4) ≥ keep` silinir; `hz` sırasıyla ilk 12 Çam, `v343` ve `keep` ağaçları korunur. Düğümler: tür başına aynı oran (`hz(x,y,6.6)`); `mine/night/tzN/tutN/sq/keep/q/quest` dokunulmaz. `window.__plKamp={trees,nodes,ms}`. Sürüm etiketi `Versiyon 3.75`.

**Geri alma:** `v375kamp` bloğunu sil (ada bir sonraki açılışta eski haliyle kurulur; kayıtta ağaç/düğüm tutulmaz) ve belgedeki satırı geri al.

**Kontrol:** chk.js 0 hata. Yeni oyun: kampta ekran (900 karo) başına ağaç 43 → 12,2 (halka 12,4), toplanan şey 68 → 24,4 (halka 18,1), kampta 12 Çam, öğretici düğümleri 5 → 5; 43 ağaç, 62 düğüm silindi. Ölçüm (`olcum.js`, 4): frame 3668 → 3599 (gürültü içinde ya da biraz hafif).

## v3.74 (8 Kasım 2026) · Kemal'in "seni hatırlıyorum" düğmesi

**Değişen yerler:** `v337meta` bloğunda `askName` sarmalı: `say(t,[{t:'…'}])` → `cnt===1?'Hatırlamıyorum…':'Ne demek istiyorsun?'`. Sürüm etiketi `Versiyon 3.74`. Belge: 20_sistemler "Seni hatırlıyorum".

**Geri alma:** düğme metnini `'…'` yap (belge satırıyla birlikte).

**Kontrol:** chk.js 0 hata.

## v3.73 (8 Kasım 2026) · sade malzeme: biyom başına tek kalas/sap/kömür/kaşık, kurutulmuş otlar ve kullanılmayan kurutulmuşlar kalktı

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v373sade">` (en sonda, `v366tarif`ten sonra çalışır): `LAND1`/`LAND2` (asıl ağaç → öbür ağaçlar), `REPL` (türe özgü kalas/sap/kömür/kaşık → asıl; ACT 2'de yalnız kalas), `HERB` (kullanılan kurutulmuş ot → taze, ×3), `FOODX` (hiçbir tarifte kullanılmayan kurutulmuşlar; `KEEPDRY` ve "tabanının tek kullanımı" koruması hariç). `DB.R`'den kalkanlar silinir, girdiler eşlenip birleşir, aynılaşan varyantlar silinir, her öbür ağaç için `C kalası (S odunu ile)` varyantı eklenir (`VO`, `PRICE_`); `REC`/`RESULTS`/`USES`/`FORGED`/`FIRE_R`/`PLACEABLE`/`ARMORSET`/`PRICE_`/`DEPTH`/`CAT_N`/`CHEAT_RES` yeniden kurulur. `window.__plSadeInfo`, `window.__plSadeMap`.
- `applyState` sarmalı: kayıt JSON'unda kalkan bir ad varsa derin yürür (sayı haritası anahtarları, dizideki adlar/[ad,...] demetleri, `{n,q}` nesneleri), FOODX eski fiyattan (`OLDP`) sikkeye; bildirim metni `s.v373t` ile sayfa yeniden yüklense de taşınır.
- Kaynakta: `v184`/`v251` usta silah sapları (Huş, Mor söğüt, Kül ağacı sapı), `v186` K1/EK6 Meşe kalası (metinler), `v55-q` gk1 Mavi mantar kalası. Sürüm etiketi `Versiyon 3.73`.

**Geri alma:** `git revert` bu commit (blok + kaynak isimleri + belge birlikte). Kayıtlar: çevrilmiş kayıtlar geri çevrilmez (eski adlar yeniden eklenirse çantada yalnızca asıl kalaslar kalır), oyun bozulmaz.

**Kontrol:** chk.js 0 hata (183 script). Denetim (eski 3.71 ↔ yeni): eşya 1505 → 1350, tarif 1105 → 982 (159 varyant), bilinmeyen girdi 0, fiyatsız 0, yeni kullanılmayan ham malzeme 0. Eski kayıt (gerçek kaydet/yükle, yeniden yükleme dahil): 3 Ladin + 1 Meşe kalası → 4 Meşe kalası, 2 Kurutulmuş kekik → 6 Kekik, Kurutulmuş geyik eti → 87 sikke, Ardıç kaşığı → Huş kaşığı, Işık ağacı sapı → Mor söğüt sapı, kitaptan Ladin kalası silindi. `Çam kalası (Kavak odunu ile)` el yapımı: 1 Çam kalası verir.

## v3.72 (8 Kasım 2026) · madenler arası mesafe

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v372maden">`: `findSpot` maden adları (`MINES`) için sarılır: en çok 25 aday, `ok()` = aynı tür ≥ 96 px, herhangi maden ≥ 48 px (canlı madenler, kendisi hariç); bulunamazsa `null` (yeniden çıkış döngüsü 3 sn sonra yeniden dener). `spread()`: kurala uymayan canlı madenleri `findSpot(name,null,n)` ile taşır (biyom korunur, eski yerden ≥ 60 px), sonra `NGR` ızgarası sıfırlanır, `PERF.visT=0`, `__plRockDirty`. `startNew` ve `restore` sonrasında bir kez çalışır. `window.__plSpread`.
- Yeni `<script id="v372sade">` (sayfa açılınca bir kez, `built` korumalı; 44 ms): başlangıç kampının 20 karosu dışında, konumdan karma (`hz`, rnd yok): temel malzemelerin (Dal, Lif, Taş, Nehir çakılı, Kum, Çakmaktaşı) %30'u silinir; bitkiler (maden, gece, mağara, öğretici, Yaprak ve temel dışındaki `RULE`'u olan düğümler) tür+biyom grubunda %75'e iner ve 3–5'lik öbeklere taşınır (öbek merkezi mevcut bir bitki; üyeler 10–28 px, `spotOk`: kural karosu, `reachAt`, aynı biyom, ağaç 9 px, maden 24 px, kişiler 34 px, `__plFloorBusy`). `KIN` (tür → düğümler); `findSpot` sarılır: bitki yeniden çıkarken 20 denemede yaşayan bir türdaşının 10–28 px yakını, olmazsa eskisi. `v365build`'de `window.__plFloorBusy` (yerinde).
- Sürüm etiketi `Versiyon 3.72`.

**Geri alma:** `v372maden` ve `v372sade` bloklarını sil, `__plFloorBusy` satırını kaldır (düğümler kayda yazılmadığı için ada bir sonraki açılışta eski haliyle kurulur).

**Kontrol:** chk.js 0 hata (179 script). Yeni oyun (554 maden, 18 tür): önce aynı tür < 40 px 10, < 64 px 25, < 96 px 69; herhangi < 40 px 22 — sonra aynı tür < 96 px 0, herhangi < 48 px 0; tür sayıları aynı. Yerleşmiş haritada ikinci `spread` 0 taşıma, 48 ms. Sade harita: toplanabilir 11.317 → 8.505; ekran başına (27×15 karo) Çayır 38 → 33, Orman 39 → 34, Bataklık 27 → 23, Kayalık Dağ 34 → 26, Kül 24 → 21, Mor Kristal 25 → 20 (temel 10 → 8, bitki 12 → 9, ağaç aynı); bitkilerin %88'inin 2 karo içinde en az 2 türdaşı var; 200 yeniden çıkışın 200'ü bir türdaşının yanında. Ekran görüntüsünde 5'li papatya öbeği.

## v3.71 (8 Kasım 2026) · leşte tek gölge, öğretici malzemeleri uygun yerde, köpek yokken R kapalı

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- `v337les` (yerinde): leş çiziminde `noShadow(()=>drawAnimal(...))`: çizim sırasında `ctx.fill`/`ctx.fillRect` örnek düzeyinde sarılır, dolgu rengi `rgba(0,0,0,.22|.25)` olan çağrılar atlanır (bütün canlı çizicilerinin ayakta gölgesi), sonra `delete` ile prototipe dönülür.
- `v345` (yerinde): `window.__plNearP(x,y)`; `pplClear` `n.tzN||n.tutN` olan düğümleri atlar.
- Yeni `<script id="v371yer">`: `tzPlace` ve `bringBerry` yeniden yazıldı: yer seçiminde kişilerin 32 px'i (`__plNearP`), `FIRES`, `camps` ve `lightSources()` (Kemal'in ateşi, ocak, kazan; eldeki meşale hariç) 26 px'i, ağaç 14 px, düğüm 12 px dışı; konan düğümlere `tzN:1` / `tutN:1`. `openMenu('dogs')` köpek yokken hiçbir şey yapmaz; `body.nodogs` sınıfı (0,5 sn'de bir) kol menüsündeki `#p-dogs` ve Kontroller'deki `[data-kb="dogs"]` satırını gizler.
- Yeni `<script id="v371el">` (yalnız `!TOUCH`): 16×16 iki şekil (`POINT`, `PALM`), kenar otomatik (dolgunun 4 komşusu, `#3a1c5c`), sağ/alt gölge, parmak ucu mor, çevresinde `rgba(160,80,255,.5/.78)` ışık (köşegende ×0,55), 2× çizilip PNG `dataURL`; CSS `body:not(.ontitle) #game` ve `body.plpalm` için `cursor:url(...) 13 2` (v3.32'nin nişangâh kuralını ezer; menü okları aynı). `cv` üstünde `mousemove` (80 ms'de bir) ve 250 ms'de bir `pickAt` → `tg` var ve su değilse `plpalm`. `window.__plHand`.
- Sürüm etiketi `Versiyon 3.71`.

**Geri alma:** `v371el` ve `v371yer` bloklarını sil; `v337les`'te `noShadow` sarmasını, `v345`'te `__plNearP` ve `pplClear`'daki `tzN/tutN` koşulunu geri al.

**Kontrol:** chk.js 0 hata (177 script). Duman denemesi: 30 × 5 öğretici böğürtleni, kişilere en yakın 33 px, ateş/ışığa en yakın 26 px; köpeksiz R → pencere açılmadı, `nodogs` var; köpek gelince R → köpekler penceresi; Geyik leşinin ekran görüntüsünde tek gölge. İmleç: Kemal'in üstünde `plpalm` açık, boş zeminde kapalı; iki imleç büyütülmüş ve gerçek boyutta (yeşil ve koyu zeminde) görüntüyle bakıldı. Sayfa hatası yok.

## v3.70 (8 Kasım 2026) · hava–mevsim mantığı: sıcaklık, hava zinciri, yağmur/kar, yerde kar örtüsü

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v370hava">`: `temp()` = 11,5 + 15·cos(2π(yılın günü−11)/28) + gün farkı (gün numarasından karma, −3…+3) + saat (05:00 −4°, 14:00 +4°, kosinüs) + biyom (`LAND`, ISLE'ye göre). `snowing()` = `raining()` && !`ashStorm()` && T ≤ 0,5 (karken 1°'ye kadar kar kalır). `nextWeather` yeniden yazıldı: zincir (`açık/bulut/yağmur/fırtına/sis`), mevsime göre `P` (bulut→yağış), `ST` (fırtına payı), `DUR` (süreler); sis sabah ×3, zone 1'de ×2. `tickWeather` sarılır: kar örtüsü `C` (kar +0,003/sn, tipi +0,006; T > 0,5'te −T·0,00025/sn, yağmurda ×4, gündüz açıkta ×1,5), tipide `thunderAt ≥ 3`. `drawGround` sarılır: 16×16 karelik parça tuvalleri (`SC`, en çok 24, LRU), örtü %1 değişince yeniden boyanır (karede en çok 2), GPU yolu için `canvas.__v++`; değerler `NF` (Float32, kare başına `vnoise/5`·0,8 + `vnH`·0,2) ve `NS` (Uint8, yarım kare başına + titreşim) önbellekte. Kayıt alanı `hava:{kar}`. `window.__plTemp/__plSnowing/__plTempStr/__plSnowCover`.
- `v369mevsim` içinde: kendi `nextWeather`'ı silindi; `renderClock` ikinci satır `#clockms` (mevsim · sıcaklık; `#clock` `flex-wrap`, `width:max-content`), Kar/Tipi adı `__plSnowing`'e göre; `drawWeather` yağmur→kar değişimi ve kar tanesi çizimi mevsime değil `__plSnowing`'e bağlı.
- Sürüm etiketi `Versiyon 3.70`.

**Geri alma:** `v370hava` bloğunu sil ve `v369mevsim`'i v3.69 commit'indeki haline döndür (ya da `git checkout v3.69'un commit'i -- proje/Hammadde_prototip.html index.html`). Kayıttaki `hava` alanı eski sürümde okunmaz.

**Ölçüm:** `tests/olcum.js` (CPU ×4, ekran kartı açık, ilkbahar 1. gün, kar yok) iki sıralı tur: eski (v3.69) 153,5/154,7 · 170,6/161,0; yeni 158,7/148,3 · 139,6/136,7 ms (kumsal/yürüme) — gürültü içinde. Sayfa içi: `drawGround` 60×36 kare, örtüsüz 0,13–0,22 ms; %36 örtü 0,40 ms; tam örtü 0,44 ms (parça önbelleğinden önce %36 örtüde 0,72 ms idi). Telefonda ölçülmedi ("deneme").

**Kontrol:** chk.js 0 hata (176 script), `?.` 1 / `??` 7. Duman denemesi (sayfa hatası yok): sıcaklık eğrisi (1. gün 14:00 4,5° / 05:00 −3,5°; 11. gün 33,3°; 25. gün −3,3° / −11,3°), 25. gün yağmur → kar, saat "Kar" + "Kış · −7°", 100 sn karda örtü 0,30, 9,2°'lik yağmurda 30 sn'de 1,00 → 0,72; zincir 3000 adım: yazın yağış/fırtına 165/82 kez, ort. 76/68 sn; kışın 655/184 kez, ort. 227/133 sn. Ekran görüntüleri: %30 örtüde öbekler, tam örtüde beyaz zemin; saat masaüstünde ve telefonda (844×390) sığıyor.

## v3.69 (8 Kasım 2026) · mevsimler (28 günlük yıl, iki ada), Mor gece

**Değişen bloklar / yerler (`proje/Hammadde_prototip.html`, `index.html` eşit):**
- Yeni `<script id="v369mevsim">` (dosya sonu): `season()` = ((gün−1) mod 28) / 7; `window.__plSeason/__plSeasonName/__plMorGece`. Sarılanlar: `tickClock` (gece 20:00–06:00 arasında dt × 150 / [150,108,150,210], Mor gecede 240), `tickHunger` (kışın düşüşe +%25), `renderClock` (sona " · Mevsim", kışın Yağmur→Kar, Fırtına→Tipi), `dayBanner` (her 7 günde bir 06:00'da `announce`), `tickGather` + `dropItem` (toplama sırasında `__plEatCat` sınıfına göre: kış Meyveler yok, sonbahar ağaç meyvesi ×2 ve Mantarlar %50 +1, yaz Meyveler %50 +1, ilkbahar Otlar %50 +1), `drawWeather` (kışın yağış sırasında `weather.k` geçici 'bulut' → yağmur çizgisi yok; sonra `fx`: renk, kar/yaprak/çiçek; PERF.lvl ≥ 3'te yalnız kar), `snapshot/restore/startNew` (kayıt alanı `mevsim:{mg}`). `nextWeather` yeniden yazıldı (mevsim ağırlıkları; ipucu metinleri aynı, kışta Kar/Tipi). Mevsim balığı: `FISHT` içindeki her `[ad,ağırlık]` çiftine `_b` (ilk ağırlık) yazılır, mevsim değişince ×2.
- Yerinde: `v330`'daki `window.__plYS`'e `S`, `busy()`, `go()` (Mor gece saldırısı `waitNow`/`sheltered` değilse `start`). `v368alet` Sapan meyvesi: kışın yok, sonbaharda 2.
- Sürüm etiketi `Versiyon 3.69`.

**Geri alma:** `v369mevsim` bloğunu sil; `__plYS` satırındaki `S,busy,go` ve `v368alet`'teki iki mevsim ifadesini geri al. Kayıttaki `mevsim` alanı eski sürümde okunmaz.

**Ölçüm (`tests/olcum.js`, CPU ×4, ekran kartı açık; kare süresi ms, eski = v3.68):** üç sıralı tur: eski 161,3/136,7 · 106,9/107,7 · 155,0/135,9; yeni 161,6/136,9 · 147,2/145,6 · 152,2/141,7 (kumsal/yürüme ortalaması). İki turda eşit, bir turda eskinin sıra dışı hızlı ölçümü; fark ölçüm gürültüsü içinde. Ayrıca sayfa içinde `fx` tek çağrısı 0,011 ms (ilkbahar), 0,079 ms (kar), `renderClock` 0,0005 ms. JS profilinde yeni fonksiyonlar ilk 40'ta yok. (Telefonda ölçülmedi; "deneme" sayılır.)

**Kontrol:** chk.js prototip 0 hata (175 script), index 0 hata; `?.` 1 / `??` 7. `?debug` duman denemesi (sayfa hatası yok): 1/8/15/22. günde saat yazısı ve mevsim, kışta "Kar", gece hızı kış/yaz 2,86/5,56 (oran 1,94 = 210/108), tokluk kış/yaz 1,736/1,389 (×1,25), mevsim balığı ağırlıkları (ilkbahar Alabalık 56, kış Mersin 44), Mor gece tetiği (Kemal'in kampında güvenli yer olduğu için saldırı beklemede, belgedeki gibi). v3.68 duman denemesi yeniden temiz.

