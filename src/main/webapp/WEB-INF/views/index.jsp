<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
웰컴 !
click 1  <button id="btn1">퀴즈보기</button>
click 2  <button id="btn2">학생보기</button>
<script>
const ctx = `<%= application.getContextPath()%>`
$("#btn1").click(function(e){e.preventDefault();
	location.href = ctx + '/move/quiz'
})
$("#btn2").click(function(e){e.preventDefault();
	location.href = ctx + '/move/student'
})
</script>
</body>
</html>