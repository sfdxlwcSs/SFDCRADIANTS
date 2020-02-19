/**
 * @File Name          : lifeCycleHooksChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/18/2020, 11:01:45 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/18/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class LifeCycleHooksChild extends LightningElement {
    disconnectedCallback() {
        window.console.log('disconnected child ');
    }
    constructor() {
        super();
        window.console.log('constructor child');
        this.dummyTestVar = 'Data';
    }

    connectedCallback() {
        window.console.log('connected child');
    }


}