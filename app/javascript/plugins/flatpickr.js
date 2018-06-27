import flatpickr from "flatpickr"

import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".show-calendar-form", {
  minDate: "today",
  dateFormat: "Y-m-d H:i",
  altFormat: "F j, Y",
    // mode: "range",
  inline: true,
  disable: [
  function(date) {
            // disable every multiple of 5
            return !(date.getDate() % 5);
          }
          ]
        })

flatpickr(".booking-calendar-form", {
  // enableTime: true,
  minDate: "today",
  // weekNumbers: true,
  inline: true,
  dateFormat: "Y-m-d H:i",
  altFormat: "F j, Y",
})


flatpickr(".booking-time-form", {
 enableTime: true,
 noCalendar: true,
 dateFormat: "H:i",
 // time_24hr: true,
 // minDate: "09:00",
 // maxDate: "20:30",
})
