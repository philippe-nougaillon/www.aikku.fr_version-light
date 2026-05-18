import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { delay: Number }

  connect() {
    setTimeout(() => this.hide(), (this.delayValue || 10) * 1000)
  }

  hide() {
    this.element.style.transition = "opacity 1.5s ease, transform 1.5s ease"
    this.element.style.opacity = "0"
    this.element.style.transform = "translateY(30px)"
    setTimeout(() => this.element.remove(), 1500)
  }
}