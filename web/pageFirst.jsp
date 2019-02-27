<%@ page import="org.sc.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if((session.getAttribute("User"))==null){
    response.sendRedirect("login.jsp");
}
else{
    User user = (User) session.getAttribute("User");
    System.out.println(user.getPassword());
}
%>
    <div class="easyui-accordion" data-options="fit:true">
        <div title="待办事项">
            <div class="flow-panel">
                欢迎来到后台管理系统

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

