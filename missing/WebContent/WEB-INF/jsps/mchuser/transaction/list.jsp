<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../basic/back_js_css.jsp" /> 
</head>
<body  onload="initialYearAndMonth();">
<jsp:include page="../basic/top.jsp" /> 
	<!-- sidebar -->
       <jsp:include page="../basic/menu_common.jsp" />
	<!-- end sidebar -->
	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<!-- statistics chart built with jQuery Flot -->
				<div class="table-products section">
					<div class="row-fluid head">
						<div class="span12">
						</div>
					</div>
					 <form action="<%=request.getContextPath()%>/mchuser/exportdata" method="post" onsubmit="return checkForm()"> 
					   <div class="row-fluid filter-block">
					   <div class="pull-left"><h4>共检索到订单<font color="red">${allTransactionPages}笔</font></h4></div>
						<div class="pull-right">
							<div class="ui-select">
                             <select class="select_search" id="selYears"></select>
                                                                    年
							</div>
						   <div class="ui-select">
                             <select class="select_search" id="selMonths"></select>
                                                                    月
							</div>
								<input type="hidden" id="year" name="year" value=""/>
                                <input type="hidden" id="month" name="month" value=""/>
								<input type="submit" value="导出报表" id="querya" 	class="btn-flat new-product"/>
						</div>
					   </div>
					 </form> 
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span2">编号</th>
									<th class="span2"><span class="line"></span>交易流水号</th>
									<th class="span2"><span class="line"></span>金额(元)</th>
									<th class="span3"><span class="line"></span>商家</th>
									<th class="span2"><span class="line"></span>交易时间</th>
									<th class="span2"><span class="line"></span>交易状态</th>
									<th class="span2"><span class="line"></span>订单受理人</th>
									<th class="span3"><span class="line"></span>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
								<!-- 遍历订单 -->
								<c:forEach items="${cacheTransactions}" var="cacheTransaction">
		                         <tr>
			                        <td align="center">${cacheTransaction.transaction.recordId}</td>
			                        <td align="center">${cacheTransaction.transaction.outTradeNo}</td>
			                        <td align="center">${cacheTransaction.transaction.recordMoney/100}</td>
			                        <td align="center">${cacheTransaction.mchShopName}</td>      
			                        <td align="center">${cacheTransaction.transaction.recordTime}</td>  
		                            <td align="center">
			                            <c:choose>
										    <c:when test="${cacheTransaction.transaction.recordStatus ==1}">
										         <font color="red">${cacheTransaction.statusMsg}</font>
										    </c:when>
										    <c:when test="${cacheTransaction.transaction.recordStatus ==2}">
										         <font color="red">${cacheTransaction.statusMsg}</font>
										    </c:when>
										    <c:when test="${cacheTransaction.transaction.recordStatus ==3 }">
										         <font color="blue">${cacheTransaction.statusMsg}</font>
										    </c:when>
										    <c:when test="${cacheTransaction.transaction.recordStatus ==4}">
										         <font color="green">${cacheTransaction.statusMsg}</font>
										    </c:when>
										    <c:otherwise>
										         <font >${cacheTransaction.statusMsg}</font>
										    </c:otherwise>
										</c:choose>
		                            </td>
		                            <td>
		                               <select id="staffid${cacheTransaction.transaction.recordId}" name="staffid" style="width:100px">
		                               <option value="0">未指定</option>
		                               <c:forEach items="${staffs}" var="staff">
		                               <c:if test="${cacheTransaction.transaction.fkStaffId==staff.id}">
		                                    <option value="${staff.id}" selected="selected" >${staff.name}</option>
		                               </c:if>
		                               <c:if test="${cacheTransaction.transaction.fkStaffId !=staff.id}">
		                                    <option value="${staff.id}">${staff.name}</option>
		                               </c:if>
                                         
                                       </c:forEach>
                                       </select>
                                     </td>   
		                               <c:choose>
										    <c:when test="${cacheTransaction.transaction.recordStatus ==3}">
										     <td> <input type="button"  onClick="editTransaction(${cacheTransaction.transaction.recordId},${cacheTransaction.transaction.recordStatus})" class="btn-glow primary"   background='#FF0000' style="width:100px;" value="重置受理人"/></td>           
										    <td> <input type="button"  onClick="window.location='./toconfirmtransaction?recordId=${cacheTransaction.transaction.recordId}'" class="btn-glow primary" style="width:100px;" value="确认订单"/></td> 
										    </c:when>
										    
										     <c:when test="${cacheTransaction.transaction.recordStatus ==4}">
										           <td> <input type="button"  onClick="editTransaction(${cacheTransaction.transaction.recordId},${cacheTransaction.transaction.recordStatus})" class="btn-glow primary" style="width:100px;" value="重置受理人"/></td>
										        </c:when>
										    <c:otherwise>
										      
										       <td> <input type="button"  onClick="editTransaction(${cacheTransaction.transaction.recordId},${cacheTransaction.transaction.recordStatus})" class="btn-glow primary" style="width:100px;" value="设置受理人"/></td>
										  
										    </c:otherwise>
								    </c:choose>
	                               
	                                         
	                              </tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<!-- 此处多传递一个参数来判断该查询请求来自主页 例如：&index=true -->
						  <ul>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/totransactionlist?currentPage=0">&#8249&#8249</a></li>
							<li><c:if test="${currentPage>0}">
									<a
										href="<%=request.getContextPath()%>/mchuser/totransactionlist?currentPage=${currentPage-1}">&#8249</a>
								</c:if></li>
							<li><c:if test="${currentPage<allPages}">
									<a
										href="<%=request.getContextPath()%>/mchuser/totransactionlist?currentPage=${currentPage+1}">&#8250</a>
								</c:if></li>
							<li><a
								href="<%=request.getContextPath()%>/mchuser/totransactionlist?currentPage=${allPages}">&#8250&#8250</a></li>
						</ul>
					</div>
				</div>
			<!-- end statistics chart -->
	  </div>
	</div>
	<jsp:include page="../basic/pop.jsp" /> 
	<!-- end main container -->
	<!-- build the charts -->
	<script type="text/javascript">
	
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
	        $('.'+type+'-message').remove();
	    },time);
	};
	
    //写入下拉框中的年份和月份
    function initialYearAndMonth() {
        //写入最近3年
        var yearObj = document.getElementById("selYears");
        var year = (new Date()).getFullYear();
        for (var i = 0; i <= 2; i++) {
            var opObj = new Option(year - i+"年", year - i);
            yearObj.options[i] = opObj;
        }
        //写入 12 月
        var monthObj = document.getElementById("selMonths");
        var opObj = new Option("全部", "0");
        monthObj.options[0] = opObj;
        monthObj.options[1] = new Option("1月", 01);
        monthObj.options[2] = new Option("2月", 02);
        monthObj.options[3] = new Option("3月", 03);
        monthObj.options[4] = new Option("4月", 04);
        monthObj.options[5] = new Option("5月", 05);
        monthObj.options[6] = new Option("6月", 06);
        monthObj.options[7] = new Option("7月", 07);
        monthObj.options[8] = new Option("8月", 08);
        monthObj.options[9] = new Option("9月", 09);
        monthObj.options[10] = new Option("10月", 10);
        monthObj.options[11] = new Option("11月", 11);
        monthObj.options[12] = new Option("12月", 12);
    }
   
    //导出报表数据
   function checkForm()
   {
	   var year=$("#selYears option:selected").val();  //获取选中的项
	   var month = $("#selMonths option:selected").val();
	   if("0" == month)
		{
		   showMessage("暂不支持导出全部,至少选择一个月份!","error",2000);
		  return false;
		}
	   
	   document.getElementById("year").value= year;
	   document.getElementById("month").value= month;
	   return true ;

   }
    
    
    
    function editTransaction(id,status){
    	var staffIdElement="staffid"+id;
    	var staffId=$("#"+staffIdElement+" option:selected").val();  //获取选中的项
    	if(status ==0){
    		showMessage("用户未支付，不能委派受理人","error",2000);
    		return;
    	}
    	
    	if(window.confirm('确定修改？')){
            //alert("确定");
              	  //发送消息
			  	  $.post("<%=request.getContextPath()%>/mchuser/transactionmanage",{recordId:id,fkStaffId:staffId},function(data){
			  	   if (data.isResultOk) 
			  	   {
			  	     showMessage("操作成功","success",2000);
			  	     window.current.href="<%=request.getContextPath()%>/mchuser/totransactionlist";
			  	    } else {
			  	    	showMessage(date.resultMsg,"success",2000);
			  	    };
			  	  });
            return true;
         }else{
            //alert("取消");
            return false;
        }
    	

    	return ;
    }
	
    $(function() {

		// jQuery Knobs
		$(".knob").knob();

		// jQuery UI Sliders
		$(".slider-sample1").slider({
			value : 100,
			min : 1,
			max : 500
		});
		$(".slider-sample2").slider({
			range : "min",
			value : 130,
			min : 1,
			max : 500
		});
		$(".slider-sample3").slider({
			range : true,
			min : 0,
			max : 500,
			values : [ 40, 170 ],
		});

		// jQuery Flot Chart
		var visitors = [ [ 1, ${reports[6].value} ], [ 2, ${reports[5].value} ], [ 3, ${reports[4].value} ], [ 4, ${reports[3].value} ],
				[ 5, ${reports[2].value} ], [ 6, ${reports[1].value} ], [ 7, ${reports[0].value} ] ];

		var plot = $.plot($("#statsChart"), [ {
			data : visitors,
			label : "流水"
		} ],
				{
					series : {
						lines : {
							show : true,
							lineWidth : 1,
							fill : true,
							fillColor : {
								colors : [ {
									opacity : 0.1
								}, {
									opacity : 0.13
								} ]
							}
						},
						points : {
							show : true,
							lineWidth : 2,
							radius : 3
						},
						shadowSize : 0,
						stack : true
					},
					grid : {
						hoverable : true,
						clickable : true,
						tickColor : "#f9f9f9",
						borderWidth : 0
					},
					legend : {
						// show: false
						labelBoxBorderColor : "#fff"
					},
					colors : ["#30a0eb" ],
					xaxis : {
						ticks : [ [ 1, '${reports[6].date}' ], [ 2, '${reports[5].date}' ], [ 3, '${reports[4].date}' ],
								[ 4, '${reports[3].date}' ], [ 5, '${reports[2].date}'], [ 6, '${reports[1].date}'],
								[ 7, '${reports[0].date}'] ],
						font : {
							size : 12,
							family : "Open Sans, Arial",
							variant : "small-caps",
							color : "#697695"
						}
					},
					yaxis : {
						ticks : 3,
						tickDecimals : 0,
						font : {
							size : 12,
							color : "#9da3a9"
						}
					}
				});

		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css({
				position : 'absolute',
				display : 'none',
				top : y - 30,
				left : x - 50,
				color : "#fff",
				padding : '2px 5px',
				'border-radius' : '6px',
				'background-color' : '#000',
				opacity : 0.80
			}).appendTo("body").fadeIn(200);
		}

		var previousPoint = null;
		$("#statsChart")
				.bind(
						"plothover",
						function(event, pos, item) {
							if (item) {
								if (previousPoint != item.dataIndex) {
									previousPoint = item.dataIndex;

									$("#tooltip").remove();
									var x = item.datapoint[0].toFixed(0), y = item.datapoint[1]
											.toFixed(0);

									var month = item.series.xaxis.ticks[item.dataIndex].label;

									showTooltip(item.pageX, item.pageY,
											month + item.series.label
													+ ": " + y + "元");
								}
							} else {
								$("#tooltip").remove();
								previousPoint = null;
							};
						});
	});
    </script>
</body>
</html>