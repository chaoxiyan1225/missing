	function showMessage(message,type,time) {
	    let str = '';
	    switch (type) {
	        case 'success':
	            str = '<div class="success-message" style="width: 300px;height: 40px;text-align: center;background-color:#daf5eb;;color: rgba(59,128,58,0.7);position: fixed;left: 43%;top: 10%;line-height: 40px;border-radius: 5px;z-index: 9999">\n' +
	                '    <span class="mes-text">'+message+'</span></div>';
	            break;
	        case 'error':
	            str = '<div class="error-message" style="width: 300px;height: 40px;text-align: center;background-color: #f5f0e5;color: rgba(238,99,99,0.8);position: fixed;left: 43%;top: 10%;line-height: 40px;border-radius: 5px;;z-index: 9999">\n' +
	                '    <span class="mes-text">'+message+'</span></div>';
	    }
	    $('body').append(str)
	    setTimeout(function () {
	        $('.'+type+'-message').remove()
	    },time);
	};

// 保存成功的提示信息
function saveMchInfo() {
	var mchShopName = document.getElementById("mchShopName").value;
	var mchShopAddress = document.getElementById("mchShopAddress").value;
	var mchPhoneNum = document.getElementById("mchPhoneNum").value;
	if (mchShopName == "" || mchShopName.length >= 50) {
		showMessage("商铺名必填且25长度以内的汉字","error",2000);
		return ;
	}

	if (mchShopAddress == "" || mchShopAddress.length >= 100) {
		showMessage("商铺地址必填且50长度以内的汉字","error",2000);
		return ;
	}

	if (mchPhoneNum == "" || mchPhoneNum.length >= 50) {
		showMessage("商铺号码必填且25长度以内的汉字","error",2000);
		return ;
	}
	$.post("./updateuserinfo", {
		mchShopName : mchShopName,
		mchShopAddress : mchShopAddress,
		mchPhoneNum : mchPhoneNum
	}, function(data) {
		if (data.isResultOk) {
			showMessage("保存成功！","success",2000);
			//showResultDiv(true);
			//window.setTimeout("showResultDiv(true);", 3000);
		} else {
			showMessage("保存失败！","error",2000);
//			showResultDiv(false);
//			window.setTimeout("showResultDiv(false);", 3000);
		};
	});

};
//function showResultDiv(flag) {
//	if (flag) {
//		alert("保存成功！")
////		var divResult = document.getElementById("save_result_info");
////		$('#save_result_info').text("保存成功!");
////		divResult.style.display = "block";
//	} else {
//		alert("保存失败！")
////		var divResult = document.getElementById("save_result_info");
////		$('#save_result_info').text("保存失败!");
////		divResult.style.display = "block";
//	}
//}
