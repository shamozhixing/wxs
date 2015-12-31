<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
//用户登录
function loginForm(){
	var loginFormPanel = Ext.create('Ext.form.Panel',{
		border:false,
		bodyStyle:{background:'transparent'},
		layout:{ 
			type:'table' // 表格布局
			,columns:1 // 只有1列
			,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
			,tdAttrs:{align:'left'}
		},
		defaults:{
			labelWidth:60,
			labelAlign:'right',
			width:240
		},
		items : [
		    {xtype:'textfield',fieldLabel : "<s:text name='admin.system.user.cmuName'/>"/**用户名*/,name:'cmuName',allowBlank : false,blankText:"<s:text name='admin.system.user.loginInputUserName'/>"/**请输入用户名*/,validateOnBlur:false},
		    {xtype:'textfield',inputType: 'password',fieldLabel : "<s:text name='admin.system.user.cmuPassword'/>"/**用户密码*/,name:'cmuPassword',blankText:"<s:text name='admin.system.user.loginInputPwd'/>"/**'请输入密码'*/,allowBlank : false,validateOnBlur:false,onpaste:false
			,listeners:{
					afterrender:function(component,eOpts){
						cleanEveal(component);
					}
				}
		   },
		   {
		   	xtype:'panel',
		   	bodyStyle:{background:'transparent'},
		   	border:false,
		   	layout:{ 
				type:'table' // 表格布局
				,columns:3 // 只有1列
				,tableAttrs: {style: {align:'center',margin:'0 0 10 0'}}
				,tdAttrs:{align:'left',style:{}}
			},
		   	items:[
		   	   {xtype:'textfield',fieldLabel : "<s:text name='admin.system.user.loginverifyCode'/>"/**验证码:*/,name:'verifyCode',allowBlank : false,blankText:"<s:text name='admin.system.user.loginInputverifyCode'/>"/**'请输入验证码'*/,validateOnBlur:false,labelAlign:'right',labelWidth:60,width:130},
			   {xtype:'image',src:'login/VerificationCode.jsp'/*'verifyCode.action'*/,width:60,height:20,margin:'5 0 10 5',id:"VerificationCode",name:'VerificationCode',style:{cursor: 'pointer'},
				listeners:{
					click: {
				            element: 'el',
				            fn: function(v,el,item,index,e,eOption){
				            	Ext.getCmp('VerificationCode').setSrc('login/VerificationCode.jsp');
				            }
				        }
			        }},
				{xtype:'label',text :"<s:text name='admin.system.user.loginResetverifyCode'/>"/**看不清*/,style:{textDecoration: 'underline',color:'blue',cursor: 'pointer',fontSize:12},margin:'0 0 0 5',
				listeners:{
					click: {
				            element: 'el',
				            fn: function(v,el,item,index,e,eOption){
				            	Ext.getCmp('VerificationCode').setSrc('login/VerificationCode.jsp');
				            }
				        }
			        }
				}
		    ]
		   }
		   ]
	});
	return loginFormPanel;
	}
		
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
	    border:false,
	    width:320,
	    heigth:120,
	    bodyStyle:{background:'transparent'},
	   	items:[loginForm()]
    }); 
})();