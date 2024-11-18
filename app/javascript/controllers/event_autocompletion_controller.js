import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['eventname', 'eventdate', 'eventlocation'];
    
    autocomplete(e){
      if (e instanceof InputEvent && e.inputType != 'insertReplacementText') return

      $.ajax({
        type: 'GET',
        url: '/event-autocomplete',
        data: {
          name: e.target.value
        },
      }).done((data) => {
        this.fill_in_form(data);
      });
    }

    fill_in_form(data) {
      this.eventnameTarget.value = data['name']
      this.eventdateTarget.value = data['date']
      this.eventlocationTarget.value = data['location']
    }
  }