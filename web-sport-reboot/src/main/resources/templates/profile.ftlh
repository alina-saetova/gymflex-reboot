<!doctype html>
<html lang="ru">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <title><@spring.message 'profile.page.profile'/></title>
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
                    alert("<@spring.message 'profile.page.success'/>")
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
<#import "footer.ftlh" as macros>
<@macros.nav />
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-sm-10"><h1 class="my-4"><strong><@spring.message 'profile.page.profile'/></strong></h1></div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6 mb-4">
                <div class="list-group ">
                    <@spring.bind "profileForm"/>
                    <form method="post" action="/profile">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <div class="list-group-item tr">
                            <img id="profile-img" src="${user.photo}" alt="img" class="rounded-circle" width="180"
                                 height="180">
                        </div>

                        <div class="list-group-item tr">
                            <h5><strong><@spring.message 'profile.page.name'/></strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <@spring.formInput "profileForm.firstName" "class='input-tr'"/>
                        </div>
                        <@spring.showErrors "<br>", "error"/>

                        <div class="list-group-item tr">
                            <h5><strong><@spring.message 'profile.page.surname'/></strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <@spring.formInput "profileForm.lastName" "class='input-tr'"/>
                        </div>
                        <@spring.showErrors "<br>", "error"/>

                        <div class="list-group-item tr">
                            <h5><strong><@spring.message 'profile.page.login'/></strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <@spring.formInput "profileForm.login" "class='input-tr'"/>
                        </div>
                        <@spring.showErrors "<br>", "error"/>

                        <div class="list-group-item tr">
                            <h5><strong><@spring.message 'profile.page.email'/></strong></h5>
                        </div>
                        <div class="list-group-item tr">
                            <@spring.formInput "profileForm.email" "class='input-tr'"/>
                        </div>
                        <@spring.showErrors "<br>", "error"/>

                        <div class="list-group-item tr">
                            <input type="submit" value="<@spring.message 'profile.page.change.data'/>" class="btn btn-sm">
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
                    <#if (saved_trainings?size != 0)>
                        <h3 class="my-2"><strong><@spring.message 'profile.page.saved.trainings'/></strong></h3>
                        <#list saved_trainings as s_tr>
                            <form method="post">
                                <div class="list-group-item tr d-flex justify-content-between" id="tr${s_tr.id}">
                                    <a href="/trainings/${s_tr.id}" class="list-group-item col-sm-10">${s_tr.name}</a>
                                    <input type="button" class="btn col-sm-1" value="x" onclick="delete_from_db(${s_tr.id}, 'training'); remove('tr${s_tr.id}')">
                                </div>
                            </form>
                        </#list>
                    <#else>
                        <div class="list-group">
                            <h3 class="my-2"><strong><@spring.message 'profile.page.saved.trainings'/></strong></h3>
                            <div class="list-group-item tr d-flex justify-content-between">
                                <h5><strong><@spring.message 'profile.page.add.trainings'/></strong></h5>
                            </div>
                        </div>
                    </#if>
                    <hr>
                    <#if (saved_exercises?size != 0)>
                        <h3 class="my-2"><strong><@spring.message 'profile.page.saved.exercises'/></strong></h3>
                        <#list saved_exercises as ex>
                            <div class="list-group-item tr d-flex justify-content-between" id="ex${ex.id}">
                                <a href="/exercises/${ex.id}" class="list-group-item col-sm-10">${ex.name}</a>
                                <input type="button" class="btn col-sm-1" value="x" onclick="delete_from_db(${ex.id}, 'exercise'); remove('ex${ex.id}')">
                            </div>
                        </#list>
                    <#else >
                        <div class="list-group">
                            <h3 class="my-2"><strong><@spring.message 'profile.page.saved.exercises'/></strong></h3>
                            <div class="list-group-item tr d-flex justify-content-between">
                                <h5><strong><@spring.message 'profile.page.add.exercises'/></strong></h5>
                            </div>
                        </div>
                    </#if>
                    <hr>
                    <#if user_trainings?size != 0>
                        <h3 class="my-2"><strong><@spring.message 'profile.page.owntrainings'/></strong></h3>
                        <#list user_trainings as tr>
                            <form method="post">
                                <div class="list-group-item tr flex-container" id="own_tr${tr.id}">
                                    <div class="d-flex justify-content-between">
                                        <h3>${tr.title}</h3>
                                        <input type="button" class="btn col-sm-1" value="x" onclick="delete_from_db(${tr.id}, 'own_training');remove('own_tr${tr.id}')"/>
                                    </div>
                                    <hr>
                                    <div class="input-group form-group justify-content-around">
                                        <h6 class="col-sm-7"><@spring.message 'profile.page.exercises'/></h6>
                                        <h6><@spring.message 'profile.page.reps'/></h6>
                                    </div>
                                    <#list tr.exercises as ex>
                                        <div class="d-flex justify-content-between">
                                            <a class="list-group-item col-sm-7">${ex.name}</a>
                                            <a class="list-group-item col-sm-4">${ex.reps}</a>
                                        </div>
                                    </#list>
                                </div>
                            </form>
                        </#list>
                    <#else>
                        <div class="list-group">
                            <h3 class="my-2"><strong><@spring.message 'profile.page.owntrainings'/></strong></h3>
                            <div class="list-group-item tr d-flex justify-content-between">
                                <h5><strong><@spring.message 'profile.page.create'/></strong></h5>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>