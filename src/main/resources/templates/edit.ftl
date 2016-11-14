<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Blog Template for Bootstrap</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">
    <link href="/css/bootstrap-markdown.min.css" rel="stylesheet">
</head>
<body>
<#include "header.ftl">
<input type="hidden" id="source_id" value="${source_id}">
<div class="container">
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <div>
                    <label for="tilte">title:</label>
                    <input type="text" class="form-control" id="source_title" value="${title}">
                </div>
                <label for="source">source:</label>
                <div class="md-header btn-toolbar">
                    <div class="btn-group">
                        <button class="btn-default btn-sm btn" type="button" title="Bold (Ctrl+B)" tabindex="1"><span
                                class="glyphicon glyphicon-bold"></span></button>
                        <button class="btn-default btn-sm btn" type="button" title="Italic (Ctrl+I)" tabindex="2"><span
                                class="glyphicon glyphicon-italic"></span></button>
                        <button class="btn-default btn-sm btn" type="button" title="Heading (Ctrl+H)" tabindex="3"><span
                                class="glyphicon glyphicon-header"></span></button>
                    </div>
                    <div class="btn-group">
                        <button class="btn-default btn-sm btn" type="button" title="URL/Link (Ctrl+L)" tabindex="4">
                            <span class="glyphicon glyphicon-link"></span>
                        </button>
                    <#--link button modal-->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <label for="tilte">url:</label>
                                        <input class="form-group" id="link_url" type="text"/>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" id="link_save">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button class="btn-default btn-sm btn" type="button" title="Image (Ctrl+G)" tabindex="5"><span
                                class="glyphicon glyphicon-picture"></span></button>
                    <#--modal for image-->
                        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <form id="form" enctype="multipart/form-data" role="form">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="tilte">url:</label>
                                                <input class="form-control" id="image_link" name="image_link"
                                                       type="text"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="tilte">title(optional):</label>
                                                <input class="form-control" name="image_title" id="image_title"
                                                       type="text"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputFile">File input</label>
                                                <input type="file" name="image_file" id="image_file"/>
                                            </div>

                                            <div>
                                                <label for="image_width">image width(optional):</label>
                                                <input type="text" name="image_width" id="image_width"/>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" id="image_save">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group">
                        <button class="btn-default btn-sm btn" type="button" title="Unordered List (Ctrl+U)"
                                tabindex="6"><span class="glyphicon glyphicon-list"></span></button>
                        <button class="btn-default btn-sm btn" type="button" title="Ordered List (Ctrl+O)" tabindex="7">
                            <span class="glyphicon glyphicon-th-list"></span></button>
                        <button class="btn-default btn-sm btn" type="button" title="Code (Ctrl+K)" tabindex="8"><span
                                class="glyphicon glyphicon-asterisk"></span></button>
                        <button class="btn-default btn-sm btn" type="button" title="Quote (Ctrl+Q)" tabindex="9"><span
                                class="glyphicon glyphicon-comment"></span></button>
                    </div>
                </div>

                <textarea class="form-control" rows="20" id="source">${source_content}</textarea>
            </div>
            <button type="button" class="btn btn-default navbar-btn" id="savebutton">保存</button>
        </div>

        <div class="col-sm-2">
        </div>

        <div class="col-sm-5">
            <label for="source">output:</label>
            <div id="output">

            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery-3.1.1.min.js"></script>
