//寮瑰嚭鐧婚檰妗�



$("#loginbtn").click(function() {
	
   loginbtn()
})

//鍏抽棴鐧婚檰妗�
$("#culp .pwclose").click(function() {
    $("#bgmask").fadeOut();
    $("#userlogin").fadeOut();
})

function loginbtn() {
	
	//$('input[name="user_name"]').val($.cookie('COOKIE_LOGIN_NAME'))
		
	
    $("#bgmask").fadeIn();
    $("#userlogin").fadeIn();
}

$(document).on('click', '#sendlogin',function() {
	/*if($("#bcdl").is(':checked')){
		//$.cookie('COOKIE_LOGIN_NAME', $('input[name="user_name"]').val(),{path:'/',expires:10});
	}else{
		//$.cookie('COOKIE_LOGIN_NAME', null); 
	}*/
   loginFn();
})



$(document).keyup(function(e) {
	
    //鍥炶溅
    if (e.keyCode == 13) {
		 loginFn();
    }
    
})

$(".autoLogin_btn").click(function(){
	if($(this).hasClass('check')){
		$(this).removeClass('check');
		$("#bcdl").prop('checked',false);
	}else{
		$(this).addClass('check');
		$("#bcdl").prop('checked',true);
	}
})


function loginFn(){
    if ($("input[name='user_name']").val().length == 0) {
        $(".submitwarning").show().text('鐢ㄦ埛鍚嶄笉鑳戒负绌�');
        $("input[name='user_name']").focus();
        return false;
    } else if ($("input[name='password']").val().length == 0) {

        $(".submitwarning").show().text('瀵嗙爜涓嶈兘涓虹┖');
        $("input[name='password']").focus();
        return false;
    } else {
		if($("#bcdl").is(":checked")){ 
			var auto_login = $("#bcdl").val();
		}
        $.ajax({
            type: "POST",
            url: "/index.php?act=login&op=login_ajax",
            data: {
                user_name: $("input[name='user_name']").val(),
                nchash: $("input[name='nchash']").val(),
                password: $("input[name='password']").val(),
                sess:$("#sendlogin").attr("mid"),
                auto_login:auto_login
            },
            dataType: "json",
            success: function(data) {
                if (data.code == '0x1') {
                    alert('鏁版嵁鏈夐棶棰�')
                } else if (data.code == '0x2') {
                    $(".submitwarning").show().text('鐢ㄦ埛鍚嶆垨瀵嗙爜鏈夎');
                } else if (data.code == '0x0') {
					$("#userlogin .yy-loadding").css("display","inline-block");
                    location.reload();
					
                }
            }
        });
    }
}

$("#escBtn, .escBtn").on('click',function() {

	 $.ajax({
        type: "POST",
        url: "/index.php?act=login&op=logout",
        dataType: "json",
        success: function(data) {
			console.log(data)
            if (data.code == 0x1) {
				setTimeout(function(){
					 location.reload()
				},1000) 
              
            }else if(data.code == '0x2'){
				setTimeout(function(){
					 window.location = 'models'
				},1000) 
			}
        }
    });
});

$(function(){
	$(".UploadBtn,.UpBtn,.suxiang").click(function(){
		$.ajax({
             type: "GET",
             url: "/index.php?act=login&op=if_login",
             data: {},
             dataType: "json",
             success: function(data){
                 if(data.code != '0x1'){
					loginbtn();
				}else if(data.code== '0x1'){
					window.location.href=MohouConfig.SHOP_URL+"/index.php?act=buy_print"; 
				}     
            }
         });
	})
})