<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/4/23
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 评论列表 -->
<script src="js/Newdate.js"></script>
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/kindeditor-all.js"></script>
<script type="text/javascript" charset="utf-8" src="plugin/kindeditor/lang/zh-CN.js"></script>
<div>
    <textarea id="commentbox" style="width:100%;height:200px;visibility: hidden"></textarea>
</div>

<div id="upitemReview">
    <button type="button" class="btn btn-danger" id="submitcomment" @click="submit">提交评论</button>
</div>
<div id="replybox">
    <ul class="list-group">
        <li class="list-group-item" v-for="item in list" :key="item.id">
            <span class="badge">评论人: {{item.id}}</span>
            {{item.id}}
        </li>
    </ul>
</div>
<script>
    var editor=KindEditor.create('#commentbox', {
        allowPreviewEmoticons: false,
        uploadJson: 'jspFunction/upload_json.jsp',
        urlType: 'absolute',
        resizeType: 0,  //文本框不可拖动
        items: [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    });
</script>
<script>
    var vm2=new Vue({
        el: '#upitemReview',
        methods: {
            submit: () => {
                let data={}
                data['author']=sessionid;
                data['content']=editor.text();
                $.ajax({
                    url:"ShopServlet",
                    type:"post",
                    data:{
                        data:{data:JSON.stringify(data),method:"tijiaoComment"},
                        success:function (result) {

                        }
                    }
                })
            }
        }
    })
    var vm=new Vue({
        el: '#replybox',
        data: {
            list: [
                {id: 1, user: '李白', content: '天生我才必有用'},
                {id: 2, user: '李白', content: '天生我才必有用'},
                {id: 3, user: '李白', content: '天生我才必有用'},
                {id: 4, user: '李白', content: '天生我才必有用'},
                {id: 5, user: '李白', content: '天生我才必有用'},
                {id: 6, user: '李白', content: '天生我才必有用'},
                {id: 7, user: '李白', content: '天生我才必有用'},
                {id: 8, user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
                {id: getNowFormatDate(), user: '李白', content: '天生我才必有用'},
            ]
        }
    })
</script>
