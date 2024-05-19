<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>시험보자</title>
<!-- 테일윈드 불러오기 -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" /> -->
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css"
	rel="stylesheet" type="text/css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- 구글폰트(아이콘) 불러오기 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<!-- 구글폰트 Pattaya -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pattaya&display=swap"
	rel="stylesheet">

<!-- 구글폰트 Suranna -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Suranna&display=swap"
	rel="stylesheet">


<!-- 구글폰트 Urbanist -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Suranna&family=Urbanist:ital,wght@0,100..900;1,100..900&display=swap"
	rel="stylesheet">


</head>
</head>

<body>
	<div>
		<div class="flex justify-center items-baseline gap-3">
			<span>FAQ 검색</span>
			<input id="searchText" type="text" placeholder="Type here"
				class="input input-bordered input-secondary w-full max-w-xs" />
			<button class="btn btn-ghost btn-circle" onclick="faqSearch()">
				<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
					viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round"
						stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" /></svg>
			</button>
		</div>

		<div class="overflow-x-auto">
			<table class="table" id="faqTable">
				<!-- head -->
				<thead>
					<tr>
						<th></th>
						<th>id</th>
						<th>질문</th>
						<th>답변</th>
					</tr>
				</thead>
				<tbody>
					<!-- row 1 -->
					<!-- 		      <tr> -->
					<!-- 		        <th>1</th> -->
					<!-- 		        <td>Cy Ganderton</td> -->
					<!-- 		        <td>Quality Control Specialist</td> -->
					<!-- 		        <td>Blue</td> -->
					<!-- 		      </tr> -->
				</tbody>
			</table>
		</div>

	</div>

</body>

<script>
	function faqSearch() {
		let searchText = $("#searchText").val().trim();
		
		if(!searchText){
			alert("검색 단어를 입력해주세요.");
			return;
		}
		
		$.get("/search?searchText="+searchText,
		// 응답이 오면 호출되는 콜백 함수
		function(data, status) {
			console.log(data);
			//$("#text").html(data + "<br>" + status); // 전송받은 데이터와 전송 성공 여부를 보여줌.
		});
	}
</script>
</html>