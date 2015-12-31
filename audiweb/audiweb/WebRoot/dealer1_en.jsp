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
			swfobject.embedSWF("AgencyMap_en.swf", "swf", "626", "571", "9.0.0", false, flashvars, params, attributes);
</script>
</head>
<body class="DE de" data-country="DE" data-lang="de">
<%@include file="common_tackingcode.jsp"%>
<ul class="visuallyhidden" data-component="skiplinks" id="skiplinks">
    <li><a href="#navigation" rel="nofollow">Navigation</a></li>
	<li><a href="#search" rel="nofollow">Search</a></li>
    <li><a href="#main" rel="nofollow">Content</a></li>
</ul>
<header id="header" style="filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#E5EAEE,endcolorstr=#ffffff,gradientType=1); ">
	<div class="container">
		<img src="http://www.audi.cn/etc/medialib/ngw/cn.Par.0003.Image.gif/audi_logo_new_cn.gif" alt="&nbsp;" class="logo " data-component="nav_logo"/>
        <nav id="navigation">
	<h1 class="visuallyhidden">Breadcrumbs Navigation</h1>
	
   	<ul class="horizontalNav left breadcrumbs">
   	    <li>
        	<a href="/content/cn/brand/zh.html">首页</a>
        	<span class="w_divider"></span>
        </li>
   		<li><a href="">联系奥迪</a><span class="w_divider"></span></li>
        <li>查询经销商</li>
	</ul>
	
	 <ul class="horizontalNav right">		
			<li class="nestingList" data-component="nav_overview" id="overview">
	<a href="#">
		<span class="iconLink icons-fastoverview">
			网站地图</span>
	</a>
	<aside class="flyout">
		<div class="inner clearfix">
			<h1 class="visuallyhidden">Quicklinks</h1>
			<section class='alpha col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="/content/cn/brand/zh/used-car.html">奥迪品荐二手车</a>
							</h1>
							<ul class="links">
								<li><a href="/content/cn/brand/zh/used-car/about-used-cars.html">关于奥迪品荐</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/service.html">奥迪品荐服务</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/news.html">奥迪品荐动态</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/audi_pinjianhui.html">奥迪品荐汇</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/a6l_replacement.html">奥迪品荐优惠</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/search.html">奥迪二手车搜索</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/Market_price.html">奥迪二手车行情</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/dealer.html">奥迪二手车经销商查询</a>
										</li>
								<li><a href="/content/cn/brand/zh/used-car/onlineservice.html">在线支持服务</a>
										</li>
								</ul>
						</div>
					</section>
				<section class='col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="/content/cn/brand/zh/models.html">奥迪车型</a>
							</h1>
							<ul class="links">
								<li><a href="/content/cn/brand/zh/models/a1.html">A1</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/a3/a3sportback.html">A3</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/a4.html">A4</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/a5.html">A5</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/a6/a6l.html">A6L</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/a7/a7_sportback.html">A7</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/a8.html">A8</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/q3/q3.html">Q3</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/q5/q5.html">Q5</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/q7.html">Q7</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/tt.html">TT</a>
										</li>
								<li><a href="/content/cn/brand/zh/models/r8.html">R8</a>
										</li>
								</ul>
						</div>
					</section>
				<section class='col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="http://www1.audi.cn/webapp/eshop/index.jsp.html">奥迪精品</a>
							</h1>
							<ul class="links">
								<li>奥迪皮具
										</li>
								<li>奥迪服装
										</li>
								<li>生活精品
										</li>
								<li>运动&旅行
										</li>
								<li>儿童天地
										</li>
								<li>奥迪车模
										</li>
								<li>奥迪经典
										</li>
								<li></li>
								</ul>
						</div>
					</section>
				<section class='col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="/content/cn/brand/zh/fleet_sales.html">大用户与金融业务</a>
							</h1>
							<ul class="links">
								<li><a href="/content/cn/brand/zh/fleet_sales/corporateclients.html">奥迪大用户业务</a>
										</li>
								<li><a href="/content/cn/brand/zh/fleet_sales/financial.html">奥迪金融业务</a>
										</li>
								</ul>
						</div>
					</section>
				<section class='col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="/content/cn/brand/zh/experience.html">奥迪天地</a>
							</h1>
							<ul class="links">
								<li><a href="/content/cn/brand/zh/experience/audi_brand.html">奥迪品牌</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/news.html">奥迪新闻</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/multimedia_experience.html">多媒体体验</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/Excellence.html">奥迪卓越</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/ADE.html">奥迪驾控汇</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/quattro_cup.html">奥迪quattro杯高尔夫锦标赛</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/event.html">奥迪盛事</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/sponsorship.html">奥迪赞助</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/environmental_protection.html">奥迪环保</a>
										</li>
								<li><a href="/content/cn/brand/zh/experience/audisport.html">奥迪运动</a>
										</li>
								<li>奥迪品味车苑
										</li>
								<li></li>
								<li><a href="/content/cn/brand/zh/experience/audicitybeijing.html">Audi City Beijing</a>
										</li>
								</ul>
						</div>
					</section>
				<section class='col omega'>
						<div class="inner">
							<h1>
								<a class="arrow" href="/content/cn/brand/zh/design_technology.html">领先科技</a>
							</h1>
							<ul class="links">
								<li><a href="/content/cn/brand/zh/design_technology/innovation.html">创新科技总览</a>
										</li>
								<li><a href="/content/cn/brand/zh/vorsprung_durch_technik.html">未来科技</a>
										</li>
								<li><a href="/content/cn/brand/zh/design_technology/concept_cars.html">概念车</a>
										</li>
								<li><a href="/content/cn/brand/zh/design_technology/wtc.html">风洞中心</a>
										</li>
								</ul>
						</div>
					</section>
				<section class='alpha col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="/content/cn/brand/zh/service.html">奥迪服务</a>
							</h1>
							<ul class="links">
								<li>奥迪服务介绍
										</li>
								<li><a href="/content/cn/brand/zh/service/model_highlights.html">奥迪服务动态</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/price_and_specifications.html">奥迪人性化服务</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/service.html">奥迪检查与维修</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/succor_tel.html">24小时救援电话</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/original_spare_parts.html">奥迪原装备件</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/Boutique_Accessories.html">奥迪精品附件</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/1.html">奥迪风采</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/luxury.html">奥迪质量担保</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/downloads.html">精彩视频</a>
										</li>
								<li><a href="/content/cn/brand/zh/service/tips.html">小贴士</a>
										</li>
								</ul>
						</div>
					</section>
				<section class='col'>
						<div class="inner">
							<h1>
								<a class="arrow" href="http://www.audi.cn/cn/brand/zh/contact_audi.html.html">联系奥迪</a>
							</h1>
							<ul class="links">
								<li><a href="http://www1.audi.cn/webapp/front/consaudi!init.action?contecttype=1.html">购车咨询</a>
										</li>
								<li><a href="http://www1.audi.cn/webapp/front/consaudi!init.action?contecttype=2.html">投诉</a>
										</li>
								<li><a href="http://www1.audi.cn/webapp/front/consaudi!init.action?contecttype=3.html">建议</a>
										</li>
								<li><a href="http://www1.audi.cn/webapp/front/obtaindatum.jsp.html">索取资料</a>
										</li>
								<li><a href="http://www1.audi.cn/webapp/front/usertb!init.action.html">申请试驾</a>
										</li>
								<li>经销商查询
										</li>
								<li></li>
								<li><a href="/content/cn/brand/zh/contact_audi/faq.html">常见问答</a>
										</li>
								<li><a href="/content/cn/brand/zh/contact_audi/careers.html">职位申请</a>
										</li>
								</ul>
						</div>
					</section>
				</div>
	</aside>
