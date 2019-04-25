<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/4/23
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/bootstrap-combobox.js"></script>
<link rel="stylesheet" href="css/bootstrap-combobox.css">
<script src="js/vue.js"></script>
<div id="liuyanchaxun">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title" style="color: white">发起表单</h3>
        </div>
        <div class="panel-body form-inline" >
            <div style="margin: 10px 0px 0px 0px">
            <label id="guanliyuanxuanze" style="font-size: 18px">请选择需要留言的管理员：
            </label>
            <div style="width: 200px; display: inline;" >
                <select id="guanliyuancombobox" style="width: 200px;">
                    <option></option>
                    <option value="PA">Pennsylvania</option>
                    <option value="CT">Connecticut</option>
                    <option value="NY">New York</option>
                    <option value="MD">Maryland</option>
                    <option value="VA">Virginia</option>
                </select>
                <button type="submit" class="btn btn-danger" >提交</button>
            </div>
            </div>
            <div>
                <form role="form">
                    <div class="form-group" style="margin: 10px">

                      <div><label >请输入标题</label></div>
                        <input type="text" class="form-control" style="width: 650px" id="name"
                               placeholder="请输入标题">
                    </div>
                    <div style="margin: 10px">
                        <textarea id="liuyankuang"></textarea>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(function (){
        $('#guanliyuancombobox').comboboxboot({bsVersion: '3'});
             var editor=KindEditor.create('#liuyankuang', {
        allowPreviewEmoticons: false,
        uploadJson: 'jspFunction/upload_json.jsp',
        urlType: 'absolute',
        height:"390px",
        resizeType: 0,  //文本框不可拖动
        items: [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    });

    })
</script>