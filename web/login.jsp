
<html>
  <head>
    <title>宁波大河小区</title>
    <%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
    <link href="css/login.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css" />
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/login.js"></script>

  </head>
  <body>
    <div id="login">
      <p>账号：<input type="text" class="textbox" id="LoginUser"></p>
      <p>密码：<input type="password" class="textbox" id="LoginPassword"></p>

      <div id="identification">
        <select class="easyui-combobox" name="identification"  style="width: 70px">
        <option value="user">用户</option>
        <option value="manager">管理员</option>
        </select>
    </div>
    </div>
<div id="btn">
    <a href="#" class="easyui-linkbutton">登录</a>
    <a href="#" class="easyui-linkbutton">登录</a>
    <a href="#" class="easyui-linkbutton">登录</a>
</div>
  </body>


</html>
