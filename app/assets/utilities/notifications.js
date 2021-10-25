import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  var controls = $(".ajax.notifications");

  for (var i = 0; i < controls.length; i++) {
    console.log('Got the control..')  
    controls[i].addEventListener('click', multipleActionHadler)
  }

})

function multipleActionHadler() {
  console.log('Lets do this!')
  event.preventDefault();
  
  // console.log('This is ... Sparta! no.. its '+ this)
  var parentResourceId = $(this).attr('data-id');
  console.log('parentResourceId IS ' + parentResourceId);
  console.log("$(this).attr('data-id') IS " + $(this).attr("data-id"));
  var checkboxType = 'ids';
  var ids = extractIds(checkboxType);  
  console.log('ids are ' + ids);
  sendMarkAsReadRequest(parentResourceId, ids)
}

function extractIds(checkboxType) {
  var ids = [];
  var controlsResource = $(".check_box_resource.ids")
  var controlsResourceChecked = controlsResource.filter(function (index) { 
    return this.checked == true; 
  });

  for (var i = 0; i < controlsResourceChecked.length; i++) {
      ids.push($(controlsResourceChecked[i]).data('id'));
  }

  return ids;
}

function sendMarkAsReadRequest(parentResourceId, ids) {

  $.ajax({
  type: "PATCH",
  url: `/players/${parentResourceId}/notifications/mark_as_read`,
  data: { ids: ids },
  statusCode: {
  404: function() {
    alert( "Please select at least one record." );
  }
  }
})}



