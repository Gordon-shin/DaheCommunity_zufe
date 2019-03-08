$(function () {
    var rows ;
    var userid;
    var repairmanid;
    var orderid;
    $('#orderManagerTable').datagrid({
        toolbar:$('#toolbarpom'),
        //  url:"data/data.json",
        title:"维修预约",
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
        onCheck:function (index,rowdata) {
            userid=rowdata.用户编号;
            repairmanid=rowdata.维修人员编号;
            orderid=rowdata.预约编号;
            console.log(userid);
            console.log(repairmanid);
        },
    })
    dataload();
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



    $('#Cancelyuyue').linkbutton({
        onClick:function () {
            if (userid==null&&repairmanid==null)
            {
                $.messager.alert('信息','无法取消预约，请选择相应的预约',"error")
            }
            else{
                var data = {userid:userid,repairmanid:repairmanid,orderid:orderid}
                console.log(data);
                $.messager.confirm('取消预约确认','请问您是否要取消确认预约',function (r) {
                    if (r==true) {
                        $.ajax({
                            type: "POST",
                            url:"OrderManagerServlet",
                            data:{data:JSON.stringify(data),method:"cancel"},
                            success:function (result) {
                                if (result=="true") {
                                    $.messager.alert('信息','取消预约成功',"info",function () {
                                        setTimeout(function () {
                                            dataload();
                                        },500);
                                    });
                                }
                                else {
                                    $.messager.alert('信息','取消预约失败，'+result,"error",function () {
                                        setTimeout(function () {
                                            dataload();
                                        },500);
                                    })
                                }

                            }
                        })
                    }
                })
            }
        }
    })

})





