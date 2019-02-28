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
    $('#file1').filebox({buttonAlign:'right'});
})
