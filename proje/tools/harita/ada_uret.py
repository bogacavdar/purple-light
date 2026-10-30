"""Purple Light · ada haritası üreticisi (v2.35)

İki adayı oyun çözünürlüğünde üretir ve oyuna gömülecek veriyi yazar:
  ada 1 = Yıldızsız Ada (Hilal), ada 2 = ikinci ada (Yonca).
Kural: altı biyom eşit alanlı ve zincir halinde (1-2-3-4-5-6, yalnızca ardışıklar komşu);
1-2 / 3-4 / 5-6 ortak bölgeler; 2|3 arasında büyük nehir (3 köprü), 4|5 arasında sıradağ (tek geçit, kaya yığını).

Çıktı: proje/tools/harita/adalar.js  (window.__plMAPS = {1:{...},2:{...}})
        proje/tools/harita/ada1.png, ada2.png  (önizleme)
Çalıştır: python3 proje/tools/harita/ada_uret.py
"""
import base64, heapq, json, os, sys
import numpy as np
from scipy import ndimage as ndi
from PIL import Image

OUT = os.path.dirname(os.path.abspath(__file__))
LAND_TARGET = 282000          # eski adaların kara karo sayısı (v2.34 ölçümü)
BASE = 128                    # şekiller 128'lik önizleme ızgarasında tanımlı

ISLANDS = {
    1: dict(name='Hilal', pts=[(22,40),(40,22),(70,20),(98,34),(108,64),(96,94),(70,106)],
            radii=[16,20,22,24,22,20,16], seed=11),
    2: dict(name='Yonca', pts=[(26,96),(44,74),(30,46),(56,30),(84,24),(98,52),(86,80),(104,104)],
            radii=[16,18,20,22,20,20,18,16], seed=37),
}

# ----------------------------------------------------------------------------- noise (çözünürlükten bağımsız)
def value_noise(rng, N, octaves=4, base=6):
    out = np.zeros((N, N)); amp = 1; tot = 0
    for o in range(octaves):
        n = base * 2 ** o
        g = rng.random((n + 1, n + 1))
        s = np.linspace(0, n, N, endpoint=False)
        i0 = s.astype(int); f = s - i0; f = f * f * (3 - 2 * f)
        fy = f[:, None]; fx = f[None, :]
        a = g[i0][:, i0]; b = g[i0][:, i0 + 1]; c = g[i0 + 1][:, i0]; d = g[i0 + 1][:, i0 + 1]
        out += amp * ((a * (1 - fx) + b * fx) * (1 - fy) + (c * (1 - fx) + d * fx) * fy)
        tot += amp; amp *= .5
    return out / tot

def dist_to_polyline(pts, N, k):
    yy, xx = np.mgrid[0:N, 0:N] / k
    best = np.full((N, N), 1e9); tpar = np.zeros((N, N)); L = [0]
    for i in range(len(pts) - 1):
        L.append(L[-1] + np.hypot(pts[i+1][0]-pts[i][0], pts[i+1][1]-pts[i][1]))
    for i in range(len(pts) - 1):
        (x1, y1), (x2, y2) = pts[i], pts[i+1]
        dx, dy = x2-x1, y2-y1; l2 = dx*dx + dy*dy
        t = np.clip(((xx-x1)*dx + (yy-y1)*dy) / l2, 0, 1)
        d = np.hypot(xx-(x1+t*dx), yy-(y1+t*dy))
        m = d < best; best[m] = d[m]; tpar[m] = ((L[i] + t*(L[i+1]-L[i])) / L[-1])[m]
    return best, tpar

def geo(mask, start, cost=None):
    """8 yönlü Dijkstra (karo cinsinden)."""
    H, W = mask.shape
    d = np.full(H*W, np.inf); m = mask.ravel()
    cs = None if cost is None else cost.ravel()
    s = start[0]*W + start[1]; d[s] = 0; pq = [(0.0, s)]
    st = [(-W-1,1.4142),(-W,1),(-W+1,1.4142),(-1,1),(1,1),(W-1,1.4142),(W,1),(W+1,1.4142)]
    while pq:
        cd, i = heapq.heappop(pq)
        if cd > d[i]: continue
        x = i % W
        for o, w in st:
            j = i + o
            if j < 0 or j >= H*W or not m[j]: continue
            jx = j % W
            if abs(jx - x) > 1: continue
            nd = cd + w * (1 if cs is None else cs[j])
            if nd < d[j]: d[j] = nd; heapq.heappush(pq, (nd, j))
    return d.reshape(H, W)

