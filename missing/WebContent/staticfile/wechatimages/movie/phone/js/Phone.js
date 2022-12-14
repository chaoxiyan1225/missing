// Phone.js
(function(){

window.Phone = {version:'1.0'};
//获取随机ID
Phone.getId = function(){
	return ('Phone'+Math.random()+new Date().getTime()).replace('.','');
}
Phone.moveToCenter = function(e){
	e = e.length>0?e:$(e);
	e.css({position:'fixed',top:($(window).height()-e[0].offsetHeight)/2,left:($(window).width()-e[0].offsetWidth)/2});
}
//设置按钮状态
Phone.setButton = function(e,b,text){
	if(!e)
		return
	if(e.length&&e[0].nodeName!=null)
		e = e[0];
	if(b){
		if(e._able==null)
			e._able = true;
		if(e._able||e.old==null)
			return;
		text = text||e.old.value;
		e.onclick = e.old.onclick;
		if($(e).hasClass('phone_buttonDisable'))
			$(e).removeClass('phone_buttonDisable').html(text);
		else if($(e).hasClass('buttonDisable'))
			$(e).removeClass('buttonDisable').addClass('button').html(text);
		else if($(e).hasClass('bigButtonDisable'))
			$(e).removeClass('bigButtonDisable').addClass('bigButton').html(text);
		else{
			$(e).css({background:e.old.bg});	
		}
		//$(e).removeClass('phone_btnDisable').html(text);
		if(e.old.jqClick!=null)
			$(e).bind('click',e.old.jqClick['handler']);
		e._able = true;
	}else{
		//if($(e).hasClass('phone_btnDisable'))
			//return;
		if(e._able==null)
			e._able = true;
		if(!e._able)
			return;
		text = text||e.innerHTML;
		e.old = {
			onclick:e.onclick,
			value:e.innerHTML
		}
		if($(e).data('events')!=null)
			e.old.jqClick = $(e).data('events')['click'][0];
		$(e).unbind('click');
		e.onclick = null;
		if($(e).hasClass('phone_button'))
			$(e).addClass('phone_buttonDisable').html(text);
		else if($(e).hasClass('button'))
			$(e).removeClass('button').addClass('buttonDisable').html(text);
		else if($(e).hasClass('bigButton'))
			$(e).removeClass('bigButton').addClass('bigButtonDisable').html(text);
		else{
			e.old.bg = $(e).css('background');
			$(e).css({background:'#ccc'});
		}
		e._able = false;
	}
}

Phone.createIcon = function(text){
	return '<a class="phone_titleIcon">'+text+'</a>';	
}

Phone.confirm = function(data){
	var id = Phone.getId();
	var able = false;
	var html = '<div class="Phone" id="'+id+'">';
	html += '<div class="phone_cover"></div>';
	html += '<div class="phone_confirm">';
	//html += Phone.createIcon('P');
	//var text = Phone.createIcon('Confirm')+'<span>'+data.text+'</span>';
	html += '<div class="phone_confirm_text">'+data.text+'</div>';
	var b1='取消',b2='确定';
	if(data.btn!=null){
		b1 = (data.btn[0]!=null&&data.btn[0]!='')?data.btn[0]:'取消';
		b2 = (data.btn[1]!=null&&data.btn[1]!='')?data.btn[1]:'确定';
	}
	html += '<div class="phone_confirm_foot"><a class="phone_button phone_confirm_quit">'+b1+'</a><a class="phone_button phone_confirm_ok">'+b2+'</a></div>';
	html += '</div></div>';
	$(html).appendTo($('body'));
	Phone.moveToCenter($('#'+id).find('.phone_confirm'));
	/*$('#'+id).find('.phone_confirm').addClass('on');
	$('#'+id).find('.phone_confirm').bind('webkitAnimationEnd',function(){
		$(this).removeClass('on').addClass('off');	
	});*/
	
	var self = this;
	$('#'+id).find('.phone_confirm_foot a').click(function(e){
		if(data.click){
			var ev = e||window.event;
			var target = ev.target||ev.srcElement,b;
			if($(target).hasClass('phone_confirm_quit'))
				b = false;
			else if($(target).hasClass('phone_confirm_ok'))
				b = true;
			data.click.call(self,b);
		}else{
			self.close();	
		}
	});
	this.lock = function(b){
		able = b;	
	}
	this.getButton = function(){
		return 	$('#'+id).find('.phone_confirm_foot a');
	}
	this.close = function(){
		if(able)
			return;
		$('#'+id).remove();
	}
}


Phone.alert = function(data){
	var id = Phone.getId();
	var html = '<div class="Phone" id="'+id+'">';
	html += '<div class="phone_cover"></div>';
	html += '<div class="phone_alert">';
	//var text = Phone.createIcon('Alert')+'<span>'+data.text+'</span>';
	html += '<div class="phone_alert_text">'+data.text+'</div>';
	html += '<div class="phone_alert_foot"><a class="phone_button phone_alert_ok">确定</a></div>';
	html += '</div></div>';
	$(html).appendTo($('body'));
	Phone.moveToCenter($('#'+id).find('.phone_alert'));
	/*$('#'+id).find('.phone_alert').addClass('on');
	$('#'+id).find('.phone_alert').bind('webkitAnimationEnd',function(){
		$(this).removeClass('on').addClass('off');	
	});
	*/
	var self = this;
	$('#'+id).find('.phone_alert_foot a').click(function(e){
		if(data.click){
			data.click.call(self);
		}
		$('#'+id).remove();	
	});
}

Phone.showInfo = function(b,text,time){
	var html = '';
	if($('.phone_showInfo').length>0)
		$('.phone_showInfo').remove();	
	var id = Phone.getId();
	if(b){
		html += '<div id="'+id+'" class="phone_showInfo" style="color:green">'+text+'</div>';	
	}else{
		html += '<div id="'+id+'" class="phone_showInfo" style="color:red">'+text+'</div>';		
	}
	$(html).appendTo($('body'));
	Phone.moveToCenter($('#'+id));
	//$('#'+id).css({'-webkit-transform':'translate(0,50px)','opacity': 0});
	$('#'+id).addClass('on');
	$('#'+id).bind('webkitAnimationEnd',function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on').addClass('off');
			var t = this;
			setTimeout(function(){
				$(t).addClass('close');	
			},time||1000);	
		}else{
			$(this).remove();
		}
	});
	/*
	var id = Phone.getId();
	var html = '<div class="Phone" id="'+id+'">';
	html += '<div class="phone_cover"></div>';
	html += '<div class="phone_showInfo">';
	/*var s = Phone.createIcon('Success')+'';
	if(b==false)
		s = Phone.createIcon('Error')+'';
	s = s+'<span>'+text+'</span>';
	var s = '<span class="phone_showInfo_icon">&times</span>';
	if(b)
		s = '<span class="phone_showInfo_icon" style="color:green">&radic;</span>';
	s += '<b>'+text+'</b>';
	html += '<div class="phone_showInfo_text">'+s+'<span class="time">2秒后关闭</span></div>';
	*/
	/*
	html += '<div class="phone_showInfo_foot"><span class="time">2秒后关闭</span><a class="btnNormal phone_alert_ok">关闭</a></div>';
	*/
	/*
	html += '<div class="phone_showInfo_foot"><a class="phone_button phone_alert_ok">关闭</a></div>';
	html += '</div></div>';
	$(html).appendTo($('body'));
	Phone.moveToCenter($('#'+id).find('.phone_showInfo'));
	$('#'+id).find('.phone_showInfo').addClass('on');
	$('#'+id).find('.phone_showInfo').bind('webkitAnimationEnd',function(){
		$(this).removeClass('on').addClass('off');	
	});	
	
	var self = this;
	var t = 2;
	var timeout = setTimeout(function(){
		var time = t+'秒后关闭';
		$('#'+id).find('.phone_showInfo_text .time').html(time);
		t--;
		if(t>=-1)
			timeout = setTimeout(arguments.callee,1000);
		else{
			clearTimeout(timeout);
			self.close();
		}
	},0);
	$('#'+id).find('.phone_showInfo_foot a').click(function(e){
		clearTimeout(timeout);
		self.close();	
	});
	this.getButton = function(){
		return 	$('#'+id).find('.phone_showInfo_foot a')[0];
	}
	this.close = function(){
		$('#'+id).remove();
	}	
	*/
}

