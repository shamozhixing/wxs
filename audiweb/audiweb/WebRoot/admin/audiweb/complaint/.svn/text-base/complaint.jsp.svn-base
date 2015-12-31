<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	Ext.define('mainModel',{
		extend:'Ext.data.Model',
		fields : ['ccId','ccType','ccUserid','ccAddtime','ccKilometer','ccProvince','ccCity','ccDealer','ccModel','ccFootnum','ccCarnum','ccBuyyear','ccBuymonth','ccName','ccGender','ccMobile','ccBirthday','ccDescription','ccCode','ccWhen','ccTiming']
	});
	/**store*/
	var mainModel_store = Ext.create('Ext.data.Store',{
		model : 'mainModel',
		autoLoad:true, // 加载时就读取数据
		pageSize:50, // 每页显示50条记录
		proxy:{
			type:'ajax',
			url:'complaint_getList.action',//请求后台信息
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
				{xtype:'textfield',labelWidth:40,width:200,fieldLabel:"姓名",name:'ccName'},
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
						console.log(jsonObj);
						var store = this.up('form').up('panel').child('grid').getStore();
						store.getProxy().extraParams={rows:jsonObj};
						store.load();
					}
				}
			]
		});
	}
	/**投诉信息列表*/
	function mainGrid(){
		return Ext.create('Ext.grid.Panel',{
		    title : "投诉信息管理",
			autoScroll :true,
			columnLines:true,
			region : 'center',
			border:false,
			selModel:{
				selType:'checkboxmodel'
			},
			store:mainModel_store,
			tbar:[
				{text:"导出投诉信息",iconCls: 'icon-down',handler:function(){
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
							url : 'complaint_complaintExport.action',
							method : 'POST',
							params : { 
								rows:datas // 以字符形式传到后台
							},
							success : function(response, opts) {
								var retData = Ext.decode(response.responseText);
								if(retData.fileName){
									var downloadIframe = document.createElement('iframe');
									downloadIframe.src ="complaint_downloadExcel.action?fileName="+retData.fileName;
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
					{header:'投诉类型',dataIndex:'ccType',flex:1,renderer:function(v){
						if(v==1){
							return "售前";
						}else if(v==2){
							return "售后";
						}else {
							return "二手车";
						}
					}},
					{header:'姓名',dataIndex:'ccName',flex:1},
					{header:'手机号码',dataIndex:'ccMobile',flex:1},
					{header:'创建日期',dataIndex:'ccAddtime',flex:1,renderer:function(v){
						return getDateTime(v);
					}},
					{header:'描述',dataIndex:'ccDescription',flex:1},
					{header:'编码',dataIndex:'ccCode',flex:1},
					{header:'日期选择',dataIndex:'ccWhen',flex:1,renderer:function(v){
						if(v=="" || v=="null" || v==null){
							return "";
						}
						if(v==1){
							return "工作日";
						}else {
							return "周末";
						}
					}},
					{header:'时间选择',dataIndex:'ccTiming',flex:1}/**,
					{header:'用户ID',dataIndex:'ccUserid',flex:1},
					
					{header:'行驶里程',dataIndex:'ccKilometer',flex:1},
					{header:'省',dataIndex:'ccProvince',flex:1,renderer:function(v,m,r){
						if(isEmpty(v)){
							return "";
						}
						return getDictPovince(v);
					}},
					{header:'市',dataIndex:'ccCity',flex:1,renderer:function(v,m,r){
						if(isEmpty(r)){
							return "";
						}
						return getDictCity(r.get('ccProvince'),v);
					}},
					{header:'经销商',dataIndex:'ccDealer',flex:1,renderer:function(v,m,r){
						if(isEmpty(r)){
							return "";
						}
						return getDictDealer(r.get('ccCity'),v);
					}},
					{header:'车辆型号',dataIndex:'ccModel',flex:1,renderer:function(v,m,r){
						return getDictModelByMid(v);
					}},
					{header:'车架号',dataIndex:'ccFootnum',flex:1},
					{header:'车牌号',dataIndex:'ccCarnum',flex:1},
					{header:'购车年份',dataIndex:'ccBuyyear',flex:1},
					{header:'购车月份',dataIndex:'ccBuymonth',flex:1},
					{header:'性别',dataIndex:'ccGender',flex:1,renderer:function(v){
						if(v=="null" || v==null){
							return "";
						}else {
							return v==1?"男":"女";
						}
					}},
					
					{header:'出生日期',dataIndex:'ccBirthday',flex:1,renderer:function(v){
						return getDateTime(v);
					}}*/
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
