var Form = {
  init: function(){
    this.pages = [$('#app_page_1'), $('#app_page_2'), $('#app_page_3')];
    this.currentPage = 0;
  },

  nextPage: function(){
    this.currentPage += 1;
  },
  prevPage: function(){
    this.currentPage -= 1;
  },

  getNextPage: function(){
    return this.pages[this.currentPage + 1];
  },

  getCurrentPage: function(){
    return this.pages[this.currentPage];
  },
  getPrevPage: function(){
    return this.pages[this.currentPage - 1];
  }
};



function saveForm ($form, $textBox){
  var status;
  $.ajax({
      url: $form.attr("action"),
      type: "POST",
      data: $form.serialize(),
      dataType: "JSON"
    }).done(function(data, textStatus, jqXHR) {
      flashTextBox($textBox);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      flashError();
    });
}

function flashSuccess(){
  // flashTextBox($textBox);
  $("#flash_notice").html("<div data-alert class='alert-box success'>Form saved!<a href class='close'>x</a></div>");
}
function flashError(){
  $("#flash_notice").html("<div data-alert class='alert-box alert'>There was an error saving the form.<a href class='close'>x</a></div>");
}

function flashTextBox($box){
  $box.addClass('flash-box');
  setTimeout(
      function() { $box.removeClass('flash-box'); },
      400
  );
}



$(document).ready(function() {
  Form.init();

  $(".application-form-field").on('focusout', function(e) {
    var textBox = $(e.delegateTarget);
    var form = textBox.closest('form');
    saveForm(form, textBox);
  });


  $(".next-app-page").on('click', function(e) {
    e.preventDefault();
    Form.getCurrentPage().hide();
    Form.getNextPage().show();
    Form.nextPage();
  });
  $("form.edit_application").on('click', ".prev-app-page", function(e) {
    e.preventDefault();
    Form.getCurrentPage().hide();
    Form.getPrevPage().show();
    Form.prevPage();
  });
});


// $(document).ready(function() {
//   $("#new_comment").submit(function(e) {
//     e.preventDefault();
//     var form = $(this);

//     $.ajax({
//         url: form.attr("action"),
//         type: "POST",
//         data: form.serialize(),
//         dataType: "JSON",
//     }).done(function(data, textStatus, jqXHR) {
//       $(".comments-list").append(data.comment);
//     }).fail(function(jqXHR, textStatus, errorThrown) {
//       alert("Sorry, unable to save your comment.");
//     });
//   });
// });
