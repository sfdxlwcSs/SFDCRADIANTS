/**
 * @File Name          : utilsConsumer.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 11:52:29 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/20/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';
import {
    myfunc
} from 'c/utils';

export default class UtilsConsumer extends LightningElement {
    invokeUtilsMethod() {
        let someValue = myfunc('utils called->');
        window.console.log(someValue);
    }
}