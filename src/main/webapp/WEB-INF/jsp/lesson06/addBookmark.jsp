<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" id="name" name="name" class="form-control">
		</div>
		<div class="form-group">
		<label for="address">주소</label>
			<div class="d-flex">
				
				<input type="text" id="url" name="url" class="form-control">
				<input type="button" class="ml-2 btn btn-sm btn-primary" id="urlCheckBtn" value="중복 확인">
			</div>
		</div>
		
		<input type="button" value="추가" id="btn" class="btn btn-success form-control btn-block">
	</div>
	
		<script>
		$(document).ready(function() {

			// 2) jquery의 AJAX 통신 이용하기
			$('#btn').on('click', function() {
				//alert("버튼 클릭");
				
				// validation check
				let name = $('#name').val().trim();
				if (name == "") {
					alert("이름을 입력하세요");
					return; 
					}
				
				let url = $('#url').val().trim();
				if (url.length < 1) {
					alert("url을 입력하세요");
					return; 
					}
				if(!((url.startsWith("http://")) || (url.startsWith("https://")) )) {
					alert("다시!");
					return;
					
				}
				
				console.log(name);
				console.log(url);
				$.ajax({
					// request
					type:"POST"
					, url:"http://localhost/lesson06/quiz01/add-bookmark"
					, data: {"name":name, "url":url}
				<%--"{"code":1, "result":"success"}"--%>
						
					// response
					
					// call back 함수
					, success: function(data) { // data: response 응답값(JSON STRING -> 딕셔너리 오브젝)
					// data는 JSON String => Object 변환된 형태로 사용할 수 있다.
					// jquery의 ajax 함수 기능
						alert(data.code);
						alert(data.result)
					/* 	if(data =="성공") {
							location.href ="/lesson06/quiz01/bookmark-list-view";
						} */
					}
					
					, error: function(request, status, error) {
						alert(request);
						alert(status);
						alert(error);
						
					}
				});
			});
		
			// 중복확인 버튼
			$("#urlCheckBtn").on('click', function() {
				if(url)
				$.ajax({
					type:"GET"
						, url:"http://localhost/lesson06/quiz01/is-duplication"
						, data: {"url":url}
				})
			})
		});
		
	</script>
</body>
</html>