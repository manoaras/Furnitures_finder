import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timeout"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.classList.add("d-none")
    }, 4000)
  }

}
