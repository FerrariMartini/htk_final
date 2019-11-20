var userWeight = document.getElementById("getWeigth");
var userHeight = document.getElementById("getHeight");

var valH;
var valW;
var initImc;

$(userHeight).change(function () {
    //converte virgula em ponto
    valH = $("#getHeight").val().replace(",", ".");
    valW = $("#getWeigth").val().replace(",", ".");

    initImc = imcEvaluate(parseFloat(valW), parseFloat(valH));

    //converte de numero para string
    initImc = initImc.toFixed(2).toString();

    //converte ponto em virgula e mostra o resultado
    $("#showIMC").html(initImc.replace(".", ","));
});

userWeight.onchange = function () {
    //converte virgula em ponto
    valH = $("#getHeight").val().replace(",", ".");
    valW = $("#getWeigth").val().replace(",", ".");

    initImc = imcEvaluate(parseFloat(valW), parseFloat(valH));

    //converte de numero para string
    initImc = initImc.toFixed(2).toString();

    //converte ponto em virgula e mostra o resultado
    $("#showIMC").html(initImc.replace(".", ","));
};

function imcEvaluate(weight, height) {
    return weight / (height * height);
}
