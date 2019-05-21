<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/16
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        $('#HospManager').datagrid({
            toolbar:$('#HospManagerBar'),
            title:"医院预约管理",
            striped:true,
            rownumbers:true,
            pagination:true,
            fit:true,
            remoteSort:false,
            fitColumns:true,
            loadMsg:true,
            singleSelect: true,
            checkOnSelect : true,
            selectOnCheck:true,
            onCheck:function (index,rowdata) {
                //  $('#orderTable').datagrid('selectRow',index);
                //rows =  $('#orderTable').datagrid('getChecked');

            }
        })
        $.ajax({
            type: "POST",
            dataType: 'JSON',
            url: "HospitalServlet",
            data:{data:sessionid,method:"yiyuanordermanager"},
            success:function (result) {
                if (result=="[]") {
                    $.messager.alert("信息","搜索不到相关的信息","info")
                }
                else{
                    $('#HospManager').datagrid({
                        columns:[eval(result.title)]
                    })
                    $('#HospManager').datagrid('loadData',result.rows)
                }
            }
        })
    })
</script>
<table id="HospManager">
<div class="toolbar" id="HospManagerBar">

    <div class="ctrl-shop">
        <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="adminShopAdd">添加</a>
         <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="adminShopEdit">维修人员工作时间编辑</a>--%>
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="adminShopPass">取消预约</a>
    </div>
</div>
</table>