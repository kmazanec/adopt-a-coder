$(function(){

$( "#dialog-confirm" ).dialog({
  autoOpen: false,
  width: 500,
  height: 400,
  modal: true,
  buttons: {
    "Confirm Nomination": function () {
      $.post(link, function(){

        $("#submit-application").remove();
        $("#application-submitter").text("Not")
        $("#application-status").text("Submitted");
      });
      $(this).dialog("close");
    },
    "Cancel": function () {
      $(this).dialog("close");
    }
  }
});


  $("#submit-application").click(function(event){
    event.preventDefault();
    var link = $(this).attr("href");
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
