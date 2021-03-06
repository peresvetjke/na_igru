// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../../assets/utilities/filter.js"
import "../../assets/utilities/form_inline.js"
import "../../assets/utilities/select_all.js"
import "../../assets/utilities/notifications.js"
import "../../assets/utilities/invites.js"

global.$ = require('jquery')//, require('jquery-ui'), require('jquery-blockui')
Rails.start()
Turbolinks.start()
ActiveStorage.start()

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});
