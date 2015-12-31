<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	Ext.define('componentModel',{
		extend:'Ext.data.Model',
		fields : ['cmcId','cmcComponentNo','cmcComponentName','cmcComponentType','cmcComponentContent','cmcIsEdit','cmcPubStatus','cmcLastuser','cmcLasttime'] 
	});
	/*
	 * 组件Store
	 */
   var store_component = Ext.create('Ext.data.Store',{
		model:'componentModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'component_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/**模版组件form */
	 function componentFForm(){
        return Ext.create('Ext.form.Panel',{
            region:'north',
			height:40,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:4,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:60,width:200
			},
			items:[{xtype:'textfield',fieldLabel:"<s:text name='cms_component.cmcComponentNo'/>",name:'cmcComponentNo',labelWidth:80,width:220},
				   {xtype:'textfield',fieldLabel:"<s:text name='cms_component.cmcComponentName'/>",name:'cmcComponentName'},
				   {xtype:'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find',
				    handler:function(){
					var form = this.up('form').getForm();
					var store = this.up('form').up('panel').child('grid').getStore();
					var vals=form.getValues();
	
					var jsonObj=Ext.encode({
					  cmcComponentNo:vals.cmcComponentNo,
					  cmcComponentName:vals.cmcComponentName
					  });
					  store.getProxy().extraParams = {rows:jsonObj};
					  store.load();
				     }
				    }
				   ]
        });
   }
	/* 模板信息列表
    */
	function grid_component(){
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='cms_component.list'/>",
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_component, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{
				selType:'checkboxmodel',
				mode:'MULTI'
			},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_component}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
				   {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : 'ID',dataIndex : 'cmcId', flex:1}, 
			       {header :"<s:text name='cms_component.cmcComponentNo'/>",dataIndex : 'cmcComponentNo', flex:1},
			       {header :"<s:text name='cms_component.cmcComponentName'/>",dataIndex : 'cmcComponentName', flex:1}, 
			       {header :"<s:text name='cms_component.cmcComponentType'/>",dataIndex:'cmcComponentType',flex:1,renderer:function(v){
			       		if(v == 0){
			       			return "静态";
				       	}
				       	if (v == 1){
				       		return "动态";
				       	}
			       }},
//			       {header :"<s:text name='cms_component.cmcComponentContent'/>",dataIndex:'cmcComponentContent',flex:1,hidden:true,
//			          renderer:function(v){return Ext.htmlEncode(v);}
//                   },
			       {header :"<s:text name='cms_component.cmcIsEdit'/>",dataIndex:'cmcIsEdit',flex:1,renderer:function(v){
			            if(v == 0){
			            	 return "<s:text name='cms_component.cmcIsEdit0'/>";/**否*/
			            }else if(v == 1){
			            	 return "<s:text name='cms_component.cmcIsEdit1'/>" ;/**是*/
			            }
			       }},
			       {header :"<s:text name='cms_component.cmcPubStatus'/>",dataIndex:'cmcPubStatus',flex:1,renderer:function(v){
				       	if(v == 0){
				       		return "编辑";
				       	}else if (v == 1){
				       		return "发布";
				       	}else if (v == 2){
				       		return "编辑/发布";
				       	}else if(v == 3){
				       		return "撤销发布";
				       	}
			       }},
			       {header :"<s:text name='cms_component.cmcLastuser'/>",dataIndex:'cmcLastuser',flex:1},
			       {header :"<s:text name='cms_component.cmcLasttime'/>",dataIndex : 'cmcLasttime', flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
				   mkWindow("<s:text name='cms_component.editComponent'/>",[editComponent(record,view)]);// 弹出修改模板框
				}
			},
			tbar : [
			<s:if test="isAdd()">{
					text : "<s:text name='util.gridNewly'/>",	//新增
					iconCls : 'icon-add',
					handler : function() {
						var grid=this.up('grid');
						mkWindow("<s:text name='cms_component.addComponent'/>",[addComponent(grid)]); // 弹出新增角色框
				}
			}, '-', </s:if><s:if test="isMod()">{
				text : "<s:text name='util.gridUpdate'/>",	//更新
				iconCls : 'icon-edit',
				handler : function() {
					var selcData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(selcData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>");
					} else if(selcData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");
					} else {
						mkWindow("<s:text name='cms_component.editComponent'/>",[editComponent(selcData[0],this.up('grid'))]); // 弹出修改角色框
					}
				}
			}, '-', </s:if><s:if test="isDel()"> {
				text : "<s:text name='util.gridDelete'/>",//删除
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>","<s:text name='admin.system.role.comfirMsgDel'/>",function(btn){
							if(btn=="yes"){
							    var jsonArr = [];
								Ext.Array.each(secData,function(record){
									jsonArr.push(record.data);
								});
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'component_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 以字符串形式传到后台
									},
									success : function(response, opts) {
										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
										 var retData = Ext.decode(response.responseText);
										 var valid= retData.success;
										 if(!valid){
										 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
										 } else {
										 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
										 	 grid.getStore().load(); // 重新加载数据
										 }
									},
									failure : function(response, opts) {
										Ext.Msg.alert("<s:text name='util.fail'/>","<s:text name='util.hanldFail'/>");
									}
								})
							}
						});
					} else {
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");
					}
				}
			}
			,'-',</s:if>
				  {text:"工作流",iconCls: 'icon-user',handler:function(){
				    var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>"); /*提示  您最少要选择一条记录*/
					} else if(secData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");/*提示  不能同时修改多条记录*/
					} else {
						mkWindow("组件工作流",[OperateWorkflowComponent(secData[0],this.up('grid'))]);/*组件工作流*/ // 弹出组件工作流框
					}}}
			,'-',
				  {text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}
			]
		});
	}
	
	/* 添加组件 */
	function addComponent(grid){
		
		var addComponentForm = Ext.create('Ext.form.Panel',{
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
				width:580
			},
			items : [{
							fieldLabel : "<s:text name='cms_component.cmcComponentNo'/>",
							name : 'cmcComponentNo',
							regex:/^[A-Za-z]+$/,
			                regexText:"<s:text name='cms_component.cmcComponentNoRegex'/>",
							allowBlank : false
						},
						{
							fieldLabel : "<s:text name='cms_component.cmcComponentName'/>",
							name : 'cmcComponentName',
							allowBlank : false
						},
						{
							xtype:'combo',
							fieldLabel : "<s:text name='cms_component.cmcComponentType'/>",
							name : 'cmcComponentType',
							emptyText:'请选择',
							store:[["0","静态"],["1","动态"]],
							editable:false,
							allowBlank : true

						}, 
			
						{
							xtype:'textarea',
							fieldLabel : "<s:text name='cms_component.cmcComponentContent'/>",
							name : 'cmcComponentContent', 
							height:300,
							allowBlank : true
						}, 
			
						{
							xtype:'checkboxfield',
							fieldLabel : "<s:text name='cms_component.cmcIsEdit'/>",
							name : 'cmcIsEdit',
							boxLabelAlign:'before',
							inputValue:'1',
							allowBlank : true
						},
						
						{
							xtype:'combo',
							fieldLabel : "<s:text name='cms_component.cmcPubStatus'/>",
							name : 'cmcPubStatus',
							store:[["0", "<s:text name='util.edit'/>"], ["1", "<s:text name='util.publish'/>"], ["2", "编辑/发布"], ["3", "撤销发布"]],/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
							triggerAction: 'all',
							selectOnFocus : true,
							hidden:true,
							allowBlank : true,
							editable:false
						}
						]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:500,
			items:[addComponentForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					var checkValue=form.getValues()
					checkValue.cmcIsEdit=((form.findField('cmcIsEdit').getValue()==false)?0:1);
					//alert(checkValue.cmcIsEdit+"======================");
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'component_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(checkValue)
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
									var isHave= retData.isHave;
									
									if(!isHave){
										//alert("添加信息异常302");
						        	   funSuccess(response, opts,win,grid)
						        	}else{
						        		//alert(  "305 ksdjfoiasdn");
						        	   Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
						        	}
						        },
						        failure:function(response, opts){
						        	//alert(  "errrror     310 ksdjfoiasdn");
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	/* 修改组件,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editComponent(data,grid){
		var cmcIsEdit=data.get('cmcIsEdit')==1?true:false;
		//alert(cmcIsEdit+")))))))317");
		var editComponentForm = Ext.create('Ext.form.Panel',{
			autoScroll:false,
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
				width:580
			},
			items : [{
						xtype : 'hidden',
						name : 'cmcId',
						value:data.get('cmcId')
						},{
							fieldLabel : "<s:text name='cms_component.cmcComponentNo'/>",
							name : 'cmcComponentNo',
							value:data.get('cmcComponentNo'),
							regex:/^[A-Za-z]+$/,
			                regexText:"<s:text name='cms_component.cmcComponentNoRegex'/>",
							allowBlank : false,readOnly:true,fieldCls:'text-readonly'
						},
						{
							xtype:'hidden',
							fieldLable:'copyNO',
							name:'copycmcComponentNo',
							value:data.get('cmcComponentNo'),
							allowBlank : false
						},
						{
							fieldLabel : "<s:text name='cms_component.cmcComponentName'/>",
							name : 'cmcComponentName',
							value:data.get('cmcComponentName'),
							allowBlank : false
						},
						{
							xtype:'combo',
							fieldLabel : "<s:text name='cms_component.cmcComponentType'/>",
							name : 'cmcComponentType',
							emptyText:'请选择',
							store:[["0","静态"],["1","动态"]],
							value:data.get('cmcComponentType'),
							editable:false,
							allowBlank : true
						}, 
						{/**组件内容*/
							xtype:'textarea',
							fieldLabel : "<s:text name='cms_component.cmcComponentContent'/>",
							name : 'cmcComponentContent',
							value:data.get('cmcComponentContent'),
							height:350,
							allowBlank : true		
						},
						{
							xtype:'checkboxfield',
							fieldLabel : "<s:text name='cms_component.cmcIsEdit'/>",
							name : 'cmcIsEdit',
							checked:cmcIsEdit,
							boxLabelAlign:'before'//,
//							inputValue:'1',
							//value:data.get('cmcIsEdit')
						}
						
						,{
							xtype:'combo',
							fieldLabel : "<s:text name='cms_component.cmcPubStatus'/>",
							name : 'cmcPubStatus',
							store:[["0", "<s:text name='util.edit'/>"], ["1", "<s:text name='util.publish'/>"], ["2", "编辑/发布"], ["3", "撤销发布"]],/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
							value:data.get('cmcPubStatus'),
							triggerAction: 'all',
							hidden:true,
							allowBlank : true,
						    editable:false
						}
						]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:500,
			border:false,
			items:[editComponentForm], // 将表单面板加入该panel中
			dockedItems:[{
			    xtype: 'toolbar',
			    dock: 'bottom',
			    ui: 'footer',
			    style:{margin:'0 10 0 0'},
			    defaults: {minWidth: 75},
			    items: ["->",
			    {
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					var checkValue=form.getValues()
					checkValue.cmcIsEdit=((form.findField('cmcIsEdit').getValue()==false)?0:1);
					form.cmcIsEdit=checkValue.cmcIsEdit
					//alert(checkValue.cmcIsEdit);
				
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'component_modify.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(checkValue)
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
									var isHave= retData.isHave;
									if(!isHave){
						        	   funSuccess(response, opts,win,grid)
						        	}else{
						        	   Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
						        	}
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}
			    ]
			}]
		});
	}
	/* 操作数据流,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function OperateWorkflowComponent(data,grid){
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
				{fieldLabel : "组件ID",hidden:true,allowBlank : false,name:'cmcId', value:data.get('cmcId'),readOnly:true,fieldCls:'text-readonly'},/*模版组件主键ID*/
			    {fieldLabel : "<s:text name='cms_component.cmcComponentNo'/>",hidden:true,name:'cmcComponentNo', value:data.get('cmcComponentNo')},/*组件标识*/
			    {fieldLabel : "<s:text name='cms_component.cmcComponentName'/>",hidden:false,name:'cmcComponentName', value:data.get('cmcComponentName'),readOnly:true,fieldCls:'text-readonly'},/*组件名称*/
			    {fieldLabel : "<s:text name='cms_component.cmcComponentType'/>",hidden:true,name:'cmcComponentType', value:data.get('cmcComponentType')},/*组件类型*/
			    {fieldLabel : "<s:text name='cms_component.cmcIsEdit'/>",hidden:true,name:'cmcIsEdit', value:data.get('cmcIsEdit')},/*是否可编辑*/
			    /**工作流 状态只有 1发布和 3撤销发布*/
				{xtype:'combo',emptyText:'请选择',fieldLabel : "事件",hidden:false,name:'cmcPubStatus',allowBlank : false,value:data.get('cmcPubStatus'),store:[ ["1", "发布"], ["3", "撤销发布"]],triggerAction: 'all',selectOnFocus : true},/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
			    {xtype:'textarea',fieldLabel : "详细说明", name:'cmcComponents'}/*说明不是组件内容或其他，注意，是用户填写的日志说明*/
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
						url : 'component_operateworkflow.action',			//此处需要调用后台方法，对于发布，调用保存或更新的方法；对于撤销发布，调用delete方法；获取到说明文本框中内容，写进数据库。
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
	/*
	 * 模板组件面板
	 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='cms_component'/>", // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[componentFForm(),grid_component()]//TabPanel中的标签页
    }); 
})();
