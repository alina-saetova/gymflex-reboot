<%--
  Created by IntelliJ IDEA.
  models.User: alina
  Date: 25/10/2019
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/css/styles.css" type="text/css">
    <script src="../static/css/js/like.js"></script>
    <script src="../static/css/js/training.js"></script>
    <script type="text/javascript">
        function like(id) {
            document.getElementById("textarea1").value = '';
            $.ajax({
                type: "POST",
                url: "/like_article",
                data: {
                    type: "training",
                    training_id: id
                },
                success: function (msg) {
                    $('#div_like').html("<button class='like-disable basic' disabled> ♥ </button>");
                    $('#div_like').append("<span id=\"cnt_likes\">" + msg.toString() + "likes</span>");
                }
            });
        }
    </script>
    <title>Тренировка</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
</head>
<body class="body-with-img">
<%@include file="includes/nav.jsp" %>
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-sm-10"><h1 class="my-4"><strong>${training.getName()}</strong></h1></div>
    </div>
    <div class="row">
        <div class="col-lg-4 col-sm-6 mb-4">
            <div class="list-group-item tr">
                <div class='like' id="div_like">
                    <c:if test="${flag.equals('true')}">
                        <button class='like-disable basic' disabled> ♥</button>
                    </c:if>
                    <c:if test="${flag.equals('false')}">
                        <button class='like-toggle basic' onclick="like(${training.getId()})"> ♥</button>
                    </c:if>
                    <span id="cnt_likes">${training.getCnt_likes()} likes</span>
                </div>
            </div>
            <c:forEach var="ex" items="${exercises}">
                <div class="list-group-item tr">
                    <a href="/exercise?id=${ex.getId()}" class="list-group-item col-sm-12">${ex.getName()}</a>
                </div>
            </c:forEach>
        </div>
        <div class="col-lg-8 col-sm-12">
            <div class="card">
                <div class="card-body">
                    <p class="card-text"><img src="${training.getPhoto()}" width="685" alt="...">${training.getInfo()}
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
            <c:forEach var="com" items="${comms}">
                <li class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object rounded-circle" src="${com.getUser().getPhoto()}" alt="...">
                        </a>
                    </div>
                    <div class="media-body">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="author">${com.getUser().getFirstName()} ${com.getUser().getLastName()}</div>
                                <div class="metadata">
                                    <span class="date">${com.getDateString()}</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="media-text text-justify">${com.getContent()}</div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <c:if test="${user != null}">
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
                           onclick="send_comment(${training.getId()})">
                        <%--                    <jsp:include page="includes/btn_send_comment.jsp" >--%>
                        <%--                        <jsp:param name="type" value="${training.getId()}"/>--%>
                        <%--                    </jsp:include>--%>
                </form>
            </div>
        </c:if>
        <c:if test="${user == null}">
            <div class="form-group alt">
                <form action="/login">
                    <button class="btn btn-sm btn-comment">Войдите, чтобы прокомментировать</button>
                </form>
            </div>
        </c:if>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
