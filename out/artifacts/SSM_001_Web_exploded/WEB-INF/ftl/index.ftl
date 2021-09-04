<!doctype html>
<html lang="zh-CN">
<head>
    <!-- 必须的 meta 标签 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap 的 CSS 文件 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../raty/jquery.raty.css">
    <title>CCZU Library</title>
    <script src="../../js/jquery-3.6.0.min.js"></script>
    <script src="../../js/template-web.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../raty/jquery.raty.js"></script>
    <style rel="stylesheet">

    </style>
    <script type="text/html" id="tpl">
        <div class="col mb-4 ">
            <a href="/book/{{bookId}}" style="text-decoration: none">
                <div class="card h-100">
                    <div class="row no-gutters">
                        <div class="col-sm-4 d-flex align-items-center"><!--图片居中-->
                            <img src="{{cover}}" class="img-fluid overflow-hidden rounded" alt="...">
                            <#--<div class="align-middle" style="height: 100%">1</div>-->
                        </div>
                        <div class="col-sm-8">
                            <div class="card-body">
                                <h5 class="card-title">{{bookName}}</h5>
                                <p class="card-text">作者：{{author}}</p>
                                <span class="card-text stars" data-score="{{evaluationScore}}"></span>
                                <span class="card-text">{{evaluationScore}}</span>
                                <p class="card-text"><small class="text-muted">{{evaluationQuantity}}人已评</small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </script>
    <script>
        $.raty.path = "../../raty/images";
        function loadMore(isReset) {
            if(isReset == true){
                $("#nextPage").val(1);
                $("#win1").empty();
                $("#win2").empty();
            }
            var nextPage = $("#nextPage").val();
            var categoryId = $("#categoryId").val();
            var order = $("#order").val();
            $.ajax({
                url: "/books",
                data: {p: nextPage,categoryId:categoryId,"order":order},
                type: "get",
                dataType: "json",
                success: function (json) {
                    console.info(json);
                    var list = json.records;
                    for (var i = 0; i < list.length; i++) {
                        var book = json.records[i];
                        var html = template("tpl", book);
                        if(order == "quantity"){
                            $("#win1").append(html);
                        }else if(order == "score"){
                            $("#win2").append(html);
                        }
                    }
                    //显示心型评价组件
                    $(".stars").empty();
                    $(".stars").raty({readOnly: true});

                    if (json.current < json.pages) {
                        $("#nextPage").val(parseInt(json.current + 1));
                        $("#btnMore").show();
                        $("#divNoMore").hide();
                    } else {
                        $("#btnMore").hide();
                        $("#divNoMore").show();
                    }
                    $(".card").mouseover(function (){
                        $(this).addClass("border");
                        $(this).addClass("border-primary");
                        console.log(111)
                    })
                    $(".card").mouseout(function (){
                        $(this).removeClass("border");
                        $(this).removeClass("border-primary");
                    })

                }
            })
        }
        $(function (){
            loadMore(true);
        })
        //绑定加载更多按钮单击事件
        $(function (){
            $("#btnMore").click(function (){
                loadMore();
            })
            $(".category").click(function (){
                $(".category").removeClass("active");
                $(this).addClass("active");
                var categoryId = $(this).data("category");
                $("#categoryId").val(categoryId);

                loadMore(true);
            })
            $(".order").click(function (){
                var order = $(this).data("order");
                $("#order").val(order);
                loadMore(true);
            })


        })
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
<div class="jumbotron text-center mb-2">
    <h1 class="display-4">CCZU library</h1>
    <p class="lead">Changzhou University Library provides students with the functions of book information inquiry, book borrowing and reservation, seat reservation and so on.</p>
    <hr class="my-4">
    <p class="text-muted">This project is jointly created by members of the Project Department of Science and Technology Innovation Association of Ali Cloud Big Data Institute. Welcome to join us!</p>
    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
</div>



<ul class="nav nav-pills justify-content-center">
    <li class="nav-item">
        <a class="nav-link active category" data-category=-1 href="javascript:;">全部</a>
    </li>
    <#list categoryList as category>
        <li class="nav-item">
            <a class="nav-link category" data-category="${category.categoryId}" href="javascript:;">${category.categoryName}</a>
        </li>
    </#list>
</ul>

<div class="container px-1">
    <hr class="my-2">
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link active order" id="pills-home-tab" data-order="quantity" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">按热度</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link order" id="pills-profile-tab" data-order="score" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">按评分</a>
        </li>

    </ul>
    <#--隐藏数据-->
    <div class="d-none">
        <input type="hidden" id="nextPage" value="2">
        <input type="hidden" id="categoryId" value="-1">
        <input type="hidden" id="order" value="quantity">
    </div>
    <div class="tab-content" id="pills-tabContent">

        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
            <div id="win1" class="row row-cols-1 row-cols-md-2">
            </div>
        </div>

        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
            <div id="win2" class="row row-cols-1 row-cols-md-2">

            </div>

        </div>
        <button id="btnMore" type="button" class="btn btn-outline-primary btn-block">点击加载更多...</button>
        <button id="divNoMore" type="button" class="btn btn-outline-primary btn-block" disabled>已经到底部啦</button>
    </div>
</div>
<script>


</script>
</body>
</html>