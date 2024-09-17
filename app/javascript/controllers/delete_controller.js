// app/javascript/controllers/delete_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  delete(event) {
    event.preventDefault()
    if (confirm('Are you sure?')) {
      fetch(this.urlValue, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Content-Type': 'application/json'
        }
      })
        .then(response => {
          if (response.ok) {
            window.location.href = '/'
          } else {
            alert('Failed to delete the review.')
          }
        })
    }
  }
}