import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebarButton", "sidebarLogo", "sidebarNew"];

  toggle() {
    if (this.element.classList.contains("sidebar-small")) {
      this.element.classList.remove("sidebar-small");
      this.element.classList.add("sidebar-wide");
    } else {
      this.element.classList.remove("sidebar-wide");
      this.element.classList.add("sidebar-small");
    }
  }

  connect() {
    console.log(this.element);
  }
}
