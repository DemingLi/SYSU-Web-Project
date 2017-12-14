<%@ page language="java" import="java.util.*,java.sql.* "
          contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");
String msg = "";
String connectString ="jdbc:mysql://172.18.187.230:53306/15352163_project"
		+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&&useSSL=false";
String user="user"; String pwd="123";
if(request.getMethod().equalsIgnoreCase("post")){
	String userpwd = request.getParameter("userpwd");
	String uname = request.getParameter("uname");
	String sex = request.getParameter("sex");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(connectString,user, pwd);
	Statement stmt = con.createStatement();
	try{
		String fmt="insert into p_user(username,password,email) values('%s', '%s','%s')";
		String sql = String.format(fmt,uname,userpwd,sex);
		int cnt = stmt.executeUpdate(sql);
		if(cnt>0)msg = "注册成功!";
		stmt.close();
		con.close();
		}catch(Exception e){
			msg = e.getMessage();
		}
}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  lang="zh-cn">
<style>
* {
    margin: 0;
    padding: 0;
}

body {
    font: 12px Tahoma, "宋体", Geneva, sans-serif;
    line-height: 1.8em;
    color: #555555;
    background: #F2F2F2;
}

.bor {
    width: 550px;
    margin-right: auto;
    margin-left: auto;
    position: relative;
    background: #FFF;
    margin-top: 80px;
    border: 1px solid #dfdddd;
    box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.2);
    -webkit-box-shadow: 0px 1px 3px 0 rgba(0, 0, 0, 0.2);
    -moz-box-shadow: 0px 1px 3px 0 rgba(0, 0, 0, 0.2);
}

#login .back {
    position: absolute;
    width: 100px;
    right: 0px;
    top: 40px;
    color: #9c0;
    text-decoration: underline;
}

#login .theme span {
    color: #555555;
    width: 100px;
    display: block;
    float: left;
    font-size: 14px;
    text-align: right;
    overflow: hidden;
    vertical-align: middle;
}

#login .theme li {
    margin-bottom: 20px;
    line-height: 30px;
    overflow: hidden;
    clear: both;
}

#login h1 {
    color: #333333;
    font-family: "微软雅黑";
    font-size: 26px;
    font-weight: normal;
    padding-top: 30px;
    padding-left: 20px;
    background: #f6f6f6;
    height: 45px;
    line-height: 26px;
}
.intxt, .text {
    background: url(../images/input_bg.gif) no-repeat 0 0;
    color: #666;
    border: 1px solid #CFCFCF;
    float: left;
    height: 30px;
    line-height: 30px;
    margin-left: 5px;
    padding: 0 4px;
    width: 238px;
    border-radius: 3px 3px 3px 3px;
}

</style>
<title>注册</title>
<head>

<body>
<script type="text/javascript" language="javascript">
function check(){
	var flag=true;
	var name=document.getElementById("uname").value;
	var password=document.getElementById("txtPassword").value;
	var passwordok=document.getElementById("userpwdok").value;
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
			 window.location.replace="login.jsp"; 
			 return true;
		 }
		 
	 }
 } 
</script>

<div class="bor" id="login">
  <h1>新用户注册</h1><a class="back" href="/project">返回首页&gt;&gt;</a>
  <div class="theme">
    <form name="form2" id="regUser"  method="post">
       <input name="dopost" type="hidden" value="regbase">
       <input name="step" type="hidden" value="1">
       <input name="mtype" type="hidden" value="个人">
      <ul>
        <li><span>用户名：</span>
          <input name="uname" class="intxt w200" id="uname" type="text">
         <em id="_userid"></em> </li>
        <li><span>登陆密码：</span>
          <input name="userpwd" type="password" class="intxt w200" id="txtPassword" style="font-family: verdana;">
        </li>
        <li><span>确认密码：</span>
          <input name="userpwdok" class="intxt w200" id="userpwdok" type="password" size="20" value="">
          <em id="_userpwdok"></em> </li>
        <li style="list-style-type:none;"><span>性别：</span>
        <input name="sex" type="radio" checked="checked" value="女" >女
        <input name="sex" type="radio" value="男">男</li>
        <li style="list-style-type:none;"><span>&nbsp;</span>
        <button class="reg-btn" id="btnSignCheck" type="submit" onclick="return check();">确定注册</button>
        <!-- 跳转到登陆界面-->
        <a class="regbt" href="/project" rel="nofollow">已有账号？</a>
        </li>
      </ul>
    </form>
    </div>
  <br class="clear">
</div>
</body>
</html>
