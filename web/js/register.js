$(function() {
  /*  SetCenter();
    window.onresize = function ()
    {
        setTimeout(function () { SetCenter(); }, 100);
    }
    function SetCenter()
    {
      //  var top = ($(window).height() - $('#form').height() - 2) / 2;  // 边框宽度为2
        var left = (window.innerWidth-400)/2;

        if (top < 0) top = 0;
        if (left < 0) left = 0;

        $('#form').panel('move', { left: left, top: top });
        alert(left)// 可以省略 move 方法
    }*/

    $('#form').panel({
        title:'面板',
        width:400,
    })
})
