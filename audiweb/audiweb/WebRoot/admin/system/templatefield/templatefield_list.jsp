<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
(function(){
	/*
	 * 模板字段表Model
	 */
	Ext.define('templatefieldModel',{
		extend:'Ext.data.Model',
		fields : ['ctfId','ctfCmtId','ctfViewName','ctfName','ctfType','ctfLength','ctfWidth','ctfHeight','ctfOrderNum','ctfSiteType','ctfLastuser','ctfLasttime'] 
	});
  
	var store_template = Ext.create('Ext.data.Store',{
		model:'templateModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'template_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	/*
	 * 模板字段Store
	 */
   var store_templatefield = Ext.create('Ext.data.Store',{
		model:'templatefieldModel',
		pageSize:50, // 每页显示50条记录
		autoLoad:true, // 加载时就读取数据
		proxy:{
			type:'ajax',
			url:'templatefield_query.action',//请求后台信息
			method:'POST',
			reader:{
				type:'json',
				root:'ROOT', // 跟节点
				totalProperty:'TOTALCOUNT' // 总记录数
			}
		}
	});
	
	//查询
   function templateFForm(){
        return Ext.create('Ext.form.Panel',{
            region:'north',
			height:60,
			bodyStyle:{background:'transparent'},
			border:false,
			layout:{type:'table',columns:1,tableAttrs:{style:{margin:'10 0 0 0'}/*,width:'100%'*/}},
			defaults:{
				labelAlign:'right',
				labelWidth:80,width:240
			},
			items:[{xtype:'textfield',fieldLabel:"<s:text name='cms_templatefield.ctfCmtId'/>",name:'ctfCmtId'}],buttonAlign:'right',
			buttons:[{text:"<s:text name='util.search'/>",iconCls:'icon-find',
				    handler:function(){
					var form = this.up('form').getForm();
					var store = this.up('form').up('panel').child('grid').getStore();
					var vals=form.getValues();
	
					var jsonObj=Ext.encode({
					  ctfCmtId:vals.ctfCmtId
					  });
					  store.getProxy().extraParams = {rows:jsonObj};
					  store.load();
				}
			}]
        })
   }
   
   /* 模板信息列表
    */
	function grid_templatefield(){
		return Ext.create('Ext.grid.Panel',{
			title : "<s:text name='cms_templatefield.list'/>",
			autoScroll :true, // 按需滚动
			columnLines:true, // 显示竖线
			store : store_templatefield, // 数据源
			region : 'center', // 主panel用了border布局，必须有center
			border:false, // 去掉边框
			selModel:{
				selType:'checkboxmodel'
			},
			multiSelect : true, // 允许多选
			bbar:{xtype:'pagingtoolbar',displayInfo:true,store:store_templatefield}, // 分页信息,store与grid的store一样
			columns:{
				defaults:{align:'left'}, // 设置默认居中
				items:[
				   {text:"<s:text name='util.grid.rowNumber'/>",xtype:'rownumberer',width:30,align:'center'},
			       {header : 'ID',dataIndex : 'ctfId', flex:1}, 
			       {header :"<s:text name='cms_templatefield.ctfCmtId'/>",dataIndex : 'ctfCmtId', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfViewName'/>",dataIndex : 'ctfViewName', flex:1}, 
			       {header :"<s:text name='cms_templatefield.ctfName'/>",dataIndex:'ctfName',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfType'/>",dataIndex:'ctfType',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfLength'/>",dataIndex:'ctfLength',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfWidth'/>",dataIndex:'ctfWidth',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfHeight'/>",dataIndex:'ctfHeight',flex:1},
			       {header :"<s:text name='cms_templatefield.ctfOrderNum'/>",dataIndex : 'ctfOrderNum', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfSiteType'/>",dataIndex : 'ctfSiteType', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfLastuser'/>",dataIndex : 'ctfLastuser', flex:1},
			       {header :"<s:text name='cms_templatefield.ctfLasttime'/>",dataIndex : 'ctfLasttime', flex:1,renderer:function(v){
			       	  return getDateTime(v);}
			       }
			    ]
			},
			tbar : [  
			{
			   text:"<s:text name='util.gridRefresh'/>"/*'刷新'*/,iconCls: 'icon-refresh',handler:function(){
					var grid = this.up('grid');
					grid.getStore().load();
					   }
			}
			]
		});
	}
	
		
	/*
	 * 模板字段
	 */
	return Ext.create('Ext.panel.Panel',{ 
		title:"<s:text name='cms_templatefield'/>", // 标题名必须与funcMenu.json中对应的名一样，否则会出错
	    layout:'border',
	    closable:true,
	   	items:[templateFForm(),grid_templatefield()]//TabPanel中的标签页
    }); 
})();