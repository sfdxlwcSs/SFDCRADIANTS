/**
 * @File Name          : DYNAMICPATH.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 1/3/2020, 12:31:31 pm
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
  import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
  import objectApiName from '@salesforce/schema/Account';
  import PICKLIST_FIELD from '@salesforce/schema/Account.Stages__c';

  const fields = [PICKLIST_FIELD];
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
      console.log(JSON.stringify(objectInfoData));
      const rtis = objectInfoData.recordTypeInfos;
      this.recType = Object.keys(rtis).find(rti => rtis[rti].name === 'Test Invoice');
  
    }
  /* master object for all operations */
    @track objectPicklist = []; 
  
  
    @wire(getPicklistValues, {
      recordTypeId: '$recType',//provision request only when recordTypeId is availble --reactive Properties
      fieldApiName: PICKLIST_FIELD
    })
    getPicklistInfo({
      data,
      error
    }) {
      if (data) {
        console.log('picklist',JSON.stringify(data));
        this.processPickListLabels(data.values);
      } else if (error) {
        this.error = error;
      }
    }
    //controlling field valuesitem.label
    processPickListLabels(picklistArray) {

      this.objectPicklist = picklistArray.map(row => {
        return {
            StageName: row.label,
            Active: false,
            stageBackGround:'slds-tabs--path__item pathBackground' 
        };
    });
        window.console.log('this.objectPicklist.Stages', JSON.stringify(this.objectPicklist));   
    }
   
    // }
//get the active stage value using the below wire adapters

    @wire(getRecord, { recordId: '$recordId', fields })
    account;

    get activeStage() {
        let activeStage=getFieldValue(this.account.data, PICKLIST_FIELD);
        if(this.objectPicklist){
           this.objectPicklist.forEach(element =>{
               if(element.Stages===activeStage){
                   element.activeStage=true;
                   element.stageBackGround='slds-tabs--path__item activebackground';
               }
           });   
        }
        console.log('update'+JSON.stringify(this.objectPicklist));
        return activeStage;
    }
    
  }