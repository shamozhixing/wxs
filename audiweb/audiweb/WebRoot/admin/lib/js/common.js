// 获取当前日期
function getDateTime(t) {
	if(!t){
		return "";
	}
	if(Ext.typeOf(t)!='date'){
		var re = /T/gi;
		t = t.replace(re, " ");
		var re = /-/gi;
		t = t.replace(re, "/");
	}
	var d = new Date(t);
	return Ext.util.Format.date(d, 'Y-m-d H:i:s');
}
 Ext.Ajax.timeout=60000000;
function getDate(t) {
	if(!t){
		return "";
	}
	if(Ext.typeOf(t)!='date'){
		var re = /T/gi;
		t = t.replace(re, " ");
		var re = /-/gi;
		t = t.replace(re, "/");
	}
	if (t == undefined || t == "")
		return "";
	var d = new Date(t);
	return Ext.util.Format.date(d, 'Y-m-d');
}
function getCurrentDate() {
	var d = new Date();
	return Ext.util.Format.date(d, 'Y-m-d');
}
// 模态弹出框
function mkWindow(title, items, callbackFunc) {
	if (!items)
		return;
	return Ext.create('Ext.window.Window', {
		title : title,
		constrain : true,
		constrainHeader : true,
		bodyStyle : {
			overflow : true
		},
		modal : true,
		items : items,
		listeners : {
			afterrender : function(me, opts) {
				var w = 0;
				me.items.each(function(item, index, length) {
					var tw = item.getWidth();
					w = w > tw ? w : tw;
				});
				me.setWidth(w + 20);
				me.center();
				me.addListener('resize', function(me, w, h, eOpts) {
					//me.items.getAt(0).setSize(w - 20, h - 40);
				});
			},
			beforeclose : function(me) {
				if (undefined == callbackFunc) {
					return true;
				} else
					callbackFunc();
			}
		}
	}).show();
}
// 模态弹出框
function mkWindowForEdit(title, items,width,height) {
	if (!items)
		return;
	return Ext.create('Ext.window.Window', {
		title : title,
		constrain : true,
		constrainHeader : true,
		bodyStyle : {
			overflow : true
		},
		layout: 'fit',
       	plain: true,
		modal : true,
		width:width,
		height:height,
		minHeight:height,
		maxHeight:height,
		minWidth:width,
		maxWidth:width,
		items : items,
		listeners : {
			afterrender : function(me, opts) {
				var w = 0;
				me.items.each(function(item, index, length) {
					var tw = item.getWidth();
					w = w > tw ? w : tw;
				});
				me.setWidth(w + 20);
				me.center();
				me.addListener('resize', function(me, w, h, eOpts) {
					me.items.getAt(0).setSize(w - 20, h - 40);
				});
			}
		}
	}).show();
}
// 模态弹出框,含loading提示信息
function mkWindows(title, items, callbackFunc) {
	if (!items)
		return;
	return Ext.create('Ext.window.Window', {
		title : title,
		constrain : true,
		constrainHeader : true,
		bodyStyle : {
			overflow : true
		},
		modal : true,
		items : items,
		listeners : {
			afterrender : function(me, opts) {
				var w = 0;
				me.items.each(function(item, index, length) {
					var tw = item.getWidth();
					w = w > tw ? w : tw;
				});
				me.setWidth(w + 20);
				me.center();
				me.addListener('resize', function(me, w, h, eOpts) {
					me.items.getAt(0).setSize(w - 20, h - 50);
				});
				me.body.mask('数据加载中...');
			},
			beforeclose : function(me) {
				if (undefined == callbackFunc) {
					return true;
				} else
					callbackFunc();
			}
		}
	}).show();
}


