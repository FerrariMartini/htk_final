window.onload = function () {

    const validMsg = "Preenchimento correto.";
    const invalidMsg = "Preenchimento incorreto.";
    const erOnlyTxt = new RegExp('^[a-zA-ZéúíóáÉÚÍÓÁèùìòàçÇÈÙÌÒÀõãñÕÃÑêûîôâÊÛÎÔÂëÿüïöäËYÜÏÖÄ\\-\\s]+$');
    const erOnlyPhone = new RegExp("^\\(\\d{2}\\) \\d{4,5}-\\d{4}$");
    const erEmail = new RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
    const erOnlyNumber = new RegExp('(0|[1-9]\d*)(,\d+)?');
    const erPwd = new RegExp("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{4,}$");

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
    console.log(v_emFirstName);
    console.log(v_emLastName);
    var v_emLastName = document.querySelector("#validLastNameEm");
    var v_emEmail = document.querySelector("#validEmEmail");
    var v_emPhone = document.querySelector("#validEmPhone");

    getOnBlur(userFirstName, erOnlyTxt, v_userFirstName);
    getOnFocus(userFirstName, v_userFirstName);
    getOnBlur(userLastName, erOnlyTxt, v_userLastName);
    getOnFocus(userLastName, v_userLastName);
    getOnBlur(userWeight, erOnlyNumber, v_userWeight);
    getOnFocus(userWeight, v_userWeight);
    getOnBlur(userHeight, erOnlyNumber, v_userHeight);
    getOnFocus(userHeight, v_userHeight);
    getOnBlur(userPhone, erOnlyPhone, v_userPhone);
    getOnFocus(userPhone, v_userPhone);
    getOnBlur(userEmail, erEmail, v_userEmail);
    getOnFocus(userEmail, v_userEmail);
    getOnBlur(userPwd, erPwd, v_userPwd);
    getOnFocus(userPwd, v_userPwd);

    getOnBlur(nameFirstEmerg, erOnlyTxt, v_emFirstName);
    getOnFocus(nameFirstEmerg, v_emFirstName);
    getOnBlur(emLastName, erOnlyTxt, v_emLastName);
    getOnFocus(emLastName, v_emLastName);
    getOnBlur(emEmail, erEmail, v_emEmail);
    getOnFocus(emEmail, v_emEmail);
    getOnBlur(emPhone, erOnlyPhone, v_emPhone);
    getOnFocus(emPhone, v_emPhone);

    function getOnBlur(data, regex, field) {
        data.onblur = function () {
            if (regex.test(data.value) === true) {
                data.style.borderColor = "#228B22";
                data.style.color = "#228B22";
                field.innerHTML = validMsg;
            } else {
                data.style.borderColor = "#FF0000";
                data.style.color = "#FF0000";
                field.innerHTML = invalidMsg;
                field.className = "invalidStyle";
            }
        }
    };

    function getOnFocus(data, field) {
        data.onfocus = function () {
            data.style.borderColor = "";
            field.innerHTML = "";
            field.className = "validStyle";
        }
    }
};

