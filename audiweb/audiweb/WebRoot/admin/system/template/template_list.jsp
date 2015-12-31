<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*
	 * 模板表Model
	 */
	Ext.define('templateModel',{
		extend:'Ext.data.Model',
		fields : ['cmtId','cmtName','cmtImg','cmtDesc','cmtContent','cmtPubStatus','cmtLastuser','cmtLasttime'] 
	});
	/*
	 * 模板字段表Model
	 */
	Ext.define('templatefieldModel',{
		extend:'Ext.data.Model',
		fields : ['cmtName','ctfId','ctfCmtId','ctfViewName','ctfName','ctfType','ctfLength','ctfWidth','ctfHeight','ctfOrderNum','ctfSiteType','ctfLastuser','ctfLasttime'] 
	});
	/*
	 * 模板Store
	 */
   var store_template = Ext.create('Ext.data.Store',{
		model:'templateModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'template_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/*模版管理Form*/
   function templateFForm(){
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
			items:[{xtype:'textfield',fieldLabel:"<s:text name='cms_template.cmtName'/>",name:'cmtName',labelWidth:80,width:220},
					{xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
				    ,handler:function(){
					var form = this.up('form').getForm();
					var store = this.up('form').up('panel').child('grid').getStore();
					var vals=form.getValues();
	
					var jsonObj=Ext.encode({
					  cmtName:vals.cmtName
					  });
					  store.getProxy().extraParams = {rows:jsonObj};
					  store.load();
				}
			}]
        })
   }
   /* 模板信息列表
    */
	function grid_template(){
		return Ext.create('Ext.grid.Panel',{
			title:"<s:text name='cms_template.list'/>",
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_template, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{
				selType:'checkboxmodel',
				mode:'MULTI'
			},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_template}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
				   {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : 'ID',dataIndex : 'cmtId', flex:1}, 
			       {header :"<s:text name='cms_template.cmtName'/>",dataIndex : 'cmtName', flex:1},
			       //{hidden:true,header :"<s:text name='cms_template.cmtImg'/>",dataIndex : 'cmtImg', flex:1}, //模版缩略图
//			       {hidden:true,header :"<s:text name='cms_template.cmtDesc'/>",dataIndex:'cmtDesc',flex:1},
//			       {hidden:true,header :"<s:text name='cms_template.cmtContent'/>",dataIndex:'cmtContent',flex:1},
			       {header : "<s:text name='cms_template.cmtPubStatus'/>",dataIndex : 'cmtPubStatus', flex:1,renderer:function(v){
			       	if(v == 0){
			       		return "编辑";
			       	}else if (v == 1){
			       		return "发布";
			       	}else if (v == 2){
			       		return "编辑/发布";
			       	}else if(v == 3){
			       		return "撤销发布";
			       	}else {
			       		return false;
			       	}
			       	
			       }}, //状态
			       {header :"<s:text name='cms_template.cmtLastuser'/>",dataIndex:'cmtLastuser',flex:1},
			       {header :"<s:text name='cms_template.cmtLasttime'/>",dataIndex : 'cmtLasttime', flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					<s:if test="isMod()">
				   mkWindow("<s:text name='cms_template.editTemplate'/>",[editTemplate(record,view)]);// 双击每条数据时弹出修改模板框
				   </s:if>
				}
			},
			tbar : [
			<s:if test="isAdd()">{
				text : "<s:text name='util.gridNewly'/>",//新增模板
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					mkWindow("<s:text name='cms_template.addTemplate'/>",[addTemplate(grid)]); // 弹出添加模板框
				}
			}, '-', </s:if><s:if test="isMod()">{
				text : "<s:text name='util.gridUpdate'/>",//修改模板
				iconCls : 'icon-edit',
				handler : function() {
					var selcData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(selcData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>");
					} else if(selcData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");
					} else {
						mkWindow("<s:text name='cms_template.editTemplate'/>",[editTemplate(selcData[0],this.up('grid'))]); // 弹出修模板信息框
					}
				}
			}, '-', </s:if><s:if test="isDel()"> {
				text : "<s:text name='util.gridDelete'/>",
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
							        url : 'template_del.action',
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
										Ext.Msg.alert("<s:text name='util.fail'/>"/*失败*/,"<s:text name='util.hanldFail'/>"/*操作失败!*/);
									}
								})
							}
						});
					} else {
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");
					}
				}
			},'-',</s:if>{
			   text:"<s:text name='cms_templatefield'/>",
			   iconCls : 'icon-add',
			   handler : function() {
					var selcData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(selcData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='cms_templatefield.selectMin'/>");
					} else if(selcData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='cms_templatefield.selectMax'/>");
					} else {
						var recond = selcData[0];
						mkWindow("<s:text name='cms_templatefield'/>",[templateFieldDedind(recond.get('cmtId'),recond.get('cmtName'))]); // 弹出模板字段定义列表
					}
				}
			}
		   ,'-',
		  {text:"工作流",iconCls: 'icon-user',handler:function(){
		    var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
			if(secData.length < 1){
				Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>"); /*提示  您最少要选择一条记录*/
			} else if(secData.length > 1){
				Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");/*提示  不能同时修改多条记录*/
			} else {
				mkWindow("模版工作流",[OperateWorkflowTemplate(secData[0],this.up('grid'))]);/*模版管理 操作工作流*/ // 弹出操作工作流框
			}}}
			,'-',{text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					   }
				   }
		   ]
		});
	}
	
	/* 添加模板 */
	function addTemplate(grid){
		var addTemplateForm = Ext.create('Ext.form.Panel',{
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
				width:580
			},
			items : [{
				xtype : 'hidden',
				name : 'cmtId'
				}
				,{/*模版名称*/
					fieldLabel : "<s:text name='cms_template.cmtName'/>",
					name : 'cmtName',
					allowBlank : false
				}
				,{/*模版缩略图*/
					xtype:'hidden',
					fieldLabel : "<s:text name='cms_template.cmtImg'/>",
					name : 'cmtImg',
					allowBlank : true
				}
				,{/*模版描述*/
					xtype:'textarea',
					fieldLabel : "<s:text name='cms_template.cmtDesc'/>",
					name : 'cmtDesc',
					preventScrollbars:true,
					allowBlank : false
	
				} 
				,{/*模版内容*/
					xtype:'textarea',
					fieldLabel : "<s:text name='cms_template.cmtContent'/>",
					name : 'cmtContent',
					preventScrollbars:true,
					height:300,
					allowBlank : false		
				}
				,{/*模版发布状态*/
					xtype:'combo',
					fieldLabel : "<s:text name='cms_template.cmtPubStatus'/>",
					name : 'cmtPubStatus',
					store:[["0", "<s:text name='util.edit'/>"], ["1", "<s:text name='util.publish'/>"], ["2", "编辑/发布"], ["3", "撤销发布"]],/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
					triggerAction: 'all',
					selectOnFocus : true,
					displayField:'cmtPubStatus',
					valueField:'cmtPubStatus',
					hidden:true,
					allowBlank : true,
					editable:false
				}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:450,
			items:[addTemplateForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'template_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(form.getValues())
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
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	
	/* 修改模板,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editTemplate(data,grid){
		var editTemplateForm = Ext.create('Ext.form.Panel',{
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
				width:580
			},
			items : [{
				xtype : 'hidden',
				name : 'cmtId',
				value:data.get('cmtId')
				}
				,{
					fieldLabel : "<s:text name='cms_template.cmtName'/>",
					name : 'cmtName',
					value:data.get('cmtName'),
					allowBlank : false
				}
			    ,{
			    	xtype : 'hidden',
			    	fieldLabel:'copyMUBAN',
			    	name:'copyName',
			    	value:data.get('cmtName'),
			    	allowBlank : false
			    	
				}
				,
				{/**模版缩略图*/
					xtype:'hidden',
					fieldLabel : "<s:text name='cms_template.cmtImg'/>",
					name : 'cmtImg',
					value:data.get('cmtImg'),
					allowBlank : true
				},
				{/**模版描述*/
					xtype:'textarea',
					fieldLabel : "<s:text name='cms_template.cmtDesc'/>",
					name : 'cmtDesc',
					value:data.get('cmtDesc'),
					allowBlank : true

				}, 
				{/**模版内容*/
					xtype:'textarea',
					fieldLabel : "<s:text name='cms_template.cmtContent'/>",
					name : 'cmtContent',
					value:data.get('cmtContent'),
					height:350,
					allowBlank : true		
				}
				,{/**模版状态*/
					xtype:'combo',
					fieldLabel : "<s:text name='cms_template.cmtPubStatus'/>",
					name : 'cmtPubStatus',
					store:[["0", "<s:text name='util.edit'/>"], ["1", "<s:text name='util.publish'/>"], ["2", "编辑/发布"], ["3", "撤销发布"]],/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
					triggerAction: 'all',
					selectOnFocus : true,
					triggerAction: 'all',
					value:data.get('cmtPubStatus'),
					displayField:'cmtPubStatus',
					valueField:'cmtPubStatus',
					hidden:true,
					allowBlank : false,
					editable:false
				}
             ]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:520,
			items:[editTemplateForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					/*form.submit( {
						url : 'template_modify.action',
						method : 'POST',
						params : { 
						   rows:Ext.encode(form.getValues())
						},
				        success : function(response, opts){
				        	alert(response.msg);
				        	var retxxData = Ext.decode(response.responseText);
						    var isHave= retxxData.isHave;
						    alert(isHave);
				        	if(!isHave){
						        	   funSuccess(response, opts,win,grid)
						        	}else{
						        	   Ext.Msg.alert('提示',retxxData.msg);
						        	}
				        },
				        failure:function(response, opts){
				       	 	funFailure(response, opts);
				       	}
					});*/
					
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'template_modify.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(form.getValues())
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
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	/** 模版管理工作流方法,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function OperateWorkflowTemplate(data,grid){
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
				{fieldLabel : "<s:text name='cms_template.cmtId'/>",hidden:true,allowBlank : false,name:'cmtId', value:data.get('cmtId'),readOnly:true,fieldCls:'text-readonly'},/*模版定义主键ID*/
			    {fieldLabel : "<s:text name='cms_template.cmtName'/>",hidden:false,name:'cmtName', value:data.get('cmtName'),readOnly:true,fieldCls:'text-readonly'},/*模版名称*/
			    //{fieldLabel : "<s:text name='cms_template.cmtImg'/>",hidden:true,name:'cmtImg', value:data.get('cmtImg')},/*模版缩略图*/
			    //{fieldLabel : "<s:text name='cms_template.cmtDesc'/>",hidden:true,name:'cmtDesc', value:data.get('cmtDesc')},/*模版描述*/
			    //{fieldLabel : "<s:text name='cms_template.cmtContent'/>",hidden:true,name:'cmtDesc', value:data.get('cmtDesc')},/*模版内容*/
				{xtype:'combo',emptyText:'请选择',fieldLabel : "事件",hidden:false,name:'cmtPubStatus',allowBlank : false,value:data.get('cmtPubStatus'),store:[ ["1", "发布"], ["3", "撤销发布"]],triggerAction: 'all',selectOnFocus : true},/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
			    {xtype:'textarea',fieldLabel : "详细说明",name:'cmtComments'}/*说明不是组件内容或其他，注意，是用户填写的日志说明*/
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
						url : 'template_operateworkflow.action',			//此处需要调用后台方法，对于发布，调用保存或更新的方法；对于撤销发布，调用delete方法；获取到说明文本框中内容，写进数据库。
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
	*模板字段定义
	*/
	function templateFieldDedind(cmtId, cName){
	  /*
	   * 模板字段Store
	   */
	   var jsonObj=Ext.encode({'cmtId':cmtId});
	   var store_templatefield = Ext.create('Ext.data.Store',{
			model:'templatefieldModel',
			pageSize:50, // 每页显示50条记录
			autoLoad:true, // 加载时就读取数据
			proxy:{
				type:'ajax',
				extraParams:{rows:jsonObj},
				url:'templatefield_queryByCmtId.action',//请求后台信息
				method:'POST',
				reader:{
					type:'json',
					root:'ROOT', // 跟节点
					totalProperty:'TOTALCOUNT' // 总记录数
				}
			}
		});
		var tpFieldDdGrid = Ext.create('Ext.grid.Panel',{
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			store:store_templatefield ,
			selModel:{
				selType:'checkboxmodel'
			},
			multiSelect : true, // 允许多选
//			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_templatefield }, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
				   {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : 'ID',dataIndex : 'ctfId', flex:1}, 
			       {header :"<s:text name='cms_templatefield.ctfCmtId'/>",dataIndex:'cmtName',flex:1,renderer:function(cmtName){
			       		cmtName = cName;
			       		return cmtName;
			       }},
			       {header :"<s:text name='cms_templatefield.ctfViewName'/>",dataIndex : 'ctfViewName', flex:1}, 
			       {header :"<s:text name='cms_templatefield.ctfName'/>",dataIndex:'ctfName',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfType'/>",dataIndex:'ctfType',flex:1},
			       //{hidden:true,header :"<s:text name='cms_templatefield.ctfLength'/>",dataIndex:'ctfLength',flex:1},
			       //{hidden:true,header :"<s:text name='cms_templatefield.ctfWidth'/>",dataIndex:'ctfWidth',flex:1},
			       //{hidden:true,header :"<s:text name='cms_templatefield.ctfHeight'/>",dataIndex:'ctfHeight',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfOrderNum'/>",dataIndex : 'ctfOrderNum', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfSiteType'/>",dataIndex : 'ctfSiteType', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfLastuser'/>",dataIndex : 'ctfLastuser', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfLasttime'/>",dataIndex : 'ctfLasttime', flex:1,renderer:function(v){
			       	  return getDateTime(v);}
			       }
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
				   mkWindow("<s:text name='cms_templatefield.editTemplatefield'/>",[editTemplatefield(record,view)]);// 双击每条数据时弹出修改模板框
		        }
		   },
			tbar : [{
				text : "<s:text name='util.gridNewly'/>",	//新增
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					mkWindow("<s:text name='cms_templatefield.addTemplatefield'/>",[addTemplateField(cmtId,cName,grid)]); // 弹出新增字段框
				}
			}, '-', {
				text : "<s:text name='util.gridUpdate'/>",	//修改
				iconCls : 'icon-edit',
				handler : function() {
					var selcData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(selcData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>");
					} else if(selcData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");
					} else {
						mkWindow("<s:text name='cms_templatefield.editTemplatefield'/>",[editTemplatefield(selcData[0],this.up('grid'))]); // 弹出修改字段框
					}
				}
			}, '-', {	//删除
				text : "<s:text name='util.gridDelete'/>",
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
							        url : 'templatefield_del.action',
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
			},'-',{text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					   }
				   }
//				   ,'-',
//				  {text:"工作流",iconCls: 'icon-user',handler:function(){
//				    var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
//					if(secData.length < 1){
//						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>"); /*提示  您最少要选择一条记录*/
//					} else if(secData.length > 1){
//						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");/*提示  不能同时修改多条记录*/
//					} else {
//						mkWindow("操作工作流",[OperateWorkflowTemplate(secData[0],this.up('grid'))]);/*模版管理 操作工作流*/ // 弹出操作工作流框
//					}}}
				   ]
		});
		return Ext.create('Ext.panel.Panel',{
			border:false,
			layout:'border',
			width:750,
			height:500,
			items:[tpFieldDdGrid]
		});
	}
	
	/*
	 *添加模板字段
	 */
	 function addTemplateField(cmtId,cName,grid){
	    var addTemplatefieldForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table',
				columns:1
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:560
			},
			items : [
			    {
			      xtype:'hidden',
			      fieldLabel:'rebackMUBAN',
			      name:'ctfCmtId',
			      value:cmtId,
			      allowBlank : false
			    },
			    {
			      fieldLabel:"<s:text name='cms_templatefield.ctfCmtId'/>",
			      name:'copyCtfCmtId',
			      value:cName,
			      readOnly:true,
			      fieldCls:'text-readonly'
			    },
			    {
			    fieldLabel : "<s:text name='cms_templatefield.ctfViewName'/>",
			    name:'ctfViewName', 
			    allowBlank : false
			    },
			    {
			    fieldLabel :"<s:text name='cms_templatefield.ctfName'/>",
			    name:'ctfName',
			    regex:/^[A-Za-z0-9_]+$/,
			    regexText:"<s:text name='cms_templatefield.ctfNameRegex'/>",
				allowBlank : false
			    },
			    {
			    xtype:'combo',
			    fieldLabel :"<s:text name='cms_templatefield.ctfType'/>",
			    name:'ctfType',
			    store:[["text","<s:text name='cms_templatefield.text'/>"],["bigtext","<s:text name='cms_templatefield.bigtext'/>"],["int","<s:text name='cms_templatefield.int'/>"],["date","<s:text name='cms_templatefield.date'/>"],["img","<s:text name='cms_templatefield.img'/>"],["imglist","<s:text name='cms_templatefield.imglist'/>"]],
			    displayField:'ctfType',
			    valueField:'ctfType',
			    editable:false,
			    allowBlank : false
			    },
			    {xtype:'numberfield',minValue: 0,
			    fieldLabel :"<s:text name='cms_templatefield.ctfLength'/>",
			    name:'ctfLength',
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.lengthRegex'/>",
				allowBlank : true
			    },
			    {xtype:'numberfield',minValue: 0,
			    fieldLabel :"<s:text name='cms_templatefield.ctfWidth'/>",
			    name:'ctfWidth',
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.widthRegex'/>",
			    allowBlank : true
			    },
			    { xtype:'numberfield',minValue: 0, 
			    fieldLabel :"<s:text name='cms_templatefield.ctfHeight'/>",
			    name:'ctfHeight',
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.heightRegex'/>",
			    allowBlank : true
			    },
			    {xtype:'numberfield',minValue: 0,
			    fieldLabel :"<s:text name='cms_templatefield.ctfOrderNum'/>",
			    name:'ctfOrderNum',
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.orderNumRegex'/>",
			    allowBlank : false
			    },
			    {
			    xtype:'checkboxgroup',
			    fieldLabel :"<s:text name='cms_templatefield.ctfSiteType'/>",
			    name:'ctfSiteType',
			    defaults:{xtype:'checkboxfield'},
			    width:300,
			    items:[
			       {boxLabel:"web",inputValue :'web'},
			       {boxLabel:"iphone",inputValue:'iphone'},
			       {boxLabel:"ipad",inputValue:'ipad'}
			    ],
			    allowBlank : true
			    },
			    	
			{ 	xtype: 'radiogroup',
		        fieldLabel: "<s:text name='cms_templatefield.ctfSiteType'/>",
		        columns: 3,
		         defaultType: 'radiofield',
		        vertical: true,
		        items: [
           			{boxLabel: 'web',name: 'ctfSiteType',inputValue: 'web', checked: true},
            		{boxLabel: 'iphone',name: 'ctfSiteType',inputValue: 'iphone'},
        			{boxLabel: 'ipad',name: 'ctfSiteType',inputValue: 'ipad'}
        		]
			}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:330,
			items:[addTemplatefieldForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//获取选中的复选框
					var checkboxValues=form.findField('ctfSiteType').getChecked();
					//获取复选框中的值
					var ctfSiteType='';
					Ext.Array.each(checkboxValues,function(item){
						if(ctfSiteType.length!=0){
						ctfSiteType+=','+item.getSubmitValue();
						}else
						{
							ctfSiteType+=item.getSubmitValue();
						}
					});
					var submitValues=form.getValues();
					submitValues.ctfSiteType=ctfSiteType;
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'templatefield_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(submitValues)
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
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	 }
	 
	 /*
	 *修改模板字段
	 */
		function editTemplatefield(data,grid){
		var	web =data.get('ctfSiteType')=="web"?true:false;
		var	iphone =data.get('ctfSiteType')=="iphone"?true:false;
		var	ipad =data.get('ctfSiteType')=="ipad"?true:false;
		//alert(data.get('ctfSiteType'));//
			
		var editTemplatefieldForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table',
				columns:1
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:560
			},
			items : [
				{
			    fieldLabel :'Id',
			    hidden:true,
			    name:'ctfId',
			    value:data.get('ctfId')
			    },
			    {
			      xtype:'hidden',
			      fieldLabel:'rebackMUBAN',
			      name:'ctfCmtId',
			      value:data.get('ctfCmtId'),
			      allowBlank : false
			    },
			    {
			    fieldLabel : "<s:text name='cms_templatefield.ctfViewName'/>",
			    name:'ctfViewName', 
			    value:data.get('ctfViewName'),
			    allowBlank : false
			    },
			    {
			    fieldLabel : "<s:text name='cms_templatefield.ctfName'/>",
			    name:'ctfName',
			    value:data.get('ctfName'),
			    regex:/^[A-Za-z]+$/,
			    regexText:"<s:text name='cms_templatefield.ctfNameRegex'/>",
				allowBlank : false
			    },
			    {
			    xtype:'hidden',
			    fieldLabel : 'copyCtfName',
			    name:'copyCtfName',
			    value:data.get('ctfName'),
				allowBlank : false
			    },
			    {
			    xtype:'combo',
			    fieldLabel :"<s:text name='cms_templatefield.ctfType'/>",
			    name:'ctfType',
			    value:data.get('ctfType'),
			    store:[["text","<s:text name='cms_templatefield.text'/>"],["bigtext","<s:text name='cms_templatefield.bigtext'/>"],["int","<s:text name='cms_templatefield.int'/>"],["date","<s:text name='cms_templatefield.date'/>"],["img","<s:text name='cms_templatefield.img'/>"],
			    ["combo","combox"], ["checkbox","checkbox"], ["email","email"],   
			    ["imglist","<s:text name='cms_templatefield.imglist'/>"]],
			    displayField:'ctfType',
			    valueField:'ctfType',
			    editable:false,
			    allowBlank : false
			    },
			    {
			    fieldLabel :"<s:text name='cms_templatefield.ctfLength'/>",
			    name:'ctfLength',
			    value:data.get('ctfLength'),
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.lengthRegex'/>",
				allowBlank : true
			    },
			    {
			    fieldLabel :"<s:text name='cms_templatefield.ctfWidth'/>",
			    name:'ctfWidth',
			    value:data.get('ctfWidth'),
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.widthRegex'/>",
			    allowBlank : true
			    },
			    {  
			    fieldLabel :"<s:text name='cms_templatefield.ctfHeight'/>",
			    name:'ctfHeight',
			    value:data.get('ctfHeight'),
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.heightRegex'/>",
			    allowBlank : true
			    },
			    {
			    fieldLabel :"<s:text name='cms_templatefield.ctfOrderNum'/>",
			    name:'ctfOrderNum',
			    value:data.get('ctfOrderNum'),
			    emptyText : "<s:text name='cms_templatefield.IntpromptTitle'/>",
			    regex:/^\d+$/,
				regexText:"<s:text name='cms_templatefield.orderNumRegex'/>",
			    allowBlank : false
			    },
			    
			    { 	xtype: 'radiogroup',
		        fieldLabel: "<s:text name='cms_templatefield.ctfSiteType'/>",
		        columns: 3,
		         defaultType: 'radiofield',
		        vertical: true,
		        items: [
           			{boxLabel: 'web',name: 'ctfSiteType',inputValue: 'web',checked : web},
            		{boxLabel: 'iphone',name: 'ctfSiteType',inputValue: 'iphone',checked : iphone},
        			{boxLabel: 'ipad',name: 'ctfSiteType',inputValue: 'ipad',checked : ipad}
        		]
			}
			    /*{
			    xtype:'checkboxgroup',
			    fieldLabel :"<s:text name='cms_templatefield.ctfSiteType'/>",
			    name:'ctfSiteType',
			    width:300,
			    items:[
			       {boxLabel:"web",inputValue :'web'},
			       {boxLabel:"iphone",inputValue:'iphone'},
			       {boxLabel:"ipad",inputValue:'ipad'}
			    ],
			    allowBlank : true,
			      listeners:{afterrender:function(component,eOpts){
						//修改时获取已选站点类型
						var checkboxgroupItems=component.items;
						 for (var i = 0; i < checkboxgroupItems.length; i++)    
			            {    
			            	var obj=checkboxgroupItems.getAt(i);
			            	var dbPrivDatas=data.get('ctfSiteType').split(',');
			            	Ext.Array.each(dbPrivDatas,function(item){
			            		if(item==obj.inputValue)
			            		{
			            			obj.setValue(true);
			            		}
			            	});
			            }  
					}
			    }}*/
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:330,
			items:[editTemplatefieldForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//获取选中的复选框
				/*	var checkboxValues=form.findField('ctfSiteType').getChecked();
					//获取复选框中的值
					var ctfSiteType='';
					Ext.Array.each(checkboxValues,function(item){
						if(ctfSiteType.length!=0){
						ctfSiteType+=','+item.getSubmitValue();
						}else
						{
							ctfSiteType+=item.getSubmitValue();
						}
					});*/
					var submitValues=form.getValues();
					//submitValues.ctfSiteType=ctfSiteType;
					//alert(submitValues.ctfSiteType);
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'templatefield_modify.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(submitValues)
								},
						        success : function(response, opts){
						        	grid.getStore().load();
						        	
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	
	/*
	 * 用户管理面板
	 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='cms_template'/>", // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[templateFForm(),grid_template()]//TabPanel中的标签页
    }); 
})();