//初始化函数
function initFrame(userName) {
	//头部信息
	var Panel_header = Ext.create('Ext.panel.Panel', {
		region : 'north',
		height:76,
		html:"<div style='width:100%;height:76px;position:relative;'> 	<img src='workplace/image/Header_1024_100.png' width='100%' height='100%' /> 	<div style='position:absolute;left:80%;top:20px;z-index:999;color:red;'> 		<div>"+userName+"，欢迎您！ <span id='time'></span></div> 		<div style='margin-top:5px;text-align:right'><a href='javascript:;' onclick=\" mkWindow('修改密码',[modifyUserPwd()]);\">修改密码</a>&nbsp;&nbsp;<a href='logout.action'>退出</a></div> 	</div> </div>"
	});
	//左边栏
	var Panel_left=Ext.create('Ext.panel.Panel',
	{
		region : 'west',
		width : 150,
		split:true,
		title:'系统导航',
		layout:'accordion',
		collapsible:true,
		listeners:{
			render:function(component,eOpts){
				leftMenuInfo(userName,component);
			}
		}
	});
	
	//右边内容区域
	var centerPanel = Ext.create("Ext.tab.Panel", {
		plain: true,
		region : 'center',
		id : 'mainCont',
		layout : 'border',
		bodyStyle : {
			background : 'transparent'
		}
		});
	//底部版权信息
	var Panel_foot = Ext.create('Ext.panel.Panel', {
		region : 'south',
		height:30
		,html:"<div style='width:100%;height:100%;text-align:center;line-height:30px'>&copy;OEMP&nbsp;&nbsp;&nbsp;<a href=#>联系我们</a></div>"
		});
	Ext.create('Ext.container.Viewport', {
		renderTo : Ext.getBody(),
		layout : 'border',
		collapsed : false,
		items : [Panel_header,Panel_left, centerPanel,Panel_foot]
	});
	waitLoadMask = new Ext.LoadMask(Ext.getBody(), {
		msg : "加载中，请稍后..."});
		waitLoadMask.show();
	Ext.Ajax.request({
		url : 'user_detail.action',
		success : function(resp) {
			centerPanel.add(eval(resp.responseText));
			centerPanel.setActiveTab(0);
			waitLoadMask.hide();
			//遍历treeStore、获取历史记录
			var leftItems=Panel_left.items;
			for(var i=0;i<leftItems.length;i++){
				var obj=leftItems.getAt(i);
	            //loadHistoryTreeStore(obj,userName);
			}
		}
	});
	setInterval("getNowTime()",1000);

}
//历史记录
function loadHistoryTreeStore(treeObj,userName){
	//数据是否在加载中
	function storeIsLoading(){
		if(treeObj.getStore().isLoading())
		{
			window.setTimeout(function(){storeIsLoading();},200);
		}else{
			//已经加载完毕
			loadHistory();
		}
	}
	//判断数据是否在加载中，加载完毕调用加载历史数据
	storeIsLoading();
	//加载缓存信息
	function loadHistory(){
		var arrLocalStorage=window.localStorage? localStorage.getItem(userName+"saveCacheData"): Cookie.read(userName+"saveCacheData");
		if(null!=arrLocalStorage)
		{
			//获取数组
			var nowUserData=Ext.decode(arrLocalStorage);
			if(nowUserData.data.length>0)
			{
				//当前用户
				if(nowUserData.userName==userName){
					//展开树,获取树信息
					treeObj.getStore().getRootNode().eachChild(function(child){
						if(child.get('children').length>0)
						{
							Ext.Array.each(child.get('children'),function(obj){
								obj.id=obj.cmpId;
							});
						}
					});
					//记录总行数
					var cacheRows=nowUserData.data.length;
					//当前行
					var nowRow=0;
					//历史记录
					function historyRecord(){
						if(nowRow<cacheRows)
						{
							var nowRecord=nowUserData.data[nowRow];
							//获取当前节点
							var thisNode=treeObj.getStore().getNodeById(nowRecord.cmpId);
							treeObj.selectPath(thisNode.getPath());
							mkTabMain('mainCont', nowRecord.text, nowRecord.url, userName);
							nowRow++;
							window.setTimeout(function(){
									historyRecord();
								},2000);
						}
					}
					//添加记录到面板
					historyRecord();
				}
			}
		}
	}
}
// 左侧主界面菜单
function mkFuncMenuTree(userName,panel,url) {
	Ext.define('funcMenuModel', {
		extend : 'Ext.data.Model',
		fields : [{name : 'cmpId',type : 'int'},'text','children', 'url', 'tag', 'icon',{name:'id',mapping:'cmpId'},'pId'],// text 必须的 否则得设置,
		proxy : {
			type : 'ajax',
			url : 'lefttree_getSysTree.action'
		}
	});
	var funcTreeStore = Ext.create('Ext.data.TreeStore', {
		model : 'funcMenuModel',
		root : {
			text : '',
			expanded : true
		}
	});
	var tr= Ext.create("Ext.tree.Panel", {
		animate : true,
		heard:false,
		width : 150,
		height: '100%',
		rootVisible : false,
		store : funcTreeStore,
		tools : [{
		type : 'refresh',
		handler : function() {
			var tree = this.up('treepanel');
			tree.getStore().load();
		}
		}],
		listeners : {
			itemclick : function(me, rec, item, index, e, eOpts) {
				//用户下的数组
				var saveCacheUserData={
						cmpId:rec.get('cmpId'),
						text:rec.get('text'),
						children:rec.get('children')==''?[]:rec.get('children'),
						url:rec.get('url'), 
						tag:rec.get('tag'), 
						icon:rec.get('icon')
					};
				//本地存储对象
				var saveData ={userName:userName,data:[saveCacheUserData]};
				var arrLocalStorage=window.localStorage? localStorage.getItem(userName+"saveCacheData"): Cookie.read(userName+"saveCacheData");
				if(null==arrLocalStorage || 0==arrLocalStorage.length)
				{
					saveData= Ext.encode(saveData);
					arrLocalStorage=saveData;
				}
				//不存在
				var isExists=false;
				//获取数组
				var nowUserData=Ext.decode(arrLocalStorage);
				Ext.Array.each(nowUserData.data,function(cacheRec){
					if((cacheRec.cmpId==rec.get('cmpId')) && nowUserData.userName==userName)
					{
						isExists=true;
					}
				});
				//不存在就添加
				if(!isExists && rec.get('cmpId')!=0)
				{
					nowUserData.data.push(saveCacheUserData);
					arrLocalStorage=Ext.encode(nowUserData);
				}
				//存储，IE6~7 cookie 其他浏览器HTML5本地存储
				if (window.localStorage) {
				    localStorage.setItem(userName+"saveCacheData", arrLocalStorage);
				} else {
				    Cookie.write(userName+"saveCacheData", arrLocalStorage);
				}
				//加载缓存后开始显示信息
				mkTabMain('mainCont', rec.get('text'), rec.get('url'), rec.get('icon') ,userName);
			}
		}
	});
	return tr;
}

