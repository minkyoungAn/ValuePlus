<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/costomer/join.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var checkResultId="";		
	$(".join_submit").submit(function(){			
		if($("#form :input[name=id]").val().trim()==""){
			alert("아이디를 입력하세요");	
			document.getElementById("id").focus();
			return false;
		}
		//아이디에 공백 사용하지 않기
        if (document.form.id.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.");
            document.getElementById("id").focus();
            document.getElementById("id").select();
            return false;
        }
        //아이디 길이 체크 (4~12자)
        if (document.form.id.value.length<4 || document.form.id.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.");
            document.form.id.focus();
            document.form.id.select();
            return false;
        }
     	 //입력된 문자의 길이만큼 루프를 돌면서 검사 
        for (i=0; i<document.form.id.value.length; i++)
        {
               var ch = document.form.id.value.charAt(i);//문자를 반환(정수형), 범위 검사 가능
               //입력된 문자를 검사
               if (( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" )) 
               { 
                alert("아이디는 영문 소문자로만 입력 가능 합니다!");
                document.form.id.select();
                return false;
               }
        }
       
        //입력된 첫번째 문자가 숫자인지 검사하는 조건문
        if (!isNaN(document.form.id.value.substr(0,1)))
        {
             alert("아이디는 숫자로 시작할 수 없습니다!");
             document.form.id.select();
             return false;
        }
        if (document.form.pw.value == document.form.id.value) {
            alert("아이디와 비밀번호가 같습니다.");
            document.form.pw.focus();
            return false;
        }
        
		if($("#form :input[name=pw]").val().trim()==""){
			alert("패스워드를 입력하세요");	
			document.getElementById("pw").focus();
			return false;
		}
		 //비밀번호와 비밀번호 확인 일치여부 체크
        if (document.form.pw.value != document.form.pw1.value) {
            alert("비밀번호가 일치하지 않습니다");
            document.form.pw1.value = "";
            document.form.pw1.focus();
            return false;
        }
		if($("#form :input[name=name]").val().trim()==""){
			alert("이름을 입력하세요");
			document.getElementById("name").focus();
			return false;
		}
		if($("#form :input[name=roadAddrPart1]").val().trim()==""){
			alert("주소를 입력하세요");				
			return false;
		}
		if($("#form :input[name=addrDetail]").val().trim()==""){
			alert("상세 주소를 입력하세요");				
			return false;
		}
		if($("#form :input[name=zipNo]").val().trim()==""){
			alert("우편 번호를 입력하세요");				
			return false;
		}
		if($("#form :input[name=birth]").val().trim()==""){
			alert("생년월일을 입력하세요");		
			document.getElementById("birth").focus();
			return false;
		}	
		 // 숫자가 아닌 것을 입력한 경우
        if (!isNumeric(document.form.birth.value)) {
          alert("주민번호는 숫자로 입력하세요.");
          document.form.birth.value = "";
          document.form.birth.focus();
          return false;
        }
		if($("#form :input[name=phone]").val().trim()==""){
			alert("핸드폰 번호를 입력하세요");
			document.getElementById("phone").focus();
			return false;
		}	
		 // 숫자가 아닌 것을 입력한 경우
        if (!isNumeric(document.form.phone.value)) {
          alert("핸드폰 번호는 숫자만 입력하세요.");
          document.form.phone.value = "";
          document.form.phone.focus();
          return false;
        }
		 if($("#emailCheck").val()!="인증 완료"){
			alert("이메일 인증을 하세요");
			document.getElementById("email").focus();
			return false;
		}
	});//submit
	 
	$(document).ready(function(){		
		$("#zipNo").click(function(){
			$("#roadSearch").trigger("click");
			});
		$("#roadAddrPart1").click(function(){
			$("#roadSearch").trigger("click");
			});
		})
	$("#pw1,#pw").keyup(function(){
		var pw1 = $("#pw1").val();
		var pw = $("#pw").val();
		if(pw1 != pw){
			$("#pw1").parent().css({"border":" 2px solid  rgba(255, 0, 0, 0.5)"});
			$("#pw1").css({"color":" rgba(255, 0, 0, 0.5)"});
			$("#pw").parent().css({"border":" 2px solid  rgba(255, 0, 0, 0.5)"});
			$("#pw").css({"color":" rgba(255, 0, 0, 0.5)"});
		}if(pw == pw1){
			$("#pw1").parent().css({"border":" 2px solid rgba(0, 191, 0, 0.5)"});
			$("#pw1").css({"color":" rgba(0, 191, 0, 0.5)"});
			$("#pw").parent().css({"border":" 2px solid rgba(0, 191, 0, 0.5)"});
			$("#pw").css({"color":" rgba(0, 191, 0, 0.5)"});
		}
	});
	$("#form :input[name=id]").keyup(function(){
		var id=$(this).val().trim();
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/idcheckAjax",				
		data:"${_csrf.parameterName}=${_csrf.token}&&id="+id,	
		success:function(data){						
			if(data=="fail"){
			$(".join_id").css({"border":" 2px solid  rgba(255, 0, 0, 0.5)"});
			$(".join_id>input").css({"color":" rgba(255, 0, 0, 0.5)"});
			$(".join_id>.id_chk").val("Ⅹ").css({"color":"white","background-color":"rgba(255, 0, 0, 0.5)"});
			}else{						
				$(".join_id").css({"border":" 2px solid  rgba(0, 191, 0, 0.5)"});
				$(".join_id>input").css({"color":" rgba(0, 191, 0, 0.5)"});
				$(".join_id>.id_chk").val("Ⅴ").css({"color":"white","background-color":"rgba(0, 191, 0, 0.5)"});
				}					
			}//callback			
		});//ajax
	});
	$(".join_address_email").keyup(function(){
		$(".join_address_email").css({"border":" 2px solid  #01DFA5"});
		$(".email_btn").css({"background-color":"#01DFA5"});
	});
	$(".join_address_email").keydown(function(){
		$(".join_address_email").css({"border":" 2px solid  rgba(0, 0, 0, 0.1);"});
		$(".email_btn").css({"background-color":"rgba(0, 0, 0, 0.1);"});
	});
});//ready
function emailPopup(){
	var email = document.getElementById("email").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(email)==false){
			alert("이메일 형식이 올바르지 않습니다.");

		}else if(email == null || email == ""){
			alert("이메일을 입력해주세요.");
		}else{
			var popup = window.open("/controller/emailAuth?email="+$("#email").val() + "&toat='id'","pop2","width=645,height=306,top= 200 ,left=350");
		}
}
	
