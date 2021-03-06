<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/admin_singo_complete.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_log.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hostregister.css">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"/>
    <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/javascript/processWithforceStop.js"></script>
    <title>관리자 삭제 파일</title>
</head>
<style>
    .menu a {
        cursor: pointer;
    }

    .menu .hide {
        display: none;
    }
</style>
<body>

<!-- header-start -->
<header class="logo" style="position: sticky;">
    <div class="headermenu">
        <span><i class="fas fa-user-slash" style="font-size: 35px; float: left;"></i></span>
        <label for class="loglabel">블랙리스트 페이지</label>
        <ul>
            <li class="menu" style="list-style: none;">
                <label for="" style="font-size: 40px;">메뉴</label>
                <ul class="hide" style="list-style: none; padding-top: 25px; float: initial; padding-right: 20px;">
                    <li class="item">
                        <a href="http://localhost:8080/cnc/blamelist.mdo">신고관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/salesChart.mdo">통계</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/getRegisterWaitingList.mdo">호스트관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/logPage.mdo">로그관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/makeCuponView.mdo">쿠폰관리</a>
                    </li>
                    <li class="item">
                        <a href="http://localhost:8080/cnc/goNoticeListAdmin.mdo">게시판관리</a>
                    </li>
                    <li class="item">
                        <a href="/cnc/logout.mdo" style="color: white;">로그아웃</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>
<!-- header-end -->


<!-- slider_area_start -->
<div class="chartcount" style="text-align: center; margin-top: 150px;">
    <p id="counter1" style="float: left; width: 33%;"></p>
    <p id="counter2" style="float: left; width: 33%;"></p>
    <p id="counter3" style="float: left; width: 33%;"></p>
</div>
<div class="charttitle" style="text-align: center;">
    <label style="float: left; width: 33%;">일주일간 추가된 블랙리스트</label>
    <label style="float: left; width: 33%;">한달간 추가된 블랙리스트</label>
    <label style="float: left; width: 33%;">블랙리스트 총합</label>
</div>
<br/>

<!-- 사이드 메뉴 -->
<div class="total_container">
    <div id="sidediv">
        <ul id="sidemenu">
            <li class="menu"><a href="/cnc/blamelist.mdo">신규 신고 내역</a></li>
            <li class="menu"><a href="/cnc/blacklist.mdo">블랙리스트 보기</a></li>
        </ul>
    </div>
    <!-- 블랙리스트 테이블 -->
    <c:set var="blacklist" value="${blacklist}"/>
    <div style="color: black;" class="table-responsive">
        <form class="blacklist-id-search-form" action="/cnc/blacklistSearchEmail.mdo" method="get">
            검색할 이메일 :
            <input type="text" name="blackSearchEmail"/>
            <input type="submit" value="검색"/>
        </form>
        <table style="color: black;" class="table">
            <c:forEach var="item" items="${blacklist}" begin="0" end="${blacklist.size()}" step="1">
                <tr>
                    <td>${item.black_email}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>


<script>
    function numberCounter(target_frame, target_number) {
        this.count = 0;
        this.diff = 0;
        this.target_count = parseInt(target_number);
        this.target_frame = document.getElementById(target_frame);
        this.timer = null;
        this.counter();
    }

    numberCounter.prototype.counter = function () {
        var self = this;
        this.diff = this.target_count - this.count;

        if (this.diff > 0) {
            self.count += Math.ceil(this.diff / 5);
        }

        this.target_frame.innerHTML = this.count
            .toString()
            .replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        if (this.count < this.target_count) {
            this.timer = setTimeout(function () {
                self.counter();
            }, 20);
        } else {
            clearTimeout(this.timer);
        }
    };

    new numberCounter("counter1", ${blackListCount[0]});
    new numberCounter("counter2", ${blackListCount[1]});
    new numberCounter("counter3", ${blackListCount[2]});
</script>


<script>
    jQuery(document).ready(function () {
        jQuery(".menu>label").click(function () {
            var submenu = jQuery(this).next("ul");
            if (submenu.is(":visible")) {
                submenu.slideUp();
            } else {
                submenu.slideDown();
            }
        });
    });
</script>

</html>
