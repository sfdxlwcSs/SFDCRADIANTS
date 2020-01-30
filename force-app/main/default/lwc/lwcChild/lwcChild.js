/**
 * @File Name          : lwcChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 23/1/2020, 7:31:19 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    10/15/2019   Somnath Sharma     Initial Version
 **/
import { LightningElement } from 'lwc';

export default class LwcChild extends LightningElement {

    launcFlow(){
    /**
     * 
     * To communicate from child to parent, dispatch an event. Lightning web components fire DOM events. An enclosing Aura component can listen for these events, just like an 
     * enclosing Lightning web component can. 
     */    
   let eventParams = {
    showFlow: true,
    inputFlowParams: ' ',
    
};
const flowLaunchEvent = new CustomEvent('flowLaunch', {
    detail: {
        eventParams
    },
});
// Fire the custom event
this.dispatchEvent(flowLaunchEvent);
    }
}