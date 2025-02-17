document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("sideMenu").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "250px";
    });

    document.getElementById("closeMenuButton").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "0";
    });
});


