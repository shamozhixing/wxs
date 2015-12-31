//验证手机
function validationPhone(mobile){
	var phoneTest=/^1[3458]\d{9}$/;
	var isPhone=phoneTest.test(mobile);
	if(!isPhone)
	{
		return false;
	}
	return true;
}
//密码
function validationPwd(pwd){
	var pwdTest=/^[a-zA-Z\d]{6,16}$/;
	var isPwd=pwdTest.test(pwd);
	if(!isPwd)
	{
		return false;
	}
	return true;
}
//验证邮箱正则
function validationEmail(email){
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(!reg.test(email)){
		return false;
	}
	return true;
}
//验证邮政编码
 function isZipCode(value){
		 var zipTest = /^[0-9]\d{5}$/; 
		 var checkVal=zipTest.test(value);
		return checkVal; 
	}
//验证身份证号
 function isCcCode(value){
		 var CodeTest = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/; 
		 var checkVal=CodeTest.test(value);
		return checkVal; 
	}
	/**是否是空*/
function isEmpty(obj){
	if(!obj || obj=="" || obj==null){
		return true;
	}
	return false;
}
//当数据为空时不验证
function emptyVaila(el){return isEmpty($(el).val());}

/**验证省份证*/
function vailIsIdCard(code) {
		try {
			code=code+"";
			var xishu=[7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];
			var c=[];
			for(var i=0;i<code.length;i++){
				c.push(code.substr(i,1))
			}
			var total=0;
			if(c.length!=18){
				return false;
			}
			for (var i = 0; i < 17; i++) {
				var num=0;
				if("X"==c[i]){
					num=10;
				}else{
					num=parseInt(c[i]+"");
				}
				switch (i) {
				case 0:
					total+=num*xishu[0];
					break;
				case 1:
					total+=num*xishu[1];
					break;
				case 2:
					total+=num*xishu[2];
					break;
				case 3:
					total+=num*xishu[3];
					break;
				case 4:
					total+=num*xishu[4];
					break;
				case 5:
					total+=num*xishu[5];
					break;
				case 6:
					total+=num*xishu[6];
					break;
				case 7:
					total+=num*xishu[7];
					break;
				case 8:
					total+=num*xishu[8];
					break;
				case 9:
					total+=num*xishu[9];
					break;
				case 10:
					total+=num*xishu[10];
					break;
				case 11:
					total+=num*xishu[11];
					break;
				case 12:
					total+=num*xishu[12];
					break;
				case 13:
					total+=num*xishu[13];
					break;
				case 14:
					total+=num*xishu[14];
					break;
				case 15:
					total+=num*xishu[15];
					break;
				case 16:
					total+=num*xishu[16];
					break;
				}
			}
			var yushu= total%11;
			
			var duiyingshu=[1,0,10,9,8,7,6,5,4,3,2];//10==X
			var weishu=-1;
			for (var i = 0; i < duiyingshu.length; i++) {
				if(yushu==duiyingshu[i]){
					weishu=i;
				}
			}
			var str="";
			if(weishu==10){
				str="X";
			}else{
				str=weishu+"";
			}
			if(str==code.substr(code.length-1).toUpperCase()){
				return true;
			}
		} catch (e) {
			return false;
		}
		return false;
	}

