<%--
  Created by IntelliJ IDEA.
  models.User: alina
  Date: 17/10/2019
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/css/styles.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>Регистрация</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
</head>
<body class="body-with-img">
<%@include file="includes/nav.jsp" %>
<div class="container type2">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card">
            <div class="card-header">
                <h3><strong>Регистрация</strong></h3>
            </div>
            <div class="card-body">
                <form method="post" id="log_on_form" enctype="multipart/form-data">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                        </div>
                        <input type="text" id="name" name="first_name" class="form-control" placeholder="Имя">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                        </div>
                        <input type="text" id="surname" name="last_name" class="form-control" placeholder="Фамилия">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="login" name="login" class="form-control" placeholder="Логин">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Пароль">
                    </div>
                    <div class="reg_pass_err"></div>
                    <div class="form-group">
                        <input type="file" id="filebutton" name="photo" class="input-file">
                    </div>
                    <hr>
                    <div>
                        <input type="submit" value="Зарегистрироваться" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            <div class="form-card" id="err">
            </div>
            <script>
                $(document).ready(function () {
                    $('#log_on_form').submit(function (e) {
                        e.preventDefault();
                        var form = this;
                        var login = $('#login').val();
                        var password = $('#password').val();
                        var name = $('#name').val();
                        var surname = $('#surname').val();
                        $(".error").remove();
                        //от 2 до 20. первая - буква, потом буквы или цифры
                        var regEx1 = /^[a-zA-Z][a-zA-Z0-9-_.]{2,20}$/;
                        //первая буква, потом буквы или цифры
                        var regEx2 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/;
                        //с большой буквы
                        var regex3 = /^[A-ZА-Я][a-zA-Zа-яА-Я]+$/;
                        var validName = regex3.test(name);
                        var validSurname = regex3.test(surname);
                        var validLogin = regEx1.test(login);
                        var validPassword = regEx2.test(password);
                        if (!validName) {
                            $("#err").append('<p class="error">Введите корректное имя</p>');
                        }
                        if (!validSurname) {
                            $("#err").append('<p class="error">Введите корректную фамилию</p>');
                        }
                        if (!validLogin) {
                            $("#err").append('<p class="error">Введите корректный логин</p>');
                        }
                        if (!validPassword) {
                            $("#err").append('<p class="error">Введите корректный пароль</p>');
                        }
                        if (validName && validSurname && validLogin && validPassword) {
                            form.submit();
                        }
                    });
                });
            </script>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
