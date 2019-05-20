<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="application" />

<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main/main_list.css" />
	 <link rel="stylesheet" type="text/css"  href="${path}/resources/css/main/list_add.css">

<title>Value+</title>



<script type="text/javascript">
	//list
	//카테고리 더보기 -> 대분류로 고정
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(document)
			.ready(
					function() {
						//sessionStorage.clear();
						// 저장된 모든 값 삭제
						$(".button").click(function() {
							$(".button").css({
								"color" : "",
								"border" : ""
							});
							$(this).css({
								"border" : "1px solid #01DFA5",
								"color" : "#01DFA5"
							});
						});
						var moreBtnState = false;
						var name = "All";
						if ('list' == '${listStyle}') {
							sessionStorage.setItem("listStyle", "list");
							$('#products .item').removeClass('grid-group-item')
									.addClass('list-group-item');
						}

						if (name == "${categoryName}") {
							$("#more_btn").css("display", "none");
						}

						$('#list')
								.click(
										function(event) {
											event.preventDefault();
											sessionStorage.setItem("listStyle",
													"list");
											$('#products .item')
													.removeClass(
															'grid-group-item')
													.addClass('list-group-item');
										});

						$('#grid').click(
								function(event) {
									event.preventDefault();
									sessionStorage.removeItem("listStyle");
									$('#products .item').removeClass(
											'list-group-item');
									$('#products .item').addClass(
											'grid-group-item');
								});

						$("#more_btn")
								.click(

										function() {
											if (!moreBtnState) {
												moreBtnState = true;
												
												$("#more_div").show(500);
												$("#more_text").text("닫기 ∧");

											} else {
												moreBtnState = false;
												$("#more_div").hide(500);
												$("#more_text").text("더보기 ∨");
											}

										});

						//대분류 클릭시
						$(document).on("click", "#bigCategory_btn", function() {
							sessionStorage.setItem("listStyle",
							"grid");
							var params = $(this).children().text();
							location.href = "list?categoryName=" + params;

						});

						var division=null;
						//중분류 클릭시
						$(document).on("click","#division_btn",function() {
							sessionStorage.removeItem("listStyle");
											division = $(this).children()
													.text();
											location.href = "selectByDivision?divisionName=" + division;
						});//on 끝
						
						// 정렬하기
						$(".sort_list").click(function() {
											//정렬과 대분류인지 소분류인지가 필요
											var categoryName = "${categoryName}";
											var sort = $(this).attr('id');
											var style = null;
											//대분류
											if (${divisionName==null}) {
												var listStyle = sessionStorage
														.getItem("listStyle");
												if (listStyle == 'list') {
													style = "list";
												}
												location.href = "list?categoryName="
														+ categoryName
														+ "&sort="
														+ sort
														+ "&style=" + style;

												//중분류
											} else {
												
												var listStyle = sessionStorage
												.getItem("listStyle");
												if (listStyle == 'list') {
												style = "list";
												}
												location.href = "selectByDivision?divisionName="
												+ "${divisionName}"
												+ "&sort="
												+ sort
												+ "&style=" + style;
												
											}

										});
						$(".thumbnail").click(function() {
							$(this).parent().children().submit();
						});

					});//script끝
</script>
</head>

<body>
	<div class="container" id="main_div">
		<!-- 제목클릭시 불러오기 수정 -->
		<div class="main_text">
			<a href="${path}/list?categoryName=${categoryName}"
				id="categoryTitle">${categoryName}</a>
		</div>
		<div class="centered" id="category_div">
			<!-- 버튼클릭시 해당 카테고리로 불러오기 -->
			<c:choose>
				<c:when test="${division != null}">
					<c:forEach items="${division}" var="category" varStatus="status">
						<button class="button ValP" type="button" id="division_btn">
							<span class="button_text" id="divisionName">${category}</span>
						</button>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${bigCategory}" var="category" varStatus="status">
						<button class="button ValP" type="button" id="bigCategory_btn">
							<span class="button_text" id="categoryName">${category}</span>
						</button>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>

		<div>
			<div id="more_div" style="display: none;">
				<button class='button ValP' type='button' id='bigCategory_btn'>
					<span class='button_text'>All</span>
				</button>
				<c:forEach items='${bigCategory}' var='category' varStatus='status'>
					<button class='button ValP' type='button' id='bigCategory_btn'>
						<span class='button_text'>${category}</span>
					</button>
				</c:forEach>
			</div>
			<button class="button ValP" type="button" id="more_btn"
				style="border: none; margine-left: 10px;">
				<span class="button_text" id="more_text">더보기 ∨</span>
			</button>


		</div>
		<div class="small_menubar">
			<span class="span">모두 <span style="color: #52DCBA;"
				id="listSize">${listSize}</span>개의 물품이 검색되었습니다.
			</span>
			<button id="list" class="button_time" type="button">
				<img align="middle" alt="no"
					src="${path}/resources/img/product/listIcon.png">
			</button>
			<button id="grid" class="button_time" type="button">
				<img align="middle" alt="no"
					src="${path}/resources/img/product/gridIcon.png">
			</button>
			<a class="sort_list" id="bid_count desc" href="#">인기경매순&nbsp</a> <a
				class="sort_list" id="deadline" href="#">마감임박순&nbsp</a> <a
				class="sort_list" id="start_date desc" href="#">신규경매순&nbsp</a> <a
				class="sort_list" id="price desc" href="#">높은가격순&nbsp</a> <a
				class="sort_list" id="price" href="#">낮은가격순 &nbsp</a>

		</div>
	</div>

	<div class="container main_content" id="products">
		<hr id="hr">
		<c:forEach items="${mainList}" var="dto" varStatus="status">

			<div class="item  col-xs-4 col-lg-4">
				<form method="post" action="${path}/select">
					<input type="hidden" name="productNo" value="${dto.productNo}" /> <input
						type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
								<p class="lead">
									<fmt:formatNumber value="${dto.getPrice()}" groupingUsed="true" />
								</p>
								<p class="group inner list-group-item-text">입찰 :
									${dto.getBidCount()}</p>

								<p class="group inner list-group-item-text">판매자 :
									${dto.getId()}</p>
								<p class="group inner list-group-item-text">남은기간 :
									${dto.getDeadline()}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>