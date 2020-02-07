/**
 * @File Name          : dataBindingInLWC.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/5/2020, 12:20:54 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/5/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';

export default class DataBindingInLWC extends LightningElement {

    @track name = 'Somnath';

    //     Event Listeners
    //     This is one of my favourite things about LWC.Event Listeners are just standard DOM
    // event listeners.There’ s no custom syntax, or event object, it’ s just pure Web Standards.
    // That means that the docs you read on sites like MDN(
    //     for example https: //developer.mozilla.org/en-US/docs/Web/Events/click) apply to LWC! 
    //     The only difference is that you can attach an event handler using the binding syntax
    // of onsomeevent = { myEventHandler }.Let’s add an onkeyup handler to our example:
    updateName(event) {
        this.name = event.target.value;
        // And now we can see the value is automatically updating as we change the text in the field.
        // And that’ s really all there is to it!
    }
}