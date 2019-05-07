<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/18
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script  type="text/javascript">
    function queryshopdingdan() {
        let data={userid: sessionid}
        let result = null
        $.ajax({
            url: "ShopServlet",
            async:false,
            type: "post",
            data: {data: JSON.stringify(data), method: "shopchaxundingdan"},
            success: function (e) {
                result = e;
            }
        })
        return result;
    }
    var shuju
    $(function () {
        shuju =  JSON.parse(queryshopdingdan());
        $('#invoiceManager').datagrid({
            toolbar:$('#invoiceManagerToolBar'),
            columns:[shuju.title],
            title:"订单管理",
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
            onBeforeOpen:function(){
            },
            onCheck:function (index,rowdata) {
                //  $('#orderTable').datagrid('selectRow',index);
                //rows =  $('#orderTable').datagrid('getChecked');
                rows=rowdata.Id;
                console.log(rows);
            },
        })
        $('#invoiceManager').datagrid('loadData', shuju.rows);
        $('#shopdingdanriqichaxun').datetimebox({
          editable:false
        })
        $('#dingdanguanjianci').searchbox({
            prompt:'请输入订单的关键词',
            searcher:function (value) {
            if ($('#shopdingdanriqichaxun').datetimebox('getValue').length<5) {

            }
            else {

            }
        }
        })
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
            <input   id="shopdingdanriqichaxun">



        </div>
        <div class="ctrl-div">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="!">预约</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="@">编辑</a>
        </div>
    </div>
</table>