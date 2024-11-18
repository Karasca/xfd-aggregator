import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static classes = ["bgGreen", "bgRed", "bgYellow"]

    toggle(e){
        $.ajax({
            type: 'GET',
            url: '/toggle-favorite',
            data: {
            id: e.params.id
            },
        }).done((data) => {
            this.toggleFavorite(e, data)
        });
    }

    toggleFavorite(e, data){
        if(data.star){
            e.target.classList.remove(this.bgRedClass)
            e.target.classList.add(this.bgGreenClass)
            e.target.innerHTML = "🌟"

            e.target.parentElement.classList.add(this.bgYellowClass)
        }else{
            e.target.classList.remove(this.bgGreenClass)
            e.target.classList.add(this.bgRedClass)
            e.target.innerHTML = "⭐"

            e.target.parentElement.classList.remove(this.bgYellowClass)
        }
        
    }
  

}
