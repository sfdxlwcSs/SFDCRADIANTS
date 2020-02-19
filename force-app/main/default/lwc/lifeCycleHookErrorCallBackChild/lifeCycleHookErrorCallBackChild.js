/**
 * @File Name          : lifeCycleHookErrorCallBackChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/18/2020, 11:59:52 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/18/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class LifeCycleHookErrorCallBackChild extends LightningElement {
    connectedCallback() {
        throw new Error('Error from Child Connected Call Back');
    }

    throwError() {
        throw new Error('Error from Child method throw Error');
    }

}