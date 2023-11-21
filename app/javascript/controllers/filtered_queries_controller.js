import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtered-queries"
export default class extends Controller {
  connect() {
    console.log("Logged");
  }

  static targets = ["query"]
  static values = {
    pig: String,
    cat: String,
    kangaroo: String,
    rabbit: String,
    ferret: String,
    snake: String,
    pig: String
  }

  filter(e) {
    e.preventDefault();
    console.log('Reached filter successfully');
    const query = this.queryTarget.firstElementChild.value

    fetch(`/services?query=${query}`)
    console.log(this.queryTarget);
  }

  highlight(e) {
    console.log('In highlight');
    const btn = e.currentTarget
    btn.classList.toggle('btn-selected');

    if (btn.classList.contains('filter-dog-button')) {
      if (btn.getAttribute('data-filtered-queries-dog-value') == "") {
        btn.setAttribute('data-filtered-queries-dog-value', 'Dog');
      } else {
        btn.setAttribute('data-filtered-queries-dog-value', '');
      }
    }
    else if (btn.classList.contains('filter-cat-button')) {
      if (btn.getAttribute('data-filtered-queries-cat-value') == "") {
        btn.setAttribute('data-filtered-queries-cat-value', 'Cat');
      } else {
        btn.setAttribute('data-filtered-queries-cat-value', '');
      }
    }
    else if (btn.classList.contains('filter-kangaroo-button')) {
      if (btn.getAttribute('data-filtered-queries-kangaroo-value') == "") {
        btn.setAttribute('data-filtered-queries-kangaroo-value', 'Kangaroo');
      } else {
        btn.setAttribute('data-filtered-queries-kangaroo-value', '');
      }
    }
    else if (btn.classList.contains('filter-rabbit-button')) {
      if (btn.getAttribute('data-filtered-queries-rabbit-value') == "") {
        btn.setAttribute('data-filtered-queries-rabbit-value', 'Rabbit');
      } else {
        btn.setAttribute('data-filtered-queries-rabbit-value', '');
      }
    }
    else if (btn.classList.contains('filter-ferret-button')) {
      if (btn.getAttribute('data-filtered-queries-ferret-value') == "") {
        btn.setAttribute('data-filtered-queries-ferret-value', 'Ferret');
      } else {
        btn.setAttribute('data-filtered-queries-ferret-value', '');
      }
    }
    else if (btn.classList.contains('filter-snake-button')) {
      if (btn.getAttribute('data-filtered-queries-snake-value') == "") {
        btn.setAttribute('data-filtered-queries-snake-value', 'Snake');
      } else {
        btn.setAttribute('data-filtered-queries-snake-value', '');
      }
    }
    else if (btn.classList.contains('filter-guinea-pig-button')) {
      if (btn.getAttribute('data-filtered-queries-pig-value') == "") {
        btn.setAttribute('data-filtered-queries-pig-value', 'Guinea pig');
      } else {
        btn.setAttribute('data-filtered-queries-pig-value', '');
      }
    }
  }
}
