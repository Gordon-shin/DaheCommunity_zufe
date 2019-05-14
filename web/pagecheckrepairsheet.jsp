<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/10
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<div class="toolbar" id="toolbarweixiusheet">
    <div class="ctrl-weixiusheet">
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="Cancelyuyue">取消预约</a>
        &lt;%&ndash; <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>&ndash;%&gt;
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="addRepairSheet">完成预约，添加维修单</a>
    </div>
</div>--%>
<table id="weixiuSheetchecker" style="width:100%;height:95%;">

</table>
<!-- 弹出框 -->
<div class="easyui-dialog" title="填写维修单信息" iconCls="icon-save" modal="true"
     closed="true" buttons="#dlg-addRepairSheetdiag" id="addRepairSheetdiag" style="width: 400px;height: 500px">
    <div style="text-align: center">请填写相关维修单</div>
    <div style="height: 160px;margin: 20px 0px">
        <div style="margin: 0px 0px 0px 40px;float: left">
            <img src="" id="weixiutupian" style="width: 100px; height: 100px;">
            <div style="margin: 0px 18px"><input  id="file3" class="easyui-filebox"  name="file4" data-options="prompt:'请选择'" style="width:70px"></div>
            <div style=""><label style="">制造商:</label>  <input id="zhizaoshang"  style="width:50px;"></div>
        </div>

        <div style="margin: 0px 0px 0px 30px;width: 180px;display:inline-block">
            <div style="margin: 0px 30px;width: 180px;padding: 5px ">预约编号:<span id="yuyebianhao"></span></div>
            <div style="margin: 0px 30px;width: 180px;padding: 5px ">维修人员工号:<span id="weixiurenyuangonhao"></span></div>
            <div style="margin: 0px 30px;width: 180px; padding: 5px">维修人员姓名:<span id="weixiurenyuanxingming"></span></div>
            <div style="margin: 0px 30px;width: 180px; padding: 5px">预约人员姓名:<span id="yuyuerenyuanxingming"></span></div>
            <div style="margin: 0px 30px;width: 180px; padding: 5px"><label style="color: red">检修价格:</label>  <input id="weixiujiage" value="1" style="width:80px;"></div>


            <%-- <div class="easyui-slider" data-options="min:10,max:50,step:10" style="width:40px"></div>--%>

        </div>
        <div style="text-align: center;color: red">请填写相关描述 </div>
        <div style="width:380px; "><textarea id="weixiudandes"></textarea></div>
    </div>
</div>
</div>
<div id="dlg-addRepairSheetdiag">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="subRepairSheetBtn">提交</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancelBtn">取消</a>
</div>


<script>
    $(function () {
        var weixiubiaodata;

        function weixiubiaoload() {
            $.ajax({
                type: "POST",
                url: "RepaiweixiudanServlet",
                data: {userid: sessionid,method:"Queryweixiubiao"},
                success: function (result) {
                    console.log(result)
                    var result = JSON.parse(result)
                    $('#weixiuSheetchecker').datagrid({
                        columns:[eval(result.title)]
                    })
                   if (result.total==null) {
                       $.messager.alert("信息", "没有检索到相关信息,请先去预约", "info",function () {
                           return;
                       })
                   }
                   else {
                       $.messager.alert("信息", "找到了"+result.total+"条信息", "info")

                        console.log(result.rows)
                       $('#weixiuSheetchecker').datagrid('loadData', eval(result.rows));
                   }
                }
            })
        }

       weixiubiaoload();
        $('#weixiuSheetchecker').datagrid({
            //toolbar:$('#toolbarweixiusheet'),
            title:"个人维修单查询",
            striped:true,
            rownumbers:true,
            pagination:true,
            fit:true,
            remoteSort:false,
            fitColumns:true,
            resizable:true,
            loadMsg:true,
            singleSelect: true,
            checkOnSelect : true,
            selectOnCheck:true,
            autoRowHeight:false,
            resizeHandle:'right',
            onLoadSuccess:function(){

            },
          /*  onCheck:function (index,rowdata) {
                userid=rowdata.用户编号;
                repairmanid=rowdata.维修人员编号;
                orderid=rowdata.预约编号;
                /!*   console.log(userid);
                   console.log(repairmanid);*!/
                repairinfo = rowdata;
            }*/
        })

    })

</script>