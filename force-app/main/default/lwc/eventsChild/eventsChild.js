/**
 * @File Name          : eventsChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 11:49:52 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class EventsChild extends LightningElement {
    sendInfo() {
        // Creates the event with the test data.
        const selectedEvent = new CustomEvent('myevent', {
            detail: {
                param1: 'param1',
                param2: 'param2'
            },
            // bubbles: true //refers to the heirarcy
        });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }

    fireEventWithData() {
        // Creates the event with the test data.
        const selectedEvent = new CustomEvent('myeventwithsimpledata', {
            detail: 'data from event'
        });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }

    fireEventWithDataBubbles() {
        //component inside parent div element will only fire
        // Creates the event with the test data.
        const selectedEvent = new CustomEvent('myeventbubble', {
            detail: 'data from event BUBBLE TYPE',
            bubbles: true //refers to the heirarcy
        });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }

    handleMyEvent(event) {

        event.stopPropagation();
        window.console.log('My Event Invokes From Child' + event.detail);
    }
}