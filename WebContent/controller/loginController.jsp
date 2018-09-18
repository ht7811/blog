<%@ page language="java" import="java.util.*,service.LoginService,util.StringUtils,bean.*" pageEncoding="UTF-8"%>
<%

    //设置请求的编码
    //request.setCharacterEncoding("UTF-8");
    //获取客户端传递过来参数
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    System.out.println(username);
    System.out.println(password);
    //如果用户名和密码不为空
    if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
    	out.print("-1");//错误码-1：用户名和密码不能为空！
    }else{
    	//初始化LoginService
    	LoginService loginService = new LoginService();
    	//接下来判断用户名是否存在
    	User user = loginService.getUser(username);
    	if(user == null){
    		out.print("-2");//错误码-2：用户名不存在！
    	}else{
    		//如果能到这一步，就说明用户是存在的，而且账号密码也是正确的。那么就把user放在session中
    		out.print("1");
    		//session就是浏览器的作用域，只要浏览器开着，里面的值就会存在
    		session.setAttribute("user",user);
    		session.setAttribute("username", user.getUsername());
    		session.setAttribute("headerPic", user.getHeaderPic());
    	}
    }
    
%>