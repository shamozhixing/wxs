<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
  (function(){
	/** 系统MenuModel*/
	Ext.define('CMS_Menu',{
		extend:'Ext.data.Model',
		fields : ['cmmId','cmmParentId','cmmName','cmmDesc','cmmIcon','cmmOrderNum','cmmAdminUrl','cmmType','cmmAddTime','cmmAddUser']
	});
	/**菜单类型*/
	Ext.define('menuType',{
		extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'text'}
	    ]
	})
	var menuTypeData=[{value:0,text:"不可维护"},{value:1,text:"可维护"}];
	var menuTypeStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'menuType',
	    data : menuTypeData,
	    proxy: {
	        type: 'memory'
	    }
    });
    
    //选择图标
    /**菜单类型*/
	Ext.define('iconModel',{
		extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'img'},
	        {name: 'text'}
	    ]
	})
    var optionIcons=[
    	{img:"<img src='workplace/image/icon/quanxian.png' height='16' width='16' />",value:'workplace/image/icon/quanxian.png',text:'1'},
    	{img:"<img src='workplace/image/icon/dengluyonghu.png' height='16' width='16' />",value:'workplace/image/icon/dengluyonghu.png',text:'1'},
    	{img:"<img src='workplace/image/icon/jiance.png' height='16' width='16' />",value:'workplace/image/icon/jiance.png',text:'1'},
    	{img:"<img src='workplace/image/icon/juese.png' height='16' width='16' />",value:'workplace/image/icon/juese.png',text:'1'},
    	{img:"<img src='workplace/image/icon/muban.png' height='16' width='16' />",value:'workplace/image/icon/muban.png',text:'1'},
    	{img:"<img src='workplace/image/icon/rizhi.png' height='16' width='16' />",value:'workplace/image/icon/rizhi.png',text:'1'},
    	{img:"<img src='workplace/image/icon/user.png' height='16' width='16' />",value:'workplace/image/icon/user.png',text:'1'},
    	{img:"<img src='workplace/image/icon/xitong.png' height='16' width='16' />",value:'workplace/image/icon/xitong.png',text:'1'},
    	{img:"<img src='workplace/image/icon/yemianbanben.png' height='16' width='16' />",value:'workplace/image/icon/yemianbanben.png',text:'1'},
    	{img:"<img src='workplace/image/icon/zidian.png' height='16' width='16' />",value:'workplace/image/icon/zidian.png',text:'1'},
    	{img:"<img src='workplace/image/icon/ziduan.png' height='16' width='16' />",value:'workplace/image/icon/ziduan.png',text:'1'},
    	{img:"<img src='workplace/image/icon/zujian.png' height='16' width='16' />",value:'workplace/image/icon/zujian.png',text:'1'}
    	];
    var iconStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'iconModel',
	    data : optionIcons,
	    proxy: {
	        type: 'memory'
	    }
    });
    //------start,栏目信息  
		var menuFuncTreeStore = Ext.create('Ext.data.Store', {
			model : 'CMS_Menu',
			autoLoad:true,
			proxy : {
				type : 'ajax',
				url : 'menu_query.action'
			},sync:false
		});
		//------end
	/** 系统MenuStore */
   var store_menu = Ext.create('Ext.data.Store',{
		model : 'CMS_Menu',
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'menu_queryByNodeId.action',//请求后台西信息
			extraParams:{nodeid:0},
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
		});
    /** menu信息列表   */
	function grid_menu(){
		return Ext.create('Ext.grid.Panel',{
			//title : '菜单信息',
			heard:false,
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_menu, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{
				selType:'checkboxmodel'
			},
			multiSelect : true, //允许多选
			columns:{
				defaults:{align:'left'}, // 设置默认居左
				items:[
					 {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
					{header : 'ID',	dataIndex : 'cmmId',flex:1},
					{header : '父节点',	dataIndex : 'cmmParentId',flex:1,
						renderer:function(v){
							if('0'==v)
							{
								return '顶级菜单';
							}else{
								var menuName= getTextByStore(menuFuncTreeStore,v,"cmmId","cmmName");
								return menuName;
							}
						}
					},
					{header : '菜单名称 ',dataIndex : 'cmmName',	flex:1.5},
					{header : '菜单描述',	dataIndex : 'cmmDesc',hidden:true},
					{header : '节点图标',	dataIndex : 'cmmIcon',hidden:true},
					{header : '排序值',	dataIndex : 'cmmOrderNum',flex:1},
					{header : '菜单地址',	dataIndex : 'cmmAdminUrl',hidden:true},
					{header : '菜单类型',	dataIndex : 'cmmType',	flex:1.5,
						renderer:function(v){
				         		var menuTypeText= getTextByStore(menuTypeStore,v,"value","text");
				         		return menuTypeText;
						}
					},
					{header : '添加时间',	dataIndex : 'cmmAddTime',	flex:2 ,
	 					renderer: function(value){
					        return getDateTime(value);
				    }},
					{	header : '添加人 ',	dataIndex : 'cmmAddUser',	flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					<s:if test="isMod()">
					if('0'==record.data.cmmType)
					{
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"不能修改系统菜单");
						return;
					}
				   mkWindow("修改菜单信息",[editMenu(record,view)]);// 双击每条数据时弹出修改模板框
				   </s:if>
				}
			},
			tbar : [
				<s:if test="isAdd()">
				{
				text : "<s:text name='util.gridNewly'/>",
				iconCls : 'icon-add',
				handler : function() {
					var treePanel=this.up('panel').up('panel').down('treepanel');
					if(treePanel.getSelectionModel().getSelection().length<1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"请选择要添加的父节点"/**请选择要添加的父节点*/);
					}
					var pId=treePanel.getSelectionModel().getSelection()[0].get('id');
					var grid=this.up('grid');
					//获取树的父节点ID
					mkWindow("<s:text name='util.gridNewly'/>",[addMenu(grid,pId)]); // 弹出新增栏目框
				}
			}, '-',  </s:if><s:if test="isMod()">{
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert('提示','您最少要选择一条记录');
					} else {
						if('0'==secData[0].get('cmmType'))
						{
							Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"不能修改系统菜单");
							return;
						}
						 mkWindow("修改菜单信息",[editMenu(secData[0],this.up('grid'))]);// 双击每条数据时弹出修改模板框
					}
				}
			}, '-',  </s:if><s:if test="isDel()">{
				text : '删除',
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						var isSysMenu=false;
						Ext.Array.each(secData,function(record){
							if('0'==record.data['cmmType'])
							{
								isSysMenu=true;
								Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"不能删除系统菜单["+record.data['cmmName']+"]");
								return;
							}
						});
						if(isSysMenu){
							return;
						}
						Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='admin.system.role.comfirMsgDel'/>"/*你确定要删除吗?*/,function(btn){
							if(btn=="yes"){
								//同时删除多条记录
								var jsonArr = [];
								var pId=0;
								Ext.Array.each(secData,function(record){
									pId=record.data['cmmParentId'];
									jsonArr.push(record.data);
								});
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'menu_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 已字符窜形式传到后台
									},
									success : function(response, opts) {
										 var retData = Ext.decode(response.responseText);
									 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,retData.msg);
									 	 grid.getStore().getProxy().extraParams = {nodeid:pId};
									 	 grid.getStore().load(); // 重新加载数据
										 
									},
									failure : function(response, opts) {
										 var retData = Ext.decode(response.responseText);
										Ext.Msg.alert("<s:text name='util.fail'/>"/*失败*/,retData.msg);
									}
								})
							}
						});
					} else {
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMinHandle'/>"/*请至少选择一行进行操作*/);
					}
				}
			}
			,'-',</s:if>{
			   text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
				 }
			}
			]
		});
	}
	
	/**加载树信息*/
	function mrgTreePanel(){
		Ext.define('menuModel', {
			extend : 'Ext.data.Model',
			fields : [{name : 'cmpId',type : 'int'},'text','children', 'url', 'tag', 'icon',{name:'id',mapping:'cmpId'},'pId']// text 必须的 否则得设置,
		});
		var menuTreeStore = Ext.create('Ext.data.TreeStore', {
			model : 'menuModel',
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
				url : "lefttree_getSysTreeByCmmId.action"
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
				title:"系统菜单管理",
				animate : true,
				width : 150,
				collapsible : true,
				split : true,
				region:'west',
				rootVisible : true,
				resizable : true,
				useArrows : true,
				store :menuTreeStore,
				tools : [{
					type : 'refresh',
					handler : function(event, toolEl, panel) {
						var treePanel=this.up('treepanel');
						var treeStore =treePanel.getStore();
						var selFreshNode=treePanel.getSelectionModel().getSelection();
						treePanel.getRootNode().removeAll();
						treeStore.load();
						selectRootNode(treeStore);
						//加载gridStore
						var gridStore = treePanel.up('panel').child('grid').getStore();
						gridStore.load();
					}
				}],
				listeners : {
					afterrender:function(component,eOpts){
						var rootStore=component.getStore();
						selectRootNode(rootStore);
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
						var gridStore = this.up('panel').child('grid').getStore();
						  gridStore.getProxy().extraParams = {nodeid:rec.get('id')};
						  gridStore.load();
						  menuTreePanel.getSelectionModel().select(thisNode,true);
					}
				}
			});
		return menuTreePanel;
		
	}
	//添加
	function addMenu(grid,pId){
		var el;
		var url=(pId==0)?"#":"";
		var addMenuForm = Ext.create('Ext.form.Panel',{
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
			items : [{
					xtype : 'hidden',
					height:0,
					name : 'cmmParentId',
					value: pId
				
				},{
					fieldLabel : "菜单名称",
					name : 'cmmName',
					allowBlank : false
				},
				{
					xtype:"combo",
					store:iconStore,
					displayField:'img',
					valueField:'value',
					allowBlank : false,
					editable:false,
					fieldLabel : "菜单图标",
					name : 'cmmIcon_',
					emptyText:'默认为系统图标',
					listeners:{
						afterrender:function(compo,eOpts ){
							el=Ext.getDom(compo.getId()).getElementsByTagName("input")[0];
						},
						change:function(combo,newValue,oldValue){
							el.value=newValue;
						},
						beforeselect:function(combo,record,ndex,eOpts ){
							var form=this.up('form').getForm();
							form.findField('cmmIcon').setValue(record.get('value'));
						}
					}
					
				},
				{xtype:'hidden',name:'cmmIcon'},
				{
					xtype:'numberfield',
				   fieldLabel:"排序值",
				   name:'cmmOrderNum',
				   minValue:0,
				   allowBlank : false
				},
				{
					fieldLabel : "操作地址",
					name : 'cmmAdminUrl',
					allowBlank : false,
					value:url
				},
				{xtype:"textarea",height : 80,fieldLabel : '菜单描述 ',name : 'cmmDesc'},
				{xtype:'checkboxfield',name:'cmmType',boxLabelAlign:'before',checked:true,padding:'0 0 0 15',boxLabel:"是否可维护:"/*'是否可维护'*/,inputValue :'1'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:320,
			height:270,
			border:false,
			items:[addMenuForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					var subValue=form.getValues();
					subValue.cmmType=(form.findField('cmmType').getValue()==false)?0:subValue.cmmType;
					Ext.Ajax.request({
								type: 'ajax',
						        url : 'menu_add.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(subValue)
								},
						        success : function(response, opts){
									funSuccess(response, opts,win,grid)
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	//修改菜单信息
	function editMenu(data,grid){
		var editInputEl;
		var cmmType=(data.get('cmmType')==1);
		var editMenuForm = Ext.create('Ext.form.Panel',{
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
				{
					xtype : 'hidden',
					height:0,
					name : 'cmmId',
					value: data.get('cmmId')
				
				},{
					xtype : 'hidden',
					height:0,
					name : 'cmmParentId',
					value: data.get('cmmParentId')
				
				},{
					fieldLabel : "菜单名称",
					name : 'cmmName',
					value:data.get('cmmName'),
					allowBlank : false
				},
				{
					xtype:"combo",
					store:iconStore,
					displayField:'img',
					valueField:'value',
					allowBlank : false,
					editable:false,
					fieldLabel : "菜单图标",
					name : 'cmmIcon_',
					emptyText:'默认为系统图标',
					listeners:{
						afterrender:function(compo,eOpts ){
							editInputEl=Ext.getDom(compo.getId()).getElementsByTagName("input")[0];
						},
						change:function(combo,newValue,oldValue){
							editInputEl.value=newValue;
						},
						beforeselect:function(combo,record,ndex,eOpts ){
							var form=this.up('form').getForm();
							form.findField('cmmIcon').setValue(record.get('value'));
						}
					}
					
				},
				{xtype:'hidden',name:'cmmIcon',value:data.get('cmmIcon'),listeners:{
					afterrender:function(comtent,eOpts){
						if(editInputEl)
						editInputEl.value=data.get('cmmIcon');
					}
				}},
				{
					xtype:'numberfield',
				   fieldLabel:"排序值",
				   value:data.get('cmmOrderNum'),
				   name:'cmmOrderNum',
				   minValue:0,
				   allowBlank : false
				},
				{
					fieldLabel : "操作地址",
					name : 'cmmAdminUrl',
					value:data.get('cmmAdminUrl'),
					allowBlank : false
				},
				{xtype:"textarea",height : 80,fieldLabel : '菜单描述 ',name : 'cmmDesc',value:data.get('cmmDesc')},
				{xtype:'checkboxfield',name:'cmmType',boxLabelAlign:'before',padding:'0 0 0 15',boxLabel:"是否可维护:"/*'是否可维护'*/,inputValue :'1',checked:cmmType}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:320,
			height:270,
			border:false,
			items:[editMenuForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					var subValue=form.getValues();
					subValue.cmmType=(form.findField('cmmType').getValue()==false)?0:subValue.cmmType;
					Ext.Ajax.request({
								type: 'ajax',
						        url : 'menu_modify.action',
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(subValue)
								},
						        success : function(response, opts){
						        	  funSuccess(response, opts,win,grid)
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	
	return Ext.create('Ext.panel.Panel',{ 
		   title:'菜单管理',
		    layout:'border',
			closable:true,
		   	items:[mrgTreePanel(),grid_menu()]
	    }); 
	
})();
