import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="filtered-queries"
export default class extends Controller {
  connect() {
    console.log("Logged");
    const index = window.location.toLocaleString().search(/filters/)
    const filters = window.location.toLocaleString().slice(index + "filters=".length).split(',')
    console.log(filters);
    // console.log(this.DogTarget);
    // console.log(this.constructor.targets);
    // console.log(this[`${filters[0]}Target`]);
    // console.log(this[`${filters[1]}Target`]);
    filters.forEach((animal) => {
      this[`${animal}Target`].classList.add('btn-selected')
    })
    this.constructor.targets.forEach((btn) => {
      // if()
    })
  }

  static targets = [
    "query",
    "services",
    "Dog",
    "Cat",
    "Ferret",
    "Kangaroo",
    "Rabbit",
    "Snake",
    "GuineaPig"
  ]
  static values = {
    dog: String,
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

    const pet_categories = ['Dog', 'Cat', 'Kangaroo', 'Rabbit', 'Ferret', 'Snake', 'Guinea Pig']
    const query = this.queryTarget.firstElementChild.value
    const filtersArray = Object.values(this.element.dataset).filter((value) => pet_categories.includes(value))

    const url = `/services?query=${query}&filters=${filtersArray}`
    Turbo.visit(url)
  }

  highlight(e) {
    console.log('In highlight');
    const btn = e.currentTarget
    btn.classList.toggle('btn-selected');

    if (btn.classList.contains('filter-dog-button')) {
      if (this.dogValue == "") {
        this.dogValue = "Dog"
      } else {
        this.dogValue = ""
      }
    }
    else if (btn.classList.contains('filter-cat-button')) {
      if (this.catValue == "") {
        this.catValue = "Cat";
      } else {
        this.catValue = "";
      }
    }
    else if (btn.classList.contains('filter-kangaroo-button')) {
      if (this.kangarooValue == "") {
        this.kangarooValue = "Kangaroo";
      } else {
        this.kangarooValue = "";
      }
    }
    else if (btn.classList.contains('filter-rabbit-button')) {
      if (this.rabbitValue == "") {
        this.rabbitValue = "Rabbit";
      } else {
        this.rabbitValue = "";
      }
    }
    else if (btn.classList.contains('filter-ferret-button')) {
      if (this.ferretValue == "") {
        this.ferretValue = "Ferret";
      } else {
        this.ferretValue = "";
      }
    }
    else if (btn.classList.contains('filter-snake-button')) {
      if (this.snakeValue == "") {
        this.snakeValue = "Snake";
      } else {
        this.snakeValue = "";
      }
    }
    else if (btn.classList.contains('filter-guinea-pig-button')) {
      if (this.pigValue == "") {
        this.pigValue = "GuineaPig";
      } else {
        this.pigValue = "";
      }
    }
  }
}
