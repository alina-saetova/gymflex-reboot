<!doctype html>
<html lang="ru">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title><@spring.message 'signup.page.registration'/></title>
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

        function sendCode() {
            $.ajax({
                url: "/signUp/sendCode",
                data: {
                    "phone": $('#phoneNumber').val()
                },
                success: function (code) {
                    $('#code').attr('value', ''+ code);
                }
            })
        }

        function signUp() {
            $.ajax({
                type: "POST",
                url: "/signUp",
                data: {
                    firstName: $("#firstName").val(),
                    lastName: $('#lastName').val(),
                    login: $('#login').val(),
                    email: $('#email').val(),
                    password: $('#password').val(),
                    phoneNumber: $('#phoneNumber').val(),
                    photo: $('#photo').val(),
                    confirmCode: $('#confirmCode').val(),
                    code: $('#code').val()
                },
                success: function (msg) {
                    if (msg == 'ok') {
                        window.location.href = "/signIn"
                    }
                    else {
                        alert('wrong code, try again')
                    }
                }
            })
        }
    </script>
</head>
<body class="body-with-img">
<#import "footer.ftlh" as macros>
<@macros.nav />
<div class="container type2">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card" style="height: 760px;">
            <div class="card-header">
                <h3><strong><@spring.message 'signup.page.registration'/></strong></h3>
            </div>
            <div class="card-body">
                <form method="post" id="log_on_form" action="/signUp" enctype="multipart/form-data">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                        </div>
                        <input type="text" id="firstName" name="firstName" class="form-control" placeholder="<@spring.message 'signup.page.name'/>">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                        </div>
                        <input type="text" id="lastName" name="lastName" class="form-control" placeholder="<@spring.message 'signup.page.surname'/>">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="login" name="login" class="form-control" placeholder="<@spring.message 'signup.page.login'/>">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="email" name="email" class="form-control" placeholder="<@spring.message 'signup.page.email'/>">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="<@spring.message 'signup.page.password'/>">
                    </div>
                    <div class="form-group">
                        <input type="file" id="file" name="file" class="input-file">
                    </div>
                    <input type="button" onclick="sendFile()" class="btn btn_on_signup" style="margin-bottom: 15px;" value="<@spring.message 'signup.page.upload'/>"/>
                    <input type="hidden" id="photo" name="photo" value="qq">
                    <input type="hidden" id="code" name="code" value="qq">
                    <br>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="phone">
                    </div>
                    <input type="button" onclick="sendCode()" class="btn btn_on_signup" style="margin-bottom: 15px;" value="send code"/>
                    <div class="input-group form-group">
                        <input type="text" id="confirmCode" name="confirmCode" class="form-control" placeholder="code">
                    </div>
                    <input type="button" value="<@spring.message 'signup.page.sign.up'/>" class="btn login_btn btn_on_signup" onclick="signUp()">
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
