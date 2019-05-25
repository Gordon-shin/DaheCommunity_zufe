<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/5/21
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/kindeditor-all.js"></script>
<table id="uploadItemManagerTable" style="width:100%;height:95%;">

</table>
<div class="easyui-dialog" title="修改二手商品信息" iconCls="icon-save" modal="true"
     closed="true"  id="itemModifyDaig" buttons='#dlg-itemModify 'style="width: 500px;height: 650px">
    <div style="text-align: center">请修改二手商品信息</div>
    <form style="margin: 20px 10px;" id="itemModifyForm" class="itemForm" method="post">
       <div>
           <table cellpadding="5">
               <tr>
                   <td>
                       <div style="float: right; margin: 0px 0px 0px 50px;">
                           <img src=""  id="imgitem1" style="width: 125px; height: 125px">
                           <div>上传商品图片:</div>
                           <input class="easyui-filebox" id="fileitem1"  name="file4" data-options="prompt:'请选择'" style="width:100%">
                       </div>
                       <table style="border-collapse:separate; border-spacing:0px 5px;">
                           <tr>
                               <td>商品标题:</td>
                               <td><input class="easyui-textbox" type="text" id="itemtitle1" data-options="required:true" style="width: 140px;"></input></td>
                           </tr>
                           <tr>
                               <td>商品价格:</td>
                               <td><input class="easyui-numberbox" type="text" id="priceView1" data-options="min:1,max:99999999,precision:2,required:true" />
                                   <input type="hidden" name="price"/>
                               </td>
                           </tr>
                           <tr>
                               <td>库存数量:</td>
                               <td><input class="easyui-numberbox" type="text" id="num1" data-options="min:1,max:99999999,precision:0,required:true" /></td>
                           </tr>
                           <tr>
                               <td>商品类目:</td>
                               <td>
                                   <input class="easyui-textbox" type="text" id="itemclass1" data-options="validType:'length[1,30]'" />

                               <td>
                                   <%--  <a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>
                                     <input type="hidden" name="cid" style="width: 280px;"></input>--%>
                               </td>
                           </tr>
                           <tr>
                               <td>序列号:</td>
                               <td>
                                   <input class="easyui-textbox" type="text" id="barcode1" data-options="validType:'length[1,30]'" />
                               </td>
                           </tr>
                           <tr>
                               <td>商品单位:</td>
                               <td>
                                   <input class="easyui-textbox" type="text" id="barunit1" data-options="validType:'length[1,30]'" />
                               </td>
                           </tr>
                           <tr>
                               <td>联系电话:</td>
                               <td>
                                   <input class="easyui-textbox" type="text" id="phone1" data-options="validType:'length[1,30]'" />
                               </td>
                           </tr>
                       </table>

                   </td>
               </tr>
               <tr>
                   <td>商品描述:</td>
               </tr>
               <tr>
                   <td>

                   </td>
               </tr>
           </table>
       </div>
        <div>
            <textarea  id="descmodify123" ></textarea>
        </div>
    </form>

</div>
<div class="toolbar" id="toolbarItemManager">
    <div class="ctrl-div">
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="addgouwuche">下架该商品</a>

        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="modifyItemInfo">修改商品信息</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="refreshshangpxx">刷新商品信息</a>
    </div>
