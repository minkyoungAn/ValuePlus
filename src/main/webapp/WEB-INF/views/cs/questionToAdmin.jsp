<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
<head>
<title>Value+</title>
<sec:authentication property="principal" var="vo" />
<script>
   $(document)
         .ready(
               function() {
                  $("#MToM")
                        .click(
                              function() {
                                 var data = "";
                                 data = "<form id='questionForm' method='post'>";
                                 data += "<ul>";
                                 data += "<li>FAQ 검색에서 원하는 내용을 검색하시면 즉시 답변을 얻을 수 있습니다.</li>";
                                 data += "<li>물품문의는 판매자에게 해주시기 바랍니다.</li>";
                                 data += "<li>답변은 마이페이지>나의 문의내역에서 확인가능합니다</li>";
                                 data += "</ul>";
                                 data += "작성자 ID : <input type='text' id='questionId' value='${vo.id}' readonly='readonly'/>";
                                 data += "<hr>"
                                 data += "질문 제목  : <input type='text' id='questionTitle'/>";
                                 data += "<hr>"
                                 data += "질문 내용  : <input type='text' id='questionContent'/>";
                                 data += "<hr>"
                                 data += "24시간내에 관리자가 답변을 할 예정입니다.<br>";
                                 data += "<input type='submit' id='insertQuestion' value='문의하기'>";
                                 data += "<input type='reset' id='cancleQuestion' value='취소하기'>";
                                 data += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>";
                                 data += "</form>"
                                 $("#title").html(data);
                              });
               });
   //문의하기 버튼 기능 
   $(document)
         .on(
               "click",
               "#insertQuestion",
               function() {
                  if($("#questionTitle").val().trim()==""){
                     alert("제목을 입력하세요");
                     $("#questionTitle").focus();
                     return false;
                  }
                  if($("#questionContent").val().trim()==""){
                     alert("내용을 입력하세요");
                     $("#questionContent").focus();
                     return false;
                  }
                  $
                        .ajax({
                           type : "POST",
                           url : "${pageContext.request.contextPath}/questionToAdmin2",
                           data : "${_csrf.parameterName}=${_csrf.token}&&userId="
                                 + $("#questionId").val()
                                 + "&&questionTitle="
                                 + $("#questionTitle").val()
                                 + "&&questionContent="
                                 + $("#questionContent").val(),
                           dataType : "text",
                           success : function(result) {
                              alert("문의 성공");
                              //location.href = "${pageContext.request.contextPath}/questionToAdmin";
                           }//function
                        });//ajax
               });
</script>
</head>
<style>
.qa_container {
   width: 100%;
   height: 800px;
   float: left;
}

#title {
   width: 70%;
   height: 100%:
}

.qa_container_txt {
   float: left;
   width: 100%;
   height: 140px;
   border: 1px solid rgba(245, 245, 245, 0.7);
   background: rgba(240, 240, 240, 0.8);
   padding: 30px;
   box-sizing: border-box;
}

.qa_container_txt span {
   margin-left: 20px;
}

.qa_container_form {
   width: 100%;
   height: 300px;
   float: left;
   margin-top: 50px;
}

.qa_container_form>input {
   width: 120px;
   height: 50px;
   margin-top: 20px;
   margin-left: 230px;
   color: black;
   background-color: white;
   border: 1px solid rgba(0, 0, 0, 0.1);
   cursor: pointer;
}

.form_tr_1 {
   width: 100%;
   height: 50px;
   float: left;
   margin-top: 10px;
}

.form_tr_1 span {
   width: 15%;
   height: 50px;
   float: left;
   line-height: 50px;
   text-align: center;
}

.form_tr_1>input {
   width: 85%;
   height: 50px;
   float: left;
   border-bottom: 2px solid rgba(0, 0, 0, 0.1);
   padding-left: 10px;
   box-sizing: border-box;
}

.form_tr_2 {
   width: 100%;
   height: 50px;
   float: left;
   margin-top: 10px;
}

.form_tr_2 span {
   width: 15%;
   height: 50px;
   float: left;
   line-height: 50px;
   text-align: center;
}

.form_tr_2>input {
   outline: none;
   height: 50px;
   float: left;
   border-bottom: 2px solid rgba(0, 0, 0, 0.1);
   width: 85%;
   padding-left: 10px;
   box-sizing: border-box;
}

.form_tr_3 {
   width: 100%;
   height: 300px;
   float: left;
   margin-top: 10px;
}

.form_tr_3 span {
   width: 15%;
   height: 50px;
   float: left;
   line-height: 50px;
   text-align: center;
}

.form_tr_3>textarea {
   outline: none;
   height: 280px;
   float: left;
   border-bottom: 2px solid rgba(240, 240, 240, 0.1);
   background: rgba(240, 240, 240, 0.4);
   padding: 10px;
   box-sizing: border-box;
   width: 85%;
}

.qa_container_title {
   width: 100%;
   height: 70px;
   float: left;
   text-align: center;
   line-height: 70px;
   text-align: center;
   margin-bottom: 50px;
}
</style>
<body>
   <div class="qa_container_title">
      <h1>1 대 1 문의하기</h1>
   </div>
   <div class="qa_container">
      <div id="title">
         <form id='questionForm' name="questionForm" method='post'>
            <div class="qa_container_txt">
               <i class="fa fa-check-circle" aria-hidden="true"></i><span>FAQ
                  검색에서 원하는 내용을 검색하시면 즉시 답변을 얻을 수 있습니다.</span><br> <i
                  class="fa fa-check-circle" aria-hidden="true"></i><span>물품문의는
                  판매자에게 해주시기 바랍니다.</span><br> <i class="fa fa-check-circle"
                  aria-hidden="true"></i><span>답변은 마이페이지>나의 문의내역에서 확인가능합니다</span><br>
            </div>

            <div class="qa_container_form">
               <div class="form_tr_1">
                  <span>작성자 ID : </span><input type='text' id='questionId'
                     value='${vo.id}' readonly='readonly' />
               </div>
               <div class="form_tr_2">
                  <span>질문 제목 : </span><input type='text' id='questionTitle' />
               </div>
               <div class="form_tr_3">
                  <span>질문 내용 :</span>
                  <textarea id='questionContent' /></textarea>
               </div>

               <p>24시간내에 관리자가 답변을 할 예정입니다.</p>
               <input type='submit' id='insertQuestion' value='문의하기'> <input
                  type='reset' id='cancleQuestion' value='취소하기'> <input
                  type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />
            </div>
         </form>
      </div>
   </div>
</body>
</html>