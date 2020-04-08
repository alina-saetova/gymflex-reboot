<!doctype html>
<html lang="en">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <title>GymFlex</title>
</head>
<body class="start-body">
<#import "footer.ftlh" as macros>
<header>
    <@macros.nav />
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('../img/img3.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="display-4"><@spring.message 'main.page.willpower'/></h2>
                    <!-- <p class="lead">This is a description for the first slide.</p>-->
                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('../img/img2.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="display-4"><@spring.message 'main.page.fortitude'/></h2>
                </div>
            </div>
            <div class="carousel-item" style="background-image: url('../img/img1.jpg')">
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="display-4"><@spring.message 'main.page.motivation'/></h2>
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
        <small><@spring.message 'main.page.last.added.trainings'/></small>
    </h1>
    <div class="row">
        <#list trainings as tr>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="/trainings/${tr.id}"><img class="card-img-top" src="${tr.photo}" alt=""
                                                              height="200"></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="/trainings/${tr.id}">${tr.name}</a>
                        </h4>
                    </div>
                </div>
            </div>
        </#list>
    </div>
    <h1 class="my-4">
        <small><@spring.message 'main.page.last.added.exercises'/></small>
    </h1>
    <div class="row">
        <#list exercises as ex>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="/exercises/${ex.id}"><img class="card-img-top" src="${ex.photo}" alt=""
                                                              height="200"></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="/exercises/${ex.id}">${ex.name}</a>
                        </h4>
                    </div>
                </div>
            </div>
        </#list>
    </div>
</div>
<@macros.footer />
</body>
</html>
