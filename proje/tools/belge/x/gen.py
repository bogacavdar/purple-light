#!/usr/bin/env python3
"""Purple Light tasarım belgesi için veri tablolarını üretir (oyunun çalışan halinden çıkarılmış JSON'lardan)."""
import json, os, re, collections
X = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(os.path.dirname(X), 'gen'); os.makedirs(OUT, exist_ok=True)
L = lambda f: json.load(open(os.path.join(X, f)))
A1, A2, M1, E1, E2 = L('act1.json'), L('act2.json'), L('meta1.json'), L('ext1.json'), L('ext2.json')
DB = A2['DB']; R = DB['R']; P = DB['p']; GRP = DB['c']
REC = {r['r']: r for r in R}
ANIM = dict(A1['ANIM']); ANIM.update(A2['ANIM'])
EQUIP = A2['EQUIP']; GT = A2['GT']; WDMG = E2['WDMG']
BN1, BN2 = A1['BNAME'], A2['BNAME']
DANGER = A1['BDANGER']
I2C = E2['I2C']; I1B = E2['I1B']

def tl(s):  # Türkçe sıralama anahtarı
    tr = 'aâbcçdefgğhıiîjklmnoöprsştuüûvyz'
    return [tr.index(ch) if ch in tr else 100 + ord(ch) for ch in s.lower().replace('I', 'ı')]
def fmt(n):
    if n is None: return '–'
    if isinstance(n, float) and n != int(n): return ('%.2f' % n).rstrip('0').replace('.', ',')
    return '{:,}'.format(int(n)).replace(',', '.')
def pct(p): return '%' + fmt(round(p * 100))
def esc(s): return str(s).replace('|', '\\|')
def table(head, rows):
    o = ['| ' + ' | '.join(head) + ' |', '|' + '|'.join(['---'] * len(head)) + '|']
    for r in rows: o.append('| ' + ' | '.join(esc(c) for c in r) + ' |')
    return '\n'.join(o) + '\n'

# ------------------------------------------------------------------ ACT 2 kökenli şeyler
N2 = set()
for b, Lp in I2C['plants'].items():
    for q in Lp: N2.add(q['n'])
for b, Lo in I2C['ores'].items():
    for q in Lo: N2.add(q['n'])
for n, v in A2['treeStats'].items():
    if n in A1['treeStats']: continue
    N2.add(n + ' odunu')
    if v['type'].get('fruit'): N2.add(v['type']['fruit'])
A1SRC = set(A1['nodeStats'])
for tn, v in A1['treeStats'].items():
    A1SRC.add(tn + ' odunu')
    if v['type'].get('fruit'): A1SRC.add(v['type']['fruit'])
for Lb in I1B:
    for k in Lb:
        for d in ANIM.get(k, {}).get('drops', []): A1SRC.add(d[0])
A2ANIM = []
for b, La in I2C['anim'].items():
    for a in La:
        A2ANIM.append(a['n'])
        for d in ANIM.get(a['n'], {}).get('drops', []):
            if d[0] not in A1SRC: N2.add(d[0])
N2 -= A1SRC
def expand(n): return GRP.get(n, [n])
act2rec = set()
changed = True
while changed:
    changed = False
    for r in R:
        if r['r'] in act2rec: continue
        ins = [m for n, q in r['i'] for m in expand(n)]
        # bir grup ("Herhangi …") ACT 1 malzemesi de içeriyorsa ACT 1 sayılır
        hard = [n for n, q in r['i'] if all(m in N2 or m in act2rec for m in expand(n))]
        if hard or any(t in N2 or t in act2rec for t in r['t']):
            act2rec.add(r['r']); changed = True
for r in R:
    if r['r'] in act2rec: N2.add(r['r'])

