<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 ?memberId=${sessionScope.member.memberId }</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container">
   <div id="mypageArea" style="margin: 0 auto; margin: 50px; height:500px; text-align:center; border: 1px solid  #E4E8EB;">
   <label style="margin-top:200px;display: inline-flex;">비밀번호 확인 : <input type="password" id="checkPw2" class="form-control input-lg"></label>
   <input type="hidden" value="${m.memberId}" id="memberId">
   <input type="button" class="btn btn-lg btn-primary btn-lg signup-btn" id="success" value="확인">
   <button class="btn btn-lg btn-summarry btn-lg signup-btn" onclick="location.href='/''">홈으로</button>
   <p id="result" style="color:red;"></p>
   </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	$("#success").click(function() { 
		var memberPw = $("#checkPw2").val();
		var memberId = $("#memberId").val();
		$("#result").html("");
		var user = { 
				memberPw : memberPw,
				memberId : memberId};
		$.ajax({
			url : "/checkPw",
			type : "get",
			data : user,
			success:function(data) {
				if (data == false) {
					$("#result").html("비밀번호가 틀렸습니다");
				}
			}
		});
	});
</script>
</html>