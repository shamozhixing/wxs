<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	
	Ext.define('dealerModel',{
		extend:'Ext.data.Model',
		idProperty:'aid',
		fields:[/** 经销商ID */
			{name:'aid'},{name:'city'},{name:'province'},{name:'dealername'},{name:'dealerenname'},
			{name:'areanum'},{name:'phone'},{name:'fax'},{name:'address'},{name:'availabilityflag'},{name:'enaddress'},{name:'postalcode'},
			{name:'url'},{name:'islimit'},{name:'model'},{name:'bid'},{name:'addtime'},{name:'lastmodify'},{name:'lasttime'},{name:'ordernum'},
			{name:'standby1'},{name:'standby2'},{name:'servicephone'},{name:'isr8'},{name:'issecond'},{name:'dealerLongitude'},{name:'dealerDimension'},
	   		{name:'contact'},{name:'contactPhone'},{name:'contactTel'},{name:'contactEmail'},{name:'isRescue'},{name:'rescuePhone'},
			{name:'rescueTel'},{name:'contactEn'},{name:'version'},{name:'dspcode'},{name:'businessTime'},{name:'businessTime1'}
	   	]
	});
	Ext.define('cmsDictionaryModel',{
	   extend:'Ext.data.Model',
	   idProperty:'cid',
	   fields:[{name:'cid'},
	   		   {name:'upid'},
	   		   {name:'cnname'},
	   		   {name:'enname'},
	   		   {name:'remark'},
	   		   {name:'availabilityflag'}, 			
	   		   {name:'ordernum'}, 		
	   		   {name:'standby1'},
	   		   {name:'standby2'}
			   ]
	});
	 //省
	var provinceData=[<s:iterator value="provinceAll" status="status"><s:if test="#status.first">{value:"<s:property value='cid'/>",text:"<s:property value='cnname'/>"}</s:if><s:else>,{value:"<s:property value='cid'/>",text:"<s:property value='cnname'/>"}</s:else></s:iterator>];
	var provinceStore=Ext.create('Ext.data.Store',{
		autoLoad: true,
	    model: 'commonModel',
	    data : provinceData,
	    proxy: {
	        type: 'memory'
	    }
    });
