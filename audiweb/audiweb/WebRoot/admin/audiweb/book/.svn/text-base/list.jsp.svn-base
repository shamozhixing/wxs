<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	Ext.define('mainModel',{
		extend:'Ext.data.Model',
		fields : ['cpId','cpIntentcars','cpBookname','cpImg','cpType','cpPagename','cpIspub','cpAddtime',
		'cpPdf','cpIntentname','cpOrder']
	});
	/**store*/
	var mainModel_store = Ext.create('Ext.data.Store',{
		model : 'mainModel',
		autoLoad:true, // 加载时就读取数据
		pageSize:50, // 每页显示50条记录
		proxy:{
			type:'ajax',
			url:'book_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 根节点
				totalProperty:'totalCount' // 总记录数
			}
		}
	});
	var statusData=[{value:"",text:"全部"},{value:1,text:"试驾手册"},{value:0,text:"产品手册"}];
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
			layout:{type:'table',columns:5,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:70,width:210
			},
			items:[
				{xtype:'textfield',fieldLabel:"手册名称",name:'cpBookname'},
				{
					xtype:"combo",
					store:statusStore,
					displayField:'text',
					valueField:'value',
					value:"",
					editable:false,
					fieldLabel : "手册类型",
					name : 'cpType'
				},
				{fieldLabel:'添加时间从',labelWidth:70,width:200,name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d'},
				{fieldLabel:'至',labelWidth:20,width:150,name:'endTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d',cols:2},
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
		   title : "手册信息",
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
					{header : '手册名称',	dataIndex : 'cpBookname',flex:1.5},
					{header : '所属车系',	dataIndex : 'cpIntentname',flex:1},
					{header : '页面显示名称',	dataIndex : 'cpPagename',flex:1},
					{header : '排序值',	dataIndex : 'cpOrder',flex:1},
					{header : '手册类型',	dataIndex : 'cpType',flex:1,renderer:function(v){
						if(v=="" || v=="null" || v==null){
							return "";
						}
						if(v=="null" || v==null){
							return	"产品";
						}else{
							return v==1?"试驾":"产品";
						}
		         	}},
					{header : '图片',	dataIndex : 'cpImg',flex:1},
					{header : '价目表文件',	dataIndex : 'cpPdf',flex:1},
					{header : '是否发布',	dataIndex : 'cpIspub',flex:1,renderer:function(v){
						if(v=="null" || v==null){
							return	"未发布";
						}else{
							return (v==1?"":"未")+"发布";
						}
		         	}},
					{header : '添加时间',	dataIndex : 'cpAddtime',flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}}
			    ]
			},listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindow("<s:text name='util.edit'/>",[update(record,view)]); // 弹出修改框
			}},
			tbar : [
			{
				text : "添加",
				iconCls : 'icon-add',
				handler : function() {
					var grid=this.up('grid');
					mkWindow("添加手册",[add(grid)]);
				}
			}, '-',{
				text : "修改",
				iconCls : 'icon-edit',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection();
					if(secData.length != 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要修改的一行");
					} else {
					var data=secData[0];
					mkWindow("<s:text name='util.query'/>",[update(data,this.up('grid'))]); // 弹出修改框
					}
				}
			}, '-',{
				text : "修改发布状态",
				iconCls : 'icon-edit',
				handler : function() {
					var grid = this.up('grid');
					var secData = grid.getSelectionModel().getSelection();
					if(secData.length != 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>","请选择要修改的一行");
					} else {
					var data=secData[0];
					var isPub=data.get("cpIspub")=="0";
					var popMsg="";
					if(isPub){
						popMsg="目前状态为[未发布]状态,是否确认将状态改为[发布]状态!";
					}else{
						popMsg="目前状态为[已发布]状态,是否确认将状态改为[未发布]状态!";
					}
					Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>",popMsg,function(btn){
						if(btn=="yes"){
							updateStatus();
						}
					});
					function updateStatus(){
						waitLoadMask.show();
						Ext.Ajax.request( {
								type: 'ajax',
								url : 'book_updateStatus.action',
								method : 'POST',
								params : { 
									rows:Ext.encode({"cpId":data.get("cpId")})
								},
								success : function(response, opts) {
									 var retData = Ext.decode(response.responseText);
									 var isSuc= retData.isSuc;
									 if(isSuc!="true"){
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
									 } else {
										 Ext.Msg.alert("<s:text name='util.promptTitle'/>","状态修改成功!");
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
				}
			},'-',{
			   text:"<s:text name='util.gridRefresh'/>",iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
				 }
			}]
		});
	}
	
	//产品手册的车系
	var productBookData=[["3822","A1 / A1 Sportback"],                
               ["3863","A1中国限量版"],
               ["3823","A3 Sportback"],
               ["3824","A4L"],
               ["3825","A4 allroad quattro"],
               ["3826","A5"],
               ["3827","S5/RS5"],
               ["3828","A6L"],
               ["3829","A7"],
               ["3830","A8L / S8"],
               ["3831","A8L W12"],
               ["3832","Q3"],
               ["3833","Q5"],
               ["3834","Q7"],
               ["3835","TT Coupé / TT Roadster"],
               ["3836","TTS Coupé / TTS Roadster"],
               ["3837","R8 Coupé / R8 Spyder"]];
	
	/* 添加 */
	function add(grid){
		var addForm = Ext.create('Ext.form.Panel',{
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
				width:400
			},
			items : [
			    {fieldLabel : "手册名称",name:'cpBookname',allowBlank : false},
			    {fieldLabel : "手册类型",name:'cpType',xtype:'combo',store:[["0", "产品"],["1", "试驾"]],editable:false,allowBlank : false,value:"0",
					listeners:{
						change:function(compo,newValue,oldValue,eOpts )
						{
							if(newValue=='0'){
								addForm.getForm().findField("cpIntentcars").getStore().loadData(productBookData);
								addForm.getForm().findField("cpImg").allowBlank=false;
							}else{
								addForm.getForm().findField("cpIntentcars").getStore().loadData(autos);
								addForm.getForm().findField("cpImg").allowBlank=true;
							}
						}
					}},
			    {xtype:"combo",fieldLabel : "所属车系",name:'cpIntentcars',store:productBookData,allowBlank : false,editable:false,
					listeners:{
						change:function(compo,newValue,oldValue,eOpts )
						{
							
						},select:function(combo,records){
							var text=combo.getRawValue();
							addForm.getForm().findField("cpIntentname").setValue(text);
						}
					}},
			    {fieldLabel : "页面显示名称",name:'cpPagename',allowBlank : false},
			   {xtype:'fileuploadfield',fileUpload: true,fieldLabel:"图片",allowBlank : false,name : 'cpImg',id:'upfile1'
				,validator : function(v) {
						if(v==""){
							return true;
						}
						if(v.lastIndexOf(".")==-1){
							return '请选择图片文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")<0){
							return '请选择图片文件！';
						}
						return true;
				}},
				{xtype:'fileuploadfield',fileUpload: true,fieldLabel:"价目表文件",allowBlank : false,name : 'cpPdf',id:'upfile2'
				,validator : function(v) {
						if(v.lastIndexOf(".")==-1){
							return '请选择文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allFileExt.indexOf(fileExt+"|")<0){
							return '请选择正确的文件！';
						}
						return true;
				}},
				{xtype:'numberfield',fieldLabel:"排序值",name:'cpOrder',value:grid.getStore().getTotalCount()+1,allowBlank : false},
				{xtype:'checkboxfield',name:'cpIspub',boxLabelAlign:'before',padding:'0 0 0 48',boxLabel:"是否发布:",inputValue :'1'},
				{xtype : 'hidden',name : 'cpIntentname'}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:430,
			height:280,
			items:[addForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					
					//是否是超级管理员
					var subValue=form.getValues();
					subValue.cpIspub=(form.findField('cpIspub').getValue()==false)?0:subValue.cpIspub;
					
					form.submit( {
						url : "book_add.action",
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(subValue)
						},
				        success : function(response, opts){
				        	var retData =opts.result;
							var isSuc= retData.isSuc;
				        	if(isSuc=="true"){
				        		funSuccess(response, opts,win,grid)
				        	}
				        	else{
				        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
				        	}
				        },
				        failure:function(response, opts){
				       	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
		});
	}
  /* 添加 */
	function update(data,grid){
		var dataArr=data.get("cpType")=="0"?productBookData:autos;
		var updateForm = Ext.create('Ext.form.Panel',{
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
				width:400
			},
			items : [
			    {fieldLabel : "手册名称",name:'cpBookname',allowBlank : false,value:data.get("cpBookname")},
			    {fieldLabel : "手册类型",name:'cpType',xtype:'combo',store:[["0", "产品"],["1", "试驾"]],editable:false,allowBlank : false,value:data.get("cpType"),
					listeners:{
						change:function(compo,newValue,oldValue,eOpts )
						{
							if(newValue=='0'){
								updateForm.getForm().findField("cpIntentcars").getStore().loadData(productBookData);
								updateForm.getForm().findField("cpImg").allowBlank=false;
							}else{
								updateForm.getForm().findField("cpIntentcars").getStore().loadData(autos);
								updateForm.getForm().findField("cpImg").allowBlank=true;
							}
						}
					}},
			    {xtype:"combo",fieldLabel : "所属车系",name:'cpIntentcars',store:dataArr,value:data.get("cpIntentcars"),allowBlank : false,editable:false,
					listeners:{
						change:function(compo,newValue,oldValue,eOpts )
						{
							
							
						},select:function(combo,records){
							var text=combo.getRawValue();
							updateForm.getForm().findField("cpIntentname").setValue(text);
						}
					}},
			    {fieldLabel : "页面显示名称",name:'cpPagename',value:data.get("cpPagename"),allowBlank : false},
			   {xtype:'fileuploadfield',fileUpload: true,fieldLabel:"图片",rawValue:data.get("cpImg"),allowBlank : data.get('cpType')!=0,name : 'cpImg',id:'upfile1'
				,validator : function(v) {
						if(v==""){
							return true;
						}
						if(v.lastIndexOf(".")==-1){
							return '请选择图片文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allImgExt.indexOf(fileExt+"|")<0){
							return '请选择图片文件！';
						}
						return true;
				},	listeners:{change:function(file,value,eOpts)
					{
						updateForm.getForm().findField("isUpCpImg").setValue(true);
					}}
				},
				{xtype:'fileuploadfield',fileUpload: true,fieldLabel:"价目表文件",allowBlank : false,name : 'cpPdf',rawValue:data.get("cpPdf"),id:'upfile2'
				,validator : function(v) {
						if(v.lastIndexOf(".")==-1){
							return '请选择文件！';
						}
						var fileExt=v.substr(v.lastIndexOf(".")).toLowerCase();
						if(allFileExt.indexOf(fileExt+"|")<0){
							return '请选择正确的文件！';
						}
						return true;
				},listeners:{change:function(file,value,eOpts)
					{
						updateForm.getForm().findField("isUpCpPdf").setValue(true);
					}}
				},
				{xtype:'numberfield',fieldLabel:"排序值",name:'cpOrder',value:data.get('cpOrder'),allowBlank : false},
				{xtype:'checkboxfield',name:'cpIspub',boxLabelAlign:'before',padding:'0 0 0 48',boxLabel:"是否发布:",inputValue :data.get("cpIspub"),checked:data.get("cpIspub")=="1"},
				{xtype : 'hidden',name : 'cpIntentname',value:data.get("cpIntentname")},
				{xtype : 'hidden',name : 'isUpCpImg',value:false},
				{xtype : 'hidden',name : 'isUpCpPdf',value:false},
				{xtype : 'hidden',name : 'cpId',value:data.get("cpId")}
			]
		});
		return Ext.create('Ext.panel.Panel',{
			layout:'border', // 使用border布局，必须要有一个panel放置在center部位
			border:false,
			width:430,
			height:280,
			items:[updateForm], // 将表单面板加入该panel中
			fbar:[{
				text:"<s:text name='util.comfirm'/>",
				handler:function(){
					var form = this.up('panel').child('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					if(!form.isValid()) { //判断不能为空的字段是否为空，为空则返回
						return;
					}
					//是否是超级管理员
					var subValue=form.getValues();
					subValue.cpIspub=(form.findField('cpIspub').getValue()==false)?0:subValue.cpIspub;
					form.submit( {
						url : "book_update.action",
						method : 'POST',
						waitMsg : "<s:text name='util.submitDataContent'/>",//正在提交数据...
						waitTitle :"<s:text name='util.submitDataTitle'/>",//数据提交
						params : { 
						   rows:Ext.encode(subValue)
						},
				        success : function(response, opts){
				        	var retData =opts.result;
							var isSuc= retData.isSuc;
				        	if(isSuc=="true"){
				        		funSuccess(response, opts,win,grid)
				        	}
				        	else{
				        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
				        	}
				        },
				        failure:function(response, opts){
				       	 	Ext.Msg.alert("<s:text name='util.promptTitle'/>",opts.result.msg);
				       	}
					});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}]
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
