<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VALUE+</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/tiles/header.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

</head>
<body>
	<sec:authentication property="principal" var="qw" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var url = location.pathname;
							if (url == '/controller/') {
								$("#home_a").css({
									"color" : "#01DFA5"
								});
							} else if (url == '/controller/list') {
								$("#list_a").css({
									"color" : "#01DFA5"
								});
							} else if (url == '/controller/productForm') {
								$("#insert_a").css({
									"color" : "#01DFA5"
								});
							} else if (url == '/controller/cs') {
								$("#cs_a").css({
									"color" : "#01DFA5"
								});
							} else if (url == '/controller/guideMain') {
								$("#guide_a").css({
									"color" : "#01DFA5"
								});
							} else if (url == '/controller/questionToAdmin') {
								$("#admin_a").css({
									"color" : "#01DFA5"
								});
							}
							$(window)
									.scroll(
											function() {
												var height = $(document)
														.scrollTop();
												if (height > 200) {
													$("header")
															.css(
																	{
																		"background-color" : "rgba(255,255,255,0.9)"
																	})
												}
											});
							var deg = 360;
							$(".search>.fa-angle-up").click(function() {

								$(".search>form").slideToggle();
								if (deg == 360) {
									$(this).css({
										"transform" : "rotate(" + deg + "deg)"
									});

									deg = 180;
								} else if (deg == 180) {
									$(this).css({
										"transform" : "rotate(" + deg + "deg)"
									});
									deg = 360;
								}

							});

							$(".menu_btn>img")
									.click(
											function() {
												var left = $(".side-header")
														.position().left;
												if (left == -260) {
													$(".side-header").addClass(
															"view");
													$(".side-header")
															.children()
															.addClass("view");
													$(".side-header")
															.children()
															.children()
															.addClass("view");
													$(".side-header")
															.children()
															.children()
															.children()
															.addClass("view");
													$(".side-header")
															.children()
															.children()
															.children()
															.children()
															.addClass("view");
													$(".side-header")
															.children()
															.children()
															.children()
															.children()
															.children()
															.addClass("view");
													$(".side-header").css({
														"left" : "0"
													});
												}
											});
							$(document).click(
									function(e) {
										if (!$(e.target).is('.view')) {
											var left = $(".side-header")
													.position().left;
											if (left == 0) {
												$(".side-header").css({
													"left" : "-260px"
												});
											}
										}
									});
							$(window).scroll(function() {
								var height = $(document).scrollTop();
								if (height > 500) {
									$("#upIcon").css({
										"visibility" : "visible"
									});
								} else if (height < 500) {
									$("#upIcon").css({
										"visibility" : "hidden"
									});
								}
							});
							$("#join")
									.click(
											function() {
												location.href = "${pageContext.request.contextPath}/joinCustomer";
											});
							$("#adminPageJoin")
									.click(
											function() {
												location.href = "${pageContext.request.contextPath}/admin/admin";
											});
							$("#myPageJoin")
									.click(
											function() {
												location.href = "${pageContext.request.contextPath}/mypage";
											});
							$(".loginFormBtn").click(function() {
								var loginId = $("#loginId").val();
								var loginPw = $("#loginPw").val();
								if (loginId.trim() == "") {
									alert("아이디를 입력하세요");
									document.getElementById("loginId").focus();
									return false;
								} else if (loginPw.trim() == "") {
									alert("비밀번호를 입력하세요");
									document.getElementById("loginPw").focus();
									return false;
								} else {
									$(".loginFormBtn").attr("type", "submit");
								}

							});
						});

		// chatting 추가 12/16,17 안희건---------------------------------------
		// 쓰레드 중지가 필요함
		var toID;
		var fromID;
		var lastID = 0;
		var content = "";

		function startChat() {
			if (fromID == null) {
				alert('채팅을 사용하기 위해선 먼저 로그인하세요!');
			}
			// 버튼 추가
			// chatController에서 request에 list 형태로 전달함
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/chat",
						dataType : "json",
						data : "${_csrf.parameterName}=${_csrf.token}&userID="
								+ fromID,
						success : function(s) {
							var size = s.length
							for (i = 0; i < size; i++) {
								$("#testDiv")
										.append(
												"<input class='chatbtn' type='button' id='btn-"+s[i]+"' value='"+s[i]+"'> ")
							}
						},
						error : function(request, status, error) {
							console.log("code:" + request.status + "\n"
									+ "message:" + request.responseText + "\n"
									+ "error:" + error);
						}
					})
			chatListFunction("list");
		}

		$(function() {
			$("#test").on("click", function() {
				var state = $("#testDiv").css("display");
				chatOpenClose(state)

			})
			function chatOpenClose(state) {

				if (fromID != null) {
					if (state == 'none') {
						$("#testDiv").show();
						startChat();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/getUnread",
									dataType : "text",
									data : "toID="
											+ encodeURIComponent(fromID)
											+ "&${_csrf.parameterName}=${_csrf.token}",
									success : function(data) {
										//alert(data)
										if (data != 0) {
											alert("읽지 않은 메세지 총 수-> " + data);
											return;
										}

									},//suc ��
									error : function(request, status, error) {
										console.log("code:" + request.status
												+ "\n" + "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								});// ajax ��
					} else {
						$(".msg").remove();
						$(".chatbtn").remove();
						$("#chattext").val("");
						$("#title").text("closed");
						$("#testDiv").hide();
					}
				}
			}

			// 나도 모름
			function autoCloseAlert(selector, delay) {
				var alert = $(selector).alert();
				alert.show();
				window.setTimeout(function() {
					alert.hide()
				}, delay);
			}

		})// 쿼리끝

		// 채팅방에 채팅을 보여줌

		// 대화 목록 불러오기
		function chatListFunction(type) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/chatList",
				dataType : "json",
				data : "fromID=" + encodeURIComponent(fromID) + "&toID="
						+ encodeURIComponent(toID) + "&listType=" + lastID
						+ "&${_csrf.parameterName}=${_csrf.token}",
				success : function(data) {
					if (data == null) {
						return;
					}
					$.each(data, function(index, item) {

						if (lastID == 0 || lastID < item.chatID) {
							lastID = item.chatID
							addChat(item.fromID, item.chatContent,
									item.chatTime);
							lastID = item.chatID;
						}
					});// 반복문 끝
				},//suc 끝
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});// ajax 끝

		} // 대화목록 끝
		// 채팅 전송
		function submitFunction() {
			var chatContent = $("#chattext").val();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/chatInsert",
				dataType : "json",
				data : "fromID=" + encodeURIComponent(fromID) + "&toID="
						+ encodeURIComponent(toID) + "&chatContent="
						+ encodeURIComponent(chatContent)
						+ "&${_csrf.parameterName}=${_csrf.token}",
				success : function(result) {
					if (result == 1) {
						autoCloseAlert('#successMsg', 2000);
					} else if (result == 0) {
						autoCloseAlert('#dangerMsg', 2000);
					} else {
						autoCloseAlert('#warningMsg', 2000);
					}
				} // succ end
			}); // ajax end   
		} // 채팅 전송 끝

		function getInfiniteChat() {
			setInterval(function() {
				chatListFunction(lastID);
			}, 1000);
		}

		$(document).on("click", ".chatbtn", function() {
			$("#testDiv_Chat").css({
				"display" : "block"
			});

			lastID = 0;
			toID = $(this).val();
			$("#toId_title").text(toID);
			$(".msg").remove();
			content = "";
			$("#title").text($(this).val() + "과의 대화");
			$("#chatlist").empty();

			chatListFunction('aa');
			alert("본인 : " + fromID + " 상대 : " + toID + "\n대화를 시작합니다.")
		})

		// 채팅창
		$(document).on("keyup", "#chattext", function(e) {
			if (e.keyCode == 13) { // 엔터시
				submitFunction();
				$(this).val("");
			}
		})
		$(document).on("click", "#delete", function() {
			$("#testDiv_Chat").css({
				"display" : "none"
			});
			toID = "";
			$(".msg").remove();
		})
		getInfiniteChat();
		//alert(37)
	</script>
	<style type="text/css">
