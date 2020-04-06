<!doctype html>
<html lang="ru">
<#import "spring.ftl" as spring />
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css" type="text/css">
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title><@spring.message 'navigation.calculator'/></title>
    <script src="../js/calculator.js"></script>
</head>
<body class="body-with-img">
<#import "footer.ftlh" as macros>
<@macros.nav />
    <div class="container type2">
        <div class="d-flex justify-content-center h-100">
            <div class="card form-card formula-card">
                <div class="card-header">
                    <h3><strong><@spring.message 'navigation.calculator'/></strong></h3>
                </div>
                <div class="card-body">
                    <form method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-history" aria-hidden="true"></i></span>
                            </div>
                            <input type="number" class="form-control" id="age" placeholder="<@spring.message 'calculator.page.age'/>">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                            </div>
                            <select class="custom-select" id="gender-select">
                                <option selected disabled><@spring.message 'calculator.page.gender'/></option>
                                <option value="male"><@spring.message 'calculator.page.gender.male'/></option>
                                <option value="female"><@spring.message 'calculator.page.gender.female'/></option>
                            </select>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                            </div>
                            <input type="number" class="form-control" id="height" placeholder="<@spring.message 'calculator.page.height'/>">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-weight" aria-hidden="true"></i></span>
                            </div>
                            <input type="number" class="form-control" id="weight" placeholder="<@spring.message 'calculator.page.weight'/>">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-dumbbell"></i></span>
                            </div>
                            <select class="custom-select" id="active-select">
                                <option selected disabled><@spring.message 'calculator.page.activity'/></option>
                                <option value="none"><@spring.message 'calculator.page.activity.no'/></option>
                                <option value="small"><@spring.message 'calculator.page.activity.little'/></option>
                                <option value="medium"><@spring.message 'calculator.page.activity.middle'/></option>
                                <option value="big"><@spring.message 'calculator.page.activity.big'/></option>
                                <option value="huge"><@spring.message 'calculator.page.activity.huge'/></option>
                            </select>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-calculator" aria-hidden="true"></i></span>
                            </div>
                            <select class="custom-select" id="formula-select">
                                <option selected disabled><@spring.message 'calculator.page.formula'/></option>
                                <option value="mifflin"><@spring.message 'calculator.page.formula.mifflin'/></option>
                                <option value="harris"><@spring.message 'calculator.page.formula.harris'/></option>
                            </select>
                        </div>
                        <hr>
                        <div>
                            <input type="button" class="btn float-right" id="show_res" value="<@spring.message 'calculator.page.calculate'/>"
                                   onclick="calculate()">
                        </div>
                        <div id="answer">
                            <h5 style="font-weight: bold"><a href="#" class="a_reg"><@spring.message 'calculator.page.result'/></a></h5>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>