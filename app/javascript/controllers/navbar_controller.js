// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     this.isHomepage = document.body.classList.contains("homepage");
//     this.lastScrollTop = 0;
//     window.addEventListener('scroll', this.handleScroll.bind(this));

//     if (!this.isHomepage) {
//       this.element.classList.remove("d-none");
//     }
//   }

//   handleScroll() {
//     let currentScroll = window.pageYOffset || document.documentElement.scrollTop;

//     if (this.isHomepage) {
//       if (currentScroll > this.lastScrollTop) {
//         this.element.classList.add("d-none");
//       } else {
//         this.element.classList.remove("d-none");
//       }
//     }

//     this.lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
//   }

//   disconnect() {
//     window.removeEventListener('scroll', this.handleScroll);
//   }
// }
