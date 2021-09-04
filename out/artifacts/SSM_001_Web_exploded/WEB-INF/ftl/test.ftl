<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../../js/wangEditor.min.js"></script>
</head>
<body>
测试页面
<div>
    <button id="btnRead">读取内容</button>
    <button id="btnWrite">写入内容</button>
</div>
<div id="divEditor" style="width: 800px;height: 600px"></div>
<script>
    var E = window.wangEditor;
    var editor = new E("#divEditor");//完成富文本编辑器初始化
    editor.create();
    document.getElementById("btnRead").onclick = function (){
        var content = editor.txt.html();
        alert(content);
    }
    document.getElementById("btnWrite").onclick = function (){
        var content = "<li style='color:red'>我是<b>新内容</b></li>"
        editor.txt.html(content);

    }
</script>
</body>
</html>