#!/bin/bash
# Tasarım belgesini yeniden üretip indirilebilir hallerini günceller (depo kökünden çalıştır: bash proje/tools/belge/yayinla.sh)
set -e
D=proje/tools/belge
# belgenin başındaki sürüm satırı her yayında oyunun sürüm etiketinden yazılır (elle güncellenmez, eskimesin)
python3 - <<'PY'
import re,datetime
v=re.search(r'Versiyon (\d+\.\d+)',open('proje/Hammadde_prototip.html',encoding='utf-8').read()).group(1)
ay=['Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık']
d=datetime.date.today();tarih=f"{d.day} {ay[d.month-1]} {d.year}"
p='proje/tools/belge/parts/00_giris.md';t=open(p,encoding='utf-8').read()
t=re.sub(r'(?m)^Sürüm: .*$',f"Sürüm: **Versiyon {v}** ile birebir ({tarih}). Bu sürümün ve önceki sürümlerin değişiklikleri: [Güncelleme notları](https://bogacavdar.github.io/purple-light/GUNCELLEME_NOTLARI.html).",t,count=1)
open(p,'w',encoding='utf-8').write(t)
PY
python3 $D/build.py
cp $D/TASARIM.md proje/Hammadde_tasarim_belgesi.md
{ printf '<!doctype html>\n<html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'; cat $D/tasarim.html; printf '\n</html>\n'; } > proje/Purple_Light_belgeler.html
cp proje/Purple_Light_belgeler.html belge.html
cp proje/Hammadde_tasarim_belgesi.md belge.md
node $D/pdf.js
python3 proje/tools/notlar/notlar.py
node proje/tools/notlar/pdf.js
echo "Hazır: belge.html, belge.pdf, belge.md, GUNCELLEME_NOTLARI.html/.pdf (+ proje/ kopyaları). Commit + push sonrası: https://bogacavdar.github.io/purple-light/belge.html · /belge.pdf · /belge.md"
