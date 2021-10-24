import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  var edit_controls = $(".form-inline-edit");
  var cancel_controls = $(".form-inline-cancel");
  var errors = $(".errors")[0]  



  console.log('edit_controls.length is ' + edit_controls.length)
  if (edit_controls.length) {
    for (var i = 0; i < edit_controls.length; i++) {
      edit_controls[i].addEventListener('click', formInlineLinkHandler)
      cancel_controls[i].addEventListener('click', formInlineLinkHandler)
      
      // assignResourceIdToRowsClassList ; 
      var cancelControl = cancel_controls[i]
      var resourceId = $(cancelControl).data("id")
      var formInlineRow = $(cancelControl).parents("tr")[0]
      $(formInlineRow).attr("data-id", resourceId);
    }
  }

  if (errors) {
    var resourceId = $(".errors")[0].dataset.id;
    formInlineHandler(resourceId);
  }
  
})

function formInlineLinkHandler(event) {
  event.preventDefault();
  var resourceId = this.dataset.id;
  
  formInlineHandler(resourceId);
}


function formInlineHandler(resourceId) {
  var currentRow = $(".form-inline-row-current").filter(function() { 
    // return $(this).children("tr").data("id") == resourceId;
    return $(this).data("id") == resourceId;
  });
  var formInlineRow = $(".form-inline-row-edit").filter(function() { 
    return $(this).data("id") == resourceId;
  });

  currentRow.toggle();
  formInlineRow.toggle();
}