<%@ page language="java" import="java.util.*,service.ArticleService" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="include/taglib.jsp"%>
<% 
	ArticleService articleService = new ArticleService(); 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咦，我怎么在这里</title>
<!--[if lte IE 8]><script src="${basePath}/static/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${basePath}/static/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="${basePath}/static/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="${basePath}/static/css/ie8.css" /><![endif]-->
<link rel="shortcut icon" type="image/x-icon" href="${basePath}/static/images/favicon.ico" media="screen" />
</head>
<body>

		<!-- Wrapper -->
		<div id="wrapper">
		
			<!-- header -->
			<%@include file="include/header.jsp" %>
			
			<!-- Main -->
			<div id="main">
				<%
					List<Map<String, Object>> articles = articleService.getNewArticle(7);
					pageContext.setAttribute("articles", articles);
				%>
				<%-- ${ articles } --%>
				<!-- Post -->
				<c:forEach items="${ articles }" var="item">
					<article class="post">
						<header>
							<div class="title">
								<h2><a href="#">${ item.header }</a></h2>
								<p>${ item.name }</p>
							</div>
							<div class="meta">
								<time class="published" datetime="2018-05-16">${ item.update_time }</time>
								<a href="#" class="author"><span class="name">${ item.author }</span><img src="${basePath}/static/images/avatar.jpg" alt="" /></a>
							</div>
						</header>
						<%-- <a href="#" class="image featured"><img src="${basePath}/static/images/pic01.jpg" alt="" /></a> --%>
						<p>${ item.header }</p>
						<footer>
							<ul class="actions">
								<li><a href="${basePath}/details.jsp?id=${ item.id }" class="button big">继续阅读</a></li>
							</ul>
							<ul class="stats">
								<li><a href="#">General</a></li>
								<li><a href="#" class="icon fa-heart">28</a></li>
								<li><a href="#" class="icon fa-comment">128</a></li>
							</ul>
						</footer>
					</article>
				</c:forEach>

				<!-- Pagination -->
				<ul class="actions pagination">
					<li><a href="" class="disabled button big previous">上一页</a></li>
					<li><a href="#" class="button big next">下一页</a></li>
				</ul>

			</div>

			<!-- Sidebar -->
			<section id="sidebar">

				<!-- Intro -->
				<section id="intro">
					<a href="#" class="logo"><img src="${basePath}/static/images/logo.jpg" alt="" /></a>
					<header>
						<c:choose>
							<c:when test="${ empty sessionScope.username}">
								<h2>游客</h2>
								<p>职业：</p>
							</c:when>
							<c:otherwise>
								<h2>${sessionScope.username}</h2>
								<p>职业：</p>
							</c:otherwise>
						</c:choose>
						
					</header>
				</section>

				<!-- Mini Posts -->
				<section>
					<div class="mini-posts">

						<!-- Mini Post -->
						<article class="mini-post">
							<header>
								<h3><a href="#">Vue.js</a></h3>
								<time class="published" datetime="2018-05-20">05 20, 2018</time>
								<a href="#" class="author"><img src="${basePath}/static/images/avatar.jpg" alt="" /></a>
							</header>
							<a href="#" class="image"><img src="${basePath}/static/images/pic04.jpg" alt="" /></a>
						</article>

						<!-- Mini Post -->
						<article class="mini-post">
							<header>
								<h3><a href="#">Vue.js</a></h3>
								<time class="published" datetime="2018-05-19">05 19, 2018</time>
								<a href="#" class="author"><img src="${basePath}/static/images/avatar.jpg" alt="" /></a>
							</header>
							<a href="#" class="image"><img src="${basePath}/static/images/pic05.jpg" alt="" /></a>
						</article>

						<!-- Mini Post -->
						<article class="mini-post">
							<header>
								<h3><a href="#">Vue.js</a></h3>
								<time class="published" datetime="2018-05-18">05 18, 2018</time>
								<a href="#" class="author"><img src="${basePath}/static/images/avatar.jpg" alt="" /></a>
							</header>
							<a href="#" class="image"><img src="${basePath}/static/images/pic06.jpg" alt="" /></a>
						</article>

						<!-- Mini Post -->
						<article class="mini-post">
							<header>
								<h3><a href="#">Vue.js</a></h3>
								<time class="published" datetime="2018-05-17">05 17, 2018</time>
								<a href="#" class="author"><img src="${basePath}/static/images/avatar.jpg" alt="" /></a>
							</header>
							<a href="#" class="image"><img src="${basePath}/static/images/pic07.jpg" alt="" /></a>
						</article>

					</div>
				</section>

				<!-- Posts List -->
				<section>
					<ul class="posts">
						<li>
							<article>
								<header>
									<h3><a href="#">Vue.js</a></h3>
									<time class="published" datetime="2018-05-20">05 20, 2018</time>
								</header>
								<a href="#" class="image"><img src="${basePath}/static/images/pic08.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Vue.js</a></h3>
									<time class="published" datetime="2018-05-15">05 15, 2018</time>
								</header>
								<a href="#" class="image"><img src="${basePath}/static/images/pic09.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Vue.js</a></h3>
									<time class="published" datetime="2018-05-10">05 10, 2018</time>
								</header>
								<a href="#" class="image"><img src="${basePath}/static/images/pic10.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Vue.js</a></h3>
									<time class="published" datetime="2018-05-08">05 8, 2018</time>
								</header>
								<a href="#" class="image"><img src="${basePath}/static/images/pic11.jpg" alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3><a href="#">Vue.js</a></h3>
									<time class="published" datetime="2018-05-06">05 7, 2018</time>
								</header>
								<a href="#" class="image"><img src="${basePath}/static/images/pic12.jpg" alt="" /></a>
							</article>
						</li>
					</ul>
				</section>

				<!-- About -->
				<section class="blurb">
					<h2>About</h2>
					<p>闲着没事瞎做的。。。</p>
					<ul class="actions">
						<li><a href="#" class="button">了解更多</a></li>
					</ul>
				</section>

				<!-- Footer -->
				<section id="footer">
					<ul class="icons">
						<li><a title="微信" class="fa-weixin"><span class="label">微信</span></a></li>
						<li><a title="微博" class="fa-weibo"><span class="label">微博</span></a></li>
						<li><a title="电话" class="fa-whatsapp"><span class="label">电话</span></a></li>
						<li><a title="30242731" class="fa-qq"><span class="label">QQ</span></a></li>
						<li><a title="302442731@qq.com" class="fa-envelope"><span class="label">Email</span></a></li>
					</ul>
				</section>

			</section>

		</div>

		<!-- Scripts -->
		<script src="${basePath}/static/js/jquery.min.js"></script>
		<script src="${basePath}/static/js/skel.min.js"></script>
		<script src="${basePath}/static/js/util.js"></script>
		<!--[if lte IE 8]><script src="${basePath}/static/js/ie/respond.min.js"></script><![endif]-->
		<script src="${basePath}/static/js/main.js"></script>
		

	</body>
</html>