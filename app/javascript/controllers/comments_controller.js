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

    this.toggleEditButon(document.getElementById(event.params["edit"]))
  }

  toggleEditButon(editButton) {
    if(editButton.innerText === "Edit") {
      editButton.innerText = "Cancel"
      editButton.classList.toggle("bg-secondary")
    }
    else {
      editButton.innerText = "Edit"
      editButton.classList.toggle("bg-warning")
    }
  }

  toggleEditButtonText(editButton) {
    console.log("toggleEditButtonText")
  }
}
