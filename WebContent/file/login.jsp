<%@ page language="java" import="java.util.*,java.sql.* "
          contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
<%  
  request.setCharacterEncoding("utf-8");
  String msg = "333";
  String connectString = "jdbc:mysql://172.18.187.230:53306/15352163_project"
      + "?autoReconnect=true&useUnicode=true&useSSL=true&verifyServerCertificate=false"
      + "&characterEncoding=UTF-8";
  if (request.getMethod().equalsIgnoreCase("post")) {
	  String Password = request.getParameter("Password");
	  String Name = request.getParameter("Name");
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection(connectString, 
          "user", "123");
      Statement stmt=con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM p_user where username = '"+Name+"' and password = '"+Password+"';");
      while(rs.next()){
    	  if (request.getParameter("Name") == null || request.getParameter("Password") == null) {    
              msg="用户名或密码错误";
          }    
    	  
      }
      
  }
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>   
  <base href="<%=basePath%>">
<title>登录</title>
</head>
<body>
<div class="bor" id="login">
  <div class="theme">
    <form name="form2" id="regUser"   method="post">
       <input name="dopost" type="hidden" value="regbase">
       <input name="step" type="hidden" value="1">
       <input name="mtype" type="hidden" value="个人">
      <ul>
        <li><span>用户名：</span>
          <input name="Name" class="intxt w200" id="txtUsername" type="text">
        </li>
        <li><span>登陆密码：</span>
          <input name="Password" type="password" class="intxt w200" id="txtPassword" style="font-family: verdana;">
        </li>
        <div class="but">
        <button class="reg-btn" id="btnSignCheck" type="submit" style="width:50px; height:25px;">登录</button>
        <button class="reg-btn" id="btnSignCheck" type="reset" style="width:50px; height:25px;">重置</button>
        <br>
        <a id="zhuce" href="file/register.jsp" style="margin-left:120px;color:green;">注册新用户</a>
        </div>
        
        <!-- 跳转到登陆界面-->
      </ul>
    </form>
    <%=msg %>
    </div>
  <br class="clear">
</div>
</body>
</html>