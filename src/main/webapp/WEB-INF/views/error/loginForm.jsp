<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/costomer/errorLogin.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() {
	$("#LoginSubmit").click(function() {
	var loginId = $("#loginId").val();
	var loginPw = $("#loginPw").val();
	if ($("#loginForm :input[name=id]").val().trim() == "") {
		alert("아이디를 입력하세요");
		document.getElementById("loginId").focus();
		return false;
	}else if ($("#loginForm :input[name=pw]").val().trim() == "") {
		alert("비밀번호를 입력하세요");
		document.getElementById("loginPw").focus();
		return false;
	}else{
		$("#LoginSubmit").attr("type","submit");
	}
	});
});
</script>
<body>
	<c:if test="${not empty requestScope.errorMessage}">
		<span style="color: red">${requestScope.errorMessage}</span>
	</c:if>
	<img id="backImg"
		src="//t1.daumcdn.net/brunch/static/img/help/pc/bg_signin_02.jpg">
	<div class="backImg_wrap"></div>
	<div class="user_form">

		<div class="user_form_logo">
			<img
				src="${pageContext.request.contextPath}/resources/img/tiles/logo.png">
			<a href="${pageContext.request.contextPath}/"><i
				class="fa fa-home" aria-hidden="true"></i></a>
		</div>
		<form
			action="${pageContext.request.contextPath}/j_spring_security_check"
			method="post" id="loginForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<div class="login_form">
				<div class="login_form_id">
					<i class="fa fa-key" aria-hidden="true"></i> <input type="text"
						name="id" placeholder="ID">
				</div>
				<div class="login_form_pw">
					<i class="fa fa-user" aria-hidden="true"></i> <input
						type="password" name="pw" placeholder="PASSWORD">
				</div>


				<div class="login_form_btn">
					<input type="button" value="로그인" id="LoginSubmit">
				</div>

			</div>
		</form>
		<div class="user_form_footer">
			<div class="user_form_footer_wrap">
				<div class="find_id">
					<div class="find_txt">
						<a href="${pageContext.request.contextPath}/findMain">계정을
							잃어버리셨나요?</a>
					</div>
					<div class="find_btn">
						<a href="${pageContext.request.contextPath}/joinCustomer"><button>join</button></a>
					</div>
					<div class="find_text">
						<c:if test="${errorMessage != null}">
							<p class="footer-company-name"
								style="font-size: 12px; color: red;">${errorMessage}.....</p>
						</c:if>
						<c:if test="${errorMessage == null}">
							<p class="footer-company-name">Value Plus &copy; 2017</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
