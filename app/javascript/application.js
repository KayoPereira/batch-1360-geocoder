// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import { Application } from "@hotwired/stimulus"
import SearchController from "./controllers/search_controller.js"


window.Stimulus = Application.start()

Stimulus.register("search", SearchController)

document.addEventListener("DOMContentLoaded", function() {
  flatpickr("#going", {
    dateFormat: "d/m/Y",
    // Opções personalizadas do Flatpickr, se necessário
  });
});

document.addEventListener("DOMContentLoaded", function() {
  flatpickr("#back", {
    dateFormat: "d/m/Y",
    // Opções personalizadas do Flatpickr, se necessário
  });
});