<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let i = 1;
	let num = 0;
	function addItem() {

		if (i > 9)
			return;

		let sp = document.createElement('span')
		sp.className = "input-group-text";
		sp.innerText = i;
		let ele = document.createElement('input');
		ele.type = 'text';
		ele.className = "form-control";
		ele.name = "skills";
		ele.id = `item${i}`;
		let items = document.getElementById('items-div');
		let dive = document.createElement('div');
		dive.className = "input-group";
		dive.appendChild(sp);
		dive.appendChild(ele);
		items.appendChild(dive);

		i++;
	}
</script>
</head>
<body>

	<!--       tname, skills, phone, zipcode, gender, address -->


	<div class="container mt-3">
		<h2>팀원 수정</h2>
		<form action="update" method="post">
			<input type="hidden" name="teamno" value="${dto.teamno }">
			<input type="hidden" name="col" value="${param.col }"> <input
				type="hidden" name="word" value="${param.word }"> <input
				type="hidden" name="nowPage" value="${param.nowPage }">
			<div class="mb-3 mt-3">
				<label for="tname">팀원 이름:</label> <input type="text"
					class="form-control" id="tname" placeholder="이름을 입력하시오"
					name="tname" value="${dto.tname }">
			</div>
			<div class="container mt-3">
				<label for="gender">성별:</label>
				<c:if test="${dto.gender=='F' }">
					<div class="form-check">
						<input type="radio" class="form-check-input" id="radio1"
							name="gender" value="F" checked> <label class="form-check-label">여성</label>
					</div>
					<div class="form-check">
						<input type="radio" class="form-check-input" id="radio2"
							name="gender" value="M"> <label class="form-check-label">남성</label>
					</div>
				</c:if>
				<c:if test="${dto.gender=='M' }">
					<div class="form-check">
						<input type="radio" class="form-check-input" id="radio1"
							name="gender" value="F"> <label class="form-check-label">여성</label>
					</div>
					<div class="form-check">
						<input type="radio" class="form-check-input" id="radio2"
							name="gender" value="M" checked> <label
							class="form-check-label" >남성</label>
					</div>
				</c:if>

			</div>
			
			
			<div class="mt-3 mb-3">
				<span class="">보유 기술:</span>

				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="Java"
						name="skills" value="Java"> <label
						class="form-check-label" for="check1">Java</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="Python"
						name="skills" value="Python"> <label
						class="form-check-label" for="check2">Python</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" name="skills" id="C"
						value="C"> <label class="form-check-label">C</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" name="skills" id="Spring"
						value="Spring"> <label class="form-check-label">Spring</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" name="skills" id="JSP"
						value="JSP"> <label class="form-check-label">JSP</label>
				</div>
				
				<c:forTokens items="${dto.skills}" delims="," var="item">
				<script type="text/javascript">document.getElementById('${item }').checked=true;</script></c:forTokens>
			</div>
			
<!-- 			<div class="mt-3 mb-3"> -->
<!-- 				<span class="">보유 스킬:</span> -->
<%-- 				<c:forTokens items="${dto.skills }" delims="," var="item"> --%>
<!-- 					<div class="input-group"> -->
<!-- 						<span class="input-group-text"><script type="text/javascript">document.write(i);i++</script></span> <input type="text" -->
<%-- 							class="form-control" name="skills" id="item1" value="${item }"> --%>
<!-- 					</div> -->
<%-- 				</c:forTokens> --%>
<!-- 				<div id="items-div"></div> -->
<!-- 				<button type="button" class="btn btn-light" onclick="addItem()">add</button> -->

<!-- 			</div> -->


			<div class="mb-3 mt-3">
				<label for="phone">전화번호:</label> <input type="text"
					class="form-control" id="phone" placeholder="전화번호를 입력하시오"
					name="phone" value="${dto.phone }">
			</div>


			<div class="row mb-3 mt-3">
				<div class="col w-25">
					<label for="zipcode">우편번호:</label> <input type="text"
						class="form-control" placeholder="우편번호를 입력하시오" name="zipcode"
						value="${dto.zipcode }">
				</div>
				<div class="col w-75">
					<label for="address">주소:</label> <input type="text"
						class="form-control" placeholder="상세주소를 입력하시오" name="address"
						value="${dto.address }">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>