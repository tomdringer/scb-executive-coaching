// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from "@hotwired/stimulus"

import MenuController from "./controllers/menu_controller"
import Carousel from "./controllers/carousel_controller"


window.Stimulus = Application.start()

Stimulus.register("carousel", Carousel)

Stimulus.register("menu", MenuController);

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