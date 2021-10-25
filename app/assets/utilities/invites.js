import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  var controls = $(".ajax.invites");
  console.log('Got the control')
  for (var i = 0; i < controls.length; i++) {
    controls[i].addEventListener('click', multipleActionHadler)
  }

})

function multipleActionHadler() {
  console.log('Feel thrill!')
  event.preventDefault();
  
  var parentResourceId = $(this).attr('data-id');
  var checkboxType = 'ids';
  var ids = extractIds(checkboxType);  
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
  type: "POST",
  url: `/games/${parentResourceId}/invites/send_multiple`,
  data: { ids: ids },
  statusCode: {
  404: function() {
    alert( "Please select at least one record." );
  }
  }
})}



