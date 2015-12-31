Ext.namespace("templatefield");
//初始化提示
Ext.QuickTips.init();
//Ext.form.Field.prototype.msgTarget = 'under';
//表单非空时 加 红星 *
	Ext.form.Field.prototype.initComponent = function(){        
        if(this.allowBlank==false){
            this.fieldLabel="<span style='color:red;line-height:7px;vertical-align:middle;position: relative; top:2%;height:7px;'>*</span>"+this.fieldLabel;
        }else{
        	this.fieldLabel="&nbsp;&nbsp;"+this.fieldLabel;
        }
    };
    
var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, {
				header : 'Id',
				dataIndex : 'ctfId',
				hidden : true
			}, {
				header : '模板',
				dataIndex : 'ctfCmtId',
				width: 100
			}, {
				header : '字段名显示',
				dataIndex : 'ctfViewName',
				width: 100
			}, {
				header : '字段名',
				dataIndex : 'ctfName',
				width: 100
			}, {
				header : '字段类型',
				dataIndex : 'ctfType',
				width: 100
			}, {
				header : '长度',
				dataIndex : 'ctfLength',
				width: 100
			}, {
				header : '宽度',
				dataIndex : 'ctfWidth',
				width: 100
			},
			{
				header : '高',
				dataIndex : 'ctfHeight',
				width: 100
			},
			{
				header : '排序值',
				dataIndex : 'ctfOrderNum',
				width: 100
			},
			{
				header : '所属站点类型',
				dataIndex : 'ctfSiteType',
				width: 100
			},
		    {
				header : '最后修改人',
				dataIndex : 'ctfLastuser',
				width: 100
			},
		    {
				header : '最后修改时间',
				type:'date',
				renderer:Ext.util.Format.dateRenderer('Y-m-d H:i:s'),
				dataIndex : 'ctfLasttime',
				width: 120
			}
			]);
	
	var store_tempfield = new Ext.data.JsonStore({
		//url : '/OgilvyCms/admin/user_query.action',
		autoDestroy : true,
		autoSave : false,
		totalProperty : 'TOTALCOUNT',
		root : 'ROOT',
		remoteSort : true,
		proxy : new Ext.data.HttpProxy({
					api : {
						read : '../templatefield_query.action',
						create : '../templatefield_add.action',
						update : '../templatefield_modify.action',
						destroy : '../templatefield_del.action'
					}
				}),
		writer : new Ext.data.JsonWriter({
					encode : true,
					writeAllFields : true
				})
		//,fields : ['uid', 'username','password','tel','email','address']
	});

	store_tempfield.on("write", function(store, action, result, res, rs) {
		Ext.Msg.alert("信息", action + "成功");
		addTempfieldWindow.hide();
		store_tempfield.reload(	{
			params : {
					start : 0,
					limit : bbar_tempfield.pageSize
				}
				});
	});

	// 翻页排序时带上查询条件
	/*store.on('beforeload', function() {
				this.baseParams = {
					queryParam : Ext.getCmp('queryParam').getValue()
				};
			});*/

	var pagesize_combo_tempfield = new Ext.form.ComboBox({
				name : 'pagesize',
				hiddenName : 'pagesize',
				typeAhead : true,
				triggerAction : 'all',
				lazyRender : true,
				mode : 'local',
				store : new Ext.data.ArrayStore({
							fields : ['value', 'text'],
							data : [[10, '10条/页'], [20, '20条/页'],
									[50, '50条/页'], [100, '100条/页'],
									[250, '250条/页'], [500, '500条/页']]
						}),
				valueField : 'value',
				displayField : 'text',
				value : '10',
				editable : false
			});
	var number_tempfield = parseInt(pagesize_combo_tempfield.getValue());
	pagesize_combo_tempfield.on("select", function(comboBox) {
				bbar_tempfield.pageSize = parseInt(comboBox.getValue());
				number_tempfield = parseInt(comboBox.getValue());
				store_tempfield.reload({
							params : {
								start : 0,
								limit : bbar_tempfield.pageSize
							}
						});
			});

	var bbar_tempfield = new Ext.PagingToolbar({
				pageSize : number_tempfield,
				store : store_tempfield,
				displayInfo : true,
				displayMsg : '显示{0}条到{1}条,共{2}条',
				plugins : new Ext.ux.ProgressBarPager(), // 分页进度条
				emptyMsg : "没有符合条件的记录",
				items : ['-',  pagesize_combo_tempfield]
			});

	
			
	var grid_tempfield = new Ext.grid.GridPanel({
				title : '字段列表',
				height : 450,
				autoScroll :true,
				//autoHeight: true,
				store : store_tempfield,
				region : 'center',
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				//autoExpandColumn : 'targetId',
				cm : cm,
				sm : sm,
				tbar : [{
					text : '新增',
					id : 'create',
					iconCls : 'page_addIcon',
					handler : function() {
						addTempfieldInit();
						
					}
				}, '-', {
					text : '修改',
					handler : function() {
						Ext.getCmp("addTempfieldPanel").getForm().reset();
						// 获取行数据集
						var record = grid_tempfield.getSelectionModel().getSelected();
						var rows = grid_tempfield.getSelectionModel().getCount();
						if (Ext.isEmpty(record)) {
							Ext.MessageBox.alert('提示', '请先选择要修改的项目!');
							return;
						}
						if(rows>1){
							Ext.MessageBox.alert('提示', '请先选择一条记录修改!');
							return;
						}

						addTempfieldWindow.show();
						addTempfieldWindow.setTitle('修改模板字段');
						Ext.getCmp("addTempfieldPanel").getForm().loadRecord(record);

					}
				}, '-', {
					text : '删除',
					id : 'delete',
					handler : function() {
						var rowIndex = grid_tempfield.store.indexOf(grid_tempfield.getSelectionModel().getSelected());
						if(rowIndex >= 0)
						{
							Ext.MessageBox.confirm("提示","你确定要删除吗?",function(btn){
								
									if(btn=="yes")
									{
										var sm = grid_tempfield.getSelectionModel();
										grid_tempfield.getStore().remove(grid_tempfield.getSelectionModel().getSelections());
										grid_tempfield.getSelectionModel().selectNext();
										
										grid_tempfield.getStore().save();
									}
								
								
								
							});
						}
						else
						{
							Ext.Msg.alert('提示','请至少选择一行进行操作');
						}
					}
				}],
				bbar : bbar_tempfield
			});
	
			store_tempfield.load({
				params : {
					start : 0,
					limit : bbar_tempfield.pageSize
				}
			});
			
			grid_tempfield.on('rowdblclick', function(pGrid, rowIndex, event) {
				// 获取行数据集
					var record = pGrid.getStore().getAt(rowIndex);
					
					addTempfieldWindow.show();
					addTempfieldWindow.setTitle('查看模板字段');
					
					Ext.getCmp("addTempfieldPanel").getForm().loadRecord(record);

					// 获取单元格数据集
//					var data = record.get("xmmc");
//					Ext.MessageBox.alert('提示', "双击行的索引为:" + rowIndex);
				});
				
					
			var addTempfieldPanel = new Ext.form.FormPanel({
				id : 'addTempfieldPanel',
				name : 'addTempfieldPanel',
				autoScroll :true,
				defaultType : 'textfield',
				labelAlign : 'right',
				frame : true,
				width : 400,
				bodyStyle : 'padding:5 5 0',
				items : [{
						xtype : 'hidden',
						name : 'ctfId',
						id : 'ctfId'
						},{
							fieldLabel : '模板',
							name : 'ctfCmtId',
							id : 'ctfCmtId',
							allowBlank : false,
							anchor : '97%'
						},
						{
							fieldLabel : '字段名显示',
							name : 'ctfViewName',
							id : 'ctfViewName',
							allowBlank : false,
							anchor : '97%'
						},
						{
							fieldLabel : '字段名',
							name : 'ctfName',
							id : 'ctfName',
							//regex:/^(13|15|18)+\d{9}$/,
							//regexText:' 手机格式不正确！',
							allowBlank : false,
							anchor : '97%'

						},
						{
							xtype:'combo',
							fieldLabel : '字段类型',
							name : 'ctfType',
							id : 'ctfType',
							store:[["text","文本"],["bigtext","大文本"],["int","数字"],["date","日期"],["img","图片"],["imglist","图片列表"]],
							//regex:/^(13|15|18)+\d{9}$/,
							//regexText:' 手机格式不正确！',
							allowBlank : false,
							editable : false,
							triggerAction : 'all',
							anchor : '97%'

						}, 
						{
							fieldLabel : '长度',
							id : 'ctfLength',
							name : 'ctfLength', 
							//regex:/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
							//regexText: '邮箱格式不正确！',
							valueField : 'name',
							displayField : 'name',
							triggerAction : 'all',
							allowBlank : false,
							emptyText : '请输入数字',
							selectOnFocus : true,

							anchor : '97%'
						}, 
						{
							fieldLabel : '宽度',
							id : 'ctfWidth',
							name : 'ctfWidth',
							emptyText : '请输入数字',
							allowBlank : false,
							anchor : '97%'
						},
						{
							fieldLabel : '高',
							id : 'ctfHeight',
							name : 'ctfHeight',
							emptyText : '请输入数字',
							allowBlank : false,
							anchor : '97%'
						},
						{
							fieldLabel : '排序值',
							id : 'ctfOrderNum',
							name : 'ctfOrderNum',
							valueField : 'name',
							displayField : 'name',
							triggerAction : 'all',
							allowBlank : false,
							emptyText : '请输入数字',
							selectOnFocus : true,
							anchor : '97%'
						},
						{
							xtype:'combo',
							fieldLabel : '所属站点类型',
							id : 'ctfSiteType',
							name : 'ctfSiteType',
							store:[["web","web"],["iphone","iphone"],["ipad","ipad"]],
							allowBlank : false,
							editable : false,
							triggerAction : 'all',
							anchor : '97%'
						},
						{
							xtype:'hidden',
							fieldLabel : '最后修改人',
							id : 'ctfLastuser',
							name : 'ctfLastuser',
							
							//allowBlank : false,
							anchor : '99%'
						}
						,
						{
						    xtype:'hidden',
							fieldLabel : '最后修改时间',
							id : 'ctfLasttime',
							name : 'ctfLasttime',
							
							allowBlank : false,
							anchor : '99%'
						}
						]
			});


	//添加窗体
	var addTempfieldWindow = new Ext.Window({
				layout : 'fit',
				width : 520,
				height : 360,
				//autoScroll :true,
				resizable : false,
				draggable : true,
				closable : true,
				modal : true,
				closeAction : 'hide',
				title : '<span class="commoncss">新增字段定义</span>',
				// iconCls : 'page_addIcon',
				collapsible : true,
				titleCollapse : true,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				pageY : 20,
				//pageX : document.body.clientWidth / 2 - 420 / 2,
				animateTarget : Ext.getBody(),
				constrain : true,
				items : [addTempfieldPanel],
				buttons : [{
					text : '保存',
					handler : function() {

						//Ext.Msg.alert('提示', addLinkagePlanPanel.getForm().findField("eventtypeId").getValue()+"==");
						if(addTempfieldPanel.getForm().isValid()){
							if (addTempfieldPanel.hasOwnProperty("newRecord")) {
								addTempfieldPanel.getForm().updateRecord(addTempfieldPanel.newRecord);
								store_tempfield.add(addTempfieldPanel.newRecord);
								delete addTempfieldPanel.newRecord;
							} else {
								addTempfieldPanel.getForm().updateRecord(grid_tempfield.getSelectionModel().getSelections()[0]);
							}			
								grid_tempfield.getStore().save();
						}else{
							Ext.Msg.alert('提示','您的表单输入有误！');
						}
					}
				}, {
					text : '关闭',
					handler : function() {
						if (addTempfieldPanel.hasOwnProperty("newRecord")){
							
							delete addTempfieldPanel.newRecord;
						}
						addTempfieldWindow.hide();
					}
				}]
			});

	function addTempfieldInit()
	{
		addTempfieldWindow.show();
		addTempfieldWindow.setTitle('新增模板字段');
		addTempfieldPanel.getForm().reset();
		var s = grid_tempfield.getStore();
		addTempfieldPanel.newRecord = new s.recordType();
	}
	
/**
 * 字段定义
 */
query_tempfield=new Ext.Panel({ 
		title:'字段定义',
	    layout:'form',
	    hideBorders:true,
	 	items:new Ext.TabPanel({
	 	hideBorders:true,
	  	activeTab:0,//当前标签为第1个tab（从0开始索引）
	   	items:[grid_tempfield]//TabPanel中的标签页
	   })
   }); 