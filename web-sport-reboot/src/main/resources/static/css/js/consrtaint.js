$(document).on('submit', '#log_on_form', function () {
    var password = $(this).find('input[name="password"]').val();
    var err_msg = '';

    // проверка пароля на  корректность символов
    if (password.replace(/[A-z0-9!"?$%^&)(]/g, '')) {
        err_msg += '<br />Пароль может содержать латинские символы, цифры и символы наподобие ! " ? $ % ^ & )';
        $("input[name='password']").focus();
    }
    // проверка пароля на длину
    if (password.length < 6) {
        err_msg += '<br />Пароль должен быть не короче 6 символов';
        $("input[name='password']").focus();
    }

    if (err_msg) {
        $('.reg_pass_err').html(err_msg);
        return false
    }
    return false;
});