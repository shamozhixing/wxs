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
	<title>索取《奥迪杂志》&gt联系奥迪&gt欢迎来到一汽-大众奥迪</title>
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
	
	
	
</head>
<body class="DE de" data-country="DE" data-lang="de">
  <%@include file="common_navigation.jsp"%>
	
   	<ul class="horizontalNav left breadcrumbs">
   	    <li>
        	<a href="/content/cn/brand/zh.html">首页</a>
        	<span class="w_divider"></span>
        </li>
   		<li><a href="homepage.action">联系奥迪</a><span class="w_divider"></span></li>
        <li>索取《奥迪杂志》</li>
	</ul>
	<%@include file="common_heard.jsp"%>

<div class="container">
    <div class="clearfix home" id="main">
      <div id="cn_maincontent" style="position:relative;">
         <jsp:include page="common_login.jsp"></jsp:include>
        <div class="page_title">索取《奥迪杂志》</div>
        <div class='takepage_con'>
        	<div class='takepage'>
            	<div class="sub_menu magaz">
                	<span class="sub_menu_commu_1" onclick="clickHeard(0)"></span>
                    <span class="sub_menu_commu_2" onclick="clickHeard(1)"></span>
                    <span class="sub_menu_commu_3" onclick="clickHeard(2)"></span>                  
                </div>
             </div>
        </div>
        <div class='takepage_slidecon'>	            
        	<div class='takepage_slidecon2' style="margin-bottom:50px;">
                <p style='padding-left:46px;' >登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表单中。</p>
                <div class='tp_3 positon_rel'>
                    <table width="100%">
                        <tr>
                            <td colspan="3"><p style='margin:10px 0 10px 0'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
                        </tr>
                        <tr>
                            <td width="138">
                                <div><span class="f_14 f_w">个人基本信息</span></div></td>
                            <td width="280"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div><span class="tip">*</span><span class="word_apacing19">姓 名：</span></div></td>
                            <td width="280"><input type='text' name='cmName' class='necessary' style='width:100%' id='cmName' value="<s:property value='#session.AUDI_WEB_USER.username'/>" onblur="vaialK('cmName','cmName_wrong',wrongObj.cmName_wrong)"></td>
                            <td style='padding-left:10px'><span class='wrong' id='cmName_wrong'></span></td>
                        </tr>
                        <tr>
                            <td>
                                <div><span class="tip">*</span><span class="word_apacing19">称 谓：</span></div>							
                            </td>
                            <td class='sp_1'>
                                <input id="Radio5" type="radio"  class="myClass" value="1" onchange="wrongCucccess('cmGender_wrong');" <s:if test='#session.AUDI_WEB_USER.gender eq "1"'>checked="checked"</s:if> name="cmGender" data-label="先生" data-color="blue" />
                                <input id="Radio6" type="radio"  class="myClass" value="0" onchange="wrongCucccess('cmGender_wrong');" <s:if test='#session.AUDI_WEB_USER.gender eq "0"'>checked="checked"</s:if> name="cmGender" data-label="女士"  />
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id='cmGender_wrong'></span></td>
                        </tr>
                        <tr>
                            <td><span class="tip">*</span>手机号码：</td>
                            <td><input type='text' name='cmMobile' style='width:100%' id='cmMobile' value="<s:property value='#session.AUDI_WEB_USER.mobile'/>" onblur="vaialP('cmMobile','cmMobile_wrong')"></td>
                            <td style='padding-left:10px'><span class='wrong' id='cmMobile_wrong'></span></td>
                        </tr>   
                        <tr>
                            <td id='riqi'><span>出生日期：</span></td>
                            <td>
                                <div style='float:left'>								
                                        <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                        <fieldset class="longlabels" style=" width:75px">
                                            <select id="cm_birthY" class="select" name="cm_birthY" onchange="setDay('cm_birthY','cm_birthM','cm_birthD');$('#cm_birthM').val('');$('#cm_birthD').val('');$('#cm_birthM').siblings('.caption').text('请选择');$('#cm_birthD').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                              
                                                </select>
                                        </fieldset>
                                        </form>        						
                                    <span class="span_data span1">年</span>
                                </div>
                                <div style='float:left'>                                    
                                     <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                        <fieldset class="longlabels" style=" width:75px">
                                           <select id="cm_birthM" class="select" name="cm_birthM" onchange="setDay('cm_birthY','cm_birthM','cm_birthD');$('#cm_birthD').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
												</select>
                                        </fieldset>
                                    </form>                                    
                                    <span class="span_data span1">月</span>
                                </div>	
                                <div style='float:left'>                                    
                                     <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                        <fieldset class="longlabels" style=" width:76px">
                                           <select id="cm_birthD" class="select" name="cm_birthD" style="opacity: 0.0001; z-index: 2;" onchange="$('#cm_birthD_hidden_test').val(this.value);">
												<option value="">请选择</option>
                                               </select>
                                               <input type="hidden" id="cm_birthD_hidden_test" value=""/>
                                        </fieldset>
                                    </form>                                    
                                    <span class="span_data span1">日</span>
                                </div>				
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id='cm_birth_wrong'></span></td>
                        </tr>  
                        <tr>
                        	<td colspan="3" height="8"></td>
                        </tr> 
                        <tr>
                            <td>
                                <span class="f_14 f_w">邮寄地址</span></td>
                            <td></td>
                            <td></td>
                        </tr>   
                        <tr>
                            <td id='shengshi'><span class="tip">*</span><span>所在省市：</span></td>
                            <td>
                                <div style='float:left'>								
                                        <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                        <fieldset class="longlabels" style=" width:122px">
                                            <select id="cmProvince" onchange="change_citys('cmCity',this.value,'');$('#cmCity').siblings('.caption').text('请选择');$('#aid').siblings('.caption').text('请选择');" class="select" name="cmProvince" style="opacity: 0.0001; z-index: 2;" 
                                            onblur="vaialK('cmProvince','cmProvince_wrong',wrongObj.cmProvince_wrong)">
                                        	 <option value="">请选择</option>
                                        </select>
                                        </fieldset>
                                        </form>        						
                                    <span class="span_data span1">省</span>
                                </div>
                                <div style='float:left'>                                    
                                     <form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                        <fieldset class="longlabels" style=" width:122px">
                                            <select id="cmCity" class="select" name="cmCity" style="opacity: 0.0001; z-index: 2;" 
                                            onblur="vaialK('cmCity','cmProvince_wrong',wrongObj.cmCity_wrong)">
									  			<option value="">请选择</option>
                                        </select>
                                        </fieldset>
                                    </form>                                    
                                    <span class="span_data span1">市</span>
                                </div>					
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id='cmProvince_wrong'></span></td>
                        </tr>
                        <tr>
                            <td><span class="tip">*</span><span class="word_apacing19">地 址：</span></td>
                            <td style='height:40px'><input type='text' name='cmAddress' id='cmAddress' style='width:276px' value="<s:property value='#session.AUDI_WEB_USER.address'/>" onblur="if(!emptyVaila(this)){vaialKD('cmAddress','cmAddress_wrong')}"></td>
                            <td style='padding-left:10px'>
                            	<span class='note' id="cmAddress_wrong"></span>
                                <span class='tixing'>请注明具体区域/街道，以确保资料的准确投递</span>
                            </td>
                        </tr>  
                        <tr>
                            <td><span class="tip">*</span><span class="word_apacing19">邮 编：</span></td>
                            <td><input type='text' name='cmZip'  style='width:276px;' id='cmZip' onblur="vaialEMzip('cmZip','cmZip_wrong')" value="<s:property value='#session.AUDI_WEB_USER.postcode'/>" ></td>
                            <td style='padding-left:10px'><span class='wrong' id='cmZip_wrong'></span></td>
                        </tr>                  										
                    </table>
                    <div class="bottom_input_box clearfix">
                        <span class='next'></span>
                    </div>
                </div>
            </div>
            <div class='takepage_slidecon3' style="margin-bottom: 50px;">
                <p style='padding-left:46px'>登录提示：如果您拥有“我的奥迪账户”，请点击右上方登录按钮进行登录，您的相关信息会自动置入表格中
                </p>
                <div class='tp_3 positon_rel'>
                    <table width="100%">
                        <tr>
                            <td colspan="3"><p style='margin:10px 0 10px 0'><span>( 标注</span><span class="tip">*</span><span>号为必填项</span> )</p></td>
                        </tr>
                        <tr>
                            <td width="138"><span class="tip">*</span><span class="f_14 f_w"style='margin-right:10px'>目前车辆拥有状况</span></td>
                            <td class="f_14" width="280">  
                            <span class="js_car">
                            	<input id="havecar" type="radio" onchange="wrongCucccess('cmIscar_wrong');" class="myClass" value="1" name="cmIscar" data-label="有" data-color="blue" />
                                </span>
                            <span class="js_car">
                                <input id="nocar" type="radio"  onchange="wrongCucccess('cmIscar_wrong');"  class="myClass" value="0" name="cmIscar" data-label="无" />
                             </span>
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id='cmIscar_wrong'></span></td>
                        </tr>
                        <tr>
                            <td>
                                <span>车辆品牌：</span>	
                                <div style='position:relative;z-index:8900;display:block;'>
                                	<div class='shade carband' style="display:block;width:600px;" ></div>
                                </div>
                            </td>
                            <td>
                               <form class="frm">
                                    <fieldset class="longlabels" style="width:277px;">
                                        <select id="cmBrand" class="select" name="cmBrand" 
                                        onchange="change_brands('cmModel',this.value,'');footNum(this.value);$('#cmModel').siblings('.caption').text('请选择');" style="opacity: 0.0001; z-index: 2;">
                                            </select>
                                    </fieldset>
                                </form>
                            </td>
                            <td style='padding-left:10px'><span class='wrong' id='cmBrand_wrong'></span></td>
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
                        <td style='padding-left:10px'><span class='wrong' id='cmModel_wrong'></span></td>
                        </tr>
                        <tr>  
                            <td><span>购车时间：</span></td>
                            <td>
                                <div style='float:left'>       						
                                    <form class="frm" >
                                        <fieldset class="longlabels" style=" width:122px">
                                             <select id="cmBuyyear" class="select" name="cmBuyyear" style="opacity: 0.0001; z-index: 2;"
                                              onchange="$('#cmBuymonth').val('');$('#cmBuymonth').siblings('.caption').text('请选择');">
                                             <option value="">请选择</option>
                                             </select>
                                        </fieldset>
                                    </form>        						
                                    <span class="span1">年</span>						
                                </div>
                                <div>
                                    <form class="frm">
                                        <fieldset class="longlabels" style=" width:122px">
	                                        <select id="cmBuymonth" class="select" name="cmBuymonth" style="opacity: 0.0001; z-index: 2;">
	                                        <option value="">请选择</option>
	                                        </select>
                                        </fieldset>
                                    </form>        						
                                    <span class="span1">月</span>						
                                </div>
                            
                        </td>
                            <td style='padding-left:10px'><span class='wrong' id="cmbuycar_wrong"></span></td>
                        </tr>
                        <tr id='chejiahao' style="display: none;">
                            <td><span class="tip">*</span><span>车架号：</span></td>
                            <td><input type='text' name='cmFootnum' style='width:275px' id='cmFootnum' onblur="if(!emptyVaila(this)){vaialKDfn('cmFootnum','cmFootnum_wrong')}"></td>
                            <td style='padding-left:10px'>  
                            <span class='note' id="cmFootnum_wrong"></span>  
                            <span class='tixing'>请查看行驶证上17位编码</span></td>
                        </tr>
                        <tr>
                        <td colspan="3" height="40"></td>     
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
					<p>个人基本信息</p>
					<ul>
						<li><span class="word_apacing19">姓 名：</span><span id='info_cmName'></span></li>
						<li><span class="word_apacing19">称 谓：</span><span id='info_cmGender'></span></li>
						<li><span>手机号码：</span><span id='info_cmMobile'></span></li>
						<li id='hide_cmBirthday'><span>出生日期：</span><span id='info_cmBirthday'></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>邮寄地址</p>
					<ul>
						<li><span class="word_apacing19">所在省市：</span><span id='info_cmProvince'></span></li>
						<li><span class="word_apacing19">地 址：</span><span id='info_cmAddress'></span></li>
						<li><span class="word_apacing19">邮 编：</span><span id='info_cmZip'></span></li>
					</ul>
				</div>
				<div class='zr_dot'>
					<p>目前车辆拥有情况</p>
					<ul>
                    	<li><span id='info_cmIscar'></span></li>
						<li id="yin_cmBrand"><span>车辆品牌：</span><span id='info_cmBrand'></span></li>
						<li id='yin_cmModel'><span>车辆型号：</span><span id='info_cmModel'></span></li>
						<li id='infoo_cmBuyyear'><span>购车时间：</span><span id='info_cmBuyyear'> </span></li>
						<li id="info_footnum"><span>车 架 号：</span><span id='info_cmFootnum'></span></li>
					</ul>
				</div>				
				<div class='zr_dot' style='border-bottom:1px black dotted'>
					<div  class="control-group clearfix">
                    	<div class="control_left">隐私条款：</div>
                        <div class="controls">
                        	<div class="input_box"><input id="agree" type="checkbox"  class="myClass" value="yes" checked="checked" name="agree" data-label="" data-color="blue"/></div>
                            <span class="controls_text">我特此授权一汽-大众奥迪销售事业部保留我的数据以便解答我的问题；我所提供的信息将按照数据保护规定进行保留。我也同意一汽-大众奥迪销售事业部把我的数据用于其它营销、调查和统计目的，并允许一汽-大众奥迪销售事业部根据我所提供的信息与我联系。</span>
                        </div>
                    </div>					
				</div>
                <div class="bottom_input_box" style='border:none'>                	
					<span class='refer' id='refer'></span>
                    <span class='pre'></span>
                </div>				
			</div>
            <div id='takepage_fail' style='padding-left:22px'>
				<p><strong>提交失败！</strong></p>
				<p class='failnote'>抱歉，您的信息提交失败，请返回上一级重新提交。</p>
				<p class='pres'> <strong class='failred'><img src="images/jiantou.png" style='margin-top:4px'> </strong> <span class="f_w">返回上一步</span></p>
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
	var car = $(".js_car").parents("tr").next().find(".shade");
	car.hide();
		$(function(){
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			$('input.myClass').Checkable({
				color: 'blue'
			});
			
			/*判断有车没车，购车意向*/
		$(".js_car").each(function(){
			$(this).on("click",function(){
				var input = $(this).find("input");
				var car = $(this).parents("tr").next().find(".shade");
				$(this).find("a").triggerHandler("click");
				//if()
				if(input.is(":checked") && input.attr("value") == "0"){
					car.show();
				}
				else{
					car.hide();
				}
			});
				
			});  
		});
		//提交的信息拼接
		var submitVals="";
		var allField=[    // 所有字段
					{cmName:"cm.cmName"},  //姓名
					{cmGender:"cm.cmGender",type:"radio"},//性别
					{cmMobile:"cm.cmMobile"},  //手机号码
					{cmBirthday:"cm.cmBirthday"},//生日
					{cmIscar:"cm.cmIscar",type:"radio"},//是否有车
					{cmProvince:"cm.cmProvince"},//省
					{cmCity:"cm.cmCity"},//市
					{cmAddress:"cm.cmAddress"},//地址
					{cmZip:"cm.cmZip"},//邮编
					{cmBrand:"cm.cmBrand"},//车辆品牌
					{cmModel:"cm.cmModel"},//车辆型号
					{cmBuyyear:"cm.cmBuyyear"},//购买时间（年）
					{cmBuymonth:"cm.cmBuymonth"},//购买时间（月）
					{cmFootnum:"cm.cmFootnum"}	//车架号			
				];
				var index = 0;
		(function(){

 			
 			
//			$(".magaz").find("span").each(function(){
//				$(this).click(function(){
//					index = $(this).index();
//					showpage(index);					
//				});
//			});
		
		
			$('.takepage div').eq(0).show().siblings().hide();
			$('.takepage_slidecon>div').eq(0).show().siblings().hide();
			//下一步
			$('.next').click(function(){
				//是否有错误
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
								if(key=="cmGender"){
									value=(value=="0"?"女士":"先生");
								}else if(key=="cmIscar"){
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
								// cdBirthday"},//这个是由birthY,birthM,birthD
								var value=$("#"+key).val();
								if(value==null){
									value="";
								}
								//真实的value
								var realdValue=value;
								if(key=="cmBirthday"){
									if($("#cm_birthY").val()=="" || $("#cm_birthM").val()=="" || $("#cm_birthD").val()==""){
										value="";
										$("#hide_cmBirthday").hide();
									}else{
										value=$("#cm_birthY").val()+"年"+$("#cm_birthM").val()+"月"+$("#cm_birthD").val()+"日";
										$("#hide_cmBirthday").show();
									}
									if($("#cm_birthY").val()=="" || $("#cm_birthM").val()=="" || $("#cm_birthD").val()==""){
										realdValue="";
									}else{
										realdValue=$("#cm_birthY").val()+"-"+$("#cm_birthM").val()+"-"+$("#cm_birthD").val();
									}
								}
								if(key=="cmBuyyear"){
									value=getDictBrand($("#cmBuyyear").val());
									if(value!=""){
										if($("#cmBuyyear").val()=="" ||$("#cmBuymonth").val()==""){
											value="";
											$("#infoo_"+key).hide();
										}else{
											value=$("#cmBuyyear").val()+"年"+$("#cmBuymonth").val()+"月";
											$("#infoo_"+key).show();
										}
									}
								}
								
								//省市
								if(key=="cmProvince"){
									value =getDictPovince($("#cmProvince").val())+"省"+getDictCity($("#cmProvince").val(),$("#cmCity").val())+"市";
								}
								var value1=$('input[name=cmIscar]:checked').attr("value");
								if(value1=='1'){
									if(key=='cmFootnum'){  
										if($("#cmFootnum").val()==""){
											$("#info_footnum").hide();
										}else{
											$("#info_footnum").show();
										}
									}
									if(key=="cmBrand"){									
										value=getDictBrand($("#cmBrand").val());
										if(value==""){
											$("#yin_"+key).hide();
											$("#infoo_cmBuyyear").hide();
										}else{
											$("#yin_"+key).show();
											$("#infoo_cmBuyyear").show();
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
									 
								}else{
									if(key=='cmFootnum'){$("#info_footnum").hide();}
									if(key=='cmBrand'){$("#yin_"+key).hide();}
									if(key=='cmModel'){$("#yin_"+key).hide();}
									if(key=="cmBuyyear"){$("#infoo_"+key).hide();}
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
					//console.log(keys);					
				}
			}	
					
				if(isWrong==false){
					index++;
					showpage(index);
				}else{
					index=index_i-1;
				}
				return;	
											
				//index++;
			///	showpage(index);
			});
			$('.pre').click(function(){
				index--;
				showpage(index);
			})
			//提交失败返回上一步
			$('.pres').click(function(){
				$('.takepage_con').show()
				showpage(index);
			})
			/*提交失败返回上一步title底部黑线消失*/
			$('.f_w').click(function(){
				$('#cn_maincontent .page_title').css('border','none')
			})			
		})();
		
		//点击头部判断,i传入的
		var submitMaxId=0;
		function clickHeard(i){
		submitVals="";		
			if(i!=0){
				var isWrong=false;
				for(var j=1;j<=i;j++){
					isWrong = validForm(j);
					if(isWrong==true){
						break;
					}
				}
				if(false==isWrong){
					
					if(i==2){
					//没有错误
					//if(!isWrong){//信息   
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
								if(key=="cmGender"){
									value=(value=="0"?"女士":"先生");
								}else if(key=="cmIscar"){
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
								// cdBirthday"},//这个是由birthY,birthM,birthD
								var value=$("#"+key).val();
								if(value==null){
									value="";
								}
								//真实的value
								var realdValue=value;
								if(key=="cmBirthday"){
									if($("#cm_birthY").val()=="" || $("#cm_birthM").val()=="" || $("#cm_birthD").val()==""){
										value="";
										$("#hide_cmBirthday").hide();
									}else{
										value=$("#cm_birthY").val()+"年"+$("#cm_birthM").val()+"月"+$("#cm_birthD").val()+"日";
										$("#hide_cmBirthday").show();
									}
									if($("#cm_birthY").val()=="" || $("#cm_birthM").val()=="" || $("#cm_birthD").val()==""){
										realdValue="";
									}else{
										realdValue=$("#cm_birthY").val()+"-"+$("#cm_birthM").val()+"-"+$("#cm_birthD").val();
									}
								}
								
								
								//省市
								if(key=="cmProvince"){
									value =getDictPovince($("#cmProvince").val())+"省"+getDictCity($("#cmProvince").val(),$("#cmCity").val())+"市";
								}
								
								var value1=$('input[name=cmIscar]:checked').attr("value");
								
								if(key=="cmBuyyear"){
									value=$("#cmBuyyear").val();
									if(value!=""){
										if($("#cmBuyyear").val()=="" ||$("#cmBuymonth").val()==""){
											value="";
											$("#infoo_"+key).hide();
										}else{
											value=$("#cmBuyyear").val()+"年"+$("#cmBuymonth").val()+"月";
											$("#infoo_"+key).show();
										}
									}
								}
								if(value1=='1'){
									if(key=='cmFootnum'){  
										if($("#cmFootnum").val()==""){
											$("#info_footnum").hide();
										}else{
											$("#info_footnum").show();
										}
									}
									if(key=="cmBrand"){									
										value=getDictBrand($("#cmBrand").val());
										if(value==""){
											$("#yin_"+key).hide();
											//$("#infoo_cmBuyyear").hide();
										}else{
											$("#yin_"+key).show();
											//$("#infoo_cmBuyyear").show();
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
								}else{
									if(key=='cmFootnum'){$("#info_footnum").hide();}
									if(key=='cmBrand'){$("#yin_"+key).hide();}
									if(key=='cmModel'){$("#yin_"+key).hide();}
									if(key=="cmBuyyear"){$("#infoo_"+key).hide();}
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
			
					showpage(i);
				}
			}else{
				showpage(i);
			}			
		}
		
		/*提交按钮*/
		$('#refer').click(function(){
			$.post("contactMagazine_save.action",submitVals,function(data){
				if(data.success=="true"){
					$('#takepage_sucss').show().siblings().hide();
					$('.takepage_con').css('display','none');
					//注册时，把用户名带入到注册框
					$("#rform input[name='user.username']").val($("#cmName").val());
				}
				else{
					$('#takepage_fail').show().siblings().hide();
					$('.takepage_con').css('display','none');
				}
		});
			//$('#takepage_sucss').show().siblings().hide();
			//$('.takepage_con').css('display','none');
		})
			
		function showpage(i){
			index=i;
			$(".magaz").css("background-image","url(images/zazhi_banner"+(i+1)+".jpg)")
		 	$('.takepage_slidecon>div').eq(i).show().siblings().hide();
		}
		function validForm(index_i){
			var isWrong=false;
			if(index_i==1){
					var cmName=$("#cmName").val();
					var cmGender=$('input[name="cmGender"]:checked').attr("value");
					var cmProvince=$("#cmProvince").val();
					var cmCity=$("#cmCity").val();
					var cmMobile=$("#cmMobile").val();
					var cmAddress=$("#cmAddress").val();
					var cmZip=$("#cmZip").val();

					var wrongObj={ 
						cmName_wrong:"请填写您的姓名",
						cmGender_wrong:"请选择称谓",
						cmProvince_wrong:"请选择您所在省",
						cmCity_wrong:"请选择您所在市",
						cmMobile_wrong:"请填写您的手机号码",
						cmMobile_va_wrong:"手机号码应为11位数字",
						cmAddress_wrong:"请填写您的地址",
						cmZip_wrong:"请填写您所在地的邮编",
						cmZip_va_wrong:"您填写的邮编格式不正确"
					};
					wrongCucccess("cmName_wrong");
					wrongCucccess("cmGender_wrong");
					wrongCucccess("cmProvince_wrong");
					wrongCucccess("cmCity_wrong");
					wrongCucccess("cmMobile_wrong");
					wrongCucccess("cmAddress_wrong");
					wrongCucccess("cmZip_wrong");
					if(cmName==""){
						wrongInfo("cmName_wrong",wrongObj.cmName_wrong);						
						isWrong=true;
					}
  
					
					if(cmCity==""){
						wrongInfo("cmProvince_wrong",wrongObj.cmCity_wrong);	
						isWrong=true;
					}
					if(cmProvince==""){
						wrongInfo("cmProvince_wrong",wrongObj.cmProvince_wrong);
						isWrong=true;
					} //mark
					if(cmMobile==""){
						wrongInfo("cmMobile_wrong",wrongObj.cmMobile_wrong);	
						isWrong=true;
					}
					
					if(cmMobile!=""&&!validationPhone(cmMobile)){
						wrongInfo("cmMobile_wrong",wrongObj.cmMobile_va_wrong);
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
					if(cmZip==""){
						wrongInfo("cmZip_wrong",wrongObj.cmZip_wrong);
						isWrong=true;
					}
					if(cmZip!=""&&!isZipCode(cmZip)){
						wrongInfo("cmZip_wrong",wrongObj.cmZip_va_wrong);
						isWrong=true;
					}	
					if(!cmGender || cmGender==""){
						wrongInfo("cmGender_wrong",wrongObj.cmGender_wrong);
						isWrong=true;
					}							
				}else if(index_i==2){
					var wrongObj={
						cmIscar_wrong:"请选择目前车辆拥有状况",
						cmBrand_wrong:"请选择车辆品牌",
						cmFootnum_wrong:"请填写车架号",
						cmBuytime_wrong:"请选择购买时间（年份）",
						cmBuymonth_wrong:"请选择购买时间（月份）",
						cmModel_wrong:"请选择车辆型号"
					};
					var cmBrand=$("#cmBrand").val();
					var cmIscar=$('input[name="cmIscar"]:checked').attr("value");
					var cmFootnum=$("#cmFootnum").val();
					var cmBuytime=$("#cmBuyyear").val();
					var cmBuymonth=$("#cmBuymonth").val();
					var cmModel=$("#cmModel").val();
					if(!cmIscar ||cmIscar==""){
						wrongInfo("cmIscar_wrong",wrongObj.cmIscar_wrong);
						isWrong=true;
					}else if(!cmIscar || cmIscar=="1"){
						if(audi_brand_2013!=cmBrand){							
							$("#cmFootnum").val('');
						}else{
							
						}
						//车架号
						if(cmFootnum=="" && audi_brand_2013==cmBrand){
							$("#cmFootnum_wrong").attr("class","wrong");
							$("#cmFootnum_wrong").siblings('.tixing').hide();
							wrongInfo("cmFootnum_wrong",wrongObj.cmFootnum_wrong);
							isWrong=true;
							//alert(isWrong+"221");
						}else if(audi_brand_2013!=cmBrand){
							$("#cmFootnum_wrong").attr("class","note");
							$("#cmFootnum_wrong").siblings('.tixing').show();
							$("#cmFootnum_wrong").removeAttr("style");
						}

					if(cmBuytime==""){
					//	$("#cmBuytime_wrong").text(wrongObj.cmBuytime_wrong);
					//	isWrong=true;
					}
					if(cmBuymonth==""){
					//	$("#cmBuymonth_wrong").text(wrongObj.cmBuymonth_wrong);
					//	isWrong=true;
					}
					if(cmModel==""){
					//	$("#cmModel_wrong").text(wrongObj.cmModel_wrong);
					//	isWrong=true;
					}					
					}
				}
				return isWrong;
			
		}
		//错误的图片
		var wrongBackground="url('images/baocuo.jpg')";
		//验证正确
		function wrongCucccess(id){
			$("#"+id).text("");
			$("#"+id).css("background-image","none");
		}
		//错误样式
		$(".wrong").css("background-image","none");
		
		
		function wrongInfo(id,text){
			$("#"+id).text(text);
			$("#"+id).css("background-image",wrongBackground);
		}
		//禁用下拉列表
		function disableSelect(id){
		//	$('#'+id).val('');
		}
		//启用
		function enableSelect(id){
		//	$('#'+id).val('');
			$('#'+id).siblings('.caption').text('请选择');
		}
		//省市
		//initprovince('cmProvince', '');
		//change_citys('cmCity', '','');
		//省市
		var valp = "<s:property value='#session.AUDI_WEB_USER.province'/>";
		var valc = "<s:property value='#session.AUDI_WEB_USER.city'/>";
		if(valp!=''){
			initprovince('cmProvince', valp);
		}else{
			initprovince('cmProvince','');
		}
		change_citys('cmCity', valp,valc);
		
		//车品牌
		initbrand('cmBrand', '');
		change_brands('cmModel', '','');

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
		$("#cm_birthY").append(allYearOption);
		$("#cm_birthM").append("<option value=''>请选择</option>");
		for(var i=1;i<13;i++){
			if(testM!="" && testM==i+""){
				$("#cm_birthM").append("<option value='"+i+"' selected>"+i+"</option>");
			}else{
				$("#cm_birthM").append("<option value='"+i+"'>"+i+"</option>");
			}
		}
		if(testY!="" && testM!=""){
			setDay('cm_birthY','cm_birthM','cm_birthD');
			$("#cm_birthD").append("<option value=''>请选择</option>");
			$("#cm_birthD").val(testD);
		}
		
		//初始化页面数据

		//是否有车辆
		var sessionIscar ="<s:property value="#session.AUDI_WEB_USER.iscar"/>";
		var sessionBrand ="<s:property value="#session.AUDI_WEB_USER.brand"/>";
		var sessionModel ="<s:property value="#session.AUDI_WEB_USER.model"/>";
		var sessionBuytime ="<s:property value="#session.AUDI_WEB_USER.buytimemonth"/>";
		var sessionBuytimeyear="<s:property value="#session.AUDI_WEB_USER.buytimeyear"/>";
		var sessioncmFootnum="<s:property value="#session.AUDI_WEB_USER.footnum"/>";
		
		if(sessionIscar!="" && sessionIscar=="1"){  //1有  0无
			$('input[name="cmIscar"][value="1"]').attr("checked","checked");//是否有车
			$($('input[name="cmIscar"][value="1"]')).parents("tr").next().find(".shade").hide();
		}
		//车品牌
		initbrand('cmBrand', sessionBrand);
		change_brands('cmModel', sessionBrand,sessionModel);
		if(sessionBrand==audi_brand_2013){  //车架号回显
		//alert(sessioncmFootnum+"ddd");
			$("#chejiahao").show();
			//$("#modify_buybudget").val(val_buybudget);
			$("#cmFootnum").val(sessioncmFootnum);
		}else{
			$("#chejiahao").hide();
		}
		
		for(var i=2001;i<2014;i++){
			$("#cmBuyyear").append("<option value='"+i+"'>"+i+"</option>");
		}
		$("#cmBuyyear").val(sessionBuytimeyear);
		for(var i=1;i<13;i++){
			$("#cmBuymonth").append("<option value="+i+">"+i+"</option>");
		}
		$("#cmBuymonth").val(sessionBuytime);

		
		var wrongObj={    
			cmName_wrong:"请填写您的姓名",
			cmGender_wrong:"请选择您的称谓",
			cmProvince_wrong:"请选择您所在省",
			cmCity_wrong:"请选择您所在市",
			cmMobile_wrong:"请填写您的手机号码",
			cmMobile_va_wrong:"手机号码应为11位数字",
			cmAddress_wrong:"请填写您的地址",
			cmZip_wrong:"请填写您所在地的邮编!",
			cmZip_va_wrong:"您填写的邮编格式不正确",
			cmIscar_wrong:"请选择目前车辆拥有状况",
			cmBrand_wrong:"请选择车辆品牌",
			cmFootnum_wrong:"请填写车架号",
			cmBuytime_wrong:"请选择购买时间（年份）",
			cmBuymonth_wrong:"请选择购买时间（月份）",
			cmModel_wrong:"请选择车辆型号"
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
	  					wrongInfo(wrong,wrongObj.cmMobile_va_wrong);
	  				}	  			
	  		}else{
	  			wrongInfo(wrong,wrongObj.cmMobile_va_wrong);
	  		}
  		}
  		
  		 //邮编验证
 		function vaialEMzip(id,wrong){
	  		if($("#"+id).val()!=""){
	  			if(isZipCode($("#"+id).val())){
	  				wrongCucccess(wrong);
	  				}else{
	  					wrongInfo(wrong,wrongObj.cmZip_va_wrong);
	  				}
	  			
	  		}else{
	  			wrongInfo(wrong,wrongObj.cmZip_wrong);
	  		}			
  		}
  		  function footNum(id){
		  	if(id==audi_brand_2013){
		  		 $("#chejiahao").show();		  		 
		  	}else{
		  		 $("#chejiahao").hide();
		  		 $("#info_footnum").hide();	  		 
		  		 $("#cmFootnum").val("");
		  	}
		  
		  }
  //		function chkiscar(id){
		  // if(id==1){//有车
		    // enableSelect("cmBrand");
		   //  enableSelect("cmModel");
		   //  enableSelect("cmBuyyear");
		   //  enableSelect("cmBuymonth");
		  //   $("#chejiahao").hide();
		     // $("#cmFootnum").val("");
		 //  }else{//无车
		    // disableSelect("cmBrand");
		    // disableSelect("cmModel");
		    // disableSelect("cmBuyyear");
		    // disableSelect("cmBuymonth");
		    //  $("#chejiahao").hide();
		     // $("#cmFootnum").val("");
		 //  }
		// wrongCucccess
		
//		  }
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
  			wrongInfo(wrong,"请填写您的地址");
  		}

  }
  //车架号输入验证不为空
  function vaialKDfn(id,wrong){
			
  		if($("#"+id).val()!=""){
  			wrongCucccess(wrong);
  			$("#cmFootnum_wrong").attr("class","note");
			$("#cmFootnum_wrong").siblings('.tixing').show();
			$("#cmFootnum_wrong").removeAttr("style");
  		}else{
  			$("#cmFootnum_wrong").attr("class","wrong");
			$("#cmFootnum_wrong").siblings('.tixing').hide();
  			wrongInfo(wrong,"请填写您的车架号");
  		}
  }

	</script>
</body>
</html>
	