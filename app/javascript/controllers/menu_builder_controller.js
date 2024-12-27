import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["list"]; // Declare `list` as a target for the sortable menu

  connect() {
    // Initialize Sortable.js with the `listTarget`
    this.sortable = new Sortable(this.listTarget, {
      animation: 150,
      onEnd: (event) => this.reorder(event), // Trigger `reorder` on end of sorting
    });

    console.log("Menu drag-and-drop initialized!");
  }

  reorder(event) {
    // Collect and map the sorted element IDs based on their order in the list
    const sortedIds = Array.from(this.listTarget.children).map(
      (child) => parseInt(child.dataset.sectionId, 10) // Convert to integers
    );

    // Send the updated order to the server
    this.updateOrder(sortedIds);
    console.log("Sorted IDs being sent:", sortedIds);
  }

  updateOrder(sortedIds) {
    // Perform a POST request to the backend with the new order of IDs
    fetch("/update_sections_order", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ ids: sortedIds }), // Include the sorted IDs in the body
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to update order");
        }
        return response.json();
      })
      .then((data) => {
        console.log("Order updated successfully:", data);
      })
      .catch((error) => {
        console.error("Error updating order:", error);
      });
  }

  disconnect() {
    // Destroy the Sortable.js instance when the controller disconnects
    if (this.sortable) {
      this.sortable.destroy();
      console.log("Menu drag-and-drop destroyed.");
    }
  }
}