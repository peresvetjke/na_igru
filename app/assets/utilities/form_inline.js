import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  
  var edit_controls = $(".form-inline-edit");
  var cancel_controls = $(".form-inline-cancel");
  console.log ('Im alive!!');  
  console.log ('edit_controls.length is '+ edit_controls.length)
  console.log ('cancel_controls.length is '+ cancel_controls.length)
  
  var cancel_controls = $(".form-inline-cancel");

  if (edit_controls.length) {
    for (var i = 0; i < edit_controls.length; i++) {
      console.log('i is' + i)
      edit_controls[i].addEventListener('click', formInlineLinkHandler)
      cancel_controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }
})

function formInlineLinkHandler(event) {
  console.log('Gotcha!')
  console.log('default event.type is' + event.type)

  event.preventDefault();
  var locationId = this.dataset.locationId;
  console.log('locationId is' + this.dataset.locationId)

  formInlineHandler(locationId);
}


function formInlineHandler(locationId) {
  var currentRow = $(".form-inline-row-current").filter(function() { 
    return $(this).data("location-id") == locationId;
  });
  var formInlineRow = $(".form-inline-row-edit").filter(function() { 
    return $(this).data("location-id") == locationId;
  });

  
  currentRow.toggle();
  formInlineRow.toggle();
  console.log('currentRow.length is' + currentRow.length);
  console.log('formInlineRow.length is' + formInlineRow.length);
}