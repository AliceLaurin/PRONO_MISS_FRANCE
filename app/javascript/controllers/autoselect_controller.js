import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autoselect"
export default class extends Controller {
  static targets = ["avatarSelect"]
  connect() {
    const activeAvatar = this.avatarSelectTarget.querySelector('.carousel-item.active');
    console.log(activeAvatar);
    const avatarInput = activeAvatar.querySelector('.avatar-item input[type=radio]').click();
  }


  select(){
    // sélectionner l'avatar avec la classe active checkbox checked
    const activeAvatar = this.avatarSelectTarget.querySelector('.carousel-item.carousel-item-next');
    console.log(activeAvatar);
    const avatarInput = activeAvatar.querySelector('.avatar-item input[type=radio]').click();
    console.log(avatarInput);
  }
}
