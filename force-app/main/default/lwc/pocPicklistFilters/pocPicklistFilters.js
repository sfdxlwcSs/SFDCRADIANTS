/**
 * @File Name          : pocPicklistFilters.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/26/2020, 9:40:09 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    24/2/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api,
    wire,
    track
} from 'lwc';
import {
    getObjectInfo
} from 'lightning/uiObjectInfoApi';
import {
    getPicklistValues
} from 'lightning/uiObjectInfoApi';

export default class PocPicklistFilters extends LightningElement {


    // to be passed from calling component
    @api objectapiname;
    @api picklistfield;
    defaultRecordTypeId; //Master  Record Type Id
    @track options = [];


    @wire(getObjectInfo, {
        objectApiName: '$objectapiname'
    })
    wiredObjectInfo({
        error,
        data
    }) {
        if (data) {
            console.log('ObjectInfo' + JSON.stringify(data));
            this.record = data.recordTypeInfos;
            this.defaultRecordTypeId = data.defaultRecordTypeId;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: '$defaultRecordTypeId',
        fieldApiName: '$picklistfield'
    })
    wiredPicklistInfo({
        error,
        data
    }) {
        if (data) {
            console.log('picklist' + JSON.stringify(data.values));
            this.processPicklistRawJSON(data.values);
        } else if (error) {
            console.log(JSON.stringify(error));
        }
    }

    processPicklistRawJSON(_rawData) {
        this.options = _rawData.map(row => {
            return {
                label: row.label,
                value: row.value
            };
        });
        console.log('picklistprocessed' + JSON.stringify(this.options));
    }
}