</div>
<div id="dlg-itemModify">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="subitemModify">提交</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancelitemModify">取消</a>
</div>
<script>
    var itemModifydata
    var descmodify
    var reader

    function shopmodfyshangpxx() {
        $.ajax({
            type: "POST",
            async: false,
            url: "ShopServlet",
            data: {userid: sessionid, method: "UploadItemqueryBysellerid"},
            success: function (result) {

                if (result == "[]") {
                    $.messager.alert("信息", "没有找到相关信息", "info");
                } else {
                    result = JSON.parse(result)
                    $('#uploadItemManagerTable').datagrid({
                        columns: [result.title]
                    });
                    $('#uploadItemManagerTable').datagrid('loadData', result);
                    $('#uploadItemManagerTable').datagrid('selectRow', 0);
                }
            }
        })
    }

    $(function () {
        $('#fileitem1').filebox({
            onChange: function () {
                if ($('#fileitem1').filebox('getValue')!="") {
                reader=new FileReader();
                reader.readAsDataURL($("input[name='file4']")[0].files[0])
                reader.onload=function (result) {
                    document.getElementById("imgitem1").src=result.target.result;
                }
                }
            }
        })
        $('#uploadItemManagerTable').datagrid({
            toolbar:$('#toolbarItemManager'),
            title:"二手商品上架管理",
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
            onSelect:function (index,rowdata) {
                itemModifydata = rowdata
            },
        })
        shopmodfyshangpxx();
        $('#refreshshangpxx').linkbutton({
            onClick:function () {
                shopmodfyshangpxx();
            }
        })
        $('#modifyItemInfo').linkbutton({
            onClick:function () {
                $('#itemModifyDaig').dialog({
                    closed:false,
                    onBeforeOpen:function () {
                        descmodify=KindEditor.create('#descmodify123', {
                            allowPreviewEmoticons: false,
                            uploadJson: 'jspFunction/upload_json.jsp',
                            urlType: 'absolute',
                            height:"250px",
                            width:"98%",
                            resizeType: 0,  //文本框不可拖动
                            items: [
                                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                        })
                        descmodify.appendHtml(itemModifydata.description)
                        $('#itemtitle1').textbox('setValue',itemModifydata.
                            itemname)
                        $('#priceView1').textbox('setValue',itemModifydata.itemprice)
                        $('#num1').textbox('setValue',itemModifydata.
                            itemstock)
                        $('#itemclass1').textbox('setValue',itemModifydata.
                            itemclass)
                        $('#barcode1').textbox('setValue',itemModifydata.
                            itemserialno)
                        $('#barunit1').textbox('setValue',itemModifydata.
                            itemunit)
                        $('#phone1').textbox('setValue',itemModifydata.
                            phone)
                        document.getElementById("imgitem1").src=itemModifydata.imgurl;
                    },
                    onBeforeClose:function () {
                        descmodify.text('')
                        KindEditor.remove($('#descmodify123'))
                        document.getElementById("imgitem1").src=""
                        $('#fileitem1').filebox('setValue','')
                    }
                })
            }
        })
        $('#subitemModify').linkbutton({
            onClick:function () {
                let modifyitemdata = {}
                modifyitemdata["itemtitle1"] = $('#itemtitle1').textbox('getValue')
                 modifyitemdata["priceView1"] = $('#priceView1').textbox('getValue')
                 modifyitemdata["num1"] = $('#num1').textbox('getValue')
                 modifyitemdata["itemclass1"] = $('#itemclass1').textbox('getValue')
                 modifyitemdata["barcode1"] = $('#barcode1').textbox('getValue')
                 modifyitemdata["barunit1"] = $('#barunit1').textbox('getValue')
                 modifyitemdata["phone1"] = $('#phone1').textbox('getValue')
                 modifyitemdata["description"] =  descmodify.text();
                modifyitemdata["itemid"] = itemModifydata.itemid;
               // console.log(modifyitemdata)

                let formData1 = new FormData();
                let jsonobj =JSON.stringify(modifyitemdata)
                if ($(fileitem1).filebox('getValue')!=""){
                    formData1.append("File",$("input[name='file4']")[0].files[0]);
                }
                formData1.append("JSON",jsonobj)
                formData1.append('method',"modifyitemdata")

                $.ajax({
                    url:"ShopServlet",
                    type:'post',
                    data:formData1,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    cache: false,
                    processData: false,
                    contentType: false,
                    success:function (result) {
                        alert(result)
                    }
                },'json')
        }
        })
        $('#cancelitemModify').linkbutton({
            onClick:function () {
                $('#uploadItemManagerTable').datagrid({
                    closed: true
                })
            }
        })

    })
</script>