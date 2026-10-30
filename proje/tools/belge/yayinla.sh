#!/bin/bash
# Tasarım belgesini yeniden üretip indirilebilir hallerini günceller (depo kökünden çalıştır: bash proje/tools/belge/yayinla.sh)
set -e
D=proje/tools/belge
python3 $D/build.py
cp $D/TASARIM.md proje/Hammadde_tasarim_belgesi.md
{ printf '<!doctype html>\n<html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'; cat $D/tasarim.html; printf '\n</html>\n'; } > proje/Purple_Light_belgeler.html
cp proje/Purple_Light_belgeler.html belge.html
cp proje/Hammadde_tasarim_belgesi.md belge.md
node $D/pdf.js
python3 proje/tools/notlar/notlar.py
node proje/tools/notlar/pdf.js
echo "Hazır: belge.html, belge.pdf, belge.md, GUNCELLEME_NOTLARI.html/.pdf (+ proje/ kopyaları). Commit + push sonrası: https://bogacavdar.github.io/purple-light/belge.html · /belge.pdf · /belge.md"
