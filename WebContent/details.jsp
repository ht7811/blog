<%@ page language="java" import="java.util.*,java.io.*,service.ArticleService,service.CommentService" contentType="text/html; charset=UTF-8"
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
	.article {
		margin-bottom: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #dedede
	}
	.article .title {
	    text-align: center;
	    font-size: 28px;
	    color: #565353;
	    letter-spacing: 2px;
	    margin-top:20px;
	}
	.article .light-font{
	    font-size:14px;
	    color:#666;
	}
	
	.article .info{
	    font-size:14px;
	    color:#3c3a3a;
	}
	.article .content p{
	    text-indent:2em;
	    margin-bottom:20px;
	    font-family: 微软雅黑;
	}
	.comment_word {
	    margin-top:12px;
	    padding-bottom:12px;
	    border-bottom:1px dashed #ccc
	}
	.sava-comment {
		float: right;
		margin-top: 10px;
	}
	.commentBox {
		margin-bottom: 20px;
	}
	#commenttxt {
		border: none
	}
	.sava-comment {
		height: 28px !important;
    	line-height: 28px !important;
    	background: #379BE9 !important;
    	color: #ffffff !important;
    	border-radius: 2px;
    	margin: 6px 10px 0 0;
	}
</style>
</head>
<body>

		<!-- Wrapper -->
		<div id="wrapper">
		
			<!-- header -->
			<%@include file="include/header.jsp" %>
			
			<!-- Main -->
			<div id="main" style="    padding: 1em 2em;background: #ffffff">
				<%
					String id = request.getParameter("id");
				 	Map<String, Object> map = articleService.getContentByArticleId(id);
				 	pageContext.setAttribute("article", map);
				 	
				 	CommentService commentService = new CommentService();
				 	List<Map<String, Object>> list = commentService.getCommentsByArticleId(id);
				 	pageContext.setAttribute("comments", list);
				 	//System.out.println(list);
				 	
				 	int number = articleService.countPeople();
				 	System.out.println(number);
				 	pageContext.setAttribute("number", number);
				%>
			    
				<%-- ${ articles } --%>
				
				<!-- 内容区 -->
				<div class='article'>
				    <div class='title'>${ article.header }</div>
				    <p style="margin: 0; padding: 10px 0 0 0;font-size: 14px;text-align: center">作者：</span><span class='info'>${ article.author }</span></p>
				    <div class='category'><span class='light-font'>分类：</span><span class='info'>${ article.type_name }</span></div>
				    <div class='publicDate'><span class='light-font'>发布时间：</span><span class='info'>${ article.create_time }</span></div>
				    <hr/>
				    <div class='content'>
				        ${ article.content }
				    </div>
				</div>
				
				<!-- 评论区 -->
				<div class='commentBox'>
				    <p style="margin-bottom: 0;font-size: 13px;color: #c2c0c0;"><b style="font-size: 20px;color: #333;margin-right: 10px;">网友评论</b> 文明上网理性发言</p>
				    <div style="border: 1px solid #379BE9">
				    	<textarea class="comment_input" id="commenttxt" placeholder="请输入评论信息(600)..." maxlength="600"></textarea>
				    	<p style="height: 40px;margin: 0;font-size: 12px;color: #379BE9;line-height: 40px;text-indent: 6px;">
				    	<%-- ${sessionScope} --%>
				    	<c:choose>
							<c:when test="${ empty sessionScope.username}">
								登录评论！
							</c:when>
							<c:otherwise>
								<img style="width: 30px;height: 30px;border-radius: 15px;vertical-align: middle;" src="${basePath}/static/images/headerpic/${sessionScope.headerPic}"/>
								${sessionScope.username}
							</c:otherwise>
						</c:choose>
				    	<button type="button" class="sava-comment">保存评论</button></p>
				    	
				    </div>
				</div>
				
				<div class='mb64' class="comment_list">
					<c:forEach items="${ comments }" var="comment">
						 <div class="comment_infor clearfix">
					        <div class="comment_word">
					             <div style="display: inline-block;width: 48px;font-size: 12px;text-align: center;">
					             	<img style="display: block;margin: 0 auto;width: 40px;height: 40px;border-radius: 20px;" src="${basePath}/static/images/headerpic/${comment.headerPic}"/>
					             </div>
					             <div style="position: relative;display: inline-block;padding: 2px;width: calc(100% - 160px);font-size: 12px;">
					             	<p style="margin: 0;color: #379BE9;">${comment.username}<span style="margin-left: 7px;color: #999">${comment.create_time}</span></p>
					            	<p class='mb32'>${comment.content}</p>
					             </div>
					             
					         </div>
					    </div>
					</c:forEach>
				</div>

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