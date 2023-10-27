<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--       tname, skills, phone, zipcode, gender, address -->


	<div class="container mt-3 mb-3">
		<h2>팀원 등록</h2>
		<form action="create" method="post">
			<div class="mb-3 mt-3">
				<label for="tname">팀원 이름:</label> <input type="text"
					class="form-control" id="tname" placeholder="이름을 입력하시오"
					name="tname">
			</div>
			<div class="container mt-3">
				<label for="gender">성별:</label>
				<div class="form-check">
					<input type="radio" class="form-check-input" id="radio1"
						name="gender" value="F"> <label
						class="form-check-label">여성</label>
				</div>
				<div class="form-check">
					<input type="radio" class="form-check-input" id="radio2"
						name="gender" value="M"> <label class="form-check-label">남성</label>
				</div>
			</div>
			<div class="mt-3 mb-3">
				<span class="">보유 기술:</span>

				<div class="form-check">
					<input type="checkbox" class="form-check-input" 
						name="skills" value="JAVA"> <label
						class="form-check-label" for="check1">JAVA</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" 
						name="skills" value="Python"> <label
						class="form-check-label" for="check2">Python</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" name="skills"
						value="C"> <label class="form-check-label">C</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" name="skills"
						value="Spring"> <label class="form-check-label">Spring</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" name="skills"
						value="JSP"> <label class="form-check-label">JSP</label>
				</div>
			</div>


			<div class="mb-3 mt-3">
				<label for="phone">전화번호:</label> <input type="text"
					class="form-control" id="phone" placeholder="전화번호를 입력하시오"
					name="phone">
			</div>


			<div class="row mb-3 mt-3">
				<div class="col w-25">
					<label for="comment">우편번호:</label> <input type="text"
						class="form-control" placeholder="우편번호를 입력하시오" name="zipcode">
				</div>
				<div class="col w-75">
					<label for="address">주소:</label> <input type="text"
						class="form-control" placeholder="상세주소를 입력하시오" name="address">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>