</li><li data-component="func_search" id="search">
			<form action="/content/cn/brand/zh/tools/search.html" novalidate="novalidate" method="GET">
			    <input type="hidden" name="_charset_" value"utf-8">
				<fieldset>
					<ol>
						<li class="fleft">
							<label class="visuallyhidden" for="searchstring">Suchbegriff</label>	   
							<input class="text" name="q" placeholder="Suchbegriff" type="search" id="searchstring">
						</li>
						<li class="fleft">
							<button class="icon icons-search" name="submit_search" type="submit">Suchen</button>
						</li>
					</ol>
				</fieldset>
			</form>
		</li>
	<li class="share nestingList">
				<a href="#">
            <span class="icon icons-share">Share</span>
		</a>
		<aside class="flyout" data-component="nav_share" >
		<div class="inner">
			<h1>Social Web</h1>
			<ul class="horizontalNav clearfix">
				<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0007.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到新浪微博","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0007.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0007.Image"}]}}]}' title="分享到新浪微博" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=sinaweibo&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到新浪微博</a>
						</li>
					<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0006.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到开心网","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0006.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0006.Image"}]}}]}' title="分享到开心网" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=kaixin&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到开心网</a>
						</li>
					<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0004.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到豆瓣网","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0004.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0004.Image"}]}}]}' title="分享到豆瓣网" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=douban&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到豆瓣网</a>
						</li>
					<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0003.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到百度搜藏","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0003.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0003.Image"}]}}]}' title="分享到百度搜藏" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=baidu&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到百度搜藏</a>
						</li>
					<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0005.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到谷歌书签","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0005.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0005.Image"}]}}]}' title="分享到谷歌书签" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=google&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到谷歌书签</a>
						</li>
					<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0001.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到MSN","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0001.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0001.Image"}]}}]}' title="分享到MSN" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=live&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到MSN</a>
						</li>
					<li><a class="socialIcon /etc/medialib/ngw/cn/share_icon#Par.0002.Image track-click" data-tracking='{"trackers" : [{"tracker" : "Omniture","eventId" : "event32","tracking_options" : {"eventTargetUrl" : "分享到QQ空间","props": [{"key" : "prop39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0002.Image"}],"evars": [{"key" : "eVar39", "value" : "tools/socialized_/etc/medialib/ngw/cn/share_icon#Par.0002.Image"}]}}]}' title="分享到QQ空间" href="http://www.audi.cn/cn/brand/zh/tools/socialize.html?s=qzone&url=http%3A%2F%2Fpre-origin-www2.audi.com%2Fcn%2Fbrand%2Fzh%2Ftest_models.html&title=%E5%A5%A5%E8%BF%AA%E8%BD%A6%E5%9E%8B" target="_blank">分享到QQ空间</a>
						</li>
					</ul>
			<a href="http://www.audi.de/de/brand/de/tools/socialize.html?url=url&amp;title=title" class="more track-click" data-tracking='[{"tracker":"Omniture","eventId":"event32","tracking_options": {"eventTargetUrl": "Mehr Services"}}]' onClick="window.open('http://www.audi.de/de/brand/de/tools/socialize.html?url=url&amp;title=title', 'popupWindowName', 'dependent=yes, menubar=no, toolbar=no'); return false;">Mehr Services</a>
			</div>
		</aside>
  	</li> 
</ul>
	</nav>

