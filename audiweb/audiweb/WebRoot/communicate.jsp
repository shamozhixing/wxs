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
<meta charset='utf-8'>
	<title>咨询/投诉/建议&gt;联系奥迪&gt;欢迎来到一汽-大众奥迪</title> 
<head>
	<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/css.css" type="text/css">
	
	<!--[if IE ]>
		<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/ie.css" rel="stylesheet" />
	<![endif]-->
	 
	<link type="text/css" media="screen" href="http://www.audi.de/cms4i/cms4i/css/hotfix.css" rel="stylesheet"/>
	<link href="http://www.audi.de/cms4i/cms4i/css/print.css" media="print" rel="stylesheet" type="text/css"/>
	<%@include file="common_css_js.jsp"%>
	<link rel="stylesheet" href="http://www.audi.de/apps/audi/cms4i-models/docroot/cms4i-models.css" type="text/css">
	<script type="text/javascript" src="http://www.audi.de/apps/audi/cms4i/docroot/cms4i/js/libs.js"></script>
	<script type="text/javascript" src="/etc/vehiclestore/50000_de/_jcr_content/openconfigurator.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/contactaudi_main.css">
	<style>.w_tab_sub_box .prettyradio label{margin:0 19px 0 15px;}</style>
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
   		<li><a href="homepage.action">联系奥迪</a><span class="w_divider"></span></li>
        <li>咨询/投诉/建议</li>
	</ul>
