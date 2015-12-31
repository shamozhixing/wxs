<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/**字典表Model */
	Ext.define('mainModel',{
		extend:'Ext.data.Model',
		fields : ['cid','upid','cnname','enname','remark','availabilityflag','ordernum','standby1','standby2']
	});
	
	/*字典Store */
   var mainModel_store = Ext.create('Ext.data.Store',{
		model:'mainModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'dictionary_queryByUpid.action',//请求后台信息
			method:'POST',
			extraParams:{cid:0},
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/**文件类型*/
	Ext.define('dictionary_type', {
	    extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'text'}
	    ]
	});
	//类型
	var dictionaryTypeData=[{}];//[<property value='dictionaryTypeData'/>];
	var dictionaryTypeStore=Ext.create('Ext.data.Store',{
	autoLoad: true,
    model: 'dictionary_type',
    data : dictionaryTypeData,
    proxy: {
        type: 'memory'
    }
    });
	
   
	//树的节点
    /**字典目录树*/
	function dictionaryTree(){
		Ext.define('dictionaryModel', {
			extend : 'Ext.data.Model',
			fields : ['cid','text','children', 'url',{name:'id',mapping:'cid'},'upid']// text 必须的 否则得设置,
		});
		var dictionaryTreeStore = Ext.create('Ext.data.TreeStore', {
			model : 'dictionaryModel',
			nodeParam:'cid',
			root : {
				text : '所有字典',
				expanded : true,
				id:0,
				leaf:false
			},
			proxy : {
				type : 'ajax',
				url : "dictionary_getDictionaryTreeById.action"
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
					dictionaryTreePanel.getSelectionModel().select(rootStore.getRootNode(),true);
				}
			}
			rootMenuIsLoading();
		}
		//获取菜单树
		var dictionaryTreePanel=Ext.create('Ext.tree.Panel',
			{
				title:"字典管理",
				animate : true,
				width : 150,
				collapsible : true,
				split : true,
				region:'west',
				rootVisible : true,
				resizable : true,
				useArrows : true,
				store :dictionaryTreeStore,
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
						var gridStore = treePanel.up('panel').down('grid').getStore();
						gridStore.getProxy().extraParams={cid:0};
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
						var gridStore = this.up('panel').down('grid').getStore();
						gridStore.getProxy().extraParams = {cid:rec.get('id')};
						  gridStore.load();
						  dictionaryTreePanel.getSelectionModel().select(thisNode,true);
					}
				}
			});
			
		return dictionaryTreePanel;
	}
	
	/* 字典信息列表*/
	function mainGrid(){
		return Ext.create('Ext.grid.Panel',{
			title : "字典信息",
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : mainModel_store, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'},
			multiSelect : false, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:mainModel_store}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[ {header:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:35,align:'center'},
					    {header : "id",	dataIndex : 'cid',sortable : true,flex:1},
						{header : "名称",dataIndex : 'cnname',	flex:1},
						{header : "排序值",dataIndex : 'ordernum',	flex:1},
						{header : "是否有效",dataIndex : 'availabilityflag',flex:1,
							renderer:function(v){
								if(v=="1"){
									return "有效";
								}else{
									return "无效";
								}
							}
						}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					<s:if test="isMod()">
					var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
				   mkWindow("修改",[editdictionary(record,view,treePanel)]);
				    </s:if>
			}},
			
			tbar : [
				<s:if test="isAdd()">
				{
				text : "<s:text name='util.gridNewly'/>",//新增
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
					var selectData=grid.getSelectionModel().getSelection()
					if(selectData.length>0)
					{
						//获取树的父节点ID
						var recData=selectData[0];
						var parentId=recData.get('cid');
						mkWindow("新增",[adddictionary(grid,parentId,treePanel)]); //添加字典
					}
					else{
						if(treePanel.getSelectionModel().getSelection().length<1){
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要添加的父节点");
							return;
						}
						var recData=treePanel.getSelectionModel().getSelection()[0];
						//获取树的父节点ID
						var parentId=recData.get('id');
						mkWindow("添加",[adddictionary(grid,parentId,treePanel)]); //添加字典
					}
				}
			}, '-',</s:if> <s:if test="isMod()"> {
				text : "<s:text name='util.gridUpdate'/>",
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length==0){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");
					}
					else if(secData.length > 1){
						//提示    不能同时修改多条记录
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");
					} else {
						var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
						//修改字典信息
						mkWindow("修改",[editdictionary(secData[0],this.up('grid'),treePanel)]); // 弹出修改字典框
					}
				}
			},'-',</s:if><s:if test="isMod()"> {
				text : "生成省市js",
				iconCls : 'icon-down',
				handler : function() {
					Ext.MessageBox.confirm("提示","你确定要生成省市js吗,非开发人员请勿使用此功能?",function(btn){
						if(btn=="yes"){
								downLoadJs(0);
						}
					});
				}
			},'-',{
				text : "生成2013品牌js",
				iconCls : 'icon-down',
				handler : function() {
					Ext.MessageBox.confirm("提示","你确定要生成2013品牌js吗,非开发人员请勿使用此功能?",function(btn){
							if(btn=="yes"){
								downLoadJs(1);
							}
					});
				}
			},'-',{
				text : "生成奥迪汽车js",
				iconCls : 'icon-down',
				handler : function() {
					Ext.MessageBox.confirm("提示","你确定要生成奥迪汽车js吗,非开发人员请勿使用此功能?",function(btn){
						if(btn=="yes"){
								downLoadJs(2);
						}
					});
				}
			},'-',</s:if>
			{text:"<s:text name='util.gridRefresh'/>",iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}
			}
			]
		});
	}
	
	/* 添加字典 */
	function adddictionary(grid,parentId,treePanel){
		var addForm = Ext.create('Ext.form.Panel',{
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
				width:400
			},
			items : [
			    {fieldLabel : "中文名称",name:'cnname',allowBlank : false},
			    {fieldLabel : "英文名称",name:'enname'},
			    {xtype:'textarea',fieldLabel : "备注",name:'remark',height:50},
				{xtype:'checkboxfield',name:'availabilityflag',boxLabelAlign:'before',padding:'0 0 0 48',boxLabel:"是否有效:",inputValue :'1'},
				{xtype:'numberfield',fieldLabel:"排序值",name:'ordernum',value:grid.getStore().getTotalCount()+1,minValue:0},
				{fieldLabel : "配用1",name:'standby1'},
				{fieldLabel : "配用2",name:'standby2'},
				{xtype:'hidden',name:'upid',value:parentId}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:430,
			height:280,
			items:[addForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					
					//是否有效
					var subValue=form.getValues();
					subValue.availabilityflag=(form.findField('availabilityflag').getValue()==false)?0:subValue.availabilityflag;
					form.submit( {
						url : "dictionary_saveOrUpdate.action",
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(subValue)
						},
				        success : function(response, opts){
				        	var retData =opts.result;
							var isSuc= retData.isSuc;
				        	if(isSuc==true){
								//treePanel.getStore().load(treePanel.getStore().getNodeById(parentId)); 
								var treeStore =treePanel.getStore();
									treePanel.getRootNode().removeAll();
									treeStore.load();
				        		funSuccess(response, opts,win,grid)
				        	}
				        	else{
				        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
				        	}
				        },
				        failure:function(response, opts){
				       	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
		});
	
	}
	
	/* 修改字典,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editdictionary(data,grid,treePanel){
		var updateForm = Ext.create('Ext.form.Panel',{
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
				width:400
			},
			items : [
			    {fieldLabel : "中文名称",name:'cnname',allowBlank : false,value:data.get('cnname')},
			    {fieldLabel : "英文名称",name:'enname',value:data.get('enname')},
			    {xtype:'textarea',fieldLabel : "备注",name:'remark',height:50,value:data.get('remark')},
				{xtype:'checkboxfield',name:'availabilityflag',boxLabelAlign:'before',padding:'0 0 0 48',boxLabel:"是否有效:",inputValue :'1',checked:(data.get('availabilityflag')==1)},
				{xtype:'numberfield',fieldLabel:"排序值",name:'ordernum',value:data.get('ordernum'),minValue:0},
				{fieldLabel : "配用1",name:'standby1',value:data.get('standby1')},
				{fieldLabel : "配用2",name:'standby2',value:data.get('standby2')},
				{xtype:'hidden',name:'upid',value:data.get('upid')},
				{xtype:'hidden',name:'cid',value:data.get('cid')}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:430,
			height:280,
			items:[updateForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					
					//是否有效
					var subValue=form.getValues();
					subValue.availabilityflag=(form.findField('availabilityflag').getValue()==false)?0:subValue.availabilityflag;
					form.submit( {
						url : "dictionary_saveOrUpdate.action",
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(subValue)
						},
				        success : function(response, opts){
				        	var retData =opts.result;
							var isSuc= retData.isSuc;
				        	if(isSuc==true){
								//treePanel.getStore().load(treePanel.getStore().getNodeById(parentId)); 
								var treeStore =treePanel.getStore();
									treePanel.getRootNode().removeAll();
									treeStore.load();
				        		funSuccess(response, opts,win,grid)
				        	}
				        	else{
				        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
				        	}
				        },
				        failure:function(response, opts){
				       	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
		});
	}
	
	function downLoadJs(type){
		var datas={jstype:type};
		var msgMask = new Ext.LoadMask(Ext.getBody(), {msg : "正在生成,请稍后..."});
		msgMask.show();
		Ext.Ajax.request( {
			type : 'ajax',
			timeout : 60000,
			url : 'dictionary_downJs.action',
			method : 'POST',
			params : { 
				rows:Ext.encode(datas) // 已字符形式传到后台
			},
			success : function(response, opts) {
				var retData = Ext.decode(response.responseText);
				Ext.Msg.alert('提示',retData.msg);
				msgMask.hide();
			},
			failure : function(response, opts) {
				Ext.Msg.alert("<s:text name='util.fail'/>","");
				msgMask.hide();
			}
		});
	}
	/*面板 */
	function resPanel(){
		return Ext.create('Ext.panel.Panel',{ 
		    layout:'border',
		    region:'center',
		   	items:[mainGrid()]//TabPanel中的标签页
	    });
	}
	/*管理面板 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"字典管理",
	    layout:'border',
	    closable:true,
	   	items:[dictionaryTree(),resPanel()]//TabPanel中的标签页
    }); 
    
 

	
	
})();