//生成左边导航带弹出信息
function leftMenuInfo(userName,panel){
	Ext.define('rootMenuModel', {
		extend : 'Ext.data.Model',
		fields : [{name : 'cmpId',type : 'int'},'text', 'url', 'tag', 'icon',{name:'id',mapping:'cmpId'},'pId']// text 必须的 否则得设置,
	});
	var rootMenuStore = Ext.create('Ext.data.Store', {
		model : 'rootMenuModel',
		proxy : {
			type : 'ajax',
			url : 'lefttree_getSysTreeByCmmId.action',
			extraParams:{cmpId:0}
		}
	});
	rootMenuStore.load();
	//数据是否在加载中
	function rootMenuIsLoading(){
		if(rootMenuStore.isLoading())
		{
			window.setTimeout(function(){rootMenuIsLoading();},200);
		}else{
			rootMenuStore.each(function(item){
				var leftPopPanel=Ext.create('Ext.tree.Panel',
				{
					title:item.get('text'),
					animate : true,
					width : 150,
					height: '100%',
					rootVisible : false,
					store :diffSyncStore(item.get('cmpId'),'lefttree_getSysTreeByCmmId.action'),
					tools : [{
						type : 'refresh',
						handler : function(event, toolEl, panel) {
							var treePanel=this.up('treepanel');
							var treeStore =treePanel.getStore();
							var selFreshNode=treePanel.getSelectionModel().getSelection();
							treePanel.getRootNode().removeAll();
							treeStore.load();
						}
					}],
					listeners : {
						beforeitemexpand : function(nodeInterface, eOpts) {
						},
						itemclick : function(me, rec, item, index, e, eOpts) {
							//获取当前节点
							var thisNode=leftPopPanel.getStore().getNodeById(rec.get('id'));
							//是否是叶子节点
							if(!thisNode.isLeaf()){
								thisNode.expand();
							}
							//用户下的数组
							var saveCacheUserData={
									pId:rec.get('pId'),
									id:rec.get('cmpId'),
									cmpId:rec.get('cmpId'),
									text:rec.get('text'),
									children:rec.get('children')==''?[]:rec.get('children'),
									url:rec.get('url'), 
									tag:rec.get('tag'), 
									icon:rec.get('icon')
								};
							//本地存储对象
							var saveData ={userName:userName,data:[saveCacheUserData]};
							var arrLocalStorage=window.localStorage? localStorage.getItem(userName+"saveCacheData"): Cookie.read(userName+"saveCacheData");
							if(null==arrLocalStorage || 0==arrLocalStorage.length)
							{
								saveData= Ext.encode(saveData);
								arrLocalStorage=saveData;
							}
							//不存在
							var isExists=false;
							//获取数组
							var nowUserData=Ext.decode(arrLocalStorage);
							Ext.Array.each(nowUserData.data,function(cacheRec){
								if((cacheRec.cmpId==rec.get('cmpId')) && nowUserData.userName==userName)
								{
									isExists=true;
								}
							});
							//不存在就添加
							if(!isExists && rec.get('cmpId')!=0)
							{
								nowUserData.data.push(saveCacheUserData);
								arrLocalStorage=Ext.encode(nowUserData);
							}
							//存储，IE6~7 cookie 其他浏览器HTML5本地存储
							if (window.localStorage) {
							    localStorage.setItem(userName+"saveCacheData", arrLocalStorage);
							} else {
							    Cookie.write(userName+"saveCacheData", arrLocalStorage);
							}
							//加载缓存后开始显示信息
							mkTabMain('mainCont', rec.get('text'), rec.get('url'),userName);
						}
					}
				});
				panel.add(leftPopPanel);
			});
			
		}
	}
	//判断数据是否在加载中，加载完毕调用加载历史数据
	rootMenuIsLoading();
}


