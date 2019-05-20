<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Value Plus</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/productForm.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>

<sec:authorize access="hasRole('ROLE_MEMBER')" var="isUser" />
<sec:authentication property="principal" var="vo" />
<script type="text/javascript">
	$(function() {
		
		selectCategory();

		//대분류 클릭시 중분류 가져오기.
		$("#select_category").click(
				function() {
					$.ajax({
						url : "selectDivision",
						type : "post",
						data : "categoryName=" + $(this).val()
								+ "&${_csrf.parameterName}=${_csrf.token}",
						dataType : "json",
						success : function(result) {
							//alert(result);
							var str = "";
							$.each(result, function(index, item) {
								str += "<option>" + item.categoryName
										+ "</option>"
							});
							$("#select_division tr:gt(0)").remove();
							$("#select_division").html(str);

						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				});

		//대분류,중분류를 사용자가 선택시 선택내역 띄우기.
		$("#select_category").click(function() {

			var category = $(this).val();
			$("#categoryNametx").val("");
			$("#divisionName").val("");
			$("#categoryNametx").val(category);

			$("#select_division").click(function() {

				var division = $(this).val();
				$("#divisionName").val(division);
			})
		});

		$(".fa-list").click(function() {
			$(".select_view").fadeIn();
		});
		$(".productDetail_textarea>textarea").click(function() {
			$(this).css({
				"text-align" : "",
				"padding" : "10px",
				"background-color" : "white",
				"font-size" : "20px",
				"font-weight" : "bold",
				"cursor" : "text"
			});
		});
		//상품등록 페이지 로드시 상세설명 table에 첫번째 tr 보이고 나머지는 추가하기 버튼클릭하면 추가!

		$(".form_side_btn>i").mouseenter(function() {
			$(".form_side_btn>span").fadeIn(200);
		});
		$(".form_side_btn>i").mouseleave(function() {
			$(".form_side_btn>span").fadeOut(200);
		});
		$(".product_select_div>.fa-picture-o").mouseenter(function() {
			$("#thumbnail_txt").fadeIn(200);
		});
		$(".product_select_div>.fa-picture-o").mouseleave(function() {
			$("#thumbnail_txt").fadeOut(200);
		});
		$(".product_hidden_go>i").mouseenter(function() {
			$(".sub_modal").fadeIn(200);
		});
		$(".product_hidden_go>i").mouseleave(function() {
			$(".sub_modal").fadeOut(200);
		});
		$(".product_hidden_reset>i").mouseenter(function() {
			$(".product_hidden_reset>span").fadeIn(200);
		});
		$(".product_hidden_reset>i").mouseleave(function() {
			$(".product_hidden_reset>span").fadeOut(200);
		});

		$(".productDetail_hidden>i").click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$(this).parent().parent().css({
					"display" : "none"
				});
			}

		})

		$(window).scroll(function() {
			var scroll = $(document).scrollTop()
			if (scroll > 309) {
				$("#insert").css({
					"position" : "fixed",
					"top" : "100px",
					"right" : "0"
				});
			} else if (scroll < 309) {
				$("#insert").css({
					"position" : "",
					"top" : "",
					"right" : ""
				});
			}
	});
	 	$("#product_submit_btn").click(function() {	
			$("#product_form").submit();
		}) 
		var i = 1;
		$("#insert").click(function() {
			var height = $(".productDetail_content").height();
			var height1 = $(".productDetail_wrap").height();
			var height2 = $(".productForm_wrap").height();
			if (height != 2835) {
				$(".productDetail_content").height(height + 315);
				$(".productForm_wrap").height(height2 + 315);
			}
			if (height1 != 2910) {
				$(".productDetail_wrap").height(height1 + 315);
			}
			if (i == 1) {
				$("#productDetail_threeTr").css({
					"display" : "block"
				});
				i++;
			} else if (i == 2) {
				$("#productDetail_fourTr").css({
					"display" : "block"
				});
				i++;
			} else if (i == 3) {
				$("#productDetail_fiveTr").css({
					"display" : "block"
				});
				i++;
			} else if (i == 4) {
				$("#productDetail_sixTr").css({
					"display" : "block"
				});
				i++;
			} else if (i == 5) {
				$("#productDetail_sevenTr").css({
					"display" : "block"
				});
				i++;
			} else if (i == 6) {
				$("#productDetail_eightTr").css({
					"display" : "block"
				});
				i++;
			} else if (i == 7) {
				$("#productDetail_nineTr").css({
					"display" : "block"
				});
				i++;
			} else if (i > 7) {
				alert("더이상 이미지를 추가할수 없습니다.")
			}
		});

		//이미지 미리보기(썸네일).
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기위한 FileReader 객체 생성
				reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트핸들러
					$("#imgBox").attr("src", e.target.result);
					//이미지 Tag의 src속성에 읽어들인 File내용을 지정
					//아래 코드에서 읽어들인 dataURL형식
				}
				reader.readAsDataURL(input.files[0]);
				//File 내용을 읽어 dataURL 형식의 문자열로 저장
			}
		}
		//file 양식으로 이미지를 선택되었을때 처리하는 코드
		$("#zeroFile").change(function() {
			readURL(this);
		});

		//이미지 미리보기(1)
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox1").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#oneFile").change(function() {
			readURL1(this);
		});
		//이미지 미리보기(2).
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox2").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#twoFile").change(function() {
			readURL2(this);
		});
		//이미지 미리보기(3).
		function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox3").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#threeFile").change(function() {
			readURL3(this);
		});
		//이미지 미리보기(4).
		function readURL4(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox4").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#fourFile").change(function() {
			readURL4(this);
		});
		//이미지 미리보기(5).
		function readURL5(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox5").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#fiveFile").change(function() {
			readURL5(this);
		});
		//이미지 미리보기(6).
		function readURL6(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox6").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#sixFile").change(function() {
			readURL6(this);
		});
		//이미지 미리보기(7).
		function readURL7(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox7").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#sevenFile").change(function() {
			readURL7(this);
		});
		//이미지 미리보기(8).
		function readURL8(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox8").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#eightFile").change(function() {
			readURL8(this);
		});
		//이미지 미리보기(9).
		function readURL9(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgBox9").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#nineFile").change(function() {
			readURL9(this);
		});

		//사용자가 시작가를 입력시 입찰단위 체크박스 보여주기.
	      $("#startPrice").keyup(function() {

	         var str = parseInt($(this).val());
	         // hidden 잇다치고
	         if (0 <= str && str < 100000) {
	            $("#auctionArea").val('1,000'); // fmt
	            $("#hiddenunit").val(1000);
	            // $("#hidden").val(1000) 이걸전송
	         } else if (100000 <= str && str < 1000000) {
	            $("#auctionArea").val('10,000');
	            $("#hiddenunit").val(10000);
	         } else if (1000000 <= str && str < 10000000) {
	            $("#auctionArea").val('50,000');
	            $("#hiddenunit").val(50000);
	         } else {
	            $("#auctionArea").val("시작가를 다시 입력해주세요");
	            $("#startPrice").val("");
	         }
	      })//keyup끝
	});//function끝

	//상품등록 페이지 로드시 대분류 카테고리 가져오기.
	function selectCategory() {
		$.ajax({
			url : "selectCategory",
			type : "post",
			data : "&${_csrf.parameterName}=${_csrf.token}",
			dataType : "json",
			success : function(result) {
				//alert(result);
				var str = "";
				$.each(result, function(index, item) {
					str += "<option>" + item.categoryName + "</option>"
				});
				$("#select_category").html(str);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}

	//모든 text의 입력값과 상세설명에서 이미지 칸이 2번째까지 입력안되면 submit안되게끔!
	   function checkNull() {

	      if ($("#categoryNametx").val() == "") {
	         alert("대분류 카테고리를 선택해주세요");
	         return false;
	      }
	      if ($("#divisionNo").val() == "") {
	         alert("중분류 카테고리를 선택해주세요");
	         return false;
	      }
	      if ($(".productName").val() == "") {
	         alert("상품 이름을 입력해주세요");
	         return false;
	      }
	      if ($("#zeroFile").val() == "") {
	         alert("메인 이미지파일을 첨부해주세요");
	         return false;
	      }
	      if ($("#oneFile").val() == "") {
	         alert("첫번째 이미지파일을 첨부해주세요");
	         return false;
	      } else if ($("#twoFile").val() == "") {
	         alert("두번째 이미지파일까지 첨부해주세요");
	         return false;
	      }
	      if ($("#one").val() == "") {
	         alert("내용을 입력해주세요");
	         return false;
	      } else if ($("#two").val() == "") {
	         alert("내용을 입력해주세요");
	         return false;
	      }

	      if ($("#startPrice").val() == "") {
	         alert("상품의 시작가격을 입력해주세요");
	         return false;
	      }
	      if ($("#select_date option:checked").val() == "0") {
	         alert("경매 게시 기간을 선택해주세요");
	         return false;
	      }
	      if($("#threeFile").val()!=""){
	         if ($("#three").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      if($("#fourFile").val()!=""){
	         if ($("#four").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      if($("#fiveFile").val()!=""){
	         if ($("#five").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      if($("#sixFile").val()!=""){
	         if ($("#six").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      if($("#sevenFile").val()!=""){
	         if ($("#seven").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      if($("#eightFile").val()!=""){
	         if ($("#eight").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      if($("#nineFile").val()!=""){
	         if ($("#nine").val() == "") {
	            alert("내용을 입력해주세요");
	            return false;
	         }
	      }
	      return true;
	   }

	   function onlyNumber(){
	   
	      if ((event.keyCode < 48) || (event.keyCode > 57)) {
	         alert("숫자만입력해주세요");
	         $("#startPrice").val("");
	         event.returnValue = false;
	      }

	   }
	   
	    function numberWithCommas(x) {
	         return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	      }
</script>

</head>
<body>
	<c:choose>
		<c:when test="${!isUser}">
			<script>
				location.href = "${pageContext.request.contextPath}/";
			</script>
		</c:when>
	</c:choose>
	<div class="productForm_wrap">
		<form method="post" name="insertForm" action="${pageContext.request.contextPath}/insert?${_csrf.parameterName}=${_csrf.token}"
			id="product_form" onsubmit="return checkNull()"
			enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden"
			value="${vo.id}" id="userId" name="userId" readonly="readonly" />
			<div class="product_category_form">
				<div class="product_name">

					<div class="product_hidden">

						<div class="product_hidden_go">
							<i class="fa fa-info-circle" aria-hidden="true"></i><span>경매
								정보 입력하러 가기</span>
							<div class="sub_modal">
								<h5>경매 시작가 입력시 입찰 단위</h5>
								<h6>100,000 미만 => 입찰 단위 1,000원</h6>
								<h6>1,000,000 미만 => 입찰 단위 10,000원</h6>
								<h6>5,000,000 미만 => 입찰 단위 50,000원</h6>
							</div>
						</div>
						<br> <br>
						<div class="product_hidden_reset">
							<i class="fa fa-ban" aria-hidden="true"
								onclick="document.getElementById('reset_product').click();"></i><span>Reset</span>
							<input style="display: none" id="reset_product" type="reset"
								value="reset">
						</div>
					</div>
					<div class="product_name_div_wrap">
						<div class="product_name_div">
							<select id="select_date" name="auctionDuring"
								style="border-bottom: 2px solid rgba(0, 0, 0, 0.1)">
								<option value="0">-선택하세요-</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
							</select><span>일</span> <input type="text" name="productName"
								placeholder="상품 이름" />
						</div>
						<div class="product_category_div">
							<input type="text" id="startPrice" onkeyup="onlyNumber();" class="startPrice"
								style="border-bottom: 2px solid rgba(0, 0, 0, 0.1)"
								name="startPrice" size="20" onkeyup="onlyNumber();" placeholder="시작가를 입력해 주세요">
							<span>원</span> <input type="text" id="auctionArea" 
								readonly="readonly" placeholder="입찰단위" size="20">원 <input
								type="text" id="categoryNametx" name="categoryName" readonly
								placeholder="대분류" /> <input type="text" id="divisionName"
								name="divisionNo" readonly placeholder="중분류" />
						</div>

					</div>


				</div>
				<div class="product_select_form">
					<div class="select_view">
						<select id="select_category" class="select">
							<option>-선택해주세요-</option>
						</select> <select id="select_division" class="select">
							<option>-선택해주세요-</option>
						</select>
					</div>
					<img id="imgBox" src="#" accept=".gif,.jpg,.png,.bmp,.tif" alt="">
					<div class="product_select_div">
						<i class="fa fa-list" aria-hidden="true"></i> <br> <i
							class="fa fa-picture-o"
							onclick="document.getElementById('zeroFile').click();"
							aria-hidden="true"></i><span id="thumbnail_txt">Thumbnail</span><input
							type="file" name=thumbnail id="zeroFile"
							accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가"">
					</div>
				</div>
			</div>

			<div class="productDetail_wrap">
				<div class="form_side_btn">
					<span>Add Content</span><i id="insert" class="fa fa-plus"
						aria-hidden="true"></i>
				</div>

				<div class="productDetail_content">

					<div id="productDetail_oneTr" class="productTr">
						<div class="productDetail_hidden"></div>
						<div class="productDetail_img">
							<img id="imgBox1" class="imgArea" alt="" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif">
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="one" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('oneFile').click();"
								aria-hidden="true"></i><input type="file" name="photo1"
								id="oneFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>
					</div>

					<div id="productDetail_twoTr" class="productTr">
						<div class="productDetail_hidden"></div>
						<div class="productDetail_textarea">
							<textarea name="description" id="two" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img">
							<img id="imgBox2" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('twoFile').click();"
								aria-hidden="true"></i> <input type="file" name="photo2"
								id="twoFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>
					</div>

					<div id="productDetail_threeTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_img">
							<img id="imgBox3" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="three" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('threeFile').click();"
								aria-hidden="true"></i> <input type="file" name="photo3"
								id="threeFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>

					</div>

					<div id="productDetail_fourTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="four" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img">
							<img id="imgBox4" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('fourFile').click();"
								aria-hidden="true"></i><input type="file" name="photo4"
								id="fourFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>
					</div>

					<div id="productDetail_fiveTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_img">
							<img id="imgBox5" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="five" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('fiveFile').click();"
								aria-hidden="true"></i><input type="file" name="photo5"
								id="fiveFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>

					</div>

					<div id="productDetail_sixTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="six" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img">
							<img id="imgBox6" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('sixFile').click();"
								aria-hidden="true"></i><input type="file" name="photo6"
								id="sixFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>
					</div>

					<div id="productDetail_sevenTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_img">
							<img id="imgBox7" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="seven" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('sevenFile').click();"
								aria-hidden="true"></i><input type="file" name="photo7"
								id="sevenFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>

					</div>

					<div id="productDetail_eightTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="eight" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img">
							<img id="imgBox8" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('eightFile').click();"
								aria-hidden="true"></i><input type="file" name="photo8"
								id="eightFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>
					</div>

					<div id="productDetail_nineTr" class="productTr">
						<div class="productDetail_hidden">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
						<div class="productDetail_img">
							<img id="imgBox9" class="imgArea" src="#"
								accept=".gif,.jpg,.png,.bmp,.tif" alt="">
						</div>
						<div class="productDetail_textarea">
							<textarea name="description" id="nine" placeholder="Text"></textarea>
						</div>
						<div class="productDetail_img_btn">
							<i class="fa fa-picture-o"
								onclick="document.getElementById('nineFile').click();"
								aria-hidden="true"></i><input type="file" name="photo9"
								id="nineFile" accept=".gif,.jpg,.png,.bmp,.tif" value="이미지추가">
						</div>

					</div>

				</div>
			</div>
         <input type="hidden" value="" id="hiddenunit" name="bidUnit"/>
      </form>
	</div>

</body>
</html>