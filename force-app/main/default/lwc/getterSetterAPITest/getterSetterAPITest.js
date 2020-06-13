/**
 * @File Name          : getterSetterAPITest.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 4/13/2020, 1:38:52 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/13/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api,
    track
} from 'lwc';

export default class GetterSetterAPITest extends LightningElement {
    @track bindGetterData = '';

    @api
    get FromAura() {
        return this.bindGetterData;
    }
    set FromAura(value) {
        console.log('called setter');
        this.bindGetterData = value;
    }

}