import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["popin"]

  connect() {
    console.log(this.popinTarget);
  }

  open() {
    // Your open logic goes here
  }
}
