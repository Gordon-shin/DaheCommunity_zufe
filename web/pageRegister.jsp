<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/2/27
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>
<div id="layout">
    <div id="form" >
        <div id="left" >
            <table cellpadding="5" >
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="easyui-textbox" type="password"  data-options="required:true"></td>
                </tr>
                <tr>
                <td>性别:</td>
                <td><select class="easyui-combobox" name="language" style="width: 100px">
                    <option value="man">男</option>
                    <option value="female">女</option>
                </select></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true,validType:'email'"></td>
                </tr>

                <tr>
                    <td>电话号码:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>

                <tr>
                    <td>真实姓名:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>
                <tr>
                    <td>身份证号:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox"  data-options="multiline:true" style="height:60px"></td>
                </tr>

            </table>
            <div id="buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton">Submit</a>
                <a href="javascript:void(0)" class="easyui-linkbutton">Clear</a>
            </div>
        </div>
        <div id="right">
            <div id="imgReview">
                <img>
            </div>
            <div>File1:</div>
            <input class="easyui-filebox" id="file1" data-options="prompt:'请选择'" style="width:100%">
        </div>

    </div>

    </div>




</body>
</html>
