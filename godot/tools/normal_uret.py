# Kabartmalı ışık için ışık haritası (normal map) üretir (belge Godot › Grafik-5).
# Her resmin yanına <ad>_n.png yazar: yükseklik = kenardan uzaklıkla yuvarlak bir kubbe (hacim) + parlaklıktan ince ayrıntı;
# normal = yüksekliğin eğimi. Çerçeveli resimlerde (kahraman) her kare ayrı kubbe alır.
# Çalıştır: python3 tools/normal_uret.py art/agaclar art/dugumler art/kahraman.png:5x8
import sys, os
import numpy as np
from PIL import Image
from scipy import ndimage

def normal(rgba, kubbe=0.6, ayrinti=0.25, guc=1.0):
    a = rgba[..., 3].astype(np.float32) / 255.0
    lum = (0.3 * rgba[..., 0] + 0.59 * rgba[..., 1] + 0.11 * rgba[..., 2]).astype(np.float32) / 255.0
    ic = a > 0.5
    d = ndimage.distance_transform_edt(ic)
    m = d.max() if d.max() > 0 else 1.0
    h = np.sqrt(np.clip(d / max(3.0, m * 0.6), 0, 1)) * kubbe + ndimage.gaussian_filter(lum, 0.6) * ayrinti
    h = ndimage.gaussian_filter(h, 0.5) * ic
    gx = ndimage.sobel(h, axis=1) * guc
    gy = ndimage.sobel(h, axis=0) * guc
    n = np.dstack([-gx, gy, np.ones_like(h)])
    n /= np.linalg.norm(n, axis=2, keepdims=True)
    out = np.zeros(rgba.shape, np.uint8)
    out[..., :3] = ((n * 0.5 + 0.5) * 255).astype(np.uint8)
    out[..., :3][~ic] = (128, 128, 255)
    out[..., 3] = 255
    return out

def isle(yol, kare=None):
    im = np.array(Image.open(yol).convert('RGBA'))
    if kare:
        hf, vf = kare
        H, W = im.shape[:2]; fw, fh = W // hf, H // vf
        out = np.zeros_like(im)
        for j in range(vf):
            for i in range(hf):
                out[j*fh:(j+1)*fh, i*fw:(i+1)*fw] = normal(im[j*fh:(j+1)*fh, i*fw:(i+1)*fw])
    else:
        out = normal(im)
    Image.fromarray(out).save(yol[:-4] + '_n.png')

n = 0
for arg in sys.argv[1:]:
    kare = None
    if ':' in arg:
        arg, k = arg.split(':'); kare = tuple(int(x) for x in k.split('x'))
    if os.path.isdir(arg):
        for f in sorted(os.listdir(arg)):
            if f.endswith('.png') and not f.endswith('_n.png'): isle(os.path.join(arg, f)); n += 1
    else:
        isle(arg, kare); n += 1
print(n, 'ışık haritası')