MASTER = {'Ateş asası': ('Büyücü Efsun', 100), 'Buz asası': ('Büyücü Efsun', 200), 'Yıldırım asası': ('Büyücü Efsun', 300),
          'Mana iksiri': ('Büyücü Efsun', 10), 'Tabanca': ('Silahçı Tufan', 200), 'Pompalı': ('Silahçı Tufan', 400),
          'Meka zırh': ('Mühendis Işın', 600), 'Işın kılıcı': ('Ejder Avcısı Tomris', 800),
          'Roket gövdesi': ('Astronot Gökay', 1000), 'Roket motoru': ('Astronot Gökay', 1500), 'Roket': ('Astronot Gökay', 2000)}
PLACEABLE = {r['r'] for r in R if r['c'] == 'Yapılar' or re.search('yatak', r['r'], re.I)}
def station(n):
    r = REC[n]
    if n in MASTER: return '%s yapar (%s sikke işçilik)' % MASTER[n]
    if r['c'] == 'Ev eşyası': return 'Usta Sinan yapar (ev içine konur)'
    if n in DB['f']: return 'Örs · Zırhçı Durmuş döver'
    if n in DB['t']: return 'Örs · Demirci Dursun döver'
    if n in PLACEABLE: return 'Usta Sinan / Marangoz Çınar yapar, yere kurulur'
    return 'El yapımı (Tab)'
def learnat(n): return "Yıldız'ın kazanı (ACT 2)" if n in act2rec else "Zümrüt'ün kazanı"

# ------------------------------------------------------------------ kaynak dizini: her eşya nereden gelir
SRC = collections.defaultdict(list); USE = collections.defaultdict(set)
def biolist(stats, names, tot_min=0.04):
    tot = sum(stats.values()) or 1
    out = [(int(b), c) for b, c in stats.items() if c / tot >= tot_min or c >= 25]
    out.sort(key=lambda x: -x[1])
    return ', '.join(names[b] for b, c in out)
for isle, A, names in ((1, A1, BN1), (2, A2, BN2)):
    act = 'ACT 1' if isle == 1 else 'ACT 2'
    for n, st in A['nodeStats'].items():
        if isle == 2 and n in A1['nodeStats'] and n not in N2:
            continue  # ACT 2 adasında da çıkan temel şeyler (dal, taş…) ACT 1 satırında anlatılır
        kind = A['RES'].get(n, {}).get('draw')
        verb = 'Kazmayla kazılır' if kind == 'ore' else ('Gece toplanır' if kind == 'night' else 'Yerden toplanır')
        SRC[n].append('%s: %s (%s)' % (verb, biolist(st, names), act))
    for tn, v in A['treeStats'].items():
        if isle == 2 and tn in A1['treeStats']: continue
        SRC[tn + ' odunu'].append('Balta ile %s ağacından: %s (%s)' % (tn, biolist(v['b'], names), act))
        fr = v['type'].get('fruit')
        if fr: SRC[fr].append('%s ağacından toplanır: %s (%s)' % (tn, biolist(v['b'], names), act))
def anim_bio(k):
    for i, Lb in enumerate(I1B):
        if k in Lb: return 'ACT 1 · ' + BN1[i]
    for b, La in I2C['anim'].items():
        if any(a['n'] == k for a in La): return 'ACT 2 · ' + BN2[int(b)]
    return ''
for k, D in ANIM.items():
    if 'Reis' in k: continue
    for d in D.get('drops', []):
        SRC[d[0]].append('Av: %s düşürür %s (%s)' % (k, pct(d[3]), anim_bio(k)))
FISHT = {0: {'sea': [['Tatlısu kefali', 30], ['Çapak', 26], ['Sazan', 22], ['Kızılkanat', 12], ['Mersin balığı', 3]],
             'river': [['Alabalık', 28], ['Kızılkanat', 20], ['Tatlısu levreği', 20], ['Çapak', 16], ['Sazan', 14], ['Yılan balığı', 9], ['Tatlısu midyesi', 10]]},
         1: {'any': [['Yayın', 24], ['Turna balığı', 18], ['Kadife balığı', 24], ['Kerevit', 22], ['Sazan', 10], ['Yılan balığı', 12], ['Tatlısu midyesi', 12]]},
         2: {'any': [['Mersin balığı', 22], ['Yayın', 30], ['Turna balığı', 22], ['Kadife balığı', 14]]}}
