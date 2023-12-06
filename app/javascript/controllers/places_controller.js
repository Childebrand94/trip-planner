import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input"];
    connect() {
        console.log("Connected to PlacesController");
    }

    initMap() {
        console.log("init map call");
        new google.map.places.Autocomplete(this.inputTarget, {
            fields: ["address_componenets", "geometry"],
            types: ["addess"],
        });
        this.autocomplete.addListener(
            "place_changed",
            this.placeSelected.bind(this),
        );
    }

    placeSelected() {
        const place = this.autocomplete.getPlace();
        console.log(place);
    }
}
