document.addEventListener("DOMContentLoaded", function() {
    var heroSection = document.querySelector('.hero-section');
    var bgUrl = heroSection.getAttribute('data-bg-url');
    heroSection.style.backgroundImage = 'url(' + bgUrl + ')';
});
