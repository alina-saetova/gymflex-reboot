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
<div class="container type1">
    <div class="d-flex justify-content-center h-100">
        <#if flag == false>
            <div class="form-group alt">
                <form action="/signIn">
                    <button class="btn btn-sm btn-comment"><@spring.message 'create.trainings.one.enter'/>
                    </button>
                </form>
            </div>
        <#else >
            <div class="card form-card log-in-card">
                <div class="card-header">
                    <h3><strong><@spring.message 'create.trainings.one.create'/></strong></h3>
                </div>
                <div class="card-body">
                    <form action="/createTraining" method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                            </div>
                            <input type="text" class="form-control" name="training_name"
                                   placeholder="<@spring.message 'create.trainings.one.name'/>">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-dumbbell"></i></span>
                            </div>
                            <input type="number" class="form-control" name="exercises_number"
                                   placeholder="<@spring.message 'create.trainings.one.reps'/>">
                        </div>
                        <hr>
                        <div>
                            <input type="submit" value="<@spring.message 'create.trainings.one.submit'/>" class="btn float-right">
                        </div>
                    </form>
                </div>
            </div>
        </#if>
    </div>
</div>
<@macros.footer />
</body>
</html>
