$(function () {
    $('#itemSearch').datagrid({
        toolbar:$('#toolbarItemSearch'),
        title:"商品搜索",
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
    $('#wupinsousuo').searchbox({
        prompt:'请输入您希望购买的物品',
        searcher:function (value) {
            $.ajax({
                type: "POST",
                dataType: 'JSON',
                url: "ShopServlet",
                data: {data: value, method: "query"},
                success: function (result) {
                    $.messager.progress('close');
                    if (result.total == 0) {
                        $.messager.alert('信息', '没有相关信息', "error", function () {
                            $('#itemSearch').datagrid('loadData');
                        })
                    }
                    else if (result.length==0) {
                        $.messager.alert('信息', '没有相关信息', "error", function () {
                            $('#itemSearch').datagrid('loadData');
                        })
                    }
                     else {
                        console.log(result)
                        $('#itemSearch').datagrid({
                            columns: [eval(result.title)],
                        })
                        $.messager.alert('信息', '查到' + result.total + '条信息', "info")

                        $('#itemSearch').datagrid({
                            view:detailview,
                            detailFormatter:function (index,row) {
                                return '<div id="ddv-' + index + '" style="padding:5px 0"></div>';
                            },
                            onExpandRow: function(index,row){
                                console.log(row)
                                $('#ddv-'+index).panel({
                                    border:false,
                                    cache:false,
                                    href:'pageSearchDetail.jsp?itemid='+row.物品ID,
                                    onLoad:function(){
                                        $('#itemSearch').datagrid('fixDetailRowHeight',index);
                                    }
                                });
                                $('#itemSearch').datagrid('fixDetailRowHeight',index);
                            }
                        })
                        $('#itemSearch').datagrid('loadData', result.rows);
                    }
                }
            })
        }
    })
})