//获取动态sotre
function diffSyncStore(cmpId,url){
	Ext.define('funcMenuModel', {
		extend : 'Ext.data.Model',
		fields : [{name : 'cmpId',type : 'int'},'text','children', 'url', 'tag', 'icon',{name:'id',mapping:'cmpId'},'pId']// text 必须的 否则得设置,
	});
	var funcTreeStore = Ext.create('Ext.data.TreeStore', {
		model : 'funcMenuModel',
		nodeParam:'cmpId',
		root : {
			text : '',
			expanded : true,
			id:cmpId
		},
		proxy : {
			type : 'ajax',
			url : url
		}
	});
	return funcTreeStore;
}


var waitLoadMask = null;
// tab
// 主界面id 为mainCont
function mkTabMain(id, title, url ,userName) {
	if ("#" === url || ""===url)
			return;
	id = ('' === id ? 'mainCont' : id);
	var modelPanel = Ext.getCmp(id);
	var text = title;
	var f = false;
	if (null != waitLoadMask)
		waitLoadMask.hide();
	waitLoadMask.show();
	modelPanel.items.each(function(name, index, countriesItSelf) {
		if (this.title && (this.title==text)) {
			/*this.up().setActiveTab(this.id);
			f = true;
			waitLoadMask.hide();
			return;*/
			this.up().remove(this.id);
		}
	});
	if (!f) {
		Ext.Ajax.request({
			type: 'ajax',
	        url : 'islogin.action',
	        method : 'POST',
	        success : function(response, opts) {
				 var retData = response.responseText;
				 if(retData.indexOf("true")>-1){
				 	true ? Ext.Ajax.request({
						url : url,
						success : function(resp) {
							var addPanel=eval(resp.responseText);
							addPanel.title=title;
							/*//头部头标--
							var cssName=addPanel.id;
							deveCss(cssName,icon);
							addPanel.setIconCls(cssName);
							//---创建样式
*/							modelPanel.add(addPanel);
							modelPanel.setActiveTab(modelPanel.items.getCount() - 1);
							//为panel的关闭事件操作，清除本地信息存储记录
							addPanel.addListener('beforeclose',function(component,eOpts){
								var addPanelTitle=component.title;
								var arrLocalStorage = window.localStorage? localStorage.getItem(userName+"saveCacheData"): Cookie.read(userName+"saveCacheData");	
								if(arrLocalStorage==null)
								return;
								//获取缓存数据
								var nowUserData=Ext.decode(arrLocalStorage);
								//获取缓存的数组
								var cacheArr=nowUserData.data;
								for(var i=0;i<cacheArr.length;i++)
								{
									var cacheRec=cacheArr[i];
									if(nowUserData.userName==userName && (cacheRec.text==addPanelTitle))
									{
										nowUserData.data.splice(i,1);
									}
								}
								arrLocalStorage=Ext.encode(nowUserData);
								if (window.localStorage) {
								    localStorage.setItem(userName+"saveCacheData", arrLocalStorage);
								} else {
								    Cookie.write(userName+"saveCacheData", arrLocalStorage);
								}
							});
							waitLoadMask.hide();
						}
					}) : modelPanel.add(Ext.create('Ext.panel.Panel', {
						title : title,
						html : ' ' + title + '<br/><br/>',
						closable : true,
						frame : true,
						bodyPadding : 0,
						loader : {
							url : url,
							loadMask : true,
							failture : function(me, resp, opts) {
								Ext.Msg.alert('Load jsp failture !');
							},
							scripts : true,
							autoLoad : true
						}
					}));
					modelPanel.setActiveTab(modelPanel.items.getCount() - 1);
				}else{
					waitLoadMask.hide();
				 	Ext.Msg.alert('提示', '登录失效', function(){
					    location.href = "login.jsp";
					});
				 }
			},
			failure : function(response, opts) {
				waitLoadMask.hide();
				Ext.Msg.alert("提示","加截失败...");
			}
		});
	}
	
}

