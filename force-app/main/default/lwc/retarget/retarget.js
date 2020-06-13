/**
 * @File Name          : retarget.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/25/2020, 9:51:38 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/25/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Retarget extends LightningElement {
    handleEvent(event) {
        window.console.log('node name->' + event.target.nodeName);
        window.console.log('api property->>' + event.target.compName);
    }
}