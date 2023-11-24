import { Controller } from "@hotwired/stimulus"
import noUiSlider from "nouislider"
// import * as noUiSlider from 'nouislider';
// import 'nouislider/dist/nouislider.css';

// Connects to data-controller="slider"
export default class extends Controller {
  connect() {
    const slider = document.getElementById('slider')
    const maximum_price = +(document.getElementById('maxPrice').innerText);
    const valuesForSlider = [...Array(maximum_price + 1).keys()];
    const format = {
      to: function(value) {
          return valuesForSlider[Math.round(value)];
      },
      from: function (value) {
          return valuesForSlider.indexOf(Number(value));
      }
    };

    noUiSlider.create(slider, {
      start: [0, maximum_price],
      connect: true,
      step: 1,
      tooltips: true,
      format: format,
      range: {
        'min': 0,
        'max': maximum_price,
      },
    });

    slider.noUiSlider.on('update', (values, handle) => {
      const [min, max] = values;
      console.log(values);
      // document.getElementById('min_price').value = min;
      // document.getElementById('max_price').value = max;
    });
  }
}
