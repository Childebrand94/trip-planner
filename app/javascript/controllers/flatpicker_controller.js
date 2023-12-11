import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';

// Connects to data-controller="flatpicker"
export default class extends Controller {
    connect() {
        flatpickr('.start_time', {
            enableTime: true,
            dateFormat: 'F j, Y h:i K',
        });
        flatpickr('.end_time', {
            enableTime: true,
            dateFormat: 'F j, Y h:i K',
        });
    }
}
