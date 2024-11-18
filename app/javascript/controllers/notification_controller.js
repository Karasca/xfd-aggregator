import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "notice", "alert" ];

    toggleNoticeOff() {
        this.noticeTarget.innerHTML = ""
    }

    toggleAlertOff(){
        this.alertTarget.innerHTML = ""
    }
}