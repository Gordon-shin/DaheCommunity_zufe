<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/11
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js/pageSearch.js"></script>
<script type="text/javascript" src="js/datagrid-detailview.js"></script>

<table id="itemSearch">


</table>
<div class="toolbar" id="toolbarItemSearch">
    <div class="search-div"  style="padding: 10px 350px" id="searchbarbar">

        <input  style="width: 300px;height:28px " id="wupinsousuo" >


        <label>所需要维修的工种：</label>
        <a class="easyui-linkbutton" iconcls="icon-add"></a>
    </div>
    <div class="ctrl-div">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="">预约</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true">打印</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true">导入</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导出</a>
    </div>
</div>
