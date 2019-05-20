<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/costomer/find.css">
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {

		var val2 = "${findState}";

		$("#findId").click(function() {
			$(".find_form_password").css({
				"height" : "0%"
			})
			$(".find_form_id").css({
				"height" : "100%"
			})

		});
		$("#findIdBtn").click(function() {
			var nameVal = $("#name").val();
			if (nameVal.trim() == "") {
				alert("이름을 입력하세요");
				document.getElementById("name").focus();
				return false;
			}else if ($("#emailCheck").val() != "인증 완료") {
				alert("이메일 인증을 하세요");
				document.getElementById("email").focus();
				return false;
			}else{
				$("#findIdBtn").attr("type","submit");
			}
			
		});
		
		$("#findPw").click(function() {
			$(".find_form_id").css({
				"height" : "0%"
			})
			$(".find_form_password").css({
				"height" : "100%"
			})
		});
		if (val2 == 'sucId') {
			$("#findId").trigger("click");
		} else if (val2 == 'sucPw') {
			$("#findPw").trigger("click");
		}
		
		$("#findPwBtn").click(function() {
			if ($("#form1 :input[name=id]").val().trim() == "") {
				alert("아이디를 입력하세요");
				document.getElementById("id").focus();
				return false;
			}else if ($("#emailCheck1").val() != "인증 완료") {
				alert("이메일 인증을 하세요");
				document.getElementById("email1").focus();
				return false;
			}else{
			$("#findPwBtn").attr("type","submit");
			}
		});
		$(".find_btn>input").click(function() {
			$(".find_btn>input").css({
				"font-weight" : "",
				"font-size" : ""
			})
			$(this).css({
				"font-weight" : "bold",
				"font-size" : "15px"
			})
		});
	});
	function emailPopup() {
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(email) == false) {
			alert("이메일 형식이 올바르지 않습니다.");

		} else if (email == null || email == "") {
			alert("이메일을 입력해주세요.");
		} else {
			var popup = window.open("/controller/emailAuth?email="
					+ $("#email").val() + "&toat='id'", "pop2",
					"width=645,height=306,top= 200 ,left=350");
		}
	}
	function emailPopup1() {
		var email1 = document.getElementById("email1").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(email1) == false) {
			alert("이메일 형식이 올바르지 않습니다.");

		} else if (email1 == null || email1 == "") {
			alert("이메일을 입력해주세요.");
		} else {
			var popup = window.open("/controller/emailAuth?email="
					+ $("#email1").val() + "&toat='pw'", "pop2",
					"width=645,height=306,top= 200 ,left=350");
		}
	}
	function joinCustomer() {
		location.href = "${pageContext.request.contextPath}/joinCustomer";
	}
	$(document)
			.ready(
					function() {
						if (document.getElementById("findId").value == "") {
							document.getElementById("findId").value = "없습니다";
							$("#findIdDiv")
									.html(
											"<input type='button' value='회원가입 하러가기' id='join' onClick='joinCustomer();'/>");
						}
					});
	function mainIndex() {
		location.href = "${pageContext.request.contextPath}/";
	}
	$(document).ready(function() {
		if (document.getElementById("divId").value == "") {
			document.getElementById("divId").value = "해당 아이디가 없습니다";
			$("#pwUpdateForm").remove();
		}
		$("#pwUpdateForm").submit(function() {
			if ($("#pwUpdateForm :input[name=pw]").val().trim() == "") {
				alert("패스워드를 입력하세요");
				document.getElementById("pw").focus();
				return false;
			}
			//비밀번호와 비밀번호 확인 일치여부 체크
			if (document.form.pw.value != document.form.pw1.value) {
				alert("비밀번호가 일치하지 않습니다");
				document.form.pw1.value = "";
				document.form.pw1.focus();
				return false;
			}
		});

	});
</script>

<body>
	<div class="find_main_wrap">
		<div class="find_main">
			<h1>계정 찾기</h1>
			<div class="find_sub">
				<span> 가입하신 계정을 잊어버리셨나요?<br> VALUE PLUS에서 인증 받은 이메일 주소를
					입력해 주세요.
				</span>
			</div>
			<div class="find_btn_wrap">
				<div class="find_btn">
					<input type="button" value="아이디 찾기" id="findId"> <input
						type="button" value="비밀번호 찾기" id="findPw">
				</div>

			</div>
			<div class="find_form">
				<c:choose>
					<c:when test="${findState == 'sucId'}">
						<div class="find_form_id">
							<div class="find_header">
								<h3>아이디 찾기 결과</h3>
							</div>
							<div class="findIdDiv">
								<input type="text" style="border: 0px; text-align: center;"
									id="endId" readonly="readonly" value="${id}" />
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="find_form_id">
							<form name="form" id="form"
								action="${pageContext.request.contextPath}/findIdByEmail"
								method="post" class="form">
								<div class="form_header">
									<div class="id_input">
										<input type="text" name="name" class="input_text" id="name"
											placeholder="NAME">
									</div>
									<div class="email_input">
										<input type="email" name="email" class="input_text" id="email"
											placeholder="EMAIL"><input type="button"
											value="이메일 인증" class="ValP eChk" onClick="emailPopup();">
									</div>
									<div class="emailCheck_input">
										<input type="text" id="emailCheck" style="border: 0px;"
											readonly="readonly" />
									</div>
								</div>
								<div class="form_footer">
									<input class="ValP" type="button" value="find" id="findIdBtn"><input
										class="ValP" type="reset" value="다시입력">
								</div>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${findState == 'sucPw'}">

						<div class="find_form_password">

							<form id="pwUpdateForm" class="form"
								action="${pageContext.request.contextPath}/updatePw">
								<div class="form_header">
									<h3>새로운 비밀번호를 입력해주세요</h3>
									<div class="id_input">
										<input type="password" name="pw" id="pw" class="input_text"
											placeholder="PASSWORD">
									</div>
									<div class="email_input">
										<input type="password" name="pw1" id="pw1" class="input_text"
											placeholder="PASSWORD 확인">
									</div>
								</div>
								<div class="form_footer">
									<input class="ValP" type="submit" value="확인" id="submit" /><input
										type="reset" value="다시 입력" id="reset" class="ValP" />
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</div>
					</c:when>
					<c:otherwise>
						<div class="find_form_password">
							<form name="form" id="form1"
								action="${pageContext.request.contextPath}/findPwByEmail"
								method="post" class="form">
								<div class="form_header">
									<div class="id_input">
										<input type="text" name="id" class="input_text" id="id"
											placeholder="ID">
									</div>
									<div class="email_input">
										<input type="email" name="email" class="input_text"
											id="email1" placeholder="EMAIL"> <input type="button"
											value="이메일 인증" class="ValP eChk" id="emailPopBtn" onClick="emailPopup1();">
									</div>
									<div class="emailCheck_input">
										<input type="text" id="emailCheck1" style="border: 0px;"
											readonly="readonly" />
									</div>

								</div>
								<div class="form_footer">
									<input class="ValP" type="submit" value="find" id="findPwBtn"><input
										type="reset" class="ValP" value="다시입력">
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>



	</div>

</body>
</html>