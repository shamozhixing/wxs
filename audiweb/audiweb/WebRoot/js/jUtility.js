//-------------------------------------------------------
//�����ܣ���ѡ���Ƿ�ѡ��
//-------------------------------------------------------
function isChecked(elm)	{
	if (elm.length > 0){
		for (i = 0;  i < elm.length;  i++)	{
			if (elm[i].checked)
				return true;
		}
	}else{
		if (elm.checked)
			return true;
	}
	return false;
}
//-------------------------------------------------------
//�����ܣ���ѡ��ѡ����Ŀ
//-------------------------------------------------------
function checkNums(elm)	{
	var nums = 0;
	if (elm.length > 0){
		for (i = 0;  i < elm.length;  i++)	{
			if (elm[i].checked)
				nums++;
		}
	}else{
		if (elm.checked)
			nums++;
	}
	return nums;
}
//-------------------------------------------------------
//�����ܣ���ѡ��ѡ��ֵ
//-------------------------------------------------------
function checkValue(elm)	{
	var str = "";
	if (elm.length > 0){
		for (i = 0;  i < elm.length;  i++)	{
			if (elm[i].checked){
				if(str=="")
					str = elm[i].value;
				else{
					str += ","+elm[i].value;
				}
			}
		}
	}else{
		if (elm.checked)
			str = elm.value;
	}
	return str;
}
//-------------------------------------------------------
//�����ܣ��ж��Ƿ�ΪEmail
//-------------------------------------------------------
function isEMail(elm) {
    var strelm = elm.value;
	var intelm;
	var strreg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;	
	intelm = strelm.search(strreg);
	if(intelm == -1){
		intelm = false;
	}
	else{
		intelm = true;
	}
	return intelm;
}
//-------------------------------------------------------
//�����ܣ��ж��Ƿ�Ϊ��
//-------------------------------------------------------
function isFilled(elm)	{
	if (isAllSpace(elm.value) || elm.value==null) 
		return false;
	else 
		return true;
}
function isAllSpace(elm) {
	for (i = 0;  i < elm.length;  i++) {
		if (elm.charAt(i)!=" ")
			return false;
	}
	return true;
}
//-------------------------------------------------------
//����˵�����ж�һ���ַ�ĳ���
//-------------------------------------------------------
function strLen(str)
{
  var value = escape(str);
  var len=0;
  for(i=0;i<value.length;i++){
    var ch=value.charAt(i);
    if(ch=='%'){
      if( value.charAt(i+1)=='u' ){
        var is_kana = false ;
        if(value.charAt(i+2)=='F' && value.charAt(i+3)=='F'){
          var cd = parseInt(value.charAt(i+4).toString()+value.charAt(i+5).toString(),16);
          if( 0x61 <= cd && cd <= 0x9F )
            is_kana = true ;
        }
        i+=5;
        len++;
        if( is_kana )
          continue;
      }else
        i+=2;
    }
    len++;
  }
  return len;
}
//-------------------------------------------------------
//�ж��Ƿ�Ϊ�����ַ�
//-------------------------------------------------------
function ChinaStr(str){
    var flag;
    var i;
    flag = false;  
    for (i=0;i<str.length;i++){
      if (str.charCodeAt(i)>255){
         flag = true;
      }
    }
    return flag;
}

//-------------------------------------------------------
//����˵�����ж��Ƿ��зǷ��ַ�
//-------------------------------------------------------
function IsSafeString(str) {
	var re = new RegExp("[<>%/\?'&]+") ;
	if(re.test(str)){
		return false;
	}
	return true;
}
//-------------------------------------------------------
//����˵�����ж��Ƿ�Ϊ��ȷ�����ڸ�ʽ��2000-02-03��
//-------------------------------------------------------
function IsDate(str) {
	if(str=="")
		return true;
	var re = new RegExp("[0-9]{4}-{1}[0-9]{2}-{1}[0-9]{2}") ;
	if(re.test(str)){
		return true;
	}
	return false;
}
//-------------------------------------------------------
//����˵�����򿪴���
//-------------------------------------------------------
function winOpen(Url,winName,width,height)
{
    ow = width;
    oh = height;
    var xposition=0; 
    var yposition=0;
    if ((parseInt(navigator.appVersion) >= 4 ))
    {
        xposition = (screen.width - width) / 2;
        yposition = (screen.height - height-25) / 2;
    }
    var popup = window.open (Url,winName,"width ="+ow+",height="+oh+",scrollbars =1,resizable=0,left="+xposition+",top="+yposition+",menubar=0,titlebar=0,status=1,center=true,dependent=false" );
    return;
}


