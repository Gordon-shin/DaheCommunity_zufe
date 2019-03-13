<%@ page import="org.sc.dao.CommonDao" %>
<%@ page import="org.sc.dao.ShopDao" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="org.sc.dao.JSONDao" %>
<%@ page import="java.util.Map" %>
<%@ page import="net.sf.json.JSON" %>
<%@ page import="net.sf.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/3/11
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<%
    String itemid =  request.getParameter("itemid");
    if (itemid.equals(null))
    {

    }
    else{
        ShopDao shopDao = new ShopDao();
        String result = shopDao.getDetail(itemid);
        JSONArray jsonarray = JSONArray.fromObject(result);
        JSONObject jsonobj = jsonarray.getJSONObject(0);
        System.out.println(jsonobj.toString());
        JSONDao jsonDao = new JSONDao();
        Map<String,String> detail = jsonDao.toMap(jsonobj.toString());
        CommonDao.println(result);
        request.setAttribute("detail", detail);
    }


%>
<table class="dv-table" border="0" style="width:100%;" border rules=none cellspacing=0 align=center>
    <tr>
        <td rowspan="3" style="width:100px;height: 100px">
            <img src="${detail.imgurl}" style="width: 100px;height: 100px">
        </td>
        <td class="dv-label">物品编号: </td>
        <td>${param.itemid}</td>
        <td class="dv-label">物品名称:</td>
        <td>${detail.ItemName}</td>
        <td class="dv-label">物品分类:</td>
        <td>${detail.itemclass}</td>
        <td class="dv-label">物品价格:</td>
        <td>${detail.ItemPrice}</td>
        <td class="dv-label">上架日期:</td>
        <td>${detail.AddTime}</td>
    </tr>
    <tr>
        <td class="dv-label">供货人ID: </td>
        <td>${detail.offerUserId}</td>
        <td class="dv-label">供货人姓名:</td>
        <td>${param.offername}</td>
        <td class="dv-label">商品序列号:</td>
        <td>${detail.ItemSerialNo}</td>
        <td class="dv-label">库存:</td>
        <td>${detail.ItemStock}</td>
        <td class="dv-label">状态:</td>
        <td>${detail.state}</td>
    </tr>
    <tr>
        <td class="dv-label">描述 : </td>
        <td colspan="9">${detail.description}</td>
    </tr>
</table>
