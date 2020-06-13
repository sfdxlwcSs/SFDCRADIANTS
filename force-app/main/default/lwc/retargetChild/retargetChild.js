/**
 * @File Name          : retargetChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/25/2020, 9:51:15 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/25/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api
} from 'lwc';

export default class RetargetChild extends LightningElement {

    @api compName = 'retargetChild';
    fireEvent() {
        // Creates the event with the test data.
        const selectedEvent = new CustomEvent('myevent');

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }

    @api
    myMethod() {
        return 'I can be accessed via event';
    }

    handleMyEvent(event) {
        window.console.log('node name child->' + event.target.nodeName);

    }

}