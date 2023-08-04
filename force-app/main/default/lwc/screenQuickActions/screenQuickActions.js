/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 07-27-2023
 * @last modified by  : SOMNATH SHARMA
**/
import { LightningElement, api, wire } from "lwc";
import { CurrentPageReference } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';



export default class ScreenQuickActions extends LightningElement {
     @api recordId;
    @api objectApiName;
    _recordId;
   
    @wire(CurrentPageReference)
    pageRef;

    get pageRefString() {
        return JSON.stringify(this.pageRef);
    }
    // Unlike other Lightning web components on record pages, LWC quick actions don’t pass in recordId in connectedCallback(). If you need access to recordId, set the value of recordId in your code.
    connectedCallback() {
        //https://salesforce.stackexchange.com/questions/346920/lwc-quick-action-recordid-propertyindefined-in-connectedcallback-context
        console.log('connected******' + this._recordId);//it will come undefined
    }

    // //to note setter name should be recordId
    // @api set recordId(value) {
    //     this._recordId = value;
    //     console.log('setter' + this._recordId)
    //     // do your thing right here with this.recordId / value
    // }

    // get recordId() {
    //     return this._recordId;
    // }

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
    handleSuccess(e) {
      //  Close the modal window and display a success toast
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Record updated!',
                variant: 'success'
            })
        );
   }
}