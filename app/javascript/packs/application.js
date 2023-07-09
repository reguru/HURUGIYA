// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import './preview'
import './new-preview'
import './animation'
import '../stylesheets/mystyle.css'
import '../stylesheets/top.css'
import '../stylesheets/index.css'
import '../stylesheets/new.css'
import '../stylesheets/mypage.css'
import '../stylesheets/show.css'
import '../stylesheets/edit.css'
import '../stylesheets/map.css'
import '../stylesheets/animation.css'

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

