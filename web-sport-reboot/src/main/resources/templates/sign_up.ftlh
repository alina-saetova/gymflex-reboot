<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>Регистрация</title>
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script>
        function sendFile() {
            let formData = new FormData();
            let files = ($('#file'))[0]['files'];
            [].forEach.call(files, function (file, i, files) {
                formData.append("file", file);
            });

            $.ajax({
                type: "POST",
                url: "/files",
                data: formData,
                processData: false,
                contentType: false
            })
                .done(function (response) {
                    let fileUrl = 'http://localhost/files/' + response;
                    $('#photo').attr('value', ''+ fileUrl);
                })
                .fail(function () {
                    alert('Error')
                });
        }
    </script>
</head>
<body class="body-with-img">
<#import "includes/footer.ftlh" as macros>
<@macros.nav />
<div class="container type2">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card" style="height: 620px;">
            <div class="card-header">
                <h3><strong>Регистрация</strong></h3>
            </div>
            <div class="card-body">
                <form method="post" id="log_on_form" action="/signUp" enctype="multipart/form-data">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                        </div>
                        <input type="text" id="firstName" name="firstName" class="form-control" placeholder="Имя">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                        </div>
                        <input type="text" id="lastName" name="lastName" class="form-control" placeholder="Фамилия">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="login" name="login" class="form-control" placeholder="Логин">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="email" name="email" class="form-control" placeholder="Email">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Пароль">
                    </div>
                    <div class="form-group">
                        <input type="file" id="file" name="file" class="input-file">
                    </div>
                    <input type="button" onclick="sendFile()" class="btn" style="margin-bottom: 15px;" value="Загрузить"/>
                    <input type="hidden" id="photo" name="photo" value="qq">
                    <input type="submit" value="Зарегистрироваться" class="btn login_btn">
                </form>
            </div>
            <div class="form-card" id="err">
            </div>
        </div>
    </div>
</div>
<@macros.footer />
</body>
</html>
