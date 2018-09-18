<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//注销
	session.removeAttribute("username");//移除session中的username属性
	session.invalidate();//销毁跟用户关联的session
	String path = request.getContextPath();
	//获取端口
	int port = request.getServerPort();
	String basePath = null;
	if(port == 80){
		basePath = request.getScheme() + "://" + request.getServerName() + path;
	}else{
		basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	}
	//response.sendRedirect()重定向到指定url
	response.sendRedirect(basePath + "/login.jsp");
%>  