def largest(mask):
    lab, n = ndi.label(mask)
    if n == 0: return mask
    sz = ndi.sum(mask, lab, range(1, n+1))
    return lab == (1 + int(np.argmax(sz)))

# ----------------------------------------------------------------------------- one island
def build(isle):
    P = ISLANDS[isle]
    pts0 = [(64 + (x-64)*.82, 64 + (y-64)*.82) for x, y in P['pts']]
    radii = [r*.85 for r in P['radii']]
    # 1) çözünürlük: kara alanı eski adayla aynı olsun
    def mask_at(N):
        k = N / BASE
        rng = np.random.default_rng(P['seed'])
        dist, t = dist_to_polyline(pts0, N, k)
        r = np.interp(t, np.linspace(0, 1, len(radii)), radii)
        n1 = value_noise(rng, N, 5, 5); n2 = value_noise(rng, N, 4, 3)
        m = dist < r*(.65 + .7*n1) + 9*(n2 - .5)
        e = int(4*k); m[:e] = m[-e:] = False; m[:, :e] = m[:, -e:] = False
        m = ndi.binary_fill_holes(largest(m))
        return m, rng, k
    m, _, _ = mask_at(256)
    N = int(round(256 * (LAND_TARGET / m.sum()) ** .5))
    mask, rng, k = mask_at(N)
    print(f'ada {isle}: N={N} kara={mask.sum()}')
    # 2) kırp: kara kutusu + 22 karo deniz payı
    ys, xs = np.where(mask); M = 22
    y0, y1, x0, x1 = ys.min()-M, ys.max()+M+1, xs.min()-M, xs.max()+M+1
    rn = value_noise(rng, N, 2, 2); wn = value_noise(rng, N, 3, 4)   # aynı sırayla (önizlemeyle aynı)
    sl = (slice(y0, y1), slice(x0, x1))
    mask = mask[sl]; rn = rn[sl]; wn = wn[sl]
    H, W = mask.shape
    # 3) zincir ilerlemesi: polyline başından geodezik mesafe (önizleme birimine çevrilir)
    sx, sy = pts0[0][0]*k - x0, pts0[0][1]*k - y0
    land = np.argwhere(mask)
    st = tuple(land[np.argmin((land[:,0]-sy)**2 + (land[:,1]-sx)**2)])
    d = geo(mask, st) / k
    mn = value_noise(np.random.default_rng(P['seed']+5), N, 3, 10)[sl]
    prog = d + 10*(rn - .5) + 5*(mn - .5)
    vals = prog[mask]
    q1, q2 = np.quantile(vals, [1/3, 2/3])
    pair = np.full((H, W), -1)
    pair[mask & (prog < q1)] = 0; pair[mask & (prog >= q1) & (prog < q2)] = 1; pair[mask & (prog >= q2)] = 2
    bio = np.full((H, W), -1)
    noisy = prog + 22*(wn - .5) + 6*(mn - .5)
    def split(p, thr):
        mm = pair == p; out = np.where(noisy < thr, 2*p, 2*p + 1); out[~mm] = -1
        for b in (2*p, 2*p + 1):   # her biyom tek parça: küçük parçalar komşusuna
            lab, n = ndi.label(out == b)
            if n <= 1: continue
            sz = ndi.sum(out == b, lab, range(1, n+1)); keep = 1 + int(np.argmax(sz))
            for c in range(1, n+1):
                if c != keep: out[lab == c] = (2*p + 1) if b == 2*p else 2*p
        return out
    for p in range(3):
        mm = pair == p; v = noisy[mm]; lo, hi = v.min(), v.max(); thr = np.median(v)
        for _ in range(30):   # eşik, temizlikten sonra iki yarı eşit kalacak şekilde ayarlanır
            out = split(p, thr); f = (out[mm] == 2*p).mean()
            if abs(f - .5) < .0005: break
            if f > .5: hi = thr
            else: lo = thr
            thr = (lo + hi) / 2
        bio[mm] = out[mm]
    pair = np.where(mask, bio // 2, -1)
    # 5) bölücüler: büyük nehir (çift 0|1) ve sıradağ (çift 1|2)
    d01 = np.minimum(np.where(pair == 0, ndi.distance_transform_edt(pair != 1), 99), np.where(pair == 1, ndi.distance_transform_edt(pair != 0), 99))
    d12 = np.minimum(np.where(pair == 1, ndi.distance_transform_edt(pair != 2), 99), np.where(pair == 2, ndi.distance_transform_edt(pair != 1), 99))
    river = mask & (d01 <= 2.7)
    rw = value_noise(rng, max(H, W), 3, 6)[:H, :W]
    ridge = mask & (d12 <= 1.9 + rw*1.5)
    ocean = ~mask
    docean = ndi.distance_transform_edt(~ocean)
    # 6) göller ve dereler
    rngL = np.random.default_rng(1000 + isle)
    # biyom içi konum (u: zincir yönünde 0..1, v: enine 0..1)
    def anchor(b, u, v, coast=10, div=10):
        cells = np.argwhere(bio == b); pv = prog[bio == b]
        order = np.argsort(pv); rank = np.empty(len(pv)); rank[order] = np.linspace(0, 1, len(pv))
        sel = cells[np.abs(rank - u) < .04]
        if len(sel) < 10: sel = cells
        c = sel - sel.mean(0); _, _, vt = np.linalg.svd(c, full_matrices=False); ax = c @ vt[0]
        ax = (ax - ax.min()) / max(1e-9, ax.max() - ax.min())
        good = [(abs(a - v), tuple(p)) for a, p in zip(ax, sel)
                if docean[tuple(p)] >= coast and d01[tuple(p)] >= div and d12[tuple(p)] >= div]
        if not good: good = [(abs(a - v), tuple(p)) for a, p in zip(ax, sel)]
        return min(good)[1]   # (y, x)
    water = np.zeros((H, W), bool)
    lakes = []
    def lake(c, r):
        yy, xx = np.mgrid[0:H, 0:W]
        nz = value_noise(rngL, max(H, W), 2, 8)[:H, :W]
        m_ = (np.hypot(yy - c[0], xx - c[1]) - r - (nz - .5)*2 < 0) & mask & ~river & ~ridge
        water[m_] = True; lakes.append((int(c[1]), int(c[0]), r))
    def stream(c, b_pair, w0, w1):
        # gölden en yakın denize, kendi çiftinin içinde, kıvrılarak
        allowed = (pair == b_pair) & ~river & ~ridge | ocean
        cost = 1 + 10*value_noise(rngL, max(H, W), 4, 24)[:H, :W]**2
        dd = geo(allowed, c, cost)
        dd[~ocean] = np.inf; tgt = np.unravel_index(np.argmin(dd), dd.shape)
        if not np.isfinite(dd[tgt]): return
        # geri izle
        D = geo(allowed, tgt, cost); path = [c]; cur = c
        for _ in range(4000):
            if ocean[cur]: break
            y, x = cur; best = None
            for dy in (-1, 0, 1):
                for dx in (-1, 0, 1):
                    if dy == dx == 0: continue
                    ny, nx = y+dy, x+dx
                    if 0 <= ny < H and 0 <= nx < W and np.isfinite(D[ny, nx]) and (best is None or D[ny, nx] < D[best]): best = (ny, nx)
            if best is None or D[best] >= D[cur]: break
            cur = best; path.append(cur)
        n = len(path)
        for i, (y, x) in enumerate(path):
            w = w0 + (w1 - w0) * i / max(1, n-1); R = int(w) + 2
            for yy in range(y-R, y+R+1):
                for xx in range(x-R, x+R+1):
                    if 0 <= yy < H and 0 <= xx < W and mask[yy, xx] and not river[yy, xx] and not ridge[yy, xx] and (yy-y)**2 + (xx-x)**2 <= w*w + .3:
                        water[yy, xx] = True
    # yurt pınarı (2. biyom) + deresi, orta diyar pınarı (4. biyom) + deresi, ilk biyomda göl, 3. biyomda gölcükler
    a = anchor(1, .55, .35, 22, 22); lake(a, 4); stream(a, 0, 1.2, 2.6)
    a = anchor(3, .5, .55, 22, 22); lake(a, 5.5); stream(a, 1, 1.1, 2.4)
    a = anchor(0, .6, .6, 20, 18); lake(a, 6)
    placed = []
    for i in range(80):
        if len(placed) >= 20: break
        a = anchor(2, rngL.random()*.9 + .05, rngL.random(), 10, 8)
        if any(np.hypot(a[0]-p[0], a[1]-p[1]) < 14 for p in placed): continue
        placed.append(a); lake(a, 1.6 + rngL.random()*2.2)
    # 7) karo sınıfları: 0 kara, 1 kum, 2 tatlı su, 3 deniz, 4 sıradağ, 5 büyük nehir
    cls = np.zeros((H, W), np.uint8)
    wetd = ndi.distance_transform_edt(~(water | river))
    cls[mask & (docean <= 4)] = 1
    cls[mask & (wetd <= 1.4) & ~(water | river)] = 1
    cls[water] = 2
    cls[river] = 5
    cls[ridge & ~river] = 4
    cls[ocean] = 3
    # denizin biyomu: en yakın karanınki
    _, (iy, ix) = ndi.distance_transform_edt(~mask, return_indices=True)
    bioF = bio.copy(); bioF[~mask] = bio[iy[~mask], ix[~mask]]
    # 8) köprüler: nehri yatay geçen kısa açıklıklar, nehrin boyunca üç yere yayılmış
    rc = np.argwhere(river); cen = rc.mean(0); _, _, vt = np.linalg.svd(rc - cen, full_matrices=False)
    tline = (rc - cen) @ vt[0]; tmin, tmax = tline.min(), tline.max()
    def land_ok(y, x, p):
        return 0 <= x < W and mask[y, x] and not river[y, x] and not water[y, x] and not ridge[y, x] and pair[y, x] == p and docean[y, x] >= 6
    cands = []
    for y in range(3, H-3):
        rows = []
        for o in (-1, 0, 1):
            xs_ = np.where(river[y+o])[0]
            if not len(xs_): break
            runs = np.split(xs_, np.where(np.diff(xs_) > 1)[0] + 1)
            if len(runs) != 1: break
            rows.append((int(runs[0][0]), int(runs[0][-1])))
        if len(rows) != 3: continue
        a_ = min(r[0] for r in rows); b_ = max(r[1] for r in rows)
        if b_ - a_ + 1 > 22: continue
        for pl, pr in ((0, 1), (1, 0)):
            if all(land_ok(y+o, a_-1, pl) and land_ok(y+o, b_+1, pr) for o in (-1, 0, 1)):
                t_ = (np.array([y, (a_+b_)/2]) - cen) @ vt[0]
                cands.append(((t_ - tmin)/(tmax - tmin), b_ - a_ + 1, y, a_, b_))
    bridges = []; bts = []
    for tt in (.5, .2, .8):   # önce ana köprü (ortada), sonra iki kısayol
        good = [c for c in cands if all(abs(c[0] - bt) > .15 for bt in bts)]
        c = min(good, key=lambda c: c[1] + abs(c[0]-tt)*60)
        bridges.append([c[2], c[3], c[4]]); bts.append(c[0])
    # 9) sıradağ geçidi: kaya yığını (3 satır), sıradağın ortasına yakın
    gc = np.argwhere(ridge & ~river); gcen = gc.mean(0); _, _, gvt = np.linalg.svd(gc - gcen, full_matrices=False)
    gt = (gc - gcen) @ gvt[0]; gmin, gmax = gt.min(), gt.max()
    pcand = []
    for y in range(4, H-4):
        rows = []
        for o in (-1, 0, 1):
            xs_ = np.where(ridge[y+o] & ~river[y+o])[0]
            if not len(xs_): break
            runs = np.split(xs_, np.where(np.diff(xs_) > 1)[0] + 1)
            if len(runs) != 1: break
            rows.append((int(runs[0][0]), int(runs[0][-1])))
        if len(rows) != 3: continue
        a_ = min(r[0] for r in rows); b_ = max(r[1] for r in rows)
        if b_ - a_ + 1 > 14: continue
        ok = False
        for pl, pr in ((1, 2), (2, 1)):
            if all(mask[y+o, a_-1] and not ridge[y+o, a_-1] and not water[y+o, a_-1] and pair[y+o, a_-1] == pl and docean[y+o, a_-1] >= 8 and
                   mask[y+o, b_+1] and not ridge[y+o, b_+1] and not water[y+o, b_+1] and pair[y+o, b_+1] == pr and docean[y+o, b_+1] >= 8 for o in (-1, 0, 1)):
                ok = True
        # yukarıda ve aşağıda duvar sürmeli
        if ok and (ridge[y-2, a_:b_+1].any() and ridge[y+2, a_:b_+1].any()):
            t_ = ((np.array([y, (a_+b_)/2]) - gcen) @ gvt[0] - gmin) / (gmax - gmin)
            pcand.append((abs(t_ - .55)*40 + (b_ - a_), y, a_, b_))
    _, py, pa, pb = min(pcand)
    for o in (-1, 0, 1):
        for xx in range(pa, pb+1):
            if cls[py+o, xx] == 4: cls[py+o, xx] = 0
    # 10) doğuş noktası: ilk biyomun kıyısı, çevresinde bol kara
    b0 = bio == 0
    cnt = ndi.uniform_filter(b0.astype(float), size=81)
    cand = np.argwhere(b0 & (docean >= 5) & (docean <= 7) & (cls == 0))
    sc = [cnt[tuple(c)] for c in cand]
    sp = cand[int(np.argmax(sc))]
    # 11) yer işaretleri (ACT 1 kişileri ve buluntular eskiden ızgara kesirleriyle duruyordu)
    A = {}
    for name, b, u, v in [('witch', 0, .82, .5), ('farm', 1, .3, .5), ('usta', 1, .62, .55), ('defter', 1, .8, .3), ('defter2', 1, .7, .5),
                          ('metal', 2, .55, .7), ('harita', 4, .5, .5), ('kristal', 5, .55, .6), ('kristal2', 5, .4, .4),
                          ('market', 0, .5, .72), ('smith', 0, .42, .28), ('carp', 0, .62, .42), ('bilezik', 0, .35, .8), ('bilezik2', 0, .45, .7),
                          ('cave0', 0, .3, .5), ('cave1', 1, .5, .5)]:
        y, x = anchor(b, u, v, 14, 12); A[name] = [int(x), int(y)]
    # keşif sayacının paydası: kara + kıyıdan 7 karo içi deniz
    visn = int((docean_full := ndi.distance_transform_edt(~mask) <= 7).sum())
    return dict(isle=isle, W=W, H=H, cls=cls, bio=bioF, mask=mask, bridges=bridges, pas=[int(py), pa, pb],
                sp=[int(sp[1]), int(sp[0])], A=A, lakes=lakes, visn=visn)

def encode(R):
    v = (R['cls'].astype(np.uint16) * 8 + R['bio'].astype(np.uint16)).ravel()
    assert v.max() < 256
    out = bytearray(); i = 0; n = len(v)
    ch = np.where(np.diff(v) != 0)[0] + 1; starts = np.concatenate([[0], ch]); ends = np.concatenate([ch, [n]])
    for s, e in zip(starts, ends):
        L = int(e - s); val = int(v[s])
        while L > 0:
            k = min(L, 255); out += bytes([val, k]); L -= k
    return base64.b64encode(bytes(out)).decode()

def preview(R, path):
    COL = [(126,200,80),(52,140,66),(232,196,104),(196,118,58),(176,196,222),(128,88,168)]
    cls, bio = R['cls'], R['bio']; H, W = cls.shape
    img = np.zeros((H, W, 3), np.uint8)
    for b in range(6): img[bio == b] = COL[b]
    img[cls == 1] = (236, 220, 160); img[cls == 2] = (60, 150, 220); img[cls == 5] = (30, 90, 170)
    img[cls == 4] = (90, 82, 74); img[cls == 3] = (36, 70, 130)
    for y, a, b in R['bridges']:
        img[y-1:y+2, a:b+1] = (176, 122, 68)
    y, a, b = R['pas']; img[y-1:y+2, a:b+1] = (230, 60, 60)
    x, y = R['sp']; img[y-3:y+4, x-3:x+4] = (255, 255, 255)
    for nme, (x, y) in R['A'].items(): img[y-2:y+3, x-2:x+3] = (255, 0, 255)
    Image.fromarray(img).save(path)

if __name__ == '__main__':
    res = {}
    for isle in (1, 2):
        R = build(isle)
        cnt = [int(((R['bio'] == b) & R['mask']).sum()) for b in range(6)]
        adj = set()
        b_ = np.where(R['mask'], R['bio'], -1)
        for dy, dx in ((0, 1), (1, 0)):
            a1 = b_[:b_.shape[0]-dy, :b_.shape[1]-dx]; a2 = b_[dy:, dx:]
            m = (a1 >= 0) & (a2 >= 0) & (a1 != a2)
            adj |= set(map(tuple, np.sort(np.stack([a1[m], a2[m]], 1), 1).tolist()))
        print(' W,H', R['W'], R['H'], 'biyom', cnt, 'komşu', sorted(adj), 'köprü', R['bridges'], 'geçit', R['pas'], 'doğuş', R['sp'])
        preview(R, os.path.join(OUT, f'ada{isle}.png'))
        res[isle] = dict(W=R['W'], H=R['H'], rle=encode(R), br=R['bridges'], ps=R['pas'], sp=R['sp'], an=R['A'], vn=R['visn'])
    js = 'window.__plMAPS=' + json.dumps(res, separators=(',', ':')) + ';'
    open(os.path.join(OUT, 'adalar.js'), 'w').write(js)
    print('adalar.js', len(js), 'bayt')
