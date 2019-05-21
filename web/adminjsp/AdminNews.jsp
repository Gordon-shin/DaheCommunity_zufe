<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/17
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    function reviewNews() {
        let result ;
        $.ajax({
            url: "newsServlet",
            type: "post",
            async:false,
            data: { method: "reviewNews"},
            success: function (e) {
                result = e;
            }
        })
        return result;
    }

    $(function () {

        var newseditor;
        var ReviewNews =  JSON.parse( reviewNews());
        $('#AdminNewsManager').datagrid({
            toolbar:$('#AdminNewsBar'),
            columns:[eval(ReviewNews.title)],
            title:"新闻信息管理",
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
               // currentrowshopid=rowdata.物品ID;
              //  currentrowshoptotal =rowdata
            },
        })
        $('#NewsAddBtn').linkbutton({
            onClick:function () {
                var newsdata={}
                newsdata["newscontent"] = newseditor.html();
                newsdata["adminid"] = sessionid
                newsdata["newsclass"] = $('#xinwenfenlei').val()
                newsdata["newstitle"] = $('#xinwenbiaoti').val()
                $.ajax({
                    url: "newsServlet",
                    type: "post",
                    data: { data:JSON.stringify(newsdata),method: "addNews"},
                    success: function (e) {
                        if (e>0){
                            $.messager.alert("信息","新闻添加成功","info",function () {
                                
                            })
                        }
                        else {
                            $.messager.alert("信息","新闻添加失败，请检查相关信息","info")
                        }
                    }
                })
            }
        })
        $('#AdminNewsManager').datagrid('loadData',ReviewNews.rows)
        $('#AdminNewsManager').datagrid("selectRow", 0)
        $('#adminNewsAdd').linkbutton({
            onClick:function () {
                $('#NewsaddDiaglog').dialog({
                    closed:false,
                    onBeforeOpen:function(){
                         newseditor=KindEditor.create('#xinwenneirong', {
                            allowPreviewEmoticons: false,
                            uploadJson: 'jspFunction/upload_json.jsp',
                            urlType: 'absolute',
                            height:"300px",
                            width:"98%",
                            resizeType: 0,  //文本框不可拖动
                            items: [
                                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                        })
                    },
                    onBeforeClose:function () {
                        alert(1)
                    }

                })
            }
        })
    })
</script>

<table id="AdminNewsManager">
    <div class="toolbar" id="AdminNewsBar">

        <div class="ctrl-shop">
            <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="adminShopAdd">添加</a>
             <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="adminShopEdit">维修人员工作时间编辑</a>--%>
            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="adminNewsDel">新闻删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" id="adminNewsAdd">新闻添加</a>
        </div>
    </div>
</table>
<div id="newsdlg-btns">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="NewsAddBtn">新闻添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="NewscancelBtn">取消</a>
</div>

<div class="easyui-dialog" title="新增新闻" iconCls="icon-save" modal="true"
     closed="true" buttons="#newsdlg-btns" id="NewsaddDiaglog" style="width: 500px;height: 550px">
    <div style="text-align: center">请输入添加新闻的信息</div>
    <div style="height: 160px;margin: 20px 0px">
        <div style="margin: 0px 0px 10px 30px ">新闻分类:<input style="width:120px;height:20px;margin: 0px 0px 0px 30px" class="textbox" type="text" id="xinwenfenlei" ></div>

        <div style="margin: 0px 30px ">新闻标题:<input style="width:300px;height:30px;margin: 0px 0px 0px 30px" class="textbox" type="text" id="xinwenbiaoti" ></div>

            <div style="margin: 0px 30px;padding-top:20px;width: 180px; ">新闻内容:</div>
            <div style="padding-top:20px;margin: 0px 0px 0px 20px">
                <textarea id="xinwenneirong"></textarea>
            </div>
        </div>
    </div>
</div>
