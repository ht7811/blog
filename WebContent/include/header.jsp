<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


				<!-- Header -->
					<header id="header">
						<h1><a href="#">从入门到放弃<i class="fa fa-arrow-right"></i></a></h1>
						<%-- <c:choose>
							<c:when test="${ empty sessionScope.username }">
								<h1><a href="#">游客</a></h1>
							</c:when>
							<c:otherwise>
								<h1><a href="#">${ sessionScope.username}</a></h1>
							</c:otherwise>
						</c:choose> --%>
						
						<nav class="links">
							<ul>
								<li><a href="${basePath}/index.jsp">Home</a></li>
								<li><a href="#">Vue.js</a></li>
								<li><a href="#">Java</a></li>
								<li><a href="#">Other</a></li>
								<li><a href="#">About</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Intro -->
						<section id="intro">
							
							<c:choose>
								<c:when test="${ empty sessionScope.username}">
									请先登录！
								</c:when>
								<c:otherwise>
									<a href="${basePath}/user.jsp" style="border: none">
										<span class="logo" style="margin-right: 10px; vertical-align: middle;"><img  src="${basePath}/static/images/logo.jpg" alt="" /></span>
										${sessionScope.username}
										<i style="margin-left: 10px;cursor: pointer" class="fa fa-edit"></i>
									</a>
									
								</c:otherwise>
							</c:choose>
						</section>
						
						<!-- Links -->
							<section>
								<ul class="links">
									<li>
										<a href="#">
											<h3>Vue</h3>
											<p>Vue.js学习板块</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>Java</h3>
											<p>Java学习板块</p>
										</a>
									</li>
									<li>
										<a href="#">
											<h3>其它</h3>
											<p>其它</p>
										</a>
									</li>
								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions vertical">
									<c:choose>
										<c:when test="${empty sessionScope.username}">
											<li><a href="login.jsp" class="button big fit">登录</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="${basePath}/controller/logoutController.jsp" class="button big fit">退出</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</section>

					</section>
</body>
</html>