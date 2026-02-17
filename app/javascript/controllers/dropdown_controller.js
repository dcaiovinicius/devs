// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    document.addEventListener("click", this.handleClickOutside.bind(this));
  }

  disconnect() {
    document.removeEventListener("click", this.handleClickOutside.bind(this));
  }

  toggle(event) {
    event.stopPropagation();
    this.menuTarget.classList.toggle("hidden");

    console.log(event);
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden");
    }
  }

  escape(event) {
    if (event.key === "Escape") {
      this.menuTarget.classList.add("hidden");
    }
  }
}
