<!doctype html>
<html lang="en">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title><@spring.message 'create.trainings.one.create'/></title>
</head>
<body class="body-with-img">
<#import "footer.ftlh" as macros>
<@macros.nav />
<div class="container type2">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card type3">
            <div class="card-header">
                <h3><strong><@spring.message 'create.trainings.two.add.exercise'/></strong></h3>
            </div>
            <div class="card-body">
                <form action="/createTraining/exercises" method="post">
                    <input type="hidden" name="ex_num" value="${ex_num}">
                    <input type="hidden" name="tr_id" value="${tr_id}">
                    <#list 1..ex_num as i>
                        <div class="form-group d-flex justify-content-around">
                            <input type="text" class="form-control col-sm-5" name="${i}name" placeholder="<@spring.message 'create.trainings.two.exercise'/>"/>
                            <input type="text" class="form-control textin col-sm-6" name="${i}reps"
                                   placeholder="<@spring.message 'create.trainings.two.reps'/>"/>
                        </div>
                    </#list>
                    <input type="submit" class="btn float-right" value="<@spring.message 'create.trainings.two.add'/>">
                </form>
                <script>
                    var texts = document.querySelectorAll(".textin");
                    texts.forEach(function (text) {
                        text.onkeyup = function () {
                            if (text.value.length > 20)
                                text.value = text.value.substring(0, 20);
                        }
                    });
                </script>
            </div>
        </div>
    </div>
</div>
<@macros.footer />
</body>
</html>
