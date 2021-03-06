<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<title>메인 홈페이지</title>
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
<link rel="script" href="$${pageContext.request.contextPath}/resources/css/indexTest1.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
			<div class="menudiv3-1" id="div1" style="float:left;">
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
			<div style="width:50px;height:50px;margin-left:1px;margin-top:10px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
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
<!-- slider_area_start -->
<div class="mainview">
	<div class="searchOptions">
		<form action="searchIndex.do">
			<div class="srcachlocation" style="vertical-align: middle;">
				&nbsp;
				<select id="select_type" name="location" style="border: none;">
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
				</select>
				<select id="select_menu" name="detail" style="border: none;">
					<option>지역 선택</option>
				</select>
				<label class="searchConditions" style="padding-bottom: 15px;">체크인
					<input type="date" id="checkIn" name="checkIn" value="" min="" max=""  style="border: none; margin-bottom: 15px;"/>
				</label>
				<label class="searchConditions">체크아웃
					<input type="date"id="checkOut" name="checkOut" min="" max="" onclick="checkout()"  style="border: none;"/>
				</label>
				<label class="searchConditions">최소 인원 <input type="number"
															 id="people" name="people" value="1" onclick="peopleCheck()"/>
				</label>
				<button class="btn12" type="submit" value="검색" style="border-radius: 32px;">검색</button>
			</div>
		</form>
	</div>
	<div class="img-cover"></div>
</div>
<div style="z-index:10;margin-left:80%;margin-top:5%;width:400px;height:300px;position:absolute;">
	<div>
		<div><b id="weathercity" style="font-size:50px;width:60%;float:left;"></b></div>
		<div style="width:20%;margin-left:20%;float:left;"><img src="${pageContext.request.contextPath}/resources/images/myreservation/tri2.png" style="width:32px;height:32px;vertical-align:top;" onclick="changeCity()"></div>
	</div>
	<div style="clear:both;"></div>
	<div style="width:50%;float:left;margin-top:5%;">
		<img src=""  id="weathericon" style="width:64px;height:64px;vertical-align:top;"><b id="templature" style="font-size:40px;"></b><br>
		<b>체감온도</b><p id="feellike" style="font-size:30px;color:white;"></p>
	</div>
	<div style="width:50%;float:left;font-size: 30px;margin-top:5%;">
		<b>습도: </b><b id="rainy"></b><br><br>
		<b>구름: </b><b id="cloud"></b><br><br>
		<b>풍속: </b><b id="wind"></b><br><br>
	</div>
</div>
<!-- slider_area_end -->
<div class="popular_destination_area" style="background-image: url(${pageContext.request.contextPath}/resources/images/main/sea/sea41.gif");>
        <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-6">
                <div class="section_title text-center mb_70">
                  <h3>당신은 어디로 떠나고 싶나요?</h3>
                </div>
              </div>
            </div>
            <div class="grid">
               <figure onclick="location.href='getHouseList.do?location=서울'" class="effect-bubba">
                    <img src="${pageContext.request.contextPath}/resources/images/destination/seoul.jpg" alt="img02"/>
                <figcaption>
                  <h2>서울 여행</h2>
                </figcaption>
              </figure>

              <figure onclick="location.href='getHouseList.do?location=경기도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/busan.png" alt="img16" />
                <figcaption>
                    <h2>경기도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=강원도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/daegu.jpg" alt="img02" />
                <figcaption>
                    <h2>강원도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=충청도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/deajeun.png" alt="img16" />
                <figcaption>
                    <h2>충청도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=경상북도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/gangrung.png" alt="img02" />
                <figcaption>
                    <h2>경상북도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=경상남도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/gwangju.jpg" alt="img16" />
                <figcaption>
                    <h2>경상남도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=전라북도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/incheon.jpg" alt="img02" />
                <figcaption>
                    <h2>전라북도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=전라남도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/jeacheon.jpg" alt="img16" />
                <figcaption>
                    <h2>전라남도 여행</h2>
                </figcaption>
              </figure>
              <figure onclick="location.href='getHouseList.do?location=제주도'" class="effect-bubba">
                <img src="${pageContext.request.contextPath}/resources/images/destination/ulsan.jpg" alt="img16" />
                <figcaption>
                    <h2>제주도 여행</h2>
                </figcaption>
              </figure>
            </div>
          </div>
    </div>


