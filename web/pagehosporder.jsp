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
            <input id="hospriqi" style="width: 200px;">

            <a href="#" iconCls="icon-search" id="hosporderSearch">搜索</a>
           <%-- <label>注意检修工作大约在3小时以内</label>--%>
        </div>
        <div class="ctrl-div">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="hospyuyue">预约</a>
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
    var hosprowdata=null;
    ksid =1
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
                hosprowdata=rowdata
            },
        })
        $('#hosporderSearch').linkbutton({
            beforeSend: function() {

            },
            onClick:function () {
                var ks =  $('#hospchooseType').combobox("getValue")
                var diseasenum = $('#hospchoosedisease').combobox("getValue")
                if (diseasenum==0) {
                  $.ajax({
                      type: "POST",
                      url:"HospitalServlet",
                      data:{ks:ks,method:"ksdocinfoQuery"},
                      success:function (result) {
                          let tabledata = JSON.parse(result);
                          let title = tabledata.title
                          if (JSON.stringify(tabledata)=='[]'){
                              $.messager.alert("信息","没有找到相关信息，请重新选择","info",function () {
                                  return;
                              })
                          }
                          else {
                              title.splice(0, 0, {field: 'ck', title: '选择', checkbox: true})
                              $('#hosporderTable').datagrid({
                                  onLoadSuccess:function(){
                                      $('#hosporderTable').datagrid("selectRow", 0)
                                  },
                                  columns:[title]
                              })
                              $('#hosporderTable').datagrid("loadData",tabledata.rows
                              )
                          }
                      }
                  })
                }
                else {
                    $.ajax({
                        type: "POST",
                        url:"HospitalServlet",
                        data:{diseasenum:diseasenum,method:"diseasedocinfoQuery"},
                        success:function (result) {
                            let tabledata = JSON.parse(result);
                            let title = tabledata.title
                            if (JSON.stringify(tabledata)=='[]'){
                                $.messager.alert("信息","没有找到相关信息，请重新选择","info",function () {
                                    return;
                                })
                            }else{
                                title.splice(0, 0, {field: 'ck', title: '选择', checkbox: true})
                                $('#hosporderTable').datagrid({
                                    onLoadSuccess:function(){
                                        $('#hosporderTable').datagrid("selectRow", 0)
                                    },
                                    columns:[title]
                                })
                                $('#hosporderTable').datagrid("loadData",tabledata.rows
                                )
                            }
                        }
                    })
                }
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
                 ksid = $('#hospchooseType').combobox("getValue")
                console
                console.log("HospitalServlet?method=querydiseaseinfo&ksid="+ksid)
                $('#hospchoosedisease').combobox({
                    url:"HospitalServlet?method=querydiseaseinfo&ksid="+ksid,
                    valueField: 'id',
                    textField: 'disName'
                })
                $('#hospchoosedisease').combobox('setValue',0)
            }
        })
        $('#hospyuyue').linkbutton({
            onClick:function () {
                if ($('#hospriqi').datebox('getValue').length>0){
                    if (hosprowdata!=null) {
                        var hospguahaodata = {}
                          hospguahaodata["userid"] = sessionid
                          hospguahaodata["docid"] = hosprowdata.医师编号
                          hospguahaodata["ksjc"] = hosprowdata.科室简称
                          hospguahaodata["dicateid"] = hosprowdata.科室编号
                          hospguahaodata["cost"] = hosprowdata.挂号价格
                          hospguahaodata["date"] = $('#hospriqi').datebox('getValue')
                        $.messager.confirm("信息","预约" +
                            "将花费"+hosprowdata.挂号价格+"确" +
                            "认继续吗？",function (r) {
                           if (r == true) {
                               $.ajax({
                                   url: "HospitalServlet",
                                   type: "post",
                                   data: {data: JSON.stringify(hospguahaodata),method:"yiyuanyuye"},
                                   success: function (result) {
                                       result=JSON.parse(result)
                                       if (result.result>0) {
                                           $.messager.alert("信息","预约成功,您的预约编号为"+result.bianhao+"<br>" +
                                               "请记住或者在预约管理中查看","info",function () {
                                               return
                                           })
                                       }
                                       else{
                                           $.messager.alert("信息","预约失败","info")
                                       }
                                   }
                               })
                           }
                           else {return}
                        })
                    }
                    else{
                        $.messager.alert("警告","请选择需要预约的医师","info",function () {
                            return
                        })
                    }
                }
                else{
                    $.messager.alert("警告","请输入预约的时间","info",function () {
                        return
                    })
                }
            }
        })
    })
</script>