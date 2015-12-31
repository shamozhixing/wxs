<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7 ]> <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8 ]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if IE 9 ]> <html class="no-js ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="zh">
<!--<![endif]-->
	<meta charset='utf-8'>
	<title>Locate a Dealer</title>
<head>
<link rel="stylesheet" type="text/css" href="css/takepages_table.css">
<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/css.css" type="text/css">

<!--[if IE ]>
	<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/ie.css" rel="stylesheet" />
<![endif]-->
<!--[if IE 7 ]> 
<link type="text/css" media="screen" href="css/contactaudi_main_ie7.css" rel="stylesheet" />
<![endif]-->
<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/hotfix.css" rel="stylesheet"/>
<link href="http://www.audi.de/cms4i/cms4i/css/print.css" media="print" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i-models/docroot/cms4i-models.css" type="text/css">
<script type="text/javascript" src='js/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/js/libs.js"></script>
<script type="text/javascript" src="js/Checkable.js"></script>
<link rel="stylesheet" type="text/css" href="css/contactaudi_main.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript" src='js/login.js'></script>

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
      <div id="cn_maincontent" style="position:relative;font-family:'微软雅黑'">
       <jsp:include page="common_login_en.jsp"></jsp:include>
        <div class="page_title">Locate a Dealer</div>
        <div class='takepage_con'>
            <div class='takepage'>
            	<div class="sub_menu dealer">
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
			<input type="hidden" name="pidids" id="pidids" value=""/>
				<p class='chaxun_title'>Search for an Audi dealer near you</p>
				<div class='chaxun_list'>
				<form action="dealer_seljxs.action" name="form1" id="form1" method="post" >
				<input type="hidden" name="fwid" id="fwid" value="<s:property value="#session['lbid']" />"/>
				  <input type="hidden" name="prostrs"  value="<s:property value="#session['prostr1']" />"/>
				  <input type="hidden" name="crtys" value="<s:property value="#session['crty1']" />"/>
				<input type="hidden" name="en" id="en" value="1"/>
					<table>
						<tr>
							<td width="80">Dealer Category</td>
							<td>
								        <fieldset class="longlabels frm" style=" width:174px">
	                                        <select name="fw" id="fw"  onChange="ppro(this.options[this.options.selectedIndex].value)" class="select" style="opacity: 0.0001; z-index: 2;">
	               	                            <option value="0"   <s:if test='#session["lbid"].toString().equals("0")' >selected</s:if>>Dealer</option>
												<OPTION value="1"   <s:if test='#session["lbid"].toString().equals("1")'>selected</s:if>>Used-car Dealer</option>
												<OPTION value="2"   <s:if test='#session["lbid"].toString().equals("2")'>selected</s:if>>24-hour Succor</option>
	                                            </select>
	                                    </fieldset>
	                                
							</td>
						</tr>
						<tr>
							<td height='38'>Please Select <br>the Province</td>
							<td>
								         <fieldset class="longlabels frm" style=" width:174px">
	                                        <select name="pid" id="pid" onChange="ccity2(this.options[this.options.selectedIndex].value)" class="select" style="opacity: 0.0001; z-index: 2;">
	                                            <option value="">Please Select</option>
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
							<td>Please Select <br>the City</td>
							<td>
								         <fieldset class="longlabels frm" style=" width:174px">
	                                        <select name="cid" id="cid" class="select" style="opacity: 0.0001; z-index: 2;">
	                                            <option value="">Please Select</option>
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
				<span class='sousuo js_sousuo eng'></span>
				<div class="js_seach_result">
					<p class='chaxun_number'>
						<span class='sousuo_number'><s:property value="#session['listlj'].size()" /></span>
						<span>results</span>
						
					</p>
					<div class='chaxun_lie_223 w_scrollbar mCustomScrollbar '>
						
						<div class='chaxun_xiang'>
							
                            <p class='w_detail_title f_w'>
								<span><s:property value="#session['dalj'].dealerenname"/></span>
							</p>
							<ul>
								<li><span>Address:</span><span><s:property value="#session['dalj'].enaddress"/></span></li>
								<li><span>Sales:</span><span><s:property value="#session['dalj'].areanum"/>-<s:property value="#session['dalj'].phone"/></span></li>
								<s:if test='#session["dalj"].url!=null&&!#session["dalj"].url.equals("")'><li><span>Website:</span><span style="word-break:break-all;word-wrap:break-word;">
								<a href='#' onclick="openurl('<s:property value="#session['dalj'].url"/>')" style=""><s:property value="#session['dalj'].url"/></a>
								</span></li></s:if>
								<s:if test='#session["dalj"].postalcode!=null&&!#session["dalj"].postalcode.equals("")'><li><span class="word_apacing19">postalcode：</span><span><s:property value="#session['dalj'].postalcode"/></span></li></s:if>
								<s:if test='#session["dalj"].fax!=null&&!#session["dalj"].fax.equals("")'><li><span class="word_apacing19">fax：</span><span><s:property value="#session['dalj'].fax"/></span></li></s:if>
							</ul>
							<s:if test='#session["lbid"].toString()!="2"' >
							<s:if test='#session["dalj"].issecond.equals("Y")' >
							<p class='w_detail_title f_w'style="margin-top:20px;">
								<span>used-car serve</span>
							</p>
							<ul>
							
								<li>
									<span class='word-spacing_9'>linkman ：</span>
									<span><s:property value="#session['dalj'].contact"/></span></li>
								
								<li><span>Sales：</span><span><s:property value="#session['dalj'].contactPhone"/> <s:property value="#session['dalj'].contactTel"/></span></li>
								<s:if test='#session["dalj"].contactEmail.trim()!=""'>
								<li><span>E-mail：</span><span> <s:property value="#session['dalj'].contactEmail"/></span></li>
								</s:if>
							</ul>
							</s:if>
							</s:if>	
							<s:if test='#session["lbid"].toString()!="1"' >
		      				<s:if test='#session["dalj"].isRescue.equals("1")' >
		      				<p class='w_detail_title f_w'style="margin-top:20px;">
								<span>24 hours service</span>
							</p>
							<ul>
								<s:if test='#session["dalj"].rescueTel.trim()!=""'>
								<li><span>Contact phone number:</span><span><s:property value="#session['dalj'].rescueTel"/> </span></li>
								</s:if>
								<s:if test='#session["dalj"].rescuePhone.trim()!=""'>
								<li><span>Contact phone:</span><span> <s:property value="#session['dalj'].rescuePhone"/></span></li>
								</s:if>
							</ul>
							</s:if>
							</s:if>
							
							
							<div class='w_back_lie'>
								<a href="" class="js_back_lie">
									<span class='colorred'><img src="images/ld.jpg"></span>
									<span class="w_span_a"><a href="dealer_seljxs.action?en=1&fw=<s:property value='#session["lbid"]'/>&pid=<%=session.getAttribute("proid")!=null?session.getAttribute("proid").toString():"" %>&cid=<%=session.getAttribute("cityid")!=null?session.getAttribute("cityid").toString():"" %>">Back to dealer list</a></span>
								</a>
							</div>
							 
						</div>
						
					</div>
					<div class="w_ico_box">
				                <ul class="toolbox  clearfix">
				                		<li class='w_icon w_icongo'><a href="javascript:void(0);" onclick="ad()">How to Reach the Place</a></li>
				                	
				                    	<li class="w_icon w_icons-printpage">
				                    	<a href="javascript:window.print();" >Print</a>
				                        <aside class="flyout" data-component="nav_share" style="display: none; ">
				                        <div class="inner">
				                            <h1>Social Web</h1>
				                            <ul class="horizontalNav clearfix" style="padding-bottom: 0px; ">

				                                <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0007.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到新浪微博&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0007.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0007.Image&quot;}]}}]}" title="分享到新浪微博" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=sinaweibo&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到新浪微博</a>
				                                        </li>
				                                    <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0006.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到开心网&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0006.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0006.Image&quot;}]}}]}" title="分享到开心网" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=kaixin&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到开心网</a>
				                                        </li>
				                                    <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0004.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到豆瓣网&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0004.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0004.Image&quot;}]}}]}" title="分享到豆瓣网" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=douban&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到豆瓣网</a>
				                                        </li>
				                                    <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0003.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到百度搜藏&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0003.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0003.Image&quot;}]}}]}" title="分享到百度搜藏" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=baidu&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到百度搜藏</a>
				                                        </li>
				                                    <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0005.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到谷歌书签&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0005.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0005.Image&quot;}]}}]}" title="分享到谷歌书签" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=google&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到谷歌书签</a>
				                                        </li>
				                                    <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0001.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到MSN&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0001.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0001.Image&quot;}]}}]}" title="分享到MSN" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=live&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到MSN</a>
				                                        </li>
				                                    <li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0002.Image track-click" data-tracking="{&quot;trackers&quot; : [{&quot;tracker&quot; : &quot;Omniture&quot;,&quot;eventId&quot; : &quot;event32&quot;,&quot;tracking_options&quot; : {&quot;eventTargetUrl&quot; : &quot;分享到QQ空间&quot;,&quot;props&quot;: [{&quot;key&quot; : &quot;prop39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0002.Image&quot;}],&quot;evars&quot;: [{&quot;key&quot; : &quot;eVar39&quot;, &quot;value&quot; : &quot;tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0002.Image&quot;}]}}]}" title="分享到QQ空间" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=qzone&amp;url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&amp;title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到QQ空间</a>
				                                        </li>
				                                    </ul>
				                            <a href="http://www.audi.de/de/brand/de/tools/socialize.html?url=url&amp;title=title" class="more track-click" data-tracking="[{&quot;tracker&quot;:&quot;Omniture&quot;,&quot;eventId&quot;:&quot;event32&quot;,&quot;tracking_options&quot;: {&quot;eventTargetUrl&quot;: &quot;Mehr Services&quot;}}]" onClick="window.open('http://www.audi.de/de/brand/de/tools/socialize.html?url=url&amp;title=title', 'popupWindowName', 'dependent=yes, menubar=no, toolbar=no'); return false;">Mehr Services</a>
				                            </div>
				                        </aside>
				                    </li>
				                    <!-- li class="w_icon w_icons-share">
				                    	<a href="" >Share</a>
				                    </li -->
				                </ul>
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
    
