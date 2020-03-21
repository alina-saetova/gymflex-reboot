<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <script src="../js/like.js"></script>
    <title>Упражнения</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function fun() {
            var s = document.getElementById("muscula-select");
            var muscle = s.options[s.selectedIndex].value;
            $.ajax({
                url: "/exercises/search",
                data: {
                    "muscle": muscle
                },
                dataType: "json",
                success: function (msg) {
                    if (msg.length > 0) {
                        $("#resptext").html("");
                        for (var i = 0; i < msg.length; i++) {
                            $("#resptext").append("<div class=\"col-lg-4 col-sm-6 mb-4\">\n" +
                                "                                <div class=\"card h-100\">\n" +
                                "                                    <a href=\"#\"><img class=\"card-img-top\" src=\"" + msg[i].photo + "\" alt=\"\" height=\"160\"></a>\n" +
                                "                                    <div class=\"card-body\">\n" +
                                "                                        <h5 class=\"card-title\">\n" +
                                "                                            <a href=\"/exercise?id=" + msg[i].id + "\">" + msg[i].name + "</a>\n" +
                                "                                        </h5>\n" +
                                "                                        <div class='like'>\n" +
                                "                                            <button class='like-disable'> ♥</button>\n" +
                                "                                            <span>" + msg[i].cnt_likes + " likes</span>\n" +
                                "                                        </div>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                            </div>");
                        }
                    } else {
                        $("#resptext").html("No results..");
                    }
                }
            })
        }
    </script>
</head>
<body class="body-with-img">
<#import "includes/footer.ftlh" as macros>
<@macros.nav />
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong>Упражнения</strong></h1></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6 mb-4">
                <div class="list-group form-group">
                    <form method="post" id="muscle_select">
                        <div class="list-group-item tr">
                            <select class="custom-select" id="muscula-select" name="muscle">
                                <option selected disabled>Мышцы</option>
                                <option value="shoulders">Плечи</option>
                                <option value="arms">Руки</option>
                                <option value="chest">Грудь</option>
                                <option value="back">Спина</option>
                                <option value="abdominals">Пресс</option>
                                <option value="butt">Ягодицы</option>
                                <option value="legs">Ноги</option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <input type="button" id="sendreq" class="btn" value="Подобрать" onclick="fun()">
                        </div>
                    </form>
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
                                            <a href="/exercise?id=${ex.id}">${ex.name}</a>
                                        </h5>
                                        <div class='like'>
                                            <button class='like-disable'> ♥</button>
                                            <span>${ex.cnt_likes} likes</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#list>
                </div>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>