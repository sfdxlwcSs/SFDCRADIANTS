/**
 * @File Name          : eventsGrandChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 11:38:05 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class EventsGrandChild extends LightningElement {
    sendInfo() {
        // Creates the event 
        const selectedEvent = new CustomEvent('myevent', {
            detail: 'send info from Grand Child',
            composed: true,
            bubbles: true
        });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }
}