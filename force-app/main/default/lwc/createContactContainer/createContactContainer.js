/**
 * @File Name          : CreateAccountController.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 12/26/2019, 10:16:58 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    12/24/2019   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';
import createAccount from '@salesforce/apex/CreateAccountController.saveAccount';
import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';
export default class CreateAccountController extends LightningElement {

    _response = '';

    handleSubmit(event) {
        event.preventDefault(); // stop the form from submitting
        const payload = event.detail.fields;
        window.console.log("DataProcessing-", JSON.stringify(payload));
        //imperative call back
        createAccount({
                Name: payload.Name,
                AccountNumber: payload.AccountNumber,
                Website: payload.Website,
                Description: payload.Description
            })
            .then(result => {
                this._response = result;
            })
            .catch(error => {
                this.message = 'Error received: code' + error.errorCode + error.body.message;
            });
        //create account in source  org only when account created in target org
        if (this._response === 'Account Successfully Created') {
            this.template.querySelector('lightning-record-edit-form').submit(payload);
        }

    }

    handleSuccess(event) {
        const payload = event.detail;
        this.showNotification();
        window.console.log("SubmittedData-", JSON.stringify(payload));
    }

    handleError(event) {
        const errorPayload = event.detail;
        window.console.log("Error-", JSON.stringify(errorPayload));
    }

    showNotification() {

        window.console.log('event success fired');
        const evt = new ShowToastEvent({
            title: 'Account Created In Source',
            message: this._response,
            variant: 'success'
        });
        this.dispatchEvent(evt);
    }
}