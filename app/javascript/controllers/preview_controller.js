import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"]; // se usar target, senão pode remover

  update(event) {
    const input = event.target;
    const preview = document.getElementById("preview");

    if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = (e) => {
        preview.src = e.target.result;
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
}