<script type="text/javascript" src="js/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" />

<%@include file='dealermobile_en.jsp' %>
<%@include file="common_login_div.jsp"%>
<script type="text/javascript">
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
					alert("Please Select the Province！");
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
			
			$(".js_detail_list").parents(".chaxun_lies").hide();
			$(".chaxun_xiang").show(function(){
				$(".mCustomScrollbar").mCustomScrollbar("update");
			});
			//
			$('.w_ico_box').show();
			var index=0;
			$(".dealer").find("span").each(function(){
				$(this).click(function(){
					index = $(this).index();
					showpage(index);					
				});
			});
			
			function showpage(i){
				//if(i==2) return false;
				$(".dealer").css("background-image","url(images/chaxune_banner"+(i+1)+".jpg)")
				if(i==0) location.href='dealer_procity.action';
				if(i==1) location.href='dealer_seljxs.action?en=1&fw=<s:property value='#session["lbid"]'/>&pid=<%=session.getAttribute("proid")!=null?session.getAttribute("proid").toString():"" %>&cid=<%=session.getAttribute("cityid")!=null?session.getAttribute("cityid").toString():"" %>';
			}
			showpage(2);
			
		});
	</script>


<div id="container"></div>
<script type="text/javascript">

	function openurl(src1){//为网址添加超链接
	 	window.open(src1);
	 }
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
 		alert("Please Select the Province！");
 		return;
 	}
 	document.form1.submit();
 }
  
  var xhrs;
  function ppro(id){
  		$('#pid').siblings('.caption').text('Please Select');
  		$('#cid').siblings('.caption').text('Please Select');
 		if(id!=""){	
 			
		  document.getElementById("pid").options.length=0;
		  document.getElementById("cid").options.length=0;
		  document.getElementById("pidids").value="";
		  document.getElementById("fwid").value=id;
	      xhrs = createXHR();
		  xhrs.open("post","dealer_pross.action?en=1&lbids="+id);
	       xhrs.onreadystatechange = callbackcity1;
		   xhrs.send(null); 
		   
		 	
 		 document.getElementById("fwids").value=id;	
 		}
		else{
		  document.getElementById("pid").options.length=0;
		   document.getElementById("cid").options.length=0;
		  var option = document.createElement("OPTION");
		  option.text="Please Select";
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
		addpro("","Please Select"); 
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
 		$('#cid').siblings('.caption').text('Please Select');
 		if(id!=""){
 		  
		  document.getElementById("cid").options.length=1;
	      xhr = createXHR();
		  xhr.open("post","dealer_ctiys.action?en=1&pid="+id+"&lbids="+document.getElementById("fwid").value);
	       xhr.onreadystatechange = callbackcity2;
		   xhr.send(null); 
		    	
		   
 	     document.getElementById("pidids").value=id;		
 		}
		else{
		  document.getElementById("cid").options.length=0;
		  var option = document.createElement("OPTION");
		  option.text="Please Select";
	      option.value="";
	      document.getElementById("cid").options.add(option);
		 }		
	}
	function ccity1(id){
 		if(id!=""){
 		  	 
		  document.getElementById("cid").options.length=0;
	      xhr = createXHR();
		  xhr.open("post","dealer_ctiys.action?en=1&pid="+id+"&lbids="+document.getElementById("fwid").value);
	       xhr.onreadystatechange = callbackcity2;
		   xhr.send(null); 	
		   document.getElementById("pidids").value=id;
 		}
		else{
		  document.getElementById("cid").options.length=0;
		  var option = document.createElement("OPTION");
		  option.text="Please Select";
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
			addcity("","Please Select");  
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

var map = new BMap.Map("dituContent");
var point = new BMap.Point(<s:property value="#session['dalj'].dealerLongitude"/>, <s:property value="#session['dalj'].dealerDimension"/>);
//var marker = new BMap.Marker(point);
var opts = {
  width : 275,     // 信息窗口宽度
  height: 200,     // 信息窗口高度
  title : ""  // 信息窗口标题
}

map.centerAndZoom(point, 15);
var myIcon = new BMap.Icon( "images/audilogo.png",new BMap.Size(53, 33));
  
    var marker = new BMap.Marker(point, {icon: myIcon});

map.addOverlay(marker);
		var dn = "<%=request.getParameter("n")%>";
		 var html = "<div style=\"background:#fff;font-family:Arial, Helvetica, sans-serif; margin:10px auto;\"><div style=\"float:left;padding-top:4px\"><img src=\"baidu_ico/baidu_ico_"+(parseInt(dn)+1)+".jpg\" width='26'></div>" ;
         html += "<div style=\"margin-left:36px;line-height:1.8em;\">";
         html += "<strong><s:property value="#session['dalj'].dealerenname"/></strong><br/>"; 
         html += " <span style=\"display:inline-block;\">address:</span><s:property value="#session['dalj'].enaddress"/> <br/>"; 
         html += " <span>Sales:</span> <s:property value="#session['dalj'].areanum"/>-<s:property value="#session['dalj'].phone"/> <br/>"; 
         html += " <p style=\"padding:10px 0;\">";
         html += "<a href=\"javascript:void(0);\" onclick=\"opensenddealer(<s:property value="#session['dalj'].aid"/>);\"> <span style=\"font-family:'宋体'; font-weight:bold;color:#cc0033;margin-right:4px\">></span>Send to Mobile Phone </a>";
         if("<s:property value="#session['dalj'].url"/>"!=''){
        	html +="&nbsp;&nbsp;&nbsp;&nbsp;<br/>"
         	html += "<a href=\"javascript:void(0);\" onclick=\"openurl();\"> <span style=\"font-family:'宋体'; font-weight:bold;color:#cc0033;margin-right:4px\">></span>View the Site</a>";
         }
         html += "</p></div></div>";
        
var infoWindow = new BMap.InfoWindow(html, opts);  // 创建信息窗口对象

marker.addEventListener("onmouseover", function(){                                        
   this.openInfoWindow(infoWindow);        
});

marker.openInfoWindow(infoWindow);//在打开页面时自动加载信息窗口

 //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav); 


document.getElementById("container").style.display="none"
 var map1 = new BMap.Map("container"); 
 map1.centerAndZoom(new BMap.Point(<s:property value="#session['dalj'].dealerLongitude"/>, <s:property value="#session['dalj'].dealerDimension"/>), 11); 
 
     var local = new BMap.LocalSearch("<s:property value='provincename'/>", { renderOptions: { map: map1, autoViewport: true, selectFirstResult: false } });
 		local.search("<s:property value="#session['dalj'].dealername"/>"); 
 
 
function openurl(){ //为网址添加超链接
		//alert(src1);
	 	window.open('<s:property value="#session['dalj'].url"/>');
	 		
	 }
function ad(){
	window.open(local.getResults().moreResultsUrl);
}
 

</script>
</body>
</html>