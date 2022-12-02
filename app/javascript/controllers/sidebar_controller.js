import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["wideBar", "smallBar", "wideButton", "smallButton"];

  toggle() {
    this.wideBarTarget.classList.toggle("hidden");
    this.smallBarTarget.classList.toggle("hidden");
    this.wideBarTarget.style.display =
    this.wideBarTarget.style.display === "none" ? "block" : "none";
  this.smallBarTarget.style.display =
    this.smallBarTarget.style.display === "none" ? "block" : "none";
  }

  connect() {
    this.wideBarTarget.style.display = "none";
    this.smallBarTarget.style.display = "block";
  }
}
