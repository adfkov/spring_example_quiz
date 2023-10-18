<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<script
			src="https://code.jquery.com/jquery-3.7.0.js"
			integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			crossorigin="anonymous"
		></script>
		
		<!-- bootstrap-->
		<link
			rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
			integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
			crossorigin="anonymous"
		/>
		
<!--datepicker-->
		
	
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
		<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

		<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"
		></script>
		<link rel="stylesheet" href="Quiz_통나무.css" type="text/css" />
		<title>통나무 팬션</title>
	</head>
	<body>
		<div id="wrap" class="container">
			<header class="bg-white d-flex justify-content-center align-items-center">
				<div class="headerlogo">통나무 팬션</div>
			</header>
			<nav class="navi justify-content-center align-items-center">
				<ul class="nav nav-fill list-unstyled w-100">
					<li class="nav-item"><a href="#">팬션 소개</a></li>
					<li class="nav-item"><a href="#">객실 보기</a></li>
					<li class="nav-item"><a href="#">예약안내</a></li>
					<li class="nav-item"><a href="#">커뮤니티</a></li>
				</ul>
			</nav>
			<section class="banner bg-primary">
				<img id="bannerImg" src="test06_banner1.jpg" width="1110px" height="500px" />
			</section>
			<section class="reserve bg-success d-flex">
				<div
					class="lay1 col-4 d-flex justify-content-center align-items-center"
				>
					<div class="text">
						<div class="text1 text-white">실시간</div>
						<div class="text2 text-white">예약하기</div>
					</div>
				</div>

				<div class="lay2 col-4">
					<div class="reservewrap d-flex text-white mt-4 ml-2 w-100">
						<h5 class="reserve1">예약 확인</h5>
						<div class="radio pl-3 font-weight-bold">
							<label name="member" class="mr-2" for="1"
              value="member">회원<input
									type="radio"
									id="1"
									name="reg"
									value="member"
									checked
							/></label>
							<label name="member" for="2"
              value="nonmembr">비회원<input type="radio" id="2" name="reg" value="nonmember"
							/></label>
						</div>
					</div>
					<div class="idpw mr-3">
						<div class="id d-flex justify-content-center align-items-center">
							<small class="idname col-3 text-white">아이디:</small>
							<input type="text" id="zzid" class="col-9 form-control" />
						</div>
						<div
							class="id d-flex justify-content-center align-items-center pt-2"
						>
							<small class="idname  col-3 text-white p-0" id="password">비밀번호:</small>
							<input type="password" class="col-9 form-control" />
						</div>
					</div>
					<div class="namename mr-3 d-none">
						<div
							class="name d-flex justify-content-center align-items-center pt-1"
						>
							<small class="username col-3 text-white">이름</small>
							<input type="text" id="username" class="col-9 form-control" />
						</div>
						<div
							class="name d-flex justify-content-center align-items-center pt-1"
						>
							<small class="call col-3 text-white p-0">전화번호</small>
							<input type="text" id="phoneNumber" class="col-9 form-control" />
						</div>

						<div
							class="name d-flex justify-content-center align-items-center pt-1"
						>
							<small class=" col-3 text-white pl-2">날짜 </small>
							<input type="text" id="date" class="col-9 form-control" />
						</div>
					</div>
					<div class="button d-flex justify-content-end pt-2">
						<button type="button" class="submit-btn btn btn-success font-weight-bold">
							조회하기
						</button>
					</div>
				</div>

				<div
					class="lay3 col-4 d-flex justify-content-center align-items-center"
				>
					<div class="text">
						<div class="text3 text-white">예약문의:</div>
						<div class="text4 text-white font-weight-bold">010-</div>
						<div class="text5 text-white font-weight-bold">000-1111</div>
					</div>
				</div>
			</section>

			<footer class="yes bg-warning"></footer>
		</div>

		<script>
			$(document).ready(function () {
				//$(".namename").addClass("d-none");
        
        //  $("input[name=reg]:checked").on("change", function() {
        //    alert($(this.val()));
        //  });
        
         $("#date").datepicker({
          minDate:0
          , dateFormat:"yy년 mm월 dd일"
        });

      $('.submit-btn').on('click', function() {
        let radio = $('input:radio[name=reg]:checked').val(); // member or nonmember
       // alert(radio);
        if(radio =="member"){
          let id = $("#zzid").val().trim();
          if(id =="") {
            alert("아이디를 입력하세요.");
            return;
          }

          let password = $("#password").val();
         if(password=="") {
          alert("비밀번호를 입력하세요.");
          return;
         } 
        } else { // 비회원
          let name = $("#username").val().trim();
          if(name ==""){
            alert("이름을 입력하세요");
            return;
          }
          let phoneNumber = $("#phoneNumber").val().trim();
          if(phoneNumber =="") {
            alert("전화번호를 입력하세요");
            return;
          }
          if(phoneNumber.startsWith("010") == false) {
            alert("010으로 시작하는 번호만 입력 가능합니다.");
            return;
          }
          
          let reserveDate = $('#date').val();
          if(reserveDate =="") {
            alert("날짜를 선택해주세요");
            return;
          }
        }
      
      });

				$("input[id=1]").on("click", function () {
					if ($("#1").prop("checked", true)) {
						$(".idpw").removeClass("d-none");
						$(".namename").addClass("d-none");
					}
				});
				$("input[id=2]").on("click", function () {
					if ($("#2").prop("checked", true)) {
						$(".namename").removeClass("d-none");
						$(".idpw").addClass("d-none");
					}
				});
        
        //4 이미지 3초 간격 변경
        let bannerImage = ['test06_banner1.jpg' , 'test06_banner2.jpg',
        'test06_banner3.jpg','test06_banner4.jpg'];
        let currentIndex = 0;
        
        setInterval(function() {
          $("#bannerImg").attr("src", bannerImage[currentIndex]);
          currentIndex++;
          console.log(currentIndex);
          if(currentIndex >= bannerImage.length) {
            currentIndex = 0;
          }
        } ,3000);
        function foo() {

        }

			});
		</script>
	</body>
</html>