</div>
</header>
<div class="container">
    <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;font-family:'微软雅黑'">
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
				<p class='chaxun_title'>Search for an Audi dealer near you</p>
				<div class='chaxun_list'>
				<form action="dealer_seljxs.action" name="form1" id="form1" method="post" >
				<input type="hidden" name="fwid" id="fwid" value="0"/>
				<input type="hidden" name="fwids" id="fwids" value="<s:property value="sid" />"/>
				<input type="hidden" name="pidids" id="pidids" value=""/>
				<input type="hidden" name="en" id="en" value="1"/>
					<table>
						<tr>
							<td width="80">Dealer Category</td>
							<td>
								        <fieldset class="longlabels frm" style=" width:174px">
	                                        <select name="fw" id="fw"  onChange="ppro(this.options[this.options.selectedIndex].value)" class="select" style="opacity: 0.0001; z-index: 2;">
	               	                            <option value="0" <s:if test='sid.equals("0")' >selected</s:if> >Dealer</option>
												<OPTION value="1" <%if(session.getAttribute("lbid01").toString().equals("1")){out.print("selected");} %> >Used-car Dealer</option>
												<OPTION value="2" <%if(session.getAttribute("lbid01").toString().equals("2")){out.print("selected");} %> >24-hour Succor</option>
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
							<td>Please Select <br>the City</td>
							<td>
								         <fieldset class="longlabels frm" style=" width:174px">
	                                        <select name="cid" id="cid" class="select" style="opacity: 0.0001; z-index: 2;">
	                                            <option value="">Please Select</option>
	                                            </select>
	                                    </fieldset>
	                              
							</td>
						</tr>
					</table>
					</form>
				</div>
				<span class='sousuo js_sousuo eng'></span>
			<!-- 	<span class="wrong" id="sousuo1_en_wrong" display:block></span>   -->
				<div class="js_seach_result">
					<p class='chaxun_number'>
						<span class='sousuo_number'>22</span>
						<span>results</span>
						
					</p>
					<div class='chaxun_lie_223 w_scrollbar mCustomScrollbar '>
						<div class='chaxun_lies'>
							<div class='cx_ship'>
								<p class='cx_shipname'>
									<span class="w_width">01</span>
									<span class='z_width'>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span>
								</p>
								<ul>
									<li><span class=>Address:</span><span>Badaling high-speed qinghe Toll Station Road East,Chaoyang District,Beijing</span></li>
									<li><span>Sales:</span><span>010-82818899 82818877</span></li>
									<li><span class=>Website:</span><span class="f_10">http://zrf.audi.-online.com</span></li>
								</ul>
								<p class='cx_xq'>
									<a href=""class="js_detail_list"><span class="colorred"><img src="images/ld.jpg"> </span>For Detailed Information</a><br>
									<a href="" class='fssj'><span class="colorred"><img src="images/ld.jpg">
									 </span >Send to mobile phone</a>
								</p>
							</div>
							<div class='cx_ship'>
								<p class='cx_shipname'>
									<span class="w_width">02</span>
									<span class='z_width'>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span></p>
								<ul>
									<li><span class=>Address:</span><span>Badaling high-speed qinghe Toll Station Road East,Chaoyang District,Beijing</span></li>
									<li><span>Sales:</span><span>010-82818899 82818877</span></li>
									<li><span class=>Website:</span><span class="f_10">http://zrf.audi.-online.com</span></li>
								</ul>
								<p class='cx_xq'>
									<a href=""class="js_detail_list"><span class="colorred"><img src="images/ld.jpg"> </span>For Detailed Information</a><br>
									<a href="" class='fssj'><span class="colorred"><img src="images/ld.jpg">
									 </span >Send to mobile phone</a>
								</p>
							</div>
							<div class='cx_ship'>
								<p class='cx_shipname'>
									<span class="w_width">03</span>
									<span class='z_width'>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span></p>
								<ul>
									<li><span class=>Address:</span><span>Badaling high-speed qinghe Toll Station Road East,Chaoyang District,Beijing</span></li>
									<li><span>Sales:</span><span>010-82818899 82818877</span></li>
									<li><span class=>Website:</span><span class="f_10">http://zrf.audi.-online.com</span></li>
								</ul>
								<p class='cx_xq'>
									<a href=""class="js_detail_list"><span class="colorred"><img src="images/ld.jpg"> </span>For Detailed Information</a><br>
									<a href="" class='fssj'><span class="colorred"><img src="images/ld.jpg">
									 </span >Send to mobile phone</a>
								</p>
							</div>
							<div class='cx_ship'>
								<p class='cx_shipname'>
									<span class="w_width">04</span>
									<span class='z_width'>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span></p>
								<!-- <table>
									<tr>
										<td width='25'>04</td>
										<td>BeiJing Boruixiangyun Motor Sales Co.,Ltd</td>
									</tr>
								</table> -->
								<ul>
									<li><span class=>Address:</span><span>Badaling high-speed qinghe Toll Station Road East,Chaoyang District,Beijing</span></li>
									<li><span>Sales:</span><span>010-82818899 82818877</span></li>
									<li><span class=>Website:</span><span class="f_10">http://zrf.audi.-online.com</span></li>
								</ul>
								<p class='cx_xq'>
									<a href=""class="js_detail_list"><span class="colorred"><img src="images/ld.jpg"> </span>For Detailed Information</a><br>
									<a href="" class='fssj'><span class="colorred"><img src="images/ld.jpg">
									 </span >Send to mobile phone</a>
								</p>
							</div>
						</div>
						<div class='chaxun_xiang'>
							<p class='w_detail_title f_w'>
								<span>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span>
							</p>
                            <p class='w_detail_title f_w'>
								<span>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span>
							</p>
                            <p class='w_detail_title f_w'>
								<span>BeiJing Boruixiangyun Motor Sales Co.,Ltd</span>
							</p>
							<ul>
								<li><span>Address:</span><span>Badaling high-speed qinghe Toll Station Road East,Chaoyang District,Beijing</span></li>
								<li><span>Sales:</span><span>010-82818899</span></li>
								<li><span>Website:</span><span>http://zrf.audi.-online.com</span></li>
							</ul>
							<p class='w_detail_title f_w'style="margin-top:20px;">
								<span>used-car serve</span>
							</p>
							<ul>
								<li>
									<span>linkman:</span>
									<span>jone-guo</span></li>
								<li><span>Sales:</span><span>010-82818899 82818877</span></li>
								<li><span>E-mail:</span><span> zrf,guo@audi.com</span></li>
							</ul>
							<div class='w_back_lie'>
								<a href="" class="js_back_lie">
									<span class='colorred'><img src="images/ld.jpg"></span>
									<span class="w_span_a">Back to dealer list</span>
								</a>
							</div>
							 
						</div>
						
					</div>
					<div class="w_ico_box">
				                <ul class="toolbox  clearfix">
				                		<li class='w_icon w_icongo'><a href="">How to Reach the Place</a></li>
				                	
				                    	<li class="w_icon w_icons-printpage">
				                    	<a href="" >Print</a>
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
				                    <li class="w_icon w_icons-share">
				                    	<a href="" >Share</a>
				                    </li>
				                </ul>
            		</div>
					
				</div>
			</div>
			<div class='chaxun_right' style="background:none">
				
                <div style='width:626;height:571;margin: 0 auto;overflow:hidden' id="swf">
                	
                </div>
                
			</div>
        </div>
        
      </div>
    </div>
    <aside id="models" class="home">
   <h1 class="visuallyhidden">Model Navigation</h1>
   <section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a1.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A1",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A1"
                    }
                ]
            }
        }
    ]
}'>A1</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/a1/a1.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A1",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A1"
                    }
                ]
            }
        }
    ]
}'>A1</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a1/a1_sportback.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A1 Sportback",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A1 Sportback"
                    }
                ]
            }
        }
    ]
}'>A1 Sportback</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A1</span>
				价格：RMB 224,800起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a1/a1.html">查看&nbspA1</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://www1.audi.cn/a1" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1/360_view.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1/specification_price/specification.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1/A1_China_edition.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "奥迪A1中国限量版",
                "props": [
                    {
                        "key": "prop35",
                        "value": "奥迪A1中国限量版"
                    }
                ]
            }
        }
    ]
}'>奥迪A1中国限量版</a>
		</li>
