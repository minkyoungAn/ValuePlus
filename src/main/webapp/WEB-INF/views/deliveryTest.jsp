<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){	
	 var target = document.getElementById("deilverySelect");
			$("#deliveryTest").click(function(){
					if(target.options[target.selectedIndex].value=="searchCategory"){
						alert("카테고리를 선택하세요.");
						document.getElementById("deilverySelect").focus();
						return false;
			}
			if($("#deliveryNo").val().trim()==""){
					alert("검색어를 입력하세요");
					document.getElementById("deliveryNo").focus();
					return false;
			}
			if(target.options[target.selectedIndex].value=="우체국택배"){
				window.open("http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="CJ대한통운택배"){
				window.open("http://nexs.cjgls.com/web/info.jsp?slipno="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="현대택배"){
				window.open("http://www.hlc.co.kr/hydex/jsp/tracking/trackingViewCus.jsp?InvNo="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="한진택배"){
				window.open("http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="로젠택배"){
				window.open("http://d2d.ilogen.com/d2d/delivery/invoice_tracesearch_quick.jsp?slipno="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="옐로우캡"){
				window.open("http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			
			if(target.options[target.selectedIndex].value=="대신택배"){
				window.open("http://home.daesinlogistics.co.kr/daesin/jsp/d_freight_chase/d_general_process2.jsp?billno1="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="편의점택배"){
				window.open("http://www.doortodoor.co.kr/jsp/cmn/TrackingCVS.jsp?pTdNo="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="KGB택배"){
				window.open("http://www.kgbls.co.kr//sub5/trace.asp?f_slipno="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="일양로지스"){
				window.open("http://www.ilyanglogis.com/functionality/card_form_waybill.asp?hawb_no="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="천일택배"){
				window.open("http://www.cyber1001.co.kr/kor/taekbae/HTrace.jsp?transNo="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="용마로지스"){
				window.open("http://www.gtxlogis.co.kr/tracking/default.asp?awblno="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
			if(target.options[target.selectedIndex].value=="퀵퀵닷컴"){
				window.open("http://www.quickquick.com/q/MTrack.php?hawb="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
			}
		});
 });
 $(document).ready(function(){	
	 var target = document.getElementById("deilverySelect2");
			$("#deliveryTest2").click(function(){
					if(target.options[target.selectedIndex].value=="searchCategory"){
						alert("카테고리를 선택하세요.");
						document.getElementById("deilverySelect2").focus();
						return false;
			}
			if($("#deliveryNo2").val().trim()==""){
					alert("검색어를 입력하세요");
					document.getElementById("deliveryNo2").focus();
					return false;
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/insertDelivery",
				data:"${_csrf.parameterName}=${_csrf.token}&&deliveryCompany="+target.options[target.selectedIndex].value+"&&deliveryNo="+$("#deliveryNo2").val(),			
				dataType:"json",
				success:function(result){	
					 alert("성공");					
				}//function
			});//ajax
			
		});
 });
 
 
 $(document).ready(function(){		
		$("#deliverySelect").click(function(){				
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/selectDeliveryByNo",
				data:"${_csrf.parameterName}=${_csrf.token}",
				dataType:"json",
				success:function(result){
					 var data="<table cellpadding='5'><tr><th>운송 회사</th><th>운송장 번호</th></tr>";
					 $.each(result, function(index, item){
						 data+="<tr>";
						    data+="<td>"+item.deliveryCompany+"</td>";
							data+="<td><a href='#' id='delivery'>"+item.deliveryNo+"</a></td>";
							data+="</tr>";
					 }); 
					data+="</table>";
					$("#deliveryResult").html(data);
					$("#deliveryResult").css("display", "none");
					$("#delivery").trigger("click");
				}//function
			});//ajax
		});//click
	});//jquery
	
	
	
	$(document).on("click","#delivery",function(){
		var code = $(this).parent().parent().children("td:first").text();
		var code2 = $(this).parent().parent().children("td:first").next().text();
		alert(code+"   "+code2)
		if(code=="우체국택배"){
				window.open("http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="CJ대한통운택배"){
			window.open("http://nexs.cjgls.com/web/info.jsp?slipno="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="현대택배"){
			window.open("http://www.hlc.co.kr/hydex/jsp/tracking/trackingViewCus.jsp?InvNo="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="한진택배"){
			window.open("http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="로젠택배"){
		window.open("http://d2d.ilogen.com/d2d/delivery/invoice_tracesearch_quick.jsp?slipno="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="옐로우캡"){
			window.open("http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="대신택배"){
			window.open("http://home.daesinlogistics.co.kr/daesin/jsp/d_freight_chase/d_general_process2.jsp?billno1="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="편의점택배"){
		window.open("http://www.doortodoor.co.kr/jsp/cmn/TrackingCVS.jsp?pTdNo="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="KGB택배"){
			window.open("http://www.kgbls.co.kr//sub5/trace.asp?f_slipno="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="천일택배"){
			window.open("http://www.cyber1001.co.kr/kor/taekbae/HTrace.jsp?transNo="+$("#deliveryNo").val(),"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="일양로지스"){
			window.open("http://www.ilyanglogis.com/functionality/card_form_waybill.asp?hawb_no="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="용마로지스"){
			window.open("http://www.gtxlogis.co.kr/tracking/default.asp?awblno="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
		if(code=="퀵퀵닷컴"){
		window.open("http://www.quickquick.com/q/MTrack.php?hawb="+code2,"pop","width=570,height=420, scrollbars=yes, resizable=yes");
		}
	});//click

</script>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
<select name="deilverySelect" id="deilverySelect">
  					<option value="searchCategory" selected>---운송회사---</option>      
                    <option value="우체국택배" >우체국택배</option>
                    <option value="CJ대한통운택배">CJ대한통운택배</option>
                    <option value="현대택배" >현대택배</option>
                    <option value="한진택배" >한진택배</option>
					<option value="로젠택배" >로젠택배</option>
                    <option value="옐로우캡">옐로우캡</option>
                    <option value="대신택배" >대신택배</option>
					<option value="편의점택배" >편의점택배</option>
                    <option value="KGB택배">KGB택배</option>
                    <option value="천일택배">천일택배</option>
                    <option value="일양로지스" >일양로지스</option>
					<option value="용마로지스">용마로지스</option>
					<option value="퀵퀵닷컴" >퀵퀵닷컴</option>
</select>
운송장 번호 입력<input type="text" id="deliveryNo"/><input type="button" id="deliveryTest" value="전송">
</form>

<div id="insertDeliveryNo">
<form id="form2" name="form2" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
<select name="deilverySelect2" id="deilverySelect2">
  					<option value="searchCategory2" selected>---운송회사---</option>      
                    <option value="우체국택배" >우체국택배</option>
                    <option value="CJ대한통운택배">CJ대한통운택배</option>
                    <option value="현대택배" >현대택배</option>
                    <option value="한진택배" >한진택배</option>
					<option value="로젠택배" >로젠택배</option>
                    <option value="옐로우캡">옐로우캡</option>
                    <option value="대신택배" >대신택배</option>
					<option value="편의점택배" >편의점택배</option>
                    <option value="KGB택배">KGB택배</option>
                     <option value="천일택배">천일택배</option>
                    <option value="일양로지스" >일양로지스</option>
					<option value="용마로지스">용마로지스</option>
					<option value="퀵퀵닷컴" >퀵퀵닷컴</option>
</select>
운송장 번호 입력<input type="text" id="deliveryNo2"/>
<input type="button" id="deliveryTest2" value="입력">
</form>
</div>
  <input type="button" value="배송 조회" id="deliverySelect"> 
  <div id="deliveryResult">
  </div>
</body>
</html>