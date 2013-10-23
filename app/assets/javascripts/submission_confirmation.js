$(function(){

  $( "#dialog-confirm" ).dialog({
    autoOpen: false,
    width: 500,
    height: 400,
    modal: true,
    buttons: {
      "Confirm Nomination": function () {
        $(this).dialog("close");
        $.post('/candidate/application/submit', function(response){
          var return_data = response;
          if (return_data['message'] === true){
            $("#application-submitter").text("Submit Application")
            $("#application-status").text("Completed");
            $("#flash_notice").html("<div data-alert class='alert-box success'>Your submission was successful!<a href class='close'>x</a></div>")
          }
          else {
            if (return_data['notice'] === 'unable'){
              console.log('whatever')
              $("#flash_notice").hmtl("<div data-alert class='alert-box alert'>You have already submitted an application.<a href class='close'>x</a></div>")
            }
            else {
              console.log('nope')
              $("#flash_notice").html("<div data-alert class='alert-box alert'>Your submission was unsuccessful.Please ensure you have completed your profile and answered each question before submitting.<a href class='close'>x</a></div>")
            }
          }
        });
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