#testDiv {
	background-color: white;
	z-index: 10;
	width: 150px;
	height: 230px;
	overflow: hidden;
	position: fixed;
	bottom: 50px;
	right: 80px;
	display: none;
	border: 2px solid #292c2f;
	text-align: center;
}

#testDiv>.chatbtn {
	width: 85%;
	height: 30px;
	margin-top: 8px;
	background-color: white;
	color: #292c2f;
	border: 1px solid gray;
	border-radius: 20px;
	transition: 0.2s;
	outline: none;
}

#testDiv>.chatbtn:hover {
	border: 2px solid #292c2f;
	color: #292c2f;
	font-weight: bold;
}

.testDiv_title {
	text-align: center;
	color: white;
	width: 100%;
	height: 20px;
	background-color: #292c2f;
	width: 100%;
}

#testDiv_Chat {
	display: none;
	background-color: white;
	z-index: 10;
	overflow: hidden;
	position: fixed;
	bottom: 50px;
	right: 250px;
	border: 2px solid #292c2f;
	width: 290px;
	height: 300px;
	text-align: center;
	background-color: white;
}

.testDiv_Chat_title {
	width: 100%;
	height: 15px;
	float: left;
	background-color: #292c2f;
}

#toId_title {
	width: 90%;
	height: 15px;
	float: left;
	padding-left: 20px;
	box-sizing: border-box;
	color: white;
	line-height: 15px;
	text-align: left;
}

