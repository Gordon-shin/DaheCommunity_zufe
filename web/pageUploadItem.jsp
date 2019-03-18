<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/18
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<link href="plugin/kindeditor/themes/simple/simple.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/kindeditor-all.js"></script>
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" charset="utf-8" src="js/Newdate.js"></script>
<script type="text/javascript" charset="utf-8" src="js/UploadItem.js"></script>

<div style="padding:10px 10px 10px 10px">
    <form id="itemAddForm" class="itemForm" method="post">
        <table cellpadding="5">
            <tr>
                <td>
                    <div style="float: right">
                        <img src=""  id="imgitem" style="width: 125px; height: 125px">
                        <div>上传商品图片:</div>
                        <input class="easyui-filebox" id="fileitem"  name="file3" data-options="prompt:'请选择'" style="width:100%">
                    </div>
                    <table>
                        <tr>
                            <td>商品类目:</td>
                            <td>
                                <input class="easyui-textbox" type="text" id="itemclass" data-options="validType:'length[1,30]'" />

                            <td>
                                <%--  <a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>
                                  <input type="hidden" name="cid" style="width: 280px;"></input>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>商品标题:</td>
                            <td><input class="easyui-textbox" type="text" id="itemtitle" data-options="required:true" style="width: 280px;"></input></td>
                        </tr>
                        <tr>
                            <td>商品价格:</td>
                            <td><input class="easyui-numberbox" type="text" id="priceView" data-options="min:1,max:99999999,precision:2,required:true" />
                                <input type="hidden" name="price"/>
                            </td>
                        </tr>
                        <tr>
                            <td>库存数量:</td>
                            <td><input class="easyui-numberbox" type="text" id="num" data-options="min:1,max:99999999,precision:0,required:true" /></td>
                        </tr>
                        <tr>
                            <td>序列号:</td>
                            <td>
                                <input class="easyui-textbox" type="text" id="barcode" data-options="validType:'length[1,30]'" />
                            </td>
                        </tr>
                        <tr>
                            <td>商品单位:</td>
                            <td>
                                <input class="easyui-textbox" type="text" id="barunit" data-options="validType:'length[1,30]'" />
                            </td>
                        </tr>
                        <tr>
                            <td>商品单位:</td>
                            <td>
                                <input class="easyui-textbox" type="text" id="phone" data-options="validType:'length[1,30]'" />
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
                    <textarea  id="desc123" style="width:800px;height:300px;visibility: hidden" ></textarea>
                </td>
            </tr>
        </table>
        <input type="hidden" name="itemParams"/>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" id="submitMonoInfo" >提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" >重置</a>
    </div>
</div>