ZN = {0: 'Çayır/Orman suları', 1: 'Bataklık/Kayalık Dağ suları', 2: 'Kül Diyarı/Mor Kristal Vadisi suları'}
for z, T in FISHT.items():
    for w, Lf in T.items():
        tot = sum(x[1] for x in Lf)
        for n, wt in Lf:
            where = ZN[z] + (' (deniz)' if w == 'sea' else ' (nehir/göl)' if w == 'river' else '')
            SRC[n].append('Balık: %s, olta/ağ/zıpkın ile %s; balık kapanına da girer' % (where, pct(wt / tot)))
for n in ['Gece sefası', 'Mor kıymık']:
    pass
SRC['Mor kıymık'].append('Gece balık tutarken %5 ihtimalle oltaya takılır')
for s, pr in DB['seeds'].items():
    SRC[s].append('Çiftçi Ekin alet getirdikçe verir; bir kez görüldükten sonra Nazlı satar')
for c, pr in DB['crops'].items():
    SRC[c].append('Tarlada yetiştirilir (tohumunu ek, sula, tırpanla biç)')
for r in R:
    SRC[r['r']].append('Tarif: %s öğrenilir → %s' % (learnat(r['r']), station(r['r'])))
    for n, q in r['i']:
        for m in expand(n): USE[m].add(r['r'])
        USE[n].add(r['r'])
    for t in r['t']: USE[t].add(r['r'] + ' (alet)')
TT = L('tt.json')
for t in TT['TT']:
    if t.get('fruit'):
        SRC[t['fruit']].insert(0, 'Meyve ağacı (%s): eli boşken E ile silkele, 2–3 tane düşer; ağaç kesilince de 1–2 tane' % t['n'])
    if t.get('seed'):
        SRC[t['seed']].append('%s ağacı baltayla kesilince %%35 ihtimalle düşer' % t['n'])
for tn, Lx in TT['TX'].items():
    for k, q in Lx:
        SRC[k].append('%s ağacı kesilince %d tane düşer' % (tn, q))
for n in list(P) + list(SRC):
    if n.startswith('Közlenmiş '):
        raw = n[len('Közlenmiş '):]
        cand = [m for m in P if m.lower() == raw.lower()]
        SRC[n].append('Kamp ateşinde közlenir (çiğ hali: %s)' % (cand[0] if cand else raw))
SRC['Kafa lambası'].append('Yıldızsız Işıkçı ile takas: 5 Mor kıymık + 3 Gece sefası + 1 Tunç külçesi (baş yuvasına takılır, gece kendiliğinden yanar)')
SRC['Gece sefası'].append('Yalnız gece, karanlık iyice çökünce karada (Çayır/Orman) beliren beyaz çiçek; E ile toplanır')
SRC['Mor kıymık'].append('Yalnız gece, karanlıkta karada beliren mor parıltı (Çayır/Orman); E ile toplanır')
SRC['Mor pusula'].append('Eski Sisli Ada sonunun ödülü (kodda duruyor; güncel akışta ulaşılıp ulaşılmadığı test raporuna bakın)')
for h in A1['HOUSES']:
    SRC[h['n']].append('Marangoz Çınar yapar (%s sikke%s)' % (fmt(h['c']), ', malzeme: ' + ', '.join('%d %s' % (q, n) for n, q in h['mat']) if h.get('mat') else ''))
