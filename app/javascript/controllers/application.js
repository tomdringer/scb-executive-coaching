import { Application } from "@hotwired/stimulus"
import ScrollTo from "@stimulus-components/scroll-to";
import Carousel from "stimulus-carousel"

window.Stimulus = Application.start()

Stimulus.register("scrollTo", ScrollTo);
Stimulus.register("carousel", Carousel)


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
