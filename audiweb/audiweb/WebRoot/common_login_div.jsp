<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>

<div id='popup_login'></div>
		 <div class='login_mid'>
			<div class='login_login'>
				<p class='login_login_yhdl' style="maring:34px 0 30px;">用户登录</p>
				<form name="logform" id="logform" action="#" onsubmit="return false;" method="post" >
					<ul>
						<li><span>电子邮箱：</span><input type='text' id="login_email" onblur="if(!emptyVaila(this)){vaialE('login_email','login_email_wrong')}" name="email">
							<span class="wrong" id="login_email_wrong" style='height:19px' ></span>
						</li>
						<li><span style='word-spacing:18px;'>密 码：</span>
						<input name="password" id="login_password" onblur="if(!emptyVaila(this)){vaialPass('login_password','login_password_wrong')}" type='password'/>
						<span class="wrong" id="login_password_wrong" style='height:19px'></span>
						</li>
						<li class='login_thirdradio'>
							<input id="keeppassword" type="checkbox"  class="myClass" value="1"  
							name="keeppassword" data-label=""/><span style='margin-left:8px'>记住密码</span>
							<div style='clear:both;overflow:hidden;height:0;'></div>
						</li>
					</ul>
				</form>
				<p class='login_login_dl refer' onclick="logsubmit(document.logform);"></p>
				<p class='login_zcmm' style='margin-top:18px;' id='lostpassword'>忘记密码</p>
				<p class='login_zcmm' id='newzhuce'>新用户注册</p>
		  	</div> 
			<div class='login_forget'>
				<p class='login_forgetmima'>忘记密码</p>
				<ul>
					<li>请输入您注册时使用的电子邮箱</li>
					<li>提交成功后您将收到密码重置邮件进行密码修改。</li>
				</ul>	
					<table style="margin:34px 0 30px;overflow:hidden">
					<tr>
						<td style="height:25px;"><label style='display:inline-block;height:20px'>电子邮箱：</label></td>
						<td style="height:25px;"><input type='text' name='youxiang' style='height:19px' id='youxiang' onblur="validForgetValid()"/></td>
						<td style="height:25px;"><span class="wrong" id="youxiang_wrong" style='height:19px'></span></td>
					</tr>
					</table>	
				<div style='overflow:hidden'>
					<p class='login_forgetchongtian refer'></p>
					<p class='login_forgettijiao refer' onclick="forgetpassword();"></p>
					
				</div>
			</div>
		 	<div class='login_cg'>
				<p class='login_cgcc'>提交成功！</p>
				<p>请登录您的电子邮箱，进行密码重置。</p>
				<a href="#" id="resetPwd_a" target="_blank"><p class='login_cgjr refer'></p></a>
			</div>
			<div class='login_zhongzhi'>
				<p class='login_zhongzhimm'>密码重置</p>
					<table style="margin:0;">
						<tr style='overflow:hidden'>
						<td style="height:25px;"><span style='margin-right:12px'>电子邮箱</span><span>：</span></td>
						<td style="height:25px;"><span style='margin-left:12px'><s:property value="#session.resetPwdEmail"/></span></td>
						</tr>
						<tr>
					
						<td style="height:25px;"><span>设置新密码：</span></td>
						<td style="height:25px;"><input type='password' name='newpassword' id="newpassword" onkeydown="login_wrongCucccess_zhongzhi();"></td>
						<td style="height:25px;">
							<span class="note" id='newpassword_wrong'></span>
							 <span class="tixing">密码长度至少6个字符，可以为数字和字母，不能为空格。</span>
							 <!--<span class="wrong" id="newpassword_wrong"></span>-->
						</td>
						</tr>
						<tr>
						<td style="height:25px;"><span>确认新密码：</span></td>
						<td style="height:25px;"><input type='password' name='newpasswords' id="newpasswords"  onkeydown="login_wrongCucccess('newpasswords_wrong');"></td>
						<td style="height:25px;"><span class="wrong" id="newpasswords_wrong"></span></td>
						</tr>
					</table>
				<div style='overflow:hidden;margin-top:23px'>
					<p class='login_zhongzhict refer'></p>
					<p class='login_zhongzhitj refer' onclick="submitResetPwd()"></p>
					
				</div>
			</div> 
			<div class='login_zzcg'>
				<p class='login_zzcgl'>密码重置成功!</p>
				<p style='margin-bottom:187px'>账号将自动为您登录。</p>
			</div>
			<p class='popup_delete' <s:if test="#session.resetPwdEmail!=null">onclick="location.href='homepage.action'"</s:if>></p> 
		</div>  
		<div class='zhuce_mid'>
			<div class='zhuce_zhuce'>
				<div class='login_zhuce' style="width:520px;">
					<p class='login_zhucep'>注册</p>
					<p class='login_zhucenote' style='padding-bottom:12px'>欢迎注册“我的奥迪账户”，该账户将更加便于您在一汽-大众奥迪官网进行预约试驾及获取奥迪在线信息等功能的使用。</p>
					
				</div>
				<p><span>（标注</span><span class="tip s">*</span><span>号为必填项）</span></p>
				<p style='margin:10px 0;font-size:14px'>填写注册信息</p>
				<form name="rform" id="rform" action="#" method="POST">
					 
					<table width="100%">
						<tr>
							<td width="62"><span class="tip">*</span>电子邮箱：</td>
							<td width="216"><input type='text' id="zemail"name="user.email" onblur="if(!emptyVaila(this)){vaialEz('zemail','zemail_wrong');}"></td>
							<td style='padding-left:3px'>
								<span class="note" id="zemail_wrong" ></span><span class="tixing">请填写您常用的电子邮箱，它将作为您的登录账号使用。</span>
							</td>
						</tr>
						<tr>
							<td><span class="tip">*</span>设置密码：</td>
							<td><input name="user.password" id="zpassword" onblur="if(!emptyVaila(this)){vaialPassw('zpassword','zpassword_wrong');}" type='password'></td>
							<td style='padding-left:3px'><span class="note" id="zpassword_wrong"></span><span class="tixing">密码长度至少6个字符，可以为数字和字母，不能为空格。</span></td>
						</tr>
						<tr>
							<td style="height:25px;"><span class="tip">*</span>密码确认：</td>
							<td style="height:25px;"><input type='password' id="rpassword" onblur="if(!emptyVaila(this)){vaialQ('rpassword','rpassword_wrong');}" name="repassword"></td>
							<td style="height:25px;"><span class="wrong" id="rpassword_wrong"></span></td>
						</tr>
						<tr>
							<td style="height:25px;">
								<div><span class="tip">*</span><span class="word_apacing19" style='word-spacing:20px'>姓 名：</span></div>
								
								
							</td>
							<td style="height:25px;">
								<input type='text' name="user.username" id="username" onblur="if(!emptyVaila(this)){vaialK('username','username_wrong',login_wrongObj.login_username_wrong);}">
							</td>
							<td style="height:25px;"><span class="wrong" id="username_wrong"></span></td>
						</tr>
					</table>
					<div style='margin-top:5px'>
						<p style='margin:30px 0 12px;font-size:14px'>订阅奥迪新闻专递</p>
						<p style='margin-bottom:15px'><span class="tip">*</span>您是否愿意接收来自奥迪的每月新闻专递及其他相关资讯？</p>
						<p style='margin-bottom:30px' class="clearfix">
							<input id="Radio5" type="radio"  class="myClass" subval="1"  name="risincept" data-label="是" data-color="blue"  checked="checked"/>
							<input id="Radio6" type="radio"  class="myClass" subval="0"  name="risincept" data-label="否"/>
							<input type="hidden" name="user.isincept" id="user_isincept" value="0"/>
						</p>
					</div>
					<div>
						<p style='margin-bottom:20px'><span class="tip">*</span>隐私条款</p>
						<div style='position:relative;padding-left:15px'>
							<div style='position:absolute;left:0;top:0'>
								<input id="Radio6" type="checkbox"  class="myClass" value="1" id="user.iscn" name="user.iscn" data-label="" checked="checked"/>
							</div>
							<div style='margin-left:15px;width:520px;'>我特此授权一汽-大众奥迪销售事业部保留我的数据以便解答我的问题；我所提供的信息将按照数据保护规定进行保留。我也同意一汽-大众奥迪销售事业部把我的数据用于其它营销调查和统计目的，并允许一汽-大众奥迪销售事业部根据我所提供的信息与我联系。
							</div>
						</div>
					</div>	
				</form>
				<div style='overflow:hidden;margin:48px 0 63px 0'>
					<p class='zhuce_chongtian refer'></p>				
					<p class='zhuce_tijiao  refer' onClick="javascript:rsubmit(document.rform);"></p>
					
				</div>
			</div>
			<div class='zhuce_sucss'>
				<p class='zhuce_sucsscc'>提交成功！</p>
				<ul>
					<li style='margin-bottom:8px'>恭喜您成为一汽-大众奥迪官网注册用户。</li>
					<li>系统已发送验证邮件至您的电子邮箱，请注意查收并及时激活账号。</li>
				</ul>
				<a href="#" target="_blank" id="gotoemail_a"><p id='login_mail' class='refer'></p></a>
			</div>
			<div class='zhuce_jihuo'>
				<p class='zhuce_jihuop'>邮箱激活成功！</p>
				<ul style='margin:20px 0 78px 0'>
					<li style='margin-bottom:7px'>账号将自动为您登录，</li>
					<li>您可更便捷地查看和获取更多奥迪资讯。</li>
				</ul>
				<ul class='zhuce_list'>
					<li><a href="testdrive.action" class='testdrive'></a></li>
					<li><a href="brochure.action" class='brochure'></a></li>
					<li><a href="magazine.action" class='magazine'></a></li>
				</ul>
			</div>
			<p class='popup_delete'></p> 
		</div>   	
		
	<div class='xiugai_mid'>
		<div class='xiugai_xiu'>
			<p class='xiugai_title'>修改个人资料</p>  <!-- mark -->
			<p style='margin:6px 0 10px 65px;'>
				<span>( 标注</span><span class="tip">*</span></span><span>号为必填项 )</span>
			</p>
			<table width='100%' class="table_pop">
				<tr class='tb'>
					<td colspan='3'>登录信息</td>
				</tr>
				<tr>
					<td width="60"><span class="tip">*</span>电子邮箱：</td>
					<td width='229' colspan="2"> <s:property value="#session.AUDI_WEB_USER.email"/></td>
					<!-- <input type="text" name="modify_email" id="modify_email" value='<s:property value="#session.AUDI_WEB_USER.email"/>' readonly="readonly"> -->
				</tr>
				<tr>	
					<td style="height:25px;"><span class="tip">*</span>设置密码：</td>
					<td style="height:25px;" width="225">

					<form action="#" onsubmit="return false;">
					<input type='password' id='modify_password' onblur="if(!emptyVaila(this)){vaialPassw('modify_password','modify_password_wrong');}" readonly="readonly" value="000000">
					</form></td>


					<td style="height:25px;"><span class="note" id='modify_password_wrong'></span> <span class="tixing">密码长度至少6个字符，可以为数字和字母，不能为空格。</span></td>
					
				</tr>
				<tr>
					<td style="height:25px;"><span class="tip">*</span>密码确认：</td>

					<td style="height:25px;"><form action="#" onsubmit="return false;"><input type='password'  id='con_password' onblur="if(!emptyVaila(this)){vaialModifyQ('con_password','conpassword_wrong');}" readonly="readonly" value='000000'></form></td>
				

					<td style="height:25px;"><span class="wrong" id='conpassword_wrong'></span></td>
				</tr>
				<tr>
		            <td>&nbsp;</td>
		            <td colspan="2"style="padding-top: 0;">
		                <a href="javascript:;" class="js_password" onclick="updatePersonInfoPwd(this)">  
		                    <span>
		                        <span class="colorred"><img src="images/ld.jpg"></span> 修改密码
		                    </span>							
		                </a>
		                <div class="js_w">   
		                    <a href="javascript:password_submit();" style="margin-right: 10px;">
		                        <img src="images/ld.jpg"></span>
		                        <span>保存</span>
		                    </a>
		                    <a href="javascript:;" onclick="password_cancel()">
		                        <img src="images/ld.jpg"></span>
		                        <span>取消</span>
		                    </a>							
		                </div>
		            </td>
		        </tr>
				<tr class='tb'>
					<td colspan='3'>个人基本信息</td>
				</tr>
				<tr>
					<td style="height:25px;"><span class="tip">*</span><span class="word_apacing19" style='word-spacing:20px'>姓 名：</span></td>
					<td style="height:25px;"><input type='text' name="modify_username" id="modify_username"  onblur="vaialK('modify_username','modify_username_wrong',login_wrongObj.login_modify_username_wrong)"  value='<s:property value="#session.AUDI_WEB_USER.username"/>' ></td>
					<td style="height:25px;"><span class="wrong" id='modify_username_wrong'></span></td>
				</tr>
				<tr>
					<td><span class="word_apacing19" style='word-spacing:20px'>称 谓：</span></td>
					<td colspan="2">
						<div style='margin-left:82px'>
							<input id="Radio5" type="radio"  class="myClass" value="1"  name="modify_gender" data-label="先生" data-color="blue"/>
							<input id="Radio6" type="radio"  class="myClass" value="0"  name="modify_gender" data-label="女士" />
						</div>
						
					</td>
				</tr>
				<tr>
					<td>手机号码：</td>
					<td><input type='text' name="modify_mobile" id="modify_mobile"  onblur="if(!emptyVaila(this)){vaialP('modify_mobile','modify_mobile_wrong')}" value='<s:property value="#session.AUDI_WEB_USER.mobile"/>' ></td>
					<td><span class="wrong" id='modify_mobile_wrong'></span></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td >
						<div style='float:left'>								
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:80px">
                                    <select id="modify_birthdayy" class="select" name="modify_birthdayy" 
                                    onchange="setDay('modify_birthdayy','modify_birthdaym','modify_birthdayd');$('#modify_birthdaym').val('');$('#modify_birthdayd').val('');$('#modify_birthdaym').siblings('.caption').text('请选择');$('#modify_birthdayd').siblings('.caption').text('请选择');"
                                    style="opacity: 0.0001; z-index: 2;">
                                        <option value="">请选择</option>
                                        </select>
                                </fieldset>
                                </form>        						
    						<span class="span_data span1">年</span>
						</div>
                        <div style='float:left'>
							
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:45px">
                                    <select id="modify_birthdaym" class="select" name="modify_birthdaym" 
                                    onchange="setDay('modify_birthdayy','modify_birthdaym','modify_birthdayd');$('#modify_birthdayd').siblings('.caption').text('请选择');"
                                    style="opacity: 0.0001; z-index: 2;">
                                        <option value="">请选择</option>
                                        </select>
                                </fieldset>
                                </form>
    						
    						<span class="span_data span1">月</span>
						</div>
						<div>
							
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:45px">
                                    <select id="modify_birthdayd" class="select" name="modify_birthdayd" style="opacity: 0.0001; z-index: 2;" >
                                        <option value="">请选择</option>
                                        </select>
                                </fieldset>
                                </form>
    						
    						<span class="span_data span1">日</span>
						</div>								
					</td>
					<td><span class="wrong"></span></td>
				</tr>
				<tr class='tb'>
					<td colspan='3'>邮寄地址</td>
				</tr>
				<tr>
					<td>所在省市：</td>
					<td>
						<div style='float:left'>
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:92px">
                                    <select id="modify_province" class="select" name="modify_province" 
                                    onchange="change_citys('modify_city',this.value,'');$('#modify_city').siblings('.caption').text('请选择');"
                                    style="opacity: 0.0001; z-index: 2;">
                                        <option value=""></option>
                                        </select>
                                </fieldset>
                                </form>
    						<span  class="span1">省</span>
						</div>
						<div>
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:96px">
                                    <select id="modify_city" class="select" name="modify_city" 
                                    
                                    style="opacity: 0.0001; z-index: 2;">
                                        <option value=""></option>
                                        </select>
                                </fieldset>
                                </form>
    						<span class="span1">市</span>
						</div>
					</td>
					<td><span class="wrong"></span></td>
				</tr>
				<tr>
					<td><span class="word_apacing19" style='word-spacing:20px'>地 址：</span></td>
					<td><input type='text' id="modify_address" name="modify_address" value='<s:property value="#session.AUDI_WEB_USER.address"/>' ></td>
					<td><span class="note"></span><span class="tixing">请注明具体区域/街道，以确保资料的准确投递。</span></td>
				</tr>
				<tr>
					<td><span class="word_apacing19" style='word-spacing:20px'>邮 编：</span></td>
					<td><input type='text' id="modify_postcode" name="modify_postcode" onblur="if(!emptyVaila(this)){vaialEZip('modify_postcode','modify_postcode_wrong')}" value='<s:property value="#session.AUDI_WEB_USER.postcode"/>'></td>
					<td><span class="wrong" id='modify_postcode_wrong'></span></td>
				</tr>
				<tr class='tb'>
					<td colspan='3'><span  class="span_block">是否拥有驾照</span>
						<div class="radio_box1">
						<span class="modify_js_car">
							<input id="Radioj" type="radio"  class="myClass" value="1" 				
							name="modify_islicense" data-label="有" data-color="blue"/>
							</span>
							<span class="modify_js_car">
							<input id="Radioz" type="radio"  class="myClass" value="0"  						
							name="modify_islicense" data-label="无" style='margin-left:30px'/>
							</span>
						</div>							
					</td>
				</tr>
				<tr id='jialing'>  
					<td class="w_margin_td1"><SPAN>有效驾龄：</SPAN>
					<div style='position:relative;z-index:8900;display:block;'>
                            <div class='shade buytime' style="display:block;width:350px;height:35px;" ></div>
                        </div>
					</td>
					<td  class="w_margin_td1">
						<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:217px">
                                    <select id="modify_driverage" class="select" name="modify_driverage" style="opacity: 0.0001; z-index: 2;">
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
					<td><span class="wrong"></span></td>
				</tr>
				<tr class='tb'>
					<td colspan='3'><span  class="span_block">购车意向</span>
						<div class="radio_box1">
						<span class="modify_js_car">
							<input id="Radio5" type="radio"  class="myClass" value="1" 							
							name="modify_intent" data-label="有" data-color="blue"/>
							</span>
							<span class="modify_js_car">
							<input id="Radio6" type="radio"  class="myClass" value="0"  							
							name="modify_intent" data-label="无" style='margin-left:30px'/>
							</span>
							<!-- onchange="if(this.checked){$('#yusuan').hide();$('#goucheshijian').hide();$('#jingxiaoshang').hide();$('#jingxiaoshangs').hide();$('#chexing').hide();$('#chexi').hide();}" -->
						</div>							
					</td>
				</tr>
		
				<tr id='chexi'>
					<td width='64'><span>意向车型：</span>
						<div style='position:relative;z-index:8900;display:block;'>
                            <div class='shade buytime' style="display:block;width:350px;height:250px;" ></div>
                        </div>
					</td>  
					<!--  <div style='position:relative;z-index:8900;display:block;'>  
                                	<div class='shade carband' style="display:block;width:600px;" ></div>
                                </div> -->  
					<td>
						<div style='float:left'>   
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:190px">
                                    <select id="modify_intentcars" class="select" name="modify_intentcars" style="opacity: 0.0001; z-index: 2;" onchange="change_autos('modify_intentmodels',this.value,'');$('modify_intentmodels').append('<option value=\'-1\'>任意款</option>');$('#modify_intentmodels').siblings('.caption').text('请选择');">
                                        <option value="">请选择</option>

                                        </select>
                                </fieldset>
                                </form>
    						<span class="span1">车系</span>
						</div>
					</td>
					<td><span class="wrong"></span></td>
				</tr>
					<tr id='chexing'>
						<td>&nbsp;</td>
						<td>
						<div>
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
						<fieldset class="longlabels" style=" width:190px">
							<select id="modify_intentmodels" class="select" name="modify_intentmodels" style="opacity: 0.0001; z-index: 2;">
								<option value="">请选择</option>
								</select>
						</fieldset>
						</form>
    						<span class="span1">车型</span>
						</div>
					</td>
					<td><span class="wrong"></span></td>
				</tr>
				<tr id='jingxiaoshangs'>
					<td colspan="2">
						<span style="margin-right:0;" class="span_block">意向经销商：</span>
						<div class="f_l">
							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
								<fieldset class="longlabels" style=" width:90px">
									<select id="modify_dealerProvince" class="select" name="modify_dealerProvince" style="opacity: 0.0001; z-index: 2;" onchange="change_dealercitys('modify_dealerCity',this.value,'');$('#modify_dealerCity').siblings('.caption').text('请选择');$('#modify_intentdealer').siblings('.caption').text('请选择');">
										
										</select>
								</fieldset>  
							</form>
							<span class="span1">省</span>
						</div>							
    					<div class="f_l">
    						<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                            <fieldset class="longlabels" style=" width:90px">
                                <select id="modify_dealerCity" class="select" name="modify_dealerCity" style="opacity: 0.0001; z-index: 2;"  onclick="change_dealers('modify_intentdealer',this.value,'')" onchange="$('#modify_intentdealer').siblings('.caption').text('请选择');">
                                 
                                    </select>
                            </fieldset>
                            </form>
        					<span class="span1"> 市</span>	
    					</div>		    												
					</td>
					<td><span class="wrong"></span></td>						
				</tr>
				<tr id='jingxiaoshang'>
					<td>&nbsp;</td>
					<td>
						<div style='float:left'>
							<div style='float:left'>
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
						<fieldset class="longlabels" style=" width:180px">
							<select id="modify_intentdealer" class="select" name="modify_intentdealer" style="opacity: 0.0001; z-index: 2;">
								<option value="">请选择<</option>
								</select>
						</fieldset>
						</form>
    						</div> 
							<span class="span1">经销商</span> 
						</div>
					</td>
					<td><span class="wrong"></span></td>		
				</tr>
				<tr id='goucheshijian'>
					<td colspan='2'>
						<span style="margin-right:6px;" class="span_block">计划购车时间：</span>
						<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
							<fieldset class="longlabels" style=" width:184px">
								<select id="modify_planbuytime" class="select" name="modify_planbuytime" style="opacity: 0.0001; z-index: 2;">
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
					<td><span class="wrong"></span></td>
				</tr>
				<tr id='yusuan'>
					<td>购车预算：</td>
					<td class="w_margin_td1">
						<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
							<fieldset class="longlabels" style=" width:217px">
								<select id="modify_buybudget" class="select" name="modify_buybudget" style="opacity: 0.0001; z-index: 2;">
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
					<td><span class="wrong" id='modify_buybudget_wrong'></span></td>
				</tr>
				<tr class='tb'>
					<td colspan='3'>
						<span class="span_block">目前车辆拥有状况</span>
						<div class="radio_box1">
						<span class="modify_js_car">
							<input id="Radio5" type="radio"  							
							class="myClass" value="1"  name="modify_iscar" data-label="有" data-color="blue"/>	
							</span>
							<span class="modify_js_car">						
							<input id="Radio6" type="radio" 							
							class="myClass" value="0"  name="modify_iscar" data-label="无" />
							</span>
						</div>							
					</td>
				</tr>

				<tr id='brands_show'>  
					<td>
		                <span>车辆品牌：</span>
		                <div style='position:relative;z-index:8900;display:block;'>
                            <div class='shade buytime' style="display:block;width:350px;height:165px;" ></div>
                        </div>
		            </td>
					<td>
						<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
						<fieldset class="longlabels" style=" width:217px">
							<select id="modify_brand" class="select" 
							onchange="change_brands('modify_model',this.value,'');$('#modify_model').siblings('.caption').text('请选择');if(this.value!=audi_brand_2013){$('#hide_footnum').hide();}else{$('#hide_footnum').show();}"
							name="modify_brand" style="opacity: 0.0001; z-index: 2;">
								<option value="">请选择</option>
								</select>
						</fieldset>   
						</form>
					</td>
					<td><span class="wrong" id="modify_brand_wrong"></span></td>
				</tr>
				<tr id='model_show'>
					<td>车辆型号：</td>
					<td>
						<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
						<fieldset class="longlabels" style=" width:217px">
							<select id="modify_model" class="select" name="modify_model" style="opacity: 0.0001; z-index: 2;">
								<option value=""></option>

								</select>
						</fieldset>
						</form>
					</td>
					<td><span class="wrong"></span></td>
				</tr>
				<tr id='buytime_show'>
					<td>购车时间：</td>
					<td>
						<div style='float:left'>        						
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
                                <fieldset class="longlabels" style=" width:94px">
                                    <select id="modify_buytimeyear" class="select" name="modify_buytimeyear"
                                     onchange="$('#modify_buytimemonth').val('');$('#modify_buytimemonth').siblings('.caption').text('请选择');"
                                     style="opacity: 0.0001; z-index: 2;">
                                        </select>
                                </fieldset>
                                </form>        					
    						<span class="span1">年</span>						
						</div>
						<div style=''>
    							<form class="frm" action="/mvc.do/de/myaudi/de/userservice/registration" method="POST" name="register" novalidate="novalidate">
								<fieldset class="longlabels" style=" width:94px">
								<select id="modify_buytimemonth" class="select" name="modify_buytimemonth" style="opacity: 0.0001; z-index: 2;">
								</select>
								</fieldset>
								</form>        						
    						<span class="span1">月</span>						
						</div>
					</td>
					<td><span class="wrong"></span></td>
				</tr>
				<tr id="hide_footnum">
					<td class="w_margin_td1"><span class="tip">*</span><span class="word_apacing19">车架号：</span></td>
					<td class="w_margin_td1"><input type='text' id='modify_footnum' name='modify_footnum' value='<s:property value="#session.AUDI_WEB_USER.footnum"/>' onblur="vaialnoteK('modify_footnum','modify_footnum_wrong',login_wrongObj.login_cmFootnum_wrong)"></td>
					<td class="w_margin_td1"><span class="note" id="modify_footnum_wrong"></span>
						<span class="tixing">请填写行驶证上的17位车架号。</span>  
					</td>
				</tr>
				<tr class='tb'>
					<td style='padding-left:65px' colspan='3'>订阅奥迪新闻专递</td>
				</tr>
				<tr>
					<td colspan='3' class="w_margin_td2"><span class="tip">*</span>您是否愿意接收来自奥迪的每月新闻专递及其他相关资讯？</td>	
				</tr>
				<tr>
					<td colspan='3'>
						<div>
							<input id="Radio5" type="radio"  class="myClass" value="1" name="modify_isincept" data-label="是" data-color="blue"/>
						<input id="Radio6" type="radio"  class="myClass" value="0"  name="modify_isincept" data-label="否" />
						</div>							
					</td>						
				</tr>
			</table> 
			<div class="w_submit_box">
				<span class='xiugai_chongtian refer' onclick="xiugai_chongzhi_shuju()"></span>
				<span class='xiugai_tijiao  refer' id='xiugai_tijiao' onclick="modify_submit();"></span>
				
			</div>
		</div>
			
		
		<div class='xiugai_cg'>
			<p class='xiugai_cgg'>您的个人资料已修改成功！</p>
			<p class='xiugai_thanks'>感谢您对奥迪品牌的关注和支持。</p>
		</div>
		<p class='popup_delete' id='delete_reload' onclick='modify_reload();'></p> 
	</div>
 <script type="text/javascript">
 	var istrue=false;
 	var l_password;
	$(".wrong").css("background-image","none");
    var o;
 	function login_wrongCucccess(id){
		$("#"+id).text("");
		$("#"+id).css("background-image","none");
		istrue=true;
	}
	//重置密码验证
	function login_wrongCucccess_zhongzhi(){
		$("#newpassword_wrong").text("");
		$("#newpassword_wrong").css("background-image","none");
		istrue=true;
		$("#newpassword_wrong").attr("class","note");
		$("#newpassword_wrong").siblings('.tixing').show();
		$("#newpassword_wrong").removeAttr("style");
	}
	//错误图片
	var wrongBackground="url('images/baocuo.jpg')";
	//错误信息
	function wrongInfo(id,text){
		$("#"+id).text(text);
		$("#"+id).css("background-image",wrongBackground);
		istrue=false;
	}
	
	$(function(){
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('#footer').css('position','fixed');
			$('input.myClass').Checkable({
				color: 'blue'
			});
			
		/*默认提交失败和提交成功不显示*/
			$('#takepage_fail').hide();
			$('#takepage_sucss').hide();
			
			/*判断有车没车，购车意向*/
		$(".modify_js_car").each(function(){
			$(this).on("click",function(){
				var input = $(this).find("input");
				$(this).find("a").triggerHandler("click");
				var car = $(this).parents("tr").next().find(".shade");
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
		/*提交失败返回上一步title底部黑线消失*/
		$('.f_w').click(function(){
			$('#cn_maincontent .page_title').css('border','none')
		})
 		
function logsubfunc() {		
	if(""!=$('#login_email').val()){
		if(validationEmail($('#login_email').val())){
			login_wrongCucccess('login_email_wrong');
			return true;
		}else{
			wrongInfo('login_email_wrong',login_wrongObj.login_email_valid_wrong);
			return false;
		}
	}else{
		wrongInfo('login_email_wrong',login_wrongObj.login_email_wrong);
		return false;
	}
	if($('#login_password').val()!=""){
		if(validationPwd($('#login_password').val())){
				login_wrongCucccess('login_password_wrong');
				return true;
		}else{
			wrongInfo('login_password_wrong',login_wrongObj.login_password_valid_wrong);
			return false;
		}
	}else{
		wrongInfo('login_password_wrong',login_wrongObj.login_password_wrong);
		return false;
	}					
}
function warning(FieldName,WarningString){
		alert(WarningString);
		eval("o." + FieldName + ".focus();");
		return(false);
}
function logsubmit(){ 
  if(logsubfunc()){
		var remember=typeof($('input[name=keeppassword]').attr("checked"))!="undefined";
		if(remember==true){
			remember="1";
		}else{
			remember="0";
		}
  		$.post("login_login.action","email="+$('#login_email').val()+"&password="+$('#login_password').val()+"&remember="+remember,function(data){
  		if(data.success=="true"){
  			$('.login_mid').hide();
  			location.reload(true);
  			//l_password=$('#login_password').val();//取得密码值，为下面个人信息修改中的密码修改回显。  	
  			//alert(l_password);
  			//$("#modify_password").val(l_password);
  			//$("#con_password").val(l_password);		
  		}else{
  			var errorArr=["","您还没有通过邮箱验证激活此帐号,请登陆您的注册邮箱进行激活","您已经被禁止登陆","您填写的电子邮箱或密码错误。"];
  			wrongInfo('login_email_wrong',errorArr[data.msgCode]);
  		}
  		});
  }
}
	//alert(l_password+"dddds");
	var login_wrongObj={
										
		login_username_wrong:"请填写用户名",
		login_email_wrong:"请填写电子邮箱。",
		login_email_valid_wrong:"您填写的电子邮箱格式不正确。",
		login_password_wrong:"请填写密码",
		login_password_valid_wrong:"您填写的密码格式不正确。",
		login_couMidIntention_wrong:"请选择意向的车系",
		login_cdIntentmodels_wrong:"请选择意向的车型",
		login_cdProvince_wrong:"请选择经销商省",
		login_cdCity_wrong:"请选择经销商市",
		login_aid_wrong:"请选择经销商",
		login_cmBuybudget_wrong:"请选择预算",
		login_cmPlanbuytime_wrong:"请选择购车时间",
		login_cmFootnum_wrong:"请填写车架号",
		login_cdName_wrong:"请填写姓名",
		login_cdGender_wrong:"请选择性别",
		login_cdMobile_wrong:"请填写手机号码",
		login_cdMobile_valid_wrong:"手机号码应为11位数字",
		login_cmAddress_wrong:"请填写地址",
		login_birth_wrong:"请选择出生日期",
		login_cmCity_wrong:"请选择城市",
		login_cmZip_wrong:"请填写邮编",
		login_cmZip_valid_wrong:"您填写的邮编格式不正确",
		login_modify_mobile_wrong:"手机号码应为11位数字",
		login_modify_username_wrong:"请填写用户名"
	};
  //输入验证不为空
  function vaialK(id,wrong,msg){
 		if($("#"+id).val()!=""){
 			login_wrongCucccess(wrong);
 		}else{
 			wrongInfo(wrong,msg);
 		}
  }
    function vaialnoteK(id,wrong,msg){
    var modify_iscar=$('input[name="modify_iscar"]:checked').attr("value");
   // alert(modify_iscar);
	    if(modify_iscar=="1"){	    
	 		if($("#"+id).val()!=""){  
	 			login_wrongCucccess(wrong);
	  			$("#"+wrong).attr("class","note");
				$("#"+wrong).siblings('.tixing').show();
				$("#"+wrong).removeAttr("style");
	 		}else{
	 			wrongInfo(wrong,msg);
	 			$("#"+wrong).attr("class","wrong");
				$("#"+wrong).siblings('.tixing').hide();
	 		}
	 	}
  }
  function vaialQ(id,wrong){
  	if($("#"+id).val()==$('#zpassword').val()){
  			login_wrongCucccess(wrong);
  	}else{
  		wrongInfo(wrong,"您两次输入的密码不一致。");
  	}
  }
  function vaialModifyQ(id,wrong){
  	if($("#"+id).val()==$('#modify_password').val()&&$("#"+id).val()!=""){
		login_wrongCucccess(wrong);
		//istrue=false;
  	}else{
  		wrongInfo(wrong,"您两次输入的密码不一致。");
  		istrue=false;
  	}
  }
   //验证电话
  function vaialP(id,wrong){
  		if($("#"+id).val()!=""){
  			if(validationPhone($("#"+id).val())){
  				login_wrongCucccess(wrong);
  				}else{
  					wrongInfo(wrong,login_wrongObj.login_cdMobile_valid_wrong);
  				}
  			
  		}else{
  			wrongInfo(wrong,login_wrongObj.login_cdMobile_wrong);
  		}

  }
  //验证邮箱
  function vaialE(id,wrong){
  		if($("#"+id).val()!=""){
  			if(validationEmail($("#"+id).val())){
  				login_wrongCucccess(wrong);
  				}else{
  					wrongInfo(wrong,login_wrongObj.login_email_valid_wrong);
  				}
  			
  		}else{
  			wrongInfo(wrong,login_wrongObj.login_email_wrong);
  		}
  }
    //验证密码
  function vaialPass(id,wrong){
  		if($("#"+id).val()!=""){
  			if(validationPwd($("#"+id).val())){
  				login_wrongCucccess(wrong);
  				}else{
  					wrongInfo(wrong,login_wrongObj.login_password_valid_wrong);
  				}
  			
  		}else{
  			wrongInfo(wrong,login_wrongObj.login_password_wrong);
  		}
  
  	}

  	 //验证邮箱
  function vaialEz(id,wrong){
  		if($("#"+id).val()!=""){
  			if(validationEmail($("#"+id).val())){
  				login_wrongCucccess(wrong);
  					$("#"+wrong).attr("class","note");
					$("#"+wrong).siblings('.tixing').show();
					$("#"+wrong).removeAttr("style");
  				}else{
  					wrongInfo(wrong,login_wrongObj.login_email_valid_wrong);
  					$("#"+wrong).attr("class","wrong");
					$("#"+wrong).siblings('.tixing').hide();
  				}
  			
  		}else{
  			wrongInfo(wrong,login_wrongObj.login_email_wrong);
  			$("#"+wrong).attr("class","wrong");
			$("#"+wrong).siblings('.tixing').hide();
  		}
  }

  //验证密码
  function vaialPassw(id,wrong){
  		if($("#"+id).val()!=""){
  			if(validationPwd($("#"+id).val())){
  				login_wrongCucccess(wrong);
  					$("#"+wrong).attr("class","note");
					$("#"+wrong).siblings('.tixing').show();
					$("#"+wrong).removeAttr("style");
  				}else{
  					wrongInfo(wrong,login_wrongObj.login_password_valid_wrong);
  					$("#"+wrong).attr("class","wrong");
					$("#"+wrong).siblings('.tixing').hide();
  				}
  			
  		}else{
  			wrongInfo(wrong,login_wrongObj.login_password_wrong);
  			$("#"+wrong).attr("class","wrong");
			$("#"+wrong).siblings('.tixing').hide();
  		}
  
  	}
  	function vaialEZip(id,wrong){  //验证邮编
  		if($("#"+id).val()!=""){
  			if(isZipCode($("#"+id).val())){
  				login_wrongCucccess(wrong);
  				}else{
  					wrongInfo(wrong,login_wrongObj.login_cmZip_valid_wrong);
  				}
  			
  		}else{
  			wrongInfo(wrong,login_wrongObj.login_cmZip_wrong);
  		}			
 	}

  	 // $("#modify_password").siblings('.tixing').hide();
  	
 	var val = "<s:property value='#session.AUDI_WEB_USER.gender'/>";  //称谓回显
	$("input[name=modify_gender][value="+val+"]").attr("checked",'checked');
	var val = "<s:property value='#session.AUDI_WEB_USER.isincept'/>";  //是否接受信息回显
	$("input[name=modify_isincept][value="+val+"]").attr("checked",'checked');
	
	var val_islicense = "<s:property value='#session.AUDI_WEB_USER.islicense'/>";  //是否拥有驾照
	if(val_islicense!="" && val_islicense=="1"){
		$("input[name=modify_islicense][value="+val_islicense+"]").attr("checked",'checked');
		$($('input[name="modify_islicense"][value="1"]')).parents("tr").next().find(".shade").hide();
	}
	var val_driverage = "<s:property value='#session.AUDI_WEB_USER.driverage'/>";
	$("#modify_driverage").val(val_driverage);  //驾龄回显
	
	//if(val_islicense=='0'){$('#jialing').hide();}//如果没有驾照 则驾龄菜单隐藏  
	
	var val_intent = "<s:property value='#session.AUDI_WEB_USER.intent'/>";  //购车意向回显	
	if(val_intent!="" && val_intent=="1"){
		$("input[name=modify_intent][value="+val_intent+"]").attr("checked",'checked');
		$($('input[name="modify_intent"][value="1"]')).parents("tr").next().find(".shade").hide();
	}
	//if(val_intent=='0'){$('#yusuan').hide();$('#goucheshijian').hide();$('#jingxiaoshang').hide();$('#jingxiaoshangs').hide();$('#chexing').hide();$('#chexi').hide();}
	
	var val_iscar = "<s:property value='#session.AUDI_WEB_USER.iscar'/>";  //目前车辆状况回显
	//if(val_iscar=='0'){$('#hide_footnum').hide();$('#buytime_show').hide();$('#model_show').hide();$('#brands_show').hide();}
	if(val_iscar!="" && val_iscar=="1"){
		$("input[name=modify_iscar][value="+val_iscar+"]").attr("checked",'checked');
		$($('input[name="modify_iscar"][value="1"]')).parents("tr").next().find(".shade").hide();
	}
	
	var allYearOption="";
	var sessionY='<s:property value='#session.AUDI_WEB_USER.birthdayy'/>'; //生日回显
	var sessionM='<s:property value='#session.AUDI_WEB_USER.birthdaym'/>';
	var sessionD='<s:property value='#session.AUDI_WEB_USER.birthdayd'/>';
	var allYearOption="<option value='1965'>1965以前</option>";  //mark
	for(var i=1966;i<2005;i++){
		if(sessionY==''+i){
			allYearOption+="<option value='"+i+"' selected>"+i+"</option>";		
		}else{
			allYearOption+="<option value='"+i+"'>"+i+"</option>";	
		}
	}
	$("#modify_birthdayy").append(allYearOption);
	for(var i=1;i<13;i++){
		if((''+i)==sessionM){
			$("#modify_birthdaym").append("<option value='"+i+"' selected>"+i+"</option>");
		}else{
			$("#modify_birthdaym").append("<option value='"+i+"'>"+i+"</option>");
		}
		if(sessionY!='' && ''!=sessionM){
			setDay('modify_birthdayy','modify_birthdaym','modify_birthdayd');
			$("#modify_birthdayd").val(sessionD);
		}
	}
	
	//车系车型
	var val_intentcars = "<s:property value='#session.AUDI_WEB_USER.intentcars'/>";			
	var val_intentmodels = "<s:property value='#session.AUDI_WEB_USER.intentmodels'/>";			
	initauto('modify_intentcars', val_intentcars);
	change_autos('modify_intentmodels',val_intentcars,val_intentmodels);
	
	//经销商省市
	var val_dealerProvince = "<s:property value='#session.AUDI_WEB_USER.dealerProvince'/>";	
	var val_dealerCity = "<s:property value='#session.AUDI_WEB_USER.dealerCity'/>";	
	var val_intentdealer = "<s:property value='#session.AUDI_WEB_USER.intentdealer'/>";	
	initdealerprovince('modify_dealerProvince',val_dealerProvince);
	change_dealercitys('modify_dealerCity',val_dealerProvince,val_dealerCity);
	change_dealers('modify_intentdealer',val_dealerCity,val_intentdealer);
	
	//计划购车时间回显
	var val_planbuytime = "<s:property value='#session.AUDI_WEB_USER.planbuytime'/>";	
	$("#modify_planbuytime").val(val_planbuytime);
	 var val_buybudget = "<s:property value='#session.AUDI_WEB_USER.buybudget'/>";	
	$("#modify_buybudget").val(val_buybudget);
	
	//省市
	var valp = "<s:property value='#session.AUDI_WEB_USER.province'/>";
	var valc = "<s:property value='#session.AUDI_WEB_USER.city'/>";
	if(valp!=''){
		initprovince('modify_province', valp);
	}else{
		initprovince('modify_province','');
	}
	change_citys('modify_city', valp,valc);
	
	//车辆品牌
	var valb = "<s:property value='#session.AUDI_WEB_USER.brand'/>";
	var valm = "<s:property value='#session.AUDI_WEB_USER.model'/>";
	initbrand('modify_brand', valb);
  	change_brands('modify_model',valb,valm);
  	
  	//购车时间
  	var valy = "<s:property value='#session.AUDI_WEB_USER.buytimeyear'/>";
  	var valym = "<s:property value='#session.AUDI_WEB_USER.buytimemonth'/>";
	$("#modify_buytimeyear").append("<option value=''>请选择</option>");
	for(var i=2001;i<2014;i++){
		$("#modify_buytimeyear").append("<option value='"+i+"'>"+i+"</option>");
	}

	$("#modify_buytimemonth").append("<option value=''>请选择</option>");
	for(var i=1;i<13;i++){
		$("#modify_buytimemonth").append("<option value="+i+">"+i+"</option>");
	}
	$("#modify_buytimeyear").val(valy);  //购车时间回显
	$("#modify_buytimemonth").val(valym);
	
	//密码回显 
	//var l_password=$("#login_password").val();
	//var ll=document.getElementById("login_password");	
	//var l_password;
  	
  
 	 var modify_allField=[    // 所有字段
		{modify_email:"cm.email"},  //邮箱
		{modify_gender:"cm.gender",type:"radio"},//性别
		{modify_password:"cm.password"},  //姓名
		{modify_username:"cm.username"},  //姓名
		{modify_mobile:"cm.mobile"},//手机号码
		{modify_birthdayy:"cm.birthdayy"},//出生日期年
		{modify_birthdaym:"cm.birthdaym"},//出生日期年
		{modify_birthdayd:"cm.birthdayd"},//出生日期年				
		{modify_province:"cm.province"},//所在省
		{modify_address:"cm.address"},//地址
		{modify_city:"cm.city"},//所在市
		{modify_postcode:"cm.postcode"},//邮编
		{modify_islicense:"cm.islicense",type:"radio"},//是否有驾照
		{modify_driverage:"cm.driverage"},//有效驾龄
		{modify_intent:"cm.intent",type:"radio"},//购车意向					
		{modify_intentcars:"cm.intentcars"},//意向车系
		{modify_intentmodels:"cm.intentmodels"},//意向车型
		{modify_dealerProvince:"cm.dealerProvince"},//经销商所在省
		{modify_dealerCity:"cm.dealerCity"},	//经销商所在市		
		{modify_intentdealer:"cm.intentdealer"},	//经销商			
		{modify_planbuytime:"cm.planbuytime"},	//计划购车时间范围		
		{modify_buybudget:"cm.buybudget"},	//购车预算		
		{modify_iscar:"cm.iscar",type:"radio"},	//目前拥有车辆状况		
		{modify_brand:"cm.brand"},	//车辆品牌		
		{modify_model:"cm.model"},	//车辆型号	
		{modify_buytimeyear:"cm.buytimeyear"},	//购车时间年		
		{modify_buytimemonth:"cm.buytimemonth"},//购车时间月	
		{modify_footnum:"cm.footnum"},	//车架号		
		{modify_isincept:"cm.isincept",type:"radio"},	//是否接受相关资讯	
	];
	
	//提交的信息拼接
	var submitVals="";
			
	function modify_submit(){
		submitVals=""; //每次点击提交都清空拼接信息
		var keys = [];
		//所有的key
		for(var fi=0;fi<modify_allField.length;fi++){
			var obj=modify_allField[fi];
			for (var key in obj){
			  keys.push(key);
			  if(obj.type || obj.type=="radio"){
					var realdValue=$('input[name="'+key+'"]:checked').attr("value");
					//真实的value
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
					if(submitVals==""){
						submitVals+=obj[key]+"="+realdValue;
					}else{
						submitVals+="&"+obj[key]+"="+realdValue;
					}
			  	}
			}
		}	
		var id="<s:property value='#session.AUDI_WEB_USER.userid'/>";
		submitVals+="&userid="+id;
		//alert(submitVals);
		var modify_username=$("#modify_username").val();
		var modify_iscar=$('input[name="modify_iscar"]:checked').attr("value");
		var modify_footnum=$("#modify_footnum").val();
		if(modify_username!="" && modify_iscar=="1"){  //判断用户名或车架号是否为空
			if(modify_footnum!=""){
				$.post("login_update.action",submitVals,function(data){     //个人信息修改提交
					if(data.success){						
						$('.xiugai_xiu').hide();
						$('.xiugai_cg').show();
						$('.xiugai_mid').css('height','327');
						$('.xiugai_mid').css('top','93px');							
					}
	  			});
			}
		}else if(modify_username!=""&&modify_iscar=="0"){
			$.post("login_update.action",submitVals,function(data){     //修改提交
				if(data.success){
					$('.xiugai_xiu').hide();
					$('.xiugai_cg').show();
					$('.xiugai_mid').css('height','327');
					$('.xiugai_mid').css('top','93px');
				}				
	  		});
  		}
	}
	
	function modify_reload(){  //每次点击‘X’的时候都刷新页面
		location.reload(true);
	}



  function rsubmit(obj){
  		vaialEz('zemail','zemail_wrong');
  		vaialPassw('zpassword','zpassword_wrong');
  		vaialQ('rpassword','rpassword_wrong');
  		vaialK('username','username_wrong',login_wrongObj.login_username_wrong);
			if(istrue){
				var rvalue=$('input[name="risincept"]:checked').attr("subval");
				$("#user_isincept").val(rvalue);
				$.post("login_add.action",$("#"+obj.id).serialize(),function(data){
			  		if(data.errorCode==0){
			  			$('.zhuce_sucss').show().siblings('div').hide();
						$('.zhuce_mid').css('height','321px');
						gotoEmail();
			  		}else if(data.errorCode==1){
			  			wrongInfo('zemail_wrong','抱歉，此邮箱已被注册。');
						$("#zemail_wrong").attr("class","wrong");
						$("#zemail_wrong").siblings('.tixing').hide();
			  		}
		  		});
				  //obj.submit();
				 
			}
		 } 
		 
		 
		 
		 function password_submit() {   //个人信息的密码修改   保存  
			
			var password_id="<s:property value='#session.AUDI_WEB_USER.userid'/>";
			var modify_password=$("#modify_password").val();	
			vaialK('modify_password','modify_password_wrong',login_wrongObj.login_password_wrong);	//为空判断
			vaialPassw('modify_password','modify_password_wrong'); //密码输入格式是否正确判断
			istrue=false;
			vaialModifyQ('con_password','conpassword_wrong');   //两次密码是否一致判断
						
			if(istrue){
				//alert("dddd"+istrue);
			 	$.post("login_modifyPassword.action","password="+modify_password+"&userid="+password_id,function(data){
			 		if(data.success){
			 	//	location.reload(true);
			 		
			 		$('.xiugai_xiu').hide();
					$('.xiugai_cg').show();
					$('.xiugai_mid').css('height','327');
					$('.xiugai_mid').css('top','93px');	
					$("#modify_password").val('');
			 		$("#con_password").val('');
			 		//	$(".js_password").show();
					//	$(".js_w").hide();
					}
			 	});
			 }else{
				//break;
			 }
		 }
	 
		 function userLogout(){
			$.post("login_logout.action","",function(data){
		  		location.href="homepage.action";
	  		});
		 }
		 function gotoEmail(){
			var gotoEmail= $("#gotoemail_a");
			gotoEmail.attr("href",'http://mail.'+$("#zemail").val().substr($("#zemail").val().lastIndexOf('@')+1));
		 }

			 //忘记密码，请求后台发密码重置邮件，成功后，返回成功提示 
			 function forgetpassword(){
					//邮箱
					var yx=$("#youxiang").val()+"";
					var isValid =true;
					if(isEmpty(yx)){
						wrongInfo("youxiang_wrong","请填写注册邮箱");
						isValid=false;
					}else if(!validationEmail(yx)){
						wrongInfo("youxiang_wrong","您填写的电子邮箱格式不正确");
						isValid=false;
					}
					if(isValid){
						login_wrongCucccess("youxiang_wrong");
						$.post("user_resetpwd.action","email="+yx,function(data){
					  		if(data.errorCode==0){
					  			$('.login_cg').show().siblings('div').hide();
								resetpwdEmail(yx);
					  		}else if(data.errorCode==1){
					  			wrongInfo('youxiang_wrong','该邮箱不存在');
					  		}
				  		});
						 
					}
				 }
				 function validForgetValid(){
					//获取邮箱的值
				 	if(!isEmpty($("#youxiang").val()) && !validationEmail($("#youxiang").val())){
						wrongInfo("youxiang_wrong","您填写的电子邮箱格式不正确");
					}else{
						login_wrongCucccess("youxiang_wrong");
					}
				 }
				 //邮箱
				  function resetpwdEmail(email){
					var gotoEmail= $("#resetPwd_a");
					gotoEmail.attr("href",'http://mail.'+email.substr(email.lastIndexOf('@')+1));
				 }
				 //重置密码提交
				 function submitResetPwd(){
					var isValPwd=true;
					if($("#newpassword").val()==""){
						wrongInfo("newpassword_wrong","请填写密码");
						$("#newpassword_wrong").attr("class","wrong");
						$("#newpassword_wrong").siblings('.tixing').hide();
						isValPwd=false;
						return;
					}
					if(validationPwd($("#newpassword").val())){
						login_wrongCucccess_zhongzhi();
						
					}else{
						wrongInfo("newpassword_wrong","您填写的密码格式不正确");
						$("#newpassword_wrong").attr("class","wrong");
						$("#newpassword_wrong").siblings('.tixing').hide();
						isValPwd=false;
						return;
					}
					
					if($("#newpasswords").val()==$("#newpassword").val()){
						login_wrongCucccess("newpasswords_wrong");
					}else{
						wrongInfo("newpasswords_wrong","您两次输入的密码不一致");
						isValPwd=false;
						return;
					}
					$.post("user_resetPsdTo.action","password="+$("#newpassword").val(),function(data){
						if(data.errorCode==0){
							$('.login_zzcg').show().siblings('div').hide();
						}else if(data.errorCode==1){
							wrongInfo('newpassword_wrong','重置失败请稍候重试');
						}
					});
					//$('.login_zzcg').show().siblings('div').hide();
				 }
				 //修改个人资料的密码
				 function updatePersonInfoPwd(obj){
					$(obj).hide();
					$(".js_w").show();
					$("#modify_password").removeAttr("readonly").val('');//解除修改密码的只读属性
					$("#con_password").removeAttr("readonly").val('');					
				 }
				 function password_cancel(){
					$(".js_password").show();
					$(".js_w").hide();
					$("#modify_password").attr("readonly","readonly").val('000000');
					$("#con_password").attr("readonly","readonly").val('000000');
				 }
				 function xiugai_chongzhi_shuju(){  //重填时间
				 	$('.xiugai_mid input').val('');
				 	$("#modify_password").attr("readonly","readonly").val('000000');//点击重填时恢复密码只读属性和默认文本
					$("#con_password").attr("readonly","readonly").val('000000');
				 	var selectArr=$('.xiugai_mid select');
					
				 	for(var i=0;i<selectArr.length;i++){
				 		var obj=selectArr[i];
				 		$("#"+obj.id).val('');
				 		$('#'+obj.id).siblings('.caption').text('请选择');
				 	}
				 }
				 //是否记住密码
				 if('1'==getCookie("_remember")){
					$("keeppassword").attr("checked",getCookie("_remember"));
				 }
</script>