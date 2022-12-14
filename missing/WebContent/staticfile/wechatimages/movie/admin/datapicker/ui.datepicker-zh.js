/* Japanese initialisation for the jQuery UI date picker plugin. */
/* Written by Kentaro SATO (kentaro@ranvis.com). */
jQuery(function($){
	$.datepicker.regional['zh'] = {
		closeText: '关闭',
		prevText: '&#x3c;之前',
		nextText: '其次&#x3e;',
		currentText: '今天',
		monthNames: ['年 1月','年 2月','年 3月','年 4月','年 5月','年 6月',
				'年 7月','年 8月','年 9月','年 10月','年 11月','年 12月'],
		monthNamesShort: ['1月','2月','3月','4月','5月','6月',
				'7月','8月','9月','10月','11月','12月'],
		dayNames: ['日星期','一星期','二星期','三星期','四星期','五星期','六星期'],
		dayNamesShort: ['日','一','二','三','四','五','六'],
		dayNamesMin: ['日','一','二','三','四','五','六'],
		dateFormat: 'yy-mm-dd', firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		beforeShow: function(input) {$(".ui-datepicker").css("z-index","9998");}
	}; 
	$.datepicker.setDefaults($.datepicker.regional['zh']);
});