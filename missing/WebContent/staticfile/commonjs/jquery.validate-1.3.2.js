//娉ㄥ唽琛ㄥ崟楠岃瘉 2016/3/23
$(function(){
	var flag = "";
	$(".phone").blur(function(){
		//楠岃瘉鎵嬫満鍙�
		if($(".phone").val()==""){	
			$(this).addClass('error_warning');			
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ父鐢ㄦ墜鏈哄彿鐮�");
		}else if(!(/^1[3|4|5|8]\d{9}$/).test($(".phone").val()) ){
			$(this).addClass('error_warning');
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("鎵嬫満鍙风爜鏍煎紡閿欒");
		}
		
	});
	
	//鑾峰彇鐒︾偣
	$("input[type='text']").focus(function(){
		$(this).removeClass('error_warning');
		error_tip = $(this).parents('.item').find('.error_tip');
		error_tip.css('display','none');
	});
	$("input[type='password']").focus(function(){
		$(this).removeClass('error_warning');
		error_tip = $(this).parents('.item').find('.error_tip');
		error_tip.css('display','none');
	});
	
	//鍥剧墖楠岃瘉
	$(".img_code").blur(function(){
		if($(".img_code").val()==""){	
			$(this).addClass('error_warning');			
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ浘鐗囬獙璇佺爜");
		}
	});
	
	//鐭俊楠岃瘉
	$(".input_verification").blur(function(){
		if($(".input_verification").val()==""){	
			$(this).addClass('error_warning');			
			error_tip = $(this).parents('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ョ煭淇￠獙璇佺爜");
		}
	});
	
	//瀵嗙爜1楠岃瘉
	$(".password").blur(function(){
		if($(".password").val()==""){	
			$(".password").addClass('error_warning');			
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ瘑鐮�");
		}else if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/).test($(".password").val())){
			$(".password").addClass('error_warning');
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("瀵嗙爜蹇呴』鐢�6-16涓嫳鏂囧瓧姣嶅拰鏁板瓧鐨勫瓧绗︿覆缁勬垚锛�");
		}
		
	});
	//瀵嗙爜2楠岃瘉
	$(".password2").blur(function(){
		if($(".password2").val()==""){	
			$(".password2").addClass('error_warning');			
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ瘑鐮�");
		}else if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/).test($(".password2").val())){
			$(".password2").addClass('error_warning');
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("瀵嗙爜蹇呴』鐢�6-16涓嫳鏂囧瓧姣嶅拰鏁板瓧鐨勫瓧绗︿覆缁勬垚锛�");
		}
		
	});
	
	
	
	//鐐瑰嚮鍙戦€佹墜鏈洪獙璇佺爜
	$(".send_verification").click(function(){
		$(".send_verification").attr("sign",0);
		//楠岃瘉鎵嬫満鍙�
		if($(".phone").val()==""){	
			$(".phone").addClass('error_warning');			
			error_tip = $(".phone").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ父鐢ㄦ墜鏈哄彿鐮�");
			return false;
		}else if(!(/^1[3|4|5|8]\d{9}$/).test($(".phone").val()) ){
			$(".phone").addClass('error_warning');
			error_tip = $(".phone").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("鎵嬫満鍙风爜鏍煎紡閿欒");
			return false;
		}
		
		if($(".img_code").val()==""){	
			$(".img_code").addClass('error_warning');			
			error_tip = $(".img_code").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ浘鐗囬獙璇佺爜");
			return false;
		}else{
			$.ajax({ 
						url: "index.php?act=seccode&op=check",
						data: { 'captcha':$(".img_code").val(),
								'nchash':$("#nchash").val(),
							  },
						type:'get',  
						success: function(data){
							if(data=='true'){
									
									//楠岃瘉鎵嬫満鍙锋槸鍚﹂噸澶�
									$.ajax({ 
										url: "index.php?act=login&op=phonecheck", 
										data:{'phone':$(".phone").val()},
										type:'get',
										success: function(res){
											if(res==1){
												//鎵嬫満鍙蜂笉閲嶅璋冪敤鍙戠煭淇℃帴鍙�
												var Num="";
												for(var i=0;i<6;i++){
													Num+=Math.floor(Math.random()*10);
												}
												$.ajax({ 
													url: "index.php?act=seccode&op=phonecheck", 
													data:{'phone':$(".phone").val(),
														  'mcode':Num,
														 },
													type:'post',				
													success: function(res){
														if(res==1){		
															error_tip = $(".img_code").parent('.item').find('.error_tip');
															error_tip.css('display','block');
															error_tip.find("span").text("鐭俊鍙戦€佹垚鍔燂紝楠岃瘉鐮�10鍒嗛挓鍐呮湁鏁�");
															//鍓嶅彴鍙戦€侀獙璇佺爜涓€鍒嗛挓
															time = 60;
															function timeCountDown(){
																if(time==0){
																	clearInterval(timer);
																	$(".send_verification").removeClass('disabled').addClass('btn_active').attr('disabled',false);
																	$(".send_verification").val("鑾峰彇楠岃瘉鐮�");
																	$(".send_verification").bind("click");
																	$(".change_code a").click();
																}
																else{
																	$(".send_verification").val(time+"绉掑悗閲嶈瘯");
																	time--;
																}
																
															}
															$(".send_verification").removeClass('btn_active').addClass('disabled').attr('disabled','true');
															timeCountDown();
															var timer = setInterval(timeCountDown,1000);
															
															
														} else{
															$(".img_code").addClass('error_warning');			
															error_tip = $(".img_code").parent('.item').find('.error_tip');
															error_tip.css('display','block');
															error_tip.find("span").text("鐭俊鍙戦€佸け璐�");
														}
													}
												});
											}else{
												$(".phone").addClass('error_warning');
												error_tip = $(".phone").parent('.item').find('.error_tip');
												error_tip.css('display','block');
												error_tip.find("span").text("鎵嬫満鍙风爜宸茬粡娉ㄥ唽");
												return false;
											}
										}
									});

								
							}else{
								$(".img_code").addClass('error_warning');			
								error_tip = $(".img_code").parent('.item').find('.error_tip');
								error_tip.css('display','block');
								error_tip.find("span").text("楠岃瘉鐮侀敊璇�");
							}
						}
				});
			
			
		}
		
		
	});
	

	//閭楠岃瘉
	$(".email").blur(function(){
		if($(".email").val()==""){	
			$(".email").addClass('error_warning');			
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ父鐢ㄩ偖绠�");
		}else if(!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test($(".email").val())){
			$(".email").addClass('error_warning');
			error_tip = $(this).parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("閭鏍煎紡涓嶆纭�");
		}
		
	});
	
	
	//鎵嬫満娉ㄥ唽鎻愪氦楠岃瘉
	$("input[for='phone_sub']").click(function(){
		//鎵嬫満楠岃瘉
		if($(".phone").val()==""){	
			$(".phone").addClass('error_warning');			
			error_tip = $(".phone").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ父鐢ㄦ墜鏈哄彿鐮�");
			return false;
		}else if(!(/^1[3|4|5|8]\d{9}$/).test($(".phone").val()) ){
			$(".phone").addClass('error_warning');
			error_tip = $(".phone").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("鎵嬫満鍙风爜鏍煎紡閿欒");
			return false;
		}
		//鍥剧墖楠岃瘉
		if($(".img_code").val()==""){	
			$(".img_code").addClass('error_warning');			
			error_tip = $(".img_code").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ浘鐗囬獙璇佺爜");
			return false;
		}
		
		//鐭俊楠岃瘉		
		if($(".input_verification").val()==""){	
			$(".input_verification").addClass('error_warning');			
			error_tip = $(".input_verification").parents('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ョ煭淇￠獙璇佺爜");
			return false;
		}
		
		//瀵嗙爜楠岃瘉
		if($(".password").val()==""){
			$(".password").addClass('error_warning');					
			error_tip = $(".password").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ瘑鐮�");
			return false;
		}else if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/).test($(".password").val())){
			$(".password").addClass('error_warning');
			error_tip = $(".password").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("瀵嗙爜蹇呴』鐢�6-16涓嫳鏂囧瓧姣嶅拰鏁板瓧鐨勫瓧绗︿覆缁勬垚锛�");
			return false;
		}
	
		
		
		//鎵嬫満楠岃瘉鐮侀獙璇�
		$.ajax({ url: "index.php?act=seccode&op=checkcode", 
					data:{'code':$(".input_verification").val()},
					type:'get',
					success: function(res){
						if(res==1){
							$("#register_form").submit();
						} else{
							$(".input_verification").addClass('error_warning');			
							error_tip = $(".input_verification").parents('.item').find('.error_tip');
							error_tip.css('display','block');
							error_tip.find("span").text("楠岃瘉鐮侀敊璇紝璇烽噸鏂拌緭鍏�");
							
						}
					}
		});

		return false;
		
	});//鎻愪氦楠岃瘉end
	
	//閭娉ㄥ唽鎻愪氦楠岃瘉
	$("input[for='email_sub']").click(function(){
		//閭楠岃瘉
		if($(".email").val()==""){	
			$(".email").addClass('error_warning');			
			error_tip = $(".email").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ父鐢ㄩ偖绠�");
			return false;
		}else if(!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test($(".email").val())){
			$(".email").addClass('error_warning');
			error_tip = $(".email").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("閭鏍煎紡涓嶆纭�");
			return false;
		}
		//瀵嗙爜楠岃瘉
		if($(".password2").val()==""){	
			$(".password2").addClass('error_warning');			
			error_tip = $(".password2").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("璇疯緭鍏ュ瘑鐮�");
			return false;
		}else if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/).test($(".password2").val())){
			$(".password2").addClass('error_warning');
			error_tip = $(".password2").parent('.item').find('.error_tip');
			error_tip.css('display','block');
			error_tip.find("span").text("瀵嗙爜蹇呴』鐢�6-16涓嫳鏂囧瓧姣嶅拰鏁板瓧鐨勫瓧绗︿覆缁勬垚锛�");
			return false;
		}
		
		$.ajax({ url: "index.php?act=login&op=emailcheck", 
					data:{'email':$(".email").val()},
					type:'post',
					success: function(res){
						if(res==1){
							$("#register_form").submit();
						} else{
							$(".email").addClass('error_warning');
							error_tip = $(".email").parent('.item').find('.error_tip');
							error_tip.css('display','block');
							error_tip.find("span").text("閭宸茬粡娉ㄥ唽杩囷紝璇锋崲涓偖绠辫瘯璇�");
							
						}
					}
		});
		return false;
	
	});//鎻愪氦楠岃瘉end

})