//处理请求数据的success以及failure公用方法
function funSuccess(response,opts,win,grid)
{
	Ext.Msg.alert('提示','操作成功');
	win.close();
	grid.getStore().load();
}
function funFailure(response,opts)
{
		Ext.Msg.alert('提示','操作失败');
}
/*下拉框return的值,fromStore:来源，value查找的值,searchfield:查找的Model字段名称,returnField:返回的Model字段名称*/
function getTextByStore(fromStore,value,searchfield,returnField){
	fromStore.each(function(obj){
		if(obj.get(searchfield)==value)
		{
			value= obj.get(returnField);
		}
	});
	return value;
}
//用户登录
function showLoginWin(formPanle){
	return Ext.create('Ext.window.Window', {
		title: '用户登录',
		constrain:true,
		//border:false,
		bodyStyle:{background:'transparent',overflow:true},
		closable:false,
		constrainHeader:true,
		modal:true,
		height:160,
		width:280,
		minWidth: 280,
        minHeight: 160,
        maxWidth: 280,
        maxHeight: 160,
		items:formPanle,
		fbar:[{text:'登录',margin:'0 0 0 0',
				listeners:{
					render:function(){  
					var form = formPanle.down('form').getForm();
					var win=this.up('window');
			       	new Ext.KeyMap(win.getEl(), [{    
			          key: 13,    
			          fn: function () {  
			             	submitLogin(form,win);
			          }        
			        }]);    
			     } 
            	},
				handler:function(){
				var form = formPanle.down('form').getForm();
				var win=this.up('window');
				submitLogin(form,win);
			}
		}]
	}).show();
}
//提交登录
function submitLogin(form,win){
		/**Ext.Ajax.request({
			url : 'login/login.jsp',
			success : function(resp) {
				var loginWin=eval(resp.responseText);
				showLoginWin(loginWin);
			}
		});*/
	if(form.isValid()){
		form.submit({
			url : 'login.action',
			method : 'POST',
			waitMsg : '登录中...',
			waitTitle :' ',
			async:false,
			success : function(resp, action) {
				var currentUser = action.result.resoultMsg;
				initFrame(currentUser);
				win.close()
			},
			failure : function(resp, action) {
				form.reset();
				Ext.getCmp('VerificationCode').setSrc('login/VerificationCode.jsp');//verifyCode.action
				Ext.Msg.alert('提示',action.result.resoultMsg);
			}
		});
	}
}
//动态生成样式
function deveCss(cssName,iconUrl){
	var cssStr = "."+cssName+"{background: url('"+iconUrl+"'); width:16px; height:16px;}";
	var style = document.createElement("style");
	style.setAttribute('type', 'text/css');
	if (style.styleSheet) { // IE
		style.styleSheet.cssText = cssStr;
	}
	else { // w3c
		style.appendChild(document.createTextNode(cssStr));
	}
}

