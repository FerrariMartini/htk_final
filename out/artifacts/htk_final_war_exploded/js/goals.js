window.onload = function () {
    let erOnlyNumber = new RegExp("^[0-9.,]+$");
    let botao = document.querySelector("#save");
    let fields = document.querySelectorAll("input");
    let qtdFields = fields.length;
    let i;

    botao.onclick = function () {
        for (i = 0; i < qtdFields; i++) {
            fields[i].disabled = true;
            //TODO enviar dados para o servidor
        }
    };

    $("#update").click(function () {
        i = 0;
        while (i < qtdFields) {
            fields[i].disabled = false;
            i++;
        }
    });

    function validation(field, value, icons) {
        if (erOnlyNumber.test(value) === true) {
            field.style.borderColor = "#228B22";
            field.style.color = "#228B22";
        } else {
            field.style.borderColor = "#FF0000";
            field.style.color = "#FF0000";
        }
    }

    function clearFields(field) {
        field.style.borderColor = "";
    }

    for (i = 0; i < qtdFields; i++) {
        fields[i].onblur = function () {
            var goals = this.value;
            console.log(goals);
            console.log(typeof goals);
            var inputField = this;

            validation(inputField, goals);
        };

        fields[i].onfocus = function () {
            var inputField = this;
            clearFields(inputField);
        }
    }
};

