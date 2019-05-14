function chaxunChart() {
    $.ajax({
        type: "POST",
        url: "ShopServlet",
        data: {data: sessionid, method: "querygwc"},
        success: function (result) {
            var result=JSON.parse(result)
            var title=result.title;
            if (result.toString()!="")
            {
                title.splice(0, 0, {field: 'ck', title: '选择', checkbox: true});
                $('#gwcManagerTable').datagrid({
                    columns: [eval(title)]
                });
                $('#gwcManagerTable').datagrid('loadData', result.rows);

            }
            else {
                $('#gwcManagerTable').datagrid('loadData', []);
            }

        }
    })
}
var gwcitemid=[];//记录选择的商品
var dingdan
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
    chaxunChart();
    $("#wizard").scrollable({
        onSeek:function (event,i) {
            $("#status li").removeClass("active").eq(i).addClass("active");
        }
    });
    $('#gwcManagerTable').datagrid({
        onCheck:function (index,row) {
            singlejiage=parseFloat(row.总价);
            zongjia=FloatAdd(singlejiage,zongjia)
            gwcitemid.push({id:row.物品编号,itemname:row.物品名称,key:row.物品编号,xiaoji:row.总价,number:row.物品数量})
            zongjiage();
        },
        onUncheck:function(index,row){
            singlejiage=parseFloat(row.总价);
            console.log(singlejiage);
            zongjia=FloatSub(zongjia,singlejiage);
            gwcitemid = JSONArrayDelete(row.物品编号,gwcitemid)
            console.log(gwcitemid)

            zongjiage();
        },
        onCheckAll:function (rows) {
            var array = new Array();
            array = rows;
            zongjia=0;
            gwcitemid = [];
            for (let i=0;i<array.length;i++)
            {
                gwcitemid.push({id:array[i].物品编号,key:array[i].物品编号})
                    zongjia= FloatAdd(parseFloat(array[i].总价),zongjia);
            }
            console.log(gwcitemid)

           zongjiage();
        },
        onUncheckAll(rows){
            zongjia=0.00;
            gwcitemid=[];
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
    $('#cgwcsc').linkbutton({
        onClick:function () {
            $.messager.confirm('删除确认','请问您是否要删除相关物品',function (r){
                if (r==true) {
                    if (gwcitemid.length!=0)
                    {$.ajax({
                        type: "POST",
                        url:"ShopServlet",
                        data:{data:JSON.stringify(gwcitemid),userid:sessionid,method:"deletewgc"},
                        success:function (result) {
                            if (result=="true")
                            {
                                $.messager.alert('删除成功','删除成功',"info");
                                chaxunChart();
                            }
                            else{
                                $.messager.alert('删除失败',result,"error");
                            }
                        }
                    })}
                    else {
                        $.messager.alert('错误','请选择要移除的物品',"error");
                    }
                }
                else{
                }
            })
        }
    })
    function JSONArrayDelete(id,array) {
        var newArr = new Array();
        for (let i = 0 ; i < array.length;i++){
            let j = array[i];
            if (j.id!=id)
            {
                newArr.push(j);
            }
        }
        return newArr;
    }

    $('#sub').click(function () {
        $.messager.confirm('确认','确认付款',function (r){
            if (r==true) {
                var wupingdata = {itemdetail:gwcitemid,zongjia:zongjia,goumairen:sessionid,invoicedate:getNowFormatDate()}
                $.ajax({
                    type: "POST",
                    url: "ShopServlet",
                    data: {data: JSON.stringify(wupingdata), method: "querenfukuan"},
                    success: function (result) {
                        if (result)
                        $.messager.alert('成功',null,"info")
                    }
                })
            }
        })
    })
    dingdan = new Vue({
        el:'#querendingdan',
        data:{
            zongjia:"",
            list: gwcitemid
        },
        methods:{
            zongjiage(){
                this.zongjia = zongjia
            },
            add(){
                this.list = gwcitemid
            },
            del(){
                this.list.some((item,i)=>{
                    this.list.splice(i,1)
                })
            }
        }
    })
    $('#zhifujiesuan').linkbutton({
        onClick:function () {
            if (gwcitemid.length===0){
                $.messager.alert('信息','请选择需要支付的商品',"error")
            }
            else{
                console.log(dingdan)
                $('#zhifujiesuanform').dialog({
                    onBeforeOpen:function(){
                        dingdan.add();
                        dingdan.zongjiage()
                        $('.dingdanquerenzongjia2').append(zongjia)
                    },
                    closed:false,
                    onBeforeClose:function () {
                        $('.dingdanquerenzongjia2').empty();
                    }
                })
            }
        },
    })
})