/***
//AJAX
***/
function GetO(){
    var ajax=false; 
    try { 
    	ajax = new ActiveXObject("Msxml2.XMLHTTP"); 
    } catch (e) { 
   	 	try { 
    		ajax = new ActiveXObject("Microsoft.XMLHTTP"); 
    	} catch (E) { 
    		ajax = false; 
    	} 
    }
    if (!ajax && typeof XMLHttpRequest!='undefined') { 
    	ajax = new XMLHttpRequest(); 
    }
    return ajax;
}
// ����ID�����ı�
function setRightHTML(objID,txtErr) { 
    var obj = document.getElementById(objID); 
    obj.innerHTML = txtErr;
}
//��֤URL
function IsURL(url){
    var sTemp;
    var b=true;
    sTemp=url.substring(0,7);
     //alert(url.length);
    if ((sTemp.toLowerCase()!="http://")||(url.length<10)){
        b=false;
    }
    return b;
}
//ǰ̨��ҳ���� 
function turnpage(url,nums){
	pageform.action = url+"?pageNumber="+nums;
	pageform.submit();
	return true;
}
function jumppage(url){
	pageform.action = url+"?pageNumber="+pageform.pageNumber.value;
	pageform.submit();
	return true;
}

//ѡ��ȫ��
function selectall(str)
{
  for(x=0;x<document.forms[0].elements.length;x++){
     if(document.forms[0].elements[x].name==str) 
     	document.forms[0].elements[x].checked=document.forms[0].all.checked
  }
}


function makeArray() {
	var args=makeArray.arguments;
	for (var i = 0; i < args.length; i++) {
		this[i]=args[i];
	}
	this.length=args.length;
}

function isInt(elm)	{
	var elmstr = elm.value + "";
	for (var i = 0; i < elmstr.length; i++) {
		if (elmstr.charAt(i) < "0" || elmstr.charAt(i) > "9")
			return false;
	}
	return true;
}

function isFloat(elm) {
	var elmstr = elm.value + "";
	for (var i = 0; i < elmstr.length; i++)	{
		if (elmstr.charAt(i) < "0" || elmstr.charAt(i) > "9") {
			if (elmstr.charAt(i) != ".") return false;
		}
	}
	return true;
}

function showmore(){
	if (form1.pos.checked) {
		com1.style.display = "";
	}else{
		com1.style.display = "none";
	}
}
//�Ƿ�audi���̺�
function isAudiFoot(footnum){
	if(footnum.length!=17){
		return false;
	}
	//var re = new RegExp("[LFV,WAU,WVW]{3}[d|A|B]{1}[^]]{1}[1-8]{1}[0-9A-Z^IOQ]{2}[0-9X]{1}[0-9A-Z^IOQ]{3}[0-9]{5}") ;
	//var re = new RegExp("[LFV,WAU,WVW,TRU,WUA]{3}[1-9|A|B]{1}[0-9ABCDEFGHJKLMNPRSTUVWXYZ]{1}[1-8]{1}[0-9ABCDEFGHJKLMNPRSTUVWXYZ]{2}[0-9X]{1}[0-9ABCDEFGHJKLMNPRSTUVWXYZ]{3}[0-9]{5}") ;
	var re = new RegExp("[LFV,WAU,WVW,TRU,WUA]{3}[0-9ABCDEFGHJKLMNPRSTUVWXYZ]{2}[1-8]{1}[0-9ABCDEFGHJKLMNPRSTUVWXYZ]{2}[0-9X]{1}[0-9ABCDEFGHJKLMNPRSTUVWXYZ]{3}[0-9]{5}") ;
	if(re.test(footnum)){
		return true;
	}
	return false;
} 
//jquery set date
function setDay(obj,str_year,str_month,str_day){
	var year = $("#"+str_year).val();
	var month = $("#"+str_month).val();
	var day = 30;
	if(month == '1' || month == '3' || month == '5' || month == '7' || month == '8' || month == '10' || month == '12'){
		day = 31;
	}
	if(month == '2'){
		day = 28;
		if((year%100!=0&&year%4==0)||year%400==0){
			day = 29;
		}
	}
	var dop = eval("obj."+str_day+".options");   
	dop.length =0 ;
	for(var i=1;i<=day;i++){
		var v=i;
		dop[i-1]=new Option(v,v);
	}
}
function SetMonthDay(obj,str_year,str_month,str_day){
	var month = $("#"+str_month).val();
	if(month == '2'){
		setDay(obj,str_year,str_month,str_day);
	}
}	






