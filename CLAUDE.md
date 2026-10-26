# Purple Light — Claude için çalışma kuralları

- Oyun tek dosya: geliştirme kopyası `proje/Hammadde_prototip.html`, yayındaki kopyası kökteki `index.html` (aynı dosya + 11. satırdan sonra manifest, apple-touch-icon ve service worker kaydı satırları). `sw.js` oyunun uygulama olarak yüklenmesini ve internetsiz açılmasını sağlar; `index.html` güncellenince dokunma, sayfa önce ağdan alınır.
- **Çalışma düzeni (26 Ekim 2026, Boğaç'ın kararı):** önce geliştir, yalnızca hızlı kontrol yap (chk.js 0 hata, `tests/v48_bugs.js` ve `tests/v48_ui.js` ALL OK, oyun açılıyor), hemen `main`'e gönder; Boğaç paralelde kendi testlerini yapar. Kapsamlı test turu yayından sonra gelir; kritik hata çıkarsa hemen düzeltme sürümü.
- **Test yok (26 Ekim 2026, Boğaç):** ajanlar test yapmaz (Playwright, ekran görüntüsü, test paketleri çalıştırılmaz); yalnızca `chk.js` sözdizimi kontrolü. Testi Boğaç yapar. Boğaç açıkça test isterse o zaman test yapılır. Küçük işler ajan açmadan doğrudan yapılır; ajan yalnızca büyük işlerde ve tek tek.
- **Her güncellemede bu depo da güncellenir.** Sıra: oyunu değiştir → test et (`proje/tests/`) → claude.ai artifact'ını yayınla (https://claude.ai/artifact/ApSQG1LVugQT7M7jbEfoJV) → `index.html` ve `proje/` dosyalarını bu depoda güncelle → Türkçe, sürüm numaralı commit → `git push` (dal `main`).
- **Sürüm etiketi:** ana menüdeki `<small id="verlab">Versiyon NN</small>` her sürümde commit numarasıyla aynı yapılır (Boğaç deploy'un geldiğini buradan anlar).
- Ayrıntılı geçmiş ve teknik notlar: `proje/DEVAM_NOTU.md` (her sürümde güncellenir).
- Kod kuralları: `?.` ve `??` yok (`nn(a,b)` kullan), ES2018 kontrolü `proje/tests/chk.js`.
- Oyun adresi: https://bogacavdar.github.io/purple-light/
