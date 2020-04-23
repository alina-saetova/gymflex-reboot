function send_comment(typeT, id) {
    var t = "/exercises/" + id + "/comment";
    if (typeT == "training") {
        t = "/trainings/" + id + "/comment"
    }
    $.ajax({
        url: t,
        data: {
            type: typeT,
            text: $("#textarea1").val()
        },
        dataType: "json",
        success: function (msg) {
            $('#textarea1').val('');
            $("#comments_cont").append("<li class=\"media\">\n" +
                    "                    <div class=\"media-left\">\n" +
                    "                        <a href=\"#\">\n" +
                    "                            <img class=\"media-object rounded-circle\" src=\"" + msg.user.photo + "\" alt=\"...\">\n" +
                    "                        </a>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"media-body\">\n" +
                    "                        <div class=\"panel panel-info\">\n" +
                    "                            <div class=\"panel-heading\">\n" +
                    "                                <div class=\"author\">" + msg.user.firstName + " " + msg.user.lastName + "</div>\n" +
                    "                                <div class=\"metadata\">\n" +
                    "                                    <span class=\"date\">" + msg.stringDate + "</span>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                            <div class=\"panel-body\">\n" +
                    "                                <div class=\"media-text text-justify\">" + msg.content + "</div>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </li>");
            }

    })
}