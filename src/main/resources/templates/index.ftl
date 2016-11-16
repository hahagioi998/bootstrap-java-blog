<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>brucege's blog</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">
    <link href="/css/search.css" rel="stylesheet">
    <link href="/css/markdown.css" rel="stylesheet">
</head>
<body>
<#include "header.ftl">
<div class="container">

    <div class="row">
        <div class="col-sm-8 .col-md-8 blog-main">
        <#--<div>-->
        <#--<h1><a href="/">&lt;Bruce ge&gt</a></h1>-->
        <#--</div>-->
        <#--adddata to this position-->
        <#list contents as co>
            <div class="blog-post">
                <h3><a href="/getArticle/${co.id}">${co.title}</a></h3>
            <p class="blog-post-meta">${co.startDate}
                <#if admin??>
                    <a href="/edit/${co.id}">[编辑]</a>
                    <a href="/delete/${co.id}">[删除]</a></p>
                </#if>
                <div class="nima">
                ${co.content}
                </div>
            </div>
            <#if admin??>

            </#if>
        </#list>
            <nav>
                <ul class="pager">
                <#if previousLink??>
                    <li id="previous"><a href="${previousLink}">Previous</a></li>
                </#if>
                <#if nextLink??>
                    <li id="next"><a href="${nextLink}">Next</a></li>
                </#if>
                </ul>
            </nav>
        </div>


    </div>
</div>
<#include "footer.ftl">
<script type="text/javascript">
    function validate() {
        //If the form value is "" (nothing)
        if (document.getElementById("query").value == "") {
            return false; //Stop the form from submitting
        }
        return true;
    }
</script>
<script src="/js/jquery-3.1.1.min.js"></script>
</body>
</html>