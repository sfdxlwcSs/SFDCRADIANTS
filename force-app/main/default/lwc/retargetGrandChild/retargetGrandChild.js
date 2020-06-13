/**
 * @File Name          : retargetGrandChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/25/2020, 9:46:55 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/25/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class RetargetGrandChild extends LightningElement {
    sendInfo() {
        // Creates the event with the test data.
        const selectedEvent = new CustomEvent('myevent', {
            composed: true,
            bubbles: true
        });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }

}