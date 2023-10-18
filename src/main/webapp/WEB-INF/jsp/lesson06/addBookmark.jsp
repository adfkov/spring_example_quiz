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
				<input type="button" class="ml-2 btn btn-sm btn-info" id="urlCheckBtn" value="중복 확인">
			</div>
			<small id="duplicatedText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableText" class="text-success d-none">저장가능한 url 입니다.</small>
		</div>
		
		<input type="button" value="추가" id="btn" class="btn btn-success form-control btn-block">
	</div>
	
		<script>
		$(document).ready(function() {
			// 중복확인 버튼 클릭
			$("#urlCheckBtn").on("click", function() {
				/*alert("이게 클릭이야");  */
				let url = $('#url').val().trim();
				if(!url) {
					alert("검사할 url을 입력하세요.");
					return;
					
				}
				
				// DB에서 URL 중복확인  - AJAX 통신
				$.ajax({ // 내가 만든 브라우저
					// request 
					type:"POST"
					, url: "/lesson06/quiz02/is-duplicated-url"
					, data: {"url": url}
					// response
					, success: function(data) {
						// {"code" : 200, "is_duplication": true} true 중복
						if(data.is_duplication) {
							// 중복
							$('#duplicatedText').removeClass('d-none');
							$('#availableText').addClass('d-none');
							
							
						} else {
							// 중복 아님
							$('#availableText').removeClass('d-none');
							$('#duplicatedText').addClass('d-none');
						}
					}	
					, error: function(request, status, error) {
						alert("중복확인에 실패했습니다.");
					}
				});
 			}); 
			
			
			// 2) jquery의 AJAX 통신 이용하기 // 추가 버튼 클릭
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
				
				// quiz02) 저장 가능한 url인지 체크
				if($('#availableText').hasClass('d-none')) {
					alert("URL 중복확인을 다시해주세요.");
					return;
				}
				
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
					 	if(data =="성공") {
							location.href ="/lesson06/quiz01/bookmark-list-view";
						} 
					}
					
					, error: function(request, status, error) {
						alert(request);
						alert(status);
						alert(error);
						
					}
				});
			});
		
		});
		
	</script>
</body>
</html>