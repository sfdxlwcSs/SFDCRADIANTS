/**
 * @File Name          : apiTrackPropertiesChild.js
 * @Description        : 
 * @Author             : Sasank Subrahmanyam V
 * @Group              : 
 * @Last Modified By   : Sasank Subrahmanyam V
 * @Last Modified On   : 2/19/2020, 10:35:38 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    12/11/2019   Sasank Subrahmanyam V     Initial Version
**/
import { LightningElement, api, track } from 'lwc';

export default class ApiTrackPropertiesChild extends LightningElement {
    @api publicString = 'default string';
    @api publicObject = { name: 'default' };
    @api publicArray = [{ name: 'default' }];
    @api publicBooleanProp = false;

    @track trackedArray = [{ name: 'track 1' }, { name: 'track 2' }];

    modifyPublicBoolean() {
        console.log('publicBooleanProp => ', this.publicBooleanProp);
        this.publicBooleanProp = !this.publicBooleanProp;
        console.log('publicBooleanProp => ', this.publicBooleanProp);
    }
    modifyPublicString() {
        console.log('publicString => ', this.publicString);
        this.publicString = 'modified string';
        console.log('publicString => ', this.publicString);
    }
    logApiObject() {
        console.log('publicObject => ', JSON.stringify(this.publicObject));
    }
    addPropInObject() {
        console.log('publicObject => ', this.publicObject);
        this.publicObject.newProp = 'new prop value';
        console.log('publicObject => ', this.publicObject);
    }
    modifyPublicObject() {
        console.log('publicObject => ', this.publicObject);
        this.publicObject = { name: 'modified' };
        console.log('publicObject => ', this.publicObject);
    }
    addPropInArray() {
        console.log('publicArray => ', this.publicArray);
        this.publicArray.forEach(item => {
            item.newProp = 'new prop value';
        });
        console.log('publicArray => ', this.publicArray);
    }
    modifyPublicArray() {
        console.log('publicArray => ', this.publicArray);
        this.publicArray = [{ name: 'modified' }];
        console.log('publicArray => ', this.publicArray);
    }

}