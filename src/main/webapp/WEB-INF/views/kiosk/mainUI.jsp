<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>SHUM키오스크</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fullscreen Slit Slider with CSS3 and jQuery" />
    <meta name="keywords" content="slit slider, plugin, css3, transitions, jquery, fullscreen, autoplay" />
    <meta name="author" content="Codrops" />

    <!-- 원래있던 공통css -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <noscript><link rel="stylesheet" href="/main_page/assets/css/noscript.css" /></noscript>


    <!-- 새로운 css -->
    <link rel="stylesheet" type="text/css" href="/kiosk/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="/kiosk/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/kiosk/css/custom.css" />
    <script type="text/javascript" src="/kiosk/js/modernizr.custom.79639.js"></script>
    <noscript>
        <link rel="stylesheet" type="text/css" href="/kiosk/css/styleNoJS.css" />

    </noscript>




    <style>

        h1, h2, h3, h4, h5, h6,a {
            font-family: 'Do Hyeon', sans-serif !important;
        }

        p{
            font-family: 'Nanum Gothic',sans-serif !important;
        }

        .form_button li:hover{
            background-color:rgb(0 0 0 / 23%);
        }

        a{
            border-bottom: 0px;
        }

        .wrapper.style1 {
            background-color: #dc3545;
            color: #c8ece9;
        }
        @media screen and (max-width: 736px){
            .icon.major {
                -moz-transform: rotate(-45deg);
                -webkit-transform: rotate(
                        -45deg);
                -ms-transform: rotate(-45deg);
                transform: rotate(
                        -45deg);
                border-radius: 3px;
                border: solid 2px #fff;
                display: inline-block;
                font-size: 4.35em;
                height: calc(3em + 2px);
                line-height: 3em;
                text-align: center;
                width: calc(5em + 5px);
            }
        }

        @media screen and (min-width: 736px){
            .icon.major {
                -moz-transform: rotate(-45deg);
                -webkit-transform: rotate(
                        -45deg);
                -ms-transform: rotate(-45deg);
                transform: rotate(
                        -45deg);
                border-radius: 3px;
                border: solid 2px #fff;
                display: inline-block;
                font-size: 7.35em;
                height: calc(3em + 2px);
                line-height: 3em;
                text-align: center;
                width: calc(5em + 5px);
            }
        }



        .instruction{
            font-size: 2.35em;
            color: white;
            position: relative;
            bottom: 54px;
        }
        .instruction:hover{
            color:#00ffcc;
        }

        #popup {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .7);
            z-index: 1;
        }

        #popup.hide {
            display: none;
        }

        #popup.has-filter {
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
        }

        #popup .content {
            padding: 20px;
            background: rgb(255 255 255 / 20%);
            border-radius: 5px;
            color:white;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
        }

        .label{
            color:white;
        }

        .demo-1 .bg-4 .sl-slide-inner, .demo-1 .bg-4 .sl-content-slice {
            background: #dc3545;
        }
        .last-thing{
            position: relative;
            bottom:1em;
        }
        h3{
            color:#fffdfd;
            font-size: 1.5em;
            z-index: 99999999;
            position: absolute;

        }

        .demo-1 [data-icon]:after {
            font-family: 'Gugi', cursive;
            font-size: 55px;
        }
        .demo-1 .bg-2 .sl-slide-inner{
            background-color:black;
            background-image: linear-gradient( rgb(0 0 0 / 65%), rgb(0 0 0 / 65%) ),url(./images/bg02.jpg);
            background-size:cover;
        }
        .demo-1 .deco{
            border: 68px solid rgb(0 0 0 / 54%);
        }
        @media screen and (max-width: 660px){
            .demo-1 .deco {
                width: 150px;
                height: 150px;
            }
            .demo-1 .sl-slide h2 {
                line-height: 21px;
                font-size: 33px;
                margin-bottom: -37px;
                letter-spacing: -2px;
                color: #ecd82c;
            }
        }

        .demo-1 .sl-slide blockquote {
            color: #ffffff;
            font-size: 20px;
            line-height: 24px;
        }
    </style>

</head>
<body>

