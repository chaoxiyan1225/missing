<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- TODO :抽出公共  top.jsp 界面 -->
<jsp:include page="../basic/back_js_css.jsp" />
<script type="text/javascript" src="../staticfile/commonjs/uptosale.js"></script>
<link rel="stylesheet" type="text/css"	href="../staticfile/styles/compiled/new-user.css" />
</head>
<body>
	<jsp:include page="../basic/top.jsp" />
	<!-- sidebar -->
	<jsp:include page="../basic/menu_common.jsp" />
	<!-- end sidebar -->

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header">
                    <h3>商家订单详情</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                           
                              <div class="span12 field-box">
                                    <label>订单号:</label>
                                    <input class="span5" type="text"  readonly="readonly" value="${cacheTransaction.transaction.outTradeNo}"/>
                                </div>
                                <div class="span12 field-box">
                                    <label>购买商品:</label>
                                    <input class="span5" type="text"  readonly="readonly" value="${cacheTransaction.productName}"/>
                                    
                                </div>
                                <div class="span12 field-box">
                                    <label>订单状态:</label>
                                    <input class="span5" type="text"   readonly="readonly" value="${cacheTransaction.statusMsg}"/>
                                     
                                </div>
                                
                                <div class="span12 field-box">
                                    <label>受理人:</label>
                                    <input class="span5" type="text"  readonly="readonly" value="${cacheTransaction.mchStaff.name}"/>
                                    
                                </div>
                                <div class="span12 field-box">
                                    <label>订单时间:</label>
                                    <input class="span5" type="text"   readonly="readonly" value="${cacheTransaction.transaction.recordTime}" />
                                   
                                </div>
                                <div class="span12 field-box textarea">
                                    <label>祭扫信息:</label>
                                    <textarea class="span18"   readonly="readonly">
                                                                                                               
                                                                                                                            逝者姓名: ${cacheTransaction.muweihao.deadName}
										     墓       位    号:${cacheTransaction.muweihao.muweihao}
										     祭扫时间       :${cacheTransaction.muweihao.jisaoDate}
										     祭扫人手机号:${cacheTransaction.muweihao.jisaoTel}
										     用户姓名:${cacheTransaction.muweihao.userName}
										     与逝者关系:${cacheTransaction.muweihao.relation}
										     祭扫说明       :${cacheTransaction.muweihao.jisaoBeizhu}
                                    </textarea>
                                  

                                </div>
                                <div class="span12 field-box textarea">
                                    <label>处理说明:</label>
                                    <textarea class="span9">${cacheTransaction.processMsg}</textarea>
                                   
                                </div>
                                <div class="span12 field-box textarea">
                                    <label>过程图片:</label>
                                    <br/>
                                      <c:choose>
										  <c:when test="${ empty  cacheTransaction.contentPictures}">
							        			<div style="text-align:center; color:#ccc; font-size:32px; margin-top:200px;">亲，订单图片暂未更新</div>
							        	  </c:when>
							        		<c:otherwise>
							        			<c:forEach items="${cacheTransaction.contentPictures}" var="picture">
										          <li><img src="../${picture}"width="160" height="70"/></li>
							        			</c:forEach>
			        		               </c:otherwise>
			        		           </c:choose>
                               </div>
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" value="确认完成" onClick="confirmfinishtransaction(${cacheTransaction.transaction.recordId})"/>
                                    <span>OR</span>
                                    <input type="reset" value="取消" class="reset" />
                                </div>
                          
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- end main container -->
    
    <jsp:include page="../basic/pop.jsp" />

    <script type="text/javascript">
        $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });
        
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
        
        function confirmfinishtransaction(id){
        	//商家去确认订单完成
        	if(id.length == 0)
		    {
				showMessage("必须选择一个订单",'error',1000);
		    	return ;
		    }
        		//
       		alert("确定注销?");
       		$.post("<%=request.getContextPath()%>/mchuser/confirmfinishtransaction",{recordId:id},function(data){
       			if (data.isResultOk) {
       				showMessage("确认完成",'success',1000);
       				
       				window.location.href="<%=request.getContextPath()%>/mchuser/totransactionlist";
       			} else {
       				showMessage("确认订单失败",'success',1000);
       				return ;
       			}
       	    });
        	
        };
        
    </script>

</body>
</html>