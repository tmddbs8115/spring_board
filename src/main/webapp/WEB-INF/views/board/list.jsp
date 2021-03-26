<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>list 메서드 연결 테스트</h1>
	
	
	<div class="container">
	<div class="row">
		<div class="text-body">
			<select name="searchType">
				<option value="n">
				<c:out value="${cri.searchType == null ? 'selected' : ''}" />
				-
				</option>
				<option value="t">
				<c:out value="${cri.searchType eq 't' ? 'selected' : ''}" />
				제목
				</option>
				<option value="c">
				<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}" />
				본문
				</option>
				<option value="w">
				<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}" />
				글쓴이
				</option>
				<option value="tc">
				<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}" />
				제목+본문
				</option>
				<option value="cw">
				<c:out value="${cri.searchType eq 'cw' ? 'selected' : ''}" />
				본문+글쓴이
				</option>
				<option value="tcw">
				<c:out value="${cri.searchType eq 'tcw' ? 'selected' : ''}" />
				제목+본문+글쓴이
				</option>
			</select>
			<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
			<button id="searchBtn">Search</button>
		</div>
	</div>
	<table class="table table-hover">
  <thead>
   <tr>
     <th>번 호 </th>
     <th>제 목</th>
     <th>글쓴이</th>
   </tr>
   </thead>
	<c:forEach var="a" items="${list}">
   <tr>
     <td>${a.bno}</td>
     <td><a href="get?bno=${a.bno}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}">${a.title}</a></td>
     <td>${a.writer}</td>
   </tr>
	</c:forEach>
 </table>
	
	
	
	
	
	
	<div class="row">
	
	<ul class="col-md-10 pagination justify-content-center">
	<c:if test="${pageMaker.prev}">
		<li class="page-item">
			<a class="page-link" href="/board/list?page=${pageMaker.startPage -1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo;
			</a>		
		</li>
	</c:if>
	<!-- 페이지 번호 버튼 -->
	<c:forEach begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}"
				var="idx">
				<li class="page-item
					<c:out value="${pageMaker.cri.page == idx ? 'active' : '' }" />">
					<a class="page-link" href="/board/list?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx}</a>
					</li>
	</c:forEach>
	
	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<li class="page-item">
			<a class="page-link"
						href="/board/list?page=${pageMaker.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo;</a>
		</li>
	
	</c:if>
	
  	</ul>
	<a class="col-md-1 btn btn-primary" href="register">글 쓰기</a>
	</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){

			//삭제된 글 번호는 controller에서 넘어옵니다.
			//${bno}라는 명칭으로 넘어오므로 변수에 저장합니다.
			//문자열 형태로 받아오도록 처리
			//그렇지 않으면 콘솔창에서 받은 자료가 없을때 에러가 남.
			var bno = "${bno}";
			
			//받아온 bno를 출력
			console.log(bno);
			
			//alert()구문을 이용해서 글을 삭제할때마다
			//n번 글이 삭제되었습니다. 라는 안내문구를 띄어주세요
			//조건문을 이용해 삭제일때만 실행하도록 로직을 수정합니다.
			
			if(bno !== ''){
				
			alert(bno+"번 글이 삭제되었습니다.");
			}
			$('#searchBtn').on("click", function(event){
				
				self.location = "list"
						+"?page=1"
						+"&searchType="
						+$("select option:selected").val()
						+"&keyword="+$("#keywordInput").val();
				
			})
			
		});	
	</script>
	
	
	
</body>
</html>