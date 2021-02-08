<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>강원랜드</title>
	<link rel="stylesheet" href="<c:url value="/resources/cmm/css/style.css"/>" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/pce/js/pce.js"/>"></script>
</head>
<body>
	<div id="header">
		<div>
			<a href="#" class="home">강원랜드</a>
			<ul id="navigation">
				<li class="menu">
					<a href="#">메뉴1</a>
				</li>
				<li class="menu">
					<a href="#">여행정보</a>
					<ul class="primary">
						<li>
							<a href="#">메뉴2-1</a>
						</li>
						<li>
							<a href="#" id="listPlace">관광지정보</a>
						</li>
					</ul>
				</li>
				<li class="menu">
					<a href="#">메뉴3</a>
					<ul class="secondary">
						<li>
							<a href="#">메뉴3-1</a>
						</li>
					</ul>
				</li>
				<li class="menu">
					<a href="#">메뉴4</a>
				</li>
			</ul>
		</div>
	</div>
    <table>
	    <tr>
	    	<td>관광지명</td>
	    	<td><input id="placeName" type="text" value="설악산 국립공원"/></td>
	    </tr>
	    <tr>
	    	<td>주소</td>
	    	<td><input id="placeAddress" type="text" value="강원도 속초시 설악산로 1091"/></td>
	    </tr>
	    <tr>
	    	<td>전화번호</td>
	    	<td><input id="placePhoneNumber" type="text" value="033-801-0900"/></td>
	    </tr>
	    <tr>
	    	<td>분류</td>
	    	<td><input id="placeCategory" type="text" value="공원"/></td>
	    </tr>
	    <tr>
	    	<td>지역</td>
	    	<td><input id="placeCity" type="text" value="속초시"/></td>
	    </tr>
	    <tr>
	    	<td>사진</td>
	    	<td><input id="placeImage" type="text" value="http://www.knps.or.kr/portal/images/park/k_img.jpg"/></td>
	    </tr>
    </table>
    <button id="add-btn">추가하기</button>
    <script>
    	const ctx = `<%= application.getContextPath()%>`
    	$('#add-btn').click(function(e){
    		e.preventDefault()
    		$.ajax({
    			url:ctx+'/place',
    			type:'POST',
    			data:JSON.stringify({
    				name:$('#placeName').val(),
    				address:$('#placeAddress').val(),
    				phoneNumber:$('#placePhoneNumber').val(),
    				category:$('#placeCategory').val(),
    				city:$('#placeCity').val(),
    				placeImg:$('#placeImage').val()
    			}),
    			dataType:'json',
    			contentType:'application/json',
    			success:d=>{alert(d.message)},
    			error:e=>{alert('에러 발생')}
    		})
    	})
    	$('.home').click(e=>{location.href=ctx})
    	$('#listPlace').click(e=>{location.href=ctx+'/pce/listPlace'})
    </script>
</body>
</html>