<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>图书管理功能</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <style>
        /* 移动端 */
        @media screen and (max-width: 768px) {
            .layui-layout-admin .layui-layout-left,
            .layui-layout-admin .layui-body,
            .layui-layout-admin .layui-footer{left: 0;}
            .layui-layout-admin .layui-side{left: -300px;}
        }
    </style>
    <script src="/js/wangEditor.min.js"></script>

    <script type="text/html" id="toolbar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" id="btnAdd" onclick="showCreate()">添加</button>
        </div>
    </script>
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">图书后台管理系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="/management/index.html">首页</a></li>
            <li class="layui-nav-item layui-hide-xs"><a href="">通知</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">更多</a>
                <dl class="layui-nav-child">
                    <dd><a href="/">回到图书馆</a></dd>
                    <dd><a href="">menu 22</a></dd>
                    <dd><a href="">menu 33</a></dd>
                </dl>
            </li>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="/images/touxiang1.png" class="layui-nav-img">
                    阿梅子99
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">退出登录</a></dd>
                    <dd><a href="">个人中心</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">数据管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">menu 1</a></dd>
                        <dd><a href="javascript:;">menu 2</a></dd>
                        <dd><a href="javascript:;">menu 3</a></dd>
                        <dd><a href="">the links</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="/management/book/index.html">图书管理</a></li>
                <li class="layui-nav-item"><a href="">短评管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-card layui-panel">
            <blockquote class="layui-elem-quote layui-text">
                <ul>
                    <li>
                        该页面只是简单的管理系统的界面基础布局示例，并不是一整套界面布局方案，您可以关注基于 layui 的通用型管理系统界面模板解决方案：
                        <a href="/layuiadmin/" target="_blank" class="layui-btn">layuiAdmin</a>
                    </li>
                    <li>
                        layui 之所以赢得如此多人的青睐，更多是在于它“前后界面兼备”的能力。既可编织出绚丽的前台页面，又可满足繁杂的管理系统的界面需求。
                        <br>layui 管理基本布局， 致力于让每一位开发者都能轻松搭建自己的管理系统模板。
                    </li>
                </ul>
            </blockquote>
            <br><br>
            <div class="layui-card-header">
                下面是充数内容，为的是出现滚动条
            </div>
            <div class="layui-card-body">
                充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>你还真滑到了底部呀
            </div>
            <br><br><br><br>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
<script src="/layui/layui.js"></script>

<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,title: '更多'
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                    ,scrollbar: false
                });
            }
        });

    });
</script>

</body>
</html>