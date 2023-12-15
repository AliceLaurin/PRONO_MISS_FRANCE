import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete-search"
export default class extends Controller {
  static targets = ["input", "list", "form"];

  connect() {
    // console.log("kinderpingui");
    // console.log(this.listTarget);
    // console.log(this.formTarget);
  }

  autocomplete(event) {
    event.preventDefault();
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    console.log("Fetching:", url);

    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => {
        if (!response.ok) {
          throw new Error(`Network response was not ok: ${response.status}`);
        }
        return response.text();
      })
      .then(data => {
        console.log("Received data:", data);
        this.listTarget.outerHTML = data;
      })
      .catch(error => console.error("Fetch error:", error));
  }

}