var pop;
function goPopup(){
	pop = window.open("/controller/jusoPopup?${_csrf.parameterName}=${_csrf.token}","pop","width=530,height=300, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
		pop.close();
	}
	

	function focus(num) {
		num = num.replace(/[^0-9]/g, '');
		$("#phone").val(num);
	}
	function blur(num) {
		num = num.replace(/[^0-9]/g, '');
		var tmp = '';
		tmp += num.substr(0, 3);
		tmp += '-';
		tmp += num.substr(3, 4);
		tmp += '-';
		tmp += num.substr(7);
		$("#phone").val(tmp);
	}
	$(document).ready(function(){ 
	    $("#phone").blur(function(){
	    	var num = $("#phone").val();
	    	blur(num);
	    });

	    $("#phone").click(function(){
	    	var num = $("#phone").val();
	    	focus(num);
	    });
	});
	
	function onlyNumber(){
        if ((event.keyCode < 48) || (event.keyCode > 57)) {
           alert("숫자만 입력해주세요");
           var str = document.getElementById("birth").value;
           document.getElementById("birth").value = str.slice(0,-1);
           document.getElementById("birth").focus();
        }
	}
</script>
</head>
<body>
	<img id="backImg"
		src="//t1.daumcdn.net/brunch/static/img/help/pc/bg_signin_02.jpg">
	<div class="backImg_wrap"></div>
	<div class="join_wrap">
		<div class="join_form">
			<div class="join_form_main">
				<h3>가입하기</h3>
				<p>복잡한 절차 없이 간편하게 Value+를 만나보세요!</p>
				<form name="form" id="form"
					action="${pageContext.request.contextPath}/join" method="post"
					class="form">
					<div class="join_id input_join">
						<input type="text" name="id" id="id" placeholder="ID"> <input
							type="text" readonly="readonly" class="id_chk" value="..">
					</div>
					<div class="join_address_btn input_join">
						<input type="button" onClick="goPopup();" value="도로명주소 검색" id="roadSearch">
					</div>
					<div class="join_pw input_join">
						<input type="password" name="pw" id="pw" placeholder="PASSWORD">
					</div>
					<div class="join_address input_join">
						<input type="text" value="우편번호" id="zipNo" name="zipNo"
							readonly="readonly" />
					</div>
					<div class="join_pw input_join">
						<input type="password" name="pw1" id="pw1"
							placeholder="PASSWORD 확인">
					</div>
					<div class="join_address input_join">
						<input type="text" id="roadAddrPart1" name="roadAddrPart1"
							size="60" readonly="readonly" value="도로명주소 " />

					</div>
					<div class="join_name input_join">
						<input type="text" name="name" placeholder="NAME">
					</div>

					<div class="join_address input_join">
						<input type="text" id="addrDetail" name="addrDetail" size="60"
							readonly="readonly" value="상세주소" />
					</div>
					<div class="join_birth input_join">
						<input type="text" name="birth" id="birth" maxlength="6" onkeypress="onlyNumber()" 
							placeholder="주민번호 앞 6자리 ">
					</div>


					<div class="join_address_email input_join">
						<input type="email" name="email" id="email" placeholder="EMAIL">
						<input type="button" class="email_btn" onClick="emailPopup();"
							value="Ⅴ">
					</div>
					<div class="join_phone input_join">
						<input type="text" name="phone" id="phone" maxlength="11"
							placeholder="PHONE">
					</div>
					<div class="join_address_email_chk input_chk">
						<input type="text" id="emailCheck" readonly="readonly" />
					</div>

					<div class="join_button">
						<input type="submit" value="join" class="join_submit"><input
							type="reset" class="join_reset" value="reset">
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

				</form>
			</div>
		</div>

	</div>

</body>
</html>













