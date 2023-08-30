import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
  }
  connect() {
  }

  toggleForm(event) {
    console.log("I Clicked the edit button")
    event.preventDefault();
    event.stopPropagation();

    console.log(event.params["body"])

    const formId = event.params["form"];
    const bodyId = event.params["body"];

    const form = document.getElementById(formId)
    form.classList.toggle("d-none")


    const commentBody = document.getElementById(bodyId)
    commentBody.classList.toggle("d-none")
  }
}
