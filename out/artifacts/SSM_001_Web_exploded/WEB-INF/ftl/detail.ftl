<!doctype html>
<html lang="zh-CN">
<head>
    <!-- 必须的 meta 标签 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap 的 CSS 文件 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../raty/jquery.raty.css">
    <title>${book.bookName}</title>
    <script src="../../js/jquery-3.6.0.min.js"></script>
    <script src="../../js/template-web.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../raty/jquery.raty.js"></script>
    <script>
        $("#frmEvaluation").submit(function (e){
            e.preventDefault();
        })
        $(function (){
            $.raty.path = "../../raty/images";
            $(".stars").empty();
            $(".stars").raty({readOnly: true});
        })
        $(function (){
            <#if memberReadState ??>
                $("*[data-read-state='${memberReadState.readState}']").removeClass("btn-primary");
                $("*[data-read-state='${memberReadState.readState}']").addClass("btn-success");
            </#if>
            <#if !loginMember ??>
                $("*[data-read-state],#btnEvaluation,*[data-evaluation-id]").click(function (){
                    $("#exampleModalCenter").modal("show");
                })
            </#if>
            <#if loginMember ??>
                $("*[data-read-state]").click(function (){
                    var readState = $(this).data("read-state");
                    $.post("/update_read_state",{
                        memberId:${loginMember.memberId},
                        bookId:${book.bookId},
                        readState:readState
                    },function (json){
                        if(json.code == "0"){
                            $("*[data-read-state]").removeClass("btn-primary");
                            $("*[data-read-state]").removeClass("btn-success");
                            $("*[data-read-state]").addClass("btn-primary");
                            $("*[data-read-state='" + readState + "']").removeClass("btn-primary");
                            $("*[data-read-state='" + readState + "']").addClass("btn-success");
                        }
                    },"json")
                })
                $("#btnEvaluation").click(function (){
                    $("#score").empty();
                    $("#score").raty({});
                    $("#dlgEvaluation").modal("show");
                })

            $("#btnSubmit").click(function (){
                var score = $("#score").data('raty').score();

                var content = $("textarea[name=content]").val();
                console.log(score);
                console.log(${book.bookId});
                console.log(${loginMember.memberId});
                console.log(content);
                if (score == undefined){
                    console.log("t1:"+score);
                }
                if ($.trim(content == "")){
                    console.log("t2:"+content);
                }
                if (score == undefined || $.trim(content) == ""){
                    return;
                }
                console.log("???");
                $.post("/evaluate",{
                    score:score,
                    bookId:${book.bookId},
                    memberId: ${loginMember.memberId},
                    content:content
                },function (json){
                    console.log(json)
                    if (json.code == "0"){
                        window.location.reload();//刷新当前页面
                    }
                },"json")
            })
            $("*[data-evaluation-id]").click(function (){
                var evaluationId = $(this).data("evaluation-id");
                $.post("/enjoy",{
                    evaluationId:evaluationId
                },function (json){
                    if(json.code == 0){
                        $("*[data-evaluation-id='" + evaluationId +"'] span").text(json.evaluation.enjoy);
                    }
                },"json")
            })
            </#if>
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
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="javascript:;">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
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
<div  class="container mt-2" ><#--style="background-color: #e3f2fd;"-->
    <div class="card mb-2">
        <div class="row no-gutters">
            <div class="col-sm-4 d-flex align-items-center" >
                <img src="${book.cover}" class="img-fluid overflow-hidden rounded" alt="...">
            </div>

            <div class="col-sm-8 tt">
                <div class="card-body">
                <div class="ml-lg-3 ml-xl-3">
                    <div class=" .text-nowrap my-2" >
                        <h3 class="font-weight-bold">${book.bookName}</h3>
                    </div>
                    <div class="alert alert-warning .text-nowrap" role="alert">
                        ${book.subTitle}工程师晋升必学
                    </div>
                    <div class="alert alert-primary yy" role="alert">
                        ${book.author}
                        <div class="row mt-2">
                            <div class="col-6">
                                <button type="button" data-read-state="1" class="btn btn-primary btn-block">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                                    </svg>
                                    想看
                                </button>
                            </div>
                            <div class="col-6">
                                <button type="button" data-read-state="2" class="btn btn-primary btn-block">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                        <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                    </svg>
                                    看过
                                </button>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <span class="h3 mx-3">${book.evaluationScore}</span>
                            <span class="stars" data-score="${book.evaluationScore}"></span>
                        </div>
                        <div class="mt-2 d-flex justify-content-end">
                            <div>${book.evaluationQuantity}人已评</div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
    <div class="alert alert-warning" role="alert">
        <h5 class="font-weight-bold">图书介绍</h5>
        ${book.description}
    </div>
    <div class="alert alert-success d-flex justify-content-between" role="alert">
        <h5 class="font-weight-bold" style="display: inline-block">图书短评</h5>
        <button type="button" class="btn btn-primary" id="btnEvaluation">写评论</button>
    </div>
    <ul class="list-unstyled">
        <#list evaluationList as evaluation>
        <li class="media">
            <img src="../../images/touxiang1.png" class="mr-3" alt="...">
            <div class="media-body">
                <div class="d-flex justify-content-between">
                    <h5 class="mt-0 mb-1">
                        ${evaluation.member.nickname}
                        <small class="text-muted ml-2">${evaluation.createTime?string('MM-dd')}</small>
                        <span class="stars" data-score="${evaluation.score}" style="display: inline-block"></span>
                    </h5>
                    <button type="button" class="btn btn-outline-danger mr-2 " data-evaluation-id="${evaluation.evaluationId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                            <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                        </svg><span>${evaluation.enjoy}</span>
                    </button>
                </div>
                <p>${evaluation.content}</p>
            </div>
        </li>
        </#list>
    </ul>
</div>
<!-- modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tip</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                您需要登录才可以操作哦~
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <a href="/login.html"><button type="button" class="btn btn-primary">去登录</button></a>
            </div>
        </div>
    </div>
</div>

<!-- modal -->
<div class="modal fade" id="dlgEvaluation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">为${book.bookName}写短评</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frmEvaluation">
                    <div class="form-group row">
                        <div class="col-sm-10">
                            <span id="score"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-10">
                            <textarea type="text" name="content" class="form-control" id="content" required></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button id="btnSubmit" type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    /*$(function(){
        $(".yy").height($(".tt").height()*0.5);
        //console.log($(".yy"));
    }
    )*/
</script>
</body>
</html>