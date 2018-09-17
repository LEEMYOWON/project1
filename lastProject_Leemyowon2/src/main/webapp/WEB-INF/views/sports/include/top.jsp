<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Baseball</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Negotiation Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript">
function openAnalysis(game_CD){
	$.ajax({
		url : ''
	})
}

</script>
<!-- //for-mobile-apps -->
<link href="/resources/sports/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/resources/sports/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="/resources/sports/js/jquery-2.1.4.min.js"></script>
<script src="/resources/sports/js/main.js"></script>
<!-- //js -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="/resources/sports/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<link rel="stylesheet" href="/resources/sports/css/flexslider.css" type="text/css" media="screen" property="" />
<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
 </head>
<body>
<!-- banner -->
	<div style="background-color:#fff" class="w3ls-banner-info-bottom" >
<!-- 		<div class="container"> -->
<!-- 					<div class="clearfix"> </div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main"><img src="/resources/sports/images/teamlogo/logo_main.png" width="90px" height="50px"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="cl-effect-13" id="cl-effect-13">
						<ul class="nav navbar-nav">
							<li class="active"><a href="main" style="font-size:18px">Home</a></li>
							<li><a href="schedule" style="font-size:18px">일정/결과</a></li>
							<li><a href="player_info" style="font-size:18px">선수정보</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size:18px">기록실<b class="caret"></b></a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="pitching_Record" style="font-size:15px">투수기록</a></li>
									<li><a href="hitting_Record" style="font-size:15px">타자기록</a></li>
								</ul>
							</li>
							<li><a href="" style="font-size:18px">뉴스</a></li>
						</ul>
						<div class="w3_agile_login" style="padding-top: 13px;">
							<div class="cd-main-header">
							
								<a href="#login_form">로그인</a>						
<!-- 								<a class="cd-search-trigger" href="#cd-search"></a> -->
								<!-- cd-header-buttons -->
							</div>
<!-- 							<div id="cd-search" class="cd-search"> -->
<!-- 								<form action="#" method="post"> -->
<!-- 									<input name="Search" type="search" placeholder="Search..."> -->
<!-- 								</form> -->
<!-- 							</div> -->
						</div>
					</nav>
				</div>
			</nav>
		</div>
	</div>
	<div class="banner">
		<div class="container">
			<section class="slider">
					<div class="flexslider">
						<ul class="slides">
						<c:forEach var="i" items="${teamList}">
							<li>
								<div class="agileits_w3layouts_banner_info" style="width:1140px; height:400px; ">
									<h3>Today</h3>
									<p>
									<img src="/resources/sports/images/teamlogo/logo_${i.awayTeam_CD}.png" align="left" style="width:180px; height:160px;"/>
									<img src="/resources/sports/images/teamlogo/logo_${i.homeTeam_CD}.png" align="right" style="width:180px; height:160px;"/></p>
									<div class="agileits_w3layouts_more">
										<a href="#" data-toggle="modal" data-target="#myModal" onclick="openAnalysis('${i.game_CD}')">전력분석</a>
									</div>
								</div>
							</li>
						</c:forEach>							
						</ul>
					</div>
				</section>
			<!-- flexSlider -->
				<script defer src="/resources/sports/js/jquery.flexslider.js"></script>
				<script type="text/javascript">
					$(window).load(function(){
					  $('.flexslider').flexslider({
						animation: "slide",
						start: function(slider){
						  $('body').removeClass('loading');
						}
					  });
					});
				</script>
			<!-- //flexSlider -->
		</div>
	</div>
<!-- //banner -->
<%@ include file="../login/loginModal.jsp" %>	