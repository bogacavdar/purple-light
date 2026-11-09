## v4.01 (9 Kasım 2026) · üzerine gelme etiketi: yeni görünüş, dövüşte gizli

**Değişen yerler:** Yeni `v401tip` (stil) ve `v401tipjs` bloğu (dosya sonu). `#hovtip` (v146) yeni görünüşte. `data-k` (red/amber/green) yazıdan çıkarılıyor; kenara taşarsa `flipx`/`flipy`. `attack` sarılıp son vuruş zamanı tutuluyor. `body.plfight` 120 ms'de bir hesaplanıyor: vuruştan sonra 3 sn, `inFight()`, `underAttack()` ya da 260 px içinde kızgın/kovalayan canlı. `body.plfight` iken etiket `display:none`. B1 (DATA) parçaları `[['campup'],['c','cook',1,…]]`, sözü, sahnesi ve `LES.camp` 3. adımı değişti; yeni parça `campup` (yanan kamp ateşi ya da kabulden sonra kurulan ateş, sayaç `campset` 7407), `cook` sayacı `finishOne`'da (ateşte her pişen). `partTarget` `c/cook` en yakın yanan ateşi gösterir. El yapımı satırında `data-hrow=""${…}"` yazım hatası (v3.35'ten beri Takip et boş adla çağrılıyordu) düzeltildi. Takip şeridi: `v401trk`/`v401trkjs` (dosya sonu) simgeli satırlar, `title`lar kaldırılıp kendi kartımız (`#b3tip`) tarif etiketinde de açılıyor. `ePick` ve E/F ağaç önceliği: havadaki düşenler (`age>=0`) iniş noktasına göre alınıyor. Sürüm etiketi `Versiyon 4.01`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. Eski B1 kaydıyla (b.camp) kart iki satır gösteriyor; ateş + bir pişirme → Börü'de tamamlanıyor. Geyiğin üstünde turuncu şeritli kart çıkıyor; `attack()` sonrası gizli, 3,5 sn sonra yeniden açık.

## v4.00 (9 Kasım 2026) · yetenek ağacı pencereye sığıyor

**Değişen yerler:** `v399rz` stilinde `cm-skills` için `#cbody` sütun flex, `.sktree` `flex:1` (sabit `--th` yüksekliği yerine), panel yüksekliği `--plMaxH`. `skTip` (satır ~3381) zoom'u (1,2) hesaba katıyor ve kartı ağacın `#cbody` içinde görünen kısmına sığdırıyor. `sqZone` daire yarıçapı 22 → 29 kare; `collect`/`use` adımlarında (gizli olmayan) sıradaki noktayı, `back` adımında görev vereni de veriyor (EK1 `ekin1`). EK1'in son adımı (`back`): `talkEkin` ve `statusDlg`, yan görev motoru `back` adımındaysa (`__plSide.backAt`) onun `talk`'ını çağırıyor (önceden Ekin'in ana görev konuşması araya girip adım hiç bitmiyordu). Sürüm etiketi `Versiyon 4.00`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. EK1 `back` adımında F → Ekin korkuluğu alıyor, EK1 tamamlanıyor (+90 Vio). 1600×900 ve 1366×700'de en alttaki yeteneğin kartı gövdenin içinde (önceden 1600×900'de ağaç gövdeden 119 px taşıyordu).

## v3.99 (9 Kasım 2026) · Pamuk'un sarı dairesi

**Değişen yerler:** Yan görev motorunda `sqZone(id)` (~16748, `__plSide.zone`). Kovalamada, Pamuk'un durduğu ya da kaçtığı yerden 0,25–0,85 yarıçap uzağa kaydırılmış 22 karelik bir daire döner (`A.zc`, Pamuk 2 kareden çok yer değişince yenilenir). Götürmede Davut'un yerini verir. Ana görev `partTarget` artık `'sq'` parçasını tanıyor; `target2` anahtarına daire sayacı (`z.k`) eklendi. Pencereler: `v399rz`/`v399rzjs` (dosya sonu) — `#craft` içinde 5 tutamaç (`.rzh` l/r/b/bl/br, yalnızca `hover:hover`+`pointer:fine`, `v50m` değil), `#cpanel`'e satır içi `width/height !important` (zoom'a bölünerek), mod başına (`cm-*`) boyut bellekte; el yapımı genişliği 620 ve sağ boşluk 18 px. Sürüm etiketi `Versiyon 3.99`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. El yapımı: Yap'ın kenara uzaklığı 20 → 40 px; sağ kenar +80 → genişlik 744 → 904, alt +60 → 11 → 13 satır, yazı 14 px sabit, kapatıp açınca boyut kalıyor. CB1 etkin kayıtta kart "Pamuk: Çayır · haritada sarı bölge" yazıyor, büyük haritada daire görünüyor, Pamuk merkezden 0,66 R uzakta.

## v3.98 (9 Kasım 2026) · tanışılmamış görev verenler haritada

**Değişen yerler:** `__plQMk` (satır ~15310) artık yalnızca kuzenleri (`BYG`) değil, sonradan eklenen `__plGIVER` anahtarlarını da (`k_davut`, `k_ekin`) tanıyor. Davut (~21305) ve Ekin (~21513) harita sarmalları `met` yerine `met || __plQMk(k)==='!'` ile çiziyor. Tanışılmamış kişide mevcut v2.09 çizimi (yalnızca parlayan !) çalışıyor. Sürüm etiketi `Versiyon 3.98`.

**Geri alma:** `git revert` bu commit.

**Kontrol:** chk.js 0 hata. E1–E5 bitmiş, 2. seviye kayıtta CB1 açık. Davut tanışılmamışken büyük haritada sisin içinde parlayan ! görünüyor.

## v3.97 (9 Kasım 2026) · üşüme, buzlanma, kar yalnızca kışın

**Değişen yerler:** `v370hava` `snowing()` artık `season()!==3` iken yanlış döner (kar yalnızca kışın). Yeni blok `v397soguk` (dosyanın sonunda): üşüme 0–100 (`tickHunger` sarmalında, yalnızca `hold` yokken), ısı kaynakları `camps`/`FIRES`/Kemal'in ateşi/ocak/kazan 64 px, ev `roomSafe()`, meşale `torchHeld()`; can kaybı üşüme > 75; `#frost` (z 2) dört köşe tuvali bir kez çizilir, büyüme yalnızca `transform`+`opacity` (250 ms'de bir, değişince). Kayıtta `usume` alanı. Hata ayıklama: `__plCold()`, `__plColdSet(v)`. Sürüm etiketi `Versiyon 3.97`.

**Geri alma:** `git revert` bu commit (kayıtlardaki `usume` alanı eski sürümde okunmaz, zararsız).

**Kontrol:** chk.js 0 hata. 25. günde −11°'de üşüme artıyor, Kemal'in ateşinde azalıyor, 95'te can düşüyor. 3. günde (ilkbahar) yağış kar değil. Buzlanma 20/55/95'te ekran görüntüsüyle bakıldı.

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

