//本js是TM弹出框插件集合,包括弹出框,确认框,进度条插件等
(function(window){
var warnedAbout = {};  
jQuery.migrateWarnings = [];  
if ( !jQuery.migrateMute && window.console && window.console.log ) {  
    //window.console.log("JQMIGRATE: Logging is active");  
}  
if ( jQuery.migrateTrace === undefined ) {  
    jQuery.migrateTrace = true;  
}  
jQuery.migrateReset = function() {  
    warnedAbout = {};  
    jQuery.migrateWarnings.length = 0;  
};  
function migrateWarn( msg) {  
    var console = window.console;  
    if ( !warnedAbout[ msg ] ) {  
        warnedAbout[ msg ] = true;  
        jQuery.migrateWarnings.push( msg );  
        if ( console && console.warn && !jQuery.migrateMute ) {  
            //console.warn( "JQMIGRATE: " + msg );  
            if ( jQuery.migrateTrace && console.trace ) {  
                //console.trace();  
            }  
        }  
    }  
}  
function migrateWarnProp( obj, prop, value, msg ) {  
    if ( Object.defineProperty ) {  
        try {  
            Object.defineProperty( obj, prop, {  
                configurable: true,  
                enumerable: true,  
                get: function() {  
                    //migrateWarn( msg );  
                    return value;  
                },  
                set: function( newValue ) {  
                    migrateWarn( msg );  
                    value = newValue;  
                }  
            });  
            return;  
        } catch( err ) {  
            // IE8 is a dope about Object.defineProperty, can't warn there  
        }  
    }  
    jQuery._definePropertyBroken = true;  
    obj[ prop ] = value;  
}  
  
if ( document.compatMode === "BackCompat" ) {  
    migrateWarn( "jQuery is not compatible with Quirks Mode" );  
}  
  
var oldFnData = jQuery.fn.data;  
jQuery.fn.data = function( name ) {  
    var ret, evt,  
        elem = this[0];  
    // Handles 1.7 which has this behavior and 1.8 which doesn't  
    if ( elem && name === "events" && arguments.length === 1 ) {  
        ret = jQuery.data( elem, name );  
        evt = jQuery._data( elem, name );  
        if ( ( ret === undefined || ret === evt ) && evt !== undefined ) {  
            migrateWarn("Use of jQuery.fn.data('events') is deprecated");  
            return evt;  
        }  
    }  
    return oldFnData.apply( this, arguments );  
}; 
var TM = {
	version:1.0
};
window.TM = TM;
//判断类型
TM.getType = function(code){
	return Object.prototype.toString.call(code).replace(/]/,'').split(" ")[1];	
};
TM.getId = function(){
	return ('TM'+Math.random()+new Date().getTime()).replace('.','');
}
TM.checkUrl = function(url){
	var check = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
	return check.test(url);
}
//判断是否元素节点
TM.isNode = function(e){
	return e.nodeName;
}
TM.moveToCenter = function(e){
	e = e.length>0?e[0]:e;
	var w = e.offsetWidth==0?$(e).width():e.offsetWidth;
	var h = e.offsetHeight==0?$(e).height():e.offsetHeight;
	$(e).css({top:($(window).height()-h)/2,left:($(window).width()-w)/2});	
}
TM.show = function(e,type){
	var len = $(e).offset()[type];
	switch(type){
		case 'left':
			$(e).css({left:len-20});
			$(e).animate({
				filter:'alpha(opacity=100)',
				MozOpacity:1,
				opacity:1,
				left:len
			},200);	
			break;
		case 'top':
			$(e).css({top:len-20});
			$(e).animate({
				filter:'alpha(opacity=100)',
				MozOpacity:1,
				opacity:1,
				top:len
			},200);	
			break;
	}
}
TM.hide = function(e,type,fn){
	var len = $(e).offset()[type];
	switch(type){
		case 'left':

			$(e).animate({
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				opacity:0,
				left:len+20
			},200,function(){
				if(fn)
					fn();	
			});	
			break;
		case 'top':

			$(e).animate({
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				opacity:0,
				top:len+20
			},200,function(){
				if(fn)
					fn();	
			});	
			break;
	}
}
TM.dragMove = function(obj){
	$(obj).css({position:'absolute',cursor:'move',zIndex:'99'});
	$(obj).bind('mousedown',function(e){
		e = window.event||e;
		if(obj.setCapture)
			obj.setCapture();
		var x = e.clientX-obj.offsetLeft;
		var y = e.clientY-obj.offsetTop;
		var fn1,fn2;
		$(document).unbind('mousemove',fn1);
		$(document).unbind('mouseup',fn2);
		$(document).bind('mousemove',function(e){
			fn1 = arguments.callee;
			var e = window.event||e;
			var x1 = e.clientX-x;
			var y1 = e.clientY-y;
			
			var ele = document.documentElement;
			x1 = x1<0?0:x1;
			y1 = y1<0?0:y1;
			if(x1>ele.clientWidth-obj.offsetWidth)
				x1 = ele.clientWidth-obj.offsetWidth;
			if(y1>ele.clientHeight+ele.scrollTop-obj.offsetHeight)
				y1 = ele.clientHeight+ele.scrollTop-obj.offsetHeight;
			if(y1<ele.scrollTop)
				y1 = ele.scrollTop;
			$(obj).css({left:x1+'px',top:y1+'px'});								
		});
		$(document).bind('mouseup',function(e){
			fn2 = arguments.callee;
			if(obj.releaseCapture)
				obj.releaseCapture();
			$(obj).css({margin:'0',top:obj.offsetTop+'px',left:obj.offsetLeft+'px'});	
			$(document).unbind('mousemove',fn1);
			$(document).unbind('mouseup',fn2);

		});
	});	
}
TM.drag = function(e){//虚线拖动
	$(e).css({position:'absolute',cursor:'move'});
	var arg1,arg2;
	$(e).bind('mousedown',function(ev){
		ev = window.event||ev;
		var d;
		if(ev.setCapture)
			ev.setCapture();
		if(e.used==null||e.used==false){
			d = document.createElement('div');
			$(d).css({width:e.offsetWidth-4+'px',border:'dashed red 2px',height:e.offsetHeight-4+'px',position:'absolute',top:e.offsetTop+'px',left:e.offsetLeft+'px',display:'block',zIndex:9999});
			document.body.appendChild(d);
			e.borther = d;
		}else
			d = e.borther;
		var x = ev.clientX-e.offsetLeft;
		var y = ev.clientY-e.offsetTop;
		var isMove = false;
		$(document).bind('mousemove',function(_ev){
			isMove = true;
			$(d).show();
			_ev = window.event||_ev;
			var x1 = _ev.clientX-x;
			var y1 = _ev.clientY-y;
			var ele = document.documentElement;
			x1 = x1<0?0:x1;
			y1 = y1<0?0:y1;
			if(x1>ele.clientWidth-d.offsetWidth)
				x1 = ele.clientWidth-d.offsetWidth;
			if(y1>ele.clientHeight-d.offsetHeight)
				y1 = ele.clientHeight-d.offsetHeight;
			$(d).css({left:x1+'px',top:y1+'px'});
			arg1 = arguments.callee;
		});
		$(document).bind('mouseup',function(_ev){
			_ev = window.event||_ev;
			if(_ev.releaseCapture)
				_ev.releaseCapture();
			$(e).css({position:'absolute',margin:'0',top:e.offsetTop+'px',left:e.offsetLeft+'px'});	
			if(isMove)
				$(e).animate({left:d.offsetLeft,top:d.offsetTop});
			$(d).hide();
			e.used = true;
			arg2 = arguments.callee;
			$(document).unbind('mousemove',arg1);
			$(document).unbind('mouseup',arg2);
		});
	});
}
//拷贝方法 bool表示是否要深度拷贝,默认为false
TM.extend = function(a,b,bool){
	if(TM.getType(b)=='Object'){
		for(var i in b){
			if(bool&&TM.getType(b[i])=='Object'){
				if(!a[i]||TM.getType(a[i])!='Object')
					a[i] = {};
				TM.extend(a[i],b[i]);		
			}else	
				a[i] = b[i];	
		}	
	}
	//a.constructor;
}

TM.Browser = function(){
	var browser = {
		opera:0,
		ie:0,
		chrome:0,
		firefox:0,
		safari:0,
		konq:0,
		name:0,
		version:0	
	}
	var n = navigator.userAgent,b = browser;
	if(window.opera){
		b.version = window.opera.version();
		b.opera = parseFloat(b.version);
		b.name = 'oprea';
	}else if(/AppleWebKit\/(\S+)/.test(n)){
		if(/Chrome\/(\S+)/.test(n)){
			b.version = RegExp["$1"];
			b.chrome = parseFloat(b.version);
			b.name = 'chrome';	
		}else if(/Version\/(\S+)/.test(n)){
			b.version = RegExp["$1"];
			b.safari = parseFloat(b.version);	
			b.name = 'safari';
		}
	}else if(/KHTML\/(\S+)/.test(n)||/Konqueror\/([^;]+)/.test(n)){
		b.version = RegExp["$1"];
		b.konq = parseFloat(b.version);		
		b.name = 'konq';
	}else if(/Firefox\/(\S+)/.test(n)){
		b.version = RegExp["$1"];
		b.firefox = parseFloat(b.version);
		b.name = 'firefox';	
	}else if(/MSIE ([^;]+)/.test(n)){
		b.version = RegExp["$1"];
		b.ie = parseFloat(b.version);	
		b.name = 'ie';	
	}
	return browser;
}();



//comfirm
TM.confirm = function(data){
	var btnHtml = '';
	btnHtml += '<a href="javascript:void(0)" class="TM_confirm_btnOk '+(data.btnOk.className||'') +'">';
	btnHtml += '<span>'+(data.btnOk.text||'确认')+'</span></a>';
	btnHtml += '<a href="javascript:void(0)" class="TM_confirm_btnQuit '+(data.btnQuit.className||'')+'">';
	btnHtml += '<span>'+(data.btnQuit.text||'取消')+'</span></a>';
	var cover = '<div class="TM_confirm_cover"></div>';
	var html = '';
	//html += '<div class="TM_confirm_cover">';
	html += '<div class="TM_confirm_box"><div class="TM_confirm_h1">'+(data.title||'')+'</div>',
	html += '<div class="TM_confirm_p">'+data.message+'</div>';
	html += '<div class="TM_confirm_buttonBox">'+btnHtml+'</div>';
	html += '</div>';	
	
	var doc = data.doc||document;

	$(cover).appendTo($(doc.body));
	$(html).appendTo($(doc.body));

	$(doc.body).find('.TM_confirm_box').css({
		top:$(doc.body).find('.TM_confirm_box')[0].offsetTop-20								
	});
	var top = $(doc.body).find('.TM_confirm_box')[0].offsetTop;
	$(doc.body).find('.TM_confirm_box').animate({
		top:top+20,
		filter:'alpha(opacity=100)',
		MozOpacity:1,
		opacity:1
	},100);
	
	$(doc.body).find('.TM_confirm_buttonBox .TM_confirm_btnOk').click(function(){			

		$(doc.body).find('.TM_confirm_box').animate({
			top:top-20,
			filter:'alpha(opacity=0)',
			MozOpacity:0,
			opacity:0
		},120,function(){
			$(doc.body).find('.TM_confirm_cover').remove();
			$(doc.body).find('.TM_confirm_box').remove();
		});		
		
		if(data.btnOk.click)
			data.btnOk.click();
	});
	$(doc.body).find('.TM_confirm_buttonBox .TM_confirm_btnQuit').click(function(){

		$(doc.body).find('.TM_confirm_box').animate({
			top:top-20,
			filter:'alpha(opacity=0)',
			MozOpacity:0,
			opacity:0
		},120,function(){
			$(doc.body).find('.TM_confirm_cover').remove();
			$(doc.body).find('.TM_confirm_box').remove();
		});			

		if(data.btnQuit.click)
			data.btnQuit.click();
	});
};


//alert
TM.alert = function(data){
	var btnHtml = '';
	btnHtml += '<a href="javascript:void(0)" class="TM_alert_btnOk '+(data.btnOk.className||'') +'">';
	btnHtml += '<span>'+(data.btnOk.text||'确认')+'</span></a>';
	var cover = '<div class="TM_alert_cover"></div>';
	var html = '';
	//html += '<div class="TM_alert_cover">';
	html += '<div class="TM_alert_box"><div class="TM_alert_h1">'+(data.title||'')+'</div>',
	html += '<div class="TM_alert_p">'+data.message+'</div>';
	html += '<div class="TM_alert_buttonBox">'+btnHtml+'</div>';
	html += '</div>';	
	var doc = data.doc||document;
	$(cover).appendTo($(doc.body));
	$(html).appendTo($(doc.body));
	$(doc.body).find('.TM_alert_box').css({
		top:$(doc.body).find('.TM_alert_box')[0].offsetTop-20								
	});
	var top = $(doc.body).find('.TM_alert_box')[0].offsetTop;
	$(doc.body).find('.TM_alert_box').animate({
		top:top+20,
		filter:'alpha(opacity=100)',
		MozOpacity:1,
		opacity:1
	},100);
	
	$(doc.body).find('.TM_alert_buttonBox .TM_alert_btnOk').click(function(){
		$(doc.body).find('.TM_alert_box').animate({
			top:top-20,
			filter:'alpha(opacity=0)',
			MozOpacity:0,
			opacity:0
		},120,function(){
			$(doc.body).find('.TM_alert_cover').remove();
			$(doc.body).find('.TM_alert_box').remove();
		});
		if(data.btnOk.click)
			data.btnOk.click();											
	});
};


/*
TM.progress({
	top:top,//可以不写
	left:left,//可以不写
	percent:percent,//百分比,必须写
	fn:function(){}//完成后调用,可以不写
});
*/
TM.progress = {
		isRun:false,
		percent:0,
		end:0,
		interval:null,
		timeout:null,
		init:function(){
			var mainHtml;
			if($('.progress_show_box').length>0){
				mainHtml = $('.progress_show_box');
			}else{
				mainHtml = '<div class="progress_show_box">';
				mainHtml += '<div class="progress_show_title">上传中&nbsp;&nbsp;<span class="progress_show_percent"></span></div>';
				mainHtml += '<div class="progress_show_div">';
				mainHtml += '<div class="progress_show_d1"></div>';
				mainHtml += '<div class="progress_show_d2"></div>';
				mainHtml += '';
				mainHtml += '</div>';
				mainHtml += '</div>';	
				$(mainHtml).appendTo($(window.top.document.body));
				mainHtml = $('.progress_show_box');
			}
			return mainHtml;
		},
		run:function(json){
			var mainHtml = this.init();
			//var top = json.top||document.body.scrollTop+((document.documentElement.clientHeight-60)/2)+'px';
			//var left = json.left||document.body.scrollLeft+((document.documentElement.clientWidth-302)/2)+'px';
			//mainHtml.css({top:top,left:left});	
			mainHtml.show();
			var d1 = mainHtml.find('.progress_show_d1');
			var d2 = mainHtml.find('.progress_show_d2');
			var span = mainHtml.find('.progress_show_percent');
			var self = this;
			
			if(this.isRun){
				if(json.percent==this.end)
					return;
				else if(json.percent<this.end){
					this.reset();
				}
				clearInterval(this.interval);
				clearTimeout(this.timeout);
			}
			this.end = json.percent;
			if(this.end==100){
				clearInterval(this.interval);
				clearTimeout(this.timeout);
				d1.css('clip','rect(0,'+100*170/100+'px,'+5+'px,0)');
				span.html(100+'%');
				this.timeout = setTimeout(function(){
					self.close();
					self.reset();
				},100);
				return;
			}
			this.isRun = true;
			this.interval = setInterval(function()
			{
				d1.css('clip','rect(0,'+(self.percent*170/100)+'px,'+5+'px,0)');
				self.percent++;
				span.html(self.percent+'%');
				if(self.percent==self.end){
					clearInterval(self.interval);
				}
			},10);
		},
		reset:function(){
			clearInterval(this.interval);
			clearTimeout(this.timeout);
			this.percent = 0;
			this.end = 0;
			$('.progress_show_box').find('.progress_show_percent').html(0+'%');
			$('.progress_show_box').find('.progress_show_d1').css('clip','rect(0,'+(0*170/100)+'px,'+5+'px,0)');
		},
		close:function(){
			$('.progress_show_box').hide();	
			this.isRun = false;
		}
	}



TM.browser = function(){
	var browser = {
		opera:0,
		ie:0,
		chrome:0,
		firefox:0,
		safari:0,
		konq:0,
		name:0,
		version:0	
	}
	var n = navigator.userAgent,b = browser;
	if(window.opera){
		b.version = window.opera.version();

		b.opera = parseFloat(b.version);
		b.name = 'oprea';
	}else if(/AppleWebKit\/(\S+)/.test(n)){
		if(/Chrome\/(\S+)/.test(n)){
			b.version = RegExp["$1"];
			b.chrome = parseFloat(b.version);
			b.name = 'chrome';	
		}else if(/Version\/(\S+)/.test(n)){
			b.version = RegExp["$1"];
			b.safari = parseFloat(b.version);	
			b.name = 'safari';
		}
	}else if(/KHTML\/(\S+)/.test(n)||/Konqueror\/([^;]+)/.test(n)){
		b.version = RegExp["$1"];
		b.konq = parseFloat(b.version);		
		b.name = 'konq';
	}else if(/Firefox\/(\S+)/.test(n)){
		b.version = RegExp["$1"];
		b.firefox = parseFloat(b.version);
		b.name = 'firefox';	
	}else if(/MSIE ([^;]+)/.test(n)){
		b.version = RegExp["$1"];
		b.ie = parseFloat(b.version);	
		b.name = 'ie';	
	}
	return browser;
}();

TM.Handler = function(){
	var hand = {};
	return {
		addHandler:function(e,action,fn,name){
			if(name&&hand[name]){
				window.alert('[TM.Handler]:'+name+' has Used');
				return;
			}
			if(e.addEventListener)
				e.addEventListener(action,fn,false);
			else if(e.attachEvent)
				e.attachEvent('on'+action,fn);
			else
				e['on'+action] = fn;
			if(name)
				hand[name] = fn;
		},
		removeHandler:function(e,action,arg){
			var delFn;
			if(TM.getType(arg)=='String'){
				if(!hand[arg])
					return;	
				delFn = hand[arg];
				hand[arg] = null;
			}else if(TM.getType(arg)=='Function')
				delFn = arg;
			if(e.removeEventListener)
				e.removeEventListener(action,delFn,false);
			else if(e.detachEvent)
				e.detachEvent('on'+action,delFn);
			else
				e['on'+action] = null;
			delFn = null;
		}
	}
}();

//form

(function(){	
		  
var allCheck = {
	check:function(element,attr){
		if(!TM.isNode(element))
			return this.otherCheck(element,attr);
		else{
			if(element.nodeName=='SELECT')
				return this.selCheck(element,attr);
			else
				return this.textCheck(element,attr);
		}
	},
	textCheck:function(element,attr){
		var b = attr,val = TM.String.trim(element.value);
		//var len = TM.String.getLength(val)
		var len = val.length,error = '';
		if(len==0){
			error = 'null';		
		}else{
			if(b.min&&len<b.min)
				error = 'min';
			else if(b.max&&len>b.max)
				error = 'max';
			else if(b.equal&&len!=b.equal)
				error = 'equal';
			else if(b.equalObj&&val!=b.equalObj.value)
				error = 'equalObj';
			else if(b.value&&val!=b.value)
				error = 'value';
			else if(b.type&&!TM.String.check(val,b.type))
				error = 'type';
			else if(b.minNum&&parseFloat(val)<b.minNum)
				error = 'minNum';
			else if(b.maxNum&&parseFloat(val)>b.maxNum)
				error = 'maxNum';
		}
		return error;
	},
	selCheck:function(element,attr){
		var error = '';
		var b = attr,val = element.value;
		if(!val)
			error = 'null';
		else if(val==='')
			error = '';
		else if(b.value!=null&&val!=b.value)
			error = 'value';
		return error;
	},
	otherCheck:function(element,attr){
		var error = '';
		for(var i=0;i<element.length;i++){
			if(element[i].checked)
				return '';	
		}
		return false;	
	}
}
TM.form = function(form){
	var result = [];
	$.each($(form).find("[use]"),function(a,b){
		$(b).poshytip('hide');
		$(b).poshytip({
			showOn: 'none',
			content:$(b).attr('title'),
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5,
			offsetY: 10
		});	
		if($(b).attr('use'))
			$(b).on($(b).attr('use'),function(){
				$(this).poshytip('show');						
			});
	});
	this.set = function(attr){
		result.push({
			attr:attr,
			name:attr.name,
			error:''
		});
		var self = this;
		if(attr.action){
			$(form[attr.name]).bind(attr.action,function(){
				//$(this).poshytip('show');
				var ret = allCheck.check(form[attr.name],attr);
				if(attr.fn)
					attr.fn.call(form[attr.name],ret);										
			});	
		}
	};
	this.setError = function(element,err){
		if(!TM.isNode(element)&&element.length!=null)
			element = element[element.length-1];
		for(var i=0;i<result.length;i++){
			if(element.name==result[i].name){
				result[i].error = err;		
			}
		}
	};
	this.showMsg = function(element,msg){
		if(!TM.isNode(element)&&element.length!=null)
			element = element[element.length-1];
		if(element.isShow==null||!element.isShow){
			element.isShow = false;	
			$(element).poshytip({
				content:msg	,
				showOn:'none',
				alignTo: 'target',
				alignX: 'right',
				alignY: 'center',
				offsetX: 10,
				offsetY: 10
			});	
		}else if(element.isShow==true)
			$(element).poshytip('update',msg)

		if(!element.isShow){
			$(element).poshytip('show');
			element.isShow = true;	
		}
	};
	this.hideMsg = function(element){
		$(element).poshytip('hide');
		element.isShow = false;
	};
	this.clear = function(){
		for(var i=0;i<result.length;i++){
			var e = form[result[i].name]
			this.hideMsg(e);	
		}
	};
	this.check = function(){
		for(var i=0;i<result.length;i++){
			var attr = result[i].attr;
			var name = result[i].name;
			result[i].error = allCheck.check(form[name],attr);	
		}
		for(var i=0;i<result.length;i++){
			var name = result[i].name;
			if(result[i].attr.fn)
				result[i].attr.fn.call(form[name],result[i].error);
		}
		for(var i=0;i<result.length;i++){
			if(result[i].error!=='')
				return false;	
		}
		return true;	
	};
}
		  
})();

//tips

(function($) {

	var tips = [],
		reBgImage = /^url\(["']?([^"'\)]*)["']?\);?$/i,
		rePNG = /\.png$/i,
		ie6 = !!window.createPopup && document.documentElement.currentStyle.minWidth == 'undefined';

	// make sure the tips' position is updated on resize
	function handleWindowResize() {
		$.each(tips, function() {
			this.refresh(true);
		});
	}
	$(window).resize(handleWindowResize);

	$.Poshytip = function(elm, options) {
		this.$elm = $(elm);
		this.opts = $.extend({}, $.fn.poshytip.defaults, options);
		this.$tip = $(['<div class="',this.opts.className,'">',
				'<div class="tip-inner tip-bg-image"></div>',
				'<div class="tip-arrow tip-arrow-top tip-arrow-right tip-arrow-bottom tip-arrow-left"></div>',
			'</div>'].join('')).appendTo(document.body);
		this.$arrow = this.$tip.find('div.tip-arrow');
		this.$inner = this.$tip.find('div.tip-inner');
		this.disabled = false;
		this.content = null;
		this.init();
	};

	$.Poshytip.prototype = {
		init: function() {
			tips.push(this);

			// save the original title and a reference to the Poshytip object
			var title = this.$elm.attr('title');
			this.$elm.data('title.poshytip', title !== undefined ? title : null)
				.data('poshytip', this);

			// hook element events
			if (this.opts.showOn != 'none') {
				this.$elm.bind({
					'mouseenter.poshytip': $.proxy(this.mouseenter, this),
					'mouseleave.poshytip': $.proxy(this.mouseleave, this)
				});
				switch (this.opts.showOn) {
					case 'hover':
						if (this.opts.alignTo == 'cursor')
							this.$elm.bind('mousemove.poshytip', $.proxy(this.mousemove, this));
						if (this.opts.allowTipHover)
							this.$tip.hover($.proxy(this.clearTimeouts, this), $.proxy(this.mouseleave, this));
						break;
					case 'focus':
						this.$elm.bind({
							'focus.poshytip': $.proxy(this.showDelayed, this),
							'blur.poshytip': $.proxy(this.hideDelayed, this)
						});
						break;
				}
			}
		},
		mouseenter: function(e) {
			if (this.disabled)
				return true;

			this.$elm.attr('title', '');
			if (this.opts.showOn == 'focus')
				return true;

			this.showDelayed();
		},
		mouseleave: function(e) {
			if (this.disabled || this.asyncAnimating && (this.$tip[0] === e.relatedTarget || jQuery.contains(this.$tip[0], e.relatedTarget)))
				return true;

			if (!this.$tip.data('active')) {
				var title = this.$elm.data('title.poshytip');
				if (title !== null)
					this.$elm.attr('title', title);
			}
			if (this.opts.showOn == 'focus')
				return true;

			this.hideDelayed();
		},
		mousemove: function(e) {
			if (this.disabled)
				return true;

			this.eventX = e.pageX;
			this.eventY = e.pageY;
			if (this.opts.followCursor && this.$tip.data('active')) {
				this.calcPos();
				this.$tip.css({left: this.pos.l, top: this.pos.t});
				if (this.pos.arrow)
					this.$arrow[0].className = 'tip-arrow tip-arrow-' + this.pos.arrow;
			}
		},
		show: function() {
			if (this.disabled || this.$tip.data('active'))
				return;

			this.reset();
			this.update();

			// don't proceed if we didn't get any content in update() (e.g. the element has an empty title attribute)
			if (!this.content)
				return;

			this.display();
			if (this.opts.timeOnScreen)
				this.hideDelayed(this.opts.timeOnScreen);
		},
		showDelayed: function(timeout) {
			this.clearTimeouts();
			this.showTimeout = setTimeout($.proxy(this.show, this), typeof timeout == 'number' ? timeout : this.opts.showTimeout);
		},
		hide: function() {
			if (this.disabled || !this.$tip.data('active'))
				return;

			this.display(true);
		},
		hideDelayed: function(timeout) {
			this.clearTimeouts();
			this.hideTimeout = setTimeout($.proxy(this.hide, this), typeof timeout == 'number' ? timeout : this.opts.hideTimeout);
		},
		reset: function() {
			this.$tip.queue([]).detach().css('visibility', 'hidden').data('active', false);
			this.$inner.find('*').poshytip('hide');
			if (this.opts.fade)
				this.$tip.css('opacity', this.opacity);
			this.$arrow[0].className = 'tip-arrow tip-arrow-top tip-arrow-right tip-arrow-bottom tip-arrow-left';
			this.asyncAnimating = false;
		},
		update: function(content, dontOverwriteOption) {
			if (this.disabled)
				return;

			var async = content !== undefined;
			if (async) {
				if (!dontOverwriteOption)
					this.opts.content = content;
				if (!this.$tip.data('active'))
					return;
			} else {
				content = this.opts.content;
			}

			// update content only if it has been changed since last time
			var self = this,
				newContent = typeof content == 'function' ?
					content.call(this.$elm[0], function(newContent) {
						self.update(newContent);
					}) :
					content == '[title]' ? this.$elm.data('title.poshytip') : content;
			if (this.content !== newContent) {
				this.$inner.empty().append(newContent);
				this.content = newContent;
			}

			this.refresh(async);
		},
		refresh: function(async) {
			if (this.disabled)
				return;

			if (async) {
				if (!this.$tip.data('active'))
					return;
				// save current position as we will need to animate
				var currPos = {left: this.$tip.css('left'), top: this.$tip.css('top')};
			}

			// reset position to avoid text wrapping, etc.
			this.$tip.css({left: 0, top: 0}).appendTo(document.body);

			// save default opacity
			if (this.opacity === undefined)
				this.opacity = this.$tip.css('opacity');

			// check for images - this code is here (i.e. executed each time we show the tip and not on init) due to some browser inconsistencies
			var bgImage = this.$tip.css('background-image').match(reBgImage),
				arrow = this.$arrow.css('background-image').match(reBgImage);

			if (bgImage) {
				var bgImagePNG = rePNG.test(bgImage[1]);
				// fallback to background-color/padding/border in IE6 if a PNG is used
				if (ie6 && bgImagePNG) {
					this.$tip.css('background-image', 'none');
					this.$inner.css({margin: 0, border: 0, padding: 0});
					bgImage = bgImagePNG = false;
				} else {
					this.$tip.prepend('<table class="tip-table" border="0" cellpadding="0" cellspacing="0"><tr><td class="tip-top tip-bg-image" colspan="2"><span></span></td><td class="tip-right tip-bg-image" rowspan="2"><span></span></td></tr><tr><td class="tip-left tip-bg-image" rowspan="2"><span></span></td><td></td></tr><tr><td class="tip-bottom tip-bg-image" colspan="2"><span></span></td></tr></table>')
						.css({border: 0, padding: 0, 'background-image': 'none', 'background-color': 'transparent'})
						.find('.tip-bg-image').css('background-image', 'url("' + bgImage[1] +'")').end()
						.find('td').eq(3).append(this.$inner);
				}
				// disable fade effect in IE due to Alpha filter + translucent PNG issue
				if (bgImagePNG && !$.support.opacity)
					this.opts.fade = false;
			}
			// IE arrow fixes
			if (arrow && !$.support.opacity) {
				// disable arrow in IE6 if using a PNG
				if (ie6 && rePNG.test(arrow[1])) {
					arrow = false;
					this.$arrow.css('background-image', 'none');
				}
				// disable fade effect in IE due to Alpha filter + translucent PNG issue
				this.opts.fade = false;
			}

			var $table = this.$tip.find('> table.tip-table');
			if (ie6) {
				// fix min/max-width in IE6

				this.$tip[0].style.width = '';
				$table.width('auto').find('td').eq(3).width('auto');
				var tipW = this.$tip.width(),
					minW = parseInt(this.$tip.css('min-width')),
					maxW = parseInt(this.$tip.css('max-width'));
				if (!isNaN(minW) && tipW < minW)
					tipW = minW;
				else if (!isNaN(maxW) && tipW > maxW)
					tipW = maxW;
				this.$tip.add($table).width(tipW).eq(0).find('td').eq(3).width('100%');
			} else if ($table[0]) {
				// fix the table width if we are using a background image
				// IE9, FF4 use float numbers for width/height so use getComputedStyle for them to avoid text wrapping
				// for details look at: http://vadikom.com/dailies/offsetwidth-offsetheight-useless-in-ie9-firefox4/
				$table.width('auto').find('td').eq(3).width('auto').end().end().width(document.defaultView && document.defaultView.getComputedStyle && parseFloat(document.defaultView.getComputedStyle(this.$tip[0], null).width) || this.$tip.width()).find('td').eq(3).width('100%');
			}
			this.tipOuterW = this.$tip.outerWidth();
			this.tipOuterH = this.$tip.outerHeight();

			this.calcPos();

			// position and show the arrow image
			if (arrow && this.pos.arrow) {
				this.$arrow[0].className = 'tip-arrow tip-arrow-' + this.pos.arrow;
				this.$arrow.css('visibility', 'inherit');
			}

			if (async && this.opts.refreshAniDuration) {
				this.asyncAnimating = true;
				var self = this;
				this.$tip.css(currPos).animate({left: this.pos.l, top: this.pos.t}, this.opts.refreshAniDuration, function() { self.asyncAnimating = false; });
			} else {
				this.$tip.css({left: this.pos.l, top: this.pos.t});
			}
		},
		display: function(hide) {
			var active = this.$tip.data('active');
			if (active && !hide || !active && hide)
				return;

			this.$tip.stop();
			if ((this.opts.slide && this.pos.arrow || this.opts.fade) && (hide && this.opts.hideAniDuration || !hide && this.opts.showAniDuration)) {
				var from = {}, to = {};
				// this.pos.arrow is only undefined when alignX == alignY == 'center' and we don't need to slide in that rare case
				if (this.opts.slide && this.pos.arrow) {
					var prop, arr;
					if (this.pos.arrow == 'bottom' || this.pos.arrow == 'top') {
						prop = 'top';
						arr = 'bottom';
					} else {
						prop = 'left';
						arr = 'right';
					}
					var val = parseInt(this.$tip.css(prop));
					from[prop] = val + (hide ? 0 : (this.pos.arrow == arr ? -this.opts.slideOffset : this.opts.slideOffset));
					to[prop] = val + (hide ? (this.pos.arrow == arr ? this.opts.slideOffset : -this.opts.slideOffset) : 0) + 'px';
				}
				if (this.opts.fade) {
					from.opacity = hide ? this.$tip.css('opacity') : 0;
					to.opacity = hide ? 0 : this.opacity;
				}
				this.$tip.css(from).animate(to, this.opts[hide ? 'hideAniDuration' : 'showAniDuration']);
			}
			hide ? this.$tip.queue($.proxy(this.reset, this)) : this.$tip.css('visibility', 'inherit');
			if (active) {
				var title = this.$elm.data('title.poshytip');
				if (title !== null)
					this.$elm.attr('title', title);
			}
			this.$tip.data('active', !active);
		},
		disable: function() {
			this.reset();
			this.disabled = true;
		},
		enable: function() {
			this.disabled = false;
		},
		destroy: function() {
			this.reset();
			this.$tip.remove();
			delete this.$tip;
			this.content = null;
			this.$elm.unbind('.poshytip').removeData('title.poshytip').removeData('poshytip');
			tips.splice($.inArray(this, tips), 1);
		},
		clearTimeouts: function() {
			if (this.showTimeout) {
				clearTimeout(this.showTimeout);
				this.showTimeout = 0;
			}
			if (this.hideTimeout) {
				clearTimeout(this.hideTimeout);
				this.hideTimeout = 0;
			}
		},
		calcPos: function() {
			var pos = {l: 0, t: 0, arrow: ''},
				$win = $(window),
				win = {
					l: $win.scrollLeft(),
					t: $win.scrollTop(),
					w: $win.width(),
					h: $win.height()
				}, xL, xC, xR, yT, yC, yB;
			if (this.opts.alignTo == 'cursor') {
				xL = xC = xR = this.eventX;
				yT = yC = yB = this.eventY;
			} else { // this.opts.alignTo == 'target'
				var elmOffset = this.$elm.offset(),
					elm = {
						l: elmOffset.left,
						t: elmOffset.top,
						w: this.$elm.outerWidth(),
						h: this.$elm.outerHeight()
					};
				xL = elm.l + (this.opts.alignX != 'inner-right' ? 0 : elm.w);	// left edge
				xC = xL + Math.floor(elm.w / 2);				// h center
				xR = xL + (this.opts.alignX != 'inner-left' ? elm.w : 0);	// right edge
				yT = elm.t + (this.opts.alignY != 'inner-bottom' ? 0 : elm.h);	// top edge
				yC = yT + Math.floor(elm.h / 2);				// v center
				yB = yT + (this.opts.alignY != 'inner-top' ? elm.h : 0);	// bottom edge
			}

			// keep in viewport and calc arrow position
			switch (this.opts.alignX) {
				case 'right':
				case 'inner-left':
					pos.l = xR + this.opts.offsetX;
					if (this.opts.keepInViewport && pos.l + this.tipOuterW > win.l + win.w)
						pos.l = win.l + win.w - this.tipOuterW;
					if (this.opts.alignX == 'right' || this.opts.alignY == 'center')
						pos.arrow = 'left';
					break;
				case 'center':
					pos.l = xC - Math.floor(this.tipOuterW / 2);
					if (this.opts.keepInViewport) {
						if (pos.l + this.tipOuterW > win.l + win.w)
							pos.l = win.l + win.w - this.tipOuterW;
						else if (pos.l < win.l)
							pos.l = win.l;
					}
					break;
				default: // 'left' || 'inner-right'
					pos.l = xL - this.tipOuterW - this.opts.offsetX;
					if (this.opts.keepInViewport && pos.l < win.l)
						pos.l = win.l;
					if (this.opts.alignX == 'left' || this.opts.alignY == 'center')
						pos.arrow = 'right';
			}
			switch (this.opts.alignY) {
				case 'bottom':
				case 'inner-top':
					pos.t = yB + this.opts.offsetY;
					// 'left' and 'right' need priority for 'target'
					if (!pos.arrow || this.opts.alignTo == 'cursor')
						pos.arrow = 'top';
					if (this.opts.keepInViewport && pos.t + this.tipOuterH > win.t + win.h) {
						pos.t = yT - this.tipOuterH - this.opts.offsetY;
						if (pos.arrow == 'top')
							pos.arrow = 'bottom';
					}
					break;
				case 'center':
					pos.t = yC - Math.floor(this.tipOuterH / 2);
					if (this.opts.keepInViewport) {
						if (pos.t + this.tipOuterH > win.t + win.h)
							pos.t = win.t + win.h - this.tipOuterH;
						else if (pos.t < win.t)
							pos.t = win.t;
					}
					break;
				default: // 'top' || 'inner-bottom'
					pos.t = yT - this.tipOuterH - this.opts.offsetY;
					// 'left' and 'right' need priority for 'target'
					if (!pos.arrow || this.opts.alignTo == 'cursor')
						pos.arrow = 'bottom';
					if (this.opts.keepInViewport && pos.t < win.t) {
						pos.t = yB + this.opts.offsetY;
						if (pos.arrow == 'bottom')
							pos.arrow = 'top';
					}
			}
			this.pos = pos;
		}
	};

	$.fn.poshytip = function(options) {
		if (typeof options == 'string') {
			var args = arguments,
				method = options;
			Array.prototype.shift.call(args);
			// unhook live events if 'destroy' is called
			if (method == 'destroy') {

				this.die ?
					this.die('mouseenter.poshytip').die('focus.poshytip') :
					$(document).undelegate(this.selector, 'mouseenter.poshytip').undelegate(this.selector, 'focus.poshytip');
			}
			return this.each(function() {
				var poshytip = $(this).data('poshytip');
				if (poshytip && poshytip[method])
					poshytip[method].apply(poshytip, args);
			});
		}

		var opts = $.extend({}, $.fn.poshytip.defaults, options);

		// generate CSS for this tip class if not already generated
		if (!$('#poshytip-css-' + opts.className)[0])
			$(['<style id="poshytip-css-',opts.className,'" type="text/css">',
				'div.',opts.className,'{visibility:hidden;position:absolute;top:0;left:0;}',
				'div.',opts.className,' table.tip-table, div.',opts.className,' table.tip-table td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;vertical-align:middle;}',
				'div.',opts.className,' td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:',opts.bgImageFrameSize,'px;width:',opts.bgImageFrameSize,'px;overflow:hidden;}',
				'div.',opts.className,' td.tip-right{background-position:100% 0;}',
				'div.',opts.className,' td.tip-bottom{background-position:100% 100%;}',
				'div.',opts.className,' td.tip-left{background-position:0 100%;}',
				'div.',opts.className,' div.tip-inner{background-position:-',opts.bgImageFrameSize,'px -',opts.bgImageFrameSize,'px;}',
				'div.',opts.className,' div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}',
			'</style>'].join('')).appendTo('head');

		// check if we need to hook live events
		if (opts.liveEvents && opts.showOn != 'none') {
			var handler,
				deadOpts = $.extend({}, opts, { liveEvents: false });
			switch (opts.showOn) {
				case 'hover':
					handler = function() {
						var $this = $(this);


						if (!$this.data('poshytip'))
							$this.poshytip(deadOpts).poshytip('mouseenter');
					};
					// support 1.4.2+ & 1.9+
					this.live ?
						this.live('mouseenter.poshytip', handler) :
						$(document).delegate(this.selector, 'mouseenter.poshytip', handler);
					break;
				case 'focus':
					handler = function() {
						var $this = $(this);
						if (!$this.data('poshytip'))
							$this.poshytip(deadOpts).poshytip('showDelayed');
					};
					this.live ?
						this.live('focus.poshytip', handler) :
						$(document).delegate(this.selector, 'focus.poshytip', handler);
					break;
			}
			return this;
		}

		return this.each(function() {
			new $.Poshytip(this, opts);
		});
	}

	// default settings
	$.fn.poshytip.defaults = {
		content: 		'[title]',	// content to display ('[title]', 'string', element, function(updateCallback){...}, jQuery)
		className:		'tip-twitter',	// class for the tips
		bgImageFrameSize:	10,		// size in pixels for the background-image (if set in CSS) frame around the inner content of the tip
		showTimeout:		500,		// timeout before showing the tip (in milliseconds 1000 == 1 second)
		hideTimeout:		100,		// timeout before hiding the tip
		timeOnScreen:		0,		// timeout before automatically hiding the tip after showing it (set to > 0 in order to activate)
		showOn:			'hover',	// handler for showing the tip ('hover', 'focus', 'none') - use 'none' to trigger it manually
		liveEvents:		false,		// use live events
		alignTo:		'cursor',	// align/position the tip relative to ('cursor', 'target')
		alignX:			'right',	// horizontal alignment for the tip relative to the mouse cursor or the target element
							// ('right', 'center', 'left', 'inner-left', 'inner-right') - 'inner-*' matter if alignTo:'target'
		alignY:			'top',		// vertical alignment for the tip relative to the mouse cursor or the target element
							// ('bottom', 'center', 'top', 'inner-bottom', 'inner-top') - 'inner-*' matter if alignTo:'target'
		offsetX:		-22,		// offset X pixels from the default position - doesn't matter if alignX:'center'
		offsetY:		18,		// offset Y pixels from the default position - doesn't matter if alignY:'center'
		keepInViewport:		true,		// reposition the tooltip if needed to make sure it always appears inside the viewport
		allowTipHover:		true,		// allow hovering the tip without hiding it onmouseout of the target - matters only if showOn:'hover'
		followCursor:		false,		// if the tip should follow the cursor - matters only if showOn:'hover' and alignTo:'cursor'
		fade: 			true,		// use fade animation
		slide: 			true,		// use slide animation
		slideOffset: 		8,		// slide animation offset
		showAniDuration: 	300,		// show animation duration - set to 0 if you don't want show animation
		hideAniDuration: 	300,		// hide animation duration - set to 0 if you don't want hide animation
		refreshAniDuration:	200		// refresh animation duration - set to 0 if you don't want animation when updating the tooltip asynchronously
	};

})($);

/*--------colorbox-----------*/
(function ($, document, window) {
	var
	// Default settings object.
	// See http://jacklmoore.com/colorbox for details.
	defaults = {
		// data sources
		html: false,
		photo: false,
		iframe: false,
		inline: false,

		// behavior and appearance
		transition: "elastic",
		speed: 300,
		fadeOut: 300,
		width: false,
		initialWidth: "600",
		innerWidth: false,
		maxWidth: false,
		height: false,
		initialHeight: "450",
		innerHeight: false,
		maxHeight: false,
		scalePhotos: true,
		scrolling: true,
		opacity: 0.9,
		preloading: true,
		className: false,
		overlayClose: true,
		escKey: true,
		arrowKey: true,
		top: false,
		bottom: false,
		left: false,
		right: false,
		fixed: false,
		data: undefined,
		closeButton: true,
		fastIframe: true,
		open: false,
		reposition: true,
		loop: true,
		slideshow: false,
		slideshowAuto: true,
		slideshowSpeed: 2500,
		slideshowStart: "start slideshow",
		slideshowStop: "stop slideshow",
		photoRegex: /\.(gif|png|jp(e|g|eg)|bmp|ico|webp|jxr|svg)((#|\?).*)?$/i,

		// alternate image paths for high-res displays
		retinaImage: false,
		retinaUrl: false,
		retinaSuffix: '@2x.$1',

		// internationalization
		current: "image {current} of {total}",
		previous: "previous",
		next: "next",
		close: "close",
		xhrError: "This content failed to load.",
		imgError: "This image failed to load.",

		// accessbility
		returnFocus: true,
		trapFocus: true,

		// callbacks
		onOpen: false,
		onLoad: false,
		onComplete: false,
		onCleanup: false,
		onClosed: false,

		rel: function() {
			return this.rel;
		},
		href: function() {
			// Using .attr() so that the href can also be used to provide a selector for inline content
			return $(this).attr('href');
		},
		title: function() {
			return this.title;
		}
	},


	// Abstracting the HTML and event identifiers for easy rebranding
	colorbox = 'colorbox',
	prefix = 'cbox',
	boxElement = prefix + 'Element',
	
	// Events
	event_open = prefix + '_open',
	event_load = prefix + '_load',
	event_complete = prefix + '_complete',
	event_cleanup = prefix + '_cleanup',
	event_closed = prefix + '_closed',
	event_purge = prefix + '_purge',

	// Cached jQuery Object Variables
	$overlay,
	$box,
	$wrap,
	$content,
	$topBorder,
	$leftBorder,
	$rightBorder,
	$bottomBorder,
	$related,
	$window,
	$loaded,
	$loadingBay,
	$loadingOverlay,
	$title,
	$current,
	$slideshow,
	$next,
	$prev,
	$close,
	$groupControls,
	$events = $('<a/>'), // $({}) would be prefered, but there is an issue with jQuery 1.4.2
	
	// Variables for cached values or use across multiple functions
	settings,
	interfaceHeight,
	interfaceWidth,
	loadedHeight,
	loadedWidth,
	index,
	photo,
	open,
	active,
	closing,
	loadingTimer,
	publicMethod,
	div = "div",
	requests = 0,
	previousCSS = {},
	init;

	// ****************
	// HELPER FUNCTIONS
	// ****************
	
	// Convenience function for creating new jQuery objects
	function $tag(tag, id, css) {
		var element = document.createElement(tag);

		if (id) {
			element.id = prefix + id;
		}

		if (css) {
			element.style.cssText = css;
		}

		return $(element);
	}
	
	// Get the window height using innerHeight when available to avoid an issue with iOS
	// http://bugs.jquery.com/ticket/6724
	function winheight() {
		return window.innerHeight ? window.innerHeight : $(window).height();
	}

	function Settings(element, options) {
		if (options !== Object(options)) {
			options = {};
		}

		this.cache = {};
		this.el = element;

		this.value = function(key) {
			var dataAttr;

			if (this.cache[key] === undefined) {
				dataAttr = $(this.el).attr('data-cbox-'+key);

				if (dataAttr !== undefined) {
					this.cache[key] = dataAttr;
				} else if (options[key] !== undefined) {
					this.cache[key] = options[key];
				} else if (defaults[key] !== undefined) {
					this.cache[key] = defaults[key];
				}
			}

			return this.cache[key];
		};

		this.get = function(key) {
			var value = this.value(key);
			return $.isFunction(value) ? value.call(this.el, this) : value;
		};
	}

	// Determine the next and previous members in a group.
	function getIndex(increment) {
		var
		max = $related.length,
		newIndex = (index + increment) % max;
		
		return (newIndex < 0) ? max + newIndex : newIndex;
	}

	// Convert '%' and 'px' values to integers
	function setSize(size, dimension) {
		return Math.round((/%/.test(size) ? ((dimension === 'x' ? $window.width() : winheight()) / 100) : 1) * parseInt(size, 10));
	}
	
	// Checks an href to see if it is a photo.
	// There is a force photo option (photo: true) for hrefs that cannot be matched by the regex.
	function isImage(settings, url) {
		return settings.get('photo') || settings.get('photoRegex').test(url);
	}

	function retinaUrl(settings, url) {
		return settings.get('retinaUrl') && window.devicePixelRatio > 1 ? url.replace(settings.get('photoRegex'), settings.get('retinaSuffix')) : url;
	}

	function trapFocus(e) {
		if ('contains' in $box[0] && !$box[0].contains(e.target) && e.target !== $overlay[0]) {
			e.stopPropagation();
			$box.focus();
		}
	}

	function setClass(str) {
		if (setClass.str !== str) {
			$box.add($overlay).removeClass(setClass.str).addClass(str);
			setClass.str = str;
		}
	}

	function getRelated() {
		index = 0;
		
		if (rel && rel !== 'nofollow') {
			$related = $('.' + boxElement).filter(function () {
				var options = $.data(this, colorbox);
				var settings = new Settings(this, options);
				return (settings.get('rel') === rel);
			});
			index = $related.index(settings.el);
			
			// Check direct calls to Colorbox.
			if (index === -1) {
				$related = $related.add(settings.el);
				index = $related.length - 1;
			}
		} else {
			$related = $(settings.el);
		}
	}

	function trigger(event) {
		// for external use
		$(document).trigger(event);
		// for internal use
		$events.triggerHandler(event);
	}

	var slideshow = (function(){
		var active,
			className = prefix + "Slideshow_",
			click = "click." + prefix,
			timeOut;

		function clear () {
			clearTimeout(timeOut);
		}

		function set() {
			if (settings.get('loop') || $related[index + 1]) {
				clear();
				timeOut = setTimeout(publicMethod.next, settings.get('slideshowSpeed'));
			}
		}

		function start() {
			$slideshow
				.html(settings.get('slideshowStop'))
				.unbind(click)
				.one(click, stop);

			$events
				.bind(event_complete, set)
				.bind(event_load, clear);

			$box.removeClass(className + "off").addClass(className + "on");
		}

		function stop() {
			clear();
			
			$events
				.unbind(event_complete, set)
				.unbind(event_load, clear);

			$slideshow
				.html(settings.get('slideshowStart'))
				.unbind(click)
				.one(click, function () {
					publicMethod.next();
					start();
				});

			$box.removeClass(className + "on").addClass(className + "off");
		}

		function reset() {
			active = false;
			$slideshow.hide();
			clear();
			$events
				.unbind(event_complete, set)
				.unbind(event_load, clear);
			$box.removeClass(className + "off " + className + "on");
		}

		return function(){
			if (active) {
				if (!settings.get('slideshow')) {
					$events.unbind(event_cleanup, reset);
					reset();
				}
			} else {
				if (settings.get('slideshow') && $related[1]) {
					active = true;
					$events.one(event_cleanup, reset);
					if (settings.get('slideshowAuto')) {
						start();
					} else {
						stop();
					}
					$slideshow.show();
				}
			}
		};

	}());


	function launch(element) {
		var options;

		if (!closing) {

			options = $(element).data('colorbox');

			settings = new Settings(element, options);

			rel = settings.get('rel');
			
			getRelated();

			if (!open) {
				open = active = true; // Prevents the page-change action from queuing up if the visitor holds down the left or right keys.

				setClass(settings.get('className'));
				
				// Show colorbox so the sizes can be calculated in older versions of jQuery
				$box.css({visibility:'hidden', display:'block'});
				
				$loaded = $tag(div, 'LoadedContent', 'width:0; height:0; overflow:hidden; visibility:hidden');
				$content.css({width:'', height:''}).append($loaded);

				// Cache values needed for size calculations
				interfaceHeight = $topBorder.height() + $bottomBorder.height() + $content.outerHeight(true) - $content.height();
				interfaceWidth = $leftBorder.width() + $rightBorder.width() + $content.outerWidth(true) - $content.width();
				loadedHeight = $loaded.outerHeight(true);
				loadedWidth = $loaded.outerWidth(true);

				// Opens inital empty Colorbox prior to content being loaded.
				settings.w = setSize(settings.get('initialWidth'), 'x');
				settings.h = setSize(settings.get('initialHeight'), 'y');
				$loaded.css({width:'', height:settings.h});
				publicMethod.position();

				trigger(event_open);
				settings.get('onOpen');

				$groupControls.add($title).hide();

				$box.focus();
				
				if (settings.get('trapFocus')) {
					// Confine focus to the modal
					// Uses event capturing that is not supported in IE8-
					if (document.addEventListener) {

						document.addEventListener('focus', trapFocus, true);
						
						$events.one(event_closed, function () {
							document.removeEventListener('focus', trapFocus, true);
						});

					}
				}

				// Return focus on closing
				if (settings.get('returnFocus')) {
					$events.one(event_closed, function () {
						$(settings.el).focus();
					});
				}
			}

			$overlay.css({
				opacity: parseFloat(settings.get('opacity')),
				cursor: settings.get('overlayClose') ? "pointer" : "auto",
				visibility: 'visible'
			}).show();
			
			if (settings.get('closeButton')) {
				$close.html(settings.get('close')).appendTo($content);
			} else {
				$close.appendTo('<div/>'); // replace with .detach() when dropping jQuery < 1.4
			}

			load();
		}
	}

	// Colorbox's markup needs to be added to the DOM prior to being called
	// so that the browser will go ahead and load the CSS background images.
	function appendHTML() {
		if (!$box && document.body) {
			init = false;
			$window = $(window);
			$box = $tag(div).attr({
				id: colorbox,
				'class': $.support.opacity === false ? prefix + 'IE' : '', // class for optional IE8 & lower targeted CSS.
				role: 'dialog',
				tabindex: '-1'
			}).hide();
			$overlay = $tag(div, "Overlay").hide();
			$loadingOverlay = $([$tag(div, "LoadingOverlay")[0],$tag(div, "LoadingGraphic")[0]]);
			$wrap = $tag(div, "Wrapper");
			$content = $tag(div, "Content").append(
				$title = $tag(div, "Title"),
				$current = $tag(div, "Current"),
				$prev = $('<button type="button"/>').attr({id:prefix+'Previous'}),
				$next = $('<button type="button"/>').attr({id:prefix+'Next'}),
				$slideshow = $tag('button', "Slideshow"),
				$loadingOverlay
			);

			$close = $('<button type="button"/>').attr({id:prefix+'Close'});
			
			$wrap.append( // The 3x3 Grid that makes up Colorbox
				$tag(div).append(
					$tag(div, "TopLeft"),
					$topBorder = $tag(div, "TopCenter"),
					$tag(div, "TopRight")
				),
				$tag(div, false, 'clear:left').append(
					$leftBorder = $tag(div, "MiddleLeft"),
					$content,
					$rightBorder = $tag(div, "MiddleRight")
				),
				$tag(div, false, 'clear:left').append(
					$tag(div, "BottomLeft"),
					$bottomBorder = $tag(div, "BottomCenter"),
					$tag(div, "BottomRight")
				)
			).find('div div').css({'float': 'left'});
			
			$loadingBay = $tag(div, false, 'position:absolute; width:9999px; visibility:hidden; display:none; max-width:none;');
			
			$groupControls = $next.add($prev).add($current).add($slideshow);

			$(document.body).append($overlay, $box.append($wrap, $loadingBay));
		}
	}

	// Add Colorbox's event bindings
	function addBindings() {
		function clickHandler(e) {
			// ignore non-left-mouse-clicks and clicks modified with ctrl / command, shift, or alt.
			// See: http://jacklmoore.com/notes/click-events/
			if (!(e.which > 1 || e.shiftKey || e.altKey || e.metaKey || e.ctrlKey)) {
				e.preventDefault();
				launch(this);
			}

		}

		if ($box) {
			if (!init) {
				init = true;

				// Anonymous functions here keep the public method from being cached, thereby allowing them to be redefined on the fly.
				$next.click(function () {
					publicMethod.next();
				});
				$prev.click(function () {
					publicMethod.prev();
				});
				$close.click(function () {
					publicMethod.close();
				});
				$overlay.click(function () {
					if (settings.get('overlayClose')) {
						publicMethod.close();
					}
				});
				
				// Key Bindings
				$(document).bind('keydown.' + prefix, function (e) {
					var key = e.keyCode;
					if (open && settings.get('escKey') && key === 27) {
						e.preventDefault();
						publicMethod.close();
					}
					if (open && settings.get('arrowKey') && $related[1] && !e.altKey) {
						if (key === 37) {
							e.preventDefault();
							$prev.click();
						} else if (key === 39) {
							e.preventDefault();
							$next.click();
						}
					}
				});

				if ($.isFunction($.fn.on)) {
					// For jQuery 1.7+
					$(document).on('click.'+prefix, '.'+boxElement, clickHandler);
				} else {
					// For jQuery 1.3.x -> 1.6.x
					// This code is never reached in jQuery 1.9, so do not contact me about 'live' being removed.
					// This is not here for jQuery 1.9, it's here for legacy users.
					$('.'+boxElement).live('click.'+prefix, clickHandler);
				}
			}
			return true;
		}
		return false;
	}

	// Don't do anything if Colorbox already exists.
	if ($.colorbox) {
		return;
	}

	// Append the HTML when the DOM loads
	$(appendHTML);


	// ****************
	// PUBLIC FUNCTIONS
	// Usage format: $.colorbox.close();
	// Usage from within an iframe: parent.jQuery.colorbox.close();
	// ****************
	
	publicMethod = $.fn[colorbox] = $[colorbox] = function (options, callback) {
		var settings;
		var $obj = this;
		//if(options.iframeHeight&&options.iframeHeight=='auto')
			//options.height = 500;
		options = options || {};

		if ($.isFunction($obj)) { // assume a call to $.colorbox
			$obj = $('<a/>');
			options.open = true;
		} else if (!$obj[0]) { // colorbox being applied to empty collection
			return $obj;
		}


		if (!$obj[0]) { // colorbox being applied to empty collection
			return $obj;
		}
		
		appendHTML();

		if (addBindings()) {

			if (callback) {
				options.onComplete = callback;
			}

			$obj.each(function () {
				var old = $.data(this, colorbox) || {};
				$.data(this, colorbox, $.extend(old, options));
			}).addClass(boxElement);

			settings = new Settings($obj[0], options);
			//alert($obj[0].width)
			
			if (settings.get('open')) {
				launch($obj[0]);
			}
		}
		
		return $obj;
	};

	publicMethod.position = function (speed, loadedCallback) {
		var
		css,
		top = 0,
		left = 0,
		offset = $box.offset(),
		scrollTop,
		scrollLeft;
		
		$window.unbind('resize.' + prefix);

		// remove the modal so that it doesn't influence the document width/height
		$box.css({top: -9e4, left: -9e4});

		scrollTop = $window.scrollTop();
		scrollLeft = $window.scrollLeft();

		if (settings.get('fixed')) {
			offset.top -= scrollTop;
			offset.left -= scrollLeft;
			$box.css({position: 'fixed'});
		} else {
			top = scrollTop;
			left = scrollLeft;
			$box.css({position: 'absolute'});
		}

		// keeps the top and left positions within the browser's viewport.
		if (settings.get('right') !== false) {
			left += Math.max($window.width() - settings.w - loadedWidth - interfaceWidth - setSize(settings.get('right'), 'x'), 0);
		} else if (settings.get('left') !== false) {
			left += setSize(settings.get('left'), 'x');
		} else {
			left += Math.round(Math.max($window.width() - settings.w - loadedWidth - interfaceWidth, 0) / 2);
		}
		
		if (settings.get('bottom') !== false) {
			top += Math.max(winheight() - settings.h - loadedHeight - interfaceHeight - setSize(settings.get('bottom'), 'y'), 0);
		} else if (settings.get('top') !== false) {
			top += setSize(settings.get('top'), 'y');
		} else {
			top += Math.round(Math.max(winheight() - settings.h - loadedHeight - interfaceHeight, 0) / 2);
		}

		$box.css({top: offset.top, left: offset.left, visibility:'visible'});
		
		// this gives the wrapper plenty of breathing room so it's floated contents can move around smoothly,
		// but it has to be shrank down around the size of div#colorbox when it's done.  If not,
		// it can invoke an obscure IE bug when using iframes.
		$wrap[0].style.width = $wrap[0].style.height = "9999px";
		
		function modalDimensions() {
			$topBorder[0].style.width = $bottomBorder[0].style.width = $content[0].style.width = (parseInt($box[0].style.width,10) - interfaceWidth)+'px';
			$content[0].style.height = $leftBorder[0].style.height = $rightBorder[0].style.height = (parseInt($box[0].style.height,10) - interfaceHeight)+'px';
		}
		//修改
		css = {width: settings.w + loadedWidth + interfaceWidth, height: settings.h + loadedHeight + interfaceHeight, top: top, left: left};
			//css.height = 450;
		// setting the speed to 0 if the content hasn't changed size or position
		if (speed) {
			var tempSpeed = 0;
			$.each(css, function(i){
				if (css[i] !== previousCSS[i]) {
					tempSpeed = speed;
					return;
				}
			});
			speed = tempSpeed;
		}

		previousCSS = css;

		if (!speed) {
			$box.css(css);
		}
		$box.dequeue().animate(css, {
			duration: speed || 0,
			complete: function () {
				modalDimensions();
				
				active = false;
				
				// shrink the wrapper down to exactly the size of colorbox to avoid a bug in IE's iframe implementation.
				$wrap[0].style.width = (settings.w + loadedWidth + interfaceWidth) + "px";
				$wrap[0].style.height = (settings.h + loadedHeight + interfaceHeight) + "px";
				
				if (settings.get('reposition')) {
					setTimeout(function () {  // small delay before binding onresize due to an IE8 bug.
						$window.bind('resize.' + prefix, publicMethod.position);
					}, 1);
				}

				if (loadedCallback) {
					loadedCallback();
				}
			},
			step: modalDimensions
		});
	};

	publicMethod.resize = function (options) {
		var scrolltop;
		
		if (open) {
			options = options || {};
			
			if (options.width) {
				settings.w = setSize(options.width, 'x') - loadedWidth - interfaceWidth;
			}

			if (options.innerWidth) {
				settings.w = setSize(options.innerWidth, 'x');
			}

			$loaded.css({width: settings.w});
			
			if (options.height) {
				settings.h = setSize(options.height, 'y') - loadedHeight - interfaceHeight;
			}

			if (options.innerHeight) {
				settings.h = setSize(options.innerHeight, 'y');
			}

			if (!options.innerHeight && !options.height) {
				scrolltop = $loaded.scrollTop();
				$loaded.css({height: "auto"});
				settings.h = $loaded.height();
			}

			$loaded.css({height: settings.h});

			if(scrolltop) {
				$loaded.scrollTop(scrolltop);
			}
			
			publicMethod.position(settings.get('transition') === "none" ? 0 : settings.get('speed'));
		}
	};

	publicMethod.prep = function (object) {
		if (!open) {
			return;
		}
		
		var callback, speed = settings.get('transition') === "none" ? 0 : settings.get('speed');

		$loaded.remove();

		$loaded = $tag(div, 'LoadedContent').append(object);
		
		function getWidth() {
			settings.w = settings.w || $loaded.width();
			settings.w = settings.mw && settings.mw < settings.w ? settings.mw : settings.w;
			return settings.w;
		}
		function getHeight() {
			settings.h = settings.h || $loaded.height();
			settings.h = settings.mh && settings.mh < settings.h ? settings.mh : settings.h;
			return settings.h;
		}
		
		$loaded.hide()
		.appendTo($loadingBay.show())// content has to be appended to the DOM for accurate size calculations.
		.css({width: getWidth(), overflow: settings.get('scrolling') ? 'auto' : 'hidden'})
		.css({height: getHeight()})// sets the height independently from the width in case the new width influences the value of height.
		.prependTo($content);
		
		$loadingBay.hide();
		
		// floating the IMG removes the bottom line-height and fixed a problem where IE miscalculates the width of the parent element as 100% of the document width.
		
		$(photo).css({'float': 'none'});

		setClass(settings.get('className'));

		callback = function () {
			var total = $related.length,
				iframe,
				complete;
			
			if (!open) {
				return;
			}
			
			function removeFilter() { // Needed for IE8 in versions of jQuery prior to 1.7.2
				if ($.support.opacity === false) {
					$box[0].style.removeAttribute('filter');
				}
			}
			
			complete = function () {
				clearTimeout(loadingTimer);
				$loadingOverlay.hide();
				trigger(event_complete);
				settings.get('onComplete');
				/*
				if(settings.get('iframeHeight')=='auto'){
					var h = iframe.contentWindow.document.body.clientHeight;
					var cc = $box.colorbox;
					if(iframe.bool==null){
						iframe.bool = true;
						cc.resize({
							height:h 
						});
					}
				}*/
				//here
			};
			$title.html(settings.get('title')).show();
			$loaded.show();
			
			if (total > 1) { // handle grouping
				if (typeof settings.get('current') === "string") {
					$current.html(settings.get('current').replace('{current}', index + 1).replace('{total}', total)).show();
				}
				
				$next[(settings.get('loop') || index < total - 1) ? "show" : "hide"]().html(settings.get('next'));
				$prev[(settings.get('loop') || index) ? "show" : "hide"]().html(settings.get('previous'));
				
				slideshow();
				
				// Preloads images within a rel group
				if (settings.get('preloading')) {
					$.each([getIndex(-1), getIndex(1)], function(){
						var img,
							i = $related[this],
							settings = new Settings(i, $.data(i, colorbox)),
							src = settings.get('href');

						if (src && isImage(settings, src)) {
							src = retinaUrl(settings, src);
							img = document.createElement('img');
							img.src = src;
						}
					});
				}
			} else {
				$groupControls.hide();
			}
			
			if (settings.get('iframe')) {
				iframe = document.createElement('iframe');
				if ('frameBorder' in iframe) {
					iframe.frameBorder = 0;
				}
				
				if ('allowTransparency' in iframe) {
					iframe.allowTransparency = "true";
				}

				if (!settings.get('scrolling')) {
					iframe.scrolling = "no";
				}
				
				$(iframe)
					.attr({
						src: settings.get('href'),
						name: (new Date()).getTime(), // give the iframe a unique name to prevent caching
						'class': prefix + 'Iframe',
						allowFullScreen : true // allow HTML5 video to go fullscreen
					})
					.one('load', complete)
					.appendTo($loaded);
				
				$events.one(event_purge, function () {
					iframe.src = "//about:blank";
				});

				if (settings.get('fastIframe')) {
					$(iframe).trigger('load');
				}
			} else {
				complete();
			}
			
			if (settings.get('transition') === 'fade') {
				$box.fadeTo(speed, 1, removeFilter);
			} else {
				removeFilter();
			}
		};
		
		if (settings.get('transition') === 'fade') {
			$box.fadeTo(speed, 0, function () {
				publicMethod.position(0, callback);
			});
		} else {
			publicMethod.position(speed, callback);
		}
	};

	function load () {
		var href, setResize, prep = publicMethod.prep, $inline, request = ++requests;
		
		active = true;
		
		photo = false;
		
		trigger(event_purge);
		trigger(event_load);
		settings.get('onLoad');
		
		settings.h = settings.get('height') ?
				setSize(settings.get('height'), 'y') - loadedHeight - interfaceHeight :
				settings.get('innerHeight') && setSize(settings.get('innerHeight'), 'y');
		
		settings.w = settings.get('width') ?
				setSize(settings.get('width'), 'x') - loadedWidth - interfaceWidth :
				settings.get('innerWidth') && setSize(settings.get('innerWidth'), 'x');
		
		// Sets the minimum dimensions for use in image scaling
		settings.mw = settings.w;
		settings.mh = settings.h;
		
		// Re-evaluate the minimum width and height based on maxWidth and maxHeight values.
		// If the width or height exceed the maxWidth or maxHeight, use the maximum values instead.
		if (settings.get('maxWidth')) {
			settings.mw = setSize(settings.get('maxWidth'), 'x') - loadedWidth - interfaceWidth;
			settings.mw = settings.w && settings.w < settings.mw ? settings.w : settings.mw;
		}
		if (settings.get('maxHeight')) {
			settings.mh = setSize(settings.get('maxHeight'), 'y') - loadedHeight - interfaceHeight;
			settings.mh = settings.h && settings.h < settings.mh ? settings.h : settings.mh;
		}
		
		href = settings.get('href');
		
		loadingTimer = setTimeout(function () {
			$loadingOverlay.show();
		}, 100);
		
		if (settings.get('inline')) {
			// Inserts an empty placeholder where inline content is being pulled from.
			// An event is bound to put inline content back when Colorbox closes or loads new content.
			$inline = $tag(div).hide().insertBefore($(href)[0]);

			$events.one(event_purge, function () {
				$inline.replaceWith($loaded.children());
			});

			prep($(href));
		} else if (settings.get('iframe')) {
			// IFrame element won't be added to the DOM until it is ready to be displayed,
			// to avoid problems with DOM-ready JS that might be trying to run in that iframe.
			prep(" ");
		} else if (settings.get('html')) {
			prep(settings.get('html'));
		} else if (isImage(settings, href)) {

			href = retinaUrl(settings, href);

			photo = document.createElement('img');

			$(photo)
			.addClass(prefix + 'Photo')
			.bind('error',function () {
				prep($tag(div, 'Error').html(settings.get('imgError')));
			})
			.one('load', function () {
				var percent;

				if (request !== requests) {
					return;
				}

				$.each(['alt', 'longdesc', 'aria-describedby'], function(i,val){
					var attr = $(settings.el).attr(val) || $(settings.el).attr('data-'+val);
					if (attr) {
						photo.setAttribute(val, attr);
					}
				});

				if (settings.get('retinaImage') && window.devicePixelRatio > 1) {
					photo.height = photo.height / window.devicePixelRatio;
					photo.width = photo.width / window.devicePixelRatio;
				}

				if (settings.get('scalePhotos')) {
					setResize = function () {
						photo.height -= photo.height * percent;
						photo.width -= photo.width * percent;
					};
					if (settings.mw && photo.width > settings.mw) {
						percent = (photo.width - settings.mw) / photo.width;
						setResize();
					}
					if (settings.mh && photo.height > settings.mh) {
						percent = (photo.height - settings.mh) / photo.height;
						setResize();
					}
				}
				
				if (settings.h) {
					photo.style.marginTop = Math.max(settings.mh - photo.height, 0) / 2 + 'px';
				}
				
				if ($related[1] && (settings.get('loop') || $related[index + 1])) {
					photo.style.cursor = 'pointer';
					photo.onclick = function () {
						publicMethod.next();
					};
				}

				photo.style.width = photo.width + 'px';
				photo.style.height = photo.height + 'px';

				setTimeout(function () { // A pause because Chrome will sometimes report a 0 by 0 size otherwise.
					prep(photo);
				}, 1);
			});
			
			setTimeout(function () { // A pause because Opera 10.6+ will sometimes not run the onload function otherwise.
				photo.src = href;
			}, 1);
		} else if (href) {
			$loadingBay.load(href, settings.get('data'), function (data, status) {
				if (request === requests) {
					prep(status === 'error' ? $tag(div, 'Error').html(settings.get('xhrError')) : $(this).contents());
				}
			});
		}
	}
		
	// Navigates to the next page/image in a set.
	publicMethod.next = function () {
		if (!active && $related[1] && (settings.get('loop') || $related[index + 1])) {
			index = getIndex(1);
			launch($related[index]);
		}
	};
	
	publicMethod.prev = function () {
		if (!active && $related[1] && (settings.get('loop') || index)) {
			index = getIndex(-1);
			launch($related[index]);
		}

	};

	// Note: to use this within an iframe use the following format: parent.jQuery.colorbox.close();
	publicMethod.close = function () {
		if (open && !closing) {
			
			closing = true;
			
			open = false;
			
			trigger(event_cleanup);
			settings.get('onCleanup');
			
			$window.unbind('.' + prefix);
			
			$overlay.fadeTo(settings.get('fadeOut') || 0, 0);
			
			$box.stop().fadeTo(settings.get('fadeOut') || 0, 0, function () {
			
				$box.add($overlay).css({'opacity': 1, cursor: 'auto'}).hide();
				
				trigger(event_purge);
				
				$loaded.remove();
				
				setTimeout(function () {
					closing = false;
					trigger(event_closed);
					settings.get('onClosed');
				}, 1);
			});
		}
	};

	// Removes changes Colorbox made to the document, but does not remove the plugin.
	publicMethod.remove = function () {
		if (!$box) { return; }

		$box.stop();
		$.colorbox.close();
		$box.stop().remove();
		$overlay.remove();
		closing = false;
		$box = null;
		$('.' + boxElement)
			.removeData(colorbox)
			.removeClass(boxElement);

		$(document).unbind('click.'+prefix);
	};

	// A method for fetching the current element Colorbox is referencing.
	// returns a jQuery object.
	publicMethod.element = function () {
		return $(settings.el);
	};

	publicMethod.settings = defaults;

}(jQuery, document, window));

/*Ajax*/
(function(){
	var createAjax = function(){
		if(window.XMLHttpRequest){
			return function(){
				return new XMLHttpRequest();
			}
		}else if(window.ActiveXObject){
			try{
				return function(){
					return new ActiveXObject('Msxml2.XMLHTTP');
				}
		   }catch(e){
				return function(){
					return new ActiveXObject('Microsoft.XMLHTTP');
				}
		   }
		}	
	}();
	TM.ajax = function(attr){
		if(this==window)
			return;
		var ajax = createAjax();
		var type = attr.type||'get';
		var syn = attr.syn||true;
		var url = attr.url;
		var data = '';
		var self = this;
		this.stop = function(){
			try{
				ajax.abort();	
				ajax = null;
			}catch(e){}
		}
		ajax.onreadystatechange = function(){
			if(attr.stateChange)
				attr.stateChange.call(self,ajax.readyState);
			if(ajax&&ajax.readyState==4){
				if((ajax.status>=200&&ajax.status<300)||ajax.status==304){
					if(attr.load){
						var ret = ajax.responseText.replace(/[ ]/g,'');
						try{
							ret = eval('('+ret+')');	
						}catch(e){}
						attr.load.call(self,ret,ajax.readyState,ajax.status);
						ajax = null;	
					}
				}else{
					if(attr.error)
						attr.error.call(self,ajax.readyState,ajax.status);
					ajax = null;
				}
			}
		}
		if(attr.data){
			if(TM.getType(attr.data)=='Object'){
				for(var i in attr.data){
					if(data=='')
						data = data+i+"="+attr.data[i];
					else
						data = data+"&"+i+"="+attr.data[i];
				}
			}else if(TM.getType(attr.data)=='String'){
				data = attr.data;
			}
		}
		if(type=='get'){
			url += (url.indexOf('?')=='-1'?'?':'&');
			url += encodeURIComponent(data);
			data = null;
		}
		ajax.open(type,url,syn);
		if(ajax&&attr.header)
			ajax.setRequestHeader.apply(ajax,attr.header);
		if(ajax)
			ajax.send(data);	
	}
})();

TM.String = {
	
remove:function(str,code,bool){
	if(!code)
		code = ' ';
	if(bool)
		return str.replace(code,'');
	var s = '';
	for (var i=0;i<str.length;i++) {
		s = s + str.substr(i, 1).replace(code,'');	
	}
	return s; 	
},
clear:function(str){
	return this.remove(str);
},	
trim:function(str){
	var a,b;
	for(var i=0;i<str.length;i++){
		if(str.charAt(i)!=' '){
			a = i;	
			break;
		}
	}
	for(var j=str.length-1;j>=0;j--){
		if(str.charAt(j)!=' '){
			b = j;	
			break;	
		}
	}
	return str.substring(a,b+1);
},
getDate:function(){//瀛楃涓茶浆鏃ユ湡瀵硅薄2000-11-11
	//var arr = this.split('-');

	//var date = Html.Date();
	//date.setFullYear(arr[0],(arr[1]-1),arr[2]);	
	//return date;	
},
getLength:function(str){
	var len = 0;
	for(var i=0;i<str.length;i++){
		if(TM.String.check(str.charAt(i),'chinese'))
			len += 2;
		else
			len += 1;	
	}
	return len;
},
check:function(str,type){
	var reg = ''; 
	if(type=='number'){//鏁板瓧
		reg = /^[0-9]+$/;		
	}else if(type=='string'){//瀛楁瘝
		reg = /^[A-Za-z]+$/;	
	}else if(type=='email'){//閭
		reg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;	
	}else if(type=='money'){//閲戦挶
		reg = /^[\+\-]?\d*?\.?\d*?$/; 
	}else if(type=='strAndnum'){//鏁板瓧鍜屽瓧姣�
		reg = /^[A-Za-z0-9]+$/; 	
	}else if(type=='strAndnumAnd_'){//鏁板瓧鍜屽瓧姣嶅拰涓嬪垝绾�
		reg = /^\w+$/; 	
	}else if(type=='chinese'){//涓枃
		reg = /^[\u4e00-\u9fa5],{0,}$/; 	
	}else if(type=='small'){//灏忓啓瀛楁瘝
		reg = /^[a-z]+$/;	
	}
	else if(type=='big'){//澶у啓瀛楁瘝
		reg = /^[A-Z]+$/; 	
	}else if(type=='id'){
		reg = /^\d{17}[xX0-9]$/;	
	}else if(type=='zk')//鎶樻墸
		reg = /^(\d+\.\d{1,1}|\d+)$/;
	else if(type=='text')
		reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
	else if(type=='phone')
		reg = /^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
	return reg.test(str);	
}

};

//反馈信
TM.showInfo = function(bool,text,seconds){
	seconds = seconds||1500;
	text = text||'提醒消息...';
	if($('.TM_showInfoBox').length>0)
		$('.TM_showInfoBox').remove();
	var id = TM.getId();
	var html = '<div class="TM_showInfoBox TM_radius " id="'+id+'"><div class="TM_showInfoCover"></div>';	
	if(bool)
		html += '<div class="TM_showInfo" style="color:#7bd472">'+text+'</div>';	
	else
		html += '<div class="TM_showInfo" style="color:#ff7575">'+text+'</div>';		
	html += '</div>';
	$(html).appendTo($('body'));
	TM.moveToCenter($('#'+id));
	TM.show($('#'+id),'left');
	setTimeout(function(){
		TM.hide($('#'+id),'left',function(){
			$('#'+id).remove();
		});
	},seconds+200);

}

//TM: select
TM.select = function(json){
	this.ready = false;
	this.iframeScroll = json.iframeScroll==null?false:json.iframeScroll;
	this.minWidth = 100;
	this.max = 5;
	this.len = 0;
	this.drag = false;
	this.json = json;
	this.init(json.box);
	this.setShow();
	if(json.options&&json.options.length>0){
		this.options = json.options;
		for(var i=0;i<json.options.length;i++){
			this.addMenu(json.options[i]);
		}
	}
	this.setHover();
	this.setHide();
	if(json.options&&json.options.length>this.max){
		//$('#'+this.menuId).css({height:json.options.length*25});
		this.setDrag();
		this.drag = true;
	}else{
		$('#'+this.menuId).css({height:json.options.length*28});
		$('#'+this.menuId).find('.TM_select_dragBox').hide();
	}
	this.setWidth(json.width);
	var index = json.index!=null?json.index:0;
	if($('#'+this.menuId).find('.TM_select_oneMenu')[index]!=null)
		this.setNow($('#'+this.menuId).find('.TM_select_oneMenu')[index]);	
}
TM.select.prototype = {
	getId:function(){
		return ('TM_select'+Math.random()+new Date().getTime()).replace('.','');
	},
	interval:null,
	setDeg:function(e,end){
		if(e.deg!=null&&e.deg==end){
			clearInterval(this.interval);
			return;
		}	
		var dir,index = 0;
		if(e.deg==null)
			e.deg = 0;
		if(e.deg>end)
			dir = -10;
		else if(e.deg<end)
			dir = 10;
			
		clearInterval(this.interval);
		var self = this;
		this.interval = setInterval(function(){
			e.deg = e.deg+dir;
			with(e.style){
				transform = 
				MsTransform =		
				WebkitTransform =	
				Otransform =		
				MozTransform = 'rotate('+e.deg+'deg)';		
			}	
			if(e.deg==end)
				clearInterval(self.interval);
		},10);	
	},
	init:function(box){
		var id = this.getId();
		this.id = id;
		this.menuId = 'TM_menu'+id;
		//var html = '<div class="TM_select_box" id="'+id+'">';
		
		var html = '<div class="TM_select" id="'+id+'">';
		html += '<span class="TM_select_titleLeft"></span>';
		html += '<span class="TM_select_titleRight"></span>';
		html += '</div>';
		
		var mHtml = '';
		mHtml += '<div class="TM_select_menu fixed" id="'+this.menuId+'">';
		mHtml += '<div class="TM_select_dragBox">';
		mHtml += '<div class="TM_select_drag"></div>';
		mHtml += '</div>';
		mHtml += '<div class="TM_select_menuBox"></div>';
		mHtml += '</div>';
		
		//html += '</div>';
		var self = this;
		$(html).appendTo($('#'+box));
		$(mHtml).appendTo($('body')).css({
			top:$('#'+this.id).offset().top+29,
			left:$('#'+this.id).offset().left
		});
		if(this.iframeScroll){
			var self = this;
			$('#'+this.menuId).css({
				position:'fixed'
			});
		}
	},
	addMenu:function(text){
		var html = '<a class="TM_select_oneMenu">';
		html += text;
		html += '</a>';
		var b = false;
		if($('#'+this.menuId).find('.TM_select_menuBox').html().length==0)
			b = true;
		$('#'+this.menuId).find('.TM_select_menuBox')[0].innerHTML += html;
		//alert($('#'+this.menuId).find('.TM_select_menuBox')[0].innerHTML);
		if(b)
			this.now = $('#'+this.menuId).find('.TM_select_oneMenu')[0];
		this.len++;
	},
	reset:function(){
		$('#'+this.menuId).remove();
		$('#'+this.id).remove();
		this.init(this.json.box);
		var json = this.json;
		this.setShow();
		if(json.options&&json.options.length>0){
			this.options = json.options;
			for(var i=0;i<json.options.length;i++){
				this.addMenu(json.options[i]);
			}
		}
		this.setHover();
		this.setHide();
		if(json.options&&json.options.length>this.max){
			//$('#'+this.menuId).css({height:json.options.length*25});
			this.setDrag();
			this.drag = true;
		}else{
			$('#'+this.menuId).css({height:json.options.length*28});
			$('#'+this.menuId).find('.TM_select_dragBox').hide();
		}
		this.setWidth(json.width);
		var index = json.index!=null?json.index:0;
		this.setNow($('#'+this.menuId).find('.TM_select_oneMenu')[index]);	
	},
	add:function(text,bool){
		this.json.options.push(text);
		this.json.index = this.getIndex();
		this.reset();
		return;
		this.len++;
		var html = '<a class="TM_select_oneMenu">';
		html += text;
		html += '</a>';
		
		$('#'+this.menuId).find('.TM_select_menuBox')[0].innerHTML += html;
		//$('#'+this.menuId).css({height:this.len*29});
		if(this.len>5){
			if(!this.drag){
				//$('#'+this.menuId).css({height:(this.len-1)*25});
				this.setDrag();
				$('#'+this.menuId).find('.TM_select_dragBox').show();
			}
		}else{
			//alert();
			//$('#'+this.menuId).css({height:(this.len)*29});	
		}
	},
	removeMenu:function(){
		
	},
	getLength:function(){
		return 	$('#'+this.menuId).find('.TM_select_oneMenu').length;	
	},
	getList:function(){
		var arr = $('#'+this.menuId).find('.TM_select_oneMenu');
		var _arr = [];
		for(var i=0;i<arr.length;i++){
			_arr.push(arr[i].innerHTML);	
		}
		return _arr;
	},
	setDrag:function(){
		var self = this;
		$('#'+this.menuId).find('.TM_select_dragBox').bind('mousedown',
		function(e){
			e = window.event||e;	
			var fn1,fn2;
			var y = e.clientY-this.offsetTop;
			if($('#'+self.menuId).find('.TM_select_menuBox')[0]._top==null)
				$('#'+self.menuId).find('.TM_select_menuBox')[0]._top = $('.TM_select_menuBox')[0].offsetTop;
			var l = $('#'+self.menuId).find('.TM_select_oneMenu').length-4;
			//var dir = ($('#'+self.menuId).find('.TM_select_menuBox')[0].offsetHeight-$('#'+self.menuId)[0].offsetHeight+(l*10))/$('#'+self.menuId)[0].offsetHeight;
			//document.title= $('#'+self.menuId).find('.TM_select_menuBox')[0].offsetHeight;
			var dir = ($('#'+self.menuId).find('.TM_select_menuBox')[0].offsetHeight-125)/85;
			$(document).bind('mousemove',function(e){
				var e = window.event||e;
				fn1 = arguments.callee;
				var y1 = e.clientY-y;
				if(y1>-1&&y1<86){
					var _t = ($('#'+self.menuId).find('.TM_select_menuBox')[0]._top-y1)*dir;

					$('#'+self.menuId).find('.TM_select_dragBox').css({top:y1+'px'});
					var len = $('#'+self.menuId).find('.TM_select_oneMenu').length;
					$('#'+self.menuId).find('.TM_select_menuBox').css({top:_t+'px'});
				}
			});
			$(document).bind('mouseup',function(e){
				fn2 = arguments.callee;
				$(document).unbind('mousemove',fn1);
				$(document).unbind('mouseup',fn2);									
			});																																						
		});	
	},
	noDrag:function(){
		
	},
	setShow:function(){
		var self = this;
		$('#'+this.id).click(function(){
			if($('#'+self.menuId).css('display')!='none')												
				self.hide();
			else
				self.show();
		});	
	},
	setHide:function(){
		var self = this;
		$(document).click(function(e){
			e = window.event||e;
			var target = e.target||e.srcElement;
			if((target!=$('#'+self.id)[0]&&target!=$('#'+self.menuId)[0]&&$('#'+self.menuId).has(target).length==0&&$('#'+self.id).has(target).length==0)||$(target).find('#'+self.id).length>0||$(target).find('#'+self.menuId).length>0)
				self.hide();
		})	
	},
	setHover:function(e){
		var self = this;
		$('#'+this.menuId).find('.TM_select_oneMenu').bind('click',function(){
			self.setNow(this);
			self.hide();
		});
	},
	show:function(){
		if($('#'+this.menuId).css('display')!='none')
			return;
		this.setDeg($('#'+this.id).find('.TM_select_titleRight')[0],180);
		if(this.iframeScroll){
			var self = this;
			var top = $(window.top).scrollTop();
			$('#'+this.menuId).css({
				top:$('#'+self.id).offset().top+29-top,
				left:$('#'+self.id).offset().left
			});
		}else{
			$('#'+this.menuId).css({
				top:$('#'+this.id).offset().top+29,
				left:$('#'+this.id).offset().left
			});	
		}
		
		$('#'+this.menuId).slideDown('fast');

	},
	hide:function(){
		if($('#'+this.menuId).css('display')!='none'){
			this.setDeg($('#'+this.id).find('.TM_select_titleRight')[0],0);
			$('#'+this.menuId).slideUp('fast');
		}
	},
	setNow:function(e){
		e = e.length!=null?e[0]:e;
		if(this.onBeforeChange){
			var arr = $('#'+this.menuId).find('.TM_select_oneMenu');
			var num;
			for(var i=0;i<arr.length;i++){
				if(arr[i]==e)
					num = i;
			}
			var callback = this.onBeforeChange(num);
			if(callback===false)
				return;
		}
		var b = false;
		if(this.now==null||this.now!=e)
			b = true;
		this.now = e;
		$('#'+this.menuId).find('.TM_select_oneMenu').removeClass('TM_select_now');
		$(e).addClass('TM_select_now');
		$('#'+this.id).find('.TM_select_titleLeft').html($(e).html());	
		if(b&&this.onChange)
			this.onChange();
	},
	setIndex:function(index){
		var arr = $('#'+this.menuId).find('.TM_select_oneMenu');
		this.setNow($('#'+this.menuId).find('.TM_select_oneMenu')[index]);	
	},
	setWidth:function(width){
		var width = width||this.minWidth;
		$('#'+this.menuId).css('width',width);
		$('#'+this.id).css('width',width);
		$('#'+this.menuId).find('.TM_select_menuBox').css('width',width-30);
	},
	getIndex:function(){//返回当前选中的索引
		var arr = $('#'+this.menuId).find('.TM_select_oneMenu');
		for(var i=0;i<arr.length;i++){
			if(arr[i]==this.now)
				return i;
		}
	},
	getOption:function(){
		return this.now;	
	},
	getValue:function(){
		return 	$('#'+this.id).find('.TM_select_titleLeft').html();
	}
};


//TM: tab
TM.tab = function(json){
	this.box = json.box;
	this.index = json.index;
	this.init(json.options,json.width);
	this.setFn();
	if(this.index!=null){
		$('#'+this.id).find('.TM_tab').removeClass('TM_tab_select');
		$($('#'+this.id).find('.TM_tab')[this.index]).addClass('TM_tab_select');
	}
}
TM.tab.prototype = {
	getId:function(){
		return ('TM_tab'+Math.random()+new Date().getTime()).replace('.','');
	},
	init:function(options,w){
		var id = this.getId();
		this.id = id;
		var html = '<div class="TM_tab_box" id="'+id+'">';
		for(var i=0;i<options.length;i++){
			var name = 'TM_tab';
			if(i==options.length-1)
				name += ' noMarginRight';
			html += '<a class="'+name+'">'+options[i]+'</a>';
		}
		html += '</div>';
		$(html).appendTo('#'+this.box);
		var arr = $('#'+this.id).find('.TM_tab');
		var width = 0;
		for(var i=0;i<arr.length;i++){
			width += arr[i].offsetWidth+5;
		}
		$('#'+this.id).css({width:width-5});
		if(w){
			$('#'+this.id).css({width:w});
		}
	},
	setFn:function(){
		var self = this;
		var arr = $('#'+this.id).find('.TM_tab');
		for(var i=0;i<arr.length;i++){
			arr[i].index = i;
			$(arr[i]).click(function(){
				var b = false;
				if(self.index!=this.index)
					b = true;
				self.index = this.index;
				$('#'+self.id).find('.TM_tab').removeClass('TM_tab_select');
				$(this).addClass('TM_tab_select');
				if(b&&self.onChange)
					self.onChange(self.index);
			});	
		}
	},
	change:function(x){
		var arr = $('#'+this.id).find('.TM_tab');
		$('#'+this.id).find('.TM_tab').removeClass('TM_tab_select');
		$($('#'+this.id).find('.TM_tab')[x]).addClass('TM_tab_select');
		this.index = $('#'+this.id).find('.TM_tab')[x].index;
		if(this.onChange)
			this.onChange(this.index);
	}
}

TM.checkBox = function(data){
	this.box = $('#'+data.id);
	this.multiple = data.multiple==null?false:data.multiple;
	this.notNull = data.notNull==null?false:data.notNull;
	this.check = typeof data.check=='number'?[data.check]:data.check;
	this.init(data);
	this.set();
}
TM.checkBox.prototype = {
	init:function(data){
		this.id = TM.getId();
		var html = '<div class="TM_radioBox" id="'+this.id+'">';
		for(var i=0;i<data.group.length;i++){
			html += '<span class="TM_radio_span">';
			html += '<a index="'+i+'" class="TM_radio TM_radio_noUse"></a>';
			html += '<span class="TM_radio_txt">'+data.group[i]+'</span>';
			html += '</span>';	
		}
		html += '</div>';
		$(html).appendTo($(this.box));
		var self = this;
		$('#'+this.id).find('.TM_radio_span').click(function(){
			if($(this).find('a').hasClass('TM_radio_use')){
				if(self.getCheck().length<=1){
					if(!self.notNull){
						$(this).find('a').removeClass('TM_radio_use').addClass('TM_radio_noUse');
						if(data.onChange) data.onChange.call(self);		
					}
				}else{
					$(this).find('a').removeClass('TM_radio_use').addClass('TM_radio_noUse');
					if(data.onChange) data.onChange.call(self);	
				}
			}else{
				if(self.getCheck().length==0||self.multiple){
					$(this).find('a').removeClass('TM_radio_noUse').addClass('TM_radio_use');
					if(data.onChange) data.onChange.call(self);	
				}
				else if(self.getCheck().length>0&&!self.multiple){
					$('#'+self.id).find('.TM_radio').removeClass('TM_radio_use').addClass('TM_radio_noUse');
					$(this).find('a').addClass('TM_radio_use');
					if(data.onChange) data.onChange.call(self);	
				}
			}
							
		});
	},
	getCheck:function(){
		var arr = $('#'+this.id).find('.TM_radio');
		var newArr = [];
		for(var i=0;i<arr.length;i++){
			if($(arr[i]).hasClass('TM_radio_use'))	
				newArr.push(i);
		}
		return newArr;
	},
	set:function(){
		var arr = $('#'+this.id).find('.TM_radio');	
		for(var i=0;i<this.check.length;i++){
			$($('#'+this.id).find('.TM_radio')[this.check[i]]).removeClass('TM_radio_noUse').addClass('TM_radio_use');
		}
	}
}

//TM: radio
TM.radio = function(json){
	this.box = typeof json.box=='string'?$('#'+json.box):json.box;
	this.multiple = json.multiple==null?false:json.multiple;
	//var cn = json.className||null;
	this.init(json.group);	
	this.setClick();
	if(json.check!=null){
		if(json.check>=0)
			$($('#'+this.id).find('.TM_radio')[json.check]).removeClass('TM_radio_noUse').addClass('TM_radio_use');
		this.check = json.check;
	}
}
TM.radio.prototype = {
	getId:function(){
		return ('TM_radio'+Math.random()+new Date().getTime()).replace('.','');
	},
	set:function(index){
		$('#'+this.id).find('.TM_radio_span')[index].click();	
	},
	clear:function(){
		this.check = -1;
		$('#'+this.id).find('.TM_radio').removeClass('TM_radio_use').addClass('TM_radio_noUse');
	},
	init:function(group){
		this.id = this.getId();
		var html = '<div class="TM_radioBox" id="'+this.id+'">';
		//var name = 'TM_radio TM_radio_noUse';
		//if(cn!=null)
			//name += ' '+cn;
		for(var i=0;i<group.length;i++){
			html += '<span class="TM_radio_span">';
			html += '<a index="'+i+'" class="TM_radio TM_radio_noUse"></a>';
			html += '<span class="TM_radio_txt">'+group[i]+'</span>';
			html += '</span>';	
		}
		html += '</div>';
		$(html).appendTo($(this.box));
	},
	setClick:function(){
		var self = this;
		$('#'+self.id).find('.TM_radio_span').click(function(){
			if(!self.multiple){
				var num = parseInt($(this).find('a').attr('index'));
				if($(this).find('a').attr('index')!=self.check){
					self.check = num;
					if(self.onChange)
						self.onChange(num);
				}
				
				$('#'+self.id).find('.TM_radio').removeClass('TM_radio_use').addClass('TM_radio_noUse');
			}
				//$('#'+self.id).find('.TM_radio').removeClass('TM_radio_use').addClass('TM_radio_noUse');
			if($(this).find('a').hasClass('TM_radio_noUse')){
				$(this).find('a').removeClass('TM_radio_noUse').addClass('TM_radio_use');
				
			}else{
				$(this).find('a').removeClass('TM_radio_use').addClass('TM_radio_noUse');
			}
			if(self.click)
				self.click();				//$(this).find('a').removeClass('TM_radio_noUse').addClass('TM_radio_use');
			//document.title = self.getRadio().index;
		});
	},
	getRadio:function(){
		var arr = $('#'+this.id).find('.TM_radio');
		var _arr = [];
		for(var i=0;i<arr.length;i++){
			if($(arr[i]).hasClass('TM_radio_use')){
				_arr.push({
					index:i,
					value:$(arr[i].parentNode).find('.TM_radio_txt').html()
				});
			}
		}
		return _arr;
	}
};
//设置按钮状态
TM.setButton = function(e,b,text){
	if(!e)
		return;
	if(e.length&&e[0].nodeName!=null)
		e = e[0];
	if(b){
		if(e.old==null)
			return;
		if(!$(e).hasClass('btnNormalDisabled')&&!$(e).hasClass('TM_button_Disabled'))
			return;
		text = text||e.old.value;
		e.onclick = e.old.onclick;
		if($(e).hasClass('btnNormalDisabled'))
			$(e).removeClass('btnNormalDisabled').addClass('btnNormal').html(text);
		else
			$(e).removeClass('TM_button_Disabled').html(text).css({background:e.old.bg});
		if(e.old.jqClick!=null)
			$(e).bind('click',e.old.jqClick['handler']);
	}else{
		if($(e).hasClass('btnNormalDisabled'))
			return;
		if($(e).hasClass('TM_button_Disabled'))
			return;
		text = text||e.innerHTML;
		e.old = {
			onclick:e.onclick,
			value:e.innerHTML,
			bg:$(e).css('background')
		}
		if($(e).data('events')!=null)
			e.old.jqClick = $(e).data('events')['click'][0];
		$(e).unbind('click');
		e.onclick = null;
		if($(e).hasClass('btnNormal'))
			$(e).addClass('btnNormalDisabled').removeClass('btnNormal').html(text);
		else
			$(e).addClass('TM_button_Disabled').css({background:'#ccc'}).html(text);
	}
}

TM.colorBox = function(json){
	this.init(json);
}
TM.colorBox.prototype.getId = function(){
	return ('TM_colorBox'+Math.random()+new Date().getTime()).replace('.','');
}
TM.colorBox.prototype.stop = function(){
	this.stopHide = true;	
}
TM.colorBox.prototype.open = function(){
	this.stopHide = false;	
}
TM.colorBox.prototype.init = function(json){
	var self = this;
	var id = this.getId();
	this.id = id;
	this.coverId = this.getId();
	var iframeId = this.getId();
	this.stopHide = false;
	var cover = '<div class="TM_colorBox_cover" id="'+this.coverId+'"></div>';
	//var html = '<div class="TM_colorBox_cover">';
	var html = '';
	html += '<div class="TM_colorBox" id="'+id+'">';	
	html += '<div class="TM_colorBox_head">';
	html += json.title||'';
	html += '</div>';
	html += '<span class="close" title="关闭"></span>';
	html += '<div class="TM_colorBox_main">';
	if(json.iframe!=null){
		var iframe = '<iframe frameborder="0" id="'+iframeId+'" style="width:100%; height:100%;" src="'+json.iframe+'" class="TM_colorBox_iframe"></iframe>';
		html += iframe;
	}else
		html += json.innerHTML||'';
	html += '</div>';
	html += '<div class="TM_colorBox_foot">';
	if(json.btnHide==null||!json.btnHide){
		html += '<a href="javascript:void(0)" class="TM_colorBox_btnQuit btnNormal">';
		html += '取消</a>';
		html += '<a href="javascript:void(0)" class="TM_colorBox_btnOk btnNormal">';
		html += '确定</a>';
	}
	html += '</div>';
	html += '</div>';
	//html += '</div>';
	var doc = json.doc||document;
	this.doc = doc;
	$(cover).appendTo($(doc.body));
	$(html).appendTo($(doc.body));
	if(json.ready)
		json.ready.call(self);
	$('#'+iframeId).bind('load',function(){
		if(json.iframeload)
			json.iframeload.call(self);										
	});
	//var height = $(doc.body).find('.TM_colorBox')[0].offsetHeight;
	if(json.top!=null)
		$(doc.body).find('#'+this.id).css({top:json.top});
	if(json.left!=null)
		$(doc.body).find('#'+this.id).css({left:json.left});
	if(json.width!=null)
		$(doc.body).find('#'+this.id).css({width:json.width});
	if(json.height!=null){
		$(doc.body).find('#'+this.id).css({height:json.height});
		$(doc.body).find('#'+this.id).find('.TM_colorBox_main').css({height:json.height-107});
	}else{
		$(doc.body).find('#'+this.id).css({paddingBottom:40});
	}
	if(json.drag)
		TM.dragMove($(doc.body).find('#'+this.id)[0]);
	//$(doc.body).find('.TM_colorBox_main').css({height:json.height-107});
	var height = $(doc.body).find('#'+this.id)[0].offsetHeight;
	var width = $(doc.body).find('#'+this.id)[0].offsetWidth;
	if(json.left==null)
		$(doc.body).find('#'+this.id).css({left:($(window).width()-width)/2});
	if(json.top==null)
		$(doc.body).find('#'+this.id).css({top:($(window).height()-height)/2});
	$(doc.body).find('#'+this.id).css({top:$(doc.body).find('#'+this.id)[0].offsetTop-20});
	var top = $(doc.body).find('#'+this.id)[0].offsetTop;
	$(doc.body).find('#'+this.id).animate({
		filter:'alpha(opacity=100)',
		MozOpacity:1,
		opacity:1,
		top:top+20
	},100,function(){
		if(json.onload)
			json.onload.call(self);	
	});
	/*
	$(doc.body).find('.TM_colorBox').css({width:0,height:0}).css({visibility:'visible'}).animate({
		width:400,
		marginLeft:-200,
		height:height,
		marginTop:-1*height/2
	},'fast',function(){
		$(doc.body).find('.TM_colorBox_foot a').css({visibility:'visible'});
	});
	*/
	this.close = function(){
		hide();
	}
	var hide = function(){
		//$(doc.body).find('#'+self.id).find('.TM_colorBox_foot a').css({visibility:'hidden'});
		$(doc.body).find('#'+self.id).animate({
			filter:'alpha(opacity=0)',
			MozOpacity:0,
			opacity:0,
			top:top-20
		},120,function(){
			//$($(doc.body).find('#'+self.id)[0].parentNode).remove();
			if(json.clear==true){
				TM.close();		
			}
			$($(doc.body).find('#'+self.id)[0]).remove();
			$($(doc.body).find('#'+self.coverId)[0]).remove();
		});
	}
	$(doc.body).find('#'+this.id).find('.close').click(function(){
		if(json.click)
			json.click.call(self,false);
		if(!self.stopHide)
			hide();
	});
	$(doc.body).find('#'+this.id).find('.TM_colorBox_foot a').click(function(){
		var bool;
		if($(this).hasClass('TM_colorBox_btnOk'))
			bool = true;
		else if($(this).hasClass('TM_colorBox_btnQuit'))
			bool = false;
		if(json.click)
			json.click.call(self,bool);
		if(!self.stopHide)
			hide();
	});
}
TM.colorBox.prototype.refresh = function(){
	var height = $(this.doc.body).find('#'+this.id)[0].offsetHeight;
	var width = $(this.doc.body).find('#'+this.id)[0].offsetWidth;
	$(this.doc.body).find('#'+this.id).css({left:($(window).width()-width)/2});
	$(this.doc.body).find('#'+this.id).css({top:($(window).height()-height)/2});	
}
TM.colorBox.prototype.getButton = function(){
	return $('#'+this.id).find('.TM_colorBox_foot a');
}
TM.colorBox.prototype.getIframe = function(){
	return $(this.doc.body).find('#'+this.id).find('iframe')[0];
}

TM.loading = {
	getId:function(){
		return ('TM_loading'+Math.random()+new Date().getTime()).replace('.','');
	},
	interval:null,
	init:function(msg){
		var html;
		if($('body').find('.TM_loading_box').length>0){
			html = $('body').find('.TM_loading_box');
			html.show();
			return html;
		}else{
			var id = this.getId();
			this.id = id;
			msg = msg||'加载中...';
			html = '<div class="TM_loading_box" id="'+id+'">';
			html += '<div class="TM_loading_title">'+msg+'</div>';
			html += '<div class="TM_loading_div">';
			html += '<div class="TM_loading_long">';
			html += '<div class="TM_loading_short">';
			html += '</div></div></div></div>';

			$(html).appendTo($('body'));
			return $('body').find('#'+id);
		}
	},
	run:function(msg){
		if($('body').find('.TM_loading_box').length>0)
			return;
		var e = this.init(msg);
		var width = $(e).find('.TM_loading_long')[0].offsetWidth;
		var short = $(e).find('.TM_loading_short')[0];
		//width += width+$(e).find('.TM_loading_short')[0].offsetWidth;
		var self = this;
		this.interval = setInterval(function(){
			var left = short.offsetLeft;
			$(e).find('.TM_loading_short').css({
				left:left+1							   
			});
			if(short.offsetLeft>=width){
				$(e).find('.TM_loading_short').css({
					left:short.offsetWidth*-1							   
				});
			}
		},10);				
	},
	stop:function(){
		clearInterval(this.interval);
		$('body').find('#'+this.id).remove();
	}
}

/*分页*/
TM.page = function(boxId,nowPage,pageCount,pageNum,count){
	this.nowPage = nowPage==null||nowPage==''?1:parseInt(nowPage);
	this.pageCount = pageCount==null?1:parseInt(pageCount);
	//if(this.count<=0)
		//return;
	if(this.pageCount<this.nowPage){
		this.nowPage = this.pageCount;		
	}
	this.boxId = boxId;
	this.point = '<div class="TM_page_point">&nbsp;&nbsp;...&nbsp;&nbsp;</div>';
	this.pageNum = pageNum||10;
	this.count = count||0;
	this.start = (this.pageNum*this.nowPage)-1;
	this.init(boxId);
}
TM.page.prototype.del = function(){
	this.start++;
	this.count--;
	if(this.addRow)
		this.addRow(this.start);
	this.pageCount = Math.ceil(this.count/this.pageNum);
	this.clear();
	this.reset();
}
TM.page.prototype.init = function(boxId){
	var html = '<div class="TM_page">';
	//html += '<div class="TM_changePage" type="prev">上一页</div>';
	//html += '<div class="TM_changePage" type="first">首页</div>';
	html += this.createPage();
	//html += '<div class="TM_changePage" type="end">尾页</div>';
	var name = 'TM_changePage';
	if(this.nowPage==this.pageCount)
		name = 'TM_noNext';
	html += '<a class="'+name+'" type="next">下一页</a>';
	html += '<div style="clear:both"></div></div>'
	$(html).appendTo($('#'+boxId));
	var self = this;
	$('#'+boxId).find('.TM_onePage').click(function(){
		if(!$(this).hasClass('TM_nowPage')){
			if(self.onChange){
				self.onChange(parseInt($(this).attr('index')));
			}
		}
	});
	
	$('#'+boxId).find('.TM_changePage').click(function(){
		if(self.nowPage==self.pageCount)											   			return;
		var num = self.nowPage;
		/*
		if($(this).attr('type')=='prev')
			num--;
		else if($(this).attr('type')=='next')
			num++;		
		else if($(this).attr('type')=='first')
			num = 1;		
		else if($(this).attr('type')=='end')
			num = self.count;
		*/
		num++;
		num = num<1?1:num;
		num = num>self.pageCount?self.pageCount:num;
		if(self.onChange){
			self.onChange(num);
		}
	});
}
TM.page.prototype.createPage = function(){
	var html = '';
	if(this.pageCount<=5){
		for(var i=1;i<=this.pageCount;i++){
			var name = 'TM_onePage';
			if(i==this.nowPage)
				name += ' TM_nowPage';
			html += '<a class="'+name+'" index="'+i+'">'+i+'</a>';
		}
	}else{
		for(var i=this.nowPage-2;i<=this.nowPage+2;i++){
			if(i>=1&&i<=this.pageCount){
				var name = 'TM_onePage';
				if(i==this.nowPage)
					name += ' TM_nowPage';
				html += '<a class="'+name+'" index="'+i+'">'+i+'</a>';	
			}
		}
		if(this.nowPage-2>1){
			var str = '<a class="TM_onePage" index="1">1</a>';
			if(this.nowPage-2>2)
				str += this.point;
			html = str + html;
		}
		if(this.nowPage+2<this.pageCount){
			var str = '<a class="TM_onePage" index="'+this.pageCount+'">'+this.pageCount+'</a>';
			if(this.nowPage+3<this.pageCount)
				str = this.point + str;
			html = html+str;
		}
	}
	return html;
}
TM.page.prototype.change = function(x){
	if(this.onChange)
		this.onChange(x);
}
TM.page.prototype.reset = function(){
	this.init(this.boxId);
}
TM.page.prototype.clear = function(){
	$('#'+this.boxId).html('');
}

//为不支持HTML5的浏览器设置input的初始值
TM.setAllInput = function(){
	if(window.Worker)
		return;
	var input = $('input[type=text]');
	var textarea = $('textarea');
	var xxx = 0;
	//alert($('#username').attr('ready'));	
	var fn = function(arr){
		$(arr).each(function(a,b){
			if($(this).attr('ready')==null||$(this).attr('ready')==''){
				if(this.value.length==0)
					$(this).val($(this).attr('placeholder')).attr({ready:'false'}).removeClass('placeholder').addClass('placeholder');
				else
					$(this).attr({ready:'true'});
				$(this).bind('focus',function(){
					//document.title = $('#username').attr('ready');
					//alert($('#username').attr('ready'));
					if($(this).attr('ready')=='false')
						$(this).val('').removeClass('placeholder');
				});
				/*
				$(this).bind('input propertychange',function(){
					if(this.value.length==0)												 						$(this).val($(this).attr('placeholder')).attr({ready:'false'}).removeClass('placeholder').addClass('placeholder');
					else
						$(this).attr({ready:'true'});
				});
				*/
				$(this).bind('blur',function(){
					//document.title = $('#username').attr('set');
					if(this.value.length==0)
						$(this).val($(this).attr('placeholder')).attr({ready:'false',set:'true'}).removeClass('placeholder').addClass('placeholder');
					else{
						
						if($(this).attr('set')!='false')
							$(this).attr({ready:'true'});
						//document.title = $(this).attr('ready');
					}
					//alert($('#username').attr('set'))
					//document.title = $('#username').attr('set');
				});	
			}else{
				if($(this).attr('ready')=='true'){
					//$(this).val($(this).attr('placeholder'))
				}else{
					if($(this).attr('set')!='false')
						$(this).val($(this).attr('placeholder')).addClass('placeholder');
				}
			}
		});	
	}
	fn(input);
	fn(textarea);

}

TM.setInput = function(e){
	if(window.Worker)
		return;
	if(e==null||e.nodeName!='INPUT')
		return;
	if(e.value.length==0)
		$(e).val($(e).attr('placeholder')).attr({ready:'false',set:'false'}).removeClass('placeholder').addClass('placeholder');
	else
		$(e).attr({ready:'true'});
	e.blur();
}

//保存或者提交时清除JS设置input的value
TM.clearAllInput = function(){
	if(window.Worker)
		return;
	var input = $('input[ready=false]');
	var textarea = $('textarea[ready=false]');
	input.val('');
	textarea.val('');
}

TM.close = function(type){
	if(type==null){
		TM.loading.stop();
		TM.close('confirm');
		TM.close('alert');
	}else{
		if(type=='confirm'){
			if($('body').find('.TM_confirm_box').length==0)
				return;
			var top = $('body').find('.TM_confirm_box')[0].offsetTop;
			$('body').find('.TM_confirm_box').animate({
				top:top-20,
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				opacity:0
			},120,function(){
				$('body').find('.TM_confirm_cover').remove();
				$('body').find('.TM_confirm_box').remove();
			});		
		}else if(type=='alert'){
			if($('body').find('.TM_alert_box').length==0)
				return;
			var top = $('body').find('.TM_alert_box')[0].offsetTop;
			$('body').find('.TM_alert_box').animate({
				top:top-20,
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				opacity:0
			},120,function(){
				$('body').find('.TM_alert_cover').remove();
				$('body').find('.TM_alert_box').remove();	
			});	
		}
	}
}


TM.window = function(data){
	this.init(data);
}

TM.window.prototype = {
	init:function(data){
		this.able = false;
		this.id = TM.getId();
		this.iframeId = TM.getId();
		var self = this;
		var html = '<div class="TM" id="'+this.id+'">';
		html += '<div class="TM_cover"></div>';
		html += '<div class="TM_window">';
		html += '<div class="TM_window_head">';
		html += data.title||'';
		html += '</div>';
		html += '<a class="TM_window_close" title="关闭">&times;</a>';	
		//html += '<div class="TM_window_main">';
		if(data.iframe!=null){
			html += '<div class="TM_window_main">';
			var iframe = '<iframe frameborder="0" id="'+this.iframeId+'" style="width:100%; height:100%;" src="'+data.iframe+'" class="TM_window_iframe"></iframe>';
			html += iframe;
		}else{
			html += '<div class="TM_window_main">';
			html += data.innerHTML||'';
		}
		html += '</div>';
		html += '<div class="TM_window_foot">';
		html += '<a href="javascript:void(0)" class="TM_window_btnOk TM_button btnNormal">';
		html += '确定</a>';
		html += '<a href="javascript:void(0)" class="TM_window_btnQuit TM_button btnNormal">';
		html += '取消</a>';
		html += '</div>';
		html += '</div></div>';
		$(html).appendTo($('body'));
		if(data.width)
			$('#'+this.id).find('.TM_window').css({width:data.width});
		if(data.height)
			$('#'+this.id).find('.TM_window').css({height:data.height});
		TM.moveToCenter($('#'+this.id).find('.TM_window'));
		$('#'+this.id).find('.TM_window_foot a').click(function(){
			if(data.click){
				var bool;
				if($(this).hasClass('TM_window_btnOk'))
					bool = true;
				else if($(this).hasClass('TM_window_btnQuit'))
					bool = false;
				if(data.click)
					data.click.call(self,bool);	
			}else
				self.close();
		});	
		$('#'+this.id).find('.TM_window_close').click(function(){
			if(data.click)
				data.click.call(self,false);
			else
				self.close();
		});
		if(data.ready)
			data.ready.call(self);
		if(data.iframeload){
			$('#'+this.iframeId).bind('load',function(){
				data.iframeload.call(self);										
			});	
		}
	},
	lock:function(b){
		this.able = b;		
	},
	close:function(){
		//关闭窗口时关闭可能在窗口中的select下拉菜单
		if(this.able)
			return;
		$('.TM_select_menu').hide();
		$('#'+this.id).remove();
	},
	find:function(code){
		return $('#'+this.id).find('.TM_window_main').find(code);	
	},
	getButton:function(){
		return $('#'+this.id).find('.TM_window_foot a');
	},
	getIframe:function(){
		return $('#'+this.iframeId)[0];
	}
}


//新加入的
TM.window = function(json){
	this.init(json);
}
TM.window.prototype = {
	getId:function(){
		return ('TM_colorBox'+Math.random()+new Date().getTime()).replace('.','');	
	},
	init:function(json){
		this.able = false;
		var self = this;
		var id = this.getId();
		this.id = id;
		this.coverId = this.getId();
		var iframeId = this.getId();
		this.stopHide = false;
		var cover = '<div class="TM_colorBox_cover" id="'+this.coverId+'"></div>';
		//var html = '<div class="TM_colorBox_cover">';
		var html = '';
		html += '<div class="TM_colorBox" id="'+id+'">';	
		html += '<div class="TM_colorBox_head">';
		html += json.title||'';
		html += '</div>';
		html += '<span class="close" title="关闭"></span>';
		html += '<div class="TM_colorBox_main">';
		if(json.iframe!=null){
			var iframe = '<iframe frameborder="0" id="'+iframeId+'" style="width:100%; height:100%;" src="'+json.iframe+'" class="TM_colorBox_iframe"></iframe>';
			html += iframe;
		}else
			html += json.innerHTML||'';
		html += '</div>';
		html += '<div class="TM_colorBox_foot">';
		if(json.btnHide==null||!json.btnHide){
			html += '<a href="javascript:void(0)" class="TM_colorBox_btnQuit btnNormal">';
			html += '取消</a>';
			html += '<a href="javascript:void(0)" class="TM_colorBox_btnOk btnNormal">';
			html += '确定</a>';
		}
		html += '</div>';
		html += '</div>';
		//html += '</div>';
		var doc = json.doc||document;
		this.doc = doc;
		$(cover).appendTo($(doc.body));
		$(html).appendTo($(doc.body));
		if(json.ready)
			json.ready.call(self);
		$('#'+iframeId).bind('load',function(){
			if(json.iframeload)
				json.iframeload.call(self);										
		});
		//var height = $(doc.body).find('.TM_colorBox')[0].offsetHeight;
		if(json.top!=null)
			$(doc.body).find('#'+this.id).css({top:json.top});
		if(json.left!=null)
			$(doc.body).find('#'+this.id).css({left:json.left});
		if(json.width!=null)
			$(doc.body).find('#'+this.id).css({width:json.width});
		if(json.height!=null){
			$(doc.body).find('#'+this.id).css({height:json.height});
			$(doc.body).find('#'+this.id).find('.TM_colorBox_main').css({height:json.height-107});
		}else{
			$(doc.body).find('#'+this.id).css({paddingBottom:40});
		}
		if(json.drag)
			TM.dragMove($(doc.body).find('#'+this.id)[0]);
		//$(doc.body).find('.TM_colorBox_main').css({height:json.height-107});
		var height = $(doc.body).find('#'+this.id)[0].offsetHeight;
		var width = $(doc.body).find('#'+this.id)[0].offsetWidth;
		if(json.left==null)
			$(doc.body).find('#'+this.id).css({left:($(window).width()-width)/2});
		if(json.top==null)
			$(doc.body).find('#'+this.id).css({top:($(window).height()-height)/2});
		$(doc.body).find('#'+this.id).css({top:$(doc.body).find('#'+this.id)[0].offsetTop-20});
		var top = $(doc.body).find('#'+this.id)[0].offsetTop;
		$(doc.body).find('#'+this.id).animate({
			filter:'alpha(opacity=100)',
			MozOpacity:1,
			opacity:1,
			top:top+20
		},100,function(){
			if(json.onload)
				json.onload.call(self);	
		});
	
		this.close = function(){
			if(this.able)
				return;
			hide();
		}
		var hide = function(){
			$(doc.body).find('#'+self.id).animate({
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				opacity:0,
				top:top-20
			},120,function(){
				//$($(doc.body).find('#'+self.id)[0].parentNode).remove();
				if(json.clear==true){
					TM.close();		
				}
				$($(doc.body).find('#'+self.id)[0]).remove();
				$($(doc.body).find('#'+self.coverId)[0]).remove();
			});
		}
		$(doc.body).find('#'+this.id).find('.close').click(function(){
			if(json.click)
				json.click.call(self,false);
		});
		$(doc.body).find('#'+this.id).find('.TM_colorBox_foot a').click(function(){
			var bool;
			if($(this).hasClass('TM_colorBox_btnOk'))
				bool = true;
			else if($(this).hasClass('TM_colorBox_btnQuit'))
				bool = false;
			if(json.click)
				json.click.call(self,bool);
		});	
	},
	lock:function(b){
		this.able = b;		
	},
	refresh:function(){
		var height = $(this.doc.body).find('#'+this.id)[0].offsetHeight;
		var width = $(this.doc.body).find('#'+this.id)[0].offsetWidth;
		$(this.doc.body).find('#'+this.id).css({left:($(window).width()-width)/2});
		$(this.doc.body).find('#'+this.id).css({top:($(window).height()-height)/2});	
	},
	getButton:function(){
		return $('#'+this.id).find('.TM_colorBox_foot a');	
	},
	getIframe:function(){
		return $('#'+this.id).find('#'+this.id).find('iframe')[0];
	},
	find:function(code){
		return $('#'+this.id).find('.TM_colorBox_main').find(code);	
	}
}

TM.Confirm = function(data){
	this.init(data);
}
TM.Confirm.prototype = {
	init:function(data){
		this.able = false;
		this.id = TM.getId();
		var btnHtml = '';
		btnHtml += '<a href="javascript:void(0)" class="TM_Confirm_btnOk btnNormal">';
		btnHtml += '<span>确认</span></a>';
		btnHtml += '<a href="javascript:void(0)" class="TM_Confirm_btnQuit btnNormal">';
		btnHtml += '<span>取消</span></a>';
		var cover = '<div class="TM_Confirm_cover"></div>';
		var html = '';
		//html += '<div class="TM_confirm_cover">';
		html += '<div class="TM_Confirm_box" id="'+this.id+'"><div class="TM_confirm_h1">'+(data.title||'')+'</div>',
		html += '<div class="TM_Confirm_p">'+data.message+'</div>';
		html += '<div class="TM_Confirm_buttonBox">'+btnHtml+'</div>';
		html += '</div>';	
		
		var doc = data.doc||document;
	
		$(cover).appendTo($(doc.body));
		$(html).appendTo($(doc.body));
		var self = this;
		$(doc.body).find('.TM_Confirm_box').css({
			top:$(doc.body).find('.TM_Confirm_box')[0].offsetTop-20								
		});
		var top = $(doc.body).find('.TM_Confirm_box')[0].offsetTop;
		$(doc.body).find('.TM_Confirm_box').animate({
			top:top+20,
			filter:'alpha(opacity=100)',
			MozOpacity:1,
			opacity:1
		},100);
		this.close = function(){
			if(this.able)
				return;
			$(doc.body).find('.TM_Confirm_box').animate({
				top:top-20,
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				opacity:0
			},120,function(){
				$(doc.body).find('.TM_Confirm_cover').remove();
				$(doc.body).find('.TM_Confirm_box').remove();
			});			
		}
		$(doc.body).find('.TM_Confirm_buttonBox .TM_Confirm_btnOk').click(function(){			
			if(data.click)
				data.click.call(self,true);
		});
		$(doc.body).find('.TM_Confirm_buttonBox .TM_Confirm_btnQuit').click(function(){
			if(data.click)
				data.click.call(self,false);		
		});
	},
	getButton:function(){
		return $('#'+this.id).find('.TM_Confirm_buttonBox a');	
	},
	lock:function(b){
		this.able = b;		
	}
}




})(window);