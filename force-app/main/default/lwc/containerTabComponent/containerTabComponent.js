/**
 * @File Name          : containerTabComponent.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 3/6/2020, 2:11:19 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/25/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';

export default class ContainerTabComponent extends LightningElement {
    level;
    leadSource;

    pageHeader = 'Container LWC Tab Component';
    _dataInjection = ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'];
    connectedCallback() {
        this.lwcConfig = {
            getDataFromServer: true,
            sObjectApiName: 'Account',
            whereClause: 'Type =\'Prospect\'',
            orderByClause: 'ORDER BY LastModifiedDate ASC',
            limitClause: 0
        };
    }

    get renderOptionalField() {
        return this.level === 'Primary' && this.leadSource === 'Web' ? true : false;
    }

    handleLevelEvent(event) {
        this.level = event.target.value;
    }
    handleSourceEvent(event) {
        this.leadSource = event.target.value;
    }

}