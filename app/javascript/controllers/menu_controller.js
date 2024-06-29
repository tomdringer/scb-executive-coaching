import { Controller } from "@hotwired/stimulus"

export default class MenuController extends Controller {
  static targets = [ "nav"]

  updateNav(event) {
    event.preventDefault();
    event.stopPropagation();
    this.navTarget.classList.toggle('hidden');
  }
}