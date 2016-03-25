var coloredBarScroll = function(){

  $("#category-button div").click(function() {
    $('html, body').animate({
        scrollTop: $(".colored-bar").offset().top - 103
        // scrollTop: $(document).height() * 0.753 - $(window).height()
    }, 600, "easeOutCirc", function(){
      console.log("scroll!");
    });
  });

}

$(document).ready(coloredBarScroll);
$(window).bind('page:change', coloredBarScroll);
$(window).bind('unload', coloredBarScroll);
