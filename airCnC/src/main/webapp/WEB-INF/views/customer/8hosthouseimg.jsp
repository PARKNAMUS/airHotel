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
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hosthousepic.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	<script type="text/javascript" src="../js/hostregister.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function hosthouseimgSubmit() {
			var f = document.hostpic;
			var fileCheck = document.getElementById("house_photo").value;
		    if(!fileCheck){
		        alert("파일을 첨부해 주세요");
		        return;
		    }
			
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.hostpic;
			f.action = "<c:url value='/6guestcomfortable.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	<!-- header-start -->
    <header class="menudiv1">
      <div class="menudiv2-1">
        <label for="menudiv2-1">편의시설</label>
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" />
      </div>
      <div class="menudiv2-2">
        <div class="menudiv3-1" id="div1">
          <img alt="http://www.naver.com"
            src="${pageContext.request.contextPath}/resources/images/menubar.png"
            id="menubar"/>
        </div>
      </div>
    </header>
    <!-- header-end -->
    <div class="container">
    
    <form action="/hotel/8hosthouseimg.do" name="hostpic" method="POST" enctype="multipart/form-data">
	
	
    <div class="hostpic1">
    	<img src="${pageContext.request.contextPath}/resources/images/sleep1.jpg" alt="">
        <div class="addregister"><h3 style="padding-top: 35px; font-size: 45px; font-weight: bold;">숙소 사진</h3></div><br>
        
        <h4 style="font-size: 25px; font-weight: bold;">멋진 사진으로 숙소가 돋보이게 해주세요.</h4></br>
        <h4>휴대전화나 카메라를 사용하여 사진을 찍으세요. 숙소를 등록하려면 1장 이상의 사진이 필요합니다. 나중에 언제든 사진을 추가하거나 수정하실 수 있습니다.</h4>
        
        <div id="image_container" style="text-align: center;"></div>
        <div class="filebox">
        
			<input type="file" name="house_photo" id="house_photo" /><br>
            <label for="image" style="color: black;">첨부할 사진을 선택하세요</label>
        </div>
    </div>
    
	
    
    
    
	</form>
	<div class="control" style="padding-bottom: 25px; padding-top: 25px;">
		<a href="#" onclick="PrevSubmit();" style="float: left;"><button>< 뒤로가기</button></a>
		<a href="#" onclick="hosthouseimgSubmit();" style="float: right;"><button>다음</button></a>
    </div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</html>