<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css?version=123">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css?version=123">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">
body {
  font-family: "Jua", sans-serif;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<title>Insert title here</title>
</head>
<body>
	<c:if test="${login_session == null }">
		<script type="text/javascript">location.href ='loginView.do'</script>
	</c:if>
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" style="float:left;">
				<ul id="menuItems">	
						<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
				</ul>
			</div>
			<div style="width:50px;height:50px;margin-left:25px;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<c:choose>
					<c:when test="${my_image == null }">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="max-width:120%;max-height:120%;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/cnc/display.do?name=${my_image }" style="max-width:120%;max-height:120%;">
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:83%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
					<li><br></li>
						<li style="margin-bottom:20px;"><a href="mypage.do">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="passwordChangeView.do">비밀번호 변경</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
					<c:choose>
						<c:when test="${social_type ne null}">
						<li style="margin-bottom:20px;"><a href="kakaologout.do">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li ><br></li>
					</ul>
		</div>
	</header>
	<script type="text/javascript">
		$(function(){
			$("#myinfo").click(function(){
				$("#mydiv").fadeToggle("slow");
			})
		})
	</script>

	<div style="clear:both;"></div>
	
	<%@include file="../html/sideMenu.jsp" %>
	
	<div class="headdiv">
		<h1 style="font-size:40px;margin-left:3%;font-family: 'Jua', sans-serif;">나의 채팅</h1>
		<div style="margin-left:50%;"><button class="btn btn-danger" style="font-size:20px;" onclick="location.href='goToCommentsList.do'">후기 / 추천 보기</button></div>
	</div>
	<div class="chatdiv">
		<div id="chatbox">
			<div id="chatelement" onclick="openChat('message.do?message_to_id=admin')" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
				<div  id="imgdiv" >
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;"><!-- db에서 받아온 이미지 -->
				</div>
				<div id="namediv" >
					<p style="font-family: 'Jua', sans-serif;">admin</p><!-- db에서 받아온 이름 -->
					<br>
					<p style="color:gray;font-family: 'Jua', sans-serif;"></p><!-- db에서 받아온 최신 메세지 날짜 -->
				</div>
				<div id="textdiv">
					<p style="font-family: 'Jua', sans-serif;">관리자 알람 확인</p><!-- db에서받아온 최신 메세지 -->
				</div>
			</div>
			<hr>
			<c:forEach items="${messageList }" var="list">
			<div id="chatelement" onclick="openChat('message.do?message_to_id=${list.message_to_id}')" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
				<div  id="imgdiv" >
					<c:if test="${list.message_to_img != 'none' }">
					<img alt="" src="/cnc/display.do?name=${list.message_to_img}" style="width:64px;height:64px;border-radius:70%;"><!-- db에서 받아온 이미지 -->
					</c:if>
					<c:if test="${list.message_to_img == 'none' }">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/human.png" style="width:64px;height:64px;border-radius:70%;">
					</c:if>
				</div>
				<div id="namediv">
					<p style="font-family: 'Jua', sans-serif;">${list.message_to_name}</p><!-- db에서 받아온 이름 -->
					<br>
					<p style="color:gray;font-family: 'Jua', sans-serif;">${list.message_regdate}</p><!-- db에서 받아온 최신 메세지 날짜 -->
				</div>
				<div id="textdiv">
					<p style="font-family: 'Jua', sans-serif;">상대방과 대화하기</p><!-- db에서받아온 최신 메세지 -->
				</div>
			</div>
			<hr>
			</c:forEach>
		</div>
	</div>
<div style="clear:both;"></div>

<footer>
<%@include file="../html/footer.jsp" %>
</footer>
<script type="text/javascript">
	function openChat(url){
		var openWin = window.open(url,"rankpopup","width=750, height=900, resizable = no, scrollbars = no");
	}
</script>
</body>
</html>