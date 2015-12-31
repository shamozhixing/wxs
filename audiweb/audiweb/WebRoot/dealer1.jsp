<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7 ]> <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8 ]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if IE 9 ]> <html class="no-js ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="zh">
<!--<![endif]-->
	<meta charset='utf-8'>
	<title>查询经销商</title>
<head>
<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/css.css" type="text/css">

<!--[if IE ]>
	<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/ie.css" rel="stylesheet" />
<![endif]-->

<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/hotfix.css" rel="stylesheet"/>
<link href="http://www.audi.de/cms4i/cms4i/css/print.css" media="print" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i-models/docroot/cms4i-models.css" type="text/css">
<%@include file="common_css_js.jsp"%>
<script type="text/javascript" src="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/js/libs.js"></script>
<script src="js/Ajax.js"></script>

<script type="text/javascript" src="swfobject/swfobject.js"></script>
<script type="text/javascript">
			var flashvars = {};
			var params = {};
			params.allowscriptaccess = "always";
			params.allownetworking = "all";
			params.wmode="transparent";
			var attributes = {};
			attributes.id = "AgencyMap";
			swfobject.embedSWF("AgencyMap.swf", "swf", "626", "571", "9.0.0", false, flashvars, params, attributes);
</script>
</head>
<body class="DE de" data-country="DE" data-lang="de">
<%@include file="common_tackingcode.jsp"%>	
<%@include file="common_navigation.jsp"%>

   	<ul class="horizontalNav left breadcrumbs">
   	    <li>
        	<a href="/content/cn/brand/zh.html">首页</a>
        	<span class="w_divider"></span>
        </li>
   		<li><a href="homepage.action">联系奥迪</a><span class="w_divider"></span></li>
        <li>查询经销商</li>
	</ul>
	
	 <%@include file="common_heard.jsp"%>
	
<div class="container">
    <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;">
        <jsp:include page="common_login.jsp"></jsp:include>
        <div class="page_title">查询经销商</div>
        <div class='takepage_con'>
            <div class='takepage'>
            	<div class="sub_menu deal">
                	<span class="sub_menu_commu_1"></span>
                    <span class="sub_menu_commu_2"></span>
                    <span class="sub_menu_commu_3"></span>
                   
                </div>
                <!-- <div class='takepage1'><img src="images/chaxun_01.jpg"></div>
                <div class='takepage2'><img src="images/chaxun_02.jpg"></div>
                <div class='takepage3'><img src="images/chaxun_03.jpg"></div> -->
            </div>
        </div>

        <div class='chaxun_con'>
			<div class='chaxun_left'>
				<p class='chaxun_title'>查找附近的奥迪特许经销商</p>
				<div class='chaxun_list'>
				<form action="dealer_seljxs.action" name="form1" id="form1" method="post">
					<table>
						<tr>
							<input type="hidden" name="fwid" id="fwid" value="0"/>
							<input type="hidden" name="fwids" id="fwids" value="<s:property value="sid" />"/>
							<input type="hidden" name="pidids" id="pidids" value=""/>
							<td width="68">经销商类别</td>
							<td>
								        <fieldset class="longlabels frm" style=" width:182px">
	                                        <select name="fw" id="fw" onChange="ppro(this.options[this.options.selectedIndex].value)" style="opacity: 0.0001; z-index: 2;">
	                                            <option value="0" <s:if test='sid.equals("0")' >selected</s:if> >经销商</option>
												<OPTION value="1" <%if(session.getAttribute("lbid01").toString().equals("1")){out.print("selected");} %> >二手车经销商</option>
												<OPTION value="2" <%if(session.getAttribute("lbid01").toString().equals("2")){out.print("selected");} %> >24小时救援</option>
	                                         </select>
	                                    </fieldset>
	       
							</td>
						</tr>
						<tr>
							<td>请选择省份</td>
							<td>
								        <fieldset class="longlabels frm" style=" width:182px">
	                                        <select name="pid" id="pid" onChange="ccity2(this.options[this.options.selectedIndex].value)" class="select" style="opacity: 0.0001; z-index: 2;">
	                                           <OPTION value="">请选择 </OPTION>
	                                            <%
							List ls1=  (List)session.getAttribute("prostr1");
							for(int i=0;i<ls1.size();i++){
							String []q= (String[]) ls1.get(i);
							 %>
								<OPTION value="<%=q[0] %>" >
								<%=q[1] %>
								</OPTION>
							
							 <%} %>
	                                            </select>
	                                    </fieldset>
	                       </td>
						</tr>
						<tr>
							<td>请选择城市</td>
							<td>
								        <fieldset class="longlabels frm" style=" width:182px">
	                                        <select name="cid" id="cid" class="select" style="opacity: 0.0001; z-index: 2;">
	                                            <option value="">请选择   </option>
	                                            </select>
	                                    </fieldset>
	                        </td>
						</tr>
					</table>
				</form>	
				</div>
				<span class='sousuo js_sousuo'></span>
				<!--<span class="wrong" id="sousuo1_wrong" display:block></span>  -->
			</div>
			<div class='chaxun_right' style="background:none" >
				
                <div style='width:626;height:571;margin: 0 auto;overflow:hidden' id="swf">
                	
                </div>
                
			</div>
        </div>
        
      </div>
    </div>
   <%@include file="common_foot.jsp"%>
