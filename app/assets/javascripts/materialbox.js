document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.materialboxed');
    var instances = M.Materialbox.init(elems);
        elems.forEach(function (active) {
        active.addEventListener("click", function () {
            var overlay = document.getElementById('materialbox-overlay');
            overlay.addEventListener("mousedown", function () {
                overlay.click();
            });
            active.addEventListener("mousedown", function () {
                if (overlay.style.opacity === "1") {
                    active.click();
                }
            });
        });
    });
});