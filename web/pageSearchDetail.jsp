<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/11
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%
    String itemid =  request.getParameter("itemid");
    System.out.println(itemid);
%>
<table class="dv-table" border="0" style="width:100%;">
    <tr>
        <td rowspan="4" style="width:60px">

        </td>
        <td class="dv-label">物品编号: </td>
        <td>${param.itemid}</td>
        <td class="dv-label">产品序列号:</td>
        <td></td>
    </tr>
    <tr>
        <td class="dv-label">物品单价: </td>
        <td></td>
        <td class="dv-label">Unit Cost:</td>
        <td></td>
    </tr>
    <tr>
        <td class="dv-label">Attribute: </td>
        <td colspan="4"></td>
    </tr>
</table>