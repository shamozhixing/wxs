<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@include file="../../common/taglibs.jsp" %>
(function(){
	//我的工作台
	function workbenchPanel(){
		var workForm= Ext.create('Ext.form.Panel',{
				border:false,
				region:'center',
				//.bodyStyle:{background:'transparent'},
				layout:{ 
					type: 'vbox',
       				align: 'left'
				},
				defaults:{
					style:{fontSize:'12px',border:'0px solid red'}
					,margin:'10 0 0 10'
				},
				items:[
					{xtype:'label',text:"<s:text name='admin.system.user.currentLoginUser'/>:<%=sessionLoginUser.getCmuName()%>"},
					{xtype:'label',text :"<s:text name='admin.system.user.msg.modifyPwd'/>"/*"修改用户密码"*/,name:'updatePwd',style:{textDecoration: 'underline',color:'blue',cursor: 'pointer'},
					listeners:{
						click: {
					            element: 'el',
					            fn: function(v,el,item,index,e,eOption){
					            	 mkWindow("<s:text name='admin.system.user.msg.modifyPwd'/>"/*修改密码*/,[modifyUserPwd()]); //修改密码
					            }
					        }
				        }
					},
					{xtype:'label',text :"清除历史记录"/*清除历史记录*/,style:{textDecoration: 'underline',color:'blue',cursor: 'pointer'},
					listeners:{
						click: {
					            element: 'el',
					            fn: function(v,el,item,index,e,eOption){
							       Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='admin.system.user.confirmCancelLocalHistory'/>"/*你确定要清除历史记录吗?*/,function(btn){
									if(btn=="yes"){
										var saveCacheData = window.localStorage? localStorage.getItem("<%=sessionLoginUser.getCmuName()%>saveCacheData"): Cookie.read("<%=sessionLoginUser.getCmuName()%>saveCacheData");	
										//alert("<%=sessionLoginUser.getCmuName()%>saveCacheData:"+saveCacheData);
										localStorage.removeItem("<%=sessionLoginUser.getCmuName()%>saveCacheData");
										waitLoadMask.show();
										Ext.Ajax.request({
											url : 'user_detail.action',
											success : function(resp) {
												waitLoadMask.hide();
											}});
									}
								});
					            }
					        }
				        }
					},
					{xtype:'label',text :"<s:text name='admin.system.user.cancel'/>"/*注销用户*/,style:{textDecoration: 'underline',color:'blue',cursor: 'pointer'},
					listeners:{
						click: {
					            element: 'el',
					            fn: function(v,el,item,index,e,eOption){
							       Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='admin.system.user.confirmCancelUser'/>"/*你确定要注销吗?*/,function(btn){
									if(btn=="yes"){
										//注销登录信息
										Ext.Ajax.request( {
											type: 'ajax',
									        url : 'user_cancelLogin.action',
									        method : 'POST',
											success : function(response, opts) {
												 location.href = "login.jsp";
											},
											failure : function(response, opts) {
												Ext.Msg.alert("<s:text name='util.fail'/>"/*失败*/,"<s:text name='util.hanldFail'/>"/*操作失败!*/);
											}
										})
									}
								});
					            }
					        }
				        }
					}
				]
			});
		return workForm;
	}
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
	/*我的工作台 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='admin.system.user.workbenchSpace'/>",/*我的工作台*/
	    border:false,
	    layout:'border',
	    bodyStyle:{background:'transparent'},
	   	items:[workbenchPanel()]//TabPanel中的标签页
    }); 
})();