<div class="container demo-1">


    <div id="slider" class="sl-slider-wrapper">

        <div class="sl-slider">


            <div class="sl-slide bg-2" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
                <div class="sl-slide-inner">
                    <div class="deco" data-icon="슘"></div>
                    <h2>SHUM우산공유플랫폼</h2>
                    <blockquote><p>키오스크에서 회원님이 가지고 계신 이용권이나 긴급대여서비스로 우산을 빌려보세요</p><cite>우산같이쓸래요<br><br><br><br>아무곳이나 터치해주세요</cite></blockquote>
                </div>
            </div>


            <div class="sl-slide bg-4" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
                <div class="sl-slide-inner">
                    <body class="landing is-preload">
                    <div id="page-wrapper">


                        <!-- Banner -->
                        <section id="one" class="wrapper style1 special">
                            <div class="inner">
                                <header class="major">
                                    <!-- <h2>원하시는 서비스를 선택하여주세요.</h2> -->
                                </header>
                                <ul class="icons major ticket-choices">
                                    <li >
                                        <a href="" id="rental">
														<span class="icon far fa-calendar-alt major style1" style="background: #035811;">
															<span class="label">✔️대여</span>
														</span>
                                            <h3>이용권을통해</h3>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" id="return">
														<span class="icon far fa-clock major style2" style="background: #bdbd00cc">
															<span class="label">👋반납</span>
														</span>
                                            <h3>이용권을통해</h3>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/main/complain">
														<span class="icon solid far fa-thumbs-up major style3" style="background:#3e000063">
															<span class="label">🚨신고</span>
														</span>
                                            <h3 class="last-thing">지금바로!</h3>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </section>





                    </div>
                    </body>
                </div>
            </div>

            <div class="sl-slide bg-4" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
                <div class="sl-slide-inner">
                    <div id="page-wrapper">


                        <!-- Banner -->
                        <section id="one" class="wrapper style1 special">
                            <div class="inner">
                                <header class="major">
                                    <!-- <h2>원하시는 서비스를 선택하여주세요.</h2> -->
                                </header>
                                <ul class="icons major ticket-choices">
                                    <li >
                                        <a href="/main/rental/qrcode" id="qrcode">
													<span class="icon far fa-calendar-alt major style1" style="background: #0000007a">
														<span class="label">🎫QR코드</span>
													</span>
                                            <h3 class="page2">이용권을통해</h3>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/main/rental/reservation_code"  id="reservation">
													<span class="icon far fa-clock major style2" style="background: #181807;">
														<span class="label">🔢예약번호</span>
													</span>
                                            <h3 class="page2">이용권을통해</h3>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </section>





                    </div>

                </div>
            </div>

        </div><!-- /sl-slider -->

        <nav id="nav-arrows" class="nav-arrows">
            <span class="nav-arrow-prev" id="nav-arrow-prev" style="display: none;">Previous</span>
            <span class="nav-arrow-next" style="display: none;">Next</span>
        </nav>


    </div><!-- /slider-wrapper -->

</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="/kiosk/js/jquery.ba-cond.min.js"></script>
<script type="text/javascript" src="/kiosk/js/jquery.slitslider.js"></script>

<!-- 화면이동과 이전버튼 형성에 대한 스크립트코드 -->
<script type="text/javascript">

    var arrow_prev=document.getElementById("nav-arrow-prev");
    var touch_count=0;



    $(function() {

        var Page = (function() {

            var $navArrows = $( '#nav-arrows' ),
                $rental=$("#rental"),
                $return=$("#return"),
                $nav = $( '#nav-dots > span' ),
                slitslider = $( '#slider' ).slitslider( {
                    onBeforeChange : function( slide, pos ) {

                        $nav.removeClass( 'nav-dot-current' );
                        $nav.eq( pos ).addClass( 'nav-dot-current' );

                    }
                } ),

                init = function() {

                    initEvents();

                },
                initEvents = function() {



                    // add navigation events
                    window.addEventListener( 'click', function() {

                        slitslider.next();
                        touch_count+=1;
                        arrow_function();
                        return false;

                    } );

                    $rental.on('click',function(){
                        slitslider.next();
                        touch_count+=1;
                        $("#qrcode").attr("href","/main/rental/qrcode");
                        $("#reservation").attr("href","/main/rental/reservation_code");
                        arrow_function();
                        return false;
                    });

                    $return.on('click',function(){
                        slitslider.next();
                        $("#qrcode").attr("href","/main/return/qrcode");
                        $("#reservation").attr("href","/main/return/reservation_code");
                        touch_count+=1;
                        arrow_function();
                        return false;
                    })

                    $navArrows.children( ':first' ).on( 'click', function() {

                        slitslider.previous();
                        touch_count-=1;
                        arrow_function();
                        return false;

                    } );


                },
                arrow_function=function(){//실제로 버튼이 눌릴때 마다 카운트 증가시켜서 그 카운트에 따른 전 버튼을 보여주고 말고를 결정
                    if(touch_count>2){
                        touch_count=0;
                        arrow_prev.style.display='none';
                    }

                    else if(touch_count>=1){
                        arrow_prev.style.display='inline';
                    }
                    else{
                        arrow_prev.style.display="none";
                    }


                };

            return { init : init };

        })();

        Page.init();

        /**
         * Notes:
         *
         * example how to add items:
         */

        /*

        var $items  = $('<div class="sl-slide sl-slide-color-2" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1"><div class="sl-slide-inner bg-1"><div class="sl-deco" data-icon="t"></div><h2>some text</h2><blockquote><p>bla bla</p><cite>Margi Clarke</cite></blockquote></div></div>');

        // call the plugin's add method
        ss.add($items);

        */

    });
</script>

</body>
</html>