
<html>
  <head>
    <title>宁波大河小区</title>
    <%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
    <link href="css/login.css" type="text/css" rel="stylesheet">
      <link href="css/login1.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css" />


      <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
      <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>

  </head>
  <body background="img/loginbg.jpg">
  <div class="second_body">
      <form >
          <div class="logo"></div>
          <div class="title-zh">大河小区便民服务系统</div>
          <div class="title-en" style="">
              Convenience Services Manage System</div>
         <%-- <div class="message" data-bind="html:message"></div>--%>
          <table border="0" style="width:300px;">
              <tr>
                  <td style="white-space:nowrap; padding-bottom: 5px;width:55px;">用户名：</td>
                  <td colspan="2"><input type="text"  class="textbox"id="LoginUser"  /></td>
              </tr>
              <tr>
                  <td class="lable" style="white-space:nowrap; letter-spacing: 0.5em; vertical-align: middle">密码：</td>
                  <td colspan="2"><input type="password" class="textbox" id="LoginPassword" /></td>

              </tr>
              <tr>
                  <td></td>
                  <td colspan="2">
                      <div id="identification">
                          <select class="easyui-combobox"  id="authselect" name="identification"  style="width: 70px">
                              <option value="user">用户</option>
                              <option value="manager">管理员</option>
                          </select>
                      </div>
                    <%--  <input type="checkbox" data-bind="checked:form.remember" /><span>系统记住我</span>--%></td>
              </tr>
              <tr>
                  <td colspan="3" style="text-align:center">
                    <%--  <input type="button" value="登录" class="login_button" id="loginBtn"  />
                      <input type="button" value="注册" class="reset_botton" id="register" />--%>
                      <div style="height: 26px"></div>
                  </td>
              </tr>
              <tr>
                  <td colspan="3" style="text-align:center">
                      <input type="button" value="登录" class="login_button" id="loginBtn"  />
                      <input type="button" value="注册" class="reset_botton" id="register" />
                  </td>
              </tr>
          </table>
      </form>
  </div>
 <%-- <div style="width: 60%;height: 40%;margin: 50% 20%;background-color:white">
    <div id="login" style="top:200px; left:70%;">
      <p>账号：<input type="text" class="textbox" id="LoginUser"></p>
      <p>密码：<input type="password" class="textbox" id="LoginPassword"></p>
      <div id="identification">
        <select class="easyui-combobox"  id="authselect" name="identification"  style="width: 70px">
        <option value="user">用户</option>
        <option value="manager">管理员</option>
        </select>
    </div>
    </div>
  </div>
<div id="btn">
    <a href="#" class="easyui-linkbutton" id="loginBtn">登录</a>
     <a href="#" class="easyui-linkbutton" id="register">注册</a>
</div>--%>


  </body>

</html>
