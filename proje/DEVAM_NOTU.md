## v3.96 (9 Kasım 2026) · yeni çizimler parlama sarmalının içinde

**Değişen yerler:** `v395cayir` artık `drawNode`'u sarmıyor (en dışta durup öğretici/görev parlamasını, `gl()`, atlıyordu); çizimleri `window.__plCayirL`'e koyuyor, ana `drawNode` (satır ~4266) en başta onu okur. Yaprak'ın ×0,7 küçültme sarmalı yeni yaprakta atlanır. Pazar: `v394pazar` stilinin `box-shadow:none!important`'ı `.pulse`'u eziyordu; aynı blokta `ul.mkt li button.pulse` / `.ctools button.pulse` kuralı eklendi. Satış satırında `.sq1` (Sat) ve `[data-sell=all]` (Hepsi) düğmeleri tutarsız (satır ~3155, adet değişince ~3436). `v189` bloğundaki yumruk dersi tıklama yakalayıcısı (`tz===11&&ftut===2`) artık `__plDL.done||__plDL.tree` iken (ders bitti, ağaç adımı) devre dışı. Sürüm etiketi `Versiyon 3.96`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Zümrüt'ün meşale dersinde (tz 4) yaprak ve dal mavi parlıyor. Konsol hatası yok.

## v3.95 (9 Kasım 2026) · Çayır yer toplanabilirleri yeni görünüş; Yabani havuç → Havuç

