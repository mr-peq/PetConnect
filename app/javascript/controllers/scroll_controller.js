import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["cards"]

  scrollLeft() {
    console.log("scroll left")
    this.cardsTarget.scrollBy({ left: -317, behavior: 'smooth' });
  }

  scrollRight() {
    console.log("scroll right")
    this.cardsTarget.scrollBy({ left: 317, behavior: 'smooth' });
  }
}
