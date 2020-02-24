/**
 * @File Name          : pocLightningDataTable.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 10:51:00 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';
import findAccounts from '@salesforce/apex/demoClass.getAllAccountsForDataTable';

export default class PocLightningDataTable extends LightningElement {
    @track data = [];
    connectedCallback() {
        this.columns = [{
                label: 'Name',
                fieldName: 'Name'
            },
            {
                label: 'Account Number',
                fieldName: 'AccountNumber'
            },
            {
                label: 'Upload',
                type: 'fileUpload',
                fieldName: 'Id',
                typeAttributes: {
                    acceptedFormats: '.jpg,.jpeg,.pdf,.png'
                }
            }
        ];
        findAccounts().then(res => {
            this.data = res;
        }).catch(err => console.error(err));
    }
    handleUploadFinished(event) {
        event.stopPropagation();
        console.log('data => ', JSON.stringify('' + event.detail.data));
    }
}