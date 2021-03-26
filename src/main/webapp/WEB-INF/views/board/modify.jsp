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

	<h1>${board.bno} 번 글 내용</h1>

	<form action="/board/modifyrun" method="post">
		<input type="hidden" name="bno" value="${board.bno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="searchtype" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		글쓴이<input type="text" readonly=true name="writer" class="form-control"><br>
		글제목<input type="text" name="title" class="form-control" value="${board.title}"><br>
		본문<br>
		<textarea class="form-control" name="content">${board.content}</textarea>
		등록날짜<input type="text" readonly=true class="form-control" value=${board.regDate}><br>
		수정날짜<input type="text" readonly=true class="form-control" value=${board.updateDate}><br>
		
		<input type="submit" value="전송" class="btn btn-primary">
		
	</form>
	

	


</body>
</html>