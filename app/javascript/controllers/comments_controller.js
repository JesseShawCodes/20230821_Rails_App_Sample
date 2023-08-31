import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
  }
  connect() {
  }

  toggleForm(event) {
    event.preventDefault();
    event.stopPropagation();

    const formId = event.params["form"];
    const bodyId = event.params["body"];

    const form = document.getElementById(formId)
    form.classList.toggle("d-none")

    const commentBody = document.getElementById(bodyId)
    commentBody.classList.toggle("d-none")
  }
}
