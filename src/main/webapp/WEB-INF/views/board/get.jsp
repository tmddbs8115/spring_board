<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
		글쓴이<input type="text" class="form-control" readonly=true value="${board.writer}"><br>
		글제목<input type="text" class="form-control" readonly=true value="${board.title}"><br>
		본문<br>
		<textarea readonly=true class="form-control">${board.content}</textarea>
		등록날짜<input type="text" class="form-control" readonly=true value=${board.regDate}><br>
		수정날짜<input type="text" class="form-control" readonly=true value=${board.updateDate}><br>
	</form>
	
</body>
</html>