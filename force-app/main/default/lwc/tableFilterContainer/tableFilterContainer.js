/**
 * @File Name          : tableFilterContainer.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 20/2/2020, 11:00:22 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    26/1/2020   Somnath Sharma     Initial Version
**/
import { LightningElement } from 'lwc';

export default class TableFilterContainer extends LightningElement {

lwcConfig={};    
connectedCallback(){
    this.lwcConfig={
        getDataFromServer: true,
        sObjectApiName: 'Account',
        whereClause: 'Type =\'Prospect\'',
        orderByClause: 'ORDER BY LastModifiedDate ASC',
        limitClause: 0,
        pickListFieldAPI:'Type'
    };
    // this.lwcConfig={
    //     getDataFromServer: true,
    //     sObjectApiName: 'Account',
    //     whereClause: 'Type =\'Prospect\'',
    //     orderByClause: 'ORDER BY LastModifiedDate ASC',
    //     limitClause: 0,
    //     pickListFieldAPI:''
    // };
}

}