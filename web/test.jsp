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
    <%
        CommonDao commonDao = new CommonDao();
        String sql = "select * from tb_repair_sheet";
        String jsonStr = commonDao.CommonQuery(sql);
        out.println(jsonStr);
    %>
    <title>测试</title>
</head>
<body>

</body>
</html>
