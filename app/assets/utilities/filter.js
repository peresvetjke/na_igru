import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  var control = $("#search_text");

  if (control) {
    var tableBody = $("table tbody").append("<tr id='no_selection'><td>No selection</td><td></td><td></td></tr>");
    var noSelectionMarkup = $("#no_selection");
    noSelectionMarkup.hide();

    control.bind('input propertychange', function filterRows() {
      var value = control.val();
  
      var match = $("tr").filter(function (index) { return this.textContent.search(value) >= 0; } ).show();
      var notMatch = $("tr").filter(function (index) { return index > 0 && this.textContent.search(value) === -1; } ).hide();

      if (match.length === 0) {
        noSelectionMarkup.show();
      } else {
        noSelectionMarkup.hide();
      }
    })
  }
})