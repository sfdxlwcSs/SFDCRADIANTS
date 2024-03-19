import { LightningElement } from 'lwc';

export default class AppSlotsExample extends LightningElement {

    handleClickEventFromChild(event) {
        alert(JSON.stringify(event.detail))
    }
}