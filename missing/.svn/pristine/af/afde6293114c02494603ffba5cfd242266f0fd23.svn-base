function redeem(id) {
	if (id == "") {
		alert("必须选择一个兑换码");
		return;
	}

	// 兑换
	$.post("<%=request.getContextPath()%>/mchuser/changeredeemcode", {
		redeemcode : id
	}, function(data) {
		if (data.isResultOk) {
			alert("操作成功");
			$('#' + id).text("已兑换");
			$('#' + id).css("color", "green");
			window.location.reload();
		} else {
			alert(date.resultMsg);
		}
	});

	return;
};