Phone.window = function(json){
	this.init = function(){
		var self = this;
		var id = Phone.getId();
		this.id = id;
		var iframeId = Phone.getId();
		this.iframeId = iframeId;
		var html = '<div class="Phone" id="'+id+'">';
		html += '<div class="phone_window_cover"></div>';
		html += '<div class="phone_window">';
		if(json.headHide==null||!json.headHide){
			var head = Phone.createIcon('window');
			html += '<div class="phone_window_head">';
			html += json.title||'';
			html += '</div>';
			html += '<a class="phone_window_close" title="关闭">&times;</a>';	
		}else	
			html += '<a class="phone_window_close" style="color:#000" title="关闭">&times;</a>';
		html += '<div class="phone_window_main">';
		if(json.iframe!=null){
			var iframe = '<iframe frameborder="0" id="'+iframeId+'" style="width:100%; height:100%;" src="'+json.iframe+'" class="phone_window_iframe"></iframe>';
			html += iframe;
		}else
			html += json.innerHTML||'';
		html += '</div>';
		if(json.btnHide==null||!json.btnHide){
			html += '<div class="phone_window_foot">';
			html += '<a href="javascript:void(0)" class="phone_window_btnQuit btnNormal">';
			html += '取消</a>';
			html += '<a href="javascript:void(0)" class="phone_window_btnOk btnNormal">';
			html += '确定</a>';
			html += '</div>';
		}

		html += '</div></div>';
		
		$(html).appendTo($('body'));
		Phone.moveToCenter($('#'+this.id).find('.phone_window'));
		
		$('#'+id).find('.phone_window').addClass('on');
		$('#'+id).find('.phone_window').bind('webkitAnimationEnd',function(){
			$(this).removeClass('on').addClass('off');	
		});	

		$('#'+id).find('.phone_window_foot a').click(function(){
			if(json.click){
				var bool;
				if($(this).hasClass('phone_window_btnOk'))
					bool = true;
				else if($(this).hasClass('phone_window_btnQuit'))
					bool = false;
				if(json.click)
					json.click.call(self,bool);	
			}else
				self.close();
		});	
		$('#'+id).find('.phone_window_close').click(function(){
			if(json.click)
				json.click.call(self,false);
			else
				self.close();
		});

		if(json.ready)
			json.ready.call(self);
		if(json.iframeload){
			$('#'+iframeId).bind('load',function(){
				json.iframeload.call(self);										
			});	
		}	
	}
	this.close = function(){
		$('#'+this.id).remove();
	}
	this.find = function(code){
		return $('#'+this.id).find('.phone_window_main').find(code);	
	}
	this.getButton = function(){
		return $('#'+this.id).find('.phone_window_foot a');
	}
	this.getIframe = function(){
		return $('#'+this.iframeId)[0];
	}
	this.init(json);
}

