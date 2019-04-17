<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/13
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js/FloatSiZe.js"></script>
<script type="text/javascript" src="js/scrollable.js"></script>
<style type="text/css">#wizard {border:5px solid #789;font-size:12px;height:400px;margin: auto;
    width:65%px;overflow:hidden;position:relative;}
#wizard .items{width:20000px; clear:both; position:absolute;}
#wizard .right{float:right;}
#wizard #status{height:35px;background:#123;padding-left:25px !important;}
#status li{float:left;color:#fff;padding:10px 30px;}
#status li.active{background-color:#369;font-weight:normal;}
.input{width:240px; height:18px; margin:10px auto; line-height:20px;
    border:1px solid #d3d3d3; padding:2px}
.page{padding:20px 30px;width:1000px;float:left;}
.page h3{height:42px; font-size:16px; border-bottom:1px dotted #ccc; margin-bottom:20px;
    padding-bottom:5px}
.page h3 em{font-size:12px; font-weight:500; font-style:normal}
.page p{line-height:24px;}
.page p label{font-size:14px; display:block;}
.btn_nav{height:36px; line-height:36px; margin:20px auto;}
.prev,.next{width:100px; height:32px; line-height:32px; background:url(btn_bg.gif)
repeat-x bottom; border:1px solid #d3d3d3; cursor:pointer}
</style>
<script type="text/javascript" src="js/pagePurchase.js"></script>
<div class="easyui-layout" data-options="fit:true" id="tb">
    <div data-options="region:'south'" style="padding:5px;height:70px">
        <!-------------------------------搜索框----------------------------------->
        <fieldset>
            <legend align="right">价格统计</legend>
            <form id="ffSearch" >
                <div id="toolbar">
                   <span  id="zong" style="float: right;color: #ff003a">总价为￥0.00</span>
                </div>
            </form>
        </fieldset>
    </div>
    <div data-options="region:'center'">
        <!-------------------------------详细信息展示表格----------------------------------->
        <table id="gwcManagerTable" title="用户操作" data-options="iconCls:'icon-view'" fit="true"></table>
    </div>
</div>

<div class="toolbar" id="toolbargouwuche">

    <div class="ctrl-div">
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="cgwcsc">从购物车删除</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="bianjigouwuche">编辑</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" id="zhifujiesuan">支付结算</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" id="qingkonggouwuche">清空购物车</a>
    </div>
</div>


<div class="easyui-dialog" title="添加进购物车" iconCls="icon-save" modal="true"
     closed="true" buttons="#dlg-xiugaibtns" id="xiugaiPurchase" style="width: 400px;height: 400px">
    <div style="text-align: center">请选择加入购物车的数量</div>
    <div style="height: 160px;margin: 40px 0px">

        <div style="margin: 0px 0px 0px 40px;float: left; "><img src="" id="gouwuchexiugaiyulan" style="width: 100px; height: 100px;"></div>
        <div style="margin: 0px 0px 0px 30px;width: 180px; height: 20px;display: inline-block">
            <div style="margin: 0px 30px; height: 20px;">商品名称:</div>
            <div  style="margin: 0px 30px;"><span id="gwcxgmc"></span></div>
            <div  style="margin: 0px 30px; height: 20px;">商品编码:<span id="gwcserial"></span></div>
            <div style="margin: 0px 30px;width: 100px; height: 20px;">
                <label>数量:</label>  <input id="xiugaiweitiao" value="1" style="width:80px;">
            </div>
        </div>

    </div>
</div>
<div id="dlg-xiugaibtns">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="gouwuchexiugaiBtn">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancelgwcxiugaiBtn">取消</a>
</div>


<div class="easyui-dialog" title="费用结算" iconCls="icon-save" modal="true"
     closed="true" id="zhifujiesuanform" style="width: 1100px;height: 480px">
    <form action="#" method="post" style="margin: auto">
        <div id="wizard">
            <ul id="status">
                <li class="active"><strong>1.</strong>创建账户</li>
                <li><strong>2.</strong>填写联系信息</li>
                <li><strong>3.</strong>完成</li>
            </ul>

            <div class="items">
                <div class="page">

                    -----任意html内容-----
                    <div class="btn_nav">
                        <input type="button" class="next right" value="下一步»" />
                    </div>
                </div>
                <div class="page">
                    -----任意html内容-----
                    <div class="btn_nav">
                        <input type="button" class="prev" style="float:left" value="«上一步" />
                        <input type="button" class="next right" value="下一步»" />
                    </div>
                </div>
                <div class="page">
                    -----任意html内容-----
                    <div class="btn_nav">
                        <input type="button" class="prev" style="float:left" value="«上一步" />
                        <input type="button" class="next right" id="sub" value="确定" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    </div>
</div>
<div id="dlg-gouwuchejiesuan">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="Wcccwwwww">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="12321321">取消</a>
</div>
