<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="application" />
<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/cs/cs.css" />
<title>Value+</title>
<!-- 아코디언 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#QAndA").click(function() {
							$("#divMenu").val("> 자주 묻는 질문");
							$("#cs_center1").css({"display":"block"});
							$("#cs_center").css({"display":"none"});
							$("#accordion").accordion({
								collapsible : true

							});
							
								$('#FAQ').show();
						

						});

						$("#notice")
								.click(
										function() {
											$("#divMenu").val("> 공지사항");
											$("#cs_center").css({"display":"block"});
											$("#cs_center1").css({"display":"none"});
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/selectNotice",
														data : "${_csrf.parameterName}=${_csrf.token}",
														dataType : "json",
														success : function(
																result) {
															var data = "";
															data += "<table cellpadding='5'><tr><th>공지사항 번호</th><th>제목</th><th>작성시간</th></tr>";
															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				data += "<tr>";
																				data += "<td>"
																						+ item.noticeNo
																						+ "</td>";
																				data += "<td><a href='#' id='noticeTitle'>"
																						+ item.noticeTitle
																						+ "</a></td>";
																				data += "<td>"
																						+ item.noticeWritedate
																						+ "</td>";
																				data += "</tr>";
																			});
															data += "</table>";
															$("#cs_center")
																	.html(data);
														}
													});
										});
					});
	$(document)
			.on(
					"click",
					"#noticeTitle",
					function() {
						var code = $(this).parent().parent().children(
								"td:first").text();
						$
								.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/selectNoticeByTitle",
									data : "${_csrf.parameterName}=${_csrf.token}&&noticeNo="
											+ code,
									dataType : "json",
									success : function(result) {
										var data = "";
										data += "<div class='content_popup_title'>";

										$
												.each(
														result,
														function(index, item) {
															data += "<input type='hidden' id='noticeNo' value='"+item.noticeNo+"'/>";
															data += "<input type='hidden' id='noticeWritedate' value='"+item.noticeWritedate+"'/>";
															data += "<h5>"
																	+ item.noticeTitle
																	+ "</h5>";
															data += "<input type='text' readonly='readonly' id='noticeContent2' value='"+item.noticeContent+"'/>";
														});
										data += "<input type='button' id='closeBtn2' value='닫기'>";
										data += "</div>";

										$(".selectNotice_pop").html(data);
										$("#selectNotice_wrap").html();
										$("#selectNotice_wrap").css("display",
												"block");
									}//function
								});//ajax
					}); //click
	/////////////모달창 닫기 버튼
	$(document).on("click", "#closeBtn2", function() {
		$("#selectNotice_wrap").css("display", "none");
		$("#notice").trigger("click");
	});
</script>

