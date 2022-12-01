import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect () {
    console.log(this.formTarget)
  }
  submitForm () {
    this.formTarget.submit();
  }
}
