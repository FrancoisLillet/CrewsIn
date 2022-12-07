import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["password", "confirmPassword", "message"];

  confirmPasswordTargetConnected() {
    console.log("hi");
  }

  update() {
    console.log(this.element);
  }

  connect() {
    console.log(this.element);
  }
}
