<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
 (function(){
 	/*系统日志表Model */
	Ext.define('logModel',{
		extend:'Ext.data.Model',
		fields : ['cmlId','cmlFunction','cmlType','cmlDesc','cmlTime','cmlUser'] // 对应日志表中的字段，建议全部写出
	});
	
	/*系统日志Store */
   var store_log = Ext.create('Ext.data.Store',{
		model:'logModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'log_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	
	/*系统日志Form*/
	function logMgrForm(){
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
					{fieldLabel:'开始日期',name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d',labelWidth:80,width:220},
				 	{fieldLabel:'结束日期',name:'endTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
				 	{xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
				 		,handler:function(){
							var form = this.up('form').getForm();
							var comb = this.up('form').child('combobox');
							var store = this.up('form').up('panel').child('grid').getStore();
							var vals=form.getValues();
							if(vals.startTime > vals.endTime)
							{
								Ext.Msg.alert('温馨提示：','查询结束时间不能早于开始时间');
								return;
							}
							//json转码
							var jsonObj=Ext.encode({
							  cmlTime:vals.cmlTime,
							  startTime:vals.startTime,
							  endTime:vals.endTime
							  });
							store.getProxy().extraParams = {rows:jsonObj};
							store.load();
						}}]});
	}
	/* 系统日志列表*/
	function grid_log(){
		return Ext.create('Ext.grid.Panel',{
			title : '系统日志列表',
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_log, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_log}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:'序号',xtype:'rownumberer',width:30,align:'center'},/*序号*/
			       {header : 'ID',dataIndex : 'cmlId', flex:1}, /*ID*/
			       {header : '日志操作功能',dataIndex : 'cmlFunction', flex:1},/*日志操作功能*/
			       {header : '日志类型',dataIndex : 'cmlType', flex:1}, /*日志类型*/
			       {header : '日志描述',dataIndex : 'cmlDesc', flex:1,renderer:function(v){return Ext.htmlEncode(v);}},/*日志描述*/
			       {header : '日志日期',dataIndex : 'cmlTime', flex:1,renderer:function(v){/*日志日期*/
			   		    return getDateTime(v);
			       	}
			       }, 
			       {header : '日志添加人',dataIndex : 'cmlUser', flex:1}/*日志添加人*/
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("查看日志信息"/*查看日志信息*/,[showLog(record,view)]); // 弹出修改数据字典框
				}
			},
			tbar : [
//				{
//				text : '新增',
//				iconCls : 'icon-add',
//				handler : function() {
//					var grid=this.up('grid');
//					mkWindow("添加系统日志",[addLog(grid)]); // 弹出新增系统日志框
//				}
//			},'-', 
			 {
				text : '查看',
				iconCls : 'icon-find',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert('提示','您最少要选择一条记录');
					} else if(secData.length > 1){
						Ext.Msg.alert('提示','不能同时修改多条记录');
					} else {
						mkWindow("查看系统日志信息",[showLog(secData[0],this.up('grid'))]); // 弹出修改系统日志框
					}
				}
			}, '-', 
				<s:if test="isDel()">{
				text : '删除',
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length > 0){
						Ext.MessageBox.confirm("提示","你确定要删除吗?",function(btn){
							if(btn=="yes"){
								//同时删除多条记录
								var jsonArr = [];
								Ext.Array.each(secData,function(record){
									jsonArr.push(record.data);
								});
								//alert(Ext.encode(jsonArr));
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'log_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 以字符串形式传到后台
									},
									success : function(response, opts) {
										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
										 var retData = Ext.decode(response.responseText);
										 var valid= retData.success;
										 if(!valid){
										 	 Ext.Msg.alert('提示',retData.msg);
										 } else {
										 	 Ext.Msg.alert('提示',retData.msg);
										 	 grid.getStore().load(); // 重新加载数据
										 }
									},
									failure : function(response, opts) {
										Ext.Msg.alert('失败','操作失败!');
									}
								})
							}
						});
					} else {
						Ext.Msg.alert('提示','请至少选择一行进行操作');
					}
				}
			},
				'-',</s:if>
				{text:'刷新',iconCls: 'icon-refresh',handler:function(){
				var grid = this.up('grid');
				grid.getStore().load();
				
				}}
			]
		});
	}
	
	/* 添加系统日志*/
	function addLog(grid){
		var addLogForm = Ext.create('Ext.form.Panel',{
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
			    {xtype:'hidden',name:'cmlId',id:'cmlId'},
			    {fieldLabel : '日志操作功能',name:'cmlFunction',allowBlank : false},
			    {fieldLabel : '日志类型',name:'cmlType',allowBlank : false},
			    {xtype:'textarea',name:'cmlDesc',fieldLabel : '日志描述', height:80},
			    {fieldLabel : '日志日期',name:'cmlTime',allowBlank : false},
			    {fieldLabel : '日志添加人',name:'cmlUser',hidden:true,value:'${cmsuser.cmuName}'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:350,
			items:[addLogForm], // 将表单面板加入该panel中
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
						        url : 'log_add.action',
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
	/* 查看数据字典,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function showLog(data,grid){
		var addLogForm = Ext.create('Ext.form.Panel',{
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
			    {fieldLabel : '系统日志主键ID',hidden:false,allowBlank : false,name:'cmlId', value:data.get('cmlId'),readOnly:true,fieldCls:'text-readonly'},
			    {fieldLabel : '日志操作功能',hidden:false,name:'cmlFunction', value:data.get('cmlFunction')},
			    {fieldLabel : '日志类型',hidden:false,name:'cmlType', value:data.get('cmlType')},
			    {xtype:'textarea',fieldLabel : '日志描述', name:'cmlDesc',height:80, value:data.get('cmlDesc')},
			    {fieldLabel : '日志日期',name:'cmlTime',hidden:true},
			    {fieldLabel : '日志添加人',hidden:true,name:'cmlUser', value:data.get('cmlUser')}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:220,
			items:[addLogForm], // 将表单面板加入该panel中
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
//						//url : 'log_modify.action',
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
 	* 系统日志面板
	*/
  return Ext.create('Ext.panel.Panel',{ 
		title:'系统日志管理', // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[logMgrForm(),grid_log()]//TabPanel中的标签页
    }); 

 })();
 