</head>
<body>
	<div class="container">
		<div class="cs_top">
			<span id="cs_title">value+ 고객센터</span>
		</div>
		<div class="cs_manubar">
			홈 <input type="text" id="divMenu" value=">" readonly="readonly" />
		</div>
		<div class="cs_sidebar">
			<p>
				<a id="QAndA" href="#">자주묻는 질문</a>
			</p>
			<p>
				<a id="notice" href="#">공지사항</a>
			</p>
		</div>
		<div id="cs_center" class="cs_center"></div>
		<div id="cs_center1" class="cs_center">


			<div id="FAQ">
				<div id="accordion">
					<h3>회원 가입은 어디서 할 수 있나요?</h3>
					<div class="div01">
						<p>
						<h4>Value+에 회원 가입은 어떻게 할 수 있나요?</h4>
						</p>
						<span>Value+는 연령 제한 없이 누구나 무료로 <font color="#01DFA5"
							style="font-size: 12pt;">회원가입</font>이 가능하며,홈페이지 좌측 메뉴에 Join버튼을 클릭
							후 가입하실 수 있습니다.<br> <span><font color="#01DFA5"
								style="font-size: 13pt;">이메일 인증</font> 을 반드시 거치셔야 회원가입이 완료됩니다.</span><br>
					</div>

					<h3>회원 등급은 무엇인가요?</h3>
					<div>
						<p>
						<h4>Value + 의 회원 등급은?</h4>
						</p>
						<ul>
							<li>new :</li>
							<li>gold :</li>
							<li>family :</li>
							<li>vip :</li>
							<li>vvip :</li>
						</ul>
					</div>

					<h3>직거래, 가격흥정 관련 피해 사례</h3>
					<div>
						<p>
						<h4>최근 직거래, 가격흥정 관련 피해가 발생되고 있습니다.</h4>
						</p>

						<span>저희 홈페이지 상의 거래가 아닌 직거래 또는 가격흥정 시</span><br> <span>따라서
							아래와 같은 피해사례가 발생될 수 있습니다.</span>
						<p>
							<span>1. 판매자가 별도 계좌로 송금 요청,이후 물품을 발송하지 않거나</span><br> <span>&nbsp;&nbsp;&nbsp;하자
								있는 물건을 발송 후 반품 등에 협조하지 않음.</span><br> <span>2. 구매자가 물품을
								수령하였으나,</span><br> <span>&nbsp;&nbsp;&nbsp;수령하지 않았다고 주장 또는
								물품대금을 송금하지 않음.</span>
						<p>
							<span>안전한 거래를 위해서는<sapn> <br>
								<span>반드시 Value+ 서비스를 이용해 주시기 바라며,직거래, 가격흥정 등으로 피해가 발생했을
									경우에는</span> <br>
								<span>해당 당사자에게 책임이 있으므로 이점 유의해 주시기 바랍니다.</span> <br>
								<span>아울러 직거래, 가격흥정을 유도하는 판매자, 구매자님이 있을 경우 사전에 1:1문의 사항을
									통해 신고를 요청드립니다.</span>
								<p>
									<span>Value+에서 직거래유도 , 불공정거래(가격흥정 포함)로 판단되면 신용도 반영 또는
										Value+ 약관에 의해 회원자격이 제한됩니다.</span>
								<p>
									<span>감사합니다</span>
								<p>
					</div>

					<h3>주류 판매 및 구입 가능 여부에 관한 사항</h3>
					<div>
						<p>
						<h4>온라인 경매 시 주류 관련 품목 등록에 관련하여 안내 드립니다.</h4>
						</p>
						<p>
							<span>주류 물품은 등록 시 현재 유통되지 않거나 '미니어처'라 하더라도</span><br> <span
								style="color: #cc0000"><strong>[내용물이 채워져 있는 주류
									물품]</strong>은 경매 진행이 불가능합니다.</span><br> <span style="color: #0070c0">주서법
								제 8조 (주류판매업면허)에 따르는 사항이기에 발견되는 즉시 즉권으로 경매 조기종료로 조치될 예정입니다.</span><br>
						</p>
					</div>

					<h3>매매 및 등록 제한 물품안내</h3>
					<div>
						<p>
						<h4>매매 제한, 불가 물품에 안내 드립니다.</h4>
						</p>
						<span style="color: #70388a">■ 매매 제한, 불가 물품 안내</span>
						<p>
							<span>· 법률상 판매가 금지된 상품의 거래를 막고, 유해환경을 차단하기 위해 기타 불법물과 음란한
								표현물 (사진,이미지,글,영상,부호 등)의 사용은 제재하고 있습니다.</span>
						<p>
							<span>· 총포, 도검, 화약류, 분사기, 석궁 등은 (총포, 도검, 화약류 등 단속법령)에 의해서
								매매제한, 불가물품으로 분류되고 있으며,그 제조, 판매, 소지가 금지.제한되고 있는 물품입니다.</span><br> <span>·
								음란 표현물 (주요 품목: 성인용품)</span><br> <span>&nbsp;&nbsp;예) 음란한
								사진, 언어, 영상, 신호를 사용하여 성적인 수치심을 자극하는 모든 표현물</span>
						<p>
							<span>따라서 Value+ 사이버시장에서는 그 유통이 제한.금지된 물품임을 인식하시고 유의해 주시기
								바랍니다.</span>
						<p>

							<span style="color: #70388a">■ 등록 제한 및 삭제 안내</span>
						<p>
							<span>· 장물(도난품), 위조, 가짜상품, 법령상 판매가 제한 또는 금지된 품목을 등록할 수
								없습니다.</span><br> <span>· 허위의 사실을 기재할 수 없습니다.</span><br> <span>·
								금융상의 편의를 위한 허위의 거래를 한 경우 법률상의 처벌을 받게 됩니다.</span><br> <span>·
								<font color="#cc0000">19세 이상 성인물품은 모자이크 처리</font>를 한 후 등록해야 합니다.
							</span><br> <span>· 허위물품 또는 허위기재라고 의심되는 경우에는 사전 양해없이 삭제될 수
								있습니다.</span><br> <span>&nbsp;&nbsp;(단, 복제품일 경우 그 내용을 반드시
								기재한 경우에 한해 등록 가능 합니다.)</span>
					</div>

					<h3>전자 상거래에서 소비자를 어떻게 보호해주나요?</h3>
					<div>

						<span style="font-weight: bold">제15조 (재화등의 공급 등)</span><br> <span>①통신판매업자는
							소비자가 청약을 한 날부터 7일 이내에 재화등의 공급에 필요한 조치를 하여야 하고, 소비자가 재화등을 공급받기 전에
							미리 재화등의 대금의 전부 또는 일부를 지급하는 경우(이하 "선불식 통신판매"라 한다)에는 소비자가 그 대금의 전부
							또는 일부를 지급한 날부터 3영업일 이내에 재화등의 공급을 위하여 필요한 조치를 하여야 한다. 다만, 소비자와
							통신판매업자간에 재화등의 공급시기에 관하여 별도의 약정이 있는 경우에는 그러하지 아니하다.</span><br> <span>②통신판매업자는
							청약을 받은 재화등을 공급하기 곤란하다는 것을 알았을 때에는 그 사유를 소비자에게 지체 없이 알려야 하고, 선불식
							통신판매의 경우에는 소비자가 그 대금의 전부 또는 일부를 지급한 날부터 3영업일 이내에 환급하거나 환급에 필요한
							조치를 하여야 한다.</span><br> <span>③통신판매업자는 소비자가 재화등의 공급 절차 및 진행
							상황을 확인할 수 있도록 적절한 조치를 하여야 한다. 이 경우 공정거래위원회는 그 조치에 필요한 사항을 정하여 고시할
							수 있다. </span><br> <span>④제18조제1항 내지 제5항의 규정은 제2항의 선불식 통신판매에
							있어서 환급하거나 환급에 필요한 조치를 하여야 하는 경우에 이를 준용한다.</span>
						<p>

							<span style="font-weight: bold">제17조(청약철회등)</span><br> <span>①통신판매업자와
								재화등의 구매에 관한 계약을 체결한 소비자는 다음 각호의 기간(거래당사자가 다음 각호의 기간보다 긴 기간으로 약정한
								경우에는 그 기간을 말한다) 이내에 당해 계약에 관한 청약철회등을 할 수있다.</span><br> <span>1.
								제13조제2항의 규정에 의한 계약내용에 관한 서면을 교부받은 날부터 7일. 다만, 그 서면을 교부 받은 때보다
								재화등의 공급이 늦게 이루어진 경우에는 재화등의 공급을 받거나 공급이 개시된 날부터 7일</span><br> <span>2.
								제13조제2항의 규정에 의한 계약내용에 관한 서면을 교부 받지 아니한 경우, 통신판매업자의 주소 등이 기재되지
								아니한 서면을 교부 받은 경우 또는 통신판매업자의 주소변경 등의 사유로 제1호의 기간 이내에 청약철회등을 할 수
								없는 경우에는 그 주소를 안 날 또는 알 수 있었던 날부터 7일</span><br> <span>②소비자는
								다음 각호의 1에 해당하는 경우에는 통신판매업자의 의사에 반하여 제1항의 규정에 의한 청약철회등을 할 수 없다.
								다만, 통신판매업자가 제6항의 규정에 따른 조치를 하지 아니하는 때에는 제2호 내지 제4호에 해당하는 경우에도
								청약철회등을 할 수 있다.</span><br> <span>1. 소비자에게 책임 있는 사유로 재화등이 멸실
								또는 훼손된 경우. 다만, 재화등의 내용을 확인하기 위하여 포장 등을 훼손한 경우를 제외한다.</span><br> <span>2.
								소비자의 사용 또는 일부 소비에 의하여 재화등의 가치가 현저히 감소한 경우</span><br> <span>3.
								시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</span><br> <span>4.
								복제가 가능한 재화 등의 포장을 훼손한 경우</span><br> <span>5. 그 밖에 거래의 안전을
								위하여 대통령령이 정하는 경우</span><br> <span>③소비자는 제1항 및 제2항의 규정에 불구하고
								재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 경우에는 당해 재화등을 공급받은 날부터 3월
								이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회등을 할 수 있다.</span><br> <span
								style="font-weight: bold">제18조(청약철회등의 효과)</span><br> <span>①소비자는
								제17조제1항 또는 제3항의 규정에 의하여 청약철회등을 행한 경우에는 이미 공급받은 재화등을 반환하여야 한다.</span><br>
							<span>②통신판매업자(소비자로부터 재화등의 대금을 지급 받은 자 또는 소비자와 통신판매에 관한 계약을
								체결한 자를 포함한다. 이하 제2항 내지 제10항에서 같다)는 재화등을 반환 받은 날부터 3영업일 이내에 이미 지급
								받은 재화등의 대금을 환급하여야 한다. 이 경우 통신판매업자가 소비자에게 재화등의 대금의 환급을 지연한 때에는 그
								지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자(이하 "지연배상금"이라
								한다)를 지급하여야 한다.</span><br> <span>⑨제17조제1항의 규정에 의한 청약철회등의 경우
								공급받은 재화등의 반환에 필요한 비용은 소비자가 이를 부담하며 통신판매업자는 소비자에게 청약철회등을 이유로 위약금
								또는 손해배상을 청구할 수 없다.</span><br> <span>⑩제17조제3항의 규정에 의한 청약철회등의
								경우 재화등의 반환에 필요한 비용은 통신판매업자가 이를 부담한다.</span><br>
					</div>

					<h3>물품 등록은 어떻게 하나요?</h3>
					<div>
						<span><h4>Value + 물품 등록 방법</h4></span> <span>1. Value + 사이트
							로그인 후, 사이트 좌측에 홈페이지 로고를 클릭 후 <font
							style="font-weight: bold; color: #01DFA5">[물품 등록 버튼]</font>을 클릭해
							주세요.
						</span><br> <span>2. <font
							style="font-weight: bold; color: #01DFA5">[카테고리 설정]</font></span><br>
						<span>&nbsp;&nbsp; 등록하는 물품의 종류를 확인 후, 올바른 카테고리에 등록을 해주세요.</span><br>
						<span>3. <font style="font-weight: bold; color: #01DFA5">[경매
								상품 정보 등록]</font></span><br> <span>&nbsp;&nbsp; 상품제목, 상품설명, 사진 등 경매
							진행에 필요한 정보를 입력해주세요.</span><br> <span>4. <font
							style="font-weight: bold; color: #01DFA5">[경매 설정]</font></span><br>
						<span>&nbsp;&nbsp; 시작가, 입찰단위, 경매 기간등을 직접 선택할 수 있습니다.</span><br>
						<span>5. <font style="font-weight: bold; color: #01DFA5">[상품
								등록하기]</font> 버튼을 클릭해 주시면 물품이 등록됩니다.
						</span><br>

					</div>


					<h3>회원 탈퇴 신청은 어디서 하나요?</h3>
					<div>
						<p>
						<h5>회원 탈퇴</h5>
						</p>
						<span><font style="font-weight: bold; color: #cc0000;">[마이페이지>
								나의정보수정> 회원탈퇴]</font> 버튼 클릭 후 신청하실 수 있습니다.</span><br> <span>탈퇴
							신청시에는 Value+ 약관에 따라 처리되오니 신중히 결정하여 주시기 바랍니다.</span>
						<p>

							<span><font style="font-weight: bold;">[개인정보관리]</font></span><br>
							<span><font style="font-weight: bold;">거래내역이 없는 경우:</font>
								탈퇴일로부터 6개월 이후 모든 개인정보 삭제. 단 ip는 영구 보관.</span><br> <span><font
								style="font-weight: bold;">거래내역이 있는 경우:</font> 개인정보(이름, 거래정보,
								결제정보, 신용도) 탈퇴일로부터 5년간 보관.</span>
						<p>

							<span><font style="font-weight: bold;">[재가입 및 아이디
									사용]</font></span><br> <span><font
								style="font-weight: bold; color: #cc0000;">탈퇴 후 6개월 이후
									재가입이 가능합니다. </font>(단 사이트제한 상태에서 탈퇴한 경우 제외.)</span><br> <span>탈퇴
								전 사용하였던 아이디는 다시 사용하실 수 없습니다.</span>
						<p>

							<span><font style="font-weight: bold;">[탈퇴가 불가한 경우]</font></span><br>
							<span><font style="font-weight: bold; color: #cc0000;">진행중인
									물품</font>(판매/구매/입찰)이 있는 경우 탈퇴신청이 불가능합니다.</span><br>
					</div>

					<h3>아이디와 비밀번호를 잊어버렸어요.</h3>
					<div>
						<span> Value+ 좌측 홈페이지 로고 클릭 후 나오는 사이드 하단에 <font
							style="font-weight: bold">[계정을 잊어버리셨나요?]</font>를 클릭하시고,
						</span><br> <span> 해당 메뉴를 선택하신 후 인증 절차를 거쳐 단계별 요청 정보를 입력하여
							확인하시기 바랍니다.</span>
					</div>

					<h3>경매진행중에 물품에 대한 궁금한 내용은 어떻게 문의를 하나요?</h3>
					<div>
						<span> 판매글 <font style="font-weight: bold;">[상품정보]</font>
							페이지에<font style="font-weight: bold;"> [1:1 문의] </font>를 통해서 판매자와
							실시간 채팅으로 문의가 가능합니다.
						</span><br> <span>* 해당 채팅 내역은 페이지 우측 하단에 채팅 아이콘을 통해 확인이
							가능합니다.</span>
					</div>

				</div>
			</div>



		</div>


		<div id="selectNotice_wrap">
			<div id="selectNotice">
				<div class="selectNotice_pop"></div>
			</div>
		</div>
	</div>

</body>
</html>