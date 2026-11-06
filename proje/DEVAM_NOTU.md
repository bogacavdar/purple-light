## v3.44 (6 Kasım 2026) · biyomlar alanca %50 büyük (790×568), eski kayıtlar silinir, görevde yalnızca ! + parlama, belge yeniden sınıflandırıldı

- **Düzeltme (Boğaç):** v3.40'taki "her biyomu %50 büyüt" kenar ×1,5 diye uygulanmıştı (968×696, alan ×2,25). Doğrusu alan ×1,5. `proje/tools/harita/ada_uret.py`: `GROW = 1.5 ** .5` (≈1,2247) → ızgara 790×568, deniz payı `round(10*GROW)` = 12, üç göl yarıçapı ×GROW, Bataklık gölcükleri `round(20*GROW*GROW)` = 30 (aralık `14*GROW`). Üretici yeniden çalıştırıldı (`adalar.js` 48.072 bayt, `ada1.png`/`ada2.png`); `adalar.js`'in içeriği prototipte `<script id="v235-map">` bloğundaki tek satıra (1712) aynen gömüldü.
- Sonuç: ada 1 kara 312.690 → **208.524** (biyom başına 6 × 34.754), ada 2 kara 402.003 → **268.138** (biyomlar 44.680–44.700). Komşuluk zinciri 0-1-2-3-4-5 aynı, gölcük 30/30, doğuş puanı 10/11 (iki ada). Ada 1 köprüler [134,433–437], [75,410–413], [199,449–453], geçit [345,611–614], doğuş [74,253]; ada 2 köprüler [202,230–237], [158,174–181], [290,336–340], geçit [229,609–614], doğuş [86,496].
- Ana kod: `AREA_K=W*H/(645*464)` değişmedi, kendiliğinden 1,4993 (≈1,5). Mini harita penceresi `min(W,645)*.3` aynı (W=790 > 645). `MAPV` 5 → **6**: eski kayıtlar açılışta silinir (Boğaç seçti).
- Ada 1 yeni oyun (eski 968×696 → yeni): ağaç 9.450 → **6.570**, düğüm 16.873 → **11.306**, maden 838 → **555** (3.39'a göre ≈×1,5).
- **Ölçüm** (`olcum.js` /tmp kopyaları, CPU×4, gl açık, masaüstü 1280×720, iki tur): BOOT 22.523 / 21.136 → 18.176 / 17.940 ms (js 14.586 / 13.817 → 10.840 / 11.047); kumsal kare avg 177,4 / 190,6 → 197,3 / 189,7 (p95 213 / 251 → 324 / 227); yürürken 185,2 / 169,3 → 157,4 / 193,7 (p95 250 / 235 → 223 / 252); PLAY 10 sn js 4.169 / 4.013 → 4.132 / 4.136 ms; PERF.lvl 2–3 her ikisinde. `olcum_cizim.js`: drawImage 624 → 658, fillRect 659 → 705, görünür ağaç 8 → 26, düğüm 61 → 50, shore 6.110 → 4.853, GL 3 sn dr 398 → 484 (iniş yerinin çevresi değiştiği için görünür nesneler farklı). Kare maliyeti aynı aralıkta (gürültü içinde), açılış ~3,5 sn kısa.
- **Tasarım belgesi yeniden sınıflandırıldı (bu pakette):** başta Belge haritası, tekrarlar tekilleştirildi, atıflar güncellendi. Önce 16 üst bölüm ve `99z_arsiv.md` (Arşiv: eski görev tabloları) olarak sınıflandırıldı; sonra "eski kural tutulmaz" kuralıyla (CLAUDE.md) Arşiv silindi, belge şu an 15 üst bölüm. Yeni kurallar (Giriş, CLAUDE.md): büyüklük yüzdesi alan içindir; türeyen sayılar birlikte değişir; eski kural tutulmaz. Ada/biyom sayıları (00_giris, 05_teknoloji, 30_act1, 50_act2_giris) v3.44'e göre.
- **Görev işaretleri (Boğaç: "görev sistemi parlama üzerine; ? yok, ! yazmalı"):** ana görevin tek işareti siyah "!" + parlama. `drawMap` `mki` (~6266–6272): tanışılmamış görev sahibi (`__plQUnmet`) "?" yerine parlayan "!" (MAPHITS etiketi "!"); büyük haritada `qm0` yalnızca "!" (yeşil `143,212,107` teslim ışığı silindi); simgenin üstündeki rozet her zaman sarı zemin + siyah "!" (mavi `#7fc8ff`/sarı `?` ve "?" piksel dalı silindi); ekin dalındaki `qState==='ready'?'?'` silindi (iki yer). Eski görev sistemi (`qMarkOf`, ~10210): `ready(g)` → "?" dalı silindi; dünyadaki işaret (`v55Ents`, ~10214) koyu kutu + mavi/sarı yerine v186 `drawTag`/`drawMark` gibi sarı kutu, siyah "!" ve parıltı. Kemal'in eski işareti (`drawNpc`, ~7200) "?" dalı silindi. Gemici Poyraz (`v234` `__plMapQ` sarması, ~17347): haritada "?" → "!"; bildirim "Haritada parlayan ! ile işaretlendi." (belge `38_nuri_deniz.md` aynı cümle). Değişmeyenler: yan görevlerin sisli mor "?"si (`mapSQ`), mağara haritasındaki yan görev kişisi işareti, ara sahne duygu simgeleri, keşfedilmemiş yerdeki dekoratif siyah "?"ler (`QM`, görev işareti değil).
- `DEVAM_NOTU.md` ve `GUNCELLEME_NOTLARI.md` yalnızca v3.25–v3.44 (CLAUDE.md "son 20 sürüm"); eski sürüm bölümleri ve CLAUDE.md'de zaten olan eski kural kopyaları silindi; DEVAM_NOTU sürüm sırasına dizildi (v3.36 yerine).
- **Geri almak için:** harita: `MAPV` 6 → 5, `<script id="v235-map">` satırı (1712) git HEAD'deki `adalar.js` ile, `ada_uret.py` `GROW = 1.5` (+ `adalar.js`/png yeniden üret) ve `AREA_K` yorumu; işaretler: yukarıdaki `mki`, `qMarkOf`/`v55Ents`, `drawNpc` Kemal işareti, `v234` Poyraz `__plMapQ` ve `crash()` bildirimi (git `v3.43` hali).
- Kontrol: chk.js prototip ve index.html errors 0, `?.` 1 / `??` 7 (artmadı).

## v3.43 (6 Kasım 2026) · Çiftçi Ekin, Barbaros olayı, Bereket Adası, tarla geri geldi

- `v343ciftlik` bloğu: ada `IS` (açık denizde 58×46'lık tamamen okyanus kutusu, Barbaros'a en yakını; elips RX 20, RY 14, kenarı kum): yüklemede `tiles/BIO/ZONE/reach/MUD/tvar/shoreM` yazılır, çevresindeki deniz sığ olur, `mapBase` boyanır. `onIs()`; ada `roomSafe` (gece ve mor ışık güvenli), ada üstündeki hayvanlar silinir. Yerler: ev (`houseSprite('Kerpiç ev')`), ambar, kuyu (Su), iskele, korkuluk (EK4), 6 fidan yeri (3 günde `trees`'e gerçek meyve ağacı; kayıtta yeniden eklenir), tavuklar.
- Ekin: `k_ekin` giver (`sqk:'ekin1'`), durum `EK.st` cayir → gone (EK1 bitince ikinci konuşma) → atB (L4 + EK1, Barbaros'a 110 px) → home. Kayık `BOAT()` Barbaros'un yanında; geçiş kendi karartması (`#v343fade`). Dükkân: tohum 4'lü paket, EK4'ten sonra fidanlar. Ödüller `EK.got` ile bir kez (EK2 tohum, EK3 tohumlar, EK4 Elma fidanı, EK6 tarla 24 tarh).
- Eski tarla kodu (`plots`, `farmAct`, `tickFarm`, `drawField`, `CROP`) adaya taşındı (`layField`: 12 tarh, EK6'dan sonra 24). `v268` sadeleşti: `settle` (tarla eşyalarını silen) ve `NOFARM` kaldırıldı; yalnızca eski çiftçi yeri ve Nazlı'nın öğrenilen tarifleri satması kaldı.
- `v186`: `GB.k_ekin`, EK1–EK8 (eski H kimlikleri v2.68 dönüştürmesine takılmasın diye), `L5.r` + `['ekin']`, `reqOK` 'ekin', `prog` 'fidan'/'ekin', `mkFiller` 'ekin' (Kemal yönlendirir), `partTarget` 'ekin'.
- `v230`: `ekin1` (main, saman izi `straw`, korkuluk+kirpi `scare` çizimleri).
- İkonlar: kendi `icon()` katmanı, yalnızca kendi 20 adı için önbellek silinir.
- Kontrol: chk 0 hata; `/home/claude/scripts/farm_t.js` (EK1 motorla, gidiş, Barbaros sahnesi → home, kayık, adada güvenli, tarh bulunuyor, EK2/EK4 ödülleri).

## v3.42 (6 Kasım 2026) · evcil hayvanlar, Çoban Davut ana görev (CB1–CB8), Gece öten kuş

- `v342pet` bloğu: `SP` (6 tür; `m` binek, `pup` yavru yolu), `PT` (pets, tr güven, trT bekleme, ever, den yeniden doğma, dead taş, no, mom), `FD` yere bırakılan yiyecek (`f.a` hedefe bağlı; yürürken iç `tickAnimals`'ın kaçırmasını önlemek için konumu sabitlenir), `PUP` (gündüz inin çevresinde, gece içeride, gece yaklaşınca anne bir kez saldırır). `canTame`: ağıl var + Davut'un o tür görevi sürüyor ya da bitti. Binek: `STAT.move` çarpanı, `wantsRun` kapalı, `hurt` bineğe gider, `interact`/`attack` indirir, `drawPlayer` bineği 1,6 kat çizip karakteri 14 px yukarı koyar; B tuşu, dokunmatikte `#v342ride`. Savaşçı: `enemyFor` (oyuncuya 170 px içinde `mad`/`chase`), 0,7×hasar yer, ölüm → `PT.dead`, `PT.den[sp]=+3 gün`. Ağıl: `PSPR['Ağıl']` çizimi, `useplaced` → `#v342pen` penceresi (dışına basmak kapatır). İsim: `#v342nm` (dışı/Enter/Esc = Tamam). Kayıt `v342={pt,dm}`.
- Davut: `window.__plGIVER.k_davut` (`k_` öneki `gidOfTg` için), `sqk:'husnu'` (v230 portresi). Yeri: CB3'e kadar `BY.husnu` (Çayır), sonra her CB ile bir biyom ileri (`spotIn`, deterministik, çevresindeki ağaç/düğüm temizlenir). Pamuk Davut'un yanında (`__plDrawGoat`).
- `v186`: DATA'ya `GB.k_davut=0` ve CB1–CB8; yeni adım türleri `sq` (v230'un bitirdiği yan görev) ve `tame`; `pickFiller` başında ağıl ayak işi (önce tarif).
- `v230`: `husnu` artık `main:1` (ödül 0, kart/liste/harita/sayaçta yok, `present` false); CB1 sürerken `petTick` husnu'yu başlatır ve takip ettirir. Yeni `toprak` (21:00–01:00, GATE Çayır 2.), `quail` çizimi/sesi.
- Kontrol: chk 0 hata; `/home/claude/scripts/pet_t.js` (at: 4 beslemede evcil, CB3 ✓, binince hız ×1,8, hasar bineğe), `pet_t2.js` (kurt yavrusu, dövüş, ölüm → taş ve 3 gün), `cb1_t.js`, `sq_t5.js` (toprak ok).

## v3.41 (6 Kasım 2026) · seviye puanları, en üst seviye 60, Güç/Zırh/Mana özellik oldu

- Ana kod (~1812): `effL` ve seviye tabanlı `STAT` silindi; `PTL`, `ptsAt`, `SPK` (11 özellik), `RMAX=18`, `capAt(L)=min(18,1+⌊L/3⌋)` (bir özelliğin tavanı), `SPS` [0 puan, puan başına], `SPT` (verilen puanlar), `SPTUT` (ilk seviye dersi), `RK(k)`, `spFree()`, `sv(k,r)`. `STAT.x(r)`'nin argümanı artık **puan** (yoksa şimdiki puan); `maxHP(r)`, `maxSt(r)`, `hpRegen(r)`, `stRegen(r)` de öyle. `MAXLV=60`; 198 = 11 × 18. `PTL`: Sv ≤10: 2, ≤30: 3, sonra 4 (Boğaç: tek özelliğe yığmak dengeyi bozmasın, gelişim geç kalmasın; eşit dağıtımda Sv 16'ya kadar eski hızla aynı).
- Hasar: dokuz yerde `(1+.03*(lvl-1))` → `STAT.dmg()`. Mana: `maxMana` ve arena yedek değeri → `STAT.mana()`. `zirhOf`: `lvl-1` → `STAT.zirh()` (0 puanda 5). v60'ın `cap` satırı (hareket/toplama/şans tavanı) silindi. Kritik ihtimalinin seviye payı (`chanceFor`) seviyeye bağlı kaldı.
- Arena: `window.__plArOn` (AR tanımından önce); arenada `RK` seçilen seviyenin puanlarını eşit dağıtır. Seviye düğmelerine 65 eklendi.
- Karakter penceresi (`renderCraft` mode 'char') yeni tablo: puan çubuğu, +1 puanla değeri, `data-spk` + düğmesi, `.sptip` açıklama (dokunmatikte `.spds` adın altında), "Verilmemiş seviye puanı".
- `v340sp` bloğu: CSS, `#spbadge` (Karakter düğmesinde sayı, ders sürerken `pulse`), `gainXP` sarması (ilk puan dersi / "+N seviye puanı"), + tıklaması (can/enerji artışı anında eklenir), kayıt `v340={sp,t}`; eski kayıtta puanlar boş, ders açık.
- Kontrol: chk.js 0 hata; `/home/claude/scripts/sp_t.js`: Sv 2'de 2 puan, rozet + ders, + ile can 124, Sv 32'de 85 boş puan, kaydet/yükle aynı.

## v3.40 (6 Kasım 2026) · biyomlar %50 büyük (968×696), yan görevler keşifle bulunur, her yan kişinin kendi saati, sıralı açılış

- **Harita:** `ada_uret.py` `GROW=1.5`: ızgara 645×464 → 968×696, deniz payı 10 → 15, göl yarıçapları ×1,5, Bataklık gölcükleri 20 → 45 (aralık 14 → 21). Kara: ada 1 138.742 → 312.690, ada 2 178.431 → 402.003 (×2,25). Biyomlar eşit, komşuluk zinciri aynı, doğuş puanı 10/11. `MAPV` 4 → 5: eski kayıtlar açılışta silinir (Boğaç seçti: "Eski kayıtlar silinsin").
- `AREA_K=W*H/(645*464)` (≈2,25): `place`, `MINES`, `ZPLANT`, `B4PLANT`, `putIn`, maden çevresi buluntuları (44 sınırı) bununla çarpılır. Ağaçlar karo başına olasılıkla zaten ölçekleniyor. Hayvanlar oyuncunun çevresinde doğduğu için değişmedi. Mini harita penceresi (`min(W,645)*.3`) aynı karo ölçeğinde kaldı.
- Sonuç (ada 1, yeni oyun): ağaç 4.165 → 9.450, düğüm 7.542 → 16.876, maden 372 → 838.
- **Ölçüm** (`olcum.js` /tmp kopyaları, CPU×4, gl açık, masaüstü 1280×720): BOOT 16.669 → 20.909 ms (js 9.425 → 13.723); kumsal kare avg 230,3 → 211,5 (p95 312 → 286); yürürken 248,0 → 188,9 (p95 325 → 275); PLAY 10 sn js 4.113 → 4.390 ms; PERF.lvl 2 → 2. `olcum_cizim.js`: drawImage 802 → 624, fillRect 644 → 621, görünür ağaç 19 → 8, düğüm 46 → 61, shore 3.845 → 6.110, GL 3 sn dr 296 → 367. Kare maliyeti aynı, açılış ~%25 uzun. Not: 2.35–2.38'deki 804×785 dönemindeki donma asıl olarak ekran kartı çiziminin kapanmasındandı (v2.40 dersi); yine de telefonda ilk açılış izlenmeli.
- `tests/v48_bugs.js` hem eski hem yeni dosyada "Execution context was destroyed" ile düşüyor (bu sürümden önce de bozuktu).

- `v230`: `targetOf`, kenar oku, `seenT`, `bioSeen` ve haritadaki hedef/sarı bölge/tam yer "?" silindi. `mapSQ` yalnızca ~10 kare (`NEAR=10*T`) yakındaki bekleyen kişi için sisli mor "?" çizer (ortası kişiden ≤48 px kaymış, `fogC`). `__plMapQ` sarmalayıcısı artık ana görevin sarısını hep çizer.
- `met` kümesi: bir kez alınan görevin kişisi (`present`) bitene kadar her saat yerinde (Işıl hariç). Kayıtta `v230.m`; eski `v230.b` okunmaz.
- `GATE`/`ORD`/`opened(q)`: biyom başına sıra; `[bitmiş ana görev sayısı, gereken ana görev]` (`window.__pl186.S.d`). Bir biyomda en çok 2 bitmemiş (alınmış dahil) yan görev açık; 500 ms önbellek. Mağara görevleri sınırsız. Test kancası `__plSide.opened`.
- 36 yan kişinin `win` aralıkları hepsi farklı (belge tabloları).
- Bulunan görev eşyasına mavi halkaya ek 4 kıvılcım (`curPts` çizimi).
- Kontrol: chk.js 0 hata; `/home/claude/scripts/sq_t.js` 24 görev ok; `gate_t.js` sıra/2 sınırı doğru.

## v3.39 (6 Kasım 2026) · 24 yeni yan görev, tam ekran yenilemede kaybolmuyor, takip şeridi kıpırdamıyor ve sıralı, başarım kartı ortada, mağara ve ev görselleri, Marangoz Çınar kaldırıldı (Usta Sinan'da birleşti)
- Belge: Godot planına "Neden Godot, neden Unity değil" bölümü (Unity ileride açık seçenek; Unreal düşünülmüyor).
- Takip şeridi: `rows()` takip satırlarını `items.length`'e göre sıralar (görünüş; `B3.trk` sırası ve en eskinin çıkması aynı). `placeBar()` satır/parça adları + ekran + yan panel anahtarı (`bar._lk`) değişmedikçe eski sol/üst konumu (`bar._pos`) korur.
- Başarım kartı: `v339ach` stili ortada (%42), 176 px, büyüyerek; `card` tıklayınca hemen kapanır (`card._t` zamanlayıcısı), pointerdown/mousedown/touchstart oyuna geçmez.
- Yeni `v339art`: mağara girişleri biyoma göre (`window.__plCaveSpr(C)`, önbellekli kanvas; mağara bloğundaki `drawDoor` onu çizer, ışık ağzın elipsine), 8 evin her biri için `houseSprite` (`H3:` anahtarı; hepsi `HOUSE_ART`'a eklendi, eski 4 evin ve yeni 4 evin önbelleği yalnızca bu adlar için silinir).
- **Usta Sinan + Marangoz Çınar birleşti (Boğaç):** `carp` nesnesi, çizimi (`drawCarp`), konuşması (`talkCarp`), hedefi, çarpışması, ateşi, harita işareti, ses tablosu, hikâyesi (Defne) ve bütün listelerdeki yeri silindi. `openCarp`/`renderCarp` (ev listesi; mod adı hâlâ `carp`) Sinan'dan açılır (`talkUsta`'ya "Ev ve barınak siparişi"; R2 kısayolu `talkUsta` sarmalayıcısında). DATA: R1,R3,R6,R7,R8,K4,K5,K7 silindi; R2,K1,K2,K3,R4,R5,K6,K8 `g:'usta'` ve zincir R2(bio1)→K1→K2→K3→R4→R5(lv4)→K6(lv8)→K8(lv12); `chop` dersi D1'e; N1/B1 R1 yerine D1'den, DR3 K4 yerine K3'ten açılır; `GB.carp` silindi. Eski kayıtlar: `QI`'de olmayan görev kayıttan düşer. Eski görev sisteminin (v1) carp1/c2/c3 tanımları `g:'usta'` oldu. Usta Sinan zaten Orman'daydı (ANC usta = 299,99, biyom 1).
- **24 yeni yan görev (`v230`):** `sq_new` tanımları (Q.push; LK, KID). Yeni: `pp` nokta tablosu (`[r0,r1]`, `[r0,r1,'kaynak']`, `['rel',dx,dy]`, `['near','usta'|'hut',r0,r1]`), `fix` izleri (`[tür,dx,dy,'always'|'done'|'notdone']` ya da `[tür,'@nokta',dx,dy,ne zaman]`), `homeDone`, `goatDone`/`anim:'mule'` (`drawMule`), yeni adım `use` (her nokta `s.need`'den 1 harcar), `go`'da `tool:'pick'` (`ownsKind`), `hide`'da `snd:'chime'|'croak'` (`chime`, `croak`), `guard`'da `stay`/`endTx`. BOXB/SLOT/bc 6 biyoma, SLOT 6 yer; yer biyom dışına düşerse öbür yerler denenir. MOB 4–5 (Kül kurdu/Lav kertenkelesi, Gölge kurdu/Kristal örümcek); `wave` biyom 0–5; `goatDest` görevin biyomunda. Fenerci bitince üç fener `FIRES`'a eklenir (güvenli ışık; yüklemede de). Yeni `drawObj` türleri: swarm, hives, kite, mill/millB, mush, rack, easel, frog, pot2, bell, chime, egg/egg2, nest, letter, mailbox, burn, sapling, hammer, anvil, pet, altar, crystal, mirror, golem/golemOff, lanterns, pup, drop. Deneme: 24 görevin hepsi motorun kendi adımlarıyla baştan sona tamamlandı, kişiler kendi biyomunda. Toplam yan görev 42.
- `v88` tam ekran bloğu: `sync()` tam ekrandan çıkışı F5/Ctrl+R/`beforeunload`/`pagehide` sırasında (`leaving`) `hammadde.fs=0` diye kaydetmez; tam ekrana girince `1` yazar. Böylece açılışta ilk tıklama/tuşla (`once`) yeniden tam ekran olur. Alt+Enter, Esc ya da Ayarlar kutusuyla çıkış yine `0`.

## v3.38 (6 Kasım 2026) · sıkı el yapımı listesi, ıslık gibi olmayan canlı sesleri, düzenli takip şeridi
- Yeni `v337hand` (stil) + `v337handjs`: el yapımı satırları tek satır; malzemeler (`.bn>span>br+small`) gizli, bilgisayarda satır üstüne gelince, telefonda ada dokununca (`li.hopen`) satırın altında mutlak konumlu kutuda açılır. Düğmeler küçük (26 px).
- Takip şeridi: `chipHTML` her kutucuğu sabit genişlikte `.b3cell` içine koyar (+ yeri boşsa `::after` ile ayrılır), adlara `title`; `b3lab` içinde `.b3lt`. Yeni `v338trk` stili: satırlar aynı genişlikte (`align-items:stretch`), etiket 9,4em, kutucuk 11,4em, × en sağda; telefonda satırlar yine sarar.
- `v336voice` `vox` yeniden yazıldı: perde tavanı 650 Hz (kuş/yırtıcı 1000, 12. parametre), hep sawtooth + jitter, geniş formantlar (Q 1,8/2,4, F1≤1800, F2≤2900), %55 gürültü (nefes) aynı formantlardan, 3 kHz alçak geçiren. `chirp` (sine bip üçlüsü), `squeak` (üçlü kare ciyak), `yelp`, `pig` (kare tiz), `click` (tıkırtı dizisi), `screech` tek nefeslik seslere çevrildi.
- `v336voice`: yeni `rabbit` sesi (boğuk ayak/düşüş + nefesli gürültü ciyağı, saf ton yok); `'Tavşan':'rabbit'`.

## v3.37 (6 Kasım 2026) · leş, 194 eşya resmi, meşale yuvası, tarif kitabı, Boğaç gerçek saatte, kalp atışı, "seni hatırlıyorum", ACT 3 notları
- `v330dev`: Boğaç yalnızca cihazın gerçek saati 02:00–06:00 iken çıkar (`realLate`), konuşmada gerçek saati söyler ("Saat 02:47 olmuş. Kapat oyunu artık.").
- `v330klon`: `window.__plKlon=()=>C` (durum dışarı açıldı).
- Yeni `v337meta`: (1) Mor ışıkta o görünürken 0,9 sn'de bir iki vuruşlu kalp sesi (`audio.synth`), telefonda titreşim (Ayarlar › Titreşim açıksa) ve oyun kolunda `dual-rumble`; kaybolunca/duraklayınca durur. (2) `askName('hero')` sarıldı (yalnızca `wake` sırasında): `localStorage['hammadde.heroSeen']` = [{s:ad|LOOK.hero JSON, c:sayı}] (son 30); aynı görünüş+ad 2. kez → Kemal "daha önce bulmuş muydum", 3.+ → "Yine sen". Kayıt yükleme etkilenmez.
- Yeni `v337les`: (1) `#bkinfo` sticky (tarif kitabı). (2) Leş: `killAnimal` en dışta sarıldı; çağrı sırasında `dropItem` yakalanır (`CAP`) ve leşe konur; `toast` "avlandı; yere düştü" → "avlandı · leşini topla". Leş `XTRA` hedefi; toplama `gathering` + `cb` (süre 0,8+√can/12, en çok 3 sn, /STAT.gather). Süre oyun dakikasıyla (`day*1440+dayT`): 240 dk, son 60 dk yanıp söner. Reis ve KEEP eşyalı leş kalıcı. Ders/Kemal dersi/Yıldızsız/arena: yalnızca görüntü (3 sn). Çizim `drawDrops` sarmalı: `drawAnimal` sahte kopya üstünde, ayak noktasında ±90° döndürülür. Kayıt `v337c` (ada `ISLE` ile).
- Yeni `v337art`: `window.__p1k` (v49-p1'den çizim araçları) ile kendi `icon()` katmanı; 194 eşya (165 + açılışta kutu olarak önbelleğe giren 29 bölge malzemesi/canlı parçası). Pişmiş/Tütsülenmiş/Kurutulmuş/Taşta balıklar çiğ resmin `ICONC`'sinden boyanır (ışık/kenar ikinci kez uygulanmaz, `RAWM`). `drawIcon` yedeği renkli kutu değil nötr bez torba; `?debug` 12 sn sonra yalnızca önbellekteki `ICON[n]===torba` olanları listeler (hiçbir şey silmez; ilk denemede toptan `delete ICON` 43 resmi bozdu, CLAUDE.md'ye ders yazıldı).
- `v283` meşale yuvası bloğu: `invBelt` sarıldı (envanterde `data-tsinv` yuvası, `cbody` yakalayan tıklama), `onTSAt` envanter yuvasını da tanır; `tsLitN`: yanan meşale bitince `tsBest()` ile öbürü yakılır.
- Belge: Sistemler › Boğaç / Mor ışıkta o / Seni hatırlıyorum; ACT 3 › ACT 3 fikir notları (köpek kamerası, kurallar hikâyeden, sahte not, duraklatmayan menü, sahte çökme, kötü son, uzun aradan dönüş). `yayinla.sh` paket çıkınca çalışacak.

## v3.36 (6 Kasım 2026) · kazan listesi, takip +, pazar zinciri, dans çemberi ve şarkı, canlı sesleri
- `v336learned`: kazan listesinde öğrenilenler sona (`open` sıralaması), `hammadde.hideLearned` kutusu; `renderCraft` sarmalı `.rlist/.pside/.tiles` kaydırmasını korur.
- Takip şeridi (B3): `b3plus`/`b3make` (zincir `chainPlan(m,k,b3subOK)`; yalnızca öğrenilmiş el tarifleri).
- `v317spare`: `reqMap(ok)` ara parçaların eksik kadarını kendi malzemelerine açar (6 kat).
- `v334egg`: dans çemberi (`a.dnc`, yarıçap 50×34, `tickAnimals` sırasında yerleri sabit), şarkı (`hum`, kadın Re4 / erkek Re3, iki formant).
- `gatherTarget`: körelmiş balta/kazma ağaç/maden hedeflemez. El yapımı: zincirle yapılacak eksik parça sarı.
- `v336voice`: `window.__plVoice` (v309snd `hurtS`/`dieS` önce bunu dener): 13 ses türü, formantlı.
- Kontrol: chk.js 0 hata; kazan sıralaması, liste kaydırması, takip + denendi.

## v3.35 (5 Kasım 2026) · bütün yemeklere etki, dans, ayna
- `v335food`: `tierOf` (toplanan: v74 `FOODT` → `window.__plFoodT`; et: avın biyomu `__I1B`/`__I2C`; ön ekli pişmiş: çiğinin; tarif: malzemelerin en yükseği; yoksa fiyattan), `kindEffect`, `window.__plFoodFix` (v74 `prof` sonunda çağrılır): etki, süre 60+30·k (+30 pişmiş, ≤420), can. Fiyat ×(1+0,15·k) yüklemede bir kez; `FOODC` temizlenir. Denemede etkisiz yemek kalmadı (0).
- `v334egg`: dans `keys.a/keys.d` kenarlarıyla 6 alternatif basış (≤0,6 sn arayla, 3 sn içinde); başka keydown ya da yürüyüş bitirir; hayvan çekme 60 px/sn. Ayna: toplama, olta, basılı tuş varken sayaç sıfır.
- Kontrol: chk.js 0 hata.

## v3.34 (5 Kasım 2026) · easter egg'ler
- `v334egg`: kazana çöp (`deposit` sarmalı; hiçbir tarifte geçmeyen satılabilir malzeme, 5 farklı → Zümrüt kızar, 3. kez 10 sn görünmezlik: `tickAnimals` sırasında aggro 0, `drawPlayer` %18 opak), Börü'ye 50 yumruk (`attack` sarmalı, `EQUIP["Börü'nün kemeri"]` gövde 26 + kanama %20, `ICON` elle çizildi), her 100. gece yıldızlar (`drawDarkness` sarmalı + oyuncuda 420 px ışık), eski kamp ateşi (ACT 1, Kemal'den ≥120 kare, kayıtta), ayna (10 sn hareketsiz, yüz suya), dans (1,2 sn'de 4 yön dönüşü; 20 sn → zararsız/nötr hayvanlar toplanır), inatçı balıkçı (`startFish` sarmalı, aynı yere 100 atış), Kemal 03:00 (`say` sarmalı), devam satırı (`#v334line`, `hammadde.line`). Kayıt: `v334={j,s,b,bg,f,c}`.
- `v330klon`: artık sevdiğin kişi (mor göz, hale, zerreler, adı); başarım `klon` adı "Mor ışıkta o". `v330ys`: saldırıda öldürme sayılır (`ATK.k`); süre dolup kimse ölmediyse "Konuk". Yeni başarımlar `gorunmez`, `konuk` (localStorage bayrakları).
- Kontrol: chk.js 0 hata; kazana çöp yolu ve kayıt alanı denendi.

## v3.33 (5 Kasım 2026) · üç toplu satış düğmesi
- `v317spare` yeniden yazıldı: `needOf(n,ok)` öğrenilmemiş tariflerin istediği adetleri toplar; `sellsafe` = kazanda şimdi açık (`!found && (hard||isOpen)`), yeni `sellall3` = bütün öğrenilmemişler. Hariç: `bulkSellable`. Deneme: 305 Taş → bütün tariflere yeten 195 Taş kaldı.
- "Yeni tarif öğrendin" yazısının arkasındaki siyah dikdörtgen (yalnızca Chrome masaüstü uygulamasında) bulunamadı; v3.32'deki parıltı kaldırma bir denemedir.

## v3.32 (5 Kasım 2026) · kol nişanı, ders kilidi, sahneler, siyah dikdörtgen
- `v320pad`: sağ çubuk (`RS`) nişan; `aimAt` RS'de yalnızca o yöndeki canlıyı seçer (`pick` maxDf); `C.mx/C.my` RS/sol çubuğa göre; `drawPlayer` RS yönüne bakar (klonda `__plKlonDraw` ile atlanır). Ana menüde hile kodu girilirken (`blockK`) odak ve A/B susar. `firstFocus`: yeni pencere/sekme ilk kullanılabilir öğede.
- `v332lock`: tz 4/7 kazan, tz 5/8 el yapımı yalnızca ders tarifi. `v332glow` (CSS): #craft içinde `.p189` ölçeklenmez.
- `v332cur` (CSS): piksel imleçler (pointer:fine). `v332disc` (CSS): #discover geniş parıltısı kaldırıldı, plmodal'da yalnızca opaklık animasyonu. Siyah dikdörtgen deneme ortamında (yazılım çizimi) oluşmadı; ekran kartı katmanı olarak düşünüldü, Boğaç'ın denemesi bekleniyor.
- v69c: `b5scn` kaldırıldı; sahneler `localStorage hammadde.love` (ana menüde "love"); `window.__plScn`. `v332scn`: Kitap › Anılar'da küçük resimli "Bütün sahneler" (anılar `memScene`'den).
- Doğum günü anısı: masa/pasta küçüldü ve aranıza alındı, sevdiğin kişi masanın sağında.
- Kontrol: chk.js 0 hata.

## v3.31 (5 Kasım 2026) · saldırılar gece ve sabit günlerde
- `v330ys`: günler `seqFrom` (6'dan başlar, aralar 5,7,4,9,6,3,8 tekrar), `free()` 1–3 ve 5/15/20. günleri atlar. 20:00'de başlar; ev/mağara/deniz/güvenli yer → `free(day+1)`; kaçırılırsa (uyku, geç yükleme) sıradaki olaysız gün. Kayıt `v330ys.f=2` (eski kayıtlar `seqFrom(day)`). Saldırıda bölge merkezi ve her Yıldızsız `lightSources`'a eklenir.
- Biyom sınırı bloğu (`a.hb`): `a.ysA` muaf.
- Kontrol: chk.js 0 hata.

## v3.30 (5 Kasım 2026) · mor ışık saldırıları, gizli yol, klon, Boğaç
- `v330ys`: saldırılar. Kayıtta `v330ys={n:gün,a:dakika,c:sayı}`; 3–10 günde bir, 09:00–19:00. Türler `ANIM[...]` (ys:1, drops boş). Statlar saldırı başında `setStats(silah vuruşu, maxHP)`. `killAnimal` sarmalı sikke ekler. Almanakta b=99 sayfası (`window.__plYS`). Yerinde kancalar: `bossOk` (ys hariç), killAnimal toast (ys'de yok), v213 `lands`/`kindsOf`/ad/alt yazı/kart, arena `groups()`.
- `v330sea`: ACT 1 gizli deniz yolu (kayıtta `v330sea`), `window.__plSeaPath` (blocked ve v149 kıyıya çıkarma). Sonunda kayıpsız bayılma, Kemal'in yanında uyanma, Kemal konuşması, başarım `deniz` (localStorage `hammadde.denizach`, Platin'e sayılmaz).
- `v330klon`: gece klonu, `drawPlayer` oyuncunun yeri/yönü geçici değiştirilerek çizilir. localStorage `hammadde.klonN`, başarım `klon` (Platin'e sayılır).
- `v330dev`: Boğaç, her gece 15 sn; konuşunca `exitToMenu()`; kayıtta `v330dev=1` olunca bir daha gelmez.
- Tavla anısı: boynuzlar kafada (hy=80), mor. `closeTitle` içindeki iPhone ipucu toast'ı silindi.
- Kontrol: chk.js 0 hata.

## v3.29 (5 Kasım 2026) · telefonda eşyanın tam adı; reçine uyarısı
- Yeni blok `v329name`: dokunmatikte `#craft .tile[data-n]` kutucuğuna dokununca (ad `.nm` kısalmışsa) `#nmtip` balonu 2,5 sn; envanterde (`mode==='inv'`) 0,4 sn basılı tutunca balon parmak kalkana kadar, ardından gelen click yutulur. Taşınabilir eşyanın `pointerup` yolunda (`invClick` çağrısı) yerinde kanca: `window.__plNmHeld()`. Fare değişmedi.
- `feedTorch`: reçine yok uyarısı "Reçinen yok." (eski metin v2.70'te kalkan kabuk tarifini gösteriyordu).
- CLAUDE.md ve belge Giriş › Kural: 80 yaş cümlesi silindi.
- Kontrol: chk.js 0 hata. Eski kayıtlara etkisi yok.

## v3.28 (5 Kasım 2026) · oyuncuya iş tarif eden her şey silindi
- Yeni kural (CLAUDE.md en üstte, belge Giriş): oyuncuya adım adım iş yaptırılmaz; otomatikse yapılır, değilse gösterilmez.
- `v253inst` yeniden yazıldı: yalnızca `beforeinstallprompt`. `#instov` penceresi ve CSS'i silindi; iOS/Mac Safari için `manual` dalı gitti.
- iPhone tam ekran rehberi silindi: `#s-ios` notu, `#r-ios` düğmesi ve `#r-iosp`, `.iosg` ve `#r-iosp` CSS'i, `IOS&&!canLock` satırı.
- `v253inst`/`v254inst`: kol basışında bildirim yok, sessizce bir şey yapmaz.
- Kontrol: chk.js 0 hata.

## v3.27 (5 Kasım 2026) · Bilgisayara yükle yalnızca tek tıkla; nasıl yüklenir pencereleri silindi
- Boğaç: "oyuncuya ona bas buna bas denmez, buton olur basar ve yükler bitti". `v254inst` yeniden yazıldı:
  - Düğme yalnızca `beforeinstallprompt` gelince görünür; basınca `prompt()`.
  - `howto()`, `#pcinst-ov` penceresi ve CSS'i silindi; "Yükledim, bir daha gösterme" de onunla gitti. Kurulunca `appinstalled` ya da `standalone` ile gizlenir.
- `v320pad` kol yardımındaki Firefox notu silindi.
- Belge: `10_akis.md`, `20_sistemler.md`, `00_giris.md`.
- Telefondaki "Uygulama olarak indir" (`v253inst`, iPhone'da Ana Ekrana Ekle adımları) değişmedi.
- Kontrol: chk.js 0 hata.

## v3.26 (5 Kasım 2026) · Firefox'tan yükleme, kol kopması notu, Godot planı
- Belge: yeni `parts/99_godot.md`, `10_akis.md` (Bilgisayara yükle, Firefox), `20_sistemler.md` (Oyun kolu › kol kopuyorsa), `00_giris.md`.
- `v254inst` `howto()`: Windows'ta Firefox (`ff && /Windows/`) için web uygulaması adımları; diğer Firefox'larda eski metin.
- `v320pad` `renderHelp`: Xbox aparatı ile Chrome/Edge notu.
- Boğaç'ın bulgusu: Xbox kablosuz aparatı Chrome/Edge kolu okumaya başlayınca bağlantıyı kesiyor (kol güncel, Chrome yeniden kuruldu); Firefox'ta sorun yok.
- Kontrol: chk.js 0 hata (`?.` 1, `??` 7). Test yapılmadı.

## v3.25 (4 Kasım 2026) · kolda nişan yardımı, seçim yerinde kalır, ekran klavyesi, Alt Gr + Enter
- Belge `20_sistemler.md` (Oyun kolu, Kontroller), `00_giris.md`.
- `v320pad`:
  - **Nişan:** `atkDown`/`atkUp` (X ya da RT). `aimAt` v132-dokun'un `aimPoint` kurallarının kopyası; çubuk yönü `stick`. Silah eldeyse ya da arenadaysa (balta/meşalede hedef varsa) tuvale sahte fare `pointerdown`/`pointerup` gönderir (v118 kombo yolu), yoksa `attack({x,y})`.
  - **Seçim:** `remember`/`keepFocus` (pencere değişince sıfırlanır).
  - **Ekran klavyesi:** `#padkb` (z 40), `kbShow`/`kbKey`; `#nmin`'e yazar ve `input` olayı gönderir; dışına basmak = geri.
  - **Alt Gr:** `AltRight`/`AltGraph` izlenir.
- Sahte kolla bir kontrol: arkadaki yaban domuzuna dönüp vurdu. Başka test yapılmadı.
- chk.js 0 hata (`?.` 1, `??` 7).
