import { LightningElement } from 'lwc';

export default class Parent1 extends LightningElement {
    handleButtonClick(event) {
        //To bubble an event inside the component’s template, dispatch the event on an element in the template. The event bubbles up to the element’s ancestors inside the template only. When the event reaches the shadow boundary, it stops.
        alert('parent' + JSON.stringify(event.detail));
        // alert(JSON.stringify(event.currentTarget));
        // alert(JSON.stringify(event.target));
    }

    handleButtonClick2(event) {
        alert('wrapper div in parent ' + JSON.stringify(event.detail));
        // alert(JSON.stringify(event.currentTarget));
        // alert(JSON.stringify(event.target));
    }
}