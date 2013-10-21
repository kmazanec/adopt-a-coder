$(document).ready(function(){
  $('.countdown').downCount({
    date: '10/25/2013 12:00:00',
    offset: -6
  }, function () {
    alert('WOOT WOOT, done!');
  });
});