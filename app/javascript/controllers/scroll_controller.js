import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["arrow", "endPoint"];

  scroll() {
    this.endPointTarget.scrollIntoView({ behavior: "smooth" });
  }

  connect() {
    this.element.scrollTop = document.documentElement.scrollTop = 0;
  }
}
