<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/2/27
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/register.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
</head>
<body>
<form  id="ff">


    <div id="form" >
        <div id="left" >
            <table cellpadding="5" >
                <tr>
                    <td>用户名:</td>
                    <td><input class="textbox" type="text"  id="username" ></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="textbox" type="password" id="password"></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select class="easyui-combobox" name="language" id="sex" style="width: 100px">
                        <option value="man">男</option>
                        <option value="female">女</option>
                    </select></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="textbox" type="text"  id="email" ></td>
                </tr>

                <tr>
                    <td>电话号码:</td>
                    <td><input class="textbox" type="text" id="phone" ></td>
                </tr>

                <tr>
                    <td>真实姓名:</td>
                    <td><input class="textbox" type="text" id="realname" ></td>
                </tr>
                <tr>
                    <td>身份证号:</td>
                    <td><input class="textbox" type="text" id="idcard"></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox"  id="address" data-options="multiline:true" style="height:60px"></td>
                </tr>

            </table>
            <div id="buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton" id="tijiao">提交</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" id="reset">重置</a>
            </div>
        </div>
        <div id="right">
            <div id="imgReview">
                <img id="img" src="" style="width: 150px;height: 150px">
            </div>
            <div>File1:</div>
            <input  id="file1"  name="file2" data-options="prompt:'请选择'" style="width:100%">
        </div>
    </div>


</form>



</body>
</html>
