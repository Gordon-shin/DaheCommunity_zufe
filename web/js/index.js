$(function() {
    //添加新的Tab页
    $("#navmenu").on("click", "a[data-url]", function(e) {
        e.preventDefault();
        var tabTitle = $(this).text();
        var tabUrl = $(this).data("url");

        if($("#tt").tabs("exists", tabTitle)) { //判断该Tab页是否已经存在
            $("#tt").tabs("select", tabTitle);
        }else {
            $("#tt").tabs("add", {
                title: tabTitle,
                href: tabUrl,
                closable: true
            });
        }
        $("#navmenu .active").removeClass("active");
        $(this).parent().addClass("active");
    });

    //解决闪屏的问题
    window.setTimeout(function() {
        $("#layout").css("visibility", "visible");
    }, 800);
    $("#changePassword").click(function (e) {
        e.preventDefault();
        $("#dlg").dialog("open");
    })
      var username= $.cookie('username');
});