/**
 * @File Name          : DemoFilters.js
 * @Description        : Dynamic Filters based on Combo Box
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 26/1/2020, 11:13:21 pm
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
import getDataBasedOnSobject from '@salesforce/apex/TableFiltersController.getDataBasedOnSobject';
import getPickListValueBasedOnSobject from '@salesforce/apex/TableFiltersController.getPickListValueBasedOnSobject';
export default class DemoFilters extends LightningElement {

    options = [{
        label: '--None--',
        value: '--None--'
    }];
    /**Data To be passed to Combox Box */
    @api rowsData;
    /** */
    @api comboBoxLabel = '';
    /** Alignment of drop down top or bottom*/
    @api dropdownAlignmentTop = false;
    /** palceholdervalue for combo Box*/
    @api placeholderValue = 'Select an Option';
    /** deropdown value derieved to align the drop down contents*/
    dropdownAlignmentValue;
    /** */
    @api lwcConfig = {
        getDataFromServer: false,
        sObjectApiName: '',
        whereClause: '',
        orderByClause: '',
        limitClause: 0,
        pickListFieldAPI:''//pass field API if values are to come from picklist field and set getDataFromServer=false
    };
    @track areDetailsVisible=false;
    connectedCallback() {
        this.dropdownAlignmentValue = this.dropdownAlignmentTop ? 'bottom-left' : 'auto';
        if (!this.lwcConfig.getDataFromServer) {
            
            window.console.log('LwcDataFromCallingAuraCmpRowsSize---->>>>>' + this.rowsData.length);
            this.setOptions(this.rowsData);
        } else {
            this.getDataFromServer();
        }
    }

  
    /**query data from server if data is not passed from calling component */
    getDataFromServer() {
        //if lwcConfig is set but data is to come from picklist field
      if(this.lwcConfig.pickListFieldAPI){
        this.getPickListValues();  
      }
      else{
        this.queryRows(); 
      }    
    }

    queryRows(){

        getDataBasedOnSobject({
            sobjectName: this.lwcConfig.sObjectApiName,
            whereClause: this.lwcConfig.whereClause,
            orderByClause: this.lwcConfig.orderByClause,
            limitClause: this.lwcConfig.limitClause
        })
        .then(result => {
          //  window.console.log('LwcDataFromCallingCmp---->>>>>' + JSON.stringify(result));
            this.setOptions(result); 
        })
        .catch(error => {
            this.error = error;
        });
    }
/**get picklist values for any given field */
   getPickListValues(){

    getPickListValueBasedOnSobject({
        sobjectAPI: this.lwcConfig.sObjectApiName,
        pickListFieldAPI: this.lwcConfig.pickListFieldAPI
    })
    .then(result => {
        window.console.log('LwcPicklistDataFromCallingCmp---->>>>>' + JSON.stringify(result));
       this.setOptions(result); 
    })
    .catch(error => {
        this.error = error;
    });  
   }

   setOptions(_dataArray){
    window.console.log('OptionsDataFromCallingCmp---->>>>>' + JSON.stringify(_dataArray));
    let isQueryRows=true;
    if(this.lwcConfig.pickListFieldAPI || this.rowsData){
        isQueryRows=false;
    }
    _dataArray.forEach(row => {
        this.options.push({
            label: isQueryRows?row.Name.toUpperCase():row.toUpperCase(),
            value: isQueryRows?row.Id:row,
        });
    });
    this.areDetailsVisible=true;
   }
   
    /*fire event on change of drop down value and pass is to called component*/
    handleChange(event) {
      
        let  selectedLableValue=this.options.find(item =>item.value===event.detail.value);
        window.console.log('dropdownValue', event.detail.value);
        window.console.log('dropdownlabel', selectedLableValue.label);
        let filters = {
            selectedvalue: event.detail.value,
            selectedLableValue:selectedLableValue.label,
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