// TODO: Need to code a way for the facebook authentication link to work on iOS. 
// Hiding it for now
document.addEventListener("turbolinks:load", function() { 
  if( /iPhone|iPad|iPod/i.test(navigator.userAgent) ) {
    $('.facebook').hide();
  }
});