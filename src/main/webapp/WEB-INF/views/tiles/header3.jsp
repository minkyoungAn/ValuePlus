<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VALUE+</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/tiles/header.css">
</head>
<body>
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

						});
	</script>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
	<sec:authorize access="hasRole('ROLE_MEMBER')" var="isUser" />
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
		<div class="search"
			style="width: 150px; margin-right: 10px; margin-top: 10px;">
			<button style="width: 100px;" id="product_submit_btn" class="ValP">상품
				등록하기</button>
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
							${vo.name}님 레알루다가 환영하자너.
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
							<input type="text" name="id" placeholder="ID"> <input
								type="password" name="pw" placeholder="PASSWORD"> <input
								type="submit" value="로그인" id="LoginSubmit"> <input
								type="button" value="JOIN" id="join">
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