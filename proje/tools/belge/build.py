#!/usr/bin/env python3
"""parts/*.md + gen/*.md → TASARIM.md (depo için) ve tasarim.html (artifact)."""
import os, re, glob, html, markdown
D = os.path.dirname(os.path.abspath(__file__))

def inc(m):
    p = os.path.join(D, m.group(1))
    return open(p).read() if os.path.exists(p) else '*(eksik: %s)*' % m.group(1)
parts = sorted(glob.glob(os.path.join(D, 'parts', '*.md')))
src = '\n\n'.join(open(p).read() for p in parts)
src = re.sub(r'\{\{inc:([^}]+)\}\}', inc, src)
open(os.path.join(D, 'TASARIM.md'), 'w').write(src)

md = markdown.Markdown(extensions=['tables', 'toc', 'sane_lists'], extension_configs={'toc': {'toc_depth': '1-2', 'slugify': lambda v, s: re.sub(r'[^a-z0-9]+', '-', v.lower().translate(str.maketrans('çğıöşüâîû', 'cgiosuaiu'))).strip('-')}})
body = md.convert(src)
toc = md.toc_tokens

# her tabloyu kaydırılabilir kaba al; 12 satırdan uzun tablolara süzgeç ekle
n = [0]
def wrap(m):
    t = m.group(0); rows = t.count('<tr>') - 1; n[0] += 1
    f = ''
    if rows > 12:
        f = '<div class="filt"><label for="f%d">Bu tabloda ara</label><input id="f%d" type="search" placeholder="ör. kerevit, odun, Bataklık…" data-t="t%d" autocomplete="off"><span class="cnt" id="c%d">%d satır</span></div>' % (n[0], n[0], n[0], n[0], rows)
    return f + '<div class="tw" id="t%d">' % n[0] + t + '</div>'
body = re.sub(r'<table>.*?</table>', wrap, body, flags=re.S)

def toc_html(toks):
    o = []
    for t in toks:
        o.append('<li class="h1"><a href="#%s">%s</a>' % (t['id'], t['name']))
        if t['children']:
            o.append('<ul>' + ''.join('<li><a href="#%s">%s</a></li>' % (c['id'], c['name']) for c in t['children']) + '</ul>')
        o.append('</li>')
    return '<ul>' + ''.join(o) + '</ul>'

PAGE = open(os.path.join(D, 'template.html')).read()
out = PAGE.replace('{{TOC}}', toc_html(toc)).replace('{{BODY}}', body)
open(os.path.join(D, 'tasarim.html'), 'w').write(out)
print('md', len(src), 'html', len(out), 'tables', n[0])
