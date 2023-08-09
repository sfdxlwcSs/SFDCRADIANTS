/**
 * @File Name          : lwcLookUps.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : SOMNATH SHARMA
 * @Last Modified On   : 08-09-2023
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    26/1/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api,
    wire
} from 'lwc';
import {
    getRecord,
} from 'lightning/uiRecordApi';


export default class LwcLookUps extends LightningElement {
    //object API name,lookupValueDefault and lookup field name send from calling component.
    @api lookupValueDefault = '';
    @api objectpiname = '';
    @api lookupfieldname = '';
    //For fields  parameters of getRecord , specify field names in the format ObjectApiName.FieldName 
    @api lookupfield_objectapiname_fieldname = [];
    @api recordId;

    handleChange(event) {
        /*once you have this value it can be passed to apex as one of the method params ,
        lets say for a use case where a search query is involved and we have to search 
        all contacts related to a partcular account.*/
        window.console.log("You selected an account: " + event.detail.value[0]);
        this.lookupValueDefault = event.detail.value[0];
        // var inputCmp = this.template.querySelector("lightning-input-field");
        // var fieldName = inputCmp.fieldName;


    }
    handleLoad(event) {
        //details coming on the load of form
        const recUi = event.detail
        console.log('OnLoadData-fields', JSON.stringify(recUi.records[this.recordId].fields.Name.value));
        //  this.accountName=recUi.records[this.recordId].fields.Name.value;

    }
    //get lookup field display value for use
    @wire(getRecord, {
        recordId: '$lookupValueDefault',
        fields: '$lookupfield_objectapiname_fieldname'
    })
    wiredLookUpDisplayValue({
        error,
        data
    }) {
        if (data) {
            console.log('Dispaly Value' + data.fields.Name.value);
            //fire and event with the updated data and label
            const value = [{
                lookupValue: this.lookupValueDefault,
                lookUpLabel: data.fields.Name.value
            }];
            const valueChangeEvent = new CustomEvent("valuechange", {
                detail: {
                    value
                }
            });
            // Fire the custom event
            this.dispatchEvent(valueChangeEvent);
        } else if (error) {
            console.log(JSON.stringify(error));
        }

    }





}