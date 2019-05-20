<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/emailAuth/section.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script>
	function check() {
		var toat = ${toat};
		var form = document.authenform;
		var authNum = ${authNum};

		if (!form.authnum.value) {
			$(".email_pop_container_span>span").text("인증번호를 입력해주세요.");
			return false;
		}
		if (form.authnum.value != authNum) {
			$(".email_pop_container_span>span").text("인증번호가 일치하지 않습니다.");
			form.authnum.value = "";
			return false;
		}
		if (form.authnum.value == authNum) {
			alert("인증완료");
			if (toat == 'id') {
				opener.document.getElementById("emailCheck").value = "인증 완료";
				window.open('', '_self').close();
			} else if (toat == 'pw') {
				opener.document.getElementById("emailCheck1").value = "인증 완료";
				window.open('', '_self').close();
			}
		}

	}
	$(document).ready(function() {
		$("#input_authnum").keyup(function() {
			var form = document.authenform;
			var authNum = ${authNum};
			if (form.authnum.value == authNum) {
				$("#input_authnum").css({
					"color" : "rgba(0, 191, 0, 0.5)"
				});
				$("#input_Submit").css({
					"background" : "rgba(0, 191, 0, 0.5)"
				});
				$(".email_pop_container_input>div").css({
					"border" : " 3px solid rgba(0, 191, 0, 0.5)"
				});
			}
		});
	});
</script>
</head>
<body>
	<div class="email_pop_wrap">
		<img alt=""
			src="//t1.daumcdn.net/brunch/static/img/help/pc/bg_signin_01.jpg">
		<div class="img_wrap"></div>
		<div class="email_pop">
			<div class="email_pop_title">
				<h5>인증 하기</h5>
			</div>
			<div class="email_pop_container">
				<form method="post" name="authenform" onSubmit="return check();">
					<div class="email_pop_container_span">
						<i class="fa fa-exclamation" aria-hidden="true"></i><span>이메일로
							인증번호가 전송 되었습니다.</span>
					</div>
					<div class="email_pop_container_input">
						<div>
							<input type="text" name="authnum" id="input_authnum"><input
								type="submit" value="Ⅴ" id="input_Submit">
						</div>
					</div>
					<div class="email_pop_container_logo" style="height: 90px">
						<div>
							<img alt=""
								src="${pageContext.request.contextPath}/resources/img/tiles/logo_pop.png">
						</div>

					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>