</ul>
			<p>奥迪A1，以小见大。从小巧灵活的外观，到简约个性的色彩装备；从动感智能的内饰承载，到精准舒适的动力操控——它将您对于生活的伟大渴望贯注于细微之上。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a1.png" alt="Audi A1"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">A1 Sportback</span>
				价格：RMB 234,800起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a1/a1_sportback.html">查看&nbspA1 Sportback</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1_sportback/360_view.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1_sportback/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a1/a1_sportback/specification_price/specification.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A1 Sportback，大有门道。实用五门版设计，以小见大，有个性更实用。 MMI®增强版导航系统，令前路了然于心；灵活空间设计，拓展920L超大储物空间；14个扬声器的BOSE环绕音响系统，随时畅享天籁。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a1_sportback.png" alt="Audi A1 Sportback"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a3.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A3",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A3"
                    }
                ]
            }
        }
    ]
}'>A3</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh_new/models/a3/a3sportback.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A3 Sportback",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A3 Sportback"
                    }
                ]
            }
        }
    ]
}'>A3 Sportback</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A3 Sportback</span>
				价格：RMB 255,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh_new/models/a3/a3sportback.html">查看&nbspA3 Sportback</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://www1.audi.cn/a3/#/MyCar" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a3/a3sportback/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a3/a3sportback/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a3/a3sportback/specification_price/specification.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A3，导演多彩生活。自信而活力充沛、动感而清晰，总是以自由的精髓突破惯常的驾驭尺度，这就是奥迪A3 Sportback。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a3.png" alt="Audi A3"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a4.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A4",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A4"
                    }
                ]
            }
        }
    ]
}'>A4</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/a4/a4l.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A4L",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A4L"
                    }
                ]
            }
        }
    ]
}'>A4L</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a4/a4_allroad_quattro.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A4 allroad quattro",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A4 allroad quattro"
                    }
                ]
            }
        }
    ]
}'>A4 allroad quattro</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A4L</span>
				价格：RMB 272,800起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a4/a4l.html">查看&nbspA4L</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://newa4l.audi.cn" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a4/a4l/360_views.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a4/a4l/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a4/a4l/specification_price/specification.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>新奥迪A4L，精准在握，驾驭未来。新奥迪A4L升级搭载超前科技，以全新LED大灯辉耀完美驾控之道，更以新一代quattro®全时四轮驱动系统、动态转向系统以及驾驶模式选项，创造出前所未有的精准驾驭。 </p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a4l.png" alt="Audi A4L"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">A4 allroad quattro</span>
				价格：RMB 489,800起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a4/a4_allroad_quattro.html">查看&nbspA4 allroad quattro</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a4/a4_allroad_quattro/360_views.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a4/a4_allroad_quattro/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a4/a4_allroad_quattro/specification_price/specification.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A4 allroad quattro全路况旅行车，历尽不同。40 TFSI发动机带你冲出平庸的桎梏，全新quattro®释放久违的激情，驾驶模式随心变换，越野底盘扩张每一种路面的趣味。490L超大行李空间，满载你对未至的渴望。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a4_allroad_.png" alt="Audi A4 allroad "/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a5.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A5",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A5"
                    }
                ]
            }
        }
    ]
}'>A5</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/a5/A5_Sportback.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A5 Sportback",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A5 Sportback"
                    }
                ]
            }
        }
    ]
}'>A5 Sportback</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a5/a5_coupe.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A5 Coupé",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A5 Coupé"
                    }
                ]
            }
        }
    ]
}'>A5 Coupé</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a5/a5_cab.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A5 Cabriolet",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A5 Cabriolet"
                    }
                ]
            }
        }
    ]
}'>A5 Cabriolet</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a5/S5_stb.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "S5 Sportback",
                "props": [
                    {
                        "key": "prop35",
                        "value": "S5 Sportback"
                    }
                ]
            }
        }
    ]
}'>S5 Sportback</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a5/s5.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "S5 Coupé",
                "props": [
                    {
                        "key": "prop35",
                        "value": "S5 Coupé"
                    }
                ]
            }
        }
    ]
}'>S5 Coupé</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a5/s5_cab.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "S5 Cabriolet",
                "props": [
                    {
                        "key": "prop35",
                        "value": "S5 Cabriolet"
                    }
                ]
            }
        }
    ]
}'>S5 Cabriolet</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a5/rs5.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "RS5 Coupé",
                "props": [
                    {
                        "key": "prop35",
                        "value": "RS5 Coupé"
                    }
                ]
            }
        }
    ]
}'>RS5 Coupé</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A5 Sportback</span>
				价格：RMB 499,800起 </h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/A5_Sportback.html">查看&nbspA5 Sportback</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/A5_Sportback/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/A5_Sportback/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/A5_Sportback/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A5，演绎生活美学。某些时刻仿若似曾相识，但又绝无仅有。奥迪A5 Sportback以全新科技唤醒你久违的激情，以宽敞的格局释放自由之心。就在一刹那，一切变得新奇无比。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a5_sportback.png" alt="Audi A5 Sportback"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">A5 Coupé</span>
				价格：RMB 525,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/a5_coupe.html">查看&nbspA5 Coupé</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/a5_coupe/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/a5_coupe/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/a5_coupe/specification_price/specifications_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A5，演绎生活美学。从来没有一款新车型的亮相，如此激动人心。奥迪A5 Coupé，以经典的造型诠释出人们心中的渴望，以创新的设计定义超越时代的完美动感。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a5_coupe.png" alt="Audi A5 Coupe"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">A5 Cabriolet</span>
				价格：RMB 598,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/a5_cab.html">查看&nbspA5 Cabriolet</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/a5_cab/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/a5_cab/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/a5_cab/specification_price/specification.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A5，演绎生活美学。以整整一个世纪的成功孕育新宣言，在我们每一辆车内，你都感受到奥迪式的心跳。奥迪A5 Cabriolet以全新驾驭方式颠覆日常旅程，以令人悸动卓越体验诞生新宣言。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a5_cabriolet.png" alt="Audi A5 Cabriolet"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">S5 Sportback</span>
				价格：RMB 728,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/S5_stb.html">查看&nbspS5 Sportback</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/S5_stb/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/S5_stb/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/S5_stb/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A5，演绎生活美学。不是每一款跑车都具有足以撼动速度法则的强悍之心，奥迪S5 Sportback以全新技术与卓越性能唤醒您久违的激情，将驾驭乐趣推向极致。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_s5_sportback.png" alt="Audi S5 Sportback"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">S5 Coupé</span>
				价格：RMB 758,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/s5.html">查看&nbspS5 Coupé</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/s5/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/s5/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/s5/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A5，演绎生活美学。奥迪S5 Coupé的经典造型即使在停驻时也能让人感受到它穿破平静的呼吸，而它澎湃的动力与卓越效能则不断颠覆极速法则，引领人们追逐巅峰渴望。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_s5_coupe.png" alt="Audi S5 Coupe"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">S5 Cabriolet</span>
				价格：RMB 858,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/s5_cab.html">查看&nbspS5 Cabriolet</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/s5_cab/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/s5_cab/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/s5_cab/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A5，演绎生活美学。驾驶独一无二的新历程，更在旅程中发现全新自我。奥迪S5 Cabriolet以颠覆日常旅程的独有驾驭方式，带你迎接永不止步的个性生活。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_s5_cabriolet.png" alt="Audi S5 Cabriolet"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">RS5 Coupé</span>
				价格：RMB 1,198,000 起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a5/rs5.html">查看&nbspRS5 Coupé</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/rs5/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/rs5/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a5/rs5/specification_price/specifications_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪RS5 Coupé，让速度与美完美融合。夺人心魄的魅力外表下蕴藏着强悍超凡的力量，450匹马力撼世而出，高转速4.2升V8 FSI®发动机更赋予它250公里/小时的极速激情。在划破空气的刹那，极致动力以优雅的方式肆意澎湃。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_rs5_coupe.png" alt="Audi RS5 Coupe"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a6.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A6L",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A6L"
                    }
                ]
            }
        }
    ]
}'>A6L</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/a6/a6l.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A6L",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A6L"
                    }
                ]
            }
        }
    ]
}'>A6L</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A6L</span>
				价格：RMB 383,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a6/a6l.html">查看&nbspA6L</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://www1.audi.cn/a6l" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a6/a6l/360_views.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",

                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a6/a6l/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a6/a6l/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>全新一代奥迪A6L，超级座•驾。凝聚触摸式MMI®系统、带启-停功能的自适应巡航系统、红外夜视辅助系统、移动电视功能等众多超越级别的领先科技，让您尽享非凡驾乘感受。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a6l.png" alt="Audi A6L"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a7.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A7",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A7"
                    }
                ]
            }
        }
    ]
}'>A7</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/a7/a7_sportback.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A7 Sportback",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A7 Sportback"
                    }
                ]
            }
        }
    ]
}'>A7 Sportback</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A7 Sportback</span>
				价格：RMB 698,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a7/a7_sportback.html">查看&nbspA7 Sportback</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://www1.audi.cn/a7" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a7/a7_sportback/360__views.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a7/a7_sportback/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a7/a7_sportback/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A7，灵感天成。用线条和车身打破车种的界限，用包围式的私密空间解读人类最渴望的舒适，用5.6秒百公里加速和quattro®全时四轮驱动演绎涌动的激情，用智能驾驶彰显纯粹自由的灵感。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a7_sportback.png" alt="Audi A7 Sportback"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/a8.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A8",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A8"
                    }
                ]
            }
        }
    ]
}'>A8</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/a8/a8l.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A8L",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A8L"
                    }
                ]
            }
        }
    ]
}'>A8L</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a8/a8l_w12.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "A8L W12",
                "props": [
                    {
                        "key": "prop35",
                        "value": "A8L W12"
                    }
                ]
            }
        }
    ]
}'>A8L W12</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/a8/s8.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "S8",
                "props": [
                    {
                        "key": "prop35",
                        "value": "S8"
                    }
                ]
            }
        }
    ]
}'>S8</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">A8L</span>
				价格：RMB 871,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a8/a8l.html">查看&nbspA8L</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://www1.audi.cn/a8l/#/Intro" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/a8l/360_view.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/a8l/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/a8l/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A8L，享受探索。以震撼性思考，突破世界感官，以动人心魄的设计，创造人性化智能杰作。以带动行业创新标准的高效动力配置，打破一切规则标准，改变你对世界的认知。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a8l.png" alt="Audi A8L"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">A8L W12</span>
				价格：RMB 2,501,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a8/a8l_w12.html">查看&nbspA8L W12</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/a8l_w12/360_views.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/a8l_w12/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/a8l_w12/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪A8L W12，独领大成。真正伟大的成就，只来自于别人无法企及的地方。以6.3升W12引擎、全伸展式后排独立空间等诸多旷世创举，彻底颠覆世人对于豪华座驾的想象。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_a8l_w12.png" alt="Audi A8L W12"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">S8</span>
				价格：RMB 1,983,000 起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/a8/s8.html">查看&nbspS8</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/s8/360_view.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/s8/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/a8/s8/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪S8，诠释美感，征服动感。作为S家族新领袖，搭载全新4.0 TFSI双涡轮增压引擎，配合8速tiptronic手/自一体变速器、quattro®全时四驱系统等领先科技。呼吸之间，便可从蓄势待发的宁静之美直至撼天动地的澎湃动感。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_s8.png" alt="Audi S8"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/q3.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "Q3",
                "props": [
                    {
                        "key": "prop35",
                        "value": "Q3"
                    }
                ]
            }
        }
    ]
}'>Q3</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												Q3</li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">Q3</span>
				价格：RMB 377,000起</h1>
		<p>
			<br/>
			</p>
					
		<p>查看&nbspQ3</p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q3/q3/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q3/q3/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q3/q3/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>一汽－大众全新奥迪Q3，潮流重塑。以至美设计，改变思维的固有线条；以灵动驾驭，凌驾多元性能；以精湛品质，跨越你对级别的预先设定。只待与你的创意激情并驾齐驱，重塑潮流！</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_q3.png" alt="Audi Q3"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/q5.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "Q5",
                "props": [
                    {
                        "key": "prop35",
                        "value": "Q5"
                    }
                ]
            }
        }
    ]
}'>Q5</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/q5/q5.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "Q5",
                "props": [
                    {
                        "key": "prop35",
                        "value": "Q5"
                    }
                ]
            }
        }
    ]
}'>Q5</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">Q5</span>
				价格：RMB 383,600起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/q5/q5.html">查看&nbspQ5</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="http://www1.audi.cn/q5/" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "产品网站",
                "props": [
                    {
                        "key": "prop35",
                        "value": "产品网站"
                    }
                ]
            }
        }
    ]
}'>产品网站</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q5/q5/360__views.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q5/q5/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q5/q5/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q5/q5/q5_hybrid.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "Q5 hybrid",
                "props": [
                    {
                        "key": "prop35",
                        "value": "Q5 hybrid"
                    }
                ]
            }
        }
    ]
}'>Q5 hybrid</a>
		</li>
