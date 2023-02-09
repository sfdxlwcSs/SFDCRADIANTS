/**
 * @File Name          : events.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 10-01-2023
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Events extends LightningElement {
    handleMyEvent(event) {
        window.console.log('event data-->>' + event.detail.param2);
        let prompmtData = window.prompt('Enter Some Data To Prompt from Event-->' + event.detail.param1);
        window.console.log('prompmtData-->>' + prompmtData);
    }

    fireEventWithData(event) {
        window.console.log('event data-->>' + event.detail);
    }

    handleBubbleEvent(event) {
        window.console.log('event data bubble-->>' + event.detail);
    }
}