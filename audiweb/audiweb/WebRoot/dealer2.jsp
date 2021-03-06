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

<script type="text/javascript" src="http://api.map.baidu.com/api?key=3e536472f04efde48967824f3d083810&v=1.1&services=true"></script>
<script src="js/Ajax.js"></script>

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
                	<span class="sub_menu_commu_1" onclick="showpage(0);"></span>
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
				<input type="hidden" name="pidids" id="pidids" value=""/>
				<p class='chaxun_title'>查找附近的奥迪特许经销商</p>
				<div class='chaxun_list'>
				<form action="dealer_seljxs.action" name="form1" id="form1" method="post" >
				<input type="hidden" name="fwid" id="fwid" value="<s:property value="#session['lbid']" />"/>
				  <input type="hidden" name="prostrs"  value="<s:property value="#session['prostr1']" />"/>
				  <input type="hidden" name="crtys" value="<s:property value="#session['crty1']" />"/>
					<table>
						<tr>
							<td width="68">经销商类别</td>
							<td>
								        <fieldset class="longlabels frm" style=" width:182px">
	                                        <select name="fw" id="fw"  onChange="ppro(this.options[this.options.selectedIndex].value)" style="opacity: 0.0001; z-index: 2;">
	                                            <option value='0'   <s:if test='#session["lbid"].toString().equals("0")' >selected</s:if> >经销商</option>
					<OPTION value='1'  <s:if test='#session["lbid"].toString().equals("1")' >selected</s:if> >二手车经销商</option>
					<OPTION value='2'  <s:if test='#session["lbid"].toString().equals("2")' >selected</s:if> >24小时救援</option>
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
							List ls2=  (List)session.getAttribute("crty1");
							for(int i=0;i<ls1.size();i++){
							String []q= (String[]) ls1.get(i);
							 %>
								<OPTION value="<%=q[0] %>" <% if(q[0].equals(session.getAttribute("proid").toString())){out.print("selected");} %>>
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
	                                            <%
							for(int i=0;i<ls2.size();i++){
							String []q= (String[]) ls2.get(i);
							
							 %>
								<OPTION value="<%=q[0] %>"  <% if(q[0].equals(session.getAttribute("cityid").toString())){out.print("selected");} %>>
								<%=q[1] %>
								</OPTION>
							
							 <%} %>
	                                            </select>
	                                    </fieldset>
	                        </td>
						</tr>
					</table>
				</form>	
				</div>
				<span class='sousuo js_sousuo'></span>
			<!-- 	<span class="wrong" id="sousuo2_wrong" display:block></span>   -->
				<div class="js_seach_result">
					<p class='chaxun_number'>
						<span>共找到</span>
						<span class='sousuo_number'><s:property value="#session['listlj'].size()" /></span>
						<span>条搜索结果</span>
					</p>
					<div class='chaxun_lie w_scrollbar mCustomScrollbar'>  
						<div id="chaxun_one" class='chaxun_lies'>
							<s:iterator value="#session['listlj']" status="st">
							<div class='cx_ship'>
								<p class='cx_shipname'><span class="w_width"><s:if test='#st.index<9'>0</s:if><s:property value="#st.index+1"/></span>
									<a href="#" onclick="dttb('<s:property value="#st.index"/>')"><span class='z_width'><s:property value="dealername"/></a></span>
								</p>
								<ul>
									<li><span class="word_apacing19">地 址：</span><span><s:property value="address"/></span></li>
									<li><span>销售热线：</span><span><s:property value="areanum"/>-<s:property value="phone"/></span></li>
									<s:if test='url!=null&&!url.equals("")'><li><span class="word_apacing19">网 址：</span><span class="f_10" style="word-break:break-all;word-wrap:break-word;">
									<a href='#' onclick="openurl('<s:property value="url"/>')" style=""><s:property value="url"/></a>
									</span></li></s:if>
								</ul>
								<p class='cx_xq'>
									<a href="javascript:void(0);" class='fssj' dealerid='<s:property value="aid"/>'><span class="colorred"><img src="images/ld.jpg">
									 </span >发送至手机</a>
									 &nbsp;&nbsp;
									<a href="javascript:aaa(<s:property value="#st.index"/>);" class="js_detail_list"><span class="colorred"><img src="images/ld.jpg"> </span>了解详情</a>
									
								</p>
							</div>
							</s:iterator>
						</div>
						
						
					</div>
					
					
				</div>
			</div>
			<div class='chaxun_right' style="background:none">
				
                <div style="width:460px;height:0px;" id="tes"></div>	
			    <!--百度地图容器-->
	  			<div style="width:626px;height:571px" id="dituContent"></div>
                
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
		$(function(){
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			//$('.cx_shipname').css('height','35px');//经销商名有的很长，原来的高度不够
			
			$('input.myClass').Checkable({
				color: 'blue'
			});
			$('.takepage div').eq(0).show().siblings().hide();
			$(".js_sousuo").on("click",function(){
				
				if($("#pid").val()==""){
				//$("#sousuo2_wrong").css("background-image",wrongBackground);
				//$("#sousuo2_wrong").html('请选择省份');
				//$("#sousuo2_wrong").show();
					window.alert("请选择省份");
					
				} else {
					document.getElementById("form1").submit();
				}				
			});
			if($(".js_seach_result").is(":hidden")){
					$(".js_seach_result").show(function(){
						$(".mCustomScrollbar").mCustomScrollbar({
							scrollButtons:{
								enable:false
							}
						});
					});
					
				}	
			var numb_one='<s:property value="#session['listlj'].size()"/>';
			if(numb_one==1){
				$('#chaxun_one').css('margin-right','30px');
			}else{
			$('#chaxun_one').css('margin-right','0');
			}		
			$('#chaxun_one').css('word-break','break-all');		
			$('#chaxun_one').css('word-wrap','break-word');	
			$(".chaxun_xiang").hide();
			var index=0;
			$(".deal").find("span").each(function(){
				$(this).click(function(){
					index = $(this).index();
					showpage(index);					
				});
			});
			
			function showpage(i){
				if(i>1) return false;
				$(".deal").css("background-image","url(images/chaxun_banner"+(i+1)+".jpg)");
				if(i==0) location.href='dealer_procity.action';
			}
			
			showpage(1);
		});
	</script>



<%@include file='dealermobile.jsp' %>	


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
 	//$("#sousuo2_wrong").css("background-image",wrongBackground);
	//$("#sousuo2_wrong").html('请选择省份');
	//$("#sousuo2_wrong").show();
 		alert("请选择省份！");
 		return;
 	}
 	document.form1.submit();
 }
  
  var xhrs;
  function ppro(id){
  		$('#pid').siblings('.caption').text('请选择');
  		$('#cid').siblings('.caption').text('请选择');
 		if(id!=""){	
 			
		  document.getElementById("pid").options.length=0;
		  document.getElementById("cid").options.length=0;
		  document.getElementById("pidids").value="";
		  document.getElementById("fwid").value=id;
	      xhrs = createXHR();
		  xhrs.open("post","dealer_pross.action?lbids="+id);
	       xhrs.onreadystatechange = callbackcity1;
		   xhrs.send(null); 
		   
		   
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
 		  	
		  document.getElementById("cid").options.length=1;
	      xhr = createXHR();
		  xhr.open("post","dealer_ctiys.action?pid="+id+"&lbids="+document.getElementById("fwid").value);
	       xhr.onreadystatechange = callbackcity2;
		   xhr.send(null); 
		    	
		   
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
	}
   function addcity(id,name){
		var option = document.createElement("OPTION");
		option.text=name;
		option.value=id;
		document.getElementById("cid").options.add(option);
   }	
</script>


<script type="text/javascript">
var myArray=new Array()
     <%int a=0; %>
<s:iterator value="#session['listlj']" status="index">
myArray[<%=a %>]="<s:property value="province"/>"+","+"<s:property value="dealername"/>"+
","+"<s:property value="address"/>"+","+"<s:property value="url"/>"+","+"<s:property value="phone"/>"
+","+"<s:property value="dealerLongitude"/>"+","+"<s:property value="dealerDimension"/>"+","+"<s:property value="areanum"/>"+","+"<s:property value="aid"/>";

 <%a++; %>
 </s:iterator>
	
    <%a=0; %>
    var dealerLongitudes=new Array(); 

    <s:iterator value="#session['listlj']" status="index">
    
   dealerLongitudes[<%=a %>]='<s:property value="dealerLongitude"/>,<s:property value="dealerDimension"/>';
    
 <%a++; %>
 </s:iterator> 

 var Class = {
    create: function(){
    return function(){
    this.initialize.apply(this, arguments); 
    }
    }
    }
    //创建和初始化地图函数：
    
    function dttb(i){  
	var listjxs =  myArray[i].split(",");
	//alert(listjxs[1]);
	//alert(listjxs[0]+"0,"+listjxs[1]+"1,"+listjxs[2]+"2,"+listjxs[3]+"3,"+listjxs[4]+"4,"+listjxs[5]+"5,"+listjxs[6]+"6,"+listjxs[7]+"7,"+listjxs[8]);
	var opts = { 
         width : 275,
         // 信息窗口宽度 
         height: 180, 
         // 信息窗口高度 
         title : "", 
         // 信息窗口标题
         offset: new BMap.Size(0, -15) } 
          var html = "<div style=\"background:#fff;font-family:Arial, Helvetica, sans-serif; margin:20px auto;\"><div style=\"float:left;padding-top:4px\"><img src=\"baidu_ico/baidu_ico_"+(parseInt(i)+1)+".jpg\"></div>" ;
         html += "<div style=\"margin-left:36px;line-height:1.8em;\">";
         html += " <strong>" + listjxs[1] + "</strong><br/>"; 
         html += " <span style=\"width:65px; word-spacing:19px; display:inline-block;\">地 址： </span>" + listjxs[2] + " <br/>"; 
         html += " <span>销售热线：</span> "+listjxs[7]+"-" +listjxs[4] + " <br/>"; 
         html += " <p style=\"padding:10px 0;\">";
         html += "<a href=\"javascript:void(0);\" onclick=\"opensenddealer("+listjxs[8]+")\"> <span style=\"font-family:'宋体'; font-weight:bold;color:#cc0033;margin-right:4px\">></span>发送至手机</a>";
         html +="&nbsp;&nbsp;&nbsp;"
         html += "<a href='javascript:aaa("+i+");' style=\"padding-right: 10px;\"> <span style=\"font-family:'宋体'; font-weight:bold;color:#cc0033;margin-right:0px\">></span> 了解详情 </a> ";       
         html += "</p></div></div>";
         var infoWindow = new BMap.InfoWindow(html, opts);// 创建信息窗口对象 
          
	
	 	var point = new BMap.Point(listjxs[5], listjxs[6]);
		map.openInfoWindow(infoWindow, point);  // 打开信息窗口
         	
	}

	function openurl(src1){ //为网址添加超链接
	 	window.open(src1);
	 }
	 
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件

        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：

    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图

        
        var ns=dealerLongitudes[0].split(",");

		var point = new BMap.Point(ns[0], ns[1]);//定义一个中心点坐标
        
        
        //var point = new BMap.Point(116.404556, 39.91405);//定义一个中心点坐标
         
        map.centerAndZoom(point,
        <s:if test='#session["proid"].equals("81")||#session["proid"].equals("488")||#session["proid"].equals("489")||#session["proid"].equals("490")' >
        12
        </s:if>
        <s:else >
        <s:if test='#session["cityid"]!=""' >
        11
         </s:if>
         <s:else >
         8
         </s:else >
         </s:else >
         );//设定地图的中心点和坐标并将地图显示在地图容器中

        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：

    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
       // map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图

    }
    
    //地图控件添加函数：

    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件

	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	//map.addControl(ctrl_ove);
        //向地图中添加比例尺控件

	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    /* * 名称：地图覆盖物类 _marker * 功能：添加地图覆盖物 * 支持：jquery1.4.2 API , 百度地图API */ 
  
