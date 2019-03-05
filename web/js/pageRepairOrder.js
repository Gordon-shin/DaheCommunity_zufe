$(function () {
    var duty;
    var datetime;
    $('#orderTable').datagrid({
        toolbar:$('#toolbarOrder'),
        columns:[[
            {field:'Id',title:'员工编码',width:50},
            {field:'StaffName',title:'维修人员姓名',width:100},
            {field:'Duties',title:'从事工种',width:100},
            {field:'Email',title:'电子邮箱',width:100},
            {field:'Phone',title:'电话',width:100},
            {field:'Company',title:'所属物业公司',width:100},
        ]],
      //  url:"data/data.json",
        title:"维修预约",
        striped:true,
        rownumbers:true,
        pagination:true,
        fit:true,
        remoteSort:false,
        fitColumns:true
    })
    $('#chooseType').combobox({
        editable:false,
        url:"RepairManServlet",
        valueField: 'duties',
        textField: 'duties',

    })
    $('#riqi').datetimebox({


    })
    $('#orderSearch').linkbutton({
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
                        $('#orderTable').datagrid('loadData',result.rows)
                    }
                })
            }
        }
    })

})