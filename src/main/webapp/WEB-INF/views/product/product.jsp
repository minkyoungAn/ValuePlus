<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Value+</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>

<!-- get jQuery from the google apis -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- CSS STYLE-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/xzoom.css"
	media="all" />
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/resources/css/product/product.css" />


<!-- XZOOM JQUERY PLUGIN  -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/xzoom.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$(".xzoom, .xzoom-gallery").xzoom();
	

 
	
	function numberCounter(target_frame, target_number) {
	    this.count = 0; this.diff = 0;
	    this.target_count = parseInt(target_number);
	    this.target_frame = document.getElementById(target_frame);
	    this.timer = null;
	    this.counter();
	};
	    numberCounter.prototype.counter = function() {
	        var self = this;
	        this.diff = this.target_count - this.count;
	    
	        if(this.diff > 0) {
	            self.count += Math.ceil(this.diff / 5);
	        }
	    
	        this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    
	        if(this.count < this.target_count) {
	            this.timer = setTimeout(function() { self.counter(); }, 20);
	        } else {
	            clearTimeout(this.timer);
	        }
	    };


	new numberCounter("counter2", ${requestScope.product.price});
	new numberCounter("counter3", ${requestScope.product.price});
	
	
	// Set the date we're counting down to
	var countDownDate = new Date("${requestScope.product.deadline}").getTime();

	// Update the count down every 1 second
	var x = setInterval(myFunction, 1000);
	  
	function myFunction() {

	    // Get todays date and time
	    var now = new Date().getTime();
	    
	    // Find the distance between now an the count down date
	    var distance = countDownDate - now;
	    
	    // Time calculations for days, hours, minutes and seconds
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	    // Output the result in an element with id="demo"
	    document.getElementById("countdown").innerHTML =  days + "일   " + hours + "시간   "
	    + minutes + "분   " + seconds + "초 ";
	    
	    document.getElementById("countdown1").innerHTML =  days + "일   " + hours + "시간   "
	    + minutes + "분   " + seconds + "초 ";
	    
	    // If the count down is over, write some text 
	if (distance < 0) {
		/* 민경 낙찰하기 추가 */
		var alreadySubmit = "${alreadySubmit}";
		if(alreadySubmit==null || alreadySubmit==""){
			 var formData = $("#updateProcessByTimeout").serialize();
				$.ajax({
		 					type : "POST",
		 					url : "updateProcessByTimeout",
		 					cache : false,
		 					data : formData
		 					
				});
		}
		 
	        clearInterval(x);
	        document.getElementById("countdown").innerHTML = "EXPIRED";
	        document.getElementById("countdown1").innerHTML = "EXPIRED";
	       
	    }
	}
});
var sel;
/* 태은이형 selectbox 입찰가 선택*/
   $(document).ready(function() {
	   var isInterest = ${isInterest};
	   //alert(isInterest);
	   if(isInterest){
		    $("#like_btn").css({"border":"1px solid #01DFA5","color":"#01DFA5"});
		    $("#like_btn").text("등록됨");
	   }else{
		   $("#like_btn").css({"border":"","color":""});
		   $("#like_btn").text("관심물품");

	   }
       $("#bidPriceSelect").on("change", function() {
    	   // 수정
          sel = $(this).val();
          var bidPrice;
		  var totalPrice;
          if (sel == 0) {
             bidPrice = "";
          } else {
             bidPrice = sel * ${requestScope.product.bidUnit }+"원";
             totalPrice = (${requestScope.product.price} + parseInt(bidPrice) )* 1.3;
          }
          $("#bidTotalMoney").text(totalPrice)
          $("#bidPriceText").text(bidPrice);
       });
       $("#close_btn").click(function(){
    	   $(".popup").css({"display":"none"}); 
       });
       $("#bid_btn").click(function(){
    	   $(".popup").css({"display":"block"}); 
       });
       $("#addview").click(function(){
    	   $(".popup_user").css({"display":"block"});
       })
       $("#user_modal_close").click(function(){
    	   $(".popup_user").css({"display":"none"});  
       });
       var a = $('.xzoom-thumbs-wrap>a').length;
       if(a > 3){
    	   $(".xzoom-thumbs-wrap").css({"width":"200%"});
       }
       if(a > 6){
    	   $(".xzoom-thumbs-wrap").css({"width":"300%"});
       }
       $(".right").click(function(){
    	  var left =  $(".xzoom-thumbs-wrap").offset().left;
    	  var width =  $(".xzoom-thumbs-wrap").width();
    	  if(width==513){
    		  $(".xzoom-thumbs-wrap").css({"left":"-350px"});
    		  if(left == 239.5){
	    		  $(".xzoom-thumbs-wrap").css({"left":"-175px"});
	    	  }
    	  }
    	  if(width==342){
	    		  $(".xzoom-thumbs-wrap").css({"left":"-175px"});
    	  }
       });
       $(".left").click(function(){
    	   var left =  $(".xzoom-thumbs-wrap").offset().left;
     	  $(".xzoom-thumbs-wrap").css({"left":"0"}); 
     	  if(left == -110.5){
    		  $(".xzoom-thumbs-wrap").css({"left":"-175px"});
    	  }
        });
       $("#like_btn").click(function(){
   		
    	   $.ajax({
       	       url:"like",
       	       type:"post",
       	       data:"${_csrf.parameterName}=${_csrf.token}&&productNo="+"${ requestScope.productNo}",
       	       dataType:"text",
       	        success:function(result){ 
       	        	 console.log("result is => " + result);
                    var str = "";
                    str = $.trim(result)
                    
                    if(str==1){
                       alert("관심상품이 등록되었습니다.")
                       $("#like_btn").css({"border":"1px solid #01DFA5","color":"#01DFA5"});
                       $("#like_btn").text("등록됨");
                    }
                    else{
                       alert("관심상품이 등록이 해제되었습니다.")
                       $("#like_btn").css({"border":"","color":""});
                          $("#like_btn").text("관심물품");
                 	   }	 
                  	  // alert("succ")
       	            },
       	            error:function(request,status,error){
       	            	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       	            	//alert("err")
       	            }
       	         })  
       		});
       $("#bider_btn").click(function(){
           // 추가 - 수정
          $("#totalPrice").val(${requestScope.product.price}+(sel * ${requestScope.product.bidUnit }));
           var val = $("#bidPriceSelect").val();
           if(val == 0 ||val == null){
              
                 alert("입찰가를 입력해주세요.");
              
           }else{
             $("#bidForm").submit(); 
          }
         
         // 여기까지
        });
    });
    
    // 1:1문의 1217
    $(function(){
    	$("#newChat").on("click",function(){
    		// 판매자 아이디 가져옴
    		toID = "${requestScope.seller}";
    		/* $("#title").text(toID+"과의 대화");
    		chatOpenClose(state); */
    		$("#testDiv_Chat").css({
                "display" : "block"
             });
    		$("#toId_title").text(toID);
    	})
    })
    
    function noEvent() { // 새로 고침 방지
        if (event.keyCode == 116) {
            alert("새로고침을 할 수 없습니다.");
            event.keyCode = 2;
            return false;
        } else if (event.ctrlKey &&  event.keyCode == 82) {
           alert("새로고침을 할 수 없습니다.");
            return false;
        } else if(event.ctrlKey && event.shiftkey && event.keyCode == 82 ){
           alert("새로고침을 할 수 없습니다.");
           return false;
        }
    }
