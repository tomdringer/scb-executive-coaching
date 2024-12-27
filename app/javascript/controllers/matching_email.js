import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["email", "emailConfirmation", "error"];

  connect() {
    if (!this.isContactUsPage()) return;

    console.log("Contact Us Stimulus Controller connected!");
  }

  isContactUsPage() {
    // Ensure the controller only runs on the `/contact_us` page
    return window.location.pathname === "/contact_us";
  }

  submit(event) {
    event.preventDefault(); // Prevent default form submission

    const email = this.emailTarget.value;
    const emailConfirmation = this.emailConfirmationTarget.value;

    if (!email || !emailConfirmation) {
      this.errorTarget.textContent = "Both email fields are required.";
      return;
    }

    if (email !== emailConfirmation) {
      this.errorTarget.textContent = "The emails do not match!";
    } else {
      this.errorTarget.textContent = ""; // Clear any error messages
      alert("Emails match! Form submitted successfully.");
      // Uncomment the following line if form submission is needed
      // event.target.submit();
    }
  }
}