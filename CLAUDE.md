# Purple Light — Claude için çalışma kuralları

- Oyun tek dosya: geliştirme kopyası `proje/Hammadde_prototip.html`, yayındaki kopyası kökteki `index.html` (aynı dosya + 11. satırdan sonra manifest, apple-touch-icon ve service worker kaydı satırları). `sw.js` oyunun uygulama olarak yüklenmesini ve internetsiz açılmasını sağlar; `index.html` güncellenince dokunma, sayfa önce ağdan alınır.
- **Her güncellemede bu depo da güncellenir.** Sıra: oyunu değiştir → test et (`proje/tests/`) → claude.ai artifact'ını yayınla (https://claude.ai/artifact/ApSQG1LVugQT7M7jbEfoJV) → `index.html` ve `proje/` dosyalarını bu depoda güncelle → Türkçe, sürüm numaralı commit → `git push` (dal `main`).
- Ayrıntılı geçmiş ve teknik notlar: `proje/DEVAM_NOTU.md` (her sürümde güncellenir).
- Kod kuralları: `?.` ve `??` yok (`nn(a,b)` kullan), ES2018 kontrolü `proje/tests/chk.js`.
- Oyun adresi: https://bogacavdar.github.io/purple-light/
