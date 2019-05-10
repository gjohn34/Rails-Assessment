document.addEventListener('DOMContentLoaded', function () {
    var elems = document.querySelectorAll('.carousel');
    var instances = M.Carousel.init(elems, {
        dist: -100,
        padding: 50,
        numVisible: 7,
        duration: 50
    });
});