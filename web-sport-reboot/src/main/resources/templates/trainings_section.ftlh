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
    <title><@spring.message 'trainings.page.trainings'/></title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function get() {
            var g = document.getElementById("gender2-select");
            var gender = g.options[g.selectedIndex].value;
            var p = document.getElementById("purpose-select");
            var purpose = p.options[p.selectedIndex].value;
            var l = document.getElementById("place-select");
            var location = l.options[l.selectedIndex].value;
            $.ajax({
                url: "/trainings/search",
                data: {
                    "gender": gender,
                    "purpose": purpose,
                    "location": location
                },
                dataType: "json",
                success: function (msg) {
                    if (msg.length > 0) {
                        $("#resptext").html("");
                        for (var i = 0; i < msg.length; i++) {
                            $("#resptext").append("<div class=\"col-lg-6 col-sm-6 mb-4\">\n" +
                                "                                <div class=\"card h-100\">\n" +
                                "                                    <a href=\"#\"><img class=\"card-img-top\" src=\"" + msg[i].photo + "\" alt=\"\" height=\"200\"></a>\n" +
                                "                                    <div class=\"card-body\">\n" +
                                "                                        <h4 class=\"card-title\">\n" +
                                "                                            <a href=\"/trainings/" + msg[i].id + "\">" + msg[i].name + "</a>\n" +
                                "                                        </h4>\n" +
                                "                                        <div class='like'>\n" +
                                "                                            <button class='like-disable'> ♥</button>\n" +
                                "                                            <span>" + msg[i].cnt_likes + " <@spring.message 'trainings.page.likes'/></span>\n" +
                                "                                        </div>\n" +
                                "                                    </div>\n" +
                                "                                </div>\n" +
                                "                            </div>");
                        }
                    } else {
                        $("#resptext").html("<@spring.message 'trainings.page.results'/>");
                    }
                }
            })
        }
    </script>
</head>
<body class="body body-with-img">
<#import "footer.ftlh" as macros>
<@macros.nav />
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong><@spring.message 'trainings.page.trainings'/></strong></h1></div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
                <form method="post" id="muscle_select">
                    <div class="list-group form-group">
                        <div class="list-group-item tr">
                            <select class="custom-select" id="gender2-select" name="gender">
                                <option selected disabled><@spring.message 'trainings.page.gender'/></option>
                                <option value="male"><@spring.message 'trainings.page.gender.male'/></option>
                                <option value="female"><@spring.message 'trainings.page.gender.female'/></option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <select class="custom-select" id="purpose-select" name="purpose">
                                <option selected disabled><@spring.message 'trainings.page.purpose'/></option>
                                <option value="pohudenie"><@spring.message 'trainings.page.purpose.lose'/></option>
                                <option value="podderjanie"><@spring.message 'trainings.page.purpose.maintenance'/></option>
                                <option value="massa"><@spring.message 'trainings.page.purpose.gain'/></option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <select class="custom-select" id="place-select" name="location">
                                <option selected disabled><@spring.message 'trainings.page.location'/></option>
                                <option value="home"><@spring.message 'trainings.page.location.home'/></option>
                                <option value="gym"><@spring.message 'trainings.page.location.gym'/></option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <input type="button" class="btn" value="<@spring.message 'trainings.page.select'/>" onclick="get()">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-8 col-sm-12" style="height: auto; min-height: 700px;">
                <div class="row" id="resptext" style="height: auto;">
                    <#if alltrainings??>
                        <#list alltrainings as tr>
                            <div class="col-lg-6 col-sm-6 mb-4">
                                <div class="card h-100">
                                    <img class="card-img-top" src="${tr.photo}" alt="" height="200">
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="/trainings/${tr.id}">${tr.name}</a>
                                        </h4>
                                        <div class='like'>
                                            <button class='like-disable'> ♥</button>
                                            <span>${tr.cnt_likes} <@spring.message 'trainings.page.likes'/></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>