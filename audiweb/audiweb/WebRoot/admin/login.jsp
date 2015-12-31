<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = path+"/";
if(request.getSession().getAttribute(com.oemp.frame.util.CmsConstants.ADMIN_USER)!=null){
	response.sendRedirect(basePath+"admin/index.jsp");
}
%>
<!DOCTYPE html>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   	<title>OEMP</title>
    <link rel="stylesheet" type="text/css" href="resources/login.css">
    <link rel="stylesheet" type="text/css" href="resources/css/ext-all-gray.css">
	<link rel="stylesheet" type="text/css" href="resources/icon.css">
	<link rel="stylesheet" type="text/css" href="resources/formStyle.css">
	<script type="text/javascript" src="lib/js/ext/ext-all.js"></script>
	<script type="text/javascript" src="lib/js/ext/ext-lang-zh_CN.js"></script>
	<script type="text/javascript" src="lib/js/common.js"></script>
   	<script type="text/javascript">
			function subForm()
			{
				if(Ext.getDom('cmuName').value==""){
					Ext.Msg.alert("<s:text name='util.promptTitle'/>","请输入用户名");
					return false;
				}
				if(Ext.getDom('cmuPassword').value==""){
					Ext.Msg.alert("<s:text name='util.promptTitle'/>","请输入密码");
					return false;
				}
				Ext.getBody().mask("<s:text name='admin.system.user.logining'/>");
				Ext.Ajax.request({
					url : 'login.action',
					params:{ 
			      	  cmuName:Ext.getDom('cmuName').value,
			      	  cmuPassword:Ext.getDom('cmuPassword').value
			        }, 
					method : 'POST',
					success : function(response, action) {
			        	var retData = Ext.decode(response.responseText);
			        	var resoultMsg=retData.resoultMsg;
						if(retData.success)
						{
							location.href = "index.jsp";
						}else{
							Ext.Msg.alert("<s:text name='util.promptTitle'/>",resoultMsg);
							Ext.getBody().unmask();
						}
					},
					failure : function(resp, action) {
						var retData = Ext.decode(response.responseText);
						Ext.Msg.alert("admin.system.user.logining",retData.resoultMsg);
					}
				});
			}
		</script>
  </head>
  <body>
    <div id="cont">   
        <div class="cont_global">
			<div class="cont_left">

				
				<div class="logo">
					<img src="resources/images/logo.png" alt=""/>
				</div>
				<div class="login">
					<form method="post" id="loginForm" onsubmit="return false">
						<dl class="GLogin">
							<dd>用户名<input type="text"  name="cmuName" id="cmuName" class="idLogin"/></dd>
							<dd><s:text name='admin.system.user.cmuPassword'/><input type="password" name="cmuPassword" id="cmuPassword" class="passLogin"/></dd>
								<dd><input type="submit" class="submit"value="" onclick="subForm()"/></dd>
						</dl>
					</form>
				</div>
			</div>
			
			<div class="cont_right">
								<div class="text">
					<ul>
						<li><p style="font-family:Aparajita; font-size:26px; font-weight:bold; color:#4f5e68;">Cloud</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">enabled</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:26px; font-weight:Regular; color:#4f5e68;">Web</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">engagement</p>
						&nbsp <p style="font-family:Aparajita; font-size:34px; font-weight:bold; color:#4f5e68;">platform</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:36px; font-weight:Regular; color:#4f5e68;">Real-time</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">personalization</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Integrated</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">content</p>
						&nbsp <p style="font-family:Aparajita; font-size:42px; font-weight:Regular; color:#4f5e68;">management</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Attention,</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Interest,</p>
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Search,</p>
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Action,</p> 
						&nbsp <p style="font-family:Aparajita; font-size:26px; font-weight:Regular; color:#4f5e68;">Share</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:36px; font-weight:Regular; color:#4f5e68;">Online</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">loyalty</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:26px; font-weight:bold; color:#4f5e68;">Customer</p> 
						&nbsp <p style="font-family:Aparajita; font-size:26px; font-weight:bold; color:#4f5e68;">service</p>
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">integration</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:32px; font-weight:Regular; color:#4f5e68;">CRM</p> 
						&nbsp <p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">integration</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Mobility</p></li>
					</ul>
					<ul>
						<li><p style="font-family:Aparajita; font-size:22px; font-weight:Regular; color:#4f5e68;">Multi</p> 
						&nbsp <p style="font-family:Aparajita; font-size:40px; font-weight:Regular; color:#4f5e68;">sites</p>
						&nbsp <p style="font-family:Aparajita; font-size:26px; font-weight:bold; color:#4f5e68;">support</p></li>
					</ul>
				</div>
			</div>
        </div>
    </div>
    <!--背景图片全屏-->
    <div id="bg">
        <div>
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <img src="resources/images/bg.jpg" alt=""/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    
    
  </body>
</html>
