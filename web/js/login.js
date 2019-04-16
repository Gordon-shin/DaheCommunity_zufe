$(function(){
    //登录界面
    $('#login').dialog({
        title:'登录',
        width:300,
        height:220,
        modal:true,
        buttons:'#btn',
        closable:false,

    });
    //客户端验证 账号
    $('#LoginUser').validatebox({
        required:true,
        missingMessage:'请输入账号',
        invalidMessage:'账号不能为空',
    });
    $('#LoginPassword').validatebox({
        required:true,
        missingMessage:'请输入密码',
        invalidMessage:'密码不能为空',
    });
    //加载时验证
    if (!$('#LoginUser').validatebox('isValid'))
    {
        console.log($('#LoginUser').validatebox('isValid'));
        $('#LoginUser').focus();
    }
    else if(!$('#LoginPassword').validatebox('isValid'))
    {
        $('#LoginPassword').focus();
    }
    //点击登录
    $('#loginBtn').click(function () {

        if (!$('#LoginUser').validatebox('isValid'))
        {
            $('#LoginUser').focus();
        }
        else if(!$('#LoginPassword').validatebox('isValid'))
        {
            $('#LoginPassword').focus();
        }
        else if ($('#authselect').combobox('getValue')=='user') {
            $.ajax({
                url:"LoginServlet",
                type:"post",
                data:{
                    username:$('#LoginUser').val(),
                    password:$('#LoginPassword').val(),
                },
                beforeSend: function(){
                    $.messager.progress({
                        text:'正在登录中',
                    });
                },
                success:function(result){
                    $.messager.progress('close');
                    if (result=="true") {
                        $.messager.alert('登录成功','登录成功',"info",function () {
                            location.href = 'index.jsp';
                        });
                    }
                    else{
                        $.messager.alert('登录失败','请检查用户名密码组合',"error");
                    }
                }
            })
        }
        else{
            $.ajax({
            url:"LoginServlet",
            type:"post",
            data:{
                username:$('#LoginUser').val(),
                password:$('#LoginPassword').val(),
                method:'manager'
            },
            beforeSend: function(){
                $.messager.progress({
                    text:'正在登录中',
                });
            },
            success:function(result){
                $.messager.progress('close');
                if (result=="true") {
                    $.messager.alert('登录成功','登录成功,欢迎您管理员',"info",function () {
                        location.href = 'index_admin.jsp';
                    });
                }
                else{
                    $.messager.alert('登录失败','请检查用户名密码组合',"error");
                }
            }
        })


        }
    });
    $('#register').click(function () {
        location.href ="pageRegister.jsp"
    })
    $('#yuyue').click(function () {

    })
})