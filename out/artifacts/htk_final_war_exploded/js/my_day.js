const erOnlyNumber = new RegExp("^[0-9.,]+$");
const erOnlyPressure = new RegExp("^\\d{1,3}\\/\\d{1,3}$");


let fieldWeight = $('#currentWeight');
let fieldcalories = $("input[name='calories']");
let fieldQtd = $("input[name='qtd']");
let fieldSet = $("input[name='porcao']");
let fieldPressure = $("input[name='blood_pressure']");


function validatedOnlyNumber(field, value) {
    if (erOnlyNumber.test(value) === true) {
        $(field).css({"border-color": "#8a2be2"});
        $(field).css({"color": "#8a2be2"});
        $(value).css({"color": "#8a2be2"});

    } else {
        $(field).css({"borderColor": "#FF0000"});
        $(field).css({"color": "#FF0000"});
        $(value).css({"color": "#FF0000"});
    }
}

function validatedPressure(field, value) {
    if (erOnlyPressure.test(value) === true) {
        $(field).css({"border-color": "#8a2be2"});
        $(field).css({"color": "#8a2be2"});
        $(value).css({"color": "#8a2be2"});

    } else {
        $(field).css({"borderColor": "#FF0000"});
        $(field).css({"color": "#FF0000"});
        $(value).css({"color": "#FF0000"});
    }
}

fieldQtd.blur(function () {
    validatedOnlyNumber(this, this.value);
});

fieldWeight.blur(function () {
    validatedOnlyNumber(this, this.value);
});

fieldcalories.blur(function () {
    validatedOnlyNumber(this, this.value);
});

fieldSet.blur(function () {
    validatedOnlyNumber(this, this.value);
});

fieldPressure.blur(function () {
    console.log(this.value);
    validatedPressure(this, this.value);
});


