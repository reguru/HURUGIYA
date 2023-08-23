/*global $*/
$(function() {
  const CLASSNAME = "-visible";
  const $target1 = $(".title");

  setInterval(() => {
    $target1.addClass(CLASSNAME);
  });
});

$(function() {
  $('.submit1').delay(2500).hide().fadeIn('slow');
});

$(function() {
  $('.box').hide().fadeIn('3000');
});


/*ページトップ*/
$(function() {
  $('#back a').on('click', function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});