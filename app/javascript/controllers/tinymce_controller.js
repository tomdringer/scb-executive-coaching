import { Controller } from "stimulus"
import tinymce from "tinymce"

export default class Tinymce_controller extends Controller {
  static targets = ["textarea"]

  connect() {
    // Initialize TinyMCE on the specified target
    tinymce.init({
      selector: `#${this.textareaTarget.id}`,  // Use the ID of the textarea target
      plugins: 'image table fullscreen code link lists media advlist autolink charmap directionality nonbreaking visualchars visualblocks wordcount searchreplace save',
      toolbar: 'bold italic link undo redo forecolor backcolor bullist numlist outdent indent table image code save',
      valid_elements: '*[*]',  // Allow all elements and attributes
      extended_valid_elements: 'table[width|height|cellspacing|cellpadding|border|align|class|style],tr,td,th[style|colspan|rowspan|width|height|align|valign|scope],tbody,thead,tfoot',
      forced_root_block: false,  // Prevent wrapping content in <p> tags
      entity_encoding: 'raw',    // Prevent encoding entities which can alter content
      remove_trailing_brs: false, // Preserve empty <br> tags in tables
      license_key: 'gpl',
      setup: (editor) => {
        // Bind events if needed
        editor.on('change', () => {
          this.updateTextareaContent(editor);
        });
      },
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
  }

  // Optional: Synchronize content back to the textarea for form submission
  updateTextareaContent(editor) {
    this.textareaTarget.value = editor.getContent();
  }

  disconnect() {
    // Cleanup to prevent memory leaks when the controller disconnects
    tinymce.remove(`#${this.textareaTarget.id}`);
  }
}