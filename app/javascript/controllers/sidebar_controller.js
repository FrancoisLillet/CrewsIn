import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebarButton", "sidebarLogo", "sidebarNew"];

  toggle() {
    if (this.element.classList.contains("sidebar-small")) {
      this.element.classList.remove("sidebar-small");
      this.element.classList.add("sidebar-wide");
      sessionStorage['sidebarStatus'] = "sidebar-wide";
    } else {
      this.element.classList.remove("sidebar-wide");
      this.element.classList.add("sidebar-small");
      sessionStorage['sidebarStatus'] = "sidebar-small";
    }
  }

  connect() {
    if(sessionStorage['sidebarStatus'] === 'sidebar-small') {
      this.element.classList.remove("sidebar-wide");
      this.element.classList.add("sidebar-small");
      sessionStorage['sidebarStatus'] = "sidebar-small";
    } else {
      this.element.classList.remove("sidebar-small");
      this.element.classList.add("sidebar-wide");
      sessionStorage['sidebarStatus'] = "sidebar-wide";
    }

  }
}
