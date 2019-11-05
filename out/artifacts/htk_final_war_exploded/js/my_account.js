$(document).ready(function () {

    /*========== disable fields ========= */

    let status = false;

    $("#update_user").click(function () {
        $("#getUserEmail").prop("disabled", status);
        $("#free").prop("disabled", status);
        $("#premium").prop("disabled", status);
        $("#getPhone").prop("disabled", status);
    });

    $("#update_emer").click(function () {
        $("#getFirstNameEmergency").prop("disabled", status);
        $("#getLastNameEmergency").prop("disabled", status);
        $("#getKinship").prop("disabled", status);
        $("#getPhoneEmergency").prop("disabled", status);
        $("#getEmailEmergency").prop("disabled", status);
    });

    $("#update_pwd").click(function () {
        $("#getNewPwd").prop("disabled", status);
        $("#getOldPwd").prop("disabled", status);
    });

    //*============== validation ===============*/

    const userPhone = document.querySelector("#getPhone");
    const emerName = document.querySelector("#getFirstNameEmergency");
    const emerLastName = document.querySelector("#getLastNameEmergency");
    const emerPhone = document.querySelector("#getPhoneEmergency");
    const emerEmail = document.querySelector("#getEmailEmergency");
    const oldPwd = document.querySelector("#getOldPwd");
    const newPwd = document.querySelector("#getNewPwd");
    const displayMsg = document.querySelectorAll(".msg");


    const erOnlyTxt = new RegExp('^[a-zA-ZéúíóáÉÚÍÓÁèùìòàçÇÈÙÌÒÀõãñÕÃÑêûîôâÊÛÎÔÂëÿüïöäËYÜÏÖÄ\\-\\s]+$');

    const erOnlyPhone = new RegExp("^\\(\\d{2}\\) \\d{4,5}-\\d{4}$");

    const erEmail = new RegExp("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");

    const erPwd = new RegExp("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{4,}$");

    const validMsg = "Preenchimento correto.";
    const invalidMsg = "Preenchimento incorreto.";

    let field;
    let value;

    function validatedPhone(field, value, display) {
        if (erOnlyPhone.test(value) === true) {
            validatedTrue(field, display);
        } else {
            validatedFalse(field, display);
        }
    }

    function validatedTxt(field, value, display) {
        if (erOnlyTxt.test(value) === true) {
            validatedTrue(field, display);
        } else {
            validatedFalse(field, display);
        }
    }

    function validatedEmail(field, value, display) {
        if (erEmail.test(value) === true) {
            validatedTrue(field, display);
        } else {
            validatedFalse(field, display);
        }
    }

    function validatedPwd(field, value, display) {
        if (erPwd.test(value) === true) {
            validatedTrue(field, display);
        } else {
            validatedFalse(field, display);
        }
    }

    function validatedTrue(field, display) {
        field.style.borderColor = "#228B22";
        field.style.color = "#228B22";
        display.innerHTML = validMsg;
    }

    function validatedFalse(field, display) {
        field.style.borderColor = "#FF0000";
        field.style.color = "#FF0000";
        display.innerHTML = invalidMsg;
        display.className = "invalidStyle";
    }

    function cleanField(field, display) {
        field.style.borderColor = "";
        display.innerHTML = "";
        display.className = "validStyle";

    }

// userPhone
    userPhone.onblur = function () {
        field = this;
        let displayMsgElement = displayMsg[0];
        value = this.value;

        validatedPhone(field, value, displayMsgElement);
    };

    userPhone.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[0];

        cleanField(field, displayMsgElement);
    };

// emerName
    emerName.onblur = function () {
        field = this;
        value = this.value;
        let displayMsgElement = displayMsg[1];


        validatedTxt(field, value, displayMsgElement);
    };

    emerName.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[1];

        cleanField(field, displayMsgElement);
    };


    // emerLastName
    emerLastName.onblur = function () {
        field = this;
        let displayMsgElement = displayMsg[2];
        value = this.value;

        validatedTxt(field, value, displayMsgElement);
    };

    emerLastName.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[2];

        cleanField(field, displayMsgElement);
    };

    // emerEmail,
    emerEmail.onblur = function () {
        field = this;
        let displayMsgElement = displayMsg[3];
        value = this.value;

        validatedEmail(field, value, displayMsgElement);
    };

    emerEmail.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[3];

        cleanField(field, displayMsgElement);
    };

    // emerPhone,
    emerPhone.onblur = function () {
        field = this;
        let displayMsgElement = displayMsg[4];
        value = this.value;

        validatedPhone(field, value, displayMsgElement);
    };

    emerPhone.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[4];

        cleanField(field, displayMsgElement);
    };


    // OldPwd,
    oldPwd.onblur = function () {
        field = this;
        let displayMsgElement = displayMsg[5];
        value = this.value;

        validatedPwd(field, value, displayMsgElement);
    };

    emerEmail.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[5];

        cleanField(field, displayMsgElement);
    };

    // newPwd,
    newPwd.onblur = function () {
        field = this;
        let displayMsgElement = displayMsg[6];
        value = this.value;

        validatedPwd(field, value, displayMsgElement);
    };

    emerEmail.onfocus = function () {
        field = this;
        let displayMsgElement = displayMsg[6];

        cleanField(field, displayMsgElement);
    };
});