<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Travelo</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />

<style>
h2 {
	font-size: 50px;
	color: black;
}

h4 {
	width: 500px;
	border-bottom: 3px solid black;
}

li {
	margin-top: 40px;
	color: black;
	list-style: none;
	font-size: 25px;
}

li:hover {
	color: #ff5a5f;
}

input[type="submit"] {
	color: white;
	display: inline-block;
	width: auto;
	height: auto;
	background-color: #ff5a5f;
	border-radius: 5px;
	font-size: 30px;
	text-decoration: none;
	padding: 3px;
	border: none;
}
</style>

</head>

<body>
	<!-- header-start -->
	<header style="color: #ff5a5f;">
		<span><i class="fas fa-list-alt"
			style="font-size: 35px; padding-left: 20px; float: left;"></i></span>
		<label for="fas fa-question" style="font-size: 40px;">숙소
			등록시 확인사항</label>
	</header>
	<!-- header-end -->
	<div class="container" style="align-content: center;">
		<img src="${pageContext.request.contextPath}/resources/images/step.png" alt="" style="float: right;" />
		<h2>숙소 등록을 완료하고 수입을 올려보세요.</h2>
		<h4>숙소를 등록한 후 언제든 숙소를 수정할 수 있습니다.</h4>
		<div class="hoststep">
			<ul>
				<a href="/cnc/update_2housedetailopen.do"><li>인원 및 침실</li></a>
				<a href="/cnc/update_3bathcountopen.do"><li>욕실 및 공용여부</li></a>
				<a href="/cnc/update_4locationopen.do"><li>숙소 위치</li></a>
				<a href="/cnc/update_5defaultoptionopen.do"><li>숙소옵션 및 안전시설</li></a>
				<a href="/cnc/update_6guestcomfortableopen.do"><li>숙소내 편의시설</li></a>
				<a href="/cnc/update_7guesttextareaopen.do"><li>숙소 설명</li></a>
				<a href="/cnc/update_8hosthouseimgopen.do"><li>숙소 사진</li></a>
				<a href="/cnc/update_9hosttitleopen.do"><li>숙소 제목</li></a>
				<a href="/cnc/update_10chargeopen.do"><li>사용요금 및 시간</li></a>
				<a href="/cnc/update_11restrictthemeopen.do"><li>테마 및 주의사항</li></a>
			</ul>
		</div>
		<input type="submit" value="확인" style="margin-left: 85%;" />
		<input type="button" value="뒤로" class="submitbtn"  
     		onclick="location.href='/cnc/1newhouse.do'"/>
	</div>

</body>
</html>