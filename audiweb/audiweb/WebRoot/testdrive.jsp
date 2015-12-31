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
<meta charset='utf-8'/>
<title>预约试驾 &gt; 联系奥迪 &gt; 欢迎来到一汽-大众奥迪</title> 
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
<script type="text/javascript" src="/etc/vehiclestore/50000_de/_jcr_content/openconfigurator.js"></script>

<script type="text/javascript">
	var books=eval("("+'<s:property value='json' escape='false'/>'+")");
	var productArr=[];
	//根据车系id获取手册对象
	function getProduct(intentcars){
		if(!intentcars || intentcars==""){return;}
		productArr=[];
		var obj=books[intentcars];
		for(var i=0;i<obj.length;i++){
			var oneObj=obj[i];
			productArr.push(oneObj);
		}
	}
</script>

<style>
.cdDriverage_div{
	width: 450px;
	height:30px;
	left: -25px;
	top: -22px;
	display: none;
}
</style>
</head>
<body class="DE de" data-country="DE" data-lang="de">
<%@include file="common_tackingcode.jsp"%>
<%@include file="common_navigation.jsp"%>
   	<ul class="horizontalNav left breadcrumbs">
   	    <li>
        	<a href="/content/cn/brand/zh.html">首页</a>
        	<span class="w_divider"></span>
        </li>
   		<li><a href="index.html">联系奥迪</a><span class="w_divider"></span></li>
        <li>预约试驾</li>
	</ul>
