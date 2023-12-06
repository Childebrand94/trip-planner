import "@hotwired/turbo-rails";
import "controllers";
import "./add_jquery";
import "@propperjs/core";
import "../stylesheets/custom_bootstrap";

window.initMap = function (...args) {
    console.log("InitMap call");
    const event = document.createEvent("Events");
    event.initEvent("google-maps-callback", true, true);
    event.args = args;
    window.dispatchEvent(event);
};
