import { Application } from "@hotwired/stimulus"
import ScrollTo from "@stimulus-components/scroll-to";

window.Stimulus = Application.start()

Stimulus.register("scrollTo", ScrollTo);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
