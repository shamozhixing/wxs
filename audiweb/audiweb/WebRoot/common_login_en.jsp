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
					<li class="none"><a href="javascript:;" id='usezhuce'>Register</a></li>
					 <li><a href="javascript:;" id='usedenglu'>Log-in</a></li>
			               <li >
								<span class='note'></span>
								<span class='li_note'>login/register“My audi account”,browse audi's official website</span>
							</li>
	             	</ul>
	             	</s:if><s:else>
	             	
			        	<ul>
			                <li class="none"><a href="javascript:;" onclick="userLogout()">Log out</a></li>
			                <li><a href="javascript:;"  id="amendinfo">Modify personal information</a></li>
			                <li>welcom<s:property value="#session.AUDI_WEB_USER.username"/>！</li>
			             </ul>
			          </s:else>
            
             <div class="clear"></div>
 </div> 
 	