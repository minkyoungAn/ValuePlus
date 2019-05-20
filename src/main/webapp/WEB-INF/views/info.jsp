<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>카카오페이</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<sec:authentication property="principal" var="vo" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_submit").click(function() {
			if ($("#userPost :input[name=phone]").val().trim() == "") {
				alert("핸드폰 번호를 입력하세요");
				document.getElementById("phone").focus();
				return false;
			} else if ($("#userPost :input[name=email]").val().trim() == "") {
				alert("이메일을 입력하세요");
				document.getElementById("email").focus();
				return false;
			} else {
				$("#btn_submit").attr("type", "submit")
			}
		});
	});
	function focus(num) {
		num = num.replace(/[^0-9]/g, '');
		$("#phone").val(num);
	}
	function blur(num) {
		num = num.replace(/[^0-9]/g, '');
		var tmp = '';
		tmp += num.substr(0, 3);
		tmp += '-';
		tmp += num.substr(3, 4);
		tmp += '-';
		tmp += num.substr(7);
		$("#phone").val(tmp);
	}
	$(document).ready(function() {
		$("#phone").blur(function() {
			var num = $("#phone").val();
			blur(num);
		});

		$("#phone").click(function() {
			var num = $("#phone").val();
			focus(num);
		});
	});
</script>
</head>
<style>
#productNo {
	border: 0;
}

#price {
	border: 0;;
}

#userName {
	border: 0;
}

#userId {
	border: 0;
}

#btn_submit {
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

#btn_submit:hover {
	background: #fff;
	color: #1AAB8A;
}

#btn_submit:before, #btn_submit:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#btn_submit:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#btn_submit:hover:before, #btn_submit:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.btn_reset {
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

.btn_reset:hover {
	background: #fff;
	color: #1AAB8A;
}

.btn_reset:before.btn_reset:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.btn_reset:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btn_reset:hover:before, btn_reset:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

#btn_close {
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

#btn_close:hover {
	background: #fff;
	color: #1AAB8A;
}

#btn_close:before .#btn_close:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#btn_close:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#btn_close:hover:before, #btn_close:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.layer_head {
	width: 100%;
	height: 40px;
	text-align: center;
}

.logo_kakaopay {
	font-size: 20px;
}

.layer_body {
	width: 100%;
	text-align: center;
	height: 350px;
}

.area_btn {
	width: 100%;
	height: 50px;
	margin-top: 50px;
	text-align: center;
}

.layer_foot {
	width: 100%;
	height: 50px;
	margin-top: 10px;
	text-align: center;
	box-sizing: border-box;
}

.txt_step {
	font-size: 14px;
	color: gray;
	margin: 0;
}

#userPost .input_div {
	height: 30px;
	width: 100%;
	float: left;
}

#userPost .input_div>span {
	width: 30%;
	height: 100%;
	float: left;
}

#userPost .input_div>.input_text1 {
	text-align: center;
	height: 100%;
	float: left;
	width: 70%;
}

.info_data {
	width: 50%;
	height: 70px;
	float: left;
}

.info_data>.tit_data {
	width: 100%;
	height: 20px;
	float: left;
}
</style>
<body>
	<div class="kakaopay_layer">
		<div class="inner_kakaopay">
			<div class="layer_head">
				<strong class="img_pay logo_kakaopay">pay</strong>
			</div>
			<div class="layer_body">
				<p class="txt_step">
					결제요청 메시지 전송을 위해<br> 고갱이엔 가입된 휴대폰 번호와 생년월일 6자리를 입력해주세요.
				</p>
				<form id="userPost" name="userPost" method="post" action="${pageContext.request.contextPath}/permitPay?name="+$("#userName").val()+"&&phone="+$("#phone").val()+"&&email="+$("#email").val()+"&&productNo="+$("#productNo").val()+"&&price="+$("#price").val()+"&&id="+$("userId").val()+"&&buyId=${vo.id}&&sellId="+$("sellId").val()>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" id="buyId"
						name="buyId" value="${param.buyId}" readonly="readonly" /> <input
						type="hidden" id="sellId" name="sellId" value="${param.sellId}"
						readonly="readonly" />
					<div class="input_div">
						<span>상품 번호 :</span><input type="text" id="productNo"
							class="input_text1" name="productNo" value="${param.productNo}"
							readonly="readonly" />
					</div>
					<div class="input_div">
						<span>가격 : </span><input type="text" id="price"
							class="input_text1" name="price" value="${param.price}"
							readonly="readonly" />
					</div>
					<div class="input_div">
						<span>이름 : </span><input type="text" id="userName"
							class="input_text1" name="userName" value="${vo.name}"
							readonly="readonly" />
					</div>
					<div class="input_div">
						<span>아이디 : </span><input type="text" id="userId"
							class="input_text1" name="userId" value="${vo.id}"
							readonly="readonly" />
					</div>
					<div class="info_data">
						<span class="tit_data" id="thPhone_data"> 휴대폰 번호 <input
							type="text" name="phone" id="phone" maxlength="11"
							onkeyup="onlyNumber()"><br>
						<br>
						</span> <span class="line_tf"><span class="inner_line"></span></span>
					</div>
					<div class="info_data" id="thBirthday_data">
						<span class="tit_data"> 이메일<br><input type="email" name="email"
							id="email"><br>
						</span> <span class="line_tf"><span class="inner_line"></span></span>
					</div>
					<div class="area_btn">
						<input type="button" id="btn_submit" value="결제요청"> <input
							type="reset" class="btn_reset" value="다시 작성">
					</div>
				</form>
			</div>
			<div class="layer_foot">
				<input type="button" id="btn_close" value="닫기"
					onclick="window.close()">
			</div>
		</div>
	</div>
</body>
</html>
