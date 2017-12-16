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
  String backtohome="222";
  String connectString = "jdbc:mysql://172.18.187.231:53306/15352163_project"
      + "?autoReconnect=true&useUnicode=true&useSSL=true&verifyServerCertificate=false"
      + "&characterEncoding=UTF-8";
  if (request.getMethod().equalsIgnoreCase("post")) {
	  String password = request.getParameter("Password");
	  String username = request.getParameter("Name");
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection(connectString, 
          "user", "123");
      Statement stmt=con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM p_user where username = '"+username+"' and password = '"+password+"';");
      if (rs.next()){
    	  msg="登录成功！点击下方链接回到首页！";
    	  backtohome="<a href="+"\"file/home.jsp\""+ "style="+"\"color:#00ff00\""+">返回首页</a>";
      }
      else {
    	  msg="*用户名或密码错误！";
      }
      
  }
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>   
  <base href="<%=basePath%>">
<title>拾音 —— 独立，但不孤独</title>
<link type="text/css" rel="stylesheet" href="css/login.css"/>
<link type="text/css" rel="stylesheet" href="css/head_and_foot.css"/>
</head>
<body>
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
<div class="bor" id="login">
  <div class="theme">
  <div class="head"><span style="color:#ff7f50">登录</span></div>
    <form name="form2" id="regUser"   method="post">
       <input name="dopost" type="hidden" value="regbase">
       <input name="step" type="hidden" value="1">
       <input name="mtype" type="hidden" value="个人">
          <input name="Name" class="intxt_w200" id="txtUsername" type="text" placeholder="  输入用户名">
          <br><br>
          <input name="Password" type="password" class="intxt_w200" id="txtPassword"  placeholder="  输入密码">
       <br>
        <div class="but">
        <button class="reg-btn" id="btnSignCheck" type="submit"  style="color:#333333">登 录</button>
        <button class="reg-btn" id="btnSignCheck2" type="reset"  style="color:#333333">重 置</button>
        <br><br><br>
        <a class="zhuce" href="file/register.jsp" style="color:#00ff00">注册新用户</a>
        </div>
        
        <!-- 跳转到登陆界面-->
      
    </form>
    <div class="result" style="color:#ff0000"><%=msg %></div>
    <div class="back" style="color:#006400"><%=backtohome %></div>
    <script type="text/javascript">
    	if(msg.equals("success")) alert("登录成功！");
    	else alert("用户名或密码错误！");
    </script>
    </div>
    
    <!-- <div class="third-part tracking-ad" data-mod="popu_27">
		<span style="width: 257px;">第三方帐号登录</span>
		<span><font color="red">  </font></span>
		<a id="qqAuthorizationUrl" href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=100270989&redirect_uri=https%3A%2F%2Fpassport.csdn.net%2Faccount%2Flogin%3Foauth_provider%3DQQProvider&state=test" class="qq"></a>
		<a id="wechatAuthorizationUrl" href="javascript:void(0)" onClick="show();" class="wechat" target="_parent"></a>
	    <a id="sinaAuthorizationUrl" href="https://api.weibo.com/oauth2/authorize?client_id=2601122390&response_type=code&redirect_uri=https%3A%2F%2Fpassport.csdn.net%2Faccount%2Flogin%3Foauth_provider%3DSinaWeiboProvider" class="sina"></a>
	</div> -->
    
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