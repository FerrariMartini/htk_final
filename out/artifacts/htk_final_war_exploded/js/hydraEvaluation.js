var hydraType = document.querySelector("#kind_hydration");
var unidField = document.querySelector("#unit_water");
var qtdField = document.querySelector("#qtd_water");
var qtdF = 0;
var lit = 0;

console.log("esse é a hydra " + hydraType.value);

$(hydraType).change(function () {

    if (hydraType.value === "copo") {
        lit = 250;
        convertL(unidField.value, lit);
    }

    if (hydraType.value === "pet500") {
        lit = 500;
        convertL(unidField.value, lit);
    }

    if (hydraType.value === "pet1") {
        lit = 1000;
        convertL(unidField.value, lit);
    }
    console.log("esse é a hydra ONCHANGE: " + hydraType.value + " qtd total: " + qtdF);


    qtdField.value = qtdF;
});

$(unidField).change(function () {

    if (hydraType.value === "copo") {
        lit = 250;
        convertL(unidField.value, lit);
    }

    if (hydraType.value === "pet500") {
        lit = 500;
        convertL(unidField.value, lit);
    }

    if (hydraType.value === "pet1") {
        lit = 1000;
        convertL(unidField.value, lit);
    }

    console.log("esse é a hydra ONCHANGE: " + hydraType.value + " qtd total em ml: " + qtdF);

    qtdField.value = qtdF;
});


function convertL(unit, lit) {
    qtdF = (lit * unit) / 1000;
    return qtdF
}