<!-- popular_destination_area_start  -->
<div class="popular_destination_area"
	 style="background-image: url(${pageContext.request.contextPath}/resources/images/main/sea/sea6.gif);">
	<div class=" container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb_70">
					<h3 style="color: white;">당신이 즐기고픈 테마는??</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-1" style="padding-bottom: 15px;">
				<div class="single_destination1"
					 onclick="location.href='themesearch.do?theme_type=house_theme_pet'">
					<div class="thumb">
						<img
								src="${pageContext.request.contextPath}/resources/images/dog.png"
								alt=""><i class="fas fa-dog"
										  style="font-size: 60px; float: right;"></i>
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							반려견과 함께<a href="travel_destination.html">여행</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-1" style="padding-bottom: 15px;">
				<div class="single_destination1"
					 onclick="location.href='themesearch.do?theme_type=house_theme_bbq'">
					<div class="thumb">
						<img
								src="${pageContext.request.contextPath}/resources/images/bbq1.jpg"
								alt=""><i class="fas fa-drumstick-bite"
										  style="font-size: 60px; float: right;"></i>
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							바비큐와 함께<a href="travel_destination.html">여행</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-1" style="padding-bottom: 15px;">
				<div class="single_destination1"
					 onclick="location.href='themesearch.do?theme_type=house_theme_party'">
					<div class="thumb">
						<img
								src="${pageContext.request.contextPath}/resources/images/party1.jpg"
								alt=""><i class="fas fa-glass-cheers"
										  style="font-size: 60px; float: right;"></i>
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							파티룸<a href="travel_destination.html">여행</a>
						</p>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-1">
				<div class="single_destination1"
					 onclick="location.href='themesearchhighscore.do'">
					<div class="thumb">
						<img
								src="${pageContext.request.contextPath}/resources/images/star.png"
								alt=""><i class="fas fa-medal"
										  style="font-size: 60px; float: right;"></i>
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							평점이 높은<a href="travel_destination.html">여행</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-1">
				<div class="single_destination1" onclick="location.href='themesearch.do?theme_type=house_theme_pool'">
					<div class="thumb">
						<img
								src="${pageContext.request.contextPath}/resources/images/familywater.jpg"
								alt=""><i class="fas fa-water"
										  style="font-size: 60px; float: right;"></i>
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							가족 물놀이<a href="travel_destination.html">여행</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-1">
				<div class="single_destination1" onclick="location.href='themesearch.do?theme_type=house_theme_farm'">
					<div class="thumb">
						<img
								src="${pageContext.request.contextPath}/resources/images/ground.jpg"
								alt=""><i class="fas fa-seedling"
										  style="font-size: 60px; float: right;"></i>
					</div>
					<div class="content">
						<p class="d-flex align-items-center">
							가족 체험농장<a href="travel_destination.html">여행</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- popular_destination_area_end  -->
