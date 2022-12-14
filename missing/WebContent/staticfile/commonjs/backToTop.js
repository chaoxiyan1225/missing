$(document).ready(function() {
	//棣栧厛灏�#back-to-top闅愯棌
	$("#cbbfixed").hide();
	//褰撴粴鍔ㄦ潯鐨勪綅缃浜庤窛椤堕儴100鍍忕礌浠ヤ笅鏃讹紝璺宠浆閾炬帴鍑虹幇锛屽惁鍒欐秷澶�
	$(function() {
		$(window).scroll(function() {
			if ($(window).scrollTop() > 100) {
				$("#cbbfixed").fadeIn(500);
			} else {
				$("#cbbfixed").fadeOut(500);
			}
		});
		//褰撶偣鍑昏烦杞摼鎺ュ悗锛屽洖鍒伴〉闈㈤《閮ㄤ綅缃�
		$("#cbbfixed").click(function() {
			$('body,html').animate({
				scrollTop: 0
			},
			1000);
			return false;
		});
	});
});