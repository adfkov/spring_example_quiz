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

<!-- datepicker -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

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
			
			<section class="section d-flex justify-content-center">
				<div class="hh">
					<h1 class="mt-4 md-4 text-center">예약하기</h1>
				<div class="form-group">	
					<label for="name">이름
						<input type="text" name="name" id="name" class="form-control w-100">
					</label>
				</div>
				<div class="form-group">
					<label for="date">예약날짜
						<input type="text" name="date" id="date" class="form-control w-100">
					</label>
				</div>
				<div class="form-group">
					<label for="day">숙박일수
						<input type="text" name="day" id="day" class="form-control w-100">
					</label>
				</div>
				
				<div class="form-group">
					<label for="headcount">숙박인원
						<input type="text" name="headcount" id="headcount" class="form-control w-100">
					</label>
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호
						<input type="text" name="phoneNumber" id="phoneNumber" class="form-control w-100">
					</label>
				</div>
				<button type="button" id="reserveBtn"class="btn btn-warning w-100">예약하기</button>
				</div>
			</section>		
	</div>
	
	<script>
	$(document).ready(function() {
		//1) datepicker
		$('input[name=date]').datepicker({
			dateFormat:"yy-mm-dd"
			, minDate: 0 // 오늘
			, 
		});
	
		// 2) 예약 추가
		$('#reserveBtn').on('click', function() {
			//alert("에러 없어여!");
			let name = $('#name').val().trim();
			let date = $('#date').val().trim();
			let day = $('#day').val().trim();
			let headcount = $('#headcount').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			if(name == "") {
				alert("이름을 입력하세요.");
				return;
			}
			if(date == "") {
				alert("예약날짜를 입력하세요.");
				return;
			}
			if(isNaN(day) || !(day)) {
				alert("숙박일수를 숫자로 입력하세요.");
				return;
			}
			if(isNaN(headcount) || !(headcount)) {
				alert("숙박인원을 숫자로 입력하세요.");
				return;
			}
			if(isNaN(phoneNumber) || !(phoneNumber)) {
				alert("전화번호를 숫자로 입력하세요.");
				return;
			}
			
			console.log(name);
			console.log(date);
			console.log(day);
			console.log(headcount);
			console.log(phoneNumber);
		 	$.ajax({
				type:"POST"
				, url:"/lesson06/quiz03/add-tree"
				, data : {"name" :name , "date":date ,"day":day ,"headcount":headcount , "phoneNumber":phoneNumber}
				, success: function(data) {
					if(data.result =="success") {
						alert("예약 완료되었습니다!");
						location.href="/lesson06/quiz03/1";
					}
				}
				,error :function(request,status,error) {
					alert("예약 대실패");
					
				} 
			});
			
		});
	});
	
	</script>
			</body>
			</html>
			