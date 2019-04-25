<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/18
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script  type="text/javascript">
    $(function () {
        $('#invoiceManager').datagrid({
            toolbar:$('#invoiceManagerToolBar'),
            columns:[[
                {field:'ck',title:'选择',checkbox:true},
                {field:'Id',title:'员工编码',width:50},
                {field:'StaffName',title:'维修人员姓名',width:100},
                {field:'Duties',title:'从事工种',width:100},
                {field:'Email',title:'电子邮箱',width:100},
                {field:'Phone',title:'电话',width:100},
                {field:'Company',title:'所属物业公司',width:100},
            ]],
            //  url:"data/data.json",
            title:"维修预约",
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
                rows=rowdata.Id;
                console.log(rows);
            },
        })
        $('#querydingdanriqi').datetimebox({
          editable:false
        })
        $('#dingdanguanjianci').searchbox({
            prompt:'请输入订单的关键词',
            searcher:function (value) {

            }})
        var data = {userid:sessionid};
        $.ajax({
            type: "POST",
            url:"ShopServlet",
            data:{data:JSON.stringify(data),method:"queryalldingdan"},
            success:function (result) {

            }
        })

    })
</script>
<table id="invoiceManager">



    <div class="toolbar" id="invoiceManagerToolBar">
        <div class="search-div">
            <label>按关键字查询</label>
            <input  style="width: 200px" id="dingdanguanjianci">


            <label>按时间查询：</label>
            <input   id="querydingdanriqi">

            <a href="#" iconCls="icon-search" id="#">搜索</a>

        </div>
        <div class="ctrl-div">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="!">预约</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="@">编辑</a>
        </div>
    </div>
</table>