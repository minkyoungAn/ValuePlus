<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Value+</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/map.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/stringBuffer.js"></script>
<style>

#noticeDetailDiv h5 {
   width: 100%;
   height: 20px;
   float: left;
   border-bottom: 2px solid rgba(0, 0, 0, 0.1);
   padding-left: 20px;
   box-sizing: border-box;
   font-weight: bold;
}

#noticeDetailDiv input {
   text-align: center;
   width: 100%;
   float: left;
}

#noticeContent2 {
   height: 220px;
}

#closeBtn2 {
   height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
   border-top: 0;
}
#updateNotice{
 height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
}
#updateNotice:hover{
   font-weight: bold;
   font-size: 16px;
}
#closeBtn2:hover {
   font-weight: bold;
   font-size: 16px;
}


#noticeWriteDiv input {
   text-align: center;
   width: 100%;
   float: left;
}

#noticeWriteDiv h5{ 
 width: 100%;
   height: 20px;
   float: left;
   border-bottom: 2px solid rgba(0, 0, 0, 0.1);
   padding-left: 20px;
   box-sizing: border-box;
   font-weight: bold;
}
#insertNoticeContent {
   height: 130px;
}
#insertNotice{
	height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
}
#insertNotice:hover {
   font-weight: bold;
   font-size: 16px;
}
#cancelNotice{
	height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
   border-top: 0;
}
#cancelNotice:hover {
   font-weight: bold;
   font-size: 16px;
}
#closeBtn3 {
   height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
   border-top: 0;
}
#closeBtn3:hover {
   font-weight: bold;
   font-size: 16px;
}

/*//////////////////////////////  */

#insertQuestionDiv input {
   text-align: center;
   width: 100%;
   float: left;
}
#insertAnswerContent{
	height: 150px;
}
#answerContent{
	height: 110px;
}
#insertQuestionDiv h5{ 
 width: 100%;
   height: 20px;
   float: left;
   border-bottom: 2px solid rgba(0, 0, 0, 0.1);
   padding-left: 20px;
   box-sizing: border-box;
   font-weight: bold;
}
#closeBtn {
   height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
   border-top: 0;
}
#closeBtn:hover {
   font-weight: bold;
   font-size: 16px;
}
#insertAnswer {
   height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
}
#insertAnswer:hover {
   font-weight: bold;
   font-size: 16px;
}
#updateAnswer{
   height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
}
#updateAnswer:hover {
   font-weight: bold;
   font-size: 16px;
}
#deleteAnswer{
   height: 40px;
   border: 2px solid gray;
   color: black;
   background-color: white;
   transition: 0.2s;
   border-top: 0;
}
#deleteAnswer:hover {
   font-weight: bold;
   font-size: 16px;
}
#insertQuestionDiv input {
   text-align: center;
   width: 100%;
   float: left;
}

/* 검색 div */
#searchForm {
	margin-left: 77%;
}
/* input */

/* 전체 테이블 */
table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
}

tr:nth-of-type(odd) {
	background: #eee;
}

table th {
	padding: 20px 15px;
	text-align: center;
	font-weight: 500;
	font-size: 12px;
	text-transform: uppercase;
	background: #333;
	color: white;
	font-weight: bold;
}

table th td {
	padding: 15px;
	text-align: center;
	vertical-align: middle;
	font-weight: 300;
	font-size: 12px;
	color: #fff;
	border-bottom: solid 1px rgba(255, 255, 255, 0.1);
	border: 1px solid #ccc;
}

/* 버튼 공통 속성 */
.adminValP:hover {
	border: 1px solid #01DFA5;
	color: #01DFA5;
}

.adminValP {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 5px 40px 5px;
	outline: 0;
}
/* 공지 등록 버튼*/
#noticeWrite {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 5px 40px 5px;
	outline: 0;
}
/* 사용자 상세보기 버튼 */
.adminValP2 {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 2px 8px;
	margin: 2px 0px 3px 2px;
	outline: 0;
}

.adminValP2:hover {
	border: 1px solid #01DFA5;
	color: #01DFA5;
}
/* 상품 삭제 버튼 */
#deleteBtn {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	margin: 0px 5px 0px 10px;
	outline: 0;
}
/* 공지 삭제 버튼*/
#noticeDelete {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	margin: 0px 5px 0px 10px;
	outline: 0;
}
/* 상품 승인, 거절 버튼 */
#permitBtn {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 2px 8px;
	margin: 2px 0px 3px 10px;
	outline: 0;
}

#refuseBtn {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 2px 8px;
	margin: 2px 0px 5px 10px;
	outline: 0;
}
/* 답변완료 , 대기 버튼*/
#questionTab {
	position: relative;
	margin-left: 43%;
}

#questionYes {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}

#questionProcessNo {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}
/* 상품 상태 버튼 */
#subButton {
	position: relative;
	margin-left: 30%;
}

#waiting {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}

#complete {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}

#delivery {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}

#confirm {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}

#deliveryEnd {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}

#stillAuction {
	border-radius: 20px;
	background: rgba(0, 0, 0, 0);
	border: 1px solid #DDE5EF;
	padding: 8px 16px;
	margin: 10px 2px 40px 2px;
	outline: 0;
}
/* 셀렉트 박스 */
select {
	width: 100px;
	height: 21.5px;
	padding-left: 5px;
	font-size: 8px;
	color: #756E6E;
	border: 1px solid #756E6E;
	border-radius: 3px;
}

select option:checked, select option:hover {
	background: #FDF102;
	color: #3E41E8;
}
/* 검색 텍스트*/
#searchText {
	border: 1px solid #756E6E;
	border-radius: 3px;
	height: 21px;
}
/* 모달창 입니다요! */
#insertQuestion_wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.8);
}

