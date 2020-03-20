<%--
  Created by IntelliJ IDEA.
  User: alina
  Date: 12/11/2019
  Time: 7:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/css/styles.css" type="text/css">
    <title>GymFlex</title>
</head>
<body class="start-body">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <a class="navbar-brand" href="/main">GymFlex</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/exercises_section">Упражнения</a></li>
                <li class="nav-item"><a class="nav-link" href="/trainings_section">Тренировки</a></li>
                <li class="nav-item"><a class="nav-link" href="/calculator">Расчет калорий</a></li>
                <li class="nav-item"><a class="nav-link" href="/create_training_one">Создать тренировку</a></li>
                <li class="nav-item"><a class="nav-link" href="/profile">Профиль</a></li>
            </ul>
        </div>
    </nav>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('../static/css/img/img3.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="display-4">Сила воли</h2>
                    <!-- <p class="lead">This is a description for the first slide.</p>-->
                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('../static/css/img/img2.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="display-4">Сила духа</h2>
                </div>
            </div>
            <div class="carousel-item" style="background-image: url('../static/css/img/img1.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="display-4">Мотивация</h2>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>
<div class="container">
    <h1 class="my-4">
        <small>Последние добавленные тренировки</small>
    </h1>
    <div class="row">
        <c:forEach var="tr" items="${trainings}">
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="/training?id=${tr.getId()}"><img class="card-img-top" src="${tr.getPhoto()}" alt=""
                                                              height="200"></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="/training?id=${tr.getId()}">${tr.getName()}</a>
                        </h4>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <h1 class="my-4">
        <small>Последние добавленные упражнения</small>
    </h1>
    <div class="row">
        <c:forEach var="ex" items="${exercises}">
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="/exercise?id=${ex.getId()}"><img class="card-img-top" src="${ex.getPhoto()}" alt=""
                                                              height="200"></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="/exercise?id=${ex.getId()}">${ex.getName()}</a>
                        </h4>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
