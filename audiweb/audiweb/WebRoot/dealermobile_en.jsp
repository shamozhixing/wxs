<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/validate.js"></script>
<div id='popup_login'></div>
<div class='fs_mid'>
	<div class='fs_fs' id="fs_fs">
		<p class='fs_title'>Send the dealer's information to your mobile phone</p>
		<table>
			<tr>
				<td><span class='word_apacing30'>Name :</span></td>
				<td><input type='text' name='name' id="dealer_name_en" onblur="validFocusdname(this.id);"/></td>
				<td style="padding-left:10px"><span class="wrong" id="dealer_name_wrong_en" style="display:none"></span>
				</td>
			</tr>
			<tr>
				<td style='word-spacing:6px'>Mobile No. :</td>
				<td><input type='text' name='mobile' id="dealer_mobile_en" onblur="validFocusdmobile(this.id);"/></td>
				<td style="padding-left:10px"><span class="wrong" id="dealer_mobile_wrong_en" style="display:none"></span>
				</td>
			</tr>
		</table>
		<p class='fsnow engsh' onclick="send();"></p>
	</div>
	<div class='fs_cg' id="fs_cg">
		<p class='fs_title' style='margin-bottom:27px'>Send the dealer's information to your mobile phone</p>
		<p>Already sent,if you have not received the information in 60 seconds,Please click <br> "Sent again".</p>
		
		<p style='margin-top:20px'><span style='font-size:30px'id="time">60</span>s</p>
		<p class='zfs engfh' id="chongfa" style="display:none" onclick="send();"></p>
	</div>
	<p class='popup_delete'></p> 
</div>
<script type="text/javascript">
	var senddealerid = 0;
	var wrongBackground="url('images/baocuo.jpg')";//英文版的背景图片被屏蔽了，需要重新加载
	function send() {
	if(senddealerid>0){
		var name = $("#dealer_name_en").val();
		var mobile = $("#dealer_mobile_en").val();
		if(name==""){
			$("#dealer_name_wrong_en").text("Please fill your name in the form field");
			$("#dealer_name_wrong_en").css("background-image",wrongBackground);
			$("#dealer_name_wrong_en").show();
			return false;
		}
		$("#dealer_name_wrong_en").hide();
		if(mobile==""){
			$("#dealer_mobile_wrong_en").text("Please fill your mobile number correctly");
			$("#dealer_mobile_wrong_en").css("background-image",wrongBackground);
			$("#dealer_mobile_wrong_en").show();
			return false;
		}
		var reg = /^1\d{10}$/;
		if(!reg.test(mobile)){
			$("#dealer_mobile_wrong_en").text("Mobile phone number should be 11 digits");
			$("#dealer_mobile_wrong_en").css("background-image",wrongBackground);
			$("#dealer_mobile_wrong_en").show();
			return false;
		}
		$("#dealer_mobile_wrong_en").hide();
		
		$.post('dealer_send.action?en=1','id='+senddealerid+'&name=' + name + '&mobile='+mobile,function(data) {
			
			//$("#time").text(60);
			$("#chongfa").show();
			$("#fs_fs").hide();
			$("#fs_cg").show();
			setTimeout("timedao()", 1000);
			
			
		});
		}
	}
	var time = 60;
	function timedao() {
		if(time>0) {
			$("#time").text(time=time-1);
			setTimeout("timedao()", 1000);
		} else {
			time = 60;
			//$("#chongfa").show();
		}
	}
	
	function opensenddealer(id){
		senddealerid = id;
		$('.fs_mid').show().animate({'top':'93px'},500);
		$('body,html').animate({scrollTop:0},100);
		$('#popup_login').css({
			height:function(){						
				var oHeight = $(".xiugai_mid").height();
				windowHeight = iDoc > windowHeight? iDoc:windowHeight;
				oHeight = windowHeight > oHeight? windowHeight:oHeight;
				return oHeight;
			}
		}).fadeTo(300,0.5);
		$('.fs_mid>div').eq(0).show().siblings('div').hide();
	}

	//获取焦点的时候去掉校验 姓名
	function validFocusdname(id){
		var isWrong=false;
		var cdName=$("#"+id).val();
		//用户名
		if(cdName==""){
			$("#dealer_name_wrong_en").text("Please fill your name in the form field");
			$("#dealer_name_wrong_en").css("background-image",wrongBackground);
			$("#dealer_name_wrong_en").show();
			
			isWrong=true;
		}else{
			$("#dealer_name_wrong_en").hide();
		}
	}

	//获取焦点的时候去掉校验 手机号码
	function validFocusdmobile(id){
		var isWrong=false;
		var dMobile=$("#"+id).val();
		//用户名
		if(dMobile==""){
			$("#dealer_mobile_wrong_en").text("Please fill your mobile number ");
			$("#dealer_mobile_wrong_en").css("background-image",wrongBackground);
			$("#dealer_mobile_wrong_en").show();
			
			isWrong=true;
		}else {
			if(!validationPhone(dMobile)){
				$("#dealer_mobile_wrong_en").text("Please fill your mobile number correctly");
				$("#dealer_mobile_wrong_en").show();
			}else {
				$("#dealer_mobile_wrong_en").hide();
			}
		}
	}
</script>