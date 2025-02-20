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
    return validatePassword() && !document.getElementById("errorMessageUsername").style.display === "block";
}