var cityStore=Ext.create('Ext.data.Store',{
   model:'cmsDictionaryModel',
   autoLoad:false,// 加载时就读取数据
   proxy:{
		type:'ajax',
		url:'dealer_getCityByPid.action',    //请求后台信息
		method:'POST',
		reader:{
			type:'json',
			root:'list', // 跟节点
			totalProperty:'totalCount' // 总记录数
		   }
		}
	});
	var dealerStore=Ext.create('Ext.data.Store',{
	   model:'dealerModel',
	   pageSize:50, // 每页显示50条记录
	   autoLoad:true,// 加载时就读取数据
	   proxy:{
			type:'ajax',
			url:'dealer_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'totalCount' // 总记录数
			}
		}
	});	
	
	var provinceComboStore=Ext.create('Ext.data.Store',{
		autoLoad: false,
	    model: 'commonModel',
	    data : [{value:0,text:'--请选择--'}<s:iterator value="provinceAll" status="status">,{value:"<s:property value='cid'/>",text:"<s:property value='cnname'/>"}</s:iterator>],
	    proxy: {
	        type: 'memory'
	    }
    });
	
	function queryForm(){
    	return Ext.create('Ext.form.Panel', {
			region:'north',
			height:80,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:4,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{	labelAlign:'right',
				labelWidth:70,width:210,xtype:'textfield'},
			items:[
				{
					xtype:"combo",
					store:provinceComboStore,
					displayField:'text',
					valueField:'value',
					value:0,
					editable:false,
					fieldLabel : "经销商省",
					name : 'province',
					 listeners:{
							   select:function(combo,records, eOpts ){
								var pid=combo.getValue();
								cityStore.getProxy().extraParams={"provinceId":pid};
								cityStore.load();
								}
					 
					 }
				},{fieldLabel:'经销商市',
						 name:'city',
						 xtype:'combo',
						 editable:false,
						 store : cityStore,
						 valueField:'cid',
						 displayField:'cnname',
						 listConfig: {
				   					 loadMask:false
							}
					},
				{labelWidth : 65,fieldLabel:'经销商名',name:'dealername',flex:1},
				{fieldLabel:'经销商类别',
						labelWidth:70,
						 name:'type',
						 xtype:'combo',
						 editable:false,
						 value:0,
						 store : [[0,'--请选择--'],[1,'提供二手车服务'],[2,'提供24小时救援']]
					},
				{fieldLabel:'添加时间从',labelWidth:70,width:210,name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
				{fieldLabel:'至',labelWidth:70,width:210,name:'endTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
				{xtype:'button',xtype: 'button',width:60,margin:'0 0 5 10',text : '查询',iconCls : 'icon-find',
					handler : function() {
						var form = this.up('form').getForm();
						var store = this.up('form').up('panel').child('grid').getStore();
						var vals=form.getValues();
						if(vals.province==0){
							vals.city="";
							vals.province="";
						}
						if(!vals.city){
							vals.city="";
						}
						if(vals.startTime=='' && (vals.endTime!='')){
							Ext.Msg.alert('温馨提示：','请选择开始时间');
							return;
						}
						if(vals.endTime=='' && vals.startTime!=''){
							Ext.Msg.alert('温馨提示：','请选择结束时间');
							return;
						}
						if(vals.startTime > vals.endTime)
						{
							Ext.Msg.alert('温馨提示：','结束时间不能早于开始时间');
							return;
						}
						var jsonObj=Ext.encode(vals);
						store.getProxy().extraParams = {rows:jsonObj};
						store.load();
					}
				}
			]
		});
    }
	function userCarGrid(){
		return Ext.create('Ext.grid.Panel',{
			region:'center', // 主panel用了border布局，必须有center
			title:'经销商列表',
			autoScroll:true, // 按需滚动
			columnLines:true, // 显示竖线
			store:dealerStore, // 数据源
			border:false, // 去掉边框
			selModel:{selType:'checkboxmodel'}, //多选框
			multiSelect : false,
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:dealerStore}, // 分页信息,store与grid的store一样
			columns:{
			  defaults:{align:'left'},
			  items:[
			  	{text:'序号',xtype:'rownumberer',width:30,align:'center'}
			  	,{header:'编号',dataIndex:'aid',hidden:false,flex:1}
			  	,{header:'经销商名称',dataIndex:'dealername',flex:2}
				,{header:'省份',dataIndex:'province',flex:1,renderer:function(v,m,r){
						if(isEmpty(v)){
							return "";
						}
						return getDictPovince(v);
					}}
			  	,{header:'城市',dataIndex:'city',flex:1,renderer:function(v,m,r){
					if(isEmpty(r)){
						return "";
					}
					return getDictCity(r.get('province'),v);
				}}
			  	,{header:'24小时救援',dataIndex:'isRescue',flex:1,renderer:function(v){	
					if(v=="" || v=="null" || v==null){
							return "";
					}
			   		if(v==1){
			   			return "是";
			   		}else{
			   			return "否";}
			   }}
			  	,{header:'二手车服务',dataIndex:'issecond',flex:1,renderer:function(v){
					if(v=="" || v=="null" || v==null){
							return "";
						}
			   		if(v==1){
			   			return "是";
			   		}else{
			   			return "否";}
			   }},{header:'添加时间',dataIndex:'addtime',flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}},{header:'排序值',dataIndex:'ordernum',flex:1}
			  ]
			},
			listeners:{
				//双击单条记录的事件
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					//mkWindow("用户信息",editClubuUser(record,view))
				}
			},
			tbar:[
			<s:if test="isAdd()">
				{text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					mkWindow("新增",[addForm(this.up('grid'))]);
				}
			},'-',</s:if> <s:if test="isMod()"> 
				{text:'修改',iconCls:'icon-edit',
				handler : function() {
						var recs = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
						if(recs.length < 1){
							Ext.Msg.alert('提示','您最少要选择一条记录');
						} else if(recs.length > 1){
							Ext.Msg.alert('提示','不能同时修改多条记录');
						} else {
							mkWindow("修改信息",[updateForm(recs[0],this.up('grid'))]);
						}
					}
			},'-',</s:if><s:if test="isDel()"> {text : '删除',
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
								var msgMask = new Ext.LoadMask(Ext.getBody(), {msg : "正在提交数据..."});
								msgMask.show();
								Ext.Ajax.request( {
									type: 'ajax',
							        url : 'dealer_del.action',
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
										 msgMask.hide();
									},
									failure : function(response, opts) {
										Ext.Msg.alert('失败','操作失败!');
										 msgMask.hide();
									}
								})
							}
						});
					} else {
						Ext.Msg.alert('提示','请至少选择一行进行操作');
					}
				}
			},'-',</s:if><s:if test="isMod()"> 
				{text:'生成经销商js',iconCls:'icon-down',
				handler : function() {
						Ext.MessageBox.confirm("提示","你确定要生成经销商js吗,非开发人员请勿使用此功能?",function(btn){
							if(btn=="yes"){
								var msgMask = new Ext.LoadMask(Ext.getBody(), {msg : "正在生成,请稍后..."});
								msgMask.show();
								Ext.Ajax.request( {
									type : 'ajax',
									timeout : 60000,
									url : 'dealer_downJs.action',
									method : 'POST',
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
					});
				}
			},'-',</s:if>{text:"<s:text name='util.gridRefresh'/>",iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					
				}}
			]
		});
	}
	
	/*新增*/
	function  addForm(grid){
		var addDealerForm= Ext.create('Ext.form.Panel', {
			region:'center',
			bodyStyle : {background : 'transparent'},
			border : false,
			layout : {type : 'table',columns :2,tableAttrs : {style : {margin : '10 0 0 0'}},tdAttrs : {style : {width : '150px'}}},
			defaults : {labelAlign : 'right',labelWidth : 100,width : 340,xtype : 'textfield'},
			items : [
					{fieldLabel:'省份',
						 name:'province',
						 xtype:'combo',
						 emptyText:'请选择省',  
 						 blankText : '请选择省',
						 editable:false,
						 store : provinceStore,
						 valueField:'value',
						 displayField:'text',
						 allowBlank : false,
						 listeners:{
							       select:function(combo,records, eOpts ){
							       	var pid=combo.getValue();
							       	cityStore.getProxy().extraParams={"provinceId":pid};
							       	cityStore.load();
				       				}
						 
						 }
					},
					{fieldLabel:'城市',
						 name:'city',
						 xtype:'combo',
						 emptyText:'请选择市',  
 						 blankText : '请选择市',
						 editable:false,
						 store : cityStore,
						 valueField:'cid',
						 displayField:'cnname',
						 allowBlank : false,
						 listConfig: {
				   					 loadMask:false
							}
					},
			         {fieldLabel : '经销商名称',xtype : 'textfield',allowBlank : false,name : 'dealername'},
					 {fieldLabel : '经销商地址',xtype : 'textfield',name : 'address'},
					  {fieldLabel : '英文名称',xtype : 'textfield',name : 'dealerenname'},
					 {fieldLabel : '英文地址',xtype : 'textfield',name : 'enaddress'},
					 {fieldLabel : '服务电话',name : 'servicephone'},
					 {fieldLabel : '邮编',xtype : 'numberfield',name : 'postalcode'},
			         {fieldLabel : '经度',name : 'dealerLongitude',allowBlank : false},
			         {fieldLabel : '纬度',name : 'dealerDimension',allowBlank : false},
			         {fieldLabel : '经销商网址',xtype : 'textfield',name : 'url'},
			         {fieldLabel : '区号',xtype : 'numberfield',name : 'areanum'},
			         {fieldLabel : '销售电话',name : 'phone'},
					  {fieldLabel : '传真',name : 'fax'},
			         {fieldLabel : '销售车型',xtype : 'checkboxgroup',name : 'model',colspan : 2,width:680,
			         align:'center',
					 layout : {type : 'table',columns :5,tableAttrs : {style : {margin : '10 0 0 0'}},tdAttrs : {style : {width : '150px'}}},
			         items:[
					 <s:iterator value="modellist" status="status"><s:if test="#status.first">{boxLabel:'<s:property value="value" />',inputValue:<s:property value="key" />}</s:if><s:else>,{boxLabel:'<s:property value="value" />',inputValue:<s:property value="key" />}</s:else></s:iterator>
							]},
			        {
						xtype:'radiogroup',
						width:240,
						colspan:2,
						fieldLabel:'二手车服务',
						name:'issecond',  //后台返回的JSON格式，直接赋值；
						items:[
						{boxLabel:'否',name:'issecond',inputValue:0,checked:true},
						{boxLabel:'是',name:'issecond',inputValue:1}
						]},
					 {fieldLabel : '二手车服务人姓名',xtype : 'textfield',name : 'contact'},
					 {fieldLabel : '二手车服务电话',xtype : 'numberfield',name : 'contactTel'},
					 {fieldLabel : '二手车服务手机',xtype : 'numberfield',name : 'contactPhone'},
					 {fieldLabel : '二手车服务邮箱',xtype : 'textfield',name : 'contactEmail'},
					{
						xtype:'radiogroup',
						fieldLabel:'24小时救援',
						colspan:2,
						width:240,
						name:'isRescue',  //后台返回的JSON格式，直接赋值；
						items:[
						{boxLabel:'否',name:'isRescue',inputValue:0,checked:true},
						{boxLabel:'是',name:'isRescue',inputValue:1}
						]},
						{fieldLabel : '24小时救援手机',xtype : 'textfield',name : 'rescuePhone'},
						{fieldLabel : '24小时救援电话',xtype : 'textfield',name : 'rescueTel'},
					{
						xtype:'radiogroup',
						fieldLabel:'R8经销商',
						width:240,
						name:'isr8',
						items:[
						{boxLabel:'否',name:'isr8',inputValue:0,checked:true},
						{boxLabel:'是',name:'isr8',inputValue:1}
						]},
					{
						xtype:'radiogroup',
						fieldLabel:'单向服务',
						width:240,
						name:'islimit',  //后台返回的JSON格式，直接赋值；
						items:[
						{boxLabel:'单向',name:'islimit',inputValue:0,checked:true},
						{boxLabel:'双向',name:'islimit',inputValue:1}
						]},
					 {fieldLabel : '服务时间',xtype : 'textfield',name:'businessTime'},
					{fieldLabel : '序号',xtype : 'numberfield',name :'ordernum',minValue:0},
					 {
						xtype:'radiogroup',
						fieldLabel:'经销商是否有效',
						width:240,
						colspan:2,
						name:'availabilityflag',
						items:[
						{boxLabel:'否',name:'availabilityflag',inputValue:0,checked:true},
						{boxLabel:'是',name:'availabilityflag',inputValue:1}
						]}
				]
				
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:710,
			height:600,
			items:[addDealerForm], // 将表单面板加入该panel中
			fbar:[{
				text:"提交",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//获取选中的复选框
					var checkboxValues=form.findField('model').getChecked();
					//获取复选框中的值
					var crpPrivValue='';
					Ext.Array.each(checkboxValues,function(item){
						if(crpPrivValue.length!=0){
						crpPrivValue+=','+item.getSubmitValue();
						}else
						{
							crpPrivValue+=item.getSubmitValue();
						}
					});
					var submitValues=form.getValues();
					submitValues.model=crpPrivValue;
					 form.submit({
						url : 'dealer_saveOrUpdate.action',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(submitValues)
						},
						method : 'POST',
						success : function(form, action) {
							Ext.Msg.alert('提示', action.result.msg);
							if(action.result.isSuc==true){
								grid.getStore().load();
								win.close();
							}
						},
						failure : function(form, action) {
							Ext.Msg.alert('失败', action.result.msg);
							win.close();
						}
					});
				}
			},{text:"取消",handler:function(){this.up('window').close();}}]
		});
	}
	
	/*新增*/
	function  updateForm(data,grid){
	 	cityStore.getProxy().extraParams={"provinceId":data.get('province')};
		cityStore.load(function(){
			dealerForm.getForm().findField('city').setValue(data.get('city'));
		});
		var dealerForm= Ext.create('Ext.form.Panel', {
			region:'center',
			bodyStyle : {background : 'transparent'},
			border : false,
			layout : {type : 'table',columns :2,tableAttrs : {style : {margin : '10 0 0 0'}},tdAttrs : {style : {width : '150px'}}},
			defaults : {labelAlign : 'right',labelWidth : 100,width : 340,xtype : 'textfield'},
			items : [
					{fieldLabel:'省份',
						 name:'province',
						 xtype:'combo',
						 emptyText:'请选择省',  
 						 blankText : '请选择省',
						 editable:false,
						 store : provinceStore,
						 valueField:'value',
						 value:data.get('province'),
						 displayField:'text',
						 allowBlank : false,
						 listeners:{
							       select:function(combo,records, eOpts ){
							       	var pid=combo.getValue();
							       	cityStore.getProxy().extraParams={"provinceId":pid};
							       	cityStore.load();
				       				}
						 
						 }
					},
					{fieldLabel:'城市',
						 name:'city',
						 xtype:'combo',
						 emptyText:'请选择市',  
 						 blankText : '请选择市',
						 editable:false,
						 store : cityStore,
						 valueField:'cid',
						 displayField:'cnname',
						 allowBlank : false,
						 listConfig: {
				   					 loadMask:false
							}
					},
			         {fieldLabel : '经销商名称',xtype : 'textfield',allowBlank : false,name : 'dealername',value:data.get('dealername')},
					 {fieldLabel : '经销商地址',xtype : 'textfield',name : 'address',value:data.get('address')},
					  {fieldLabel : '英文名称',xtype : 'textfield',name : 'dealerenname',value:data.get('dealerenname')},
					 {fieldLabel : '英文地址',xtype : 'textfield',name : 'enaddress',value:data.get('enaddress')},
					 {fieldLabel : '服务电话',name : 'servicephone',value:data.get('servicephone')},
					 {fieldLabel : '邮编',xtype : 'numberfield',name : 'postalcode',value:data.get('postalcode')},
			         {fieldLabel : '经度',name : 'dealerLongitude',value:data.get('dealerLongitude'),allowBlank : false},
			         {fieldLabel : '纬度',name : 'dealerDimension',value:data.get('dealerDimension'),allowBlank : false},
			         {fieldLabel : '经销商网址',xtype : 'textfield',name : 'url',value:data.get('url')},
			         {fieldLabel : '区号',xtype : 'numberfield',name : 'areanum',value:data.get('areanum')},
			         {fieldLabel : '销售电话',name : 'phone',value:data.get('phone')},
					  {fieldLabel : '传真',name : 'fax',value:data.get('fax')},
			         {fieldLabel : '销售车型',xtype : 'checkboxgroup',name : 'model',colspan : 2,width:680,
						 align:'center',
						 layout : {type : 'table',columns :5,tableAttrs : {style : {margin : '10 0 0 0'}},tdAttrs : {style : {width : '150px'}}},
						 items:[
						 <s:iterator value="modellist" status="status"><s:if test="#status.first">{boxLabel:'<s:property value="value" />',inputValue:<s:property value="key" />,id:'m<s:property value="key" />'}</s:if><s:else>,{boxLabel:'<s:property value="value" />',inputValue:<s:property value="key" />,id:'m<s:property value="key" />'}</s:else></s:iterator>
						],listeners:{afterrender:function(c,eOpts){
								var objArr=data.get('model').split('，');
								for(var i=0;i<objArr.length;i++){
									var obj=Ext.getCmp("m"+objArr[i]);
									if(obj){
										obj.setValue(true);
									}
								}
								
							}}
							
					},
			        {
						xtype:'radiogroup',
						width:240,
						colspan:2,
						fieldLabel:'二手车服务',
						name:'issecond',  //后台返回的JSON格式，直接赋值；
						items:[
						{boxLabel:'否',name:'issecond',inputValue:0,checked:(data.get('issecond')==0)},
						{boxLabel:'是',name:'issecond',inputValue:1,checked:(data.get('issecond')==1)}
						]},
					 {fieldLabel : '二手车服务人姓名',xtype : 'textfield',name : 'contact',value:data.get('contact')},
					 {fieldLabel : '二手车服务电话',xtype : 'numberfield',name : 'contactTel',value:data.get('contactTel')},
					 {fieldLabel : '二手车服务手机',xtype : 'numberfield',name : 'contactPhone',value:data.get('contactPhone')},
					 {fieldLabel : '二手车服务邮箱',xtype : 'textfield',name : 'contactEmail',value:data.get('contactEmail')},
					{
						xtype:'radiogroup',
						fieldLabel:'24小时救援',
						colspan:2,
						width:240,
						name:'isRescue',  //后台返回的JSON格式，直接赋值；
						items:[
						{boxLabel:'否',name:'isRescue',inputValue:0,checked:(data.get('isRescue')==0)},
						{boxLabel:'是',name:'isRescue',inputValue:1,checked:(data.get('isRescue')==1)}
						]},
						{fieldLabel : '24小时救援手机',xtype : 'textfield',name : 'rescuePhone',value:data.get('rescuePhone')},
						{fieldLabel : '24小时救援电话',xtype : 'textfield',name : 'rescueTel',value:data.get('rescueTel')},
					{
						xtype:'radiogroup',
						fieldLabel:'R8经销商',
						width:240,
						name:'isr8',
						items:[
						{boxLabel:'否',name:'isr8',inputValue:0,checked:(data.get('isr8')==0)},
						{boxLabel:'是',name:'isr8',inputValue:1,checked:(data.get('isr8')==1)}
						]},
					{
						xtype:'radiogroup',
						fieldLabel:'单向服务',
						width:240,
						name:'islimit',  //后台返回的JSON格式，直接赋值；
						items:[
						{boxLabel:'单向',name:'islimit',inputValue:0,checked:(data.get('islimit')==0)},
						{boxLabel:'双向',name:'islimit',inputValue:1,checked:(data.get('islimit')==1)}
						]},
					 {fieldLabel : '服务时间',xtype : 'textfield',name:'businessTime',value:data.get('businessTime')},
					{fieldLabel : '序号',xtype : 'numberfield',name :'ordernum',minValue:0,value:data.get('ordernum')},
					 {
						xtype:'radiogroup',
						fieldLabel:'经销商是否有效',
						width:240,
						colspan:2,
						name:'availabilityflag',
						items:[
						{boxLabel:'否',name:'availabilityflag',inputValue:0,checked:(data.get('availabilityflag')==0)},
						{boxLabel:'是',name:'availabilityflag',inputValue:1,checked:(data.get('availabilityflag')==1)}
						]},
						{fieldLabel : '',name:'aid',hidden:true,value:data.get('aid')}
				]
				
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:710,
			height:600,
			items:[dealerForm], // 将表单面板加入该panel中
			fbar:[{
				text:"提交",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//获取选中的复选框
					var checkboxValues=form.findField('model').getChecked();
					//获取复选框中的值
					var crpPrivValue='';
					Ext.Array.each(checkboxValues,function(item){
						if(crpPrivValue.length!=0){
						crpPrivValue+=','+item.getSubmitValue();
						}else
						{
							crpPrivValue+=item.getSubmitValue();
						}
					});
					var submitValues=form.getValues();
					submitValues.model=crpPrivValue;
					 form.submit({
						url : 'dealer_saveOrUpdate.action',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(submitValues)
						},
						method : 'POST',
						success : function(form, action) {
							Ext.Msg.alert('提示', action.result.msg);
							if(action.result.isSuc==true){
								grid.getStore().load();
								win.close();
							}
						},
						failure : function(form, action) {
							Ext.Msg.alert('失败', action.result.msg);
							win.close();
						}
					});
				}
			},{text:"取消",handler:function(){this.up('window').close();}}]
		});
	}
	
	
	
	
	return Ext.create('Ext.panel.Panel',{
	  title:'经销商信息列表',
	  layout:'border',
	  closable : true,
	  items:[queryForm(),userCarGrid()]
	});
})();