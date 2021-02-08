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
	<a href="#" id="updatePlace">수정화면으로</a>
	<table>
		<tr>
			<td><span id="name">이름</span></td>
		</tr>
		<tr>
			<td><span id="address">주소</span></td>
			<td><span id="phoneNumber">전화번호</span></td>
		</tr>
		<tr>
			<td><span id="category">분류</span></td>
			<td><span id="city">지역</span></td>
		</tr>
	</table>
	<span id="toggle"></span>
    <script>
    	const ctx = `<%= application.getContextPath()%>`
    	$('.home').click(function(){location.href=ctx})
    	$('#listPlace').click(function(){location.href=ctx+'/pce/listPlace'})
    	pce.detail(localStorage.getItem('pceNum'))
    	$('#delete-btn').click(function(e){
    		e.preventDefault()
    		$.ajax({
    			url:ctx+'/place',
    			type:'DELETE',
    			data:JSON.stringify({pceNum:localStorage.getItem('pceNum')}),
    			dataType:'json',
    			contentType:'application/json',
    			success:d=>{alert(d.message);location.href=ctx+'/pce/listPlace'},
    			error:e=>{alert('에러 발생')}
    		})
    	})
    	$('#updatePlace').click(function(e){
    		e.preventDefault()
    		$('#updatePlace').text('')
    		$('#name').html('<input id="updateName" value="'+$('#name').text()+'">')
    		$('#address').html('<input id="updateAddress" value="'+$('#address').text()+'">')
    		$('#phoneNumber').html('<input id="updatePhoneNumber" value="'+$('#phoneNumber').text()+'">')
    		$('#category').html('<input id="updateCategory" value="'+$('#category').text()+'">')
    		$('#city').html('<input id="updateCity" value="'+$('#city').text()+'">')
    		$('#toggle').html('<button id="update-btn">수정하기</button>')
    		$('#update-btn').click(e=>{
	    		$.ajax({
	    			url:ctx+'/place',
	    			type:'PUT',
	    			data:JSON.stringify({
	    				pceNum:localStorage.getItem('pceNum'),
	    				name:$('#updateName').val(),
	    				address:$('#updateAddress').val(),
	    				phoneNumber:$('#updatePhoneNumber').val(),
	    				category:$('#updateCategory').val(),
	    				city:$('#updateCity').val()
	    			}),
	    			dataType:'json',
	    			contentType:'application/json',
	    			success:d=>{},
	    			error:e=>{alert('에러 발생')}
	    		})
    		})
    	})
    	
    </script>
</body>
</html>