document.onkeydown = noEvent;
</script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
	<sec:authorize access="hasRole('ROLE_MEMBER')" var="isUser" />
	<div class="product-overview">
		<div class="product-overview-wrap">
			<table id="product-overview">
				<tr>
					<td><img class="xzoom"
						src="${requestScope.photo.thumbnailPath}"
						xoriginal="${requestScope.photo.thumbnailPath}" />
						<div class="slide">

							<div class="xzoom-thumbs">
								<div class="xzoom-thumbs-wrap">
									<a href="${requestScope.photo.thumbnailPath}"> <img
										class="xzoom-gallery" width="80"
										src="${requestScope.photo.thumbnailPath}"
										xpreview="${requestScope.photo.thumbnailPath}">
									</a><a href="${requestScope.photo.photo1Path }"> <img
										class="xzoom-gallery" width="80"
										src="${requestScope.photo.photo1Path }">
									</a> <a href="${requestScope.photo.photo2Path }"> <img
										class="xzoom-gallery" width="80"
										src="${requestScope.photo.photo2Path }">
									</a> 
									<c:choose>

										<c:when test="${empty requestScope.photo.photo4Path }">
											<!-- 3까지 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
										</c:when>
										<c:when test="${empty requestScope.photo.photo5Path }">
											<!-- 4까지 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
											<a href="${requestScope.photo.photo4Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo4Path }">
											</a> 
										</c:when>
										<c:when test="${empty requestScope.photo.photo6Path }">
											<!-- 5까지 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
											<a href="${requestScope.photo.photo4Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo4Path }">
											</a>
											<a href="${requestScope.photo.photo5Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo5Path }">
											</a>
										</c:when>
										<c:when test="${empty requestScope.photo.photo7Path }">
											<!-- 6까지 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
											<a href="${requestScope.photo.photo4Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo4Path }">
											</a>
											<a href="${requestScope.photo.photo5Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo5Path }">
											</a>
											<a href="${requestScope.photo.photo6Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo6Path }">
											</a>
										</c:when>
										<c:when test="${empty requestScope.photo.photo8Path }">
											<!-- 7까지 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
											<a href="${requestScope.photo.photo4Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo4Path }">
											</a>
											<a href="${requestScope.photo.photo5Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo5Path }">
											</a>
											<a href="${requestScope.photo.photo6Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo6Path }">
											</a>
											<a href="${requestScope.photo.photo7Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo7Path }">
											</a>
										</c:when>
										<c:when test="${empty requestScope.photo.photo9Path }">
											<!-- 8까지 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
											<a href="${requestScope.photo.photo4Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo4Path }">
											</a>
											<a href="${requestScope.photo.photo5Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo5Path }">
											</a>
											<a href="${requestScope.photo.photo6Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo6Path }">
											</a>
											<a href="${requestScope.photo.photo7Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo7Path }">
											</a>
											<a href="${requestScope.photo.photo8Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo8Path }">
											</a>
										</c:when>
										<c:otherwise>
											<!-- 모두 -->
											<a href="${requestScope.photo.photo3Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo3Path }">
											</a> 
											<a href="${requestScope.photo.photo4Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo4Path }">
											</a>
											<a href="${requestScope.photo.photo5Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo5Path }">
											</a>
											<a href="${requestScope.photo.photo6Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo6Path }">
											</a>
											<a href="${requestScope.photo.photo7Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo7Path }">
											</a>
											<a href="${requestScope.photo.photo8Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo8Path }">
											</a>
											<a href="${requestScope.photo.photo9Path }"> <img
											class="xzoom-gallery" width="80"
											src="${requestScope.photo.photo9Path }">
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<button class="left">〈</button>
							<button class="right">〉</button>
						</div> <!-- end --></td>
					<td><div class="d_table">
							<span class="overview-title">현재가 : </span><span id="counter2" /></span>
							원 &nbsp;&nbsp;&nbsp;&nbsp;남은시간 : <span id="countdown"></span><br>
							<table id="overview-specific">
								<tr>
									<th class="item ValP_td">제품이름</th>
									<td class="start" colspan="2">${requestScope.product.productName }</td>
								</tr>
								<tr>
									<th class="item ValP_td">판매자 ID</th>
									<td colspan="2"><img id="grade_icon"
										src="${pageContext.request.contextPath}/resources/img/grade/${requestScope.grade}.png" />
										${requestScope.seller}</td>
								</tr>
								<tr>
									<th class="item ValP_td">시작 가격</th>
									<td colspan="2"><fmt:formatNumber value="${requestScope.product.startPrice }"
                  pattern="#,###,###" />원</td>
								</tr>
								<tr>
									<th class="item ValP_td">응찰단위</th>
									<td colspan="2"><fmt:formatNumber value="${requestScope.product.bidUnit}"
                  pattern="#,###,###" />원</td>
								</tr>
								<tr>
									<th class="item ValP_td">응찰자수</th>
									<td colspan="2">${requestScope.bidderCount}<button
											class="ValP" id="addview">+</button></td>
								</tr>
								<tr>
									
						<c:choose>
							<c:when test="${!isUser}">
									<th class="button" ><button  class="ValP noBtn">응찰</button></th>
									<th class="button"><button class="ValP  noBtn" >관심물품</button></th>
									<th class="button"><button class="ValP  noBtn">1:1 문의</button></th>
									<script>
										$(".noBtn").click(function(){
											alert("로그인 후 이용해주세요");
										});
									</script>
							</c:when>
							<c:otherwise>
									<th class="button" id="bid_btn"><button class="ValP">응찰</button></th>
									<th class="button"><button class="ValP" id="like_btn">관심물품</button></th>
									<th class="button"><button class="ValP" id="newChat">1:1 문의</button></th>
							</c:otherwise>
						</c:choose>
								</tr>
							</table>
						</div></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="description_title">DESCTIPTION</div>
	<c:forEach items="${description}" var="item" varStatus="status">

		<c:if test="${item!=null&&item!=''}">
			<c:if test="${status.index == 0}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.thumbnailPath }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 1}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo1Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 2}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo2Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 3}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo3Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 4}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo4Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 5}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo5Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 6}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo6Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 7}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo7Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 8}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo8Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
			<c:if test="${status.index== 9}">
				<div class="product-content">
					<div class="product-content-wrap">
						<div class="product-img">
							<img alt="no" src="${requestScope.photo.photo9Path }">
						</div>
						<div id="product-content">${item}</div>
					</div>
				</div>
			</c:if>
		</c:if>

	</c:forEach>


	<div class="popup_user">
		<div class="user_modal">
			<h4 class="fs18i">
				<strong>응찰자 목록</strong>
				<button class="ValP" id="user_modal_close">x</button>
			</h4>
			<table>
				<tr style="width: 100%; height: 50px;">
					<th class="ValP_td">응찰자</th>
					<th class="ValP_td">날짜</th>
					<th class="ValP_td">응찰 가격</th>
				</tr>
				<c:forEach items="${bidderList}" var="list">
					<tr>
						<td>${list.id}</td>
						<td>${list.bidTime}</td>
						<td><fmt:formatNumber value="${list.price}"
                  pattern="#,###,###" /> </td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- 모달 -->
	<div class="popup">
		<div class="bidderModal">
			<div class="bidderModal-body">
				<h4 class="fs18i">
					<strong>${requestScope.product.productName}</strong>
				</h4>
				<div class="tableDefault">
					<table>
						<tr>
							<th class="ValP_td">판매자 ID</th>
							<td><img id="grade_icon"
								src="${pageContext.request.contextPath}/resources/img/grade/${requestScope.grade}.png" /><strong>${requestScope.seller}</strong>
							</td>
						</tr>

						<tr>
							<th class="ValP_td">남은시간</th>
							<td><div>
									<span id="countdown1"></span>
								</div></td>
						</tr>

						<tr>
							<th class="ValP_td">입찰단위</th>
							<td><fmt:formatNumber value="${requestScope.product.bidUnit}" pattern="###,###,###" />원</td>
						</tr>

						<tr>
							<th class="ValP_td">현재가</th>
							<td><strong><span id="counter3" /></span>원</strong></td>
						</tr>

						<tr>
							<th class="ValP_td">입찰금액</th>
							<td>
								<div class="form-inline">
									<select id="bidPriceSelect">
										<option value="0"> 입찰가를 선택해주세요!! </option>
										<option value="1">X1 </option>
										<option value="2">X2</option>
										<option value="4">X4</option>
									</select> <strong id="bidPriceText"> </strong>
								</div>
							</td>
						</tr>

						<tr>
							<th class="ValP_td">총 구매금액</th>
							<td><strong class="fcBlue" id="bidTotalMoney">${bidder.price*1.3}원
							</strong> (구매수수료 포함)</td>
						</tr>

						<tr>
							<td colspan="2">
								<div class="bidder-modal-footer">
									<button id="bider_btn" class="ValP">입찰하기</button>
									<button id="close_btn" class="ValP">취소</button>
								</div>
							</td>
						</tr>
						<div>
							<form action="${pageContext.request.contextPath}/bid" method="post" id="bidForm">
								<input type="hidden" id="totalPrice" name="totalPrice" value="">
								<input type="hidden" id="productNo" name="productNo" value="${ requestScope.productNo}">
								<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
							</form>
						</div>
						<div>
							<form action="${pageContext.request.contextPath}/updateProcessByTimeout" method="post" id="updateProcessByTimeout">
								<input type="hidden" id="productNo" name="productNo" value="${ requestScope.productNo}">
								<input type="hidden" id="userId" name="userId" value="${requestScope.seller}">
								<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}"/>
							</form>
						</div>
						<tr>
							<td colspan="2" class="table_footer">
								<div>
									<p>
										<strong class="fs16i">*알려드립니다.</strong>
									</p>
									<p class="mt15">
										<strong>입찰 실수 및 허위입찰은</strong> 경매사고로 이어질 수 있으며, <strong>미정산(미입금,구매거부,반품실책
											등) 2건이상 누적</strong>시 코베이 이용 제한 및 입찰수수료가 발생됩니다. 특히 홈페이지 상단 배너, 추천경매에
										노출된 물품 중 위와 같은 사고가 발생될 경우 1건 누적으로 코베이 이용 제한과 입찰수수료가 발생될 수 있으므로
										신중한 입찰을 부탁드립니다.
									</p>
									<p class="mt15">
										코베이에 등록된 판매물품의 내용 및 판매진행은 <strong>판매자의 전적인 책임</strong>으로
										이루어지며, 거래 및 결제와 관련된 모든 책임은 판매자와 구매자에게 있습니다.
									</p>
								</div>
							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>