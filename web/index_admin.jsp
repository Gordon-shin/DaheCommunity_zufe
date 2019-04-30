<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/4/16
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="./css/bootstrap.css">


    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <title>大河小区便民服务管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <%--	<script type="text/javascript" src="./css/semantic.min.js"></script>--%>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript"  charset="UTF-8" src="js/index_admin.js"></script>
    <script type="text/javascript"  charset="UTF-8" src="js/base64.js"></script>
    <link rel="stylesheet" type="text/css" href="css/semantic.css" />
    <script src="js/vue.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script>
        var sessionname= Base64.decode($.cookie('PersonName'));
        var sessionid = Base64.decode($.cookie('username'))
        
    </script>
</head>
<body class="easyui-layout" id="layout" style="visibility:hidden;">

<div region="north" id="header">
    <img src="img/banner.png" class="logo" />
    <div class="top-btns">
        <span id="welcomeSpan">欢迎您，</span>
      <%--  <a href="#" class="easyui-linkbutton"  id="changePassword"data-options="plain:true,iconCls:'icon-lock'">修改密码</a>--%>
        <a href="LogoutServlet" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" id="logoutjs">退出系统</a>
    </div>
</div>

<script>
    $(function () {
        $('#AdminnavRepair').tree({
            animate:true,
            lines:true,
            url:'NavServlet',
            queryParams:{tabid:"9"},
            onLoadSuccess : function (node, data) {
                var _this = this;
                if (data) {
                    $(data).each(function (index, value) {
                        if (this.state == 'closed') {
                            $(_this).tree('expandAll');
                        }
                    });
                }
            },
            onClick : function (node) {
                var host= window.location.href;

                if (node.url) {
                    var tab = $('#tt').tabs('getSelected');
                    console.log(tab);
                    if ($('#tt').tabs('exists', node.text)) {
                        $('#tt').tabs('select', node.text)
                        var tab = $('#tt').tabs('getSelected');  // 获取选择的面板
                        tab.panel('refresh');
                    } else {
                        $('#tt').tabs('add', {
                            title: node.text,
                            closable: true,
                            iconCls: node.iconCls,
                            href: node.url,
                        });
                    }
                }
            }
        })

    })
</script>
<div region="west" split="true" title="菜单" id="naver" iconCls="icon-world">
    <div class="easyui-accordion" fit="true" id="navmenu">
        <div title="用户信息管理">
            <ul id="nav">
            </ul>
        </div>
        <div title="管理员维修报障管理">
            <ul  id="AdminnavRepair">
            </ul>
        </div>
        <div title="管理员二手市场管理" >
            <ul id="navShop">
            </ul>
        </div>
        <div title="管理员医院预约管理" >
            <ul class="navmenu" id="navFee">
            </ul>
        </div>
    </div>
</div>

<div region="center" id="content">
    <div class="easyui-tabs" fit="true" id="tt">



    </div>
</div>

<div region="south" id="footer">&copy;大河小区便民服务管理系统 V1.0</div>


<!-- 弹出框 -->
<div class="easyui-dialog" title="新增/编辑" iconCls="icon-save" modal="true"
     closed="true" buttons="#dlg-btns" id="dlg">
    <form id="fm" method="post">
        <div class="fitem">
            <label>指标名称：</label>
            <input class="easyui-textbox" value="利润率" />
            <label>是否公用：</label>
            <select class="easyui-combobox">
                <option value="0">是</option>
                <option value="1">否</option>
            </select>
        </div>
        <div class="fitem">
            <label>维护部门：</label>
            <select class="easyui-combobox">
                <option value="">财务部</option>
                <option value="">人事部</option>
            </select>
            <label>维护角色：</label>
            <select class="easyui-combobox">
                <option value="0">主办会计</option>
                <option value="1">行政总监</option>
                <option value="2">总经理</option>
            </select>
        </div>
        <div class="fitem">
            <label>审核部门：</label>
            <select class="easyui-combobox">
                <option value="">总经办</option>
                <option value="">行政部</option>
            </select>
        </div>
        <div class="fitem">
            <label>备注说明：</label>
            <input class="easyui-textbox" multiline="true" style="width:452px;height:52px;" value="考核项目的实际利润情况"  />
        </div>
    </form>
</div>
<!-- /弹出框 -->
</body>
</html>
