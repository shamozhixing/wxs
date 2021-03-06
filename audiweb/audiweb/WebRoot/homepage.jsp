<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7 ]> <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8 ]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if IE 9 ]> <html class="no-js ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="zh">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>联系奥迪 &gt; 欢迎来到一汽-大众奥迪</title>
<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/css.css" type="text/css">

<!--[if IE ]>
	<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/ie.css" rel="stylesheet" />
<![endif]-->


<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/hotfix.css" rel="stylesheet"/>
<link href="http://www.audi.de/cms4i/cms4i/css/print.css" media="print" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i-models/docroot/cms4i-models.css" type="text/css">
<%@include file="common_css_js.jsp"%>
<script type="text/javascript" src="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/js/libs.js"></script>


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
	</ul>
<jsp:include page="common_heard.jsp"></jsp:include>
<div class="container">
<div class="clearfix home" id="main">
  <div id="cn_maincontent" style="position:relative;">
    	<jsp:include page="common_login.jsp"></jsp:include>
      <div class="page_title">联系奥迪</div>
      <div class="intro_text">奥迪为每一位尊贵的用户提供不同的个性化体验。无论您是奥迪官网的注册用户，或是初次到访的奥迪汽车爱好者，我们都将尽所能，满足您的需求，让您尽享奥迪非凡礼遇。<br>
如有任何疑问，欢迎随时致电一汽-大众24小时客户服务热线：4008-171-888,(0431)85990888。</div>
      <table width="971" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="332"><img src="images/connect.jpg" width="306" height="109"></td>
            <td><img src="images/yuyue.jpg" width="306" height="109"></td>
            <td width="306"><img src="images/ask.jpg" width="306" height="109"></td>
        </tr>        
        <tr>
            <td>
                <span class="txtblock">
                    <a href="contact_us.action" class="title" hidefocus='true' onfocus="this.blur();">联系我们</a>
                    <a href="contact_us.action" class="txt">用心倾听，及时回应。如果您想进一步了解一汽-大众奥迪品牌及产品，或有其他任何疑问，请随时与我们联系。</a>
                </span>
            </td>
            <td>
                <span class="txtblock">                   
					<a href="testdrive.action" class="title" hidefocus='true' onfocus="this.blur();">预约试驾</a>
                    <a href="testdrive.action" class="txt" onfocus="this.blur();">在线预约，激情试驾。对您所钟爱的奥迪汽车倾慕已久？即刻预约试驾，体验前所未有的动感驾驭！</a>
                </span>
            </td>
            <td>
                <span class="txtblock">
                    <a href="dealer_procity.action" class="title">查询经销商</a>
                    <a href="dealer_procity.action" class="txt">查看一汽-大众奥迪全国特许经销商分布网点，快速查找离您最近的经销商所在地。</a>

                </span>
            </td>
        </tr>
        <tr>
            <td width="325"><img src="images/home_04.jpg" width="306" height="109"></td>
            <td><img src="images/home_05.jpg" width="306" height="109"></td>
            <td width="306"><img src="images/home_06.jpg" width="306" height="109"></td>
        </tr>        
        <tr>
            <td>
                <span class="txtblock">
                    <a href="brochure.action" class="title">索取产品手册</a>
                    <a href="brochure.action" class="txt">每一款奥迪车型，皆拥有着非凡智慧科技和传奇工艺。<br>您可选择任意车型，索取印刷版本产品手册以获知更多。</a>
                </span>
            </td>
            <td>
                <span class="txtblock">
                    <a href="contactMagazine.action" class="title">索取《奥迪杂志》</a>
                    <a href="contactMagazine.action" class="txt">《奥迪杂志》引领和倡导的进取精神和优雅的生活方式。如您需要，我们将为您免费提供订阅和邮寄服务。</a>
                </span>
            </td>
            <td>
                <span class="txtblock">
                    <a href="enews.action" class="title">订阅奥迪新闻专递</a>
                    <a href="enews.action" class="txt">注册订阅奥迪新闻专递，第一时间获悉奥迪品牌活动盛事和实时动态，定期收到最新新闻播报和信息分享。</a>
                </span>
            </td>
        </tr>
        <tr>
            <td width="325"><img src="images/home_07.jpg" width="306" height="109"></td>
            <td><img src="images/home_08.jpg" width="306" height="109"></td>
            <td width="306"><img src="images/home_09.jpg" width="306" height="109"></td>
        </tr>        
        <tr>
            <td>
                <span class="txtblock">
                    <a href="communicate.action" class="title">咨询/投诉/建议</a>
                    <a href="communicate.action" class="txt">奥迪不仅致力于打造领先科技的非凡座驾更为尊贵用户提供专业的咨询服务。我们非常愿意倾听您的意见和建议。</a>
                </span>
            </td>
            <td>
                <span class="txtblock">
                    <a href="#" class="title">常见问答</a>
                    <a href="#" class="txt">通过常见问答，查看您所遇到的问题是否已被解决，方便您更加快捷地找到所需求的信息。</a>
                </span>
            </td>
            <td>
                <span class="txtblock">
                    <a href="#" class="title">职位申请</a>
                    <a href="#" class="txt">欢迎加入一汽-大众奥迪。我们期待与拥有进取精神的卓越人才合作，一起创造未来新的传奇。</a>
                </span>
            </td>
        </tr>
      </table>

      
    </div>
</div>
<%@include file="common_foot.jsp"%>
<%@include file="common_login_div.jsp"%>
<s:if test="activateSuccess"><script>$(function(){
$('.zhuce_mid').show();	
$('.zhuce_mid>div').eq(2).show().siblings('div').hide();
$('.zhuce_mid').css('height','321px');
$('#popup_login').css({
					height:function(){
					/*登陆框 登录按钮*/
					var windowHeight = $(window).height();		
					var iDoc = $(document).height();					
						var oHeight = $(".zhuce_mid").height();
						windowHeight = iDoc > windowHeight? iDoc:windowHeight;
						oHeight = windowHeight > oHeight? windowHeight:oHeight;
						return oHeight;
					}
				}).fadeTo(300,0.5);
		});</script></s:if>
		
<s:if test="isResetPwdUrl">
<script>$(function(){
$('.login_mid').show();	
$('.login_mid>div').eq(3).show().siblings('div').hide();
$('#popup_login').css({
					height:function(){
					/*登陆框 登录按钮*/
					var windowHeight = $(window).height();		
					var iDoc = $(document).height();					
						var oHeight = $(".zhuce_mid").height();
						windowHeight = iDoc > windowHeight? iDoc:windowHeight;
						oHeight = windowHeight > oHeight? windowHeight:oHeight;
						return oHeight;
					}
				}).fadeTo(300,0.5);
		});</script>
</s:if>
</body>
</html>
