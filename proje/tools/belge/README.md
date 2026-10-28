# Tasarım belgesi araçları

- `parts/*.md`: belgenin elle yazılan bölümleri (sırayla birleşir). `{{inc:gen/…}}` satırları üretilen tabloları içeri alır.
- `x/probe.js`: oyunu Playwright ile açıp `x/q*.js` ifadelerini oyunun kapsamında çalıştırır (`node x/probe.js x/q3.js 1` → ACT 1, `2` → ACT 2). Çıktılar `x/*.json`.
  Yollar `/home/claude/purple-light/proje/Hammadde_prototip.html` olarak yazılı; başka yerde çalıştırırsan `probe.js`'teki yolu değiştir.
- `x/gen.py`: JSON'lardan `gen/*.md` tablolarını üretir (biyomlar, tarifler, eşya dizini, görevler, Reisler…).
- `build.py`: `parts` + `gen` → `TASARIM.md` ve `tasarim.html` (şablon: `template.html`). Sonra
  `TASARIM.md` → `proje/Hammadde_tasarim_belgesi.md`, `tasarim.html` (doctype ile sarılarak) → `proje/Purple_Light_belgeler.html` kopyalanır.
- Oyunda veri (tarif, canavar, görev…) değişince: önce `parts`'taki ilgili metni ve/veya veriyi güncelle, `probe` → `gen.py` → `build.py`, sonra kodu değiştir (CLAUDE.md'deki "önce belge" kuralı).