</ul>
			<p>奥迪Q5，进•享自由。一部动感而全能的SUV，它完美融合了运动型轿车的灵敏操控、SUV的越野安全以及旅行车灵活多变的内部空间。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_q5.png" alt="Audi Q5"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/q7.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "Q7",
                "props": [
                    {
                        "key": "prop35",
                        "value": "Q7"
                    }
                ]
            }
        }
    ]
}'>Q7</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/q7/q7.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "Q7",
                "props": [
                    {
                        "key": "prop35",
                        "value": "Q7"
                    }
                ]
            }
        }
    ]
}'>Q7</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">Q7</span>
				价格：RMB 821,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/q7/q7.html">查看&nbspQ7</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q7/q7/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q7/q7/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/q7/q7/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪Q7，势为强者。创造性地使运动性和多功能性完美结合。无论驰骋在平坦的城市道路，或是纵横在蜿蜒起伏的山间，都将呈现最为完美的驾控表现。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/_audi_q7.png" alt="Audi Q7"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/tt.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "TT",
                "props": [
                    {
                        "key": "prop35",
                        "value": "TT"
                    }
                ]
            }
        }
    ]
}'>TT</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/tt/tt_coupe.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "TT Coupé",
                "props": [
                    {
                        "key": "prop35",
                        "value": "TT Coupé"
                    }
                ]
            }
        }
    ]
}'>TT Coupé</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/tt/tt_roadster.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "TT Roadster",
                "props": [
                    {
                        "key": "prop35",
                        "value": "TT Roadster"
                    }
                ]
            }
        }
    ]
}'>TT Roadster</a></li>
										<li>
												<a href="/content/cn/brand/zh_new/models/tt/tts_coupe.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "TTS Coupé",
                "props": [
                    {
                        "key": "prop35",
                        "value": "TTS Coupé"
                    }
                ]
            }
        }
    ]
}'>TTS Coupé</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/tt/tts_roadster.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "TTS Roadster",
                "props": [
                    {
                        "key": "prop35",
                        "value": "TTS Roadster"
                    }
                ]
            }
        }
    ]
}'>TTS Roadster</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">TT Coupé</span>
				价格：RMB 519,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/tt/tt_coupe.html">查看&nbspTT Coupé</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tt_coupe/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tt_coupe/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tt_coupe/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪TT，让时尚，取悦你。纯粹设计，纯粹吸引。一个关于设计的里程碑。奥迪TT Coupé的特点从设计之初便彰显尽致，而且多年以后仍然悉数保留。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_tt_coupe.png" alt="Audi TT coupe"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">TT Roadster</span>
				价格：RMB 565,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/tt/tt_roadster.html">查看&nbspTT Roadster</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tt_roadster/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tt_roadster/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tt_roadster/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪TT，让时尚，取悦你。奥迪TT Roadster将奥迪TT的设计进一步推向前进。兼具运动刚性、高性能、情感的驾驶体验，浓缩了敞篷跑车的驾驶乐趣，跑车就应如此般。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_tt_roadster_1.png" alt="Audi TT Roadster"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">TTS Coupé</span>
				价格：RMB 662,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh_new/models/tt/tts_coupe.html">查看&nbspTTS Coupé</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tts_coupe/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tts_coupe/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tts_coupe/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪TT，让时尚，取悦你。TT家族上乘之作，在延续原有纯粹设计同时，更赋予奥迪TTS Coupé极致的动感元素与极速动力驱动。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_tts_coupe.png" alt="Audi TTS coupe"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">TTS Roadster</span>
				价格：RMB 708,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/tt/tts_roadster.html">查看&nbspTTS Roadster</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tts_roadster/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tts_roadster/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/tt/tts_roadster/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
