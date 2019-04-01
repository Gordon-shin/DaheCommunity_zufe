$(function () {
    var zongjia = 0;
    var singlejiage=0;
    $('.prev').linkbutton()
    $('.next right').linkbutton()
    $('#gwcManagerTable').datagrid({
        toolbar: $('#toolbargouwuche'),
        title:"购物车",
        striped: true,
        rownumbers: true,
        pagination: true,
        fit: true,
        remoteSort: false,
        fitColumns: true,
        resizable: true,
        loadMsg: true,
        singleSelect: false,
        checkOnSelect: true,
        selectOnCheck: true,
        autoRowHeight: false,
        resizeHandle: 'right',
        onLoadSuccess:function(){
        },
    })
    $('#xiugaiweitiao').numberspinner({

    })
    $.ajax({
        type: "POST",
        url:"ShopServlet",
        data:{data:sessionid,method:"querygwc"},
        success:function (result) {
            var result = JSON.parse(result)
            var title =result.title;
            title.splice(0, 0, {field: 'ck', title: '选择', checkbox: true});
            $('#gwcManagerTable').datagrid({
                columns: [eval(title)]
            });
            $('#gwcManagerTable').datagrid('loadData', result.rows);
        }
    })
    $("#wizard").scrollable({
        onSeek:function (event,i) {
            $("#status li").removeClass("active").eq(i).addClass("active");
        }
    });
    $('#zhifujiesuan').linkbutton({
        onClick:function () {
            $('#zhifujiesuanform').dialog({
                closed:false,
            })
            console.log($('#gwcManagerTable').datagrid('getChecked'))
            console.log(zongjia)
        }
    })
    $('#gwcManagerTable').datagrid({
        onCheck:function (index,row) {
            singlejiage=parseFloat(row.总价);
            zongjia=FloatAdd(singlejiage,zongjia)
            console.log(zongjia)
            zongjiage();
        },
        onUncheck:function(index,row){
            singlejiage=parseFloat(row.总价);
            console.log(singlejiage);
            zongjia=FloatSub(zongjia,singlejiage);
            console.log(zongjia)
            zongjiage();
        },
        onCheckAll:function (rows) {
            var array = new Array();
            array = rows;
            zongjia=0;
            for (i=0;i<array.length;i++)
            {
                zongjia= FloatAdd(parseFloat(array[i].总价),zongjia);
            }
           zongjiage();
        },
        onUncheckAll(rows){
            zongjia=0.00;
            zongjiage();
        }
    })
    function zongjiage() {
        $('#zong').empty();
        $('#zong').append("总价为￥");
        $('#zong').append(zongjia);
    }
    $('#bianjigouwuche').linkbutton({
        onClick:function () {
          var shuliang = new Array();
           shuliang  = $('#gwcManagerTable').datagrid('getChecked')

            if (shuliang.length==0) {
                $.messager.alert('信息','请选择需要修改的商品',"error")
            }
            else if(shuliang.length==1){
                let itemid = shuliang[0].物品编号
                let number = shuliang[0].物品数量
                $.ajax({
                    type: "POST",
                    url:"ShopServlet",
                    data:{itemid:itemid,method:"queryiteminfo"},
                    success:function (result) {
                       var result = JSON.parse(result)
                        $('#gouwuchexiugaiyulan').attr('src',"")
                        $('#gouwuchexiugaiyulan').attr('src',result.imgurl)
                        $('#gwcxgmc').empty();
                        $('#gwcxgmc').append(result.ItemName)
                        $('#gwcserial').empty();
                        $('#gwcserial').append(result.ItemSerialNo)
                        $('#xiugaiweitiao').numberspinner({
                            value:number,
                            max: 100,
                            editable: true,
                            onSpinUp:function () {
                                var v =  $('#xiugaiweitiao').numberspinner('getValue')
                                if (v>result.ItemStock)
                                {
                                    $.messager.alert('信息','请不要超过库存','info')
                                    $('#xiugaiweitiao').numberspinner({
                                        value:number
                                    })
                                }
                            }
                        })
                        console.log(result)
                    }
                })
             $('#xiugaiPurchase').dialog({
                 closed:false
             })
            }
            else{
                $.messager.alert('信息','请选择一个需要修改的商品',"error")
            }
        }
    })
    $('#cancelgwcxiugaiBtn').linkbutton({
        onClick:function () {
           $('#xiugaiPurchase').dialog({
               closed:true
           })
        }
    })

})

