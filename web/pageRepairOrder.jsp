<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/4
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if((session.getAttribute("User"))==null){
    response.sendRedirect("login.jsp");
}
%>
<script type="text/javascript" src="js/pageRepairOrder.js"></script>
<table id="orderTable">

</table>


<div class="toolbar" id="toolbarOrder">
<div class="search-div">
    <label>所需要维修的工种：</label>
    <input  style="width: 100px" id="chooseType">


    <label>请选择需要预约的日期：</label>
    <input   id="riqi">

    <a href="#" iconCls="icon-search" id="orderSearch">搜索</a>
</div>
<div class="ctrl-div">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addBtn">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true">打印</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true">导入</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导出</a>
</div>
</div>