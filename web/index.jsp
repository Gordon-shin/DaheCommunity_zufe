<%@ page import="org.sc.bean.User" %>
<!DOCTYPE html>

<html>
	<head>
		<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta charset="utf-8" />
		<title>EasyUI Demo</title>
		<link rel="stylesheet" type="text/css" href="css/themes/default/easyui.css" />
	    <link rel="stylesheet" type="text/css" href="css/themes/icon.css" />
	    <link rel="stylesheet" type="text/css" href="css/common.css" />
	    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript"  charset="UTF-8" src="js/index.js"></script>
		<script type="text/javascript"  charset="UTF-8" src="js/base64.js"></script>

	</head>
	<body class="easyui-layout" id="layout" style="visibility:hidden;">
		<% if((session.getAttribute("User"))==null){
			response.sendRedirect("login.jsp");
		}
		else{
			User user = (User) session.getAttribute("User");
			System.out.println(user.getPassword());
		}
		%>
		<div region="north" id="header">
			<img src="img/logo.png" class="logo" />
			<div class="top-btns">
				<span id="welcomeSpan">欢迎您，</span>
				<a href="#" class="easyui-linkbutton"  id="changePassword"data-options="plain:true,iconCls:'icon-lock'">修改密码</a>
				<a href="LogoutServlet" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'">退出系统</a>
				<%--<select class="easyui-combobox" data-options="editable:false">
					<option value="0" selected="selected">中文</option>
					<option value="1">English</option>
				</select>--%>
			</div>
		</div>
		
		<div region="west" split="true" title="导航菜单" id="naver">
			<div class="easyui-accordion" fit="true" id="navmenu">
				<div title="指标体系">
					<ul class="navmenu">
						<li class="active"><a href="#">首页</a></li>	
						<li><a href="#" data-url="html/page01.html">w</a></li>
						<li><a href="#" data-url="html/page02.html">指标库列表</a></li>
					</ul>
				</div>
				<div title="居民自助服务">
					<ul class="navmenu">
						<li><a href="#" data-url="html/page01.html">你好</a></li>
						<li><a href="#" data-url="html/pageRepair.html">自助修理服务</a></li>
						<li><a href="#" data-url="html/page02.html">指标库列表</a></li>
					</ul>
				</div>
				<div title="报表管理"></div>
				<div title="系统管理"></div>
				<div title="组件示例">
					<ul class="navmenu">
						<li><a href="#" data-url="html/demo01.html">锁定行和列</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div region="center" id="content">
			<div class="easyui-tabs" fit="true" id="tt">
				
				<div title="首页" iconCls="icon-ok">
					<div class="easyui-accordion" data-options="fit:true">
						<div title="待办事项">
							<div class="flow-panel">
								<div class="flow-todo">
									<ul>
										欢迎来到后台管理系统
									</ul>
								</div>
							</div>
						</div>
						<div title="系统公告">
							<ul class="notice-list">
								<li>
									<span>这是一条系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告</span>
									<span class="date">2015-10-30</span>
								</li>
								<li>
									<span>这是一条系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告</span>
									<span class="date">2015-10-30</span>
								</li>
								<li>
									<span>这是一条很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的系统公告</span>
									<span class="date">2015-10-30</span>
								</li>
								<li>
									<span>这是一条系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告</span>
									<span class="date">2015-10-30</span>
								</li>
								<li>
									<span>这是一条系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告系统公告</span>
									<span class="date">2015-10-30</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div region="south" id="footer">&copy;大河小区便民服务管理系统 V1.0 Powered by JSP & EasyUI</div>


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