<%@include file="common_heard.jsp"%>
</div>
<div class="container">
    <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;">      
      <jsp:include page="common_login.jsp"></jsp:include>   
        <div class="page_title">咨询/投诉/建议</div>
        <div class='takepage_con'>
            <div class='takepage'>
               <div class="sub_menu commu">
                	<span class="sub_menu_commu_1" onclick="clickHeard(0)"></span>
                    <span class="sub_menu_commu_2" onclick="clickHeard(1)"></span>
                    <span class="sub_menu_commu_3" onclick="clickHeard(2)"></span>                   
                </div>
            </div>
        </div>
        <div class='takepage_slidecon'>		
            <div class="w_contaier " style='min-height:310px;padding-top:0'>
            	<ul class="w_tab_box">
                	<li class="js_title js_advice f_14"><input type="radio"  class="myClass" value="1" name="answersex" data-label="咨询" data-color="blue"/></li>
                    <li class="js_title js_complaints f_14"><input type="radio"  class="myClass" value="2" name="answersex" data-label="投诉" data-color="blue"/></li>
                    <li class="js_title js_proposal f_14"><input type="radio"  class="myClass" value="3" name="answersex" data-label="建议" data-color="blue"/></li>
                </ul>                
               <div class="w_tab_content clearfix js_hidden">
                	<div class="tab_list">奥迪拥有全面、专业的客户服务咨询系统，<br>如果您想进一步了解一汽-大众奥迪品牌及<br>产品，我们将欣然为您提供解答和帮助。</div>
                    <div class="tab_list">尽我所能，全心为您。如果您在售前和售后<br>等过程中遇到麻烦或其他问题，请告诉我们。<br>我们将尽快与您取得联系，以便及时妥善处理您的问题。</div>
                    <div class="tab_list">时刻聆听您的声音。您的每一个建议都非常重要，如果您有任何的建议和意见，请与我们联系，我们将非常愿意聆听您的声音，以便在将来为您提供更加卓越的服务。</div>
                </div>
                <div class="w_tab_sub_box">
                	<div class="tab_sub_list">
                    	<p>奥迪拥有全面、专业的客户服务咨询系统，如果您想进一步了解一汽-大众奥迪品牌及产品，<br>我们将欣然为您提供解答和帮助。</p>
                        <p class="w_margin5"><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p>
                        <P class="w_margin3"><span class="tip">*</span> 咨询问题描述：</P>
                        <div>
                        	<textarea class="w_textarea" name="caDescription"  
                        	onblur="vaialK('caDescription','caDescription_wrong',wrongObj.caDescription_wrong)"
                        	id='caDescription' cols="" rows="">请您在此写下想要咨询的问题，我们将在第一时间为您解答。</textarea>               
                        </div>     
                        <p class='combao'><span class="wrong" id="caDescription_wrong"></span> </p>                  
                        <div class="w_margin4 clearfix" style="margin:0;">                        	 
                        	<span class="span_block">您倾向于我们何时致电联系您：</span>
                        	<div class="f_l">                        		      						
                                <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="caWhen" class="select" name="caWhen" style="opacity: 0.0001; z-index: 2;">
                                           <option value="">请选择</option>
                                            <option value="0">工作日</option>
                                            <option value="1">节假日</option>
                                            </select>
                                    </fieldset>
                                </form>        						
                                <span class="span1">工作日</span>
                        	</div> 
                        	<div class="f_l">                        		      						
                                <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="caTiming" class="select" name="caTiming" style="opacity: 0.0001; z-index: 2;">
                                            <option value="">请选择</option>
                                            <option value="中午">中午</option>
                                            <option value="下午">下午</option>
                                            </select>
                                    </fieldset>
                                </form>        						
                                <span class="span1">时间</span>
                        	</div>                                
                        </div>
                    </div>
                    <div class="tab_sub_list">
                    	<p>尽我所能，全心为您。如果您在售前和售后等过程中遇到麻烦或其他问题，请告诉我们。我们将尽快与您取得联系，<br>以便及时妥善处理您的问题。</p>
                        <p class="w_margin5"><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p>
                        <div  class="clearfix w_from_section">
                        	<span class="span_block communicate_section"><span  class="tip">*</span>投诉类型：</span>
                        	<div  class="w_row f_l" style="">
                        		<span class="js_button js_button_q"><input type="radio" onchange="wrongCucccess('ccType_wrong');" class="myClass"name="ccType" data-label="售前" value="1"/></span>
	                            <span class="js_button js_button_h"><input type="radio" onchange="wrongCucccess('ccType_wrong');" class="myClass"name="ccType" data-label="售后" value="2"/></span>
	                            <span class="js_button js_button_s"><input type="radio"  onchange="wrongCucccess('ccType_wrong');" class="myClass"name="ccType" data-label="二手车" value="3"/></span>
                        	</div>   
                        	<span class="wrong" id="ccType_wrong"></span>                     	
                        </div>
                        <div class="sell_tab_box">                        	
                    		<div class="clearfix w_from_section">
                    			<span class="span_block communicate_section"><span class="tip">*</span>选择经销商：</span>
                    			<div class="w_row f_l">		                        	
		                        	<div class="f_l">                        		      								                            
                                		<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
		                                    <fieldset class="longlabels" style=" width:105px">
		                                        <select id="ccProvince" onchange="change_dealercitys('ccCity',this.value,'');$('#ccCity').siblings('.caption').text('请选择');$('#ccDealer').siblings('.caption').text('请选择');" class="select" name="ccProvince" 
		                                        onblur="vaialK('ccProvince','ccProvince_wrong',wrongObj.ccProvince_wrong)"
		                                        style="opacity: 0.0001; z-index: 2;">
		                                        	<option value="">请选择</option>
		                                        </select>
		                                    </fieldset>
		                                </form>     						
		                                <span class="span1">省</span>
		                        	</div> 
		                        	<div class="f_l">		                              
                                   		 <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
		                                    <fieldset class="longlabels" style=" width:105px">
		                                        <select  id="ccCity" class="select" name="ccCity" 
		                                        onblur="vaialK('ccCity','ccCity_wrong',wrongObj.ccCity_wrong)"
		                                        onclick="change_dealers('ccDealer',this.value,'')" onchange="$('#ccDealer').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
	                                                 <option value="">请选择</option>
												   </select>
		                                    </fieldset>
		                                </form>          						
		                                <span class="span1">市</span>
		                        	</div>  
	                        	</div>
	                        	<span class="wrong" id="ccProvince_wrong"></span>
	                        </div>
	                        <div class="clearfix w_from_section">
	                        	<span class="span_block communicate_section"></span>
	                        	<div class="w_row f_l">
                                	<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
		                                <fieldset class="longlabels" style=" width:204px">
		                                    <select id="ccDealer" class="select" name="ccDealer" 
		                                     onblur="vaialK('ccDealer','ccDealer_wrong',wrongObj.ccDealer_wrong)"
		                                    style="opacity: 0.0001; z-index: 2;">
											  <option value="">请选择</option>
		                                    </select>
		                                </fieldset>
		                            </form>       						
		                            <span class="span1">经销商</span>
	                        	</div>
	                        	<span class="wrong" id="ccDealer_wrong"></span>
	                        </div>
	                        <div class="hidden js_sub_tab">
		                        <div class="clearfix w_from_section">
		                        	<span class="span_block communicate_section"><span class="tip">*</span>车辆型号：</span>
		                        	<div class="w_row f_l">	                        		
		                        		<input type="text"name="ccModel" id='ccModel'style="width:240px" onblur="vaialK('ccModel','ccModel_wrong',wrongObj.ccModel_wrong)">
		                        	</div>	                        	
		                        	<span class="wrong" id="ccModel_wrong"></span>
		                        </div>
		                        <div class="clearfix w_from_section">
		                        	<span class="span_block communicate_section"><span class="tip">*</span>购车时间：</span>
		                        	<div class="w_row f_l">
			                        	<div class="f_l">                        		      									                                 
                                   			 <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
			                                    <fieldset class="longlabels" style=" width:105px">
			                                        <select id="ccBuyyear" class="select" name="ccBuyyear" style="opacity: 0.0001; z-index: 2;" 
			                                        onchange="$('#ccBuymonth').val('');$('#ccBuymonth').siblings('.caption').text('请选择');"
			                                        	onblur="vaialK('ccBuyyear','ccBuyyear_wrong',wrongObj.ccBuyyear_wrong)">
		                                             <option value="">请选择</option>
		                                             </select>
			                                    </fieldset>
			                                </form>      						
			                                <span class="span1">年</span>

			                        	</div> 
			                        	<div class="f_l">                        		      						
                                    		<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
			                                    <fieldset class="longlabels" style=" width:105px">
			                                        <select id="ccBuymonth" class="select" name="ccBuymonth" style="opacity: 0.0001; z-index: 2;"
			                                        onblur="vaialK('ccBuymonth','ccBuyyear_wrong',wrongObj.ccBuymonth_wrong)">
			                                        <option value="">请选择</option>
			                                        </select>
			                                    </fieldset>
			                                </form>        						
			                                <span class="span1">月</span>
			                        	</div>  
		                        	</div>
		                        	<span class="wrong" id='ccBuyyear_wrong'></span>
		                        </div>
		                        <div class="clearfix w_from_section">
		                        	<span class="span_block communicate_section"><span class="tip">*</span>车架号：</span>
		                        	<div class="w_row f_l">
		                        		<input type="text" name="ccFootnum" id="ccFootnum" style="width:240px"
		                        		onblur="if(!emptyVaila(this)){vaialKD('ccFootnum','ccFootnum_wrong')}"
		                        		>
		                        	</div>	
		                       <!-- 		<span style="display:inline-block;padding-top:2px;">  
		                       onblur="vaialK('ccFootnum','ccFootnum_wrong',wrongObj.ccFootnum_wrong)"s   -->
		                        		<span class='note' id="ccFootnum_wrong"></span>
		                        		<span class="tixing">请填写行驶证上的17位车架号。</span>
		                        	</span>	                    	
		                        </div>
		                        <div class="clearfix w_from_section">
		                        	<span class="span_block communicate_section"><span class="tip"> </span>车辆行驶里程：</span>
		                       <!-- 	<div class="w_row f_l">
			                        	<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
			                                <fieldset class="longlabels" style=" width:216px">
			                                    <select id="ccKilometer" class="select" name="ccKilometer" style="opacity: 0.0001; z-index: 2;">
			                                        <option value="">请选择</option>
			                                        <option value="100">100</option>
			                                        <option value="300">300</option>
			                                        <option value="500">500</option>
			                                        <option value="700">700</option>
			                                        <option value="900">900</option>
			                                        <option value="1000">1000</option>
			                                        <option value="2000">2000</option>
			                                        </select> 
			                                </fieldset>
			                            </form>      
			                             						
			                            <span class="span1">公里</span>
		                        	</div>   -->  
		                        	<div class="w_row f_l">	                        		
		                        		<input type="text" name="ccKilometer" id="ccKilometer" style="width:215px">
		                        		<span style='margin-top:5px'>公里</span>
		                        	</div>
		                        </div>
	                        </div>
                        </div>
                        
                        <P class="w_margin3"><span class="tip">*</span> 投诉问题描述：</P>
						<div>
						<textarea  class="w_textarea"name="ccDescription" id="ccDescription" 
						onblur="vaialK('ccDescription','ccDescription_wrong',wrongObj.ccDescription_wrong)"
						cols="" rows="">您在此写下遇到的问题，我们将尽快为您妥善处理.</textarea>
						</div>
						<p class='combao'><span class="wrong" id="ccDescription_wrong"></span>  </p>
                        <div class="w_margin4 clearfix" style="margin:0;">
                        	<span class="span_block">您倾向于我们何时致电联系您：</span>
                        	<div class="f_l">                        		      						
                                <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="ccWhen" class="select" name="ccWhen" style="opacity: 0.0001; z-index: 2;">
                                            <option value="">请选择</option>
                                            <option value="0">工作日</option>
                                            <option value="1">节假日</option>
                                            </select>
                                    </fieldset>
                                </form>        						
                                <span class="span1">工作日</span>
                        	</div> 
                        	<div class="f_l">                        		      						
                                <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="ccTiming" class="select" name="ccTiming" style="opacity: 0.0001; z-index: 2;">
                                            <option value="">请选择</option>
                                            <option value="中午">中午</option>
                                            <option value="下午">下午</option>
                                            </select>
                                    </fieldset>
                                </form>        						
                                <span class="span1">时间</span>
                        	</div>                                
                        </div>
                    </div>
                    <div class="tab_sub_list">
                    	<p>时刻聆听您的声音。您的每一个建议都非常重要，如果您有任何的建议和意见，请与我们联系，<br>我们将非常愿意聆听您的声音，以便在将来为您提供更加卓越的服务。</p>
                        <p class="w_margin5"><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p>
                        <P class="w_margin3"><span class="tip">*</span> 建议内容描述：</P>
                        <div>
                        	<textarea  class="w_textarea"name="cpDescription" 
                        	onblur="vaialK('cpDescription','cpDescription_wrong',wrongObj.cpDescription_wrong)"
                        	id='cpDescription' cols="" rows="">请在此写下您的建议，我们诚挚感谢您对一汽-大众奥迪品牌的关注和支持！</textarea>
                        </div>
                         <p class='combao'><span class="wrong" id="cpDescription_wrong"></span>  </p>
                        <div class="w_margin4 clearfix" style="margin:0;">
                        	<span class="span_block">您倾向于我们何时致电联系您：</span>
                        	<div class="f_l">                        		      						
                                <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="cpWhen" class="select" name="cpWhen" style="opacity: 0.0001; z-index: 2;">
                                            <option value="">请选择</option>
                                           <option value="0">工作日</option>
                                            <option value="1">节假日</option>
                                            </select>
                                    </fieldset>
                                </form>        						
                                <span class="span1">工作日</span>
                        	</div> 
                        	<div class="f_l">                        		      						
                                <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="cpTiming" class="select" name="cpTiming" style="opacity: 0.0001; z-index: 2;">
                                            <option value="">请选择</option>
                                            <option value="中午">中午</option>
                                            <option value="中午">下午</option>
                                            </select>
                                    </fieldset>
                                </form>        						
                                <span class="span1">时间</span>
                        	</div>                                
                        </div>
                    </div>
					<div style='height:41px;border-bottom:1px black dotted;' class='zr_line'></div>
                </div>
                <div class=" bottom_input_box js_next" style='border:none'>
                    <span class='next'></span>
                </div> 
                <div class="w_bottom"><span class="tip">*</span>您也可致电一汽-大众24小时客户服务热线：4008-171-888，（0431）85990888，第一时间与您贴心沟通。</div>
            </div>
            <div class="w_contaier height_430">
            	<p>登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表单中。</p>
            	<p class="w_margin5"><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p>
            	<div class="clearfix w_from_section">
                	<span class="span_block communicate_section">
                		<span class="tip">*</span><span class="word_apacing19">姓 名：</span>
                	</span>
                	<div class="w_row f_l">
                		<input type="text" name="ccName" id='ccName' style="width:240px" value="<s:property value='#session.AUDI_WEB_USER.username'/>" onblur="vaialK('ccName','ccName_wrong',wrongObj.ccName_wrong)">
                	</div>	
                	<span class="wrong" id='ccName_wrong'></span>                        	
                </div>
                
                <div  class="clearfix w_from_section">
                	<span class="span_block communicate_section">
                		<span  class="tip">*</span><span class="word_apacing19">称 谓：</span>
                	</span>
                	<div  class="w_row f_l">
                		<input id="Radio15" type="radio"  class="myClass" value="1" onchange="wrongCucccess('ccGender_wrong');" name="ccGender" data-label="先生" data-color="blue" <s:if test='#session.AUDI_WEB_USER.gender eq "1"'>checked="checked"</s:if>/>
                        <input id="Radio16" type="radio"  class="myClass" value="0" onchange="wrongCucccess('ccGender_wrong');" name="ccGender" data-label="女士" <s:if test='#session.AUDI_WEB_USER.gender eq "0"'>checked="checked"</s:if> />
                	</div>  
                	<span class="wrong" id='ccGender_wrong'></span>                      	
                </div>
                <div class="clearfix w_from_section">	
                	<span class="span_block communicate_section"><span class="tip">*</span>手机号码：</span>
                	<div class="w_row f_l">	                        		
                		<input type="text"name="ccMobile" id='ccMobile' style="width:240px"
                		value="<s:property value='#session.AUDI_WEB_USER.mobile'/>"
                		onblur="vaialP('ccMobile','ccMobile_wrong')">
                	</div>	                        	
                	<span class="wrong" id='ccMobile_wrong'></span>
                </div>
                 <div class="clearfix w_from_section" id='hide_ccCode'>
                	<span class="span_block communicate_section"><span class="tip">*</span>身份证号码：</span>
                	<div class="w_row f_l">	                        		
                		<input type="text"name="ccCode" id='ccCode' style="width:240px"
                		value="<s:property value='#session.AUDI_WEB_USER.idcard'/>"
                		onblur="vaialI('ccCode','ccCode_wrong')">
                	</div>	                        	
                	<span class="wrong" id='ccCode_wrong'></span>
                </div>
                <div class="clearfix w_from_section" style='border-bottom: 1px black dotted;padding-bottom: 40px;'>
                	<span class="span_block communicate_section">出生日期：</span>
                	<div class="w_row f_l">
                    	<div class="f_l">                        		      						
                            <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:74px">
                                    
                                    <select id="cc_birthY" class="select" name="cc_birthY"                                
                                    onchange="setDay('cc_birthY','cc_birthM','cc_birthD');$('#cc_birthM').val('');$('#cc_birthD').val('');$('#cc_birthM').siblings('.caption').text('请选择');$('#cc_birthD').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">                                             
                                        
                                         </select>
                                </fieldset>
                            </form>        						
                            <span class="span1">年</span>

                    	</div> 
                    	<div class="f_l">                        		      						
                            <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:60px">
                                    <select id="cc_birthM" class="select" name="cc_birthM" onchange="setDay('cc_birthY','cc_birthM','cc_birthD');$('#cc_birthD').val('');$('#cc_birthD').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
										<option value="">请选择</option>
										</select>
                                </fieldset>
                            </form>        						
                            <span class="span1">月</span>
                    	</div>  
                    	<div class="f_l">                        		      						
                            <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:60px">
                                    <select id="cc_birthD" class="select" 
                                
                                    name="cc_birthD" style="opacity: 0.0001; z-index: 2;">
                                    <!--     onblur="vaialK('cc_birthD','ccBirthday_wrong',wrongObj.ccBirthday_wrong)" -->
										<option value="">请选择</option>
                                        </select>
                                </fieldset>
                            </form>        						
                            <span class="span1">日</span>
                    	</div>  
                	</div>
                	<span class="wrong" id='ccBirthday_wrong'></span>
                </div>
                <div class=" bottom_input_box" style='border:none'>
                    <span class='next'></span>
                    <span class='pre'></span>
                </div> 
            </div>
            <div class='takepage_slidecon4 positon_rel'>
				
				<div id="ask" class='zr_dot'>
					<p>咨询</p>
					<ul>
						<li><span>咨询问题描述：</span><span id="info_caDescription"></span></li>
						<li  id="hide_caWhen"><span>您倾向于我们何时电话联络您：</span><span id="info_caWhen"></span></li>
					</ul>
				</div>
                <div id="compaint" class='zr_dot'>
					<p>投诉</p>   
					<ul>
						<li><span>投诉类型：</span><span id="info_ccType"> </span></li>
						<li><span>选择经销商 ：</span><span id="info_ccProvince"></span></li>
						<li id="hide_ccModel"><span >车辆型号 ：</span><span id="info_ccModel"></span></li>
						<li  id="hide_ccBuyyear"><span>购车时间 ：</span><span id="info_ccBuyyear"></span></li>
						<li  id="hide_ccFootnum"><span>车架号 ：</span><span id="info_ccFootnum"></span></li>
						<li  id="hide_ccKilometer"><span>车辆行驶里程 ：</span><span id="info_ccKilometer"></span></li>
						<li><span>投诉问题描述：</span><span id="info_ccDescription"></span></li>
						<li id="hide_ccWhen"><span >您倾向于我们何时电话联络您：</span><span id="info_ccWhen"></span></li>
					</ul>
				</div>
				<div id="proposal" class='zr_dot'>
					<p>建议</p>
					<ul>
                    	<li><span>建议内容描述：</span><span id="info_cpDescription"></span></li>
                    	<li id="hide_cpWhen"><span >您倾向于我们何时电话联络您：</span><span id="info_cpWhen"></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>个人基本信息</p>
					<ul>
						<li><span class="word_apacing19">姓 名：</span><span id='info_ccName' ></span></li>
						<li><span class="word_apacing19">性 别：</span><span id="info_ccGender"></span></li>
						<li><span>手机号码：</span><span id="info_ccMobile"></span></li>
						<li id='hide_info_ccCode'><span>身份证号码：</span><span id="info_ccCode"></span></li>
                        <li id='hide_ccBirthday'><span>出生日期：</span><span id="info_ccBirthday"></span></li>
					</ul>
				</div>
                <div class="bottom_input_box" style='border:none'>                	
					<span class='refer button_refer' id="refer"></span>
                    <span class='pre'></span>
                </div>				
			</div>
            
            <div id='takepage_fail' class=" height_530 w_contaier" style='padding-left:22px'>
				<p><strong>提交失败！</strong></p>
				<p class='failnote'>抱歉，您的信息提交失败，请返回上一级重新提交。</p>
				<p class='pres'> <strong class='failred'><img src="images/jiantou.png" style='margin-top:4px'> </strong> <span class="f_w">返回上一步</span></p>
			</div>
			<div id='takepage_sucss' class="height_530 w_contaier" style='padding-left:20px;margin:0 0 20px'>
				<p style='font-weight: bold;'>提交成功!</p>
				<div class='sucssnote'>感谢您对奥迪品牌的关注和支持，我们将尽快与您取得联系！</div>
				<ul>
					<s:if test="#session.AUDI_WEB_USER==null">
					<li class="list_bg">
						<span> <a href="javascript:;"  onclick="commonUserReg()" class='login'>注册我的奥迪账户  </a>
						<span style='margin-left:30px;font-weight:normal'>（一键注册“我的奥迪账户”，省略繁冗填表步骤）</span></span>
					</li>
					</s:if>
					<li class="list_bg">
						<a href='index.html'> 返回联系奥迪</a>
					</li>
				</ul>
			</div> 			
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
			var $subButton = $(".js_button");
			$subButton.each(function(){
				$(this).on("click",function(){
					$(".js_sub_tab").attr("class","js_sub_tab hidden");
					if($(this).attr("class").indexOf("js_button_h")>0){
						$(".js_sub_tab").removeClass("hidden");
					}
				});
			});
			$(".js_title").each(function(){
				$(this).on("click",function(){
					$(".js_hidden").hide();
					$(this).find("a").triggerHandler("click");
					var o = $(".w_tab_sub_box .tab_sub_list")
					o.hide();
					o.eq($(this).index()).show();
					$(".js_next").show();
				});					
			});

			var attr = [];
			for(var i = 0; i<$(".w_textarea").size();i++){
				attr.push($(".w_textarea").eq(i).val());
			}
			$(".w_textarea").each(function(i){	
				$(this).focus(function(){
					var oText = $(this).val();
					if(oText == attr[i]){
						$(this).val("");
					}	
				});
				$(this).blur(function(){
					//alert(2)
					var oText = $(this).val();
					if(oText == ""){
						$(this).val(attr[i]);
					}	
				})
			})
		});	
		
		//提交的信息拼接
		var submitVals="";
		var allField=[ 
			{caDescription:"cc.caDescription"},
			{caWhen:"cc.caWhen"},  //	何时联系您 工作日、节假日...咨询
			{caTiming:"cc.caTiming"},  //	具体时间 如 ： 上午10点
			{answersex:"cc.answersex",type:"radio"},//1咨询  2投诉  3建议 
			{ccType:"cc.ccType",type:"radio"},    // 投诉类型 1：售前；2：售后；3：二手车。
			{ccProvince:"cc.ccProvince"},   //经销商所在省
			{ccCity:"cc.ccCity"},   //经销商所在市
			{ccDealer:"cc.ccDealer"},   //经销商名称
			{ccModel:"cc.ccModel"},   //车辆型号
			{ccBuyyear:"cc.ccBuyyear"},  //购车年份
			{ccBuymonth:"cc.ccBuymonth"},  //购车月份
			{ccFootnum:"cc.ccFootnum"},  //车架号
			{ccKilometer:"cc.ccKilometer"},  //行驶里程
			{ccDescription:"cc.ccDescription"}, //投诉内容
			{ccWhen:"cc.ccWhen"},  //联系时间
			{ccTiming:"cc.ccTiming"},  //具体时间
			
			{cpDescription:"cc.cpDescription"},  //建议内容描述
			{cpWhen:"cc.cpWhen"},
			{cpTiming:"cc.cpTiming"},  //联系时间
			
			{ccName:"cc.ccName"},  //姓名
			{ccGender:"cc.ccGender",type:"radio"},  //性别
			{ccMobile:"cc.ccMobile"},  //手机号码
			{ccBirthday:"cc.ccBirthday"},  //出生日期
			{ccCode:"cc.ccCode"},  //身份证号     code字段具体含义不明，暂时用来代替身份证号
				];
		var index = 0;  //控制页面跳转的标记
		(function(){			
//			$(".commu").find("span").each(function(){
//			$(this).click(function(){
//				index = $(this).index();
//				showpage(index);					
//			});
//		});
			
			$('.takepage div').eq(0).show().siblings().hide();
			$('.takepage_slidecon>div').eq(0).show().siblings().hide();
			$('.next').click(function(){
				var isWrong=false;
				var index_i=index+1;				
				
				
				//是否有错误
				var isWrong=validForm(index_i);
				
				if(index_i==2){
					submitVals="";				
					//没有错误
					if(!isWrong){//信息   
					var keys = [];
						//所有的key
						for(var fi=0;fi<allField.length;fi++){
						var obj=allField[fi];
						for (var key in obj){
						  keys.push(key);
						  if(obj.type || obj.type=="radio"){
								var value=$('input[name="'+key+'"]:checked').attr("value");
								//真实的value
								var realdValue=value;
								if(key=="ccGender"){
									value=(value=="0"?"女士":"先生");
								}else if(key=="ccType"){
									if(!value||value==""){  //防止cctype为空否则会报数据类型不匹配异常
										realdValue=0;
									}else 
										if(value=="1"){
											value="售前";
											$('#hide_ccModel').hide();
											$('#hide_ccBuyyear').hide();
											$('#hide_ccFootnum').hide();
											$('#hide_ccKilometer').hide();	
										}else if(value=="2"){  
											value="售后"
										
										}else if(value=="3"){
											value="二手车";
											$('#hide_ccModel').hide();
											$('#hide_ccBuyyear').hide();
											$('#hide_ccFootnum').hide();
											$('#hide_ccKilometer').hide();	
										}
									
								}
								if(key=='answersex'){
									if(value=='1'){
										$('#compaint').hide();	
										$('#ask').show();
										$('#proposal').hide();	
									}else if(value=='2'){
										$('#compaint').show();	
										$('#ask').hide();
										$('#proposal').hide();	
									}else {
										$('#compaint').hide();	
										$('#ask').hide();
										$('#proposal').show();	
									}
								}
								$("#info_"+key).text(value);
								if(key!="type"){
									if(submitVals==""){
										submitVals+=obj[key]+"="+realdValue;
									}else{
										submitVals+="&"+obj[key]+"="+realdValue;
									}
								}
						  }else{
								var value=$("#"+key).val();
								if(value==null){
									value="";
								}
								//真实的value
								var realdValue=value;
								if(key=="ccBirthday"){
									if($("#cc_birthY").val()=="" || $("#cc_birthM").val()=="" || $("#cc_birthD").val()==""){
										value="";
										$("#hide_ccBirthday").hide();
									}else{
										value=$("#cc_birthY").val()+"年"+$("#cc_birthM").val()+"月"+$("#cc_birthD").val()+"日";
										$("#hide_ccBirthday").show();
									}
									if($("#cc_birthY").val()=="" || $("#cc_birthM").val()=="" || $("#cc_birthD").val()==""){
										realdValue="";
									}else{
										realdValue=$("#cc_birthY").val()+"-"+$("#cc_birthM").val()+"-"+$("#cc_birthD").val();
									}
								}
								if(key=="ccBuyyear"){
									if($("#ccBuyyear").val()==""){
										value="";
									}else{
										value=$("#ccBuyyear").val()+"年"+$("#ccBuymonth").val()+"月";
									}	
								}
								if(key=="ccWhen"){
									var va=$("#ccWhen").val()
									if(va==""){
										value=va;
									}else{
										va=(va=="0"?"工作日":"节假日")
										value=va+"  "+$("#ccTiming").val();
									}
								}
								if(key=="caWhen"){
									var va=$("#caWhen").val()
									if(va==""){
										value=va;
									}else{
										va=(va=="0"?"工作日":"节假日")
										value=va+"  "+$("#caTiming").val();
									}
								}
								if(key=="cpWhen"){
									var va=$("#cpWhen").val()
									if(va==""){
										value=va;
									}else{
									va=(va=="0"?"工作日":"节假日")
									value=va+"  "+$("#cpTiming").val();
									}
								}
								//省市
								if(key=="ccProvince" || key=="ccCity"){
									if($("#ccProvince").val()==""){
										value="";
									}else{
										value =getDictPovince($("#ccProvince").val())+"省"+getDictCity($("#ccProvince").val(),$("#ccCity").val())+"市"+getDictDealer($("#ccCity").val(),$("#ccDealer").val());
									}
								}
								//信息确认时，按照问题描述是否为空为标准，不为空，则显示添加信息，否则将隐藏添加信息
							/*	if($("#ccDescription").val()=="您在此写下遇到的问题，我们将尽快为您妥善处理."){
									$('#compaint').hide();									
								}else{
									$('#compaint').show();
								}
								if($("#caDescription").val()=="请您在此写下想要咨询的问题，我们将在第一时间为您解答。"){
									$('#ask').hide();									
								}else{
									$('#ask').show();
								}
								if($("#cpDescription").val()=="请在此写下您的建议，我们诚挚感谢您对一汽-大众奥迪品牌的关注和支持！"){
									$('#proposal').hide();									
								}else{
									$('#proposal').show();
								} */
								if($("#caWhen").val()==""&&$("#caTiming").val()==""){  //如果联系时间不存在  则在信息确认页面隐藏
									$('#hide_caWhen').hide();									
								}else{
									$('#hide_caWhen').show();
								}
								if($("#ccWhen").val()==""&&$("#ccTiming").val()==""){  
									$('#hide_ccWhen').hide();									
								}else{
									$('#hide_ccWhen').show();
								}
								if($("#cpWhen").val()==""&&$("#cpTiming").val()==""){  
									$('#hide_cpWhen').hide();									
								}else{
									$('#hide_cpWhen').show();	
								}
								if($("#ccKilometer").val()==""){  
									$('#hide_ccKilometer').hide();									
								}else{
									$('#hide_ccKilometer').show();	
								}
								if(key=="ccModel"){
									var ccc_model = "<s:property value='#session.AUDI_WEB_USER.model'/>";
									realdValue=ccc_model;
								}
								
								$("#info_"+key).text(value);
								if(realdValue!=""){
								if(submitVals==""){
									submitVals+=obj[key]+"="+realdValue;
								}else{
									submitVals+="&"+obj[key]+"="+realdValue;
								}
							}
						  }
						}
					}
					}
				}
				if(isWrong==false){
					index++;
					showpage(index);
				}else{
					index=index_i-1;
				}
				return;	
			});
			$('.pre').click(function(){
				//index&dash;;
				index--;
				showpage(index);
			})
			$('.pres').click(function(){
				$('.takepage_con').show();
				showpage(index);
			})
			
			
			/*提交按钮*/
			$('#refer').click(function(){
				$.post("communicate_save.action",submitVals,function(data){
				if(data.success=="true"){
					$('#takepage_sucss').show().siblings().hide();
					$('.takepage_con').css('display','none');
					$("#rform input[name='user.username']").val($("#ccName").val());
				}
				else{
					$('#takepage_fail').show().siblings().hide();
					$('.takepage_con').css('display','none');
				}				
				//$('#takepage_sucss').show().siblings().hide();
				//$('.takepage_con').css('display','none');

				});
			})
				/*下划线第一页不显示*/
			$('.zr_line').hide();
			$('.f_14').click(function  () {
				// body...
				$('.zr_line').show()
				
			})
			/*提交失败返回上一步title底部黑线消失*/
			$('.f_w').click(function(){
				$('#cn_maincontent .page_title').css('border','none')
			})
		})();
		
		//点击头部判断,i传入的
			//var submitMaxId=0;
			function clickHeard(i){
				if(i!=0){
					var isWrong=false;
					for(var j=1;j<=i;j++){
						isWrong = validForm(j);
						if(isWrong==true){
							break;
						}
					}
					if(false==isWrong){
						
						if(i==2){    //点击第三章图片的时候  进行数据加载	
						submitVals="";
							//没有错误
							if(!isWrong){//信息   
							var keys = [];
								//所有的key
								for(var fi=0;fi<allField.length;fi++){
								var obj=allField[fi];
								for (var key in obj){
								  keys.push(key);
								  if(obj.type || obj.type=="radio"){
										var value=$('input[name="'+key+'"]:checked').attr("value");
										//真实的value
										var realdValue=value;
										if(key=="ccGender"){
											value=(value=="0"?"女士":"先生");
										}else if(key=="ccType"){
											if(!value||value==""){  //防止cctyep为空否则会报数据类型不匹配异常
												realdValue=0;
											}else 
											if(value=="1"){
												value="售前";
												$('#hide_ccModel').hide();
												$('#hide_ccBuyyear').hide();
												$('#hide_ccFootnum').hide();
												$('#hide_ccKilometer').hide();	
											}else if(value=="2"){  
												value="售后"
											
											}else if(value=="3"){
												value="二手车";
												$('#hide_ccModel').hide();
												$('#hide_ccBuyyear').hide();
												$('#hide_ccFootnum').hide();
												$('#hide_ccKilometer').hide();	
											}

										}
										if(key=='answersex'){
											if(value=='1'){
												$('#compaint').hide();	
												$('#ask').show();
												$('#proposal').hide();	
											}else if(value=='2'){
												$('#compaint').show();	
												$('#ask').hide();
												$('#proposal').hide();	
											}else {
												$('#compaint').hide();	
												$('#ask').hide();
												$('#proposal').show();	
											}
										}
										$("#info_"+key).text(value);
										if(key!="type"){
											if(submitVals==""){
												submitVals+=obj[key]+"="+realdValue;
											}else{
												submitVals+="&"+obj[key]+"="+realdValue;
											}
										}
								  }else{
										var value=$("#"+key).val();
										if(value==null){
											value="";
										}
										//真实的value
										var realdValue=value;
										if(key=="ccBirthday"){
											if($("#cc_birthY").val()=="" || $("#cc_birthM").val()=="" || $("#cc_birthD").val()==""){
												value="";//mark
												$("#hide_ccBirthday").hide();
												
											}else{
												value=$("#cc_birthY").val()+"年"+$("#cc_birthM").val()+"月"+$("#cc_birthD").val()+"日";
												$("#hide_ccBirthday").show();
											}
											if($("#cc_birthY").val()=="" || $("#cc_birthM").val()=="" || $("#cc_birthD").val()==""){
												realdValue="";
											}else{
												realdValue=$("#cc_birthY").val()+"-"+$("#cc_birthM").val()+"-"+$("#cc_birthD").val();
											}
										}
										if(key=="ccBuyyear"){
											if($("#ccBuyyear").val()==""){
												value="";
											}else{
												value=$("#ccBuyyear").val()+"年"+$("#ccBuymonth").val()+"月";
											}	
										}
										if(key=="ccWhen"){
											var va=$("#ccWhen").val()
											if(va==""){
												value=va;
											}else{
												va=(va=="0"?"工作日":"节假日")
												value=va+"  "+$("#ccTiming").val();
											}
										}
										if(key=="caWhen"){
											var va=$("#caWhen").val()
											if(va==""){
												value=va;
											}else{
												va=(va=="0"?"工作日":"节假日")
												value=va+"  "+$("#caTiming").val();
											}
										}
										if(key=="cpWhen"){
											var va=$("#cpWhen").val()
											if(va==""){
												value=va;
											}else{
											va=(va=="0"?"工作日":"节假日")
											value=va+"  "+$("#cpTiming").val();
											}
										}
										
										//省市
										if(key=="ccProvince" || key=="ccCity"){
											if($("#ccProvince").val()==""){
												value="";
											}else{
												value =getDictPovince($("#ccProvince").val())+"省"+getDictCity($("#ccProvince").val(),$("#ccCity").val())+"市"+getDictDealer($("#ccCity").val(),$("#ccDealer").val());
											}
										}
						/*		if($("#ccDescription").val()=="您在此写下遇到的问题，我们将尽快为您妥善处理."){
									$('#compaint').hide();									
								}else{
									$('#compaint').show();
								}
								if($("#caDescription").val()=="请您在此写下想要咨询的问题，我们将在第一时间为您解答。"){
									$('#ask').hide();									
								}else{
									$('#ask').show();
								}
								if($("#cpDescription").val()=="请在此写下您的建议，我们诚挚感谢您对一汽-大众奥迪品牌的关注和支持！"){
									$('#proposal').hide();									
								}else{
									$('#proposal').show();
								}  */
								if($("#caWhen").val()==""&&$("#caTiming").val()==""){  //如果联系时间不存在  则在信息确认页面隐藏
									$('#hide_caWhen').hide();									
								}else{
									$('#hide_caWhen').show();
								}
								if($("#ccWhen").val()==""&&$("#ccTiming").val()==""){  
									$('#hide_ccWhen').hide();									
								}else{
									$('#hide_ccWhen').show();
								}
								if($("#cpWhen").val()==""&&$("#cpTiming").val()==""){  
									$('#hide_cpWhen').hide();									
								}else{
									$('#hide_cpWhen').show();	
								}
								if($("#ccKilometer").val()==""){  
									$('#hide_ccKilometer').hide();									
								}else{
									$('#hide_ccKilometer').show();	
								}
								if(key=="ccModel"){
									var ccc_model = "<s:property value='#session.AUDI_WEB_USER.model'/>";
									realdValue=ccc_model;
								}	
																			
								$("#info_"+key).text(value);
								if(realdValue!=""){
								if(submitVals==""){
									submitVals+=obj[key]+"="+realdValue;
								}else{
									submitVals+="&"+obj[key]+"="+realdValue;
								}
								}
							}
						}
					}
				}
			}
					
					
						showpage(i);
					}
				}else{
					showpage(i);
				}				
			}
			function showpage(i){
			index=i;  //将图片跳页和点击下一步跳页标记同步
				/*$('.takepage div').eq(i).show().siblings().hide();*/
				$(".commu").css("background-image","url(images/communicate_banner"+(i+1)+".jpg)")
			 	$('.takepage_slidecon>div').eq(i).show().siblings().hide();
			}
			
			function validForm(index_i){
				var isWrong=false;
				if(index_i==1){
					var compaint="您在此写下遇到的问题，我们将尽快为您妥善处理.";
					var ask="请您在此写下想要咨询的问题，我们将在第一时间为您解答。";
					var proposal="请在此写下您的建议，我们诚挚感谢您对一汽-大众奥迪品牌的关注和支持！";
					
					var ccType=$('input[name="ccType"]:checked').attr("value");   // 投诉类型 1：售前；2：售后；3：二手车。
					var answersex=$('input[name="answersex"]:checked').attr("value");  //选择1 咨询   2投诉  3 建议
					var ccProvince=$("#ccProvince").val(); //经销商省
					var ccCity=$("#ccCity").val();  //经销商市
					var ccDealer=$("#ccDealer").val(); //经销商id
					var ccModel=$("#ccModel").val(); //车辆型号
					var ccBuyyear=$("#ccBuyyear").val(); //购车年份
					var ccBuymonth=$("#ccBuymonth").val(); //购车月份
					var ccFootnum=$("#ccFootnum").val(); //车架号  mark
					var caDescription=$("#caDescription").val() //咨询描述
					var ccDescription=$("#ccDescription").val() //投诉描述
					var cpDescription=$("#cpDescription").val() //建议描述
					var wrongObj={
						ccType_wrong:"请选择投诉类型",
						ccProvince_wrong:"请选择经销商所在省份",
						ccCity_wrong:"请选择经销商所在城市",
						ccDealer_wrong:"请选择经销商",
						ccModel_wrong:"请选择车辆型号",
						ccBuyyear_wrong:"请选择购车年份",
						ccBuymonth_wrong:"请选择购车月份",
						ccFootnum_wrong:"请填写车架号",
						caDescription_wrong:"请填写咨询描述",
						ccDescription_wrong:"请填写投诉描述",
						cpDescription_wrong:"请填写建议描述"
					};
					wrongCucccess("ccProvince_wrong");				
					wrongCucccess("ccModel_wrong");				
					wrongCucccess("ccCity_wrong");				
					wrongCucccess("ccDealer_wrong");				
					wrongCucccess("ccBuyyear_wrong");				
					wrongCucccess("ccBuymonth_wrong");				
					wrongCucccess("ccFootnum_wrong");
					wrongCucccess("caDescription_wrong");
					wrongCucccess("ccDescription_wrong");
					wrongCucccess("cpDescription_wrong");
					//alert(ccType+":ddddd");
				
						$("#hide_ccCode").hide();
					$("#hide_info_ccCode").hide();	
					if(!answersex||answersex=='2'){	   
						
						//$('#hide_caWhen').hide();	
						$("#hide_ccCode").show();
						$("#hide_info_ccCode").show();	
							   					
						if(ccProvince==""){
							wrongInfo("ccProvince_wrong",wrongObj.ccProvince_wrong);
							isWrong=true;
						}
						if(ccCity==""){
							wrongInfo("ccProvince_wrong",wrongObj.ccCity_wrong);
							isWrong=true;
						}
						if(ccDealer==""){
							wrongInfo("ccDealer_wrong",wrongObj.ccDealer_wrong);
							isWrong=true;
						}
						if(!ccType||ccType==''){
							wrongInfo("ccType_wrong",wrongObj.ccType_wrong);
							isWrong=true;
						}
						if(!ccType||ccType=='2'){
							if(ccModel==""){
								wrongInfo("ccModel_wrong",wrongObj.ccModel_wrong);
								isWrong=true;
							}
							if(ccBuyyear==""){
								wrongInfo("ccBuyyear_wrong",wrongObj.ccBuyyear_wrong);
								isWrong=true;
							}
							if(ccBuymonth==""){
								wrongInfo("ccBuyyear_wrong",wrongObj.ccBuymonth_wrong);
								isWrong=true;
							}
							if(ccFootnum==""){
								$("#ccFootnum_wrong").attr("class","wrong");
								$("#ccFootnum_wrong").siblings('.tixing').hide();							
								wrongInfo("ccFootnum_wrong",wrongObj.ccFootnum_wrong);
								isWrong=true;
							}else {
							$("#ccFootnum_wrong").attr("class","note");
							$("#ccFootnum_wrong").siblings('.tixing').show();
							$("#ccFootnum_wrong").removeAttr("style");
						}
						
						
						}
						if(ccDescription==compaint){
							wrongInfo("ccDescription_wrong",wrongObj.ccDescription_wrong);
							isWrong=true;
						}
					}
					
					if(!answersex||answersex=='1'){	
						if(caDescription==ask){								
							wrongInfo("caDescription_wrong",wrongObj.caDescription_wrong);
							isWrong=true;
						}
					}
					if(!answersex||answersex=='3'){	
						if(cpDescription==proposal){
							wrongInfo("cpDescription_wrong",wrongObj.cpDescription_wrong);
							isWrong=true;
						}
					}

					
				}else if(index_i==2){
					var ccName=$("#ccName").val();
					var ccGender=$('input[name="ccGender"]:checked').attr("value");
					var ccMobile=$("#ccMobile").val();
					var cc_birthD=$("#cc_birthD").val();
					var ccCode=$("#ccCode").val();
					var answersex=$('input[name="answersex"]:checked').attr("value");  //选择1 咨询   2投诉  3 建议

					var wrongObj={
						ccName_wrong:"请填写您的姓名",
						ccGender_wrong:"请选择称谓",
						ccMobile_wrong:"请填写您的手机号码",
						ccMobile_va_wrong:"手机号码应为11位数字",
						ccBirthday_wrong:"请选择您的生日",
						ccCode_wrong:"请填写您的身份证号码",
						ccCode_va_wrong:"您填写的身份证号格式不正确"
						
					};
					wrongCucccess("ccName_wrong");	
					wrongCucccess("ccGender_wrong");	
					wrongCucccess("ccMobile_wrong");	
					wrongCucccess("ccBirthday_wrong");	
					wrongCucccess("ccCode_wrong");	
					if(ccName==""){
							wrongInfo("ccName_wrong",wrongObj.ccName_wrong);
							isWrong=true;
					}
					if(!ccGender || ccGender==""){
						wrongInfo("ccGender_wrong",wrongObj.ccGender_wrong);
						isWrong=true;
					}

					if(ccMobile==""){
							wrongInfo("ccMobile_wrong",wrongObj.ccMobile_wrong);
							isWrong=true;
					}
					if(ccMobile!=""&&!validationPhone(ccMobile)){
						wrongInfo("ccMobile_wrong",wrongObj.ccMobile_va_wrong);
						isWrong=true;
					}
				//	if(cc_birthD==""){
				//			wrongInfo("ccBirthday_wrong",wrongObj.ccBirthday_wrong);
				///			isWrong=true;
				//	}
					if(!answersex||answersex=='2'){	
						if(ccCode==""){  //
								wrongInfo("ccCode_wrong",wrongObj.ccCode_wrong);
								isWrong=true;
						}
						if(ccCode!=""&&!isCcCode(ccCode)){
							wrongInfo("ccCode_wrong",wrongObj.ccCode_va_wrong);
							isWrong=true;
						}
					}
					}
				return isWrong;
			}
		
		//错误的图片
		var wrongBackground="url('images/baocuo.jpg')";
		function wrongInfo(id,text){
			$("#"+id).text(text);
			$("#"+id).css("background-image",wrongBackground);
		}
		//验证正确
		function wrongCucccess(id){
			$("#"+id).text("");
			$("#"+id).css("background-image","none");
		}
		//错误样式
		$(".wrong").css("background-image","none");
		
		//经销商省市回显
		var cc_dealerProvince = "<s:property value='#session.AUDI_WEB_USER.dealerProvince'/>";	
		var cc_dealerCity = "<s:property value='#session.AUDI_WEB_USER.dealerCity'/>";	
		var cc_intentdealer = "<s:property value='#session.AUDI_WEB_USER.intentdealer'/>";	
		var cc_model = "<s:property value='#session.AUDI_WEB_USER.model'/>";	
		var cc_brand = "<s:property value='#session.AUDI_WEB_USER.brand'/>";	
		var cc_Footnum="<s:property value="#session.AUDI_WEB_USER.footnum"/>";
	//	var cc_Kilometer="<s:property value="#session.AUDI_WEB_USER.footnum"/>";
	
		var temp_model=getDictBrandModel(cc_brand,cc_model);
		$("#ccModel").val(temp_model);  
		//$("#ccModel").val(cc_model);  
		$("#ccFootnum").val(cc_Footnum);
	//	$("#ccKilometer").val(cc_Kilometer);
		initdealerprovince('ccProvince',cc_dealerProvince);
		change_dealercitys('ccCity',cc_dealerProvince,cc_dealerCity);
		change_dealers('ccDealer',cc_dealerCity,cc_intentdealer);
				
		//用户年月日生成及回显
		 var testY="<s:property value='#session.AUDI_WEB_USER.birthdayy'/>";
		 var testM="<s:property value='#session.AUDI_WEB_USER.birthdaym'/>";
		 var testD="<s:property value='#session.AUDI_WEB_USER.birthdayd'/>";
		var allYearOption="<option value=''>请选择</option><option value='1965'>1965以前</option>";
		var cc_valy = "<s:property value='#session.AUDI_WEB_USER.buytimeyear'/>";
  		var cc_valym = "<s:property value='#session.AUDI_WEB_USER.buytimemonth'/>";
  		
		for(var i=1966;i<2005;i++){
			if(testY!="" && i+""==testY){	
				allYearOption+="<option value='"+i+"' selected>"+i+"</option>";
			}else{
				allYearOption+="<option value='"+i+"'>"+i+"</option>";
			}
		}
		$("#cc_birthY").append(allYearOption);
		for(var i=1;i<13;i++){
			if(testM!="" && testM==i+""){
				$("#cc_birthM").append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$("#cc_birthM").append("<option value='"+i+"'>"+i+"</option>");
			}
		}
		if(testY!="" && testM!=""){
			setDay('cc_birthY','cc_birthM','cc_birthD');
			$("#cc_birthD").val(testD);
		}

		for(var i=2001;i<2014;i++){
			$("#ccBuyyear").append("<option value='"+i+"'>"+i+"</option>");
		}
		for(var i=1;i<13;i++){
			$("#ccBuymonth").append("<option value="+i+">"+i+"</option>");
		}
		$("#ccBuyyear").val(cc_valy);  //购车时间回显
		$("#ccBuymonth").val(cc_valym);
	
		var wrongObj={
			ccProvince_wrong:"请选择省份",
			ccCity_wrong:"请选择城市",
			ccDealer_wrong:"请选择经销商",
			ccModel_wrong:"请选择车辆型号",
			ccBuyyear_wrong:"请选择购车年份",
			ccBuymonth_wrong:"请选择购车月份",
			ccFootnum_wrong:"请填写车架号",
			ccName_wrong:"请填写您的姓名",
			ccGender_wrong:"请选择称谓",
			ccMobile_wrong:"请填写您的手机号码",
			ccMobile_va_wrong:"手机号码应为11位数字",
			ccBirthday_wrong:"请选择您的生日",
			ccCode_wrong:"请填写您的身份证号码",
			ccCode_va_wrong:"请正确填写您的身份证号码",
			caDescription_wrong:"请填写咨询描述",
			ccDescription_wrong:"请填写投诉描述",
			cpDescription_wrong:"请填写建议描述"
		};
