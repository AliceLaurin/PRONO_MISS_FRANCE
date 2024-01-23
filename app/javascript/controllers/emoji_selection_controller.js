import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="emoji-selection"
export default class extends Controller {
  static targets = ["label"];

// Inside your Stimulus controller
  connect() {
    console.log("Emoji selection controller connected");
  }
  select(event) {
    this.labelTargets.forEach((label) => {
      label.classList.remove('selected');
    });
    event.currentTarget.classList.add('selected');
  }


  close() {
    console.log("Closing modal");
    let modalContainer = this.element.closest('.modale');
    if (modalContainer) {
      modalContainer.remove();
    }
  }

}
