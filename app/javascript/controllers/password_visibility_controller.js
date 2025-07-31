import { Controller } from "@hotwired/stimulus"
 

export default class extends Controller {
  static targets = ["input", "icon"]
 
  toggle() {
    const type = this.inputTarget.type === "password" ? "text" : "password"
    this.inputTarget.type = type
    this.iconTarget.className = type === "password" ? "bi bi-eye" : "bi bi-eye-slash"
  }
}