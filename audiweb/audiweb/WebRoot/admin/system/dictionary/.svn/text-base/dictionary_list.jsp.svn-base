<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	var paramId ='0';//记录当前列表的ID
	var cmdId = '';//主鍵ID
	var parentCmdId01;	//同时获取到该条记录中的父ID
	var title = "数据字典列表";	//定义全局的title
	
	//定义一个全局的数组，用来装(点击子字典时,获取到的)父ID
	//var data:[saveparentCmdIdData];
	
	/*数据字典表Model*/
	Ext.define('CmsDictionary',{
		extend:'Ext.data.Model',
		fields : ['cmdId','parentCmdId','cmdName','cmdValue','cmdDesc','cmdOrderVal','cmdValue2','cmdValue3','cmdPubStatus','cmdAdduser','cmdAddtime','cmdLastuser','cmdLasttime'] // 对应角色表中的字段，建议全部写出
		}
	);
	/*数据字典Store */
   var store_dictionary = Ext.create('Ext.data.Store',{
		model:'CmsDictionary',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'dictionary_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		},
		listeners:{
			load:function(store,records,successful, operation,eOpts){
				store_dictionary_Loc.add(records);
				}
			}
		}
	);
	/*数据字典Store */
   var store_dictionary_Loc = Ext.create('Ext.data.Store',{
		model:'CmsDictionary',
		 proxy: {
	        type: 'sessionstorage',
	        id  : 'store_dictionary_Loc'
	    	}
		}
	);
	/*数据字典Form*/
	function dictionaryMgrForm(){
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
			items:[
				  {xtype:'textfield',fieldLabel:"<s:text name='cms_dictionary.cmdName'/>",name:'cmdName',labelWidth:80,width:220}, /*字典名称*/
				  {xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'/**查询*/
				   ,handler:function(){
					    var form = this.up('form').getForm();
						var comb = this.up('form').child('combobox');
						var store = this.up('form').up('panel')
								.child('grid').getStore();
						var vals=form.getValues();
						//json转码
						var jsonObj=Ext.encode({
						  cmdName:vals.cmdName		//字典名称
						  });
						 store.getProxy().extraParams = {rows:jsonObj};
						 store.load({
						        	 	params : { 
						        			parentId:paramId
										}
						        	});
							}
						}
					]
				}
			);
		}
	
	/* 数据字典列表*/
	function grid_dictionary(){
		var handleData=[];	//存放父ID
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='admin.system.dictionary.dictionaryList'/>",/*数据字典列表*/
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_dictionary, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_dictionary}, // 分页信息,store与grid的store一样
			// 分页信息,store与grid的store一样
			columns:{//列模式的集合
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},/*序号*/
			       {header : "<s:text name='cms_dictionary.cmdId'/>",dataIndex : 'cmdId', flex:1}, /*字典主键ID*/
			       {header : "父字典名称",dataIndex : 'parentCmdId', flex:1,
						renderer:function(v){
							if(v==0)
							{
								return "顶级字典";
							}else{
				         		var text= getTextByStore(store_dictionary_Loc,v,"cmdId","cmdName");
				         		return text;
				         	}
						}}, //父字典
			       {header : "<s:text name='cms_dictionary.cmdName'/>",dataIndex : 'cmdName', flex:1}, //名称
			       {header : "<s:text name='cms_dictionary.cmdOrderVal'/>",dataIndex : 'cmdOrderVal', flex:1},  //排序值
			       {header : "<s:text name='cms_dictionary.cmdPubStatus'/>",dataIndex : 'cmdPubStatus', flex:1,renderer:function(v){
			       	if(v == 0){
			       		return "编辑";
			       	}else if (v == 1){
			       		return "发布";
			       	}else if (v == 2){
			       		return "编辑/发布";
			       	}else if(v == 3){
			       		return "撤销发布";
			       	}
			       }}, //状态
		           {header : "<s:text name='cms_dictionary.cmdLastuser'/>",dataIndex : 'cmdLastuser', flex:1},//最后修改人
			       {header : "<s:text name='cms_dictionary.cmdLasttime'/>",dataIndex : 'cmdLasttime', flex:1,renderer:function(v){
			       	return getDateTime(v);
					}} //修改时间
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("<s:text name='admin.system.dictionary.updateDictionaryInf'/>"/*修改数据字典信息*/,[editDictionary(record,view)]); // 弹出修改数据字典框
				}
			},
			tbar : [
			<s:if test="isAdd()"> {
				text : "<s:text name='util.gridNewly'/>",//新增
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 1)
					{
						/*提示  不能同时修改多条记录*/
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");
						return;
					}
					mkWindow("<s:text name='admin.system.dictionary.addDictionary'/>",[addDictionary(grid)]); /*添加数据字典*/     // 弹出新增数据字典框

					Ext.getCmp("addDictionaryForm").getForm().findField("parentCmdId").setValue(paramId);
				}
			}, '-',</s:if><s:if test="isMod()"> {
				text : "<s:text name='util.gridUpdate'/>", /*修改*/
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>"); /*提示  您最少要选择一条记录*/
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");/*提示  不能同时修改多条记录*/
					} else {
						mkWindow("<s:text name='admin.system.dictionary.updateDictionaryInf'/>",[editDictionary(secData[0],this.up('grid'))]);/*修改数据字典信息*/ // 弹出修改数据字典框
					}
				}
			}, '-', </s:if><s:if test="isDel()"> {
				text : "<s:text name='util.gridDelete'/>",/*删除*/
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>","<s:text name='admin.system.role.comfirMsgDel'/>",function(btn){/*提示  你确定要删除吗?*/
							if(btn=="yes"){
								//同时删除多条记录
								var jsonArr = [];
								Ext.Array.each(secData,function(record){
									jsonArr.push(record.data);
								});
								//alert(Ext.encode(jsonArr));
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'dictionary_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 以字符串形式传到后台
									},
									success : function(response, opts) {
										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
										 var retData = Ext.decode(response.responseText);
										 var valid= retData.success;
										 if(!valid){
										 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);/*提示*/
										 } else {
										 	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);/*提示*/
										 		//Ext.Msg.alert('提示','操作成功');
												grid.getStore().load({
													        	 	params : { 
													        			parentId:paramId
																	}
													        	}); // 重新加载数据
												 }
									},
									failure : function(response, opts) {
										Ext.Msg.alert("<s:text name='util.fail'/>","<s:text name='util.hanldFail'/>");/*失败  操作失败!*/
									}
								})
							}
						});
					} else {
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");/*请至少选择一行进行操作*/
					}
				}
			},'-',</s:if>{
				text:"<s:text name='admin.system.dictionary.subDictionary'/>",/*子字典*/
				iconCls: 'icon-detail',
				id:'setdictionary',   //子字典
				handler : function(){
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); //通过这种方法获取到用户所选的记录并存放到 secData 数组中
					if(secData.length > 1)	//判断 secData 数组长度
					{
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","不能同时选取多条记录！");/*温馨提示   不能同时多条记录*/
						return ;
					}else if(secData.length < 1)
					{
						Ext.Msg.alert("温馨提示：","请至少选择一条记录！");/*温馨提示：   请至少选择一条记录！*/
						return ;
					}else {
						parentCmdId01 = secData[0].get('parentCmdId');	//通过这种方法获取到该条记录中父ID
						
						cmdName = secData[0].get('cmdName');	//通过这种方法获取到该条记录中字典名称
						
						paramId = secData[0].get('cmdId');	//通过这种方法获取到该条记录中主键ID
						store_dictionary.load({
							params : { 
				        			parentId:paramId
								}
						});
				        handleData.push(parentCmdId01); //将字典ID存放到该数组中
	//					alert("将父ID放到一维数组中：" + handleData)
					}
				}
			},
			'-',
				  {text:"<s:text name='util.gridBack'/>",iconCls: 'icon-back',handler:function(){/*上一级*/
				  	if(handleData.length==0)
				  	return;
				  	
				  	var nowParentId=handleData[handleData.length-1];
//					alert("重新load的父ID:" + nowParentId);
					store_dictionary.load({params : { 
						        			parentId:nowParentId			//自定义变量parentId
											}
										}); // 重新加载数据
					
					handleData.splice(handleData.length-1,1);		//handleData数组的splice
				}},
				'-',
				  {text:"工作流",iconCls: 'icon-user',handler:function(){
				    var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>"); /*提示  您最少要选择一条记录*/
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");/*提示  不能同时修改多条记录*/
					} else {
						mkWindow("数据字典工作流",[OperateWorkflowDic(secData[0],this.up('grid'))]);/*数据字典 操作工作流*/ // 弹出操作工作流框
					}}},
				  '-',
				  {text:'刷新',iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
 					grid.store.load({
		        	 	params : { 
		        					parentId:paramId
								 }
				        	});
					}
			
				}
			]
		});
	}
	
	// 翻页排序时带上查询条件
