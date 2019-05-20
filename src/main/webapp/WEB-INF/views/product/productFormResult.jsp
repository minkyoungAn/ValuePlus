<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Value+</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	};
	$(document).ready(function() {
		$("#resultConfirm").click(function() {
			location.href = "${pageContext.request.contextPath}/";
		});
	});
</script>
</head>
<style>
.insert_center_wrap {
	width: 100%;
	float: left;
	height: 500px;
	position: relative;
}

.insert_center {
	width: 70%;
	height: 100%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.insert_center h4 {
	width: 100%;
	height: 50px;
	text-align: center;
	line-height: 50px;
}
</style>
<body>
	<div class="insert_center_wrap">
		<div class="insert_center" align="center">
			<h4>경매 상품 등록 확인</h4>

			<table id="result-product-table" style="border: 1px black solid">

				<tr>
					<td>상품 이름</td>
					<td>${dto.productName}</td>
				</tr>
				<tr>
					<td>경매 시작가</td>
					<td><fmt:formatNumber value="${dto.startPrice}"
							pattern="#,###,###" /> 원</td>
				</tr>
				<tr>
					<td>입찰 단위</td>
					<td><fmt:formatNumber value="${dto.bidUnit}"
							pattern="#,###,###" /> 원</td>
				</tr>

				<tr>
					<td>경매 기간</td>
					<td>${dto.auctionDuring}일</td>
				</tr>

				<tr colsapn="2">
					<th>관리자의 24시간 이내로 승인완료 후 경매가 시작됩니다.</th>
				</tr>
			</table>

			<input type="button" id="resultConfirm" value="확인" />

		</div>
	</div>

</body>
</html>