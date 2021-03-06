<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Travelo</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="shortcut icon" type="image/x-icon"
		href="${pageContext.request.contextPath}/images/favicon.png">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/test.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/menu.css?version=123"><!--  -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/footer.css">
	
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/hostregister.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/index.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/effect.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" 
    />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function hosthouseimgSubmit() {
			
			var f = document.hostpic;
			
			if(!f.house_photo.value){
				alert('메인 사진은 반드시 선택하셔야합니다.');
				return;
			}
			f.submit();
			
		}
		
		
		
		function PrevSubmit() {
			var f = document.hostpic;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	
    
  	<div class="container">
    <form action="/cnc/update_8hosthouseimgwork.do" name="hostpic" method="POST" enctype="multipart/form-data">
	
	
    <div class="hostpic1">
    	<img src="${pageContext.request.contextPath}/resources/images/sleep1.jpg" alt="">
        <div class="addregister"><h3 style="padding-top: 35px; font-size: 45px; font-weight: bold;">숙소 사진</h3></div><br>
        
        <h4 style="font-size: 25px; font-weight: bold;">멋진 사진으로 숙소가 돋보이게 해주세요.</h4><br>
        <h4>휴대전화나 카메라를 사용하여 사진을 찍으세요. 숙소를 등록하려면 1장 이상의 사진이 필요합니다. 나중에 언제든 사진을 추가하거나 수정하실 수 있습니다.</h4>
        
        <div id="image_container" style="text-align: center;"></div>
        <div class="filebox">
        	<hr>
			<p>이전 선택한 메인사진 : ${detail.house_photourl }</p>
			<img alt="${detail.house_photourl}" src="display.do?name=${detail.house_photourl}" style="width:200px; height: 200px;" />
			<input type="file" name="house_photo" id="house_photo" style="width:180px; height:50px; color:black;" />
			
            <label for="image" style="color: black;">수정할 메인사진을 선택하세요</label>
            <hr>
            <p>이전 선택한 상세사진1 : ${detail.house_photourl_detail1 }</p>
            <img alt="${detail.house_photourl_detail1}" src="display.do?name=${detail.house_photourl_detail1}" style="width:200px; height: 200px;" />
			<input type="file" name="house_photo_detail1" id="house_photo_detail1" style="width:180px; height:50px; color:black;"/>
            <label for="image" style="color: black;">수정할 상세사진1을 선택하세요</label>
            <hr>
            <p>이전 선택한 상세사진2 : ${detail.house_photourl_detail2 }</p>
            <img alt="${detail.house_photourl_detail2}" src="display.do?name=${detail.house_photourl_detail2}" style="width:200px; height: 200px;" />
			<input type="file" name="house_photo_detail2" id="house_photo_detail2" style="width:180px; height:50px; color:black;"/>
            <label for="image" style="color: black;">수정할 상세사진2을 선택하세요</label>
            <hr>
            <p>이전 선택한 상세사진3 : ${detail.house_photourl_detail3 }</p>
            <img alt="${detail.house_photourl_detail3}" src="display.do?name=${detail.house_photourl_detail3}" style="width:200px; height: 200px;" />
			<input type="file" name="house_photo_detail3" id="house_photo_detail3" style="width:180px; height:50px; color:black;"/>
            <label for="image" style="color: black;">수정할 상세사진3을 선택하세요</label>
            <hr>
            <p>이전 선택한 상세사진4 : ${detail.house_photourl_detail4 }</p>
            <img alt="${detail.house_photourl_detail4}" src="display.do?name=${detail.house_photourl_detail4}" style="width:200px; height: 200px;" />
			<input type="file" name="house_photo_detail4" id="house_photo_detail4" style="width:180px; height:50px; color:black;"/>
            <label for="image" style="color: black;">수정할상세사진4을 선택하세요</label>
            <hr>
        </div>
    </div>
    </form>
	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>뒤로가기</button></a>
		<a href="#" onclick="hosthouseimgSubmit();" style="float: right;"><button>수정하기</button></a>
    </div>
    </div>	
	
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>