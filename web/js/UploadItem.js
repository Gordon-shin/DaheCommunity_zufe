$(function () {
    var editor=KindEditor.create('#desc123', {
        allowPreviewEmoticons: false,
        // allowImageUpload : false,
        uploadJson: 'jspFunction/upload_json.jsp',
        urlType: 'absolute',
        resizeType: 0,  //文本框不可拖动
        items: [
            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    });

    $('#submitMonoInfo').linkbutton({
        onClick: function () {
            var data={};
            data['itemtitle']=$('#itemtitle').val();
            data['itemclass']=$('#itemclass').val();
            data['price']=$('#priceView').val();
            data['stock']=$('#num').val();
            data['barcode']=$('#barcode').val();
            data['itemunit']=$('#barunit').val();
            data['itemdesc']=editor.text();
            data['userid']=sessionid;
            data['state']="审核中";
            data['addTime']=getNowFormatDate();
            data['phone']=$('#phone').val();
            /* console.log(data)*/
            $.ajax({
                url: "ShopServlet",
                type: "post",
                data: {data: JSON.stringify(data), method: "iteminfo"},
                success: function (result) {
                    alert(result);
                }
            })
        }
    })

    $('#fileitem').filebox({
        onChange: function () {
            console.log($("input[name='file3']")[0].files[0]);
            var reader=new FileReader();
            reader.readAsDataURL($("input[name='file3']")[0].files[0])
            reader.onload=function (result) {
                document.getElementById("imgitem").src=result.target.result;
            }
        }
    })

    function getObjectUrl(file) {
        var url=null;
        if (window.createObjectURL != undefined) {
            url=window.createObjectURL(file);
        } else if (window.URL != undefined) {
            url=window.URL.createObjectURL(file);
        } else if (window.webkitURL.createObjectURL(file)) {
            url=window.webkitURL.createObjectURL(file);
        }
        return url;
    }
})

