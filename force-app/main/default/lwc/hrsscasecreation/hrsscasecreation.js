import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Hrsscasecreation extends LightningElement {

    caseId;

    handleSubmit(event) {
        event.preventDefault(); // stop the form from submitting
        const fields = event.detail.fields;

        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    handleSuccess(event) {
        const payload = event.detail;
        console.log('Case Data' + JSON.stringify(payload));
        this.caseId = event.detail.id;
        const fireToast = new ShowToastEvent({
            title: 'Case Created-' + payload.fields.CaseNumber.value,
            message: 'Please Upload File',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(fireToast);
        /**
         * 
         * To communicate from child to parent, dispatch an event. Lightning web components fire DOM events. An enclosing Aura component can listen for these events, just like an 
         * enclosing Lightning web component can. 
         */
        let eventParams = {
            sobjectname: 'Case',
            caseId: this.caseId,
            hideCmp: true

        };
        const flowLaunchEvent = new CustomEvent('caserecordcreated', {
            detail: {
                eventParams
            },
        });
        // Fire the custom event
        this.dispatchEvent(flowLaunchEvent);
    }

}