<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>🚨신고하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <jsp:include page="../layout/same_css_form.jsp" flush="false"></jsp:include>
    <jsp:include page="../popup_layout/same_css.jsp" flush="false"></jsp:include>

    <style>
        .limiter {
            background-image: -moz-linear-gradient(top,rgb(243 2 2 / 79%), rgb(211 21 21 / 20%)), url('/images/bg02.jpg');
            background-image: -webkit-linear-gradient(top, rgb(243 2 2 / 79%), rgb(211 21 21 / 20%)), url('/images/bg02.jpg');
            background-image: -ms-linear-gradient(top, rgb(243 2 2 / 79%), rgb(211 21 21 / 20%)), url('/images/bg02.jpg');
            background-image: linear-gradient(top, rgb(243 2 2 / 79%), rgb(211 21 21 / 20%)), url('/images/bg02.jpg');
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
        .container{
            font-size: 1.25em;
        }

    </style>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" onsubmit="return false;">
					<span class="login100-form-title p-b-26">
						신고하기
					</span>
                <span class="login100-form-title p-b-25">
						<i class="zmdi zmdi-phone-msg"></i>
					</span>

                <p class="notify"><i class="zmdi zmdi-notifications-add"></i>회원님이 빌리신 우산모델번호를 입력해주세요. </p>
                <div class="wrap-input100 validate-input" data-validate = "우산 모델번호를 넣어주세요!">
                    <label>우산모델번호</label>
                    <input class="input100" type="text" name="umbrella_number" id="umbrella_number" >
                </div>

                <h2>📦고장부위</h2>


                <div class="container">
                    <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                        <div class="col">
                            <div class="form-check">
                                <input class="form-check-input" name="complain" type="checkbox" value="천찢" id="complain1">
                                <label class="form-check-label" for="complain1">
                                    💧천이찢어짐<br><br>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="complain" type="checkbox" value="우산안잠김" id="complain2">
                                <label class="form-check-label" for="complain2">
                                    🌂우산이 잘 안잠김
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-check">
                                <input class="form-check-input" name="complain" type="checkbox" value="우산살튀" id="complain3">
                                <label class="form-check-label" for="complain3">
                                    ☔우산의 살이 튀어나옴
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="complain" type="checkbox" value="기타사항" id="complain4">
                                <label class="form-check-label" for="complain4">
                                    😢기타사항
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn" onclick="send_complain_info()">
                            접수하기
                        </button>
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
            ✔신고가 접수되었습니다.서비스에 불편을 끼쳐드려 죄송합니다.
        </p>
        <div class="d-grid gap-2 mx-auto">
            <button class="btn btn-primary button-color" onclick="closePopup(this.value)" value="close" id="close"><i class="zmdi zmdi-check-circle"></i>확인</button>
        </div>
    </div>
</div>

<div id="dropDownSelect1"></div>



<jsp:include page="../layout/same_script_form.jsp" flush="false"></jsp:include>

<script>

    function showPopup(hasFilter) {
        const popup = document.querySelector("#popup");

        if (hasFilter) {
            popup.classList.add('has-filter');
        } else {
            popup.classList.remove('has-filter');
        }

        popup.classList.remove('hide');

    }

    function closePopup(state) {
        const popup = document.querySelector("#popup");
        popup.classList.add('hide');

        if(state=="success_complain"){
            window.location="/";
        }

    }
</script>

<script src="/kiosk/qrcode_detection/send_complain_info.js"></script>
</body>
</html>