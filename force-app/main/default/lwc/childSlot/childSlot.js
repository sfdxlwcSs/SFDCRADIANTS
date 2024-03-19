import { LightningElement } from 'lwc';

export default class ChildSlot extends LightningElement {
    handleClick() {
        const buttonclicked = new CustomEvent('buttonclick', {
            detail: {
                param1: 'param1',
                param2: 'param2'
            },
            bubbles: true
        });
        this.dispatchEvent(buttonclicked);
    }
}