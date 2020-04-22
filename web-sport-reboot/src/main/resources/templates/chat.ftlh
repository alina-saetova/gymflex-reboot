<!doctype html>
<html lang="en">
<#import "spring.ftl" as spring />
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <title><@spring.message 'chat.page.chat'/></title>
    <script>
        var webSocket;
        function connect() {
            webSocket = new WebSocket('ws://localhost/chatik');

            document.cookie = 'X-Authorization=' + '123456' + ';path=/';

            webSocket.onmessage = function receiveMessage(response) {
                let data = response['data'];
                let json = JSON.parse(data);
                var nodesSameClass = document.getElementsByClassName("sms");
                if (nodesSameClass.length > 7) {
                    $('#messagesList h6').first().remove();
                }
                $('#messagesList').append("<h6 class='sms'>" + json['from'] + ': ' + json['text'] + "</h6>")
            }
        }

        function sendMessage(text, login) {
            webSocket.send(JSON.stringify({
                "text" : text,
                "from" : login
            }));
        }
    </script>
</head>
<body class="body-with-img" onload="connect()">
<#import "footer.ftlh" as macros>
<@macros.nav />
<div class="container type2">
    <div class="d-flex justify-content-center h-100">
        <div class="card form-card formula-card">
            <div class="card-header">
                <h3><strong><@spring.message 'chat.page.chat'/></strong></h3>
            </div>
            <div class="card-body">
                <div id="messagesList">
                    <h6 class='sms'><@spring.message 'chat.page.default1'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default2'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default3'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default4'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default5'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default6'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default7'/></h6>
                    <h6 class='sms'><@spring.message 'chat.page.default8'/></h6>
                </div>
                <div class="input-group form-group">
                    <input type="text" id="message" name="message" class="form-control" placeholder="<@spring.message 'chat.page.message'/>">
                </div>
                <button class="btn login_btn btn_on_signup" onclick="sendMessage($('#message').val(), '${login}')"><@spring.message 'chat.page.send'/></button>
            </div>
        </div>
    </div>
</div>
<@macros.footer />
</body>
</html>