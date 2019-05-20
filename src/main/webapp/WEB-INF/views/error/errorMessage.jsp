<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/error/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
	<div id='oopss'>
		<div id='error-text'>
			<span>ERROR</span>
			<p>${errorMessage}</p>
			<p class='hmpg'>
				<a href='${pageContext.request.contextPath}/' class="back">홈으로
					가기</a>
			</p>
		</div>
	</div>

</body>
</html>