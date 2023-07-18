import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.toggleFeed()
    this.toggleProfilePage()
    this.toggleLeftSidebar()
  }
  toggleLeftSidebar()
  {
    const value = this.element.dataset.leftSidebar
    const eleActive = document.querySelector('.sidebarLeftListItem__link.active')
    if (value == 'discover' && eleActive)
    {
      eleActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[1].classList.add('active')
    }
    else if (value == 'feed'){
      eleActive.classList.remove('active')
      document.querySelectorAll('.sidebarLeftListItem__link')[0].classList.add('active')
    }
  }
  toggleFeed()
  {
    const value = this.element.dataset.photoChecked;
    if (value=="album")
    {
       document.getElementById('btnradio1').checked= false;
       document.getElementById('btnradio2').checked= true;
    }
  }
  toggleProfilePage(event)
  {
    const value = this.element.dataset.toggleProfile;
    const listTabs= document.querySelectorAll('.profileTopInfor__list-item');
    const eleActive =  document.querySelector('.profileTopInfor__list-item.ele-active');
    if (listTabs && eleActive)
    {
        eleActive.classList.remove('ele-active');
        switch (value)
        {
            case 'tab_photos': 
            
                listTabs[0].classList.add('ele-active');
                break;
            case 'tab_albums':
                listTabs[1].classList.add('ele-active');
                break;
            case 'tab_followings':
                listTabs[2].classList.add('ele-active');
                break;
            case 'tab_followers':
                listTabs[3].classList.add('ele-active');
                break;
        }
        }
        }
    
  
}
