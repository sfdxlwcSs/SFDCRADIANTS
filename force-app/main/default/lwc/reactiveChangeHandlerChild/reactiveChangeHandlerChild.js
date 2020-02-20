/**
 * @File Name          : reactiveChangeHandlerChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 10:11:01 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/20/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api,
    track
} from 'lwc';

export default class ReactiveChangeHandlerChild extends LightningElement {

    @track publicArray_track;
    @api
    get publicArray() {
        return Array.isArray(this.publicArray) ? this.publicArray : [{
            name: 'default'
        }];
    }

    set publicArray(val) {
        //this.publicArray = val;
        this.publicArray_track = val;
    }
}