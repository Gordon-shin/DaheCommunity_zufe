<%@ page import="org.sc.dao.CommonDao" %>
<%@ page import="net.sf.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/2/26
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <title>测试</title>
</head>
<body>
<h2>Basic FileBox</h2>
<p>The filebox component represents a file field of the forms.</p>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="Upload File" style="width:400px;padding:30px 70px 50px 70px">
    <div style="margin-bottom:20px">
        <div>Name:</div>
        <input class="easyui-textbox" style="width:100%">
    </div>
    <div style="margin-bottom:20px">
        <div>File1:</div>
        <input class="easyui-filebox" name="file1" data-options="prompt:'Choose a file...'" style="width:100%">
    </div>
    <div style="margin-bottom:20px">
        <div>File2:</div>
        <input class="easyui-filebox" name="file2" data-options="prompt:'Choose another file...'" style="width:100%">
    </div>
    <div>
        <a href="#" class="easyui-linkbutton" style="width:100%">Upload</a>
    </div>
</div>

</body>
</html>