</ul>
			<p>奥迪TT，让时尚，取悦你。奥迪TTS Roadster融入敞篷跑车的驾驶乐趣，让经典在瞬间变得生动无比。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_tts_roadster.png" alt="Audi TTS Roadster"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		<section class="nestingList">
				<h1><a href="/content/cn/brand/zh_home/tools/navigation/models/r8.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "R8",
                "props": [
                    {
                        "key": "prop35",
                        "value": "R8"
                    }
                ]
            }
        }
    ]
}'>R8</a></h1>
				<div class="flyout">
						<div class="inner">
							<div class="col">
								<ul class="nav">
									<li>
												<a href="/content/cn/brand/zh/models/r8/r8.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "R8 Coupé",
                "props": [
                    {
                        "key": "prop35",
                        "value": "R8 Coupé"
                    }
                ]
            }
        }
    ]
}'>R8 Coupé</a></li>
										<li>
												<a href="/content/cn/brand/zh/models/r8/r8-spyder.html" class="track-click" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "R8 Spyder",
                "props": [
                    {
                        "key": "prop35",
                        "value": "R8 Spyder"
                    }
                ]
            }
        }
    ]
}'>R8 Spyder</a></li>
										</ul>
							</div>
							<div class="articles">
								<article>
									       <div class="text">
		<h1>
				<span class="visuallyhidden">R8 Coupé</span>
				价格：RMB 2,328,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/r8/r8.html">查看&nbspR8 Coupé</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8/R8_China_edition.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "奥迪R8中国专享型",
                "props": [
                    {
                        "key": "prop35",
                        "value": "奥迪R8中国专享型"
                    }
                ]
            }
        }
    ]
}'>奥迪R8中国专享型</a>
		</li>
</ul>
			<p>奥迪R8，王者基因。完美的运动线条只是奥迪R8 Coupé出众内涵的昭示：超凡动感的性能和至臻完美的工艺，对技术精密性和车身驱动性的每一项要求几乎都接近极限。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/homepage/nav121109/audi_r8_coupe.png" alt="Audi R8 coupe"/></figure>