**Değişen yerler:** yeni blok `v395cayir` (dosyanın sonu): `drawNode` sarmalı, `L[ad]` olan düğümleri (mağara/maden düğümü değilse) kendi sprite'ıyla çizer: Dal, Yaprak (Boğaç'ın gönderdiği yaprak + kahverengi sap, `LEAF`), Kum, Ebegümeci, Hardal otu, Nane (`__p1.spr` yeşilleri ×0,8), Yaban çileği, Havuç (yarısı gömülü), Yarasa gübresi; çizim oyunun yoluyla (`__p1k` kit, `lightCanvas`, `outlineCanvas`, önbellek, `drawSprite`). Seçim araçları: `/home/claude/spr` (cap.js, comp.py). Ad: kaynakta "Yabani havuç" → "Havuç" (RES, bitki listeleri, tarifler, E6 görevi metni ve isteği, `P1W`), fiyat tablosundaki `"Yabani havuç":2` silindi (Havuç 10), `P1I['Yabani havuç']` → `P1I['__eski yabani havuç']` (Havuç'un kendi resmi kalır); `v373sade` `REPL`'e Yabani/Kızarmış/Kurutulmuş yabani havuç → Havuç karşılıkları (eski kayıt). Belge: 20_sistemler, 30_act1, 80_tarifler, 90_esyalar. Sürüm etiketi `Versiyon 3.95`.

**Geri alma:** `git revert` bu commit (eski kayıtlarda Havuç'a dönen yabani havuçlar geri dönmez).

**Kontrol:** chk.js 0 hata. Eşya denetimi: 1336 eşya (−1) / 997 tarif, bilinmeyen 0, fiyatsız 0, kullanılmayan ham 68. Çayır'da 35 Havuç düğümü. Eski kayıt (Yabani havuç 4, Kızarmış yabani havuç 1) → Havuç 4, Kızarmış havuç 1. Oyun içi ekran görüntüsünde seçilen dokuz çizim. Konsol hatası yok.

## v3.94 (9 Kasım 2026) · öğretici kartında konuşanın resmi

**Değişen yerler:** `tzCard` 9. adım başlığı "Zümrüt · Pazarcı Nazlı'ya git", 13. adım `['alp','Börü · Demirci Dursun'a git',…]`; `renderTz` boş konuşanı adımdan tamamlar (10 market, 11–13 alp); `v64` bloğunda `tutPor.market/alp/smith` (`porFor`). Yeni `<style id="v394pazar">` + `v394pazarjs`: bütün pencerelerde `.ccoins` ve `#closecraft` 32 px, `.esc` gizli (title "Kapat (Esc)"); `#craft.cm-sell` en çok 600 px, boyu `--plMaxH`; araç satırı 3 sütun ızgara, satırlar `display:flex` tek satır, `.note` gizli, Sat/Satın al iki parçalı anahtar, bütün düğmeler tek stil; JS toplu satış düğmelerini kısaltır (title tam açıklama) ve `.kz` ipucunu "N tarif" yapar. Belge: 10_akis.md, 20_sistemler.md. Sürüm etiketi `Versiyon 3.94`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. 8–13. adımlarda kart resmi: Zümrüt, Zümrüt, Nazlı, Börü, Börü. Konsol hatası yok.

## v3.93 (9 Kasım 2026) · ders malzemesi yalnızca eksik kadar; "Vio" büyük harf

**Değişen yerler:** `tzPlace` (satır ~7130 ve `v3.7x` bloğundaki üzerine yazan sürümü, ~22492) artık `tzMiss(ad,toplam,cx,cy)` = toplam − envanter − `tzNear` (yerde, merkezden ya da oyuncudan 200 px içinde) kadar koyar ve koyduğu sayıyı döndürür; `tzList` sayı kelimeleriyle liste kurar. Çağrılar: Zümrüt ilk tarif metni ve tarif öğrenilince (Dal/Lif/Yaprak 2), `stonesNow` (Taş 4), `tzAlpDone` (Sopa yoksa Dal 3, Lif (2−İp)×4, Taş 2+(eksik keskin taş)×2; Börü'nün 6 taşı önce verilir). Metinler bırakılan sayıyı söyler. Para: oyun dosyası ve `parts/*.md`'de "vio" → "Vio", ekler ’ ile (Vio’yu…); düzenli ifadeler `/Vio/i`, `/^100 Vio/`. Yeni `<style id="v393hand">` + `<script id="v393handjs">`: yapılamayan satırın `.bn{opacity}` katmanı malzeme kutusunu saydam yapıp alttaki satırın altına itiyordu → soluklaştırma yalnızca resim/ad/"sende"ye, açık satır `z-index:7`; düğme sırası CSS `order` ile Takip et · ×5 · Hepsi · Yap (Yak); bilgisayarda (hover) satır kutusu gizli, `#hcard` sabit kart Yap düğmesinin üstünde (yer yoksa altında). Yeni `v393lock` (+ `v393lock-css`): `tz===12 && mode==="hand"` iken sıradaki parçanın `[data-hand][data-q=1]` düğmesi basılabiliyorsa `body.v393lock` (pencere içi her şey `pointer-events:none`, yalnızca `.p189` ve Kapat), değilse (ya da adım Taş) 0,7 sn sonra `closeCraft()` + `tzNeed()` ile "Önce malzemeleri topla". Sürüm etiketi `Versiyon 3.93`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Deneme: envanterde 3 taş → kazan yanına 1 taş kondu; Dal 2/Lif 1 + yakında Dal 3, Lif 5, Yaprak 3 → hiçbir şey konmuyor. Konsol hatası yok.

## v3.92 (9 Kasım 2026) · para birimi sikke → vio, mor para resmi

**Değişen yerler:** oyun dosyasında ve `parts/*.md`'de bütün "sikke" çekimleri sözlükle çevrildi (sikke→vio, sikken→vion, sikkelik→violuk, sikkeler→violar, sikkeye→vioya, sikkeyi→vioyu, sikkesi→viosu, sikkenin→vionun, sikkeni→vionu, sikkeyle→vioyla…; büyük harf korunur), yorumlar ve `/vio/i` (∞ para), `/^100 vio/` (Koşu görevi) düzenli ifadeleri dahil; kayıtlarda "sikke" adlı alan yok (`coins` sayı), çevrim gerekmez. Yeni `<style id="v392vio">`: `#coinbox i`, `.ccoins i`, `#coins i`, `.gcoin` mor para; para kutusu ve sayaç mor. GUNCELLEME_NOTLARI'nın eski sürüm notları olduğu gibi kaldı (geçmiş). Sürüm etiketi `Versiyon 3.92`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata; oyun dosyasında ve belgede "sikke" 0. Ekran: sol altta mor para + "0 vio", pencere sayacı mor. Konsol hatası yok.

## v3.91 (9 Kasım 2026) · sol üst: gün, dijital saat, hava simgesi, mevsim çemberi; öğretici kartı yarı alan; takip şeridi geniş

**Değişen yerler:** yeni blok `v391hud`: `body.v391` (yalnızca bilgisayar; `v50m`'de `.hd` gizli) `#clock` kutusuz, `#clockic/#clockv/#clockms` gizli, yeni çocuklar `#hdday`, `#hdtime` (dijital, `.hdpop` gündüz/gece süresi, `NIGHT=[150,108,150,210]`, Mor gece 240), `#hdwx` (simge + ad + `__plTempStr`), `#hdsea` (SVG dört yay + ok, açı = yılın 28 günündeki yeri, gün 06:00'da başlar). `renderClock` sarmalı + 1 sn'lik `upd()` (anahtar değişince DOM). CSS: `#tut{transform:scale(.7071);transform-origin:top right}` (bilgisayar), `#b3trk .b3lab` 16em / `.b3cell` 15em / 12 px. Belge: 20_sistemler.md, 10_akis.md. Sürüm etiketi `Versiyon 3.91`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. 1920×1080: satır 255 px'e sığıyor (#left genişliği), şerit 458 px ve adlar kısalmadan; kart 540×283 → 382×200 (alan %50). 10. gün 21:00 (Yaz): saat mavi, ipucu "Gece 20:00–06:00 · 1,8 dk". Konsol hatası yok.

## v3.90 (9 Kasım 2026) · eldeki eşya figürde, sürükleyip eline al/giy, özellikler gruplu + kritik

**Değişen yerler:** `v387env`: `handThing()` (elde tutulan, meşale hariç; `window.__plHandThing`), `figHTML` Silah yuvasında elindekini gösterir (`.inh`), `drawChar` eldekini çibiden sonra çizer. Yeni blok `v390el`: `holdIt(n)` (yuvada değilse `beltAuto`, dolu ise `pickFor` → `.pfpick` "hangisinin yerine?" `[data-pfrep]`), `invAct('hold')` sarmalı aynı soruyu sorar; `#cpanel` yakalayan tıklaması (v92'den önce) Silah yuvasında: seçili alet → eline al, elindeki → bırak (`setHand(-1)`); `pointerup` yakalayan dinleyicisi aleti Silah yuvasına bırakınca eline alır; giysi/silah için yeni fare sürüklemesi (`wd`) figür yuvasına giydirir. Karakter tablosu (satır ~3177): `ROWS` gruplu (Ekonomi · Savaş · Dayanıklılık, `tr.spgh`), Savaş'ta `__plCrit.pct()` ile kritik satırı (`tr.spcr`, puansız). Belge: 20_sistemler.md. Sürüm etiketi `Versiyon 3.90`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Deneme: Taş balta Silah yuvasına sürüklendi → 1. yuvaya girdi, elde; 5 yuva doluyken Olta + Silah yuvası → soru çıktı, 3. yuva seçildi → Olta elde, Çakmaktaşı balta envanterde; yuvaya tekrar tıklama → el boş; Kürk eldiven Eller'e sürüklendi → giyildi. 12. seviye + Demir kılıç: kritik %4,2. Karakter canvas'ında eldeki alet çiziliyor. Konsol hatası yok.

## v3.89 (9 Kasım 2026) · yanıp sönmeler mavi, Kerevit → Kerevit eti

**Değişen yerler:** yeni `<style id="v388mavi">` (dosyanın sonu): `.pulse`, `#coinbox.focus`, `.smc.qz`, `#achov li.new`, `.rb.mk::after`, `.ib.b3unl` (yeni `v388u`), `.b5k button.wait`, `.pfs.fit`/`.ieqb.fit`, `.v387want`, `.spcallin`, `.spplus.spwant`, `#spchip`, `#spcard` mavi (#7fd0ff, `p3tab`; pencere içinde `p332g`). Eşya adı `Kerevit` → `Kerevit eti`: `db` JSON (6 tarif girdisi + fiyat 4), `ANIM.Kerevit.drops` (Reis de buradan alır), `V46RAW`/`V46FOOD`, balık tablosu, `P1I['Kerevit eti']` (+ Közlenmiş kerevit), `a2` görev sayacı `trap:Kerevit eti`, pişmiş balık resimleri `RAW.kerevit`. Canlının adı `Kerevit` kaldı. Yeni blok `v388kerevit`: `restore` sarmalı eski kayıtta `Kerevit` eşyasını (inv, order/seen/found, [ad,adet], {n,q}, `trap:` sayacı) `Kerevit eti`ye çevirir; `kl`/`f`/`bc`/`bd` (canlı tabloları) dokunulmaz. Belge: 00_giris, 10_akis, 20_sistemler, 30_act1, 70_canavarlar, 80_tarifler, 90_esyalar. Sürüm etiketi `Versiyon 3.89`.

**Geri alma:** `git revert` bu commit (eski kayıt çevrimi `Kerevit eti`yi geri çevirmez; geri alınırsa `REPL` ile `Kerevit eti`→`Kerevit` eklenmeli).

**Kontrol:** chk.js 0 hata. Eşya denetimi: 1337 eşya / 997 tarif, bilinmeyen girdi 0, fiyatsız 0, kullanılmayan ham madde 69 → 69. Kendi adında düşme: 0. Eski kayıt (inv Kerevit 4, kl Kerevit 3) → Kerevit eti 4, kl aynı. Ekran görüntüsü: envanterde alttaki yuva, Özellikler düğmesi, seviye puanı düğmesi mavi. Konsol hatası yok.

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

