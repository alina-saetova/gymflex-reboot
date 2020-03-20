function send_comment(ex_id) {
    $.ajax({
        type: "POST",
        url: "/commentary",
        data: {
            id: ex_id,
            type: "exercise",
            text: $("#textarea1").val()
        },
        dataType: "json",
        success: function (msg) {
            if (msg.objects.length > 0) {
                $("#comments_cont").append("<li class=\"media\">\n" +
                    "                    <div class=\"media-left\">\n" +
                    "                        <a href=\"#\">\n" +
                    "                            <img class=\"media-object rounded-circle\" src=\"" + msg.objects[0].user.photo + "\" alt=\"...\">\n" +
                    "                        </a>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"media-body\">\n" +
                    "                        <div class=\"panel panel-info\">\n" +
                    "                            <div class=\"panel-heading\">\n" +
                    "                                <div class=\"author\">" + msg.objects[0].user.firstName + " " + msg.objects[0].user.lastName + "</div>\n" +
                    "                                <div class=\"metadata\">\n" +
                    "                                    <span class=\"date\">" + msg.objects[0].dateString + "</span>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                            <div class=\"panel-body\">\n" +
                    "                                <div class=\"media-text text-justify\">" + msg.objects[0].content + "</div>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </li>");
            }
        }
    })
}