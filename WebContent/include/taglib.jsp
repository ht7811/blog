<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	//request.getContextPath() 拿到web项目的根路径（返回当前页面所在的应用的名字），也就是WebContent
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath = null;
	
	//request.getScheme() 返回当前页面使用的协议、request.getServerName()返回当前页面所在的服务器的名字、request.getServerPort()返回当前页面所在服务器使用的端口，就是80；
	if(port == 80){
		basePath = request.getScheme() + "://" + request.getServerName() + path;
	}else{
		basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	}
	
	//request.setAttribute("basePath", basePath)表示将得到的basePath（项目根路径）存放到request作用域中，可以把request看作是一个HashMap，或者一个JSON对象
	request.setAttribute("basePath", basePath);
%> 