<script src="/js/showdown.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        var converter = new showdown.Converter();
        refresh();
        $("#source").keyup(function () {
            refresh()
        })

        function refresh() {
            var text = $("#source").val();
            var html = converter.makeHtml(text);
            html = "<h2>" + $("#source_title").val() + "</h2>" + html;
            $("#output").html(html)
        }

        $("#source_title").keyup(function () {
            refresh()
        })

        $("#source").keydown(function (e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode == 9) {
                e.preventDefault();
                var start = $(this).get(0).selectionStart;
                var end = $(this).get(0).selectionEnd;

                // set textarea value to: text before caret + tab + text after caret
                $(this).val($(this).val().substring(0, start)
                        + "\t"
                        + $(this).val().substring(end));

                // put caret at right position again
                $(this).get(0).selectionStart =
                        $(this).get(0).selectionEnd = start + 1;
            }
        })

        $("#savebutton").click(function () {
            var title = $("#source_title").val();
            var text = $("#source").val();
            console.log(title)
            console.log(text);
//            send ajax request to save the content.
            $.ajax({
                url: "/editContent",
                data: {
                    title: title,
                    sourceContent: text,
                    id:$("#source_id").val()
                },
                type: "POST",
                dataType: "json",
            }).done(function (json) {
                console.log(json);
                window.location.href = "/";
            })
        })

        function dealWithB(com, start, end) {
            if (start == end) {
                com.val(com.val().substring(0, start) + "****" + com.val().substring(end));
                com.prop("selectionStart", start + 2);
                com.prop("selectionEnd", start + 2);
            } else {
                com.val(com.val().substring(0, start) + "**" + com.val().substring(start, end) + "**" + com.val().substring(end));
                com.prop("selectionStart", start + 2);
                com.prop("selectionEnd", end + 2);
            }
        }

        function dealwithI(com, start, end) {
            if (start == end) {
                com.val(com.val().substring(0, start) + "**" + com.val().substring(end));
                com.prop("selectionStart", start + 1);
                com.prop("selectionEnd", start + 1);
            } else {
                com.val(com.val().substring(0, start) + "*" + com.val().substring(start, end) + "*" + com.val().substring(end));
                com.prop("selectionStart", start + 1);
                com.prop("selectionEnd", end + 1);
            }
        }

        function dealwithHead(com, start, end) {
            if (start == end) {
                com.val(com.val().substring(0, start) + "######" + com.val().substring(end));
                com.prop("selectionStart", start + 3);
                com.prop("selectionEnd", start + 3);
            } else {
                com.val(com.val().substring(0, start) + "###" + com.val().substring(start, end) + "###" + com.val().substring(end));
                com.prop("selectionStart", start + 3);
                com.prop("selectionEnd", end + 3);
            }
        }

        $("#link_url").keydown(function (e) {
            if (event.keyCode == 13) {
                dealWithLink();
            }
        })

        $("#link_save").click(function () {
            dealWithLink();
        })

        $('#myModal').on('hidden.bs.modal', function (e) {
            var com = $('#source');
            com.focus();
        })

        $('#imageModal').on('hidden.bs.modal', function (e) {
            var com = $('#source');
            com.focus();
        })

        $('#imageModal').on('shown.bs.modal', function (e) {
            $("#image_file").val("");
            $("#image_link").val("http://");
            $("#image_link").focus();
            $("#image_link").prop("selectionStart", 8);
        })

        $('#myModal').on('shown.bs.modal', function (e) {
            $("#link_url").val("http://");
            $("#link_url").focus();
            $("#link_url").prop("selectionStart", 8);
        })

        function dealWithImage(response) {
            var url = response;
            $("#imageModal").modal('hide');
            var com = $('#source');
            var start = com.prop("selectionStart");
            var end = com.prop("selectionEnd");
            var width = $('#image_width').val();

            var text = '![' + $("#image_title").val() + ']' + '(' + url ;
            if(!isNaN(width)){
                text += ' ='+width+'x*'+')';
            } else {
                text+=')';
            }
            var c = text.length;
            com.val(com.val().substring(0, end) + text + com.val().substring(end));
            com.prop("selectionStart", end);
            com.prop("selectionEnd", end + c);
            refresh();
        }

        $('#form').submit(function (e) {
            if ($("#image_file").get(0).files.length == 0) {
                //shall use with value of url
                dealWithImage($("#image_link").val());
                e.preventDefault();
                return;
            }
            var form = $(this);
            var formdata = false;
            if (window.FormData) {
                formdata = new FormData(form[0]);
            }
            var formAction = form.attr('action');
            $.ajax({
                type: 'POST',
                url: 'uploadImage',
                cache: false,
                data: formdata ? formdata : form.serialize(),
                contentType: false,
                processData: false,

                success: function (response) {
                    if (response != 'error') {
                        console.log(response);
                        dealWithImage(response);
                    } else {
                        alert('nimabi buxing');
                    }
                }
            });
            e.preventDefault();
        })

        function dealWithLink() {
            var url = $("#link_url").val();
            $("#myModal").modal('hide');
            var com = $('#source');
            var start = com.prop("selectionStart");
            var end = com.prop("selectionEnd");
            var text = '[' + url + ']' + '(' + url + ')';
            var c = text.length;
            com.val(com.val().substring(0, end) + text + com.val().substring(end));
            com.prop("selectionStart", end);
            com.prop("selectionEnd", end + c);
            refresh();
        }

        function dealWithUnOrder(com, start, end) {
            if (end == 0) {
                com.val("- ");
                com.prop("selectionStart", end + 2);
                com.prop("selectionEnd", end + 2);
            } else {
                com.val(com.val().substring(0, end) + "\n-" + " " + com.val().substring(end));
                com.prop("selectionStart", end + 3);
                com.prop("selectionEnd", end + 3);
            }
        }

        function dealWithOrder(com, start, end) {
            if (end == 0) {
                com.val("1. ");
                com.prop("selectionStart", end + 3);
                com.prop("selectionEnd", end + 3);
            } else {
                com.val(com.val().substring(0, end) + "\n1." + " " + com.val().substring(end));
                com.prop("selectionStart", end + 4);
                com.prop("selectionEnd", end + 4);
            }
        }

        function dealWithQuote(com, start, end) {
            if (end == 0) {
                com.val("> ");
                com.prop("selectionStart", end + 2);
                com.prop("selectionEnd", end + 2);
            } else {
                com.val(com.val().substring(0, end) + "\n>" + " " + com.val().substring(end));
                com.prop("selectionStart", end + 3);
                com.prop("selectionEnd", end + 3);
            }
        }

        function dealWithCode(com, start, end) {
            if (start == end) {
                com.val(com.val().substring(0, start) + "``" + com.val().substring(end));
                com.prop("selectionStart", start + 1);
                com.prop("selectionEnd", start + 1);
                return;
            } else {
                if(start!=0){
                    var c = com.val().charAt(start-1);
                    if(c!=" "&&c!="\n"&&c!="\t"){
                        com.val(com.val().substring(0,start)+"`"+com.val().substring(start,end)+"`"+com.val().substring(end));
                        com.prop("selectionStart", start + 1);
                        com.prop("selectionEnd", end + 1);
                        return;
                    }
                }
                //other situation just use \t.
                var begin = com.val().substring(0,start);
                var endtext = com.val().substring(end);
                var ss = com.val().substring(start,end)
                var sslater = "\n\t";
//                最好ss的开头是一个字符
                for(var x = 0;x<ss.length;x++){
                    sslater+=ss[x];
                    if(ss[x]=='\n'&&x!=ss.length-1){
                        sslater+="\t"
                    }
                }
                com.val(begin+sslater+endtext);
                com.prop("selectionStart", start+sslater.length);
                com.prop("selectionEnd", start+sslater.length);

            }

        }

        $(".btn-default.btn-sm.btn").click(function () {
            var message = $(this).attr('tabindex');
            var com = $('#source');
            var start = com.prop("selectionStart");
            var end = com.prop("selectionEnd");
            if (message == 1) {
                //the rest is much the same.
                dealWithB(com, start, end);
            } else if (message == 2) {
                dealwithI(com, start, end);
            } else if (message == 3) {
                dealwithHead(com, start, end);
            } else if (message == 4) {
                //the link //need to output the modal.
//                dealWithLink(com,start,end);
                $('#myModal').modal({
                    keyboard: true
                })
                return;
            } else if (message == 5) {
                $('#imageModal').modal({
                    keyboard: true
                })
                return;
            } else if (message == 6) {
                dealWithUnOrder(com, start, end);
            } else if (message == 7) {
                dealWithOrder(com, start, end);
            } else if (message == 9) {
                dealWithQuote(com, start, end);
            } else if (message == 8) {
                dealWithCode(com, start, end);
            }
            com.focus();
            refresh();
        })
    })
</script>
<body>
</body>

</html>