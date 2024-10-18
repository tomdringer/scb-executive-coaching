import { Controller } from "@hotwired/stimulus"

export default class CategoriesController extends Controller {
  static targets = ["categorySelect", "newCategoryField", "editCategoryField"]

  connect() {
    this.categorySelect = this.element.querySelector("#category_select");
    this.newCategoryField = this.element.querySelector("#new_category_field");
    this.editCategoryField = this.element.querySelector("#edit_category_field");
    console.log('CategoryController connected');
  }

  newCategoryInput() {
    if (this.categorySelect.value === "new_category") {
      this.newCategoryField.classList.remove('hidden');
      this.editCategoryField.classList.add('hidden');
    } else {
      this.newCategoryField.classList.add('hidden');
      this.editCategoryField.classList.remove('hidden');
      this.editCategoryField.querySelector("input").value = this.categorySelect.options[this.categorySelect.selectedIndex].text;
    }
  }

  saveCategory(event) {
    event.preventDefault();
    const newCategoryName = this.newCategoryField.querySelector("input").value;

    fetch("/categories", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ category: { name: newCategoryName } })
    })
      .then(response => response.json())
      .then(data => {
        if (data.id) {
          const option = document.createElement("option");
          option.value = data.id;
          option.text = data.name;
          this.categorySelect.appendChild(option);
          this.categorySelect.value = data.id;
          this.newCategoryField.classList.add('hidden');
        } else {
          alert("Error saving category");
        }
      });
  }

  updateCategory(event) {
    event.preventDefault();
    const categoryId = this.categorySelect.value;
    const updatedCategoryName = this.editCategoryField.querySelector("input").value;
    console.log("Updated category name:", updatedCategoryName);


    fetch(`/categories/${categoryId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ category: { name: updatedCategoryName } })
    })
      .then(response => response.json())
      .then(data => {
        if (data.id) {
          const option = this.categorySelect.querySelector(`option[value='${data.id}']`);
          option.text = data.name;
          this.editCategoryField.classList.add('hidden');
        } else {
          alert("Error updating category");
        }
      });
  }
}