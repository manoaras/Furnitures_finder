// app/javascript/controllers/dynamic_booking_price_controller.js
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="dynamic-booking-price"
export default class extends Controller {
// retrieve the three needed targets
static targets = [ 'startDateInput', 'endDateInput', 'priceHolder', 'totalPriceHolder' ]
// retrieve the pokemon's price_per_day value
static values = { night: Number }

  update() {
    const start = document.getElementById('booking_start_date').value
    const end = document.getElementById('booking_end_date').value

    if (start && end) {
      const dateStart = Date.parse(start)
      const dateEnd = Date.parse(end)
      const diffTime = Math.ceil((dateEnd - dateStart) / ( 1000 * 60 * 60 * 24))
      const intermediatePrice = (diffTime * this.nightValue)
      this.priceHolderTarget.innerText = intermediatePrice
      this.totalPriceHolderTarget.innerText = (intermediatePrice + 9)
    }
  }
}
