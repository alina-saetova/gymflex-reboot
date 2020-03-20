function calculate() {
    $.ajax({
        type: "POST",
        url: "/calculator",
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
            $('#answer').append("<a href=\"#\" class=\"a_reg\">" + msg + "</a>\n");
        }
    })
}