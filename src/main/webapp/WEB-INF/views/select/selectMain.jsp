<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="application" />

<title>value+</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="${path}/resources/css/select/SelectMain.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script>
	$(function() {
		$("#tabs").tabs();

		$("#categoryName").click(function() {
			$(this).parent().submit();
		});
		$("#divisionName").click(function() {
			$(this).parent().submit();
		});
		$(".thumbnail").click(function() {
			$(this).parent().children().submit();
		});

	});
</script>
</head>
<body>
	<div class="select_search_title">&quot;${keyword}&quot; 검색결과</div>
	<div class="selectMain">
		
		<div id="tabs-1">
		<span>카테고리</span>
			<div id="category">
				<c:if test="${message!=null}">
						${message}
					</c:if>
				<c:if test="${disivionMsg!=null}">
						${disivionMsg}
					</c:if>
				<c:if test="${fn:length(bigCategory) > 0}">
					<p>대분류</p>
					<c:forEach items="${bigCategory}" var="category" varStatus="status">
						<form method="post" id="item_form" action="list">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" class="button"
								name="categoryName" value="${category.categoryName}" />
						</form>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(division) > 0}">
					<p>중분류</p>
					<c:forEach items="${division}" var="category" varStatus="status">
						<form method="post" id="item_form" action="selectByDivision">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" class="button"
								name="divisionName" value="${category.categoryName}" />
						</form>
					</c:forEach>
				</c:if>
			</div>
		</div>
		
		<div id="tabs-2">
		<span>경매 상품</span>
			<div id="customer">
				<c:if test="${message!=null}">
						${message}
					</c:if>
				<c:if test="${listMsg!=null}">
						${listMsg}
					</c:if>
				<div class="container main_content" id="products">
					<c:forEach items="${mainList}" var="dto" varStatus="status">
						<div class="item  col-xs-4 col-lg-4">
							<form method="post" id="item_form" action="${path}/select">
								<input type="hidden" name="productNo" id="tesetest"
									value="${dto.productNo}"> <input type="hidden"
									name="${_csrf.parameterName}" value="${_csrf.token}">
							</form>
							<div class="thumbnail">

								<img class="group list-group-image"
									src="${path}/${dto.getThumbnailPath()}" alt="" />

								<div class="caption">
									<h4 class="group inner list-group-item-heading">${dto.getProductName()}</h4>

									<div class="row list-group-item-text">
										<div>
											<p>
												<fmt:formatNumber value="${dto.getPrice()}"
													groupingUsed="true" />
												원
											</p>
										</div>
									</div>

									<p class="list-group-item-text">입찰 ${dto.getBidCount()}</p>

									<p class="group inner list-group-item-text">판매자
										${dto.getId()}</p>
									<p class="group inner list-group-item-text">남은기간
										${dto.getDeadline()}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>