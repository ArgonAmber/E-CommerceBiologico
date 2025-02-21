

var menu = "close";
function MenuMobile() {
    var sideMenu = document.getElementById("sideMenu");
    var heroContent = document.querySelector('.hero-content');
    if (menu == "close") {
        sideMenu.style.width = "100%";
        heroContent.style.display = "none";
        menu = "open";
    } else {
        sideMenu.style.width = "0";
		heroContent.style.display = "block";
        menu = "close";
    }
}

// chiude il menu dopo il click su un link
document.querySelectorAll("#sideMenu a").forEach(link => {
    link.addEventListener("click", function() {
        document.getElementById("sideMenu").style.width = "0";
    });
});

////////////////////REGISTRAZIONE////////////////////////////////////////////////

function validatePassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var errorMessagePassword = document.getElementById("errorMessagePassword");

    if (password !== confirmPassword) {
        errorMessagePassword.style.display = "block";
        return false;
    } else {
        errorMessagePassword.style.display = "none";
        return true;
    }
}

function checkUsername() {
    var username = document.getElementById("username").value;
    var errorMessageUsername = document.getElementById("errorMessageUsername");
    var contextPath = document.getElementById("contextPath").value;

    // Crea una richiesta AJAX
    var xhr = new XMLHttpRequest();
    xhr.open("POST", contextPath + "/checkUsername", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var isUsernameTaken = xhr.responseText === 'true';
            if (isUsernameTaken) {
                errorMessageUsername.style.display = "block";
            } else {
                errorMessageUsername.style.display = "none";
            }
        }
    };
    xhr.send("username=" + encodeURIComponent(username));
}

function validateForm() {
    console.log("Validating form...");
    var passwordValid = validatePassword();
    var usernameValid = document.getElementById("errorMessageUsername").style.display === "none";

    console.log("Password valid: " + passwordValid);
    console.log("Username valid: " + usernameValid);

    return passwordValid && usernameValid;
}

