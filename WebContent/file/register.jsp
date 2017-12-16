<%@ page language="java" import="java.util.*,java.sql.* "
          contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");
String msg ="";
String connectString = "jdbc:mysql://172.18.187.231:53306/15352163_project"
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
	  String fmt2="select * from p_user where email = '"+email+"';";
	  String sql1=String.format(fmt2, email);
	  ResultSet rs=stmt.executeQuery(sql1);
	  if(!rs.next()) {
		  String sql=String.format(fmt, username, password, email);
		  int cnt=stmt.executeUpdate(sql);
		  if(cnt > 0) msg="注册成功!";
	  } else {
		  msg="*此邮箱已被注册！";
	  }
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
<base href="<%=basePath%>">
<title>拾音 —— 独立，但不孤独</title>
<link type="text/css" rel="stylesheet" href="css/register.css"/>
<link type="text/css" rel="stylesheet" href="css/head_and_foot.css"/>
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
			 window.location.replace="file/login.jsp"; 
			 return true;
		 }
		 
	 }
 } 
</script>

<!-- header start -->
<div class="header">
    <div class="header-ct">
        <a href="mainpage.jsp" class="logo">
            <span class="icon-logo"></span>拾音
        </a>
        <div class="nav">
            <ul class="clearfix">
                <li><a href="qikan.jsp">期刊</a></li>
                <li><a href="sigle.jsp">单曲</a></li>
                <li><a href="zhuanlan.jsp">专栏</a></li>
            </ul>
        </div>

        <div class="head-search">
            <form class="search-form" action="http://www." id="headSearchForm">
                <input type="text" class="search-input" name="q" autocomplete="off">
                <button class="search-btn" type="submit"><span class="see">搜索</span></button>
            </form>
        </div>			<!-- logged-in-wrapper -->
        <div class="logged-in-wrapper" id="loggedInWrapper">

        </div>
        <!-- logged-in-wrapper end-->

       <!--  <div class="logged-out-wrapper" id="loggedOutWrapper" data-remote="http://www." data-tipid="headLoginDialog" data-width="235" data-show="mouseenter" data-adjusty="-12">
            <a href="javascript:;" rel="nofollow" class="ln-top-login"> 注册/登录 </a>

        </div> -->
        <!-- logged-out-wrapper -->
    </div>
</div>
<!--/// header end --><!-- container start -->


<div class="register_main" id="register_main">
	<!-- <div class="left_image">
	  <a href="zdgk/zdgk08/tuzwq/tuzwq2015/tu201503/index.htm" target="_blank" title="首页">
	           <img src="images/pitos.jpg" alt="[ 回到首页 ]">
	      </a>
	</div> -->
  <div class="theme">
  <div class="head"><span style="color:#ff7f50">新用户注册</span></div>
    <form name="form2" id="regUser"  method="post">
       <input name="dopost" type="hidden" value="regbase">
       <input name="step" type="hidden" value="1">
       <input name="mtype" type="hidden" value="个人">
          <input name="username" class="intxt_w200" id="username" type="text" placeholder="  输入用户名"><br>
          <input name="password" type="password" class="intxt_w200" id="password"  placeholder="  请输入密码"><br>
          <input name="passwordok" class="intxt_w200" id="passwordok" type="password" size="20" value="" placeholder="  请再次输入密码"><br>
          <input name="email" class="intxt_w200" id="email" type="text" placeholder="  请输入注册邮箱"><br>
        <button class="reg-btn" id="btnSignCheck" type="submit" onclick="return check();" style="color:#333333">注 册</button>
        <!-- 跳转到登陆界面-->
        <a class="regbt" href=".//file/login.jsp" rel="nofollow" style="color:#ff7f50">已有账号？点击登录</a>
    </form>
    <div class="result" style="color:#ff0000"><%=msg %></div>
    </div>
  <br class="clear">
</div>
<!--footer begin  -->
<div class="footer">
    <div class="foot-ct clearfix">
        <div class="about-wrapper">
            <h4 class="foot-item-head">关于</h4>
            <p><a class="ln-about" href="http://www.">关于拾音</a></p>
            <p><a class="ln-about" href="http://www.">加入我们</a></p>
        </div>
        <div class="sns-wrapper">
            <h4 class="foot-item-head">关注拾音</h4>    
            <p class="icp">&copy; 2017 拾音</p>
            <p class="slogan">
                <span class="icon-slogan"></span>
            </p>
        </div>
    </div>
</div>
<!-- <div id="backTop">&nbsp;</div> -->
<!-- footer end -->

</body>
</html>
