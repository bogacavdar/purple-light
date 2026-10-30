// GUNCELLEME_NOTLARI.html → GUNCELLEME_NOTLARI.pdf (depo kökünden: node proje/tools/notlar/pdf.js)
const {chromium}=require('playwright');const path=require('path');(async()=>{const b=await chromium.launch();const p=await b.newPage();
await p.goto('file://'+path.resolve('GUNCELLEME_NOTLARI.html'));await p.waitForTimeout(300);
await p.pdf({path:path.resolve('GUNCELLEME_NOTLARI.pdf'),format:'A4',printBackground:true,margin:{top:'14mm',bottom:'14mm',left:'12mm',right:'12mm'},displayHeaderFooter:true,headerTemplate:'<div></div>',footerTemplate:'<div style="font-size:8px;width:100%;text-align:center;color:#666">Purple Light · Güncelleme notları · <span class="pageNumber"></span>/<span class="totalPages"></span></div>'});
await b.close();console.log('GUNCELLEME_NOTLARI.pdf hazır')})();