function addMarker(){
 var _marker = Class.create(); 
  _marker.prototype = { 
  initialize:function(map){ 
  this.map = map; 
  this.array = new Array(); 
  this.windows = new Array(); 
  this.setOptions(); 
  this.add(); 
  }, 
  setOptions:function(){ 
  this.coordinates = {
     <%a=0;  %>
<s:iterator value="#session['listlj']" status="index">
   <%=a %>:this.creat(<s:property value="dealerLongitude"/>,<s:property value="dealerDimension"/>)
   <s:if test='#index.last==true' ></s:if>
                  	<s:else>,</s:else>
 <%a++; %>
 </s:iterator> 

  
   }; 
   this.infomation = { 
    <% a=0; %>
<s:iterator value="#session['listlj']" status="index">
   <%=a %>:{ city:'city',
    title:'<s:property value="dealername"/>',  accept:'<s:property value="address"/>',
     departure:' <s:property value="url"/>', areanum:'<s:property value="areanum"/>',tel:'<s:property value="phone"/>',did:'<%=a %>', aid : '<s:property value="aid"/>' }
     <s:if test='#index.last==true' ></s:if>
                  	<s:else>,</s:else>
 <%a++; %>
 </s:iterator>

   }; 
   },
    add:function(){ 
    for(var index in this.coordinates){ 
    this.push(this.coordinates[index],index); 
    } }
    , creat:function(lng,lat){ 
    return new BMap.Point(lng, lat);
     }, push:function(point,index){  //mark1
      //
      var _marker = this ;
      var icon = new BMap.Icon("baidu_ico/baidu_icon"+(parseInt(index)+1)+".png", new BMap.Size(26, 26));
       var opts = { 
        width : 275,
        // 信息窗口宽度 
        height: 180, 
        // 信息窗口高度 
        title : "", 
        // 信息窗口标题
         offset: new BMap.Size(0, -15) } 
         var html = "<div style=\"background:#fff;font-family:Arial, Helvetica, sans-serif; margin:20px auto;\"><div style=\"float:left;padding-top:4px\"><img src=\"baidu_ico/baidu_ico_"+(parseInt(index)+1)+".jpg\"></div>" ;
         html += "<div style=\"margin-left:36px;line-height:1.8em;\">";
         html += " <strong>" + this.infomation[index].title +  "</strong><br/>"; 
         html += " <span style=\"width:65px; word-spacing:19px; display:inline-block;\">地 址： </span>" + this.infomation[index].accept + " <br/>"; 
         html += " <span>销售热线：</span> " + this.infomation[index].areanum + "-" +this.infomation[index].tel + " <br/>"; 
         html += " <p style=\"padding:10px 0;\">";
         html += "<a href=\"javascript:void(0);\" onclick=\"opensenddealer("+this.infomation[index].aid+")\"> <span style=\"font-family:'宋体'; font-weight:bold;color:#cc0033;margin-right:4px\">></span>发送至手机</a>";
         html +="&nbsp;&nbsp;&nbsp;"
         html += "<a   href='javascript:aaa("+this.infomation[index].did+");' style=\"padding-right: 10px;\"> <span style=\"font-family:'宋体'; font-weight:bold;color:#cc0033;margin-right:0px\">></span> 了解详情 </a> ";
         
         html += "</p></div></div>";
         var infoWindow = new BMap.InfoWindow(html, opts);
          // 创建信息窗口对象 
          var marker = new BMap.Marker(point,{icon: icon}); 
          marker.addEventListener("click", function(){ _marker.map.openInfoWindow(infoWindow,point); 
          // 打开信息窗口 
       aaaa(index);
  
         }); 
        //      
            this.windows.push(infoWindow); 
        //      
            this.array.push(marker); }, 
        addOverlay:function(){ for(var marker in this.array){ this.map.addOverlay(this.array[marker]); } } }

var a = new _marker(map); 

	a.addOverlay();
}
    
    initMap();//创建和初始化地图
  
     function aaaa(aa){
    
     }

    function aaa(a){
		window.location.href="dealer_seljxs04.action?n="+a;
    }



    
</script>
</body>
</html>