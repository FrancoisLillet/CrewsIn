import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-reveal"
export default class extends Controller {
  static targets = ["content", "arrow"]

  revealContent() {
    this.contentTarget.classList.toggle("display-none")
    this.arrowTarget.classList.toggle("flipped")
  }
}
