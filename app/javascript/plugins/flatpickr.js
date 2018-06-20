import flatpickr from "flatpickr"

import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".datepicker", {
  enableTime: true,
  minDate: "today",
  weekNumbers: true,
  // mode: "range",
})
