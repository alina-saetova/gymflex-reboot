<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <script src="../js/like.js"></script>
    <script src="../js/exercise.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function like(id) {
            document.getElementById("textarea1").value = '';
            var t = "/exercises/" + id + "/like";
            $.ajax({
                url: t,
                success: function (msg) {
                    $('#div_like').html("<button class='like-disable basic' disabled> ♥ </button>");
                    $('#div_like').append("<span id=\"cnt_likes\"> " + msg + " likes</span>");
                }
            });
        }
    </script>
    <title>Упражнение</title>
</head>
<body class="body-with-img">
<#import "includes/footer.ftlh" as macros>
<@macros.nav />
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong>${exercise.name}</strong></h1></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6 mb-4">
                <div class="list-group-item tr">
                    <div class='like' id="div_like">
                        <#if flag == "ok">
                            <button class='like-disable basic' disabled> ♥</button>
                        <#else >
                            <button class='like-toggle basic' onclick="like(${exercise.id})"> ♥</button>
                        </#if>
                        <span id="cnt_likes">${exercise.cnt_likes} likes</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <p class="card-text"><img src="${exercise.photo}" width="780" alt="...">${exercise.info}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="comments">
            <h3 class="title-comments">Комментарии </h3>
            <ul class="media-list" id="comments_cont">
                <!-- Комментарий (уровень 1) -->
                <#list comms as com>
                    <li class="media">
                        <div class="media-left">
                            <a href="#">
                                <img src="${com.user.photo}" class="media-object rounded-circle" alt="...">
                            </a>
                        </div>
                        <div class="media-body">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="author">${com.user.firstName} ${com.user.lastName}</div>
                                    <div class="metadata">
                                        <span class="date">${com.stringDate}</span>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="media-text text-justify">${com.content}</div>
                                </div>
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
            <#if user??>
                <div class="form-group panel-body">
                    <form method="post">
                        <label for="textarea1"><h6>Добавьте комментарий</h6></label>
                        <textarea class="form-control" id="textarea1"></textarea>
                        <script>
                            document.getElementById("textarea1").onkeyup = function () {
                                var x = document.getElementById("textarea1");
                                if (x.value.length > 200) {
                                    x.value = x.value.substring(0, 200);
                                }
                            }
                        </script>
                        <input type="button" class="btn" value="Прокомментировать"
                               onclick="send_comment(${exercise.id})">
                    </form>
                </div>
            <#else>
                <div class="form-group alt">
                    <form action="/signIn">
                        <button class="btn btn-sm btn-comment">Войдите, чтобы прокомментировать</button>
                    </form>
                </div>
            </#if>
        </div>
    </div>
<@macros.footer />
</body>
</html>