<%@include file="common_login_div.jsp"%>
<script type="text/javascript" src="js/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" />


	<script type="text/javascript">
	var wrongBackground="url('images/baocuo.jpg')";//报错图片被屏蔽了，需要重新加载
	//$("#sousuo_wrong").css("background-image",wrongBackground);
	//$("#sousuo_wrong").show();
	//$("#sousuo_wrong").css('padding','10px 0');// padding:10px 0
		$(function(){
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			$('input.myClass').Checkable({
				color: 'blue'
			});
			$('.takepage div').eq(0).show().siblings().hide();
			$(".js_sousuo").on("click",function(){
				
				if($("#pid").val()==""){
					//$("#sousuo1_wrong").css("background-image",wrongBackground);
					//$("#sousuo1_wrong").html('请选择省份');
					//$("#sousuo1_wrong").show();
					window.alert("请选择省份");
				} else {
					document.getElementById("form1").submit();
				}				
			});
			
			/*function showpage(i){
				
				$(".deal").css("background-image","url(images/chaxun_banner"+(i+1)+".jpg)")
			}
			showpage(0); */
			$(".deal").css("background-image","url(images/chaxun_banner1.jpg)")
		});
	</script>

<script type="text/javascript">
function flashMovie(movieName)
{
	if(window.document[movieName])
	{
		return window.document[movieName];
	}
	else
	{
		return document.getElementById(movieName);	
	}
				
}
 function changeProvince(province){
 	document.getElementById("pid").value=province;
 	var text=$("#pid").find("option[value='"+province+"']").html();
 	
 	$('#pid').siblings('.caption').text(text);
 	
 	ccity1(province);
 }
   function selectCity(city){
 	document.getElementById("cid").value=city;
 	var text=$("#cid").find("option[value='"+city+"']").html();
 	
 	$('#cid').siblings('.caption').text(text);
 	
 	post1();
 }
 
 function post1(){
 	if(document.getElementById("pid").value==""){
 		window.alert("请选择省份");
 		return;
 	}
 	document.form1.submit();
 }
  
  var xhrs;
  function ppro(id){
  		$('#pid').siblings('.caption').text('请选择');
  		$('#cid').siblings('.caption').text('请选择');
 		if(id!=""){	
 			if(flashMovie("AgencyMap").ready()!="1"){
 		 		$('.loading').show();
 		 		document.getElementById("fw").value=document.getElementById("fwids").value;
 		 		return;	
 		 	}
		  document.getElementById("pid").options.length=0;
		  document.getElementById("cid").options.length=0;
		  document.getElementById("pidids").value="";
		  document.getElementById("fwid").value=id;
	      xhrs = createXHR();
		  xhrs.open("post","dealer_pross.action?lbids="+id);
	       xhrs.onreadystatechange = callbackcity1;
		   xhrs.send(null); 
		   
		   //在这里是JS调用AS
 		 flashMovie("AgencyMap").changeAgency(id);	
 		 document.getElementById("fwids").value=id;	
 		}
		else{
		  document.getElementById("pid").options.length=0;
		  document.getElementById("cid").options.length=0;
		  var option = document.createElement("OPTION");
		  option.text="请选择";
	      option.value="";
	      document.getElementById("pid").options.add(option);
		 }		
	}
  function callbackcity1(){
	if (xhrs.readyState == 4) {
		  if (xhrs.status == 200){
			  fillcity1(xhrs.responseText);}
	  }else{
		  document.getElementById("pid").options.length=0;	
		  document.getElementById("cid").options.length=0;
	  }
			 
	}
	function fillcity1(xmldoc){
		var citylist =  xmldoc.split("#");
		addpro("","请选择"); 
		for(var i=0;i<citylist.length;i++){
			if(citylist[i]){
				var city=citylist[i].split(",");	
			    addpro(city[0],city[1]);
			}
		}
		$('.loading').hide();
	}
   function addpro(id,name){
		var option = document.createElement("OPTION");
		option.text=name;
		option.value=id;
		document.getElementById("pid").options.add(option);
   }
  
  var xhr;
 	function ccity2(id){
 		$('#cid').siblings('.caption').text('请选择');
 		if(id!=""){
 		  	if(flashMovie("AgencyMap").ready()!="1"){
 		 		$('.loading').show();
 		 		document.getElementById("pid").value=document.getElementById("pidids").value;
 		 		if(document.getElementById("pidids").value==""){
 		 			document.getElementById("pid").options[0].selected=true; 
 		 		}
 		 		return;
 		 	} 
		  document.getElementById("cid").options.length=1;
	      xhr = createXHR();
		  xhr.open("post","dealer_ctiys.action?pid="+id+"&lbids="+document.getElementById("fwid").value);
	       xhr.onreadystatechange = callbackcity2;
		   xhr.send(null); 
		    	
		   //在这里是JS调用AS	 	
 	     flashMovie("AgencyMap").changeProvince(id);
 	     document.getElementById("pidids").value=id;		
 		}
		else{
		  document.getElementById("cid").options.length=0;
		  var option = document.createElement("OPTION");
		  option.text="请选择";
	      option.value="";
	      document.getElementById("cid").options.add(option);
		 }		
	}
	function ccity1(id){
 		if(id!=""){
 		  	 
		  document.getElementById("cid").options.length=0;
	      xhr = createXHR();
		  xhr.open("post","dealer_ctiys.action?pid="+id+"&lbids="+document.getElementById("fwid").value);
	       xhr.onreadystatechange = callbackcity2;
		   xhr.send(null); 	
		   document.getElementById("pidids").value=id;
		   $('.loading').hide();
 		}
		else{
		  document.getElementById("cid").options.length=0;
		  var option = document.createElement("OPTION");
		  option.text="请选择";
	      option.value="";
	      document.getElementById("cid").options.add(option);
		 }		
	}
	
	function callbackcity2(){
	 if (xhr.readyState == 4) {
			  if (xhr.status == 200){
			       fillcity2(xhr.responseText);}
			  }else{
			   	   document.getElementById("cid").options.length=0;	
			  }
			 
	}
	function fillcity2(xmldoc){
		var citylist =  xmldoc.split("#");
		document.getElementById("cid").options.length=0;
		var pidids=document.getElementById("pid").value
		//if(pidids!='81'&pidids!='488'&pidids!='489'&pidids!='490'){	
			addcity("","请选择");  
		//}  
		for(var i=0;i<citylist.length;i++){
			if(citylist[i]){
				var city=citylist[i].split(",");	
			    addcity(city[0],city[1]);
			}
		}
		$('.loading').hide();
	}
   function addcity(id,name){
		var option = document.createElement("OPTION");
		option.text=name;
		option.value=id;
		document.getElementById("cid").options.add(option);
   }	
   
   
</script>
</body>
</html>