<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/2
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="AdminShopManager">



    <div class="toolbar" id="AdminShopBar">

        <div class="ctrl-shop">
           <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="adminShopAdd">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="adminShopEdit">维修人员工作时间编辑</a>--%>
            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="adminShopPass">审核通过</a>

        </div>
    </div>
</table>
<script>
    var currentrowshopid;
    var currentrowshoptotal;
    function AdminShopshengheQuery(){
        var result =null;
        $.ajax({
            type: "POST",
            dataType: 'JSON',
            async: false,
            url: "AdminServlet",
            data: { method: "AdminShopshengheQuery"},
            success: function (e) {
                result = e;
            }
        })
        return result;
    }
    $(function () {
        var AdminShop=AdminShopshengheQuery()
        console.log(AdminShop)
        $('#AdminShopManager').datagrid({
            toolbar:$('#AdminShopBar'),
            columns:[AdminShop.title],
            title:"商品审核管理",
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
                currentrowshopid=rowdata.物品ID;
                currentrowshoptotal =rowdata
            },})
        $('#AdminShopManager').datagrid('loadData', AdminShop.rows);
        $('#adminShopPass').linkbutton({
            onClick:function () {
                if (currentrowshoptotal.toString().length<5) {
                    $.messager.alert("错误","请选择需要审核的二手商品","error")
                    return;
                }
                else{
                    $.ajax({
                        url: "AdminServlet",
                        type: "post",
                        data: {data: currentrowshopid,method:"AdminShopPass"},
                        success: function (e) {

                            let result =e
                            if (result=="true") {
                                $.messager.alert("成功","审核通过该物品","info")
                                AdminShop=AdminShopshengheQuery()
                                $('#AdminShopManager').datagrid('loadData', AdminShop.rows);

                            }
                            else {
                                $.messager.alert("失败","操作失败","error")
                            }
                        }
                    })
                }
            }
        })
    })
</script>