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
    var invoicedata;
    $(function () {
        shuju =  JSON.parse(queryshopdingdan());

        $('#invoiceManager').datagrid({
            toolbar:$('#invoiceManagerToolBar'),

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
                invoicedata=rowdata;
            },
        })
        if (JSON.stringify(shuju)!="[]") {
            $('#invoiceManager').datagrid({columns:[shuju.title]})
            $('#invoiceManager').datagrid('loadData', shuju.rows);
            $('#invoiceManager').datagrid('selectRow',0)
        }
        else{
            $.messager.alert("信息","没有找到相关的信息","info")
        }
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
        $('#compeleteinvoice').linkbutton({
            onClick:function () {
                if (invoicedata.货物状态=="等待发货") {
                    $.messager.alert("信息","对方还没有发货请不要确认收货","error")
                }
                else if (invoicedata.货物状态=="已确认收货") {
                    $.messager.alert("信息","该商品您已确认收货","error")
                }
                else {
                    $.messager.confirm("信息","请确认有没有收到货，<br>该操作不可逆",function (r) {
                        if (r==true){
                            $.ajax({
                                url: "ShopServlet",
                                async:false,
                                type: "post",
                                data: {userid:sessionid,itemid:invoicedata.编号, method: "querenshouhuo"},
                                success: function (e) {
                                    $.messager.alert("信息",e,"error")
                                    shuju =  JSON.parse(queryshopdingdan());
                                    if (JSON.stringify(shuju)!="[]") {
                                        $('#invoiceManager').datagrid({columns:[shuju.title]})
                                        $('#invoiceManager').datagrid('loadData', shuju.rows);
                                        $('#invoiceManager').datagrid('selectRow',0)
                                    }
                                    else{
                                        $.messager.alert("信息","没有找到相关的信息","info")
                                    }
                                }
                            })
                        }
                    })
                }
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
           <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="!">预约</a>--%>
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" id="compeleteinvoice">收货成功</a>
        </div>
    </div>
</table>