function getNowTime(){
    //if(window.XMLHttpRequest){
    //取得当前时间   
    var now= new Date();
    
    var year=now.getYear();   
      if(year<2000){
        year += 1900;
    } 
    var month=addz(now.getMonth()+1);   
    var day=addz(now.getDate());   
    var hour=addz(now.getHours());   
    var minute=addz(now.getMinutes());   
    var second=addz(now.getSeconds());   
    var nowdate=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;   
    document.getElementById("time").innerHTML = nowdate; 
    //} 
}
function addz(val){
    val = val + "";
   
    if(val.length<2){
        return "0"+val;
    }
    return val;
}
//选择资源树数据
function mkSelResourceTree(fn){
		Ext.define('resourceOptionModel', {
			extend : 'Ext.data.Model',
			fields : ['cmrId','text',{name:'id',mapping:'cmrId'},'cmrParentId',"fileRealName"]// text 必须的 否则得设置,
		});
		var resourceOptionTreeStore = Ext.create('Ext.data.TreeStore', {
			model : 'resourceOptionModel',
			nodeParam:'cmrId',
			root : {
				text : '所有资源',
				expanded : true,
				id:0,
				leaf:false
			},
			proxy : {
				type : 'ajax',
				url : "resource_optionResourceTreeById.action"
			}
		});
		//获取菜单树
		var resourceTreePanel=Ext.create('Ext.tree.Panel',
		{
			heard:false,
			animate : true,
			width : 300,
			height : 500,
			//resizable : true,
			useArrows : true,
			store :resourceOptionTreeStore,
			fbar : [{
				text : '确定',
				handler : function(me) {
					var tree=me.up('treepanel');
					var recs=tree.getSelectionModel().getSelection();
					if(recs.length==1)
					{
						//获取当前节点
						var thisNode=recs[0]; 
						if(thisNode.isLeaf()){
							var path=getRealPath(thisNode.getPath());
							thisNode.set("fileRealName",path);
							fn(thisNode);
							me.up('window').close();
						}
					}
				}
			}, {
				text : '取消',
				handler : function() {
					this.up('window').close();
				}
			}],
			listeners : {
				itemclick : function(me, rec, item, index, e, eOpts) {
					//获取当前节点
					var thisNode=me.getSelectionModel().getSelection()[0]; 
					//是否是叶子节点
					if(!thisNode.isRoot() && !thisNode.isLeaf()){
						if(!thisNode.isExpanded())
						{
							thisNode.expand();
						}
					}
				},
				itemdblclick:function(me, rec, item, index, e, eOpts){
					if(rec.get('leaf')){//单选
						//获取当前节点
						var thisNode=me.getSelectionModel().getSelection()[0]; 
						var path=getRealPath(thisNode.getPath());
						thisNode.set("fileRealName",path);
						fn(thisNode);
						me.up('window').close();
					}
				}
			
			}
		});
		function getRealPath(nodePath){
			var servicePath="uploadfiles/";
			//将“/0/”截取掉
			nodePath=nodePath.substring(3);
			var fullPath=nodePath.split("/");
			for(var i=0;i<fullPath.length-1;i++){
				var node=resourceTreePanel.getStore().getNodeById(fullPath[i]);
					servicePath+=node.raw.fileRealName+"/";
			}
			var node=resourceTreePanel.getStore().getNodeById(fullPath[fullPath.length-1])
			servicePath+=node.raw.fileRealName;
			return servicePath;
		}
		return resourceTreePanel;
	}
