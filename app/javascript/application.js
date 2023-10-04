//= require mazer/initTheme
//= require mazer/bootstrap
//= require mazer/app
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// Stymulus not work when comment next lines. Session logout fail too
import "@hotwired/turbo-rails"
import "controllers"

// Nexts are event tests using turbo

// Next line don't work after load link with turbo, I suppose don't work because call to showAlert directly
//document.addEventListener("turbo:load", showAlert("turbo:load"))

// Next add event after click to link using turbo. Other events don't work because require add events in turbo:load
// This override DOMContentLoaded event
document.addEventListener("turbo:load", function() {
  showAlert("turbo:load");
});

//document.addEventListener("turbo:render", showAlert("turbo:render"))

// Next add event after login using turbo. Other events don't work because require add events in turbo:render
document.addEventListener("turbo:render", function() {
  showAlert("turbo:render");
});

//document.addEventListener("DOMContentLoaded", showAlert("DOMContentLoaded"))
document.addEventListener("DOMContentLoaded", function() {
  showAlert("DOMContentLoaded");
});

function showAlert(origin) {
  const element = document.getElementsByClassName("iconify iconify--system-uicons")[0];
  element.onclick = function() { alert(origin) };
}
