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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
	
	<script type="text/javascript">
		function houseDetailSubmit() {
			var f = document.hostchoose1;
			if(f.house_maxperson.value == 0) {
				alert("최대숙박인원은 최소 1명 이상입니다.");
				return;
			}
			if(f.house_bedroom_amount.value == 0) {
				alert("침실선택을 해주세요.");
				return;
			}
			f.submit();
		}
		
		
		function PrevSubmit() {
			var f = document.hostchoose1;
			f.action = "<c:url value='/1newhouse.do' />";
			f.submit();
		}
		
	</script>
</head>
<body>
	
    
    <c:url value="/update_2housedetailwork.do" var="actionUrl" />
    <div class="container">
    <form action="/cnc/update_2housedetailwork.do" name="hostchoose1" method="GET">
			<img src="${pageContext.request.contextPath}/resources/images/badroom.jpg"style="align-content: center; padding-top: 30px;">
			<div class="title"  style="color: black;">숙소에 얼마나 많은 인원이 숙박 할수 있나요?</div>
			<div class="title1" style="color: black;">모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어 있는지 확인하세요.</div>
			<br class="guestcount">	
			<div class="form">
				<label for="guestcount">최대 숙박 인원</label>
				<c:set var="maxperson" value="${detail.house_maxperson}" />
				<button type="button" onclick="javascript:this.form.amount.value++;">+</button> 
        		<input type="text" id="amount" value="${maxperson }" readonly="readonly" name="house_maxperson" />
        		<button type="button" onclick="javascript:this.form.amount.value--;">-</button>
				
				<div class="guestbad">
				<label for="guestbad">게스트가 사용할수 있는 침실은 몇 개 인가요? (저장한 침실 수 : ${detail.house_bedroom_amount} 개)</label><br>
				<select id="guestbadcot" name="house_bedroom_amount" >
					<option value="0" <c:if test="${detail.house_bedroom_amount == 0}">selected</c:if>>침실선택</option>
					<option value="2" <c:if test="${detail.house_bedroom_amount == 2}">selected</c:if>>2개</option>
					<option value="4" <c:if test="${detail.house_bedroom_amount == 4}">selected</c:if>>4개</option>
					<option value="6" <c:if test="${detail.house_bedroom_amount == 6}">selected</c:if>>6개</option>
					<option value="8" <c:if test="${detail.house_bedroom_amount == 8}">selected</c:if>>8개</option>
					<option value="10" <c:if test="${detail.house_bedroom_amount == 10}">selected</c:if>>10개</option>
					<option value="12" <c:if test="${detail.house_bedroom_amount == 12}">selected</c:if>>12개</option>
				</select>
        		</div>
        		
        		<div class="guestbadcount">
			        <div class="guestbadcount1">
			        <label for="guestbadcount2">침대</label>  
			        <c:set var="bed_amount" value="${detail.house_bed_amount}" />      
			        <button type="button" onclick="javascript:this.form.amount1.value++;">+</button>   
			        <input type="text" id="amount1" value="${bed_amount }" readonly="readonly" name="house_bed_amount" />    
			        <button type="button" onclick="javascript:this.form.amount1.value--;">-</button>
			        </div>
			    </div>
			    
			    <div class="bad">
			    	<div class="title2" style="margin-bottom: 5px;">침대유형</div><br>
			    	<label for="bad" style="margin-bottom: 15px;">각 침실에 놓인 침대 유형을 명시하면 숙소에 침대가 어떻게 구비되어  있는지 게스트가 잘 파악할 수 있습니다.</label>
			    	<div class="badcount">
			    		<div class="bad1">
			    			<label for="guestcount">싱글</label>
			    			<c:set var="bed_type_single" value="${detail.house_bed_type_single}" />   
					        <button type="button" onclick="javascript:this.form.amount2.value++;">+</button>  
					        <input type="text" id="amount2" value="${bed_type_single }" readonly="readonly" name="house_bed_type_single" />
					        <button type="button" onclick="javascript:this.form.amount2.value--;">-</button>
			    		</div><br>
			    		<div class="bad2">
			    			<label for="guestcount">더블</label>
			    			<c:set var="bed_type_double" value="${detail.house_bed_type_double}" />
					        <button type="button" onclick="javascript:this.form.amount3.value++;">+</button>  
					        <input type="text" id="amount3" value="${bed_type_double }" readonly="readonly" name="house_bed_type_double" />  
					        <button type="button" onclick="javascript:this.form.amount3.value--;">-</button>
			    		</div><br>
			    		<div class="bad3">
			    			<label for="guestcount">퀸</label>
			    			<c:set var="bed_type_queen" value="${detail.house_bed_type_queen}" />
					        <button type="button" onclick="javascript:this.form.amount4.value++;">+</button>  
					        <input type="text" id="amount4" value="${bed_type_queen }" readonly="readonly" name="house_bed_type_queen" />    
					        <button type="button" onclick="javascript:this.form.amount4.value--;">-</button>
			    		</div>
			    	</div>
			    </div>
			    
			</div>
			    
			    
	</form>
				<div class="control">
				    <div class="control2">
				    <a href="#" onclick="PrevSubmit();" style="float : left;">
				    <button>뒤로가기</button></a>
				    <a href="#" onclick="houseDetailSubmit();" style="float: right;">
				    <button>수정하기</button></a>
				    <br></br><br></br>
			    </div>
					<div class="bor1" style="height: 30px;"></div>
				
				</div>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</html>