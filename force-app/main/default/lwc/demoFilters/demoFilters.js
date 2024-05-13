/**
 * @File Name          : tableHeadFilter.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 13-03-2023
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/20/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api,
    track
} from 'lwc';
//import method from the Apex Class
import getDataBasedOnSobject from '@salesforce/apex/DynamicFilterController.getDataBasedOnSobject';
import getPickListValueBasedOnSobject from '@salesforce/apex/DynamicFilterController.getPickListValueBasedOnSobject';

export default class TableHeadFilter extends LightningElement {
    value = '';
    @track options = [];
    /**Data To be passed to Combox Box */
    @api rowsData;
    /** name of combobox*/
    @api comboBoxLabel = '';
    /** Alignment of drop down top or bottom*/
    @api dropdownAlignmentTop = false;
    /** palceholdervalue for combo Box*/
    @api placeholderValue = 'Select an Option';
    /** dropdown value derieved to align the drop down contents*/
    dropdownAlignmentValue;
    /** config params for soql or picklist values*/
    @api lwcConfig = {
        getDataFromServer: false,
        sObjectApiName: '',
        whereClause: '',
        orderByClause: '',
        limitClause: 0,
        pickListFieldAPI: '' //pass field API if values are to come from picklist field and set getDataFromServer=false
    };
    connectedCallback() {

        this.dropdownAlignmentValue = this.dropdownAlignmentTop ? 'bottom-left' : 'auto';

        if (this.lwcConfig.getDataFromServer) {
            console.log(this.comboBoxLabel);
            console.time("Std server lwc processing");
            this.processConfig();
            window.console.timeEnd("Std server lwc processing");
        } else if (this.rowsData.length > 0) {
            console.log('DATA-INJECTION-FROM-CALLING-COMPONENT---->>>>>' + this.rowsData.length);
            this.setOptions(this.rowsData);
        }

    }

    /**query data from server if data is not passed from calling component */
    processConfig() {
        //if lwcConfig.getDataFromServer is set but data is to come from picklist field
        if (this.lwcConfig.pickListFieldAPI) {
            this.getPickListValues();
        } else {
            this.queryRows();
        }
    }

    queryRows() {

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
    /**get picklist values for any given field */
    getPickListValues() {

        getPickListValueBasedOnSobject({
            sobjectAPI: this.lwcConfig.sObjectApiName,
            pickListFieldAPI: this.lwcConfig.pickListFieldAPI
        })
            .then(result => {
                console.log('get picklist values---->>>>>');
                //  window.console.log('LwcPicklistDataFromCallingCmp---->>>>>' + JSON.stringify(result));
                this.setOptions(result);
            })
            .catch(error => {
                this.error = error;
            });
    }

    setOptions(_dataArray) {
        //  window.console.log('OptionsDataFromCallingCmp---->>>>>' + JSON.stringify(_dataArray));
        let isQueryRows = true;
        if (this.lwcConfig.pickListFieldAPI || !this.lwcConfig.getDataFromServer) {
            isQueryRows = false;
        }
        _dataArray.forEach(row => {
            this.options.push({
                label: isQueryRows ? row.Name : row,
                value: isQueryRows ? row.Id : row,
            });
        });
        //window.console.log('->>>>>>length of array-->>>>>>>' + this.options.length);

    }
    //render the component after all the processing is done
    get renderComboBox() {
        return this.options.length > 0 ? true : false;
    }

    /*fire event on change of drop down value and pass is to called component*/
    handleChange(event) {

        let selectedOption = this.options.find(item => item.value === event.detail.value);
        console.log('dropdownlabel', selectedOption.label);
        console.log('dropdownValue', event.detail.value);
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

}