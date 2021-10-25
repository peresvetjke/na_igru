import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  // for "all" checkboxes: class: "check_box_all" id: "attended_all"
  // for chilren elements: class: "check_box_resource attended" 

  var controlsAll = $(".check_box_all");
  var controlsResource = $(".check_box_resource");

  if (controlsAll.length) {
    for (var i = 0; i < controlsAll.length; i++) {
      controlsAll[i].addEventListener('change', formCheckboxAllHandler)
    }

    for (var i = 0; i < controlsResource.length; i++) {
      controlsResource[i].addEventListener('change', formCheckboxResourceHandler)
    }
  }
})

function formCheckboxAllHandler(event) {
  var checkboxTypeClass = this.id.split("_")[0];
  var checkboxes = $(`.${checkboxTypeClass}`);

  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = $(`#${checkboxTypeClass}_all`)[0].checked
    checkboxes[i].addEventListener('change', formCheckboxResourceHandler)
  }
}

function formCheckboxResourceHandler(event) {
  var checkboxClasslist = document.getElementById(this.id).className.split(/\s+/);
  var checkboxType = `${checkboxClasslist[checkboxClasslist.length - 1]}`;
  console.log('checkboxType IS '+ checkboxType);
  var checkboxAll = $(`#${checkboxType}_all`)[0];
  var controlsResource = $(`.check_box_resource.${checkboxType}`);
  console.log('controlsResource.length IS '+ controlsResource.length);
    var sum = 0;
    for (var i = 0; i < controlsResource.length; i++) {
      if (controlsResource[i].checked) {sum++}
    }
  
  if (checkboxAll.checked === true && (sum !== controlsResource.length)) {
    checkboxAll.checked = false
  } 

  if (checkboxAll.checked === false && (sum === controlsResource.length)) {
    checkboxAll.checked = true
  }

  
}