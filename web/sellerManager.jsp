<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/23
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="sellerManagertable">
    <div class="toolbar" id="sellermanagertoolbar">
        <div class="search-div">
            <label>按关键字查询</label>
            <input  style="width: 200px" id="sellerguanjiancichaxun">


            <label>按时间查询：</label>
            <input   id="sellerdingdanriqichaxun">
        </div>
        <div class="ctrl-div">
            <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="!">预约</a>--%>
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" id="sellerfahuo">发货</a>
        </div>
    </div>
</table>

<script>
    var fahuoshuju
    function sellerqueryfahuo(){
        let result = null
        $.ajax({
            url: "ShopServlet",
            async:false,
            type: "post",
            data: {userid: sessionid, method: "sellerqueryfahuo"},
            success: function (e) {
                result = e;
            }
        })
        return result;
    }
    $(function () {
        fahuoshuju =JSON.parse(sellerqueryfahuo()) ;

        $('#sellerManagertable').datagrid({
            toolbar:$('#sellermanagertoolbar'),
            title:"卖家管理",
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
                fahuoshuju=rowdata;
            },
        })
        if (JSON.stringify(fahuoshuju)!="[]") {
            $('#sellerManagertable').datagrid({columns:[fahuoshuju.title]})
            $('#sellerManagertable').datagrid('loadData',fahuoshuju.rows);
            $('#sellerManagertable').datagrid('selectRow',0)
        }
        else{
            $.messager.alert("信息","没有找到相关的信息","info")
        }
        $('#sellerdingdanriqichaxun').datetimebox({
            editable:false
        })
        $('#sellerguanjiancichaxun').searchbox({
            prompt:'请输入订单的关键词',
            searcher:function (value) {
                if ($('#shopdingdanriqichaxun').datetimebox('getValue').length<5) {

                }
                else {

                }
            }
        })
        $('#sellerfahuo').linkbutton({
            onClick:function () {
                if (fahuoshuju.货物状态=="已确认收货"||fahuoshuju.货物状态=="已发货"){
                    $.messager.alert("信息","请不要选择已发货的订单","info")
                }
                else{
                    $.messager.confirm("信息","确认发货",function (r) {
                        if (r==true) {
                            $.ajax({
                                url: "ShopServlet",
                                async:false,
                                type: "post",
                                data: {fahuobianhao: fahuoshuju.编号, method: "sellerfahuo"},
                                success: function (e) {
                                    if (e=="success") {
                                        $.messager.alert("信息","发货成功<br>请等待买家收货","info")
                                        fahuoshuju =JSON.parse(sellerqueryfahuo());
                                        $('#sellerManagertable').datagrid('loadData',fahuoshuju.rows);
                                    }
                                    else{
                                        $.messager.alert("信息","发货失败<br>请重新发货","info");
                                         fahuoshuju =JSON.parse(sellerqueryfahuo());
                                        $('#sellerManagertable').datagrid('loadData',fahuoshuju.rows);
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