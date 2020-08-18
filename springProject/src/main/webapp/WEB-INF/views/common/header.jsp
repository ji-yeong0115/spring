<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
    <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
	<title>Spring Framwork</title>
	
	
	
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
  
    <link href="${contextPath}/resources/css/resume-styles.css" rel="stylesheet" />
  
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   	
      <style>
      body {
	     margin: 0;
	     font-family: "Muli", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	     font-size: 1rem;
	     font-weight: 400;
	     line-height: 1.5;
	     color: #212529;
	     text-align: left;
	     background-color: #fff;
	     min-height: 85%;
	  }
   
	  h1, h2, h3, h4, h5, h6 {
	     text-transform: initial;
	  }
	      
      </style>
   	
	<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body id="page-top">

	<c:if test="${!empty msg}">
		<script>
			swal({icon : "${status}",
				  title : "${msg}",
				  text : "${text}"});
		</script>
		<c:remove var="msg"/>
	</c:if>
	<!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">
            <span class="d-block d-lg-none">Our Class</span>
            <span class="d-none d-lg-block">
            	<img class="img-fluid img-profile rounded-circle mx-auto mb-2" 
            	src="${contextPath}/resources/images/logo-1.png" alt="" />
            </span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
            	<c:choose>
            		<c:when test="${empty loginMember}">
		                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/login">Login</a></li>
            		</c:when>
            		<c:otherwise>
		                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/mypage">${loginMember.memberName}</a></li>
		                <li class="nav-item"><a class="nav-link" href="${contextPath}/member/logout">Logout</a></li>
            		</c:otherwise>
            	</c:choose>
            </ul>
        </div>
    </nav>
    
   	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	
	
	
	<!-- Core theme JS-->
	<script src="${contextPath}/resources/js/resume-scripts.js"></script>
</body>
</html>