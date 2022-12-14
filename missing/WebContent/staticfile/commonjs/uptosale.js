
/*
 * 编辑商品以及 对商品做 上下架等操作
 */
function editProduct(productId, status) {
	if (productId == "") {
		showMessage("必须选择一个商品","error",2000);
		return;
	}

	// 编辑当前商品
	if (status == -1) {
		window.open(
				"./tosingleproduct?type=food&productId="
						+ productId, "_blank");
		return;
	}
	// 下架商品
	
	else if (status == 0) {
		$.post("./setproductstatus", {
			productId : productId,
			status : status
		}, function(data) {
			if (data.isResultOk) {
				$('#' + productId).text("已下架");
				$('#' + productId).css("color", "red");
			} else {
				alert(date.resultMsg);
			}
		});
		return;
	}
	// 上架商品
	else if (status == 1) {
		$.post("./setproductstatus", {
			productId : productId,
			status : status
		}, function(data) {
			if (data.isResultOk) {
				$('#' + productId).text("已上架");
				$('#' + productId).css("color", "green");
			} else {
				alert(date.resultMsg);
			}
		});

		return;
	}
	// 不支持的操作
	else {
		showMessage("暂不支持该操作","error",2000);
		return;
	}

}

function addProduct() {
	window.open("./toaddproduct?type=food",
			"_blank");
}
