$(function () {
    $('#orderManagerTable').datagrid({
        toolbar:$('#toolbarpom'),
        columns:[[
            {field:'ck',title:'选择',checkbox:true},
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
        fitColumns:true,
        loadMsg:true,
        singleSelect: true,
        checkOnSelect : true,
        selectOnCheck:true,
    })
})