import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="smooth-scroll"
export default class extends Controller {
  static values = { targetId: String }

  connect() {
    console.log("Hello from the smooth scroll")
  }

  scrollTo() {
    const element = document.getElementById(this.targetIdValue);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  }
}
