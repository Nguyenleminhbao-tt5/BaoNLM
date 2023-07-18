import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.changeImageProfile()
    this.changeImageNewPhoto()
    this.changeImageEditPhoto()
    this.changeImageNewAlbum()
  }
  changeImageProfile = () => this.changeImage('avatarProfile', 'editProfile__img-img', 0)
  changeImageNewPhoto = () => this.changeImage('newPhoto_inputPhoto', 'newPhoto_file-image', 1)
  changeImageEditPhoto = () => this.changeImage('newPhoto_inputPhoto', 'newPhoto_file-image', 2)
  changeImageNewAlbum = () => this.changeImage('newAlbum_inputPhoto', 'newPhoto_file-image', 3)



  // input: tag input file,  image: tag view image,   option: 0-1
  changeImage(input, image, option) {

    function fileListFrom(files) {
      const b = new ClipboardEvent("").clipboardData || new DataTransfer()
      for (const file of files) b.items.add(file)
      return b.files
    }
    
    const fileInput = document.getElementById(input);
    const photo = document.querySelector(`.${image}`);
    let listFile = []
    
    if (fileInput) {

      fileInput.addEventListener('change', (event) => {
        const selectedFile = event.target.files;

        if (option == 3 && selectedFile) {

          for (let i = 0; i < selectedFile.length; i++) {
            listFile.push(selectedFile[i])
            const reader = new FileReader();
            reader.addEventListener('load', (event) => {

              const fileContent = event.target.result;
              const parent = document.querySelector('.listFileAlbum');
              const content = parent.innerHTML;
              parent.innerHTML = `
              <div class="newPhoto_file d-flex justify-content-center align-items-center my-4 me-3" >
                <img src="${fileContent}" class="h-100 w-100 newPhoto_file-image " alt=""/>
                <button class="newPhoto_btn" type="button"  data-controller="delete" data-action="click->delete#deletePhoto" data-delete-file-name-param= "${selectedFile[i].name}" >
                  <i class="newPhoto_delete-icon fa-solid fa-x"></i>
                </button>
              </div>
             
              `+ content;

            });
            reader.readAsDataURL(selectedFile[i]);
            
          }
        }
        else if (selectedFile) {
          const reader = new FileReader();
          reader.addEventListener('load', (event) => {
            if (option == 0) {
              photo.src = event.target.result;
            }
            else if (option == 1) {
              photo.classList.remove('d-none');
              photo.src = event.target.result;
              const icon =document.querySelector('.newPhoto_file-icon')
              if (icon) icon.classList.add('d-none')

            }
            else if (option == 2) {
              photo.src = event.target.result;
            }
          });

          reader.readAsDataURL(selectedFile[0]);
        }

        const test = document.getElementById('fileInput');
        if (test)
        {
          const fileList = fileListFrom(listFile)
          test.files = fileList
        }


      });
    }


  }

  


}
