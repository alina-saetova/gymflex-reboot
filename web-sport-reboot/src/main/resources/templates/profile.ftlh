<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <title>Профиль</title>
        <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        //если переместить в отдельный файл, у алертов слетает кодировка
        function save() {
            $.ajax({
                url: "/profile/saveProfile",
                data: {
                    firstname: $('#firstname').val(),
                    lastname: $('#lastname').val(),
                    login: $('#login').val()
                },
                success: function(msg) {
                    alert("успешно сохранено")
                }
            })
        }
        function change_password() {
            $.ajax({
                url: "/profile/changePassword",
                data: {
                    oldpassword: $("#old_password").val(),
                    newpassword: $('#new_password').val()
                },
                success:function (msg) {
                    if (msg == "ok") {
                        alert("успешно сохранено")
                    }
                    else {
                        alert("введен неправильный старый пароль")
                    }
                }
            })
        }
        function remove(id) {
            document.getElementById(id).remove();
        }

        function delete_from_db(obj_id, obj_type) {
            $.ajax({
                url: "/profile/deleteArticle",
                data: {
                    id: obj_id,
                    type: obj_type
                }
            })
        }
    </script>
</head>
<body class="body-with-img">
<#import "includes/footer.ftlh" as macros>
<@macros.nav />
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong>Профиль</strong></h1></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6 mb-4">
                <div class="list-group ">
                    <form method="post" enctype="multipart/form-data">
                        <div class="list-group-item tr">
                            <img id="profile-img"  alt="img" class="rounded-circle" width="180"
                                 height="180">
                        </div>
                        <div class="list-group-item tr">
                            <h5><strong>Имя</strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <input class="input-tr" type="text" id="firstname" value="${user.firstName}"/>
                        </div>
                        <div class="list-group-item tr">
                            <h5><strong>Фамилия</strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <input class="input-tr" type="text" id="lastname" value="${user.lastName}"/>
                        </div>
                        <div class="list-group-item tr">
                            <h5><strong>Логин</strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <input class="input-tr" type="text" id="login" value="${user.login}"/>
                        </div>
                        <div class="list-group-item tr">
                            <input type="button" value="Изменить данные" class="btn btn-sm" onclick="save()">
                        </div>
                    </form>
                </div>
                <div class="list-group py-4">
                    <form action="" method="post">
                        <div class="list-group-item tr">
                            <h5>Старый пароль</h5>
                        </div>
                        <div class="list-group-item tr">
                            <input class="input-tr" id="old_password" type="password" value=""/>
                        </div>
                        <div class="list-group-item tr">
                            <h5>Новый пароль</h5>
                        </div>
                        <div class="list-group-item tr">
                            <input class="input-tr"  id="new_password" type="password" value=""/>
                        </div>
                        <div class="list-group-item tr">
                            <input type="button" value="Изменить пароль" class="btn btn-sm" onclick="change_password()">
                        </div>
                    </form>
                    <form action="/logout">
                        <div class="list-group-item tr">
                            <button class="btn">Выйти</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-9 col-sm-12">
                <div class="list-group">
<#--                    <c:if test="${saved_trainings.size() != 0}">-->
<#--                        <h3 class="my-2"><strong>Сохраненные тренировки</strong></h3>-->
<#--                        <c:forEach var="s_tr" items="${saved_trainings}">-->
<#--                            <form method="post">-->
<#--                                <div class="list-group-item tr d-flex justify-content-between" id="${s_tr.getId()}">-->
<#--                                    <a href="/training?id=${s_tr.getId()}" class="list-group-item col-sm-10">${s_tr.getName()}</a>-->
<#--                                    <input type="button" class="btn col-sm-1" value="x" onclick="delete_from_db(${s_tr.getId()}, 'training'); remove(${s_tr.getId()})">-->
<#--                                </div>-->
<#--                            </form>-->
<#--                        </c:forEach>-->
<#--                    </c:if>-->
<#--                    <c:if test="${saved_trainings.size() == 0}">-->
<#--                        <div class="list-group">-->
<#--                            <h3 class="my-2"><strong>Сохраненные тренировки</strong></h3>-->
<#--                            <div class="list-group-item tr d-flex justify-content-between">-->
<#--                                <h5><strong>Добавьте тренировку</strong></h5>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </c:if>-->
                    <hr>
                    <#if (saved_exercises?size != 0)>
                        <h3 class="my-2"><strong>Сохраненные упражнения</strong></h3>
                        <#list saved_exercises as ex>
                            <div class="list-group-item tr d-flex justify-content-between" id="${ex.id}">
                                <a href="/exercises/${ex.id}" class="list-group-item col-sm-10">${ex.name}</a>
                                <input type="button" class="btn col-sm-1" value="x" onclick="delete_from_db(${ex.id}, 'exercise'); remove(${ex.id})">
                            </div>
                        </#list>
                    <#else >
                        <div class="list-group">
                            <h3 class="my-2"><strong>Сохраненные упражнения</strong></h3>
                            <div class="list-group-item tr d-flex justify-content-between">
                                <h5><strong>Добавьте упражнения</strong></h5>
                            </div>
                        </div>
                    </#if>
                    <hr>
<#--                    <c:if test="${map.size() != 0}">-->
<#--                        <h3 class="my-2"><strong>Мои тренировки</strong></h3>-->
<#--                        <c:forEach var="c_tr" items="${map}">-->
<#--                            <form method="post">-->
<#--                                <div class="list-group-item tr flex-container" id="${c_tr.key.getId()}">-->
<#--                                    <div class="d-flex justify-content-between">-->
<#--                                        <h3>${c_tr.key.getName()}</h3>-->
<#--                                        <input type="button" class="btn col-sm-1" value="x" onclick="delete_from_db(${c_tr.key.getId()}, 'own_training');remove(${c_tr.key.getId()})"/>-->
<#--                                    </div>-->
<#--                                    <hr>-->
<#--                                    <div class="input-group form-group justify-content-around">-->
<#--                                        <h6 class="col-sm-7">Упражнение</h6>-->
<#--                                        <h6>Повторения/подходы</h6>-->
<#--                                    </div>-->
<#--                                    <c:forEach var="c_ex" items="${c_tr.value}">-->
<#--                                        <div class="d-flex justify-content-between">-->
<#--                                            <a class="list-group-item col-sm-7">${c_ex.getName()}</a>-->
<#--                                            <a class="list-group-item col-sm-4">${c_ex.getReps()}</a>-->
<#--                                        </div>-->
<#--                                    </c:forEach>-->
<#--                                </div>-->
<#--                            </form>-->
<#--                        </c:forEach>-->
<#--                    </c:if>-->
<#--                    <c:if test="${map.size() == 0}">-->
<#--                        <div class="list-group">-->
<#--                            <h3 class="my-2"><strong>Мои тренировки</strong></h3>-->
<#--                            <div class="list-group-item tr d-flex justify-content-between">-->
<#--                                <h5><strong>Создайте свою тренировку</strong></h5>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </c:if>-->
                </div>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>