for c, s in [('Buğday', 'Buğday tohumu'), ('Havuç', 'Havuç tohumu'), ('Patates', 'Patates tohumu'), ('Soğan', 'Soğan tohumu'), ('Kabak', 'Kabak tohumu'), ('Ayçiçeği', 'Ayçiçeği tohumu')]:
    SRC[s].append('Hasatta %%45 ihtimalle 1 tane (%s)' % c)
SRC['Su'].append('Kap ile (Yaprak kova vb.) suyun kıyısında E')
SRC['Nehir kili'].append('Kürek ile nehir kıyısındaki kilden kazılır')

# ------------------------------------------------------------------ 1) Biyom bölümleri
def creature_rows(names):
    rows = []
    for k in names:
        D = ANIM.get(k)
        if not D: continue
        drops = '; '.join('%s %s%s' % (d[0], pct(d[3]), ' ×%d–%d' % (d[1], d[2]) if d[2] > 1 else '') for d in D.get('drops', []))
        tags = []
        if D.get('night'): tags.append('gece')
        if D.get('fly'): tags.append('uçar')
        if D.get('ranged'): tags.append('uzaktan atar (%d menzil, %d atış)' % (D['ranged'].get('range', 0), D['ranged'].get('n', 1)))
        if D.get('fx'): tags.append('%s etkisi' % D['fx'][0])
        pk = (A1['PACK'].get(k) or A2['PACK'].get(k))
        if pk: tags.append('sürü %d–%d' % tuple(pk))
        rows.append([k, D.get('temper', ''), fmt(D.get('hp')), fmt(D.get('dmg')) if D.get('dmg') else '–', fmt(D.get('spd')),
                     fmt(D.get('xp')), ', '.join(tags) or '–', drops or '–'])
    return rows
CH = ['Canlı', 'Mizaç', 'Can', 'Hasar', 'Hız', 'XP', 'Özellik', 'Düşürdükleri (ihtimal)']

