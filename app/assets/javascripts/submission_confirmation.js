$(function(){
  $( "#dialog-application-submit" ).dialog({
    autoOpen: false,
    width: 500,
    height: 400,
    modal: true,
    buttons: {
      "Confirm Application Submission": function () {
        $(this).dialog("close");
        var path = $(this).data('link').href;
        $.post(path, function(response){
          var return_data = response;
          if (return_data['message'] === 'completed'){
            $("#application-submitter").text("Submit Application");
            $("#application-status").text("Completed");
            $("#flash_notice").html("<div data-alert class='alert-box success'>Your submission was successful!<a href class='close'>x</a></div>")
          }
          else if (return_data['message'] === 'unable'){
              $("#flash_notice").html("<div data-alert class='alert-box alert'>You have already submitted an application.<a href class='close'>x</a></div>")
          }
          else {
              $("#flash_notice").html("<div data-alert class='alert-box alert'>Your submission was unsuccessful.Please ensure you have completed your profile and answered each question before submitting.<a href class='close'>x</a></div>")
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
    $( "#dialog-application-submit" )
        .data('link', this)
        .dialog( "open" );
    });




  $( "#dialog-nomination-submit" ).dialog({
    autoOpen: false,
    width: 500,
    height: 400,
    modal: true,
    buttons: {
      "Confirm Nomination": function () {
        $(this).dialog("close");
        var path = $(this).data('link').href;
        $.post(path, function(response){
          var return_data = response;
          if (return_data['message'] === 'completed'){
            $("#flash_notice").html("<div data-alert class='alert-box success'>Thank you for making a nomination! Stay tuned to see who wins!<a href class='close'>x</a></div>")
          }
          else if (return_data['message'] === 'unable'){
              $("#flash_notice").html("<div data-alert class='alert-box alert'>Sorry, you do not have a nomination available for this campaign.<a href class='close'>x</a></div>")
          }
          else {
              $("#flash_notice").html("<div data-alert class='alert-box alert'>We are sorry but your nomination was unsuccessful.<a href class='close'>x</a></div>")
          }
        });
      },
      "Cancel": function () {
        $(this).dialog("close");
      }

    }
  });


  $(".submit-nomination").click(function(event){
    event.preventDefault();

    $( "#dialog-nomination-submit" )
      .data('link', this)
      .dialog( "open" );
      return false;
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
