<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- Header -->
<style>


    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: relative;
        min-width: 160px;
        overflow: auto;
    }

    .dropdown-content a {
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        border-bottom: inherit;
    }

    .dropdown a:hover {background-color: #f1f1f1}

    .show {display:block;}
</style>
<header id="header">
    <h1><a href="/">SHUM๐ง</a></h1>
    <nav id="nav">
        <ul>
            <li class="special">
                <a href="#menu" class="menuToggle"><span>๋ฉ๋ด</span></a>
                <div id="menu">
                    <ul>
                        <li><a href="/map/mapPage">๋ด ์ฃผ์์ฐ์ฐ</a></li>
                        <li><a href="/charge/payway">์ด์ฉ๊ถ ๊ตฌ๋งค</a></li>
                        <li><a href="elements.html">์ด์ฉ์๋ด</a></li>
                        <li><a href="#">์ค๋์ ๋ ์จ</a></li>
                        <li>
                            <a onclick="myFunction()" class="dropbtn">ํ์์ ๋ณดโฌ๏ธ</a>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="/main/myPageAccount">๊ณ์ ์ ๋ณด</a>
                                <a href="/main/myPage">์ด์ฉ๊ถ์ ๋ณด</a>
                            </div>
                        </li>

                        <li><a href="/logout">๋ก๊ทธ์์</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
</header>
