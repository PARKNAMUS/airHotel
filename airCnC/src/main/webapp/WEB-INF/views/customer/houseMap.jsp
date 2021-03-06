<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation_map.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/SUHWAN.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" />
<title>지도 있는 예약 페이지</title>
</head>
<body>
	<!-- header-start -->
	<c:if test="${login_session eq null }">
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item">
						<p>
							<a href="/cnc/registerView.do">회원가입</a>
						</p>
					</li>
					<li class="item">
						<p>
							<a href="/cnc/loginView.do">로그인</a>
						</p>
					</li>
					<li class="item">
						<p>
							<a href="/cnc/selectBoardList.do">공지사항</a>
						</p>
					</li>

				</ul>
			</div>
		</div>
	</header>
</c:if>
<c:if test="${login_session ne null }">
	<header class="menudiv1">
		<div class="menudiv2-1" style="margin:0 0 10px;">
			<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" style="float:left;width:70%;">
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
			<div style="width:50px;height:50px;margin-left:5%;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<c:choose>
					<c:when test="${my_image eq 'profile.png'}">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/profile.png" style="max-width:120%;max-height:120%;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/cnc/display.do?name=${my_image}" style="max-width:120%;max-height:120%;">
					</c:otherwise>
				</c:choose>
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
	<!-- header-end -->
	<main>
		<div class="searchOptions">
			<form action="getDetail.do">
				<div class="srcachlocation">
					<select id="select_type" name="location">
						<option id="first">지역 전체</option>
						<option id="seo">서울</option>
						<option id="gye">경기도</option>
						<option id="gw">강원도</option>
						<option id="cb">충청도</option>
						<option id="cn">경상북도</option>
						<option id="gb">경상남도</option>
						<option id="gn">전라북도</option>
						<option id="jb">전라남도</option>
						<option id="jn">제주도</option>
					</select> <select id="select_menu" name="detail">
						<option>지역 선택</option>
					</select> <label class="searchConditions">체크인 <input type="date"
						id="checkIn" name="checkIn" value="${checkInDate }" min="" max="" /></label> <label
						class="searchConditions">체크아웃 <input type="date"
						id="checkOut" name="checkOut" value="${checkOutDate }" min="" max="" onclick="checkout()" />
					</label> <label class="searchConditions">최소 인원 <input type="number"
						id="people" name="people" value="${person }" onclick="peopleCheck()"/></label>
					<button class="btn1" type="submit" value="검색" onclick="nullCheck()">검색</button>
					<button class="btn2" id="button">상세검색</button>
				</div>
				<br>
				<!-- 팝업창 코드-->
				<div id="divToggle" style="display: none; color: black;">
					<div class="manu1">
						<div class="menu2">
							<label for="manu2" class="lab1">숙소에 반드시 필요한것 : <label
								for="parkingc" style="cursor: pointer;"> <input
									type="hidden" name="parking" value="off" /> <input
									type="checkbox" id="parkingc" name="parking" />주차장
							</label> <label for="smokingc" style="cursor: pointer;"> <input
									type="hidden" name="smoking" value="off" /> <input
									type="checkbox" id="smokingc" name="smoking" />흡연실
							</label> <label for="petc" style="cursor: pointer;"> <input
									type="hidden" name="pet" value="off" /> <input type="checkbox"
									id="petc" name="pet" />반려동물
							</label> <label for="wific" style="cursor: pointer;"> <input
									type="hidden" name="wifi" value="off" /> <input
									type="checkbox" id="wific" name="wifi" />WIFI
							</label> <label for="poolc" style="cursor: pointer;"> <input
									type="hidden" name="pool" value="off" /> <input
									type="checkbox" id="poolc" name="pool" />수영장
							</label> <label for="laundryc" style="cursor: pointer;"> <input
									type="hidden" name="laundry" value="off" /> <input
									type="checkbox" id="laundryc" name="laundry" />세탁기
							</label>
							</label></br>
						</div>
						<br>
						<div class="menu3">
							<label for="manu3" class="lab2"> <input type="hidden"
								name="star" value="1" /> 별점 : <label for="one"
								style="cursor: pointer;"> <input type="checkbox"
									id="one">1
							</label> <label for="two" style="cursor: pointer;"> <input
									type="checkbox" id="two" />2
							</label> <label for="three" style="cursor: pointer;"> <input
									type="checkbox" id="three" />3
							</label> <label for="four" style="cursor: pointer;"> <input
									type="checkbox" id="four" />4
							</label> <label for="five" style="cursor: pointer;"> <input
									type="checkbox" id="five" />5
							</label>
							</label>
						</div>
						<br>
						<c:forEach items="${price}" var="pric">
							<div class="menu2">
								가격 - 최소값 : <font size=2 id="slider_min_view">${pric.MINP}</font>
								<input style="width: 30%;" class="min_range" type="range"
									value="${pric.MINP}" min="${pric.MINP}" max="${pric.MAXP}"
									name="minPrice"></input> 최대값 : <font size=2
									id="slider_max_view">${pric.MAXP}</font> <input
									style="width: 30%;" class="max_range" type="range"
									value="${pric.MAXP}" min="${pric.MINP}" max="${pric.MAXP}"
									name="maxPrice"></input>
							</div>
						</c:forEach>
						<br>
					</div>
				</div>
			</form>
		</div>
		<div class="containerr">
			<div id="map"></div>
			<div class="mapSide">
			<c:forEach items="${houseList}" var="house">
				<form action="reservationHouse.do" method="post" id="${house.house_seq}">
				<input type="hidden" name="house_seq" value="${house.house_seq}"/>
				<input type="hidden" name="accessType" value="notres" />
				<input type="hidden" name="check_in" value="">
				<input type="hidden" name="check_out" value="">
				<input type="hidden" name="house_person" value="">
					<div class="houseList" style="color: black; position:relative;" onclick="sub(${house.house_seq})">
						<img src="/cnc/display.do?name=${house.house_photourl }" alt="숙소 이미지" class="littleImg">
							<p style="font-size: 20px;color:black;">${house.house_name }</p><br> 
							${house.house_location }<br>
							별점<br><br><br>
							<p style="position:absolute; bottom:5px; right:10px;">${house.house_price_default }원</p>
					</div>
				</form>
					<br>
				</c:forEach>
			</div>
		</div>
	</main>
	<footer class="first" id="bottom">
		<div class="second">
			회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL
			여기어때 |콘텐츠산업진흥법에의한 표시<br /> <br /> 고객행복센터 1670-6250 오전 9시 - 새벽 3시,
			점심시간: 오후 12시 - 오후 1시<br /> <br /> (주) 여기어때컴퍼니<br /> <br /> 주소 :
			서울특별시 강남구 봉은사로 479, 479타워 11층<br /> 대표이사 : 박남수 | 사업자등록번호:
			742-86-00224<br /> 통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br />
			전화번호 : 1670-6250<br /> 전자우편주소 : skatn7979@gmail.com<br /> Copyright
			GC COMPANY Corp. All rights reserved.<br />
			<hr id="bline" />
			<img src="../images/face.png" id="blogo" /> <img
				src="../images/insta.png" id="blogo" />
		</div>
	</footer>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=34a9b57d9683ba3774a7043210836806&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("a[name='trigger']").toggle(function() {
				$(this).closest("div").next().show();
			});
		});
	</script>
	<!-- 상세검색 js (기본 event를 없애줫다)-->
	<script>
		$(function() {
			$("#button").click(function(event) {
				event.preventDefault();
				$("#divToggle").slideToggle("fast");
			});
		});
	</script>
	<script type="text/javascript">
		var f_base =["지역 전체"]
		var f_seoul = [ "서울지역 선택", "강남구", "강서구", "노원구" ];
		var f_gyeonggi = [ "경기지역 선택", "성남시", "수원시", "광주시" ];
		var f_gangwon = [ "강원지역 선택", "강릉시", "속초시", "양양시" ];
		var f_cb = [ "충청지역 선택", "청주시", "충주시", "보령시" ];
		var f_cn = [ "경북지역 선택", "포항시", "안동시", "경주시" ];
		var f_gb = [ "경남지역 선택", "창원시", "통영시", "거제시" ];
		var f_gn = [ "전북지역 선택", "전주시", "익산시", "군산시" ];
		var f_jb = [ "전남지역 선택", "여수시", "순천시", "목포시" ];
		var f_jn = [ "제주지역 선택", "제주시", "서귀포시"];
		var foods = [ f_base, f_seoul, f_gyeonggi, f_gangwon, f_cb, f_cn, f_gb, f_gn, f_jb, f_jn ];

		function createTag(index) {
			var result = "";
			foods[index].forEach(function(item) {
				result += "<option>" + item + "</option>";
			});
			return result;
		}

		function chgOptions() {
			var selected_index = $("#select_type option").index(
					$("#select_type option:selected"));
			$("#select_menu").html(createTag(selected_index));
		}

		$("#select_type").on("change", function() {
			chgOptions();
		});
	</script>

	<script language="javascript">
		window.onload = function () {
			if('${location}'==="서울") {
				var loc = document.getElementById("seo");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="경기") {
				var loc = document.getElementById("gye");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="강원") {
				var loc = document.getElementById("gw");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="충북") {
				var loc = document.getElementById("cb");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="충남") {
				var loc = document.getElementById("cn");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="경북") {
				var loc = document.getElementById("gb");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="경남") {
				var loc = document.getElementById("gn");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="전남") {
				var loc = document.getElementById("jn");
				loc.selected = true;
				chgOptions();
			}
			else if('${location}'==="전북") {
				var loc = document.getElementById("jb");
				loc.selected = true;
				chgOptions();
			}
			let minLim = new Date().toISOString().substring(0, 10);
			<!--document.getElementById('checkIn').value = minLim;-->
			document.getElementById('checkIn').min = minLim;
			if('${checkInDate}'==="") {
				console.log("체크인 날짜를 설정하지 않았다.");
				document.getElementById('checkIn').value = minLim;
			}
			if('${person}'==="") document.getElementById('people').value = 1;
		};
	</script>

	<script language="javascript">
		function ShowSliderMin(sVal) {
			var obMaxView = document.getElementById("slider_min_view");
			obMaxView.innerHTML = sVal
		}

		var RangeMinSlider = function() {
			var range = $('.min_range');

			range.on('input', function() {
				ShowSliderMin(this.value);
			});
		};

		RangeMinSlider();
	</script>

	<script language="javascript">
		function ShowSliderMax(sVal) {
			var obMinView = document.getElementById("slider_max_view");
			obMinView.innerHTML = sVal
		}

		var RangeMaxSlider = function() {
			var range = $('.max_range');

			range.on('input', function() {
				ShowSliderMax(this.value);
			});
		};

		RangeMaxSlider();
	</script>

	<script>
	var nullCheck = function(){
		if ($('input[id=parkingc]').is(":checked")) {
		    $('input[name=parking]').val('true');
		} else {
		    $('input[name=parking]').val('false');
		}
		if ($('input[id=smokingc]').is(":checked")) {
		    $('input[name=smoking]').val('true');
		} else {
		    $('input[name=smoking]').val('false');
		}
		if ($('input[id=petc]').is(":checked")) {
		    $('input[name=pet]').val('true');
		} else {
		    $('input[name=pet]').val('false');
		}
		if ($('input[id=poolc]').is(":checked")) {
		    $('input[name=pool]').val('true');
		} else {
		    $('input[name=pool]').val('false');
		}
		if ($('input[id=wific]').is(":checked")) {
		    $('input[name=wifi]').val('true');
		} else {
		    $('input[name=wifi]').val('false');
		}
		if ($('input[id=laundryc]').is(":checked")) {
		    $('input[name=laundry]').val('true');
		} else {
		    $('input[name=laundry]').val('false');
		}
		if ($('input[id=one]').is(":checked")){
			$('input[name=star]').val('1');
		}else if ($('input[id=two]').is(":checked")){
				$('input[name=star]').val('2');
		}else if ($('input[id=three]').is(":checked")){
				$('input[name=star]').val('3');
		}else if ($('input[id=four]').is(":checked")){
				$('input[name=star]').val('4');
		}else if ($('input[id=five]').is(":checked")){
				$('input[name=star]').val('5');
		}
		
	}
	</script>
	<script>
		var checkout = function() {
			let maxLim = document.getElementById("checkIn");
			document.getElementById("checkOut").min = maxLim.value;
		}
	</script>
	<script type="text/javascript">
		$(function(){
			$("#myinfo").click(function(){
				$("#mydiv").fadeToggle("slow");
			})
		})
	</script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
			center: new kakao.maps.LatLng("${houseList[0].house_xlocation}","${houseList[0].house_ylocation}"),
	        level: 7// 지도의 확대 레벨
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 마커를 표시할 위치와 title 객체 배열입니다 
		//document.getElementById('ttest').innerHTML = "${houseList[0].house_xlocation}";
		var positions = [
		    <c:forEach items="${houseList}" var="list">
				{
					content : '<div class="house_name">${list.house_name}</div>',
					latlng : new kakao.maps.LatLng("${list.house_xlocation}", "${list.house_ylocation}")
				},
			</c:forEach>
		];
		    
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
	</script>

	<script>
		var peopleCheck = function() {
			let peo = document.getElementById("people");
			if(peo.value<1) peo.value = 1;
			if(peo.value>10) peo.value = 10;
		}
	</script>
	
	<script>
		var sub = function(seq) {
			let inn = document.getElementById("checkIn").value;
			let outt = document.getElementById("checkOut").value;
			let perr = document.getElementById("people").value;
			let size = document.getElementsByName("check_in").length;
			let size1 = document.getElementsByName("check_out").length;
			let size2 = document.getElementsByName("house_person").length;
		    for(var i = 0; i < size; i++){
		    	document.getElementsByName("check_in")[i].value = inn;
		    }
		    for(var i = 0; i < size1; i++){
		    	document.getElementsByName("check_out")[i].value = outt;
		    }
		    for(var i = 0; i < size2; i++){
		    	document.getElementsByName("house_person")[i].value = perr;
		    }
			document.getElementById(seq).submit();
		}
	</script>
</body>
</html>