<div class="popular_destination_area"  style="background-image: url(${pageContext.request.contextPath}/resources/images/corona/corona31.jpg); text-align: center;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <h3 style="color: white;">코로나 예방 수칙</h3>
                    </div>
                </div>
            </div>
            <div class="row1">
                <div class="col-lg-4 col-md-1">
                    <div class="save1" style="float: left; margin-left: 400px;">
                        <div class="single_destination2">
                            <div class="thumb1"  style="margin-top: 30px;">
                                <img src="${pageContext.request.contextPath}/resources/images/corona/corona5.png" alt=""><i class="fas fa-hand-holding-medical" style="font-size: 60px; float: right;"></i>
                            </div>
                            <div class="content">
                                <p class="d-flex align-items-center">보건복지부 예방 수칙<a href="travel_destination.html">확인하기</a></p>
                            </div>
                        </div>
                        <div class="goodtext">
                            <label class="goodtext" for="">코로나바이러스감염증(코로나19)은 새롭게 발견된 코로나바이러스로 인해 발생하는 감염 질환입니다.
                                코로나19에 감염되면 대부분 경증에서 중증 수준의 증상을 보이며 특별한 치료 없이도 질환으로부터 회복합니다.
                            </label>
                        </div>
                    </div>
                    <div class="save2" style="float: left;" style="float: left; margin-left: 350px;">
                        <div class="single_destination2">
                            <div class="thumb1" style="margin-top: 30px;">
                                <img src="${pageContext.request.contextPath}/resources/images/corona/corona61.png" alt=""><i class="fas fa-child" style="font-size: 60px; float: right; color: black;"></i>
                            </div>
                            <div class="content" >
                                <p class="d-flex align-items-center" style="color: black;">서울시 코로나 심리지원단<a href="http://covid19seoulmind.org/">응원하기</a></p>
                            </div>
                        </div>
                        <div class="goodtext">
                            <label class="goodtext" for="">서울시는 covid19가 지역 사회 감염으로 진행됨에 따라 발생할 수 있는 여러 심리적 어려움을 예방 및 최소화하기 위해 심리지원단을 운영합니다.
                            </label>
                        </div>
                    </div>
                    <div class="save1" style="float: left; margin-left: 400px;" >
                        <div class="single_destination2">
                            <div class="thumb1" style="margin-top: 30px;">
                                <img src="${pageContext.request.contextPath}/resources/images/corona/corona8.png" alt=""><i class="fas fa-blind" style="font-size: 60px; float: right;"></i>
                            </div>
                            <div class="content">
                                <p class="d-flex align-items-center">해외입국시 확인사항<a href="travel_destination.html">확인</a></p>
                            </div>
                        </div>
                        <div class="goodtext">
                            <label class="goodtext" for="">최근 해외입국자 중 확진환자 발생사례가 증가하고 있습니다. 지역사회 감염병 확산방지를 위하여 해외에서 입국
                                예정인 가족이 있을 경우 사전에 보건소로 신고해 주시고 무증상자도 입국 즉시 코로나19 검체검사 및 입국일로부터 14일간 자가격리를 실시하여야 합니다.
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<footer class="first" id="bottom"
		style="background-image: url(${pageContext.request.contextPath}/resources/images/main/blackback.jpg);">
	<div class="second">
		회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL
		AIRCNC |콘텐츠산업진흥법에의한 표시<br> <br> 고객행복센터 1234-1234 오전 9시 - 새벽
		3시, 점심시간: 오후 12시 - 오후 1시<br> <br> (주) 여기어때컴퍼니<br> <br>
		주소 : 서울특별시 강남구 봉은사로 111, 111타워 11층<br> 대표이사 : Jaden | 사업자등록번호:
		111-11-12345<br> 통신판매번호 : 2017-서울강남-00000 | 관광사업자 등록번호:
		제1026-24호<br> 전화번호 : 1234-1234<br> 전자우편주소 :
		jonghaha7@gmail.com<br> Copyright GC COMPANY Corp. All rights
		reserved.<br>
		<hr id="bline">
		<img
				src="${pageContext.request.contextPath}/resources/images/face.png"
				id="blogo"> <img
			src="${pageContext.request.contextPath}/resources/images/insta.png"
			id="blogo">
	</div>
