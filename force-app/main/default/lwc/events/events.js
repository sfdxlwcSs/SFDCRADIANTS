/**
 * @File Name          : events.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 11:32:26 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Events extends LightningElement {
    handleMyEvent() {
        window.console.log('event data-->>' + event.detail.param2);
        let prompmtData = window.prompt('Enter Some Data To Prompt from Event-->' + event.detail.param1);
        window.console.log('prompmtData-->>' + prompmtData);
    }

    fireEventWithData() {
        window.console.log('event data-->>' + event.detail);
    }

    handleBubbleEvent() {
        window.console.log('event data bubble-->>' + event.detail);
    }
}