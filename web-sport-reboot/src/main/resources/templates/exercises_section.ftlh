<!doctype html>
<html lang="ru">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <script src="../js/like.js"></script>
    <title><@spring.message 'exercises.section.page.exercises'/></title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function search(page) {
            var s = document.getElementById("size-select");
            var size = s.options[s.selectedIndex].value;
            if ($("#input_query").val().length >= 3) {
                $.ajax({
                    url: "/exercises/search",
                    data: {
                        "query": $("#input_query").val(),
                        "page": page - 1,
                        "size": size
                    },
                    dataType: "json",
                    success: function (msg) {
                        if (msg.exercises.length > 0) {
                            $("#resptext").html("");
                            $("#pages-button-spawn").html("");
                            for (var i = 0; i < msg.exercises.length; i++) {
                                $("#resptext").append("<div class=\"col-lg-4 col-sm-6 mb-4\">\n" +
                                    "                                <div class=\"card h-100\">\n" +
                                    "                                    <a href=\"#\"><img class=\"card-img-top\" src=\"" + msg.exercises[i].photo + "\" alt=\"\" height=\"160\"></a>\n" +
                                    "                                    <div class=\"card-body\">\n" +
                                    "                                        <h5 class=\"card-title\">\n" +
                                    "                                            <a href=\"/exercises/" + msg.exercises[i].id + "\">" + msg.exercises[i].name + "</a>\n" +
                                    "                                        </h5>\n" +
                                    "                                        <div class='like'>\n" +
                                    "                                            <button class='like-disable'> ♥</button>\n" +
                                    "                                            <span>" + msg.exercises[i].cnt_likes + " <@spring.message 'exercises.section.page.likes'/></span>\n" +
                                    "                                        </div>\n" +
                                    "                                    </div>\n" +
                                    "                                </div>\n" +
                                    "                            </div>");
                            }
                            for (var i = 1; i <= msg.count; i++) {
                                $("#pages-button-spawn").append("<button class='like-disable' onclick=\"search(" + i + ")\"> " + i + "</button>");
                            }
                        } else {
                            $("#resptext").html("<@spring.message 'exercises.section.page.no.results'/>");
                        }
                    }
                })
            }
        }
    </script>
</head>
<body class="body-with-img">
<#import "footer.ftlh" as macros>
<@macros.nav />
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong><@spring.message 'exercises.section.page.exercises'/></strong></h1></div>
        </div>
        <div class="row" style="min-height: 700px;">
            <div class="col-lg-3 col-sm-6 mb-4">
                <div class="list-group form-group">
                    <div class="card-header">
                        <h4><strong><@spring.message 'exercises.section.page.searching'/></strong></h4>
                    </div>
                    <input type="text" id="input_query"/>
                    <br>
                    <select class="custom-select" id="size-select" name="size">
                        <option selected disabled><@spring.message 'exercises.section.page.size'/></option>
                        <option value=2>2</option>
                        <option value=3>3</option>
                        <option value=5>5</option>
                        <option value=10>10</option>
                        <option value=20>20</option>
                    </select>
                    <div class="list-group-item tr">
                        <input type="button" id="sendreq" class="btn" value="<@spring.message 'exercises.section.page.search'/>" onclick="search(1)"/>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-sm-12">
                <div class="row" id="resptext">
                    <#list allexercises as ex>
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="${ex.photo}" alt=""
                                                 height="160"></a>
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="/exercises/${ex.id}">${ex.name}</a>
                                    </h5>
                                    <div class='like'>
                                        <button class='like-disable'> ♥</button>
                                        <span>${ex.cnt_likes} <@spring.message 'exercises.section.page.likes'/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
            <div id="pages-button-spawn">
                <button class='like-disable' onclick="search(1)"> 1</button>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>