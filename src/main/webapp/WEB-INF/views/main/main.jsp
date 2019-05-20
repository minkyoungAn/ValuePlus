<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"
	scope="application" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/main_list.css">
<title>Value+</title>
<script>
	$(document).ready(function() {
		$(".main_content_2").mouseenter(function() {
			$(this).children().stop().fadeIn();
		});
		$(".main_content_2").mouseleave(function() {
			$(".main_content_2>div").stop().fadeOut();
		});
		$(".main_content_3").mouseenter(function() {
			$(this).children().stop().fadeIn();
		});
		$(".main_content_3").mouseleave(function() {
			$(".main_content_3>div").stop().fadeOut();
		});

		//민경추가 전체리스트 이동
		$(document).on("click", ".category_content_text", function() {

			location.href = "list?categoryName=" + $(this).text();
		});

		$(".thumbnail").click(function() {
			$(this).parent().children().submit();
		});
	});

	function move() {
		$("#contentH1").click(function() {
			location.href = "${pageContext.request.contextPath}/guideMain";
		});
		$("#contentH2")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/list?categoryName=All";
						});
	}
</script>
</head>
<body>
	<section class="main_content">

		<div class="main_content_1">
			<img
				src="${pageContext.request.contextPath}/resources/img/main/main05.jpg">
			<div class="main_sub_content"
				style="display: block; background-color: rgba(0, 0, 0, 0.5)">
				<div
					style="text-align: right; font-size: 40px; padding: 80px 20px 20px 10px; font-family: Nanum Myeongjo, sans-serif; color: #f2f2f2">당신의
					추억이 가치가 되는 공간,</div>

				<div
					style="text-align: right; font-size: 50px; padding: 30px 40px 20px 10px; font-family: Nanum Myeongjo, sans-serif; color: #cacaca">Value
					Plus</div>
			</div>
		</div>
		<div class="main_content_2" style="cursor: pointer;">
			<img
				src="${pageContext.request.contextPath}/resources/img/main/main04.jpg">
			<div class="main_sub_content">
				<div id="contentH1"
					style="text-align: center; font-size: 40px; font-weight: 100px; padding: 60px 20px 20px 10px; font-family: Nanum Myeongjo, sans-serif; color: #f2f2f2"
					onclick="move();">Value+ Guide</div>
			</div>
		</div>
		<div class="main_content_3" style="cursor: pointer;">
			<img
				src="${pageContext.request.contextPath}/resources/img/main/auction01.jpg">
			<div class="main_sub_content">
				<div id="contentH2"
					style="text-align: center; font-size: 35px; font-weight: 100px; padding: 60px 20px 20px 10px; font-family: Nanum Myeongjo, sans-serif; color: #f2f2f2"
					onclick="move();">Go Auction</div>
			</div>
		</div>

	</section>
	<section class="category">
		<div class="category_title">V A L U E P L U S &emsp; K E Y W O R
			D</div>
		<div class="category_content">
			<div class="category_content_text">All</div>
			<div></div>
			<c:forEach items="${bigCategory}" var="category" varStatus="status">
				<c:if test="${ status.count%2 eq 0 }">
					<div></div>
				</c:if>
				<div class="category_content_text">${category}</div>
			</c:forEach>
		</div>
	</section>
	<div class="content_list">
		<div class="best_content">
			<div class="content_title">ValuePlus 인기경매</div>
			<div class="best_content_list container">
				<div class="row">
					<c:forEach items="${bidCountList}" var="dto" varStatus="status">
						<div class="item  col-xs-4 col-lg-4">
							<form method="post" action="${path}/select">
								<input type="hidden" name="productNo" value="${dto.productNo}">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
							<div class="thumbnail">
								<div class="thumbnail_img">
									<img class="group list-group-image"
										src="${dto.getThumbnailPath()}" alt="#" />
								</div>

								<div class="caption">
									<h4 class="group inner list-group-item-heading">${dto.getProductName()}</h4>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p>
												<fmt:formatNumber value="${dto.getPrice()}"
													groupingUsed="true" />
											</p>
										</div>
									</div>
									<p class="group inner list-group-item-text">입찰
										${dto.getBidCount()}</p>
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

		<div class="close_content ">
			<div class="content_title">ValuePlus 마감경매</div>
			<div class="close_content_list container">
				<div class="row">
					<c:forEach items="${deadLineList}" var="dto" varStatus="status">
						<div class="item  col-xs-4 col-lg-4">
							<form method="post" action="${path}/select">
								<input type="hidden" name="productNo" value="${dto.productNo}">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
							<div class="thumbnail">
								<div class="thumbnail_img">
									<img class="group list-group-image"
										src="${dto.getThumbnailPath()}" alt="#" />
								</div>
								<div class="caption">
									<h4 class="group inner list-group-item-heading">${dto.getProductName()}</h4>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p>
												<fmt:formatNumber value="${dto.getPrice()}"
													groupingUsed="true" />
											</p>
										</div>
									</div>
									<p class="group inner list-group-item-text">입찰
										${dto.getBidCount()}</p>
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

		<div class="new_content ">
			<p />
			<div class="content_title">ValuePlus 신규경매</div>
			<div class="new_content_list container">
				<div class="row">
					<c:forEach items="${startDateList}" var="dto" varStatus="status">
						<div class="item  col-xs-4 col-lg-4">
							<form method="post" action="${path}/select">
								<input type="hidden" name="productNo" value="${dto.productNo}">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
							<div class="thumbnail">
								<div class="thumbnail_img">
									<img class="group list-group-image"
										src="${dto.getThumbnailPath()}" alt="#" />
								</div>
								<div class="caption">
									<h4 class="group inner list-group-item-heading">${dto.getProductName()}</h4>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p>
												<fmt:formatNumber value="${dto.getPrice()}"
													groupingUsed="true" />
											</p>
										</div>
									</div>
									<p class="group inner list-group-item-text">입찰
										${dto.getBidCount()}</p>
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