INTRO1 = [
 "Başladığın yer: büyük nehrin batısı, adanın güney yarısı. Tavşanlar, keklikler, meyve ağaçları. Kemal, Zümrüt, Nazlı, Börü, Dursun, Durmuş ve Çınar burada. Canavarlar zayıf; kurt sürüleri yalnız gece çıkar.",
 "Nehrin batısı, adanın kuzey yarısı (Çayır'dan kuzeye yürü). Gölgeli ve sık; yaban domuzları, dikenli kirpiler, engerekler. Usta Sinan ve Çiftçi Ekin'in tarlası bu tarafta.",
 "Büyük nehrin doğusu, köprünün karşısı ve güneyi: önce köprüyü onar. Çamur ayağını tutar (Kamış çizme işe yarar), timsahlar ve zehirli kurbağalar. Demir cevheri yalnızca burada. Avcı Doğan'ın kulübesi burada.",
 "Nehrin doğusu, köprünün kuzeyi. Kartallar, vaşaklar, mağara ayıları. Kuvars, gümüş ve altın madenleri.",
 "Sıradağın ardı: köprüden geç, doğuya yürü, sıradağdaki **Doğu geçidi**ni Kaya patlatıcıyla aç. Ateş ve kül her yerde; zırhsız gelme. Lav kertenkelesi ve Kara ejder burada.",
 "Adanın en doğu ucu, Kül Diyarı'nın ötesi. Mor ışığın en sık indiği yer; kristal golemler, gölge kurtları. Son iz ve Denizci Barbaros'un enkazı burada.",
]
INTRO2 = [
 "İniş yeri. Havada duran kayalar, bulut koyunları, rüzgâr kuşları. Gökbilimci Yıldız ve ACT 2 kazanı burada. Gece gök tazıları çıkar.",
 "Dev mantarlar ve spor ağaçları. Goblinler grup halinde gezer, okçuları uzaktan atar, şamanları zehirler. Büyücü Efsun burada.",
 "Geminin düşürdüğü dronların hurda çölü. Devriye robotları, lazer dronları ve dev bir hurda devi. Silahçı Tufan burada.",
 "Kristal kayalıklar. Golemcikler, kristal yarasaları ve büyük golem. Mühendis Işın burada.",
 "Kızıl volkan. Yavru ejderler ateş tükürür, lav golemleri yakar; kızıl ejder adanın en güçlü canavarlarından. Ejder Avcısı Tomris burada.",
 "Adanın en uzak ucu, roket rampası. Uzaylı dronları, gölge muhafızlar ve dev Gök bekçisi. Astronot Gökay burada.",
]
def biome_md(isle):
    A = A1 if isle == 1 else A2; names = BN1 if isle == 1 else BN2; act = 'ACT 1' if isle == 1 else 'ACT 2'
    out = []
    for b in range(6):
        out.append('## %s — %s\n' % (names[b], DANGER[b]))
        intro = (INTRO1 if isle == 1 else INTRO2)[b]
        if intro: out.append(intro + '\n')
        # ağaçlar
        rows = []
        for tn, v in sorted(A['treeStats'].items(), key=lambda kv: -kv[1]['b'].get(str(b), 0)):
            c = v['b'].get(str(b), 0); tot = sum(v['b'].values())
            if c < 8 or c / tot < .05: continue
            if isle == 2 and tn in A1['treeStats']: continue
            tier = E2['TREE_TIER'].get(tn) or E1['TREE_TIER'].get(tn) or 1
            axe = {1: 'Taş balta', 2: 'Çakmaktaşı/Granit balta', 3: 'Kuvars/Tunç balta', 4: 'Bazalt/Demir balta', 5: 'Obsidyen balta'}.get(tier, '?')
            rows.append([tn, tn + ' odunu', fmt(P.get(tn + ' odunu')), v['type'].get('fruit') or '–', '%d. kademe (%s)' % (tier, axe)])
        if rows:
            out.append('**Ağaçlar**\n\n' + table(['Ağaç', 'Verdiği odun', 'Odun fiyatı', 'Meyve', 'Gereken balta'], rows))
        # toplanabilirler ve madenler
        plants, ores = [], []
        for n, st in sorted(A['nodeStats'].items(), key=lambda kv: tl(kv[0])):
            c = st.get(str(b), 0); tot = sum(st.values())
            if c < 4 or (c / tot < .04 and c < 25): continue
            if isle == 2 and n in A1['nodeStats'] and n not in N2: continue
            res = A['RES'].get(n, {})
            ex = []
            if res.get('respawn') and res['respawn'] < 1e8: ex.append('%d sn sonra yeniden çıkar' % res['respawn'])
            if res.get('draw') == 'night': ex.append('yalnız gece')
            if res.get('draw') == 'ore':
                t = E2['ORE_TIER'].get(n) or E1['ORE_TIER'].get(n) or 1
                pick = {1: 'Taş kazma', 2: 'Çakmaktaşı/Granit kazma', 3: 'Kuvars/Tunç kazma', 4: 'Bazalt/Demir kazma', 5: 'Obsidyen kazma'}.get(t, '?')
                ores.append([n, fmt(P.get(n)), '%d. kademe (%s)' % (t, pick), fmt(c), ', '.join(ex)])
            else:
                food = E2['RAWFOOD'].get(n)
                if food: ex.append('çiğ yenir (+%d tokluk)' % food)
                if n in A1['POISON']: ex.append('zehirli!')
                plants.append([n, fmt(P.get(n)), fmt(c), ', '.join(ex) or '–'])
        if plants: out.append('**Toplanabilirler** (E ile, elde alet gerekmez)\n\n' + table(['Eşya', 'Fiyat', 'Adadaki sayısı', 'Not'], plants))
        if ores: out.append('**Madenler** (kazma elde, E)\n\n' + table(['Maden', 'Fiyat', 'Gereken kazma', 'Adadaki sayısı', 'Not'], ores))
        # canlılar
        cn = I1B[b] if isle == 1 else [a['n'] for a in I2C['anim'][str(b)]]
        out.append('**Canlılar**\n\n' + table(CH, creature_rows(cn)))
    return '\n'.join(out)