//弹出HTML编辑器
function htmlEditor(butItems,textareaName){
	//文本编辑器
	 var editor= KindEditor.create("textarea[name=\""+textareaName+"\"]", {
        cssPath: 'kindeditor/plugins/code/prettify.css',
        uploadJson: 'upload_addImg.action',
        fileManagerJson: 'showimg_showContentImages.action',
        allowFileManager: true,
        allowFileUpload: true,
        items:butItems,
        minWidth:400,
        pasteType : 2
    });
    return editor;
}


var checkboxStore;
function checkOption(elName,el){
	var HTMLA="<div id='right_div_"+elName+"'>";
	var VIEWA="<input type='checkbox' id='checkboxVIEW"+elName+"' name='checkbox"+elName+"' value='VIEW'  onchange='checkOption("+elName+",this)' ";
	var VIEWB="/><label>查看</label>"
	var ADDA="<input type='checkbox' id='checkboxADD"+elName+"' name='checkbox"+elName+"' value='ADD'onchange='checkOption("+elName+",this)' ";
	var ADDB="/><label>新增</label>";
	var MODA="<input type='checkbox' id='checkboxMOD"+elName+"' name='checkbox"+elName+"' value='MOD' onchange='checkOption("+elName+",this)' ";
	var MODB="/><label>修改</label>";
	var DELA="<input type='checkbox' id='checkboxDEL"+elName+"' name='checkbox"+elName+"' value='DEL' onchange='checkOption("+elName+",this)' ";
	var DELB="/><label>删除</label>";
	var ALLA="<input type='checkbox' id='checkboxALL"+elName+"' name='checkbox"+elName+"' value='ALL'  onchange='checkOption("+elName+",this)' ";
	var ALLB="/><label>全部</label>";
	var HTMLB="</div>";
	var checkboxALL=Ext.getDom("checkboxALL"+elName).checked;
	var els=document.getElementsByName("checkbox"+elName);
	if(el.value=="ALL"){
		if(checkboxALL){
			Ext.Array.each(els,function(el){
				Ext.getDom(el).checked=true;
				VIEWA+="checked=true";
				ADDA+="checked=true";
				MODA+="checked=true";
				DELA+="checked=true";
				ALLA+="checked=true";
			});
		}else{
			Ext.Array.each(els,function(el){
				Ext.getDom(el).checked=false;
			});
			
		}
	}else{
		var checkboxVIEW=Ext.getDom("checkboxVIEW"+elName).checked;
		var checkboxADD=Ext.getDom("checkboxADD"+elName).checked;
		var checkboxMOD=Ext.getDom("checkboxMOD"+elName).checked;
		var checkboxDEL=Ext.getDom("checkboxDEL"+elName).checked;
		if(checkboxVIEW){
		VIEWA+="checked=true";
		}
		if(checkboxADD){
			ADDA+="checked=true";
		}
		if(checkboxMOD){
			MODA+="checked=true";
		}
		if(checkboxDEL){
			DELA+="checked=true";
		}
		if(checkboxVIEW && checkboxADD && checkboxMOD && checkboxDEL){
			ALLA+="checked=true";
			checkboxALL=true;
		}else{
			checkboxALL=false;
		}
	}
	var html=HTMLA+VIEWA+VIEWB+ADDA+ADDB+MODA+MODB+DELA+DELB+ALLA+ALLB+HTMLB;
	checkboxStore.getNodeById(elName).set('rights',html);
	Ext.Array.each(checkboxStore.getUpdatedRecords(),function(item){
		//去掉小红点
		item.commit();
	});
	
}







var allImgExt=".jpg|.jpeg|.gif|.bmp|.png|.swf|"//全部图片格式类型 
var allFileExt=".doc|.docx|.wps|.txt|.xls|.xlsx|.csv|.ppt|.pptx|.pdf|"//全部文件

/**公用model*/
Ext.define('commonModel',{
		extend: 'Ext.data.Model',
	    fields: [
	        {name: 'value'},
	        {name: 'text'}
	    ]
	});








