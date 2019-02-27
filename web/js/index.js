$(function() {
    $('#navRepair').tree({
        animate:true,
        lines:true,
        url:'NavServlet',
        queryParams:{tabid:"2"},
        onLoadSuccess : function (node, data) {
            var _this = this;

            if (data) {
                $(data).each(function (index, value) {
                    if (this.state == 'closed') {
                        $(_this).tree('expandAll');
                    }
                });
            }

        },
        onClick : function (node) {
            var host= window.location.href;

            if (node.url) {
                if ($('#tt').tabs('exists', node.text)) {
                    $('#tt').tabs('select', node.text)
                } else {
                    $('#tt').tabs('add', {
                        title: node.text,
                        closable: true,
                        iconCls: node.iconCls,
                        href: node.url,
                    });
                }
            }
        }
    })

    $('#nav').tree({
        animate:true,
        lines:true,
        url:'NavServlet',
        queryParams:{tabid:"1"},
        onLoadSuccess : function (node, data) {
            var _this = this;

            if (data) {
                $(data).each(function (index, value) {
                    if((this.text=='首页'))
                    { $('#tt').tabs('add', {
                        title: this.text,
                        iconCls: this.iconCls,
                        href: this.url,
                    });

                    }
                 if (this.state == 'closed') {
                        $(_this).tree('expandAll');
                    }
                });
            }

        },
        onClick : function (node) {
            var host= window.location.href;

            if (node.url) {
                if ($('#tt').tabs('exists', node.text)) {
                    $('#tt').tabs('select', node.text)
                } else {
                    $('#tt').tabs('add', {
                        title: node.text,
                        closable: true,
                        iconCls: node.iconCls,
                        href: node.url,
                    });
                }
            }
        }
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
    //解决闪屏的问题
    window.setTimeout(function() {
        $("#layout").css("visibility", "visible");
    }, 800);
    $("#changePassword").click(function (e) {
        e.preventDefault();
        $("#dlg").dialog("open");
    })

});