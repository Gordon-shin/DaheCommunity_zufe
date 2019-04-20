var itemSellerid
var liaotianeditor
var DiagId
function queryDiagId(data){
    var result = null
    $.ajax({
        type: "POST",
        dataType: 'JSON',
        async:false,
        url: "MessageServlet",
        data: {data: JSON.stringify(data),method: "queryDiagId"},
        success:function (e) {
            console.log(e)
            result = e[0].Id;
        }
    })
    return result
}
function queryMessageById(data){
    var result = null
    $.ajax({
        type: "POST",
        dataType: 'JSON',
        async:false,
        url: "MessageServlet",
        data: {digid: data,method: "queryMessageById"},
        success:function (e) {
            result =e
        }
    })
    return result
}


$(function () {
    var itemid
    var kucun
    var detail
    $('#wupinsousuo').searchbox({
        prompt:'请输入您希望购买的物品',
        searcher:function (value) {
            $.ajax({
                type: "POST",
                dataType: 'JSON',
                url: "ShopServlet",
                data: {data: value, method: "query"},
                success: function (result) {
                    var title =[]
                    title = result.title
                    title[0]["width"] = 30
                    title[1]["width"] = 150
                    title[1]["formatter"] =function(value,row,index){
                        return  '<span style="color:navy">'+value+'</span>';
                    }
                    title[3]["formatter"]=function(value,row,index){
                        return  '<span style="color:red">'+value+'</span>';
                    }
                    console.log(title)
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



                        $('#itemSearch').datagrid({
                            columns: [title],
                        })
                        var columns = $('#itemSearch').datagrid("options").columns;
                        console.log(columns)
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
            itemSellerid = rowdata.供货人ID;
            var data = {userid:sessionid,seller:itemSellerid}
             DiagId = queryDiagId(data);
        },
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
            $.ajax({
                type: "POST",
                dataType: 'JSON',
                url: "ShopServlet",
                data: {itemid: itemid,method:"queryiteminfo"},
                success:function (result) {
                    detail = result;
                    console.log(detail)
                }
            })
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
                                            $.messager.alert('信息','加入购物车成功',"info",function () {
                                                $('#addPurchase').dialog({
                                                    closed:true
                                                })
                                            });

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

    $('#contactSeller').linkbutton({
        onClick:function () {
            liaotianeditor=KindEditor.create('#liaotiankuang', {
                allowPreviewEmoticons: false,
                uploadJson: 'jspFunction/upload_json.jsp',
                urlType: 'absolute',
                width:"99%",
                resizeType: 0,  //文本框不可拖动
                items: [
                    /* 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link']*/
                    'emoticons', 'image']
            });
            if (itemSellerid===undefined) {
                $.messager.alert('信息','请选择需要联系的卖家',"error");
            }
            else if (itemSellerid==sessionid) {
                $.messager.alert('信息','请不要选择自己的商品',"error");
            }
            else{
                var message =new Array();
                message  =queryMessageById(DiagId)
                console.log(message)
                for (let i = 0; i < message.length;i++ ) 
                {
                    if (message[i].MessageUser.toString()==sessionid)
                    {
                        chatNoAnime("rightBubble","",message[i].MessageText)
                    }
                    else {
                        chatNoAnime("leftBubble",message[i].MessageText)
                    }
                }
                $('#ChatSeller').dialog({
                    closed:false,
                    onOpen:function () {

                    },
                    onBeforeClose:function () {
                        liaotianeditor.text("")
                        KindEditor.remove($('#liaotiankuang'))
                        $('.bubbleItem').remove()
                    }
                })
            }
            /*{

                var data = {seller:itemSellerid,userid:sessionid}
                $.ajax({
                    type: "POST",
                    dataType: 'JSON',
                    url: "MessageServlet",
                    data: {data: JSON.stringify(data),method: "queryMessageExist"},
                    success: function (result) {
                        if ("true"===result.toString()){
                           data={seller:itemSellerid,userid:sessionid}
                            queryDiagId(data);

                        }
                       else{
                           data = {seller:itemSellerid,userid:sessionid,time:getNowFormatDate()}
                           $.ajax({
                               type: "POST",
                               dataType: 'JSON',
                               url: "MessageServlet",
                               data: {data: JSON.stringify(data),method: "insertDiag"},
                               success: function (result){
                                   data={seller:itemSellerid,userid:sessionid}
                                   queryDiagId(data);
                               }
                           })
                       }
                    }
                })
                $('#ChatSeller').dialog({
                    closed:false,
                    onOpen:function () {

                    },
                    onBeforeClose:function () {
                        liaotianeditor.text("")
                        KindEditor.remove($('#liaotiankuang'))
                        $('.bubbleItem').remove()
                    }
                })


            }*/

        }
    })
    $('.send-btn').click(function () {

        let text = liaotianeditor.text()
        let user = "rightBubble";
        chat(user,"",text)

    })
})

