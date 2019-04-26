<%--
  Created by IntelliJ IDEA.
  User: Gordon
  Date: 2019/4/25
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery-1.7.2.min.js"></script>
    <title>Title</title>
    <script>
       $(function () {
           $('#subimg').click(function () {
               let formData = new FormData();
               let jsonobj ={method:"helloworld"}
               formData.append("File",$("input[name='file2']")[0].files[0]);
               formData.append("JSON",JSON.stringify(jsonobj))
               console.log(formData)
               $.ajax({
                   url:"upItemImgServlet",
                   type:'post',
                   data:formData,
                   processData: false,
                   contentType: false,
                   success:function (result) {

                   }
                  })
           })})
    </script>

</head>
<body>
<div id="right">
    <div id="imgReview">
        <img id="img" src="" style="width: 150px;height: 150px">
    </div>
    <div>File1:</div>
    <input  id="file1"  name="file2" data-options="prompt:'请选择'"  type="file" style="width:100%">
    <button id="subimg" > 提交</button>
</div>
</body>
</html>
