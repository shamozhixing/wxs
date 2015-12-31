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
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<meta content="" name="description" />
<meta content="" name="author" />
<title>索取产品手册 &gt; 联系奥迪 &gt; 欢迎来到一汽-大众奥迪</title>
<meta name="language" content="zh" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/takepages_table.css">
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

<script type="text/javascript">
	var books=eval("("+'<s:property value='json' escape='false'/>'+")");
	var productArr=[];
	//根据车系id获取手册对象
	function getProduct(intentcars){
		productArr=[];
		var obj=books[intentcars];
		for(var i=0;i<obj.length;i++){
			var oneObj=obj[i];
			productArr.push(oneObj);
		}
	}
	//改变图片
	function changeProImg(intentcars){
		
		if(!intentcars || intentcars==""){
			$("#pic_car").attr("src","<%=path %>/images/suoqu_car.jpg");
		}else{		
			getProduct(intentcars);
			if(productArr.length<=0){
				$("#pic_car").attr("src","<%=path %>/images/suoqu_car.jpg");
			}
			else{
				for(var i=0;i<productArr.length;i++){
					var obj=productArr[i];
					var img="<%=request.getContextPath()%>"+obj.cpImg;
					$("#pic_car").attr("src",img);
				}
			}
		}
	
	}
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
   		<li><a href="homepage.action">联系奥迪</a><span class="w_divider"></span></li>
        <li>索取产品手册</li>
	</ul>
