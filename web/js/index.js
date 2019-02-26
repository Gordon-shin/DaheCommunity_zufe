$(function() {

    $('#nav').tree({
        animate:true,
        lines:true,
        url:'NavServlet',

    })

    var uname= getCookie('PersonName');

    function getCookie(c_name)
    {
        if (document.cookie.length>0)
        {
            c_start=document.cookie.indexOf(c_name + "=")
            if (c_start!=-1)
            {
                c_start=c_start + c_name.length+1
                c_end=document.cookie.indexOf(";",c_start)
                if (c_end==-1) c_end=document.cookie.length
                return unescape(document.cookie.substring(c_start,c_end))
            }
        }
        return ""
    }
    //添加用户名
     $("#welcomeSpan").append(Base64.decode(uname));
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

});