<%--
  Created by IntelliJ IDEA.
  models.User: alina
  Date: 25/10/2019
  Time: 8:39 AM
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
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>Вход</title>
    <script type="text/javascript">
        function check() {
            var login = document.getElementById("loginField").value;
            var password = document.getElementById("passwordField").value;
            var remember = document.getElementById("rem");
            var check = null;
            if (remember.checked == true) {
                check = remember.value;
            }
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText == 0) {
                        //допилить алерт
                        document.getElementById("err").innerHTML = "<p class=\"error\">Введите корректное имя</p>";
                    } else {
                        window.location.href = "/profile"
                    }
                }
            };
            xmlhttp.open("POST", "/login", true);
            xmlhttp.setRequestHeader("Content-Type",
                "application/x-www-form-urlencoded");
            xmlhttp.send("login=" + login + "&password=" + password + "&remember=" + check);
        }
    </script>
</head>
<body class="body-with-img">
<%@include file="includes/nav.jsp" %>
<div class="container type1">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card log-in-card">
            <div class="card-header">
                <h3><strong>Вход</strong></h3>
            </div>
            <div class="card-body">
                <form action="" method="post">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Логин" id="loginField" name="login">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" placeholder="Пароль" id="passwordField"
                               name="password">
                    </div>
                    <div class="row align-items-center remember">
                        <input type="checkbox" name="remember" id="rem" value="check">Запомнить меня
                    </div>
                    <hr>
                    <div>
                        <a href="/registration" class="a_reg">Регистрация</a>
                        <input type="button" value="Войти" class="btn float-right" onclick="check()">
                    </div>
                </form>
                <div id="err"></div>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
