<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
  (function(){
	/** 栏目表cmspageModel*/
	Ext.define('CMS_PAGE',{
	extend:'Ext.data.Model',
	fields : [
		'cmpId','cmt','cmpCmmId','CmsTemplatecmt','parentCmpId','cmpLayerid','cmpTitleName','cmpName','cmpStatus','cmpPubStatus',
		'cmpPubTime','cmpOrderNum','cmpNavigationName','cmpIsColumn','cmpIsNavigation','cmpIsWebmap','cmpIsIndexTop',
		'cmpIsCloumnTop','cmpTitleImg','cmpDesc','cmpViewtime','cmpSkipType','cmpSkipOpen','cmpSkipUrl','cmpIsStatic',
		'cmpDirName','cmpFileName','cmpSeoKeywords','cmpSeoDescription','cmpCssId','cmpAddCssId','cmpStartTime','cmpEndTime',
		'cmpOuterTrackingcode','cmpContent','cmpVisits','cmpAdduser','cmpAddtime','cmpLastuser','cmpLasttime','cmpIsPublic','cmpContentType'] // 对应栏目表中的字段，建议全部写出
	});
	
	/**模板表Model*/
	Ext.define('page_templateModel',{
		extend:'Ext.data.Model',
		fields : ['cmtId','cmtName','cmtImg','cmtDesc','cmtUrl','cmtContent','cmtPubStatus','cmtLastuser','cmtLasttime'] 
	});
	/**根据模板id 对模板字段定义的查询  */	
	Ext.define('page_templatefieldModel',{
		extend:'Ext.data.Model',
		fields : ['cmtName','ctfId','ctfCmtId','ctfViewName','ctfName','ctfType','ctfLength','ctfWidth','ctfHeight','ctfOrderNum','ctfSiteType','ctfLastuser','ctfLasttime'] 
	});
	
	/***发布状态*/
    Ext.define('pageAuditType',{
		extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'text'}
	    ]
	});
	//0编辑 1未发布 2发布 3撤销发布  4申请审核  5审核未通过  6审核通过
	var pageAuditTypeData=[
		{value:0,text:"编辑"},
		{value:1,text:"未发布"},
		{value:2,text:"发布"},
		{value:3,text:"撤销发布"},
		{value:4,text:"申请审核"},
		{value:5,text:"审核未通过"},
		{value:6,text:"审核通过"}];
	var pageAuditTypeStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'pageAuditType',
	    data : pageAuditTypeData,
	    proxy: {
	        type: 'memory'
	    }
    });
     Ext.define('pageContentType',{
		extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'text'}
	    ]
	});
    //内容类型0、孕期  1、1-6个月 2、6-12个月 3、 1-3岁  4、3-6岁 、-1：其他类型
	var cmpContentTypeData=[
		{value:-1,text:"　"},
		{value:0,text:"孕期"},
		{value:1,text:"1-6个月"},
		{value:2,text:"6-12个月"},
		{value:3,text:" 1-3岁"},
		{value:4,text:"3-6岁 "}];
	var cmpContentTypeStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'pageContentType',
	    data : cmpContentTypeData,
	    proxy: {
	        type: 'memory'
	    } });
    var actionTypeData=[
		{value:0,text:"无跳转"},
		{value:1,text:"内部跳转"},
		{value:2,text:"资源跳转"},
		{value:3,text:"外部跳转"}
	];
    var actionTypeStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'pageAuditType',
	    data : actionTypeData,
	    proxy: {
	        type: 'memory'
	    }
    });
    var pageSubmitMask = new Ext.LoadMask(Ext.getBody(), {msg : "提交中，请稍后..."});
	/** 栏目表Store */
   var store_page = Ext.create('Ext.data.Store',{
		model : 'CMS_PAGE',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'page_query.action',//请求后台西信息
			extraParams:{nodeid:0},
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/** 模板表Store */
   var page_store_template = Ext.create('Ext.data.Store',{
		model:'page_templateModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'template_query.action',//请求后台信息  
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
		});
    /**栏目Form查找面板*/
	function pageMgrForm(){
	   return Ext.create('Ext.form.Panel', {
			region:'north',
			height:40,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:4,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:70,width:210
			},
			items:[
					{xtype:'textfield',fieldLabel:'名称',name:'cmpName'},
					{xtype: 'button',width:60,margin:'0 0 5 30',text:'查询',iconCls:'icon-find'
						,handler:function(){
							var form = this.up('form').getForm();
							var store = this.up('form').up('panel').child('grid').getStore();
							var vals=form.getValues();
							var jsonObj=Ext.encode({cmpName:vals.cmpName});
							  store.getProxy().extraParams = {rows:jsonObj};
							  store.load();
						}
					}
				  ]
			});
	}
    /** page信息列表   */
	function grid_page(){
		return Ext.create('Ext.grid.Panel',{
			title : '内容信息',
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_page, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'},
			multiSelect : true, //允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_page}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
					{header : 'ID',	dataIndex : 'cmpId',flex:1},
					{header : '所属站点',dataIndex : 'cmpCmmId',hidden:true},
					{header : '模板名称',dataIndex : 'cmt', renderer:function(value){return value!=""? value.split(';')[1]:""},	flex:1},
					{header : '父页 ',dataIndex : 'parentCmpId',hidden:true},
					{header : '级联ID ',dataIndex : 'cmpLayerid',hidden:true},
					{header : '浏览器名称',dataIndex : 'cmpTitleName',hidden:true},
					{header : '名称',dataIndex : 'cmpName',flex:1},
					{header : '当前状态',dataIndex : 'cmpStatus',flex:1,
						renderer:function(v){
				         		var pageStateText= getTextByStore(pageAuditTypeStore,v,"value","text");
				         		return pageStateText;
						}
					},
					{header : '发布状态',dataIndex : 'cmpPubStatus',	flex:1,
						renderer:function(v){
				         		var pageStateText= getTextByStore(pageAuditTypeStore,v,"value","text");
				         		return pageStateText;
						}
					},
					{header : '文件名称',dataIndex : 'cmpDirName',hidden:true},
					{header : '跳转URL',dataIndex : 'cmpSkipUrl',hidden:true},
					{header : '跳转打开方式',dataIndex : 'cmpSkipOpen',hidden:true},
					{header : '跳转类型',dataIndex : 'cmpSkipType',hidden:true},
					{header : '显示时间 ',dataIndex : 'cmpViewtime',hidden:true},
					{header : '简介 ',dataIndex : 'cmpDesc',hidden:true,renderer:function(v){return Ext.htmlEncode(v);}},
					{header : '排序值 ',dataIndex : 'cmpOrderNum',hidden:true},
					{header : '导航名称 ',dataIndex : 'cmpNavigationName',hidden:true},
					{header : '是否栏目',dataIndex : 'cmpIsColumn',hidden:true},
					{header : '是否导航',dataIndex : 'cmpIsNavigation',hidden:true},
					{header : '是否网站地图',dataIndex : 'cmpIsWebmap',hidden:true},
					{header : '是否首页置顶',dataIndex : 'cmpIsIndexTop',hidden:true},
					{header : '是否栏目置顶',dataIndex : 'cmpIsCloumnTop',hidden:true},
					{header : '题头图 ',dataIndex : 'cmpTitleImg',hidden:true},
					{header : '发布时间 ',dataIndex : 'cmpPubTime',hidden:true},
					{header : '是否静态',dataIndex : 'cmpIsStatic',hidden:true},
					{header : 'SEO_文件名称',dataIndex : 'cmpFileName',hidden:true},
					{header : 'SEO关键字',dataIndex : 'cmpSeoKeywords',hidden:true},
					{header : 'SEO描述',dataIndex : 'cmpSeoDescription',hidden:true},
					{header : '样式表 ',dataIndex : 'cmpCssId',hidden:true},
					{header : '新增样式',dataIndex : 'cmpAddCssId',hidden:true},
					{header : '开始日期',dataIndex : 'cmpStartTime',hidden:true},
					{header : '结束日期',dataIndex : 'cmpEndTime',hidden:true},
					{header : '监听代码  ',dataIndex : 'cmpOuterTrackingcode',hidden:true,renderer:function(v){return Ext.htmlEncode(v);}},
					{header : '页面数据 ',dataIndex : 'cmpContent',hidden:true,renderer:function(v){return Ext.htmlEncode(v);}},
					{header : '访问数 ',dataIndex : 'cmpVisits',hidden:true},
					{header : '添加人',dataIndex : 'cmpAdduser',hidden:true},
					{header : '添加时间 ',dataIndex : 'cmpAddtime',hidden:true},
					{header : '最后修改人',dataIndex : 'cmpLastuser',	flex:1},
					{header : '是否公开',dataIndex : 'cmpIsPublic',hidden:true},
					{header : '内容类型 ',dataIndex : 'cmpContentType',hidden:true,
						renderer:function(v){
				         		var cmpContentTypeText= getTextByStore(cmpContentTypeStore,v,"value","text");
				         		return cmpContentTypeText;
						}},
					{header : '最后修改时间',type:'date',renderer:function(v){
			       	  return getDateTime(v);
		         	},dataIndex : 'cmpLasttime',	flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
				   mkWindow("编辑",[editPage(record,view)]);
			}},
			tbar : [
				{
				text : '预览',
				iconCls : 'icon-preview',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert('提示','请选择要预览的内容');
					} else if(secData.length > 1){
						Ext.Msg.alert('提示','对不起，不能同时预览多条');
					}
					else{
						var modifyData=secData[0];
						window.open("cms/p-"+modifyData.get('cmpId')+".htm");
					}
				}
			}, '-',{
				text : 'Iphone预览',
				iconCls : 'icon-preview',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert('提示','请选择要预览的内容');
					} else if(secData.length > 1){
						Ext.Msg.alert('提示','对不起，不能同时预览多条');
					}
					else{
						var modifyData=secData[0];
						window.open("cms/ph-"+modifyData.get('cmpId')+".htm","_blank", 'width=338 , height=600,scrollbars=yes');
					}
				}
			}, '-',{
				text : '静态生成',
				iconCls : 'icon-preview',
				handler : function() {
					var pageLoadMask = new Ext.LoadMask(Ext.getBody(), {msg : "生成中，请稍后..."});
					pageLoadMask.show();
					Ext.Ajax.request( {
						type: 'ajax',
				        url : 'page_html.action',
				        method : 'POST',
				        timeout:60000,
						success : function(response, opts) {
							pageLoadMask.hide();
							 var retData = Ext.decode(response.responseText);
							 if(!retData.success){
							 	Ext.Msg.alert('提示',retData.msg);
							 }else{
							  	Ext.Msg.alert('提示',"生成成功!");
							 }
						},
						failure : function(form, action) {
							funFailure(response, opts);
						}
					});
				}
			}, '-',{
				text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
					if(treePanel.getSelectionModel().getSelection().length<1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"请选择要添加的父节点"/**请选择要添加的父节点*/);
						return;
					}
					//获取树的父节点ID
					var parentCmpId=treePanel.getSelectionModel().getSelection()[0].get('id');
					mkWindow("新增",[addPage(grid,parentCmpId,treePanel)]); // 弹出新增栏目框
				}
			}, '-',{
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert('提示','您最少要选择一条记录');
					} else {
						var modifyData=secData[0];
						//审核中
						if(modifyData.get('cmpStatus')==4){
							Ext.Msg.alert('提示','对不起,不能编辑审核中的内容');
						}else{
							mkWindow("编辑",[editPage(modifyData,this.up('grid'))]); // 弹出修改栏目框
						}
					}
				}
			}, '-',{
				text : '删除',
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						var isCheckedIng=false;
						Ext.Array.each(secData,function(record){
							if(record.get('cmpStatus')==4){	
								isCheckedIng=true;
							}
						});
						//审核中
						if(isCheckedIng){
							Ext.Msg.alert('提示','对不起,不能删除审核中的内容');
							}
							else{
							var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
							Ext.MessageBox.confirm("提示","你确定要删除吗?",function(btn){
								if(btn=="yes"){
									//同时删除多条记录
									var jsonArr = [];
									Ext.Array.each(secData,function(record){
										jsonArr.push(record.data);
									});
									pageSubmitMask.show();
									Ext.Ajax.request( {
										type: 'ajax',
								        url : 'page_del.action',
								        method : 'POST',
								        params : { 
											rows:Ext.encode(jsonArr) // 已字符窜形式传到后台
										},
										success : function(response, opts) {
											pageSubmitMask.hide();
											//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
											 var retData = Ext.decode(response.responseText);
											 var valid= retData.success
											 if(!valid){
											 	
											 	 Ext.Msg.alert('提示',retData.msg);
											 } else {
											 	 Ext.Msg.alert('提示',retData.msg);
											 	 grid.getStore().load(); // 重新加载数据
											 	 var treeStore =treePanel.getStore();
												treePanel.getRootNode().removeAll();
												treeStore.load();
											 }
										},
										failure : function(form, action) {
											funFailure(response, opts);
										}
									});
								}
							});
						}
					} else {
						Ext.Msg.alert('提示','请至少选择一行进行操作');
					}
				}
			},'-',{
			   text:"工作流",iconCls: 'icon-add',
			   handler:function(){
					var selcData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(selcData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要审核的内容");
					} else if(selcData.length > 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","对不起,不能审核多条记录");
					} else {
						var record = selcData[0];
						var grid = this.up('grid');
						mkWindow("工作流",[workflow(record,grid)]); // 弹出审核列表
					}
				 }
			}
			,'-',{text:"刷新"/*'刷新'*/,iconCls: 'icon-refresh',
				handler:function(){
				var grid = this.up('grid');
				grid.getStore().load();
			 }
			}
			]
		});
	}
	/**加载树信息*/
	function mrgTreePanel(){
		Ext.define('pageModel', {
			extend : 'Ext.data.Model',
			fields : [{name : 'cmpId',type : 'int'},'text','children', 'url', 'tag',{name:'id',mapping:'cmpId'},'pId']// text 必须的 否则得设置,
		});
		var pageTreeStore = Ext.create('Ext.data.TreeStore', {
			model : 'pageModel',
			nodeParam:'cmpId',
			root : {
				text : '内容管理',
				expanded : true,
				id:0
			},
			proxy : {
				type : 'ajax',
				method:'POST',
				url : "lefttree_getSiteTreeByCmpId.action"
			}
		});
		//获取菜单树
		var pageTreePanel=Ext.create('Ext.tree.Panel', {
			heard:false,
			animate : true,
			width : 260,
			collapsible : true,
			split : true,
			region:'west',
			rootVisible : true,
			//resizable : true,
			//useArrows : true,
			store :pageTreeStore,
			tools : [{
				type : 'refresh',
				handler : function(event, toolEl, panel) {
					var treePanel=this.up('treepanel');
					var treeStore =treePanel.getStore();
					var selFreshNode=treePanel.getSelectionModel().getSelection();
					treePanel.getRootNode().removeAll();
					treeStore.load();
					selectRootNode(treePanel,treeStore);
					//加载gridStore
					var gridStore = treePanel.up('panel').down('grid').getStore();
					gridStore.getProxy().extraParams={nodeid:0};
					gridStore.load();
				}
			}],
			listeners : {
				afterrender:function(component,eOpts){
					var rootStore=component.getStore();
					selectRootNode(component,rootStore);
				},
				itemclick : function(me, rec, item, index, e, eOpts) {
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
					var store = this.up('panel').down('grid').getStore();
					store.getProxy().extraParams={nodeid:rec.get('cmpId')};
					store.load();
					pageTreePanel.getSelectionModel().select(thisNode,true);
				}
			}
		});
		return pageTreePanel;
	}
	//选择根节点
	function selectRootNode(treePanel,rootStore){
		//数据是否在加载中
		function rootMenuIsLoading(){
			if(rootStore.isLoading())
			{
				window.setTimeout(function(){rootMenuIsLoading();},200);
			}else{
				treePanel.getSelectionModel().select(rootStore.getRootNode(),true);
			}
		}
		rootMenuIsLoading();
	}
	//添加信息
	function addPage(grid,parentCmpId,treePanel){
		return Ext.create('Ext.form.Panel',{
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
				width:260
			},
			width:280,
			height:190,
			items:[
				{xtype:'combo',fieldLabel : '模板名称',name:'cmtName',displayField:'cmtName',valueField:'cmtId',
					editable:false,allowBlank : false,store:page_store_template},
				{name : 'parentCmpId',xtype:'hidden',value:parentCmpId},
				{fieldLabel : '名称',name : 'cmpName',allowBlank : false},
				{fieldLabel : '浏览器名称 ',name : 'cmpTitleName'},/*不能为空 后台Action处理*/
				{ xtype: 'numberfield',minValue: 0,fieldLabel : '排序值 ',name : 'cmpOrderNum',value:0,allowBlank : true},
				{xtype:'triggerfield',fieldLabel:'题头图',name:'cmpTitleImgText',
					triggerCls:Ext.baseCSSPrefix + 'form-search-trigger',
					onTriggerClick:function(){
						var form =this.up('form').getForm();
						mkWindowForEdit('选择资源',mkSelResourceTree(function(data){
		    				form.findField('cmpTitleImgText').setValue(data.get('text'));
		    				form.findField('cmpTitleImg').setValue(data.get('cmrId'));
		    			}));
					}
				},
				{xtype: 'hidden',name : 'cmpTitleImg'}
			], // 将表单面板加入该panel中
			fbar:[{
				text:'确定',margin:'0 5 0 0',
				handler:function(){
					var form = this.up('form').getForm();
					var win = this.up('window');
					if(!form.isValid()) { 
						return;
					}
					pageSubmitMask.show();
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'page_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(form.getValues())
								},
						        success : function(response, opts){
						        	pageSubmitMask.hide();
						        	 var retData = Ext.decode(response.responseText);
									 var valid= retData.success
									 if(!valid){
									 	
									 	 Ext.Msg.alert('提示',retData.msg);
									 	 return;
									 }else{
							        	funSuccess(response, opts,win,grid);
										var treeStore =treePanel.getStore();
										treePanel.getRootNode().removeAll();
										treeStore.load();
									 }
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:'取消',margin:'0 10 0 0',handler:function(){this.up('window').close();}}]
		});
	}
	
	/** 修改栏目,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editPage(data,grid){
			var p1 =mktabEditPanel1(data);
			var p2 =mktabEditPanel2(data);
			var p3 =mktabEditPanel3(data);
			var p4 =mktabEditPanel4(data);
			var p5 =mktabEditPanel5(data);
			var editPageForm = Ext.create('Ext.tab.Panel',{
			plain: true,
			border:false,
			region:'center',
			activeTab: 0,
			bodyStyle:{background:'transparent'},
			items :[ p1, p2,p3,p4,p5]//大的items结束
		});
		return Ext.create('Ext.form.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			autoScroll :true, // 按需滚动
			border:false,
			height:420,
			bodyStyle:{background:'transparent'},
			items:[editPageForm], // 将表单面板加入该panel中
			///-------------加载数据开始
			listeners:{afterrender:function(tabPanel,eOpts){
				var component=p4;
				//------加载页面数据Start
				var store_template = Ext.create('Ext.data.Store',{
					model:'page_templatefieldModel',
					proxy:{
						type:'ajax',
						url:'templatefield_queryByCmtId.action',//请求后台信息
						extraParams:{rows:Ext.encode({cmtId:data.get('cmt').split(';')[0]})},//获取的模板传递过去
						
						method:'POST',
						reader:{
							type:'json',
							root:'ROOT', // 跟节点
							totalProperty:'TOTALCOUNT' // 总记录数
							}
						}
				});	
				Ext.define('FIELD_TYPE', {
				    extend: 'Ext.data.Model',
				    fields: [
				        {name: 'value'},
				        {name: 'xtype'}
				      ]
				  });
					var fieldTypeData=[
							{value:'text',xtype:"textfield"},
							{value:'bigtext',xtype:"textareafield"},
							{value:'int',xtype:"numberfield"},
							{value:'date',xtype:"datefield"},
							{value:'img',xtype:"filefield"},
							{value:'imglist',xtype:"filefield"},
							{value:'checkbox',xtype:"checkbox"},
							{value:'combo',xtype:"combo"}
						];
					
					var fieldTypeStore=Ext.create('Ext.data.Store',{
						autoLoad: true,
					    model: 'FIELD_TYPE',
					    data : fieldTypeData,
					    proxy: {
					        type: 'memory'
					    }
				    });
				    //------加载页面数据End
				store_template.load({
				       callback: function(records, options, success)
				       	{
							//获取集合
							var collectionData=[];
							//获取集合For Iphone
							var collectionDataForIphone=[];
							//获取集合信息for Ipad
							var collectionDataForIPad=[];
							//需要添加内容的模板名称
							var fields=[]; 
			                store_template.each(function(item){
			                	//获取属于站点类型'web','iphone','ipad'
			                	var siteType=item.get('ctfSiteType');
			                	var xtype= getTextByStore(fieldTypeStore,item.get('ctfType'),"value","xtype");
			                	var el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};
			                	fields.push(item.get('ctfName'))
			                	if('textareafield'==xtype)
			                	{
			                		el={xtype:xtype,height:150,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};
			                	}
			                	if('numberfield'==xtype)
			                	{
			                		el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName'),minValue:0};
			                	}
			                	if('email' ==xtype)/** 邮箱 验证格式*/
			                	{
			                		el={vtype:'email',fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};	
			                	}
		                		if('datefield' ==xtype)
			                	{
			                		el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName'),format:'Y-m-d',dateFormat:'Y/m/d'};	
			                	}
			                	if('filefield'==xtype)
			                	{
			                		el={xtype:"textfield",fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};	
			                	}
			                	if("textareafield"==xtype){
				                		if(siteType=='iphone'){
				                			  el={
								        	xtype:'form',
											height:135,
											width:420,
											border:false,
											layout:{ 
												type:'table' // 表格布局
												,columns:2 
												,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
												,tdAttrs:{align:'left'}
											},
											bodyStyle:{background:'transparent'},
											items:[
												{	
													labelAlign:'right',
													rowspan:'2',
													xtype:"textareafield",
													height : 120,
													width : 320,
													labelWidth:80,
													fieldLabel:item.get('ctfViewName'),
													name:item.get('ctfName'), 
													allowBlank : true,
													style:{resize: 'none'}
													,listeners: {}
												}
												,{xtype: 'button',width:60,margin:'30 0 0 5',text:'编辑',iconCls:'icon-edit'
													,handler:function(){
														//-----------KingEdit---Start
														var butItems = ['source', '|', 'undo', 'redo', '|','cut', 'copy', 'paste',
														'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
														'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
														'superscript', 'clearhtml', 'selectall', '|', 'fullscreen', '/',
														'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
														'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table','link', 'unlink'];
														var textAreEl=this.up('form').getForm().findField(item.get('ctfName'));
														mkWindowForEdit("编辑HTML",[pageEditor(butItems,textAreEl)],600,400);
													}
												},{xtype: 'button',width:60,margin:'10 0 5 5',text:'预览',iconCls:'icon-edit'
													,handler:function(){
														var form=this.up("form");
													previewIphone(form,item.get('ctfName'),data.get('cmpTitleName'));}
												}
											]
										}
			                		}else if(siteType=='ipad'){
			                			
			                		}
			                		else{ el={
							        	xtype:'form',
										height:135,
										width:420,
										border:false,
										layout:{ 
											type:'table' // 表格布局
											,columns:2 
											,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
											,tdAttrs:{align:'left'}
										},
										bodyStyle:{background:'transparent'},
										items:[
											{	
												labelAlign:'right',
												xtype:"textareafield",
												height : 120,
												width : 320,
												labelWidth:80,
												fieldLabel:item.get('ctfViewName'),
												name:item.get('ctfName'), 
												allowBlank : true,
												style:{resize: 'none'}
												,listeners: {}
											}
											,{xtype: 'button',width:60,margin:'95 0 5 5',text:'编辑',iconCls:'icon-edit'
												,handler:function(){
													//-----------KingEdit---Start
													var butItems = ['source', '|', 'undo', 'redo', '|','cut', 'copy', 'paste',
													'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
													'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
													'superscript', 'clearhtml', 'selectall', '|', 'fullscreen', '/',
													'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
													'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table','link', 'unlink'];
													var textAreEl=this.up('form').getForm().findField(item.get('ctfName'));
													mkWindowForEdit("编辑HTML",[pageEditor(butItems,textAreEl)],600,400);
												}
											}
										]
									}}
									 el={
							        	xtype:'form',
										height:135,
										width:420,
										border:false,
										layout:{ 
											type:'table' // 表格布局
											,columns:2 
											,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
											,tdAttrs:{align:'left'}
										},
										bodyStyle:{background:'transparent'},
										items:[
											{	
												labelAlign:'right',
												xtype:"textareafield",
												height : 120,
												width : 320,
												labelWidth:80,
												fieldLabel:item.get('ctfViewName'),
												name:item.get('ctfName'), 
												allowBlank : true,
												style:{resize: 'none'}
												,listeners: {}
											}
											,{xtype: 'button',width:60,margin:'95 0 5 5',text:'编辑',iconCls:'icon-edit'
												,handler:function(){
													//-----------KingEdit---Start
													var butItems = ['source', '|', 'undo', 'redo', '|','cut', 'copy', 'paste',
													'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
													'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
													'superscript', 'clearhtml', 'selectall', '|', 'fullscreen', '/',
													'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
													'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table','link', 'unlink'];
													var textAreEl=this.up('form').getForm().findField(item.get('ctfName'));
													mkWindowForEdit("编辑HTML",[pageEditor(butItems,textAreEl)],600,400);
												}
											}
										]
									}
			                		/*el={xtype:'panel',
			                			autoScroll:true,
										height:280,
										width:390,
										border:false,
										bodyStyle:{background:'transparent'},
										items:[
											{
												labelWidth:80,
												labelAlign:'right',
												width:780,
												height:280,
												xtype:'textareafield',
												fieldLabel : item.get('ctfViewName'),
												name :item.get('ctfName'), 
												style:{resize: 'none'},
								                listeners: {
								                    afterrender: CreateEdit
								                }
											}
										]
									};*/
							     
							        //el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName'),height:180,width:360};
			                	}
			                	if(siteType=='iphone'){//'web','iphone','ipad'
			                		collectionDataForIphone.push(el);
			                	}
			                	else if(siteType=='ipad'){
			                		collectionDataForIPad.push(el);
			                	}
			                	else{
			                		collectionData.push(el);
			                	}
								
							});
							component.add(collectionData);//web内容
							p5.add(collectionDataForIphone);//iphone内容
							
							//数据是否在加载中
							function storeIsLoading(){
								if(store_page.isLoading())
								{
									window.setTimeout(function(){storeIsLoading();},200);
								}else{
									store_page.each(function(item){
										if(data.get('cmpId')==item.get('cmpId'))
										{
											var xmlData=item.get('cmpContent');
											if(''==xmlData || 'undefined'==xmlData || null==xmlData)
											{
												tabPanel.body.unmask();
												return;
											}
											var xdoc;  
											if(typeof(DOMParser) == 'undefined'){  
											    xdoc = new ActiveXObject("Microsoft.XMLDOM");  
											    xdoc.async="false";  
											    xdoc.loadXML(xmlData);  
											}else{  
											    var domParser = new DOMParser();  
											    xdoc = domParser.parseFromString(xmlData, 'application/xml');  
											    domParser = null;  
											}  
											 Ext.define('Fields', {
											    extend: 'Ext.data.Model',
											    fields: fields
											});
											var xmlStore = Ext.create('Ext.data.Store', {
											    model: 'Fields',
											    data :xdoc,
											    proxy: {
											        type: 'memory',
											        reader: {
											            type: 'xml',
											            record: 'fieldList'
											        }
											    }
											    
											});
											xmlStore.load();
											//数据是否在加载中
												function xmlStoreIsLoading(){
													if(xmlStore.isLoading())
													{
														window.setTimeout(function(){storeIsLoading();},200);
													}else{
														Ext.Array.each(fields,function(fieldName){
															var nodeValue = xmlStore.getAt(0).get(fieldName);
															if( ''==nodeValue){
																nodeValue='';
															}
															var webType=component.getForm().findField(fieldName);//web类型
															var iphoneType=p5.getForm().findField(fieldName);//iphone类型
															//var iPadType=p5.getForm().findField(fieldName).xtype;
															if(webType)
															{
																if((component.getForm().findField(fieldName).xtype=='datefield') && (''!=nodeValue))
																{
																	component.getForm().findField(fieldName).setValue(getDate(nodeValue));
																}else if((component.getForm().findField(fieldName).xtype=='textareafield')){
																	component.getForm().findField(fieldName).setValue(nodeValue);
																}else{
																	component.getForm().findField(fieldName).setValue(nodeValue);
																}
															}else if(iphoneType){
																if((p5.getForm().findField(fieldName).xtype=='datefield') && (''!=nodeValue))
																{
																	p5.getForm().findField(fieldName).setValue(getDate(nodeValue));
																}else if((p5.getForm().findField(fieldName).xtype=='textareafield')){
																	p5.getForm().findField(fieldName).setValue(nodeValue);
																}else{
																	p5.getForm().findField(fieldName).setValue(nodeValue);
																}
															}
															
														});
													}
												}
											xmlStoreIsLoading();
										}
									});
								}
							}
							storeIsLoading();
							tabPanel.body.unmask();
				
				       }});
			},
			 beforerender: function(p) {
	            p.body.mask('Loading...');
	        },
	        delay: 1000
			},///-------------加载时间结束
			fbar:[{
				text:'确定',
				handler:function(){
					var form = this.up('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					var fieldsCount=0;
					var xmlContent="<?xml version=\"1.0\" encoding=\"utf-8\" ?> ";
					xmlContent+="<fieldList>";
					var t1="<";
					var t2=">";
					var t3="/";
					var fields=p4.getForm().getFields();//web内容
					fieldsCount+=fields.length;
					for(var i=0;i<(fields.length);i++)//web内容
					{
						if(fields.getAt(i).value==null )
						{
							fields.getAt(i).value='';
						}
						if(fields.getAt(i).xtype =='textareafield')
						{
							//Ext.Array.each(textAreObjs,function(obj){
								//if(obj.name==fields.getAt(i).name){
									fields.getAt(i).value="<![CDATA["+fields.getAt(i).value+"]]>";
									//fields.getAt(i).value="<![CDATA["+obj.editor.html()+"]]>";
								//}
							//});
						}
						xmlContent+=t1+fields.getAt(i).name+t2+fields.getAt(i).value+t1+t3+fields.getAt(i).name+t2;
					}
					fields=p5.getForm().getFields();//Iphone内容
					fieldsCount+=fields.length;
					for(var i=0;i<(fields.length);i++)//Iphone内容
					{
						if(fields.getAt(i).value==null )
						{
							fields.getAt(i).value='';
						}
						if(fields.getAt(i).xtype =='textareafield')
						{
							//Ext.Array.each(textAreObjs,function(obj){
								//if(obj.name==fields.getAt(i).name){
									fields.getAt(i).value="<![CDATA["+fields.getAt(i).value+"]]>";
									//fields.getAt(i).value="<![CDATA["+obj.editor.html()+"]]>";
								//}
							//});
						}
						xmlContent+=t1+fields.getAt(i).name+t2+fields.getAt(i).value+t1+t3+fields.getAt(i).name+t2;
					}
					
					xmlContent+="</fieldList>";
					//找到json获取的name  后台接受传递的文件
					var subValue=form.getValues();
					subValue.cmpIsColumn=(form.findField('cmpIsColumn').getValue()==false)?0:1;
					subValue.cmpIsNavigation=(form.findField('cmpIsNavigation').getValue()==false)?0:1;
					subValue.cmpIsWebmap=(form.findField('cmpIsWebmap').getValue()==false)?0:1;
					subValue.cmpIsIndexTop=(form.findField('cmpIsIndexTop').getValue()==false)?0:1;
					subValue.cmpIsCloumnTop=(form.findField('cmpIsCloumnTop').getValue()==false)?0:1;
					subValue.cmpIsPublic=(form.findField('cmpIsPublic').getValue()==false)?0:1;
					//alert(">>>>>>:  "+subValue.cmpSkipType);
					/**是否静态*/
					subValue.cmpIsStatic=(form.findField('cmpIsStatic').getValue()==false)?0:1;
					subValue.cmpContent=xmlContent;
					subValue.fieldLength=fieldsCount;
					subValue.pagePId=data.get('parentCmpId');
					form.submit( {
						url : 'page_modify.action',
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(subValue)
						},
				        success : function(response, opts){
				        	funSuccess(response, opts,win,grid);
				        },
				        failure:function(response, opts){
				       	 	if(opts.result.msg){
				        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				        	}else{
				       	 	funFailure(response, opts);
				       	 	}
				       	}
					});
				}
			},{text:'取消',handler:function(){this.up('window').close();}}]
		});
	}

	function  mktabEditPanel1(data){
		
		var value=data.get('cmt');
		value=value.split(';')[0];
		return  Ext.create('Ext.panel.Panel',{
			title:'基础信息',
			border:false,
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
				width:360
			},
				items : [
					{xtype : 'hidden',name : 'cmpId',value:data.get('cmpId')},
					{xtype:'combo',fieldLabel : '模板名称',name:'cmtName',fieldCls:'text-readonly',
					 displayField:'cmtName',valueField:'cmtId',editable:false,readOnly : true,allowBlank : false,
					 store:page_store_template,value:value},
					{xtype:'hidden',fieldLabel : '父页 ',name : 'parentCmpId',allowBlank : false, value:data.get('parentCmpId')},
					{xtype:'hidden',fieldLabel : '级联ID',name : 'cmpLayerid',allowBlank : true, value:data.get('cmpLayerid')},
					{fieldLabel : '名称',name : 'cmpName',allowBlank : false, value:data.get('cmpName')},
					{fieldLabel : '浏览器名称 ',name : 'cmpTitleName',allowBlank : false, value:data.get('cmpTitleName')},
					{xtype: 'hidden',fieldLabel : '发布状态 ',name:'cmpPubStatus',value:data.get('cmpPubStatus')},       	
					{xtype: 'numberfield',minValue: 0,fieldLabel : '排序值 ',name : 'cmpOrderNum',allowBlank : false, value:data.get('cmpOrderNum')},
					{fieldLabel : '导航名称',name : 'cmpNavigationName',allowBlank : false, value:data.get('cmpNavigationName')},
					{xtype:'triggerfield',fieldLabel:'题头图',name:'cmpTitleImgText',
						triggerCls:Ext.baseCSSPrefix + 'form-search-trigger',
						onTriggerClick:function(){
							var form =this.up('form').getForm();
							mkWindowForEdit('选择资源',mkSelResourceTree(function(data){
			    				form.findField('cmpTitleImgText').setValue(data.get('text'));
			    				form.findField('cmpTitleImg').setValue(data.get('cmrId'));
			    			}));
						},
						listeners:{
							afterrender:function(component,eOpts)
							{
								var cmrImgId=data.get('cmpTitleImg');
								if(cmrImgId){
									Ext.Ajax.request( {
										type: 'ajax',
								        url : 'page_getTitleImg.action',
								        method : 'POST',
								         params : { 
											cmrId:cmrImgId
										},
										success : function(response, opts) {
											var retData = Ext.decode(response.responseText);
										 	component.setValue(retData.text);
											 
										}
									});
								}
							}
						}
					},
					{xtype: 'hidden',name : 'cmpTitleImg',value:data.get('cmpTitleImg')},
					
					{xtype : 'combo',fieldLabel:'打开方式',name:'cmpSkipOpen',	editable:false,
						store :  [["0", "当前窗口"],["1", "新窗口"]],
						valueField : 'name',displayField : 'name',triggerAction : 'all',allowBlank : true,value:data.get('cmpSkipOpen')},
					
					{xtype : 'combo',fieldLabel:'跳转类型',name:'cmpSkipType',	editable:false,
						store :actionTypeStore  ,value:0,
						valueField : 'value',displayField : 'text',triggerAction : 'all',allowBlank : true,value:data.get('cmpSkipType')
					},
					{xtype:'triggerfield',fieldLabel:'跳转URL',name:'cmpSkipUrl',value:data.get('cmpSkipUrl'),
						triggerCls:Ext.baseCSSPrefix + 'form-search-trigger',
						onTriggerClick:function(){
							var form =this.up('form').getForm();
							if(form.findField('cmpSkipType').getValue()!=2)
							{
								return;
							}
							mkWindowForEdit('选择资源',mkSelResourceTree(function(data){
			    				form.findField('cmpSkipUrl').setValue(data.get('fileRealName'));
			    			}));
						},
						listeners:{
							afterrender:function(component,eOpts)
							{
								var cmrImgId=data.get('cmpSkipUrl');
								if(cmrImgId){
									Ext.Ajax.request( {
										type: 'ajax',
								        url : 'page_getTitleImg.action',
								        method : 'POST',
								         params : { 
											cmrId:cmrImgId
										},
										success : function(response, opts) {
											var retData = Ext.decode(response.responseText);
										 	component.setValue(retData.text);
											 
										}
									});
								}
							}
						}
					}
				]
		});
	}
	
	function  mktabEditPanel2(data){
		cmpIsColumn =data.get('cmpIsColumn')==1?true:false;
		cmpIsNavigation =data.get('cmpIsNavigation')==1?true:false;
		cmpIsWebmap =data.get('cmpIsWebmap')==1?true:false;
		cmpIsIndexTop =data.get('cmpIsIndexTop')==1?true:false;
		cmpIsCloumnTop =data.get('cmpIsCloumnTop')==1?true:false;
		cmpIsPublic =data.get('cmpIsPublic')==1?true:false;
		return  Ext.create('Ext.panel.Panel',{
			title:'详细信息',
			border:false,
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
				width:360
			},
				items : [
				{
					xtype:'panel',
					height:80,
					width:420,
					border:false,
					layout:{ 
						type:'table' // 表格布局
						,columns:2 
						,tableAttrs: {style: {align:'center',margin:'0 0 0 0'}}
						,tdAttrs:{align:'left'}
					},
					bodyStyle:{background:'transparent'},
					items:[
					{xtype : 'checkboxgroup',
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否栏目',labelWidth:80,width : 200,items : [{xtype : 'checkboxfield',name : 'cmpIsColumn',inputValue : '1',checked : cmpIsColumn}]
						},
					{xtype : 'checkboxgroup',
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否栏目置顶',labelWidth:80,width : 200,items : [{xtype : 'checkboxfield',name : 'cmpIsCloumnTop',inputValue : '1',checked : cmpIsCloumnTop}]
						},	
					{xtype : 'checkboxgroup',
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否导航',labelWidth:80,width : 200,items : [{xtype : 'checkboxfield',name : 'cmpIsNavigation',inputValue : '1',checked : cmpIsNavigation}]
						},
						
					{xtype : 'checkboxgroup',
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否首页置顶',labelWidth:80,width : 200,items : [{xtype : 'checkboxfield',name : 'cmpIsIndexTop',inputValue : '1',checked : cmpIsIndexTop}]
					},
					{xtype : 'checkboxgroup',
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否公开',labelWidth:80,width : 200,items : [{xtype : 'checkboxfield',name : 'cmpIsPublic',inputValue : '1',checked : cmpIsPublic}]
						},	
					{xtype : 'checkboxgroup',
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否网站地图',labelWidth:80,width : 200,items : [{xtype : 'checkboxfield',name : 'cmpIsWebmap',inputValue : '1',checked : cmpIsWebmap}]
					}
					]
				},
				
				{xtype : 'combo',fieldLabel:'内容类型',name:'cmpContentType',
					store :  cmpContentTypeStore,
					displayField:'text',
					valueField:'value',
					editable:false,
					triggerAction : 'all'
					,value:data.get('cmpContentType')},
				{xtype:"datefield",editable:false,
					fieldLabel : '发布日期',format : 'Y-m-d',name : 'cmpViewtime', 
					allowBlank : true, value:data.get('cmpViewtime')},
				{xtype:"datefield",editable:false,
					fieldLabel : '开始日期',name : 'cmpStartTime', format : 'Y-m-d',
					allowBlank : true, value:data.get('cmpStartTime')},
					{xtype:"datefield",editable:false,
					fieldLabel : '结束日期',name : 'cmpEndTime'  , format : 'Y-m-d',
					allowBlank : true,value:data.get('cmpEndTime')},
				{xtype:'panel',
					height:135,
					width:420,
					border:false,
					layout:{ 
						type:'table' // 表格布局
						,columns:2 
						,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
						,tdAttrs:{align:'left'}
					},
					bodyStyle:{background:'transparent'},
					items:[
						{
							labelAlign:'right',
							xtype:"textareafield",
							height : 120,
							width : 300,
							labelWidth:80,
							fieldLabel : '网页简介 ',name : 'cmpDesc', 
							allowBlank : true, value:data.get('cmpDesc')
							},
							{xtype: 'button',width:60,margin:'95 0 5 5',text:'编辑',iconCls:'icon-edit'
								,handler:function(){
									var butItems = ['source', '|', 'undo', 'redo', '|','cut', 'copy', 'paste',
									'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
									'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
									'superscript', 'clearhtml', 'selectall', '|', 'fullscreen', '/',
									'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
									'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'table','link', 'unlink'];
									var textAreEl=this.up('form').getForm().findField("cmpDesc");
									mkWindowForEdit("编辑HTML",[pageEditor(butItems,textAreEl)],600,400);
								}
							}
						]
				}
				]
		});
	}
	
	
	function  mktabEditPanel3(data){
		var cmpIsStatic = data.get('cmpIsStatic')==1?true:false;
		return  Ext.create('Ext.panel.Panel',{
			title:'附加信息',
			border:false,
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
				width:360
			},
				items : [
			
				{xtype : 'checkboxgroup',
						labelWidth : 80,
						labelAlign : 'right',
						align : 'left',
						defaults : {xtype : 'checkboxfield'},
						fieldLabel : '是否静态',width : 270,items : [{xtype : 'checkboxfield',name : 'cmpIsStatic',inputValue : '0',checked : cmpIsStatic}]
					},
				
				////////////////////////////////////
				{
					fieldLabel : '目录名称',name : 'cmpDirName', 
					allowBlank : true, value:data.get('cmpDirName')
				},	{
					fieldLabel : 'SEO文件名称',name : 'cmpFileName', 
					allowBlank : true, value:data.get('cmpFileName')
				},
				
				////////////////////////////////
				
				{
					fieldLabel : 'SEO关键字',name : 'cmpSeoKeywords', 
					allowBlank : true, value:data.get('cmpSeoKeywords')
				},{
					xtype:"textarea",
					height : 50,
					fieldLabel : 'SEO描述',name : 'cmpSeoDescription', 
					allowBlank : true,value:data.get('cmpSeoDescription')
				},{
					xtype:'hidden',
					fieldLabel : '样式表 ',name : 'cmpCssId', 
					allowBlank : true, value:data.get('cmpCssId')
				},{	xtype:'hidden',
					fieldLabel : '新增样式',name : 'cmpAddCssId', 
					allowBlank : true, value:data.get('cmpAddCssId')
				}
				,
				{	
					labelAlign:'right',
					xtype:"textareafield",
					height : 120,
					fieldLabel : '监听代码 ',
					name : 'cmpOuterTrackingcode', 
					allowBlank : true,
					style:{resize: 'none'},
					value:data.get('cmpOuterTrackingcode')
				}
				/*{xtype:'panel',
					height:135,
					width:420,
					border:false,
					layout:{ 
						type:'table' // 表格布局
						,columns:2 
						,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
						,tdAttrs:{align:'left'}
					},
					bodyStyle:{background:'transparent'},
					items:[
						{	
							labelAlign:'right',
							xtype:"textareafield",
							height : 120,
							width : 300,
							labelWidth:80,
							fieldLabel : '监听代码 ',
							name : 'cmpOuterTrackingcode', 
							allowBlank : true,
							style:{resize: 'none'},
							value:data.get('cmpOuterTrackingcode')
						}
						,{xtype: 'button',width:60,margin:'95 0 5 5',text:'编辑',iconCls:'icon-edit'
							,handler:function(){
								var butItems = ['source', '|', 'undo', 'redo', '|','cut', 'copy', 'paste',
								'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
								'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
								'superscript', 'clearhtml', 'selectall', '|', 'fullscreen', '/',
								'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
								'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'table','link', 'unlink'];
								var textAreEl=this.up('form').getForm().findField("cmpOuterTrackingcode");
								mkWindowForEdit("编辑HTML",[pageEditor(butItems,textAreEl)],600,400);
							}
						}
					]
				}*/
				
				]
		});
	}
	
	function  mktabEditPanel5(data){
		return  Ext.create('Ext.form.Panel',{
			title:'iphone',
			width:400,
			border:false,
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table' // 表格布局
				,columns:1 // 只有1列
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'},width:'100%'}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:80,
				labelAlign:'right',
				width:360
			}
		});
	}
	
	
	
	
	
	
	
	//存储textareafield对象
	//var textAreObjs=[];
	function  mktabEditPanel4(data){
		//var cmcIsEdit=data.get('cmcIsEdit')==1?true:false;
		/*var store_template = Ext.create('Ext.data.Store',{
			model:'page_templatefieldModel',
			proxy:{
				type:'ajax',
				url:'templatefield_queryByCmtId.action',//请求后台信息
				extraParams:{rows:Ext.encode({cmtId:data.get('cmt').split(';')[0]})},//获取的模板传递过去
				
				method:'POST',
				reader:{
					type:'json',
					root:'ROOT', // 跟节点
					totalProperty:'TOTALCOUNT' // 总记录数
					}
				}
		});	
		
		Ext.define('FIELD_TYPE', {
	    extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'xtype'}
	      ]
	  });
		var fieldTypeData=[
				{value:'text',xtype:"textfield"},
				{value:'bigtext',xtype:"textareafield"},
				{value:'int',xtype:"numberfield"},
				{value:'date',xtype:"datefield"},
				{value:'img',xtype:"filefield"},
				{value:'imglist',xtype:"filefield"},
				{value:'checkbox',xtype:"checkbox"},
				{value:'combo',xtype:"combo"}
			];
		
		var fieldTypeStore=Ext.create('Ext.data.Store',{
			autoLoad: true,
		    model: 'FIELD_TYPE',
		    data : fieldTypeData,
		    proxy: {
		        type: 'memory'
		    }
	    });*/
		
	    
		var pageData=  Ext.create('Ext.form.Panel',{
			title:'页面数据',
			border:false,
			//autoScroll:true,
			width:400,
			bodyStyle:{background:'transparent'},
			layout:{ 
				type:'table' // 表格布局
				,columns:1   // 只有1列
				,tableAttrs: {style: {align:'center',margin:'10 0 10 0'},width:'100%'}
				,tdAttrs:{align:'left'}
			},
			style:'padding-bottom:10px',
			defaults:{
				xtype:'textfield',
				labelWidth:80,
				labelAlign:'right',
				width:360
			}/*,
			listeners:{afterrender:function(component,eOpts){
				store_template.load({
				       callback: function(records, options, success)
				       	{
							//获取集合
							var collectionData=[];
							//需要添加内容的模板名称
							var fields=[]; 
			                store_template.each(function(item){
			                	var xtype= getTextByStore(fieldTypeStore,item.get('ctfType'),"value","xtype");
			                	var el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};
			                	fields.push(item.get('ctfName'))
			                	if('textareafield'==xtype)
			                	{
			                		el={xtype:xtype,height:150,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};
			                	}
			                	if('numberfield'==xtype)
			                	{
			                		el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName'),minValue:0};
			                	}
			                	if('email' ==xtype)// 邮箱 验证格式
			                	{
			                		el={vtype:'email',fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};	
			                	}
		                		if('datefield' ==xtype)
			                	{
			                		el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName'),format:'Y-m-d',dateFormat:'Y/m/d'};	
			                	}
			                	if('filefield'==xtype)
			                	{
			                		el={xtype:"textfield",fieldLabel:item.get('ctfViewName'),name:item.get('ctfName')};	
			                	}
			                	if("textareafield"==xtype){
			                		el={xtype:'panel',
			                			autoScroll:true,
										height:280,
										width:390,
										border:false,
										bodyStyle:{background:'transparent'},
										items:[
											{
												labelWidth:80,
												labelAlign:'right',
												width:780,
												height:280,
												xtype:'textareafield',
												fieldLabel : item.get('ctfViewName'),
												name :item.get('ctfName'), 
												style:{resize: 'none'},
								                listeners: {
								                    afterrender: CreateEdit
								                }
											}
										]
									};
							       el={
							        	xtype:'form',
										height:135,
										width:420,
										border:false,
										layout:{ 
											type:'table' // 表格布局
											,columns:2 
											,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
											,tdAttrs:{align:'left'}
										},
										bodyStyle:{background:'transparent'},
										items:[
											{	
												labelAlign:'right',
												xtype:"textareafield",
												height : 120,
												width : 320,
												labelWidth:80,
												fieldLabel:item.get('ctfViewName'),
												name:item.get('ctfName'), 
												allowBlank : true,
												style:{resize: 'none'}
												,listeners: {}
											}
											,{xtype: 'button',width:60,margin:'95 0 5 5',text:'编辑',iconCls:'icon-edit'
												,handler:function(){
													//-----------KingEdit---Start
													var butItems = ['source', '|', 'undo', 'redo', '|','cut', 'copy', 'paste',
													'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
													'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
													'superscript', 'clearhtml', 'selectall', '|', 'fullscreen', '/',
													'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
													'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table','link', 'unlink'];
													var textAreEl=this.up('form').getForm().findField(item.get('ctfName'));
													mkWindowForEdit("编辑HTML",[pageEditor(butItems,textAreEl)],600,400);
												}
											}
										]
									}
							        //el={xtype:xtype,fieldLabel:item.get('ctfViewName'),name:item.get('ctfName'),height:180,width:360};
			                	}
								collectionData.push(el);
							});
							component.add(collectionData);
							
							
							//数据是否在加载中
							function storeIsLoading(){
								if(store_page.isLoading())
								{
									window.setTimeout(function(){storeIsLoading();},200);
								}else{
									store_page.each(function(item){
										if(data.get('cmpId')==item.get('cmpId'))
										{
											var xmlData=item.get('cmpContent');
											if(''==xmlData || 'undefined'==xmlData || null==xmlData)
											{
												component.body.unmask();
												return;
											}
											var xdoc;  
											if(typeof(DOMParser) == 'undefined'){  
											    xdoc = new ActiveXObject("Microsoft.XMLDOM");  
											    xdoc.async="false";  
											    xdoc.loadXML(xmlData);  
											}else{  
											    var domParser = new DOMParser();  
											    xdoc = domParser.parseFromString(xmlData, 'application/xml');  
											    domParser = null;  
											}  
											 Ext.define('Fields', {
											    extend: 'Ext.data.Model',
											    fields: fields
											});
											var xmlStore = Ext.create('Ext.data.Store', {
											    model: 'Fields',
											    data :xdoc,
											    proxy: {
											        type: 'memory',
											        reader: {
											            type: 'xml',
											            record: 'fieldList'
											        }
											    }
											    
											});
											xmlStore.load();
											//数据是否在加载中
												function xmlStoreIsLoading(){
													if(xmlStore.isLoading())
													{
														window.setTimeout(function(){storeIsLoading();},200);
													}else{
														Ext.Array.each(fields,function(fieldName){
															var nodeValue = xmlStore.getAt(0).get(fieldName);
															if( ''==nodeValue){
																nodeValue='';
															}
															if((component.getForm().findField(fieldName).xtype=='datefield') && (''!=nodeValue))
															{
																component.getForm().findField(fieldName).setValue(getDate(nodeValue));
															}else if((component.getForm().findField(fieldName).xtype=='textareafield')){
																component.getForm().findField(fieldName).setValue(nodeValue);
															}else{
																component.getForm().findField(fieldName).setValue(nodeValue);
															}
															
														});
													}
												}
											xmlStoreIsLoading();
										}
									});
								}
							}
							storeIsLoading();
							component.body.unmask();
				
				       }});
			},
			 beforerender: function(p) {
	            p.body.mask('Loading...');
	        },
	        delay: 1000
			}*/
			
		});
		
			return pageData;
		}
	//弹出html编辑信息
	
	
	function pageEditor(butItems,textAreEl){
		/*//文本编辑器
		 var editor=new Object();
		function CreateEdit() {
            setTimeout(function () {
                   editor = KindEditor.create("textarea[name=\""+item.get('ctfName')+"\"]", {
                    cssPath: 'kindeditor/plugins/code/prettify.css',
                    uploadJson: 'kindeditor/jsp/upload_json.jsp',
                    fileManagerJson: 'kindeditor/jsp/file_manager_json.jsp',
                    allowFileManager: true,
                    allowFileUpload: true,
                    items:butItems,
                    minHeight:260,
                    pasteType : 2//执行HTML粘贴
                });
                //textAreObjs.push({name:item.get('ctfName'),editor:editor});
            }, 500);
            
        }*/
		 var editor=new Object();
		 function CreateEdit() {
            setTimeout(function () {
            	editor=htmlEditor(butItems,textAreEl.getName()+"_");
            }, 500);
            
        }
		//----------KingEdit---End
		return Ext.create('Ext.form.Panel',{
			border:false,
			bodyStyle:{background:'transparent'},
			height : 400,
			width : 600,
       		plain: true,
       		autoScroll:false,
			items:[{	
					labelAlign:'right',
					xtype:"textarea",
					height : 350,
					width : 590,
					labelWidth:0,
					fieldLabel:"",
					labelSeparator:"",
					name:textAreEl.getName()+"_", 
					allowBlank : true,
					style:{resize: 'none'},
					value:textAreEl.getValue()
					,listeners: {
						afterrender: CreateEdit
					}
				}], // 将表单面板加入该panel中
			fbar:[{
				text:'确定',margin:'0 5 0 0',
				handler:function(){
					textAreEl.setValue(editor.html());
					 this.up('window').close();
				}
			},{text:'取消',margin:'0 10 0 0',handler:function(){this.up('window').close();}}]
		});
	}
	/**申请审核*/
	//0编辑 1未发布 2发布 3撤销发布  4申请审核 5审核未通过  6审核通过
	function workflow(data,grid){
		//状态
		var status=data.get('cmpStatus');
		//数据
		var v0={value:0,text:"编辑"};
		var v1={value:1,text:"未发布"};
		var v2={value:2,text:"发布"};
		var v3={value:3,text:"撤销发布"};
		var v4={value:4,text:"申请审核"};
		var v5={value:5,text:"审核未通过"};
		var v6={value:6,text:"审核通过"};
		var pageAuditTypeData=[];
		pageAuditTypeData.push(v2);
		if(status==0 || status==1)
		{
			pageAuditTypeData.push(v4);
		}
		else if(status==2)
		{
			pageAuditTypeData.push(v3);
		}
		else if(status==3)
		{
			pageAuditTypeData.push(v4);
		}
		else if(status==4)
		{
			pageAuditTypeData.push(v5);
			pageAuditTypeData.push(v6);
		}
		else if(status==5)
		{
			pageAuditTypeData.push(v4);
		}/*else if(status==6)
		{
			pageAuditTypeData.push(v2);
		}*/
		var pageAuditTypeStore=Ext.create('Ext.data.Store',{
			autoLoad: true,
		    model: 'pageAuditType',
		    data : pageAuditTypeData,
		    proxy: {
		        type: 'memory'
		    }
	    });
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
				labelWidth:40,
				labelAlign:'right',
				width:300
			},
			items : [
				{fieldLabel : '栏目id ',xtype:'hidden',name:'cpaCmpId',value:data.get('cmpId'),allowBlank : false},
				{fieldLabel : '内容',
				fieldCls:'text-readonly',
				editable:false,
				readOnly : true,
				name : 'cmpName',value:data.get('cmpName')},//json并不实际获取 这个名称仅仅用来显示
				{
					xtype : 'combo',fieldLabel:'事件',name:'cpaType',editable:false,
					store :pageAuditTypeStore ,value:0,valueField : 'value',displayField : 'text',triggerAction : 'all'
				},
				{
					xtype : 'textarea',fieldLabel:'说明',name:'cpaComments'
				}
			
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border',
			width:350,
			height:170,
			items:[OperateWorkflowForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",/*确定*/
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) {
						return;
					}
					var subValue=form.getValues();
					subValue.pagePid=data.get('parentCmpId');
					form.submit( {
						url : 'page_auditContent.action',			//此处需要调用后台方法，对于发布，调用保存或更新的方法；对于撤销发布，调用delete方法；获取到说明文本框中内容，写进数据库。
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(subValue)
						},
				        success : function(response, opts){
				        	funSuccess(response, opts,win,grid);
				        },
				        failure:function(response, opts){
				        	if(opts.result.msg){
				        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				        	}else{
				       	 	funFailure(response, opts);
				       	 	}
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]/*取消*/
		});
	}
	function previewIphone(form,ctfName,cmpTitleName){
		form=form.getForm();
		var title, cotent,width=350,height=570;
		//var downloadIframe = document.createElement('iframe');
		//downloadIframe.src = "system/page/iphone.html";
		/*var win=Ext.create('Ext.window.Window', {
						title : title,
						constrain : true,
						constrainHeader : true,
						bodyStyle : {
							overflow : true
						},
						layout: 'fit',
				       	plain: true,
						modal : true,
						width:width,
						height:height,
						minHeight:height,
						maxHeight:height,
						minWidth:width,
						maxWidth:width,
						items : [
						{
				        	xtype:'panel',
				        	//autoScroll:true,
							height:800,
							width:800,
							border:false,
							layout:{ 
								type:'table' // 表格布局
								,columns:2 
								,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}}
								,tdAttrs:{align:'left'}
							},
							//bodyStyle:{background:'transparent'},
							html:"<iframe id='iphoneIframe' frameborder='0' src='system/page/iphone.html'width='350px' height='570px'></iframe>"
						}
						]
					});
					win.show();
					var domEl=Ext.getDom("iphoneIframe");
					//var content=domEl.getElementById("article_cotnet_iphone");
					console.log(domEl);
					//.("article_cotnet_iphone");
					var domTitle=Ext.getDom("article_title_iphone");
					domEl.innerHTML=form.findField(ctfName).getValue();
					domTitle.innerHTML=cmpTitleName;
					*/
					//var domEl=Ext.getDom("article_cotnet_iphone");
					//var domTitle=Ext.getDom("article_title_iphone");
					//domEl.innerHTML=form.findField(ctfName).getValue();
					//domTitle.innerHTML=cmpTitleName;
			Ext.Ajax.request( {
				type: 'ajax',
		        url : 'system/page/iphone.txt',
		        method : 'POST',
		        success : function(response, opts){
		        	 var retData =response.responseText;
						var win=Ext.create('Ext.window.Window', {
						title : title,
						constrain : true,
						constrainHeader : true,
						bodyStyle : {
							overflow : true
						},
						layout: 'fit',
				       	plain: true,
						modal : true,
						width:width,
						height:height,
						minHeight:height,
						maxHeight:height,
						minWidth:width,
						maxWidth:width,
						items : [
						{
				        	xtype:'panel',
				        	//autoScroll:true,
							height:height,
							width:width,
							border:false,
							//bodyStyle:{background:'transparent'},
							html:"<iframe id='iphoneIframe' frameborder='0' width='350px' height='570px'></iframe>"
						}
						]
					});
					win.show();
					var iframeHtml=Ext.getDom("iphoneIframe");
					var allCotent=Ext.util.Format.format(retData,cmpTitleName,form.findField(ctfName).getValue());
					iframeHtml.innerHtml=allCotent;
					//var domEl=Ext.getDom("article_cotnet_iphone");
					//var domTitle=Ext.getDom("article_title_iphone");
					//domEl.innerHTML=form.findField(ctfName).getValue();
					//domTitle.innerHTML=cmpTitleName;
		        },
		        failure:function(response, opts){
		       	}
			});
			// var downloadIframe = document.createElement('iframe');
		   //downloadIframe.src = "system/page/iphone.html";
		  //downloadIframe.style.display = "none";
		  //document.body.appendChild(downloadIframe);
		//form.findField(ctfName).getValue();
	}
	
	
	
	
	/* 栏目管理面板 */
	function lmPanel(){
		return Ext.create('Ext.panel.Panel',{ 
		    layout:'border',
		    region:'center',
		   	items:[pageMgrForm(),grid_page()]//TabPanel中的标签页
	    });
	}
    
    return Ext.create('Ext.panel.Panel',{ 
	    layout:'border',
		closable:true,
	   	items:[mrgTreePanel(),lmPanel()]
    }); 
})();
