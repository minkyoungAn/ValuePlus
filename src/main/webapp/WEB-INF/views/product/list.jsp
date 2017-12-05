<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	href="${path}/resources/css/style.css?ver=1" />
<title>Value+</title>



<script>
	//list
	$(document).ready(
			function() {
				$('#list').click(
						function(event) {
							event.preventDefault();
							$('#products .item').removeClass('grid-group-item')
									.addClass('list-group-item');
						});
				$('#grid').click(function(event) {
					event.preventDefault();
					$('#products .item').removeClass('list-group-item');
					$('#products .item').addClass('grid-group-item');
				});
			});
</script>
</head>

<body>
	<div class="container">
		<div class="main_text">핸드메이드</div>
		<div class="centered">
			<button class="button" type="button">
				<span class="button_text">카테고리1</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리2</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리3</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리4</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리5</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리6</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리7</span>
			</button>
			<button class="button" type="button">
				<span class="button_text">카테고리8</span>
			</button>
		</div>
		<div>
			<button class="button" type="button"
				style="border: none; margine-left: 10px">
				<span class="button_text">더보기 ∨</span>
			</button>
		</div>
		<div class="small_menubar">
			<span>모두 <span style="color: #52DCBA;">0000</span>개의 물품이
				검색되었습니다.
			</span>
			<button class="button_time" type="button">
				<span class="end_time">&nbsp마감시간 보기&nbsp</span>
			</button>
			<a class="sort_list" href="#">인기경매순&nbsp</a> <a class="sort_list"
				href="#">마감임박순&nbsp</a> <a class="sort_list" href="#">신규경매순&nbsp</a>
			<a class="sort_list" href="#">높은가격순&nbsp</a> <a class="sort_list"
				href="#">낮은가격순</a>


			<button id="list" class="button_time" type="button">
				<span class="end_time">&nbspList&nbsp</span>
			</button>
			<button id="grid" class="button_time" type="button">
				<span class="end_time">&nbspGrid&nbsp</span>
			</button>

			<!-- <div class="btn-group">
				<a href="#" id="list" class="btn btn-default btn-sm"><span
					class="glyphicon glyphicon-th-list"> </span>List</a> <a href="#"
					id="grid" class="btn btn-default btn-sm"><span
					class="glyphicon glyphicon-th"></span>Grid</a>
			</div> -->

		</div>
	</div>

	<div class="container">
		<hr id="hr">
		<div id="products" class="row list-group">
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="item  col-xs-4 col-lg-4">
				<div class="thumbnail">
					<img class="group list-group-image"
						src="http://placehold.it/400x250/000/fff" alt="" />
					<div class="caption">
						<h4 class="group inner list-group-item-heading">Product title</h4>
						<p class="group inner list-group-item-text">Product
							description... Lorem ipsum dolor sit amet, consectetuer
							adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
							laoreet dolore magna aliquam erat volutpat.</p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<p class="lead">$21.000</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>