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
			<span>FAQ 검색</span> <input id="searchText" type="text"
				placeholder="Type here"
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
				<tbody id="searchTbody">
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
		<div class="flex justify-center items-baseline gap-3">
			<span>주소 검색</span> 
			<input id="searchAddress" type="text"
				placeholder="Type here"
				class="input input-bordered input-secondary w-full max-w-xs" />
			<button class="btn btn-ghost btn-circle" onclick="addressSearch()">
				<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none"
					viewBox="0 0 24 24" stroke="currentColor">
					<path stroke-linecap="round" stroke-linejoin="round"
						stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" /></svg>
			</button>
		</div>


		<table class="table" id="addressTable">
			<!-- head -->
			<thead>
				<tr>
					<th></th>
					<th>id</th>
					<th>행정구분 1</th>
					<th>행정구분 2</th>
					<th>행정구분 3</th>
				</tr>
			</thead>
			<tbody id="addressTbody">
				<!-- row 1 -->
				<!-- 		      <tr> -->
				<!-- 		        <th>1</th> -->
				<!-- 		        <td>Cy Ganderton</td> -->
				<!-- 		        <td>Quality Control Specialist</td> -->
				<!-- 		        <td>Blue</td> -->
				<!-- 		      </tr> -->
			</tbody>
		</table>
		
		<div id = "addressResult" class="flex flex-col"></div>

	</div>

</body>

<script>
	function faqSearch() {
		let searchText = $("#searchText").val().trim();

		if (!searchText) {
			alert("검색 단어를 입력해주세요.");
			return;
		}

		$.get("/search?searchText=" + searchText,
		// 응답이 오면 호출되는 콜백 함수
		function(data, status) {
			$("#searchTbody").empty();

			data.data1.forEach(function(faq) {
				let tr = $('<tr></tr>');
				let td1 = $('<td></td>').text(faq.id);
				let td2 = $('<td></td>').text(faq.question);
				let td3 = $('<td></td>').text(faq.answer);

				tr.append(td1).append(td2).append(td3);
				$('#searchTbody').append(tr);
			});

			console.log(data);
			//$("#text").html(data + "<br>" + status); // 전송받은 데이터와 전송 성공 여부를 보여줌.
		});

	}

	function addressSearch() {
	    let searchAddress = $("#searchAddress").val().trim();

	    if (!searchAddress) {
	        alert("검색할 지역명을 입력해주세요.");
	        return;
	    }

	    $.get("/searchAddress?searchAddress=" + searchAddress, 
	    // 응답이 오면 호출되는 콜백 함수
	    function(data, status) {
	        $("#addressTbody").empty();
	        $("#addressResult").empty();

	        data.data1.forEach(function(address) {
	            let tr = $('<tr></tr>').addClass('cursor-pointer').attr('onclick', 'showWeather(' + JSON.stringify(address) + ', "' + address.level1 + ' ' + address.level2 + ' ' + address.level3 + '")');
	            
	            let td1 = $('<td></td>').text(address.level1);
	            let td2 = $('<td></td>').text(address.level2);
	            let td3 = $('<td></td>').text(address.level3);

	            tr.append(td1).append(td2).append(td3);
	            $('#addressTbody').append(tr);
	        });

	        console.log(data);
	    });
	}

	async function showWeather(address, addressFullName) {
	    $("#addressTbody").empty();
	    let span1 = $('<span></span>').text(addressFullName + ': ');

	    let currentDate = new Date();
	    currentDate.setHours(currentDate.getHours() - 1);
	    function padWithZero(number) {
	        return number < 10 ? '0' + number : number;
	    }
	    const formattedDate = '' + currentDate.getFullYear() + padWithZero(currentDate.getMonth() + 1) + padWithZero(currentDate.getDate());
	    const formattedTime = '' + padWithZero(currentDate.getHours()) + '00';
	    
	    //https://www.data.go.kr/data/15084084/openapi.do에서 api키를 가져오세요.
	    const API_KEY = 'yourApiKey';
	    const url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey='+ API_KEY +'&pageNo=1&numOfRows=5&nx='+address.x+'&ny='+address.y+'&dataType=JSON&base_date='+formattedDate+'&base_time='+formattedTime;
	    console.log(url);
	    const response = await fetch(url);
	    const data = await response.json();
	    const items = data.response.body.items.item;
	    
	    let resultStr = "";
	    items.forEach(function(item) {
	        let codeName = "";
	        switch (item.category) {
	            case 'T1H': codeName = "강수확률"; break;
	            case 'T1H': codeName = "기온"; break;
	            case 'RN1': codeName = "1시간 강수량"; break;
	            case 'UUU': codeName = "동서바람성분"; break;
	            case 'VVV': codeName = "남북바람성분"; break;
	            case 'REH': codeName = "습도"; break;
	            case 'PTY': codeName = "강수형태"; break;
	            case 'VEC': codeName = "풍향"; break;
	            case 'WSD': codeName = "풍속"; break;
	            default: codeName = "Unknown"; // 추가적인 예외 처리를 위해 default 케이스를 추가합니다.
	        }
	        resultStr += codeName + " : " + item.obsrValue + ", ";
	    });

	    let span2 = $('<span></span>').text(resultStr);
	    $("#addressResult").append(span1).append(span2);
	}
</script>
</html>