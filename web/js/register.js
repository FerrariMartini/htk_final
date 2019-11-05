window.onload = function () {
    const validMsg = "Preenchimento correto.";
    const invalidMsg = "Preenchimento incorreto.";
    const erOnlyTxt = new RegExp('^[a-zA-ZéúíóáÉÚÍÓÁèùìòàçÇÈÙÌÒÀõãñÕÃÑêûîôâÊÛÎÔÂëÿüïöäËYÜÏÖÄ\\-\\s]+$');
    const erOnlyPhone = new RegExp("^\\(\\d{2}\\) \\d{4,5}-\\d{4}$");
    const erEmail = new RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
    const erOnlyNumber = new RegExp('(0|[1-9]\d*)(,\d+)?');
    const erPwd = new RegExp("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{4,}$");
    const erCPF = new RegExp("");

    //fields from user registration
    var userFirstName = document.getElementById("getFirstName");
    var userLastName = document.getElementById("getLastName");
    var userWeight = document.getElementById("getWeigth");
    var userHeight = document.getElementById("getHeight");
    var userPhone = document.getElementById("getPhone");
    var userEmail = document.getElementById("getEmail");
    var userPwd = document.getElementById("getPwd");

    //fields from user emergency contact registration
    var nameFirstEmerg = document.querySelector("emeFirstName");
    var emLastName = document.getElementById("getLastNameEme");
    var emEmail = document.getElementById("getEmailEmergency");
    var emPhone = document.getElementById("getPhoneEmergency");

    //fields to display validation message
    var v_userFirstName = document.querySelector("#validFirstName");
    var v_userLastName = document.querySelector("#validLastName");
    var v_userWeight = document.querySelector("#validWeigth");
    var v_userHeight = document.querySelector("#validHeight");
    var v_userPhone = document.querySelector("#validPhone");
    var v_userEmail = document.querySelector("#validEmail");
    var v_userPwd = document.querySelector("#validPwd");

    var v_emFirstName = document.querySelector("#emeFirstName");
    var v_emLastName = document.querySelector("#validLastNameEm");
    var v_emEmail = document.querySelector("#validEmEmail");
    var v_emPhone = document.querySelector("#validEmPhone");


    // userName
    userFirstName.onblur = function () {
        if (erOnlyTxt.test(userFirstName.value) === true) {
            userFirstName.style.borderColor = "#228B22";
            userFirstName.style.color = "#228B22";
            v_userFirstName.innerHTML = validMsg;
        } else {
            userFirstName.style.borderColor = "#FF0000";
            userFirstName.style.color = "#FF0000";
            v_userFirstName.innerHTML = invalidMsg;
            v_userFirstName.className = "invalidStyle";
        }
    };

    userFirstName.onfocus = function () {
        userFirstName.style.borderColor = "";
        v_userFirstName.innerHTML = "";
        v_userFirstName.className = "validStyle";
    };

    // userLastName
    userLastName.onblur = function () {
        if (erOnlyTxt.test(userLastName.value) === true) {
            userLastName.style.borderColor = "#228B22";
            userLastName.style.color = "#228B22";
            v_userLastName.innerHTML = validMsg;
        } else {
            userLastName.style.borderColor = "#FF0000";
            userLastName.style.color = "#FF0000";
            v_userLastName.innerHTML = invalidMsg;
            v_userLastName.className = "invalidStyle";
        }
    };

    userLastName.onfocus = function () {
        userLastName.style.borderColor = "";
        v_userLastName.innerHTML = "";
        v_userLastName.className = "validStyle";
    };

    // userWeight
    userWeight.onblur = function () {
        if (erOnlyNumber.test(userWeight.value) === true) {
            userWeight.style.borderColor = "#228B22";
            userWeight.style.color = "#228B22";
            v_userWeight.innerHTML = validMsg;
        } else {
            userWeight.style.borderColor = "#FF0000";
            userWeight.style.color = "#FF0000";
            v_userWeight.innerHTML = invalidMsg;
            v_userWeight.className = "invalidStyle";
        }
    };

    userWeight.onfocus = function () {
        userWeight.style.borderColor = "";
        v_userWeight.innerHTML = "";
        v_userWeight.className = "validStyle";
    };

    // userHeight
    userHeight.onblur = function () {
        if (erOnlyNumber.test(userHeight.value) === true) {
            userHeight.style.borderColor = "#228B22";
            userHeight.style.color = "#228B22";
            v_userHeight.innerHTML = validMsg;
        } else {
            userHeight.style.borderColor = "#FF0000";
            userHeight.style.color = "#FF0000";
            v_userHeight.innerHTML = invalidMsg;
            v_userHeight.className = "invalidStyle";
        }
    };

    userHeight.onfocus = function () {
        userHeight.style.borderColor = "";
        v_userHeight.innerHTML = "";
        v_userHeight.className = "validStyle";
    };


    // userPhone
    userPhone.onblur = function () {
        if (erOnlyPhone.test(userPhone.value) === true) {
            userPhone.style.borderColor = "#228B22";
            userPhone.style.color = "#228B22";
            v_userPhone.innerHTML = validMsg;
        } else {
            userPhone.style.borderColor = "#FF0000";
            userPhone.style.color = "#FF0000";
            v_userPhone.innerHTML = invalidMsg;
            v_userPhone.className = "invalidStyle";
        }
    };

    userPhone.onfocus = function () {
        userPhone.style.borderColor = "";
        v_userPhone.innerHTML = "";
        v_userPhone.className = "validStyle";
    };


    // userEmail
    userEmail.onblur = function () {
        if (erEmail.test(userEmail.value) === true) {
            userEmail.style.borderColor = "#228B22";
            userEmail.style.color = "#228B22";
            v_userEmail.innerHTML = validMsg;
        } else {
            userEmail.style.borderColor = "#FF0000";
            userEmail.style.color = "#FF0000";
            v_userEmail.innerHTML = invalidMsg;
            v_userEmail.className = "invalidStyle";
        }
    };

    userEmail.onfocus = function () {
        userEmail.style.borderColor = "";
        v_userEmail.innerHTML = "";
        v_userEmail.className = "validStyle";
    };


    // userPwd
    userPwd.onblur = function () {
        if (erPwd.test(userPwd.value) === true) {
            userPwd.style.borderColor = "#228B22";
            userPwd.style.color = "#228B22";
            v_userPwd.innerHTML = validMsg;
        } else {
            userPwd.style.borderColor = "#FF0000";
            userPwd.style.color = "#FF0000";
            v_userPwd.innerHTML = invalidMsg;
            v_userPwd.className = "invalidStyle";
        }
    };

    userPwd.onfocus = function () {
        userPwd.style.borderColor = "";
        v_userPwd.innerHTML = "";
        v_userPwd.className = "validStyle";
    };

    //nameFirstEmerg
    nameFirstEmerg.onblur = function () {
        if (erOnlyTxt.test(nameFirstEmerg.value) === true) {
            nameFirstEmerg.style.borderColor = "#228B22";
            nameFirstEmerg.style.color = "#228B22";
            v_emFirstName.innerHTML = validMsg;
        } else {
            nameFirstEmerg.style.borderColor = "#FF0000";
            nameFirstEmerg.style.color = "#FF0000";
            v_emFirstName.innerHTML = invalidMsg;
            v_emFirstName.className = "invalidStyle";
        }
    };

    nameFirstEmerg.onfocus = function () {
        nameFirstEmerg.style.borderColor = "";
        v_emFirstName.innerHTML = "";
        v_emFirstName.className = "validStyle";
    };

    //emLastName
    emLastName.onblur = function () {
        if (erOnlyTxt.test(emLastName.value) === true) {
            emLastName.style.borderColor = "#228B22";
            emLastName.style.color = "#228B22";
            v_emLastName.innerHTML = validMsg;
        } else {
            emLastName.style.borderColor = "#FF0000";
            emLastName.style.color = "#FF0000";
            v_emLastName.innerHTML = invalidMsg;
            v_emLastName.className = "invalidStyle";
        }
    };
    emLastName.onfocus = function () {
        nameFirstEmerg.style.borderColor = "";
        v_emLastName.innerHTML = "";
        v_emLastName.className = "validStyle";
    };

    //emEmail
    emEmail.onblur = function () {
        if (erEmail.test(emEmail.value) === true) {
            emEmail.style.borderColor = "#228B22";
            emEmail.style.color = "#228B22";
            v_emEmail.innerHTML = validMsg;
        } else {
            emEmail.style.borderColor = "#FF0000";
            emEmail.style.color = "#FF0000";
            v_emEmail.innerHTML = invalidMsg;
            v_emEmail.className = "invalidStyle";
        }
    };
    emEmail.onfocus = function () {
        emEmail.style.borderColor = "";
        v_emEmail.innerHTML = "";
        v_emEmail.className = "validStyle";
    };

    //emPhone
    emPhone.onblur = function () {
        if (erOnlyPhone.test(emPhone.value) === true) {
            emPhone.style.borderColor = "#228B22";
            emPhone.style.color = "#228B22";
            v_emPhone.innerHTML = validMsg;
        } else {
            emPhone.style.borderColor = "#FF0000";
            emPhone.style.color = "#FF0000";
            v_emPhone.innerHTML = invalidMsg;
            v_emPhone.className = "invalidStyle";
        }
    };
    emPhone.onfocus = function () {
        emPhone.style.borderColor = "";
        v_emPhone.innerHTML = "";
        v_emPhone.className = "validStyle";
    };

    /* ============ CALCULO DO IMC ================ */

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

};

