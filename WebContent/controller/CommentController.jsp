<%@page import="bean.User"%>
<%@page import="bean.Comment"%>
<%@page import="service.CommentService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//因为评论是需要登录的，如果没有登录我们就调整到登录页面去
	User user = (User)session.getAttribute("user");
	if(user == null){//代表用户没有登录
		out.print("-1");
		return;
	}
	String txt = request.getParameter("txt").toString();//request.getParameter()获取客户端传递过来的评论信息，并且用String数据类型的txt保存下来
	String articleId = request.getParameter("articleId").toString();
	
	CommentService commentService = new CommentService();
	Comment comment = new Comment();
	comment.setId(UUID.randomUUID().toString());
	comment.setUserId(user.getId());
	comment.setHeaderPic(user.getHeaderPic());
	comment.setArticleId(articleId);
	comment.setContent(txt);
	commentService.saveComment(comment);
	
	//返回一个标志位 1
	out.print("1");
	//System.out.println(txt);
	
%>