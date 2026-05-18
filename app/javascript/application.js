import "@hotwired/turbo-rails"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import { Application } from "@hotwired/stimulus"

const application = Application.start()
eagerLoadControllersFrom("controllers", application)

Turbo.config.forms.mode = "off"