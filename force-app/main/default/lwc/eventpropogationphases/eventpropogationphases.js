import { LightningElement } from 'lwc';

export default class Eventpropogationphases extends LightningElement {

    handleButtonClick(event) {
        alert('app', JSON.stringify(event.detail));
    }
}