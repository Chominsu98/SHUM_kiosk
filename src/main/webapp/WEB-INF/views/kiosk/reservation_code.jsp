<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>☔Shum_우산같이쓸래요☔</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>
    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>

    <style>
        .limiter {
            background-image: -moz-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/images/bg02.jpg');
            background-image: -webkit-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/images/bg02.jpg');
            background-image: -ms-linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/images/bg02.jpg');
            background-image: linear-gradient(top, rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/images/bg02.jpg');
            background-attachment: fixed;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding-top: 0;}

        span{
            font-family: 'Do Hyeon', sans-serif !important;
        }

        label,h2,button,p{
            font-family: 'Do Hyeon', sans-serif !important;
            color:white;
        }

        .input100{
            font-family: 'Nanum Gothic',sans-serif !important;
            color:white;
        }

        .wrap-login100{
            background: #0000001c;
        }


        .notify{
            color:white;
            text-align: center;
            font-size:23px;
        }

        /*테이블 부분*/
        .head-background{
            background-color: #ff0000ad !important;
            font-family: 'Do Hyeon', sans-serif !important;
        }

        .total-count{
            border-top:dotted 4px;
            border-color:#ff0000ad !important;
            font-family: 'Do Hyeon', sans-serif !important;

        }
        table th,td{
            color:white;
            text-align: center;
            font-size: 0.9em;
        }
        .table>:not(caption)>*>*{
            padding:0.4rem 0.5rem;
        }
        table tr{
            cursor:pointer;
        }
        thead{
            border-style:none !important;
        }
        .table thead th{
            border-bottom:0px;
        }

    </style>
    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>
</head>

<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" onsubmit="return false;">
					<span class="login100-form-title p-b-26">
						예약번호입력
					</span>
                <span class="login100-form-title p-b-25">
						<i class="zmdi zmdi-info"></i>
					</span>

                <p class="notify"><i class="zmdi zmdi-notifications-none"></i>회원님의 이용권번호를 입력해주세요. </p>
                <div class="wrap-input100 validate-input" data-validate = "이용권번호를 넣어주세요!">
                    <label>예약번호</label>
                    <input class="input100" type="text" name="reservation-code" id="reservation_code_input" >
                </div>


                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <c:choose>
                            <c:when test="${state=='rental'}">
                                <button class="login100-form-btn" onclick="check_reservation()">
                                    대여하기
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="login100-form-btn" onclick="check_reservation()">
                                    반납하기
                                </button>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

                <div class="text-center p-t-115">
						<span class="txt1">
							메뉴로 가기
						</span>

                    <a class="txt2" href="/">
                        메뉴
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%--팝업모달창--%>
<div id="popup" class="hide">
    <div class="content">
        <p class="notify" id="notification1">
            ✔성공적으로 qr코드가 인식되었습니다.
        </p>
        <div class="d-grid gap-2 mx-auto">
            <button class="btn btn-primary button-color" onclick="closePopup(this.value,'#popup')" value="first_pass" id="close"><i class="zmdi zmdi-check-circle"></i>확인</button>
        </div>
    </div>
</div>


<%--팝업모달창--%>
<div id="popup_check_verifynum" class="hide">
    <div class="content">
        <c:choose>
            <c:when test="${state=='rental'}">
                <p class="notify" id="notification2">
                    <i class="zmdi zmdi-mail-send"></i>대여를 진행하시겠습니까?
                </p>
            </c:when>
            <c:otherwise>
                <p class="notify" id="notification2">
                    <i class="zmdi zmdi-mail-send"></i>반납을 진행하시겠습니까?
                </p>
            </c:otherwise>
        </c:choose>

        <span class="login100-form-title p-b-25">
						<i class="zmdi zmdi-store"></i>
        </span>
        <div class="d-grid gap-2 mx-auto">
            <c:choose>
                <c:when test="${state=='rental'}">
                    <button class="btn btn-primary button-color" onclick="closePopup(this.value,'#popup_check_verifynum')" value="second_pass" id="confirm"><i class="zmdi zmdi-check-circle"></i>확인</button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-primary button-color" onclick="closePopup(this.value,'#popup_check_verifynum')" value="second_pass_return" id="confirm"><i class="zmdi zmdi-check-circle"></i>확인</button>
                </c:otherwise>
            </c:choose>
            <button class="btn btn-primary button-color" onclick="closePopup(this.value,'#popup_check_verifynum')" value="cancel" id="cancel"><i class="zmdi zmdi-check-circle"></i>취소</button>
        </div>
    </div>
</div>

<%--팝업모달창--%>
<div id="popup_set_new_password" class="hide">
    <div class="content">
        <form class="login100-form validate-form">
					<span class="login100-form-title p-b-7">
						우산고르기
					</span>
            <span class="login100-form-title p-b-10">
						<i class="zmdi zmdi-flag"></i>
					</span>
            <p class="notify"><i class="zmdi zmdi-info-outline"></i>대여가능한 우산을 선택한후 눌러주세요.
            </p>
            <table class="table table-hover">
                <thead class="head-background">

                <tr >
                    <th scope="col">가능</th>
                    <th scope="col">거치대</th>
                    <th scope="col">타입</th>
                    <th scope="col">상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="umbrella" items="${booth.umbrellas}" varStatus="status">
                    <c:choose>
                        <c:when test="${umbrella.brokenState == false}">
                            <tr class="moveto_ticket" id="${status.index}" onClick="clickTable('${umbrella.umbrellaType}',${umbrella.umbrellaNumber})">
                                <th scope="row">
                                    <c:choose>
                                        <c:when test="${umbrella.rentalState==true}">
                                            ❌
                                        </c:when>
                                        <c:otherwise>
                                            ✔
                                        </c:otherwise>
                                    </c:choose>
                                </th>
                                <td>${umbrella.umbrellaNumber}</td>
                                <td>${umbrella.umbrellaType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${umbrella.rentalState==true}">
                                            대여중
                                        </c:when>
                                        <c:otherwise>
                                            대여가능
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </tbody>
                <tfoot class="total-count">
                <tr>
                    <th scope="">대여가능개수</th>
                    <td colspan="3" style="font-size:30px">${booth.leftFreeUmbrella + booth.leftLocationUmbrella}</td>
                </tr>
                </tfoot>
            </table>
        </form>
        <div class="d-grid gap-2 mx-auto">
            <button class="btn btn-primary button-color" onclick="closePopup(this.value,'#popup_set_new_password')" value="third_pass" id=""><i class="zmdi zmdi-check-circle"></i>나가기</button>
        </div>
    </div>
</div>

<%--팝업모달창--%>
<div id="popup_return" class="hide">
    <div class="content">
        <span class="login100-form-title p-b-10">
						<i class="zmdi zmdi-timer"></i>
					</span>
        <p class="notify" id="notification3">
            ✔반납를 진행하기 위해 열리는 부스에 <span id="time" style="color:red">30초</span>안에 {1번}에 우산을 넣어주시기 바랍니다.반납하신 후
            반납완료 버튼을 눌러주세요.
        </p>
        <div class="d-grid gap-2 mx-auto">
            <button class="btn btn-primary button-color" onclick="closePopup(this.value,'#popup_return')" value="return_finish" id="return_finish"><i class="zmdi zmdi-check-circle"></i>반납완료</button>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>
<script src="/kiosk/qrcode_detection/timer.js"></script>
<script>

    function clickTable(umbrella_type,umbrella_number){
        var lookfor_tag=document.getElementById("tmp");
        document.getElementById("popup").style.zIndex='999';
        var notify=document.getElementById("notification1");
        var close_button=document.getElementById("close");
        var my_type=lookfor_tag.innerText;

        my_type=my_type.replace('일일권','');//디비에서가져온 타입은 일일권이라는 이름이 붙어있어서 떼어줌
        if(my_type==umbrella_type){
            notify.innerText="✔"+"["+umbrella_number+"]"+"번 우산 대여가 완료되었습니다.";
            send_umbrella_info(umbrella_number);//여기서 빌릴려는 우산 번호를 서버로 보내줌
            close_button.setAttribute("value","get_back_to_home");
        }
        else{
            notify.innerText="❌고객님의 이용권은"+my_type+"이용권이라 대여가 불가능합니다.다른 타입의 우산을 골라주세요."
        }
        showPopup(true,"#popup");
    }

    function showPopup(hasFilter,id) {
        const popup = document.querySelector(id);

        if (hasFilter) {
            popup.classList.add('has-filter');
        } else {
            popup.classList.remove('has-filter');
        }

        popup.classList.remove('hide');

    }

    function closePopup(state,id) {
        const popup = document.querySelector(id);
        popup.classList.add('hide');

        if(state=="first_pass"){
            //대여,반납1차모달창
            console.log("나 여기");
            showPopup(true,"#popup_check_verifynum");//2차모달화면 보여줌
        }
        else if(state=="second_pass"){
            //대여,반납2차 모달창
            var state='<c:out value="${state}"/>';
            if(state=="rental"&&state==document.getElementById("rentalState").innerText) {
                document.getElementById("notification1").innerText="❌고객님께서는 이미 우산대여를 하셨습니다.중복대여는 안됩니다.";
                document.getElementById("close").setAttribute("value","get_back_to_home");
                showPopup(true,"#popup");
                return;
            }
            else if(state=="return" && state==document.getElementById("rentalState").innerText){
                document.getElementById("notification1").innerText="❌고객님께서는 이미 우산반납을 하셨습니다.중복반납은 안됩니다.";
                document.getElementById("close").setAttribute("value","get_back_to_home");
                showPopup(true,"#popup");
                return;
            }
            showPopup(true,"#popup_set_new_password")
        }
        else if(state=="second_pass_return"){//반납화면에서 반납시간모달창을 보여준다.
            showPopup(true,"#popup_return");
            timer();//타이머함수를 돌려서 시간을 돌려준다
        }
        else if(state=="return_finish"){//반납완료를 마쳤을때
            document.getElementById("notification1").innerText="✔"+document.getElementById("tmp_return_info").innerText+"번 우산반납이 완료되었습니다.다음에 또 이용해주시기 바랍니다.";
            document.getElementById("close").setAttribute("value","get_back_to_home");
            showPopup(true,"#popup");
            send_umbrella_info(document.getElementById("tmp_return_info").innerText)//서버에 반납할려는 우산정보를 보내줌
        }
        else if(state=="return_fail"){
            window.location="/";
        }
        else if(state=="get_back_to_home"){
            window.location='/';//모든 대여나 반납이 완료된 상태로 홈으로 리다이렉트
        }


    }
</script>

<script src="/kiosk/qrcode_detection/check_reservation.js"></script>
<script src="/kiosk/qrcode_detection/send_umbrella_info.js"></script>
</body>
</html>