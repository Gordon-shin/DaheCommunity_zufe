<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/4/26
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="AdminRepairManager">



    <div class="toolbar" id="AdminRepairToolBar">

        <div class="ctrl-div">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="adminRepairAdd">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="adminRepairDel">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="adminRepairEdit">维修人员工作时间编辑</a>
        </div>
    </div>
</table>
<div class="easyui-dialog" title="新增维修人员" iconCls="icon-save" modal="true" style="width: 550px"
     closed="true"  id="RepairAddDaig">
    <div id="formrepairadd" style="width: 498px; height: 520px;">
        <div id="left">
            <table cellpadding="5" style=" border-collapse:separate; border-spacing: 0 1em;">
                <tbody><tr>
                    <td>用户名:</td>
                    <td><input class="textbox validatebox-text " type="text" id="username"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="textbox validatebox-text " type="password" id="password"></td>
                </tr>
                <tr>
                    <td>工种:</td>
                    <td><input class="textbox validatebox-text " type="text" id="gongzhong"></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select class="easyui-combobox combobox-f combo-f textbox-f" id="sex" style="width: 100px; display: none;" textboxname="language" comboname="language">
                        <option value="man">男</option>
                        <option value="female">女</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="textbox validatebox-text" type="text" id="email"></td>
                </tr>

                <tr>
                    <td>电话号码:</td>
                    <td><input class="textbox validatebox-text " type="text" id="phone" title=""></td>
                </tr>

                <tr>
                    <td>真实姓名:</td>
                    <td><input class="textbox validatebox-text" type="text" id="realname" title=""></td>
                </tr>
                <tr>
                    <td>物业公司:</td>
                    <td><input class="textbox validatebox-text "  id="wuyegongsi" title=""></td>
                </tr>
                <tr>
                    <td>工作时间:</td>
                    <td><input class="easyui-datetimebox" id="repairmansparetime" title=""></td>
                </tr>
                <tr>
                    <td>下班时间:</td>
                    <td><input class="easyui-datetimebox" type="text" id="repairmanendtime" title=""></td>
                </tr>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox textbox-f" id="address" data-options="multiline:true" style="height: 60px; display: none;">
                </tr>
                </tbody>
            </table>
            <div id="buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="adminrepairtijiao" group=""><span class="l-btn-left"><span class="l-btn-text">提交</span></span></a>
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="reset" group=""><span class="l-btn-left"><span class="l-btn-text">重置</span></span></a>
            </div>
        </div>
        <div id="right">
            <div id="imgReview">
                <img id="img" src="" style="width: 150px;height: 150px">
            </div>
            <div>File1:</div>
            <input id="file1" data-options="prompt:'请选择'" style="width: 100%; display: none;" class="filebox-f textbox-f" textboxname="file2"><span class="textbox easyui-fluid filebox" style="width: 198px; height: 20px;"><a href="javascript:void(0)" class="textbox-button textbox-button-right l-btn l-btn-small" group="" id="" style="height: 20px; right: 0px;"><span class="l-btn-left" style="margin-top: -2px;"><span class="l-btn-text">Choose File</span></span><label class="filebox-label" for="filebox_file_id_1"></label></a><input type="text" class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="请选择" readonly="readonly" style="margin-left: 0px; margin-right: 75px; padding-top: 0px; padding-bottom: 0px; height: 20px; line-height: 20px; width: 115px;"><input type="file" class="textbox-value" id="filebox_file_id_1" name="file2" accept=""></span>
        </div>
    </div>

</div>

<div class="easyui-dialog" title="编辑 维修人员时间" iconCls="icon-save" data-options="buttons:'#RepairEditDaigbb'" modal="true" style="width: 300px;height: 300px"
     closed="true"  id="RepairEditDaig"  >
    <div style="margin: auto;padding: 5px;width: 130px">
        维修人员编号：<span id="weixiurenyuan1"></span><br>
        维修人员姓名：<span id="weixiurenyuan2"></span>
        <br>
       上班时间
        <input class="easyui-datetimebox" id="uptimeshijian" title="">
        <br>
        下班时间
        <input class="easyui-datetimebox" id="downtimeshijian" title="">
    </div>
    <div id="RepairEditDaigbb">
        <a href="#" class="easyui-linkbutton" id="repaimanmodifybaocun">保存</a>
        <%--<a href="#" class="easyui-linkbutton">关闭</a>--%>
    </div>
</div>


