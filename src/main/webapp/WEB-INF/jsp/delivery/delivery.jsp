<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>배탈의민족</title>
<link rel="stylesheet" type="text/css" href="/css/delivery/delivery.css" />
</head>
<body>
	<div class="container">
		<header class="header bg-primary d-flex  align-items-center">
			<div class="header-logo text-white font-weight-bold pl-5">
				배탈의 민족
			</div>
		</header>
		
		<nav class="nav">
			<h1 class="nav-logo mt-3 ml-3">
				우리동네 가게
			</h1>
		</nav>
		
		<section class="section">
		<div class="stores">
			<c:forEach items="${stores}" var="store" varStatus="status">
				<div class="store"><a href=""></a>
					<div class="name">${store.name}</div>
					<div class="phoneNumber">${store.phoneNumber}</div>
					<div class="address">${store.address}</div>
				</div>
			</c:forEach>
			
		</div>
		</section>
		
	</div>
</body>	
</html>