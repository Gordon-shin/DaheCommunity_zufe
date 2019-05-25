$(function () {
    var duty;
    var datetime;
    var rows ;
    console.log(sessionname);
    console.log(sessionid);

    $('#orderTable').datagrid({
        toolbar:$('#toolbarOrder'),
        columns:[[
            {field:'ck',title:'选择',checkbox:true},
            {field:'Id',title:'员工编码',width:50},
            {field:'StaffName',title:'维修人员姓名',width:100},
            {field:'Duties',title:'从事工种',width:100},
            {field:'Email',title:'电子邮箱',width:100},
            {field:'Phone',title:'电话',width:100},
            {field:'Company',title:'所属物业公司',width:100},
            {field:'AVGReview',title:'用户评价',width:100,formatter:function(value,row,index){
                    return  '<span style="color:red">'+value+'</span>';
                }}
        ]],
      //  url:"data/data.json",
        title:"维修预约",
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
            console.log(rows);
        },
    })

    $('#yuyue').linkbutton({
        onClick:function () {
            if (rows==null)
            {
                $.messager.alert('信息','请选择相应的维修人员',"info")
            }
            else{
                var chooseTime;
                chooseTime=$('#riqi').datetimebox("getValue");
                var data = {userid:sessionid,repairmanid:rows,chooseTime:chooseTime}
                console.log(data);
                $.messager.confirm('预约确认','请问您是否要确认预约',function (r) {
                if (r==true) {
                   $.ajax({
                       type: "POST",
                       url:"RepairOrderServlet",
                        data:{data:JSON.stringify(data)},
                       success:function () {
                           $.messager.alert('信息','预约成功，请在预约管理中查看信息',"info",function () {
                               setTimeout(function () {
                                   loaddata();
                               },500);
                           });
                           duty=($('#chooseType').combobox("getValue"));
                           datetime=($('#riqi').datetimebox("getValue"));
                           function loaddata() {
                               $.ajax({
                                   type: "POST",
                                   dataType: 'JSON',
                                   url: "RepairManInfoServlet",
                                   data: {duty: duty, datetime: datetime},
                                   success: function (result) {
                                       //alert(result.total)
                                       $.messager.progress('close');
                                       if (result.total == 0) {
                                           $.messager.alert('信息', '没有相关信息', "error", function () {
                                               $('#orderTable').datagrid('loadData', result.rows);
                                           })
                                       } else {
                                           $.messager.alert('信息', '查到' + result.total + '条信息', "info")
                                           $('#orderTable').datagrid('loadData', result.rows);
                                       }
                                   }
                               })
                           }

                       }
                   })
                }
            })
        }
        }
    })
    $('#chooseType').combobox({
        editable:false,
        url:"RepairManServlet",
        valueField: 'duties',
        textField: 'duties',
    })
    $('#riqi').datetimebox({
        editable: false
    })
    $('#orderSearch').linkbutton({
        beforeSend: function(){
            $.messager.progress({
                text:'正在查询中',
            });
        },
        onClick: function () {
            if((($('#chooseType').combobox("getValue"))=="")&&($('#riqi').datetimebox("getValue")=="")){
                $.messager.alert('信息','请填写相关信息',"info");
            }
            else if(($('#chooseType').combobox("getValue"))==""){
                $.messager.alert('信息','请选择所需工种',"info");
            }
            else if ($('#riqi').datetimebox("getValue")=="") {
                $.messager.alert('信息','请选择所要预约的时间',"info");
            }
            else{
                duty=($('#chooseType').combobox("getValue"));
                datetime=($('#riqi').datetimebox("getValue"));
                $.ajax({
                    type: "POST",
                    dataType: 'JSON',
                    url:"RepairManInfoServlet",
                    data:{duty:duty,datetime:datetime},
                    success:function (result) {
                        //alert(result.total)
                        $.messager.progress('close');
                        if(result.total==0)
                        {
                            $.messager.alert('信息','没有相关信息',"error")
                        }
                        else{
                            $.messager.alert('信息','查到'+result.total+'条信息',"info")
                            $('#orderTable').datagrid('loadData',result.rows);
                        }
                    }
                })
            }
        }
    })

})