Phone.check = function(str,type){
	var reg = '';
	switch(str){
		case 'number':
			reg = /^[0-9]+$/;
			break;
		case 'string':
			reg = /^[A-Za-z]+$/;
			break;
		case 'email':
			reg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
			break;		
		case 'money':
			reg = /^[\+\-]?\d*?\.?\d*?$/;
			break;		
		case 'strAndnum':
			reg = /^[A-Za-z0-9]+$/;
			break;		
		case 'strAndnumAnd_':
			reg = /^\w+$/; 
			break;		
		case 'chinese':
			reg = /^[\u4e00-\u9fa5],{0,}$/; 
			break;		
		case 'small':
			reg = /^[a-z]+$/;
			break;		
		case 'big':
			reg = /^[A-Z]+$/; 
			break;
		case 'id':
			reg = /^\d{17}[xX0-9]$/;
			break;
		case 'zk':
			reg = /^(\d+\.\d{1,1}|\d+)$/;
			break;
		case 'text':
			reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
			break;
		case 'phone':
			reg = /^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
			break;
	}
	return reg.test(str);		
}
	
})();

function countDown(obj,second){
    if(second>=0){
    	obj.attr("onclick","");
    	obj.html("");
        obj.html("倒计时("+second+")");
        second--;
        setTimeout(function(){countDown(obj,second);},1000);
    }else{
    	obj.html("");
    	obj.html("点击获取验证码");
    	obj.attr("onclick","getCode()");
    }   
};