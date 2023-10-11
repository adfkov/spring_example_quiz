<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h1>1.후보자 득표율</h1>
		<table class="table text-center">
			<thead>
				<th>기호</th>
				<th>득표 수</th>
				<th>득표 율</th>
			</thead>
			
			<tbody>
				<c:forEach items="${candidates}" var="candidate" varStatus="status">
					<tr>
					<td>${status.count}</td>
					<td><fmt:formatNumber value="${candidate}" type="number"/></td>
					<td><fmt:formatNumber value="${candidate / 10000}" type="number" pattern="##"/>%</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table class="table text-center">
			<thead>
				<th>사용처</th>
				<th>가격</th>
				<th>사용 날짜</th>
				<th>할부</th>
			</thead>
			
			<tbody>
				<c:forEach items="${cardBills}" var="cardBill" varStatus="status">
					<tr>
					<td>${cardBill.store}</td>
					<td><fmt:formatNumber value="${cardBill.pay}" type="currency"/></td>
					
					<fmt:parseDate value="${cardBill.date}" pattern="yyyy-M-d" var="date"/>
					<fmt:formatDate value="${date}" pattern="yyyy년 M월 d일"  var="newDate"/>
					<td>${newDate} </td>
					<td>${cardBill.installment}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>