#insertQuestion {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 300px;
	height: 400px;
}

#userDetailDiv_wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.8);
}

#userDetailDiv {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 570px;
	height: 400px;
}

#selectNotice_wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.8);
}

#selectNotice {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 300px;
	height: 300px;
}

#insertNoticeDiv_wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background-color: rgba(0, 0, 0, 0.8);
}

#insertNoticeDiv {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 300px;
	height: 300px;
}
</style>
<script>
	//tab버튼 기능
	$(function() {
		$("#headerButton").tabs();
	});
	$(function() {
		$("#subButton").tabs();
	});
	$(function() {
		$("#userDetailTab").tabs();
	});
	//유저 전체 정보가져오기
	$(document).ready(
					function() {
						$("#selectAllUser")
								.click(
										function() {
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/selectAllUser",
														data : "${_csrf.parameterName}=${_csrf.token}",
														dataType : "json",
														success : function(
																result) {
															var data = "<table><tr><th>등급</th><th>아이디</th><th>이름</th><th>이메일</th><th>생년월일</th><th>우편번호</th><th colspan='2'>주소</th><th>핸드폰 번호</th><th>삭제</th>";

															$.each(
																			result,
																			function(
																					index,
																					item) {
																				data += "<tr>";
																				data += "<td align='center'>"
																						+ item.grade
																						+ "</td>";
																				data += "<td align='center'><a href='#' id='userDetail'>"
																						+ item.id
																						+ "</a></td>";
																				data += "<td align='center'>"
																						+ item.name
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.email
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.birth
																						+ "</td>";
																				data += "<td>"
																						+ item.zipNo
																						+ "</td>";
																				data += "<td  colspan='2' align='center'>"
																						+ item.address
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.phone
																						+ "</td>";
																				data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteBtn'/></td>";
																				data += "</tr>";
																			});

															data += "</table>";
															$("#tabs-1").html(
																	data);
														}//function
													});//ajax
										});//click
					});//jquery

	var userId;
	//회원 상세보기
	$(document).on("click", "#userDetail", function() {
		userId = $(this).parent().parent().children("td:first").next().text();
		$("#userDetailDiv_wrap").css("display", "block");
		$("#userDetailDiv").css("display", "block");
	});

	//회원 판매내역 보기
	$(document).on(
					"click",
					"#selectSellById",
					function() {
						//alert(userId);		
						$("#detailResult").empty();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectSellById",
									data : "${_csrf.parameterName}=${_csrf.token}&&id="
											+ userId,
									dataType : "json",
									success : function(result) {
										var data = "<table><tr><th>상품 번호</th><th colspan='2'>상품 이름</th><th>기간</th><th>현재가</th><th>상태</th>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td colspan='2'>"
																	+ item.prodName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidderDate
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.nowPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.prodState
																	+ "</td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#detailResult").html(data);
									}//function
								});//ajax
					});//click

	$(document)
			.on(
					"click",
					"#userProductNo",
					function() {
						var productNo = $(this).parent().parent().children(
								"td:first").text();
						//alert(productNo);
						location.href = "${pageContext.request.contextPath}/select?${_csrf.parameterName}=${_csrf.token}&&productNo="
								+ productNo;
					});//click

	//회원 구매내역 보기
	$(document)
			.on(
					"click",
					"#selectBuyById",
					function() {
						//alert(userId);		
						$("#detailResult").empty();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectBuyById",
									data : "${_csrf.parameterName}=${_csrf.token}&&id="
											+ userId,
									dataType : "json",
									success : function(result) {
										var data = "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>기간</th><th>현재가</th><th>상태</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td  colspan='2' align='center'>"
																	+ item.prodName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidderDate
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.nowPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.prodState
																	+ "</td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#detailResult").html(data);
									}//function
								});//ajax
					});//click

	//회원 문의내역 보기
	$(document)
			.on(
					"click",
					"#selectQuestionById",
					function() {
						//alert(userId);		
						$("#detailResult").empty();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectQuestionById",
									data : "${_csrf.parameterName}=${_csrf.token}&&userId="
											+ userId,
									dataType : "json",
									success : function(result) {
										data = "<table><tr><th>게시글 번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>답변 여부</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'>"
																	+ item.questionNo
																	+ "</td>";
															data += "<td align='center'><a href='#' id='userQuestionTitle'>"
																	+ item.questionTitle
																	+ "</a></td>";
															data += "<td align='center'>"
																	+ item.userId
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.questionWritedate
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.questionProcess
																	+ "</td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#detailResult").html(data);
									}//function
								});//ajax
					});//click
	$(document)
			.on(
					"click",
					"#userQuestionTitle",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						//alert(code);
						$("#userDetailDiv_wrap").css("display", "none");
						$("#userDetailDiv").css("display", "none");
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectQuestionByTitle",
									data : "${_csrf.parameterName}=${_csrf.token}&&questionNo="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "";
										data += "<div  id='insertQuestionDiv'>";
										$
												.each(
														result,
														function(index, item) {
															data += "<input type='hidden' id='questionNo2' value='"+item.questionNo+"'/>";
															data += "<h5>질문 제목</h5><input type='text' readonly='readonly' id='questionTitle2' value='"+item.questionTitle+"'/>";
															data += "<h5>질문 내용</h5><input type='text' readonly='readonly' id='questionContent' value='"+item.questionContent+"'/>";
															data += "<h5>작성 날짜</h5><input type='text' readonly='readonly' id='questionWritedate' value='"+item.questionWritedate+"'/><h5>작성자 <input type='text' readonly='readonly' id='questionUserId' value='"+item.userId+"'/></h5>";
															if (item.questionProcess == "YES") {
																data += "<h5>답변 내용</h5><input type='text' readonly='readonly' id='answerContent' value='"+item.answerContent+"'/><input type='button' id='updateAnswer' class='adminValP' value='수정'/><input type='button' class='adminValP' id='deleteAnswer' value='삭제'/>";
															} else if (item.questionProcess == "NO") {
																data += "<input type='text' id='insertAnswerContent'/></td><td><input type='button' class='adminValP' id='insertAnswer' value='등록'/>";
															}
														});
										data += "<input type='button' id='closeBtn4' value='닫기'>";
										data += "</div>";
										$("#insertQuestion").html(data);
										$("#insertQuestion_wrap").html();
										$("#insertQuestion_wrap").css(
												"display", "block");
									}//function
								});//ajax 
					});//click 
	//모달창 닫고 모달창 띄우기
	$(document).on("click", "#closeBtn4", function() {
		$("#insertQuestion_wrap").css("display", "none");
		$("#insertQuestion").css("display", "none");
		$("#userDetailDiv_wrap").css("display", "block");
		$("#userDetailDiv").css("display", "block");
	});
	//회원 관심상품 보기
	$(document)
			.on(
					"click",
					"#selectInterestById",
					function() {
						//alert(userId);		
						$("#detailResult").empty();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectInterestById",
									data : "${_csrf.parameterName}=${_csrf.token}&&userId="
											+ userId,
									dataType : "json",
									success : function(result) {
										data = "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>카테고리</th><th>경매 기간</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td  colspan='2' align='center'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#detailResult").html(data);
									}//function
								});//ajax
					});//click	

	//회원 오늘 본 상품 보기
	$(document)
			.on(
					"click",
					"#selectSeenById",
					function() {
						//alert(userId);		
						$("#detailResult").empty();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectSeenById",
									data : "${_csrf.parameterName}=${_csrf.token}&&userId="
											+ userId,
									dataType : "json",
									success : function(result) {
										data = "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>카테고리</th><th>경매 기간</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#detailResult").html(data);
									}//function
								});//ajax
					});//click	

	//회원 계좌정보 보기
	$(document)
			.on(
					"click",
					"#selectAccountById",
					function() {
						//alert(userId);		
						$("#detailResult").empty();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectAccountById",
									data : "${_csrf.parameterName}=${_csrf.token}&&userId="
											+ userId,
									dataType : "json",
									success : function(result) {
										data = "<table><tr><th>은행명</th><th>예금주</th><th>계좌번호</th></tr>";

										$.each(result, function(index, item) {
											data += "<tr>";
											data += "<td align='center'>"
													+ item.bankName + "</td>";
											data += "<td align='center'>"
													+ item.accountHolder
													+ "</td>";
											data += "<td align='center'>"
													+ item.accountNo + "</td>";
											data += "</tr>";
										});

										data += "</table>";
										$("#detailResult").html(data);
									}//function
								});//ajax
					});//click	
	//회원 삭제하기
	$(document).on(
			"click",
			"#deleteBtn",
			function() {
				var code = $(this).parent().parent().children("td:first")
						.next().text();
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/deleteByName",
					data : "${_csrf.parameterName}=${_csrf.token}&&id=" + code,
					dataType : "json",
					success : function(result) {
						$("#selectAllUser").trigger("click");
					}
				});
			});
	//상품 삭제하기
	$(document)
			.on(
					"click",
					"#deleteProduct",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/deleteByProductName",
									data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "<td align='center'><input type='button' value='삭제' class='adminValP' id='deleteProduct'/></td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}
								});
					});
	////상품 전체 목록 가져오기
	$(document)
			.ready(
					function() {
						$("#productList")
								.click(
										function() {
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/productList",
														data : "${_csrf.parameterName}=${_csrf.token}",
														dataType : "json",
														success : function(
																result) {
															var data = "<div id='subButton'>";
															data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
															data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
															data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
															data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
															data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
															data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
															data += "</div>";
															data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";

															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				data += "<tr>";
																				data += "<td align='center'><a href='#' id='userProductNo'>"
																						+ item.productNo
																						+ "</a></td>";
																				data += "<td  align='center' colspan='2'>"
																						+ item.productName
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.price
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.deadline
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.bidUnit
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.successfulBidder
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.hits
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.startPrice
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.bidCount
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.categoryName
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.auctionDuring
																						+ "</td>";
																				data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
																				data += "</tr>";
																			});

															data += "</table>";
															$("#tabs-1")
																	.html(
																			data);
														}//function
													});//ajax
										});//click
					});//jquery

	//검색 기능
	$(document)
			.ready(
					function() {

						$("input[id=searchText]").keydown(function(key) {
							if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
								$(".fa-search").trigger("click");
							}
						});
						var target = document.getElementById("searchSelect");
						$(".fa-search")
								.click(
										function() {
											if (target.options[target.selectedIndex].value == "searchCategory") {
												alert("카테고리를 선택하세요.");
												document.getElementById(
														"searchSelect").focus();
												return false;
											}
											if ($("#searchText").val().trim() == "") {
												alert("검색어를 입력하세요");
												document.getElementById(
														"searchText").focus();
												return false;
											}
											if (target.options[target.selectedIndex].value == "userSearch") {
												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/selectUserByKeyword",
															data : "${_csrf.parameterName}=${_csrf.token}&&keyword="
																	+ $(
																			"#searchText")
																			.val(),
															dataType : "json",
															success : function(
																	result) {
																var data = "<table><tr><th>등급</th><th>아이디</th><th>이름</th><th>이메일</th><th>생년월일</th><th>우편번호</th><th colspan='2'>주소</th><th>핸드폰 번호</th><th>삭제</th>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					data += "<tr>";
																					data += "<td align='center'>"
																							+ item.grade
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.id
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.name
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.email
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.birth
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.zipNo
																							+ "</td>";
																					data += "<td align='center' colspan='2'>"
																							+ item.address
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.phone
																							+ "</td>";
																					data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteBtn'/></td>";
																					data += "</tr>";
																				});
																data += "</table>";
																$("#tabs-1")
																		.html(
																				data);
															}
														});
											}

											if (target.options[target.selectedIndex].value == "questionSearch") {
												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/selectQuestion",
															data : "${_csrf.parameterName}=${_csrf.token}",
															dataType : "json",
															success : function(
																	result) {
																var data = "<div id='questionTab'>";
																data += "<input type='button' class='adminValP' value='답변완료' id='questionYes'/>"
																data += "<input type='button' class='adminValP' value='답변대기' id='questionProcessNo'/>"
																data += "</div>";
																data += "<table><tr><th>게시글 번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>답변 여부</th>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					data += "<tr>";
																					data += "<td align='center'>"
																							+ item.questionNo
																							+ "</td>";
																					data += "<td align='center'><a href='#' id='questionTitle'>"
																							+ item.questionTitle
																							+ "</a></td>";
																					data += "<td align='center'>"
																							+ item.userId
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.questionWritedate
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.questionProcess
																							+ "</td>";
																					data += "</tr>";
																				});
																data += "</table>";
																$("#tabs-1")
																		.html(
																				data);
															}//function
														});//ajax
											}

											if (target.options[target.selectedIndex].value == "noticeSearch") {
												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/selectNotice",
															data : "${_csrf.parameterName}=${_csrf.token}",
															dataType : "json",
															success : function(
																	result) {
																var data = "";
																data += "<table><tr><th>공지사항 번호</th><th>제목</th><th>작성시간</th><th>삭제</th></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					data += "<tr>";
																					data += "<td align='center'>"
																							+ item.noticeNo
																							+ "</td>";
																					data += "<td align='center'><a href='#' id='noticeTitle'>"
																							+ item.noticeTitle
																							+ "</a></td>";
																					data += "<td align='center'>"
																							+ item.noticeWritedate
																							+ "</td>";
																					data += "<td align='center'><input type='button'  class='adminValP' value='삭제' id='noticeDelete'/></td>";
																					data += "</tr>";
																				});
																data += "</table>";
																data += "<input type='button' class='adminValP' value='등록' id='noticeWrite'/>";
																$("#tabs-1")
																		.html(
																				data);
															}//function
														});//ajax
											}
											if (target.options[target.selectedIndex].value == "permitSearch") {
												var code = "승인대기";
												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/productListByState",
															data : "${_csrf.parameterName}=${_csrf.token}&&state="
																	+ code,
															dataType : "json",
															success : function(
																	result) {
																var data = "";
																data += "<table><tr><th>사용자ID</th><th  colspan='2'>상품 이름</th><th>상품 이름</th><th>응찰 단위</th><th>시작가</th><th>카테고리</th><th>경매 기간</th><th>승인할까</th>";

																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					data += "<tr>";
																					data += "<input type='hidden' value='"+item.productNo+"'id='productNo'/>";
																					data += "<td align='center'>"
																							+ item.userId
																							+ "</td>";
																					data += "<td align='center'><a href='#' id='userProductNo'>"
																							+ item.productNo
																							+ "</a></td>";
																					data += "<td align='center'  colspan='2'>"
																							+ item.productName
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.bidUnit
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.startPrice
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.categoryName
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.auctionDuring
																							+ "</td>";
																					data += "<td align='center'><input type='button' class='adminValP' value='승인' id='permitBtn'/><br><input type='button' class='adminValP' value='거절' id='refuseBtn'/></td>";
																					data += "</tr>";
																				});

																data += "</table>";
																$("#tabs-1")
																		.html(
																				data);
															}//function
														});//ajax
											}
											if (target.options[target.selectedIndex].value == "productSearch") {
												$
														.ajax({
															type : "POST",
															url : "${pageContext.request.contextPath}/selectProductByKeyword",
															data : "${_csrf.parameterName}=${_csrf.token}&&keyword="
																	+ $(
																			"#searchText")
																			.val(),
															dataType : "json",
															success : function(
																	result) {
																var data = "<div id='subButton'>";
																data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
																data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
																data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
																data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
																data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
																data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
																data += "</div>";
																data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";

																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					data += "<tr>";
																					data += "<td align='center'><a href='#' id='userProductNo'>"
																							+ item.productNo
																							+ "</a></td>";
																					data += "<td  align='center' colspan='2'>"
																							+ item.productName
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.price
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.deadline
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.bidUnit
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.successfulBidder
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.hits
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.startPrice
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.bidCount
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.categoryName
																							+ "</td>";
																					data += "<td align='center'>"
																							+ item.auctionDuring
																							+ "</td>";
																					data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
																					data += "</tr>";
																				});

																data += "</table>";
																$("#tabs-1")
																		.html(
																				data);
															}//function
														});//ajax 
											}

										});//click
					});//jquery	

	//입금 대기 목록 확인	
	$(document)
			.on(
					"click",
					"#waiting",
					function() {
						var code = $(this).val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/productListByState",
									data : "${_csrf.parameterName}=${_csrf.token}&&state="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td  align='center' colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click
	//입금 완료 목록
	$(document)
			.on(
					"click",
					"#complete",
					function() {
						var code = $(this).val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/productListByState",
									data : "${_csrf.parameterName}=${_csrf.token}&&state="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionBuring
																	+ "</td>";
															data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
															data += "</tr>";
														});

										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click

	//배송중 목록
	$(document)
			.on(
					"click",
					"#delivery",
					function() {
						var code = $(this).val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/productListByState",
									data : "${_csrf.parameterName}=${_csrf.token}&&state="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>배송조회</th><th>삭제</th>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "<td align='center'><input type='button' class='adminValP' value='배송 조회' id='deliverySelect'></td>";
															data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}
								});//function
					});//ajax

	//배송 정보
	$(document)
			.on(
					"click",
					"#delivery2",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						var code2 = $(this).parent().parent().children(
								"td:first").next().text();
						//alert(code+"   "+code2)
						if (code == "우체국택배") {
							window
									.open(
											"http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "CJ대한통운택배") {
							window
									.open(
											"http://nexs.cjgls.com/web/info.jsp?slipno="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "현대택배") {
							window
									.open(
											"http://www.hlc.co.kr/hydex/jsp/tracking/trackingViewCus.jsp?InvNo="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "한진택배") {
							window
									.open(
											"http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "로젠택배") {
							window
									.open(
											"http://d2d.ilogen.com/d2d/delivery/invoice_tracesearch_quick.jsp?slipno="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "옐로우캡") {
							window
									.open(
											"http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "대신택배") {
							window
									.open(
											"http://home.daesinlogistics.co.kr/daesin/jsp/d_freight_chase/d_general_process2.jsp?billno1="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "편의점택배") {
							window
									.open(
											"http://www.doortodoor.co.kr/jsp/cmn/TrackingCVS.jsp?pTdNo="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "KGB택배") {
							window
									.open(
											"http://www.kgbls.co.kr//sub5/trace.asp?f_slipno="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "천일택배") {
							window
									.open(
											"http://www.cyber1001.co.kr/kor/taekbae/HTrace.jsp?transNo="
													+ $("#deliveryNo").val(),
											"pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "일양로지스") {
							window
									.open(
											"http://www.ilyanglogis.com/functionality/card_form_waybill.asp?hawb_no="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "용마로지스") {
							window
									.open(
											"http://www.gtxlogis.co.kr/tracking/default.asp?awblno="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
						if (code == "퀵퀵닷컴") {
							window
									.open(
											"http://www.quickquick.com/q/MTrack.php?hawb="
													+ code2, "pop",
											"width=570,height=420, scrollbars=yes, resizable=yes");
						}
					});//click			

	$(document)
			.on(
					"click",
					"#deliverySelect",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						//alert(code);
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectDeliveryByNo",
									data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<table><tr><th>운송 회사</th><th>운송장 번호</th></tr>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'>"
																	+ item.deliveryCompany
																	+ "</td>";
															data += "<td align='center'><a href='#' id='delivery2'>"
																	+ item.deliveryNo
																	+ "</a></td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#deliveryResult").html(data);
										$("#deliveryResult").css("display",
												"none");
										$("#delivery2").trigger("click");
									}//function
								});//ajax
					});//click

	//구매확정 목록
	$(document)
			.on(
					"click",
					"#confirm",
					function() {
						var code = $(this).val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/productListByState",
									data : "${_csrf.parameterName}=${_csrf.token}&&state="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click

	//배송완료 목록
	$(document)
			.on(
					"click",
					"#deliveryEnd",
					function() {
						var code = $(this).val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/productListByState",
									data : "${_csrf.parameterName}=${_csrf.token}&&state="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click

	//경매중 목록
	$(document)
			.on(
					"click",
					"#stillAuction",
					function() {
						var code = $(this).val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/productListByState",
									data : "${_csrf.parameterName}=${_csrf.token}&&state="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='subButton'>";
										data += "<input type='button' class='adminValP' value='경매중' id='stillAuction'/>"
										data += "<input type='button' class='adminValP' value='입금대기' id='waiting'/>"
										data += "<input type='button' class='adminValP' value='입금완료' id='complete'/>"
										data += "<input type='button' class='adminValP' value='배송중' id='delivery'/>"
										data += "<input type='button' class='adminValP' value='배송완료' id='deliveryEnd'/>"
										data += "<input type='button' class='adminValP' value='구매확정' id='confirm'/>"
										data += "</div>";
										data += "<table><tr><th>상품 번호</th><th  colspan='2'>상품 이름</th><th>가격</th><th>기간</th><th>응찰 단위</th><th>낙찰자</th><th>조회수</th><th>시작가</th><th>응찰자 수</th><th>카테고리</th><th>경매 기간</th><th>삭제</th>";
										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'><a href='#' id='userProductNo'>"
																	+ item.productNo
																	+ "</a></td>";
															data += "<td align='center'  colspan='2'>"
																	+ item.productName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.price
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.deadline
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidUnit
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.successfulBidder
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.hits
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.startPrice
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.bidCount
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.categoryName
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.auctionDuring
																	+ "</td>";
															data += "<td align='center'><input type='button' class='adminValP' value='삭제' id='deleteProduct'/></td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click
	//승인 대기 목록
	$(document)
			.ready(
					function() {
						$("#permitProduct")
								.click(
										function() {
											var code = "승인대기";
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/productListByState",
														data : "${_csrf.parameterName}=${_csrf.token}&&state="
																+ code,
														dataType : "json",
														success : function(
																result) {
															var data = "";
															data += "<table><tr><th>상품 번호</th><th>사용자ID</th><th  colspan='2'>상품 이름</th><th>응찰 단위</th><th>시작가</th><th>카테고리</th><th>경매 기간</th><th>승인할까</th>";
															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				data += "<tr>";
																				data += "<input type='hidden' value='"+item.productNo+"'id='productNo'/>";
																				data += "<td align='center'><a href='#' id='userProductNo'>"
																						+ item.productNo
																						+ "</a></td>";
																				data += "<td align='center'>"
																						+ item.userId
																						+ "</td>";
																				data += "<td align='center'  colspan='2'>"
																						+ item.productName
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.bidUnit
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.startPrice
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.categoryName
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.auctionDuring
																						+ "</td>";
																				data += "<td align='center'><input type='button' class='adminValP' value='승인' id='permitBtn'/><br><input type='button' class='adminValP' value='거절' id='refuseBtn'/></td>";
																				data += "</tr>";
																			});
															data += "</table>";
															$("#tabs-1").html(
																	data);
														}//function
													});//ajax
										});//click
					});//jquery
	//승인 허가 기능
	$(document)
			.on(
					"click",
					"#permitBtn",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						var code3 = $(this).parent().parent().children(
								"td:first").next().text();
						var code4 = $(this).parent().parent().children(
								"td:first").next().next().text();
						//alert("상품번호 " + code+"userId"+code3);
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/permitProduct",
									data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
											+ code + "&&userId=" + code3,
									dataType : "json",
									success : function(result) {
										$("#permitProduct").trigger("click");
									}//function
								});//ajax
						var code2 = $(this).parent().parent().children(
								"td:first").next().next().next().next().next()
								.next().next().text();
						//alert(code2);
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/updateDeadline",
									data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
											+ code + "&&autionDuring=" + code2,
									dataType : "json",
									success : function(result) {
										$("#permitProduct").trigger("click");
									}//function
								});//ajax

						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/permitEmail",
									data : "${_csrf.parameterName}=${_csrf.token}&&productName="
											+ code4 + "&&id=" + code3,
									dataType : "json",
									success : function(result) {
										$("#permitProduct").trigger("click");
									}//function
								});//ajax
					});//click
	//승인 거절 기능
	$(document)
			.on(
					"click",
					"#refuseBtn",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						var code3 = $(this).parent().parent().children(
								"td:first").next().text();
						//alert(code + code3);
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/deleteProcessByNo",
									data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
											+ code + "&&id=" + code3,
									dataType : "text",
									success : function(result) {
										$("#permitProduct").trigger("click");
									}//function
								});//ajax
					});//click
	//답변완료 질문 목록
	$(document)
			.on(
					"click",
					"#questionYes",
					function() {
						var code = "YES";
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectQuestionByProcess",
									data : "${_csrf.parameterName}=${_csrf.token}&&questionProcess="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='questionTab'>";
										data += "<input type='button' class='adminValP' value='답변완료' id='questionYes'/>"
										data += "<input type='button' class='adminValP' value='답변대기' id='questionProcessNo'/>"
										data += "</div>";
										data += "<table><tr><th>게시글 번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>답변 여부</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'>"
																	+ item.questionNo
																	+ "</td>";
															data += "<td align='center'><a href='#' id='questionTitle'>"
																	+ item.questionTitle
																	+ "</a></td>";
															data += "<td align='center'>"
																	+ item.userId
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.questionWritedate
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.questionProcess
																	+ "</td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click
	//답변대기 목록
	$(document)
			.on(
					"click",
					"#questionProcessNo",
					function() {
						var code = "NO";
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectQuestionByProcess",
									data : "${_csrf.parameterName}=${_csrf.token}&&questionProcess="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='questionTab'>";
										data += "<input type='button' class='adminValP' value='답변완료' id='questionYes'/>"
										data += "<input type='button' class='adminValP' value='답변대기' id='questionProcessNo'/>"
										data += "</div>";
										data += "<table><tr><th>게시글 번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>답변 여부</th>";

										$
												.each(
														result,
														function(index, item) {
															data += "<tr>";
															data += "<td align='center'>"
																	+ item.questionNo
																	+ "</td>";
															data += "<td align='center'><a href='#' id='questionTitle'>"
																	+ item.questionTitle
																	+ "</a></td>";
															data += "<td align='center'>"
																	+ item.userId
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.questionWritedate
																	+ "</td>";
															data += "<td align='center'>"
																	+ item.questionProcess
																	+ "</td>";
															data += "</tr>";
														});
										data += "</table>";
										$("#tabs-1").html(data);
									}//function
								});//ajax
					});//click
	//전체 질문 목록
	$(document)
			.ready(
					function() {
						$("#QuestionAnswer")
								.click(
										function() {
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/selectQuestion",
														data : "${_csrf.parameterName}=${_csrf.token}",
														dataType : "json",
														success : function(
																result) {
															var data = "<div id='questionTab'>";
															data += "<input type='button' class='adminValP' value='답변완료' id='questionYes'/>"
															data += "<input type='button' class='adminValP' value='답변대기' id='questionProcessNo'/>"
															data += "</div>";
															data += "<table><tr><th>게시글 번호</th><th>제목</th><th>작성자</th><th>작성시간</th><th>답변 여부</th>";

															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				data += "<tr>";
																				data += "<td align='center'>"
																						+ item.questionNo
																						+ "</td>";
																				data += "<td align='center'><a href='#' id='questionTitle'>"
																						+ item.questionTitle
																						+ "</a></td>";
																				data += "<td align='center'>"
																						+ item.userId
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.questionWritedate
																						+ "</td>";
																				data += "<td align='center'>"
																						+ item.questionProcess
																						+ "</td>";
																				data += "</tr>";
																			});
															data += "</table>";
															$("#tabs-1").html(
																	data);
														}//function
													});//ajax
										});//click
					});//jquery
	//공지 전체 목록 보기
	$(document)
			.ready(
					function() {
						$("#noticePage")
								.click(
										function() {
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/selectNotice",
														data : "${_csrf.parameterName}=${_csrf.token}",
														dataType : "json",
														success : function(
																result) {
															var data = "";
															data += "<table><tr><th>공지사항 번호</th><th>제목</th><th>작성시간</th><th>삭제</th></tr>";
															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				data += "<tr>";
																				data += "<td align='center'>"
																						+ item.noticeNo
																						+ "</td>";
																				data += "<td align='center'><a href='#' id='noticeTitle'>"
																						+ item.noticeTitle
																						+ "</a></td>";
																				data += "<td align='center'>"
																						+ item.noticeWritedate
																						+ "</td>";
																				data += "<td align='center'><input type='button' value='삭제' id='noticeDelete'/></td>";
																				data += "</tr>";
																			});
															data += "<tr>";
															data += "</tr>";
															data += "</table>";
															data += "<input type='button' value='등록' id='noticeWrite'/>";
															$("#tabs-1").html(
																	data);
														}//function
													});//ajax
										});//click
					});//jquery
	//공지 삭제 기능
	$(document).on("click", "#noticeDelete", function() {
		var code = $(this).parent().parent().children("td:first").text();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/deleteNotice",
			data : "${_csrf.parameterName}=${_csrf.token}&&noticeNo=" + code,
			dataType : "json",
			success : function(result) {
				$("#noticePage").trigger("click");
			}//function
		});//ajax
	});//click
	//공지 상세보기 기능
	$(document)
			.on(
					"click",
					"#questionTitle",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectQuestionByTitle",
									data : "${_csrf.parameterName}=${_csrf.token}&&questionNo="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "";
										data += "<div id='insertQuestionDiv'>";
										$
												.each(
														result,
														function(index, item) {
															data += "<input type='hidden' id='questionNo2' value='"+item.questionNo+"'/>";
															data += "<h5>질문 제목</h5><input type='text' readonly='readonly' id='questionTitle2' value='"+item.questionTitle+"'/><br>";
															data += "<h5>질문 내용</h5><input type='text' readonly='readonly' id='questionContent' value='"+item.questionContent+"'/><br>";
															data += "<h5>작성 날짜</h5><input type='text' readonly='readonly' id='questionWritedate' value='"+item.questionWritedate+"'/><h5>작성자</h5> <input type='text' readonly='readonly' id='questionUserId' value='"+item.userId+"'/>";
															if (item.questionProcess == "YES") {
																data += "<h5>답변 내용</h5><input type='text' readonly='readonly' id='answerContent' value='"+item.answerContent+"'/><input type='button' id='updateAnswer' value='수정'/><input type='button' id='deleteAnswer' value='삭제'/>";
															} else if (item.questionProcess == "NO") {
																data += "<input type='text' id='insertAnswerContent'/></td><td><input type='button' id='insertAnswer' value='등록'/>";
															}
														});  
										data += "<input type='button'id='closeBtn' value='닫기'>";
										data += "</div>";
										$("#insertQuestion").html(data);
										$("#insertQuestion_wrap").html();
										$("#insertQuestion_wrap").css(
												"display", "block");
									}//function
								});//ajax
					});//click 
	/////////////모달창 닫기 버튼
	$(document).on("click", "#closeBtn", function() {
		$("#insertQuestion_wrap").css("display", "none");
		$("#QuestionAnswer").trigger("click");
	});
	/////////////모달창 닫기 버튼
	$(document).on("click", "#detailDivClose", function() {
		$("#userDetailDiv_wrap").css("display", "none");
		$("#detailResult").empty();
		$("#selectAllUser").trigger("click");
	});
	/////////////모달창 닫기 버튼
	$(document).on("click", "#closeBtn2", function() {
		$("#selectNotice_wrap").css("display", "none");
		$("#user").trigger("click");
	});
	/////////////모달창 닫기 버튼
	$(document).on("click", "#closeBtn3", function() {
		$("#insertNoticeDiv_wrap").css("display", "none");
		$("#noticePage").trigger("click");
	});
	////질문 답변 기능
	$(document)
			.on(
					"click",
					"#insertAnswer",
					function() {
						var code = $("#questionNo2").val();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/insertAnswer",
									data : "${_csrf.parameterName}=${_csrf.token}&&answerContent="
											+ $("#insertAnswerContent").val()
											+ "&&questionNo=" + code,
									dataType : "text",
									success : function(result) {
										$("#closeBtn").trigger("click");
									}//function
								});//ajax 
					});
	//질문 답변 삭제 기능
	$(document).on("click", "#deleteAnswer", function() {
		var code = $("#questionNo2").val();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/deleteAnswer",
			data : "${_csrf.parameterName}=${_csrf.token}&&questionNo=" + code,
			dataType : "text",
			success : function(result) {
				$("#insertQuestion_wrap").css("display", "none");
				$("#QuestionAnswer").trigger("click");
			}//function
		});//ajax 
	});
	//질문 답글 수정 기능
	$(document)
			.on(
					"click",
					"#updateAnswer",
					function() {
						var code = $("#questionNo2").val();
						if ($("#updateAnswer").val() == "수정") {
							$("#answerContent").removeAttr("readonly");
							$("#updateAnswer").val("수정완료");

						} else {
							$
									.ajax({
										type : "POST",
										url : "${pageContext.request.contextPath}/updateAnswer",
										data : "${_csrf.parameterName}=${_csrf.token}&&answerContent="
												+ $("#answerContent").val()
												+ "&&questionNo=" + code,
										dataType : "text",
										success : function(result) {
											$("#updateAnswer").val("수정");
											$("#answerContent").attr(
													"readonly", true);
										}//function
									});//ajax
						}
					});
	//공지 상세보기 기능
	$(document)
			.on(
					"click",
					"#noticeTitle",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectNoticeByTitle",
									data : "${_csrf.parameterName}=${_csrf.token}&&noticeNo="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "<div id='noticeDetailDiv'>";
										$
												.each(
														result,
														function(index, item) {
															data += "<input type='hidden' id='noticeNo' value='"+item.noticeNo+"'/>";
															data += "<input type='hidden' id='noticeWritedate' value='"+item.noticeWritedate+"'/>";
															data += "<h5>공지 제목</h5><input type='text' readonly='readonly' id='noticeTitle2' value='"+item.noticeTitle+"'/>";
															data += "<h5>공지 내용</h5><input type='text' readonly='readonly' id='noticeContent2' value='"+item.noticeContent+"'/>";
															data += "<input type='button' id='updateNotice' value='수정하기'/>";
														});
										data += "<input type='button' id='closeBtn2' value='닫기'>";
										data += "</div>";
										$("#selectNotice").html(data);
										$("#selectNotice_wrap").html();
										$("#selectNotice_wrap").css("display",
												"block");
									}//function
								});//ajax
					});//click
	//공지 수정 기능
	$(document)
			.on(
					"click",
					"#updateNotice",
					function() {
						if ($("#updateNotice").val() == "수정하기") {
							$("#noticeTitle2").removeAttr("readonly");
							$("#noticeContent2").removeAttr("readonly");
							$("#updateNotice").val("수정완료");
						} else {
							$
									.ajax({
										type : "POST",
										url : "${pageContext.request.contextPath}/updateNotice",
										data : "${_csrf.parameterName}=${_csrf.token}&&noticeTitle2="
												+ $("#noticeTitle2").val()
												+ "&&noticeContent2="
												+ $("#noticeContent2").val()
												+ "&&noticeNo="
												+ $("#noticeNo").val(),
										dataType : "json",
										success : function(result) {
											//$("#noticePage").trigger("click");
											var data = "<div id='noticeDetailDiv'>";
											$.each(
															result,
															function(index, item) {
																data += "<input type='hidden' id='noticeNo' value='"+item.noticeNo+"'/>";
																data += "<input type='hidden' id='noticeWritedate' value='"+item.noticeWritedate+"'/>";
																data += "<h5>공지 제목</h5><input type='text' readonly='readonly' id='noticeTitle2' value='"+item.noticeTitle+"'/><br>";
																data += "<h5>공지 내용</h5><input type='text' readonly='readonly' id='noticeContent2' value='"+item.noticeContent+"'/>";
																data += "<input type='button' id='updateNotice' value='수정하기'/>";
															});
											data += "<input type='button' id='closeBtn2' value='닫기'>";
											data += "</div>";
											$("#selectNotice").html(data);
											$("#selectNotice_wrap").html();
											$("#selectNotice_wrap").css(
													"display", "none");
										}//function
									});//ajax
						}
					});
	//공지 작성 기능
	$(document)
			.on(
					"click",
					"#noticeWrite",
					function() {
						var data = "";
						data += "<div id='noticeWriteDiv'>"
						data += "<h5>공지 제목</h5> <input type='text' id='insertNoticeTitle'/>";
						data += "<h5>공지 내용 </h5><input type='text' id='insertNoticeContent'/>";
						data += "<input type='button' id='insertNotice' value='등록하기'/>";
						data += "<input type='button' id='closeBtn3' value='닫기'>";
						data += "</div>";
						$("#insertNoticeDiv").html(data);
						$("#insertNoticeDiv_wrap").html();
						$("#insertNoticeDiv_wrap").css("display", "block");
					});//click

	//공지 작성 기능
	$(document)
			.on(
					"click",
					"#insertNotice",
					function() {
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/insertNotice",
									data : "${_csrf.parameterName}=${_csrf.token}&&noticeTitle="
											+ $("#insertNoticeTitle").val()
											+ "&&noticeContent="
											+ $("#insertNoticeContent").val(),
									dataType : "text",
									success : function(result) {
										$("#closeBtn3").trigger("click");
									}//function
								});//ajax
					});//click
					
					function numberWithCommas(x) {
						return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					}
