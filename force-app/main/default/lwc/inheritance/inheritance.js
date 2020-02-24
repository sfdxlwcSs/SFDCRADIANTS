/**
 * @File Name          : inheritance.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 10:42:35 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';
import LightningDatatable from 'lightning/datatable';
import pocFileUpload from './fileUpload.html';
export default class Inheritance extends LightningDatatable {
    static customTypes = {
        fileUpload: {
            template: pocFileUpload,
            typeAttributes: ['acceptedFormats'],
        }
    };
}