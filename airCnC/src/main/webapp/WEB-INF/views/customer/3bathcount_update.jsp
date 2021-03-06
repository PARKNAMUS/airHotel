<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>AirBnb</title>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hostdetail1.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bathcount.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function bathcountSubmit() {
			var f = document.bathcount;
			if(f.house_bathroom_type.value != "true" && f.house_bathroom_type.value != "false") {
				alert("욕실의 공용,개인 여부를 알려주세요.");
				return;
			}
			if(f.house_bathroom_amount.value == 0) {
				alert("욕실 수는 최소 1개 이상이어야합니다.");
				return;
			}
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.bathcount;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}
	
	</script>
</head>
<body>
	
	
    <div class="container" style="align-content: center;">
    <div class="form">
    <form action="/cnc/update_3bathcountwork.do" name="bathcount" method="GET">	
        <img src="${pageContext.request.contextPath}/resources/images/shawer.png" style="margin-bottom: 35px;" />
        <div class="bathtitle" style="font-size: 30px; font-weight: bold; padding-bottom: 15px; color: black;">
        	욕실 수</div>
        <div class="bathcounttitle" style="padding-bottom: 15px; color: black;">
        	 샤워실 또는 욕조가 없는 경우 0개로 간주합니다.</div>
        <div class="bathcount1" style="padding-bottom: 15px;">
            <label for="bathcount2">욕실</label>
            <c:set var="bathroom_amount" value="${detail.house_bathroom_amount}" />
            <button type="button" onclick="javascript:this.form.amount5.value++;">+</button>
            <input type="text" id="amount5" value="${bathroom_amount}" readonly="readonly" name="house_bathroom_amount" />
            <button type="button" onclick="javascript:this.form.amount5.value--;">-</button>
        </div>
       
        <div class="bathcount3" style="padding-bottom: 15px;">
            <label for="guestbad">게스트가 단독으로 사용하는 욕실인가요?</label><br /><br />
            <input type="radio" id="radio1" name="house_bathroom_type" value="true" checked="checked"
            	<c:if test="${detail.house_bathroom_type eq 'true'}">checked="checked"</c:if>/><label> 예 </label>
            <br><br/>
            <input type="radio" id="radio2" name="house_bathroom_type" value="false" 
            	<c:if test="${detail.house_bathroom_type eq 'false'}">checked="checked"</c:if>/><label> 아니오 </label>
        </div>
          

    </form>
   		<div class="bathcontrol" style="padding-bottom: 15px;">
        	<a href="#" onclick="PrevSubmit();" style="float : inherit;">
			<button>뒤로가기</button></a>&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="bathcountSubmit();" style="float: inherit;">
			<button>수정하기</button></a>
        </div>
	</div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>