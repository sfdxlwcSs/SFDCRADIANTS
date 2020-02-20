/**
 * @File Name          : methodChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 9:35:19 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/20/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api
} from 'lwc';

export default class MethodChild extends LightningElement {
    @api
    publicMethod(...param) {
        window.console.log('child params =>', param);
        return 'child public method';
    }
    @api
    publicMethod2(param1, param2) {
        window.console.log('child params =>', param1);
        window.console.log('child params =>', param2);
    }
}