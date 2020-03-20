<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>Вход</title>
    <script type="text/javascript">
        function check() {
            var remember = document.getElementById("rem");
            var check = null;
            if (remember.checked == true) {
                check = remember.value;
            }

            $.ajax({
                url: "/signIn/auth",
                data: {
                    "email": $("#emailField").val(),
                    "password": $("#passwordField").val(),
                    "remember": check
                },
                success: function (msg) {
                    alert(msg);
                    if (msg.toString() == "error") {
                        $("#err").html("<p class=\"error\">Введите корректные данные</p>")
                    } else {
                        window.location.href = "/profile"
                    }
                }
            })
        }
    </script>
</head>
<body class="body-with-img">
    <#import "includes/footer.ftlh" as macros>
    <@macros.nav />
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
                            <input type="text" class="form-control" placeholder="Логин" id="emailField" name="login">
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
    <@macros.footer />
</body>
</html>