import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["list"];

  connect() {
    this.sortable = Sortable.create(this.listTarget, {
      onEnd: this.end.bind(this),
      animation: 150
    });
  }

  end(event) {
    const ids = Array.from(this.listTarget.children).map(child => child.dataset.id);

    fetch('/reorder/update_sections_order', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ ids: ids })
    }).then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    }).then(data => {
      if (data.message) {
        alert(data.message);
      } else if (data.error) {
        alert(data.error);
      }
    }).catch(error => {
      console.error('There was a problem with the fetch operation:', error);
    });
  }
}

