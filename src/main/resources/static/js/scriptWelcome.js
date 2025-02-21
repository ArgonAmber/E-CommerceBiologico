
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
