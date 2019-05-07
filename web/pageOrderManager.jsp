<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if((session.getAttribute("User"))==null){
    response.sendRedirect("login.jsp");
}
%>
<script type="text/javascript" src="js/orderManager.js"></script>
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/kindeditor-all.js"></script>
<table id="orderManagerTable" style="width:100%;height:95%;">

</table>


<div class="toolbar" id="toolbarpom">
    <div class="ctrl-div">
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="Cancelyuyue">取消预约</a>
       <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>--%>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="addRepairSheet">完成预约，添加维修单</a>
    </div>
</div>

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
        function dataload() {
            $.ajax({
                type: "POST",
                dataType: 'JSON',
                url: "OrderQueryServlet",
                data: {userid: sessionid},
                success: function (result) {
                    console.log(result.rows)
                    console.log(result.title)
                    console.log(result.total);
                    if (result.total == null) {
                        $.messager.alert("信息", "没有检索到相关信息,请先去预约", "info", function () {
                            var node=null;
                            var text='用户维修预约'
                            $.ajax({
                                url: "NavQueryByTextServlet",
                                type: "post",
                                dataType: 'JSON',
                                data: {text: text},
                                success: function (result) {
                                    node=result;
                                    console.log(node);
                                    console.log(node.text);
                                    $('#tt').tabs('close', "预约管理");
                                    if ($('#tt').tabs('exists', node.text)) {
                                        $('#tt').tabs('select', node.text)
                                    } else {
                                        $('#tt').tabs('add', {
                                            title: node.text,
                                            closable: true,
                                            iconCls: node.iconCls,
                                            href: node.url,
                                        });
                                    }
                                }
                            })
                        })
                    } else {
                        $.messager.alert("信息", "检索到" + result.total + "条信息", "info");
                        var title=result.title;
                        title.splice(0, 0, {field: 'ck', title: '选择', checkbox: true});
                        console.log(result)
                        $('#orderManagerTable').datagrid({
                            columns: [eval(title)],
                        })
                        $('#orderManagerTable').datagrid('loadData', result.rows);
                    }
                }
            })
        }

        var weixiudandes;
       $('#file3').filebox({
           onChange:function () {
               let reader = new FileReader();
               reader.readAsDataURL($("input[name='file4']")[0].files[0])
               reader.onload=function (result) {
                   document.getElementById("weixiutupian").src = result.target.result;
               }
           }
       })
        $('#addRepairSheet').linkbutton({
            onClick:function () {
                if (repairinfo==null){
                    $.messager.alert("信息","请选择预约编号","error")
                }
                else
                {
                    $('#addRepairSheetdiag').dialog({
                        closed:false,
                        onBeforeOpen:function () {
                            $('#yuyebianhao').append(repairinfo.预约编号)
                            $('#weixiurenyuangonhao').append(repairinfo.维修人员编号)
                            $('#weixiurenyuanxingming').append(repairinfo.维修人员姓名)
                            $('#yuyuerenyuanxingming').append(repairinfo.用户姓名)
                            weixiudandes=KindEditor.create('#weixiudandes', {
                                allowPreviewEmoticons: false,
                                uploadJson: 'jspFunction/upload_json.jsp',
                                urlType: 'absolute',
                                width:"100%",
                                height:"200px",
                                resizeType: 0,  //文本框不可拖动
                                items: [
                                    'emoticons', 'image']
                            });

                        },
                        onBeforeClose:function () {
                            $('#yuyebianhao').empty()
                            $('#weixiurenyuangonhao').empty()
                            $('#weixiurenyuanxingming').empty()
                            $('#yuyuerenyuanxingming').empty()
                            $('#zhizaoshang').empty();
                            document.getElementById("weixiutupian").src ="";
                            weixiudandes.html("");
                        }
                    })
                }
            },
        })
        $('#subRepairSheetBtn').linkbutton({
            onClick:function () {
                if ($('#zhizaoshang').val().length==0) {
                }
               let data = {yuyuebianhao:repairinfo.预约编号,weixiurenyuangonhao:repairinfo.维修人员编号,weixiurenyuanxingming:repairinfo.维修人员姓名,yuyuerenyuanid:
                   repairinfo.用户编号}
                data['price']=$('#weixiujiage').val();
                data['zzs'] = $('#zhizaoshang').val();
                data['addTime']=getNowFormatDate();
                data['desc']=weixiudandes.text();
                console.log(data)
                var formData = new FormData();
                    formData.append("File",$("input[name='file4']")[0].files[0]);
                    formData.append("JSON",JSON.stringify(data))
                    formData.append("method","weixiudan")
                console.log(formData.get("File"))
                $.ajax({
                    url:"RepairSheetServlet",
                    type:'post',
                    data:formData,
                    processData: false,
                    contentType: false,
                    success:function (result) {
                        if (result=="true") {
                            $.messager.alert("通知","维修单提交成功","info",function () {
                                $('#addRepairSheetdiag').dialog({
                                    closed: true
                                })
                                dataload();
                            })
                        }
                        else{
                            $.messager.alert("通知","维修单提交失败","error")
                        }
                    }
                })

            }
        })
    })
</script>