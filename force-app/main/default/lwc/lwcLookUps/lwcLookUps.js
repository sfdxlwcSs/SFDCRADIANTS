/**
 * @File Name          : lwcLookUps.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 26/1/2020, 6:38:39 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    26/1/2020   Somnath Sharma     Initial Version
**/
import { 
     LightningElement,
    api
 } from 'lwc';

export default class LwcLookUps extends LightningElement {
//object API name,lookupValueDefault and lookup field name send from calling component.
    @api lookupValueDefault='0012v00002OskZGAAZ';
    @api objectpiname="Contact";
    @api lookupfieldname="AccountId";
    handleChange(event) {
        /*once you have this value it can be passed to apex as one of the method params ,
        lets say for a use case where a search query is involved and we have to search 
        all contacts related to a partcular account.*/
        window.console.log("You selected an account: " + event.detail.value[0]);
    }
    handleLoad(event) {
       //details coming on the load of form
        const recUi = event.detail;
        //  window.console.log("OnLoadData-", JSON.stringify(recUi));
    }

}