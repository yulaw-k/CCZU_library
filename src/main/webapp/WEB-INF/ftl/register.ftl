<!doctype html>
<html lang="zh-CN">
<head>
    <!-- 必须的 meta 标签 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap 的 CSS 文件 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../raty/jquery.raty.css">
    <title>会员注册</title>
    <script src="../../js/jquery-3.6.0.min.js"></script>
    <script src="../../js/template-web.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script>


    </script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/">
        <img src="../../images/logo2.png" width="35" height="35" class="d-inline-block align-top " alt="">
        常州大学图书馆
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">首页<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/management/index.html">后台管理平台</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                    更多
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">校友墙</a>
                    <a class="dropdown-item" href="#">图书预订</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="javascript:;">声明</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">公告</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="navbar-nav ml-auto">
            <#if loginMember??>
                <li class="nav-item d-flex align-items-center">
                    <img src="../../images/touxiang1.png" class="rounded" style="width: 36px;height: 36px" alt="...">
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="user" role="button" data-toggle="dropdown" aria-expanded="false">
                        <span>${loginMember.nickname}</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="user">
                        <a class="dropdown-item" href="#">注销</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:;">个人中心</a>
                    </div>
                </li>
            <#else>
                <li class="nav-item">
                    <a class="nav-link" href="/login.html">登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register.html">注册</a>
                </li>
            </#if>
        </ul>

    </div>
</nav>
<div class="container px-1">
    <div class="container my-2">
        <div class="d-flex justify-content-between">
            <h3 style="display: inline-block">会员注册</h3>
            <a href="/login.html" style="text-decoration: none"><span class="text-primary">会员登录</span></a>
        </div>

    <form id="registerform">
        <div class="alert d-none mt-2" id="tips" role="alert">

        </div>
        <div class="form-group row">
            <label for="username" class="col-sm-2 col-form-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" name="username" class="form-control" id="username" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="nickname" class="col-sm-2 col-form-label">会员昵称</label>
            <div class="col-sm-10">
                <input type="text" name="nickname" class="form-control" id="nickname" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="password" class="col-sm-2 col-form-label">密码</label>
            <div class="col-sm-10">
                <input type="password" name="password" class="form-control" id="password" required>
            </div>
        </div>
        <#--<div class="form-row">
            <div class="form-group col-md-3">
                <label for="vc">验证码</label>
                <input type="text" name="vc" class="form-control" id="vc" required>
            </div>
            <div class="form-group col-md-8 d-flex align-items-end">
                <img id="imgVerifyCode" class="" src="/verify_code" >
            </div>
        </div>-->
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="vc">验证码</label>
            <div class="col-sm-4 d-flex align-items-end mb-2">
                <input type="text" name="vc" class="form-control" id="vc" required="required">
            </div>
            <div class="col-sm-6 d-flex align-items-end">
                <img id="imgVerifyCode" class="" src="/verify_code" >
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-10">
                <button id="btnSubmit"  class="btn btn-primary">注册</button>
            </div>
        </div>
    </form>
        <#--<button id="btnSubmit" type="submit" class="btn btn-primary">注册</button>-->
    </div>
</div>
<!-- modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">注册成功</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                注册成功，快去登录吧！
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <a href="/login.html"><button type="button" class="btn btn-primary">去登录</button></a>
            </div>
        </div>
    </div>
</div>
<script>
    function showTips(isShow,css,text){
        if(isShow){
            $("#tips").removeClass("d-none")
            $("#tips").hide();
            $("#tips").addClass(css);
            $("#tips").text(text);
            $("#tips").fadeIn(200);
        }else {
            $("#tips").text("");
            $("#tips").fadeOut(200);
            $("#tips").removeClass();
            $("#tips").addClass("alert");
        }
    }
    //重新发送请求，刷新验证码
    function reloadVerifyCode(){
        //请在这里实现刷新验证码
        $("#imgVerifyCode").attr("src","/verify_code?ts=" + new Date().getTime());
    }
    //请在这里实现刷新验证码
    $("#imgVerifyCode").click(function (){
        reloadVerifyCode();
    })
    $("#registerform").submit(function (e){
        e.preventDefault();
    })
    $("#btnSubmit").click(function (){
        console.log("?????");
        console.log($("#registerform").serialize());
        console.log("?????");
        var username = $.trim($("#username").val());
        var regex = /^.{6,10}$/;
        if (!regex.test(username)){
            showTips(true,"alert-danger","用户名请输入正确格式（6-10位）");
            console.log("用户名请输入正确格式（6-10位）");
            return;
        }else {
            showTips(false);
        }

        var password = $.trim($("#password").val());

        if(!regex.test(password)){
            showTips(true,"alert-danger","密码请输入正确格式（6-10位）");
            return;
        }else {
            showTips(false);
        }

        $btnReg = $(this);

        $btnReg.text("正在处理...");
        $btnReg.attr("disabled","disabled");
        console.log("发送Ajax请求");
        //发送Ajax请求
        $.ajax({
            url:"/registe",
            type:"post",
            dataType:"json",
            data:$("#registerform").serialize(),
            success:function (data){
                //结果处理，根据服务器返回code判断服务器处理状态
                //服务器要求返回JSON格式
                //{"code":"0","msg":"处理消息"}
                console.info("服务器响应：",data);
                if(data.code == "0"){
                    //显示注册成功对话框
                    $("#exampleModalCenter").modal({});
                    $("#exampleModalCenter").modal("show");
                    $btnReg.text("注册成功");
                }else {
                    //服务器校验异常，提示错误信息
                    showTips(true,"alert-danger",data.msg);
                    reloadVerifyCode();
                    $btnReg.text("注册");
                    $btnReg.removeAttr("disabled");
                }
            }
        })
    })

</script>
</body>
</html>