</article>
									<article class="visuallyhidden">
									   <div class="text">
		<h1>
				<span class="visuallyhidden">R8 Spyder</span>
				价格：RMB 2,498,000起</h1>
		<p>
			<br/>
			</p>
					
		<p><a class="button go" href="/content/cn/brand/zh/models/r8/r8-spyder.html">查看&nbspR8 Spyder</a></p>
		<ul class="links">
					<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8-spyder/new360.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "360°展示",
                "props": [
                    {
                        "key": "prop35",
                        "value": "360°展示"
                    }
                ]
            }
        }
    ]
}'>360°展示</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8-spyder/multimedia_experience.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "多媒体体验",
                "props": [
                    {
                        "key": "prop35",
                        "value": "多媒体体验"
                    }
                ]
            }
        }
    ]
}'>多媒体体验</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8-spyder/specification_price/specification_table.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "性能装备表",
                "props": [
                    {
                        "key": "prop35",
                        "value": "性能装备表"
                    }
                ]
            }
        }
    ]
}'>性能装备表</a>
		</li>
<li>
	<a class="special track-click" href="/content/cn/brand/zh/models/r8/r8/R8_China_edition.html" data-tracking='{
    "trackers": [
        {
            "tracker": "Omniture",
            "eventId": "prop35",
            "tracking_options": {
                "eventTargetUrl": "奥迪R8中国专享型",
                "props": [
                    {
                        "key": "prop35",
                        "value": "奥迪R8中国专享型"
                    }
                ]
            }
        }
    ]
}'>奥迪R8中国专享型</a>
		</li>
</ul>
			<p>奥迪R8，浮华褪尽，忘我极情。融汇了奥迪所有的尖端科技，孕生天赋杰作，奥迪R8 Spyder以无可替代的无上审美行至人们面前，带来尽情享受的驾驭乐趣。</p>		
	</div>
	
	<figure class="img">
		<img src="https://pre-cms2.audi.com/content/dam/ngw/cn/1_0_model/new_nav/audi_r8_spyder.png" alt="Audi R8 spyder"/></figure>

</article>
									</div>
						</div>
						</div>
				</section>
		</aside>
	<footer id="footer">
    <div class="audibar clearfix">
	<ul class="left horizontalNav">
	<li class="separate">
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/Configurator.html" target="_blank" title="奥迪车型配置器" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "奥迪车型配置器"}}]'>奥迪车型配置器</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/excellence.html" title="奥迪卓越" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "奥迪卓越"}}]'>奥迪卓越</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/audiclub.html" target='_blank' title="奥迪俱乐部" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "奥迪俱乐部"}}]'>奥迪俱乐部</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/Usertb.html" title="申请试驾" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "申请试驾"}}]'>申请试驾</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/dealer.html" title="经销商查询" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "经销商查询"}}]'>经销商查询</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/obtain.html" title="索取产品手册" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "索取产品手册"}}]'>索取产品手册</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/enewsletter.html" title="新闻专递" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "新闻专递"}}]'>新闻专递</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/glossary1.html" title="奥迪百科" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "奥迪百科"}}]'>奥迪百科</a>
					</li>
				<li>
						<a href="/content/cn/brand/zh_home/tools/navigation/audibar/app.html" title="奥迪App" class="track-click" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "奥迪App"}}]'>奥迪App</a>
					</li>
				</ul><ul class="right horizontalNav">
		<li>
					<a class='track-click' href="/content/cn/brand/zh_home/tools/navigation/audibar/audi_tv.html" target='_blank' title="audi tv" data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "audi tv"}}]'>
						      audi tv</a>
						 </li>
			<li>
					<a class='socialIcon audi_share_icon_reddit track-click' href="/content/cn/brand/zh_home/tools/navigation/audibar/weibo.html" target='_blank' title=" " data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "&nbsp;"}}]'>
						      &nbsp;</a>
						 </li>
			<li>
					<a class='socialIcon audi_share_icon_wordpress track-click' href="/content/cn/brand/zh_home/tools/navigation/audibar/renren.html" target='_blank' title=" " data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "&nbsp;"}}]'>
						      &nbsp;</a>
						 </li>
			<li>
					<a class='socialIcon audi_share_icon_blogger track-click' href="/content/cn/brand/zh_home/tools/navigation/audibar/kaixin.html" target='_blank' title=" " data-tracking='[{"tracker":"Omniture","eventId":"prop32","tracking_options": {"eventTargetUrl": "&nbsp;"}}]'>
						      &nbsp;</a>
						 </li>
			</ul>
</div><div class="meta">
	<ul class="horizontalNav">
	<li class="languageselector" data-component="func_language">
		<a href="#" title="Choose language">Choose language</a>
	<article class="selector">
		<h1>Choose language</h1>
		<form action="/mvc.do/cms4i/changeLanguage" method="post" name="languageSelector" class="frm">
			<label for="language_selection"></label> 
			<select name="newlanguage"
				id="language_selection" onChange="javascript:submit();">
				<option
						
						value="/content/cn/brand/zh_home/tools/navigation/languages/zh.html">
						Chinese</option>
				<option
						
						value="/content/cn/brand/zh_home/tools/navigation/languages/en.html">
						English</option>
				</select>

			<div class="visuallyhidden">
				<input type="submit" value="Submit" />
			</div>

		</form>
		<a class="icon icons-close-smaller" href="#">Close</a>
	</article>
