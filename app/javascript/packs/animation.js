/*global $*/
const CLASSNAME = "-visible";
const $target1 = $(".title");

setInterval(() => {
  $target1.addClass(CLASSNAME);
});

$(function() {
  $('.submit1').delay(2500).hide().fadeIn('slow');
});

$(function() {
  $('.box').hide().fadeIn('3000');
});