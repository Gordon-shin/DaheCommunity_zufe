function uploadImg(file,type,username)
{
    let formData = new FormData();
    formData.append("File",file);
    formData.append("type", type);
    formData.append("username", username);

    console.log(file);
    console.log(formData.get("type"));
    $.ajax({
        url:"UploadImgServlet",
        type:'post',
        data:formData,
        processData: false,
        contentType: false,
        success:function (result) {

        }

    })
}
function uploadItemImg(file) {
    let formData = new FormData();
    formData.append("File",file);
    $.ajax({
        url:"UploadImgServlet",
        type:'post',
        data:{formData:formData,method:"itemImg"},
        processData: false,
        contentType: false,
        success:function (result) {

        }

    })
}
