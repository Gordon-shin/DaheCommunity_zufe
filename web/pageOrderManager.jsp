<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if((session.getAttribute("User"))==null){
    response.sendRedirect("login.jsp");
}
%>
<script type="text/javascript" src="js/orderManager.js"></script>
<table id="orderManagerTable" style="width:100%;height:95%;">

</table>


<div class="toolbar" id="toolbarpom">
    <div class="ctrl-div">
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="Cancelyuyue">取消预约</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>
    </div>
</div>