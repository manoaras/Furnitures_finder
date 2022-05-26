import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput' ]
  connect() {
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      //dateFormat: "d-m-Y",
      minDate: new Date(),
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }
}
