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
	<title>자주묻는질문 페이지</title>
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
	
	<script>
		
		function Type0() {
			var f = document.form1;
			$("#option0").attr('checked', 'checked');
			f.action = '<c:url value="/selectCommonQueList.do" />';
			f.submit();
		}
		function Type1() {
			var f = document.form1;
			f.action = "<c:url value='/selectCommonQueListType.do' />";
			f.submit();
		}
		function Type2() {
			var f = document.form1;
			f.action = '<c:url value="/selectCommonQueListType.do" />';
			f.submit();
		}
		function Type3() {
			var f = document.form1;
			f.action = '<c:url value="/selectCommonQueListType.do" />';
			f.submit();
		}
		function Type4() {
			var f = document.form1;
			f.action = '<c:url value="/selectCommonQueListType.do" />';
			f.submit();
		}
		function Type5() {
			var f = document.form1;
			f.action = '<c:url value="/selectCommonQueListType.do" />';
			f.submit();
		}
		$("#option0").attr('checked', 'checked');
		$("#option1").prop("checked", true);
		$("#option2").prop("checked", true);
		$("#option3").prop("checked", true);
		$("#option4").prop("checked", true);
		$("#option5").prop("checked", true);
	</script>
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
                        <h3>Contact</h3>
                        <p>자주묻는질문은 여기에요</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
	<!-- 좌측 목차 -->
    <nav role="navigation" style="float: left; width: 30%;" class="center_event">
	  <ul id="main-menu">
	    <li><a href="/cnc/selectBoardList.do">공지사항</a></li>
	    <li><a href="/cnc/selectEventList.do">이벤트</a></li>
	    <li><a href="/cnc/selectPolicyList.do">약관정책</a></li>
	    <li><a href="#">고객센터</a>
	      <ul id="sub-menu">
	        <li><a href="/cnc/goaddPersonalQue.do" aria-label="subemnu">1대1 문의</a></li>
	        <li><a href="/cnc/selectPersonalQueList.do" aria-label="subemnu">나의 질문</a></li>
	        <li><a href="/cnc/selectCommonQueList.do" aria-label="subemnu">자주묻는질문</a></li>
	      </ul>
	    </li>
	   </ul>
	 </nav>
	 <br></br>
	 <form  action="/cnc/addCommonQueList.do" method="POST" id="form1" name="form1" >
		<label>질문의 유형을 선택해주세요.</label><br /><br />
        <input type="radio" id="option0" name="commonq_type" value="전체" onclick="Type0()">
		<label for="option0">전      체</label>       
		<input type="radio" id="option1" name="commonq_type" value="예약결제" onclick="Type1()">
		<label for="option1">예약결제</label>
		<input type="radio" id="option2" name="commonq_type" value="예약취소" onclick="Type2()">
		<label for="option2">예약취소</label>
		<input type="radio" id="option3" name="commonq_type" value="이용문의" onclick="Type3()">
		<label for="option3">이용문의</label>
		<input type="radio" id="option4" name="commonq_type" value="회원정보" onclick="Type4()">
		<label for="option4">회원정보</label>
		<input type="radio" id="option5" name="commonq_type" value="기타문의" onclick="Type5()">
		<label for="option5">기타문의</label>
		<br></br>
		<input type="hidden" name="commonq_type" value="${commonq_type}">
	</form>
	  <!-- 우측 게시판 -->
	<div style="float: left; width: 60%; " class="center_question">
	
	<table id="list" class="type10">
		<thead>
			<tr>
				<th>분류</th>
				<th scope="cols">질문제목</th>
				<th scope="cols">등록날짜</th>
			</tr>
		</thead>
		
		<c:choose>
			<c:when test="${!empty commonqList}">
				<c:forEach items="${commonqList }" var="commonq">
					<tr>
						<td>${commonq.commonq_type }</td>
						<td id="longtitle"><a href="#1" name="trigger">${commonq.commonq_title }</a></td>
						<td><fmt:formatDate value="${commonq.commonq_regdate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr name="article" class="hide">
						<td class="even" colspan="3">${commonq.commonq_content }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
	</div>
	
	<div style="float: left; width: 30%; " class="center_paging">
	<!-- Start Pagination -->
		<ul class="pagination">
		    <c:if test="${paging.prev }">
		    <li>
		        <a href='<c:url value="/selectCommonQueList.do?page=${paging.startPage-1 }"/>'>이전</a>
		    </li>	
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
		    <li>
		        <a href='<c:url value="/selectCommonQueList.do?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
		    </li>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage >0 }">
		    <li>
		        <a href='<c:url value="/selectCommonQueList.do?page=${paging.endPage+1 }"/>'>다음</a>
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