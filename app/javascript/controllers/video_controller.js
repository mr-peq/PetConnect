import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="video"
export default class extends Controller {
  connect() {
    this.element.playbackRate = 1.5; // Change 1.5 to your desired speed
  }
}
