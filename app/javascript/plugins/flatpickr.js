import flatpickr from 'flatpickr';
// import 'flatpickr/dist/themes/airbnb.css';
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#datepicker", {
  altInput: true,
  // enableTime: true, <- you can pick time
  // "plugins": [new rangePlugin({ input: "#datepicker" })] <- to do range
});
