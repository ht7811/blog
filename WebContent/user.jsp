<%@ page language="java" import="java.util.*,service.ArticleService,service.CommentService" contentType="text/html; charset=UTF-8"
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
<style type="text/css">
	#exampleInputFile,.btn-default {
		display: none
	}
</style>
</head>
<body>

		<!-- Wrapper -->
		<div id="wrapper">
		
			<!-- header -->
			<%@include file="include/header.jsp" %>
			
			<!-- Main -->
			<div id="main" style="padding: 1em 2em;background: #ffffff">
				
				<form style="position: relative">
				   <i style="position: absolute;top: 20px;right: 10px;cursor: pointer" class="edit fa fa-edit"></i>
				   <div class="form-group" style="width: 60%;margin: 0 auto 16px auto;">
				    <label for="exampleInputFile"><img  src="${basePath}/static/images/logo.jpg" alt="" /></label>
				    <input type="file" id="exampleInputFile">
				  </div>
				  <div class="form-group" style="width: 60%;margin: 0 auto 16px auto;">
				    <label for="exampleInputEmail1">用户名</label>
				    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="">
				  </div>
				   <div class="form-group" style="width: 60%;margin: 0 auto 16px auto;">
				    <label for="exampleInputEmail1">邮箱</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
				  </div>
				  <div class="form-group" style="width: 60%;margin: 0 auto 16px auto;">
				    <label for="exampleInputEmail1">地址</label>
				    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="">
				  </div>
				   <div class="form-group" style="width: 60%;margin: 0 auto 16px auto;">
				    <label for="exampleInputEmail1">电话</label>
				    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="">
				  </div>
				  <button type="submit" class="btn btn-default">Submit</button>
				</form>

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
		<script>
			$('.sava-comment').click(function(){
				var txt = $('#commenttxt').val();
				$.post("${basePath}/controller/CommentController.jsp",{txt : txt , articleId : "${article.id}"},function(data){
			        data = data.trim();
			        if(data == '-1'){
			            alert('请先登录！');
			        }else if(data == '1'){
			            alert('保存成功！');
			            location.reload();
			        }
			    });
			});
		</script>
	</body>
</html>