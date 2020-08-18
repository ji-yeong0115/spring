<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/floating-labels/">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>Spring Project</title>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Custom styles for this template -->
<link href="${contextPath}/resources/css/floating-labels.css" rel="stylesheet">  
</head>
<body>

	<div id="login-container">
		<div style="margin: auto; width:200px; margin-bottom:20px">
			<a class="navbar-brand js-scroll-trigger mx-0" href="${contextPath}" >
		       	<img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${contextPath}/resources/images/logo-1.png" width="200px" height="200px"/>
		    </a>
		</div>
		
		<form action="loginAction" method="post" class="form-signin">
	
			<div class="form-label-group">
				<input type="text" id="memberId" name="memberId" class="form-control" 
						placeholder="ID" required autofocus value="${cookie.saveId.value}">
														<!-- 쿠키 중 saveId라는 키를 가지는 쿠키의 value를 꺼내서 출력 --> 
				<label for="memberId">ID</label>
			</div>
	
			<div class="form-label-group">
				<input type="password" id="memberPwd" name="memberPwd" class="form-control" placeholder="Password" required> 
				<label for="memberPwd">Password</label>
			</div>
	
			<div class="checkbox mb-3">
				<label> 
					<input type="checkbox" name="saveId" 
						<c:if test="${!empty cookie.saveId.value}">
							checked
						</c:if> > 아이디 저장
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			
			<a class="btn btn-lg btn-primary btn-block" href="signUp">signUp</a>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>