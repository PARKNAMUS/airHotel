<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width:90%;margin-left:10%;font-family: 'Jua', sans-serif;color:black;">
		<div style="font-size:40px;margin-top:10%;"><h1>이전 예약자 리스트</h1></div>
		<div style="margin-top:10%;margin-left:0%;">
			<c:forEach items="${resList }" var="item">
			<div style="margin-bottom:5%;float:left;font-size:20px;margin-left:5%;">
				<c:choose>
					<c:when test="${item.customer_image == 'none'}">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;border-radius:70%;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/cnc/display.do?name=${item.customer_image}" style="width:64px;height:64px;border-radius:70%;"><!-- db에서 받아온 이미지 -->
					</c:otherwise>
				</c:choose>
				<c:if test="${item.customer_image eq null || item.customer_image eq '' }">
					
				</c:if> 
				<a onclick="openChat('${item.reservation_customer_id}')">${item.customer_name }(${item.reservation_customer_id})</a>
				<b style="margin-left:43%;" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)" onclick="openBlame('${login_session}','${item.reservation_customer_id}')">신고</b>
				<br><br>
				<b>전화번호: ${item.customer_phone }</b>&nbsp;&nbsp;<b>이메일: </b><a href="mailto:${item.customer_email}" style="display:initial;">${item.customer_email }</a><br><br>
				<b>예약날짜: ${item.reservation_regdate }</b><br><br>
				<b>체크인 시간:${item.reservation_check_in }</b>&nbsp;&nbsp;<b>체크아웃 시간:${item.reservation_check_out }</b>
				<hr>		
			</div>
			</c:forEach>
		</div>
		<div style="clear: both;"></div>
		<button class="btn btn-outline-danger" style="font-size:30px;margin-top:5%;margin-left:3%" onclick="self.close()">닫기</button>
	</div>
</body>
<script type="text/javascript">
var openBlame = function(id,target){
	var url = "blameCustomerPage.do?blame_member_id="+id+"&blame_target_member_id="+target
	 window.open(url ,"blameForm",
     "toolbar=no, width=660, height=370, directories=no, status=no,scrollorbars=no, resizable=no");
}
</script>
</html>