import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  }
  deletePhoto(event)
  {
    function fileListFrom(files) {
      const b = new ClipboardEvent("").clipboardData || new DataTransfer()
      for (const file of files) b.items.add(file)
      return b.files
    }

    const test = document.getElementById('fileInput');
    let files = test.files
    let fileDeleted = event.params['fileName'];
    let listFile = []
    for (let i = 0; i < files.length; i++) {
        if (files[i].name == fileDeleted) continue;
        listFile.push(files[i]);
    }

    const fileList = fileListFrom(listFile)
    test.files = fileList;
    this.element.parentNode.remove()
  }
 
  
}
