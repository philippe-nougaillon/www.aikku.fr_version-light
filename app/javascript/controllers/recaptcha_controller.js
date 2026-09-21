import { Controller } from "@hotwired/stimulus"

// Affiche le widget reCAPTCHA v2 (case à cocher).
// Rendu explicite pour que le widget s'affiche aussi après une navigation Turbo.
let loading

function loadRecaptcha(lang) {
  loading ||= new Promise((resolve) => {
    window.onRecaptchaLoad = resolve
    const script = document.createElement("script")
    script.src = `https://www.google.com/recaptcha/api.js?onload=onRecaptchaLoad&render=explicit&hl=${lang}`
    script.async = true
    document.head.appendChild(script)
  })
  return loading
}

export default class extends Controller {
  static values = { siteKey: String, lang: String }

  async connect() {
    await loadRecaptcha(this.langValue)
    if (!this.element.isConnected) return

    // Vide un éventuel widget issu du cache Turbo avant de le recréer
    this.element.innerHTML = ""
    grecaptcha.render(this.element, { sitekey: this.siteKeyValue })
  }
}
