<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/11
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js/pageSearch.js"></script>
<script type="text/javascript" src="js/datagrid-detailview.js"></script>
<script type="text/javascript" src="js/Newdate.js"></script>
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/kindeditor-all.js"></script>

<script>
    function chatNoAnime(element,imgSrc,Content) {
        var $user=element;
        var $imgHead=imgSrc;
        var $content=Content;
        var $box=$('.bubbleDiv');
        var $boxHeght=$box.height();
        var $sectionHeght=$(".chat-box").height();
        var $elvHeght=Math.abs($boxHeght - $sectionHeght);
        if ($user === "leftBubble") {
            $box.append(createdoct($imgHead, $content));
          //  console.log($box.height())
        } else if ($user === "rightBubble") {
            $box.append(createuser($content));
        } else {
            console.log("出错了!")
        }
    }
    function createdoct($doctextContent) {
        var $textContent = $doctextContent;
        /*var $imgSrc = imgSrc;*/
        var block;
        if($textContent == ''|| $textContent == 'null'){
            return;
        }
        block= '<div class="bubbleItem">' +
            /* '<div class="doctor-head">' +
             '<img src="'+ imgSrc +'" alt="doctor"/>' +
             '</div>' +*/
            '<span class="bubble leftBubble">' + $textContent + '<span class="topLevel"></span></span>' +
            '</div>';
        return block;
    }
    function createuser($textContent ) {
        var $textContent = $textContent;
        var block;
        if($textContent == ''|| $textContent == 'null'){
            return;
        }
        block = '<div class="bubbleItem clearfix">' +
            '<span class="bubble rightBubble">' + $textContent + '<span class="topLevel"></span></span>' +
            '</div>';
        return block;
    };

    function chat (element,imgSrc,Content){
        var $user = element;
        var $imgHead = imgSrc;
        var $content = Content;
        var $box = $('.bubbleDiv');
        var $boxHeght = $box.height();
        var $sectionHeght = $(".chat-box").height();
        var $elvHeght = Math.abs($boxHeght-$sectionHeght);
        if ($user === "leftBubble") {
            $box.append(createdoct($imgHead,$content)).animate({scrollTop:$('.bubbleDiv')[0].scrollHeight }, 150);
            console.log($box.height())
        }
        else if ($user ==="rightBubble") {
            $box.append(createuser($content)).animate({scrollTop:$('.bubbleDiv')[0].scrollHeight }, 150);
        }
        else{
            console.log("出错了!")
        }
    }
    $(function () {
      /*  $('.send-btn').click(function () {
            let text = liaotianeditor.text()
            let user = "rightBubble";
            chat(user,"",text)
            data = {text:text,user:sessionid,time:getNowFormatDate(),dialogid:DiagId}
            addmessage(data);
            liaotianeditor.text("")
        })*/
        /*
        $('#ChatSeller').dialog({
            onOpen:function () {
                liaotianeditor=KindEditor.create('#liaotiankuang', {
                    allowPreviewEmoticons: false,
                    uploadJson: 'jspFunction/upload_json.jsp',
                    urlType: 'absolute',
                    width:"99%",
                    resizeType: 0,  //文本框不可拖动
                    items: [
                        /!* 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                         'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                         'insertunorderedlist', '|', 'emoticons', 'image', 'link']*!/
                        'emoticons', 'image']
                });
            }
        })
*/

    })


