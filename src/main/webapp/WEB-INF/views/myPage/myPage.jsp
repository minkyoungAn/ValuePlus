<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Value+</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css">
<sec:authentication property="principal" var="vo" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style>
/*비밀번호 수정 */
.input_text {
	width: 30%;
	height: 50%;
	transition: 0.5s;
}

.form_footer>input {
	outline: none;
	width: 16%;
	height: 80%;
	margin-right: 20px;
}

#pwheader h4 {
	width: 100%;
	height: 30px;
	float: left;
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
	padding-left: 20px;
	box-sizing: border-box;
	font-weight: bold;
}

#updatePwContent h3 {
	width: 100%;
	height: 35px;
	float: left;
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
	padding-left: 20px;
	box-sizing: border-box;
	font-weight: bold;
}

#updatePwSubmit {
	background: #1AAB8A;
	color: #fff;
	border: none;
	border-radius: 20px;
	position: relative;
	height: 40px;
	font-size: 1.0em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#updatePwSubmit:hover {
	background: #fff;
	color: #1AAB8A;
}

#updatePwSubmit:before, #updatePwSubmit:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#updatePwSubmit:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#updatePwSubmit:hover:before, #updatePwSubmit:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

#updatePwReset {
	background: #1AAB8A;
	color: #fff;
	border: none;
	border-radius: 20px;
	position: relative;
	height: 40px;
	font-size: 1.0em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#updatePwReset:hover {
	background: #fff;
	color: #1AAB8A;
}

#updatePwReset:before, #updatePwReset:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#updatePwReset:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#updatePwReset:hover:before, #updatePwReset:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

