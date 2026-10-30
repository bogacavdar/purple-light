"""GUNCELLEME_NOTLARI.md → GUNCELLEME_NOTLARI.html (telefonda ve PC'de okunur, internetsiz açılır). Depo kökünden: python3 proje/tools/notlar/notlar.py"""
import markdown, html
import re
src = open('GUNCELLEME_NOTLARI.md', encoding='utf-8').read()
# section labels alone on a line ("**Oynanış**") become small headings; every list gets the blank line Markdown needs before it
lines, out_l = src.split('\n'), []
for ln in lines:
    m = re.fullmatch(r'\*\*([^*]+)\*\*\s*', ln)
    if m:
        out_l += ['', '#### ' + m.group(1), '']
        continue
    if re.match(r'\s*- ', ln) and out_l and out_l[-1].strip() and not re.match(r'\s*- ', out_l[-1]) and not re.match(r'\s{2,}', ln):
        out_l.append('')
    out_l.append(ln)
src = '\n'.join(out_l)
body = markdown.markdown(src, extensions=['tables', 'sane_lists'], tab_length=2)
css = """
:root{--bg:#f7f3ea;--ink:#2a2418;--dim:#6a5f4c;--acc:#6a3fa0;--line:#e2d8c4;--card:#fffdf8}
@media (prefers-color-scheme:dark){:root{--bg:#16131c;--ink:#ece6f4;--dim:#a89cb8;--acc:#c49aff;--line:#332c40;--card:#1f1a28}}
*{box-sizing:border-box}html{-webkit-text-size-adjust:100%}
body{margin:0;background:var(--bg);color:var(--ink);font:16px/1.55 system-ui,-apple-system,"Segoe UI",Roboto,sans-serif}
main{max-width:820px;margin:0 auto;padding:20px 16px 60px}
h1{font-size:26px;margin:8px 0 6px;color:var(--acc)}
h2{font-size:20px;margin:34px 0 10px;padding:10px 14px;background:var(--card);border-left:5px solid var(--acc);border-radius:6px}
p,li{overflow-wrap:anywhere}strong{color:var(--ink)}a{color:var(--acc)}
ul{padding-left:22px}li{margin:4px 0}hr{border:0;border-top:1px solid var(--line);margin:22px 0}
h4{margin:16px 0 4px;color:var(--acc);text-transform:uppercase;font-size:13px;letter-spacing:.06em}
code{background:var(--card);padding:1px 5px;border-radius:4px}
@media print{body{background:#fff;color:#000;font-size:11.5px}h2{background:none;border-left:4px solid #6a3fa0;page-break-after:avoid}main{max-width:none;padding:0}}
"""
out = f"""<!doctype html>
<html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Purple Light · Güncelleme notları</title><style>{css}</style></head>
<body><main>{body}</main></body></html>
"""
open('GUNCELLEME_NOTLARI.html', 'w', encoding='utf-8').write(out)
print('GUNCELLEME_NOTLARI.html hazır')
