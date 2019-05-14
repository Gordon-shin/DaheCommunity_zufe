<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/14
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="hosporderTable">
    <div class="toolbar" id="toolbarhospOrder">
        <div class="search-div">
            <label>查询相关科室：</label>
            <input  style="width: 100px" id="hospchooseType">
            <label>查询相关疾病：</label>
            <input  style="width: 100px" id="hospchoosedisease">
            <label>请选择需要预约的日期：</label>
            <input   id="hospriqi" style="width: 200px;">

            <a href="#" iconCls="icon-search" id="hosporderSearch">搜索</a>
           <%-- <label>注意检修工作大约在3小时以内</label>--%>
        </div>
        <div class="ctrl-div">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="yuyue">预约</a>
            <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true">打印</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true">导入</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导出</a>--%>
        </div>
    </div>
</table>

<script>
    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
    }
    $(function () {
        $('#hospriqi').datebox({
            formatter:myformatter
            ,parser:myparser
        })
        $('#hosporderTable').datagrid({
            toolbar:$('#toolbarhospOrder'),
            title:"医院预约",
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
            },
        })
        $('#hosporderSearch').linkbutton({
            beforeSend: function() {
            }
            })
        $('#hospchoosedisease').combobox({
            editable:false,
        })
        $('#hospchooseType').combobox({
            editable:false,
            url:"HospitalServlet?method=kscx",
            valueField: 'Id',
            textField: 'cateName',
            onSelect:function () {
                let ksid = $('#hospchooseType').combobox("getValue")
                $('#hospchoosedisease').combobox({
                    url:"HospitalServlet?method=querydiseaseinfo&ksid="+ksid,
                    valueField: 'id',
                    textField: 'disName'
                })
            }
        })
    })
</script>