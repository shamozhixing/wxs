var audi_brand_2013=5012;
	$(function(){
		$('input.myClass').Checkable({
      		color: 'blue'
  		});
		/*登录浮层显示*/
		$('.login_mid>div').eq(0).show().siblings('div').hide();
		/*当用户通过邮箱内的重置链接进入网页时，使用下边代码*/
		//$('.login_mid>div').eq(3).show().siblings('div').hide();
		/*当用户通过邮箱内的激活链接进入链接时，使用下边代码*/
		/*$('.zhuce_mid>div').eq(2).show().siblings('div').hide();
		$('.zhuce_mid').css('height','321px')*/
		/*注册浮层显示*/
		$('.zhuce_mid>div').eq(0).show().siblings('div').hide();
		/*登陆框 登录按钮*/
		var windowHeight = $(window).height();
		var iDoc = $(document).height();
		if(windowHeight>windowHeight_g){
			windowHeight_g=windowHeight;
		}
		if(iDoc>iDoc_g){
			iDoc_g=iDoc;
		}
		
		$('.login_login_dl').click(function  () {
			//$('.login_mid').hide();
			//$('#popup_login').fadeOut();
		});
		/*忘记密码按钮*/
		$('#lostpassword').click(function(){
			$('.login_forget').show().siblings('div').hide();
		})
		/**忘记密码   提交按钮
		$('.login_forgettijiao').click(function  () {
			$('.login_cg').show().siblings('div').hide();
		})*/
		/*忘记密码  返回按钮*/
		$('.login_forgetchongtian').click(function (){
			$('.login_mid>div').eq(0).show().siblings('div').hide();
		})
		/*密码重置  提交按钮
		$('.login_zhongzhitj').click(function (){
			$('.login_zzcg').show().siblings('div').hide();
		})*/
		/*密码重置 重填按钮*/
		$('.login_zhongzhict').click(function (){
			$('.login_zhongzhi input').val('');
		})
		/*用户登录  新用户注册按钮*/
		$('#newzhuce').click(function  () {
			
			$('.login_mid').hide();
			$(".loading").show();
				setTimeout(function(){
					$('.zhuce_mid').show().animate({'top':'93px'},500);	
					$(".loading").hide();
				},2000);


			$('#popup_login').css({
					height:function(){						
						var oHeight = $(".zhuce_mid").height();
						windowHeight = iDoc > windowHeight? iDoc:windowHeight;
						oHeight = windowHeight > oHeight? windowHeight:oHeight;
						return oHeight;
					}
				}).fadeTo(300,0.5)
		})
		/*用户注册 提交按钮*/
		$('.zhuce_tijiao').click(function  () {
			//$('.zhuce_sucss').show().siblings('div').hide();
			//$('.zhuce_mid').css('height','321px')
		})
		/*用户注册 重填按钮*/
		$('.zhuce_chongtian ').click(function  () {
			$('.zhuce_zhuce input').val('')
		})
		/*每次点击按钮浏览器滚动条滚动至最上*/
		$('.refer').click(function  () {
			//$('body,html').animate({scrollTop:0},100);

		})
		/*修改个人资料 提交按钮*/
		$('.xiugai_tijiao').click(function () {
			/**$('.xiugai_xiu').hide();
			$('.xiugai_cg').show();
			$('.xiugai_mid').css('height','327');
			$('.xiugai_mid').css('top','93px')*/
		})
		/*关闭按钮*/
		$('.popup_delete').click(function  () {
			$($(this)[0].parentNode).hide();
			$($(this)[0].parentNode).css('top','123px');
			$('.xiugai_mid').css('top','20px')
			$('#popup_login').fadeOut();
		})
		/*用户点击登录  登录层弹出*/
			$('#usedenglu').click(function  () {
				$(".loading").show();
				setTimeout(function(){
					$('.login_mid').show().animate({'top':'93px'},500);	
					$('.login_login').show().siblings('div').hide();
					$(".loading").hide();
					$('#popup_login').css({
					height:function(){						
						var oHeight = $(".login_mid").height();
						windowHeight = iDoc > windowHeight? iDoc:windowHeight;
						oHeight = windowHeight > oHeight? windowHeight:oHeight;

						return oHeight;
					}
				}).fadeTo(300,0.5)
				},3000);
				

				
			})
		/*用户点击注册  注册层弹出*/
		    $('#usezhuce').click(function  () {

		    	commonUserReg();
				
		    	
		    })
		 
		
		
		
		
		    /*用户点击修改资料 修改资料层弹出*/
		    var xiugai_mid_height=0;
		 	$('#amendinfo').click(function  () {
		 		$(".loading").show();
		 		if(0==xiugai_mid_height){
		 			xiugai_mid_height=$('.xiugai_mid').css('height');
		 		}
				setTimeout(function(){
					$('.xiugai_mid').css('height',xiugai_mid_height);
					$('.xiugai_xiu').show();
					$('.xiugai_cg').hide();
					$('.xiugai_mid').show().animate({'top':'0'},500);	
					$(".loading").hide();
				},2000);				
		 		/*$('.xiugai_mid').show().animate({'top':'0'},500);*/
		 		$('#popup_login').css({
					height:function(){						
						var oHeight = $(".xiugai_mid").height();
						windowHeight = iDoc > windowHeight? iDoc:windowHeight;
						oHeight = windowHeight > oHeight? windowHeight:oHeight;
						return oHeight;
					}
				}).fadeTo(300,0.5)
		 	});
			
			/*用户点击发送经销商详情 发送手机浮层弹出*/
			$('.fssj').click(function(){
				senddealerid = $(this).attr('dealerid');
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
				return false;
			})
			
			$('.fs_mid>div').eq(0).show().siblings('div').hide();
			
			/*发送手机 马上发送按钮
			$('.fsnow').click(function(){
				$('.fs_mid>div').eq(1).show().siblings('div').hide();
			}) */
			/*下拉框ie7兼容*/
			$('.frm').click(function (){
				var selc_text = $(this).find('select option:selected').text();
				$(this).find('.caption').text(selc_text)
			})

			/*提交失败和成功title底部边线显示*/
			$('.refer').click(function  () {
				// body...
				$('#cn_maincontent .page_title').css('border-bottom','1px black dotted')
			})
			$('ul,p').css('padding-bottom','0');
			$('fieldset').css('margin-top','0');
			$('.xiugai_mid tr td:first-child').css('padding-left','65px');
			/*a链接去边框*/
			$('a').attr('onfocus','this.blur()');

	});
	
	
	var windowHeight_g = 0;
	var iDoc_g = 0;
	/*注册用户*/
	function commonUserReg(){
		
		$(".loading").show();
				setTimeout(function(){
					$('.zhuce_mid').show().animate({'top':'93px'},500);	
					$('.zhuce_mid').css('height','660px');
					$(".loading").hide();
					$('.zhuce_zhuce').show().siblings('div').hide();
					var username=$("#rform input[name='user.username']").val();
					$('.zhuce_zhuce input').val('');
					$("#rform input[name='user.username']").val(username);
					$('#popup_login').css({
					height:function(){						
						var oHeight = $(".zhuce_mid").height();
						windowHeight_g = iDoc_g > windowHeight_g? iDoc_g:windowHeight_g;
						oHeight = windowHeight_g > oHeight? windowHeight_g:oHeight;
						return oHeight;
					}
				}).fadeTo(300,0.5)
				},2000);
	}
// cookie
function getCookieVal(offset) {
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1) endstr = document.cookie.length;
    return unescape(document.cookie.substring(offset, endstr));
}

function getCookie(name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
        var j = i + alen;
        if (document.cookie.substring(i, j) == arg) return getCookieVal(j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break;
    }
    return null;
}
function setCookie(name, value) {
    var exp = new Date();
    exp.setTime(exp.getTime() + 3600000000);
    document.cookie = name + "=" + value + "; expires=" + exp.toGMTString() + "; path=" + "/";
}

function delCookes(name) {
    var date = new Date();
    //将date设置为过去的时间
    date.setTime(date.getTime() - 10000);
    //将userId这个cookie删除
    document.cookie = name + "=" + name + "; expire=" + date.toGMTString() + "; path=" + "/";

}
// end
	//----页面加载完成
	document.onreadystatechange=function(){
		if(document.readyState == "complete") //当页面加载状态 
		{
			$(".loading").hide();
		}
	}
	window.onload=function(){
		$(".loading").hide();
	}
	//---end
	
	
	