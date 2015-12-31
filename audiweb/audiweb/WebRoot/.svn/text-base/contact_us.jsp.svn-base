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
<head>
	<meta charset='utf-8'>
	<title>联系我们 &gt 联系奥迪 &gt 欢迎来到一汽-大众奥迪</title>
    <!--[if IE ]>
	<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/ie.css" rel="stylesheet" />
    <![endif]-->
    
  
	<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/css.css" type="text/css">
	<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/hotfix.css" rel="stylesheet"/>
    <link href="http://www.audi.de/cms4i/cms4i/css/print.css" media="print" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i-models/docroot/cms4i-models.css" type="text/css">
	<%@include file="common_css_js.jsp"%>
	<script type="text/javascript" src="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/js/libs.js"></script>
    
</head>
<body class="DE de" data-country="DE" data-lang="de">
<%@include file="common_navigation.jsp"%>
   	<ul class="horizontalNav left breadcrumbs">
   	    <li>
        	<a href="/content/cn/brand/zh.html">首页</a>
        	<span class="w_divider"></span>
        </li>
   		<li><a href="homepage.action">联系奥迪</a><span class="w_divider"></span></li>
        <li>联系我们</li>
	</ul>
	
<%@include file="common_heard.jsp"%>
</div>
<div class="container w_margin_b3">
     <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;">
         <jsp:include page="common_login.jsp"></jsp:include>
        <div class="page_title">联系我们</div>
        <div class='takepage_con'>
            <div class='w_banner'>
               <img src="images/c_b_01.jpg">
            </div>
        </div>
        <div class='w_content'>	
			<p class="f_14">用心倾听，及时回应。如果您想进一步了解一汽-大众奥迪品牌及产品，或有其他任何疑问，请随时与我们取得联系。</p>
			<p class="f_14">您可通过以下方式联系我们：</p>
            <p class="f_14 w_margin1 f_w">电子邮件</p>
            <p>如果您有任何关于奥迪品牌或产品的问题，请发邮件给我们。</p>
            <p><span class="colorred"><img src="images/ld.jpg"></span>发送邮件至：<a href="mailto:service@audi.cn"> service@audi.cn</a> </p>
            <P class="f_14 w_margin1 f_w">24小时客户服务热线</P>
            <P>如欲了解更多信息，敬请致电一汽-大众24小时客户服务热线：</P>
			<P>4008-171-888 或（0431）85990888。</P>
            <div class="bd_dotted"></div>
        </div>
      </div>
    </div>
<%@include file="common_foot.jsp"%>
<%@include file="common_login_div.jsp"%>
	<script type="text/javascript">
		
		$(function(){
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			$('input.myClass').Checkable({
				color: 'blue'
			});
		});	
		
		(function(){

 			var index = 0;
		
			$('.takepage div').eq(0).show().siblings().hide();
			$('.takepage_slidecon>div').eq(0).show().siblings().hide();
			$('.next').click(function(){
				index++;
				showpage(index);
			});
			$('.pre').click(function(){
				index--;
				showpage(index);
			})
			$('.pres').click(function(){
				index--;
				showpage(index);
			})
			function showpage(i){
				$('.takepage div').eq(i).show().siblings().hide();
			 	$('.takepage_slidecon>div').eq(i).show().siblings().hide();
			}
			/*提交按钮*/
			$('.refer').click(function(){
				$('#takepage_sucss').show().siblings().hide();
				$('.takepage_con').css('display','none');
			})
		})();
	</script>
</body>
</html>

