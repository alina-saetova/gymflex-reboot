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
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>Расчет калорий</title>
    <script src="../js/calculator.js"></script>
</head>
<body class="body-with-img">
<#import "includes/footer.ftlh" as macros>
<@macros.nav />
    <div class="container type2">
        <div class="d-flex justify-content-center h-100">
            <div class="card form-card formula-card">
                <div class="card-header">
                    <h3><strong>Расчет калорий</strong></h3>
                </div>
                <div class="card-body">
                    <form method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-history" aria-hidden="true"></i></span>
                            </div>
                            <input type="number" class="form-control" id="age" placeholder="Возраст">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                            </div>
                            <select class="custom-select" id="gender-select">
                                <option selected disabled>Пол</option>
                                <option value="male">Муж</option>
                                <option value="female">Жен</option>
                            </select>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                            </div>
                            <input type="number" class="form-control" id="height" placeholder="Рост">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-weight" aria-hidden="true"></i></span>
                            </div>
                            <input type="number" class="form-control" id="weight" placeholder="Вес">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-dumbbell"></i></span>
                            </div>
                            <select class="custom-select" id="active-select">
                                <option selected disabled>Физическая активность</option>
                                <option value="none">Отсутствие физ. активности</option>
                                <option value="small">1–2 раза в неделю</option>
                                <option value="medium">3–4 раза в неделю</option>
                                <option value="big">5-7 раз в неделю</option>
                                <option value="huge">ежедневные многократные тренировки</option>
                            </select>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-calculator" aria-hidden="true"></i></span>
                            </div>
                            <select class="custom-select" id="formula-select">
                                <option selected disabled>Формула</option>
                                <option value="mifflin">Миффлина-Сан Жеора</option>
                                <option value="harris">Хариса-Бенедикта</option>
                            </select>
                        </div>
                        <hr>
                        <div>
                            <input type="button" class="btn float-right" id="show_res" value="Рассчитать"
                                   onclick="calculate()">
                        </div>
                        <div id="answer">
                            <h5 style="font-weight: bold"><a href="#" class="a_reg">Результат</a></h5>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<@macros.footer />
</body>
</html>