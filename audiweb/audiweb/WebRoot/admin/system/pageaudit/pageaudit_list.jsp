<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*内容审核记录表Model */
	Ext.define('CmsPageAudit',{
		extend:'Ext.data.Model',
		fields : ['cpaId','cmp','cpaType','cpaComments','cpaAuditTime','cpaAudituser'] // 对应页面审核记录表中的字段，建议全部写出
	});
	/*内容审核记录Store */
   var store_pageaudit = Ext.create('Ext.data.Store',{
		model:'CmsPageAudit',
		pageSize:10, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'pageaudit_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	
	//cpaType含义0编辑 1未发布 2发布 3撤销发布  4申请审核 5审核未通过  6审核通过
	
	
	/*内容审核记录Form*/
	function pageauditMgrForm(){
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
					  {fieldLabel:'开始时间',name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d',labelWidth:80,width:220},
					  {fieldLabel:'结束时间',name:'endTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
					  {xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find'
					  	,handler:function(){
							var form = this.up('form').getForm();
							var comb = this.up('form').child('combobox');
							var store = this.up('form').up('panel').child('grid').getStore();
							var vals=form.getValues();
							//不为空
							var tiemIsNull=false;
							if(vals.startTime!='')
							{
								if(vals.endTime=='')
								{
									tiemIsNull=true;
								}
							}
							else if(vals.endTime!='')
							{
								if(vals.startTime=='')
								{
									tiemIsNull=true;
								}
							}
							//为空
							if(tiemIsNull){
								Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.promptMsg.optionTime'/>");
								return;
							}
							if(vals.startTime>vals.endTime)
							{
								Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.promptMsg.timeWarn'/>");
								return;
							}
							//json转码
							var jsonObj=Ext.encode({
							  startTime:vals.startTime,
							  endTime:vals.endTime
							  });
							  store.getProxy().extraParams = {rows:jsonObj};
							  store.load();
						}}]})}
	/* 页面审核记录列表*/
	function grid_pageaudit(){
		return Ext.create('Ext.grid.Panel',{
			title : '内容审核记录列表',
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_pageaudit, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_pageaudit}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:'序号',xtype:'rownumberer',width:30,align:'center'},
			       {header : 'ID',dataIndex : 'cpaId', flex:1}, 
			       {header : '内容',dataIndex : 'cmp', renderer:function(value){if(value!=""){return value.split(';')[1];} return ""},flex:1},
			       {header : '事件',dataIndex : 'cpaType', flex:1    ,renderer:function(v){
			       		//cpaType含义0编辑 1未发布 2发布 3撤销发布  4申请审核 5审核未通过  6审核通过
			       	if(v == 0){
			       		return "编辑";
			       	}else if (v == 1){
			       		return "未发布";
			       	}else if (v == 2){
			       		return "发布";
			       	}else if(v == 3){
			       		return "撤销发布";
			       	}else if(v == 4){
			       		return "申请审核";
			       	}else if(v == 5){
			       		return "审核未通过";
			       	}else if(v == 6){
			       		return "审核通过";
			       	}else {
			       		return false;
			       	}
			       	
			       }}, 
			       //{header : '说明',dataIndex : 'cpaComments', flex:1},
			       {header : '时间',dataIndex : 'cpaAuditTime', flex:1,renderer:function(v){return getDateTime(v);}}, 
			       {header : '操作人',dataIndex : 'cpaAudituser', flex:1}
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("查看内容审核记录"/*修改内容审核记录信息*/,[showPageAudit(record,view)]); // 弹出修改内容审核记录信息框
				}
			},
			tbar : [
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
							mkWindow("查看审核信息",[showPageAudit(secData[0],this.up('grid'))]); // 弹出查看框
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
							        url : 'pageaudit_del.action',
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
			}
			,'-',</s:if>
				  {text:'刷新',iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}]
		});
	}
	
	
	/* 查看,data:选中的行数据，grid:主页面中的grid用来刷新数据*/
	function showPageAudit(data,grid){
		var pageauditMgrForm = Ext.create('Ext.form.Panel',{
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
				width:370,readOnly:true,fieldCls:'text-readonly'
			},
			items : [
			    //{fieldLabel : 'ID',hidden:false,allowBlank : false,name:'cpaId', value:data.get('cpaId'),readOnly:true,fieldCls:'text-readonly'},
			    {xtype:'textarea',fieldLabel : '内容',name:'cmp',height:240 ,value:data.get('cmp')},
			    {fieldLabel : '事件',hidden:false,name:'cpaType', value:data.get('cpaType'),xtype:'combo',
					    	//cpaType含义0编辑 1未发布 2发布 3撤销发布  4申请审核 5审核未通过  6审核通过
							store:[["0", "编辑"],["1", "未发布"],["2", "发布"],["3", "撤销发布"],["4", "申请审核"],["5", "审核未通过"],["6", "审核通过"]]
							},
			    //{xtype:'textarea',fieldLabel : '说明',hidden:false,name:'cpaComments', value:data.get('cpaComments')},
			    {xtype:"datefield",fieldLabel : '时间',name:'cpaAuditTime',value:data.get('cpaAuditTime'),format:'Y-m-d H:i:s',readOnly:true,fieldCls:'text-readonly'},
			    {fieldLabel : '操作人',name:'cpaAuditTime',value:data.get('cpaAudituser'),readOnly:true,fieldCls:'text-readonly'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:400,
			height:420,
			items:[pageauditMgrForm], // 将表单面板加入该panel中
			fbar:[{
				text:'确定',
				handler:function(){
					this.up('window').close();
				}
			},{text:'取消',handler:function(){this.up('window').close();}}]
		});
	}

/**
 * 页面审核记录面板
 */
  return Ext.create('Ext.panel.Panel',{ 
		title:'内容审核记录', // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[pageauditMgrForm(),grid_pageaudit()]//TabPanel中的标签页
    }); 
})();