/*비밀번호 수정 끝*/
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						///////등급 모달
						$("#grade_btn").click(function() {
							$("#gradeModal_wrap").css("display", "block");
							$("#gradeModal").css("display", "block");
						});
						$("#gradeCloseBtn").click(function() {
							$("#gradeModal_wrap").css("display", "none");
							$("#gradeModal").css("display", "none");
						});
						var userId = "${vo.id}";
						var productNo;
						var productName;
						//판매내역 불러오기 ajax
						$("#sellingList")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#slContent").css({
												"display" : "block"
											});
											var str = "";
											$
													.ajax({
														url : "${pageContext.request.contextPath}/mySellList",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&id="
																+ userId,
														success : function(
																result) {
															if (result == null
																	|| result == "") {
																str += "<div id='nullContent' class='menuDiv hi'>";
																str += "<div>등록된 상품이 없습니다!!!</div>";
																str += "<div style='margin:auto;'>";

																$(
																		"#sellContent")
																		.html(
																				str);

															} else {
																str = "";
																str += "<table id='sellContentTable'><tr  style='height:70px; border-bottom:2px solid rgba(0,0,0,0.1)'><td>상품번호</td><td>상품 이미지</td><td>상품명</td><td>경매기간</td><td>현재가</td><td>비고</td></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					str += "";
																					str += "<tr>";
																					str += "<td>"
																							+ result[index].productNo
																							+ "</td>";
																					str += "<td> <img style='width:100px;height:100px;' src='${pageContext.request.contextPath}/" + result[index].prodImg + "'  width='150px' height='180px'></td>";
																					str += "<td>"
																							+ result[index].prodName
																							+ "</td>";
																					str += "<td>"
																							+ result[index].bidderDate
																							+ "</td>";
																					str += "<td>"
																							+ result[index].nowPrice
																									.toString()
																									.replace(
																											/\B(?=(\d{3})+(?!\d))/g,
																											",");
																					+"</td>";
																					str += "<td id='stateSellTd'> ";
																					if (result[index].prodState == '승인대기') {
																						str += "<div>경매중</div>";
																					} else if (result[index].prodState == '경매중') {
																						str += "<div>경매중</div>";
																					} else if (result[index].prodState == '배송중'
																							|| result[index].prodState == '입금대기'
																							|| result[index].prodState == '입금완료'
																							|| result[index].prodState == '배송완료') {
																						str += "<div id='transactionInfoSellDetail'>진행상황 <input class='ipProdSellState' type='hidden' name='prodStat' value='"+result[index].prodState+"'/><input class='productName' type='hidden' value='"+result[index].prodName+"'/> <input class='ipProdSellNo' type='hidden' value='"+result[index].productNo+"'/></div>";
																					} else if (result[index].prodState == '마감') {
																						str += "<div>마감</div>";
																					}
																					str += "</td>";
																					str += "</tr>";

																				});
																str += "</table>";
																$(
																		"#sellContent")
																		.html(
																				str)
																		.trigger(
																				"create");

																$(
																		"#sellContentTable")
																		.css(
																				{
																					"text-align" : "center"
																				});
																$(
																		"#sellContentTable")
																		.css(
																				{
																					"border" : "1px solid rgba(0,0,0,0.1)"
																				});
																$(
																		"#sellContentTable>tbody>tr")
																		.css(
																				{
																					"height" : "100px;"
																				});

															}

														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}

													});
											var str = "";
											$
													.ajax({
														url : "${pageContext.request.contextPath}/mySellWaitList",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&id="
																+ userId,
														success : function(
																result) {
															if (result == null
																	|| result == "") {
																str = "";
																str += "<div id='nullWaitContent' class='menuDiv hi'>";
																str += "<div>등록된 상품이 없습니다!!!</div>";
																str += "<div style='margin:auto;'>";

																$(
																		"#sellWaitContent")
																		.html(
																				str);

															} else {
																str = "";
																str += "<table id='sellWaitContentTable'><tr  style='height:70px; border-bottom:2px solid rgba(0,0,0,0.1)'><td>상품번호</td><td>상품 이미지</td><td>상품명</td><td>경매기간</td><td>현재가</td><td>비고</td></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					str += "";
																					str += "<tr>";
																					str += "<td>"
																							+ result[index].productNo
																							+ "</td>";
																					str += "<td> <img style='width:100px;height:100px;' src='${pageContext.request.contextPath}/" + result[index].prodImg + "'  width='150px' height='180px'></td>";
																					str += "<td>"
																							+ result[index].prodName
																							+ "</td>";
																					str += "<td>"
																							+ result[index].bidderDate
																							+ "</td>";
																					str += "<td>"
																							+ result[index].nowPrice
																									.toString()
																									.replace(
																											/\B(?=(\d{3})+(?!\d))/g,
																											",");
																					+"</td>";

																					str += "<div>"
																							+ result[index].prodState
																							+ "</div>";
																					str += "</td>";
																					str += "</tr>";

																				});
																str += "</table>";
																$(
																		"#sellWaitContent")
																		.html(
																				str);
															}

														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});
										});//판매 내역 불러오기 ajax
						var payProductNo;
						var payProductPrice;
						//구매 내역 불러오기 ajax
						$("#buyingList")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#blContent").css({
												"display" : "block"
											});
											var str = "";
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myBuyList",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&id="
																+ userId,
														success : function(
																result) {
															if (result == null
																	|| result == "") {
																str += "<div id='nullContent' class='menuDiv hi'>";

																str += "<div style='margin:auto;'>";

																$("#buyContent")
																		.html(
																				str);
																$("#buyContent")
																		.css(
																				{
																					"width" : "80%"
																				});
																$("#buyContent")
																		.css(
																				{
																					"text-align" : "center"
																				});
																$("#buyContent")
																		.css(
																				{
																					"border" : "1px solid rgba(0,0,0,0.1)"
																				});

															} else {
																str = "";
																str += "<tr style='height:70px; border-bottom:2px solid rgba(0,0,0,0.1)'><td>상품번호</td><td>상품 이미지</td><td>상품명</td><td>판매자 아이디</td><td>경매기간</td><td>응찰가격</td><td>비고</td></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {

																					str += "<tr>";
																					str += "<td>"
																							+ result[index].productNo
																							+ "</td>";

																					str += "<td> <img style='width:100px;height:100px;' src='${pageContext.request.contextPath}/" + result[index].prodImg + "'></td>";
																					str += "<td>"
																							+ result[index].prodName
																							+ "</td>";
																					str += "<td>"
																							+ result[index].sellId
																							+ "</td>";
																					str += "<td>"
																							+ result[index].bidderDate
																							+ "</td>";
																					str += "<td>"
																							+ result[index].nowPrice
																									.toString()
																									.replace(
																											/\B(?=(\d{3})+(?!\d))/g,
																											",")
																							+ "원 </td>";
																					str += "<td id='stateTd'> ";
																					if (result[index].prodState == '경매중') {
																						str += "<div>경매중</div>";
																					} else if (result[index].prodState == '배송중'
																							|| result[index].prodState == '입금대기'
																							|| result[index].prodState == '입금완료'
																							|| result[index].prodState == '배송완료') {
																						str += "<div style='color:red' id='transactionInfoDetail'>진행상황 <input class='ipProdState' type='hidden' name='prodStat' value='"+result[index].prodState+"'/><input class='buyProductPrice' type='hidden' value='"+result[index].nowPrice+"'/><input class='sellIdByProduct' type='hidden' value='"+result[index].sellId+"'/> <input class='ipProdNo' type='hidden' value='"+result[index].productNo+"'/></div>";
																					} else if (result[index].prodState == '마감') {
																						str += "<div>마감</div>";
																					}
																					str += "</td>";
																					str += "</tr>";
																					str += "";

																				});
																$(
																		"#buyContent > table")
																		.html(
																				str);
															}
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});
										});
						//myPage 계좌 정보 ajax
						$("#accountManager")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#amContent").css({
												"display" : "block"
											});

											//var id = 'amk483';
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myAccount",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&userId="
																+ userId,
														success : function(
																result) {

															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				if (item == null
																						|| item == "") {
																					$(
																							".accountDiv")
																							.css(
																									{
																										"display" : "block"
																									});
																					str = "";
																					str += "<tr> <td colspan='2'> "
																							+ userId
																							+ "님계좌정보  </td></tr>";
																					str += "<tr> <td>은행</td>";
																					str += "<td> <div id='bankName'> "
																							+ "<input type='text' class='bknText' name='bankName' value='' onkeypress='onlyNumcheck()'>"
																							+ " </div></td></tr>";
																					str += "<tr> <td>예금주</td>";
																					str += "<td> <div id='accountHolder'> "
																							+ "<input type='text' class='achText' name='accountHolder' value=''>"
																							+ "</td></tr>";
																					str += "<tr> <td>계좌번호</td>";
																					str += "<td> <div id='accountNo'> "
																							+ "<input type='text' class='acnText' name='accountNo' value='' onkeypress='onlyNumcheck()'>"
																							+ "</div></td></tr>";
																					str += "<tr> <td colspan='2'>";
																					str += "<div id='accountAtag'>";
																					str += "<input id='editBtn' class='editBtn' type='button' value='입력'/> <input type='button' class='AccountCancelBtn' value='취소'/>";
																					str += "<input class='ipUserId' type='hidden' name='userId' value='"+userId+"'/> </div></td></tr>";

																				} else {
																					str = "";
																					str += "<tr> <td colspan='2'> "
																							+ userId
																							+ "님계좌정보  </td></tr>";
																					str += "<tr> <td>은행</td>";
																					str += "<td> <div id='bankName'> "
																							+ item.bankName
																							+ " </div></td></tr>";
																					str += "<tr> <td>예금주</td>";
																					str += "<td> <div id='accountHolder'>"
																							+ item.accountHolder
																							+ "</td></tr>";
																					str += "<tr> <td>계좌번호</td>";
																					str += "<td> <div id='accountNo'> "
																							+ item.accountNo
																							+ "</div></td></tr>";
																					str += "<tr> <td colspan='2'>";
																					str += "<div id='accountAtag'>";
																					str += "<input id='editBtn' class='editBtn' type='button' value='수정'/> <input type='button' class='AccountCancelBtn' value='취소'/>";
																					str += "<input class='ipUserId' type='hidden' name='userId' value='"+userId+"'/> </div></td></tr>";
																				}
																			});

															$(
																	"#amContent > table")
																	.html(str);
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});

										});//mypage 계좌정보 ajax

						$(".fa-user-circle-o")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#peContent").css({
												"display" : "block"
											});
											//var id = 'geein'
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myProfile",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&id="
																+ userId,
														success : function(
																result) {
															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				str = "";
																				str += "<tr><td colspan='2'>"
																						+ item.id
																						+ "님 계정 정보</td></tr>";
																				str += "<tr><td>ID</td>";
																				str += "<td>"
																				str += "<input type='text' value='"+item.id+"' id='editUserId' readonly='true'/>";
																				str += "</td></tr>";
																				str += "<tr><td>E-mail</td>";
																				str += "<td id='pfEmailTd'>"
																						+ item.email
																						+ "</td></tr>";
																				str += "<tr><td>연락처</td>";
																				str += "<td id='pfPhoneTd'>"
																						+ item.phone
																						+ "</td></tr>";
																				str += "<tr><td>우편번호</td>";
																				str += "<td id='pfZipNoTd''>"
																				str += "<input type='text' value='"+item.zipNo+"' id='zipNo' readonly='true'/>";
																				str += "<input type='button' id='addressBtn' class='ValP' value='우편번호검색' style='display:none;' onClick='goPopup();'/></td></tr>";
																				str += "<tr><td rowspan='2'>주소</td>";
																				str += "<td id='pfAddressTd'>"
																						+ "<input type='text' value='"+item.roadAddrPart1+"' id='roadAddrPart1' readonly='true'/>";
																				+"</td></tr>";
																				str += "<tr><td id='pfAddressDetailTd'>"
																						+ "<input type='text' value='"+item.addrDetail+"' id='addrDetail' readonly='true'/>";
																				+"</td></tr>";
																				str += "<tr> <td colspan='2'>";
																				str += "<div id='userprofileAtag'>";
																				str += "<input id='profileEditBtn' class='pfEditBtn' type='button' value='수정'/> <input type='button' class='UserCancelBtn' value='취소'/>";
																				str += "<input class='pfUserId' type='hidden' name='id' value='"+item.id+"'/> </div></td></tr>";
																			});
															$(
																	"#profileEditForm > table")
																	.html(str);
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});

										});

						$("#questionList")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#qlContent").css({
												"display" : "block"
											});
											var str = '';
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myQuestionList",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&userId="
																+ userId,
														success : function(
																result) {
															if (result == null
																	|| result == "") {
																str += "";
																str += "<div id='nullContent' class='menuDiv hi'>";
																str += "<div>등록된 정보가 없습니다!!!</div>";
																str += "<div style='margin:auto;'>";

																$("#qlContent")
																		.html(
																				str);

															} else {

																str = "";
																str += "<tr><td>문의번호</td><td>제목</td><td>문의 날짜</td><td>답변 여부( Y/N )</td></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {
																					str += "<tr>";
																					str += "<td>"
																							+ result[index].questionNo
																							+ "</td>";
																					str += "<td> <div style='color:red;' id='questionDetailDiv'>"
																							+ result[index].questionTitle
																							+ "</div></td>";
																					str += "<td>"
																							+ result[index].questionWritedate
																							+ "</td>";
																					str += "<td>"
																							+ result[index].questionProcess
																							+ "</td>";
																					str += "</tr>";
																					str += "";
																				});
																$(
																		"#qlContent > table")
																		.html(
																				str);
															}
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});

										});

						// 관심 상품 불러오기
						$("#interestList")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#ilContent").css({
												"display" : "block"
											});
											var str = "";
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myInterestProd",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&userId="
																+ userId,
														success : function(
																result) {
															if (result == null
																	|| result == "") {
																str += "";
																str += "<div id='nullContent' class='menuDiv hi'>";

																str += "<div style='margin:auto;'>";

																$(
																		"#ilProdTable")
																		.html(
																				str);

															} else {

																str = "";
																str += "<tr><td>상품 이미지</td><td>상품 제목</td><td>판매자 ID</td><td>마감시간</td><td>현재가</td></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {

																					str += "<tr>";
																					str += "<td> <img  src='${pageContext.request.contextPath}/" + result[index].thumbnailPath + "'> </td>";
																					str += "<td>"
																							+ result[index].prodName
																							+ "</td>";
																					str += "<td>"
																							+ result[index].sellerId
																							+ "</td>";
																					str += "<td>"
																							+ result[index].deadline
																							+ "</td>";
																					str += "<td>"
																							+ result[index].price
																							+ "</td>";
																					str += "</tr>";
																				});
																$(
																		"#ilProdTable")
																		.html(
																				str);
															}
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});

										});
						//관심 상품 End

						// 관심 상품 불러오기
						$("#todayListDiv")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#ilContent").css({
												"display" : "block"
											});

											var str = "";
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myTodayProd",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&userId="
																+ userId,
														success : function(
																result) {
															if (result == null
																	|| result == "") {
																str += "";
																str += "<div id='nullContent' class='menuDiv hi'>";

																str += "<div style='margin:auto;'>";

																$(
																		"#ilProdTable")
																		.html(
																				str);

															} else {

																str = "";
																str += "<tr><td>상품 이미지</td><td>상품 제목</td><td>판매자 ID</td><td>마감시간</td><td>현재가</td></tr>";
																$
																		.each(
																				result,
																				function(
																						index,
																						item) {

																					str += "<tr>";
																					str += "<td> <img style='width:100px;height:100px;' src='${pageContext.request.contextPath}/" + result[index].thumbnailPath + "'> </td>";
																					str += "<td>"
																							+ result[index].prodName
																							+ "</td>";
																					str += "<td>"
																							+ result[index].sellerId
																							+ "</td>";
																					str += "<td>"
																							+ result[index].deadline
																							+ "</td>";
																					str += "<td>"
																							+ result[index].price
																							+ "</td>";
																					str += "</tr>";
																				});
																$(
																		"#ilProdTable")
																		.html(
																				str);
															}
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});

										});
						//관심 상품 End

						$("#interestListDiv")
								.click(
										function() {
											$("#pwContent").css("display",
													"none");
											$(".menuDiv").css({
												"display" : "none"
											});
											$("#ilContent").css({
												"display" : "block"
											});

											//var userId = 'geein';
											$
													.ajax({
														url : "${pageContext.request.contextPath}/myInterestProd",
														type : "post",
														dataType : "json",
														data : "${_csrf.parameterName}=${_csrf.token}&&userId="
																+ userId,
														success : function(
																result) {
															$("#interestList")
																	.trigger(
																			"click");
														},
														error : function(e) {
															alert("오류 발생 : "
																	+ e);
														}
													});

										});

						$("#modalBuyExit").click(function() {
							$(".modal").css({
								"display" : "none"
							});
						});
						$("#modalSellExit").click(function() {
							$(".modal").css({
								"display" : "none"
							});
						});
					});

	//myPage 계좌 정보 수정후 Redirect
	$(document)
			.on(
					"click",
					".editBtn",
					function() {
						$("#pwContent").css("display", "none");
						if ($(this).val() == '확인') {
							var bknText = $(".bknText").val();
							var acnText = $(".acnText").val();
							var ipUserId = $(".ipUserId").val();

							$
									.ajax({
										url : "${pageContext.request.contextPath}/updateAccount",
										type : "post",
										dataType : "json",
										data : "${_csrf.parameterName}=${_csrf.token}&&userId="
												+ ipUserId
												+ "&&bankName="
												+ bknText
												+ "&&accountNo="
												+ acnText,
										success : function(result) {
											$("#accountManager").trigger(
													"click");

										},
										error : function(e) {
											alert("오류 발생 : " + e);
										}
									});
						} else if ($(this).val() == '수정') {
							var bankName = document.getElementById('bankName');
							bankName.innerHTML = "<input type='text' class='bknText' name='bankName' value='' onkeypress='onlyNumcheck()'>";
							var accountNo = document
									.getElementById('accountNo');
							accountNo.innerHTML = "<input type='text' class='acnText' name='accountNo' value='' onkeypress='onlyNumcheck()'>";
							document.getElementById('editBtn').value = "확인";
						}
					}); //myPage 계좌 정보 수정후 Redirect End

	$(document)
			.on(
					"click",
					".pfEditBtn",
					function() {
						$("#pwContent").css("display", "none");
						if ($(this).val() == '확인') {
							var editId = $("#editUserId").val();
							var phone = $(".ipPhone").val();
							var email = $("#emailId").val() + "@"
									+ $("#emailDomain").val();
							var zipNo = $("#zipNo").val();
							var address = $("#roadAddrPart1").val();
							var addressDetail = $("#addrDetail").val();

							//alert(zipNo + address + addressDetail + email + phone + editId);
							$
									.ajax({
										url : "${pageContext.request.contextPath}/updateProfile",
										type : "post",
										dataType : "json",
										data : "${_csrf.parameterName}=${_csrf.token}&&id="
												+ editId
												+ "&&phone="
												+ phone
												+ "&&email="
												+ email
												+ "&&zipNo="
												+ zipNo
												+ "&&roadAddrPart1="
												+ address
												+ "&&addrDetail="
												+ addressDetail,
										success : function(result) {
											$(".fa-user-circle-o").trigger(
													"click");
										},
										error : function(e) {
											alert("오류 발생 : " + e);
										}
									});

						} else if ($(this).val() == '수정') {
							var phoneNumber = document
									.getElementById('pfPhoneTd');
							phoneNumber.innerHTML = "<input type='text' class='ipPhone' name='phone' value='' style='border:2px solid rgba(0,0,0,0.1)'>";
							var accountNo = document
									.getElementById('pfEmailTd');
							accountNo.innerHTML = "<div id='pfEmailDiv' style='display: none;'>"
									+ "<input type='text' id='emailId' onkeypress='onlyNumcheck()'  style='border:2px solid rgba(0,0,0,0.1)'/> @ <input type='text' id='emailDomain' style='border:2px solid rgba(0,0,0,0.1)'/> "
									+ "<select id='pfEmailSelect'><option value='0'>직접입력</option>"
									+ "<option value='1'>naver.com</option>"
									+ "<option value='0'>daum.net</option></div>";
							$("#pfEmailDiv").css({
								"display" : "block"
							});
							$("#addressBtn").css({
								"display" : "block"
							});

							$("#pfEmailSelect")
									.on(
											"change",
											function() {
												var emailDomain = $(
														"#pfEmailSelect option:checked")
														.text();
												$("#emailDomain").val(
														emailDomain);
											});

							document.getElementById('profileEditBtn').value = "확인";
						}
					}); //myPage 계정 정보 수정후 Redirect End 
	//상품 상태 수정
	$(document).on(
			"click",
			"#buyfinalize",
			function() {
				$("#pwContent").css("display", "none");
				var userId = "${vo.id}";
				var prodNo = $('.modalPno').val();
				//var customerId = "geein";
				$.ajax({
					url : "${pageContext.request.contextPath}/updateState",
					type : "post",
					dataType : "json",
					data : "${_csrf.parameterName}=${_csrf.token}&&customerId="
							+ userId + "&&productNo=" + prodNo,
					success : function(result) {
						$(".buyListDiv").css({
							"display" : "none"
						});
						$("#buyingList").trigger("click");
					},
					error : function(e) {
						alert("오류 발생 : " + e);
					}
				});

			}); //상품 상태 수정

	//문의사항 상세보기
	$(document).on("click", "#questionDetailDiv", function() {
		$("#pwContent").css("display", "none");
		$("#modalQustionExit").click(function() {
			$(".questionDiv").css({
				"display" : "none"
			});
		});
		$(document).on("click", "#modalaccountExit", function() {
			alert(1)
			$(".modal").css({
				"display" : "none"
			});
		});
		var no = $(this).parent().parent().children("td:first").text();
		$(".questionDiv").css({
			"display" : "block"
		});
		$.ajax({
			url : "${pageContext.request.contextPath}/myQuestionDetail",
			type : "post",
			dataType : "json",
			data : "${_csrf.parameterName}=${_csrf.token}&&no=" + no,
			success : function(result) {
				$.each(result, function(index, item) {
					var answerYN = item.answerContent;
					if (answerYN == null) {
						answerYN = "등록된 답변이 없습니다.";
					}
					$("#questionTitleDiv").text(item.questiontitle);
					$("#questionIdDiv").text(item.id);
					$("#questionContentDiv").text(item.questionContent);
					$("#answerContentDiv").text(answerYN);
					$("#questionWriteDayDiv").text(item.questionWriteDate);
				})
			},
			error : function(e) {
				alert("오류 발생 : " + e);
			}
		});

	}); //문의 사항 상세보기
	//myPage 구매내역 진행사황 modal
	var payProductNo;
	var payProductPrice;
	var paySellId;
	var buyId;
	$(document)
			.on(
					"click",
					"#transactionInfoDetail",
					function() {
						$("#pwContent").css("display", "none");
						$(".buyListDiv").css({
							"display" : "block"
						});
						var state = $(this).children().first().val();
						pno = $(this).children().last().val();
						payProductNo = $(this).children().last().val();
						payProductPrice = $(this).children("input").eq(1).val();
						paySellId = $(this).children("input").eq(2).val();
						buyId = $(this).children("input").eq(3).val();
						var noStr = "";
						noStr += "<input class='modalPno' type='hidden' value='"+pno+"'/>";
						$("#transactionInfoHiddenDiv").html(noStr);

						$("#tdSuccessbuy").css({
							"color" : "black"
						});
						$("#tdDelibering").css({
							"color" : "black"
						});
						$("#tdSuccessDeposit").css({
							"color" : "black"
						});
						$("#tdDepositWait").css({
							"color" : "black"
						});

						if ($("#tdDepositWait").text() == state) {
							$("#tdDepositWait").css({
								"color" : "red"
							});
							var transactionStr = "";
							transactionStr += "상품을 낙찰받으신 금액을 결제 해주세요 .<br> ";
							transactionStr += "<input type='button' id='payment' value='결제' class='ValP' style='width:95%;margin-top:20px;'>";
							$("#transactionInfoContentDiv")
									.html(transactionStr);
						} else if ($("#tdSuccessDeposit").text() == state) {
							$("#tdSuccessDeposit").css({
								"color" : "red"
							});
							var transactionStr = "";
							$("#transactionInfoContentDiv")
									.html(transactionStr);
						} else if ($("#tdDelibering").text() == state) {
							$("#tdDelibering").css({
								"color" : "red"
							});
							var transactionStr = "";
							transactionStr += "상품은 4~5일내에 도착합니다.<br> ";
							transactionStr += "<input type='button' id='deliverySelectBuy' value='배송조회'/>";
							$("#transactionInfoContentDiv")
									.html(transactionStr);
						} else if ($("#tdSuccessbuy").text() == state) {
							$("#tdSuccessbuy").css({
								"color" : "red"
							});
							var transactionStr = "";
							transactionStr += "배송 완료 완료 완료 완료 완료 완료 완료 완료 완료.<br> <button id='buyfinalize'>구매확정</button>";
							$("#transactionInfoContentDiv")
									.html(transactionStr);
						}

					});//myPage 구매내역 진행 사항 modal End
	var pnoBuy;
	$(document)
			.on(
					"click",
					"#payment",
					function() {
						$("#pwContent").css("display", "none");
						pnoBuy = payProductNo;
						window
								.open(
										'${pageContext.request.contextPath}/info?${_csrf.parameterName}=${_csrf.token}&&productNo='
												+ payProductNo
												+ '&&price='
												+ (payProductPrice * 1.3)
												+ '&&sellId='
												+ paySellId
												+ '&&buyId=${vo.id}',
										'payment_popup',
										'width=426,height=510,toolbar=no,location=no');
						request.setAttribute("productNo", payProductNo);
						request.setAttribute("price", (payProductPrice * 1.3));
						request.setAttribute("sellId", paySellId);
						request.setAttribute("buyId", buyId);
					});

	$(document).on("click", ".AccountCancelBtn", function() {
		$("#accountManager").trigger("click");
	});
	$(document).on("click", ".UserCancelBtn", function() {
		$(".fa-user-circle-o").trigger("click");
	});
	//myPage 판매내역 진행사황 modal
	var pnoSell;
	var productName;
	$(document)
			.on(
					"click",
					"#transactionInfoSellDetail",
					function() {

						$(".sellListDiv").css({
							"display" : "block"
						});

						var stateSell = $(this).children().first().val();
						pnoSell = $(this).children().last().val();
						var noStr = "";
						productName = $(this).children("input").eq(1).val();

						noStr += "<input class='modalSellPno' type='hidden' value='"+pnoSell+"'/>";
						$("#transactionInfoSellHiddenDiv").html(noStr);

						$("#tdSuccessSell").css({
							"color" : "black"
						});
						$("#tdDeliberingSell").css({
							"color" : "black"
						});
						$("#tdSuccessDepositSell").css({
							"color" : "black"
						});
						$("#tdDepositWaitSell").css({
							"color" : "black"
						});

						if ($("#tdDepositWaitSell").text() == stateSell) {
							$("#tdDepositWaitSell").css({
								"color" : "red"
							});
							var transactionStr = "";
							$("#transactionInfoSellContentDiv").html(
									transactionStr);
						} else if ($("#tdSuccessDepositSell").text() == stateSell) {
							$("#tdSuccessDepositSell").css({
								"color" : "red"
							});
							var transactionStr = "";
							transactionStr += "낙찰받은 .<br> <button id='deliberingNo'> 송장 번호 입력 </button>";
							$("#transactionInfoSellContentDiv").html(
									transactionStr);
						} else if ($("#tdDeliberingSell").text() == stateSell) {
							$("#tdDeliberingSell").css({
								"color" : "red"
							});
							var transactionStr = "";
							transactionStr += "상품은 4~5일내에 도착합니다.<br> ";
							transactionStr += "<input type='button' id='deliverySelect' value='배송조회'/>";
							transactionStr += "<input type='hidden' id='deliveryTracking'/>";
							$("#transactionInfoSellContentDiv").html(
									transactionStr);
						} else if ($("#tdSuccessSell").text() == stateSell) {
							$("#tdSuccessSell").css({
								"color" : "red"
							});
							var transactionStr = "";
							transactionStr += "배송 완료 완료 완료 완료 완료 완료 완료 완료 완료.<br> <button id='buyfinalize'>구매확정</button>";
							$("#transactionInfoSellContentDiv").html(
									transactionStr);
						}

					});//myPage 구매내역 진행 사항 modal End

	//////////////////////////////////////////////////////////////////////////기인꺼 갖다붙
	/////////주소 팝업//////
	var pop;
	function goPopup() {
		pop = window.open(
				"/controller/jusoPopup?${_csrf.parameterName}=${_csrf.token}",
				"pop", "width=530,height=300, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, engAddr,
			jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm,
			bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno,
			mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		document.getElementById("roadAddrPart1").value = roadAddrPart1;
		document.getElementById("addrDetail").value = addrDetail;
		document.getElementById("zipNo").value = zipNo;
		pop.close();
	}
	/////////운송장 모달/////
	$(document).on("click", "#deliberingNo", function() {
		$("#insertDeliveryNo_wrap").html();
		$("#insertDeliveryNo_wrap").css("display", "block");
	});
	/////////배송조회//////
	$(document)
			.on(
					"click",
					"#delivery",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").next().text();
						var code2 = $(this).parent().parent().children(
								"td:first").next().next().text();
						//alert(code + code2);
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
	/////////////////판매내역에서 배송조회////////////////////////////////
					   $(document)
					         .on(
					               "click",
					               "#deliverySelect",
					               function() {
					                  $
					                        .ajax({
					                           type : "POST",
					                           url : "${pageContext.request.contextPath}/selectDeliveryByNo",
					                           data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
					                                 + pnoSell,
					                           dataType : "json",
					                           success : function(result) {
					                              var data = "<table cellpadding='5'><tr><th>운송 회사</th><th>운송장 번호</th></tr>";
					                              $
					                                    .each(
					                                          result,
					                                          function(index, item) {
					                                             data += "<tr>";
					                                             data += "<td>"
					                                                   + item.productNo
					                                                   + "</td>";
					                                             data += "<td>"
					                                                   + item.deliveryCompany
					                                                   + "</td>";
					                                             data += "<td><a href='#' id='delivery'>"
					                                                   + item.deliveryNo
					                                                   + "</a></td>";
					                                                   data += "<td>"
					                                                      + "운송장 번호는 특수문자없이 번호만 입력해주세요.";
					                                                      + "</a></td>";
					                                             data += "</tr>";
					                                          });
					                              data += "</table>";
					                              $("#deliveryResult").html(data);
					                              $("#deliveryResult").css("display","none");
					                              $("#delivery").trigger("click");
					                           }//function
					                        });//ajax
					               });//click
					               /////////////////구매내역에서 배송조회////////////////////////////////
					               $(document)
					               .on(
					                     "click",
					                     "#deliverySelectBuy",
					                     
					                     function() {
					                       // alert(payProductNo);
					                        $
					                              .ajax({
					                                 type : "POST",
					                                 url : "${pageContext.request.contextPath}/selectDeliveryByNo",
					                                 data : "${_csrf.parameterName}=${_csrf.token}&&productNo="
					                                       + payProductNo,
					                                 dataType : "json",
					                                 success : function(result) {
					                                    var data = "<table cellpadding='5'><tr><th>운송 회사</th><th>운송장 번호</th></tr>";
					                                    $
					                                          .each(
					                                                result,
					                                                function(index, item) {
					                                                   data += "<tr>";
					                                                   data += "<td>"
					                                                         + item.productNo
					                                                         + "</td>";
					                                                   data += "<td>"
					                                                         + item.deliveryCompany
					                                                         + "</td>";
					                                                   data += "<td><a href='#' id='delivery'>"
					                                                         + item.deliveryNo
					                                                         + "</a></td>";
					                                                         data += "<td>"
					                                                            + "운송장 번호는 특수문자없이 번호만 입력해주세요.";
					                                                            + "</a></td>";
					                                                   data += "</tr>";
					                                                });
					                                    data += "</table>";
					                                    $("#deliveryResult").html(data);
					                                    $("#deliveryResult").css("display","none");
					                                    $("#delivery").trigger("click");
					                                 }//function
					                              });//ajax
					                     });//click
					   ////////////운송장 입력////////////////
					   $(document)
					         .on(
					               "click",
					               "#deliveryInsert",
					               function() {
					                  var target = document.getElementById("deilverySelect2");
					                  //alert(productNo+productName);
					                  if (target.options[target.selectedIndex].value == "searchCategory") {
					                     alert("카테고리를 선택하세요.");
					                     document.getElementById("deilverySelect2").focus();
					                     return false;
					                  }
					                  if ($("#deliveryNo2").val().trim() == "") {
					                     alert("운송장 번호를 입력하세요");
					                     document.getElementById("deliveryNo2").focus();
					                     return false;
					                  }
					                  $
					                        .ajax({
					                           type : "POST",
					                           url : "${pageContext.request.contextPath}/insertDelivery",
					                           data : "${_csrf.parameterName}=${_csrf.token}&&deliveryCompany="
					                                 + target.options[target.selectedIndex].value
					                                 + "&&deliveryNo="
					                                 + $("#deliveryNo2").val()
					                                 + "&&productNo="
					                                 + pnoSell
					                                 + "&&productName="
					                                 + productName
					                                 + "&&id=${vo.id}",
					                           dataType : "text",
					                           success : function(result) {
					                              target.options[target.selectedIndex].value == "searchCategory";
					                              $("#deliveryNo2").val() == "";
					                              $("#insertDeliveryNo_wrap").css(
					                                    "display", "none");
					                           }//function
					                        });//ajax
					               });
					 ///배송 모달 닫기////
					   $(document).on("click", "#deliveryClose", function() {
					      $("#insertDeliveryNo_wrap").css("display", "none");
					   });

	function onlyNumcheck() {
		var objEv = event.srcElement;
		var num = "{}[]()<>?_|~`!@#$%^&*-+\"'\\.,/ "; //입력을 막을 특수문자 기재.
		event.returnValue = true;

		for (var i = 0; i < objEv.value.length; i++) {
			if (-1 != num.indexOf(objEv.value.charAt(i)))
				event.returnValue = false;
		}

		if (!event.returnValue) {
			alert("특수문자는 입력하실 수 없습니다.");
			objEv.value = "";
		}
	}

	$(document)
			.ready(
					function() {
						$("#updatePw_btn")
								.click(
										function() {
											$("#pwContent").css("display",
													"block");
											$("#slContent").css("display",
													"none");
											$("#blContent").css("display",
													"none");
											$("#amContent").css("display",
													"none");
											$("#peContent").css("display",
													"none");
											$("#qlContent").css("display",
													"none");
											$("#ilContent").css("display",
													"none");

											var data = "<div class='form_header'>";
											data += "<h3>새로운 비밀번호를 입력해주세요</h3>";
											data += "<div class='id_input'>";
											data += "<input type='password' name='pw' id='pw' class='input_text' placeholder='PASSWORD'>";
											data += "</div>";
											data += "<div class='email_input'>";
											data += "<input type='password' name='pw1' id='pw1' class='input_text' placeholder='PASSWORD 확인'>";
											data += "</div>";
											data += "</div>";
											data += "<div class='form_footer'>";
											data += "<input class='ValP input_btn' type='button' value='확인' id='updatePwSubmit' />";
											data += "<input type='button' value='다시 입력' id='updatePwReset' class='updatePwReset input_btn'/>";
											data += "</div>";
											data += "</div>";
											$("#updatePwContent").html(data);
										});
					});
	$(document).on("click", "#updatePwReset", function() {
		document.getElementById("pw").value = "";
		document.getElementById("pw1").value = "";
	});
	$(document).on(
			"click",
			"#updatePwSubmit",
			function() {
				if ($("#pw").val().trim() == "") {
					alert("패스워드를 입력하세요");
					document.getElementById("pw").focus();
					return false;
				}
				//비밀번호와 비밀번호 확인 일치여부 체크
				if ($("#pw").val() != $("#pw1").val()) {
					alert("비밀번호가 일치하지 않습니다");
					document.getElementById("pw1").focus();
					return false;
				}
				var id = "${vo.id}";
				var pw = $("#pw").val();
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/updatePwByUser",
					data : "${_csrf.parameterName}=${_csrf.token}&&id=" + id
							+ "&&pw=" + pw,
					dataType : "text",
					success : function(result) {
						alert("비밀번호 변경 성공");
						$("#pwContent").css("display", "none");
					}//function
				});//ajax
			});//click
