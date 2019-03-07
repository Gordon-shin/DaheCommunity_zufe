$(function () {
    $('#orderManagerTable').datagrid({
        toolbar:$('#toolbarpom'),
        //  url:"data/data.json",
        title:"维修预约",
        //striped:true,
        rownumbers:true,
        pagination:true,
        //fit:true,
       // remoteSort:false,
       // fitColumns:true,
        resizable:true,
        loadMsg:true,
        singleSelect: true,
        checkOnSelect : true,
        selectOnCheck:true,
        autoRowHeight:false,
        resizeHandle:'right'
    })

    $.ajax({
        type: "POST",
        dataType: 'JSON',
        url:"OrderQueryServlet",
        data:{userid:sessionid},
        success:function (result) {
            console.log(result.rows)
            console.log(result.title)

            $('#orderManagerTable').datagrid({
                columns: [eval(result.title)],
            })

            $('#orderManagerTable').datagrid('loadData',result.rows);



        }
    })
})