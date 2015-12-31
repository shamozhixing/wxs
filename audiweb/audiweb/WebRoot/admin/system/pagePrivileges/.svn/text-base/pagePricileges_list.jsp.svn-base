<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@include file="../../common/taglibs.jsp" %>
(function(){
	/*角色表Model */
	Ext.define('roleModel',{
		extend:'Ext.data.Model',
		fields : ['cmroName','cmroDesc','cmroAddtime','cmroAdduser'] // 对应角色表中的字段，建议全部写出
	});
	/*角色Store */
   var store_role = Ext.create('Ext.data.Store',{
		model:'roleModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'role_query.action',//请求后台西信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
   /* 角色*/
	function grid_pagePri(){
		return Ext.create('Ext.grid.Panel',{
			heard:false,
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_role, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			multiSelect : false, // 允许多选
			selModel:{selType:'checkboxmodel'},
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
			       {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : "<s:text name='admin.system.role.cmroName'/>",dataIndex : 'cmroName', flex:1}, 
			       {header : "<s:text name='admin.system.role.cmroDesc'/>",dataIndex : 'cmroDesc', flex:1}]},
			listeners:{
				itemdblclick:function(view,record,htmlElm,index,e,eOpts){
					mkWindows("设置内容权限",[setRoleRight(record,view)]);
				}
			},
			tbar:[
			{
				text:"<s:text name='admin.system.role.settingRight'/>",/*设置权限*/
				handler : function(){
					var secData = this.up('grid').getSelectionModel().getSelection(); // 获取到选择的记录
					if(secData.length < 1){
						Ext.Msg.alert("<s:text name='util.promptTitle'/>"/*提示*/,"<s:text name='util.grid.promptOptionMin'/>"/*您最少要选择一条记录*/);
					} else {
						mkWindows("设置内容权限",[setRoleRight(secData[0],this.up('grid'))]); 
					}
				}
			},'-',
			{text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
				var grid = this.up('grid');
				grid.getStore().load();
				}
			}]
		});
	}
	
	//------start,所有页面信息
		Ext.define('pageInfModel', {
			extend : 'Ext.data.Model',
			fields : ['cmpId','text','children','nameLength']
			
		});    
		var pageInfStore = Ext.create('Ext.data.Store', {
			model : 'pageInfModel',
			proxy : {
				type : 'ajax',
				url : 'cpp_getAllPageNodes.action'
			},sync:false
		});
		//------end
	/*为角色设置权限 */
	function setRoleRight(data,grid){
		return Ext.create("Ext.form.Panel", {
			width:900,
			height:450,
			autoScroll : true,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:1,tableAttrs:{style:{margin:'10 0 0 0'}}},
			items:[
				{xtype:'textfield',
				labelWidth:100,
				labelAlign:'right',
				width:370,
				fieldLabel : "<s:text name='admin.system.role.cmroName'/>"/*'角色名称'*/,
				allowBlank : false,
				name:'cppCmroname', 
				value:data.get('cmroName'),
				readOnly:true,fieldCls:'text-readonly'}
			    ],
			fbar:['->',{
				text:"<s:text name='util.comfirm'/>"/*'确定'*/,
				handler:function(){
					var form = this.up('form').getForm(); //获取到添加窗口中的Form
					var win = this.up('window');
					//获取所有的权限信息
					var privDatas=[];
					form.getFields().each(function(el){
						if(el.xtype=='checkboxgroup')
						{
							//获取选中的复选框
							var checkboxValues=form.findField(el.name).getChecked();
							var cppPrivValue='';
							Ext.Array.each(checkboxValues,function(childItems){
								//获取复选框中的值
								if(cppPrivValue.length!=0){
									cppPrivValue+=','+childItems.getSubmitValue();
									}else
									{
										cppPrivValue+=childItems.getSubmitValue();
									}
							});
							if(cppPrivValue!='')
							{
								privDatas.push({cppCmpId:el.name,cppPrivValue:cppPrivValue});
							}
						}
					});
					var submitValues=form.getValues();
					submitValues.privDatas=privDatas;
					Ext.Ajax.request( {
								type: 'ajax',
						        method : 'POST',
						        url : 'cpp_settingPriv.action',//此处相当于为权限表设置栏目的权限信息
						        method : 'POST',
						         params : { 
						        	rows:Ext.encode(submitValues)
								},
						        success : function(response, opts){
						        	var retData = Ext.decode(response.responseText);
									var isExists= retData.isExists;
						        	if(!isExists){
						        		funSuccess(response, opts,win,grid)
						        	}
						        	else{
						        		Ext.Msg.alert("<s:text name='util.promptTitle'/>",retData.msg);
						        	}
						        },
						        failure:function(response, opts){
						       	 	funFailure(response, opts);
						       	}
							});
				}
			},{text:"<s:text name='util.cancel'/>"/*'取消'*/,handler:function(){this.up('window').close();}}],
			listeners : {
				afterrender:function(component,eOpts ){
					//加载信息
					pageInfStore.load({
				       callback: function(records, options, success){ 
					       	//动态递归目录
							function recursionMenus(item,marginLeft,itemsWidth){
								var collectionData=[];
						    	var itemsGroup;
						    	var childs=item.children;
						    	var itemTextlen=item.text.length;
								if((childs) &&  childs.length>0)
								{
									Ext.Array.each(childs,function(child){
										itemsGroup = getCheckGroup(child.text,child.cmpId,'0 0 0 '+(marginLeft));
										itemsGroup.labelWidth=child.nameLength+itemsWidth-50;
										itemsGroup.width+=itemsGroup.labelWidth-100;
										collectionData.push(itemsGroup);
										if((child.children) && child.children.length>0)
										{
											collectionData.push(recursionMenus(child,marginLeft,itemsGroup.labelWidth));
										}
									});
								}
								return collectionData
							}
								pageInfStore.removeAll(true);
				       			pageInfStore.add(records);
								//获取集合
								var collectionData=[];
				                pageInfStore.each(function(item){
				                	var itemsGroup;
									if(item.get('children').length>0)
									{
										var mainMenu=getCheckGroup(item.get('text'),item.get('cmpId'),'0 0 0 0');//{xtype:'label',text:item.get('text')+":",style:{fontSize:'12px',display:'block',textAlign:'right',width:100}}
										collectionData.push(mainMenu);
										var childs=item.get('children');
										Ext.Array.each(childs,function(child){
											//体验范围数据
											itemsGroup = getCheckGroup(child.text,child.cmpId,'0 0 0 15');
											collectionData.push(itemsGroup);
											//为子节点添加子节点
											collectionData.push(recursionMenus(child,30,itemsGroup.labelWidth));
										});
									}else{
										itemsGroup=getCheckGroup(item.get('text'),item.get('cmpId'));
										collectionData.push(itemsGroup);
									}
								});
								component.add(collectionData);
								//-----------加载完权限栏目后，加载已有权限start
								//获取当前form
								var privform=component.getForm();
								//获取数据库角色拥有的权限
								Ext.Ajax.request( {
									type: 'ajax',
							        method : 'POST',
							        url : 'cpp_queryPrivByRole.action',//获取角色的权限信息
							        method : 'POST',
							         params : { 
							        	rows:Ext.encode({cppCmroname:data.get('cmroName')})
									},
							        success : function(response, opts){
							        	var retData = Ext.decode(response.responseText);
							        	//该角色已存在的权限
							        	var selectPriv=retData.rows;
							        	Ext.Array.each(selectPriv,function(row){
							        		//权限组Checkboxgroup下的子项
							        		var checkBoxObj=privform.findField(row.cppCmpId);
							        		if(checkBoxObj)
							        		{
								        		var checkboxgroupItems=	checkBoxObj.items;
								        		for (var i = 0; i < checkboxgroupItems.length; i++)    
									            {    
									            	var obj=checkboxgroupItems.getAt(i);
									            	var dbPrivDatas=row.cppPrivValue.split(',');
									            	Ext.Array.each(dbPrivDatas,function(item){
									            		if(item==obj.inputValue)
									            		{
									            			obj.setValue(true);
									            		}
									            	});
									            } 
							        		}
							        	});
							        	//数据加载完毕消除遮罩层
							        	component.up('window').body.unmask(); 
							        }
								});
								//-----------加载完权限栏目后，加载已有权限end
				         }
					});
				}
			}
		 });
	}
	//动态checkgroup
	function getCheckGroup(text,cmpId,margin)
	{
		//创建权限列
		var comData=[
			{boxLabel:"<s:text name='util.query'/>"/*'查看'*/,inputValue :'VIEW'}
			,{boxLabel:"<s:text name='util.gridNewly'/>"/*'新增'*/,inputValue :'ADD'}
			,{boxLabel:"<s:text name='util.gridUpdate'/>"/*'修改'*/,inputValue :'MOD'}
			,{boxLabel:"<s:text name='util.gridDelete'/>"/*'删除'*/,inputValue :'DEL'}
			,{boxLabel:"<s:text name='admin.system.role.check'/>"/*'审核'*/,inputValue :'CHECK'}
			,{boxLabel:"<s:text name='admin.system.role.publish'/>"/*'发布'*/,inputValue :'PUB'}
			,{boxLabel:"<s:text name='admin.system.role.privAll'/>"/*'全部'*/,inputValue :'ALL',
				listeners:{
					change:function(field,newValue,oldValue,eOpts){
						if(field.getValue())
						{
			        		var checkboxgroupItems=field.up('checkboxgroup').items;
	        				for (var i = 0; i < checkboxgroupItems.length; i++)    
				            {    
				            	var obj=checkboxgroupItems.getAt(i);
								obj.setValue(true);;
				            } 
						}
					}
					}
			}
			];
		var itemsGroup = new Ext.form.CheckboxGroup({ 
			xtype:'checkboxgroup',
			labelWidth:100,
			labelAlign:'right',
			align:'center',
			defaults:{xtype:'checkboxfield'},
			fieldLabel:text,
			name:cmpId,
			margin:margin,
			width:420,
			items:comData,
			listeners:{
				change:function(field,newValue,oldValue,eOpts){
		        		var checkboxValues=field.getChecked();
		        		//所有el
		        		var checkboxgroupItems=field.items;
		        		var all=checkboxgroupItems.getAt(checkboxgroupItems.length-1);
        				if((all.getValue()) && checkboxValues.length<(checkboxgroupItems.length))
        				{
        					all.setValue(false);
        				}
				}}
			});
		
		return itemsGroup;
	}
	/* 用户管理面板 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"",
	    layout:'border',
	    closable:true,
	   	items:[grid_pagePri()]//TabPanel中的标签页
    }); 
})();