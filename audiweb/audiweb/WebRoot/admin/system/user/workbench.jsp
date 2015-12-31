<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@include file="../../common/taglibs.jsp" %>
(function(){
	/*Model */
	Ext.define('workbench_Model',{
		extend:'Ext.data.Model',
		fields : [{name : 'cmpId',type : 'int'},'text','children', 'url', 'tag', 'icon',{name:'id',mapping:'cmpId'},'pId'] // 对应用户表中的字段，建议全部写出
	});
	var workbenchStore = Ext.create('Ext.data.Store', {
	model : 'workbench_Model',
		proxy : {
			type : 'ajax',
			url : 'lefttree_getSysTreeByCmmId.action',
			extraParams:{cmpId:0}
		}
	});
	
	/*我的工作台 */
	function workbenchPanel(){
		var canvas;
		return Ext.create("Ext.panel.Panel",{
				border:false,
				id:'workbench_mainPanel',
				//bodyStyle:{background:'#ffffff'},//{background:'transparent'},
				title:"<s:text name='admin.system.user.workbenchSpace'/>",/*我的工作台*/
				listeners : {
					afterrender:function(component,eOpts ){
						var canvasDivHtml = "<div id='canvas' width='100%' height='100%' style='background:#ffffff'></div>";
						var canvasDivEl = Ext.DomHelper.insertHtml('afterBegin',Ext.getDom("workbench_mainPanel"), canvasDivHtml);
						canvas = Raphael(canvasDivEl, 800, 50);
						canvas.setSize(this.ownerCt.getWidth() - 10, this.ownerCt.getHeight() - 10);
						//加载信息
						workbenchStore.load({
					       callback: function(records, options, success){ 
					       		loadHandler(canvas,component);
					         }
						});
					}
				}
		});
	}
	function loadHandler(canvas,component){
		var itcpImage = canvas.image("resources/images/could.png", canvas.width / 2 - 125, canvas.height/ 2 - 45, 250, 90);
		var itcpText = canvas.text(canvas.width / 2, canvas.height / 2, "后台内容管理云平台").attr("font-size", 20);
		var angle = Math.PI * 2 / workbenchStore.getCount();
		var count = 0, rx = 300, ry = 200;
		canvas.ellipse(canvas.width / 2, canvas.height / 2, rx, ry)
		workbenchStore.each(function(record) {
			var x = canvas.width / 2 + rx * Math.cos(angle * count);
			var y = canvas.height / 2 - ry * Math.sin(angle * count);
			canvas.image("resources/images/could.png", Math.random() * 1000, Math.random() * 1000, 180, 60).attr({cursor:'pointer'}).animate({
								x : x - 90,
								y : y - 30
							}, 2500, "elastic", null).mouseover(function() {
								this.data("glowSet", this.glow({color:'blue'}));
							}).mouseout(function() {
								this.data("glowSet").remove();
							}).click(function(){
								var mainDom = component.up("viewport").items;
								for (var i = 0; i < mainDom.length; i++)    
					            {    
					            	var obj=mainDom.getAt(i);
					            	if(obj.title=='系统导航' || i==1){
					            		var leftNavigation=Ext.getCmp(obj.id).items;
					            		for (var i = 0; i < leftNavigation.length; i++)    
					           			 {
					            			var treePanel=leftNavigation.getAt(i);
					            			if(treePanel.title==record.data.text){
					            				Ext.getCmp(treePanel.id).expand(true);
					            			}
					            		 }
					            	}
					            }
						});
			var moduleText = canvas.text(Math.random() * 1000, Math.random() * 1000, record.data.text).attr("font-size", 12).animate({
						x : x,
						y : y
					}, 2500, "elastic", null);
			count++;
			moduleText.mousedown(function() {
		
								});
		});
	}
	/*我的工作台 */
	return workbenchPanel();
	
})();