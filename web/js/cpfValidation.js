var cpfField = document.querySelector("validCPF");
var cpf = document.querySelector("getCPF");

cpf.onblur = function () {
    if (TestaCPF(cpf)) {
        cpf.style.borderColor = "#228B22";
        cpf.style.color = "#228B22";
        cpfField.innerHTML = validMsg;
    } else {
        cpf.style.borderColor = "#FF0000";
        cpf.style.color = "#FF0000";
        cpfField.innerHTML = invalidMsg;
        cpfField.className = "invalidStyle";
    }
};

cpf.onfocus = function () {
    cpf.style.borderColor = "";
    cpfField.innerHTML = "";
    cpfField.className = "validStyle";
};


/**
 * @return {boolean}
 */
function TestaCPF(strCPF) {
    var Soma;
    var Resto;
    Soma = 0;
    if (strCPF === "00000000000") return false;

    for (i = 1; i <= 9; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto === 10) || (Resto === 11)) Resto = 0;
    if (Resto !== parseInt(strCPF.substring(9, 10))) return false;

    Soma = 0;
    for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto === 10) || (Resto === 11)) Resto = 0;

    return Resto === parseInt(strCPF.substring(10, 11));
}




