/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 13-03-2023
 * @last modified by  : Somnath Sharma
**/
import { LightningElement } from 'lwc';

export default class Callmethodeveryfivesec extends LightningElement {
    timer = '';
    connectedCallback() {
        this.timer = setInterval(function () {
            alert('5 seconds')
            console.log('5 seconds setInterval: ' + this.timer);
        }, 5000);
    }
    stopTimer() {

        clearInterval(this.timer);
    }
}