</script>
</head>

<body>

	<div class="headerButton">
		<input type="button" class="adminValP" value="사용자 목록보기"
			id="selectAllUser" /> <input type="button" class="adminValP"
			value="경매 상품 리스트" id="productList" /> <input type="button"
			class="adminValP" value="승인할 상품 리스트" id="permitProduct" /> <input
			type="button" class="adminValP" value="문의 글 확인하기" id="QuestionAnswer" />
		<input type="button" class="adminValP" value="공지사항" id="noticePage" />
		<div>
			<div id="searchForm">
				<select name="searchSelect" id="searchSelect">
					<option value="searchCategory" selected>---카테고리---</option>
					<option value="userSearch">회원</option>
					<option value="productSearch">상품</option>
					<option value="permitSearch">승인상품</option>
					<option value="questionSearch">문의</option>
					<option value="noticeSearch">공지</option>
				</select><input type="text" id="searchText" placeholder="검색할 단어를 입력하세요.." /><i
					class="fa fa-search" aria-hidden="true"></i>
			</div>
		</div>
		<div id="tabs-1"></div>
	</div>
	<div id="insertQuestion_wrap">
		<div id="insertQuestion"></div>
	</div>
	<div id="selectNotice_wrap">
		<div id="selectNotice"></div>
	</div>
	<div id="insertNoticeDiv_wrap">
		<div id="insertNoticeDiv"></div>
	</div>
	
	<div id="userDetailDiv_wrap">
		<div id="userDetailDiv">
			<div id="userDetailTab">
				<input type="button" class="adminValP2" value="판매내역"
					id="selectSellById" /> <input type="button" class="adminValP2"
					value="구매내역" id="selectBuyById" /> <input type="button"
					class="adminValP2" value="문의내역" id="selectQuestionById" /> <input
					type="button" class="adminValP2" value="관심상품"
					id="selectInterestById" /> <input type="button" class="adminValP2"
					value="오늘 본 상품" id="selectSeenById" /> <input type="button"
					class="adminValP2" value="계좌정보" id="selectAccountById" /> <input
					type="button" class="adminValP2" value="닫기" id="detailDivClose" />
			</div>
			<div id="detailResult"></div>
		</div>
	</div>

	<div id="deliveryResult"></div>
</body>
</html>