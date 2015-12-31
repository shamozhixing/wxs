<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/validate.js"></script>
<div id='popup_login'></div>
<div class='fs_mid'>
	<div class='fs_fs' id="fs_fs">
		<p class='fs_title'>将经销商信息发送到手机</p>
		<table>
			<tr>
				<td><span class='word_apacing19'>姓 名：</span></td>
				<td><input type='text' name='name' id="dealer_name" onblur="validFocusdname(this.id);"/></td>
				<td style="padding-left:10px"><span class="wrong" id="dealer_name_wrong" style="display:none"></span>
				</td>
			</tr>
			<tr>
				<td>手机号码：</td>
				<td><input type='text' name='mobile' id="dealer_mobile" onblur="validFocusdmobile(this.id);"/></td>
				<td style="padding-left:10px"><span class="wrong" id="dealer_mobile_wrong" style="display:none"></span>
				</td>
			</tr>
		</table>
		<p class='fsnow' onclick="send();"></p>
	</div>
	<div class='fs_cg' id="fs_cg">
		<p class='fs_title'>将经销商信息发送到手机</p>
		<p>已发送，如在60秒内未收到，请点击“再次发送”。</p>
		<p style='margin-top:20px'><span style='font-size:30px' id="time">60</span>秒</p>
		<p class='zfs' id="chongfa" style="display:none" onclick="send();"></p>
	</div>
	<p class='popup_delete'></p> 
</div>
<script type="text/javascript">
	var senddealerid = 0;
	function send() {
	if(senddealerid>0){
		var name = $("#dealer_name").val();
		var mobile = $("#dealer_mobile").val();
		if(name==""){
		$("#dealer_name_wrong").text("请填写姓名");
			$("#dealer_name_wrong").show();
			return false;
		}
		$("#dealer_name_wrong").hide();
		if(mobile==""){
		$("#dealer_mobile_wrong").text("请填写手机号码");
			$("#dealer_mobile_wrong").show();
			return false;
		}
		var reg = /^1\d{10}$/;
		if(!reg.test(mobile)){
			$("#dealer_mobile_wrong").text("手机号码应为11位数字");
			$("#dealer_mobile_wrong").show();
			return false;
		}
		$("#dealer_mobile_wrong").hide();
		
		$.post('dealer_send.action','id='+senddealerid+'&name=' + name + '&mobile='+mobile,function(data) {
			
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
				windowHeight = iDoc_g > windowHeight_g? iDoc_g:windowHeight_g;
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
			$("#dealer_name_wrong").text("请填写姓名");
			$("#dealer_name_wrong").show();
			
			isWrong=true;
		}else{
			$("#dealer_name_wrong").hide();
		}
	}

	//获取焦点的时候去掉校验 手机号码
	function validFocusdmobile(id){
		var isWrong=false;
		var dMobile=$("#"+id).val();
		//用户名
		if(dMobile==""){
			$("#dealer_mobile_wrong").text("请填写手机号码");
			$("#dealer_mobile_wrong").show();
			
			isWrong=true;
		}else {
			if(!validationPhone(dMobile)){
				$("#dealer_mobile_wrong").text("手机号码格式有误");
				$("#dealer_mobile_wrong").show();
			}else {
				$("#dealer_mobile_wrong").hide();
			}
		}
	}
</script>