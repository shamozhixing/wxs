<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@include file="../../common/taglibs.jsp" %>
(function(){
	/*角色表Model */
	Ext.define('roleModel',{
		extend:'Ext.data.Model',
		fields : ['cmroName','cmroDesc','cmroAddtime','cmroAdduser'] // 对应角色表中的字段，建议全部写出
	});
	/*角色Store */
   var store_role = Ext.create('Ext.data.Store',{
		model:'roleModel',
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
   /*角色Form*/
	function roleMgrForm(){
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
			items:[{xtype:'textfield',fieldLabel:"<s:text name='admin.system.role.cmroName'/>",name:'cmroName'},
					 {xtype:'textfield',fieldLabel:"<s:text name='admin.system.role.cmroDesc'/>",name:'cmroDesc'},
					 {xtype:'textfield',fieldLabel:"<s:text name='admin.system.role.cmroAdduser'/>",name:'cmroAdduser'},
					 {xtype: 'button',text:"<s:text name='util.search'/>",iconCls:'icon-find',width:60,margin:'0 0 5 30'
						,handler:function(){
							var form = this.up('form').getForm();
							var comb = this.up('form').child('combobox');
							var store = this.up('form').up('panel')
									.child('grid').getStore();
							var vals=form.getValues();
							vals=form.getValues();
							var jsonObj=Ext.encode({
							  cmroName:vals.cmroName,
							  cmroDesc:vals.cmroDesc,
							  cmroAdduser:vals.cmroAdduser
							  });
							  store.getProxy().extraParams = {rows:jsonObj};
							  store.load();
						}
					}
					]
			});
	}
   /* 角色信息列表*/
	function grid_role(){
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='admin.system.role.userRoleList'/>",
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_role, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			//bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_role}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : "<s:text name='admin.system.role.cmroName'/>",dataIndex : 'cmroName', flex:1}, 
			       {header : "<s:text name='admin.system.role.cmroDesc'/>",dataIndex : 'cmroDesc', flex:1}, 
			       {header :"<s:text name='admin.system.role.cmroAddtime'/>",dataIndex : 'cmroAddtime', flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}}, 
			       {header :"<s:text name='admin.system.role.cmroAdduser'/>",dataIndex : 'cmroAdduser', flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
				<s:if test="isMod()">
					mkWindow("<s:text name='admin.system.role.updateRoleInf'/>"/*修改角色信息*/,[editRole(record,view)]); // 弹出修改角色框
				</s:if>
				}
			},
			tbar : [
			<s:if test="isAdd()">
			{
				text : "<s:text name='util.gridNewly'/>",
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					mkWindow("<s:text name='admin.system.role.addRole'/>"/*添加角色*/,[addRole(grid)]); // 弹出新增角色框 
				}
			}, '-',</s:if> <s:if test="isMod()">{
				text : "<s:text name='util.gridUpdate'/>",
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMin'/>"/*您最少要选择一条记录*/);
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionUpdateRows'/>"/*不能同时修改多条记录*/);
					} else {
						mkWindow("<s:text name='admin.system.role.updateRoleInf'/>"/*修改角色信息*/,[editRole(secData[0],this.up('grid'))]); // 弹出修改角色框
					}
				}
			}, '-', </s:if><s:if test="isDel()">{
				text :"<s:text name='util.gridDelete'/>",
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
							        url : 'role_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 已字符窜形式传到后台
									},
									success : function(response, opts) {
										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
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
			},'-',</s:if><s:if test="isMod()">{
				text:"<s:text name='admin.system.role.settingRight'/>",/*设置权限*/
				handler : function(){
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMin'/>"/*您最少要选择一条记录*/);
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionUpdateRows'/>"/*不能同时修改多条记录*/);
					} else {
						mkWindows("<s:text name='admin.system.role.updateRoleRightInf'/>"/*修改角色权限信息*/,[setRoleRight(secData[0],this.up('grid'))]); // 弹出修改角色权限信息框
					}
				}
			},'-',</s:if>
				  {text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}]
		});
	}
	
	/* 添加角色 */
	function addRole(grid){
		var addRoleForm = Ext.create('Ext.form.Panel',{
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
				width:370
			},
			items : [
			    {fieldLabel : "<s:text name='admin.system.role.cmroName'/>"/*角色名称*/,name:'cmroName',allowBlank : false},
			    {xtype:'textarea',name:'cmroDesc',fieldLabel : "<s:text name='admin.system.role.cmroDesc'/>"/*角色描述*/, height:80},
			    {fieldLabel : ''/*添加人*/,name:'cmroAdduser',hidden:true,value:'<%=sessionLoginUser.getCmuName()%>'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:400,
			height:160,
			items:[addRoleForm], // 将表单面板加入该panel中
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
						        url : 'role_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(form.getValues())
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
	
	/* 修改角色,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editRole(data,grid){
		var editRoleForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table',columns:1
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:370
			},
			items : [
			    {fieldLabel : "<s:text name='admin.system.role.cmroName'/>"/*'角色名称'*/,allowBlank : false,name:'cmroName', value:data.get('cmroName'),readOnly:true,fieldCls:'text-readonly'},
			    {xtype:'textarea',fieldLabel : "<s:text name='admin.system.role.cmroDesc'/>"/*'角色描述'*/, name:'cmroDesc',height:80, value:data.get('cmroDesc')},
			    {fieldLabel : "<s:text name='admin.system.role.cmroAdduser'/>"/*'添加人'*/,hidden:true,name:'cmroAdduser', value:data.get('cmroAdduser')}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:400,
			height:160,
			items:[editRoleForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					form.submit( {
						url : 'role_modify.action',
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(form.getValues())
						},
				        success : function(response, opts){
				        	funSuccess(response, opts,win,grid)
				        },
				        failure:function(response, opts){
				       	 	funFailure(response, opts);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
		});
	}
	
	//------start,栏目信息
		Ext.define('role_funcMenuModel', {
			extend : 'Ext.data.Model',
			fields : [{name:'cmpId',type:'int'},'text','children']
			
		});    
		var roleFuncTreeStore = Ext.create('Ext.data.Store', {
			model : 'role_funcMenuModel',
			proxy : {
				type : 'ajax',
				url : 'lefttree_getAllTreeNodes.action'//'json_demo/funcMenu.json'
			},sync:false
		});
		//------end
		
		/*为角色设置权限 */
	function setRoleRight(data,grid){
	
		return mrgTreePanel(data,grid);
	
	}
	////-----------------------------------加载树信息start
	/**加载树信息*/
	function mrgTreePanel(data,grid){
		Ext.define('menuModel', {
			extend : 'Ext.data.Model',
			fields : [{name : 'cmpId',type : 'int'},'text','children', 'url', 'tag', 'icon',{name:'id',mapping:'cmpId'},'pId','rights']// text 必须的 否则得设置,
		});
		var menuTreeStore = Ext.create('Ext.data.TreeStore', {
			model : 'menuModel',
			autoLoad:true,
			nodeParam:'cmpId',
			root : {
				text : '顶级菜单',
				expanded : true,
				id:0,
				icon:'workplace/image/icon/user.png',
				leaf:false
			},
			proxy : {
				type : 'ajax',
				url : "lefttree_getAllTreeNodes.action"
			},
			listeners:{
				load:function(store,node,records,successful,eOpts ){
				}
			}
		});
		//选择根节点
		function selectRootNode(rootStore){
			//数据是否在加载中
			function rootMenuIsLoading(){
				if(rootStore.isLoading())
				{
					window.setTimeout(function(){rootMenuIsLoading();},200);
				}else{
					menuTreePanel.getSelectionModel().select(rootStore.getRootNode(),true);
				}
			}
			rootMenuIsLoading();
		}
		
		
		//获取菜单树
		var menuTreePanel=Ext.create('Ext.tree.Panel',
			{
				//hideHeaders:true,
				animate : true,
				width:500,
				height:450,
				split : false,
				rootVisible : true,
				resizable : false,
//				useArrows : true,
				collapsible:false,
				store :menuTreeStore,
				lines:true,
				fields:["text","id"],
				columns:[
					{
					xtype:'treecolumn',
					text:'菜单',
					dataIndex:'text',
					flex:1,
					sortable:true
					},{
						text:'权限设置',
						flex:1,
						sortable:true,
						dataIndex:'rights',renderer:function(v){
				       	 return v;
			         	}
					}
				],
				listeners : {
					afterrender:function(component,eOpts){
						//数据是否在加载中
						function rootMenuIsLoading(){
							if(menuTreeStore.isLoading())
							{
								window.setTimeout(function(){rootMenuIsLoading();},200);
							}else{
								//递归
								function recursionNodes(thisNode){//ADD MOD DEL ALL
										var html="<div id='right_div_"+thisNode.get("cmpId")+"'>"+
											"<input type='checkbox' id='checkboxVIEW"+thisNode.get("cmpId")+"' name='checkbox"+thisNode.get("cmpId")+"' value='VIEW' onchange='checkOption("+thisNode.get("cmpId")+",this)'/><label>查看</label>" +
											"<input type='checkbox' id='checkboxADD"+thisNode.get("cmpId")+"' name='checkbox"+thisNode.get("cmpId")+"' value='ADD' onchange='checkOption("+thisNode.get("cmpId")+",this)'/><label>新增</label>" +
											"<input type='checkbox' id='checkboxMOD"+thisNode.get("cmpId")+"' name='checkbox"+thisNode.get("cmpId")+"' value='MOD' onchange='checkOption("+thisNode.get("cmpId")+",this)'/><label>修改</label>" +
											"<input type='checkbox' id='checkboxDEL"+thisNode.get("cmpId")+"' name='checkbox"+thisNode.get("cmpId")+"' value='DEL' onchange='checkOption("+thisNode.get("cmpId")+",this)'/><label>删除</label>" +
											"<input type='checkbox' id='checkboxALL"+thisNode.get("cmpId")+"' name='checkbox"+thisNode.get("cmpId")+"' value='ALL' onchange='checkOption("+thisNode.get("cmpId")+",this)'/><label>全部</label>" +
											"</div>";
									thisNode.set('rights',html);
									//去掉小红点
									thisNode.commit();
									checkboxStore=menuTreeStore;
										//是否是叶子节点
										if(!thisNode.isLeaf()){
											thisNode.expand();
											thisNode.eachChild(function(node){
												recursionNodes(node);
											});
											
										}
								}
								Ext.Ajax.request( {
									type: 'ajax',
							        method : 'POST',
							        url : 'crp_queryPrivByRole.action',//获取角色的权限信息
							        method : 'POST',
							         params : { 
							        	rows:Ext.encode({crpCmroName:data.get('cmroName')})
									},
							        success : function(response, opts){
							        	var retData = Ext.decode(response.responseText);
							        	//该角色已存在的权限
							        	var selectPriv=retData.rows;
							        	menuTreeStore.getRootNode().eachChild(function(node){
											recursionNodes(node);
										});
							        	Ext.Array.each(selectPriv,function(row){
							        		var rightnode=menuTreeStore.getNodeById(row.crpCmcId);
							        		if(rightnode && null!=rightnode){
							        			var dbPrivDatas=row.crpPrivValue.split(',');
							        			Ext.Array.each(dbPrivDatas,function(r){
							        				Ext.getDom("checkbox"+r+row.crpCmcId).checked=true;
							        				var el={};
							        				checkOption(row.crpCmcId,el.value=r);
							        			});
							        			
							        		}
							        	});
							        	//数据加载完毕消除遮罩层
							        	menuTreePanel.up('window').body.unmask(); 
							        }
								});
							}
						}
						rootMenuIsLoading();
					}/*,
					itemdblclick : function(me, rec, item, index, e, eOpts) {
						//获取当前节点
						var thisNode=me.getSelectionModel().getSelection()[0]; 
						//是否是叶子节点
						if(!thisNode.isRoot() && !thisNode.isLeaf()){
							if(thisNode.isExpanded())
							{
								//thisNode.collapse();
							}else{
								thisNode.expand();
							}
						}
						  menuTreePanel.getSelectionModel().select(thisNode,true);
					}
				*/},
			fbar:['->',{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
					handler:function(){
						var win = this.up('window');
						//获取所有的权限信息
						var privDatas=[];
						
						//递归,获取权限-----start
						function eachNodes(thisNode){//ADD MOD DEL ALL
								var cmpId=thisNode.get("cmpId");
								var crpPrivValue='';
								var els=document.getElementsByName("checkbox"+cmpId);
								Ext.Array.each(els,function(el){
									if(el.checked){
										//获取复选框中的值
										if(crpPrivValue!=''){
											crpPrivValue+=','+el.value;
										}else
										{
											crpPrivValue+=el.value;
										}
									}
								});
								if(crpPrivValue!='')
								{
									privDatas.push({crpCmcId:cmpId,crpPrivValue:crpPrivValue});
								}
								//是否是叶子节点
								if(!thisNode.isLeaf()){
									thisNode.expand();
									thisNode.eachChild(function(node){
										eachNodes(node);
									});
									
								}
						}
						menuTreeStore.getRootNode().eachChild(function(node){
							eachNodes(node);
						});
						var submitValues={"crpCmroName":data.get('cmroName')};
						submitValues.privDatas=privDatas;
						//----------end
						win.body.mask('数据提交中...');
						Ext.Ajax.request( {
							type: 'ajax',
					        method : 'POST',
					        url : 'crp_settingPriv.action',//此处相当于为权限表设置栏目的权限信息
					        method : 'POST',
					         params : { 
					        	rows:Ext.encode(submitValues)
							},
					        success : function(response, opts){
					        	win.body.unmask(); 
					        	var retData = Ext.decode(response.responseText);
								var isExists= retData.isExists;
					        	if(!isExists){
					        		funSuccess(response, opts,win,grid)
					        	}
					        	else{
					        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
					        	}
					        },
					        failure:function(response, opts){
					       	 	funFailure(response, opts);
					       	}
						});
					}
				},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
			});
		return menuTreePanel;
		
	}
	////////-------------------------------加载树信息end
	/*为角色设置权限 */
	function setRoleRight1(data,grid){
		return Ext.create("Ext.form.Panel", {
			width:500,
			height:450,
			autoScroll : true,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:1,tableAttrs:{style:{margin:'10 0 0 0'}}},
			items:[
				{xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:370,
				fieldLabel : "<s:text name='admin.system.role.cmroName'/>"/*'角色名称'*/,
				allowBlank : false,
				name:'crpCmroName', 
				value:data.get('cmroName'),
				readOnly:true,fieldCls:'text-readonly'}
			    ],
			fbar:['->',{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					//获取所有的权限信息
					var privDatas=[];
					form.getFields().each(function(el){
						if(el.xtype=='checkboxgroup')
						{
							//获取选中的复选框
							var checkboxValues=form.findField(el.name).getChecked();
							var crpPrivValue='';
							Ext.Array.each(checkboxValues,function(childItems){
								//获取复选框中的值
								if(crpPrivValue.length!=0){
									crpPrivValue+=','+childItems.getSubmitValue();
									}else
									{
										crpPrivValue+=childItems.getSubmitValue();
									}
							});
							if(crpPrivValue!='')
							{
								privDatas.push({crpCmcId:el.name,crpPrivValue:crpPrivValue});
							}
						}
					});
					
					var submitValues=form.getValues();
					submitValues.privDatas=privDatas;
					win.body.mask('数据提交中...');
					Ext.Ajax.request( {
								type: 'ajax',
						        method : 'POST',
						        url : 'crp_settingPriv.action',//此处相当于为权限表设置栏目的权限信息
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(submitValues)
								},
						        success : function(response, opts){
						        	win.body.unmask(); 
						        	var retData = Ext.decode(response.responseText);
									var isExists= retData.isExists;
						        	if(!isExists){
						        		funSuccess(response, opts,win,grid)
						        	}
						        	else{
						        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
						        	}
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}],
			listeners : {
				afterrender:function(component,eOpts ){
					//加载信息
					roleFuncTreeStore.load({
				       callback: function(records, options, success){ 
					       	//动态递归目录
							function recursionMenus(item,marginLeft){
								var collectionData=[];
						    	var itemsGroup;
						    	var childs=item.children;
						    	marginLeft+=12;
								if((childs) &&  childs.length>0)
								{
									Ext.Array.each(childs,function(child){
										//子的长度是否大于父的长度
										var marginAdd=0;
										if(child.text.length>4)
										{
											marginAdd=(child.text.length-4)*12;
										}else{
											marginAdd=2*12;
										}
										itemsGroup = getCheckGroup(child.text,child.cmpId,'0 0 0 '+(marginLeft+marginAdd));
										collectionData.push(itemsGroup);
										if((child.children) && child.children.length>0)
										{
											collectionData.push(recursionMenus(child,marginLeft));
										}
									});
								}
								return collectionData
							}
				       	
				       	
								roleFuncTreeStore.removeAll(true);
				       			roleFuncTreeStore.add(records);
								//获取集合
								var collectionData=[];
				                roleFuncTreeStore.each(function(item){
				                	var itemsGroup;
									if(item.get('children').length>0)
									{
										var mainMenu=getCheckGroup(item.get('text'),item.get('cmpId'),'0 0 0 0');//{xtype:'label',text:item.get('text')+":",style:{fontSize:'12px',display:'block',textAlign:'right',width:100}}
										collectionData.push(mainMenu);
										var childs=item.get('children');
										Ext.Array.each(childs,function(child){
											//体验范围数据
											itemsGroup = getCheckGroup(child.text,child.cmpId,'0 0 0 12');
											collectionData.push(itemsGroup);
											//为子节点添加子节点
											collectionData.push(recursionMenus(child,24));
										});
									}else{
										itemsGroup=getCheckGroup(item.get('text'),item.get('cmpId'));
										collectionData.push(itemsGroup);
									}
								});
								component.add(collectionData);
								//-----------加载完权限栏目后，加载已有权限start
								//获取当前form
								var privform=component.getForm();
								//获取数据库角色拥有的权限
								Ext.Ajax.request( {
									type: 'ajax',
							        method : 'POST',
							        url : 'crp_queryPrivByRole.action',//获取角色的权限信息
							        method : 'POST',
							         params : { 
							        	rows:Ext.encode({crpCmroName:data.get('cmroName')})
									},
							        success : function(response, opts){
							        	var retData = Ext.decode(response.responseText);
							        	//该角色已存在的权限
							        	var selectPriv=retData.rows;
							        	Ext.Array.each(selectPriv,function(row){
							        		//权限组Checkboxgroup下的子项
							        		if(privform.findField(row.crpCmcId) && null!=privform.findField(row.crpCmcId) && 'null'!=privform.findField(row.crpCmcId))
							        		{
								        		var checkboxgroupItems=	privform.findField(row.crpCmcId).items;
								        		for (var i = 0; i < checkboxgroupItems.length; i++)    
									            {    
									            	var obj=checkboxgroupItems.getAt(i);
									            	var dbPrivDatas=row.crpPrivValue.split(',');
									            	Ext.Array.each(dbPrivDatas,function(item){
									            		if(item==obj.inputValue)
									            		{
									            			obj.setValue(true);
									            		}
									            	});
									            } 
							        		}
							        	});
							        	//数据加载完毕消除遮罩层
							        	component.up('window').body.unmask(); 
							        }
								});
								//-----------加载完权限栏目后，加载已有权限end
				         }
					});
				}
			}
		 });
	}
	//动态checkgroup
	function getCheckGroup(text,cmpId,margin)
	{
		//创建权限列
		var comData=[
			{boxLabel:"<s:text name='util.query'/>"/*'查看'*/,inputValue :'VIEW'}
			,{boxLabel:"<s:text name='util.gridNewly'/>"/*'新增'*/,inputValue :'ADD'}
			,{boxLabel:"<s:text name='util.gridUpdate'/>"/*'修改'*/,inputValue :'MOD'}
			,{boxLabel:"<s:text name='util.gridDelete'/>"/*'删除'*/,inputValue :'DEL'}
			//,{boxLabel:"<s:text name='admin.system.role.check'/>"/*'审核'*/,inputValue :'CHECK'}
			//,{boxLabel:"<s:text name='admin.system.role.publish'/>"/*'发布'*/,inputValue :'PUB'}
			,{boxLabel:"<s:text name='admin.system.role.privAll'/>"/*'全部'*/,inputValue :'ALL',
				listeners:{
					change:function(field,newValue,oldValue,eOpts){
						if(field.getValue())
						{
			        		var checkboxgroupItems=field.up('checkboxgroup').items;
	        				for (var i = 0; i < checkboxgroupItems.length; i++)    
				            {    
				            	var obj=checkboxgroupItems.getAt(i);
								obj.setValue(true);;
				            } 
						}
					}
					}
			}
			];
		var itemsGroup = new Ext.form.CheckboxGroup({ 
			xtype:'checkboxgroup',
			labelWidth:100,
			labelAlign:'right',
			align:'center',
			defaults:{xtype:'checkboxfield'},
			fieldLabel:text,
			name:cmpId,
			margin:margin,
			width:360,
			items:comData,
			listeners:{
				change:function(field,newValue,oldValue,eOpts){
		        		var checkboxValues=field.getChecked();
		        		//所有el
		        		var checkboxgroupItems=field.items;
		        		var all=checkboxgroupItems.getAt(checkboxgroupItems.length-1);
        				if((all.getValue()) && checkboxValues.length<(checkboxgroupItems.length))
        				{
        					all.setValue(false);
        				}
				}}
			});
		
		return itemsGroup;
	}
	/* 用户管理面板 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='admin.system.role.roleManager'/>"/*'角色管理'*/, // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[roleMgrForm(),grid_role()]//TabPanel中的标签页
    }); 
})();