$(document).on('turbolinks:load',function() {
  $('#back a').on('click',function(event){
    event.preventDefault();
    $('body, html').animate({
      scrollTop:0
    }, 800);
  });
});