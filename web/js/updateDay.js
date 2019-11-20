window.onload = function () {

    var fieldsDayList = document.querySelectorAll(".hidden");
    var obPicker = document.querySelector('#current_date');

    obPicker.onload = function () {
        insertDay(obPicker)
    };

    obPicker.onchange = function () {
        insertDay(obPicker)
    };

    insertDay(obPicker);

    function insertDay(newDay) {
        for (var i = 0; i < fieldsDayList.length; i++) {
            console.log("O valor atual é: " + fieldsDayList[i].value);
            fieldsDayList[i].value = newDay.value;
            console.log("O novo valor atual é: " + fieldsDayList[i].value);
        }
    }
};