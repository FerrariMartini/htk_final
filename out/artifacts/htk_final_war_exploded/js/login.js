window.onload = function () {
    var emailField = document.getElementById("getEmail");

    var emailMsg = document.getElementById("validEmailMsg");

    var pwdField = document.getElementById("getPassword");
    var pwdlMsg = document.getElementById("validPwdMsg");

    emailField.onblur = function () {
        var oRegExp = new RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
        if (oRegExp.test(emailField.value) === true) {
            emailField.style.borderColor = "#228B22";
            emailField.style.color = "#228B22";
            emailMsg.innerHTML = 'Preenchimento correto.';

        } else {
            emailField.style.borderColor = "#FF0000";
            emailField.style.color = "#FF0000";
            emailMsg.innerHTML = "Preenchimento incorreto.";
            emailMsg.className = "invalidStyle";

        }
    };

    emailField.onfocus = function () {
        emailField.style.borderColor = "";
        emailMsg.innerHTML = "";
        emailMsg.className = "validStyle";
    };


    pwdField.onblur = function () {
        var oRegExp = new RegExp("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{4,}$");
        if (oRegExp.test(pwdField.value) === true) {
            pwdField.style.borderColor = "#228B22";
            pwdField.style.color = "#228B22";
            pwdlMsg.innerHTML = "Preenchimennto correto.";

        } else {
            pwdField.style.borderColor = "#FF0000";
            pwdField.style.color = "#FF0000";
            pwdlMsg.className = "invalidStyle";
            pwdlMsg.innerHTML = "Senha deve ter:<br>- Mínimo 4 caracteres<br>- Pelo menos 1 letra <br>- Pelo menos 1 número.";

        }
    };

    pwdField.onfocus = function () {
        pwdField.style.borderColor = "";
        pwdlMsg.innerHTML = "";
        pwdlMsg.className = "validStyle";

    }

};

