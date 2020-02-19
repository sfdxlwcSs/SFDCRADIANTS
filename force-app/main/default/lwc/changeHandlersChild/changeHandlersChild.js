/**
 * @File Name          : changeHandlersChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/19/2020, 11:46:32 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/19/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track,
    api
} from 'lwc';

export default class ChangeHandlersChild extends LightningElement {
    @api
    get publicArray() {
        return Array.isArray(this._publicArray) ? this._publicArray : [{
            name: 'default'
        }];
    }

    set publicArray(value) {
        this._publicArray = value;
    }

    get privateArray() {
        return Array.isArray(this._privateArray) ? this._privateArray : [{
            name: 'default'
        }];
    }


    // set privateArray(value) {
    //     value.forEach(item => {

    //     });
    // }

    // @track trackedArray = [{
    //     name: 'track 1'
    // }, {
    //     name: 'track 2'
    // }];

    // setPrivateArray() {
    //     window.console.log('privateArray=>', JSON.stringify(this._privateArray));
    //     this.privateArray = [{}];
    // }

}