</footer>
<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("a[name='trigger']").toggle(function() {
			$(this).closest("tr").next().show();
		}, function() {
			$(this).closest("tr").next().hide();
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

<script>
	var peopleCheck = function() {
		let peo = document.getElementById("people");
		if(peo.value<1) {
			peo.value = 1;
			alert('최소인원은 1명 입니다.');
		}
		if(peo.value>10) {
			peo.value = 10;
			alert('너무 많은 인원입니다.');
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
	var citys = ["Seoul","Busan","Incheon","Gangneung","Gwangju","Jeju"]
	var cIndex = 0;
	var changeCity = function(){
		if(cIndex >= citys.length-1){
			cIndex = 0;
		}else{
			cIndex += 1;
		}
		$.ajax({
			type:"GET",
			url: "http://api.openweathermap.org/data/2.5/weather?q="+citys[cIndex]+"&appid=b7672f5a9052b4493d3d1a41da66f308",
			dataType:"json",
			async:"false",
			success : function(data) {
				console.log("현재온도 : "+ Math.round((data.main.temp- 273.15)) );
				console.log("현재습도 : "+ data.main.humidity);
				console.log("날씨 : "+ data.weather[0].main );
				console.log("상세날씨설명 : "+ data.weather[0].description );
				console.log("날씨 이미지 : "+ data.weather[0].icon );
				console.log("바람   : "+ data.wind.speed );
				console.log("나라   : "+ data.sys.country );
				console.log("도시이름  : "+ data.name );
				console.log("구름  : "+ (data.clouds.all) +"%" );
				$("#weathercity").animate({'opacity': 0}, 800, function(){
					$(this).html(data.name).animate({'opacity': 1}, 800);
				});
				$("#templature").animate({'opacity': 0}, 800, function(){
					$(this).html(Math.round((data.main.temp- 273.15))+"°C").animate({'opacity': 1}, 800);
				});
				$("#weathericon").animate({'opacity': 0}, 800, function(){
					$(this).attr("src","http://openweathermap.org/img/w/"+data.weather[0].icon+".png").animate({'opacity': 1}, 800);
				});
				$("#rainy").animate({'opacity': 0}, 800, function(){
					$(this).html(data.main.humidity+"%").animate({'opacity': 1}, 800);
				});
				$("#cloud").animate({'opacity': 0}, 800, function(){
					$(this).html((data.clouds.all) +"%").animate({'opacity': 1}, 800);
				});
				$("#wind").animate({'opacity': 0}, 800, function(){
					$(this).html(data.wind.speed+"m/s").animate({'opacity': 1}, 800);
				});
				$("#feellike").animate({'opacity': 0}, 800, function(){
					$(this).html(Math.round((data.main.feels_like-273.15))+"°C").animate({'opacity': 1}, 800);
				});
			},
			error : function(request, status, error) {
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			}
		});
	}
	window.onload = function(){
		var loc = document.getElementById("first");
		loc.selected = true;
		chgOptions();
		var minlim = new Date().toISOString().substring(0, 10);
		document.getElementById('checkIn').value = minlim;
		document.getElementById('checkIn').min = minlim;
		$.ajax({
			type:"GET",
			url: "http://api.openweathermap.org/data/2.5/weather?q="+citys[cIndex]+"&appid=b7672f5a9052b4493d3d1a41da66f308",
			dataType:"json",
			async:"false",
			success : function(data) {
				console.log("현재온도 : "+ Math.round((data.main.temp- 273.15)) );
				console.log("현재습도 : "+ data.main.humidity);
				console.log("날씨 : "+ data.weather[0].main );
				console.log("상세날씨설명 : "+ data.weather[0].description );
				console.log("날씨 이미지 : "+ data.weather[0].icon );
				console.log("바람   : "+ data.wind.speed );
				console.log("나라   : "+ data.sys.country );
				console.log("도시이름  : "+ data.name );
				console.log("구름  : "+ (data.clouds.all) +"%" );
				$("#weathercity").html(data.name)
				$("#templature").html(Math.round((data.main.temp- 273.15))+"°C")
				$("#weathericon").attr("src","http://openweathermap.org/img/w/"+data.weather[0].icon+".png")
				$("#rainy").html(data.main.humidity+"%")
				$("#cloud").html((data.clouds.all) +"%")
				$("#wind").html(data.wind.speed+"m/s")
				$("#feellike").html(Math.round((data.main.feels_like-273.15))+"°C")
			},
			error : function(request, status, error) {
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			}
		});
	}
</script>
</body>
</html>