/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 16-03-2023
 * @last modified by  : Somnath Sharma
**/
import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import CASE_OBJECT from '@salesforce/schema/Case';

export default class HrisCasePicklistComponent extends LightningElement {
    objectInfo;
    recordTypeInformation = {};
    default_recordtype_id = '';

    @wire(getObjectInfo, { objectApiName: CASE_OBJECT })
    objectInfofetch({ error, data }) {
        if (data) {
            console.log(JSON.stringify(data));
            this.objectInfo = data;
            this.default_recordtype_id = data.defaultRecordTypeId;
            this.storeRecordTypeInfos();
        } else if (error) {

            console.log("error to Load Default====> " + JSON.stringify(error));
        }
    }

    storeRecordTypeInfos() {
        // Returns a map of record type Ids 
        const rtis = this.objectInfo.recordTypeInfos;
        this.recordTypeInformation = rtis;
        console.log("recordTypeInformation====> " + JSON.stringify(rtis));
        // return Object.keys(rtis).find(rti => rtis[rti].name === 'Special Account');
    }



}