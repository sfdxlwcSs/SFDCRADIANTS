/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 24-02-2023
 * @last modified by  : Somnath Sharma
**/
import { LightningElement, api, wire } from "lwc";
import { CurrentPageReference } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';



export default class ScreenQuickActions extends LightningElement {
    //  @api recordId;
    @api objectApiName;
    _recordId;
    closeModal(e) {
        // Close the modal window and display a success toast
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Modal Closed!',
                variant: 'success'
            })
        );
    }
    @wire(CurrentPageReference)
    pageRef;

    get pageRefString() {
        return JSON.stringify(this.pageRef);
    }
    connectedCallback() {
        //https://salesforce.stackexchange.com/questions/346920/lwc-quick-action-recordid-propertyindefined-in-connectedcallback-context
        console.log('connected' + this._recordId);//it will come undefined
    }

    //to note setter name should be recordId
    @api set recordId(value) {
        this._recordId = value;
        console.log('setter' + this._recordId)
        // do your thing right here with this.recordId / value
    }

    get recordId() {
        return this._recordId;
    }
}