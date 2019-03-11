$(function() {

    var datenow= getNowFormatDate();

    $('#navShop').tree({
        animate:true,
        lines:true,
        url:'NavServlet',
        queryParams:{tabid:"3"},
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
                var tab = $('#tt').tabs('getSelected');
                console.log(tab);
                if ($('#tt').tabs('exists', node.text)) {
                    $('#tt').tabs('select', node.text)
                    var tab = $('#tt').tabs('getSelected');  // 获取选择的面板
                    tab.panel('refresh');
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
                var tab = $('#tt').tabs('getSelected');
                console.log(tab);
                if ($('#tt').tabs('exists', node.text)) {
                    $('#tt').tabs('select', node.text)
                    var tab = $('#tt').tabs('getSelected');  // 获取选择的面板
                    tab.panel('refresh');
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

                    $('#tt').tabs('update',{
                        tab:node.text,
                        options:{
                            href:node.url
                        }
                    })
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
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
        return currentdate;
    }
});