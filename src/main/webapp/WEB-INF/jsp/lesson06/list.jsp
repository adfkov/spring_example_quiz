<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

		<link rel="stylesheet" href="/css/tree/tree.css" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
	<div class="container">
			<header class="bg-white d-flex justify-content-center align-items-center">
				<div class="headerlogo">
				<h1>통나무 팬션</h1>
				</div>
			</header>
			<nav class="navi justify-content-center align-items-center mt-4">
				<ul class="nav nav-fill list-unstyled w-100">
					<li class="nav-item"><a href="#">팬션 소개</a></li>
					<li class="nav-item"><a href="#">객실 보기</a></li>
					<li class="nav-item"><a href="/lesson06/quiz03/reserve">예약안내</a></li>
					<li class="nav-item"><a href="#">커뮤니티</a></li>
				</ul>
			</nav>
			<table class="table text-center">
				<tr>
					<th>이름</th>
					<th>예약날짜</th>
					<th>숙박일수</th>
					<th>숙박인원</th>
					<th>전화번호</th>
					<th>예약상태</th>
					<th></th>
				</tr>
				
				<c:forEach items="${treeList}" var="tree" varStatus="status">
					<tr>
						<td>${tree.name}</td>
						<td>
					<fmt:formatDate value="${tree.date}" pattern="yyyy년 M월 d일"  var="newDate"/>
						${newDate}
						</td>
						<td>${tree.day}</td>
						<td>${tree.headcount}</td>
						<td>${tree.phoneNumber}</td>
						<td>
						<c:choose>
							<c:when test="${tree.state eq '대기중'}">
								<span class="text-primary">${tree.state}</span>
							</c:when>
							
							<c:otherwise>
								<span class="text-success">${tree.state}</span>
							</c:otherwise>
						</c:choose>
						</td>
						<td><button type="button" class="deleteBtn btn btn-danger" data-tree-id="${tree.id}">삭제</button></td>
					</tr>
					
				</c:forEach>
			</table>
	</div>
	
	<script>
		$(document).ready(function() {
			$(".deleteBtn").on("click", function() {
				let id = $(this).data("tree-id");
				//alert(id);
				
				$.ajax({
					type:"DELETE"
					,url: "/lesson06/quiz03/delete-tree"
					, data: {"id": id}
					, success : function(data) {
						if(data.result== "success") {
							alert("삭제 되었습니다.");
							location.reload(true);
						// {"code": 200, "result" :"success"}
						} else {
							// 서버 로직 상 에러
							alert("삭제하는 데 실패했습니다.");
						}
					}
					, error: function(request, status, error) {
						alert("삭제하는 데 실패, 관리자 문희해줘용");
					}
				});
			});
		});
	</script>
</body>
</html>