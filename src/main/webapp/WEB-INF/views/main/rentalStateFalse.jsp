<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
	<title>ð¨ëì¬íì´ì§</title>
	<jsp:include page="../layout/same_css.jsp" flush="false"></jsp:include>


	<style>
		.form_button li:hover{
			background-color:rgb(0 0 0 / 23%);
		}
	</style>
</head>
<body class="landing is-preload">

<!-- Page Wrapper -->
<div id="page-wrapper">

	<jsp:include page="../layout/same_menu.jsp" flush="false"></jsp:include>

	<!-- Banner -->
	<section id="banner" class="wrapper style4 special">
		<div class="inner" style="font-family: 'Nanum Gothic';">
			<h2>ð¨êµ¬í´ì¤ ì°ì°ì¦!ð¨</h2>
			<p>ì§ê¸ ë°ë¡ ë´ ì£¼ìì ì°ì°ìì¹ë¥¼ íì¸íê³  ë¹ë ¤ë³´ì¸ì!</p>
			<!-- <ul class="actions special">
                <li><a href="#" class="button primary">Activate</a></li>
            </ul> -->
			<ul class="features form_button">
				<li class="far fa-map">
					<a href="/map/mapPage" class="">
						<h3>ì§ëë³´ê¸°</h3>
						<p>ì§ëë¥¼ íµí´ ë´ ìì¹ ì£¼ë³ì<br>ì°ì°ë¶ì¤ë¤ì íì¸í©ëë¤.</p>
					</a>
				</li>
				<li class="icon fa-flag">
					<a href="/map/nearBoothPage" class="">
						<h3>ë¦¬ì¤í¸ë³´ê¸°</h3>
						<p>ë¦¬ì¤í¸ë¥¼ íµí´ íì¬ ìì¹ë¥¼ ê¸°ì¤ì¼ë¡<br> ê°ê¹ì´ ê±°ë¦¬ìì¼ë¡ ì°ì°ë¶ì¤ë¤ì <br>íì¸í©ëë¤.</p>
					</a>
				</li>
				<li class="icon fa-flag">
					<a href="/charge/QRcodePage" class="">
						<h3>ëì¬íê¸°</h3>
						<p>QRì½ëë¥¼ í¤ì¤ì¤í¬ì ì°ê³  ì°ì°ì ëì¬í©ëë¤.</p>
					</a>
				</li>
			</ul>
		</div>
		<!-- <a href="#three" class="more scrolly">ë´ ì£¼ìì°ì°</a> -->
	</section>

	<jsp:include page="../layout/same_footer.jsp" flush="false"></jsp:include>

</div>

<jsp:include page="../layout/same_script.jsp" flush="false"></jsp:include>

<%--ìë¨ë°ë¥¼ í¬ëªë ì£¼ë¤ê° ë´ë¦¬ë©´ ìê¸°ê² íê¸° ìí´ì ëì¬,ë°ë© íì´ì§ììë§ ì ì©--%>
<script>
	var tmp=document.getElementById("header");
	tmp.classList.add("alt")
</script>
</body>
</html>