//输入验证不为空
function vaialK(id,wrong,msg){
	if($("#"+id).val()!=""){
		wrongCucccess(wrong);
	}else{
		wrongInfo(wrong,msg);
	}
}
  //手机验证
function vaialP(id,wrong){
	if($("#"+id).val()!=""){
		if(validationPhone($("#"+id).val())){
			wrongCucccess(wrong);
			}else{
				wrongInfo(wrong,wrongObj.ccMobile_va_wrong);
			}
		
	}else{
		wrongInfo(wrong,wrongObj.ccMobile_wrong);
	}
}
 //身份证号验证
function vaialI(id,wrong){
	if($("#"+id).val()!=""){
		if(isCcCode($("#"+id).val())){
			wrongCucccess(wrong);
		}else{
			wrongInfo(wrong,wrongObj.ccCode_va_wrong);
		}
		
	}else{
		wrongInfo(wrong,wrongObj.ccCode_wrong);
	}
}
		//车架号输入验证不为空
 function vaialKD(id,wrong){			
	if($("#"+id).val()!=""){
 		wrongCucccess(wrong);
 		$("#ccFootnum_wrong").attr("class","note");
		$("#ccFootnum_wrong").siblings('.tixing').show();
		$("#ccFootnum_wrong").removeAttr("style");
	}else{
		$("#ccFootnum_wrong").attr("class","wrong");
	$("#ccFootnum_wrong").siblings('.tixing').hide();
		wrongInfo(wrong,"请填写您的车架号");
	}
}
	</script>
</body>
</html>


