/**
 * @File Name          : reflectProperties.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/19/2020, 12:04:43 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/19/2020   Somnath Sharma     Initial Version
**/
import {
    LightningElement,
    track
} from 'lwc';

export default class ReflectProperties extends LightningElement {
    @track myParentProp = 'sample string';
}