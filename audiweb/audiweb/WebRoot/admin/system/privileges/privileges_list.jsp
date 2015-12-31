<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*权限表Model */
	Ext.define('privileges_CmsRolePrivilegesModel',{
		extend:'Ext.data.Model',
		fields : [{name:'crpId',type:'int'},
				  'crpCmroName',
				  'crpCmpId',
				  'crpPrivValue'
				  ] // 对应权限表中的字段，建议全部写出
	});
	/*角色信息Model */
	Ext.define('user_CmsPrivModel',{
		extend:'Ext.data.Model',
		fields : ['cmroName','cmroDesc','cmroAddtime','cmroAdduser'] // 对应角色表中的字段，建议全部写出
	});
	/*权限表Store */
   var store_CmsRolePrivileges = Ext.create('Ext.data.Store',{
		model:'privileges_CmsRolePrivilegesModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'crp_query.action',//请求后台西信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/*角色Store */
   var store_role_priv = Ext.create('Ext.data.Store',{
		model:'user_CmsPrivModel',
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
	//------start,栏目信息
		Ext.define('privileges_funcMenuModel', {
			extend : 'Ext.data.Model',
			fields : [{name:'cmpId',type:'int'},'text','children']
			
		});    
		var privileges_funcTreeStore = Ext.create('Ext.data.Store', {
			model : 'privileges_funcMenuModel',
			proxy : {
				type : 'ajax',
				url : 'lefttree.action'//'json_demo/funcMenu.json'
			}
		});
		//------end
   /*权限表Form*/
	function privilegesMgrForm(){
		//获取store
		var comboStore=Ext.create('Ext.data.Store',
			{model : 'privileges_funcMenuModel',
			proxy : {
				  type: 'localstorage',
       			  id  : 'privilegesMgrForm'
			}
		});
	   var searchForm= Ext.create('Ext.form.Panel', {
			region:'north',
			height:40,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:4,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:60,width:200
			},
			items:[
					{xtype:'textfield',fieldLabel:"<s:text name='admin.system.privileges.crpCmroName'/>",name:'crpCmroName'},/*角色名称*/
					{xtype:'combo',fieldLabel:"<s:text name='admin.system.privileges.crpCmpName'/>",name:'crpCmpId',displayField:'text',valueField:'cmpId',editable:false
					 ,queryMode:'local',store:comboStore,
					 defaultListConfig:{maxHeight:80}
					},///*栏目*/
					{xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
						,handler:function(){
							var form = this.up('form').getForm();
							var comb = this.up('form').child('combobox');
							var store = this.up('form').up('panel')
									.child('grid').getStore();
							var vals=form.getValues();
							//判断combo的值类型如果是0或者是Undefined就转化为''
							vals.crpCmpId=(vals.crpCmpId==-1)?'':vals.crpCmpId;
							var jsonObj=Ext.encode({
							  crpCmroName:vals.crpCmroName,
							  crpCmpId:vals.crpCmpId
							  });
							  store.getProxy().extraParams = {rows:jsonObj};
							  store.load();
						}
					}
					]
			});
			//var comboStore=searchForm.getForm().findField('crpCmpId').getStore();
			//为下拉框加载数据
			privileges_funcTreeStore.load({
		       callback: function(records, options, success){ 
		       			comboStore.removeAll(true);
						privileges_funcTreeStore.removeAll(true);
		       			privileges_funcTreeStore.add(records);
		       			//放一个空值
		       			comboStore.add({cmpId:-1,text:'查询全部'});
		                 privileges_funcTreeStore.each(function(item){
							if(item.get('children').length>0)
							{
								comboStore.add(item.get('children'));
							}else{
								comboStore.add(item);
							}
						});
						//设置默认值
						searchForm.getForm().findField('crpCmpId').setValue(-1);
		         }
			});
				
		return searchForm;
	}
   /*权限信息列表*/
	function grid_privileges(){
		//获取store
		var comboStore=Ext.create('Ext.data.Store',
			{model : 'privileges_funcMenuModel',
			proxy : {
				  type: 'localstorage',
       			  id  : 'grid_privileges'
			}
		});
		//为下拉框加载数据
		privileges_funcTreeStore.load({
	       callback: function(records, options, success){ 
	       			comboStore.removeAll(true);
					privileges_funcTreeStore.removeAll(true);
	       			privileges_funcTreeStore.add(records);
	       			//放一个空值
	                 privileges_funcTreeStore.each(function(item){
						if(item.get('children').length>0)
						{
							comboStore.add(item.get('children'));
						}else{
							comboStore.add(item);
						}
					});
	         }
		});
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='admin.system.privileges.rightInfLIst'/>",/*权限信息列表*/
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_CmsRolePrivileges, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			//bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_role}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : "id",dataIndex : 'crpId', flex:1},
			       {header : "<s:text name='admin.system.privileges.crpCmroName'/>"/*角色名称*/,dataIndex : 'crpCmroName', flex:1}, 
			       {header : "<s:text name='admin.system.privileges.crpCmpName'/>"/*栏目*/,dataIndex : 'crpCmpId', flex:1,renderer:function(v){
				         		var cmpName= getTextByStore(comboStore,v,"cmpId","text");
				         		return cmpName;
						}}, 
			       {header :"<s:text name='admin.system.privileges.crpPrivValue'/>"/*权限值*/,dataIndex : 'crpPrivValue', flex:2}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("<s:text name='admin.system.privileges.updatePriv'/>"/*修改权限*/,[editPriv(record,view)]); // 弹出修改角色框
				}
			},
			tbar : [{
				text : "<s:text name='util.gridNewly'/>",/*新增*/
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					mkWindow("<s:text name='admin.system.privileges.addPrivBtn'/>"/*新增权限*/,[addPriv(grid)]); // 弹出新增权限框 
				}
			}, '-', {
				text : "<s:text name='util.gridUpdate'/>",/*修改*/
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(this.up('grid').getStore().getCount()==0)
					return;
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMin'/>"/*您最少要选择一条记录*/);
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionUpdateRows'/>"/*不能同时修改多条记录*/);
					} else {
						mkWindow("<s:text name='admin.system.privileges.updatePriv'/>"/*修改权限*/,[editPriv(secData[0],this.up('grid'))]); // 弹出修改角色框
					}
				}
			}, '-', {
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
							        url : 'crp_del.action',
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
				  {text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}]
		});
	}
	
	/* 添加权限 */
	function addPriv(grid){
		//获取store
		var comboStore=Ext.create('Ext.data.Store',
			{model : 'privileges_funcMenuModel',
			proxy : {
				  type: 'localstorage',
       			  id  : 'addPriv'
			}
		});
		var addPrivForm = Ext.create('Ext.form.Panel',{
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
				labelWidth:80,
				labelAlign:'right',
				width:300
			},
			items : [
					{xtype:'combo',fieldLabel : "<s:text name='admin.system.privileges.crpCmroName'/>"/*'角色名称'*/,name : 'crpCmroName',displayField:'cmroName',valueField:'cmroName',allowBlank : false,editable:false,store:store_role_priv},
					{xtype:'combo',fieldLabel:"<s:text name='admin.system.privileges.crpCmpName'/>",name:'crpCmpId',displayField:'text',valueField:'cmpId',editable:false,allowBlank : false
					 ,queryMode:'local',store:comboStore,
					 defaultListConfig:{maxHeight:80}
					 },
					{xtype:'checkboxgroup',name:'crpPrivValue',width:360,align:'center',defaults:{xtype:'checkboxfield'},margin:'0 0 0 30',items:[
						{boxLabel:"<s:text name='util.query'/>"/*'查看'*/,inputValue :'VIEW'}
						,{boxLabel:"<s:text name='util.gridNewly'/>"/*'新增'*/,inputValue :'ADD'}
						,{boxLabel:"<s:text name='util.gridUpdate'/>"/*'修改'*/,inputValue :'MOD'}
						,{boxLabel:"<s:text name='util.gridDelete'/>"/*'删除'*/,inputValue :'DEL'}
						,{boxLabel:"<s:text name='admin.system.role.check'/>"/*'审核'*/,inputValue :'CHECK'}
						,{boxLabel:"<s:text name='admin.system.role.publish'/>"/*'发布'*/,inputValue :'PUB'}
					]
					}
			]
		});
		var comboStore=addPrivForm.getForm().findField('crpCmpId').getStore();
		//为下拉框加载数据
		privileges_funcTreeStore.load({
	       callback: function(records, options, success){ 
	       			comboStore.removeAll(true);
					privileges_funcTreeStore.removeAll(true);
	       			privileges_funcTreeStore.add(records);
	                 privileges_funcTreeStore.each(function(item){
						if(item.get('children').length>0)
						{
							comboStore.add(item.get('children'));
						}else{
							comboStore.add(item);
						}
					});
					
	         }
		});
		
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:390,
			height:140,
			items:[addPrivForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//获取选中的复选框
					var checkboxValues=form.findField('crpPrivValue').getChecked();
					if(checkboxValues.length==0){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,"<s:text name='admin.system.user.msg.optionCrpPric'/>");
						return;
					}
					//获取复选框中的值
					var crpPrivValue='';
					Ext.Array.each(checkboxValues,function(item){
						if(crpPrivValue.length!=0){
						crpPrivValue+=','+item.getSubmitValue();
						}else
						{
							crpPrivValue+=item.getSubmitValue();
						}
					});
					var submitValues=form.getValues();
					submitValues.crpPrivValue=crpPrivValue;
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'crp_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(submitValues)
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
	
	/* 修改权限,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editPriv(data,grid){
		//获取store
		var comboStore=Ext.create('Ext.data.Store',
			{model : 'privileges_funcMenuModel',
			proxy : {
				  type: 'localstorage',
       			  id  : 'editPriv'
			}
		});
		var editPrivForm = Ext.create('Ext.form.Panel',{
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
				labelWidth:80,
				labelAlign:'right',
				width:300
			},
			items : [
					{xtype : 'hidden',name : 'crpId',value:data.get('crpId')},
					{xtype : 'hidden',name : 'copyCrpCmpId',value:data.get('crpCmpId')},
					{xtype:'combo',fieldLabel : "<s:text name='admin.system.privileges.crpCmroName'/>"/*'角色名称'*/,name : 'crpCmroName',value:data.get('crpCmroName'),displayField:'cmroName',valueField:'cmroName',allowBlank : false,editable:false,store:store_role_priv},
					 {xtype:'combo',fieldLabel:"<s:text name='admin.system.privileges.crpCmpName'/>",name:'crpCmpId',displayField:'text',valueField:'cmpId',editable:false,value:data.get('crpCmpId'),allowBlank : false
					 ,queryMode:'local',
					 defaultListConfig:{maxHeight:80}
					 },///*栏目*/
					 {xtype:'checkboxgroup',name:'crpPrivValue',width:360,align:'center',defaults:{xtype:'checkboxfield'},margin:'0 0 0 30',items:[
						{boxLabel:"<s:text name='util.query'/>"/*'查看'*/,inputValue :'VIEW'}
						,{boxLabel:"<s:text name='util.gridNewly'/>"/*'新增'*/,inputValue :'ADD'}
						,{boxLabel:"<s:text name='util.gridUpdate'/>"/*'修改'*/,inputValue :'MOD'}
						,{boxLabel:"<s:text name='util.gridDelete'/>"/*'删除'*/,inputValue :'DEL'}
						,{boxLabel:"<s:text name='admin.system.role.check'/>"/*'审核'*/,inputValue :'CHECK'}
						,{boxLabel:"<s:text name='admin.system.role.publish'/>"/*'发布'*/,inputValue :'PUB'}
					],
					listeners:{afterrender:function(component,eOpts){
						//修改时获取获取已选权限
						var checkboxgroupItems=component.items;
						 for (var i = 0; i < checkboxgroupItems.length; i++)    
			            {    
			            	var obj=checkboxgroupItems.getAt(i);
			            	var dbPrivDatas=data.get('crpPrivValue').split(',');
			            	Ext.Array.each(dbPrivDatas,function(item){
			            		if(item==obj.inputValue)
			            		{
			            			obj.setValue(true);
			            		}
			            	});
			            }  
					}}
					}			
			]
		});
		var comboStore=editPrivForm.getForm().findField('crpCmpId').getStore();
			//为下拉框加载数据
		privileges_funcTreeStore.load({
	       callback: function(records, options, success){ 
	       			comboStore.removeAll(true);
					privileges_funcTreeStore.removeAll(true);
	       			privileges_funcTreeStore.add(records);
	                privileges_funcTreeStore.each(function(item){
						if(item.get('children').length>0)
						{
							comboStore.add(item.get('children'));
						}else{
							comboStore.add(item);
						}
					});
					
	         }
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:390,
			height:140,
			items:[editPrivForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//获取选中的复选框
					var checkboxValues=form.findField('crpPrivValue').getChecked();
					if(checkboxValues.length==0){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*'提示'*/,"<s:text name='admin.system.user.msg.optionCrpPric'/>");
						return;
					}
					//获取复选框中的值
					var crpPrivValue='';
					Ext.Array.each(checkboxValues,function(item){
						if(crpPrivValue.length!=0){
						crpPrivValue+=','+item.getSubmitValue();
						}else
						{
							crpPrivValue+=item.getSubmitValue();
						}
					});
					var submitValues=form.getValues();
					submitValues.crpPrivValue=crpPrivValue;
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'crp_modify.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(submitValues)
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
	/* 权限信息管理面板 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='admin.system.privileges.privManager'/>"/*'权限管理'*/, // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[privilegesMgrForm(),grid_privileges()]//TabPanel中的标签页
    }); 
})();