<script>
    var  currentrowid=null;
    var  currentrowtotal = null;
    function AdminRepairQuery() {
        var result =null;
        $.ajax({
            type: "POST",
            dataType: 'JSON',
            async: false,
            url: "AdminServlet",
            data: { method: "AdminRepairQuery"},
            success: function (e) {
                result = e;
            }
        })
        return result;
    }
    $(function () {

        var AdminRepair = AdminRepairQuery();
        $('#AdminRepairManager').datagrid({
            toolbar:$('#AdminRepairToolBar'),
            columns:[AdminRepair.title],
            title:"维修预约人员管理",
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
                currentrowid=rowdata.统一编号;
                currentrowtotal =rowdata
            },})
        $('#AdminRepairManager').datagrid('loadData', AdminRepair.rows);
        $('#adminRepairAdd').linkbutton({
            onClick:function () {
                $('#RepairAddDaig').dialog({
                    closed:false,
                    onBeforeClose:function () {
                        $('input').val("");
                    }
                })

            }
        })
        $('#adminRepairDel').linkbutton({
            onClick:function () {
               $.messager.confirm("确认","确认要删除该维修人员的信息吗",function (r) {
                   if (r === true) {
                       $.ajax({
                           url: "AdminServlet",
                           type: "post",
                           data: {data: JSON.stringify({currentrowid:currentrowid}), method: "AdminDelRepairMan"},
                           success: function (result) {
                                if (result=="true") {
                                    $.messager.alert("信息","删除维修人员成功","info")
                                    RepairManRefresh();
                                }
                                else {
                                    $.messager.alert("信息","删除维修人员失败","error")
                                }
                           }
                       })
                   }
               })
            }
        })

        function RepairManRefresh() {
            AdminRepair=AdminRepairQuery();
            $('#AdminRepairManager').datagrid('loadData', AdminRepair.rows);
        }
        $('#adminrepairtijiao').linkbutton({
            onClick:function () {
                data = {};
                data['username']=$('#username').val();
                data['password']=$('#password').val();
                data['email']=$('#email').val();
                data['phone']=$('#phone').val();
                data['realname']=$('#realname').val();
                data['idcard']="";
                data['address']=$('#address').val();
                data['sex']=$('#sex').combobox("getText");
                data['startime']=$('#repairmansparetime').datetimebox("getValue");
                data['endtime']=$('#repairmansparetime').datetimebox("getValue");
                data['company']=$('#wuyegongsi').val();
                data['duties']=$('#gongzhong').val();
                var jsonobj=JSON.stringify(data);

               /* var addRepairMandata ={};*/
               /* addRepairMandata['startime']=$('#repairmansparetime').val();
                addRepairMandata['endtime']=$('#repairmanendtime').val();
                addRepairMandata['company']=$('#wuyegongsi').val();
                addRepairMandata['duties']=$('#gongzhong').val();
                addRepairMandata['email']=$('#email').val();
                addRepairMandata['phone']=$('#phone').val();*/


                $.ajax({
                    url: "AdminServlet",
                    type: "post",
                    data: {data: jsonobj,method:"AdminAddRepairMan"},
                    beforeSend: function () {
                        $.messager.progress({
                            text: '正在添加维修人员中...',
                        });
                    },
                    success: function (result) {
                        $.messager.progress('close');
                        if (result == "true") {

                            $.messager.alert('添加', '添加维修人员成功', "info");
                            RepairManRefresh();
                        } else {
                            $.messager.alert('添加', "添加失败", "error");
                        }
                    }
                })
                /*
                $.ajax({
                    url: "AdminServlet",
                    type: "post",
                    data: {data: jsonobj,method:"AdminAddRepairMan"},
                    success: function (result) {
                    }
                })*/
            }
        })
        $('#repaimanmodifybaocun').linkbutton({
            onClick:function () {
                if (($('#uptimeshijian').datetimebox("getValue").length>5)&&($('#downtimeshijian').datetimebox('getValue').length>5)){
                 var up =   $('#uptimeshijian').datetimebox("getValue").toString();
                  var down  =$('#downtimeshijian').datetimebox("getValue").toString();
                    var data = {up:up,down:down,id:currentrowtotal.维修人员编号}
                 if (up<down) {
                    $.ajax({
                        type: "POST",
                        dataType: 'JSON',
                        async: false,
                        url: "AdminServlet",
                        data: { data:JSON.stringify(data) ,method: "updateRepairManTime"},
                        success: function (e) {
                            if (e===true) {
                                $.messager.alert("信息","该维修人员时间更新成功","info")
                            }
                            else{
                                $.messager.alert("信息","该维修人员时间更新失败","error")

                            }
                        }
                     })
                 }
                }
            else{
                    $.messager.alert("信息","请检查输入的相关信息","info")
                }
            }
        })
        $('#adminRepairEdit').linkbutton({
            onClick:function () {
                if (currentrowid==null){
                    $.messager.alert("警告","请选择需要修改日期的维修人员","error")
                    return;
                }

             $('#RepairEditDaig').dialog({
                 closed:false,
                 onBeforeOpen:function(){
                     $('#weixiurenyuan1').append(currentrowtotal.维修人员编号)
                     $('#weixiurenyuan2').append(currentrowtotal.维修人员姓名)

                 },
                 onBeforeClose:function () {
                     $('#uptimeshijian').datetimebox('setValue',"");
                     $('#downtimeshijian').datetimebox('setValue',"");
                     $('#weixiurenyuan1').empty();
                     $('#weixiurenyuan2').empty();
                 }
             })
            }
        })

    })
</script>
<style>
    #formrepairadd {
        margin: 0 auto;
        display: -webkit-box;
    }
    .textbox{
        height: 22px;
    }
    *{
        font-size:12px;
    }
    #right{
        width: 200px;
        height: 450px;
    // border: 1px solid red;
    }
    #left{
        padding: 20px 0px 0px 10px;
        width: 300px;
        height: 450px;
    // border: 1px solid red;
    }
    #imgReview{
        margin: auto;
        width: 150px;
        height: 150px;
        border: 1px solid black;
    }
    #buttons{

        width: 100px;
        margin: auto;
    //   border: 1px solid red;
    }
</style>