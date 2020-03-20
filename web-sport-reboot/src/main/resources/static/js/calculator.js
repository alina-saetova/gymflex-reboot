function calculate() {
    $.ajax({
        url: "/calculator/calculate",
        data: {
            age: $("#age").val(),
            weight: $('#weight').val(),
            height: $('#height').val(),
            activity: $('#active-select').val(),
            gender: $('#gender-select').val(),
            formula: $('#formula-select').val()
        },
        success: function (msg) {
            $('#answer').html("");
            $('#answer').append("<h5 style=\"font-weight: bold\"><a href=\"#\" class=\"a_reg\">" + msg + "</a></h5>\n");
        }
    })
}