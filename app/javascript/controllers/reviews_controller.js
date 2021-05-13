import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "link", "cancel"]
  toggle(event) {
    event.preventDefault();
    this.formTarget.classList.toggle("hidden");
    this.linkTarget.classList.toggle("hidden");
  }
}
