<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/2/27
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="css/pageChangeInfo.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/pageChangeInfo.js"></script>
<div id="layout">
    <div id="form" >
        <div id="left" >
            <table cellpadding="5" >
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true" id="yonghuming"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="easyui-textbox" type="password"  data-options="required:true"></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select class="easyui-combobox" name="language" style="width: 100px">
                        <option value="man">男</option>
                        <option value="female">女</option>
                    </select></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true,validType:'email'"></td>
                </tr>

                <tr>
                    <td>电话号码:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>

                <tr>
                    <td>真实姓名:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>
                <%--<tr>
                    <td>身份证号:</td>
                    <td><input class="easyui-textbox" type="text"  data-options="required:true"></td>
                </tr>--%>
                <tr>
                    <td>家庭住址:</td>
                    <td><input class="easyui-textbox"  data-options="multiline:true" style="height:60px"></td>
                </tr>

            </table>
            <div id="buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton">提交</a>
                <a href="javascript:void(0)" class="easyui-linkbutton">Clear</a>
            </div>
        </div>
        <div id="right">
            <div >
                <img id="changeInfoImg" style="margin: 10px;height: 150px;width: 150px;">
            </div>
            <div>File1:</div>
            <input class="easyui-filebox" id="file1" data-options="prompt:'请选择'" style="width: 200px;">
        </div>

    </div>

</div>
<script>
    $(function () {
        $.ajax({

        })
    })
</script>


