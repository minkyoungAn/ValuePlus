<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오페이</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div id="kakaoWrap" class="wrap_demo">
<header id="kakaoHead">
<h1 class="tit_kakaopay">
카카오페이
</h1>
<hr class="hide"/>
<main id="kakaoContent">
<article id="mArticle">
<h2 id="kakaoBody" class="tit_demo">
Payment Demo
</h2>
<p class="txt_demo">
API를 활용한 카카오페이 결제
</p>
<div class="pay_btn">
<input type="button" class="btn_pay btn_pay_hover" value="PC 결제" id="web" onclick="payment('web');"><br>
<input type="button" value="test" id="test" onclick="payTest();">

	<div>
	상품 번호 : <input type="text" id="productNo" name="productNo" value="${param.productNo}" readonly="readonly"/>
	</div>
	<div>
	가격 : <input type="text" id="price" name="price" value="${param.price}" readonly="readonly"/>
	</div>
	<div>
	<input type="button" id="closeBtn" value="닫기" onclick="window.close()"/>
	</div>
</div>
</article>
</main>
<script type='text/javascript'>
    function payment(agent){
    	var windowReference = window.open('${pageContext.request.contextPath}/info', 'payment_popup', 'width=426,height=510,toolbar=no,location=no');
    		request.setAttribute("productNo",$("#productNo").val());
    		request.setAttribute("price",$("#price").val());
        var request = $.ajax({ 
            url: '/info/'+agent+'/ready',
            method: 'GET',
            dataType: 'json'
        });
        request.done(function( data ) {
            if(agent === 'web'){
                location.href = data.next_redirect_pc_url;
            }
        });
        request.fail(function( jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });
    }
</script>

<body>

</body>
</html>