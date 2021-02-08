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
	<div id="main">
		<div id="add"><button id="addPlace">새 관광지 추가하기</button></div>
		<div id="list"></div>
		<div id="page"></div>
	</div>
	<script>
		const ctx = `<%= application.getContextPath()%>`
		$('.home').click(function(){location.href=ctx})
		$('#addPlace').click(function(){location.href=ctx+'/pce/addPlace'})
		$('#listPlace').click(function(){location.href=ctx+'/pce/listPlace'})
		pce.list({size:'6',num:'1'})
	</script>
</body>
</html>