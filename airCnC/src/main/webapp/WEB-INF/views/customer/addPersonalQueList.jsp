<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>1대1문의 등록 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN2.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" 
    />
	<style>
	#main-menu li:nth-child(4)>a {
		border-left: 1px solid #ee575d;
	}
	
	input[type=radio]{
	  width: 0;
	  height: 0;
	  position: absolute;
	  left: -9999px;
	}
	input[type=radio] + label{
	  margin: 0;
	  padding: .75em 1.5em;
	  box-sizing: border-box;
	  position: relative;
	  display: inline-block;
	  border: solid 1px #DDD;
	  background-color: #FFF;
	  line-height: 140%;
	  text-align: center;
	  box-shadow: 0 0 0 rgba(255, 255, 255, 0);
	  transition: border-color .15s ease-out,  color .25s ease-out,  background-color .15s ease-out, box-shadow .15s ease-out;
	  cursor: pointer;
	}
	input[type=radio]:checked + label{
	  background-color: #4B9DEA;
	  color: #FFF;
	  box-shadow: 0 0 10px rgba(102, 179, 251, 0.5);
	  border-color: #4B9DEA;
	  z-index: 1;
	}
	</style>
</head>
<body>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
		<header style="padding: 20px; background: rgb(025, 025, 025);">
	    <a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/logo111.png"/></a>
	    <div class="menudiv3-1" id="div1" style="padding-top: 13px;">
	        <ul id="menuItems">
	        <li class="item"> 
	            <a
	            href="/cnc/registerView.do"
	            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
	            ><li class="item">회원가입</li></a>
	            <a
	            href="/cnc/loginView.do"
	            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
	            ><li class="item">로그인</li></a>
	            <a
	            href=""
	            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
	            ><li class="item">공지사항</li></a>
	        </li>
	        </ul>
	    </div>
	</header>
	</c:if>
	<c:if test="${login_session ne null }">
		<header class="menudiv1">
			<div class="menudiv2-1" style="margin:0 0 10px;">
				<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
			</div>
			<div class="menudiv2-2" style="padding:0 0 4px;">
				<div class="menudiv3-1" id="div1" style="float:left;width:70%;">
					<ul id="menuItems" style="padding:12px;">	
							<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
							<li class="item">
								<p>
									<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
								</p>
							</li>
							<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
					</ul>
				</div>
				<div style="width:50px;height:50px;margin-left:5%;margin-top:10px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/chat/my1.jpg" style="max-width:120%;max-height:120%;">
				</div>
			</div>
			<div id="mydiv" style="display:none;margin-left:90%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
						<ul>
							<li><br></li>
							<li style="margin-bottom:20px;"><a href="mypage.do">내 정보</a></li>
							<li style="margin-bottom:20px;"><a href="hostRegisterView.do">호스트 신청</a></li>
							<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
							<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
							<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
							<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
						<c:choose>
							<c:when test="${social_type ne null }">
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
	</c:if>

	<div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Policy</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	
	
	<div class="container">
	<!-- 좌측 목차 -->
    <nav role="navigation" style="float: left; width: 30%; margin-top: 10%;" class="center_event">
	 <ul id="main-menu">
	    <li><a href="/cnc/selectBoardList.do">공지사항</a></li>
	    <li><a href="/cnc/selectEventList.do">이벤트</a></li>
	    <li><a href="/cnc/selectPolicyList.do">약관정책</a></li>
	    <li><a href="/cnc/goaddPersonalQue.do">고객센터</a>
	      <ul id="sub-menu">
	        <li><a href="/cnc/goaddPersonalQue.do" aria-label="subemnu">1대1 문의</a></li>
	        <li><a href="/cnc/selectPersonalQueList.do" aria-label="subemnu">나의 질문</a></li>
	        <li><a href="/cnc/selectCommonQueList.do" aria-label="subemnu">자주묻는질문</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>
	 
	 <!-- 우측 게시판 -->

	<div style="float: left; width: 60%; " id="featured">
	<div class="title">
					<h2>1대1문의 등록하기</h2>
					<hr>
					<span class="byline">질문을 등록합니다.</span><br><br>
				</div>
		<ul>
            <li>
                <form  action="/cnc/addPersonalQueList.do" method="POST" >
                
                <label>질문의 유형을 선택해주세요.</label><br /><br />
                
                	<input type="radio" id="option1" name="personalq_type" value="예약결제" checked="checked">
					<label for="option1">예약결제</label>
					<input type="radio" id="option2" name="personalq_type" value="예약취소">
					<label for="option2">예약취소</label>
					<input type="radio" id="option3" name="personalq_type" value="이용문의">
					<label for="option3">이용문의</label>
					<input type="radio" id="option4" name="personalq_type" value="회원정보">
					<label for="option4">회원정보</label>
					<input type="radio" id="option5" name="personalq_type" value="기타문의">
					<label for="option5">기타문의</label>
					
					<br></br>
					
					<input name="personalq_title" class="" type="text" value="당신의 질문의 제목을 입력하세요."
					onfocus="if(this.value == '당신의 질문의 제목을 입력하세요.') { this.value = ''; }"
					onblur="if(this.value == '') { this.value = '당신의 질문의 제목을 입력하세요.'; }" />
					<textarea name="personalq_content" cols="" rows=""
					onfocus="if(this.value == '당신의 질문의 내용을 입력하세요.') { this.value = ''; }"
					onblur="if(this.value == '') { this.value = '당신의 질문의 내용을 입력하세요.'; }">당신의 질문의 내용을 입력하세요.</textarea>
				
					<input type="submit" value="등록" class="submitbtn" />
					<input type="button" value="취소" class="submitbtn"  
					onclick="location.href='/cnc/selectPersonalQueList.do'"/>
                </form>
			</li>
		</ul>
	</div>
	</div>

</body>
</html>