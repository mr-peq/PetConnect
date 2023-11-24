import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab"];

  connect() {
    const hash = window.location.hash;
    if (hash) {
      const tabToShow = this.tabTargets.find(tab => `#${tab.id}` === hash);
      if (tabToShow) {
        new bootstrap.Tab(tabToShow).show(); // If using Bootstrap
      }
    }
  }
}
