$(function() {
    $('#username').validatebox({
        required:true,
        missingMessage:'请输入账号',
        invalidMessage:'账号不能为空',

    });
    $('#password').validatebox({
        required:true,
        missingMessage:'请输入密码',
        invalidMessage:'密码不能为空',

    });
    $('#email').validatebox({
        required:true,
        validType: 'email'

    });
    $('#phone').validatebox({
        required:true,
        missingMessage:'请输入手机',
        invalidMessage:'手机不能为空',

    });
    $('#realname').validatebox({
        required:true,
        missingMessage:'请输入您的真实姓名',
        invalidMessage:'真实姓名不能为空',

    });  $('#idcard').validatebox({
        required:true,
        missingMessage:'请输入您的身份证号码',
        invalidMessage:'身份证号码不能为空',

    });


    $('#form').panel({
        width:500,
        height:550,
        title:'注册',
        onBeforeOpen:function () {
            var self = $(this);
            var parentWidth = self.parent().parent().width();
            var parentHeight = self.parent().parent().height();
            var width = self.parent().width();
            var height = self.parent().height();
            var left = (parentWidth - width) / 2;
            var top = (parentHeight - height) / 2;
            self.parent().css({
                marginLeft : left,
                marginTop : top
            });
            if( parentHeight < height ){
                self.parent().css({
                    marginLeft : left,
                    marginTop : 0
                })
            }
        }
    })
    $('#tijiao').linkbutton({
        onClick: function () {
           uploadImg($("input[name='file2']")[0].files[0],'你好',8888)

            var a=validate()
            if (a == true) {
                var data={};
                data['username']=$('#username').val();
                data['password']=$('#password').val();
                data['email']=$('#email').val();
                data['phone']=$('#phone').val();
                data['realname']=$('#realname').val();
                data['idcard']=$('#idcard').val();
                data['address']=$('#address').val();
                data['sex']=$('#sex').combobox("getText");
                var jsonobj=JSON.stringify(data);
                console.log(data);
                console.log(jsonobj);
                $.ajax({
                    url: "RegisterServlet",
                    type: "post",
                    data: {data: jsonobj},
                    beforeSend: function () {
                        $.messager.progress({
                            text: '正在注册中...',
                        });
                    },
                    success: function (result) {
                        $.messager.progress('close');
                        if (result == "true") {

                            $.messager.alert('注册', '恭喜你注册成功', "info", function () {
                                location.href='index.jsp';
                            });
                        } else {
                            $.messager.alert('注册', result, "error");
                        }
                    }
                })
            } else {
                var b='#' + a // 选择器字段拼接
                $(b).focus();

            }
        }
    })
    $('#reset').linkbutton({
        onClick:function () {
            location.href="pageRegister.jsp";
        }
    })
    

    $('#file1').filebox({
        onChange:function () {
           console.log($("input[name='file2']")[0].files[0]) ;

            var reader = new FileReader();
            reader.readAsDataURL($("input[name='file2']")[0].files[0])
            reader.onload=function (result) {
               document.getElementById("img").src = result.target.result;
            }

          // $('#img').attr("src",$("input[name='file2']")[0].files[0]);
        }
    })
    function validate() {
        if (( $('#username').validatebox('isValid')&&
            $('#password').validatebox('isValid')&&
            $('#email').validatebox('isValid')&&
            $('#phone').validatebox('isValid')&&
            $('#realname').validatebox('isValid')&&
            $('#idcard').validatebox('isValid')))
        {return true;}
        else{
            if(!$('#username').validatebox('isValid'))
            {
                return 'username';
            }
            else if (!$('#password').validatebox('isValid'))
            {
                return 'password';
            }else if (!$('#email').validatebox('isValid'))
            {
                return 'email';
            }else if (!$('#phone').validatebox('isValid'))
            {
                return 'phone';
            }else if (!$('#realname').validatebox('isValid'))
            {
                return 'realname';
            }else if (!$('#idcard').validatebox('isValid'))
            {
                return 'idcard';
            }
        }

    }
    function fileName(_obj) {
        var _file = $(_obj).context.ownerDocument.activeElement.files[0];
        console.log(_file);
    }
    function getObjectUrl(file) {
            var url = null;
            if (window.createObjectURL!=undefined){
                url= window.createObjectURL(file);
            }
            else if(window.URL!=undefined){
                url = window.URL.createObjectURL(file);
            }
            else if(window.webkitURL.createObjectURL(file))
            {
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
    }
})
