// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

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
            console.log(listTitle[index].innerHTML)
            console.log(listDescrip[index].innerHTML)
            document.getElementById('exampleModalLabel').innerHTML= title
            document.getElementById('modalBodyImg__img').setAttribute('src',image)
            document.getElementById('modal_body__descrip').innerHTML = description 
          })
    
    });
})