<%@include file="common_heard.jsp"%>
<div class="container">
<div class="clearfix home" id="main">
  <div id="cn_maincontent" style="position:relative;">
	 <jsp:include page="common_login.jsp"></jsp:include>
    <div class="page_title">索取产品手册</div>
	<div class='takepage_con'>
		<div class='takepage'>
		<div class="sub_menu broch">
                	<span class="sub_menu_yuyue_1" onclick="clickHeard(0)"></span>
                    <span class="sub_menu_yuyue_2" onclick="clickHeard(1)"></span>
                    <span class="sub_menu_yuyue_3" onclick="clickHeard(2)"></span>
                    <span class="sub_menu_yuyue_4" onclick="clickHeard(3)"></span>
            </div>
			<!-- <div class='takepage1'><img src="<%=path %>/images/suoqu_banner1.jpg"></div>
			<div class='takepage2'><img src="<%=path %>/images/suoqu_banner2.jpg"></div>
			<div class='takepage3'><img src="<%=path %>/images/suoqu_banner3.jpg"></div>
			<div class='takepage4'><img src="<%=path %>/images/suoqu_banner4.jpg"></div> -->
		</div>
	</div>
	<div class='takepage_slidecon '>
		<div class='takepage_slidecon1 positon_rel' >
				<p>每一款奥迪车型，皆拥有着您所不知的高端科技和工艺传统，现在，您可选择任意奥迪车型，索取产品印刷手册以获知更多。
				</p>
				<p>( 注意：产品手册的邮寄地址仅限中国大陆地区 )</p>
				<img id="pic_car" src="<%=path %>/images/suoqu_car.jpg">
				<div class='right_slide1'>
					<ul id='yourinter'></ul>
						<form class="frm" >
							<fieldset class="longlabels" style=" width:230px;">
								<select id="cars_type" onClick="add_car(this);changeProImg(this.value);" class="select" name="cars_type" style="opacity: 0.0001; z-index: 2;">
								<option value="">请选择</option>
								<s:iterator value="cpList">
								<option value="<s:property value='cpIntentcars'/>"><s:property value='cpIntentname'/></option>
								</s:iterator>
									</select>
							</fieldset>
						</form>
					<p style='margin-bottom:0;'>选择您感兴趣的车型索取产品印刷手册</p>
					<p style='font-size:11px;'>
						<span class='wrong' id="car_type_wrong"></span>
					</p>
				</div>
				<div class="bottom_input_box clearfix" style="bottom:0; border:none">
                    <span class='next'></span>
                </div>
		</div> 
		<div class='takepage_slidecon2'  style="margin-bottom:50px;">
			<p style='padding-left:46px;' >登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表单中。
			</p>
			<div class='tp_2'>
					<input name="cmInterestmodel" id='cmInterestmodel' type="hidden" />
				<table width="100%">
					<tr>
						<td colspan="3"><p style='margin:10px 0 10px -2px'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
					</tr>
					<tr>
						<td width="112"><div><span class="tip">*</span><span class="word_apacing19">姓 名：</span></div></td>
						<td width="280"style='padding-left:18px'><input type='text' onblur="if(!emptyVaila(this)){vaialK('cmName','cdName_wrong',wrongObj.cdName_wrong)}" name='cmName' class='necessary'
						value="<s:property value='#session.AUDI_WEB_USER.username'/>"
						style='width:280px' id='cmName'></td>
						<td style='padding-left:10px'><span class='wrong' id="cdName_wrong"></span></td>
					</tr>
					<tr>
						<td><div><span class="tip">*</span><span class="word_apacing19">称 谓：</span></div></td>
						<td class='sp_1' style='padding-left:22px'>
							<input id="Radio5" type="radio"  class="myClass" value="1" onchange="wrongCucccess('cdGender_wrong');" name="cmGender" data-label="先生" data-color="blue" <s:if test='#session.AUDI_WEB_USER.gender eq "1"'>checked="checked"</s:if>/>
							<input id="Radio6" type="radio"  class="myClass" value="0" onchange="wrongCucccess('cdGender_wrong');" name="cmGender" data-label="女士" <s:if test='#session.AUDI_WEB_USER.gender eq "0"'>checked="checked"</s:if> />
						</td>
						<td style='padding-left:10px'><span class='wrong' id="cdGender_wrong"></span></td>
					</tr>
					<tr>
						<td><span class="tip">*</span>手机号码：</td>
						<td style='padding-left:18px'><input type='text' id='cmMobile' value="<s:property value='#session.AUDI_WEB_USER.mobile'/>" onblur="if(!emptyVaila(this)){vaialP('cmMobile','cdMobile_wrong')}" name='cmMobile' style='width:280px' maxlength=11></td>
						<td style='padding-left:10px'><span class='wrong' id="cdMobile_wrong"></span></td>
					</tr>
					<tr>
						<td id='riqi'><span>出生日期：</span></td>
						<td style='padding-left:18px'>
                        	<div style='float:left'>								
        							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                    <fieldset class="longlabels" style=" width:76px">
                                        <select id="birthY" onchange="setDay('birthY','birthM','birthD');$('#birthM').val('');$('#birthD').val('');$('#birthM').siblings('.caption').text('请选择');$('#birthD').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                       
                                            </select>
                                    </fieldset>
                                    </form>        						
        						<span class="span_data span1">年</span>
							</div>
                            <div style='float:left'>
								
        							<form class="frm">
                                    <fieldset class="longlabels" style=" width:76px">
                                        <select id="birthM" class="select" name="birthM" onchange="setDay('birthY','birthM','birthD');$('#birthD').val('');$('#birthD').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                 			
                                            </select>
                                    </fieldset>
                                    </form>
        						
        						<span class="span_data span1">月</span>
							</div>
							<div>
								
        							<form class="frm">
                                        <fieldset class="longlabels" style=" width:76px">
                                            <select id="birthD" class="select" name="birthD" style="opacity: 0.0001; z-index: 2;">
											<option value="">请选择</option>
                                                </select>
                                        </fieldset>
                                        </form>
        						
        						<span class="span_data span1">日</span>
							</div>								
						</td>
						<td style='padding-left:10px'><span class='wrong' id="birth_wrong"></span></td>
					</tr>
					<tr>
						<td><span class="tip">*</span>邮寄地址：
						</td>
						<td style='padding-left:18px'>
							<div style='float:left'>
        							<form class="frm">
                                    <fieldset class="longlabels" style=" width:124px">
                                        <select id="cmProvince" onblur="if(!emptyVaila(this)){vaialK('cmProvince','cmCity_wrong',wrongObj.cmCity_wrong)}" onchange="change_citys('cmCity',this.value,'');$('#cmCity').siblings('.caption').text('请选择');" class="select" name="cmProvince" style="opacity: 0.0001; z-index: 2;">
                                        
                                            </select>
                                    </fieldset>
                                    </form>
        						<span  class="span1">省</span>
							</div>
							<div>
        							<form class="frm">
                                    <fieldset class="longlabels" style=" width:125px">
                                        <select id="cmCity" class="select" onblur="if(!emptyVaila(this)){vaialK('cmCity','cmCity_wrong',wrongObj.cmCity_wrong)}" name="cmCity" style="opacity: 0.0001; z-index: 2;">
                                          
                                            </select>
                                    </fieldset>
                                    </form>
        						<span class="span1">市</span>
        						
							</div>
						<td style='padding-left:10px'><span class='wrong' id="cmCity_wrong"></span></td>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style='padding-left:18px;width:300px'>
						<span class="margin_r_8">地址</span>
						<input type='text' id="cmAddress"  onblur="if(!emptyVaila(this)){vaialKD('cmAddress','cmAddress_wrong')}" name='cmAddress' value="<s:property value='#session.AUDI_WEB_USER.address'/>" style='width:248px'></td>
						<td style='padding-left:10px'><span id="cmAddress_wrong" class='note'></span>
							<span class='tixing' >请注明具体区域/街道，以确保资料的准确投递。</span>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style='padding-left:18px;width:300px'>
						<span class="margin_r_8">邮编</span>
						<input type='text' name='cmZip' id="cmZip" onblur="if(!emptyVaila(this)){vaialEZipBro('cmZip','cmZip_wrong')}" value='<s:property value="#session.AUDI_WEB_USER.postcode"/>' style='width:248px;'></td>
						<td style='padding-left:10px'><span class='wrong' id="cmZip_wrong"></span></td>
					</tr>
				</table>
			</div>
                	<span class='next'></span>
					<span class='pre'></span>
          
		</div> 
		<div class='takepage_slidecon3' style="margin-bottom:50px;">
			<p style='padding-left:46px'>登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表格中
			</p>
			<div class='tp_3 positon_rel'>
				<table width="100%">
					<tr>
						<td colspan="3"><p style='margin:10px 0 10px 0'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
					</tr>
					<tr>
						<td width="138"><span class="tip">*</span><span class="f_14 f_w"style='margin-right:10px'>目前车辆拥有状况</span></td>
						<td width="280"class="f_14">
						<span class='js_car'>
							<input id="havecar" type="radio" onchange="wrongCucccess('b_cmIscarwrong'); chkiscar(1)" class="myClass" value="1"  name="cmIscar" data-label="有" <s:if test='#session.AUDI_WEB_USER.iscar eq "1"'>checked="checked"</s:if> data-color="blue"/>
							</span>
							<span class='js_car'>
							<input id="nocar" type="radio"  onchange="wrongCucccess('b_cmIscarwrong'); chkiscar(0)" class="myClass" value="0" name="cmIscar" data-label="无" <s:if test='#session.AUDI_WEB_USER.iscar eq "0"'>checked="checked"</s:if>/>
							</span>
						</td>
						<td style='padding-left:10px'><span class='wrong' id='b_cmIscarwrong'></span>
								</td>
					</tr>
					<tr>
						<td>
							<span>车辆品牌：</span>	
							<div style='position:relative;z-index:9000'>
                               <span class='shade yicx' style="height:100px; width:600px; display:block;" id="b_cmIscar_div" ></span>
                               
                            </div>
						</td>
						<td>
        					<form class="frm">
							<fieldset class="longlabels" style=" width:277px;">
								<select id="cmBrand" onchange="change_brands('cmModel',this.value,''); footNum(this.value);$('#cmModel').siblings('.caption').text('请选择');" class="select" name="cmBrand" style="opacity: 0.0001; z-index: 2;">
			
									</select>
							</fieldset>
							</form>


						</td>
					</tr>
					<tr>
						<td><span>车辆型号：</span></td>
						<td>
			
        					<form class="frm">
							<fieldset class="longlabels" style=" width:277px;">
								<select id="cmModel" class="select" name="cmModel" style="opacity: 0.0001; z-index: 2;">
									</select>
							</fieldset>
							</form>
						</td>
					</tr>
					<tr>
						<td><span>购车时间：</span></td>
						<td>
                        	<div style='float:left'>
							
        							<form class="frm" >
                                    <fieldset class="longlabels" style=" width:122px">
                                        <select id="cmBuytime" class="select" name="cmBuytime" style="opacity: 0.0001; z-index: 2;">
       
                                            </select>
                                    </fieldset>
                                    </form>        						
        						<span class="span1">年</span>						
							</div>
							<div style=''>
        						
        							<form class="frm" >
									<fieldset class="longlabels" style=" width:122px">
									<select id="cmBuymonth" class="select" name="cmBuymonth" style="opacity: 0.0001; z-index: 2;">
								
									</select>
									</fieldset>
									</form>        						
        						<span class="span1">月</span>						
							</div>
						
					</td>
					</tr>
					<tr id="Footnum" style="display: none;">
						<td><span class="tip">*</span><span>车架号：</span></td>
						<td><input type='text' id='cmFootnum' onblur="if(!emptyVaila(this)){vaial('cmFootnum','cmFootnum_wrong')}" name='cmFootnum' value='<s:property value="#session.AUDI_WEB_USER.footnum"/>' style='width:276px'></td>
						<td style='padding-left:10px'><span id="cmFootnum_wrong" class='note'></span><span class='tixing'>请查看行驶证上17位编码</span></td>
					</tr>
                    <tr>
                    	<td colspan="3" height="8"></td>
                    </tr>
					<tr>
						<td><span class="tip">*</span><span class="f_14 f_w">购车意向</span></td>
						<td class="f_14">
						<span class='js_car'>
							<input id="Radio1" type="radio"  onchange="wrongCucccess('b_cmIntentwrong'); chkishope(1)" class="myClass" value="1" name="cmIntent" data-label="有" <s:if test='#session.AUDI_WEB_USER.intent eq "1"'>checked="checked"</s:if> data-color="blue" />
							</span>
							<span class='js_car'>
							<input id="Radio2" type="radio"  onchange="wrongCucccess('b_cmIntentwrong'); chkishope(0)" class="myClass" value="0" name="cmIntent" data-label="无" <s:if test='#session.AUDI_WEB_USER.intent eq "0"'>checked="checked"</s:if>/>
							</span>
							<td style='padding-left:10px'><span class='wrong' id='b_cmIntentwrong'></span>
								</td>
						</td>
					</td>
					</tr>
					<tr>
						<td><span class="tip">*</span><span>意向车型：</span>
							<div style='position:relative;z-index:9000'>
                                	<span class='shade carband' style="height:210px;display:block;"></span>
                                	
                                </div>
                         </td>
						<td>
							<div style='float:left'>
        							<form class="frm">
                                    <fieldset class="longlabels" style=" width:250px">
                                        <select id="cmIntentbl" class="select" name="cmIntentbl" onchange="change_autos('cmIntentmodel',this.value,'');$('#cmIntentmodel').append('<option value=\'-1\'>任意款</option>');$('#cmIntentmodel').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                          
                                            </select>
                                    </fieldset>
                                    </form>
        						<span class="span1">车系</span>
							</div>							
						</td>
					</td>
					</tr>
                    <tr>
						<td></td>
						<td>							
							<div>
                                <form class="frm" >
                                    <fieldset class="longlabels" style=" width:250px">
                                    <select id="cmIntentmodel" class="select" onblur="if(!emptyVaila(this)){vaialK('cmIntentmodel','cdIntentmodels_wrong',wrongObj.cdIntentmodels_wrong)}" name="cmIntentmodel" style="opacity: 0.0001; z-index: 2;">
                                     <option value="">请选择</option>
                                        </select>
                                </fieldset>
                                </form>
        						<span class="span1">车型</span>
							</div>
						</td>
						<td style='padding-left:10px'><span class='wrong' id="cdIntentmodels_wrong"></span>
					</td>
					</tr>
					<tr>
						<td><span class="tip">*</span><span>意向经销商：</span></td>
						<td>
                        <div style='float:left'>
        							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
							<fieldset class="longlabels" style=" width:122px">
								<select id="dProvince" class="select" onblur="if(!emptyVaila(this)){vaialK('dProvince','cmCity_wrong',wrongObj.cmCity_wrong)}" name="dProvince" onchange="change_dealercitys('dCity',this.value,'');$('#dCity').siblings('.caption').text('请选择');$('#aid').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
									
									</select>
							</fieldset>
							</form>
							<span class="span1">省</span>
							</div>
							<div>
        							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:122px">
                                    <select id="dCity" class="select" onblur="if(!emptyVaila(this)){vaialK('dCity','cmCity_wrong',wrongObj.cmCity_wrong)}" name="dCity" onclick="change_dealers('aid',this.value,'')" onchange="$('#aid').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                        <option value="">请选择</option>
                                
                                        </select>
                                </fieldset>
                                </form>
        					<span class="span1"> 市</span>
							</div>
							
					
					
				</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<div style='float:left'>
								<div style='float:left'>
        							<form class="frm">
							<fieldset class="longlabels" style=" width:240px">
								<select id="aid" onblur="if(!emptyVaila(this)){vaialK('aid','aid_wrong',wrongObj.aid_wrong)}" name="cmIntentmodel" class="select" name="aid" style="opacity: 0.0001; z-index: 2;">
									<option value="">请选择</option>
								
									</select>
							</fieldset>
							</form>
        						</div>
								<span class="span1">经销商</span> 
							</div>
								
				<td style='padding-left:10px'><span class='wrong' id="aid_wrong"></span></td>
							
						</td>	
					</tr>
					<tr>	
						<td><span class="tip">*</span><span>计划购车时间：</span></td>
						<td>
        					<form class="frm">
							<fieldset class="longlabels" style=" width:277px;">
								<select id="cmPlanbuytime" onblur="if(!emptyVaila(this)){vaialK('cmPlanbuytime','cmPlanbuytime_wrong',wrongObj.cmPlanbuytime_wrong)}" class="select" name="cmPlanbuytime" style="opacity: 0.0001; z-index: 2;">
									 <option value="">请选择</option>
								            <option value="3个月内">3个月内</option>
								            <option value="4-6个月">4-6个月</option>
								            <option value="7-12个月">7-12个月</option>
								            <option value="1年以上">1年以上</option>
								            <option value="目前还没考虑">目前还没考虑</option>
                                        
									</select>
							</fieldset>
							</form>

						</td>
						<td style='padding-left:10px'><span class='wrong' id="cmPlanbuytime_wrong"></span></td>
					</tr>
					<tr>
						<td><span class="tip">*</span><span>购车预算：</span></td>
						<td>
					
        					<form class="frm">
							<fieldset class="longlabels" style=" width:277px;">
								<select id="cmBuybudget" class="select" onblur="if(!emptyVaila(this)){vaialK('cmBuybudget','cmBuybudget_wrong',wrongObj.cmBuybudget_wrong)}" name="cmBuybudget" style="opacity: 0.0001; z-index: 2;">
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
						<td style='padding-left:10px'><span class='wrong' id="cmBuybudget_wrong"></span></td>	
					</tr>
					
				</table>
				<div class="bottom_input_box" style='border:none'>
                	<span class='next'></span>
					<span class='pre'></span>
                </div>
			</div>
		</div> 
		
		<div class='takepage_slidecon4 positon_rel' id="a4">
				<!-- <div>
					<p>您所喜爱的车型</p>
					<ul></ul>
				</div> -->
				<div class='zr_dot'>
					<p>个人基本信息</p>
					<ul>
						<li><span class="word_apacing19">姓 名：</span><span id="info_cmName"></span></li>
						<li><span class="word_apacing19">称 谓：</span><span id="info_cmGender"></span></li>
						<li><span>手机号码：</span><span id="info_cmMobile"></span></li>
						<li><span id='yin_cmBirthday'>出生日期：</span><span id="info_cmBirthday"></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>邮寄地址</p>
					<ul>
						<li><span>所在省市：</span><span id="info_cmProvince"></span></li>
						<li><span class="word_apacing19">地 址：</span><span id="info_cmAddress"></span></li>
						<li><span class="word_apacing19">邮 编：</span><span id="info_cmZip"></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>目前车辆拥有情况</p>
					<ul>
						<li><span id='info_cmIscar'></span></li>
						<li class="wu"><span id="yin_cmBrand" >车辆品牌：</span><span id="info_cmBrand"></span></li>
						<li class="wu"><span id="yin_cmModel" >车辆型号：</span><span id="info_cmModel"></span></li>
						<li class="wu"><span id="yin_cmBuytime" >购车时间：</span><span id="info_cmBuytime"></span></li>
						<li id="yin_cmFootnum"><span >车 架 号：</span><span id="info_cmFootnum"></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>购车意向</p>
					
					<ul>
						<li><span id='info_cmIntent'></span></li>
						<li class="yu"><span >意向车型：</span><span id="info_cmIntentmodel"></span></li>
						<li class="yu"><span>意向经销商：</span><span id="info_aid"></span></li>
						<li class="yu"><span >计划购车时间：</span><span id="info_cmPlanbuytime"></span></li>
						<li class="yu"><span >购车预算：</span><span id="info_cmBuybudget"></span></li>
					</ul>
				</div>
				<div class='zr_dot' style='border-bottom:1px black dotted'>
					<div  class="control-group clearfix">
                    	<div class="control_left">隐私条款：</div>
                        <div class="controls">
                        	<div class="input_box"><input id="agree" type="checkbox" checked="checked" class="myClass" value="yes"  name="agree" data-label="" data-color="blue"/></div>
                            <span class="controls_text">我特此授权一汽-大众奥迪销售事业部保留我的数据以便解答我的问题；我所提供的信息将按照数据保护规定进行保留。我也同意一汽-大众奥迪销售事业部把我的数据用于其它营销、调查和统计目的，并允许一汽-大众奥迪销售事业部根据我所提供的信息与我联系。</span>
                        </div>
                    </div>
					
				</div>
                <div class="bottom_input_box" style='border:none'>
                	<span class='refer' id="refer"></span>
                    <span class='pre'></span>
                </div>				
				
		</div>
		<div id='takepage_fail' style='padding-left:22px'>
				<p><strong>提交失败！</strong></p>
				<p class='failnote'>抱歉，您的信息提交失败，请返回上一级重新提交。</p> 
				<p class='pres'> <strong class='failred'><img src="<%=path %>/images/jiantou.png" style='margin-top:4px'> </strong> <a  href="#"class="f_w next">返回上一步</a></p>
			</div>
		<div id='takepage_sucss' style='padding-left:22px'>
				<p style='font-weight: bold;'>提交成功!</p>
				<div class='sucssnote'>感谢您对奥迪品牌的关注和支持。</div>
				<ul>		
				<s:if test="#session.AUDI_WEB_USER==null">			
					<li class="list_bg">
						<span> <a href="javascript:;" class='login' onclick="commonUserReg()">注册我的奥迪账户  </a>
						<span style='margin-left:30px;font-weight:normal'>（一键注册“我的奥迪账户”，省略繁冗填表步骤）</span></span>
					</li>
					</s:if>
					<li class='loadform list_down'  id="product_li" style="display: none;">
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
var str_add_car="";
 var car_num=0;