</script>
<style>
    .chat-bg{
        width: 435px;
    }
    .header-title{
        background: #6F83FF;
        height: 30px;
        width: 100%;
        text-align: center;
        margin: auto;
        font-size: 15px;
        color: #fff;
        z-index: 3;
    }
    .bubbleDiv {
        width: 435px;
        margin: 0 auto;
        overflow: auto;
        height: 94%;
        /*padding: 0 3%;*/
    }

    .chat-box {
        width: 435px;
        height: 370px;
        /*background-color: red;*/
        overflow-y: hidden;
        position: relative;
    }
    .send-btn{
        padding: 0.6rem 1rem;
        border: 0;
        background: red;
        color: #fff;
        min-width: 4rem;
        border-radius: 0.4rem;
        margin-left: 3%;
        position: absolute;
        left: 0.1rem;
        bottom: 0.5rem;
    }
    .bubble {
        line-height: 19px;
        border-radius: 0.8rem;
        margin-top: 1rem;
        display: inline-block;
        padding: 0.4rem 1rem;
        font-size: 11px;
        margin-left: 15rem;
    }
    .rightBubble {
        position: relative;
        margin-right: 0.6rem;
        float: right;
        background-color: #6F83FF;
        color: #fff;
    }
    #qkltk{
        position: absolute;
        left: 4.5rem;
        bottom: 0.5rem;
        background: #6F83FF;
    }
    .rightBubble .topLevel {
        position: absolute;
        top: 1rem;
        right: -8px;
        border-bottom: 10px solid #6F83FF;
        border-right: 10px solid transparent;
    }
    .doctor-head {
        width: 4rem;
        box-sizing: border-box;
        position: absolute;
        height: 4rem;
        top: 2rem;
    }
    .doctor-head img {
        width: 100%;
        border-radius: 50rem;
        box-sizing: border-box;
        border: 1px solid #e5e5e5;
        height: 100%;
    }
    .leftBubble .topLevel {
        position: absolute;
        top: 1rem;
        left: -9px;
        border-bottom: 10px solid #EFF6F9;
        border-left: 10px solid transparent;
    }
    .leftBubble {
        position: relative;
        background-color: #EFF6F9;
        margin-left: 1rem;
    }
</style>
<table id="itemSearch">


</table>
<div class="toolbar" id="toolbarItemSearch">
  <div style="background-color: white">
      <div class="search-div"  style="margin: auto; width: 300px" id="searchbarbar">
          <input  style="width: 300px;height:28px " id="wupinsousuo" >
      </div>
  </div>
    <div class="ctrl-div">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addgouwuche">加入购物车</a>
       <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>--%>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="contactSeller">联系卖家</a>
    </div>
</div>



<!-- 弹出框 -->
<div class="easyui-dialog" title="添加进购物车" iconCls="icon-save" modal="true"
     closed="true" buttons="#dlg-btns" id="addPurchase" style="width: 400px;height: 400px">
    <div style="text-align: center">请选择加入购物车的数量</div>
  <div style="height: 160px;margin: 40px 0px">
   <div style="margin: 0px 0px 0px 40px;float: left"><img src="" id="gouwuyulan" style="width: 100px; height: 100px;"></div>
     <div style="margin: 0px 0px 0px 30px;width: 180px; height: 20px;display:inline-block">
         <div style="margin: 0px 30px;width: 180px; ">商品名称:<span id="shangpingmingcheng"></span></div>
         <div style="margin: 0px 30px;padding-top:20px;width: 180px; ">商品编码:<span id="shangpingbianma"></span></div>
         <div style="margin: 0px 30px;padding-top:20px;width: 180px;">
             <%-- <div class="easyui-slider" data-options="min:10,max:50,step:10" style="width:40px"></div>--%>
             <label>数量:</label>  <input id="weitiao" value="1" style="width:80px;">
         </div>
     </div>
    </div>
</div>

<%--<div class="easyui-dialog" title="与***聊天中" iconCls="icon-save" modal="true" closed="true" id="ChatSeller" style="width: 450px;height: 600px">
    <div class="chat-bg" >
        <div class="chat-box">
            <div class="bubbleDiv"></div>
        </div>
        <div class="chat-edit clearfix">
            <textarea id="liaotiankuang"></textarea>
            <button class="send-btn fr" >发送</button>
            <button class="send-btn fr" id="qkltk">清空</button>
        </div>
    </div>
</div>--%>
<div id="dlg-btns">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="gouwuchesaveBtn">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancelBtn">取消</a>
</div>
</div>
</div>