$(function () {
    var itemid
    var kucun
    var detail
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
        onSelect:function (index,rowdata) {
            itemid = rowdata.物品ID;
            kucun = rowdata.库存;
        },
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
                                    href:'pageSearchDetail.jsp?itemid='+row.物品ID+"&offername="+row.供货人姓名,
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
    $('#addgouwuche').linkbutton({
        onClick:function () {
            if (itemid==null){

            }
            else{
                $.ajax({
                    type: "POST",
                    dataType: 'JSON',
                    url: "ShopServlet",
                    data: {itemid: itemid,method:"queryiteminfo"},
                    success:function (result) {
                        detail = result;
                        $('#gouwuyulan').attr('src',detail.imgurl)
                        $('#weitiao').numberspinner({
                            min: 1,
                            max: 100,
                            editable: true
                        });
                    }
                })

                $('#addPurchase').dialog({
                    closed:false
                })
            }

        }
    })
    $('#cancelBtn').linkbutton({
        onClick:function () {

            $('#addPurchase').dialog({
                closed:true
            })
            $('#gouwuyulan').attr('src',"")
            itemid=null;
        }
    })
    $('#gouwuchesaveBtn').linkbutton({
        onClick:function () {
            var shuliang = $('#weitiao').numberspinner('getValue');
            var date = getNowFormatDate();
            var data = {userid:sessionid,itemid:detail.ItemId,number:shuliang,orderdate:date}
            if(shuliang>detail.ItemStock){
                $.messager.alert('信息', '所选数量大于库存请重新输入库存', "error", function () {
                })
            }
            else {
                $.messager.confirm('信息','请问您是否要将该商品加入购物车',function (r) {
                    if (r==true) {
                        let judge = false;
                        $.ajax({
                            type: "POST",
                            url:"ShopServlet",
                            data:{itemid:itemid,userid:sessionid,method:"panduangouwuche"},
                            success:function (result) {
                                if (result=="yes")
                                {
                                    $.ajax({
                                        type: "POST",
                                        url:"ShopServlet",
                                        data:{data:JSON.stringify(data),method:"addgouwuche"},
                                        success:function (result) {
                                            $.messager.alert('信息','加入购物车成功',"info");
                                        }
                                    })
                                }
                                else{
                                    $.messager.alert('信息','该商品已经存在于购物车中请去购物车中修改信息',"error");
                                }
                            }
                        })

                    }
                })

            }
        }
    })
})

