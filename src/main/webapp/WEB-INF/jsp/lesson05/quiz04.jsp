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
</head>
<body>
	<div class="container">
		<img src="/img/sunny.jpg">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>국적</th>
				<th>이메일</th>
				<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members}" var="member" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${member.name}</td>
						<td>
						<c:choose>
							<c:when test="${member.phoneNumber.startsWith('010')}">
								${member.phoneNumber}
							</c:when>
							<c:otherwise>
								<pre>유효하지 않은 전화번호</pre>
							</c:otherwise>
						
						</c:choose>
						</td>
					<%-- <td></td>--%>
					<c:set var="nat" value="${member.nationality}" />
					
					<td>${fn:replace(nat, "삼국시대", "삼국 - ")} </td> <%-- ${fn:replace(member.nationality, "삼국시대", "삼국 - " --%>
					
					<td>
					<b>${fn:split(member.email,'@')[0]}</b>@${fn:split(member.email,'@')[1]}
					
					</td>
					
					
					<td class="text-left">
					<c:choose>
						<c:when test="${member.introduce.length() > 15}"> <%-- length(member.introduce) --%>
							${fn:substring(member.introduce,0,15)}...
						</c:when>
						<c:otherwise>
							${member.introduce}
						</c:otherwise>
					</c:choose>
					</td>
					
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>