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
                <li class="layui-nav-item"><a href="javascript:;">图书管理</a></li>
                <li class="layui-nav-item"><a href="">短评管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-container">
            <blockquote class="layui-elem-quote">图书列表</blockquote>
            <!-- 数据表格 -->
            <table id="grdBook" lay-filter="grdBook"></table>
        </div>
        <div style="padding: 15px;">
            <!-- 表单内容 -->
            <div id="dialog" style="display: none">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <!-- 图书类别 -->
                        <label class="layui-form-label">图书类别</label>
                        <div class="layui-input-inline">
                        <select id="categoryId" name="categoryId" lay-verify="required" lay-filter="categoryId">
                            <option value=""></option>
                            <option value="1">前端</option>
                            <option value="2">后端</option>
                            <option value="3">测试</option>
                            <option value="4">产品</option>
                        </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">书名</label>
                        <!--书名-->
                        <div class="layui-input-inline">
                        <input type="text" id="bookName" class="layui-input" name="bookName" required lay-verify="required" autocomplete="off" placeholder="请输入书名">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <!--子标题-->
                        <label class="layui-form-label">子标题</label>
                        <div class="layui-input-inline">
                            <input type="text" id="subTitle" class="layui-input" name="subTitle" required lay-verify="required" autocomplete="off" placeholder="请输入子标题">
                        </div>
                        </div>
                    <div class="layui-form-item">
                        <!--作者-->
                        <label class="layui-form-label">作者</label>
                        <div class="layui-input-inline">
                            <input type="text" id="author" class="layui-input" name="author" required lay-verify="required" autocomplete="off" placeholder="请输入作者名">
                        </div>
                        </div>
                    <div>图书介绍（默认第一图将作为图书封面</div>
                    <div class="layui-form-item">
                        <!-- wangEditor编辑器 -->
                        <div id="editor">

                        </div>
                    </div>
                    <!-- 图书编号 -->
                    <input id="bookId" type="hidden">
                    <!-- 当前表单操作类型，create代表新增 update代表修改 -->
                    <input id="optype" type="hidden">
                    <div class="layui-form-item">
                        <!-- 提交按钮 -->
                        <button class="layui-btn" lay-submit="" lay-filter="btnSubmit">立即提交</button>
                    </div>
                </form>
            </div>
            <br><br>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>

    var table = layui.table;
    var $ = layui.$;
    var editor = null;
    //初始化图书列表
    table.render({
        elem:'#grdBook'//指定div
        ,id:"bookList" //数据表格id
        ,toolbar:"#toolbar" //指定工具栏，包含新增添加
        ,url:"/management/book/list" //数据接口
        ,page:true //开启分页
        ,cols:[[//表头
            {field:'bookName',title: '书名',width:'300'}
            ,{field:'subTitle',title: '子标题',width:'200'}
            ,{field:'author',title: '作者',width:'200'}
            ,{field:'space',title: '操作',width:'200',templet:function(d){
                //为每一行表格数据生成“修改”与“删除”按钮，并附加data-id属性代表图书编号
                    return "<button class='layui-btn layui-btn-sm btn-update' data-id='" + d.bookId + "' data-type='update' onclick='showUpdate(this)'>修改</button>" +
                        "<button class='layui-btn layui-btn-sm btn-delete' data-id='" + d.bookId + "' onclick='showDelete(this)'>删除</button>"
            }}
        ]]
    });

    function showUpdate(obj){
        //弹出"编辑图书对话框"
        layui.layer.open({
            id:"dlgBook",//指定div
            title:"编辑图书",//标题
            type:1,
            content:$('#dialog').html(),//设置对话框内容。复制自dialog Div
            area:['820px','730px'],
            resize:false //是否允许调整尺寸
        })

        var bookId = $(obj).data("id");//获取”修改“按钮附带的图书编号
        $("#dlgBook #bookId").val(bookId);//为表单隐藏域赋值，提交表单时用到

        editor = new wangEditor('#dlgBook #editor');//初始化富文本编辑器
        editor.config.uploadImgServer = '/management/book/upload';
        editor.config.uploadFileName = 'img';//图片上传时的参数名
        editor.create();//创建wangEditor
        $("#dlgBook #optype").val("update");//设置当前表单提交时提交至"update"更新地址
        layui.form.render();
        //发送ajax请求，获取对应图书信息
        $.get("/management/book/id/" + bookId,{},function (json){
            //文本框回填已有数据
            $("#dlgBook #bookName").val(json.data.bookName);//书名
            $("#dlgBook #subTitle").val(json.data.subTitle);//
            $("#dlgBook #author").val(json.data.author);//
            $("#dlgBook #categoryId").val(json.data.categoryId);//
            editor.txt.html(json.data.description);//设置图文内容
            layui.form.render();
        },"json")
    }

    function showCreate(){
        //弹出”新增图书“对话框
        layui.layer.open({
            id:"dlgBook",//指定div
            title:"新增图书",//标题
            type:1,
            content:$('#dialog').html(),//设置对话框内容。复制自dialog Div
            area:['820px','730px'],
            resize:false //是否允许调整尺寸
        })
        editor = new wangEditor('#dlgBook #editor');//初始化富文本编辑器
        editor.config.uploadImgServer = '/management/book/upload';
        editor.config.uploadFileName = 'img';//图片上传时的参数名
        editor.create();//创建wangEditor

        layui.form.render();//表单渲染
        $("#dlgBook #optype").val("create");//设置当前表单提交时提交至"create"新增地址
    }

    layui.form.on('submit(btnSubmit)',function (data) {
        //获取表单数据
        var formData = data.field;

        //判断是否包含至少一幅图片，默认第一图作为封面显示
        var description = editor.txt.html();

        if (description.indexOf("img") == -1) {
            layui.layer.msg('请放置一副图片作为封面');
            return false;
        }
        //获取当前表单要提交的地址
        //如果是新增数据则提交至create
        //如果是更新数据则提交至update
        var optype = $("#dlgBook #optype").val();

        if (optype == "update") {
            //更新数据时，提交时需要附加图书编号
            formData.bookId = $("#dlgBook #bookId").val();
        }
        //附加图书详细描述的图文html
        formData.description = description;
        //向服务器发送请求
        $.post("/management/book/" + optype, formData, function (json) {
            if (json.code == "0") {
                //处理成功，关闭对话框，刷新列表，提示操作成功
                layui.layer.closeAll();
                table.reload('bookList');
                layui.layer.msg('数据操作成功，图书列表已刷新');
            } else {
                //处理失败，提示错误信息
                layui.layer.msg(json.msg);
            }
        }, "json")
        return false;
    })

</script>
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