import { LightningElement } from 'lwc';

export default class ChildComponent1 extends LightningElement {

    //bubbles: false and composed: false 
    handleClick() {
        //bubbles: false and composed: false 
        // const buttonclicked = new CustomEvent('buttonclick', {
        //     detail: 'bubbles: false and composed: true'
        // });
        // this.dispatchEvent(buttonclicked);

        //bubbles: true and composed: false upto parent event will get handled and will be stopped futher propogation by parent shawdow dom
        const buttonclicked = new CustomEvent('buttonclick',
            {
                detail: 'bubbles: true and composed: false ',
                bubbles: true,
                composed: false
            });
        this.dispatchEvent(buttonclicked);
        //         the buttonclick event from c-child event travels from bottom to top until it finds a shadow root or the event gets canceled.
        // The result, in addition to c-child, div.wrapper can also react to the event.
        // Use this configuration to bubble up an event inside the component’s template, creating an internal event. 

        //bubbles: true and composed: true 
        // const buttonclicked = new CustomEvent('buttonclick',
        //     {
        //         detail: 'bubbles: true and composed: true',
        //         bubbles: true,
        //         composed: true
        //     });
        // this.dispatchEvent(buttonclicked);
    }

    handleButtonClick(event) {
        debugger;
        alert('child handler', JSON.stringify(event.detail));
        // alert(JSON.stringify(event.currentTarget));
        // alert(JSON.stringify(event.target));
    }
}