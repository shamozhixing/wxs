<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*
	 * 用户登录model
	 */
   Ext.define('userloginModel',{
		extend:'Ext.data.Model',
		fields : ['culId','culCmuId','culLoginTime'] 
	});
	/*用户表Model */
	Ext.define('user_CmsUserModel',{
		extend:'Ext.data.Model',
		fields : [{name:'cmuId',type:'int'},
				  'cmuName',
				  'cmuPassword',
				  'cmuEmail',
				  'cmuMobile',
				  'cmuFullName',
				  'cmuCmroRoles',
				  'cmuAddtime',
				  'cmuAdduser',
				  'cmuIsAdmin'//是否超级管理员
				  ] // 对应用户表中的字段，建议全部写出
	});
   /*
    * 用户登陆store
    */
	 var store_userlogin = Ext.create('Ext.data.Store',{
		model:'userloginModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'userlogin_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/*用户表Store */
   var store_user = Ext.create('Ext.data.Store',{
		model:'user_CmsUserModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'user_query.action',//请求后台西信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	//查询
	function userloginFForm(){
	  return Ext.create('Ext.form.Panel',{
            region:'north',
			height:40,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:4,tableAttrs:{style:{margin:'10 0 0 0'}},tdAttrs:{style:{width:'200px'}}},
			defaults:{
				labelAlign:'right',
				labelWidth:60,width:200
			},
			items:[{xtype:'textfield',fieldLabel:"<s:text name='admin.system.user.cmuName'/>",name:'cmuName',labelWidth:70,width:210},
				   {xtype:'textfield',fieldLabel:'开始时间',name:'startTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d',editable:false},
				   {xtype:'textfield',fieldLabel:'结束时间',name:'endTime',xtype : 'datefield',format:'Y-m-d',dateFormat:'Y/m/d',editable:false},
				   {xtype: 'button',width:60,margin:'0 0 5 30',text:"<s:text name='util.search'/>",iconCls:'icon-find',
				        handler:function(){
						var form = this.up('form').getForm();
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
						var cmuName = form.getValues().cmuName.trim();
						var cmuIds=''; // 用户id  culCmuId
						store_user.each(function(u){
							if(u.get('cmuName').indexOf(cmuName)>-1){
								if(cmuIds=='')
								{
									cmuIds+=u.get('cmuId');
								}else{
									cmuIds+=","+u.get('cmuId');
								}
							}
						});
						if(cmuIds=='')
						{
							cmuIds=-1;
						}
						if(cmuName=='')
						{
							cmuIds='';
						}
						var jsonObj=Ext.encode({
						  	cmuId:cmuIds.toString(),
						  	startTime:vals.startTime,
						  	endTime:vals.endTime
						  	
					  	});
					  	store.getProxy().extraParams = {rows:jsonObj};
					  	store.load();
						}
				    }]   
        });
	}
	/*
	 * 用户登录列表
	 */
	function grid_userlogin(){
	  return Ext.create('Ext.grid.Panel',{
	     title:'登陆用户列表',
	     autoScroll :true, // 按需滚动
	     columnLines:true, // 显示竖线
		 store : store_userlogin, // 数据源
		 region : 'center', // 主panel用了border布局，必须有center
		 border:false, // 去掉边框
		 selModel:{
			selType:'checkboxmodel',
			mode:'MULTI'
		 },
		 multiSelect : true, // 允许多选
		 bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_userlogin}, // 分页信息,store与grid的store一样
		 columns:{
		    defaults:{align:'left'}, // 设置默认居中
		    items:[
		       {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
		       {header : 'ID',dataIndex : 'culId', flex:1},
		       {header : '用户',dataIndex : 'culCmuId', flex:1,renderer:function(v){
		         	return getTextByStore(store_user,v,'cmuId','cmuName');
		       }}, 
		       {header : '登录时间',dataIndex : 'culLoginTime', flex:1,renderer:function(v){
			       	  return getDateTime(v);
		         	}}
		    ]
		},tbar:[
		    {
			text : "<s:text name='util.gridDelete'/>",
			iconCls : 'icon-delete',
			handler : function() {
				var grid = this.up('grid');
				var secData = grid.getSelectionModel().getSelection(); // 获取到选择的记录
				if(secData.length > 0){
					Ext.MessageBox.confirm("<s:text name='util.promptTitle'/>","<s:text name='admin.system.role.comfirMsgDel'/>",function(btn){
						if(btn=="yes"){
						    var jsonArr = [];
							Ext.Array.each(secData,function(record){
								jsonArr.push(record.data);
							});
							Ext.Ajax.request( {
								type: 'ajax',
						        url : 'userlogin_del.action',
						        method : 'POST',
						        params : { 
									rows:Ext.encode(jsonArr) // 以字符串形式传到后台
								},
								success : function(response, opts) {
									//后台返回json为：{success:true,msg:'删除成功'} success为true表示删除成功，false为失败
									 var retData = Ext.decode(response.responseText);
									 var valid= retData.success;
									 if(!valid){
									 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
									 } else {
									 	 Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
									 	 grid.getStore().load(); // 重新加载数据
									 }
								},
								failure : function(response, opts) {
									Ext.Msg.alert("<s:text name='util.fail'/>","<s:text name='util.hanldFail'/>");
								}
							})
						}
					});
				} else {
					Ext.Msg.alert("<s:text name='util.promptTitle'/>","<s:text name='util.grid.promptOptionMinHandle'/>");
				}
			  }
		
		    },'-',{text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					   }
				   }]
	  })
	}
	/*
	 * 在线用户列表
	 */
	return Ext.create('Ext.panel.Panel',{
	    title:'登录用户日志', // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[userloginFForm(),grid_userlogin()]//TabPanel中的标签页
	})
})();