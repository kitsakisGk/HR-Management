

function MM_preloadImages() {

  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
  var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
  if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}

}

function MM_openBrWindow(theURL,winName,features) { 

  window.open(theURL,winName,features);

}
  

  var scrlStr="welcome to my homepage"
  var width=140;
  var strLen=scrlStr.length;
  var pos=1-width; 
 

  function scroll() 

  {   

  	var scroll = "";    

	pos++; 

	if(pos == strLen) pos =1 - width;  

		if(pos<0)   

		{       
			for(var i=1;      i<=Math.abs(pos);      i++)
			scroll=scroll+" ";      
			scroll=scroll+scrlStr.substring(0,width-i+1); 
		}   

		else    

			scroll=scroll+scrlStr.substring(pos,pos+width); 
			window.status=scroll; setTimeout("scroll()",50); 
}



function MM_swapImgRestore() {

  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;

}

function MM_displayStatusMsg(msgStr) {

  status=msgStr;
  document.MM_returnValue = true;

}

function MM_findObj(n, d) {

  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
  d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;

}

function MM_swapImage() {

  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}

}
