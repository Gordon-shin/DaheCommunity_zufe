<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/13
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js/FloatSiZe.js"></script>

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
        <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" id="zhifu">取消预约</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="bianjigouwuche">编辑</a>
    </div>
</div>


<div class="easyui-dialog" title="添加进购物车" iconCls="icon-save" modal="true"
     closed="true" buttons="#dlg-xiugaibtns" id="xiugaiPurchase" style="width: 400px;height: 400px">
    <div style="text-align: center">请选择加入购物车的数量</div>
    <div style="height: 160px;margin: 40px 0px">
        <img src="" id="gouwuchexiugaiyulan" style="width: 100px; height: 100px;margin:40px;float: left">
        <div style="margin: 0px 30px;padding-top:20px;padding-left:20px;width: 100px; height: 20px;float: right">商品名称:<span id="gwcxgmc" ></span></div>
        <div  style="margin: 0px 30px;padding-top:20px;padding-left:20px;width: 100px; height: 20px;float: right">商品编码:<span id="gwcserial"></span></div>
        <div style="margin: 0px 30px;padding-top:20px;padding-left:20px;width: 100px; height: 20px;float: right">
            <label>数量:</label>  <input id="xiugaiweitiao" value="1" style="width:80px;">
        </div>
        <div>

        </div>
    </div>
</div>
<div id="dlg-xiugaibtns">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="gouwuchexiugaiBtn">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancelgwcxiugaiBtn">取消</a>
</div>
