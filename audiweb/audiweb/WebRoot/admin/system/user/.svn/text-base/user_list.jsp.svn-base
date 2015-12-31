<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*用户表Model */
	Ext.define('user_CmsUserModel',{
		extend:'Ext.data.Model',
		fields : [{name:'cmuId',type:'int'},
				  'cmuName',
				  'cmuPassword',
				  'cmuEmail',
				  'cmuMobile',
				  'cmuFullName',
				  'cmuCmroRoles',
				  'cmuAddtime',
				  'cmuAdduser',
				  'cmuIsAdmin'//是否超级管理员
				  ] // 对应用户表中的字段，建议全部写出
	});
	/*角色信息Model */
	Ext.define('user_CmsRoleModel',{
		extend:'Ext.data.Model',
		fields : ['cmroName','cmroDesc','cmroAddtime','cmroAdduser'] // 对应角色表中的字段，建议全部写出
	});
	/*用户表Store */
   var store_user = Ext.create('Ext.data.Store',{
		model:'user_CmsUserModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'user_query.action',//请求后台西信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	
	/*角色Store */
   var store_role_user = Ext.create('Ext.data.Store',{
		model:'user_CmsRoleModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'role_query.action',//请求后台西信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
   /*用户表Form*/
	function userMgrForm(){
	   return Ext.create('Ext.form.Panel', {
			region:'north',
			height:40,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:4,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:60,width:200
			},
			items:[{xtype:'textfield',fieldLabel:"<s:text name='admin.system.user.cmuName'/>",name:'cmuName'},/*用户名*/
					 {xtype:'textfield',fieldLabel:"<s:text name='admin.system.user.cmuEmail'/>",name:'cmuEmail'},/*电子邮箱*/
					  {xtype:'textfield',fieldLabel:"<s:text name='admin.system.user.cmuFullName'/>",name:'cmuFullName'},/*姓名*/
					  {xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
						,handler:function(){
							var form = this.up('form').getForm();
							var comb = this.up('form').child('combobox');
							var store = this.up('form').up('panel')
									.child('grid').getStore();
							var vals=form.getValues();
							var jsonObj=Ext.encode({
							  cmuName:vals.cmuName,
							  cmuEmail:vals.cmuEmail,
							  cmuFullName:vals.cmuFullName
							  });
							  store.getProxy().extraParams = {rows:jsonObj};
							  store.load();
						}
					}
					]
			});
	}
   /*用户信息列表*/
	function grid_user(){
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='admin.system.user.userInfLIst'/>",/*用户信息列表*/
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_user, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			//bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_role}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : "id",dataIndex : 'cmuId',flex:1},
			       {header : "<s:text name='admin.system.user.cmuName'/>"/*用户名*/,dataIndex : 'cmuName', flex:1}, 
			       {hidden:true,header : "<s:text name='admin.system.user.cmuPassword'/>"/*用户密码*/,dataIndex : 'cmuPassword'}, 
			       {header :"<s:text name='admin.system.user.cmuEmail'/>"/*电子邮箱*/,dataIndex : 'cmuEmail', flex:2}, 
			       {header :"<s:text name='admin.system.user.cmuMobile'/>"/*手机*/,dataIndex : 'cmuMobile', flex:1.5},
			       {header :"<s:text name='admin.system.user.cmuFullName'/>"/*姓名*/,dataIndex : 'cmuFullName', flex:1},
			       {header : "<s:text name='admin.system.user.cmuCmroRoles'/>"/*用户角色*/,dataIndex : 'cmuCmroRoles', flex:1}, 
			       {header :"<s:text name='admin.system.user.cmuAddtime'/>"/*添加时间*/,dataIndex : 'cmuAddtime', flex:2,
			       renderer: function(value){
				        return getDateTime(value);
				    }
			       }, 
			       {header :"<s:text name='admin.system.user.cmuAdduser'/>"/*添加人*/,dataIndex : 'cmuAdduser', flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					<s:if test="isMod()">
					mkWindow("<s:text name='admin.system.user.updateUserInf'/>"/*修改用户信息*/,[editUser(record,view)]); // 弹出修改角色框
					 </s:if>
				}
			},
			tbar : [
				<s:if test="isAdd()">
				{
				text : "<s:text name='util.gridNewly'/>",/*新增*/
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					mkWindow("<s:text name='admin.system.user.addUserBtn'/>"/*新增用户*/,[addUser(grid)]); // 弹出新增角色框 
				}
			}, '-', </s:if> <s:if test="isMod()">{
				text : "<s:text name='util.gridUpdate'/>",/*修改*/
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMin'/>"/*您最少要选择一条记录*/);
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionUpdateRows'/>"/*不能同时修改多条记录*/);
					} else {
						mkWindow("<s:text name='admin.system.user.updateUserInf'/>"/*修改用户信息*/,[editUser(secData[0],this.up('grid'))]); // 弹出修改角色框
					}
				}
			}, '-',   </s:if><s:if test="isMod()">{
				text : "<s:text name='admin.system.user.resetPassword'/>",/*重置密码*/
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMin'/>"/*您最少要选择一条记录*/);
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionUpdateRows'/>"/*不能同时修改多条记录*/);
					} else {
						mkWindow("<s:text name='admin.system.user.resetPassword'/>"/*重置密码*/,[reSetUserPwd(secData[0],this.up('grid'))]); //重置密码
					}
				}
			}, '-',</s:if><s:if test="isDel()"> {
				text :"<s:text name='util.gridDelete'/>",/*删除*/
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='admin.system.role.comfirMsgDel'/>"/*你确定要删除吗?*/,function(btn){
							if(btn=="yes"){
								//同时删除多条记录
								var jsonArr = [];
								Ext.Array.each(secData,function(record){
									jsonArr.push(record.data);
								});
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'user_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 已字符窜形式传到后台
									},
									success : function(response, opts) {
										 var retData = Ext.decode(response.responseText);
										 var valid= retData.success;
										 if(!valid){
										 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,retData.msg);
										 } else {
										 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,retData.msg);
										 	 grid.getStore().load(); // 重新加载数据
										 }
									},
									failure : function(response, opts) {
										Ext.Msg.alert("<s:text name='util.fail'/>"/*失败*/,"<s:text name='util.hanldFail'/>"/*操作失败!*/);
									}
								})
							}
						});
					} else {
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMinHandle'/>"/*请至少选择一行进行操作*/);
					}
				}
			},'-',
				  </s:if>{text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}]
		});
	}
	
	/* 添加用户 */
	function addUser(grid){
		var addUserForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table' // 表格布局
				,columns:1 // 只有1列
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:300
			},
			items : [
			    {fieldLabel : "<s:text name='admin.system.user.cmuName'/>"/*用户名*/,name:'cmuName',allowBlank : false},
			    {xtype:'textfield',inputType: 'password',fieldLabel : "<s:text name='admin.system.user.cmuPassword'/>"/*用户密码*/,name:'cmuPassword',allowBlank : false
				,listeners:{
						afterrender:function(component,eOpts){
							cleanEveal(component);
						}
					}},
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
			     },
			    {fieldLabel : "<s:text name='admin.system.user.cmuEmail'/>"/*EMAIL*/,name:'cmuEmail',allowBlank : false,
					validator : function(v) {
						var email = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(v);
						return (email == true)
								? true
								: "<s:text name='admin.system.user.emailError'/>"/*邮箱输入有误*/
					}
				},
			    {fieldLabel : "<s:text name='admin.system.user.cmuMobile'/>"/*手机*/,name:'cmuMobile',allowBlank : false,
				    validator : function(v) {
							var mobile = /^(13|15|18)+\d{9}$/.test(v);
							return (mobile == true)
									? true
									: "<s:text name='admin.system.user.mobileError'/>"/*手机输入有误*/
					}
				},
			    {fieldLabel : "<s:text name='admin.system.user.cmuFullName'/>"/*姓名*/,name:'cmuFullName',allowBlank : false},
			    {xtype:'combo',queryMode:'local',multiSelect:true,fieldLabel : "<s:text name='admin.system.user.cmuCmroRoles'/>"/*用户角色*/,name:'cmuCmroRoles',displayField:'cmroName',valueField:'cmroName',allowBlank : false,editable:false,store:store_role_user
				    ,listeners:{
				    	expand:function(combo,rec,index){
				    		var roles=combo.getValue().toString().split(',');
				    		var objs=[];
				    		//获取元素信息
				    		Ext.Array.each(roles,function(role){
				    			store_role_user.each(function(obj){
				    				if(role==obj.get('cmroName'))
				    				{
				    					objs.push(obj);
				    				}
				    			});
				    		});
				    		combo.select(objs);
				    	}
				    }
			    }//,
				,{xtype:'checkboxfield',name:'cmuIsAdmin',boxLabelAlign:'before',padding:'0 0 0 10',boxLabel:"<s:text name='admin.system.user.isSuperAdmin'/>:"/*'是否超级管理员'*/,inputValue :'1'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:330,
			height:280,
			items:[addUserForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					
					//是否是超级管理员
					var subValue=form.getValues();
					subValue.cmuCmroRoles=subValue.cmuCmroRoles.toString();
					subValue.cmuIsAdmin=(form.findField('cmuIsAdmin').getValue()==false)?0:subValue.cmuIsAdmin;
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'user_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(subValue)
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
									var isExists= retData.isExists;
						        	if(!isExists){
						        		funSuccess(response, opts,win,grid)
						        	}
						        	else{
						        		Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,retData.msg);
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
	
	/* 修改用户,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editUser(data,grid){
		//判断是否是超级用户
		var cmuIsAdmin=data.get('cmuIsAdmin')==1?true:false;
		var addUserForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table' // 表格布局
				,columns:1 // 只有1列
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:300
			},
			items : [
			    {fieldLabel : "id",name:'cmuId',value:data.get('cmuId'),hidden:true},
			    {fieldLabel : "cmuAdduser",name:'cmuAdduser',value:data.get('cmuAdduser'),hidden:true},
			    {fieldLabel : "<s:text name='admin.system.user.cmuName'/>"/*用户名*/,name:'cmuName',value:data.get('cmuName'),readOnly:true,fieldCls:'text-readonly'},
			    {fieldLabel : "copyCmuName",name:'copyCmuName',value:data.get('cmuName'),hidden:true},
			    {xtype:'hidden',fieldLabel : "<s:text name='admin.system.user.cmuPassword'/>"/*用户密码*/,name:'cmuPassword',value:data.get('cmuPassword')},
		    	{fieldLabel : "<s:text name='admin.system.user.cmuEmail'/>"/*EMAIL*/,name:'cmuEmail',value:data.get('cmuEmail'),allowBlank : false,
				validator : function(v) {
					var email = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(v);
					return (email == true)
							? true
							: "<s:text name='admin.system.user.emailError'/>"/*邮箱输入有误*/
				}
				},
			    {fieldLabel : "<s:text name='admin.system.user.cmuMobile'/>"/*手机*/,name:'cmuMobile',value:data.get('cmuMobile'),allowBlank : false,
				    validator : function(v) {
							var mobile = /^(13|15|18)+\d{9}$/.test(v);
							return (mobile == true)
									? true
									: "<s:text name='admin.system.user.mobileError'/>"/*手机输入有误*/
					}
				},
			    {fieldLabel : "<s:text name='admin.system.user.cmuFullName'/>"/*姓名*/,name:'cmuFullName',value:data.get('cmuFullName'),allowBlank : false},
			    {xtype:'combo',queryMode:'local',multiSelect:true,fieldLabel : "<s:text name='admin.system.user.cmuCmroRoles'/>"/*用户角色*/,name:'cmuCmroRoles',value:data.get('cmuCmroRoles'),displayField:'cmroName',valueField:'cmroName',allowBlank : false,editable:false,store:store_role_user
				    ,listeners:{
				    	expand:function(combo,rec,index){
				    		var roles=combo.getValue().toString().split(',');
				    		var objs=[];
				    		//获取元素信息
				    		Ext.Array.each(roles,function(role){
				    			store_role_user.each(function(obj){
				    				if(role==obj.get('cmroName'))
				    				{
				    					objs.push(obj);
				    				}
				    			});
				    		});
				    		combo.select(objs);
				    	}
				    }
			    }
				,{xtype:'checkboxfield',name:'cmuIsAdmin',boxLabelAlign:'before',padding:'0 0 0 10',boxLabel:"<s:text name='admin.system.user.isSuperAdmin'/>:"/*'是否超级管理员'*/,inputValue :'1',checked:cmuIsAdmin}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:330,
			height:210,
			items:[addUserForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
						//是否是超级管理员
					var subValue=form.getValues();
					subValue.cmuCmroRoles=subValue.cmuCmroRoles.toString();
					subValue.cmuIsAdmin=(form.findField('cmuIsAdmin').getValue()==false)?0:subValue.cmuIsAdmin;
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'user_modify.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(subValue)
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
									var isExists= retData.isExists;
						        	if(!isExists){
						        		funSuccess(response, opts,win,grid)
						        	}
						        	else{
						        		Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,retData.msg);
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
	/*重置用户密码,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function reSetUserPwd(data,grid)
	{
		var resSetUserForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table' // 表格布局
				,columns:1 // 只有1列
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:300
			},
			items : [
			    {fieldLabel : "<s:text name='admin.system.user.cmuName'/>"/*用户名*/,name:'cmuName',value:data.get('cmuName'),hidden:true},
			    {xtype:'textfield',inputType: 'password',fieldLabel : "<s:text name='admin.system.user.cmuPassword'/>"/*用户密码*/,name:'cmuPassword',allowBlank : false,listeners:{
						afterrender:function(component,eOpts){
							cleanEveal(component);
						}
					}},
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
			     }
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:330,
			height:100,
			items:[resSetUserForm], // 将表单面板加入该panel中
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
						        	rows:Ext.encode(form.getValues())
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
						        	Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,retData.msg);
						        	win.close();
						        	grid.getStore().load();
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
		});
	}
	//清除事件，在修改密码或重置密码的时候不能有粘贴、复制、右键、和剪切等事件
	function cleanEveal(component)
	{
		var thisEl=Ext.getDom(component.getId());
		thisEl.onpaste=function(){return false};
		thisEl.oncontextmenu=function(){return false};
		thisEl.oncopy=function(){return false};
		thisEl.oncut=function(){return false};
	}
	
	/* 用户信息管理面板 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='admin.system.user.userManager'/>"/*'用户管理'*/, // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    //iconCls:"icon-user_list",
	    closable:true,
	   	items:[userMgrForm(),grid_user()]//TabPanel中的标签页
    }); 
})();