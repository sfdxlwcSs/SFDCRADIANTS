/**
 * @File Name          : method.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 9:35:15 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/20/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Method extends LightningElement {
    invokeChildMethod = () => {
        this.template.querySelector('c-method-child').publicMethod('a', 'b');
        this.template.querySelector('c-method-child').publicMethod2('c', 'd');

    }
}