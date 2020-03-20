<%--
  Created by IntelliJ IDEA.
  models.User: alina
  Date: 30/10/2019
  Time: 8:08 PM
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
<div class="container type2">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card type3">
            <div class="card-header">
                <h3><strong>Добавьте упражнения</strong></h3>
            </div>
            <div class="card-body">
                <form action="" method="post">
                    <input type="hidden" name="ex_num" value="${ex_num}">
                    <input type="hidden" name="tr_id" value="${tr_id}">
                    <c:forEach var="i" begin="1" end="${ex_num}" step="1">
                        <div class="form-group d-flex justify-content-around">
                            <input type="text" class="form-control col-sm-5" name="${i}name" placeholder="Упражнение"/>
                            <input type="text" class="form-control textin col-sm-6" name="${i}reps"
                                   placeholder="Повторения/подходы"/>
                        </div>
                    </c:forEach>
                    <input type="submit" class="btn float-right" value="Добавить">
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
<%@include file="includes/footer.jsp" %>
</body>
</html>
