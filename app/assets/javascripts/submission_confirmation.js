$(function() {
  $( "#dialog-confirm" ).dialog({
    autoOpen: false,
    resizable: false,
    height:140,
    modal: true,
    buttons: {
      "Confirm Nomination": function() {
        $( this ).dialog( "close" );
      },
      Cancel: function() {
        $( this ).dialog( "close" );
      }
    });
  });

$(document).ready(function(){
  $('#submit-application').click(function(e){
    e.preventDefault();
    $( "#dialog-confirm" ).dialog( "open" );
    });
  });








//     var urlscript = this.href;  /* read link url (e.g. delete.php?id=314159) */

//     $.messager.alert('Warning','The warning message');
//     $.messager.confirm('Confirm','Are you sure you want to delete record?',function(r){
//         if (r) {
//            $.ajax(urlscript); /* make ajax call to that url with the right id */
//         }
//     });
//  });
// });
// });
