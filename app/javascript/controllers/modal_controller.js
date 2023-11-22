import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"];

  connect() {
    console.log("Hello from modal")
  }

  open() {
    this.modalTarget.style.display = "block";
  }

  close() {
    this.modalTarget.style.display = "none";
  }

  clickOutside(event) {
    if (event.target == this.modalTarget) {
      this.close();
    }
  }
}
