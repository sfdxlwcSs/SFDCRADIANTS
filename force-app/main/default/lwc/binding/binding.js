/**
 * @File Name          : binding.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/18/2020, 9:39:48 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/17/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Binding extends LightningElement {
    name = 'Somnath Sharma';
    constructor() {
        super();
        this.constr = 'contructor';
    }
    connectedCallback() {
        this.connected = 'connectedCallBack';
    }

    firstName = 'Dave';
    lastName = 'Johnson';
    get uppercasedFullName() {
        window.console.time("timeloggedbygetter");
        window.console.log('Getter called');
        // ... and stop.
        window.console.timeEnd("timeloggedbygetter");
        return `${this.firstName} ${this.lastName}`.toUpperCase();

    }
}