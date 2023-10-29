/*global $*/
$(function() {
  const CLASSNAME = "visible1";
  const $target1 = $(".title");

  setInterval(() => {
    $target1.addClass(CLASSNAME);
  });


  $('.submit1').delay(2500).hide().fadeIn('slow');

  $('.box').hide().fadeIn('3000');

  setTimeout(() => {
    $('.title').addClass('title-height');
    $('.top-tag .container').addClass(CLASSNAME);
  }, 2500);

  setTimeout(() => {
    $('.top-post .container').addClass(CLASSNAME);
  }, 2700);
});


/*ページトップ*/
$(function() {
  const $topBtn = $('#back a');
  $topBtn.hide();
  $(window).scroll(function() {
    if($(this).scrollTop() > 100) {
      $topBtn.fadeIn(1000);
    } else {
      $topBtn.fadeOut();
    }
  });

  $topBtn.on('click', function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});