// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails";
import "@rails/actiontext"


import MenuController from "./controllers/menu_controller"
import CarouselController from "./controllers/carousel_controller"
import Dialog from "@stimulus-components/dialog";
import Category_modal_controller from "./controllers/category_modal_controller";

window.Stimulus = Application.start()

Stimulus.register("carousel", CarouselController)
Stimulus.register("menu", MenuController);
Stimulus.register("dialog", Dialog);
Stimulus.register("category-modal", Category_modal_controller);
//Stimulus.register("delete", DeleteController);


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

import "@rails/actiontext"
import "@hotwired/turbo-rails"

tinymce.init({
  selector: 'textarea.tinymce',
  plugins: 'image',
  toolbar: 'image',
  images_upload_url: '/uploader/image',
  automatic_uploads: true,
  images_upload_handler: function (blobInfo, success, failure) {
    let formData = new FormData();
    formData.append('file', blobInfo.blob(), blobInfo.filename());

    fetch('/uploader/image', {
      method: 'POST',
      body: formData,
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
      .then(response => response.json())
      .then(result => {
        if (result.error) {
          failure(result.error);
        } else {
          success(result.url);
        }
      })
      .catch(error => {
        failure('Image upload failed: ' + error.message);
      });
  }
});
