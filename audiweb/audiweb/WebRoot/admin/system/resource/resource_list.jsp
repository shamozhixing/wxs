<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/**资源表Model */
	Ext.define('CMS_RESOURCE',{
		extend:'Ext.data.Model',
		fields : ['cmrId','cmrParentId','cmrName','cmrTypeId','cmrSort','cmrFileName','cmrOrderVal','cmrWidth','cmrHeight','cmrAlt','cmrAddtime','cmrAdduser','cmrLasttime','cmrLastuser','cmrPubStatus']
	});
	
	/*资源Store */
   var store_resource = Ext.create('Ext.data.Store',{
		model:'CMS_RESOURCE',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'resource_queryByCmrId.action',//请求后台信息
			method:'POST',
			extraParams:{cmrId:0},
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/**文件类型*/
	Ext.define('RESOUSE_TYPE', {
	    extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'text'}
	    ]
	});
	var resoureTypeData=[{value:0,text:"文件"},{value:1,text:"目录"}];
	var resoureTypeStore=Ext.create('Ext.data.Store',{
	autoLoad: true,
    model: 'RESOUSE_TYPE',
    data : resoureTypeData,
    proxy: {
        type: 'memory'
    }
    });
	
   /**资源Form查找*/
	function resourceMgrForm(){
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
				{xtype:'textfield',fieldLabel:"<s:text name='cms_resource.cmrFileName'/>",name:'cmrFileName'},
				{xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
				,handler:function(){
					var form = this.up('form').getForm();
					var comb = this.up('form').child('combobox');
					var store = this.up('form').up('panel')
							.child('grid').getStore();
					var vals=form.getValues();
					/*if(vals.startTime>vals.endTime)
					{
						//Ext.Msg.alert("<s:text name='util.promptTitle'/>",'查询结束时间不能大于开始时间');
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.promptMsg.timeWarn'/>");
						return;
					}*/
					var jsonObj=Ext.encode({
					  cmrFileName:vals.cmrFileName
//					  cmroDesc:vals.cmroDesc,
//					  cmroAdduser:vals.cmroAdduser,
//					  startTime:vals.startTime,
//					  endTime:vals.endTime
					  });
					  store.getProxy().extraParams = {rows:jsonObj};
					  store.load();
				}
			}
				]
			});
	}
	//树的节点
		var rootPath_="";
    /**资源目录树*/
	function resourceFolderTree(){
		Ext.define('resourceModel', {
			extend : 'Ext.data.Model',
			fields : ['cmrId','text','children', 'url',{name:'id',mapping:'cmrId'},'cmrParentId']// text 必须的 否则得设置,
		});
		var resourceTreeStore = Ext.create('Ext.data.TreeStore', {
			model : 'resourceModel',
			nodeParam:'cmrId',
			root : {
				text : '所有资源',
				expanded : true,
				id:0,
				leaf:false
			},
			proxy : {
				type : 'ajax',
				url : "resource_getResourceTreeById.action"
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
					resourceTreePanel.getSelectionModel().select(rootStore.getRootNode(),true);
				}
			}
			rootMenuIsLoading();
		}
		//获取菜单树
		var resourceTreePanel=Ext.create('Ext.tree.Panel',
			{
				title:"资源管理",
				animate : true,
				width : 150,
				collapsible : true,
				split : true,
				region:'west',
				rootVisible : true,
				resizable : true,
				useArrows : true,
				store :resourceTreeStore,
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
						gridStore.getProxy().extraParams={cmrId:0};
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
						rootPath_=getRealPath_resource(thisNode.getPath());
						var gridStore = this.up('panel').down('grid').getStore();
						gridStore.getProxy().extraParams = {cmrId:rec.get('id')};
						  gridStore.load();
						  resourceTreePanel.getSelectionModel().select(thisNode,true);
					}
				}
			});
			
			function getRealPath_resource(nodePath){
			var servicePath="uploadfiles/";
			//将“/0/”截取掉
			nodePath=nodePath.substring(3);
			if(nodePath==''){
				return servicePath;
			}
			var fullPath=nodePath.split("/");
			for(var i=0;i<fullPath.length-1;i++){
				var node=resourceTreePanel.getStore().getNodeById(fullPath[i]);
					servicePath+=node.raw.fileRealName+"/";
			}
			var node=resourceTreePanel.getStore().getNodeById(fullPath[fullPath.length-1])
			servicePath+=node.raw.fileRealName;
			return servicePath;
		}
			
		return resourceTreePanel;
	}
	
	/* 资源信息列表*/
	function grid_resource(){
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='admin.system.resource.dictionaryList'/>",//资源列表
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_resource, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_resource}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[ {header:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:35,align:'center'},
					    {header : "<s:text name='cms_resource.cmrId'/>",		dataIndex : 'cmrId',sortable : true,flex:1},
						{header : "cmrParentId",dataIndex : 'cmrParentId',	flex:1,hidden:true},
						{header : "资源分类",dataIndex : 'cmrSort',	flex:1,
						renderer:function(v){
				         		var resouresText= getTextByStore(resoureTypeStore,v,"value","text");
				         		return resouresText;
						}},
						{header : "<s:text name='cms_resource.cmrName'/>",		dataIndex : 'cmrName',	flex:1},
						{header : "发布状态",dataIndex : 'cmrPubStatus',	flex:1,
							renderer:function(v){
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
							 }
			      		},
						{header : "<s:text name='cms_resource.cmrTypeId'/>",	dataIndex : 'cmrTypeId',flex:1,hidden:true,
						renderer:function(v){
				         		//var resouresText= getTextByStore(resoureTypeStore,v,"value","text");
				         		//return resouresText;
							return v;
						}}, 
						{header : "<s:text name='cms_resource.cmrFileName'/>",	dataIndex : 'cmrFileName',	flex:2},
						{header : "<s:text name='cms_resource.cmrOrderVal'/>",  dataIndex : 'cmrOrderVal',flex:1},
						{header : "<s:text name='cms_resource.cmrAddtime'/>",   dataIndex : 'cmrAddtime',flex:1.5,type:'date',width:140,renderer:function(v){
			       	  return getDateTime(v);
		         	}},
						{header : "<s:text name='cms_resource.cmrAdduser'/>",	dataIndex : 'cmrAdduser',flex:1},
						{header : "<s:text name='cms_resource.cmrLasttime'/>",  dataIndex : 'cmrLasttime',	flex:1.5,type:'date',width:140,renderer:function(v){
			       	  return getDateTime(v);
		         	}},
						{header : "<s:text name='cms_resource.cmrLastuser'/>",	dataIndex : 'cmrLastuser',	flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					<s:if test="isMod()">
					var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
				   mkWindow("<s:text name='admin.system.resource.updateResource'/>",[editResource(record,view,treePanel)]);// 双击每条数据时弹出修改模板框
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
						if(selectData.length>1){
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","对不起,不能同时选择多个目录!");
							return;
						}
						//获取树的父节点ID
						var recData=selectData[0];
						var parentId=recData.get('cmrId');
						var cmrSort=recData.get('cmrSort');
						if(cmrSort==0)
						{
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","对不起,请在[目录]下添加子文件");
						}
						else{
							mkWindow("<s:text name='admin.system.resource.addResource'/>",[addresource(grid,parentId,treePanel)]); //添加资源
						}
					}
					else{
						if(treePanel.getSelectionModel().getSelection().length<1){
							Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"请选择要添加的父节点"/**请选择要添加的父节点*/);
							return;
						}
						var recData=treePanel.getSelectionModel().getSelection()[0];
						//获取树的父节点ID
						var parentId=recData.get('id');
						//标志是否可以进行添加
						var flag=false;
						if(parentId==0)
						{
							flag=true;
						}else{
							var nowNode=treePanel.getStore().getNodeById(parentId);
							//是否子节点
							if(!nowNode.isLeaf()){
								flag=true;
							}
						}
						if(flag){
							mkWindow("<s:text name='admin.system.resource.addResource'/>",[addresource(grid,parentId,treePanel)]); //添加资源
						}
						else{
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","对不起,请在[目录]下添加子文件");
						}
					}
				}
			}, '-',</s:if> <s:if test="isMod()"> {
				text : "<s:text name='util.gridUpdate'/>", //text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length==0){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");/*请至少选择一行进行操作*/
					}
					else if(secData.length > 1){
						//提示    不能同时修改多条记录
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");
					} else {
						var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
						//修改资源信息
						mkWindow("<s:text name='admin.system.resource.updateResource'/>",[editResource(secData[0],this.up('grid'),treePanel)]); // 弹出修改资源框
					}
				}
			}, '-',  </s:if><s:if test="isDel()">{
				//删除
				text : "<s:text name='util.gridDelete'/>",
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var treePanel=this.up('panel').up('panel').up('panel').down('treepanel');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>","<s:text name='admin.system.role.comfirMsgDel'/>",function(btn){/*提示  你确定要删除吗?*/
							if(btn=="yes"){
								//同时删除多条记录
								var jsonArr = [];
								Ext.Array.each(secData,function(record){
									jsonArr.push(record.data);
								});
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'resource_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 已字符窜形式传到后台
									},
									success : function(response, opts) {
										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
										 var retData = Ext.decode(response.responseText);
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
										  grid.getStore().load(); // 重新加载数据
									 	  var treeStore =treePanel.getStore();
											treePanel.getRootNode().removeAll();
											treeStore.load();
									},
									failure : function(response, opts) {
										//Ext.Msg.alert('失败','操作失败!');
										Ext.Msg.alert("<s:text name='util.fail'/>","<s:text name='util.hanldFail'/>");/*失败  操作失败!*/
									}
								})
							}
						});
					} else {
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");/*请至少选择一行进行操作*/
					}
				}//刷新
			},'-',</s:if>{
				//查看详情
				text : "查看详情",
				iconCls : 'icon-find',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length != 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择一行您要查看的记录");
					} else if(secData.length == 1){
						var resultData=secData[0];
						if(resultData.get('cmrSort')=='0'){
							mkWindow("查看详情",[searchForm(resultData)]); // 弹出修改框
						}else{
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择文件类型进行查看");
						}
					}
				}//查看详情
			},'-',<s:if test="isMod()"> 
		  	{text:"工作流",iconCls: 'icon-user',handler:function(){
		    var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
			if(secData.length < 1){
				Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMin'/>"); /*提示  您最少要选择一条记录*/
			} else if(secData.length > 1){
				Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionUpdateRows'/>");/*提示  不能同时修改多条记录*/
			} else {
				mkWindow("资源工作流",[OperateWorkflowSource(secData[0],this.up('grid'))]);// 弹出操作工作流框
			}}},'-',</s:if>{text:"<s:text name='util.gridRefresh'/>",iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}]
		});
	}
	/* 添加资源 */
	function addresource(grid,parentId,treePanel){
		var formItems=[];
		var formHeight=250;
		var allImgExt=".jpg|.jpeg|.gif|.bmp|.png|.swf|"//全部图片格式类型 
		//items，动态items
		var formHiddenItems=[];
		formHiddenItems.push(
				[
					{xtype: 'numberfield',emptyText : "<s:text name='admin.system.resource.defaultImgWidth'/>"/*'默认为图片自身宽度'*/,fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth'},
					{xtype: 'numberfield',emptyText : "<s:text name='admin.system.resource.defaultImgHeight'/>"/*'默认为图片自身高度'*/,fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight'}, 
					{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt'}
				],
				[
					{fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth',hidden:true},
					{fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight',hidden:true}, 
					{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt',hidden:true}
				]
				);
		var folderTypeItems=[];
		folderTypeItems.push(
				[
					{xtype : 'hidden',fieldLabel : "isFolder",name : 'isFolder',value:false},
					{xtype:'fileuploadfield',fileUpload: true,fieldLabel:"<s:text name='cms_resource.cmrFileName'/>",allowBlank : false,name : 'cmrFileName',id:'upfile',
						listeners:{
						change:function(file,value,eOpts)
						{
							isUploadFile=true;
							var fileExt=value.substr(value.lastIndexOf(".")).toLowerCase();
							if(allImgExt.indexOf(fileExt+"|")>-1)
							{
								showInf('cmrWidth,cmrHeight,cmrAlt',250,false)
							}else{
								//showInf('cmrWidth,cmrHeight,cmrAlt',160,true)
							}
						}
					},validator : function(v) {
						if(v.lastIndexOf(".")==-1){
							return '请选择图片文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")<0){
							return '请选择图片文件！';
						}
						return true;
					}},
					{fieldLabel : "<s:text name='cms_resource.cmrName'/>",name : 'cmrName',allowBlank : false},
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrOrderVal'/>",name : 'cmrOrderVal',allowBlank : false}, 
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth',hidden:true},
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight',hidden:true}, 
					{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt',hidden:true}
				],
				[
					{xtype : 'hidden',fieldLabel : "isFolder",name : 'isFolder',value:true},
					{fieldLabel : "<s:text name='cms_resource.cmrName'/>",name : 'cmrName',allowBlank : false},
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrOrderVal'/>",name : 'cmrOrderVal',allowBlank : false}, 
					{name : 'cmrFileName',hidden:true},
					{name : 'cmrWidth',hidden:true},
					{name : 'cmrHeight',hidden:true}, 
					{name : 'cmrAlt',hidden:true}
				]
				);
		//是否是上传新文件,由于浏览器之间存在差异，在火狐下时不会获取完整路径，这里判断只要上传文件发生了change事件就视为上传
		var isUploadFile=false;
		
		if(true){
			formHeight=160;
			//如果是文件
			  formItems=[
				{xtype : 'hidden',fieldLabel : "cmrParentId",name : 'cmrParentId',value:parentId},
				{
					xtype : 'combo',fieldLabel:'资源分类',name:'cmrSort',editable:false,
					store : resoureTypeStore,value:0,valueField : 'value',displayField : 'text',triggerAction : 'all',
					listeners:{
						change:function(compo,newValue,oldValue,eOpts )
						{
							if(newValue==0){
								folderFun('isFolder,cmrFileName,cmrOrderVal,cmrName,cmrWidth,cmrHeight,cmrAlt',160,false);
							}else if(newValue==1){
								folderFun('isFolder,cmrFileName,cmrOrderVal,cmrName,cmrWidth,cmrHeight,cmrAlt',130,true);
							}
						}
					}
				},
				{xtype : 'hidden',fieldLabel : "isFolder",name : 'isFolder',value:false},
				{xtype:'fileuploadfield',fileUpload: true,fieldLabel:"<s:text name='cms_resource.cmrFileName'/>",allowBlank : false,name : 'cmrFileName',id:'upfile',
						listeners:{
						change:function(file,value,eOpts)
						{
							isUploadFile=true;
							var fileExt=value.substr(value.lastIndexOf(".")).toLowerCase();
							if(allImgExt.indexOf(fileExt+"|")>-1)
							{
								showInf('cmrWidth,cmrHeight,cmrAlt',250,false)
							}else{
								//showInf('cmrWidth,cmrHeight,cmrAlt',160,true)
							}
						}
					},validator : function(v) {
						if(v.lastIndexOf(".")==-1){
							return '请选择图片文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")<0){
							return '请选择图片文件！';
						}
						return true;
					}},
					{fieldLabel : "<s:text name='cms_resource.cmrName'/>",name : 'cmrName',allowBlank : false},
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrOrderVal'/>",name : 'cmrOrderVal',allowBlank : false}, 
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth',hidden:true},
					{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight',hidden:true}, 
					{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt',hidden:true}
				];
		}
		//隐藏显示相关信息
		function showInf(vals,height,isHidden){
			var splitStr=vals.split(',');
			Ext.each(splitStr,function(fieldName){
				var field=addResourceForm.getForm().findField(fieldName);
				addResourceForm.remove(field);
			});
			addResourceForm.add(isHidden?formHiddenItems[1]:formHiddenItems[0]);
			addResourceForm.up('panel').setHeight(height );
		}
		//是否是目录
		function folderFun(vals,height,isFolder){
			var splitStr=vals.split(',');
			Ext.each(splitStr,function(fieldName){
				var field=addResourceForm.getForm().findField(fieldName);
				addResourceForm.remove(field);
			});
			addResourceForm.add(isFolder?folderTypeItems[1]:folderTypeItems[0]);
			addResourceForm.up('panel').setHeight(height );
		}
		var addResourceForm = Ext.create('Ext.form.Panel',{
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
				labelWidth:60,
				labelAlign:'right',
				width:370
			},
			items : formItems
		});
		
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:formHeight,
			border:false,
			items:[addResourceForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//提交内容
					var submitFormValue=form.getValues();
					//是否上传文件
					submitFormValue.isUploadFile=isUploadFile;
					
					//文件路径
					submitFormValue.cmrFileName=getFileName(form.findField('cmrFileName').getValue());
					//是否是文件夹
					var isFolder=form.findField('isFolder').getValue();
					//为空表示是文件夹
					if('false'==isFolder){
						//是否图片
						var fileExt=submitFormValue.cmrFileName.substr(submitFormValue.cmrFileName.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")>-1)
						{
							submitFormValue.fileIsImage=true;
						}else{
							submitFormValue.fileIsImage=false;
						}
					}
					//是否是添加Folder(目录类型)
					var submitUrl='resource_add.action';
					if('true'==isFolder)
					{
						submitUrl='resource_addFolder.action';
					}
					form.submit( {
						url : submitUrl,
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(submitFormValue)
						},
				        success : function(response, opts){
				        	 	Ext.Msg.alert('提示','操作成功');
								win.close();
								grid.getStore().load({}); // 重新加载数据
								var treeStore =treePanel.getStore();
									treePanel.getRootNode().removeAll();
									treeStore.load();
				        },
				        failure:function(response, opts){
				       	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	
	/* 修改资源,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editResource(data,grid,treePanel){
		var parentId=data.get('cmrParentId');
		var formItems=[];
		var formHeight=250;
		var allImgExt=".jpg|.jpeg|.gif|.bmp|.png|.swf|"//全部图片格式类型 
		//items，动态items
		var formHiddenItems=[];
		formHiddenItems.push(
				[
					{xtype: 'numberfield',emptyText : "<s:text name='admin.system.resource.defaultImgWidth'/>"/*'默认为图片自身宽度'*/,fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth'},
					{xtype: 'numberfield',emptyText : "<s:text name='admin.system.resource.defaultImgHeight'/>"/*'默认为图片自身高度'*/,fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight'}, 
					{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt',value:data.get('cmrAlt')}
				],
				[
					{fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth',hidden:true},
					{fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight',hidden:true}, 
					{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt',hidden:true}
				]
				);
		//是否是上传新文件,由于浏览器之间存在差异，在火狐下时不会获取完整路径，这里判断只要上传文件发生了change事件就视为上传
		var isUploadFile=false;
		
		if(data.get('cmrSort')==0){
			var dataFileName=data.get('cmrFileName');		
			var fileSuffix=dataFileName.substr(dataFileName.lastIndexOf(".")).toLowerCase();	
			//如果是图片
			if(allImgExt.indexOf(fileSuffix+"|")>-1)
			{
			   formItems=[
			   	{xtype : 'hidden',name : 'cmrId',value:data.get('cmrId')},
			   	{xtype : 'hidden',fieldLabel : "isFolder",name : 'isFolder',value:false},
			   	{xtype : 'hidden',name : 'cmrParentId',value:parentId},
			   	{xtype : 'combo',fieldLabel:'资源分类',name:'cmrSort',editable:false,fieldCls:'text-readonly',readOnly : true,
					store : resoureTypeStore,value:data.get('cmrSort'),valueField : 'value',displayField : 'text'},
				{fieldLabel : "<s:text name='cms_resource.cmrName'/>",name : 'cmrName',allowBlank : false,value:data.get('cmrName')},
				{xtype:'fileuploadfield',fileUpload: true,fieldLabel:"<s:text name='cms_resource.cmrFileName'/>",allowBlank : false,name : 'cmrFileName',id:'upfile',
						listeners:{
						afterrender:function(component,eOpts){
							component.setRawValue(data.get('cmrFileName'));
						},
						change:function(file,value,eOpts)
						{
							isUploadFile=true;
							var fileExt=value.substr(value.lastIndexOf(".")).toLowerCase();
							if(allImgExt.indexOf(fileExt+"|")>-1)
							{
								showInf('cmrWidth,cmrHeight,cmrAlt',250,false)
							}else{
								//showInf('cmrWidth,cmrHeight,cmrAlt',160,true)
							}
						}
					},validator : function(v) {
						if(v.lastIndexOf(".")==-1){
							return '请选择图片文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")<0){
							return '请选择图片文件！';
						}
						return true;
					}},
				{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrOrderVal'/>",name : 'cmrOrderVal',allowBlank : false,value:data.get('cmrOrderVal')}, 
				{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrWidth'/>",name : 'cmrWidth', allowBlank : false,value:data.get('cmrWidth')},
				{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrHeight'/>",name : 'cmrHeight',allowBlank : false,value:data.get('cmrHeight')}, 
				{fieldLabel : "<s:text name='cms_resource.cmrAlt'/>",name : 'cmrAlt',value:data.get('cmrAlt')}
				];
		}
		else{
			formHeight=160;
			//如果是其他文件
			  formItems=[
			  	{xtype : 'hidden',name : 'cmrId',value:data.get('cmrId')},
					{xtype : 'hidden',fieldLabel : "isFolder",name : 'isFolder',value:false},
			   	{xtype : 'hidden',name : 'cmrParentId',value:parentId},
		   		{xtype : 'combo',fieldLabel:'资源分类',name:'cmrSort',editable:false,fieldCls:'text-readonly',readOnly : true,
				store : resoureTypeStore,value:data.get('cmrSort'),valueField : 'value',displayField : 'text'},
				{fieldLabel : "<s:text name='cms_resource.cmrName'/>",name : 'cmrName',allowBlank : false,value:data.get('cmrName')},
				{xtype:'fileuploadfield',fileUpload: true,fieldLabel:"<s:text name='cms_resource.cmrFileName'/>",allowBlank : false,name : 'cmrFileName',id:'upfile',
					listeners:{afterrender:function(component,eOpts){
						component.setRawValue(data.get('cmrFileName'));
					},
					change:function(file,value,eOpts)
					{
						isUploadFile=true;
						var fileExt=value.substr(value.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")>-1)
						{
							showInf('cmrWidth,cmrHeight,cmrAlt',250,false)
						}else{
							//showInf('cmrWidth,cmrHeight,cmrAlt',160,true)
						}
					}
				},validator : function(v) {
						if(v.lastIndexOf(".")==-1){
							return '请选择图片文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")<0){
							return '请选择图片文件！';
						}
						return true;
					}},
				{xtype: 'numberfield' ,minValue:0 , fieldLabel : "<s:text name='cms_resource.cmrOrderVal'/>",name : 'cmrOrderVal',value:data.get('cmrOrderVal')}, 
				{xtype: 'hidden' ,name : 'cmrWidth',value:data.get('cmrWidth')},
				{xtype: 'hidden',name : 'cmrHeight',value:data.get('cmrHeight')}, 
				{name : 'cmrAlt',value:data.get('cmrAlt'),hidden:true}
				];
		
		}
		}else if(data.get('cmrSort')==1){
			formHeight=130;
			//如果是文件夹
			  formItems=[
			  		{xtype : 'hidden',name : 'cmrId',value:data.get('cmrId')},
				 	{xtype : 'hidden',fieldLabel : "cmrParentId",name : 'cmrParentId',value:parentId},
				  	{xtype : 'hidden',fieldLabel : "isFolder",name : 'isFolder',value:true},
					{
						xtype : 'combo',fieldLabel:'资源分类',name:'cmrSort',editable:false,fieldCls:'text-readonly',readOnly : true,
						store : resoureTypeStore,value:data.get('cmrSort'),valueField : 'value',displayField : 'text',triggerAction : 'all'
					},
					{fieldLabel : "<s:text name='cms_resource.cmrName'/>",name : 'cmrName',allowBlank : false,value:data.get('cmrName')},
					{xtype: 'numberfield' ,minValue:0 ,value:data.get('cmrOrderVal'), fieldLabel : "<s:text name='cms_resource.cmrOrderVal'/>",name : 'cmrOrderVal',allowBlank : false,value:data.get('cmrOrderVal')}, 
					{name : 'cmrFileName',hidden:true},
					{name : 'cmrWidth',hidden:true},
					{name : 'cmrHeight',hidden:true}, 
					{name : 'cmrAlt',hidden:true}
				];
		}
		//隐藏显示相关信息
		function showInf(vals,height,isHidden){
			var splitStr=vals.split(',');
			Ext.each(splitStr,function(fieldName){
				var field=addResourceForm.getForm().findField(fieldName);
				addResourceForm.remove(field);
			});
			addResourceForm.add(isHidden?formHiddenItems[1]:formHiddenItems[0]);
			addResourceForm.up('panel').setHeight(height );
		}
		var addResourceForm = Ext.create('Ext.form.Panel',{
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
				labelWidth:60,
				labelAlign:'right',
				width:370
			},
			items : formItems
		});
		
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:formHeight,
			border:false,
			items:[addResourceForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//提交内容
					var submitFormValue=form.getValues();
					//是否上传文件
					submitFormValue.isUploadFile=isUploadFile;
					
					//文件路径
					submitFormValue.cmrFileName=getFileName(form.findField('cmrFileName').getValue());
					//是否是文件夹
					var isFolder=form.findField('isFolder').getValue();
					//为空表示是文件夹
					if('false'==isFolder){
						//是否图片
						var fileExt=submitFormValue.cmrFileName.substr(submitFormValue.cmrFileName.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")>-1)
						{
							submitFormValue.fileIsImage=true;
						}else{
							submitFormValue.fileIsImage=false;
						}
					}
					//是否是添加Folder(目录类型)
					var submitUrl='resource_modify.action';
					if('true'==isFolder)
					{
						submitUrl='resource_modifyFolder.action';
					}
					form.submit( {
						url : submitUrl,
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(submitFormValue)
						},
				        success : function(response, opts){
				        	 	Ext.Msg.alert('提示','操作成功');
								win.close();
								grid.getStore().load({}); // 重新加载数据
								var treeStore =treePanel.getStore();
									treePanel.getRootNode().removeAll();
									treeStore.load();
				        },
				        failure:function(response, opts){
				       	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	/*资源面板 */
	function resPanel(){
		return Ext.create('Ext.panel.Panel',{ 
		    layout:'border',
		    region:'center',
		   	items:[resourceMgrForm(),grid_resource()]//TabPanel中的标签页
	    });
	}
	/*资源管理面板 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='admin.system.resource.resourceManager'/>", // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[resourceFolderTree(),resPanel()]//TabPanel中的标签页
    }); 
    
    //根据浏览器获取文件名称
    function getFileName(filePath)
    {
    	if(filePath!='')
    	{
	    	var filePath=filePath.split('\\');
	    	return filePath[filePath.length-1];
    	}

    }
    /** 工作流方法,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function OperateWorkflowSource(data,grid){
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
				{hidden:true,allowBlank : false,name:'cmrId', value:data.get('cmrId'),readOnly:true,fieldCls:'text-readonly'},
			    {fieldLabel : "资源名称",name:'cmrName', value:data.get('cmrName'),readOnly:true,fieldCls:'text-readonly'},
				{xtype:'combo',emptyText:'请选择',fieldLabel : "事件",name:'cmrPubStatus',allowBlank : false,value:data.get('cmtPubStatus'),store:[ ["1", "发布"], ["3", "撤销发布"]],triggerAction: 'all',selectOnFocus : true,editable:false},/*状态  0-编辑；   1-发布；  2-编辑/发布；  3-撤销发布 */
			    {xtype:'textarea',fieldLabel : "详细说明",name:'cmrComments'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border',
			width:400,
			height:170,
			items:[OperateWorkflowForm],
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm();
					var win = this.up('window');
					if(!form.isValid()) {
						return;
					}
					form.submit( {
						url : 'resource_workflowSource.action',
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(form.getValues())
						},
				        success : function(response, opts){
				        	Ext.Msg.alert('提示','操作成功');
							win.close();
							grid.getStore().load();
				        },
				        failure:function(response, opts){
				       	 	funFailure(response, opts);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]/*取消*/
		});
	}
	<%
		String path = request.getContextPath();
		%>
	/**查看信息窗口*/
	function  searchForm(data){
		var sourceDate=strForDate(getDateTime(data.get('cmrLasttime')));
		var realName=Ext.Date.format(sourceDate,"YmdHis");
		var fileSuxx=data.get('cmrFileName').substr(data.get('cmrFileName').lastIndexOf("."));
		var nowRootPath="";
		if(rootPath_!="uploadfiles/" && rootPath_!=""){
			nowRootPath=rootPath_+"/"
		}else{
			nowRootPath="uploadfiles/";
		}
		var noRootPath=nowRootPath+realName+fileSuxx;
		var fullPath="<%=path%>/"+noRootPath;
		var editDeoForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ type:'table',columns:1 ,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}},tdAttrs:{align:'left'}},
			style:'padding-bottom:10px',
			defaults:{xtype:'textfield',labelWidth:80,labelAlign:'right',width:310,readOnly:true,fieldCls:'text-readonly'},
			items : [
				{xtype:'panel',
					height:40,
					width:320,
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
								height : 20,
								width : 240,
								labelWidth:80,
								xtype:'textfield',
								fieldLabel : "图片名称",value:data.get('cmrName'),readOnly:true,fieldCls:'text-readonly'
							},
							{
									width:70,xtype:'button',margin:'0 0 5 0',text:'查看缩略图',
									handler:function(){
										var w=data.get('cmrWidth');
										var h=data.get('cmrHeight');
										if(w=='' || w<=0){
											w=350;
										}else if(w>=1024){
											w=1000;
										}
										if(h=='' || h<=0){
											h=350;
										}else if(h>=768){
											h=600;
										}
									mkWindow("缩略图",[viewGift(w,h,fullPath)]);
								}
							}
						]
				},
				{fieldLabel : "文件真实路径",value:fullPath},
				{fieldLabel : "添加时间",name : 'cmrAddtime',value:getDateTime(data.get('cmrAddtime')),xtype:"datefield",format : 'Y-m-d H:i:s'},
				{fieldLabel : "修改时间",name : 'cmrLasttime',value:getDateTime(data.get('cmrLasttime')),xtype:"datefield",format : 'Y-m-d H:i:s'}]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:320,
			height:180,
			items:[editDeoForm], // 将表单面板加入该panel中
			fbar:[{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	
	function strForDate(t){
		if(Ext.typeOf(t)!='date'){
		var re = /T/gi;
		t = t.replace(re, " ");
		var re = /-/gi;
		t = t.replace(re, "/");
	}
	var d = new Date(t);
	return d;
	}
	
	/**查看图*/
	function viewGift(w,h,img){
		return Ext.create('Ext.panel.Panel',{
			width:w,
			height:h,
			minHeight:h,
			maxHeight:h,
			minWidth:w,
			maxWidth:w,
			layout: 'fit',
			style:'text-align:center',
			items:[{   
			    xtype: 'component',  
			    autoEl: {   
			        tag: 'img',  
			        src: img  
			        
			    }   
			}],listeners:{
					afterrender:function(com,e){
						var win=this.up('window');
						w=parseInt(w)+10;
						h=parseInt(h)+33;
						win.setWidth(w);
						win.setHeight(h);
						win.minHeight=h;
						win.maxHeight=h;
						win.minWidth=w;
						win.maxWidth=w;
					}
				}
		});
	}
	
})();