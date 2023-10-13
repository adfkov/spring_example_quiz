<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.
</style>

<link rel="stylesheet" type="text/css" href="/css/weather_history/weather.css" />
</head>
<body>
	<div class="wrap">
		<section class="section d-flex">
			<nav class="col-2">
				<header class="d-flex justify-content-center align-items-center mt-4">
					<img src="/img/기상청.png" width=30 height=30>
					<div class="gisangchung_text text-white font-weight-bold ml-1">기상청</div>
				</header>
				<navbody>
					<ul class="nav flex-column mt-4">
						<li class="nav-item mt-4">
							<a href="/weather_history/weather" class="a text-white font-weight-bold">날씨
							</a>
						</li>
						<li class="nav-item mt-4">
							<a href="/lesson05/add-weather-view" class="a text-white font-weight-bold">날씨입력
			
							</a>
						</li>
						<li class="nav-item mt-4">
							<a href="#" class="a text-white font-weight-bold">테마날씨
							
							</a>
						</li>
							<li class="nav-item mt-4">
							<a href="#" class="a text-white font-weight-bold">관측 기후	
							
							</a>
						</li>
					</ul>
				</navbody>
			</nav>
			<content class="col-10">
				<h2 class="mt-4 ml-4">과거 날씨</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${weathers}" var="weather">
							<tr>
							<fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일" var="pattern1"/>
								<td>${pattern1}</td>
								
							<td>
							<c:choose>
								<c:when test="${weather.weather eq '맑음'}">
									<img src="/img/sunny.jpg" width="30" height="30">
								</c:when>
								
								<c:when test="${weather.weather eq '구름조금'}">
									<img src="/img/partlyCloudy.jpg" width="30" height="30">
								</c:when>
								
								<c:when test="${weather.weather eq '흐림'}">
									<img src="/img/cloudy.jpg" width="30" height="30">
								</c:when>
								
								<c:when test="${weather.weather eq '비'}">
									<img src="/img/rainy.jpg" width="30" height="30">
								</c:when>
							</c:choose>
							</td>
							<td>${weather.temperatures}℃</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
							</tr>
							<%--
								private Date date;
	private String weather;
	private float temperatures;
	private float precipitation;
	private String microDust;
	private float windSpeed;
							 --%>
						</c:forEach>
					</tbody>
				</table>
			
			</content>
		</section>
		
		<footer class="d-flex">
			<footer-left class="col-2">
				<img src="/img/기상청흑백.png" width=100% height=100%>
			</footer-left>
			<footer-right class="col-10">
				<div class="footer-right-wrap mt-3 ml-3">
					<div class="footer_text_first text-secondary">(07062) 서울시 동작구 여의대방로16길 61</div>
					<div class="footer_text_second mt-2 text-secondary">Copyright@2020 KMA. All Rights RESERVED.</div> 
				</div>
			</footer-right>
		</footer>
	</div>
</body>
</html>