open(os.path.join(OUT, 'biyom_act1.md'), 'w').write(biome_md(1))
open(os.path.join(OUT, 'biyom_act2.md'), 'w').write(biome_md(2))

# ------------------------------------------------------------------ 2) Reisler
BOSS = L('boss2.json')
rows = []
ORD = ['ACT 1 · ' + x for x in BN1] + ['ACT 2 · ' + x for x in BN2]
for k, D in sorted([kv for kv in BOSS.items() if kv[1]['b'] != 'Kara ejder'], key=lambda kv: (ORD.index(anim_bio(kv[1]['b'])) if anim_bio(kv[1]['b']) in ORD else 99, tl(kv[0]))):
    rows.append([k, anim_bio(D['b']), fmt(D.get('need')), fmt(D.get('hp')), fmt(D.get('dmg')), fmt(D.get('xp')),
                 '; '.join('%s ×2' % d[0] for d in D.get('drops', []))])
open(os.path.join(OUT, 'reisler.md'), 'w').write(table(['Reis', 'Nerede', 'İlk çıkış için av', 'Can', 'Hasar', 'XP', 'Garanti ganimet'], rows))

# ------------------------------------------------------------------ 3) Tarifler (kategori kategori)
cats = collections.OrderedDict()
for r in R: cats.setdefault(r['c'], []).append(r)
o = []
o.append('Toplam **%d tarif**: ACT 1 malzemeleriyle %d, ACT 2 malzemesi isteyen %d.\n' % (len(R), len(R) - len(act2rec), len(act2rec)))
for c, rs in sorted(cats.items(), key=lambda kv: -len(kv[1])):
    o.append('#### %s (%d)\n' % (c, len(rs)))
    rows = []
    for r in sorted(rs, key=lambda r: tl(r['r'])):
        ing = ', '.join('%d %s' % (q, n) for n, q in r['i'])
        rows.append([r['r'] + (' ²' if r['r'] in act2rec else ''), ing, ', '.join(r['t']) or '–', station(r['r']), fmt(P.get(r['r']))])
    o.append(table(['Ürün', 'Malzemeler', 'Gereken alet (harcanmaz)', 'Nerede yapılır', 'Fiyat'], rows))
open(os.path.join(OUT, 'tarifler.md'), 'w').write('\n'.join(o))
gl = [[k, ', '.join(v)] for k, v in sorted(GRP.items(), key=lambda kv: tl(kv[0]))]
open(os.path.join(OUT, 'gruplar.md'), 'w').write(table(['Grup', 'Yerine geçen eşyalar'], gl))

# ------------------------------------------------------------------ 4) Eşya dizini
allnames = set(P) | set(REC) | set(SRC)
rows = []
for n in sorted(allnames, key=tl):
    if n.endswith('Reisi'): continue
    s = SRC.get(n) or []
    s = list(dict.fromkeys(s))
    u = sorted(USE.get(n, []), key=tl)
    uses = ', '.join(u[:6]) + (' … (+%d)' % (len(u) - 6) if len(u) > 6 else '') if u else '–'
    kind = []
    if n in GT: kind.append('alet')
    if n in EQUIP: kind.append('giyilir +%d savunma' % EQUIP[n].get('def', 0))
    if n in WDMG: kind.append('silah %d hasar' % WDMG[n])
    if n in E2['RAWFOOD']: kind.append('yenir +%d' % E2['RAWFOOD'][n])
    if n in A1['POISON']: kind.append('zehirli')
    rows.append([n + (' ²' if n in N2 else ''), fmt(P.get(n)), ', '.join(kind) or '–', ' · '.join(s) or '(kaynak bulunamadı)', uses])
