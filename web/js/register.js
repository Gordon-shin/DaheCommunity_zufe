$(function() {

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

    $('#file1').filebox({
        onChange:function () {
           console.log($("input[name='file2']")[0].files[0]) ;

            var reader = new FileReader();
            reader.readAsDataURL($("input[name='file2']")[0].files[0])
            reader.onload=function (result) {
               console.log(result.target.result);
               document.getElementById("img").src = result.target.result;
            }

          // $('#img').attr("src",$("input[name='file2']")[0].files[0]);
        }
    })
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
