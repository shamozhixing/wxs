<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="common/taglibs.jsp" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>OEMP</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<link rel="stylesheet" type="text/css"
			href="resources/css/ext-all-gray.css">
		<link rel="stylesheet" type="text/css" href="resources/icon.css">
		<link rel="stylesheet" type="text/css" href="resources/formStyle.css">
		<script type="text/javascript" src="lib/js/ext/ext-all.js"></script>
		<script type="text/javascript" src="lib/js/ext/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="lib/js/common.js"></script>
		<script type="text/javascript" src="lib/js/replydel.js"></script>
		
		<script type="text/javascript" src="lib/js/dictselect.js"></script>
		<script type="text/javascript" src="lib/js/tb_dealer.js"></script>
		<script type="text/javascript" src="lib/js/dict_autos.js"></script>
		<script type="text/javascript" src="lib/js/dict_brands.js"></script>
		<script type="text/javascript" src="lib/js/dict_citys.js"></script>
		
		<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript">
			Ext.onReady(function() {
				initFrame('<%=sessionLoginUser.getCmuName()%>')
			})
			//修改密码
		function modifyUserPwd(){
		var modifyUserForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table' // 表格布局
				,columns:1 // 只有1列
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:300
			},
			items : [
			    {xtype:'hidden',fieldLabel : "<s:text name='admin.system.user.cmuName'/>"/*用户名*/,name:'cmuName',value:'<%=sessionLoginUser.getCmuName()%>'},
			     {xtype:'textfield',inputType: 'password',fieldLabel : "<s:text name='admin.system.user.oldPassword'/>"/*原始密码*/,name:'cmuOldPassword',allowBlank : false,
					listeners:{
						afterrender:function(component,eOpts){
							cleanEveal(component);
						}
					}},
			     {xtype:'textfield',inputType: 'password',fieldLabel : "<s:text name='admin.system.user.cmuPassword'/>"/*用户密码*/,name:'cmuPassword',allowBlank : false,onpaste:false,
			     validator:function(v) {
						var pwd=this.up('form').getForm();
						if(pwd.findField('cmuOldPassword').getValue()==v){
							return "<s:text name='admin.system.user.msg.pwdFit'/>";
						}
						return true;
					}
				,listeners:{
						afterrender:function(component,eOpts){
							cleanEveal(component);
						}
					}
			     },
			     {xtype:'textfield',inputType: 'password',fieldLabel : "<s:text name='admin.system.user.affirmCmuPassword'/>"/*确认密码*/,name:'affirmPassword',allowBlank : false,
			     	validator:function(v) {
						var pwd=this.up('form').getForm();
						if(pwd.findField('cmuPassword').getValue()!=v){
							return "<s:text name='admin.system.user.pwdDiffError'/>";
						}
						return true;
					}
				,listeners:{
						afterrender:function(component,eOpts){
							cleanEveal(component);
						}
					}
			     }]
		});
		
		//清除事件
		function cleanEveal(component)
		{
			var thisEl=Ext.getDom(component.getId());
			thisEl.onpaste=function(){return false};
			thisEl.oncontextmenu=function(){return false};
			thisEl.oncopy=function(){return false};
			thisEl.oncut=function(){return false};
		}
		
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:330,
			height:150,
			items:[modifyUserForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'user_resetPwd.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(form.getValues()),
						        	cmuOldPassword:form.findField('cmuOldPassword').getValue()
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
						        	//原始密码输入错误
									var isOldError= retData.isOldError;
						        	if(isOldError){
						        		Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,retData.msg);
						        	}
						        	else{
						        		Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,retData.msg);
						        		win.close();
						        	}
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
		});
	}
		</script>
	</head>
	<body>
	</body>
</html>

