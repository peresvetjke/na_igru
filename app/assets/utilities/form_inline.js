import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  var edit_controls = $(".form-inline-edit");
  var cancel_controls = $(".form-inline-cancel");
  var errors = $(".errors")[0]  

  if (errors) {
    var resourceId = $(".errors")[0].dataset.resourceId;
    formInlineHandler(resourceId);
  }

  if (edit_controls.length) {
    for (var i = 0; i < edit_controls.length; i++) {
      edit_controls[i].addEventListener('click', formInlineLinkHandler)
      cancel_controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault();
  var resourceId = this.dataset.resourceId;
  
  formInlineHandler(resourceId);
}


function formInlineHandler(resourceId) {
  var currentRow = $(".form-inline-row-current").filter(function() { 
    return $(this).data("resource-id") == resourceId;
  });
  var formInlineRow = $(".form-inline-row-edit").filter(function() { 
    return $(this).data("resource-id") == resourceId;
  });

  currentRow.toggle();
  formInlineRow.toggle();
}