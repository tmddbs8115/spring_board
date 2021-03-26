<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
	
		<input type="hidden" name="bno" value="${board.bno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="searchtype" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		글쓴이<input type="text" class="form-control" readonly=true value="${board.writer}"><br>
		글제목<input type="text" class="form-control" readonly=true value="${board.title}"><br>
		본문<br>
		<textarea readonly=true class="form-control">${board.content}</textarea>
		등록날짜<input type="text" class="form-control" readonly=true value=${board.regDate}><br>
		수정날짜<input type="text" class="form-control" readonly=true value=${board.updateDate}><br>
<%-- 	<a class="btn btn-primary" href="list?page=${cri.page}">목록</a> --%>
<%-- 	<a class="btn btn-success" href="modify?bno=${board.bno}">수정</a> --%>
<%-- 	<a class="btn btn-warning" href="remove?bno=${board.bno}">삭제</a> --%>
	
<!-- 	가변적으로 action(목표url)속성을 바꿔주기 위해서 data-oper 속성을 이용해 어떤 버튼을 눌렀는지 함꼐 정보가 제공되도록 합니다. -->
	
	
	<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
	<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
	<a class="btn btn-primary" href="list?page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}">목록</a>
	</form>
	
	
	
</body>
		<script type="text/javascript">
			//페이지가 로딩되자마자 버튼 감지 사전준비를 위해
			//아래와 같이 작성합니다.
			$(document).ready(function(){
				
// 				alert("작동");
				//form 태그를 불러옵니다.
				var formObj = $("form");
				
				//form태그의 내용이 제대로 불러왔는지 확인합니다.
// 				console.log(formObj);
				
// 				2. form태그의 action부분을 고쳐보겠습니다.
// 				.attr은 해당 태그의 속성값을 설정하는것이고
// 				.("속성명","대입할 속성")순으로 작성합니다.
// 				하기 코드는 form태그의 action(목적주소)를
// 				www.cowhgns.com으로 변경합니다.
				
// 				formObj.attr("action", "www.cowhdgns.com");
// 				console.log(formObj);

// 				3.버튼을 클릭했을때 data-oper 있던 값 감지하기
// 				페이지 로딩완료가 아닌 버튼 클릭시 감지해야 하므로
// 				버튼 클릭 ㅂ이벤트부터 처리합니다.
				$('button').on("click", function(e){
// 					버튼 클릭시 submit으로 설정되어 있어서
// 					의도와 상관없이 바로 submit을 진행시킴
// 					따라서 그걸 막기 위해 코드 추가
// 				console.log(operation);
					e.preventDefault();
				var operation = $(this).data("oper");
// 				method 속성은 post로 변경해주시고
// 				감지된 버튼이 remove인 경우
// 				remove 페이지로 가도록 조건물을 짜 주시고
// 				버튼이 modify인 경우
// 				modify로 가도록 조건문을 짜주세요
				formObj.attr("method", "post");
				if(operation === "modify"){
					formObj.attr("action", "/board/modify");
				} else if(operation === "remove"){
					formObj.attr("action", "/board/remove");
					
				}
				
				formObj.submit();
				
				});


// 				감지 로직
				
				
			});
		
		</script>

</html>