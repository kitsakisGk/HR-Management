// JScript File

//<iframe id='ifrmPrint' src='#' style="width: 0px; height: 0px;"></iframe>

function Print(){
try{ 
var oIframe = document.getElementById('ifrmPrint');
var oContent = document.getElementById('divToPrint').innerHTML;
var oDoc = (oIframe.contentWindow || oIframe.contentDocument);
if (oDoc.document) oDoc = oDoc.document;
oDoc.write("<html><head><title>ΑΠΟΓΡΑΦΙΚΟ ΠΕΛΑΤΗ</title>");
oDoc.write("<link href='Styles/Styles_Print.css' rel='stylesheet' type='text/css' />");
oDoc.write("</head><body onload='this.focus(); this.print();'>");
oDoc.write(oContent + "</body></html>"); 
oDoc.close(); 
}
catch(e){
self.print();
}
}


function printPartOfPage(elementId)
{
 var printContent = document.getElementById(elementId);
 var windowUrl = 'about:blank';
 var uniqueName = new Date();
 var windowName = 'Print' + uniqueName.getTime(); 
 var printWindow = window.open(windowUrl, windowName, 'left=0,top=0,width=0,height=0');

 printWindow.document.write(printContent.innerHTML);
 printWindow.document.close();
 printWindow.focus();
 printWindow.print();
 printWindow.close();
}

function PrintPagia(){
try{ 
var oIframe = document.getElementById('ifrmPrintPagia');
var oContent = document.getElementById('divToPrintPagia').innerHTML;
var oDoc = (oIframe.contentWindow || oIframe.contentDocument);
if (oDoc.document) oDoc = oDoc.document;
oDoc.write("<html><head><title></title>");
oDoc.write("<link href='Styles/Styles_Print.css' rel='stylesheet' type='text/css' />");
oDoc.write("</head><body onload='this.focus(); this.print();'>");
oDoc.write(oContent + "</body></html>"); 
oDoc.close(); 
}
catch(e){
self.print();
}
}