#delete {
	width: 10%;
	height: 15px;
	text-align: center;
	line-height: 15px;
	color: white;
	float: left;
	background: no-repeat;
}

#chatlist {
	width: 100%;
	height: 250px;
	float: left;
	overflow: auto;
	margin: 0;
	background-color: rgba(230, 230, 230, 1);
}

.msg_from {
	padding-right: 5px;
	box-sizing: border-box;
	text-align: right;
	height: 30px;
	width: 100%;
	line-height: 20px;
	font-weight: bold;
}

.msg_from span {
	background: #819FF7;
	padding: 5px;
	border-radius: 5px;
}

.msg_to {
	padding-left: 5px;
	box-sizing: border-box;
	text-align: left;
	width: 100%;
	height: 30px;
	line-height: 20px;
	font-weight: bold;
}

.msg_to span {
	background: #9FF781;
	padding: 5px;
	border-radius: 5px;
	margin-left: 5px;
}

#testDiv_Chat>#chattext {
	width: 100%;
	height: 35px;
	float: left;
	font-size: 20px;
	padding-left: 10px;
	box-sizing: border-box;
	outline: none;
}

.num_icon {
	position: fixed;
	z-index: 3;
	position: fixed;
	bottom: 70px;
	right: 5px;
	width: 20px;
	height: 20px;
}
</style>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
	<sec:authorize access="hasRole('ROLE_MEMBER')" var="isUser" />
	<div id='testDiv_Chat'>
		<div class="testDiv_Chat_title">
			<span id="toId_title">name</span>
			<button id="delete">Ⅹ</button>
		</div>
		<pre id="chatlist">
      <c:choose>
         <c:when test="${isUser}">
            <script type="text/javascript">
													function addChat(chatName,
															chatContent,
															chatTime) {
														$(".msg").remove();
														var id = '${qw.id}';
														if (id == chatName) {
															content += '<div class="msg_from"><span>'
																	+ chatContent
																	+ '</span></div>';
															$("#chatlist")
																	.html(
																			content);
														} else if (id != chatName) {
															content += '<div class="msg_to">'
																	+ chatName
																	+ '<span>'
																	+ chatContent
																	+ '</span></div>';
															$("#chatlist")
																	.html(
																			content);
														}
														// 스크롤 최하단
														$("#chatlist")
																.scrollTop(
																		$("#chatlist")[0].scrollHeight)
													}
												</script>
         </c:when>
      </c:choose>
      
      </pre>
		<input type='text' id='chattext' />
	</div>

	<div id='testDiv'>
		<div class="testDiv_title">대화목록</div>
	</div>
	<a id="upIcon"
		style="display: scroll; z-index: 3; position: fixed; bottom: 100px; right: 20px;"
		href="#" title="맨위로"><img
		src="${pageContext.request.contextPath}/resources/img/tiles/upIcon.png"></a>
	<div id="test">
		<!-- 채팅을 하기 위한 아이디 체크 -->
		<c:choose>
			<c:when test="${isUser}">
				<script>
					fromID = '${qw.id}';
				</script>
			</c:when>
		</c:choose>
		<a id="chIcon"
			style="z-index: 3; position: fixed; bottom: 50px; right: 20px;"
			href="#" title="채팅"><img
			src="${pageContext.request.contextPath}/resources/img/tiles/chIcon.png"></a>
	</div>

	<div class="chetIcon"></div>
	<div class="hidden_header"></div>
	<header>
		<div class="menu_btn">
			<img
				src="${pageContext.request.contextPath}/resources/img/tiles/menuBtn.png">
		</div>
		<div class="logo">
			<a href="${pageContext.request.contextPath}/"><img
				src="${pageContext.request.contextPath}/resources/img/tiles/logo.png"></a>
		</div>
		<div class="search">
			<form action="selectMain">
				<div class="search_wrap">
					<i class="fa fa-search" aria-hidden="true"></i> <input type="text"
						name="keyword" placeholder="search">
				</div>
			</form>
			<i class="fa fa-angle-up" aria-hidden="true"></i><span>SEARCH</span>
		</div>
	</header>
	<div class="side-header">
		<div class="user_form">
			<div class="user_form_logo">
				<img
					src="${pageContext.request.contextPath}/resources/img/tiles/logo.png">
			</div>
			<div class="ment"
				style="font-family: times new roman, times, serif; font-style: italic; font-size: 12px; color: #6E6E6E;">
				We will sell value <br>to you.<br> <span
					style="color: #A4A4A4; font-size: 10px;">-Go.Gu.ryeo-</span>
			</div>
			<c:choose>
				<c:when test="${!isAdmin&&isUser}">
					<div class="sucLogin">
						<p>
							<sec:authentication property="principal" var="vo" />
							${vo.id}님 환영합니다.
						<p>
						<form class="header_button_margin"
							action="${pageContext.request.contextPath}/j_spring_security_logout"
							method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" id="LoginSubmit"
								value="로그아웃"> <input type="button" value="마이페이지"
								id="myPageJoin">
						</form>
					</div>
				</c:when>
				<c:when test="${isAdmin}">
					<div class="sucLogin">
						<p>
							<sec:authentication property="principal" var="vo" />
							${vo.name}로 접속하셨습니다.
						<p>
						<form class="header_button_margin"
							action="${pageContext.request.contextPath}/j_spring_security_logout"
							method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" id="LoginSubmit"
								value="로그아웃"> <input type="button" value="관리자페이지"
								id="adminPageJoin">
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<form
						action="${pageContext.request.contextPath}/j_spring_security_check"
						method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<div class="login_form">
							<input type="text" name="id" placeholder="ID"> <br>
							<input type="password" name="pw" placeholder="PASSWORD">
							<br> <input type="submit" value="로그인" id="LoginSubmit">
							<input type="button" value="JOIN" id="join">
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/" id="home_a">VALUE+
						홈</a></li>
				<li><a
					href="${pageContext.request.contextPath}/list?categoryName=All"
					id="list_a">경매</a></li>
				<li><a href="${pageContext.request.contextPath}/productForm"
					id="insert_a">물품등록</a></li>
				<li><a href="${pageContext.request.contextPath}/cs" id="cs_a">고객센터</a></li>
				<li><a href="${pageContext.request.contextPath}/guideMain"
					id="guide_a">경매가이드</a></li>
				<li><a
					href="${pageContext.request.contextPath}/questionToAdmin"
					id="admin_a">관리자 문의</a>
			</ul>
			<c:choose>
				<c:when test="${!isAdmin&&isUser}">
					<div class="find_id">
						<a href="#">이용가이드</a>
					</div>
				</c:when>
				<c:when test="${isAdmin}">
					<div class="find_id">
						<a href="#">이용가이드</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="find_id">
						<a href="${pageContext.request.contextPath}/findMain">계정을
							잃어버리셨나요?</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>