<%@include file="common_heard.jsp"%>
<div class="container">
    <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;">
        <jsp:include page="common_login.jsp"></jsp:include>
        <div class="page_title">预约试驾</div>
        <div class='takepage_con'>
            <div class='takepage'>
	            <div class="sub_menu yuyue">
	                <span class="sub_menu_yuyue_1" onclick="clickHeard(0)"></span>
                    <span class="sub_menu_yuyue_2" onclick="clickHeard(1)"></span>
                    <span class="sub_menu_yuyue_3" onclick="clickHeard(2)"></span>
                    <span class="sub_menu_yuyue_4" onclick="clickHeard(3)"></span>
                </div>
	            <!-- <div class='takepage1'><img src="images/yuyue_banner1.jpg"></div>
                <div class='takepage2'><img src="images/yuyue_banner2.jpg"></div>
                <div class='takepage3'><img src="images/yuyue_banner3.jpg"></div>
                <div class='takepage4'><img src="images/yuyue_banner4.jpg"></div> --> 
            </div>
        </div>
        <div class='takepage_slidecon'>		
            <div class='takepage_slidecon1' style="margin-bottom:50px">
                <p style='padding-left:46px;' >登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表单中。</p>
                <div class='tp_2 positon_rel'>
                    <table width="100%">
                        <tr>
                            <td colspan="3"><p style='margin:10px 0 10px -2px'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
                        </tr>
                        <tr>
                            <td width="112"><span class="tip">*</span><span class="f_14 f_w">试驾意向</span></td>
                            <td width="268"></td>
                            <td></td>
                        </tr>
                        <tr>
						<td style="height:25px;"><span class="tip">*</span><span>意向车型：</span></td>
						<td style="height:25px; padding-left:18px">
							<div style='float:left'>
        							<form class="frm" action="#">
                                    <fieldset class="longlabels" style=" width:250px">
                                        <select id="cdIntentcars" class="select" onchange="change_autos('cdIntentmodels',this.value,'');$('#cdIntentmodels').append('<option value=\'-1\'>任意款</option>');$('#cdIntentmodels').siblings('.caption').text('请选择');getProduct(this.value);validFocus(1,this.id);" onblur="validFocus(1,this.id);" style="opacity: 0.0001; z-index: 2;">
                                         </select>
                                    </fieldset>
                                    </form>
        						<span class="span1">车系</span>
							</div>							
						</td>
						<td style='height:25px; padding-left:10px'><span class='wrong' id="cdIntentcars_wrong"></span>
					</td>
					</tr>
                    	<tr>
						<td style="height:25px;"></td>
						<td style="height:25px; padding-left:18px">							
							<div>
                                <form class="frm" action="#">
                                    <fieldset class="longlabels" style=" width:250px">
                                    <select id="cdIntentmodels" class="select" name="cdIntentmodels" onchange="validFocus(1,this.id);" onblur="validFocus(1,this.id);" style="opacity: 0.0001; z-index: 2;">
                                        <option value="">请选择</option>
                                        </select>
                                </fieldset>
                                </form>
        						<span class="span1">车型</span>
							</div>
						</td>
						<td style='height:25px; padding-left:10px'><span class='wrong' id="cdIntentmodels_wrong"></span>
					</td>
					</tr>
                        <tr >
                            <td style="height:25px;"><span class="tip">*</span><span>意向经销商：</span></td>
                            <td style="height:25px; padding-left:18px">
                            <div style='float:left'>
                                <form class="frm">
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="cdProvince" onchange="change_dealercitys('cdCity',this.value,'');$('#cdCity').siblings('.caption').text('请选择');$('#aid').siblings('.caption').text('请选择');validFocus(1,this.id);" onblur="validFocus(1,this.id);" class="select" name="cdProvince" style="opacity: 0.0001; z-index: 2;">
                                        </select>
                                    </fieldset>
                                </form>
                                <span class="span1">省</span>
                                </div>
                                <div>
                                    <form class="frm">
                                        <fieldset class="longlabels" style=" width:122px">
                                            <select  id="cdCity" class="select" name="cdCity" onclick="change_dealers('aid',this.value,'');" onblur="validFocus(1,this.id);" onchange="validFocus(1,this.id);$('#aid').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                                 <option value="">请选择</option>
											   </select>
                                        </fieldset>
                                    </form>
                                <span class="span1"> 市</span>
                                </div>					
                            </td>
                            <td style='height:25px; padding-left:10px'><span class='wrong' id="cdProvince_wrong"></span></td>
                        </tr>
                        <tr>
                            <td style="height:25px;">&nbsp;</td>
                            <td style="height:25px; padding-left:18px">
                                <div style='float:left'>
                                    <div style='float:left'>
                               <form class="frm" action="#" method="POST">
                                <fieldset class="longlabels" style=" width:240px">
                                    <select id="aid" class="select" name="dealer.aid" onchange="validFocus(1,this.id);" onblur="validFocus(1,this.id);" style="opacity: 0.0001; z-index: 2;">
									  <option value="">请选择</option>
                                        </select>
                                </fieldset>
                                </form>
                                    </div>
                                    <span class="span1">经销商</span> 
                                </div>
                                    
                                
                                
                            </td>	
                            <td style='height:25px; padding-left:10px'><span class='wrong' id="aid_wrong"></span></td>	
                        </tr>
                        <tr>
                        	<td height="8"></td>
                        </tr>
                        <tr>
                        <tr>
                            <td style="height:25px;"><span class="tip">*</span><span class="f_14 f_w">是否拥有驾照</span></td>
                            <td class="f_14" style="height:25px; padding-left:18px">
								<span class="js_car">
                                <input id="Radio1" type="radio" onchange="validFocus(1,'cdIslicense');" class="myClass" value="1" name="cdIslicense" data-label="有" data-color="blue"/>
								</span>
								<span class="js_car">
								<input id="Radio2" type="radio" onchange="validFocus(1,'cdIslicense');" class="myClass" value="0" name="cdIslicense" data-label="无"/>
								</span>
							</td>
                        <td style='height:25px; padding-left:10px'><span class='wrong' id="cdIslicense_wrong"></span>
                        </td>
                        </tr>
                        <tr id="cdDriverage_tr">
                            <td>
                                <span>有效驾龄：</span>	
								<div style='position:relative;z-index:8900'>
                                	<div class='shade cdDriverage_div' style="display: none;"></div>
                                </div>
                            </td>
                            <td style="padding-left:18px">
                                <form class="frm" action="#">
                                <fieldset class="longlabels" style=" width:277px;">
                                    <select id="cdDriverage" class="select" name="cdDriverage" style="opacity: 0.0001; z-index: 2;">
                                       <option value="">请选择</option>
											<option value="1年">1年</option>
											<option value="2年">2年</option>
											<option value="3年">3年</option>
											<option value="4年">4年</option>
											<option value="5年以及以上">5年以及以上</option>
                                        </select>
                                </fieldset>
                                </form>
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdDriverage_wrong"></span></td>
                        </tr>	
                    </table>
                    <div class=" bottom_input_box">
                        <span class='next'></span>
                    </div> 
                </div>
                               
            </div>
            <div class='takepage_slidecon2' style="margin-bottom:50px">
                <p style='padding-left:46px;' >登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表单中。</p>
                <div class='tp_2 positon_rel'>
                    <table width="100%">
                        <tr>
                            <td colspan="3"><p style='margin:10px 0 10px -2px'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
                        </tr>
                        <tr>
                            <td width="112">
                                <div><span class="tip">*</span><span class="word_apacing19">姓 名：</span></div></td>
                            <td width="280"style='padding-left:18px'>
							<input type='text' name='cdName' class='necessary' style='width:100%' id='cdName' onchange="validFocus(2,this.id);" onblur="validFocus(2,this.id);"></td>
                            <td style='padding-left:10px'><span class='wrong' id="cdName_wrong"></span></td>
                        </tr>
                        <tr>
                            <td>
                                <div style='height:18px;'><span class="tip">*</span><span class="word_apacing19">称 谓：</span></div>							
                            </td>
                            <td class='sp_1' style='padding-left:22px'>
                                <input id="Radio5" type="radio" onchange="validFocus(2,'cdGender');"  class="myClass" value="1" name="cdGender" data-label="先生" data-color="blue" <s:if test='#session.AUDI_WEB_USER.gender eq "1"'>checked="checked"</s:if>/>
                                <input id="Radio6" type="radio" onchange="validFocus(2,'cdGender');"  class="myClass" value="0" name="cdGender" data-label="女士" <s:if test='#session.AUDI_WEB_USER.gender eq "0"'>checked="checked"</s:if>/>
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdGender_wrong"></span></td>
                        </tr>
                        <tr>
                            <td><span class="tip">*</span>手机号码：</td>
                            <td style='padding-left:18px'>
							<input type='text' name='tru.cdMobile'  id="cdMobile" style='width:100%' maxlength=11  onblur="validFocus(2,this.id);"></td>
                            <td style='padding-left:10px'><span class="wrong" id='cdMobile_wrong'></span></td>
                        </tr>                    
                        <tr>
                            <td></td>
                            <td style='padding:5px 0 0 18px'>
                                <div id="sendValid_1"><span class="colorred"><img src="images/ld.jpg"> </span>
								<a href="javascript:;" onclick="getValidationCode()">点击获取手机验证码</a></div>
                                <div class="phone_error" style="display:none;" id="sendValid_2"><span>验证码已发送，如在60秒内未收到，请重新获取。</span></div>
                            </td>
                            <td class="f_w"><div style="display:none;"  id="sendValid_3">"<span class="audi_red"></span>"</div></td>
                        </tr>
                        <tr>
                            <td><span class="tip">*</span><span style='word-spacing:7px'>验证码 ：</span></td>
                            <td style='padding-left:18px'>
							<input type='text' name='validCode' id="validCode" style='width:100%'  onblur="validFocus(2,this.id);"></td>
                            <td style='padding-left:10px'>
							<span class='note' id="validCode_wrong"></span>
							<span class='tixing'>请填写您手机短信接收到的验证码。</span></td>
                        </tr>
                        <tr>
                            <td id='riqi'><span>出生日期：</span></td>
                            <td style='padding-left:18px'>
                                <div style='float:left'>								
                                        <form class="frm">
                                        <fieldset class="longlabels" style=" width:76px">
                                            <select id="birthY" class="select" name="birthY" onchange="setDay('birthY','birthM','birthD');$('#birthD').val($('#birthD_hidden_test').val());" style="opacity: 0.0001; z-index: 2;">
                                              
                                                </select>
                                        </fieldset>
                                        </form>        						
                                    <span class="span_data span1">年</span>
                                </div>
                                <div style='float:left'>
                                        <form class="frm">
                                        <fieldset class="longlabels" style=" width:70px">
                                            <select id="birthM" class="select" name="birthM" onchange="setDay('birthY','birthM','birthD');$('#birthD').val($('#birthD_hidden_test').val());" style="opacity: 0.0001; z-index: 2;">
												</select>
                                        </fieldset>
                                        </form>
                                    
                                    <span class="span_data span1">月</span>
                                </div>
                                <div>
                                    
                                        <form class="frm">
                                        <fieldset class="longlabels" style=" width:70px">
                                            <select id="birthD" class="select" name="birthD" style="opacity: 0.0001; z-index: 2;" onchange="$('#birthD_hidden_test').val(this.value);">
												<option value="">请选择</option>
                                            </select>
											<input type="hidden" id="birthD_hidden_test" value=""/>
                                        </fieldset>
                                        </form>
                                    
                                    <span class="span_data span1">日</span>
                                </div>								
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id="birth_wrong"></span></td>
                        </tr>										
                    </table>
                    <div class="bottom_input_box clearfix">
                        <span class='next'></span>
                        <span class='pre'></span>
                    </div>
                </div>
            </div>
            <div class='takepage_slidecon3'  style="margin-bottom:50px">
                <p style='padding-left:46px'>登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表单中。
                </p>
                <div class='tp_3 positon_rel'>
                    <table width="100%">
                        <tr>
                            <td colspan="3"><p style='margin:10px 0 10px 0'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
                        </tr>
                        <tr>
                            <td width="138"><span class="tip">*</span><span class="f_14 f_w"style='margin-right:10px'>目前车辆拥有状况</span></td>
                            <td class="f_14" width="282">
								<span class="js_car">
                                <input id="havecar" type="radio"   onchange="validFocus(3,'cdIscar');"  class="myClass" value="1" name="cdIscar" data-label="有" data-color="blue"/>
								</span>
                                <span class="js_car">
							   <input id="nocar" type="radio"  onchange="validFocus(3,'cdIscar');chkiscar();"   class="myClass" value="0" name="cdIscar" data-label="无"/>
								 </span>
							</td>
                            <td style='padding-left:10px'><span class='wrong' id="cdIscar_wrong"></span></td>
                        </tr>
                        <tr>
                            <td>
                                <span>车辆品牌：</span>	
								<div style='position:relative;z-index:8900'>
                                	<div class='shade carband' style="display:none;height:100px;width:480px;" id="carbrand_div_testdrive"></div>
                                </div>
                            </td>
                            <td>
                                <form class="frm">
                                    <fieldset class="longlabels" style="width:277px;">
                                        <select id="cdBrand" class="select" name="cdBrand"
										onchange="change_brands('cdModel',this.value,'');$('#cdModel').siblings('.caption').text('请选择');if(this.value!=audi_brand_2013){$('#cdFootnum_tr').hide();$('#carbrand_div_testdrive').css('height','100px');}else{$('#cdFootnum_tr').show();$('#carbrand_div_testdrive').css('height','140px');}"
										style="opacity: 0.0001; z-index: 2;">
                                            </select>
                                    </fieldset>
                                </form>
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdBrand_wrong"></span></td>
                        </tr>
                        <tr>
                            <td><span>车辆型号：</span></td>
                            <td>
                                <form class="frm">
                                <fieldset class="longlabels" style=" width:277px;">
                                    <select id="cdModel" class="select" name="cdModel" style="opacity: 0.0001; z-index: 2;">
                                        
                                        </select>
                                </fieldset>
                                </form>
                            </td>
                        <td style='padding-left:10px'><span class='wrong' id="cdModel_wrong"></span></td>
                        </tr>
                        <tr>
                            <td><span>购车时间：</span></td>
                            <td style='position:relative'>
                                <div style='float:left'>       						
                                    <form class="frm">
                                        <fieldset class="longlabels" style=" width:122px">
                                            <select id="cdBuytime" class="select" name="cdBuytime" style="opacity: 0.0001; z-index: 2;">
                                             </select>
                                        </fieldset>
                                    </form>        						
                                    <span class="span1">年</span>						
                                </div>
                                <div>
                                    <form class="frm">
                                        <fieldset class="longlabels" style=" width:122px">
                                        <select id="cdBuymonth" class="select" name="cdBuymonth" style="opacity: 0.0001; z-index: 2;">
                                        </select>
                                        </fieldset>
                                    </form>        						
                                    <span class="span1">月</span>						
                                </div>
                            
                        </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdBuytime_wrong"></span></td>
                        </tr>
                        <tr id="cdFootnum_tr" style="display: none;">
                            <td><span class="tip">*</span><span style='word-spacing: 3px;'>车架号：</span></td>
                            <td><input type='text' name='cdFootnum' id='cdFootnum' style='width:275px' maxlength=17   onchange="validFocus(3,this.id);"  onblur="validFocus(3,this.id);"></td>
                            <td style='padding-left:10px'>
							<span class='note' id="cdFootnum_wrong"></span>
							<span class='tixing'>请填写行驶证上的17位车架号。</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" height="5"></td>
                        </tr>
                        <tr>
                            <td><span class="tip">*</span><span class="f_14 f_w">购车意向</span></td>
                            <td class="f_14">
								<span class='js_car'>
                                <input id="Radio1" type="radio"  onchange="validFocus(3,'cdIntent');"   class="myClass" value="1" name="cdIntent" data-label="有" data-color="blue"/>
                                </span>
                                <span class='js_car'>
								<input id="Radio2" type="radio"  onchange="validFocus(3,'cdIntent');"  class="myClass" value="0" name="cdIntent"  data-label="无"/>
								</span>
						   </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdIntent_wrong"></span></td>
                        </tr>
                        <tr>	
                            <td><span class="tip">*</span><span>计划购车时间：</span>
								<div style='position:relative;z-index:8900;'>
                                	<span class='shade buytime' style="display: none;"></span>
                                </div>
							</td>
                            <td>
                                <form class="frm">
                                <fieldset class="longlabels" style=" width:277px;">
                                    <select id="cdPlanbuytime" class="select" name="cdPlanbuytime" style="opacity: 0.0001; z-index: 2;"  onchange="validFocus(3,this.id);"   onblur="validFocus(3,this.id);">
                                         <option value="">请选择</option>
								            <option value="3个月内">3个月内</option>
								            <option value="4-6个月">4-6个月</option>
								            <option value="7个月到一年内">7个月到一年内</option>
								            <option value="1年以上">1年以上</option>
								            <option value="不确定">不确定</option>
                                        </select>
                                </fieldset>
                                </form>
    
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdPlanbuytime_wrong"></span></td>
                        </tr>
                        <tr>
                            <td><span class="tip">*</span><span>购车预算：</span></td>
                            <td>
                                <form class="frm">
                                <fieldset class="longlabels" style=" width:277px;">
                                    <select id="cdBuybudget" class="select" name="cdBuybudget" style="opacity: 0.0001; z-index: 2;"  onchange="validFocus(3,this.id);"   onblur="validFocus(3,this.id);">
										 <option value="">请选择</option>
										 <option value="20万以下">20万以下</option>
										<option value="20-25万">20-25万</option>
										<option value="25-30万">25-30万</option>
										<option value="30-50万">30-50万</option>
										<option value="50-70万">50-70万</option>
										<option value="70-90万">70-90万</option>
										<option value="90-110万">90-110万</option>
										<option value="110万以上">110万以上</option>
										<option value="不确定">不确定</option>
                                        </select>
                                </fieldset>
                                </form>
                    </td>
                            <td style='padding-left:10px'><span class='wrong' id="cdBuybudget_wrong"></span></td>	
                        </tr>
                        
                    </table>
    				<div class="bottom_input_box clearfix">
                        <span class='next'></span>
                        <span class='pre'></span>
                    </div>
                </div>
                
            </div>
            <div class='takepage_slidecon4 positon_rel'>
				<div class='zr_dot'>
					<p>试驾信息：</p>
					<ul>
						<li><span class="word_apacing19">意向车型：</span><span id="info_cdIntentmodels"></span></li>
						<li><span class="word_apacing19">意向经销商：</span><span  id="info_cdProvince"></span></li>
						
					</ul>
				</div>
				<div class='zr_dot'>
					<p>是否拥有驾照</p>
					<ul>
						<li><span id="info_cdIslicense">有</span></li>
                        <li  class="info_wu1"><span>有效驾龄：</span><span id="info_cdDriverage"></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>个人基本信息</p>
					<ul>
						<li><span class="word_apacing19">姓 名：</span><span id="info_cdName"></span></li>
						<li><span class="word_apacing19">称 谓：</span><span id="info_cdGender"></span></li>
						<li><span class="word_apacing19">手机号码：</span><span id="info_cdMobile"></span></li>
						<li><span class="word_apacing19">出生日期：</span><span id="info_cdBirthday"></span></li>
					</ul>
				</div>
                <div class='zr_dot'>
					<p>目前车辆拥有状况</p>
					<ul>
						<li><span id="info_cdIscar">有</span></li>
						<li class="info_wu2"><span>车辆品牌：</span><span id="info_cdBrand"></span></li>
						<li class="info_wu2"><span>车辆型号：</span><span id="info_cdModel"></span></li>
						<li class="info_wu2"><span>购车时间：</span><span id="info_cdBuytime"></span></li>
						<li class="info_wu2"><span>车架号：</span><span id="info_cdFootnum"></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>购车意向</p>					
					<ul>
                    	<li><span id="info_cdIntent"></span></li>
						<li class="info_wu3"><span>计划购车时间：</span><span id="info_cdPlanbuytime"></span></li>
						<li class="info_wu3"><span>购车预算：</span><span id="info_cdBuybudget"></span></li>
					</ul>
				</div>
				<div class='zr_dot' style='border-bottom:1px black dotted'>
					<div  class="control-group clearfix">
                    	<div class="control_left">隐私条款：</div>
                        <div class="controls">
                        	<div class="input_box">
							<input id="agree" type="checkbox"  class="myClass" value="yes"  name="agree" checked="checked" data-label="" data-color="blue"/></div>
                            <span class="controls_text">我特此授权一汽-大众奥迪销售事业部保留我的数据以便解答我的问题；我所提供的信息将按照数据保护规定进行保留。我也同意一汽-大众奥迪销售事业部把我的数据用于其它营销、调查和统计目的，并允许一汽-大众奥迪销售事业部根据我所提供的信息与我联系。</span>
                        </div>
                    </div>					
				</div>
                <div class="bottom_input_box" style='border:none'>                	
					<span class='refer' onclick="submitTestDriver()"></span>
                    <span class='pre'></span>
                </div>				
			</div>
            <div id='takepage_fail' style='padding-left:22px'> 
				<p><strong>提交失败！</strong></p>
				<p class='failnote'>抱歉，您的信息提交失败，请返回上一级重新提交。</p>
				<p class='pres'> <strong class='failred'>
				<img src="images/jiantou.png" style='margin-top:4px'> </strong> <a href="#" class="f_w">返回上一步</a></p>
			</div>
			<div id='takepage_sucss'>
				<p style='font-weight: bold;'>提交成功!</p>
				<div class='sucssnote'>感谢您对奥迪品牌的关注和支持。</div>
				<ul>
					<s:if test="#session.AUDI_WEB_USER==null">
						<li class="list_bg">
							<span> <a href="javascript:;" class='login' onclick="commonUserReg()">注册我的奥迪账户  </a>
							<span style='margin-left:30px;font-weight:normal'>（一键注册“我的奥迪账户”，省略繁冗填表步骤）</span></span>
						</li>
					</s:if>
					<li class='loadform list_down' id="product_li" style="display: none;">
					</li>
					<li class="list_bg">
						<a href='homepage.action'> 返回联系奥迪</a>
					</li>
				</ul>
			</div> 
        </div>
      </div>
    </div>
