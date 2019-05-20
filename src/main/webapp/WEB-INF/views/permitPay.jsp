<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오페이 - 승인</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" media="screen"
	href="/assets/bootstrap/css/bootstrap.min.css" />
<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<style>
#btn-wrap {
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

#btn-wrap:hover {
	background: #fff;
	color: #1AAB8A;
}

#btn-wrap:before .#btn-wrap:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#btn-wrap:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.content h3 {
	width: 100%;
	height: 50px;
	text-align: center;
}

.content {
	margin-top: 100px;
	text-align: center;
}

.footer {
	width: 100%;
	float: left;
	height: 50px;
	text-align: center;
}

#btn-wrap:hover:before, #btn-wrap:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>
<div id="payment">
	<div class="header">
		<strong> </strong>
	</div>
	<div class="body">
		<div class="content">
			<h3>카카오페이 결제가 정상적으로 완료되었습니다.</h3>
			<p>결제일시: 2017-12-13T19:07:25</p>
			<p>상품명: ${productNo}</p>
			<p>결제금액: ${price}</p>
		</div>
	</div>
	<div class="footer">
		<input type="button" id="btn-wrap" value="닫기" onclick="window.close()">
	</div>
</div>
<script type='text/javascript'>
	
</script>
</head>
</html>