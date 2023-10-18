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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${urlList}" var="url" varStatus="status">
				<tr>
					<td id="urlId">${url.id}</td>
					<td>${url.name}</td>
					<td><a href="${url.url}" target="_blank">${url.url}</a></td>
					<td>
				<%-- value 속성을 이용해서 값 세팅 --%>
				<%-- 	<button type="button" class="del-btn btn bg-danger form-control text-white" value="${url.id}">삭제--%>

				<%--2) data를 이용해서 태그에 값을 세팅: 대문자 X--%>
					<button type="button" class="del-btn btn btn-danger" data-bookmark-id="${url.id}" data-url="">삭제</button>
	
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</body>

	<script>
		$(document).ready(function() {
			$(".del-btn").on('click', function(e) {
				//1
				//let id = $(this).val();
				
				// 2)
			//	let id = e.target.value; // 지금 클릭된 것
			
			// ----------data--------------
			
			// data-bookmakr-id => data("bookmark-id") 함수 사용
			let id = $(this).data('bookmark-id'); // 지금 클릭된 버튼
			alert(id);
			
			$.ajax({
				// request
				type:"DELETE"
				, url: "/lesson06/quiz02/delete-bookmark"
				, data: {"id": id}
				
		
				// response
				, success: function(data) {
					if(data.code == 200) {
						// 새로고침 위치 그대로
						location.reload(true);
					} else {
						alert("삭제를 하는 데 실패했습니다. 다시 시도요")
					}
				}
				, error:function(request, status, error) {
					alert("삭제를 하는  데실패 관리자!");
				}
				
			})
			
			//	alert(id);
			/*	$.ajax({
					type:"POST"
						, url: "/lesson06/quiz02/delete-bookmark"
						, data: {"id": id}
				
						, success: function(data) {
							location.href ="/lesson06/quiz01/bookmark-list-view";
						}
				}) */
			})
			
		})
	
	</script>
</html>