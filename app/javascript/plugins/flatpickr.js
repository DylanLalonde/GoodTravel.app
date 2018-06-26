import flatpickr from "flatpickr"

import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".show-calendar-form", {
  minDate: "today",
  // mode: "range",
  inline: true,
  disable: [
  function(date) {
            // disable every multiple of 8
            return !(date.getDate() % 4);
          }
          ]
        })

flatpickr(".booking-calendar-form", {
  enableTime: true,
  minDate: "today",
  weekNumbers: true,

})
