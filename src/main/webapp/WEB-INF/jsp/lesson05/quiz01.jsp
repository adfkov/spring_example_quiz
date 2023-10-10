<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>1. JSTL Core 변수</h1>
	<c:set var="num1">36	</c:set>
	<c:set var="num2">3</c:set>
	<h4>첫번째 숫자:<c:out value="${num1}" /><br></h4>
	<h4>두번째 숫자:<c:out value="${num2}" /></h4>
	
	<h1>2. JSTL core 연산</h1>
	<h4>더하기 :<c:out value="${num1 + num2}" /><br></h4>
	<h4>빼기 :<c:out value="${num1 - num2}" /></h4>
	<h4>곱하기 :<c:out value="${num1 * num2}" /></h4>
	<h4>나누기 :<c:out value="${num1 / num2}" /></h4>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" escapeXml="true"/>
	
	<h1>4. JSTL core if</h1>
	<c:if test="${((num1+num2)/2) >= 10}">
		<h1>${((num1+num2)/2)}</h1>
	</c:if>
	
	<c:if test="${((num1+num2)/2) < 10}">
		<h3>${((num1+num2)/2)}</h3>
	</c:if>
	
	<c:if test="${(num1 * num2) > 100}">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false"/>
	</c:if>
	</div>
</body>
</html>