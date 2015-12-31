var xhr;
var refreshDiv;
var citydiv;
var dealerdiv;
function Message(){
	this.xhr = createXHR();
}
//省份对应城市
Message.prototype.sendMessage = function(url,rehreshDivId){
	 this.xhr.open('get',url);
	 refreshDiv=rehreshDivId;
	 xhr = this.xhr;
	 this.xhr.onreadystatechange=this.stateChange;
	  refreshDiv=rehreshDivId;
	 this.xhr.send(null);
}
Message.prototype.stateChange = function(){
  if(xhr.readyState==4){
  	if(xhr.status==200){
			       fillcity(xhr.responseText);
			  }
  	}else{
			      delcity(refreshDiv);	
    }
}
function fillcity(xmldoc){	
		var citylist =  xmldoc.split("#");	
		addcity("","请选择",refreshDiv);
		for(var i=0;i<citylist.length;i++){
		if(citylist[i]){
			var city=citylist[i].split(",");	
		    addcity(trim(city[0]),city[1],refreshDiv);
		}
	}
}

//去左空格;
function ltrim(s){
return s.replace( /^\s*/, "");
}
//去右空格;
function rtrim(s){
return s.replace( /\s*$/, "");
}
//左右空格;
function trim(s){
return rtrim(ltrim(s));
}
//经销商对应省份
Message.prototype.sendDealerProvinceMessage = function(url,rehreshDivId){
	 this.xhr.open('get',url);
	 refreshDiv=rehreshDivId;
	 xhr = this.xhr;
	 this.xhr.onreadystatechange=this.stateDealerProvinceChange;
	  refreshDiv=rehreshDivId;
	 this.xhr.send(null);
}
Message.prototype.stateDealerProvinceChange = function(){
  if(xhr.readyState==4){
  	if(xhr.status==200){  		
			       fillprovince(xhr.responseText);
			  }
  	}else{
			       delcity(refreshDiv);	
			  }
}
function fillprovince(xmldoc){	
		var citylist =  xmldoc.split("#");	
		addcity("","省",refreshDiv);
		for(var i=0;i<citylist.length;i++){
		if(citylist[i]){
			var city=citylist[i].split(",");	
		    addcity(city[0],city[1],refreshDiv);
		}
	}
}
//经销商对应城市
Message.prototype.sendDMessage = function(url,cidydivId,dealerdivid){
	this.xhr.open('get',url);
	citydiv = cidydivId;
	dealerdiv=dealerdivid;
	xhr = this.xhr;
	this.xhr.onreadystatechange=this.stateDChange;
	citydiv = cidydivId;
	dealerdiv=dealerdivid;
	this.xhr.send(null);
}
Message.prototype.stateDChange = function(){
 if(xhr.readyState==4){
  	if(xhr.status==200){  		
			       fillDcity(xhr.responseText);
			  }
  	}else{
			       delcity(citydiv);

			  }
}
function fillDcity(textdoc){
	if(textdoc!=""){
	var citylist =  textdoc.split("#");	    
		 addcity("","市",citydiv);
		for(var i=0;i<citylist.length;i++){
			if(citylist[i]){
				var city=citylist[i].split(",");	
			    addcity(city[0],city[1],citydiv);
			}
	  }
	}
}
//经销商
Message.prototype.sendDealerMessage = function(url,rehreshDivId){
	 this.xhr.open('get',url);
	 refreshDiv=rehreshDivId;
	 xhr = this.xhr;
	 this.xhr.onreadystatechange=this.stateDealerChange;
	  refreshDiv=rehreshDivId;
	 this.xhr.send(null);
}
Message.prototype.stateDealerChange = function(){
  if(xhr.readyState==4){
  	if(xhr.status==200){  		
			       filldealar(xhr.responseText);
			  }
  	}else{
			       delcity(refreshDiv);	
	}
}
function filldealar(xmldoc){
		var citylist =  xmldoc.split("#");	
		addcity("","经销商名称",refreshDiv);
		for(var i=0;i<citylist.length;i++){
		if(citylist[i]){
			var city=citylist[i].split(",");	
		    addcity(city[0],city[1],refreshDiv);
		}
	}
}

 function addcity(id,name,params){
	  var option = document.createElement("OPTION");
        option.text=name;
        option.value=id;
        params.add(option);
}

function delcity(params){
	var obj=params;
	for(var i=0;i<obj.options.length;i++){	
			obj.options.remove(i);
	}
}

//计算器
Message.prototype.sendComputer = function(url){
	 this.xhr.open('get',url);
	 xhr = this.xhr;
	 this.xhr.onreadystatechange=this.stateComputerChange;
	 this.xhr.send(null);
}
Message.prototype.stateComputerChange = function(){
  if(xhr.readyState==4){
  		if(xhr.status==200){
			var moneylist =  xhr.responseText.split("#");
			//alert(xhr.responseText);
			document.getElementById("firstpay").value = moneylist[1];
			document.getElementById("creditpay").value = moneylist[2];
			document.getElementById("monthpay").value = moneylist[3];	
			//if(trim(moneylist[0])=="2"){
				document.getElementById("endpay").value = moneylist[4];
			//}
		}
  	}
}

function createXHR(){
	var xhr =false;
	if(window.XMLHttpRequest){
		xhr = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		try{
			xhr = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e1){
			try{
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				alert(e2);
			}
			
		}
	}
	return xhr;
}