/*	store_dictionary.on('beforeload', function() {
		alert(paramId);
				this.baseParams = {
					parentId : paramId
				};
			});*/
	/* 添加数据字典 */
	function addDictionary(grid){
		var addDictionaryForm = Ext.create('Ext.form.Panel',{
			border:false,
			id :'addDictionaryForm',
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
			items : [//对象数组
			    {xtype:'hidden',name:'cmdId',id:'cmdId'},
			    {fieldLabel : "<s:text name='cms_dictionary.parentCmdId'/>",name:'parentCmdId',allowBlank : false,readOnly:true,fieldCls:'text-readonly',renderer:function(v){
							if(v==0)
							{
								return "顶级字典";
							}else{
				         		var text= getTextByStore(store_dictionary_Loc,v,"cmdId","cmdName");
				         		return text;
				         	}
						}},/*父字典*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdName'/>",name:'cmdName',allowBlank : false},/*名称*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdValue'/>",name:'cmdValue',allowBlank : false},/*数值*/
			    {xtype:'textarea',name:'cmdDesc',fieldLabel : "<s:text name='cms_dictionary.cmdDesc'/>", height:160},/*说明*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdOrderVal'/>",name:'cmdOrderVal',allowBlank : false},/*排序值*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdValue2'/>",name:'cmdValue2',allowBlank : false},/*值2*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdValue3'/>",name:'cmdValue3',allowBlank : false}/*值3*/
			    //{xtype:'combo',fieldLabel : "<s:text name='cms_dictionary.cmdPubStatus'/>",name:'cmdPubStatus',hidden:true,allowBlank : true,store:[["0", "<s:text name='util.edit'/>"], ["1", "<s:text name='util.publish'/>"], ["2", "编辑/发布"], ["3", "撤销发布"]],triggerAction: 'all',selectOnFocus : true},/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
//			    {fieldLabel : "<s:text name='cms_dictionary.cmdAdduser'/>",name:'cmdAdduser',hidden:true},/*添加人*/
//			    {fieldLabel : "<s:text name='cms_dictionary.cmdAddtime'/>",name:'cmdAddtime',hidden:true},/*添加时间*/
//			    {fieldLabel : "<s:text name='cms_dictionary.cmdLastuser'/>",name:'cmdLastuser',hidden:true},/*最后修改人*/
//			    {fieldLabel : "<s:text name='cms_dictionary.cmdLasttime'/>",name:'cmdLasttime',hidden:true}/*修改时间*/
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:400,
			items:[addDictionaryForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",/*确定*/
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						Ext.Msg.alert('温馨提示：','表的输入有误');
						return;//
					}
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'dictionary_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(form.getValues())
								},
						        success : function(response, opts){
						        		Ext.Msg.alert('温馨提示：','操作成功');
										win.close();
										grid.getStore().load({
											        	 	params : { 
											        			parentId:paramId
															}
											        	}); // 重新加载数据
						        },
						        failure:function(response, opts){
						        		Ext.Msg.alert('温馨提示：',"新增失败");
											       	}
												});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]/*取消*/
		});
		
	}
	/* 修改数据字典,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editDictionary(data,grid){
		var editDictionaryForm = Ext.create('Ext.form.Panel',{
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
			    {fieldLabel : "<s:text name='cms_dictionary.cmdId'/>",hidden:false,allowBlank : false,name:'cmdId', value:data.get('cmdId'),readOnly:true,fieldCls:'text-readonly'},/*字典主键ID*/
			    //{fieldLabel : "<s:text name='cms_dictionary.parentCmdId'/>",hidden:true,name:'parentCmdId',readOnly:true,fieldCls:'text-readonly',value:data.get('parentCmdId')},/*父字典*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdName'/>",hidden:false,name:'cmdName', value:data.get('cmdName')},/*名称*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdValue'/>",hidden:false,name:'cmdValue', value:data.get('cmdValue')},/*数值*/
			    {xtype:'textarea',fieldLabel : "<s:text name='cms_dictionary.cmdDesc'/>", name:'cmdDesc',height:160, value:data.get('cmdDesc')},/*说明*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdOrderVal'/>",hidden:false,name:'cmdOrderVal', value:data.get('cmdOrderVal')},/*排序值*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdValue2'/>",hidden:false,name:'cmdValue2', value:data.get('cmdValue2')},/*值2*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdValue3'/>",hidden:false,name:'cmdValue3', value:data.get('cmdValue3')},/*值3*/
			    {xtype:'combo',emptyText:'请选择',fieldLabel : "<s:text name='cms_dictionary.cmdPubStatus'/>",hidden:true,name:'cmdPubStatus',allowBlank : false,value:data.get('cmdPubStatus'),store:[["0", "<s:text name='util.edit'/>"], ["1", "<s:text name='util.publish'/>"], ["2", "编辑/发布"], ["3", "撤销发布"]],triggerAction: 'all',selectOnFocus : true}/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdAdduser'/>",hidden:true,name:'cmdAdduser', value:data.get('cmdAdduser')},/*添加人*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdAddtime'/>",name:'cmdAddtime',hidden:true},/*添加时间*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdLastuser'/>",hidden:true,name:'cmdLastuser', value:data.get('cmdLastuser')},/*最后修改人*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdLasttime'/>",name:'cmdLasttime',hidden:true}/*修改时间*/
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:420,
			items:[editDictionaryForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",/*确定*/
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					form.submit( {
						url : 'dictionary_modify.action',
						method : 'POST',
						params : { 
						   rows:Ext.encode(form.getValues())
						},
				        success : function(response, opts){
				        	Ext.Msg.alert('提示','操作成功');
										win.close();
										grid.getStore().load({
											        	 	params : { 
											        			parentId:paramId
															}
											        	}); // 重新加载数据
				        },
				        failure:function(response, opts){
				       	 	funFailure(response, opts);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]/*取消*/
		});
	}
	
	/* 操作数据流,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function OperateWorkflowDic(data,grid){
		var OperateWorkflowForm = Ext.create('Ext.form.Panel',{
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
				{fieldLabel : "<s:text name='cms_dictionary.cmdId'/>",hidden:true,allowBlank : false,name:'cmdId', value:data.get('cmdId'),readOnly:true,fieldCls:'text-readonly'},/*字典主键ID*/
			    //{fieldLabel : "<s:text name='cms_dictionary.parentCmdId'/>",hidden:true,name:'parentCmdId', value:data.get('parentCmdId')},/*父字典*/
			    {fieldLabel : "<s:text name='cms_dictionary.cmdName'/>",hidden:false,name:'cmdName', value:data.get('cmdName'),readOnly:true,fieldCls:'text-readonly'},/*名称*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdValue'/>",hidden:true,name:'cmdValue', value:data.get('cmdValue')},/*数值*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdOrderVal'/>",hidden:true,name:'cmdOrderVal', value:data.get('cmdOrderVal')},/*排序值*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdValue2'/>",hidden:true,name:'cmdValue2', value:data.get('cmdValue2')},/*值2*/
			    //{fieldLabel : "<s:text name='cms_dictionary.cmdValue3'/>",hidden:true,name:'cmdValue3', value:data.get('cmdValue3')},/*值3*/
			     {xtype:'combo',emptyText:'请选择',fieldLabel : "事件",hidden:false,name:'cmdPubStatus',allowBlank : false,value:data.get('cmdPubStatus'),store:[ ["1", "发布"], ["3", "撤销发布"]],triggerAction: 'all',selectOnFocus : true},/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
			    {xtype:'textarea',fieldLabel : "详细说明", name:'cmdComments'}/*说明不是组件内容或其他，注意，是用户填写的日志说明*/
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:170,
			items:[OperateWorkflowForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",/*确定*/
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					form.submit( {
						url : 'dictionary_operateworkflow.action',			//此处需要调用后台方法，对于发布，调用保存或更新的方法；对于撤销发布，调用delete方法；获取到说明文本框中内容，写进数据库。
						method : 'POST',
						params : { 
						   rows:Ext.encode(form.getValues())
						},
				        success : function(response, opts){
				        	Ext.Msg.alert('提示','操作成功');
										win.close();
										grid.getStore().load({}); // 重新加载数据
				        },
				        failure:function(response, opts){
				       	 	funFailure(response, opts);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]/*取消*/
		});
	}
/**
 * 数据字典面板
 */
  return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='admin.system.dictionary.dictionaryManager'/>", // 数据字典管理     标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[dictionaryMgrForm(),grid_dictionary()]//TabPanel中的标签页
    }); 
})();