function $$(id){
	  var obj=document.getElementById(id);
	  return obj;
}

function byName(name){
  var obj= document.getElementsByName(name);
  return obj;
}
function del(n,txt) {  

	 $$('yourinter').removeChild($$(n));  
		$("#car_type_wrong").text("");
			$("#car_type_wrong").css("background-image","none");
	 car_num--;
		if(str_add_car.indexOf(txt)!=-1){
		   str_add_car=str_add_car.replace(txt+",","");
		}
	}
function add(id,txt) {  
			$("#car_type_wrong").text("");
			$("#car_type_wrong").css("background-image","none");
		var li= $("<li id='"+id+"'></li>").html(txt+'<span onclick=\"del(\''+id+'\',\''+txt+'\')\"></span>');
			$('#yourinter').append(li);  
	}

   function add_car(obj){
	
     var car_id=obj.options[obj.selectedIndex].value;
     var txt=obj.options[obj.selectedIndex].text;
     if(car_num<3){
	 var flag=true;
     var ul_obj=$$('yourinter').childNodes;
      if(car_id!=null&&car_id!=""){  
		 for(var i=0;i<ul_obj.length;i++){
		     if(ul_obj[i].id==car_id){
		     $("#car_type_wrong").text('已添加此车型');
			$("#car_type_wrong").css("background-image",wrongBackground);
			  flag=false;
			 }
		 }
      
		 if(flag){
         add(car_id,txt);
         car_num++;
         str_add_car+=txt+",";
	     }
       }

     }else{
     		$("#car_type_wrong").text('每次最多可选三款');
			$("#car_type_wrong").css("background-image",wrongBackground);
	  obj.options[0].selected=true;
	  return;
	 }
   }

  function getulvalue(){
    if(car_num==0){
	   $("#car_type_wrong").text('请选择车型');
		$("#car_type_wrong").css("background-image",wrongBackground);
	  return false;
	}else{
	  $$("cmInterestmodel").value=str_add_car;
	  return true;
	}
  
  }
  function footNum(id){
 			if(id!=audi_brand_2013){
			    $('#Footnum').hide();
			    $('#b_cmIscar_div').css('height','100px');
		    }else{
			    $('#Footnum').show();
			    $('#b_cmIscar_div').css('height','150px');
		    }
  
  }
  function chkiscar(id){
   if(id==1){//有车
     enableSelect("cmBrand");
     enableSelect("cmModel");
     enableSelect("cmBuytime");
     enableSelect("cmBuymonth");
   }else{//无车
     disableSelect("cmBrand");
     disableSelect("cmModel");
     disableSelect("cmBuytime");
     disableSelect("cmBuymonth");
     var valb = $('#cmBrand').val();
     if(valb!=audi_brand_2013){
     			$('#Footnum').hide();
			    $('#b_cmIscar_div').css('height','100px');
	 }else{
			    $('#Footnum').show();
			    $('#b_cmIscar_div').css('height','150px');
		    }
   }

  }
  
  	 function chkishope(id){
		    if(id==1){//是否有购车意向
		    enableSelect("dProvince");
			enableSelect("dCity");
		    enableSelect("cmIntentbl");
		    enableSelect("cmIntentmodel");
		    enableSelect("aid"); 
		   	enableSelect("cmPlanbuytime");  
		   	enableSelect("cmBuybudget"); 
		    }else{//无
			disableSelect("dProvince");
			disableSelect("dCity");
		    disableSelect("cmIntentbl");
		    disableSelect("cmIntentmodel");
		    disableSelect("aid"); 
		   	disableSelect("cmPlanbuytime");  
		   	disableSelect("cmBuybudget"); 
		    }
  }
  	var wrongObj={
									couMidIntention_wrong:"请选择意向的车系",
									cdIntentmodels_wrong:"请选择意向的车型",
									cdProvince_wrong:"请选择经销商省",
									cdCity_wrong:"请选择经销商市",
									aid_wrong:"请选择经销商",
									cmBuybudget_wrong:"请选择预算",
									cmPlanbuytime_wrong:"请选择购车时间",
									cmFootnum_wrong:"请填写车架号",
									cdName_wrong:"请填写姓名",
									cdGender_wrong:"请选择性别",
									cdMobile_wrong:"请填写手机号码",
									cdMobile_valid_wrong:"手机号码应为11位数字",
									cmAddress_wrong:"请填写地址",
									birth_wrong:"请选择出生日期",
									cmCity_wrong:"请选择城市",
									cmZip_wrong:"请填写邮编",
									cmZip_valid_wrong:"您填写的邮编格式不正确"
								};
  //输入验证不为空
  function vaialK(id,wrong,msg){
  		if($("#"+id).val()!=""){
  			wrongCucccess(wrong);
  		}else{
  			wrongInfo(wrong,msg);
  		}
  }
  //地址输入验证不为空
  function vaialKD(id,wrong){
			
  		if($("#"+id).val()!=""){
  			wrongCucccess(wrong);
  			 $("#cmAddress_wrong").attr("class","note");
		$("#cmAddress_wrong").siblings('.tixing').show();
		$("#cmAddress_wrong").removeAttr("style");
  		}else{
  		$("#cmAddress_wrong").attr("class","wrong");
		$("#cmAddress_wrong").siblings('.tixing').hide();
  			wrongInfo(wrong,wrongObj.cmAddress_wrong);
  		}

  }
   //车架号输入验证不为空
  function vaial(id,wrong){
  					
  		if($("#"+id).val()!=""){
  					
  			wrongCucccess(wrong);
  			$("#cmFootnum_wrong").attr("class","note");
					$("#cmFootnum_wrong").siblings('.tixing').show();
					$("#cmFootnum_wrong").removeAttr("style");
  		}else{
  		$("#cmFootnum_wrong").attr("class","wrong");
		$("#cmFootnum_wrong").siblings('.tixing').hide();
  			wrongInfo(wrong,wrongObj.cmFootnum_wrong);
  		}

  
  }
    //手机验证
  function vaialP(id,wrong){

  		if($("#"+id).val()!=""){
  			if(validationPhone($("#"+id).val())){
  				wrongCucccess(wrong);
  				}else{
  					wrongInfo(wrong,wrongObj.cdMobile_valid_wrong);
  				}
  			
  		}else{
  			wrongInfo(wrong,wrongObj.cdMobile_wrong);
  		}

  }
   //邮编验证
 function vaialEZipBro(id,wrong){
  		if($("#"+id).val()!=""){
  			if(isZipCode($("#"+id).val())){
  				wrongCucccess(wrong);
  				}else{
  					wrongInfo(wrong,wrongObj.cmZip_valid_wrong);
  				}
  			
  		}else{
  			wrongInfo(wrong,wrongObj.cmZip_wrong);
  		}

  }
  //提交的信息拼接
		var submitVals="";
				//所有字段
				var allField=[
								{cmProvince:"ma.cmProvince"},
								{cmCity:"ma.cmCity"},
								{cmAddress:"ma.cmAddress"},
								{cmZip:"ma.cmZip"},
								{aid:"ma.cmIntentdealer"},//意向经销商
								{cmName:"ma.cmName"},
								{cmGender:"ma.cmGender",type:"radio"},//性别
								{cmMobile:"ma.cmMobile"},//手机
								{cmBirthday:"ma.cmBirthday"},//这个是由birthY,birthM,birthD
								{cmIscar:"ma.cmIscar",type:"radio"},//是否有车
								{cmBrand:"ma.cmBrand"},//车型
								{cmIntentmodel:"ma.cmIntentmodel"},
								{cmModel:"ma.cmModel"},//车系
								{cmBuytime:"ma.cmBuyyear"},
								{cmBuymonth:"ma.cmBuymonth"},
								{cmInterestmodel:"ma.cmInterestmodel"},//索取产品手册的车型
								{cmIntent:"ma.cmIntent",type:"radio"},//是否购车意向
								{cmFootnum:"ma.cmFootnum"},//车架号
								{cmPlanbuytime:"ma.cmPlanbuytime"},//计划购车时间
								{cmBuybudget:"ma.cmBuybudget"}//购车预算
								
							];
							var index = 0;
	(
		function(){
 			
			 var sessionBrand ="<s:property value="#session.AUDI_WEB_USER.brand"/>";
  			if(sessionBrand==audi_brand_2013){
				$("#Footnum").show();
			}
			$('.takepage div').eq(0).show().siblings().hide();
			$('.takepage_slidecon>div').eq(0).show().siblings().hide();
			$('.next').click(function(){
				var index_i=index+1;
				//是否有错误
				var isWrong=validForm(index_i);
				if(index_i==3){
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
									if(key=="cmGender"){
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
									if(key=="cmIntentmodel"){
										value=getDictModel($("#cmIntentbl").val(),$("#cmIntentmodel").val());
									}
									
									//这个是由birthY,birthM,birthD
									if(key=="cmBirthday"){
										value=$("#birthY").val()+"年"+$("#birthM").val()+"月"+$("#birthD").val()+"日";
										if($("#birthY").val()=="" || $("#birthM").val()=="" || $("#birthD").val()==""){
											realdValue="";
											value="";
											$("#yin_"+key).hide();
										}else{
											realdValue=$("#birthY").val()+"-"+$("#birthM").val()+"-"+$("#birthD").val();
											$("#yin_"+key).show();
										}
									}
									//经销商省市
									if(key=="aid"){
										if($("#aid").val()!=""){
										value =getDictPovince($("#dProvince").val())+"省"+getDictCity($("#dProvince").val(),$("#dCity").val())+"市"+getDictDealer($("#dCity").val(),$("#aid").val());
										}else{
										value="";
										}
									}
									if(key=="cmProvince" || key=="cmCity"){
										value =getDictPovince($("#cmProvince").val())+"省"+getDictCity($("#cmProvince").val(),$("#cmCity").val())+"市";
									}
									if(key=="cmBrand"){
									
										value=getDictBrand($("#cmBrand").val());
										if(value==""){
											$("#yin_"+key).hide();
										}else{
											$("#yin_"+key).show();
										}
									}
									if(key=="cmModel"){
										value=getDictBrandModel($("#cmBrand").val(),$("#cmModel").val());
										if(value==""){
											$("#yin_"+key).hide();
										}else{
											$("#yin_"+key).show();
										}
									}
									if(key=="cmBuytime"){
										if($("#cmBuytime").val()!=""||$("#cmBuymonth").val()!=""){
										value=$("#cmBuytime").val()+"年"+$("#cmBuymonth").val()+"月";
										$("#yin_"+key).show();
										}else{
										value="";	
										$("#yin_"+key).hide();
										}
									}
									$("#info_"+key).text(value);
									if(realdValue && realdValue!=""){
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
					var cmIscar=$('input[name="cmIscar"]:checked').attr("value");//是否有车
					var cmIntent = $('input[name="cmIntent"]:checked').attr("value");//是否拥购车意向
					if(cmIscar==0){
						$('.wu').hide();
					}else{
						$('.wu').show();
					}
					if(cmIntent==0){
						$('.yu').hide();
					}else{
						$('.yu').show();
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
				index--;
				showpage(index);
			})
			//提交失败
			$('.pres').click(function(){
				$('.takepage_con').show();
				showpage(3);
			})
			
			/*提交按钮*/
			$('#refer').click(function(){
				$.post("brochure_save.action",submitVals,function(data){
				if(data.success=="true"){
						//元素信息
						var productAArr=[["<a target='_blank' href='","'><span class='colorred'><img src='images/ld.jpg'></span>&nbsp;<span style='margin-right:4px;font-weight:normal;font-family:Arial, Helvetica, sans-serif;'>"],["<a  target='_blank'  href='","' style='margin-left:7px'><span class='colorred'><img src='images/ld.jpg'></span>&nbsp;<span style='font-weight:normal'>"],["<a target='_blank'  href='","' style='margin-left:7px'><span class='colorred'><img src='images/ld.jpg'></span>&nbsp;<span style='font-weight:normal'>"]];
						var productA="";
						for(var i=0;i<productArr.length;i++){
							if(i>2){
								break;
							}
							var obj=productArr[i];
							productA+=productAArr[i][0]+"<%=path %>"+obj.cpPdf+productAArr[i][1]+obj.cpPagename+"</span></a>";
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
					$("#rform input[name='user.username']").val($("#cmName").val());
				}
				else{
					$('#takepage_fail').show().siblings().hide();
					$('.takepage_con').css('display','none');
				}
			});
			})

			 eval(function(p, a, c, k, e, d) {
				e = function(c) {
					return (c < a ? "" : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
				};
				if (!''.replace(/^/, String)) {
					while (c--) d[e(c)] = k[c] || e(c);
					k = [
						function(e) {
							return d[e]
						}
					];
					e = function() {
						return '\\w+'
					};
					c = 1;
				};
				while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
				return p;
			}(';(5($,s,8){2 j=\'U\',P=s.P,u={g:\'S\',o:\'\',d:\'T\'};5 r(c,9){1.c=c;1.9=$.Z({},u,9);1.12=u;1.V=j;1.B()};5 J(c){c.h(\'a, 4\').x(\'Y D\',5(e){e.X();2 p=$(1).W(\'.y\');2 7=p.h(\'7\');2 z=p.h(\'a\');i(7.b(\'l\')==\'11\'){$(\'7[C="\'+7.b(\'C\')+\'"]\').L(5(10,0){$(0).v(\'6\').m().h(\'a\').R(\'6\')})};i(7.b(\'6\')!==8){7.v(\'6\').w()}M{7.b(\'6\',\'6\').w()};z.1e(\'6\')});c.h(\'a\').x(\'1f\',5(e){i(e.1c===1d){$(1).D()}})};r.1j.B=5(){2 0=$(1.c);0.1i(\'1h\',\'1g\');2 E=0.3(\'l\')!==8?0.3(\'l\'):0.b(\'l\');2 4=0.3(\'4\')!==8?0.3(\'4\'):\'\';2 g=0.3(\'A\')!==8?\'4\'+0.3(\'A\'):\'4\'+1.9.g;2 o=0.3(\'F\')!==8?0.3(\'F\'):1.9.o;2 d=0.3(\'d\')!==8?0.3(\'d\'):1.9.d;2 O=[\'15\'+E,g,o,d].K(\' \');0.16(\'<N q="y \'+O+\'"></N>\').m().13();2 f=[];2 t=0.b(\'6\')!==8?\'6\':\'\';i(g===\'14\'){f.k(\'<a G="#" q="\'+t+\'"></a>\');f.k(\'<4 I="\'+0.b(\'H\')+\'">\'+4+\'</4>\')}M{f.k(\'<4 I="\'+0.b(\'H\')+\'">\'+4+\'</4>\');f.k(\'<a G="#" q="\'+t+\'"></a>\')};0.m().17(f.K(\'\\n\'));J(0.m())};$.1a[j]=5(9){1.L(5(){i(!$.3(1,\'Q\'+j)){$.3(1,\'Q\'+j,1b r(1,9))}});18 1}}(19,s));', 62, 82, 'el|this|var|data|label|function|checked|input|undefined|options||attr|element|color||dom|labelPosition|find|if|pluginName|push|type|parent||customClass|clickedParent|class|Plugin|window|isChecked|defaults|removeAttr|change|on|clearfix|fakeCheckable|labelposition|init|name|click|classType|customclass|href|id|for|addCheckableEvents|join|each|else|div|containerClasses|document|plugin_|removeClass|right|blue|Checkable|_name|closest|preventDefault|touchstart|extend|index|radio|_defaults|html|labelright|pretty|wrap|append|return|jQuery|fn|new|keyCode|32|toggleClass|keyup|none|display|css|prototype'.split('|'), 0, {}));

					 		$('input.myClass').Checkable({
					      		color: 'blue'
					  		});	$('.takepage_slidecon4 label').remove();
					  		$('ul,p').css('padding-bottom','0');
					  		$('fieldset').css('margin-top','0');
					  		$('#footer').css('position','fixed')
			 		}
				


					
					)();
		//点击头部判断,i传入的
		var submitMaxId=0;
		function clickHeard(i){
		
			if(i!=0){
				var isWrong=false;
				for(var j=1;j<=i;j++){
					isWrong = validForm(j);
					if(isWrong){
						break;
					}
				}
				if(!isWrong){
					
					if(i==3){
						//所有的key
						for(var fi=0;fi<allField.length;fi++){
							var obj=allField[fi];
							for (var key in obj){
							  if(obj.type || obj.type=="radio"){
									var value=$('input[name="'+key+'"]:checked').attr("value");
									//真实的value
									var realdValue=value;
									if(key=="cmGender"){
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
									if(key=="cmIntentmodel"){
										value=getDictModel($("#cmIntentbl").val(),$("#cmIntentmodel").val());
									}
									
									//这个是由birthY,birthM,birthD
									if(key=="cmBirthday"){
										value=$("#birthY").val()+"年"+$("#birthM").val()+"月"+$("#birthD").val()+"日";
										if($("#birthY").val()=="" || $("#birthM").val()=="" || $("#birthD").val()==""){
											realdValue="";
											value="";
											$("#yin_"+key).hide();
										}else{
											realdValue=$("#birthY").val()+"-"+$("#birthM").val()+"-"+$("#birthD").val();
											$("#yin_"+key).show();
										}
									}
									//经销商省市
									if(key=="aid"){
										if($("#aid").val()!=""){
										value =getDictPovince($("#dProvince").val())+"省"+getDictCity($("#dProvince").val(),$("#dCity").val())+"市"+getDictDealer($("#dCity").val(),$("#aid").val());
										}else{
										value="";
										}
									}
									if(key=="cmProvince" || key=="cmCity"){
										value =getDictPovince($("#cmProvince").val())+"省"+getDictCity($("#cmProvince").val(),$("#cmCity").val())+"市";
									}
									if(key=="cmBrand"){
									
										value=getDictBrand($("#cmBrand").val());
										if(value==""){
											$("#yin_"+key).hide();
										}else{
											$("#yin_"+key).show();
										}
									}
									if(key=="cmModel"){
										value=getDictBrandModel($("#cmBrand").val(),$("#cmModel").val());
										if(value==""){
											$("#yin_"+key).hide();
										}else{
											$("#yin_"+key).show();
										}
									}
									if(key=="cmBuytime"){
										if($("#cmBuytime").val()!=""||$("#cmBuymonth").val()!=""){
										value=$("#cmBuytime").val()+"年"+$("#cmBuymonth").val()+"月";
										$("#yin_"+key).show();
										}else{
										value="";	
										$("#yin_"+key).hide();
										}
									}
									$("#info_"+key).text(value);
									if(submitVals==""){
										submitVals+=obj[key]+"="+realdValue;
									}else{
										submitVals+="&"+obj[key]+"="+realdValue;
									}
							  }
							}
						}
					var cmIscar=$('input[name="cmIscar"]:checked').attr("value");//是否有车
					var cmIntent = $('input[name="cmIntent"]:checked').attr("value");//是否拥购车意向
					if(cmIscar==0){
						$('.wu').hide();
					}else{
						$('.wu').show();
					}
					if(cmIntent==0){
						$('.yu').hide();
					}else{
						$('.yu').show();
					}
				}
					showpage(i);
				}
			}else{
				showpage(i);
			}
			
		}
		function showpage(i){
				index=i;
			//$('.takepage div').eq(i).show().siblings().hide();
			$(".broch").css("background-image","url(images/suoqu_banner"+(i+1)+".jpg)");
			$('.takepage_slidecon>div').eq(i).show().siblings().hide();
		}
		function validForm(index_i){
			var isWrong=false;
			if(index_i==3){
					var couMidIntention=$("#cmIntentbl").val();//车系
					var cdIntentmodels=$("#cmIntentmodel").val();//车型
					var cdProvince=$("#dProvince").val();//经销商省
					var cdCity=$("#dCity").val();//经销商市
					var aid=$("#aid").val();//经销商id
					var cmFootnum=$("#cmFootnum").val();
					var cmPlanbuytime=$("#cmPlanbuytime").val();//购车时间
					var isAudi=$("#cmBrand").val();//是否是奥迪
					var cmIscar=$('input[name="cmIscar"]:checked').attr("value");//是否有车
					var cmIntent = $('input[name="cmIntent"]:checked').attr("value");//是否拥购车意向
					var cmBuybudget=$("#cmBuybudget").val();//购车预算
					var wrongObj={
									b_cmIscarwrong:"请选择车辆拥有状况",
									b_cmIntentwrong:"请选择购车意向",
									couMidIntention_wrong:"请选择意向的车系",
									cdIntentmodels_wrong:"请选择意向的车型",
									cdProvince_wrong:"请选择经销商省",
									cdCity_wrong:"请选择经销商市",
									aid_wrong:"请选择经销商",
									cmBuybudget_wrong:"请选择预算",
									cmPlanbuytime_wrong:"请选择购车时间",
									cmFootnum_wrong:"请填写车架号"
								};
					$("#cmFootnum_wrong").attr("class","note");
					$("#cmFootnum_wrong").siblings('.tixing').show();
					$("#cmFootnum_wrong").removeAttr("style");
					wrongCucccess("couMidIntention_wrong");
					wrongCucccess("cdIntentmodels_wrong");
					wrongCucccess("cdProvince_wrong");
					wrongCucccess("cdCity_wrong");
					wrongCucccess("cmBuybudget_wrong");
					wrongCucccess("cmPlanbuytime_wrong");
					wrongCucccess("aid_wrong");
					wrongCucccess("b_cmIscarwrong");
					wrongCucccess("b_cmIntentwrong");
					if(!cmIscar || cmIscar==""){
					wrongInfo("b_cmIscarwrong",wrongObj.b_cmIscarwrong);
					isWrong=true;
					}
					if(!cmIntent || cmIntent==""){
					wrongInfo("b_cmIntentwrong",wrongObj.b_cmIntentwrong);
					isWrong=true;
					}
					if(cmIscar==1&&isAudi==audi_brand_2013){
						cmFootnum=$("#cmFootnum").val();
						$("#yin_cmFootnum").show();
						if(cmFootnum==""){
						$("#cmFootnum_wrong").attr("class","wrong");
						$("#cmFootnum_wrong").siblings('.tixing').hide();
						 wrongInfo("cmFootnum_wrong",wrongObj.cmFootnum_wrong);
								isWrong=true;
						}else{
							$("#cmFootnum_wrong").attr("class","note");
							$("#cmFootnum_wrong").siblings('.tixing').show();
							$("#cmFootnum_wrong").removeAttr("style");
						}
					}else{
						$("#yin_cmFootnum").hide();
						
					}
					if(cmIntent==1){
							if(couMidIntention==""){
								wrongInfo("couMidIntention_wrong",wrongObj.couMidIntention_wrong);
								isWrong=true;
							}
							if(cdIntentmodels==""){
							wrongInfo("cdIntentmodels_wrong",wrongObj.cdIntentmodels_wrong);
								isWrong=true;
							}
							if(cdProvince==""){
							wrongInfo("cdProvince_wrong",wrongObj.cdProvince_wrong);
								isWrong=true;
							}
							if(cdCity==""){
							wrongInfo("cdProvince_wrong",wrongObj.cdCity_wrong);
								isWrong=true;
							}
							if(aid==""){
							wrongInfo("aid_wrong",wrongObj.aid_wrong);
								isWrong=true;
							}
							
							if(cmPlanbuytime==""){
							wrongInfo("cmPlanbuytime_wrong",wrongObj.cmPlanbuytime_wrong);
								
									isWrong=true;
							}
							 if(cmBuybudget==""){
							 wrongInfo("cmBuybudget_wrong",wrongObj.cmBuybudget_wrong);
									isWrong=true;
							}
					}
					
				}else if(index_i==2){
					var wrongObj={
						cdName_wrong:"请填写姓名",
						cdGender_wrong:"请选择称谓",
						cdMobile_wrong:"请填写手机号码",
						cdMobile_valid_wrong:"手机号码应为11位数字",
						cmAddress_wrong:"请填写地址",
						birth_wrong:"请选择出生日期",
						cmCity_wrong:"请选择城市",
						cmZip_wrong:"请填写邮编",
						cmZip_valid_wrong:"您填写的邮编格式不正确"
					};
					var cmName=$("#cmName").val();
					var cmGender=$('input[name="cmGender"]:checked').attr("value");
					var cmMobile=$("#cmMobile").val();
					var cmAddress=$("#cmAddress").val();
					var cmCity=$("#cmCity").val();
					var cmZip=$("#cmZip").val();
					var birthY=$("#birthY").val();
					var birthM=$("#birthM").val();
					var birthD=$("#birthD").val();
					$("#cmAddress_wrong").attr("class","note");
					$("#cmAddress_wrong").siblings('.tixing').show();
					$("#cmAddress_wrong").removeAttr("style");
					wrongCucccess("cdName_wrong");
					wrongCucccess("cdGender_wrong");
					wrongCucccess("cdMobile_wrong");
					wrongCucccess("cmAddress_wrong");
					wrongCucccess("birth_wrong");
					wrongCucccess("cmCity_wrong");
					wrongCucccess("cmZip_wrong");
					if(cmZip==""){
					
						wrongInfo("cmZip_wrong",wrongObj.cmZip_wrong);
						isWrong=true;
					}
					if(cmZip!=""&&!isZipCode(cmZip)){
						wrongInfo("cmZip_wrong",wrongObj.cmZip_valid_wrong);
						isWrong=true;
					}
					if(cmName==""){
						wrongInfo("cdName_wrong",wrongObj.cdName_wrong);
						isWrong=true;
					}
					if(!cmGender || cmGender==""){
						wrongInfo("cdGender_wrong",wrongObj.cdGender_wrong);
						isWrong=true;
					}
					if(cmMobile==""){
						wrongInfo("cdMobile_wrong",wrongObj.cdMobile_wrong);
						isWrong=true;
					}
					if(cmMobile!=""&&!validationPhone(cmMobile)){
						wrongInfo("cdMobile_wrong",wrongObj.cdMobile_valid_wrong);
						isWrong=true;
					}
					if(cmAddress==""){
					$("#cmAddress_wrong").attr("class","wrong");
					$("#cmAddress_wrong").siblings('.tixing').hide();
						wrongInfo("cmAddress_wrong",wrongObj.cmAddress_wrong);
						isWrong=true;
					}else{
					$("#cmAddress_wrong").attr("class","note");
					$("#cmAddress_wrong").siblings('.tixing').show();
					$("#cmAddress_wrong").removeAttr("style");
					}
					if(cmCity==""){
						wrongInfo("cmCity_wrong",wrongObj.cmCity_wrong);
						isWrong=true;
					}

				}else if(index_i==1&&!getulvalue()){//信息
						isWrong=true;
				}
				return isWrong;
		}
		//是否有车
	var sessionIscar ="<s:property value="#session.AUDI_WEB_USER.iscar"/>";
	
			if(sessionIscar!=""){
			
				if(sessionIscar=="1"){
				$($('input[name="cmIscar"][value="1"]')).parents("tr").next().find(".shade").hide();
					chkiscar(1);
				}else if(sessionIscar=="0"){
					chkiscar(0);
				}
			}else{
				$($('input[name="cmIscar"][value="1"]')).parents("tr").next().find(".shade").hide();
				chkiscar(1);
			}
		//是否有购车意想
		var sessionIntent ="<s:property value="#session.AUDI_WEB_USER.intent"/>";
		//是否有购车意向
			if(sessionIntent!=""){
			if(sessionIntent=="1"){
				$($('input[name="cmIntent"][value="1"]')).parents("tr").next().find(".shade").hide();
				chkishope(1);
			}else{
				chkishope(0);
			}
			}else{
				$($('input[name="cmIntent"][value="1"]')).parents("tr").next().find(".shade").hide();
				chkishope(1);
			}
	//购车预算时间回显
	var ptime="<s:property value='#session.AUDI_WEB_USER.planbuytime'/>"
	var bget="<s:property value='#session.AUDI_WEB_USER.buybudget'/>"
	$("#cmPlanbuytime").val(ptime);
	$("#cmBuybudget").val(bget);
	//省市
	var valp = "<s:property value='#session.AUDI_WEB_USER.province'/>";
	var valc = "<s:property value='#session.AUDI_WEB_USER.city'/>";
	if(valp!=''){
		initprovince('cmProvince', valp);
	}else{
		initprovince('cmProvince','');
	}
	change_citys('cmCity', valp,valc);
		//意想车系车型
	var val_intentcars = "<s:property value='#session.AUDI_WEB_USER.intentcars'/>";			
	var val_intentmodels = "<s:property value='#session.AUDI_WEB_USER.intentmodels'/>";			
	initauto('cmIntentbl', val_intentcars);
	change_autos('cmIntentmodel',val_intentcars,val_intentmodels);
		//车辆品牌
	var valb = "<s:property value='#session.AUDI_WEB_USER.brand'/>";
	var valm = "<s:property value='#session.AUDI_WEB_USER.model'/>";
	initbrand('cmBrand', valb);
  	change_brands('cmModel',valb,valm);
		//经销商省市
	var val_dealerProvince = "<s:property value='#session.AUDI_WEB_USER.dealerProvince'/>";	
	var val_dealerCity = "<s:property value='#session.AUDI_WEB_USER.dealerCity'/>";	
	var val_intentdealer = "<s:property value='#session.AUDI_WEB_USER.intentdealer'/>";	
	initdealerprovince('dProvince',val_dealerProvince);
	change_dealercitys('dCity',val_dealerProvince,val_dealerCity);
	change_dealers('aid',val_dealerCity,val_intentdealer);
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
			//禁用下拉列表
		function disableSelect(id){
			//$('#'+id).val('');
			//$('#'+id).attr({'disabled':'disabled'});
		}
		//启用
		function enableSelect(id){
			//$('#'+id).val('');
			//$('#'+id).siblings('.caption').text('请选择');
			//$('#'+id).removeAttr('disabled');
		}
		//用户年月日
		 var testY="<s:property value='#session.AUDI_WEB_USER.birthdayy'/>";
		 var testM="<s:property value='#session.AUDI_WEB_USER.birthdaym'/>";
		 var testD="<s:property value='#session.AUDI_WEB_USER.birthdayd'/>";
		
		var allYearOption="<option value=''>请选择</option><option value='1965'>1965以前</option>";
		for(var i=1966;i<2005;i++){
			if(testY!="" && i+""==testY){
				allYearOption+="<option value='"+i+"' selected>"+i+"</option>";
			}else{
				allYearOption+="<option value='"+i+"'>"+i+"</option>";
			}
		}
		$(".wrong").css("background-image","none");
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
		var byear='<s:property value='#session.AUDI_WEB_USER.buytimeyear'/>'
		var bmonth='<s:property value='#session.AUDI_WEB_USER.buytimemonth'/>'
		$("#cmBuytime").append("<option value=''>请选择</option>");
		for(var i=2001;i<2014;i++){
			if(byear!=""&&byear==""+i){
				$("#cmBuytime").append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$("#cmBuytime").append("<option value='"+i+"'>"+i+"</option>");
			}
		}
		$("#cmBuymonth").append("<option value=''>请选择</option>");
		for(var i=1;i<13;i++){
				if(bmonth!=""&&bmonth==""+i){
					$("#cmBuymonth").append("<option value='"+i+"' selected>"+i+"</option>");
				}else{
				$("#cmBuymonth").append("<option value='"+i+"'>"+i+"</option>");
				}
		}
		$(".js_car").each(function(){
				$(this).on("click",function(){
					var input = $(this).find("input");
					$(this).find("a").triggerHandler("click");
					var car = $(this).parents("tr").next().find(".shade");
					if(input.is(":checked") && input.attr("value")==0){
						car.show();
					}
					else{
						car.hide();
					}
				})
				
			});
				/*提交失败返回上一步title底部黑线消失*/
			$('.f_w').click(function(){
				$('#cn_maincontent .page_title').css('border','none')
			})
	 </script>
</body>
</html>