open(os.path.join(OUT, 'esyalar.md'), 'w').write(table(['Eşya', 'Fiyat', 'Tür', 'Nereden gelir', 'Hangi tariflerde kullanılır'], rows))
nosrc = [r[0] for r in rows if r[3] == '(kaynak bulunamadı)']
json.dump(nosrc, open(os.path.join(OUT, 'kaynaksiz.json'), 'w'), ensure_ascii=False)

# ------------------------------------------------------------------ 5) Aletler, silahlar, zırhlar
rows = []
for n, g in sorted(GT.items(), key=lambda kv: (kv[1].get('kind', ''), tl(kv[0]))):
    tier = E2['AXE_TIER'].get(n) or E2['PICK_TIER'].get(n) or ''
    rows.append([n, g.get('kind', ''), g.get('use', ''), fmt(g.get('time')), fmt(g.get('dur')), fmt(g.get('sharp')), str(tier) or '–', fmt(WDMG.get(n)) if n in WDMG else '–'])
open(os.path.join(OUT, 'aletler.md'), 'w').write(table(['Alet', 'Tür', 'Ne yapar', 'İş süresi (sn)', 'Dayanıklılık', 'Bileme ücreti', 'Kademe', 'Silah hasarı'], rows))
SL = {'bas': 'Baş', 'govde': 'Gövde', 'el': 'El', 'ayak': 'Ayak', 'silah': 'Silah'}
rows = []
for n, e in sorted(EQUIP.items(), key=lambda kv: (kv[1].get('s', ''), kv[1].get('def', 0))):
    ex = []
    if e.get('res'): ex.append('direnç: ' + ', '.join('%s %s' % (k, pct(v)) for k, v in e['res'].items()))
    if e.get('metal'): ex.append('metal')
    rows.append([n + (' ²' if n in N2 else ''), SL.get(e.get('s'), e.get('s')), fmt(e.get('def')), station(n) if n in REC else '–', ', '.join(ex) or '–'])
open(os.path.join(OUT, 'zirhlar.md'), 'w').write(table(['Zırh', 'Yuva', 'Savunma', 'Nerede yapılır', 'Not'], rows))

# ------------------------------------------------------------------ 6) Görevler
GN = {'witch': 'Cadı Zümrüt', 'market': 'Pazarcı Nazlı', 'alp': 'Savaşçı Börü', 'smith': 'Demirci Dursun', 'durmus': 'Zırhçı Durmuş',
      'farmer': 'Çiftçi Ekin', 'usta': 'Usta Sinan', 'carp': 'Marangoz Çınar', 'toygar': 'Avcı Doğan', 'tuna': 'Astronot Gökay',
      'alara': 'Ejder Avcısı Tomris', 'selin': 'Mühendis Işın', 'tamer': 'Silahçı Tufan', 'pervin': 'Büyücü Efsun',
      'gok': 'Gökbilimci Yıldız', 'denizci': 'Denizci Barbaros', 'trader': 'Gemici Poyraz'}
def qwant(q):
    if q.get('bring'): return 'Getir: ' + ', '.join('%d %s' % (n, m) for m, n in q['bring'])
    if q.get('kill'): k = q['kill']; k = json.loads(k.replace("'", '"')) if isinstance(k, str) else k; return 'Avla: %d %s' % (k[1], k[0])
    if q.get('cnt'): k = q['cnt']; k = json.loads(k.replace("'", '"')) if isinstance(k, str) else k; return 'Topla/say: %s %s' % (k[1], k[2])
    p = q.get('p', '')
    return {'w2': '10 tarif öğren', 's1': 'Taş kılıcı örste döv', 'smith_bronze': 'Tunç balta/kazma/kılıç/mızraktan birini döv',
            's4': 'Demir balta/kazma/kılıç/mızraktan birini döv', 'd1': 'Başına bir şey giy', 'd3': 'Tunç zırh dövdür',
            'u1': 'Atölye kur', 'u3': 'Çit kur', 'carp1': 'Yaprak barınağı yaptır ve gece içinde uyu', 'c3': 'Kalıcı bir ev kur (yaprak barınağı sayılmaz)',
            't1': 'Kamış çizme yap', 'gk2': 'Bir gece bekle (gün değişsin)', 'nuri1': "Poyraz'ın ilk siparişini teslim et"}.get(q['id'], str(p)[:80])
