/**
 * @File Name          : reflectPropertiesChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/19/2020, 11:58:37 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/19/2020   Somnath Sharma     Initial Version
**/
import {
    LightningElement,
    api
} from 'lwc';

export default class ReflectPropertiesChild extends LightningElement {
    @api mySomeProp;
    @api
    get myChildProp() {
        return this._myChildProp;
    }

    set myChildProp(value) {
        this._myChildProp = value;
        this.setAttribute('my-child-prop', value);
    }
}