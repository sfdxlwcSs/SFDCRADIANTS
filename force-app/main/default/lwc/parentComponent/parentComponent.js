/**
 * Use Case:You have a parent LWC Component A which has two child LWC components B and C.
 *  How would you communicate between B and C?
 *  U r developer suggest best approach along with code  .
 * 
 */
import { LightningElement } from 'lwc';

/**
 * In Lightning Web Components (LWC), the best approach for communication between 
 * sibling components (B and C) inside the parent component (A) is 
 * to use Custom Events and @api properties.

Steps for Communication between B and C via A:

1. Component B (Sender) fires a Custom Event.


2. Component A (Parent) listens to the event and updates a property.


3. Component C (Receiver) gets the updated property via @api in LWC.
 * 
 */

export default class ParentComponent extends LightningElement {

    message = '';

    handleMessage(event) {
        this.message = event.detail; // Receive event from B and update message
    }


}

