<%@ page language="java" import="java.util.*,java.sql.* "
          contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String msg ="";
String connectString = "jdbc:mysql://172.18.187.230:53306/15352163_project"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8"; 
    StringBuilder table=new StringBuilder("");
if(request.getMethod().equalsIgnoreCase("post")){
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "user", "123");
	  Statement stmt=con.createStatement();
	  String fmt="insert into p_user(username,password,email) values('%s','%s','%s')";
	  String username=request.getParameter("username");
	  String password=request.getParameter("password");
	  String email=request.getParameter("email");
	  String sql=String.format(fmt, username, password, email);
	  int cnt=stmt.executeUpdate(sql);
	  if(cnt > 0) msg="注册成功!";
	  stmt.close();
	  con.close();
	}
	catch (Exception e) {
		msg=e.getMessage();
	}
}
%>
<!DOCTYPE html >
<html  lang="zh-cn">
<head>
<title>注册</title>
<link type="text/css" rel="stylesheet" href="/css/register.css"/>
</head>
<body>
<script type="text/javascript" language="javascript">
function check(){
	var flag=true;
	var name=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	var passwordok=document.getElementById("passwordok").value;
	 if ("" == name){  
         alert("用户名不能为空！");  
         flag = false;  
         return false;  
     }    
	 else{
		 if(password==""||passwordok==""){
			 alert("登录密码或确认密码不能为空！");
			 flag = false;  
	         return false;  
			 }
		  else if(password!=passwordok){
			 alert("两次输入密码不一致！"); 
			 flag = false;  
	         return false;
		 }else{
			 alert("注册成功！");
			 window.location.replace="file/login.jsp"; 
			 return true;
		 }
		 
	 }
 } 
</script>

<div class="left_image">
  <a href="zdgk/zdgk08/tuzwq/tuzwq2015/tu201503/index.htm" target="_blank" title="首页">
           <img src="images/pitos.jpg" alt="[ 回到首页 ]">
      </a>
</div>

<div class="register_main" id="register_main">
  <h1>新用户注册</h1><a class="back" href="/project">返回首页&gt;&gt;</a>
  <div class="theme">
    <form name="form2" id="regUser"  method="post">
       <input name="dopost" type="hidden" value="regbase">
       <input name="step" type="hidden" value="1">
       <input name="mtype" type="hidden" value="个人">
      <ul>
        <li><span>用户名:</span>
          <input name="username" class="intxt w200" id="username" type="text">
        <li><span>登陆密码:</span>
          <input name="password" type="password" class="intxt w200" id="password" style="font-family: verdana;">
        </li>
        <li><span>确认密码:</span>
          <input name="passwordok" class="intxt w200" id="passwordok" type="password" size="20" value="">
        <li><span>邮箱:</span>
          <input name="email" class="intxt w200" id="email" type="text">
        <li style="list-style-type:none;"><span>&nbsp;</span>
        <button class="reg-btn" id="btnSignCheck" type="submit" onclick="return check();">注册</button>
        <!-- 跳转到登陆界面-->
        <a class="regbt" href="login.jsp" rel="nofollow">已有账号？点击登录</a>
        </li>
      </ul>
    </form>
    <%=msg %>
    </div>
  <br class="clear">
</div>
</body>
</html>
