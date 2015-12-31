<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	Ext.define('mainModel',{
		extend:'Ext.data.Model',
		fields : ['caId','caUserid','caAddtime','caName','caGender','caMobile','caBirthday','caDescription','caWhen','caTiming']
	});
	/**store*/
	var mainModel_store = Ext.create('Ext.data.Store',{
		model : 'mainModel',
		autoLoad:true, // 加载时就读取数据
		pageSize:50, // 每页显示50条记录
		proxy:{
			type:'ajax',
			url:'ask_getList.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'list', // 根节点
				totalProperty:'totalCount' // 总记录数 
			}
		}
	});
	function searchForm(){
		return Ext.create('Ext.form.Panel',{
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
				{xtype:'textfield',labelWidth:40,width:200,fieldLabel:"姓名",name:'caName'},
				{fieldLabel:'添加时间从',labelWidth:70,width:200,name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
				{fieldLabel:'至',labelWidth:20,width:150,name:'endTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
				{xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find',
					handler:function(){
						var formVals = this.up('form').getForm().getValues();
						if(formVals.startTime=='' && (formVals.endTime!='')){
							Ext.Msg.alert('温馨提示：','请选择开始时间');
							return;
						}
						if(formVals.endTime=='' && formVals.startTime!=''){
							Ext.Msg.alert('温馨提示：','请选择结束时间');
							return;
						}
						if(formVals.startTime > formVals.endTime)
						{
							Ext.Msg.alert('温馨提示：','结束时间不能早于开始时间');
							return;
						}
						var jsonObj = Ext.encode(formVals);
						var store = this.up('form').up('panel').child('grid').getStore();
						store.getProxy().extraParams={rows:jsonObj};
						store.load();
					}
				}
			]
		});
	}
	/**信息列表*/
	function mainGrid(){
		return Ext.create('Ext.grid.Panel',{
		    title : "咨询信息管理",
			autoScroll :true,
			columnLines:true,
			region : 'center',
			border:false,
			selModel:{
				selType:'checkboxmodel'
			},
			store:mainModel_store,
			tbar:[
				{text:"导出咨询信息",iconCls: 'icon-down',handler:function(){
						var grid = this.up('grid');
						var datas=grid.getStore().getProxy().extraParams.rows;
						if(datas=="" || undefined==datas || "undefined"==datas){
							datas={};
						}
						var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
						var msgMask = new Ext.LoadMask(Ext.getBody(), {msg : "正在导出,请稍后..."});
						msgMask.show();
						Ext.Ajax.request( {
							type : 'ajax',
							timeout : 60000,
							url : 'ask_askExport.action',
							method : 'POST',
							params : { 
								rows:datas // 以字符形式传到后台
							},
							success : function(response, opts) {
								var retData = Ext.decode(response.responseText);
								if(retData.fileName){
									var downloadIframe = document.createElement('iframe');
									downloadIframe.src ="ask_downloadExcel.action?fileName="+retData.fileName;
									downloadIframe.style.display = "none";
									document.body.appendChild(downloadIframe);
								}
								msgMask.hide();
							},
							failure : function(response, opts) {
								Ext.Msg.alert("<s:text name='util.fail'/>","导出失败！");
								msgMask.hide();
							}
						});
					}
				}
			],
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:mainModel_store},
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
					{text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
					{header:'用户ID',dataIndex:'caUserid',flex:1,hidden:true},
					{header:'姓名',dataIndex:'caName',flex:1},
					{header:'性别',dataIndex:'caGender',flex:1,renderer:function(v){
						if(v=="" || v=="null" || v==null){
							return "";
						}else{
							return v==1?"男":"女";
						}
					}},
					{header:'手机号码',dataIndex:'caMobile',flex:1},
					{header:'出生日期',dataIndex:'caBirthday',flex:1,renderer:function(v){
						return getDateTime(v);
					}},
		         	{header:'描述',dataIndex:'caDescription',flex:1},
		         	{header:'日期选择',dataIndex:'caWhen',flex:1,renderer:function(v){
						if(v=="" || v=="null" || v==null){
							return "";
						}
		         		if(v==1){
		         			return "工作日";
		         		}else {
		         			return "周末";
		         		}
		         	}},
		         	{header:'时间选择',dataIndex:'caTiming',flex:1},
					{header:'创建日期',dataIndex:'caAddtime',flex:1,renderer:function(v){
						return getDateTime(v);
					}}
			    ]
			}
		});
	}

	return Ext.create('Ext.panel.Panel',{
    	layout:'border',
		closable:true,
	   	items:[searchForm(),mainGrid()]
	});
})();
