<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>이벤트 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SUHWAN.css">
	
	<style>
	#main-menu li:nth-child(1)>a {
		border-left: 1px solid #ee575d;
	}
	</style>
</head>
<body>
	<header class="menudiv1">
        <div class="menudiv2-1">
            <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png">
        </div>
        <div class="menudiv2-2">
            <div class="menudiv3-1" id="div1">
                <ul id="menuItems">
                    <li class="item">호스트</li>
                    <!-- 히든으로 리스트 -->
                    <li class="item">로그인</li>
                </ul>
            </div>
        </div>
    </header>
    
    <div class="bradcam_area bradcam_bg_5">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>notice</h3>
                        <p>이벤트는 여기에요</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
	<!-- 좌측 목차 -->
    <nav role="navigation" style="float: left; width: 30%;" class="center_event">
	  <ul id="main-menu">
	    <li><a href="공지사항.html">공지사항</a></li>
	    <li><a href="이벤트.html">이벤트</a></li>
	    <li><a href="약관정책.html">약관정책</a></li>
	    <li><a href="#">고객센터</a>
	      <ul id="sub-menu">
	        <li><a href="#" aria-label="subemnu">1대1 문의</a></li>
	        <li><a href="#" aria-label="subemnu">나의 질문</a></li>
	        <li><a href="#" aria-label="subemnu">안내</a></li>
	        <li><a href="자주질문.html" aria-label="subemnu">자주하는질문</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>
	 
	 
	 <!-- 우측 게시판 -->
	 <div class="event-area"style="float: left; width: 60%;" class="center_gonji">
	 	<div class="event">
	 	<br></br><br></br><br></br><br></br>
	 		<ul id="events" class="event_list">
		 		<c:choose>
					<c:when test="${!empty eventList}">
						<c:forEach items="${eventList }" var="event">
							<li id="event_li">
			 				<b>${event.event_title }</b><br><br>
			 				<span>기간 : ${event.event_start } ~ ${event.event_end }</span><br><br>
			 				
			 				<a href='<c:url value='/partiEvent/${event.event_idx}.do${paging.makeQueryPage(event.event_idx, paging.cri.page) }'/>'>
			 					<img id="image1" src="${pageContext.request.contextPath}/resources/images/여기어때2.png">
			 				</a>
			 				</li>
			 				<hr id="event_hr" color="#ee575d" size=0.5px noshade><br><br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
		
	 		</ul>
	 	</div>
	 </div>
	 
	   
	<div style="float: left; width: 30%; " class="center_paging">
		<!-- Start Pagination -->
		<ul class="pagination">
		    <c:if test="${paging.prev }">
		    <li>
		        <a href='<c:url value="/selectEventList.do?page=${paging.startPage-1 }"/>'>이전</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
		    <li>
		        <a href='<c:url value="/selectEventList.do?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
		    </li>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage >0 }">
		    <li>
		        <a href='<c:url value="/selectEventList.do?page=${paging.endPage+1 }"/>'>다음</a>
		    </li>
		    </c:if>
		</ul>
	<!-- End Pagination -->
		<br></br>
		<br></br>
	</div>
	   
	   
	   
	   
	   
	   
	   
	   
	</div>
	
	<div id="footer"></div>
     <footer class="first" id="bottom" >
		<div class="second">
			회사소개  | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL 여기어때 |콘텐츠산업진흥법에의한 표시<br>
			<br>
			고객행복센터 1670-6250 오전 9시 - 새벽 3시, 점심시간: 오후 12시 - 오후 1시<br><br>
			(주) 여기어때컴퍼니<br><br>
			주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br>
			대표이사 : 박남수 | 사업자등록번호: 742-86-00224<br>
			통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br>
			전화번호 : 1670-6250<br>
			전자우편주소 : skatn7979@gmail.com<br>
			Copyright GC COMPANY Corp. All rights reserved.<br>
			<hr id="bline">
			<img src="../images/face.png" id="blogo">
			<img src="../images/insta.png" id="blogo">
		</div>
	</footer>

	<script type="text/javascript"
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("a[name='trigger']").toggle(function() {
					$(this).closest("tr").next().show();
				}, function() {
					$(this).closest("tr").next().hide();
				});
			});
	</script>
	 
</body>
</html>