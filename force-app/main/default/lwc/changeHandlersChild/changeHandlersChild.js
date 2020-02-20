/**
 * @File Name          : changeHandlersChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 9:19:04 AM
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
            name: 'dafault'
        }];
    }
    set privateArray(value) {
        value.forEach(item => {
            item.newPrivateProp = 'new private property value';
        });
        this.trackedArray = value;
        this._publicArray = value;
    }

    @track trackedArray = [{
        name: 'track 1'
    }, {
        name: 'track 2'
    }];

    setPrivateArray() {
        console.log('privateArray =>', JSON.stringify(this.privateArray));
        this.privateArray = [{
            name: 'new private item'
        }];
        console.log('privateArray =>', JSON.stringify(this.privateArray));
        console.log('trackeArray =>', JSON.stringify(this.trackedArray));
    }
    addPropInArray() {
        console.log('privateArray =>', JSON.stringify(this.privateArray));
        this.privateArray.forEach(item => {
            item.newProp = 'new prop value';
        });
        console.log('privateArray =>', JSON.stringify(this.privateArray));
        console.log('trackedArray =>', JSON.stringify(this.trackedArray));
    }

    modifyPrivateArray() {
        console.log('privateArray =>', JSON.stringify(this.privateArray));
        this.privateArray = [{
            name: 'modified'
        }];
        console.log('privateArray =>', JSON.stringify(this.privateArray));
        console.log('trackedArray =>', JSON.stringify(this.trackedArray));
    }


}