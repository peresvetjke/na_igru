import Rails from '@rails/ujs';

document.addEventListener("turbolinks:load", () => {
  // %table#clients_list
  // %td.draft_timesheets_count= client.timesheets.draft.count
  // = link_to 'Update draft timesheets count', counts_clients_path, remote: true, data: { type: :json }, id: 'update_draft_timesheets'

  var notificationsTable = $("#notifications_list")
  var controls = $(".get_notifications")
  console.log('notificationsTable ? yes its '+notificationsTable)

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener("ajax:success", (event) => {
        const [_data, _status, xhr] = event.detail;
        updateTable(notificationsTable, _data);
        });   
    }  
  }

})

function updateTable(notificationsTable, _data) {
  console.log('who is notificationsTable ? maybe its '+ notificationsTable)
  notificationsTable.find("tr").not(".heading").remove() // clear current content
  $(_data).each(function() {
    var newRowContent = `<tr><td>${this.body}</td><td>${this.created_at}</td><td>${this.game_id}</td></tr>`
    $('#notifications_list > tbody:last-child').append(newRowContent); // add new content
  });
}