</script>
</head>
<body>
	<div id="userMainDiv">
		<div id="userInfor">
			<p id="userSubText1">${vo.name}님<br>
			</p>
			<p id="userSubText2">
				구매등급은 <span>${vo.grade}</span> 입니다.<br>
			</p>
		</div>
		<div id="userSubDiv">

			<button id="grade_btn">
				<i class="fa fa-diamond" aria-hidden="true">구매등급 보기</i>
			</button>
			<button id="editUser_btn">
				<i class="fa fa-user-circle-o" aria-hidden="true">내 정보수정</i>
			</button>
			<button id="updatePw_btn">
				<i class="fa fa-address-book-o" aria-hidden="true">비밀번호 수정</i>
			</button>

		</div>
		<div id="menu">
			<!-- myPageMenuList  -->
			<table border="2">
				<tr>
					<td id="sellingList"><button id="sellingList">
							<i class="fa fa-gift" aria-hidden="true"></i>판매 내역
						</button></td>
					<td id="buyingList"><button id="buyingList">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i>구매 내역
						</button></td>
					<td id="questionList"><button id="questionList">
							<i class="fa fa-question" aria-hidden="true"></i>문의 내역
						</button></td>
					<td id="interestList"><button id="interestList">
							<i class="fa fa-heart-o" aria-hidden="true"></i>관심 상품
						</button></td>

				</tr>
			</table>

		</div>
	</div>
	<!-- myPageMenuList  -->


	<div class="myPage_content">

		<!-- myPageContent  -->
		<div>
			<!-- 비밀번호 수정 -->
			<div id="pwContent" class="menuDiv hi" style="display: none;">
				<div id="pwheader">
					<h4>
						<strong> 비밀번호 변경</strong>
					</h4>
					<div id="updatePwContent"></div>
				</div>
			</div>
			<!-- 판매내역  -->
			<div id="slContent" class="menuDiv hi" style="display: none;">
				<div id="sellheader">
					<h4>
						<strong> 승인대기 LIST</strong>
					</h4>
					<div id="sellWaitContent"></div>
					<h4>
						<strong> 판매내역 LIST</strong>
					</h4>
					<div id="sellContent"></div>
				</div>
			</div>


			<!-- 판매내역  -->

			<!-- 구매내역  -->
			<div id="blContent" class="menuDiv hi" style="display: none;">
				<div id="buyheader">
					<h4>
						<strong> 구매내역 LIST</strong>
					</h4>
					<div id="buyContent">
						<table border="1">
						</table>
					</div>
				</div>
			</div>
			<!-- 구매내역  -->

			<div id="amContent" class="menuDiv hi" style="display: none;">
				<table border="1">
				</table>
			</div>

			<div id="peContent" class="menuDiv hi" style="display: none;">
				<form id="profileEditForm" method="post" action="">
					<table border="1">
					</table>
				</form>
			</div>
			<div id="qlContent" class="menuDiv hi" style="display: none;">
				<h1>문의사항 LIST</h1>
				<table border="1">
				</table>
			</div>

			<div id="ilContent" class="menuDiv hi" style="display: none;">
				<div>
					<div id="interestListDiv">
						<i class="fa fa-heart-o" aria-hidden="true"></i>관심상품
					</div>
					<div id="todayListDiv">
						<i class="fa fa-eye" aria-hidden="true"></i>오늘 본 상품
					</div>
				</div>
				<hr>
				<div>
					<table border="1" id="ilProdTable">
					</table>
				</div>
			</div>

		</div>
		<!-- myPageContent  -->

		<!-- 구매내역 진행사항 상세보기 modal -->
		<div class="modal buyListDiv">
			<div>
				<button id="modalBuyExit" value="" style="margin: 5px;">X</button>
				<table border="1">
					<tr style="width: 100%; height: 70px; text-align: center;font-weight: bold;">
						<td>거래 진행 현황</td>
					<tr>
					<tr style="width: 100%; height: 200px; ">
						<td><div id='transationinfoDiv'>
								<table>
									<tr id='transationinfoTr'>
										<td id='tdDepositWait'>입금대기</td>
										<td><i class='fa fa-chevron-right' aria-hidden='true'></i></td>
										<td id='tdSuccessDeposit'>입금완료</td>
										<td><i class='fa fa-chevron-right' aria-hidden='true'></i></td>
										<td id='tdDelibering'>배송중</td>
										<td><i class='fa fa-chevron-right' aria-hidden='true'></i></td>
										<td id='tdSuccessbuy'>배송완료</td>
									</tr>
								</table>
							</div></td>
					</tr>
					<tr>
						<td>
							<div id="transactionInfoContentDiv"></div>
							<div id="transactionInfoHiddenDiv"></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 구매내역 진행사항 상세보기 modal end -->

		<!-- 구매내역 진행사항 상세보기 modal -->
		<div class="modal sellListDiv">
			<div>
				<button id="modalSellExit" value="">XXXXXXX</button>
				<table border="1">
					<tr>
						<td>거래 진행 현황</td>
					<tr>
					<tr>
						<td><div id='transationinfoSellDiv'>
								<table>
									<tr id='transationinfoSellTr'>
										<td id='tdDepositWaitSell'>입금대기</td>
										<td><i class='fa fa-chevron-right' aria-hidden='true'></i></td>
										<td id='tdSuccessDepositSell'>입금완료</td>
										<td><i class='fa fa-chevron-right' aria-hidden='true'></i></td>
										<td id='tdDeliberingSell'>배송중</td>
										<td><i class='fa fa-chevron-right' aria-hidden='true'></i></td>
										<td id='tdSuccessSell'>배송완료</td>
									</tr>
								</table>
							</div></td>
					</tr>
					<tr>
						<td>
							<div id="transactionInfoSellContentDiv"></div>
							<div id="transactionInfoSellHiddenDiv"></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 구매내역 진행사항 상세보기 modal end -->

		<!-- 문의사항 상세보기 modal start -->
		<div class="modal questionDiv">
			<div>
				<button id="modalQustionExit" value="X" style="margin: 5px;">Ⅹ</button>
				<table border="1" style="width: 90%;">
					<tr
						style="width: 100%; height: 70px; font-weight: bold; text-align: center;">
						<td colspan="4">나의 문의 내역</td>
					</tr>
					<tr
						style=" border: 1px solid rgba(0,0,0,0.1); height: 50px; width: 100%;">
						<td>문의 제목</td>
						<td colspan="3"><div id="questionTitleDiv"></div></td>
					</tr>
					<tr
						style=" border: 1px solid rgba(0,0,0,0.1) width: 100%; height: 50px;">
						<td>문의한 고객ID</td>
						<td><div id="questionIdDiv"></div></td>
						<td>문의 날짜</td>
						<td><div id=questionWriteDayDiv></div></td>
					</tr>
					<tr
						style=" border: 1px solid rgba(0,0,0,0.1) width: 100%; height: 50px;">
						<td>문의 내용</td>
						<td colspan="3"><div id="questionContentDiv"></div></td>
					</tr>
					<tr
						style=" border: 1px solid rgba(0,0,0,0.1) width: 100%; height: 50px;">
						<td>답변</td>
						<td colspan="3"><div id="answerContentDiv"></div></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 문의사항 상세보기 modal end -->

		<!-- 계좌 정보  modal start -->
		<div class="modal accountDiv">
			<div>
				<button id="modalaccountExit" value="X">Ⅹ</button>
				<div>
					등록된 계좌 정보가 없습니다.
					<p>계좌정보를 입력해주세요.
				</div>
			</div>
		</div>
		<!-- 계좌 정보 상세보기 modal end -->
		<div id="insertDeliveryNo_wrap">
			<div id="insertDeliveryNo">
				<form id="form2" name="form2" method="post">
					발신인 이름<input type="text" id="deliveryName" value="${vo.name}"
						readonly="readonly" /> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" /> <select
						name="deilverySelect2" id="deilverySelect2">
						<option value="searchCategory2" selected>---운송회사---</option>
						<option value="우체국택배">우체국택배</option>
						<option value="CJ대한통운택배">CJ대한통운택배</option>
						<option value="현대택배">현대택배</option>
						<option value="한진택배">한진택배</option>
						<option value="로젠택배">로젠택배</option>
						<option value="옐로우캡">옐로우캡</option>
						<option value="대신택배">대신택배</option>
						<option value="편의점택배">편의점택배</option>
						<option value="KGB택배">KGB택배</option>
						<option value="천일택배">천일택배</option>
						<option value="일양로지스">일양로지스</option>
						<option value="용마로지스">용마로지스</option>
						<option value="퀵퀵닷컴">퀵퀵닷컴</option>
					</select> 운송장 번호 입력<input type="text" id="deliveryNo2" /> <input
						type="button" id="deliveryInsert" value="입력"> <input
						type="button" id="deliveryClose" value="닫기">
				</form>
			</div>
		</div>
		<div id="deliveryResult"></div>
		<div id="gradeModal_wrap">
			<div id="gradeModal">
				<div class="gradeModal_content">

					<h3>등급</h3>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/grade/new.png">
						<span>10건 미만</span>
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/grade/gold.png">
						<span>10건 이상~15건 미만</span>
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/grade/family.png">
						<span>15건 이상~20건 미만</span>
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/grade/vip.png">
						<span>20건 이상~25건 미만</span>
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/grade/vvip.png">
						<span>25건 이상</span>
					</div>
					<input type="button" value="닫기" id="gradeCloseBtn">
				</div>


			</div>
		</div>
	</div>

</body>
</html>