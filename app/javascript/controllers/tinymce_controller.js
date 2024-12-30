// app/javascript/controllers/tinymce_controller.js
import { Controller } from "stimulus";
import tinymce from 'tinymce/tinymce';
import 'tinymce/models/dom/model';
import 'tinymce/themes/silver';
import 'tinymce/icons/default';
import 'tinymce/plugins/image';
import 'tinymce/plugins/table';
import 'tinymce/plugins/fullscreen';
import 'tinymce/plugins/code';
import 'tinymce/plugins/link';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/media';
import 'tinymce/plugins/advlist';
import 'tinymce/plugins/autolink';
import 'tinymce/plugins/charmap';
import 'tinymce/plugins/directionality';
import 'tinymce/plugins/nonbreaking';
import 'tinymce/plugins/visualchars';
import 'tinymce/plugins/visualblocks';
import 'tinymce/plugins/wordcount';
import 'tinymce/plugins/searchreplace';
import 'tinymce/plugins/save';
import 'tinymce/skins/ui/oxide/skin';
import 'tinymce/skins/ui/oxide/content';
import 'tinymce/skins/ui/oxide/content.css';
import 'tinymce/skins/content/default/content.css';

export default class extends Controller {
  static targets = ["textarea"];

  connect() {
    tinymce.init({
      selector: `#${this.textareaTarget.id}`,
      plugins: 'image table fullscreen code link lists advlist autolink charmap directionality nonbreaking visualchars visualblocks wordcount searchreplace save',
      toolbar: 'bold italic link undo redo forecolor backcolor bullist numlist outdent indent table image code save',
      valid_elements: '*[*]',
      extended_valid_elements: 'table[width|height|cellspacing|cellpadding|border|align|class|style],tr,td,th[style|colspan|rowspan|width|height|align|valign|scope],tbody,thead,tfoot, section, p',
      forced_root_block: false,
      entity_encoding: 'html',
      remove_trailing_brs: false,
      license_key: 'gpl',

      base_url: '/assets/tinymce',
      document_base_url: '/assets/tinymce',

      setup: (editor) => {
        editor.on('change', () => {
          this.updateTextareaContent(editor);
        });
      },
      images_upload_handler: (blobInfo, progress) => {
        return new Promise((resolve, reject) => {
          let formData = new FormData();
          formData.append('file', blobInfo.blob(), blobInfo.filename());

          fetch('/uploader/image', {
            method: 'POST',
            body: formData,
            headers: {
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            }
          })
            .then(response => {
              if (!response.ok) {
                return response.json().then(err => {
                  throw new Error(err.message || 'Failed to upload image.');
                });
              }
              return response.json();
            })
            .then(result => {
              if (result.error) {
                reject(result.error);
              } else {
                // Ensure `src` is the direct image URL returned from the server
                resolve(result.location);
              }
            })
            .catch(error => {
              reject('Image upload failed: ' + error.message);
            });
        });
      }
    })
  }

  updateTextareaContent(editor) {
    this.textareaTarget.value = editor.getContent();
  }

  disconnect() {
    tinymce.remove(`#${this.textareaTarget.id}`);
  }
}