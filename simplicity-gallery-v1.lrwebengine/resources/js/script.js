function resetCategory() {
    var $container = $("#isotope-container");
    $container.isotope({ filter: '*' })
}

function setCategory(category) {
    var $container = $("#isotope-container");
    $container.isotope({ filter: '.' + category })
}

jQuery(document).ready(function($) {

    $imgs = $("img.lazy");

    $imgs.lazyload({
        threshold : 200,
        failure_limit: Math.max($imgs.length - 1, 0)
    });

    $('#isotope-container').isotope({
        onLayout: function() {
            $(window).trigger("scroll");
        }        
    });

    $(".fancybox").fancybox({
        helpers: {
            title: {
                type: 'inside'
            }
        },
        beforeShow: function () {
            // Disable right click 
            $.fancybox.wrap.bind("contextmenu", function (e) {
                return false; 
            });
        }
    });

    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });

    $('.scroll-to-top').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });

    var $container = $('#container');
    $container.isotope({
            itemSelector: '.item',
              layoutMode: "masonry",
              masonry: {
                isFitWidth: true  
              }
    });
});