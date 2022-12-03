import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-reveal"
export default class extends Controller {
  static targets = ["modalWindow"]

  connect() {
    console.log(this.modalWindow);
  }

  toggleWindow() {
    console.log("OK");
    this.modalWindowTarget.classList.toggle("display-none")
  }
}
