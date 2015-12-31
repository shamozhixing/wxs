<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*内容版本表Model,创建内容版本类 */
	Ext.define('CmsPageVersions',{
		extend:'Ext.data.Model',
		fields : [
			{name:'cpveId',type:'Integer'},
			{name:'cpveCmpId',type:'Integer'},
			{name:'cpveVersionsName',type:'String'},
			{name:'cpveCmpContent',type:'String'},
			{name:'cpveComments',type:'String'},
			{name:'cpveAddtime',type:'Date'},
			{name:'cpveAdduser',type:'String'},
			{name:'cmpname',type:'String'}
		] // 对应内容版本表中的字段，建议全部写出
	});
	/*内容版本Store */
   var store_pageversions = Ext.create('Ext.data.Store',{
		model:'CmsPageVersions',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'pageversions_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/*内容版本Form*/
	function pageversionsMgrForm(){
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
					  {xtype:'textfield',fieldLabel:'版本名称',name:'cpveVersionsName',labelWidth:80,width:220},
					  {xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
					  	,handler:function(){
							var form = this.up('form').getForm();
							var comb = this.up('form').child('combobox');
							var store = this.up('form').up('panel').child('grid').getStore();
							var vals=form.getValues();
							//json转码
							var jsonObj=Ext.encode({
							  cpveVersionsName:vals.cpveVersionsName
							  });
							  store.getProxy().extraParams = {rows:jsonObj};
							  store.load();
						}
			}]
			});
	}
	/* 内容版本列表*/
	function grid_pageversions(){
		return Ext.create('Ext.grid.Panel',{
			title : '内容版本列表',
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_pageversions, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_pageversions}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:'序号',xtype:'rownumberer',width:30,align:'center'},
			       {header : 'ID',dataIndex : 'cpveId', flex:1}, 
			       //{header : '内容ID',dataIndex : 'cpveCmpId', flex:1},
			       {header:'内容名称',dataIndex:'cmpname',flex:1},
			       {header : '版本名称',dataIndex : 'cpveVersionsName', flex:1}, 
			       //{header : '版本数据',dataIndex : 'cpveCmpContent', flex:1},
			       //{header : '说明',dataIndex : 'cpveComments', flex:1},
			       {header : '添加时间',dataIndex : 'cpveAddtime', flex:1,renderer:function(v){return getDateTime(v);}}, 
			       {header : '添加人',dataIndex : 'cpveAdduser', flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("查看内容版本"/*查看内容版本*/,[showPageVersions(record,view)]); // 弹出查看内容版本框
				}
			},
			tbar : [
//				{
//				text : '新增',
//				iconCls : 'icon-add',
//				handler : function() {
//					var grid=this.up('grid');
//					mkWindow("添加页面版本",[addPageVersions(grid)]); // 弹出新增页面版本框
//				}
//			}, '-', {
//				text : '修改',
//				iconCls : 'icon-edit',
//				handler : function() {
//					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
//					if(secData.length < 1){
//						Ext.Msg.alert('提示','您最少要选择一条记录');
//					} else if(secData.length > 1){
//						Ext.Msg.alert('提示','不能同时修改多条记录');
//					} else {
//						mkWindow("修改页面版本",[editPageVersions(secData[0],this.up('grid'))]); // 弹出修改页面版本框
//					}
//				}
//			}, '-', {
//				text : '删除',
//				iconCls : 'icon-delete',
//				handler : function() {
//					var grid = this.up('grid');
//					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
//					if(secData.length > 0){
//						Ext.MessageBox.confirm("提示","你确定要删除吗?",function(btn){
//							if(btn=="yes"){
//								//同时删除多条记录
//								var jsonArr = [];
//								Ext.Array.each(secData,function(record){
//									jsonArr.push(record.data);
//								});
//								//alert(Ext.encode(jsonArr));
//								Ext.Ajax.request( {
//									type: 'ajax',
//							        url : 'pageversions_del.action',
//							        method : 'POST',
//							        params : { 
//										rows:Ext.encode(jsonArr) // 以字符串形式传到后台
//									},
//									success : function(response, opts) {
//										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
//										 var retData = Ext.decode(response.responseText);
//										 var valid= retData.success;
//										 if(!valid){
//										 	 Ext.Msg.alert('提示',retData.msg);
//										 } else {
//										 	 Ext.Msg.alert('提示',retData.msg);
//										 	 grid.getStore().load(); // 重新加载数据
//										 }
//									},
//									failure : function(response, opts) {
//										Ext.Msg.alert('失败','操作失败!');
//									}
//								})
//							}
//						});
//					} else {
//						Ext.Msg.alert('提示','请至少选择一行进行操作');
//					}
//				}
//			}
			{
				text : '查看详情',
				iconCls : 'icon-find',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert('提示','您最少要选择一条记录');
					} else if(secData.length > 1){
						Ext.Msg.alert('提示','不能同时修改多条记录');
					} else {
						mkWindow("查看内容版本",[showPageVersions(secData[0],this.up('grid'))]); // 弹出查看内容版本框
					}
				}
			}
			,'-',
			{
				text:'刷新',iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}
			}
			]
		});
	}
	/* 添加内容版本 */
	function addPageVersions(grid){
		var addPageVersionsForm = Ext.create('Ext.form.Panel',{
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
			    {xtype:'hidden',name:'cpveId',id:'cpveId'},
			    {fieldLabel : '内容名称',name:'cmpname',allowBlank : false},
			    {fieldLabel : '版本名称',name:'cpveVersionsName',allowBlank : false},
			    {fieldLabel : '内容数据',name:'cpveCmpContent',allowBlank : false},
			    {xtype:'textarea',name:'cpveComments',fieldLabel : '说明', height:80},
			    {fieldLabel : '添加时间',name:'cpveAddtime',hidden:true},
			    {fieldLabel : '添加人',name:'cpveAdduser',hidden:true,value:'${cmsuser.cmuName}'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:350,
			items:[addPageVersionsForm], // 将表单面板加入该panel中
			fbar:[{
				text:'确定',
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					Ext.Ajax.request( {
								type: 'ajax',
						        url : 'pageversions_add.action',
						        method : 'POST',
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
			},{text:'取消',handler:function(){this.up('window').close();}}]
		});
	}
	/* 修改内容版本,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function editPageVersions(data,grid){
		var editPageVersionsForm = Ext.create('Ext.form.Panel',{
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
			    {fieldLabel : 'ID',hidden:true,allowBlank : false,name:'cpveId', value:data.get('cpveId'),readOnly:true,fieldCls:'text-readonly'},
			    {fieldLabel : '内容名称',hidden:false,name:'cmpname', value:data.get('cmpname')},
			    {fieldLabel : '版本名称',hidden:false,name:'cpveVersionsName', value:data.get('cpveVersionsName')},
			    {fieldLabel : '内容数据',hidden:false,name:'cpveCmpContent', value:data.get('cpveCmpContent')},
			    {xtype:'textarea',fieldLabel : '说明', name:'cpveComments',height:80, value:data.get('cpveComments')},
			    {fieldLabel : '添加时间',name:'cpveAddtime',hidden:true},
			    {fieldLabel : '添加人',hidden:true,name:'cpveAdduser', value:data.get('cpveAdduser')}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:350,
			items:[editPageVersionsForm], // 将表单面板加入该panel中
			fbar:[{
				text:'确定',
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					form.submit( {
						url : 'pageversions_modify.action',
						method : 'POST',
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
			},{text:'取消',handler:function(){this.up('window').close();}}]
		});
	}
	
	/* 查看内容版本,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function showPageVersions(data,grid){
		var editPageVersionsForm = Ext.create('Ext.form.Panel',{
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
				,readOnly:true,fieldCls:'text-readonly'
			},
			items : [
			   // {fieldLabel : 'ID',hidden:true,allowBlank : false,name:'cpveId', value:data.get('cpveId'),readOnly:true,fieldCls:'text-readonly'},
			    {fieldLabel : '内容名称',hidden:false,name:'cmpname', value:data.get('cmpname')},
			    {fieldLabel : '版本名称',hidden:false,name:'cpveVersionsName', value:data.get('cpveVersionsName')},
			    {xtype:'textarea',fieldLabel : '内容数据',hidden:false,name:'cpveCmpContent',height:370, value:data.get('cpveCmpContent')},
			    //{xtype:'textarea',fieldLabel : '说明', name:'cpveComments', value:data.get('cpveComments')},
			    {xtype:"datefield",fieldLabel : '添加时间',name:'cpveAddtime',hidden:false,value:data.get('cpveAddtime'),format:'Y-m-d H:i:s'},
			    {fieldLabel : '添加人',hidden:false,name:'cpveAdduser', value:data.get('cpveAdduser')}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:600,
			height:530,
			items:[editPageVersionsForm], // 将表单面板加入该panel中
			fbar:[{
				text:'确定',
				handler:function(){
					this.up('window').close();
//					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
//					var win = this.up('window');
//					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
//						return;
//					}
//					form.submit( {
//						//url : 'pageversions_modify.action',
//						method : 'POST',
//						params : { 
//						   rows:Ext.encode(form.getValues())
//						},
//				        success : function(response, opts){
//				        	funSuccess(response, opts,win,grid)
//				        },
//				        failure:function(response, opts){
//				       	 	funFailure(response, opts);
//				       	}
//					});
				}
			},{text:'取消',handler:function(){this.up('window').close();}}]
		});
	}
/**
 * 页面审核记录面板
 */
  return Ext.create('Ext.panel.Panel',{ 
		title:'内容版本', // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[pageversionsMgrForm(),grid_pageversions()]//TabPanel中的标签页
    }); 
})();


