import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';

// Connects to data-controller="flatpicker"
export default class extends Controller {
    connect() {
        const tripContainer = document.querySelector('[data-trip-start]');
        const tripStart = tripContainer.getAttribute('data-trip-start');
        const tripEnd = tripContainer.getAttribute('data-trip-end');

        let endTimeManuallySet = false;

        let startTimePicker = flatpickr('.start_time', {
            minDate: tripStart,
            maxDate: tripEnd,
            enableTime: true,
            allowInput: true,
            altInput: 'M/j: h:i K',
            onChange: function(selectedDates, dateStr, instance) {
                if (selectedDates[0]) {
                    let newMinDate = new Date(selectedDates[0]);
                    newMinDate.setMinutes(newMinDate.getMinutes() + 1);
                    endTimePicker.set('minDate', newMinDate);
                }

                if (!endTimeManuallySet) {
                    let defaultEndDate = new Date(selectedDates[0]);
                    defaultEndDate.setHours(defaultEndDate.getHours() + 1);
                    endTimePicker.setDate(defaultEndDate, true);
                }
            }
        });

        let endTimePicker = flatpickr('.end_time', {
            minDate: tripStart,
            maxDate: tripEnd,
            enableTime: true,
            allowInput: true,
            altInput: 'M/j: h:i K',
            onChange: function() {
                endTimeManuallySet = true;
            }
        });

        flatpickr('.date', {
        });
    }
}
