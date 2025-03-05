import { LightningElement } from 'lwc';

export default class ComponentB extends LightningElement {

    sendMessage() {
        const messageEvent = new CustomEvent('messagefromb', {
            detail: 'Hello from Event message from B!',
        });
        this.dispatchEvent(messageEvent); // Fire the event to Parent
    }
}