<%@include file="common_foot.jsp"%>
<%@include file="common_login_div.jsp"%>
<script type="text/javascript">
function chkiscar(){
	var valb = $('#cdBrand').val();
     if(valb!=audi_brand_2013){
     			$('#cdFootnum_tr').hide();
			    $('#carbrand_div_testdrive').css('height','100px');
	 }else{
			    $('#cdFootnum_tr').show();
			    $('#carbrand_div_testdrive').css('height','140px');
		    }


}
 
		    
		$(function(){
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			$('input.myClass').Checkable({
				color: 'blue'
			});
			$(".js_password").on("click",function(){
				$(this).hide();
				$(".js_w").show();
			});
		});	
		//提交的信息拼接
		var submitVals="";
		var wrongObj={
			cdIntentcars_wrong:"请选择试驾的车系",
			cdIntentmodels_wrong:"请选择试驾的车型",
			cdProvince_wrong:"请选择经销商省市",
			cdCity_wrong:"请选择经销商城市",
			aid_wrong:"请选择经销商",
			cdIslicense_wrong:"请选择是否有驾照",
			cdDriverage_wrong:"请选择您的驾龄",
			cdName_wrong:"请填写姓名",
			cdGender_wrong:"请选择性别",
			cdMobile_wrong:"请填写手机号码",
			cdMobile_valid_wrong:"手机号码应为11位数字",
			validCode_wrong:"请填写验证码",
			birth_wrong:"请选择出生日期",
			cdIscar_wrong:"请选择是否拥有车辆",
			cdBrand_wrong:"请选择车辆品牌",
			cdModel_wrong:"请选择车辆型号",
			cdBuytime_wrong:"请选择购车时",
			cdFootnum_wrong:"请填写车架号",
			cdIntent_wrong:"请选择是否有购车意向",
			cdPlanbuytime_wrong:"请选择计划购车时间",
			cdBuybudget_wrong:"请选择购车预算"
		};
		var index = 0;
		(function(){
 			
			$('.takepage>div').eq(0).show().siblings().hide();
			$('.takepage_slidecon>div').eq(0).show().siblings().hide();
			//下一步
			$('.next').click(function(){
				//是否有错误
				var isWrong=false;
				var index_i=index+1;
				//所有字段
				var allField=[
								{cdIntentcars:"cd.cdIntentcars"},
								{cdIntentmodels:"cd.cdIntentmodels"},
								{cdProvince:"cd.cdProvince"},
								{cdCity:"cd.cdCity"},
								{aid:"cd.cdIntentdealer"},
								{cdIslicense:"cd.cdIslicense",type:"radio"},//是否拥有驾照
								{cdDriverage:"cd.cdDriverage"},
								{cdName:"cd.cdName"},
								{cdGender:"cd.cdGender",type:"radio"},//性别
								{cdMobile:"cd.cdMobile"},
								{validCode:"validCode"},
								{cdBirthday:"cd.cdBirthday"},//这个是由birthY,birthM,birthD
								{cdIscar:"cd.cdIscar",type:"radio"},//是否有车
								{cdBrand:"cd.cdBrand"},
								{cdModel:"cd.cdModel"},
								{cdBuytime:"cd.cdBuytime"},
								{cdBuymonth:"cd.cdBuymonth"},
								{cdIntent:"cd.cdIntent",type:"radio"},//是否购车意向
								{cdFootnum:"cd.cdFootnum"},
								{cdPlanbuytime:"cd.cdPlanbuytime"},//计划购车时间
								{cdBuybudget:"cd.cdBuybudget"}//购车预算
								
							];
				isWrong=validFocus(index_i,"");
				if(index_i==3){//信息
					//没有错误
					if(!isWrong){
						//所有的key
						for(var fi=0;fi<allField.length;fi++){
							var obj=allField[fi];
							for (var key in obj){
							  if(obj.type || obj.type=="radio"){
									var value=$('input[name="'+key+'"]:checked').attr("value");
									//真实的value
									var realdValue=value;
									if(key=="cdGender"){
										value=(value=="0"?"女士":"先生");
									}else{
										value=(value=="0"?"无":"有");
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
									
									//车型
									if(key=="cdIntentmodels"){
										value=getDictModel($("#cdIntentcars").val(),$("#cdIntentmodels").val());
									}
									
									//这个是由birthY,birthM,birthD
									if(key=="cdBirthday"){
										value=$("#birthY").val()+"年"+$("#birthM").val()+"月"+$("#birthD").val()+"日";
										if($("#birthY").val()=="" || $("#birthM").val()=="" || $("#birthD").val()==""){
											realdValue="";
											$("#info_cdBirthday").parent("li").hide();
										}else{
											realdValue=$("#birthY").val()+"-"+$("#birthM").val()+"-"+$("#birthD").val();
											$("#info_cdBirthday").parent("li").show();
										}
									}
									//经销商省市
									if(key=="cdProvince" || key=="cdCity"){
										//getDictPovince($("#cdProvince").val())+"省"+getDictCity($("#cdProvince").val(),$("#cdCity").val())+"市"+
										value =getDictDealer($("#cdCity").val(),$("#aid").val());
									}
									if(key=="cdBrand"){
										value=getDictBrand($("#cdBrand").val());
									}
									if(key=="cdModel"){
										value=getDictBrandModel($("#cdBrand").val(),$("#cdModel").val());
									}
									if(key=="cdBuytime"){
										value=$("#cdBuytime").val()+"年"+$("#cdBuymonth").val()+"月";
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
				if(isWrong==false && index_i==2){
					var cdMobile=$("#cdMobile").val();
					var validCode=$("#validCode").val();
					$.post("testdrive_mobileValidCode.action","cd.cdMobile="+cdMobile+"&validCode="+validCode,function(data){
						if(data.success=="true"){
							$("#validCode_wrong").attr("class","note");
							$("#validCode_wrong").siblings('.tixing').show();
							$("#validCode_wrong").removeAttr("style");
							index++;
							showpage(index);
						}
						else{
							$("#validCode_wrong").attr("class","wrong");
							$("#validCode_wrong").siblings('.tixing').hide();
							wrongInfo("validCode_wrong","验证码错误,请重新获取");
						}
					});
				}
				else if(isWrong==false){
					index++;
					showpage(index);
				}else{
					index=index_i-1;
				}
				return;
			});
			//返回上一步
			$('.pre').click(function(){
				index--;
				showpage(index);
			});
			//提交失败返回上一步
			$('.pres').click(function(){
				$('.takepage_con').show();
				showpage(index);
			});
			
				/*判断有车没车，购车意向*/
			$(".js_car").each(function(){
				$(this).on("click",function(){
					var input = $(this).find("input");
					$(this).find("a").triggerHandler("click");
					var car = $(this).parents("tr").next().find(".shade");
					if(input.is(":checked") && input.attr("value") == "0"){
						car.show();
					}
					else{
						car.hide();
					}
				})
				
			});
		})();
		
			/*提交按钮*/
			function submitTestDriver(){
				$.post("testdrive_save.action",submitVals,function(data){
					if(data.success=="true"){
						//元素信息
						var productAArr=[["<a target='_blank' href='","'><span class='colorred'><img src='images/ld.jpg'></span>&nbsp;<span style='margin-right:4px;font-weight:normal;font-family:Arial, Helvetica, sans-serif;'>"],["<a  target='_blank'  href='","' style='margin-left:7px'><span class='colorred'><img src='images/ld.jpg'></span>&nbsp;<span style='font-weight:normal'>"],["<a target='_blank'  href='","' style='margin-left:7px'><span class='colorred'><img src='images/ld.jpg'></span>&nbsp;<span style='font-weight:normal'>"]];
						var productA="";
						for(var i=0;i<productArr.length;i++){
							if(i>2){
								break;
							}
							var obj=productArr[i];
							productA+=productAArr[i][0]+"<%=path%>"+obj.cpPdf+productAArr[i][1]+obj.cpPagename+"</span></a>";
						}
						if(productA==""){
							$("#product_li").hide()
						}else{
							//提交成功页的元素
							$("#product_li").html("<a href=''#' style='margin-right:8px'>下载车型装备与价目表</a>"+productA);
							$("#product_li").show();
						}
						
						$('#takepage_sucss').show().siblings().hide();
						$('.takepage_con').css('display','none');
						//注册时，把用户名带入到注册框
						$("#rform input[name='user.username']").val($("#cdName").val());
					}
					else{
						$('#takepage_fail').show().siblings().hide();
						$('.takepage_con').css('display','none');
					}
				});
				
			}
		//点击头部判断,i传入的
		var submitMaxId=0;
		function clickHeard(i){
			var isSuc=true;
			for(var j=1;j<=i;j++){
				isSuc=validFocus(j,"");
				if(isSuc==true){
					break;
				}
			}
			if(i==0 || isSuc==false){
				if(i==2){
					var cdMobile=$("#cdMobile").val();
					var validCode=$("#validCode").val();
					$.post("testdrive_mobileValidCode.action","cd.cdMobile="+cdMobile+"&validCode="+validCode,function(data){
						if(data.success=="true"){
							$("#validCode_wrong").attr("class","note");
							$("#validCode_wrong").siblings('.tixing').show();
							$("#validCode_wrong").removeAttr("style");
							showpage(i);
						}
						else{
							$("#validCode_wrong").attr("class","wrong");
							$("#validCode_wrong").siblings('.tixing').hide();
							wrongInfo("validCode_wrong","验证码错误,请重新获取");
						}
					});
					
				}else if(i!=2){
					showpage(i);
				}
			}
		}		
		function showpage(i){
		 index = i;
			$(".yuyue").css("background-image","url(images/yuyue_banner"+(i+1)+".jpg)");
			//$('.takepage div').eq(i).show().siblings().hide();
		 	$('.takepage_slidecon>div').eq(i).show().siblings().hide();
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
		
		//验证手机是否可用以及验证码的发送
			function getValidationCode(){
				var cdMobile=$("#cdMobile").val();
				if(validationPhone(cdMobile))
				{
					wrongCucccess("cdMobile_wrong");
					$('#sendValid_1').hide();
					$("#sendValid_2").show();
					$("#sendValid_3").show();
					$("#sendValid_3>.audi_red").html(longTime);
					timeId = setInterval("countDown()",1000);
					//验证手机是否已经存在
					$.post("testdrive_sendMobileCode.action","cd.cdMobile="+cdMobile,function(data){
						if(data.success!="true"){
							$('#sendValid_1').show();
							$("#sendValid_2").hide();
							$("#sendValid_3").hide();
							clearInterval(timeId);
							longTime=59;
						}
						
					});
				}else{
					wrongInfo("cdMobile_wrong","手机号码应为11位数字。");
				}
			}
			var longTime=59;//时长
			var timeId;//时间控制器
			function countDown(){
				if(longTime==0){
					$('#sendValid_1').show();
					$("#sendValid_2").hide();
					$("#sendValid_3").hide();
					clearInterval(timeId);
					longTime=59;
					return;
				}
				$("#sendValid_3>.audi_red").html(longTime);
				longTime=longTime-1;
			}
		//验证是否成功
		function onblurValid(cid,valiId){
			var flag=false;
			if(cid==""){
				flag=false;
			}
			else if(cid==valiId){
				flag = true;
			}
			return flag;
		}
		//获取焦点的时候去掉校验
		function validFocus(i,validid){
			var isWrong=false;
			if(i==1){
					//检测代码
					dataLayer.push({'event':'vPage','vPageGroup': 'testdrive','vPageName': '填写试驾信息'});
					var cdIntentcars=$("#cdIntentcars").val();//车系
					var cdIntentmodels=$("#cdIntentmodels").val();//车型
					var cdProvince=$("#cdProvince").val();//经销商省
					var cdCity=$("#cdCity").val();//经销商市
					var aid=$("#aid").val();//经销商id
					var cdIslicense = $('input[name="cdIslicense"]:checked').attr("value");//是否拥有驾照
					var cdDriverage="";
					
					
					
					
					
					
					$("#cdDriverage_wrong").text("");
					
					$("#cdDriverage_wrong").css("background-image","none");
					
					
					//1有驾照，2无驾照
					if(cdIslicense=='1'){
						cdDriverage=$("#cdDriverage").val();//驾龄
					}else{
						$("#info_cdDriverage").parent("li").hide();
					}
					if(cdIntentcars==""){
						wrongInfo("cdIntentcars_wrong",wrongObj.cdIntentcars_wrong);
						isWrong=true;
					}else{
						$("#cdIntentcars_wrong").text("");
						$("#cdIntentcars_wrong").css("background-image","none");
					}
					if(onblurValid(validid,"cdIntentcars"))return;
					if(cdIntentmodels==""){
						wrongInfo("cdIntentmodels_wrong",wrongObj.cdIntentmodels_wrong);
						isWrong=true;
					}else{
						$("#cdIntentmodels_wrong").text("");
						$("#cdIntentmodels_wrong").css("background-image","none");
					}
					if(onblurValid(validid,"cdIntentmodels"))return;
					if(cdProvince==""){
						wrongInfo("cdProvince_wrong",wrongObj.cdProvince_wrong);
						isWrong=true;
					}else{
						$("#cdProvince_wrong").text("");
						$("#cdProvince_wrong").css("background-image","none");
					}
					if(onblurValid(validid,"cdProvince"))return;
					if(cdCity==""){
						wrongInfo("cdProvince_wrong",wrongObj.cdCity_wrong);
						isWrong=true;
					}else{
						$("#cdProvince_wrong").text("");
						$("#cdProvince_wrong").css("background-image","none");
					}
					if(onblurValid(validid,"cdCity"))return;
					if(aid==""){
						wrongInfo("aid_wrong",wrongObj.aid_wrong);
						isWrong=true;
					}else{
						$("#aid_wrong").text("");
						$("#aid_wrong").css("background-image","none");
					}
					if(onblurValid(validid,"aid"))return;
					if(!cdIslicense ||cdIslicense==""){
						wrongInfo("cdIslicense_wrong",wrongObj.cdIslicense_wrong);
						isWrong=true;
					}else{
						$("#cdIslicense_wrong").css("background-image","none");
						$("#cdIslicense_wrong").text("");
					}
					if(onblurValid(validid,"cdIslicense"))return;
					if(!cdDriverage || cdDriverage==""){
						//wrongInfo("cdDriverage_wrong",wrongObj.cdDriverage_wrong);
						//isWrong=true;
						$("#info_cdDriverage").parent("li").hide();
					}else{
						$("#info_cdDriverage").parent("li").show();
					}
					if(onblurValid(validid,"cdDriverage"))return;
					
			}else if(i==2){
					var cdName=$("#cdName").val();
					var cdGender=$('input[name="cdGender"]:checked').attr("value");
					var cdMobile=$("#cdMobile").val();
					var validCode=$("#validCode").val();
					var birthY=$("#birthY").val();
					var birthM=$("#birthM").val();
					var birthD=$("#birthD").val();
				
					
					wrongCucccess("birth_wrong");
					//用户名
					if(cdName==""){
						wrongInfo("cdName_wrong",wrongObj.cdName_wrong);
						isWrong=true;
					}else{
						wrongCucccess("cdName_wrong");
					}
					if(onblurValid(validid,"cdName"))return;
					if(!cdGender || cdGender==""){
						wrongInfo("cdGender_wrong",wrongObj.cdGender_wrong);
						isWrong=true;
					}else{
						wrongCucccess("cdGender_wrong");
					}
					if(onblurValid(validid,"cdGender"))return;
					if(cdMobile==""){
						wrongInfo("cdMobile_wrong",wrongObj.cdMobile_wrong);
						isWrong=true;
					}
					if(cdMobile!="" && !validationPhone(cdMobile))
					{
						wrongInfo("cdMobile_wrong",wrongObj.cdMobile_valid_wrong);
						isWrong=true;
					}else if(cdMobile!=""){
						wrongCucccess("cdMobile_wrong");
					}
					if(onblurValid(validid,"cdMobile"))return;
					//校验验证码
					wrongCucccess("validCode_wrong");
					if(validCode==""){
						$("#validCode_wrong").attr("class","wrong");
						$("#validCode_wrong").siblings('.tixing').hide();
						wrongInfo("validCode_wrong",wrongObj.validCode_wrong);
						isWrong=true;
					}else{
						$("#validCode_wrong").attr("class","note");
						$("#validCode_wrong").siblings('.tixing').show();
						$("#validCode_wrong").removeAttr("style");
					}
					if(onblurValid(validid,"validCode"))return;
					if(birthY=="" || birthM=="" || birthD=="" || $("#birthD").siblings('.caption').text()=="请选择"){
						//wrongInfo("birth_wrong",wrongObj.birth_wrong);
						//isWrong=true;
					}

				
			}else if(i==3){
				var cdIscar=$('input[name="cdIscar"]:checked').attr("value");//是否有车
					var cdBrand=$("#cdBrand").val();
					var cdModel=$("#cdModel").val();
					var cdBuytime=$("#cdBuytime").val();
					var cdBuymonth=$("#cdBuymonth").val();
					var cdFootnum=$("#cdFootnum").val();
					var cdIntent=$('input[name="cdIntent"]:checked').attr("value");//是否有购车意向
					var cdPlanbuytime=$("#cdPlanbuytime").val();//计划购车时间
					var cdBuybudget=$("#cdBuybudget").val();//购车预算
					
					wrongCucccess("cdBrand_wrong");
					wrongCucccess("cdModel_wrong");
					wrongCucccess("cdBuytime_wrong");
					
					//验证
					$("#info_cdBrand").parent("li").hide();
					$("#info_cdModel").parent("li").hide();
					$("#info_cdBuytime").parent("li").hide();
					$("#info_cdFootnum").parent("li").hide();
					//是否有车
					if(!cdIscar || cdIscar==""){
						wrongInfo("cdIscar_wrong",wrongObj.cdIscar_wrong);
						isWrong=true;
						if(onblurValid(validid,"cdIscar"))return;
					}else if(!cdIscar || cdIscar=="1"){
						//已经选择
						wrongCucccess("cdIscar_wrong");
						$("#info_cdBrand").parent("li").show();
						$("#info_cdModel").parent("li").show();
						$("#info_cdBuytime").parent("li").show();
						if(cdBrand==""){
							//wrongInfo("cdBrand_wrong",wrongObj.cdBrand_wrong);
							//isWrong=true;
							$("#info_cdBrand").parent("li").hide();
						}
						if(cdModel==""){
							//wrongInfo("cdModel_wrong",wrongObj.cdModel_wrong);
							//isWrong=true;
							$("#info_cdModel").parent("li").hide();
						}
						if(cdBuytime=="" || cdBuymonth==""){
							//wrongInfo("cdBuytime_wrong",wrongObj.cdBuytime_wrong);
							//isWrong=true;
							$("#info_cdBuytime").parent("li").hide();
						}
						
						$("#info_cdFootnum").parent("li").show();
						if(audi_brand_2013!=cdBrand){
							$("#cdFootnum_tr").hide();
							$("#info_cdFootnum").parent("li").hide();
						}else{
							$("#cdFootnum_tr").show();
						}
						$("#cdFootnum_wrong").attr("class","note");
						$("#cdFootnum_wrong").siblings('.tixing').show();
						$("#cdFootnum_wrong").removeAttr("style");
						//车架号
						if(cdFootnum=="" && audi_brand_2013==cdBrand){
							$("#cdFootnum_wrong").attr("class","wrong");
							$("#cdFootnum_wrong").siblings('.tixing').hide();
							wrongInfo("cdFootnum_wrong",wrongObj.cdFootnum_wrong);
							isWrong=true;
						}else if(audi_brand_2013!=cdBrand){
							$("#info_cdFootnum").parent("li").hide();
						}else if(audi_brand_2013==cdBrand){
							wrongCucccess("cdFootnum_wrong");
						}
						if(onblurValid(validid,"cdFootnum"))return;
					}else if(cdIscar){
						//已经选择
						wrongCucccess("cdIscar_wrong");
					}
					if(onblurValid(validid,"cdIscar"))return;
					//是否有购车意向
					$("#info_cdPlanbuytime").parent("li").hide();
					$("#info_cdBuybudget").parent("li").hide();
					if(!cdIntent || cdIntent==""){
						wrongInfo("cdIntent_wrong",wrongObj.cdIntent_wrong);
						isWrong=true;
						if(onblurValid(validid,"cdIntent"))return;
					}else if(!cdIntent || cdIntent=="1"){
						wrongCucccess("cdIntent_wrong");
						if(onblurValid(validid,"cdIntent"))return;
						//计划购车时间
						if(cdPlanbuytime==""){
							wrongInfo("cdPlanbuytime_wrong",wrongObj.cdPlanbuytime_wrong);
							isWrong=true;
						}else{
							wrongCucccess("cdPlanbuytime_wrong");
							$("#info_cdPlanbuytime").parent("li").show();
						}
						if(onblurValid(validid,"cdPlanbuytime"))return;
						//购车预算
						if(cdBuybudget==""){
							wrongInfo("cdBuybudget_wrong",wrongObj.cdBuybudget_wrong);
							isWrong=true;
						}else{
							wrongCucccess("cdBuybudget_wrong");
							$("#info_cdBuybudget").parent("li").show();
						}
						if(onblurValid(validid,"cdBuybudget"))return;
					}else if(cdIntent){
						wrongCucccess("cdIntent_wrong");
					}
					
					
			}
			return isWrong;
		}
		//选择车型试驾
		var testModele='<%=request.getParameter("carmodel")==null?"":request.getParameter("carmodel")%>';
		//车系车型
		initauto('cdIntentcars', testModele);
		if(testModele!=''){
			change_autos('cdIntentmodels','<%=request.getParameter("carmodel")%>','');
			$('#cdIntentmodels').append('<option value=\'-1\'>任意款</option>');
		}
		//省市
		initdealerprovince('cdProvince', '');
		change_dealercitys('cdCity', '','');
		//车品牌
		initbrand('cdBrand', '');
		change_brands('cdModel', '','');
		
		
		//用户年月日
		 var testY="<s:property value='#session.AUDI_WEB_USER.birthdayy'/>";
		 var testM="<s:property value='#session.AUDI_WEB_USER.birthdaym'/>";
		 var testD="<s:property value='#session.AUDI_WEB_USER.birthdayd'/>";
		
		var allYearOption="<option value=''>请选择</option><option value='1965'>1965以前</option>";
		//错误样式
		$(".wrong").css("background-image","none");
		for(var i=1966;i<2005;i++){
			if(testY!="" && i+""==testY){
				allYearOption+="<option value='"+i+"' selected>"+i+"</option>";
			}else{
				allYearOption+="<option value='"+i+"'>"+i+"</option>";
			}
			
		}
		$("#birthY").append(allYearOption);
		$("#birthM").append("<option value=''>请选择</option>");
		for(var i=1;i<13;i++){
			if(testM!="" && testM==i+""){
				$("#birthM").append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$("#birthM").append("<option value='"+i+"'>"+i+"</option>");
			}
		}
		//初始化生日
		if(testY!="" && testM!=""){
			setDay('birthY','birthM','birthD');
			$("#birthD").val(testD);
		}
		$("#cdBuytime").append("<option value=''>请选择</option>");
		for(var i=2001;i<2014;i++){
			$("#cdBuytime").append("<option value='"+i+"'>"+i+"</option>");
		}
		$("#cdBuymonth").append("<option value=''>请选择</option>");
		for(var i=1;i<13;i++){
			$("#cdBuymonth").append("<option value="+i+">"+i+"</option>");
		}
		
		//初始化页面数据
		<s:if test="#session.AUDI_WEB_USER!=null">
			var sessionUsername="<s:property value="#session.AUDI_WEB_USER.username"/>";
			var sessionMobile="<s:property value="#session.AUDI_WEB_USER.mobile"/>";
			var sessionGender ="<s:property value="#session.AUDI_WEB_USER.gender"/>";
			var sessionProvince ="<s:property value="#session.AUDI_WEB_USER.province"/>";
			var sessionCity ="<s:property value="#session.AUDI_WEB_USER.city"/>";
			var sessionIscar ="<s:property value="#session.AUDI_WEB_USER.iscar"/>";
			var sessionBrand ="<s:property value="#session.AUDI_WEB_USER.brand"/>";
			var sessionModel ="<s:property value="#session.AUDI_WEB_USER.model"/>";
			var sessionBuytime ="<s:property value="#session.AUDI_WEB_USER.buytime"/>";
			var sessionBuytimeyear="<s:property value="#session.AUDI_WEB_USER.buytimeyear"/>";
			var sessionBuytimemonth="<s:property value="#session.AUDI_WEB_USER.buytimemonth"/>";
			var sessionFootnum ="<s:property value="#session.AUDI_WEB_USER.footnum"/>";
			var sessionAuditingcar ="<s:property value="#session.AUDI_WEB_USER.auditingcar"/>";
			var sessionBuytimeyear ="<s:property value="#session.AUDI_WEB_USER.buytimeyear"/>";
			var sessionBuytimemonth ="<s:property value="#session.AUDI_WEB_USER.buytimemonth"/>";
			var sessionIslicense ="<s:property value="#session.AUDI_WEB_USER.islicense"/>";
			var sessionDriverage ="<s:property value="#session.AUDI_WEB_USER.driverage"/>";
			var sessionIntent ="<s:property value="#session.AUDI_WEB_USER.intent"/>";
			var sessionIntentcars ="<s:property value="#session.AUDI_WEB_USER.intentcars"/>";
			var sessionIntentmodels ="<s:property value="#session.AUDI_WEB_USER.intentmodels"/>";
			var sessionDealerProvince ="<s:property value="#session.AUDI_WEB_USER.dealerProvince"/>";
			var sessionDealerCity ="<s:property value="#session.AUDI_WEB_USER.dealerCity"/>";
			var sessionIntentdealer ="<s:property value="#session.AUDI_WEB_USER.intentdealer"/>";
			var sessionPlanbuytime ="<s:property value="#session.AUDI_WEB_USER.planbuytime"/>";
			var sessionBuybudget ="<s:property value="#session.AUDI_WEB_USER.buybudget"/>";
			
			if(sessionIntentcars!="" && testModele==''){
				//车系车型
				initauto('cdIntentcars', sessionIntentcars);
				if(sessionIntentcars!=""){
					change_autos('cdIntentmodels',sessionIntentcars,sessionIntentmodels);
					$('#cdIntentmodels').append('<option value=\'-1\'>任意款</option>');
				}
			}
			//省市
			initdealerprovince('cdProvince', sessionDealerProvince);
			change_dealercitys('cdCity', sessionDealerProvince,sessionDealerCity);
			change_dealers('aid',sessionDealerCity,sessionIntentdealer);
			//车品牌
			initbrand('cdBrand', sessionBrand);
			change_brands('cdModel', sessionBrand,sessionModel);
			//是否有驾照
			if(sessionIslicense!="" && sessionIslicense=="1"){
				$('input[name="cdIslicense"][value="1"]').attr("checked","checked");//是否有驾照
				$(".cdDriverage_div").hide();
				$("#cdDriverage").val(sessionDriverage);
			}
			//车架号
			$("#cdFootnum").val(sessionFootnum);
			if(sessionBrand==audi_brand_2013){
				$("#info_cdFootnum").parent("li").show();
				$("#cdFootnum_tr").show();
			}
			//是否有车辆
			if(sessionIscar!="" && sessionIscar=="1"){
				$('input[name="cdIscar"][value="1"]').attr("checked","checked");//是否有车
				$($('input[name="cdIscar"][value="1"]')).parents("tr").next().find(".shade").hide();
			}
			//是否有购车意向
			if(sessionIntent!="" && sessionIntent=="1"){
				$('input[name="cdIntent"][value="1"]').attr("checked","checked");//是否有购车意向
				$($('input[name="cdIntent"][value="1"]')).parents("tr").next().find(".shade").hide();
			}
			$("#cdName").val(sessionUsername);
			$("#cdMobile").val(sessionMobile);
			
			//计划购车时间
			$("#cdPlanbuytime").val(sessionPlanbuytime);
			$("#cdBuybudget").val(sessionBuybudget);
		</s:if>
		
	</script>
</body>
</html>
