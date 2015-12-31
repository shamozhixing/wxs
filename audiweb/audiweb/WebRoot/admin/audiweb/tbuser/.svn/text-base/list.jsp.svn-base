<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	Ext.define('mainModel',{
		extend:'Ext.data.Model',
		fields : ['userid','email','username','gender','province','city','address','postcode',
		'birthdayy','birthdaym','birthdayd','areanum','phone','ext','brand','brandother','model','modelother'
		,'buytime','footnum','carnum','isincept','iscn','standby1','standby2','buytimeyear','buytimemonth','source'
		,'a3flag','lastlogintime','blog','mb','renren','emailvalid','idcard','regSource','viewusername','userPhoto',
		'mobile','iscar','availabilityflag','regtime','emailsubtime']
	});
	/**store*/
	var mainModel_store = Ext.create('Ext.data.Store',{
		model : 'mainModel',
		autoLoad:true, // 加载时就读取数据
		pageSize:50, // 每页显示50条记录
		proxy:{
			type:'ajax',
			url:'member_query.action',//请求后台西信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	var statusData=[{value:"",text:"全部"},{value:1,text:"有效"},{value:0,text:"无效"}];
	var statusStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'commonModel',
	    data : statusData,
	    proxy: {
	        type: 'memory'
	    }
    });
	function searchForm(){
		return Ext.create('Ext.form.Panel',{
			region:'north',
			height:40,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:6,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:70,width:210
			},
			items:[
				{xtype:'textfield',fieldLabel:"用户名",name:'username'},
				{xtype:'textfield',fieldLabel:"用户邮箱",name:'email'},
				{
					xtype:"combo",
					store:statusStore,
					displayField:'text',
					valueField:'value',
					editable:false,
					fieldLabel : "状态",
					name : 'availabilityflag',
					value:""
				},
				{fieldLabel:'注册时间从',labelWidth:70,width:200,name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
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
		   title : "用户信息",
			autoScroll :true,
			columnLines:true,
			region : 'center',
			border:false,
			selModel:{
				selType:'checkboxmodel'
			},
			store:mainModel_store,
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:mainModel_store},
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
					{text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
					{header : '用户邮箱',	dataIndex : 'email',flex:1.5},
					{header : '用户名',	dataIndex : 'username',flex:1},
					{header : '性别',	dataIndex : 'gender',flex:1,renderer:function(v){
						if(v=="null" || v==null){
							return	"";
						}else{
							return v==1?"男":"女";
						}
		         	}},
					{header : '省份',	dataIndex : 'province',flex:1,renderer:function(v){return getDictPovince(v);}},
					{header : '手机',	dataIndex : 'mobile',flex:1},
					{header : '是否有车',	dataIndex : 'iscar',flex:1,renderer:function(v){
						if(v=="null" || v==null){
							return	"";
						}else{
							return v==1?"有":"无";
						}
		         	}},
					{header : '状态',	dataIndex : 'availabilityflag',flex:1,renderer:function(v){
						if(v=="null" || v==null){
							return	"无效";
						}else{
							return (v==1?"有":"无")+"效";
						}
		         	}},
					{header : '注册时间',	dataIndex : 'regtime',flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}}
			    ]
			},listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("<s:text name='util.edit'/>",[viewWin(record,view)]); // 弹出修改框
			}},
			tbar : [
			{
				text : "<s:text name='util.query'/>",
				iconCls : 'icon-find',
				handler : function() {
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length !=1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要查看的记录!");
					} else {
						mkWindow("<s:text name='util.query'/>",[viewWin(secData[0],this.up('grid'))]); // 弹出修改框
					}
				}
			}, '-',
			{
				text : "有效",
				iconCls : 'icon-add',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection();
					if(secData.length != 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要修改的一行");
					} else {
						var data=secData[0];
						if(data.get("availabilityflag")=="1"){
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","您好,目前用户状态已经为有效状态!");
							return;
						}
						waitLoadMask.show();
						Ext.Ajax.request( {
								type: 'ajax',
								url : 'member_update.action',
								method : 'POST',
								params : { 
									rows:Ext.encode({"userid":data.get("userid"),"availabilityflag":1})
								},
								success : function(response, opts) {
									 var retData = Ext.decode(response.responseText);
									 var valid= retData.error
									 if(!valid){
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
									 } else {
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
										 grid.getStore().load(); // 重新加载数据
									 }
									 waitLoadMask.hide();
								},
								failure : function(form, action) {
									Ext.Msg.alert("<s:text name='util.fail'/>"/*失败*/,"<s:text name='util.hanldFail'/>"/*操作失败!*/);
								}
							});
					}
				}
			}, '-',{
				text : "无效",
				iconCls : 'icon-delete',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection();
					if(secData.length != 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要修改的一行");
					} else {
					var data=secData[0];
					if(data.get("availabilityflag")=="0"){
							Ext.Msg.alert("<s:text name='util.promptTitle'/>","您好,目前用户状态已经为有效状态!");
							return;
						}
						waitLoadMask.show();
						Ext.Ajax.request( {
								type: 'ajax',
								url : 'member_update.action',
								method : 'POST',
								params : { 
									rows:Ext.encode({"userid":data.get("userid"),"availabilityflag":0})
								},
								success : function(response, opts) {
									 var retData = Ext.decode(response.responseText);
									 var valid= retData.error
									 if(!valid){
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
									 } else {
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
										 grid.getStore().load(); // 重新加载数据
									 }
									 waitLoadMask.hide();
								},
								failure : function(form, action) {
									Ext.Msg.alert("<s:text name='util.fail'/>","<s:text name='util.hanldFail'/>");
								}
							});
					}
				}
			},'-',{text:"导出用户数据",iconCls: 'icon-down',handler:function(){
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
							url : 'member_export.action',
							method : 'POST',
							params : { 
								rows:datas // 已字符形式传到后台
							},
							success : function(response, opts) {
								var retData = Ext.decode(response.responseText);
								if(retData.fileName){
									var downloadIframe = document.createElement('iframe');
									downloadIframe.src ="member_downloadExcel.action?fileName="+retData.fileName;
									downloadIframe.style.display = "none";
									document.body.appendChild(downloadIframe);
								}
								msgMask.hide();
							},
							failure : function(response, opts) {
								Ext.Msg.alert("<s:text name='util.fail'/>","");
								msgMask.hide();
							}
						});
					}
				},'-',{
			   text:"<s:text name='util.gridRefresh'/>",iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
				 }
			}]
		});
	}
	
  
	function  viewWin(data,grid){
		var dateReg=repEmp(data.get('birthdayy'))+"-"+repEmp(data.get('birthdaym'))+"-"+repEmp(data.get('birthdayd'));
		
		var editProductForm = Ext.create('Ext.form.Panel',{
			border:false,
			region:'center',
			bodyStyle:{background:'transparent'},
			layout:{ type:'table',columns:2 ,tableAttrs: {style: {align:'center',margin:'10 0 10 0'}},tdAttrs:{align:'left'}},
			style:'padding-bottom:10px',
			defaults:{
			xtype:'textfield',labelWidth:100,labelAlign:'right',width:300,readOnly:true,fieldCls:'text-readonly',editable:false},
			items : [
				{fieldLabel : "编号",name : 'userid',value:data.get('userid')},
				{fieldLabel : "姓名",name : 'username',value:data.get('username'),allowBlank : true},
				{fieldLabel : "性别",name : 'gender',value:data.get('gender')=="1"?"男":"女",allowBlank : true},
				{fieldLabel : "电子邮件",name : 'email',value:data.get('email'),allowBlank : true},
				{fieldLabel : "是否愿意接收资料",name : 'dpiDetail',value:data.get('dpiDetail')},
				{fieldLabel : "所在省市",name : 'province',	value:getDictPovince(data.get('province'))+"-"+getDictCity(data.get('province'),data.get('city'))},	
				{fieldLabel : "邮寄地址",name : 'address',value:data.get('address')},
				{fieldLabel : "邮编",name : 'postcode',value:data.get('postcode')},
				{fieldLabel : "出生日期",name : 'birthdayy',value:dateReg},
				{fieldLabel : "电话",name : 'areanum',value:repEmp(data.get('areanum'))+"-"+repEmp(data.get('phone'))+"-"+repEmp(data.get('ext'))},
				{fieldLabel : "手机号码",name : 'mobile',value:data.get('mobile')},
				{fieldLabel : "注册时间",name : 'regtime',value:getDateTime(data.get('regtime'))},
				{fieldLabel : "是否有车",name : 'iscar',value:data.get('iscar')=="1"?"有":"无"},
				{fieldLabel : "是否有效",name : 'availabilityflag',value:data.get('availabilityflag')=="1"?"有效":"无效"},
				{fieldLabel : "是否车主",name : 'auditingcar',value:data.get('auditingcar')=="1"?"是":"否"}
				]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			width:640,
			border:false,
			height:300,
			items:[editProductForm], // 将表单面板加入该panel中
			fbar:[{text:"<s:text name='util.cancel'/>",handler:function(){this.up('window').close();}}]
		});
	}
	
	function repEmp(v){
		if(v==null || v==''){
			return "";
		}
		return v;
	}
	return Ext.create('Ext.panel.Panel',{
    	layout:'border',
		closable:true,
	   	items:[searchForm(),mainGrid()]
	});
})();
