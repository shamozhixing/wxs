function setDay(yearId,monthId,dayId){
		var year=document.getElementById(yearId).value;
		var month=document.getElementById(monthId).value;
		 
		var day=30;
		//验证是否为闰年
		if(year % 400 == 0 ||(year%4==0&& year % 100 !=0) ){
			switch(month){
				case '1':
				case '3':
				case '5':
				case '7':
				case '8':
				case '10':
				case '12': day=31;
				break;
				case '2': day=29;
				break;
			}
		}else{
			switch(month){
				case '1':
				case '3':
				case '5':
				case '7':
				case '8':
				case '10':
				case '12': day=31;
				break;
				case '2': day=28;
				break;
			}
		}
		var daySel=document.getElementById(dayId);
		//拔下拉列表中的信息清空
		daySel.options.length=0;
		daySel.options[0]=new Option("请选择","")
		//向下拉列表中赋新值
		for(var i=1;i<=day;i++){	
			daySel.options[i]=new Option(i,i)
		}
}