o = []
for g in GN:
    qs = [q for q in M1['NQ'] if q['g'] == g]
    if not qs: continue
    rows = []
    for i, q in enumerate(qs):
        rows.append([str(i + 1), q['t'], qwant(q), q.get('rt') or '–', fmt(q.get('c')), fmt(q.get('x'))])
    t = table(['#', 'Görev', 'İstenen', 'Açılma şartı', 'Sikke', 'XP'], rows)
    open(os.path.join(OUT, 'gorev_%s.md' % g), 'w').write(t)
    o.append('#### %s\n\n' % GN[g] + t)
open(os.path.join(OUT, 'gorevler.md'), 'w').write('\n'.join(o))
rows = []
for i, q in enumerate(M1['QUESTS']):
    rows.append([str(i + 1), q['t'], re.sub('<[^>]+>', '', q.get('h') if isinstance(q.get('h'), str) else '')[:160], fmt(q.get('c')), fmt(q.get('x'))])
open(os.path.join(OUT, 'ekin.md'), 'w').write(table(['#', 'Görev', 'İpucu (oyundaki)', 'Sikke', 'XP'], rows))

# ------------------------------------------------------------------ 7) Başarımlar, yetenekler, dersler, evler
rows = [[a[1], a[2], a[0], re.sub('^fn:', '', a[4])[:110]] for a in M1['ACH']]
open(os.path.join(OUT, 'basarimlar.md'), 'w').write(table(['Başarım', 'Nasıl kazanılır (oyundaki metin)', 'Kimlik', 'Koşul (kod)'], rows))
rows = [[s['id'], s['br'], s['n'], s['e'], fmt(s['c']), s.get('r', '–') or '–', ('Sv %d' % s['lv']) if s.get('lv') else '–'] for s in A1['SKILLS']]
open(os.path.join(OUT, 'yetenekler.md'), 'w').write(table(['Kimlik', 'Dal', 'Yetenek', 'Etki', 'Fiyat', 'Ön koşul', 'Seviye'], rows))
rows = []
for l in M1['LES']:
    steps = ' → '.join(re.sub('<[^>]+>', '', s[2]) for s in l['st'])
    rows.append([l['n'], 'Sv %d' % l['lv'], fmt(l['c']), fmt(l.get('x')), l.get('foe', ''), steps])
open(os.path.join(OUT, 'dersler.md'), 'w').write(table(['Ders', 'Şart', 'Ücret', 'XP', 'Alıştırma canavarı', 'Adımlar'], rows))
REAL = {'Yaprak barınağı': 5, 'Deri çadır': 1039, 'Kulübe': 510, 'Kamış kulübe': 650, 'Kerpiç ev': 958, 'Ahşap ev': 2278, 'Taş ev': 4049, 'Konak': 8097}
rows = [[h['n'], 'Sv %d' % h['lv'], fmt(REAL.get(h['n'], h['c'])), fmt(h['c']), ', '.join('%d %s' % (q, n) for n, q in h.get('mat', [])) or '–', h.get('d', '')] for h in A1['HOUSES']]
open(os.path.join(OUT, 'evler.md'), 'w').write(table(['Yapı', 'Seviye', 'Çınar\'ın aldığı ücret', 'Tasarımdaki liste fiyatı', 'Malzeme', 'Açıklama'], rows))

print('ACT2 tarif:', len(act2rec), 'kaynaksız eşya:', len(nosrc))
print(nosrc[:80])
