<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.oemp.audi.bean.TbRegUser"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript" src='js/login.js'></script>
<div class="loading" style="width:53px; height:53px;position:absolute;top:40%;left:50%;
	margin-left:-26px;z-index:99999;display:block;"><img src="images/spinner-v3.gif">
</div>
<div class="userinfo">
     
				<s:if test="#session.AUDI_WEB_USER==null">
					<ul>
					<li class="none"><a href="javascript:;" id='usezhuce'>注册</a></li>
					 <li><a href="javascript:;" id='usedenglu'>登录</a></li>
			               <li >
								<span class='note'></span>
								<span class='li_note'>登录/注册“我的奥迪账户”，畅游奥迪官网</span>
							</li>
	             	</ul>
	             	</s:if><s:else>
	             	
			        	<ul>
			                <li class="none"><a href="javascript:;" onclick="userLogout()">退出登录</a></li>
			                <li><a href="javascript:;"  id="amendinfo">修改个人资料</a></li>
			                <li>您好<s:property value="#session.AUDI_WEB_USER.username"/>！</li>
			             </ul>
			          </s:else>
            
             <div class="clear"></div>
 </div> 
 	