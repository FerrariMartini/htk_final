window.onload = function () {

    var hydraType = document.querySelector("#kind_hydration");
    var unidField = document.querySelector("#unit_water");
    var qtdField = document.querySelector("#qtd_water");
    var qtdF = 0;

    console.log("esse é a hydra " + hydraType.value);

    $(hydraType).change(function () {
        if (hydraType.value === "copo") {
            qtdF = 250 * unidField.value;
        } else if (hydraType.value === "pet500") {
            qtdF = 500 * unidField.value;
        } else {
            qtdF = (1000 * unidField.value) / 1000;
        }
        console.log("esse é a hydra ONCHANGE: " + hydraType.value + " qtd total: " + qtdF);

        qtdField.value = qtdF;
        // qtdField.textContent = qtdF;



    });

    $(unidField).change(function () {
        if (hydraType.value === "copo") {
            qtdF = 250 * unidField.value;
        } else if (hydraType.value === "pet500") {
            qtdF = 500 * unidField.value;
        } else {
            qtdF = (1000 * unidField.value) / 1000;
        }
        console.log("esse é a hydra ONCHANGE: " + hydraType.value + " qtd total em ml: " + qtdF);

        qtdField.value = qtdF;

    });

};