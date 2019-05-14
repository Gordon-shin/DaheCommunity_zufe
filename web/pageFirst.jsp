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
        <div title="欢迎界面">
            <div class="flow-panel">
                欢迎来到大河小区便民服务系统
            </div>
        </div>
        <div title="系统公告" id="newslist">
            <ul class="notice-list" >
                <li v-for = "item in list" :key="item.newsid">
                    <span>{{item.text}}</span>
                    <span class="date">发布时间：{{item.adddate}}</span>
                </li>
            </ul>
        </div>
    </div>

<script>
    var vmnews = new Vue({
        el:'#newslist',
        data:{
            list:"",
        },
        methods:{
            getNews:()=>{
                $.ajax({
                    url: "newsServlet",
                    type: "post",
                    async: false,
                    data: {method: "getnews"},
                    success: function (result) {
                        vmnews.list = JSON.parse(result);
                    }
                });
            }
        }
    })




    $(function () {
        vmnews.getNews();
    })
</script>
