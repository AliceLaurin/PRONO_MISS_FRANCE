// app/javascript/controllers/myfifteen_destroy_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  destroy(event) {
    event.preventDefault();

    const destroyButton = event.currentTarget;
    const url = destroyButton.getAttribute("data-url");

    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        Accept: "text/vnd.turbo-stream.html, text/html, application/xhtml+xml",
        "Content-Type": "application/vnd.turbo-stream.html+json",
      },
    })
      .then((response) => response.text())
      .then((html) => Turbo.renderStreamMessage(html));
  }
}
