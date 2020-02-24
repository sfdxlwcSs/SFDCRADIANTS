/**
 * @File Name          : inheritanceFileUpload.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 10:26:15 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api
} from 'lwc';

export default class InheritanceFileUpload extends LightningElement {
    @api recordId;
    @api acceptedFormats;
    handleUploadFinished() {
        this.dispatchEvent(new CustomEvent('uploadfinished', {
            composed: true,
            bubbles: true,
            cancelable: true,
            detail: {
                data: {
                    name: 'some data',
                    recordId: this.recordId
                }
            }
        }));
        this.dispatchEvent(new ShowToastEvent({
            title: 'Completed',
            message: 'File has been uploaded',
        }));
    }

}