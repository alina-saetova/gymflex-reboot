<%--
  Created by IntelliJ IDEA.
  models.User: alina
  Date: 25/10/2019
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head lang="ru">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../static/css/styles.css">
    <script src="../../web/WEB-INF/js/like.js"></script>
    <title>Тренировки</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        function get() {
            $.ajax({
                type: "POST",
                url: "/trainings_section",
                data: $('#muscle_select').serialize(),
                dataType: "json",
                success: function (msg) {
                    if (msg.objects.length > 0) {
                        $("#resptext").html("");
                        for (var i = 0; i < msg.objects.length; i++) {
                            $("#resptext").append("<div class=\"col-lg-6 col-sm-6 mb-4\">\n" +
                                "                                <div class=\"card h-100\">\n" +
                                "                                    <a href=\"#\"><img class=\"card-img-top\" src=\"" + msg.objects[i].photo + "\" alt=\"\" height=\"200\"></a>\n" +
                                "                                    <div class=\"card-body\">\n" +
                                "                                        <h4 class=\"card-title\">\n" +
                                "                                            <a href=\"/training?id=" + msg.objects[i].id + "\">" + msg.objects[i].name + "</a>\n" +
                                "                                        </h4>\n" +
                                "                                        <div class='like'>\n" +
                                "                                            <button class='like-disable'> ♥</button>\n" +
                                "                                            <span>" + msg.objects[i].cnt_likes + " likes</span>\n" +
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
<body class="body body-with-img">
<main>
    <%@include file="includes/nav.jsp" %>
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong>Тренировки</strong></h1></div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
                <form method="post" id="muscle_select">
                    <div class="list-group form-group">
                        <div class="list-group-item tr">
                            <select class="custom-select" id="gender2-select" name="gender">
                                <option selected disabled>Пол</option>
                                <option value="male">Муж</option>
                                <option value="female">Жен</option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <select class="custom-select" id="purpose-select" name="purpose">
                                <option selected disabled>Цель</option>
                                <option value="pohudenie">Похудение</option>
                                <option value="podderjanie">Поддержание веса</option>
                                <option value="massa">Набор массы</option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <select class="custom-select" id="place-select" name="location">
                                <option selected disabled>Место</option>
                                <option value="home">Дома</option>
                                <option value="gym">В зале</option>
                            </select>
                        </div>
                        <div class="list-group-item tr">
                            <input type="button" class="btn" value="Подобрать" onclick="get()">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-8 col-sm-12">
                <div class="row" id="resptext">
                    <c:if test="${alltrainings != null}">
                        <c:forEach var="tr" items="${alltrainings}">
                            <div class="col-lg-6 col-sm-6 mb-4">
                                <div class="card h-100">
                                    <img class="card-img-top" src="${tr.getPhoto()}" alt="" height="200">
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="/training?id=${tr.getId()}">${tr.getName()}</a>
                                        </h4>
                                        <div class='like'>
                                            <button class='like-disable'> ♥</button>
                                            <span>${tr.getCnt_likes()} likes</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="includes/footer.jsp" %>
</body>
</html>
