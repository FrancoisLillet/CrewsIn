import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["profile"];

  profileTargetConnected(element) {
    VanillaTilt.init(element, {
      max: 10,
      reverse: true,
      glare: true,
      "max-glare": 0.050,
      "glare-prerender": false,
    });
  }

  connect() {  }
}
