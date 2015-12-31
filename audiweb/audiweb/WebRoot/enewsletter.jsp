<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
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
	<title>订阅奥迪新闻专递>联系奥迪>欢迎来到一汽-大众奥迪</title>
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
<%@include file="common_tackingcode.jsp"%>
<%@include file="common_navigation.jsp"%>
	
   	<ul class="horizontalNav left breadcrumbs">
   	    <li>
        	<a href="/content/cn/brand/zh.html">首页</a>
        	<span class="w_divider"></span>
        </li>
   		<li><a href="homepage.action">联系奥迪</a><span class="w_divider"></span></li>
        <li>订阅奥迪新闻专递</li>
	</ul>
<%@include file="common_heard.jsp"%>
<div class="container w_margin_b3">
    <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;">
         <jsp:include page="common_login.jsp"></jsp:include>
        <div class="page_title">订阅奥迪新闻专递</div>
        <div>
        	<div id='sublist'>
        		<div class='takepage_con'>
		            <div class='w_banner'>
		               <img src="images/subnews.jpg">
		            </div>
        		</div>
		        <div class='w_content' style="margin-bottom:12px;">	
					<p class="f_14">订阅奥迪新闻专递，第一时间获悉有关奥迪的最新新闻播报和实时动态。</p>
					<!-- <p class="f_14">您可通过以下方式联系我们：</p> -->	
					<div>
					            <p class="f_14 w_margin1 f_w">订阅</p>
					            <p>欢迎订阅奥迪新闻专递，请您填写以下信息完成订阅，我们将每月定期向您的电子邮箱发送奥迪新闻专递。</p>
					            <table>
					            	<tr>
					            		<td height='27'><span class="word_apacing19">姓 名：</span></td>
					            		<td style='padding-left:9px;'><input type='text' id="dusername" name='username'  value="<s:property value='#session.AUDI_WEB_USER.username'/>"></td>
					            	</tr>
					            	<tr>
					            		<td>电子邮箱：</td>
					            		<td style='padding-left:9px;'>
					            			<input type='text' id="demail" onblur="if(!emptyVaila(this)){dvaialE('demail','demail_wrong')}" value="<s:property value='#session.AUDI_WEB_USER.email'/>" name='email'>					            		
					            		</td>
					            			<td style='padding-left:10px'>
					            			<span class='wrong' id="demail_wrong" style='float: left;line-height: 20px;'>
					            			</span></td>					            		
					            	</tr>
					            </table>
					            <p><img src="images/jiantou.png" style='margin-right:7px'>
					            	<a href="javascript:void(0);" class="f_w" id='dingyue'>提交</a></p>
		            		</div>			
							<div>
							            <P class="f_14 w_margin1 f_w">取消订阅</P>
							            <P>如果您希望不再收到奥迪新闻专递，请您输入电子邮箱即可完成退订。我们将在收到退订信息后停止发送。</P>
										<table>
											<tr>
												<td>电子邮箱：</td>
							            		<td style='padding-left:9px;'>
							            			<input type='text' onblur="if(!emptyVaila(this)){vaialE('temail','temail_wrong')}" id="temail" name='temail' value="<s:property value='#session.AUDI_WEB_USER.email'/>">
							          			</td>
							          			<td style='padding-left:10px'><span class='wrong' id="temail_wrong" style='float: left;line-height: 20px;'></span></td>
											</tr>
										</table>
										 <p><img src="images/jiantou.png" style='margin-right:7px;'>
										 	<a href="javascript:void(0)"class="f_w" id='tuiding'>退订</a></p>
							 	</div>
		            		
		            <div class="bd_dotted"></div>
	        	</div>	           
	        </div>
	        <div class="takepage_con">
		        <div id='takepage_sucss'  class=""style='display:none;'>
						<p style='font-weight: bold;'></p>
						<div class='sucssnote'>感谢您对奥迪品牌的关注和支持。</div>
						<ul>
						<s:if test="#session.AUDI_WEB_USER==null">
							<li class="list_bg">
							<span> <a href="javascript:;" class='login' onclick="commonUserReg()">注册我的奥迪账户  </a>
								<span style='margin-left:30px;font-weight:normal'>（一键注册“我的奥迪账户”，省略繁冗填表步骤）</span></span>
							</li>
							</s:if>
							<li class="list_bg">
								<a href='homepage.action'> 返回联系奥迪</a>
							</li>
						</ul>
				</div> 
			</div>
        </div>
        
        
      </div>
      
    </div>
    <%@include file="common_foot.jsp"%>
	<%@include file="common_login_div.jsp"%>
	<script type="text/javascript">
		$(function(){
	$(".wrong").css("background-image","none");
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			$('input.myClass').Checkable({
				color: 'blue'
			});
		var errorCode=["订阅成功","订阅失败，请稍后再试 ","邮箱有误, 请重新输入","退订失败，请稍后再试","系统异常","邮箱不存在，请重新输入","邮箱已存在，请重新输入"];
			$('#dingyue').click(function() {
					var email=$('#demail').val();
					var username=$('#dusername').val();
					
					if(dvaialE('demail','demail_wrong')){
						dataLayer.push({'event': 'vEvent','Category': 'enews','Action': 'submit','Label': ''});
					    $.post("enews_save.action","email="+email+"&username="+username,function(data){
					    	dataLayer.push({'event': 'vEvent','Category': 'enews','Action': 'subresult','Label': ''});
									if(data.success=="true"){
										$('#sublist').hide();
					    				$('#takepage_sucss').show();
					    				$('#takepage_sucss p')[0].innerHTML='提交成功！';
					    				$("#rform input[name='user.username']").val($("#dusername").val());
									}else{
									
										dwrongInfo('demail_wrong',errorCode[data.msgEnews]);
										
										/*$('#sublist').hide();
					    				$('#takepage_sucss').show();
					    				$('#takepage_sucss p')[0].innerHTML='提交失败！'*/
									}
								});
			    		}
    	});
    	$('#tuiding').click(function (){
    			var email=$('#temail').val();
    			
    			if(dvaialE('temail','temail_wrong')){
    						dataLayer.push({'event': 'vEvent','Category': 'enews','Action': 'cancel','Label': ''});
					    		$.post("enews_cancel.action","email="+email,function(data){
					    		dataLayer.push({'event': 'vEvent','Category': 'enews','Action': 'cancelresult','Label': ''});
									if(data.success=="true"){
										$('#sublist').hide();
					    				$('#takepage_sucss').show();
					    				$('#takepage_sucss p')[0].innerHTML='退订成功！'
									}else{
										dwrongInfo('temail_wrong',errorCode[data.msgEnews]);
										/*$('#sublist').hide();
					    				$('#takepage_sucss').show();
					    				$('#takepage_sucss p')[0].innerHTML='退订失败！'*/
									}
								});
							}
						})
	});
	function dwrongCucccess(id){
		$("#"+id).text("");
		$("#"+id).css("background-image","none");
	}
	//错误图片
	var dwrongBackground="url('images/baocuo.jpg')";
	//错误信息
	function dwrongInfo(id,text){
		$("#"+id).text(text);
		$("#"+id).css("background-image",dwrongBackground);
	}	
    //验证邮箱
  function dvaialE(id,wrong){
  		if($("#"+id).val()!=""){
  			if(validationEmail($("#"+id).val())){
  				dwrongCucccess(wrong);
  				return true;
  				}else{
  					dwrongInfo(wrong,"您填写的电子邮箱格式不正确。");
  					return false;
  				}
  			
  		}else{
  			dwrongInfo(wrong,"请填写电子邮箱。");
  			return false;
  		}
  }
	</script>
</body>
</html>