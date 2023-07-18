import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.showImage()

  }

  showImage()
  {
    
    const myModal = document.getElementById('myModal')
    const listCard = document.querySelectorAll('.cardImg');
  
    const listTitle = document.querySelectorAll('.cardImg__right-heading')
    const listImg = document.querySelectorAll('.cardIMg__left-img');
    const listDescrip = document.querySelectorAll('.cardImg__right-text')

    listCard.forEach((ele,index)=>{
        ele.addEventListener('click',()=>{
    let title = listTitle[index].innerHTML;
    let image = listImg[index].getAttribute('src')
    let description = listDescrip[index].innerHTML

    myModal.addEventListener('shown.bs.modal', () => {
        document.getElementById('exampleModalLabel').innerHTML= title
        document.getElementById('modalBodyImg__img').setAttribute('src',image)
        document.getElementById('modal_body__descrip').innerHTML = description 
        })
  
        });
    })
    }
}
