$(document).ready(function(){
  $('.submit_button').click(function(e){
    e.preventDefault();
    console.log('Are you sure you want to submit this?');
  });
});