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
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">编辑</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true">打印</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true">导入</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导出</a>
    </div>
</div>



<!-- 弹出框 -->
<div class="easyui-dialog" title="添加进购物车" iconCls="icon-save" modal="true"
     closed="true" buttons="#dlg-btns" id="addPurchase" style="width: 400px;height: 400px">
    <div style="text-align: center">请选择加入购物车的数量</div>
  <div style="height: 160px;margin: 40px 0px">
   <div style="margin: 0px 0px 0px 40px;float: left"><img src="" id="gouwuyulan" style="width: 100px; height: 100px;"></div>
     <div style="margin: 0px 0px 0px 30px;width: 180px; height: 20px;display:inline-block">
         <div style="margin: 0px 30px;width: 100px; height: 20px;">商品名称:</div>
         <div style="margin: 0px 30px;padding-top:20px;width: 100px; height: 20px">商品编码:</div>
         <div style="margin: 0px 30px;padding-top:20px;width: 100px; height: 20px">
             <%-- <div class="easyui-slider" data-options="min:10,max:50,step:10" style="width:40px"></div>--%>
             <label>数量:</label>  <input id="weitiao" value="1" style="width:80px;">
         </div>
     </div>
    </div>
</div>

<div class="easyui-dialog" title="添加进购物车" iconCls="icon-save" modal="true" closed="false" id="ChatSeller" style="width: 450px;height: 600px">
    <div>
    </div>
</div>

<div id="dlg-btns">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" id="gouwuchesaveBtn">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancelBtn">取消</a>
</div>></div>
</div>