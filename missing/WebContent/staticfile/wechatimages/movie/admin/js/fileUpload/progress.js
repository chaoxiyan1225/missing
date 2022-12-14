//进度条
(function(){
		  
window.progress = function(top,left){
	factory.init(this);
}	
progress.prototype.run = function(point){
	point = parseInt(point);
	var menu = factory.getMenu(this);
	if(point<=menu.percent)
		return;
	var self = this;
	var box = menu.box;
	box.show();
	this.stop();
	var d1 = $(box).find('.progress_show_d1');
	var d2 = $(box).find('.progress_show_d2');
	this.interval = setInterval(function()
	{
		d1.css('clip','rect(0,'+(menu.percent*400/100)+'px,'+20+'px,0)');
		menu.percent++;
		d1.html(menu.percent+'%');
		d2.html(menu.percent+'%');
		if(menu.percent==point)
		{
			d1.css('clip','rect(0,'+point*400/100+'px,'+20+'px,0)');
			self.stop();
		}	
		if(menu.percent>=menu.end)
		{
			d1.css('clip','rect(0,'+menu.end*400/100+'px,'+20+'px,0)');
			self.stop();
			box.remove();
			if(self.loadOver)
				self.loadOver();	
		}
	},1);	
}
progress.prototype.stop = function(){
	clearInterval(this.interval);		
}
progress.prototype.loadOver = function(){}

var factory = {
	menu:[],
	init:function(obj,top,left){
		var tId = 'progress_show_box'+this.menu.length;
		var json = {
			tId:tId,
			percent:0,
			end:100,
			obj:obj,
			top:top,
			left:left
		}
		this.menu.push(json);
		this.create(json)
	},
	getMenu:function(obj){
		for(var i=0;i<this.menu.length;i++){
			if(this.menu[i].obj==obj)
				return this.menu[i];
		}
	},
	create:function(json){
		var mainHtml = '<div class="progress_show_box" id="'+json.tId+'">';
		mainHtml += '<div class="progress_show_title">加载中,请稍后....</div>';
		mainHtml += '<div class="progress_show_div">';
		mainHtml += '<div class="progress_show_d1">0%</div>';
		mainHtml += '<div class="progress_show_d2">0%</div>';
		mainHtml += '';
		mainHtml += '</div>';
		mainHtml += '</div>';
		document.body.innerHTML += mainHtml;
		json.box = $('#'+json.tId);
		var top = json.top||document.body.scrollTop+((document.documentElement.clientHeight-60)/2)+'px';
		var left = json.left||document.body.scrollLeft+((document.documentElement.clientWidth-402)/2)+'px';
		json.box.css({top:top,left:left});
	}
}

})();