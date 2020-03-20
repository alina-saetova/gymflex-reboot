<%--
  Created by IntelliJ IDEA.
  models.User: alina
  Date: 30/10/2019
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../static/css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>Создание тренировки</title>
</head>
<body class="body-with-img">
<%@include file="includes/nav.jsp" %>
<div class="container type1">
    <div class="d-flex justify-content-center h-100">
        <c:if test="${flag == false}">
            <div class="form-group alt">
                <form action="/login">
                    <button class="btn btn-sm btn-comment">Войдите, чтобы получить возможность создавать свои
                        тренировки
                    </button>
                </form>
            </div>
        </c:if>
        <c:if test="${flag == true}">
            <div class="card form-card log-in-card">
                <div class="card-header">
                    <h3><strong>Создание тренировки</strong></h3>
                </div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-file-signature"></i></span>
                            </div>
                            <input type="text" class="form-control" name="training_name"
                                   placeholder="Название тренировки">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-dumbbell"></i></span>
                            </div>
                            <input type="number" class="form-control" name="exercises_number"
                                   placeholder="Количество упражнений">
                        </div>
                        <hr>
                        <div>
                            <input type="submit" value="Создать" class="btn float-right">
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
