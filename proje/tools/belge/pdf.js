const {chromium}=require('playwright');(async()=>{const b=await chromium.launch();const p=await b.newPage();
await p.goto('file://'+require('path').resolve('belge')+'.html');await p.waitForTimeout(1000);
await p.addStyleTag({content:'nav.toc,.mtoc,.filt,.gs{display:none!important}.layout{display:block!important}.tw{overflow:visible!important}table{font-size:9px!important}td,th{padding:3px 5px!important}th{position:static!important}body{font-size:11px!important}'});
await p.pdf({path:''+require('path').resolve('belge')+'.pdf',format:'A4',landscape:true,printBackground:true,margin:{top:'12mm',bottom:'12mm',left:'10mm',right:'10mm'},displayHeaderFooter:true,headerTemplate:'<div></div>',footerTemplate:'<div style="font-size:8px;width:100%;text-align:center;color:#666">Purple Light · Tasarım belgesi · <span class="pageNumber"></span>/<span class="totalPages"></span></div>'});
await b.close()})();
