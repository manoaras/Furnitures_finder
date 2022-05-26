import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    console.log('Hello from flatpickr')
    flatpickr('.datepickr', {
      enableTime: false,
      minDate: new Date()
    });
  }
}
