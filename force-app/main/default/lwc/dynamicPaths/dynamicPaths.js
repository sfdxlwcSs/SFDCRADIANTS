/**
 * @File Name          : DYNAMICPATH.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 10/23/2019, 4:46:41 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    10/15/2019   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track,
    wire,
    api
  } from 'lwc';
  import {
    getObjectInfo
  } from 'lightning/uiObjectInfoApi';
  
  import {
    getPicklistValues
  } from 'lightning/uiObjectInfoApi';
  import objectApiName from '@salesforce/schema/Account';
  import PICKLIST_FIELD from '@salesforce/schema/Account.Stages__c';
  export default class CjmVisualComponent extends LightningElement {
    recType;
    @api recordId;
   
    @wire(getObjectInfo, {
      objectApiName: objectApiName
    })
    getObjectInfo({
      data,
      error
    }) {
      if (data) {
        this.processData(data);
      } else if (error) {
        this.error = error;
      }
    }
    //get recordtype to pass so as to get picklist values based on recordtype Info
    processData(objectInfoData) {
      // const recId = this.recordId;
      const rtis = objectInfoData.recordTypeInfos;
      this.recType = Object.keys(rtis).find(rti => rtis[rti].name === 'Test Invoice');
  
    }
  
    @track objectPicklist = {
      Stages: []
    }; //master object for all operations
  
  
    @wire(getPicklistValues, {
      recordTypeId: '$recType',//provision request only when recordTypeId is availble --reactive Properties
      fieldApiName: PICKLIST_FIELD
    })
    getPicklistInfo({
      data,
      error
    }) {
      if (data) {
        this.processPickListLabels(data.values);
      } else if (error) {
        this.error = error;
      }
    }
    //controlling field values
    processPickListLabels(picklistArray) {
      picklistArray.forEach(item => {
        this.objectPicklist.Stages.push(item.label);
        window.console.log('this.objectPicklist.Stages', JSON.stringify(this.objectPicklist.Stages));
      });
    }
    //if picklist values came then render DOM
    get pickListArrayIsPopulated() {
  
      let hasData = false;
      if ( this.objectPicklist.Stages.length > 0) {
        hasData = true;
      }
      return hasData;
  
    }
    
  }