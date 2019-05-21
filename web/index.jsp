<%@ page import="org.sc.bean.User" %>
<!DOCTYPE html>

<html>
	<head>

		<script src="js/Newdate.js"></script>
		<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
			function queryDiagByUserid(userid){
				let result = null
				$.ajax({
					type: "POST",
					dataType: 'JSON',
					async:false,
					url: "MessageServlet",
					data: {userid: userid,method: "queryDiagByUserid"},
					success:function (e) {
						result =e
					}
				})
				return null;
			}
			/*$(function () {
				/!*$('.send-btn').click(function () {
                    let text = liaotianeditor.text()
                    let user = "rightBubble";
                    chat(user,"",text)
                })
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
        *!/

			})*/
		</script>
		<style>
			.continueChat{
				padding: 0.3rem 0.6rem;
				border: 0;
				background: red;
				color: #fff;
				min-width: 4rem;
				border-radius: 0.4rem;
				margin-left: 3%;
				position: absolute;
				right: 1.7rem;
			}
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
		<%@page isELIgnored="false" %>
		<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
		<link rel="stylesheet" href="./css/bootstrap.css">

		<script type="text/javascript">

				var sessionname='<%=session.getAttribute("username")%>';
				var sessionid='<%=session.getAttribute("userid")%>';
			</script>

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
		<script type="text/javascript"  charset="UTF-8" src="js/index.js"></script>
		<script type="text/javascript"  charset="UTF-8" src="js/base64.js"></script>
		<link rel="stylesheet" type="text/css" href="css/semantic.css" />
		<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/kindeditor-all.js"></script>

		<script src="js/vue.js"></script>


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
			<img src="img/banner.png" class="logo" />
			<div class="top-btns">
				<span id="welcomeSpan">欢迎您，</span>
				<a href="#" class="easyui-linkbutton"  id="openChatZone"data-options="plain:true,iconCls:'icon-chat'">聊天室</a>
				<a href="LogoutServlet" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'" id="logoutjs">退出系统</a>
			</div>
		</div>
		
		<div region="west" split="true" title="菜单" id="naver" iconCls="icon-world">
			<div class="easyui-accordion" fit="true" id="navmenu">
				<div title="用户信息管理">
					<ul id="nav">
					</ul>
				</div>
				<div title="维修报障管理">
					<ul  id="navRepair">
					</ul>
				</div>
				<div title="二手市场管理" >
				<ul id="navShop">
				</ul>
			    </div>
                <div title="医院预约管理" >
                    <ul id="navYiYuan">

                    </ul>
                </div>
				<div title="留言表单管理" >
					<ul id="navliuyan">
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
		<script>
			$(function () {
				$('#liaotianyonghuming').textbox({
					disabled:true
				});
				$('#liaotianrentianjia').linkbutton({
					onClick:function () {
						$('#liaotianyonghuming').textbox('setValue',"")
						if ($('#liaotianyhonghubianhao').val()=="")
						{
							$.messager.alert("信息","请输入想要聊天的用户编号","info")
						}
						else{
							$.ajax({
								type: "POST",
								async:false,
								url: "MessageServlet",
								data: {userid: $('#liaotianyhonghubianhao').val(),sessionid:sessionid,method: "checkpeoplebyid"},
								success:function (e) {

									if (e=="2"){
										$.messager.alert("信息","您已经与该用户建立了会话","info")
									}
									else{
										$('#liaotianyonghuming').textbox('setValue',e);
										$.messager.confirm("信息","您确认要与"+e+"建立会话吗",function (r) {
											if (r){
												var diagdata = {};
												diagdata["userid"]=$('#liaotianyhonghubianhao').val()
												diagdata["seller"]=sessionid
												diagdata["time"]=getNowFormatDate();
												$.ajax({
													type:"post",
													url:"MessageServlet",
													data:{data:JSON.stringify(diagdata),method:"liaotianshitianjiadiag"},
													success:function (e) {
														$.messager.alert("信息",e,"info")
														selectLiaotian1.getDiag(sessionid)
													}
												})
											}
										})
									}
								}
							})
						}

					}
				})
			})
		</script>
		<div class="easyui-dialog" title="聊天室" iconCls="icon-save" modal="true"
			 closed="true"  id="dlg" style="width: 400px">
			<div id="selectLiaotian">
				<table class="table table-bordered table-hover table-striped">
					<div style="margin: 0px 0px 10px 0px">
						<div style="margin: 0px 0px 10px 10px;display: inline ">用户编号:<input style="width:50px;height:20px;margin: 0px 0px 0px 30px" class="textbox" type="text" id="liaotianyhonghubianhao" ></div>
						<div style="margin: 0px 0px 10px 10px;display: inline ">用户姓名:<input style="width:60px;height:20px;margin: 0px 0px 0px 30px" class="textbox" type="text"  id="liaotianyonghuming" ></div>
						<a href="#" style="margin: 0px 0px 0px 10px"  iconCls="icon-ok" id="liaotianrentianjia">添加聊天人</a>
					</div>
					<thead>
					<tr>
						<th>对话ID</th>
						<th>对话发起人</th>
						<th>对话人</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<tr v-for = "item in list" :key ="item.id">
						<td>{{item.id}}</td>
						<td>{{item.userpersonname}}</td>
						<td>{{item.userpersonname2}}</td>
						<td><button class="continueChat" @click="chatcontinue(item.id)">继续聊天</button></td>
					</tr>
					</tbody>
				</table>
				<%--<ul class="list-group">
					<li class="list-group-item" id="chatlist" v-for="item in list" :key="item.id">
						<span class="badge">数量： {{item.number}}</span>
						{{item.userpersonname2}} ------{{item.userpersonname}}
						<button class="continueChat">继续聊天</button>
					</li>
				</ul>--%>
			</div>
		</div>
		<%--<div class="easyui-dialog" title="新增/编辑" iconCls="icon-save" modal="true"
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
		</div>--%>
		<!-- /弹出框 -->
		<div class="easyui-dialog" title="与***聊天中" iconCls="icon-save" modal="true" closed="true" id="ChatSeller" style="width: 450px;height: 600px">
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
		</div>
	</body>
</html>
