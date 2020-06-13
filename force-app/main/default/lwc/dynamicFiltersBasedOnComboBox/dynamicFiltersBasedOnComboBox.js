/**
 * @File Name          : dynamicFiltersBasedOnComboBox.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/25/2020, 10:21:11 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/25/2020   Somnath Sharma     Initial Version
 **/

import {
    LightningElement,
    api,
    wire,
    track
} from 'lwc';
import {
    getObjectInfo
} from 'lightning/uiObjectInfoApi';
import {
    getPicklistValues
} from 'lightning/uiObjectInfoApi';
//import method from the Apex Class
import getDataBasedOnSobject from '@salesforce/apex/DynamicFilterController.getDataBasedOnSobject';

export default class DynamicFiltersBasedOnComboBox extends LightningElement {

    value = '';
    @track options = [];
    /**Data To be passed to Combox Box */
    @api rowsdata = [];
    /** name of combobox*/
    @api comboBoxLabel = '';
    /** Alignment of drop down top or bottom*/
    @api dropdownAlignmentTop = false;
    /** palceholdervalue for combo Box*/
    @api placeholderValue = 'Select an Option';
    /** dropdown value derieved to align the drop down contents*/
    dropdownAlignmentValue;
    /** config params to query data from Server*/
    @api lwcConfig = {
        getDataFromServer: false,
        sObjectApiName: '',
        whereClause: '',
        orderByClause: '',
        limitClause: 0
    };


    /**************UI Wire Services Chained So as to get the picklist Values  */
    @api objectapiname;
    @api picklistfield;
    defaultRecordTypeId; //Master  Record Type Id

    @wire(getObjectInfo, {
        objectApiName: '$objectapiname'
    })
    wiredObjectInfo({
        error,
        data
    }) {
        if (data) {
            console.log('ObjectInfo' + JSON.stringify(data));
            this.record = data.recordTypeInfos;
            this.defaultRecordTypeId = data.defaultRecordTypeId;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: '$defaultRecordTypeId',
        fieldApiName: '$picklistfield'
    })
    wiredPicklistInfo({
        error,
        data
    }) {
        if (data) {
            console.log('picklist' + JSON.stringify(data.values));
            this.processPicklistRawJSON(data.values);
        } else if (error) {
            console.log(JSON.stringify(error));
        }
    }


    /**************UI Wire Services Chained So as to get the picklist Values  */

    connectedCallback() {

        this.dropdownAlignmentValue = this.dropdownAlignmentTop ? 'bottom-left' : 'auto';

        if (this.lwcConfig.getDataFromServer) {
            window.console.log(this.comboBoxLabel);
            window.console.time("Std server lwc processing");
            this.processConfig();
            window.console.timeEnd("Std server lwc processing");
        } else if (this.rowsdata.length > 0) {
            window.console.log('DATA-INJECTION-FROM-CALLING-COMPONENT---->>>>>' + this.rowsdata.length);
            this.setOptions(this.rowsdata);
        }

    }

    /**query data from server if data is not passed from calling component */
    processConfig() {
        //if lwcConfig.getDataFromServer is set 
        this.queryRows();

    }

    queryRows() {
        //imperative callback to get data from server on demand
        getDataBasedOnSobject({
                sobjectName: this.lwcConfig.sObjectApiName,
                whereClause: this.lwcConfig.whereClause,
                orderByClause: this.lwcConfig.orderByClause,
                limitClause: this.lwcConfig.limitClause
            })
            .then(result => {
                //window.console.log('LwcDataFromCallingCmpServer---->>>>>' + JSON.stringify(result));
                this.setOptions(result);
            })
            .catch(error => {
                this.error = error;
            });
    }

    setOptions(_rawData) {
        //  window.console.log('OptionsDataFromCallingCmp---->>>>>' + JSON.stringify(_rawData));
        let isQueryRows = false;
        if (this.lwcConfig.getDataFromServer) {
            isQueryRows = true;
        }
        this.options = _rawData.map(row => {
            return {
                label: isQueryRows ? row.Name : row,
                value: isQueryRows ? row.Id : row
            };
        });
        window.console.log('->>>>>>length of array-->>>>>>>' + this.options.length);

    }


    //render the component after all the processing is done
    get renderComboBox() {
        return this.options.length > 0 ? true : false;
    }

    /*fire event on change of drop down value and pass is to called component 
    where the event can be handled to capture the selected value*/
    handleChange(event) {

        let selectedOption = this.options.find(item => item.value === event.detail.value);
        window.console.log('dropdownlabel', selectedOption.label);
        window.console.log('dropdownValue', event.detail.value);
        let filters = {
            selectedvalue: event.detail.value,
            selectedLableValue: selectedOption.label,
            dropDownClicked: this.comboBoxLabel
        };
        const filterChangeEvent = new CustomEvent('filterchange', {
            detail: {
                filters
            },
        });
        // Fire the custom event
        this.dispatchEvent(filterChangeEvent);
    }

    processPicklistRawJSON(_rawData) {
        this.options = _rawData.map(row => {
            return {
                label: row.label,
                value: row.value
            };
        });
        console.log('picklistprocessed' + JSON.stringify(this.options));
    }

}