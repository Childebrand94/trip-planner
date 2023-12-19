import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';

// Connects to data-controller="flatpicker"
export default class extends Controller {
    connect() {
        const tripContainer = document.querySelector('[data-trip-start]');
        const tripStart = tripContainer.getAttribute('data-trip-start');
        const tripEnd = tripContainer.getAttribute('data-trip-end');

        flatpickr('.start_time', {
            minDate: tripStart,
            maxDate: tripEnd,
            enableTime: true,
            altInput: 'M/j: h:i K',
        });
        flatpickr('.end_time', {
            minDate: tripStart,
            maxDate: tripEnd,
            enableTime: true,
        });

        flatpickr('.date', {
        });
    }
}