</li>
<li>
			<a href="#overlay/load/content/cn/brand/zh_home/tools/navigation/meta/sitemap.html?wcmmode=disabled" title="网站地图" class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "网站地图","props": [ { "key": "prop33",  "value": "网站地图" }]}}]}'>
               网站地图</a>	
		</li>
	<li>
			<a href="#overlay/load/content/cn/brand/zh_home/tools/navigation/meta/privacy.html?wcmmode=disabled" title="隐私权/版权" class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "隐私权/版权","props": [ { "key": "prop33",  "value": "隐私权/版权" }]}}]}'>
               隐私权/版权</a>	
		</li>
	<li>
			<a href="http://www.audi.com/com/brand/en.html.html" title="奥迪全球" target='_blank' class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "奥迪全球","props": [ { "key": "prop33",  "value": "奥迪全球" }]}}]}'>
               奥迪全球</a>	
		</li>
	<li>
			<a href="http://www.faw-vw.com/.html" title="一汽-大众" target='_blank' class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "一汽-大众","props": [ { "key": "prop33",  "value": "一汽-大众" }]}}]}'>
               一汽-大众</a>	
		</li>
	<li>
			<a href="#overlay/load/content/cn/brand/zh_home/tools/navigation/meta/rss.html?wcmmode=disabled" title="RSS" class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "RSS","props": [ { "key": "prop33",  "value": "RSS" }]}}]}'>
               RSS</a>	
		</li>
	<li>
			<a href="http://www.audi.com/cn/brand/en.html.html" title="English Version" class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "English Version","props": [ { "key": "prop33",  "value": "English Version" }]}}]}'>
               English Version</a>	
		</li>
	<li>
			<a href="http://www.miibeian.gov.cn/.html" title="吉ICP备09000793号" target='_blank' class="track-click" data-tracking='{"trackers": [{ "tracker": "Omniture", "eventId": "prop33", "tracking_options": { "eventTargetUrl": "吉ICP备09000793号","props": [ { "key": "prop33",  "value": "吉ICP备09000793号" }]}}]}'>
               吉ICP备09000793号</a>	
		</li>
	</ul><p class="copyright">&copy; 2013. AUDI AG. All rights reserved</p>
</div>

<!-- 发送手机浮层 -->







</footer>

</div>
	<script type="text/javascript">
  //<![CDATA[
    window.jQuery || document.write("<script type=\"text/javascript\" src=\"http://www.audi.de/cms4i/cms4i/js/libs/jquery-1.7.2.min.js\"><\/script>")
  //]]>
</script>

<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" />

<%--
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
				
				if($(".js_seach_result").is(":hidden")){
					$(".js_seach_result").show(function(){
						$(".mCustomScrollbar").mCustomScrollbar({
							scrollButtons:{
								enable:false
							}
						});
					});
				}				
			});
			$(".chaxun_xiang").hide();
			/*查看经销商详情*/
			$(".js_detail_list").on("click",function(){	
				//$('.takepage div').eq(2).show().siblings().hide();
				
				$(this).parents(".chaxun_lies").hide();
				$(".chaxun_xiang").show(function(){
					$(".mCustomScrollbar").mCustomScrollbar("update");
				});
				//
				$('.w_ico_box').show();
				return false;
			});
			/*返回经销商列表*/
			$(".chaxun_xiang .w_back_lie").on("click",function(){
				///$('.takepage div').eq(1).show().siblings().hide();
				$(".chaxun_xiang").hide();
				$(".chaxun_lies").show(function(){
					$(".mCustomScrollbar").mCustomScrollbar("update");
				});
				$('.w_ico_box').hide();
				return false;
			});
			/*分享，打印*/
			$('.w_ico_box').hide();
			var index=0;
			$(".dealer").find("span").each(function(){
				$(this).click(function(){
					index = $(this).index();
					showpage(index);					
				});
			});
			function showpage(i){
				
				$(".dealer").css("background-image","url(images/chaxune_banner"+(i+1)+".jpg)")
			}
		});
	</script>

 --%>

	<div id='popup_login'></div>
<div class='fs_mid'>
	<div class='fs_fs'>
		<p class='fs_title'>Sent information to mobile phone</p>
		<table>
			<tr>
				<td><span class='word_apacing19'>Name :</span></td>
				<td><input type='text' name='username'></td>
			</tr>
			<tr>
				<td style='word-spacing:14px'>Mobile :</td>
				<td><input type='text' name='phone'></td>
			</tr>
		</table>
		<p class='fsnow engsh'></p>
	</div>
	<div class='fs_cg'>
		<p class='fs_title' style='margin-bottom:27px'>Sent information to mobile phone</p>
		<p>Already send,Please click "Sent again" after 60 second.</p>
		<p style='margin-top:20px'><span style='font-size:30px'>58</span>s</p>
		<p class='zfs engfh'></p>
	</div>
	<p class='popup_delete'></p> 
</div>

<script type="text/javascript">
		var wrongBackground="url('images/baocuo.jpg')";//报错图片被屏蔽了，需要重新加载
		//$("#sousuo1_en_wrong").hide();
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
					//$("#sousuo1_en_wrong").css("background-image",wrongBackground);
					//$("#sousuo1_en_wrong").html('Select the Province');
					//$("#sousuo1_en_wrong").show();
					alert("Please Select the Province！");
				} else {
					document.getElementById("form1").submit();
				}				
			});
			
			/*function showpage(i){
				
				$(".deal").css("background-image","url(images/chaxun_banner"+(i+1)+".jpg)")
			}
			showpage(0); */
			//$(".deal").css("background-image","url(images/chaxun_banner1.jpg)")
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
 		//$("#sousuo1_en_wrong").css("background-image",wrongBackground);
		//$("#sousuo1_en_wrong").html('Select the Province');
		//$("#sousuo1_en_wrong").show();
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
 			if(flashMovie("AgencyMap").ready()!="1"){
 		 		//alert("Data is loading.Please wait for a moment...!");
 		 		//使用复层的样式 load
 		 		$('.loading').show();
 		 		document.getElementById("fw").value=document.getElementById("fwids").value;
 		 		return;	
 		 	}
		  document.getElementById("pid").options.length=0;
		  document.getElementById("cid").options.length=0;
		  document.getElementById("pidids").value="";
		  document.getElementById("fwid").value=id;
	      xhrs = createXHR();
		  xhrs.open("post","dealer_pross.action?en=1&lbids="+id);
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
 		$('#cid').siblings('.caption').text('Please Select');
 		if(id!=""){
 		  	if(flashMovie("AgencyMap").ready()!="1"){
 		 		//alert("Data is loading.Please wait for a moment...!");
 		 		$('.loading').show();
 		 		document.getElementById("pid").value=document.getElementById("pidids").value;
 		 		if(document.getElementById("pidids").value==""){
 		 			document.getElementById("pid").options[0].selected=true; 
 		 		}
 		 		return;
 		 	} 
		  document.getElementById("cid").options.length=1;
	      xhr = createXHR();
		  xhr.open("post","dealer_ctiys.action?en=1&pid="+id+"&lbids="+document.getElementById("fwid").value);
	       xhr.onreadystatechange = callbackcity2;
		   xhr.send(null); 
		    	
		   //在这里是JS调用AS	 	
 	     flashMovie("AgencyMap").changeProvince(id);
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
		   $('.loading').hide();	
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