<!doctype html>
<html lang="en">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <script src="../js/like.js"></script>
    <script src="../js/exercise.js"></script>
    <script type="text/javascript">
        function like(id) {
            document.getElementById("textarea1").value = '';
            var t = "/trainings/" + id + "/like";
            $.ajax({
                url: t,
                success: function (msg) {
                    $('#div_like').html("<button class='like-disable basic' disabled> ♥ </button>");
                    $('#div_like').append("<span id=\"cnt_likes\">" + msg + " <@spring.message 'training.page.likes'/></span>");
                }
            });
        }
    </script>
    <title><@spring.message 'training.page.training'/></title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
</head>
<body class="body-with-img">
<#import "footer.ftlh" as macros>
<@macros.nav />
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-sm-10"><h1 class="my-4"><strong>${training.name}</strong></h1></div>
    </div>
    <div class="row">
        <div class="col-lg-4 col-sm-6 mb-4">
            <div class="list-group-item tr">
                <div class='like' id="div_like">
                    <#if flag == "disable">
                        <button class='like-disable basic' disabled> ♥</button>
                    <#else >
                        <button class='like-toggle basic' onclick="like(${training.id})"> ♥</button>
                    </#if>
                    <span id="cnt_likes">${training.cnt_likes} <@spring.message 'training.page.likes'/></span>
                </div>
            </div>
            <#list exercises as ex>
                <div class="list-group-item tr">
                    <a href="/exercises/${ex.id}" class="list-group-item col-sm-12">${ex.name}</a>
                </div>
            </#list>
        </div>
        <div class="col-lg-8 col-sm-12">
            <div class="card">
                <div class="card-body">
                    <p class="card-text"><img src="${training.photo}" width="685" alt="...">${training.info}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="comments">
        <h3 class="title-comments"><@spring.message 'training.page.commentaries'/> </h3>
        <ul class="media-list" id="comments_cont">
            <#list comms as com>
                <li class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object rounded-circle" src="${com.user.photo}" alt="...">
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
                    <label for="textarea1"><@spring.message 'training.page.add.commentary'/></label>
                    <textarea class="form-control" id="textarea1"></textarea>
                    <script>
                        document.getElementById("textarea1").onkeyup = function () {
                            var x = document.getElementById("textarea1");
                            if (x.value.length > 200) {
                                x.value = x.value.substring(0, 200);
                            }
                        }
                    </script>
                    <input type="button" class="btn" value="<@spring.message 'training.page.comment'/>"
                           onclick="send_comment('training', ${training.id})">
                </form>
            </div>
        <#else>
            <div class="form-group alt">
                <form action="/signIn">
                    <button class="btn btn-sm btn-comment"><@spring.message 'training.page.enter'/></button>
                </form>
            </div>
        </#if>
    </div>
</div>
<@macros.footer />
</body>
</html>
