import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  modal =  document.getElementById("add-category-modal");

  open() {
    if (!this.modal) {
      console.error("Element is not defined");
      return;
    }

    if (!this.modal.classList.contains("hidden")) {
      console.log("Modal is already open");
      return;
    }

    console.log("Opening modal");
    this.modal.classList.remove("hidden");
  }

  close() {
    this.modal.classList.add("hidden")
  }

  create(event) {
    event.preventDefault()
    const form = event.target
    console.log(form);
    const formData = new FormData(form)

    fetch(form.action, {
      method: "POST",
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
    })
      .then(response => response.json())
      .then(data => {
        if (data.id) {
          const categorySelect = document.querySelector("select[name='blog[category_id]']")
          const newOption = document.createElement("option")
          newOption.value = data.id
          newOption.text = data.name
          categorySelect.add(newOption)
          categorySelect.value = data.id
          this.close()
        }
      })
  }
}