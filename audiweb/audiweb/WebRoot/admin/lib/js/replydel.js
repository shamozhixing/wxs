function showReply(conid,type){
		Ext.define('circleReplyModel',{
			extend:'Ext.data.Model',
			fields : ['ccrId','ccrConId','ccrType','ccrText','ccrPhoto','ccrStatus','ccrAddtime','user.userName']
		});
	   	var circleReplyStore = Ext.create('Ext.data.Store',{
			model:'circleReplyModel',
			pageSize:18, // 每页显示50条记录
			autoLoad:true, // 加载时就读取数据
			proxy:{
				type:'ajax',
				url:'audiade/circleContentReply_list.action?ccrType='+type+'&ccrConid='+conid,//请求后台信息
				method:'POST',
				reader:{
					type:'json',
					root:'list', // 跟节点
					totalProperty:'totalCount' // 总记录数
				}
			}
		}); 
		
		function replyForm(){
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
					{xtype:'textfield',fieldLabel:'回复人',name:'replyMember',labelWidth:80,width:220},
					{xtype: 'button',width:60,margin:'0 0 5 30',text:"查询",iconCls:'icon-find'
					  ,handler:function(){
							var f = this.up('form').getForm();
							var store = this.up('form').nextSibling().getStore()
							store.on('beforeload', function(ds,options) {
								Ext.apply(ds.proxy.extraParams, f.getValues());
							});
							store.load()
					  }
					}]
			});
		}	
		
		var replyGrid =  Ext.create('Ext.grid.Panel',{
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : circleReplyStore, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'/*,mode:'SIMPLE'*/},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:circleReplyStore}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:'序号',xtype:'rownumberer',width:30,align:'center'},
			       
			       {header:'回复ID',dataIndex:'ccrId',flex:1},
			       {header:'内容ID',dataIndex:'ccrConId', flex:1}, 
			       {header:'内容类型',dataIndex:'ccrType', flex:1}, 
			       {header:'回复内容',dataIndex:'ccrText', flex:1},
			       {header:'回复相片',dataIndex:'ccrPhoto', flex:1},
			       {header:'回复人',dataIndex:'user.userName', flex:1}, 
			       {header:'状态',dataIndex:'ccrStatus', flex:1},
			       {header:'最后回复时间',dataIndex:'ccrAddtime', flex:1,
				       	renderer:function(v){
			       	  		return getDateTime(v);
		         		}
			       }
			    ]
			},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
				   mkWindow("详细信息",[viewMsg(record,view)]);
			}},
			tbar : [
				{text:'删除',iconCls:'icon-delete',
					handler : function() {
						var grid = this.up('grid');
						var recs = this.up('grid').getSelectionModel().getSelection();
						if(recs.length>0){
							Ext.MessageBox.confirm("提示","确认删除？",function(btn){
							if(btn=="yes"){
							    var jsonArr = [];
								Ext.Array.each(recs,function(rec){
									jsonArr.push(rec.data);
								});
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'audiade/circleContentReply_del.action',
							        method : 'POST',
							        params : { 
										rows:Ext.encode(jsonArr) // 以字符串形式传到后台
									},
									success : function(response, opts) {
										//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
										 var retData = Ext.decode(response.responseText);
										 var valid= retData.success;
										 if(!valid){
										 	 Ext.Msg.alert("提示","删除失败");
										 } else {
										 	 Ext.Msg.alert("提示","删除成功");
										 	 grid.getStore().load(); // 重新加载数据
										 }
									},
									failure : function(response, opts) {
										Ext.Msg.alert("提示","删除失败");
									}
								})
							}
						});
						}else{
							Ext.Msg.alert('提示','请选择一条记录');
						}
					}
				},'-',
				{text:'刷新',iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
				}}
			]
		});
		
		function viewMsg(data,grid){
			var viewMsgForm=Ext.create('Ext.form.Panel',{
				 border:false,
					region:'center',
					bodyStyle:{background:'transparent'},
					layout:{ 
						type:'table' // 表格布局
						,columns:2 // 只有1列
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
					items:[
                          {fieldLabel: "回复ID",name : 'ccrId'},
                          {fieldLabel: "内容ID",name : 'ccrConId'},
                          {fieldLabel: "回复内容",name : 'ccrText',colspan:2,width:600},
                          {fieldLabel: "回复相片",name : 'ccrPhoto'},
                          {fieldLabel: "回复人",name : 'user.userName'},
                          {fieldLabel: "状态",name : 'ccrStatus',id:"sta"},
                          {fieldLabel: "回复时间",name : 'ccrAddtime'}
					    ],
					    listeners : {
							afterrender : function(me, eOpts) {
								if (data != null) {
									me.loadRecord(data);
									var sta=data.get("ccrStatus");
									if(sta=='0'){
									  Ext.getCmp('sta').setValue("未发布");
									}else{
									  Ext.getCmp('sta').setValue("已发布");
									}
								}
							}
						}
			});
			return Ext.create('Ext.panel.Panel',{
				layout:'border', // 使用border布局，必须要有一个panel放置在center部位
				width:640,
				height:200,
				items:[viewMsgForm] // 将表单面板加入该panel中
			});
		}
	
		return Ext.create('Ext.panel.Panel',{ 
		    layout:'border',
		    width:640,
		    height:320,
		   	items:[replyForm(),replyGrid]//TabPanel中的标签页
	    }); 
	}