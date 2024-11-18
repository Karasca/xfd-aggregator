import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "hideable" ];

    connect(){
      this.hideMenu = this.hideMenu.bind(this);
      document.addEventListener("click", this.hideMenu);
    }
    
    disconnect(){
      document.removeEventListener("click", this.hideMenu);
    }
    
    toggleMenu() {
      if(this.hideableTarget.hidden){
        this.hideableTarget.hidden = false
      } else if(this.shouldHideMenu)(
        this.hideableTarget.hidden = true
      )
    }
    
    hideMenu(event){

      if(this.shouldHideMenu(event)){
        this.hideableTarget.hidden = true;
      }
    }

    shouldHideMenu(event){
      return(
        !this.hideableTarget.contains(event.target) &&
        !this.element.contains(event.target) &&
        !this.hideableTarget.hidden
      );
    }
}  