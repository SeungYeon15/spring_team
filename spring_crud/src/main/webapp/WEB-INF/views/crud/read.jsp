<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function update(teamno) {
		let url = "update";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&noticeno=" + teamno;

		alert(url);

		location.href = url;
	}

	function del(teamno) {
		let url = "delete";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&noticeno=" + teamno;

		// 	alert(url);

		location.href = url;
	}
	function list() {
		let url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		//alert(url);

		location.href = url;
	}
</script>
</head>
<body>
	<div class="container mt-3">
		<h2>조회</h2>
		<ul class="list-group">
			<li class="list-group-item">팀원명: ${dto.tname}</li>
			<li class="list-group-item">성 별:<c:if test="${dto.gender=='F'}">여성</c:if>
				<c:if test="${dto.gender=='M'}">남성</c:if> 
			</li>
			<li class="list-group-item">보유 기술: ${dto.skills }</li>
			<li class="list-group-item">휴대전화: ${dto.phone}</li>
			<li class="list-group-item">주소(우편번호):
				${dto.address}(${dto.zipcode })</li>
			<li class="list-group-item">등록일: ${dto.rdate}</li>
		</ul>
		<br>
		<button type="button" class="btn btn-dark"
			onclick="location.href='create'">생성</button>
		<button type="button" class="btn btn-dark"
			onclick="update('${dto.teamno}')">수정</button>
		<button type="button" class="btn btn-dark"
			onclick="del('${dto.teamno}')">삭제</button>
		<button type="button" class="btn btn-dark" onclick="list()">목록</button>

	</div>
</body>
</html>