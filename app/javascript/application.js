import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails";
import MenuController from "./controllers/menu_controller"
import CarouselController from "./controllers/carousel_controller"
import Dialog from "@stimulus-components/dialog";
import Tinymce_controller from "./controllers/tinymce_controller";

window.Stimulus = Application.start()

Stimulus.register("carousel", CarouselController)
Stimulus.register("menu", MenuController);
Stimulus.register("dialog", Dialog);
Stimulus.register("tinymce", Tinymce_controller);


Stimulus.debug = process.env.NODE_ENV === "development"

const events = [
  "turbo:fetch-request-error",
  "turbo:frame-missing",
  "turbo:frame-load",
  "turbo:frame-render",
  "turbo:before-frame-render",
  "turbo:load",
  "turbo:render",
  "turbo:before-stream-render",
  "turbo:before-render",
  "turbo:before-cache",
  "turbo:submit-end",
  "turbo:before-fetch-response",
  "turbo:before-fetch-request",
  "turbo:submit-start",
  "turbo:visit",
  "turbo:before-visit",
  "turbo:click"
]

events.forEach(e => {
  addEventListener(e, () => {
    console.log(e);
  });
});
