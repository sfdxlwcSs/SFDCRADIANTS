/**
 * @File Name          : lifeCycleHookErrorCallBackGrandChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/18/2020, 11:53:43 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/18/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class LifeCycleHookErrorCallBackGrandChild extends LightningElement {
    connectedCallback() {
        throw new Error('Error from Grand Child Connected Call Back');
    }
}